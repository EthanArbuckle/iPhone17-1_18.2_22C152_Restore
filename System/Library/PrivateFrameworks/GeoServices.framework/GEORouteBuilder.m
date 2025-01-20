@interface GEORouteBuilder
+ (BOOL)_isGuidanceEventAtEndOfLeg:(int)a3;
+ (BOOL)_shouldPreserveRouteSourceForPurpose:(int)a3;
+ (id)_cellularCoverageForGeoWaypointRoute:(id)a3 coordinates:(id)a4;
+ (id)_composedRouteLegForStartStep:(id)a3 endStep:(id)a4 startSegment:(id)a5 endSegment:(id)a6 custodian:(id)a7 geoRouteLeg:(id)a8 legIndex:(unint64_t)a9 origin:(id)a10 destination:(id)a11 arrivalParameters:(id)a12 legLength:(double)a13;
+ (id)_composedRouteSegmentForStartStep:(id)a3 andEndStep:(id)a4 segmentIndex:(unint64_t)a5 andCustodian:(id)a6;
+ (id)_composedRouteStepWithTransportType:(int)a3 andCustodian:(id)a4 geoRouteLeg:(id)a5 forGeoStep:(id)a6 withStepIndex:(unint64_t)a7 startRouteCoordinate:(PolylineCoordinate)a8 endRouteCoordinate:(PolylineCoordinate)a9 maneuverStartRouteCoordinate:(PolylineCoordinate)a10;
+ (id)_composedRouteStepWithTransportType:(int)a3 andCustodian:(id)a4 geoRouteLeg:(id)a5 forGeoStep:(id)a6 withStepIndex:(unint64_t)a7 stepStartPointIndex:(unint64_t)a8 legStartPointIndex:(unint64_t)a9;
+ (id)_coordinatesForGeoWaypointRoute:(id)a3;
+ (id)_guidanceEventsForGeoWaypointRoute:(id)a3 legs:(id)a4 steps:(id)a5 coordinates:(id)a6;
+ (id)_segmentForStepIndex:(unint64_t)a3 withSegments:(id)a4;
+ (id)_unpackedPointsDataForGeoRoute:(id)a3;
+ (id)_visualInfosForGuidanceEvents:(id)a3 steps:(id)a4 coordinates:(id)a5;
+ (id)buildMapRegionFromPointSections:(id)a3;
+ (id)buildPointSectionsWithSteps:(id)a3 segments:(id)a4 coordinates:(id)a5;
+ (id)outputForGeoWaypointRoute:(id)a3 initializerData:(id)a4 custodian:(id)a5;
+ (id)segmentForPointIndex:(unint64_t)a3 withSegments:(id)a4 andSteps:(id)a5;
+ (unint64_t)segmentIndexForPointIndex:(unint64_t)a3 withSegments:(id)a4;
+ (unint64_t)stepIndexForPointIndex:(unint64_t)a3 withSteps:(id)a4;
+ (void)_componentsForGeoWaypointRoute:(id)a3 initializerData:(id)a4 coordinates:(id)a5 custodian:(id)a6 outLegs:(id *)a7 outSegments:(id *)a8 outSteps:(id *)a9;
@end

@implementation GEORouteBuilder

+ (id)outputForGeoWaypointRoute:(id)a3 initializerData:(id)a4 custodian:(id)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = v9;
  if (!v7)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_32;
    }
    *(_WORD *)buf = 0;
    v42 = MEMORY[0x1E4F14500];
    v43 = "Assertion failed: geoWaypointRoute != nullptr";
LABEL_34:
    _os_log_fault_impl(&dword_188D96000, v42, OS_LOG_TYPE_FAULT, v43, buf, 2u);
    goto LABEL_32;
  }
  if (!v8)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_32;
    }
    *(_WORD *)buf = 0;
    v42 = MEMORY[0x1E4F14500];
    v43 = "Assertion failed: initializerData != nullptr";
    goto LABEL_34;
  }
  if (v9)
  {
    id v45 = v9;
    v11 = objc_alloc_init(GEORouteBuilderOutput);
    v12 = GEOGetGEORouteBuilderLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = [v7 transportType];
      if (v13 >= 7)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v13);
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = off_1E53E73C8[(int)v13];
      }
      *(_DWORD *)buf = 138412290;
      v50 = v14;
      _os_log_impl(&dword_188D96000, v12, OS_LOG_TYPE_INFO, "Generating output for GEOWaypointRoute (%@)", buf, 0xCu);
    }
    v15 = +[GEORouteBuilder _coordinatesForGeoWaypointRoute:v7];
    if (![v15 coordinateCount])
    {
      v18 = GEOGetGEORouteBuilderLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_188D96000, v18, OS_LOG_TYPE_ERROR, "Coordinate array has 0 coordinates. Routes with no geometry aren't supported yet.", buf, 2u);
      }
      v40 = 0;
      goto LABEL_23;
    }
    [(GEORouteBuilderOutput *)v11 setCoordinatesArray:v15];
    v16 = [v8 directionsResponse];
    v17 = [v16 responseAttributes];
    -[GEORouteBuilderOutput setElevationModel:](v11, "setElevationModel:", [v17 elevationModel]);

    id v47 = 0;
    id v48 = 0;
    id v46 = 0;
    +[GEORouteBuilder _componentsForGeoWaypointRoute:v7 initializerData:v8 coordinates:v15 custodian:v45 outLegs:&v48 outSegments:&v47 outSteps:&v46];
    v18 = v48;
    id v44 = v47;
    id v19 = v46;
    [(GEORouteBuilderOutput *)v11 setLegs:v18];
    [(GEORouteBuilderOutput *)v11 setSegments:v44];
    [(GEORouteBuilderOutput *)v11 setSteps:v19];
    v20 = [(GEORouteBuilderOutput *)v11 steps];
    v21 = [(GEORouteBuilderOutput *)v11 segments];
    v22 = +[GEORouteBuilder buildPointSectionsWithSteps:v20 segments:v21 coordinates:v15];
    [(GEORouteBuilderOutput *)v11 setPointSections:v22];

    v23 = [(GEORouteBuilderOutput *)v11 pointSections];
    v24 = +[GEORouteBuilder buildMapRegionFromPointSections:v23];
    [(GEORouteBuilderOutput *)v11 setBoundingMapRegion:v24];

    -[GEORouteBuilderOutput setDistance:](v11, "setDistance:", (double)[v7 distanceMeters]);
    v25 = +[GEORouteBuilder _guidanceEventsForGeoWaypointRoute:v7 legs:v18 steps:v19 coordinates:v15];
    [(GEORouteBuilderOutput *)v11 setGuidanceEvents:v25];

    v26 = +[GEORouteBuilder _cellularCoverageForGeoWaypointRoute:v7 coordinates:v15];
    [(GEORouteBuilderOutput *)v11 setCellularCoverage:v26];

    v27 = [MEMORY[0x1E4F1CA48] array];
    v28 = [(GEORouteBuilderOutput *)v11 guidanceEvents];
    v29 = +[GEORouteBuilder _visualInfosForGuidanceEvents:v28 steps:v19 coordinates:v15];
    [v27 addObjectsFromArray:v29];

    v30 = +[GEOComposedRouteVisualInfo visualInfosForGeoWaypointRoute:v7 coordinates:v15 updateable:0];
    [v27 addObjectsFromArray:v30];

    if ([v27 count]) {
      v31 = v27;
    }
    else {
      v31 = 0;
    }
    [(GEORouteBuilderOutput *)v11 setVisualInfos:v31];
    v32 = +[GEOComposedRouteVisualInfo visualInfosForRouteLabelsForGeoWaypointRoute:v7 coordinates:v15];
    [(GEORouteBuilderOutput *)v11 setVisualInfosForRouteNameLabels:v32];

    v33 = +[GEOComposedRouteVisualInfo cameraInfosForGeoWaypointRoute:v7 coordinates:v15 updateable:0];
    [(GEORouteBuilderOutput *)v11 setCameraInfos:v33];

    v34 = [v7 routeLegs];
    v35 = [v34 firstObject];
    v36 = [v35 elevationProfile];
    [(GEORouteBuilderOutput *)v11 setElevationProfile:v36];

    [(GEORouteBuilderOutput *)v11 setSource:1];
    v37 = [v8 directionsRequest];
    v38 = [v37 originalWaypointRoute];

    if (+[GEORouteBuilder _shouldPreserveRouteSourceForPurpose:](GEORouteBuilder, "_shouldPreserveRouteSourceForPurpose:", [v38 purpose]))
    {
      if ([v38 creationMethod] == 1)
      {
        uint64_t v39 = 3;
LABEL_21:
        [(GEORouteBuilderOutput *)v11 setSource:v39];
        goto LABEL_22;
      }
      if ([v38 creationMethod] == 2)
      {
        uint64_t v39 = 2;
        goto LABEL_21;
      }
    }
LABEL_22:
    v40 = v11;

LABEL_23:
    v10 = v45;
    goto LABEL_24;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    v42 = MEMORY[0x1E4F14500];
    v43 = "Assertion failed: custodian != nullptr";
    goto LABEL_34;
  }
LABEL_32:
  v40 = 0;
LABEL_24:

  return v40;
}

+ (BOOL)_shouldPreserveRouteSourceForPurpose:(int)a3
{
  return (a3 < 0xE) & (0x3602u >> a3);
}

+ (id)_coordinatesForGeoWaypointRoute:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v50 = v3;
    v5 = [v3 routeLegs];
    v6 = [v5 firstObject];
    id v7 = [v6 pathLeg];
    if (v7)
    {
      int BOOL = GEOConfigGetBOOL(GeoServicesConfig_RequestRoutingPathPoints, (uint64_t)off_1E9114308);

      if (BOOL)
      {
        id v9 = (void *)MEMORY[0x1E4F1CA48];
        v10 = [v4 routeLegs];
        v49 = objc_msgSend(v9, "arrayWithCapacity:", objc_msgSend(v10, "count"));

        unint64_t v11 = 0;
        v12 = 0;
        while (1)
        {
          uint64_t v13 = [v4 routeLegs];
          unint64_t v14 = [v13 count];

          if (v11 >= v14) {
            break;
          }
          v15 = [v4 routeLegs];
          v16 = [v15 objectAtIndexedSubscript:v11];

          v17 = [v16 pathLeg];
          [v49 addObject:v17];

          v18 = [v16 pathMapMatcherInstructions];

          if (v18)
          {
            if (!v12)
            {
              v12 = [MEMORY[0x1E4F1CA60] dictionary];
            }
            id v19 = [v16 pathMapMatcherInstructions];
            v20 = [NSNumber numberWithUnsignedInteger:v11];
            [v12 setObject:v19 forKeyedSubscript:v20];
          }
          ++v11;
        }
        id v44 = [GEOComposedRouteCoordinateArray alloc];
        id v45 = [v4 rawRouteGeometry];
        v40 = [(GEOComposedRouteCoordinateArray *)v44 initWithRawRouteGeometry:v45];

        v41 = GEOGetGEORouteBuilderLog();
        if (!os_log_type_enabled(v41, OS_LOG_TYPE_INFO)) {
          goto LABEL_30;
        }
        *(_DWORD *)buf = 67174657;
        int v58 = [(GEOComposedRouteCoordinateArray *)v40 coordinateCount];
        v43 = "Generated coordinates using routing path points. Count: %{private}d";
LABEL_29:
        _os_log_impl(&dword_188D96000, v41, OS_LOG_TYPE_INFO, v43, buf, 8u);
LABEL_30:

        v4 = v50;
        goto LABEL_31;
      }
    }
    else
    {
    }
    v21 = (void *)MEMORY[0x1E4F1CA48];
    v22 = [v4 routeLegs];
    v49 = objc_msgSend(v21, "arrayWithCapacity:", objc_msgSend(v22, "count"));

    v12 = [MEMORY[0x1E4F1CA48] array];
    v23 = v50;
    v24 = [v50 routeLegs];
    v25 = [v24 firstObject];
    v26 = [v25 zilchPoints];
    uint64_t v47 = [v26 count];

    for (unint64_t i = 0; ; ++i)
    {
      v28 = [v23 routeLegs];
      BOOL v29 = i < [v28 count];

      if (!v29) {
        break;
      }
      v30 = [v50 routeLegs];
      uint64_t v51 = [v30 objectAtIndexedSubscript:i];

      v31 = [a1 _unpackedPointsDataForGeoRoute:v51];
      if (!v31)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: legPointsData != nullptr", buf, 2u);
        }
        v40 = 0;
        v41 = v51;
        goto LABEL_30;
      }
      [v49 addObject:v31];
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      v32 = [v51 steps];
      uint64_t v33 = [v32 countByEnumeratingWithState:&v52 objects:v56 count:16];
      if (v33)
      {
        uint64_t v34 = *(void *)v53;
        do
        {
          for (uint64_t j = 0; j != v33; ++j)
          {
            if (*(void *)v53 != v34) {
              objc_enumerationMutation(v32);
            }
            v36 = *(void **)(*((void *)&v52 + 1) + 8 * j);
            [v36 distanceMeters];
            if (fabsf(v37) >= 1.0e-12)
            {
              v38 = objc_alloc_init(GEOComposedRouteLengthMarker);
              [(GEOComposedRouteLengthMarker *)v38 setPathIndex:i];
              -[GEOComposedRouteLengthMarker setPointIndex:](v38, "setPointIndex:", [v36 maneuverEndIndex]);
              [v36 distanceMeters];
              [(GEOComposedRouteLengthMarker *)v38 setLength:v39];
              [v12 addObject:v38];
            }
          }
          uint64_t v33 = [v32 countByEnumeratingWithState:&v52 objects:v56 count:16];
        }
        while (v33);
      }

      v23 = v50;
    }
    v40 = [[GEOComposedRouteCoordinateArray alloc] initWithPointData:v49 lengthMarkers:v12 usesZilch:v47 != 0];
    v41 = GEOGetGEORouteBuilderLog();
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_INFO)) {
      goto LABEL_30;
    }
    int v42 = [(GEOComposedRouteCoordinateArray *)v40 coordinateCount];
    *(_DWORD *)buf = 67174657;
    int v58 = v42;
    v43 = "Generated coordinates using zilch points. Count: %{private}d";
    goto LABEL_29;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: geoWaypointRoute != nullptr", buf, 2u);
  }
  v40 = 0;
LABEL_31:

  return v40;
}

+ (id)_unpackedPointsDataForGeoRoute:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = [v3 zilchPoints];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      id v7 = [v4 zilchPoints];
      id v8 = [v7 firstObject];
      uint64_t v9 = +[GEOPointUtility unpackPoints:v8 usesZilch:1];
LABEL_6:
      unint64_t v11 = (void *)v9;

      goto LABEL_7;
    }
    v10 = [v4 basicPoints];

    if (v10)
    {
      id v7 = [v4 basicPoints];
      id v8 = [v7 firstObject];
      uint64_t v9 = +[GEOPointUtility unpackPoints:v8 usesZilch:0];
      goto LABEL_6;
    }
    unint64_t v11 = [v4 unpackedLatLngVertices];

    if (v11)
    {
      unint64_t v11 = [v4 unpackedLatLngVertices];
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: geoRoute != nullptr", v13, 2u);
    }
    unint64_t v11 = 0;
  }
LABEL_7:

  return v11;
}

+ (void)_componentsForGeoWaypointRoute:(id)a3 initializerData:(id)a4 coordinates:(id)a5 custodian:(id)a6 outLegs:(id *)a7 outSegments:(id *)a8 outSteps:(id *)a9
{
  uint64_t v137 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v122 = a5;
  id v118 = a6;
  v111 = v12;
  v100 = v13;
  if (!v12)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_106;
    }
    *(_WORD *)buf = 0;
    v96 = MEMORY[0x1E4F14500];
    v97 = "Assertion failed: geoWaypointRoute != nullptr";
LABEL_123:
    _os_log_fault_impl(&dword_188D96000, v96, OS_LOG_TYPE_FAULT, v97, buf, 2u);
    goto LABEL_106;
  }
  if (!v13)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_106;
    }
    *(_WORD *)buf = 0;
    v96 = MEMORY[0x1E4F14500];
    v97 = "Assertion failed: initializerData != nullptr";
    goto LABEL_123;
  }
  unint64_t v14 = [v13 waypoints];

  if (!v14)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_106;
    }
    *(_WORD *)buf = 0;
    v96 = MEMORY[0x1E4F14500];
    v97 = "Assertion failed: initializerData.waypoints != nullptr";
    goto LABEL_123;
  }
  v15 = [v13 waypoints];
  unint64_t v16 = [v15 count];

  if (v16 <= 1)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_106;
    }
    *(_WORD *)buf = 0;
    v96 = MEMORY[0x1E4F14500];
    v97 = "Assertion failed: initializerData.waypoints.count >= 2";
    goto LABEL_123;
  }
  if (!v122)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_106;
    }
    *(_WORD *)buf = 0;
    v96 = MEMORY[0x1E4F14500];
    v97 = "Assertion failed: coordinates != nullptr";
    goto LABEL_123;
  }
  if (!v118)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_106;
    }
    *(_WORD *)buf = 0;
    v96 = MEMORY[0x1E4F14500];
    v97 = "Assertion failed: custodian != nullptr";
    goto LABEL_123;
  }
  uint64_t v17 = [v122 pathsCount];
  if (v17 != [v12 routeLegsCount])
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_106;
    }
    *(_WORD *)buf = 0;
    v96 = MEMORY[0x1E4F14500];
    v97 = "Assertion failed: coordinates.pathsCount == geoWaypointRoute.routeLegsCount";
    goto LABEL_123;
  }
  id v101 = [MEMORY[0x1E4F1CA48] array];
  id v107 = [MEMORY[0x1E4F1CA48] array];
  id v113 = [MEMORY[0x1E4F1CA48] array];
  v18 = [v13 waypoints];
  v105 = [v18 firstObject];

  id v19 = [v13 waypoints];
  v20 = objc_msgSend(v19, "_geo_filtered:", &__block_literal_global_13);
  v102 = (void *)[v20 mutableCopy];

  v21 = [v13 directionsRequest];
  v22 = [v21 originalWaypointRoute];
  if (v22)
  {
    v23 = [v13 directionsRequest];
    v24 = [v23 originalWaypointRoute];
    if ([v24 hasPurpose])
    {
      v25 = [v100 directionsRequest];
      v26 = [v25 originalWaypointRoute];
      int v27 = [v26 purpose];

      if (v27 == 1)
      {
        v28 = (void *)[v102 copy];
        long long v129 = 0u;
        long long v130 = 0u;
        long long v127 = 0u;
        long long v128 = 0u;
        BOOL v29 = [v111 routeLegs];
        unint64_t v30 = 0;
        uint64_t v31 = [v29 countByEnumeratingWithState:&v127 objects:v136 count:16];
        if (v31)
        {
          uint64_t v32 = *(void *)v128;
          do
          {
            for (uint64_t i = 0; i != v31; ++i)
            {
              if (*(void *)v128 != v32) {
                objc_enumerationMutation(v29);
              }
              uint64_t v34 = *(void **)(*((void *)&v127 + 1) + 8 * i);
              v35 = [v34 destinationWaypointInfo];
              if (v35)
              {
                v36 = [v34 destinationWaypointInfo];
                BOOL v37 = [v36 source] == 2;

                if (v37) {
                  continue;
                }
              }
              ++v30;
            }
            uint64_t v31 = [v29 countByEnumeratingWithState:&v127 objects:v136 count:16];
          }
          while (v31);
        }

        if (v30 >= [v28 count] - 1)
        {
          v38 = v102;
        }
        else
        {
          v38 = [MEMORY[0x1E4F1CA48] arrayWithObject:v105];

          float v39 = objc_msgSend(v28, "subarrayWithRange:", objc_msgSend(v28, "count") - v30, v30);
          [v38 addObjectsFromArray:v39];

          v40 = GEOGetGEORouteBuilderLog();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            uint64_t v41 = [v28 count];
            uint64_t v42 = [v38 count];
            *(_DWORD *)buf = 134217984;
            v132 = (__CFString *)(v41 - v42);
            _os_log_impl(&dword_188D96000, v40, OS_LOG_TYPE_INFO, "The next %lu waypoint(s) have been removed in the new waypoint route.", buf, 0xCu);
          }
        }
        v102 = v38;
      }
      goto LABEL_27;
    }
  }
LABEL_27:
  unint64_t v106 = 0;
  uint64_t v43 = 0;
  uint64_t v104 = 1;
  while (v106 < [v111 routeLegsCount])
  {
    id v44 = [v111 routeLegs];
    v121 = [v44 objectAtIndexedSubscript:v106];

    v110 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v108 = [v122 routeIndexForLocalIndex:0 onPath:v106];
    uint64_t v45 = [v122 coordinateCountForPathAtIndex:v106];
    if (!v45)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: legCoordinateCount > 0", buf, 2u);
      }
      id v119 = 0;
      v120 = 0;
      goto LABEL_90;
    }
    long long v125 = 0u;
    long long v126 = 0u;
    long long v123 = 0u;
    long long v124 = 0u;
    id v46 = [v121 steps];
    obuint64_t j = v46;
    uint64_t v47 = [v46 countByEnumeratingWithState:&v123 objects:v135 count:16];
    uint64_t v103 = v45;
    if (!v47)
    {
      id v48 = 0;
      id v119 = 0;
      v120 = 0;
      goto LABEL_61;
    }
    id v119 = 0;
    v120 = 0;
    id v48 = 0;
    uint64_t v49 = v108;
    uint64_t v114 = (v108 + v45 - 1);
    uint64_t v115 = *(void *)v124;
    double v50 = 0.0;
    uint64_t v51 = v108;
    do
    {
      uint64_t v116 = v47;
      uint64_t v117 = v43;
      uint64_t v52 = 0;
      uint64_t v53 = v51;
      long long v54 = v48;
      do
      {
        if (*(void *)v124 != v115) {
          objc_enumerationMutation(obj);
        }
        long long v55 = *(void **)(*((void *)&v123 + 1) + 8 * v52);
        double v50 = v50 + (float)[v55 distanceCm] * 0.01;
        uint64_t v56 = [v122 routeCoordinateForDistance:v108 afterRouteCoordinate:v50];
        v57 = [v121 steps];
        int v58 = [v57 lastObject];
        BOOL v59 = v55 == v58;

        if (v59) {
          uint64_t v51 = v114;
        }
        else {
          uint64_t v51 = v56;
        }
        if ([v55 hasOverrideTransportType]
          && [v55 overrideTransportType] != 4)
        {
          uint64_t v60 = [v55 overrideTransportType];
        }
        else
        {
          uint64_t v60 = [v111 transportType];
        }
        uint64_t v61 = v60;
        if ([v122 usesRoutingPathPoints]) {
          objc_msgSend(a1, "_composedRouteStepWithTransportType:andCustodian:geoRouteLeg:forGeoStep:withStepIndex:startRouteCoordinate:endRouteCoordinate:maneuverStartRouteCoordinate:", v61, v118, v121, v55, v117 + v52, v53, v51, objc_msgSend(v122, "routeCoordinateForDistance:afterRouteCoordinate:", v108, (float)objc_msgSend(v55, "maneuverStartPointOffsetCm") * 0.01));
        }
        else {
        id v48 = [a1 _composedRouteStepWithTransportType:v61 andCustodian:v118 geoRouteLeg:v121 forGeoStep:v55 withStepIndex:v117 + v52 stepStartPointIndex:v49 legStartPointIndex:v108];
        }
        [v113 addObject:v48];
        if (v120) {
          v62 = v120;
        }
        else {
          v62 = v48;
        }
        id v63 = v62;

        if (v119) {
          v64 = v119;
        }
        else {
          v64 = v48;
        }
        id v65 = v64;

        v120 = v63;
        if (v54 && (int v66 = [v48 transportType], v66 != objc_msgSend(v54, "transportType")))
        {
          v67 = +[GEORouteBuilder _composedRouteSegmentForStartStep:andEndStep:segmentIndex:andCustodian:](GEORouteBuilder, "_composedRouteSegmentForStartStep:andEndStep:segmentIndex:andCustodian:", v65, v54, [v110 count] + objc_msgSend(v107, "count"), v118);
          [v110 addObject:v67];
          id v119 = v48;
        }
        else
        {
          id v119 = v65;
        }
        unsigned int v68 = [v48 endPointIndex];

        uint64_t v49 = v68;
        ++v52;
        uint64_t v53 = v51;
        long long v54 = v48;
      }
      while (v116 != v52);
      uint64_t v47 = [obj countByEnumeratingWithState:&v123 objects:v135 count:16];
      uint64_t v43 = v117 + v52;
    }
    while (v47);

    uint64_t v43 = v117 + v52;
    if (v48 && v119)
    {
      id v46 = +[GEORouteBuilder _composedRouteSegmentForStartStep:andEndStep:segmentIndex:andCustodian:](GEORouteBuilder, "_composedRouteSegmentForStartStep:andEndStep:segmentIndex:andCustodian:", v119, v48, [v110 count] + objc_msgSend(v107, "count"), v118);
      [v110 addObject:v46];
LABEL_61:
    }
    v69 = [v111 routeLegs];
    v70 = [v69 lastObject];
    BOOL v71 = v121 == v70;

    if (!v71)
    {
      v72 = [v121 destinationWaypointInfo];
      if ([v72 source] == 1)
      {
        v73 = [v102 objectAtIndexedSubscript:v104++];
LABEL_82:
        v83 = [v72 evChargingInfo];
        BOOL v84 = v83 == 0;

        if (!v84)
        {
          v85 = [GEOComposedWaypointEVStop alloc];
          v86 = [v73 geoMapItem];
          uint64_t v87 = [(GEOComposedWaypointEVStop *)v85 initWithGeoWaypointInfo:v72 mapItem:v86];

          v73 = (void *)v87;
        }

        goto LABEL_85;
      }
      if ([v72 source] != 2
        && (GEOConfigGetBOOL(MapsFeaturesConfig_DrivingMultiWaypointRoutesEnabled, (uint64_t)off_1E9111D68) & 1) != 0)
      {
        v74 = GEOGetGEORouteBuilderLog();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_FAULT))
        {
          uint64_t v75 = [v111 transportType];
          if (v75 >= 7)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v75);
            v76 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v76 = off_1E53E73C8[(int)v75];
          }
          v80 = v76;
          uint64_t v81 = [v72 source];
          if (v81 >= 3)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v81);
            v82 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v82 = off_1E53E7400[(int)v81];
          }
          *(_DWORD *)buf = 138412546;
          v132 = v80;
          __int16 v133 = 2112;
          v134 = v82;
          _os_log_impl(&dword_188D96000, v74, OS_LOG_TYPE_FAULT, "Unknown waypoint source when building route of transport type %@: %@", buf, 0x16u);
        }
        goto LABEL_80;
      }
      v77 = [v72 evChargingInfo];
      BOOL v78 = v77 == 0;

      if (v78)
      {
        v74 = GEOGetGEORouteBuilderLog();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
        {
          v79 = [v100 directionsResponse];
          *(_DWORD *)buf = 138412290;
          v132 = v79;
          _os_log_impl(&dword_188D96000, v74, OS_LOG_TYPE_ERROR, "Only EV charging stations are supported for server provided waypoints. This is a server error: %@", buf, 0xCu);
        }
LABEL_80:
      }
      v73 = 0;
      goto LABEL_82;
    }
    v73 = [v102 lastObject];
LABEL_85:
    if (!v73)
    {
      v88 = GEOGetGEORouteBuilderLog();
      if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_188D96000, v88, OS_LOG_TYPE_ERROR, "No geoWaypointInfo provided. This is likely a server bug. Falling back to waypoints provided by the request.", buf, 2u);
      }

      v73 = [v102 objectAtIndexedSubscript:v104++];
    }
    [v107 addObjectsFromArray:v110];
    v89 = objc_msgSend(v111, "arrivalParametersAtIndex:", objc_msgSend(v121, "arrivalParameterIndex"));
    v90 = [v110 firstObject];
    v91 = [v110 lastObject];
    v92 = +[GEORouteBuilder _composedRouteLegForStartStep:endStep:startSegment:endSegment:custodian:geoRouteLeg:legIndex:origin:destination:arrivalParameters:legLength:](GEORouteBuilder, "_composedRouteLegForStartStep:endStep:startSegment:endSegment:custodian:geoRouteLeg:legIndex:origin:destination:arrivalParameters:legLength:", v120, v48, v90, v91, v118, v121, (double)[v121 distance], v106, v105, v73, v89);

    [v101 addObject:v92];
    v105 = v73;
    uint64_t v45 = v103;
LABEL_90:

    ++v106;
    if (!v45) {
      goto LABEL_105;
    }
  }
  if ([v102 count] != v104 + 1)
  {
    v93 = GEOGetGEORouteBuilderLog();
    if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
    {
      v94 = [v100 directionsRequest];
      v95 = [v100 directionsResponse];
      *(_DWORD *)buf = 138412546;
      v132 = v94;
      __int16 v133 = 2112;
      v134 = v95;
      _os_log_impl(&dword_188D96000, v93, OS_LOG_TYPE_ERROR, "Mismatch between waypoints sent in directions request and waypoints received in directions response. This is a server error: %@\n%@", buf, 0x16u);
    }
  }
  if (a7) {
    *a7 = v101;
  }
  if (a8) {
    *a8 = v107;
  }
  if (a9) {
    *a9 = v113;
  }
LABEL_105:

LABEL_106:
}

uint64_t __117__GEORouteBuilder__componentsForGeoWaypointRoute_initializerData_coordinates_custodian_outLegs_outSegments_outSteps___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isServerProvidedWaypoint] ^ 1;
}

+ (id)_composedRouteStepWithTransportType:(int)a3 andCustodian:(id)a4 geoRouteLeg:(id)a5 forGeoStep:(id)a6 withStepIndex:(unint64_t)a7 startRouteCoordinate:(PolylineCoordinate)a8 endRouteCoordinate:(PolylineCoordinate)a9 maneuverStartRouteCoordinate:(PolylineCoordinate)a10
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v18 = v17;
  if (!v15)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      __int16 v25 = 0;
      v21 = MEMORY[0x1E4F14500];
      v22 = "Assertion failed: custodian != nullptr";
      v23 = (uint8_t *)&v25;
LABEL_14:
      _os_log_fault_impl(&dword_188D96000, v21, OS_LOG_TYPE_FAULT, v22, v23, 2u);
    }
LABEL_5:
    id v19 = 0;
    goto LABEL_7;
  }
  if (!v17)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v21 = MEMORY[0x1E4F14500];
      v22 = "Assertion failed: geoStep != nullptr";
      v23 = buf;
      goto LABEL_14;
    }
    goto LABEL_5;
  }
  if (a3 >= 6 || ((0x2Du >> a3) & 1) == 0) {
    goto LABEL_5;
  }
  id v19 = (void *)[objc_alloc(*off_1E53E7418[a3]) initWithComposedRoute:v15 geoRouteLeg:v16 geoStep:v17 stepIndex:a7 startRouteCoordinate:a8 endRouteCoordinate:a9 maneuverStartRouteCoordinate:a10];
LABEL_7:

  return v19;
}

+ (id)_composedRouteStepWithTransportType:(int)a3 andCustodian:(id)a4 geoRouteLeg:(id)a5 forGeoStep:(id)a6 withStepIndex:(unint64_t)a7 stepStartPointIndex:(unint64_t)a8 legStartPointIndex:(unint64_t)a9
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = v15;
  if (!v13)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      __int16 v28 = 0;
      v23 = MEMORY[0x1E4F14500];
      v24 = "Assertion failed: custodian != nullptr";
      __int16 v25 = (uint8_t *)&v28;
LABEL_14:
      _os_log_fault_impl(&dword_188D96000, v23, OS_LOG_TYPE_FAULT, v24, v25, 2u);
    }
LABEL_5:
    v21 = 0;
    goto LABEL_7;
  }
  if (!v15)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v23 = MEMORY[0x1E4F14500];
      v24 = "Assertion failed: geoStep != nullptr";
      __int16 v25 = buf;
      goto LABEL_14;
    }
    goto LABEL_5;
  }
  unsigned int v17 = [v15 maneuverEndIndex];
  int v18 = [v16 maneuverEndIndex];
  int v19 = [v16 maneuverStartIndex];
  unsigned int v20 = [v16 maneuverStartIndex];
  if (a3 >= 6 || ((0x2Du >> a3) & 1) == 0) {
    goto LABEL_5;
  }
  v21 = objc_msgSend(objc_alloc(*off_1E53E7418[a3]), "initWithComposedRoute:geoRouteLeg:geoStep:stepIndex:pointRange:maneuverPointRange:", v13, v14, v16, a7, a8, a9 - a8 + v17 + 1, a9 + v20, (v18 - v19 + 1));
LABEL_7:

  return v21;
}

+ (id)_composedRouteSegmentForStartStep:(id)a3 andEndStep:(id)a4 segmentIndex:(unint64_t)a5 andCustodian:(id)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = v11;
  if (!v9)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_8;
    }
    *(_WORD *)buf = 0;
    unint64_t v30 = MEMORY[0x1E4F14500];
    uint64_t v31 = "Assertion failed: startStep != nullptr";
LABEL_27:
    _os_log_fault_impl(&dword_188D96000, v30, OS_LOG_TYPE_FAULT, v31, buf, 2u);
    goto LABEL_8;
  }
  if (!v10)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_8;
    }
    *(_WORD *)buf = 0;
    unint64_t v30 = MEMORY[0x1E4F14500];
    uint64_t v31 = "Assertion failed: endStep != nullptr";
    goto LABEL_27;
  }
  if (!v11)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      unint64_t v30 = MEMORY[0x1E4F14500];
      uint64_t v31 = "Assertion failed: custodian != nullptr";
      goto LABEL_27;
    }
LABEL_8:
    int v27 = 0;
    goto LABEL_13;
  }
  uint64_t v13 = [v9 transportType];
  uint64_t v14 = [v9 stepIndex];
  uint64_t v15 = [v10 stepIndex];
  uint64_t v16 = [v9 stepIndex];
  NSUInteger v17 = [v9 pointRange];
  NSUInteger v19 = v18;
  v37.location = [v10 pointRange];
  v37.length = v20;
  v36.location = v17;
  v36.length = v19;
  NSRange v21 = NSUnionRange(v36, v37);
  uint64_t v22 = v15 - v16 + 1;
  v23 = off_1E53D3988;
  switch((int)v13)
  {
    case 0:
      goto LABEL_11;
    case 2:
      v24 = -[GEOComposedWalkingRouteSegment initWithComposedRoute:stepRange:pointRange:segmentIndex:transitIncidentMessageStepIndex:]([GEOComposedWalkingRouteSegment alloc], "initWithComposedRoute:stepRange:pointRange:segmentIndex:transitIncidentMessageStepIndex:", v12, v14, v22, v21.location, v21.length, a5, 0x7FFFFFFFFFFFFFFFLL);
      goto LABEL_12;
    case 3:
      v23 = off_1E53D3978;
      goto LABEL_11;
    case 5:
      v23 = off_1E53D39B8;
LABEL_11:
      v24 = (GEOComposedWalkingRouteSegment *)objc_msgSend(objc_alloc(*v23), "initWithComposedRoute:stepRange:pointRange:segmentIndex:", v12, v14, v22, v21.location, v21.length, a5);
LABEL_12:
      int v27 = v24;
      break;
    default:
      __int16 v25 = MEMORY[0x1E4F14500];
      id v26 = MEMORY[0x1E4F14500];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      {
        if v13 < 7 && ((0x77u >> v13))
        {
          BOOL v29 = off_1E53E7448[(int)v13];
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v13);
          BOOL v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        *(_DWORD *)buf = 138412290;
        uint64_t v33 = v29;
        _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: Unsupported transport type (%@) in -[GEORouteBuilder _composedRouteSegmentForStartStep:]", buf, 0xCu);
      }
      goto LABEL_8;
  }
LABEL_13:

  return v27;
}

+ (id)_composedRouteLegForStartStep:(id)a3 endStep:(id)a4 startSegment:(id)a5 endSegment:(id)a6 custodian:(id)a7 geoRouteLeg:(id)a8 legIndex:(unint64_t)a9 origin:(id)a10 destination:(id)a11 arrivalParameters:(id)a12 legLength:(double)a13
{
  id v19 = a3;
  id v20 = a4;
  id v21 = a5;
  id v31 = a6;
  id v22 = a7;
  id v32 = a8;
  id v23 = a10;
  id v24 = a11;
  id v25 = a12;
  if (!v19)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_13;
    }
    __int16 v35 = 0;
    __int16 v28 = MEMORY[0x1E4F14500];
    BOOL v29 = "Assertion failed: startStep != nullptr";
    unint64_t v30 = (uint8_t *)&v35;
LABEL_15:
    _os_log_fault_impl(&dword_188D96000, v28, OS_LOG_TYPE_FAULT, v29, v30, 2u);
    goto LABEL_13;
  }
  if (!v20)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_13;
    }
    __int16 v34 = 0;
    __int16 v28 = MEMORY[0x1E4F14500];
    BOOL v29 = "Assertion failed: endStep != nullptr";
    unint64_t v30 = (uint8_t *)&v34;
    goto LABEL_15;
  }
  if (v22)
  {
    id v26 = [[GEOComposedRouteLeg alloc] initWithComposedRoute:v22 geoRouteLeg:v32 legIndex:a9 origin:v23 destination:v24 arrivalParameters:v25];
    -[GEOComposedRouteLeg setPointRange:](v26, "setPointRange:", [v19 startPointIndex], objc_msgSend(v20, "endPointIndex") - objc_msgSend(v19, "startPointIndex") + 1);
    -[GEOComposedRouteLeg setStepRange:](v26, "setStepRange:", [v19 stepIndex], objc_msgSend(v20, "stepIndex") - objc_msgSend(v19, "stepIndex") + 1);
    -[GEOComposedRouteLeg setSegmentRange:](v26, "setSegmentRange:", [v21 segmentIndex], objc_msgSend(v31, "segmentIndex") - objc_msgSend(v21, "segmentIndex") + 1);
    [(GEOComposedRouteLeg *)v26 setDistance:(double)a13];
    goto LABEL_5;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    __int16 v28 = MEMORY[0x1E4F14500];
    BOOL v29 = "Assertion failed: custodian != nullptr";
    unint64_t v30 = buf;
    goto LABEL_15;
  }
LABEL_13:
  id v26 = 0;
LABEL_5:

  return v26;
}

+ (id)buildPointSectionsWithSteps:(id)a3 segments:(id)a4 coordinates:(id)a5
{
  id v7 = a3;
  id v52 = a4;
  id v8 = a5;
  v57 = v7;
  if (v7)
  {
    id v51 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    unint64_t v9 = 0;
    uint64_t v55 = 0;
    uint64_t v10 = 0;
    while (1)
    {
      if (v9 >= [v8 pathsCount]) {
        goto LABEL_30;
      }
      unint64_t v11 = [v8 coordinateCountForPathAtIndex:v9];
      unint64_t v12 = v11;
      if (v11 < 2) {
        goto LABEL_28;
      }
      unint64_t v13 = 0;
      unint64_t v58 = v11 - 1;
      uint64_t v59 = v55 + 1;
      unint64_t v53 = v11;
      unint64_t v54 = v9;
      do
      {
        uint64_t v14 = [v57 objectAtIndex:v10];
        int v56 = [v14 transportType];
        uint64_t v15 = v13 + v55;
        [v8 coordinateOnRouteAt:v13 + v55];
        double v17 = v16;
        double v21 = GEOTilePointForCoordinate(v18, v19, 20.0);
        double v22 = v20;
        if (v13 + 1 >= v12)
        {
          double v61 = 0.0;
          double v62 = v20;
          unint64_t v23 = v13;
          double v28 = v21;
          double v27 = v21;
          double v26 = v20;
          double v25 = v17;
          id v31 = v14;
          goto LABEL_24;
        }
        unint64_t v23 = v13;
        uint64_t v24 = v10;
        double v61 = 0.0;
        double v62 = v20;
        double v25 = v17;
        double v26 = v20;
        double v27 = v21;
        double v28 = v21;
        while (1)
        {
          double v60 = v21;
          unint64_t v29 = v59 + v23;
          [v8 distanceBetweenIndex:v15 andIndex:v59 + v23];
          if (v23 > v13 && v30 > 16000.0) {
            break;
          }
          if (!v14) {
            goto LABEL_18;
          }
          if (v29 <= [v14 endPointIndex])
          {
            id v31 = v14;
            goto LABEL_19;
          }
          uint64_t v10 = v24 + 1;
          if (v24 + 1 >= (unint64_t)[v57 count])
          {

LABEL_18:
            id v31 = 0;
LABEL_19:
            uint64_t v10 = v24;
            goto LABEL_20;
          }
          id v31 = [v57 objectAtIndex:v24 + 1];
          int v32 = [v31 transportType];

          if (v23 > v13 && v56 != v32) {
            goto LABEL_24;
          }
LABEL_20:
          [v8 coordinateOnRouteAt:v29];
          double v34 = v33;
          double v37 = GEOTilePointForCoordinate(v35, v36, 20.0);
          double v38 = v22;
          double v22 = v39;
          double v28 = fmin(v28, v37);
          double v27 = fmax(v27, v37);
          double v26 = fmin(v26, v39);
          double v61 = v61 + GEOMetersBetweenMapPoints(v60, v38, v37, v39);
          double v62 = fmax(v62, v22);
          double v25 = fmin(v25, v34);
          ++v23;
          uint64_t v24 = v10;
          uint64_t v14 = v31;
          double v21 = v37;
          double v17 = fmax(v17, v34);
          if (v58 == v23) {
            goto LABEL_24;
          }
        }
        id v31 = v14;
        uint64_t v10 = v24;
LABEL_24:
        *(double *)&long long v64 = v28;
        *((double *)&v64 + 1) = v26;
        *(double *)&long long v65 = v25;
        *((double *)&v65 + 1) = v27 - v28;
        v66[0] = v62 - v26;
        v66[1] = v17 - v25;
        objc_msgSend(v8, "distanceFromStartToIndex:", v15, (double)GEOComposedRouteSectionPadAndSquareBounds((double *)&v64));
        double v41 = v40;
        [v8 distanceBetweenIndex:v15 andIndex:v23 + v55];
        double v43 = v42 / v61;
        if (v61 <= 0.0) {
          double v44 = 1.0;
        }
        else {
          double v44 = v43;
        }
        uint64_t v45 = [GEOComposedRouteSection alloc];
        id v46 = +[GEORouteBuilder segmentForPointIndex:v15 withSegments:v52 andSteps:v57];
        unint64_t v47 = +[GEORouteBuilder segmentIndexForPointIndex:v15 withSegments:v52];
        v63[0] = v64;
        v63[1] = v65;
        v63[2] = *(_OWORD *)v66;
        LODWORD(v50) = v56;
        id v48 = [(GEOComposedRouteSection *)v45 initWithCoordinates:v8 segment:v46 segmentIndex:v47 steps:v57 startCoordinateIndex:v13 + v55 coordinateCount:(v23 - v13 + 1) bounds:v41 transportType:v44 finalStepIndex:v63 startDistance:v50 lengthScaleFactor:v10];

        [v51 addObject:v48];
        unint64_t v13 = v23;
        unint64_t v12 = v53;
        unint64_t v9 = v54;
      }
      while (v23 + 1 < v53);
LABEL_28:
      v55 += v12;
      ++v9;
    }
  }
  id v51 = 0;
LABEL_30:

  return v51;
}

+ (id)segmentForPointIndex:(unint64_t)a3 withSegments:(id)a4 andSteps:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  unint64_t v9 = +[GEORouteBuilder _segmentForStepIndex:withSegments:](GEORouteBuilder, "_segmentForStepIndex:withSegments:", +[GEORouteBuilder stepIndexForPointIndex:a3 withSteps:v8], v7);

  return v9;
}

+ (unint64_t)stepIndexForPointIndex:(unint64_t)a3 withSteps:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if ([v5 count])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = 0;
      uint64_t v9 = *(void *)v15;
      while (2)
      {
        uint64_t v10 = 0;
        uint64_t v11 = v7 + v8;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          if (objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v10), "endPointIndex", (void)v14) > a3)
          {

            unint64_t v12 = v8 + v10;
            goto LABEL_13;
          }
          ++v10;
        }
        while (v7 != v10);
        uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        uint64_t v8 = v11;
        if (v7) {
          continue;
        }
        break;
      }
    }

    unint64_t v12 = [v6 count] - 1;
  }
  else
  {
    unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_13:

  return v12;
}

+ (id)_segmentForStepIndex:(unint64_t)a3 withSegments:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = a4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        unint64_t v10 = objc_msgSend(v9, "stepRange", (void)v15);
        if (a3 >= v10 && a3 - v10 < v11)
        {
          id v13 = v9;
          goto LABEL_14;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
  id v13 = 0;
LABEL_14:

  return v13;
}

+ (unint64_t)segmentIndexForPointIndex:(unint64_t)a3 withSegments:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if ([v5 count])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = 0;
      uint64_t v9 = *(void *)v15;
      while (2)
      {
        uint64_t v10 = 0;
        uint64_t v11 = v7 + v8;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          if (objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v10), "endPointIndex", (void)v14) > a3)
          {

            unint64_t v12 = v8 + v10;
            goto LABEL_13;
          }
          ++v10;
        }
        while (v7 != v10);
        uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        uint64_t v8 = v11;
        if (v7) {
          continue;
        }
        break;
      }
    }

    unint64_t v12 = [v6 count] - 1;
  }
  else
  {
    unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_13:

  return v12;
}

+ (id)buildMapRegionFromPointSections:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v25;
    double v6 = 0.0;
    double v7 = INFINITY;
    double v8 = INFINITY;
    double v9 = INFINITY;
    long long v18 = 0u;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v25 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        *(double *)uint64_t v20 = v7;
        *(double *)&v20[1] = v8;
        *(double *)&v20[2] = v9;
        *(double *)&v20[3] = v6;
        long long v21 = v18;
        if (v11) {
          [v11 bounds];
        }
        else {
          memset(v19, 0, sizeof(v19));
        }
        GEOMapBoxUnion((uint64_t)v20, (uint64_t)v19, (uint64_t)v22);
        double v7 = *(double *)v22;
        double v8 = *(double *)&v22[1];
        double v9 = *(double *)&v22[2];
        double v6 = *(double *)&v22[3];
        long long v18 = v23;
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v4);
  }
  else
  {
    double v6 = 0.0;
    double v7 = INFINITY;
    double v8 = INFINITY;
    double v9 = INFINITY;
    *(void *)&long long v18 = 0;
  }

  double v12 = fabs(v8);
  double v13 = fabs(v9);
  if (fabs(v7) == INFINITY || v12 == INFINITY || v13 == INFINITY) {
    long long v16 = 0;
  }
  else {
    long long v16 = -[GEOMapRegion initWithMapRect:]([GEOMapRegion alloc], "initWithMapRect:", v7, v8, v6, *(double *)&v18);
  }

  return v16;
}

+ (id)_guidanceEventsForGeoWaypointRoute:(id)a3 legs:(id)a4 steps:(id)a5 coordinates:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v45 = a5;
  id v11 = a6;
  double v41 = v9;
  double v42 = v10;
  if (!v9) {
    goto LABEL_29;
  }
  if (![v10 count] || !objc_msgSend(v45, "count"))
  {
LABEL_28:
    id v9 = 0;
    goto LABEL_29;
  }
  uint64_t v12 = [v10 count];
  double v13 = [v9 routeLegs];
  uint64_t v14 = [v13 count];

  if (v12 != v14)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: legs.count == geoWaypointRoute.routeLegs.count", buf, 2u);
    }
    goto LABEL_28;
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v15 = 0;
  uint64_t v48 = 0;
  while (v15 < objc_msgSend(v42, "count", v41))
  {
    id v46 = [v42 objectAtIndexedSubscript:v15];
    long long v16 = [v41 routeLegs];
    unint64_t v47 = [v16 objectAtIndexedSubscript:v15];

    for (unint64_t i = [v46 startStepIndex]; i <= objc_msgSend(v46, "endStepIndex"); unint64_t i = v18 + 1)
    {
      unint64_t v18 = i;
      uint64_t v19 = [v45 objectAtIndexedSubscript:i];
      for (unint64_t j = 0; ; ++j)
      {
        long long v21 = [v19 geoStep];
        double v22 = [v21 guidanceEvents];
        unint64_t v23 = [v22 count];

        if (j >= v23) {
          break;
        }
        long long v24 = [v19 geoStep];
        long long v25 = [v24 guidanceEvents];
        long long v26 = [v25 objectAtIndexedSubscript:j];

        long long v27 = [[GEOComposedGuidanceEvent alloc] initWithGeoGuidanceEvent:v26 step:v19 legIndex:v15 coordinates:v11];
        if (v27)
        {
          if ([v26 hasEnrouteNoticeIndex])
          {
            -[GEOComposedGuidanceEvent setEnrouteNoticeIndex:](v27, "setEnrouteNoticeIndex:", v48 + [v26 enrouteNoticeIndex]);
            uint64_t v28 = 3;
          }
          else
          {
            uint64_t v28 = 1;
          }
          [(GEOComposedGuidanceEvent *)v27 setSource:v28];
          [(GEOComposedGuidanceEvent *)v27 setSourceIndex:j];
          [v9 addObject:v27];
        }
      }
    }
    double v44 = objc_msgSend(v45, "objectAtIndexedSubscript:", objc_msgSend(v46, "startStepIndex"));
    uint64_t v29 = objc_msgSend(v45, "objectAtIndexedSubscript:", objc_msgSend(v46, "endStepIndex"));
    for (unint64_t k = 0; ; ++k)
    {
      id v31 = [v47 guidanceEvents];
      unint64_t v32 = [v31 count];

      if (k >= v32) {
        break;
      }
      double v33 = [v47 guidanceEvents];
      double v34 = [v33 objectAtIndexedSubscript:k];

      int v35 = objc_msgSend(a1, "_isGuidanceEventAtEndOfLeg:", objc_msgSend(v34, "eventType"));
      double v36 = v44;
      if (v35) {
        double v36 = v29;
      }
      id v37 = v36;
      double v38 = [[GEOComposedGuidanceEvent alloc] initWithGeoGuidanceEvent:v34 step:v37 legIndex:v15 coordinates:v11];
      double v39 = v38;
      if (v38)
      {
        [(GEOComposedGuidanceEvent *)v38 setSource:2];
        [(GEOComposedGuidanceEvent *)v39 setSourceIndex:k];
        [v9 addObject:v39];
      }
    }
    v48 += [v47 enrouteNoticesCount];

    ++v15;
  }
LABEL_29:

  return v9;
}

+ (BOOL)_isGuidanceEventAtEndOfLeg:(int)a3
{
  return (a3 - 11) < 4;
}

+ (id)_visualInfosForGuidanceEvents:(id)a3 steps:(id)a4 coordinates:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v10 = v7;
  id v11 = 0;
  uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        unint64_t v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if (objc_msgSend(v15, "hasSignGuidance", (void)v26))
        {
          long long v16 = [v15 shieldInfo];
          long long v17 = [v16 shield];

          if ([v17 length])
          {
            unint64_t v18 = [v15 stepIndex];
            if (v18 < [v8 count])
            {
              uint64_t v19 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v15, "stepIndex"));
              uint64_t v20 = [v19 endRouteCoordinate];
              [v9 coordinateForRouteCoordinate:v20];
              long long v24 = -[GEOComposedRouteVisualInfo initWithType:title:detail:routeCoordinate:locationCoordinate:]([GEOComposedRouteVisualInfo alloc], "initWithType:title:detail:routeCoordinate:locationCoordinate:", 131073, v17, 0, v20, v21, v22, v23);
              if (v24)
              {
                if (!v11)
                {
                  id v11 = [MEMORY[0x1E4F1CA48] array];
                }
                [v11 addObject:v24];
              }
            }
          }
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v12);
  }

  return v11;
}

+ (id)_cellularCoverageForGeoWaypointRoute:(id)a3 coordinates:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v34 = v6;
  int v35 = v5;
  if (!v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      __int16 v39 = 0;
      long long v27 = MEMORY[0x1E4F14500];
      long long v28 = "Assertion failed: geoWaypointRoute != nullptr";
      long long v29 = (uint8_t *)&v39;
LABEL_41:
      _os_log_fault_impl(&dword_188D96000, v27, OS_LOG_TYPE_FAULT, v28, v29, 2u);
    }
LABEL_36:
    long long v25 = 0;
    goto LABEL_30;
  }
  if (!v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)double v38 = 0;
      long long v27 = MEMORY[0x1E4F14500];
      long long v28 = "Assertion failed: coordinates != nullptr";
      long long v29 = v38;
      goto LABEL_41;
    }
    goto LABEL_36;
  }
  unint64_t v7 = 0;
  uint64_t v8 = 0;
  while (v7 < [v5 routeLegsCount])
  {
    id v9 = [v5 routeLegs];
    id v10 = [v9 objectAtIndexedSubscript:v7];

    if ([v34 coordinateCountForPathAtIndex:v7])
    {
      uint64_t v11 = [v10 cellularCoveragesCount];
      if (v11 != [v10 cellularCoverageOffsetsCount])
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: leg.cellularCoveragesCount == leg.cellularCoverageOffsetsCount", buf, 2u);
        }

        goto LABEL_36;
      }
      v8 += [v10 cellularCoveragesCount];
      if ([v10 cellularCoveragesCount]
        && [v10 cellularCoverageOffsetAtIndex:0]
        || ![v10 cellularCoveragesCount] && v8)
      {
        ++v8;
      }
    }

    ++v7;
  }
  if (!v8) {
    goto LABEL_36;
  }
  id v32 = [MEMORY[0x1E4F1CA58] dataWithLength:4 * v8];
  id v31 = [MEMORY[0x1E4F1CA58] dataWithLength:4 * v8];
  id v12 = v32;
  uint64_t v33 = [v12 mutableBytes];
  id v30 = v31;
  uint64_t v13 = [v30 mutableBytes];
  uint64_t v14 = 0;
  for (unint64_t i = 0; i < [v35 routeLegsCount]; ++i)
  {
    int v16 = [v34 routeIndexForLocalIndex:0 onPath:i];
    if ([v34 coordinateCountForPathAtIndex:i])
    {
      long long v17 = [v35 routeLegs];
      unint64_t v18 = [v17 objectAtIndexedSubscript:i];

      if ([v18 cellularCoveragesCount]
        && [v18 cellularCoverageOffsetAtIndex:0]
        || ![v18 cellularCoveragesCount])
      {
        uint64_t v19 = v33;
        *(_DWORD *)(v33 + 4 * v14) = v16;
        *(_DWORD *)(v13 + 4 * v14++) = 0;
      }
      else
      {
        uint64_t v19 = v33;
      }
      unint64_t v20 = 0;
      uint64_t v21 = v19 + 4 * v14;
      while (v20 < [v18 cellularCoverageOffsetsCount])
      {
        int v22 = [v18 cellularCoverageOffsetAtIndex:v20];
        int v23 = [v18 cellularCoverageAtIndex:v20];
        *(_DWORD *)(v21 + 4 * v20) = v22 + v16;
        *(_DWORD *)(v13 + 4 * v14 + 4 * v20++) = v23;
      }

      v14 += v20;
    }
  }
  if (v14 == v8)
  {
    long long v24 = v30;
    long long v25 = -[GEOComposedRouteCellularCoverage initWithOffsets:coverage:routeLength:]([GEOComposedRouteCellularCoverage alloc], "initWithOffsets:coverage:routeLength:", v12, v30, (double)[v35 distanceMeters]);
  }
  else
  {
    long long v24 = v30;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)double v36 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: currentCoverageOffset == totalCoverageCount", v36, 2u);
    }
    long long v25 = 0;
  }

LABEL_30:

  return v25;
}

@end