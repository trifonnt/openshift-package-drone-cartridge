<%@ tag language="java" pageEncoding="UTF-8"%>

<%@ attribute name="job" required="true" type="de.dentrassi.osgi.job.JobHandle" %>
<%@ attribute name="oncomplete" type="java.lang.String" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="job-monitor" id="job-${job.id }"></div>

<script type="text/javascript">

function reload () {
	$('#job-${job.id}').load ("<c:url value="/job/${job.id}/monitor"/>");
}

reload ();

</script>

<c:if test="${not empty oncomplete }">
<script>
$('#job-${job.id}').on("job.complete", function(event) {  ${oncomplete} });
</script>
</c:if>
<c:if test="${empty oncomplete }">
<script>
$('#job-${job.id}').on("job.complete", function(event) { document.location.href='<c:url value="/job/${job.id}/result"/>' });
</script>
</c:if>