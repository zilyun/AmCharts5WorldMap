<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세계지도</title>
<script src="${pageContext.request.contextPath}/js/jquery-3.7.1.js"></script>
<script src="//cdn.amcharts.com/lib/5/index.js"></script>
<script src="//cdn.amcharts.com/lib/5/map.js"></script>
<script src="//cdn.amcharts.com/lib/5/geodata/worldChinaLow.js"></script>
<script src="//cdn.amcharts.com/lib/5/themes/Animated.js"></script>
<style>
body {
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
}

#chartdiv {
  width: 100%;
  height: 95vh;
}
</style>
<script>
$(document).ready(function() {
/**
 * ---------------------------------------
 * This demo was created using amCharts 5.
 *
 * For more information visit:
 * https://www.amcharts.com/
 *
 * Documentation is available at:
 * https://www.amcharts.com/docs/v5/
 * ---------------------------------------
 */

	// Create root and chart
	var root = am5.Root.new("chartdiv"); 
	
	// Set themes
	root.setThemes([
	  am5themes_Animated.new(root)
	]);
	
	var chart = root.container.children.push(
	  am5map.MapChart.new(root, {
	    panX: "rotateX",
	    projection: am5map.geoNaturalEarth1()
	  })
	);
	
	// Create polygon series
	var polygonSeries = chart.series.push(
	  am5map.MapPolygonSeries.new(root, {
	    geoJSON: am5geodata_worldChinaLow,
	    exclude: ["AQ"]
	  })
	);
	
	polygonSeries.mapPolygons.template.setAll({
	  tooltipText: "{name}",
	  interactive: true
	});
	
	polygonSeries.mapPolygons.template.states.create("hover", {
	  fill: am5.color(0x677935)
	});
});
</script>
</head>
<body>
	<div id="chartdiv"></div>
</body>
</html>