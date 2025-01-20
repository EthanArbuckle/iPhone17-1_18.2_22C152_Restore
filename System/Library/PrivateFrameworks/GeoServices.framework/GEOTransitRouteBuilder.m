@interface GEOTransitRouteBuilder
+ (BOOL)_shouldBreakPointSectionAtStep:(id)a3 previousStep:(id)a4;
+ (_NSRange)_appendPointData:(id)a3 toPointData:(id)a4 withContinuity:(BOOL)a5;
+ (_NSRange)_validPointRangeForStepInfoIndex:(unint64_t)a3 andStepInfos:(id)a4 withPointCount:(unint64_t)a5;
+ (double)_buildPointSectionsInCollection:(id)a3 pointRange:(_NSRange)a4 stepIndex:(unint64_t)a5 transitLineColor:(id)a6 startDistance:(double)a7 andCoordinates:(id)a8 fromSteps:(id)a9 andSegments:(id)a10;
+ (double)_buildPointSectionsInCollection:(id)a3 pointRange:(_NSRange)a4 stepIndex:(unint64_t)a5 transitLineColor:(id)a6 startDistance:(double)a7 coordinates:(id)a8 fromSteps:(id)a9 andSegments:(id)a10 andDecoderData:(id)a11;
+ (double)_totalDistanceForLegs:(id)a3;
+ (id)_buildArrivalStepInfoFromStep:(id)a3 withPointCount:(unint64_t)a4;
+ (id)_buildCoordinatesForData:(id)a3 andStepInfos:(id)a4 andCustodian:(id)a5 withWaypoints:(id)a6 andArrivalParameters:(id)a7 andCreateLegs:(id)a8;
+ (id)_buildExpandedWalkingStepInfosFromStep:(id)a3 andDecoderData:(id)a4 andPointData:(id)a5;
+ (id)_buildLegsFromSteps:(id)a3 segments:(id)a4 andCoordinates:(id)a5 andCustodian:(id)a6;
+ (id)_buildPointDataForGeometry:(id)a3 andCreatePointStarts:(id)a4;
+ (id)_buildPointSectionsFromSteps:(id)a3 andSegments:(id)a4 coordinates:(id)a5 andTransitLineColor:(id)a6;
+ (id)_buildSegmentsForGeometry:(id)a3 andStepCount:(unint64_t)a4 andPointCount:(unint64_t)a5 andCustodian:(id)a6;
+ (id)_buildStepInfosFromSteps:(id)a3 withDecoderData:(id)a4 andIsWalkingOnlyRoute:(BOOL)a5 andBuildPointData:(id)a6;
+ (id)_buildStepsForGeometry:(id)a3 andPointStarts:(id)a4 andStopCount:(unint64_t)a5 andLine:(id)a6 andCustodian:(id)a7;
+ (id)_buildStepsForStepInfos:(id)a3 andCustodian:(id)a4 andDecoderData:(id)a5 andSuggestedRoute:(id)a6 andLegs:(id)a7 andPointCount:(unint64_t)a8 andRideSelections:(id)a9 andSectionOptions:(id)a10 andCreateSegments:(id)a11 andUpdateTripCount:(unint64_t *)a12;
+ (id)_buildTransitStepInfoFromStep:(id)a3 withPreviousStep:(id)a4 andNextStep:(id)a5 andDecoderData:(id)a6 andPointData:(id)a7;
+ (id)_sectionForSteps:(id)a3 withIndex:(unint64_t)a4 andSegment:(id)a5 withIndex:(unint64_t)a6 andCoordinates:(id)a7 andPointRange:(_NSRange)a8 andBounds:(id *)a9 andTransitLineColor:(id)a10 andStartDistance:(double)a11 andDecoderData:(id)a12;
+ (id)_sectionOptionForTripIndex:(unint64_t)a3 andSectionOptions:(id)a4;
+ (id)_segmentForSteps:(id)a3 withRange:(_NSRange)a4 segmentIndex:(unint64_t)a5 andCustodian:(id)a6 andDecoderData:(id)a7 andSuggestedRoute:(id)a8 andRideSelections:(id)a9 andSectionOptions:(id)a10 andUpdateTripCount:(unint64_t *)a11;
+ (id)_stepForStepInfoAtIndex:(unint64_t)a3 andStepInfos:(id)a4 andSteps:(id)a5 andCustodian:(id)a6 withDecoderData:(id)a7 andSuggestedRoute:(id)a8 andPointCount:(unint64_t)a9;
+ (id)_walkingStepForStepInfo:(id)a3 withValidPointRange:(_NSRange)a4 andStepCount:(unint64_t)a5 andCustodian:(id)a6 andDecoderData:(id)a7 andSuggestedRoute:(id)a8;
+ (id)buildRouteSectionsForSuggestedRoute:(id)a3 fromSteps:(id)a4 andSegments:(id)a5 andCoordinates:(id)a6 andDecoderData:(id)a7;
+ (id)optionsForRideSelections:(id)a3 forSuggestionRoute:(id)a4;
+ (id)outputForGeometry:(id)a3 andLine:(id)a4 andStops:(id)a5 andCustodian:(id)a6;
+ (id)outputForSuggestedRoute:(id)a3 withDecoderData:(id)a4 andWaypoints:(id)a5 andArrivalParameters:(id)a6 andCustodian:(id)a7;
+ (id)outputForSuggestedRoute:(id)a3 withDecoderData:(id)a4 andWaypoints:(id)a5 andArrivalParameters:(id)a6 andCustodian:(id)a7 andRideSelections:(id)a8 andSectionOptions:(id)a9;
+ (id)selectionsForSuggestedRoute:(id)a3;
+ (unint64_t)_stepCountForSegmentWithStartingStepIndex:(unint64_t)a3 andStepInfos:(id)a4;
+ (void)preprocessClusteredSuggestedRoute:(id)a3 withSectionOptions:(id)a4 andRideSelections:(id)a5 andDecoderData:(id)a6;
@end

@implementation GEOTransitRouteBuilder

+ (id)outputForSuggestedRoute:(id)a3 withDecoderData:(id)a4 andWaypoints:(id)a5 andArrivalParameters:(id)a6 andCustodian:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v15)
  {
    if ([v11 sectionOptionsCount])
    {
      uint64_t v16 = +[GEOTransitRouteBuilder selectionsForSuggestedRoute:v11];
      +[GEOTransitRouteBuilder optionsForRideSelections:v16 forSuggestionRoute:v11];
      v18 = v17 = (void *)v16;
      +[GEOTransitRouteBuilder preprocessClusteredSuggestedRoute:withSectionOptions:andRideSelections:andDecoderData:](GEOTransitRouteBuilder, "preprocessClusteredSuggestedRoute:withSectionOptions:andRideSelections:andDecoderData:", v11);
    }
    else
    {
      v17 = 0;
      v18 = 0;
    }
    v19 = +[GEOTransitRouteBuilder outputForSuggestedRoute:v11 withDecoderData:v12 andWaypoints:v13 andArrivalParameters:v14 andCustodian:v15 andRideSelections:v17 andSectionOptions:v18];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: custodian != nullptr", buf, 2u);
    }
    v19 = 0;
  }

  return v19;
}

+ (id)outputForSuggestedRoute:(id)a3 withDecoderData:(id)a4 andWaypoints:(id)a5 andArrivalParameters:(id)a6 andCustodian:(id)a7 andRideSelections:(id)a8 andSectionOptions:(id)a9
{
  id v49 = a3;
  id v48 = a4;
  id v47 = a5;
  id v44 = a6;
  id v46 = a7;
  id v14 = a8;
  id v15 = a9;
  v41 = v15;
  v42 = v14;
  uint64_t v16 = objc_alloc_init(GEOTransitRouteBuilderOutput);
  v17 = GEOGetGEORouteBuilderLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188D96000, v17, OS_LOG_TYPE_INFO, "generating output for suggestedroute", buf, 2u);
  }

  [(GEOTransitRouteBuilderOutput *)v16 setRideSelections:v14];
  [(GEOTransitRouteBuilderOutput *)v16 setSectionOptions:v15];
  uint64_t v51 = 0;
  -[GEOTransitRouteBuilderOutput setIsWalkingOnlyRoute:](v16, "setIsWalkingOnlyRoute:", [v49 isWalkingOnlyRoute]);
  id v43 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  v18 = [v49 steps];
  v19 = +[GEOTransitRouteBuilder _buildStepInfosFromSteps:v18 withDecoderData:v48 andIsWalkingOnlyRoute:[(GEOTransitRouteBuilderOutput *)v16 isWalkingOnlyRoute] andBuildPointData:v43];

  v45 = v19;
  if (![v19 count] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v50 = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: stepInfos.count > 0", v50, 2u);
  }
  v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v47, "count") - 1);
  v40 = +[GEOTransitRouteBuilder _buildCoordinatesForData:v43 andStepInfos:v19 andCustodian:v46 withWaypoints:v47 andArrivalParameters:v44 andCreateLegs:v20];
  [(GEORouteBuilderOutput *)v16 setCoordinatesArray:v40];
  [(GEORouteBuilderOutput *)v16 setLegs:v20];
  id v21 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v22 = [v49 steps];
  v23 = objc_msgSend(v21, "initWithCapacity:", objc_msgSend(v22, "count"));

  v24 = [(GEORouteBuilderOutput *)v16 legs];
  v25 = [(GEORouteBuilderOutput *)v16 coordinatesArray];
  uint64_t v26 = [v25 coordinateCount];
  v27 = [(GEOTransitRouteBuilderOutput *)v16 rideSelections];
  v28 = [(GEOTransitRouteBuilderOutput *)v16 sectionOptions];
  v29 = +[GEOTransitRouteBuilder _buildStepsForStepInfos:v45 andCustodian:v46 andDecoderData:v48 andSuggestedRoute:v49 andLegs:v24 andPointCount:v26 andRideSelections:v27 andSectionOptions:v28 andCreateSegments:v23 andUpdateTripCount:&v51];
  [(GEORouteBuilderOutput *)v16 setSteps:v29];

  [(GEORouteBuilderOutput *)v16 setSegments:v23];
  uint64_t v30 = [v23 count];
  v31 = [v20 firstObject];
  objc_msgSend(v31, "setSegmentRange:", 0, v30);

  v32 = [(GEORouteBuilderOutput *)v16 steps];
  v33 = [(GEORouteBuilderOutput *)v16 segments];
  v34 = [(GEORouteBuilderOutput *)v16 coordinatesArray];
  v35 = +[GEOTransitRouteBuilder buildRouteSectionsForSuggestedRoute:v49 fromSteps:v32 andSegments:v33 andCoordinates:v34 andDecoderData:v48];
  [(GEORouteBuilderOutput *)v16 setPointSections:v35];

  v36 = [(GEORouteBuilderOutput *)v16 legs];
  +[GEOTransitRouteBuilder _totalDistanceForLegs:v36];
  -[GEORouteBuilderOutput setDistance:](v16, "setDistance:");

  v37 = [(GEORouteBuilderOutput *)v16 pointSections];
  v38 = +[GEORouteBuilder buildMapRegionFromPointSections:v37];
  [(GEORouteBuilderOutput *)v16 setBoundingMapRegion:v38];

  return v16;
}

+ (id)selectionsForSuggestedRoute:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v5 = [v3 sectionOptions];
    v6 = [v5 objectAtIndex:0];

    if (v6)
    {
      do
      {
        uint64_t v7 = [v6 defaultSectionIndex];
        v8 = [NSNumber numberWithUnsignedInteger:v7];
        [v4 addObject:v8];

        uint64_t v9 = [v3 nextOptionForOption:v6 withRideIndex:v7];

        v6 = (void *)v9;
      }
      while (v9);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: route != nullptr", v11, 2u);
    }
    id v4 = 0;
  }

  return v4;
}

+ (id)optionsForRideSelections:(id)a3 forSuggestionRoute:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (!v5)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
LABEL_12:
      id v8 = 0;
      goto LABEL_6;
    }
    __int16 v20 = 0;
    uint64_t v16 = MEMORY[0x1E4F14500];
    v17 = "Assertion failed: rideSelections != nullptr";
    v18 = (uint8_t *)&v20;
LABEL_14:
    _os_log_fault_impl(&dword_188D96000, v16, OS_LOG_TYPE_FAULT, v17, v18, 2u);
    goto LABEL_12;
  }
  if (!v6)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_12;
    }
    __int16 v19 = 0;
    uint64_t v16 = MEMORY[0x1E4F14500];
    v17 = "Assertion failed: route != nullptr";
    v18 = (uint8_t *)&v19;
    goto LABEL_14;
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v9 = [v7 sectionOptions];
  v10 = [v9 objectAtIndex:0];

  if (v10)
  {
    uint64_t v11 = 0;
    do
    {
      id v12 = [v5 objectAtIndexedSubscript:v11];
      uint64_t v13 = [v12 unsignedIntegerValue];

      [v8 addObject:v10];
      uint64_t v14 = [v7 nextOptionForOption:v10 withRideIndex:v13];

      ++v11;
      v10 = (void *)v14;
    }
    while (v14);
  }
LABEL_6:

  return v8;
}

+ (id)_sectionOptionForTripIndex:(unint64_t)a3 andSectionOptions:(id)a4
{
  id v5 = a4;
  if ([v5 count] <= a3)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [v5 objectAtIndexedSubscript:a3];
  }

  return v6;
}

+ (void)preprocessClusteredSuggestedRoute:(id)a3 withSectionOptions:(id)a4 andRideSelections:(id)a5 andDecoderData:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v34 = a5;
  id v11 = a6;
  id v12 = v11;
  v35 = v9;
  if (!v9)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_39;
    }
    __int16 v39 = 0;
    uint64_t v30 = MEMORY[0x1E4F14500];
    v31 = "Assertion failed: route != nullptr";
    v32 = (uint8_t *)&v39;
LABEL_48:
    _os_log_fault_impl(&dword_188D96000, v30, OS_LOG_TYPE_FAULT, v31, v32, 2u);
    goto LABEL_39;
  }
  if (!v10)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_39;
    }
    __int16 v38 = 0;
    uint64_t v30 = MEMORY[0x1E4F14500];
    v31 = "Assertion failed: options != nullptr";
    v32 = (uint8_t *)&v38;
    goto LABEL_48;
  }
  if (!v34)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_39;
    }
    __int16 v37 = 0;
    uint64_t v30 = MEMORY[0x1E4F14500];
    v31 = "Assertion failed: rideSelections != nullptr";
    v32 = (uint8_t *)&v37;
    goto LABEL_48;
  }
  if (!v11)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_39;
    }
    *(_WORD *)buf = 0;
    uint64_t v30 = MEMORY[0x1E4F14500];
    v31 = "Assertion failed: decoderData != nullptr";
    v32 = buf;
    goto LABEL_48;
  }
  id v33 = v10;
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v14 = +[GEOTransitRouteBuilder _sectionOptionForTripIndex:0 andSectionOptions:v10];
  if (!v14) {
    goto LABEL_38;
  }
  uint64_t v15 = 0;
  do
  {
    uint64_t v16 = [v34 objectAtIndexedSubscript:v15];
    unint64_t v17 = [v16 unsignedIntegerValue];

    if (v17 >= [v14 sectionsCount]) {
      unsigned int v18 = [v14 defaultSectionIndex];
    }
    else {
      unsigned int v18 = [v14 sectionAtIndex:v17];
    }
    if ([v35 sectionsCount] <= (unint64_t)v18)
    {
      __int16 v19 = 0;
    }
    else
    {
      __int16 v19 = objc_msgSend(v35, "sectionAtIndex:");
    }
    for (unint64_t i = 0; i < [v19 stepIndexsCount]; ++i)
    {
      unsigned int v21 = [v19 stepIndexAtIndex:i];
      v22 = [v12 steps];
      if ([v22 count] <= (unint64_t)v21)
      {

        v24 = 0;
        if (i) {
          goto LABEL_29;
        }
LABEL_21:
        if ([v24 maneuverType] == 3
          || [v24 maneuverType] == 4
          || [v24 maneuverType] == 9
          || [v24 maneuverType] == 5)
        {
          uint64_t v25 = [v24 maneuverType];
          if (v25 >= 0xB)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v25);
            uint64_t v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            uint64_t v26 = off_1E53F5D50[(int)v25];
          }
          NSLog(&cfstr_Directionsresp_6.isa, v26);
        }
        goto LABEL_29;
      }
      v23 = [v12 steps];
      v24 = [v23 objectAtIndex:v21];

      if (v24) {
        [v13 addObject:v24];
      }
      if (!i) {
        goto LABEL_21;
      }
LABEL_29:
      if (i == [v19 stepIndexsCount] - 1
        && [v24 maneuverType] != 5
        && [v24 maneuverType] != 10)
      {
        uint64_t v27 = [v24 maneuverType];
        if (v27 >= 0xB)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v27);
          v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v28 = off_1E53F5D50[(int)v27];
        }
        NSLog(&cfstr_Directionsresp_7.isa, v28);
      }
    }
    uint64_t v29 = +[GEOTransitRouteBuilder _sectionOptionForTripIndex:++v15 andSectionOptions:v33];

    uint64_t v14 = (void *)v29;
  }
  while (v29);
LABEL_38:
  [v35 setSteps:v13];

  id v10 = v33;
LABEL_39:
}

+ (id)_buildStepInfosFromSteps:(id)a3 withDecoderData:(id)a4 andIsWalkingOnlyRoute:(BOOL)a5 andBuildPointData:(id)a6
{
  BOOL v7 = a5;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v32 = a4;
  id v34 = a6;
  v31 = v9;
  if (![v9 count])
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_41;
    }
    *(_WORD *)buf = 0;
    v28 = MEMORY[0x1E4F14500];
    uint64_t v29 = "Assertion failed: steps.count > 0";
LABEL_46:
    _os_log_fault_impl(&dword_188D96000, v28, OS_LOG_TYPE_FAULT, v29, buf, 2u);
    goto LABEL_41;
  }
  if (!v34)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_41;
    }
    *(_WORD *)buf = 0;
    v28 = MEMORY[0x1E4F14500];
    uint64_t v29 = "Assertion failed: mutablePointData != nullptr";
    goto LABEL_46;
  }
  if (![v9 count])
  {
LABEL_41:
    id v33 = 0;
    goto LABEL_42;
  }
  id v33 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v9, "count"));
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v11)
  {
    uint64_t v12 = 0;
    id v13 = 0;
    uint64_t v14 = *(void *)v40;
    while (1)
    {
      uint64_t v15 = 0;
      uint64_t v16 = v13;
      do
      {
        if (*(void *)v40 != v14) {
          objc_enumerationMutation(v10);
        }
        unint64_t v17 = *(void **)(*((void *)&v39 + 1) + 8 * v15);
        if (v12 + v15 >= (unint64_t)([v10 count] - 1))
        {
          unsigned int v18 = 0;
        }
        else
        {
          unsigned int v18 = [v10 objectAtIndexedSubscript:v12 + v15 + 1];
        }
        unint64_t v19 = +[GEOPointUtility pointCount:v34 usesZilch:1];
        int v20 = [v17 maneuverType];
        if ((v20 - 3) < 7)
        {
          if (v7) {
            goto LABEL_23;
          }
          unsigned int v21 = +[GEOTransitRouteBuilder _buildTransitStepInfoFromStep:v17 withPreviousStep:v16 andNextStep:v18 andDecoderData:v32 andPointData:v34];
          if (v21) {
LABEL_15:
          }
            [v33 addObject:v21];
LABEL_22:

          goto LABEL_23;
        }
        if (v20 == 2)
        {
          unsigned int v21 = +[GEOTransitRouteBuilder _buildExpandedWalkingStepInfosFromStep:v17 andDecoderData:v32 andPointData:v34];
          [v33 addObjectsFromArray:v21];
          goto LABEL_22;
        }
        if (v20 == 10 && !v7)
        {
          unsigned int v21 = +[GEOTransitRouteBuilder _buildArrivalStepInfoFromStep:v17 withPointCount:v19];
          if (v21) {
            goto LABEL_15;
          }
          goto LABEL_22;
        }
LABEL_23:
        id v13 = v17;

        ++v15;
        uint64_t v16 = v13;
      }
      while (v11 != v15);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v39 objects:v45 count:16];
      v12 += v15;
      if (!v11) {
        goto LABEL_27;
      }
    }
  }
  id v13 = 0;
LABEL_27:

  if (![v33 count] && v7)
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v22 = v10;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v35 objects:v44 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v36 != v24) {
            objc_enumerationMutation(v22);
          }
          uint64_t v26 = *(void *)(*((void *)&v35 + 1) + 8 * i);
          uint64_t v27 = objc_alloc_init(_GEOTransitRouteStepInfo);
          [(_GEOTransitRouteStepInfo *)v27 setRouteSegmentType:2];
          [(_GEOTransitRouteStepInfo *)v27 setTransitStep:v26];
          [v33 addObject:v27];
        }
        uint64_t v23 = [v22 countByEnumeratingWithState:&v35 objects:v44 count:16];
      }
      while (v23);
    }
  }
LABEL_42:

  return v33;
}

+ (id)_buildTransitStepInfoFromStep:(id)a3 withPreviousStep:(id)a4 andNextStep:(id)a5 andDecoderData:(id)a6 andPointData:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = v15;
  if (!v11)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_34;
    }
    __int16 v36 = 0;
    v31 = MEMORY[0x1E4F14500];
    id v32 = "Assertion failed: step != nullptr";
    id v33 = (uint8_t *)&v36;
LABEL_36:
    _os_log_fault_impl(&dword_188D96000, v31, OS_LOG_TYPE_FAULT, v32, v33, 2u);
    goto LABEL_34;
  }
  if (!v14)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_34;
    }
    __int16 v35 = 0;
    v31 = MEMORY[0x1E4F14500];
    id v32 = "Assertion failed: decoderData != nullptr";
    id v33 = (uint8_t *)&v35;
    goto LABEL_36;
  }
  if (v15)
  {
    BOOL v17 = v13
       && [v12 maneuverType] == 4
       && [v11 maneuverType] == 4;
    if ([v11 hasZilchIndex])
    {
      unsigned int v18 = [v11 zilchIndex];
      if ([v14 zilchPointsCount] <= (unint64_t)v18) {
        goto LABEL_18;
      }
      unsigned int v19 = [v11 zilchIndex];
    }
    else
    {
      if (![v11 hasAccessPointZilchIndex]) {
        goto LABEL_18;
      }
      unsigned int v20 = [v11 accessPointZilchIndex];
      if ([v14 zilchPointsCount] <= (unint64_t)v20) {
        goto LABEL_18;
      }
      unsigned int v19 = [v11 accessPointZilchIndex];
    }
    unsigned int v21 = [v14 zilchPointsAtIndex:v19];
    if (v21)
    {
      id v22 = +[GEOPointUtility unpackPoints:v21 usesZilch:1];

      if (+[GEOPointUtility pointCount:v22 usesZilch:1] != 1
        || [v11 maneuverType] != 6)
      {
LABEL_19:
        uint64_t v23 = +[GEOTransitRouteBuilder _appendPointData:v22 toPointData:v16 withContinuity:v17];
        uint64_t v25 = v24;
        if (v24) {
          uint64_t v26 = v23;
        }
        else {
          uint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
        }
        if (v13)
        {
          int v27 = [v13 startingTime];
          uint64_t v28 = v27 - [v11 startingTime];
        }
        else
        {
          uint64_t v28 = 0;
        }
        uint64_t v29 = objc_alloc_init(_GEOTransitRouteStepInfo);
        -[_GEOTransitRouteStepInfo setRouteSegmentType:](v29, "setRouteSegmentType:", [v11 segmentTypeForManeuver]);
        -[_GEOTransitRouteStepInfo setPointRange:](v29, "setPointRange:", v26, v25);
        [(_GEOTransitRouteStepInfo *)v29 setTransitStep:v11];
        [(_GEOTransitRouteStepInfo *)v29 setDuration:v28];

        goto LABEL_26;
      }
    }
LABEL_18:
    id v22 = 0;
    goto LABEL_19;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    __int16 v34 = 0;
    v31 = MEMORY[0x1E4F14500];
    id v32 = "Assertion failed: mutablePointData != nullptr";
    id v33 = (uint8_t *)&v34;
    goto LABEL_36;
  }
LABEL_34:
  uint64_t v29 = 0;
LABEL_26:

  return v29;
}

+ (id)_buildExpandedWalkingStepInfosFromStep:(id)a3 andDecoderData:(id)a4 andPointData:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v27 = a4;
  id v8 = a5;
  uint64_t v29 = v7;
  if (!v7)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_30;
    }
    *(_WORD *)buf = 0;
    id v22 = MEMORY[0x1E4F14500];
    uint64_t v23 = "Assertion failed: step != nullptr";
LABEL_29:
    _os_log_fault_impl(&dword_188D96000, v22, OS_LOG_TYPE_FAULT, v23, buf, 2u);
    goto LABEL_30;
  }
  if ([v7 maneuverType] != 2)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_30;
    }
    *(_WORD *)buf = 0;
    id v22 = MEMORY[0x1E4F14500];
    uint64_t v23 = "Assertion failed: step.maneuverType == GEOPBTransitManeuver_WALK";
    goto LABEL_29;
  }
  if (!v27)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_30;
    }
    *(_WORD *)buf = 0;
    id v22 = MEMORY[0x1E4F14500];
    uint64_t v23 = "Assertion failed: decoderData != nullptr";
    goto LABEL_29;
  }
  if (!v8)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_30;
    }
    *(_WORD *)buf = 0;
    id v22 = MEMORY[0x1E4F14500];
    uint64_t v23 = "Assertion failed: mutablePointData != nullptr";
    goto LABEL_29;
  }
  if ([v7 maneuverType] != 2)
  {
LABEL_30:
    id v30 = 0;
    goto LABEL_31;
  }
  id v30 = [MEMORY[0x1E4F1CA48] array];
  if ([v7 hasWalkingIndex])
  {
    id v25 = v8;
    uint64_t v26 = objc_msgSend(v27, "walkingAtIndex:", objc_msgSend(v7, "walkingIndex"));
    if (([v26 hasUnpackedLatLngVertices] & 1) == 0) {
      [v26 unpackLatLngVertices];
    }
    id v9 = [v26 unpackedLatLngVertices];
    uint64_t v10 = +[GEOTransitRouteBuilder _appendPointData:v9 toPointData:v8 withContinuity:0];

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obj = [v26 steps];
    uint64_t v11 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v11)
    {
      uint64_t v12 = 0;
      uint64_t v13 = *(void *)v32;
      do
      {
        uint64_t v14 = 0;
        uint64_t v15 = v12;
        do
        {
          if (*(void *)v32 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void **)(*((void *)&v31 + 1) + 8 * v14);
          unsigned int v17 = [v16 maneuverEndIndex];
          unsigned int v18 = [v16 maneuverStartIndex];
          unsigned int v19 = [v16 maneuverEndIndex];
          unsigned int v20 = objc_alloc_init(_GEOTransitRouteStepInfo);
          [(_GEOTransitRouteStepInfo *)v20 setRouteSegmentType:2];
          [(_GEOTransitRouteStepInfo *)v20 setWalkingStep:v16];
          [(_GEOTransitRouteStepInfo *)v20 setTransitStep:v29];
          uint64_t v12 = v17;
          -[_GEOTransitRouteStepInfo setPointRange:](v20, "setPointRange:", v15 + v10, v17 - v15 + 1);
          -[_GEOTransitRouteStepInfo setManeuverPointRange:](v20, "setManeuverPointRange:", v10 + v18, v19 - (unint64_t)v18 + 1);
          [v30 addObject:v20];

          ++v14;
          uint64_t v15 = v17;
        }
        while (v11 != v14);
        uint64_t v11 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v11);
    }

    id v8 = v25;
  }
  else
  {
    unsigned int v21 = objc_alloc_init(_GEOTransitRouteStepInfo);
    [(_GEOTransitRouteStepInfo *)v21 setRouteSegmentType:2];
    [(_GEOTransitRouteStepInfo *)v21 setTransitStep:v7];
    -[_GEOTransitRouteStepInfo setPointRange:](v21, "setPointRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
    [v30 addObject:v21];
  }
  if (![v30 count] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: stepInfos.count > 0", buf, 2u);
  }
LABEL_31:

  return v30;
}

+ (id)_buildArrivalStepInfoFromStep:(id)a3 withPointCount:(unint64_t)a4
{
  id v5 = a3;
  id v6 = v5;
  if (!v5)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_11;
    }
    __int16 v14 = 0;
    id v8 = MEMORY[0x1E4F14500];
    id v9 = "Assertion failed: step != nullptr";
    uint64_t v10 = (uint8_t *)&v14;
LABEL_16:
    _os_log_fault_impl(&dword_188D96000, v8, OS_LOG_TYPE_FAULT, v9, v10, 2u);
    goto LABEL_11;
  }
  if ([v5 maneuverType] != 10)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_11;
    }
    __int16 v13 = 0;
    id v8 = MEMORY[0x1E4F14500];
    id v9 = "Assertion failed: step.maneuverType == GEOPBTransitManeuver_ARRIVE_AT_DESTINATION";
    uint64_t v10 = (uint8_t *)&v13;
    goto LABEL_16;
  }
  if (!a4)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_11;
    }
    __int16 v12 = 0;
    id v8 = MEMORY[0x1E4F14500];
    id v9 = "Assertion failed: pointCount > 0";
    uint64_t v10 = (uint8_t *)&v12;
    goto LABEL_16;
  }
  if ([v6 maneuverType] == 10)
  {
    id v7 = objc_alloc_init(_GEOTransitRouteStepInfo);
    [(_GEOTransitRouteStepInfo *)v7 setRouteSegmentType:2];
    [(_GEOTransitRouteStepInfo *)v7 setTransitStep:v6];
    -[_GEOTransitRouteStepInfo setPointRange:](v7, "setPointRange:", a4 - 1, 1);
    goto LABEL_12;
  }
LABEL_11:
  id v7 = 0;
LABEL_12:

  return v7;
}

+ (_NSRange)_appendPointData:(id)a3 toPointData:(id)a4 withContinuity:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    unint64_t v9 = +[GEOPointUtility pointCount:v8 usesZilch:1];
    unint64_t v10 = +[GEOPointUtility pointCount:v7 usesZilch:1];
    if (v7)
    {
      if (v9)
      {
        unint64_t v11 = v9 - 1;
        +[GEOPointUtility pointAt:v9 - 1 pointData:v8 usesZilch:1];
        double v13 = v12;
        double v15 = v14;
        +[GEOPointUtility pointAt:0 pointData:v7 usesZilch:1];
        if (v13 == v17 && v15 == v16)
        {
          uint64_t v19 = +[GEOPointUtility subdataFromPointData:v7 fromPointIndex:1 usesZilch:1];

          id v7 = (id)v19;
          unint64_t v9 = v11;
        }
        else
        {
          v10 += v5;
          if (v5) {
            --v9;
          }
        }
      }
      [v8 appendData:v7];
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)id v22 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: mutablePointData != nullptr", v22, 2u);
    }
    unint64_t v10 = 0;
    unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  }

  NSUInteger v20 = v9;
  NSUInteger v21 = v10;
  result.length = v21;
  result.location = v20;
  return result;
}

+ (id)_buildCoordinatesForData:(id)a3 andStepInfos:(id)a4 andCustodian:(id)a5 withWaypoints:(id)a6 andArrivalParameters:(id)a7 andCreateLegs:(id)a8
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v46 = a5;
  id v15 = a6;
  id v48 = a7;
  id v16 = a8;
  v45 = v13;
  id v47 = v15;
  if (!v13)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    long long v42 = MEMORY[0x1E4F14500];
    id v43 = "Assertion failed: pointData != nullptr";
LABEL_43:
    _os_log_fault_impl(&dword_188D96000, v42, OS_LOG_TYPE_FAULT, v43, buf, 2u);
    goto LABEL_9;
  }
  if (![v14 count])
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    long long v42 = MEMORY[0x1E4F14500];
    id v43 = "Assertion failed: stepInfos.count > 0";
    goto LABEL_43;
  }
  if ((unint64_t)[v15 count] <= 1)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    long long v42 = MEMORY[0x1E4F14500];
    id v43 = "Assertion failed: waypoints.count >= 2";
    goto LABEL_43;
  }
  if (!v16)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    long long v42 = MEMORY[0x1E4F14500];
    id v43 = "Assertion failed: legs != nullptr";
    goto LABEL_43;
  }
  if ([v16 count])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      long long v42 = MEMORY[0x1E4F14500];
      id v43 = "Assertion failed: legs.count == 0";
      goto LABEL_43;
    }
LABEL_9:
    double v17 = 0;
    goto LABEL_10;
  }
  if (![v14 count] || (unint64_t)objc_msgSend(v15, "count") < 2 || objc_msgSend(v16, "count")) {
    goto LABEL_9;
  }
  uint64_t v19 = [MEMORY[0x1E4F1CA48] array];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v20 = v14;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v53 objects:v60 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v54 != v22) {
          objc_enumerationMutation(v20);
        }
        uint64_t v24 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        [v24 distance];
        if (v25 != 0.0)
        {
          [v24 pointRange];
          if (v26 >= 2)
          {
            id v27 = objc_alloc_init(GEOComposedRouteLengthMarker);
            [(GEOComposedRouteLengthMarker *)v27 setPathIndex:0];
            uint64_t v28 = [v24 pointRange];
            [(GEOComposedRouteLengthMarker *)v27 setPointIndex:v29 + v28 - 1];
            [v24 distance];
            -[GEOComposedRouteLengthMarker setLength:](v27, "setLength:");
            [v19 addObject:v27];
          }
        }
      }
      uint64_t v21 = [v20 countByEnumeratingWithState:&v53 objects:v60 count:16];
    }
    while (v21);
  }

  id v30 = [GEOComposedRouteCoordinateArray alloc];
  id v59 = v13;
  long long v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v59 count:1];
  double v17 = [(GEOComposedRouteCoordinateArray *)v30 initWithPointData:v31 lengthMarkers:v19 usesZilch:1];

  long long v32 = [v47 firstObject];
  long long v33 = [v47 lastObject];
  long long v34 = [[GEOComposedRouteLeg alloc] initWithComposedRoute:v46 legIndex:0 origin:v32 destination:v33 arrivalParameters:v48];
  -[GEOComposedRouteLeg setPointRange:](v34, "setPointRange:", 0, [(GEOComposedRouteCoordinateArray *)v17 coordinateCount]);
  -[GEOComposedRouteLeg setStepRange:](v34, "setStepRange:", 0, [v20 count]);
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v35 = v20;
  uint64_t v36 = [v35 countByEnumeratingWithState:&v49 objects:v58 count:16];
  if (v36)
  {
    id v44 = v32;
    uint64_t v37 = *(void *)v50;
    double v38 = 0.0;
    do
    {
      for (uint64_t j = 0; j != v36; ++j)
      {
        if (*(void *)v50 != v37) {
          objc_enumerationMutation(v35);
        }
        [*(id *)(*((void *)&v49 + 1) + 8 * j) distance];
        double v38 = v38 + v40;
      }
      uint64_t v36 = [v35 countByEnumeratingWithState:&v49 objects:v58 count:16];
    }
    while (v36);
    double v41 = (double)v38;
    long long v32 = v44;
  }
  else
  {
    double v41 = 0.0;
  }

  [(GEOComposedRouteLeg *)v34 setDistance:v41];
  [v16 addObject:v34];

LABEL_10:

  return v17;
}

+ (double)_totalDistanceForLegs:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    double v6 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "distance", (void)v10);
        double v6 = v6 + v8;
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

+ (id)_buildStepsForStepInfos:(id)a3 andCustodian:(id)a4 andDecoderData:(id)a5 andSuggestedRoute:(id)a6 andLegs:(id)a7 andPointCount:(unint64_t)a8 andRideSelections:(id)a9 andSectionOptions:(id)a10 andCreateSegments:(id)a11 andUpdateTripCount:(unint64_t *)a12
{
  id v17 = a3;
  id v36 = a4;
  id v35 = a5;
  id v18 = a6;
  id v19 = a7;
  id v33 = a9;
  id v32 = a10;
  id v20 = a11;
  if (![v17 count])
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_8;
    }
    __int16 v40 = 0;
    uint64_t v29 = MEMORY[0x1E4F14500];
    id v30 = "Assertion failed: stepInfos.count > 0";
    long long v31 = (uint8_t *)&v40;
LABEL_30:
    _os_log_fault_impl(&dword_188D96000, v29, OS_LOG_TYPE_FAULT, v30, v31, 2u);
    goto LABEL_8;
  }
  if (!v36)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_8;
    }
    __int16 v39 = 0;
    uint64_t v29 = MEMORY[0x1E4F14500];
    id v30 = "Assertion failed: custodian != nullptr";
    long long v31 = (uint8_t *)&v39;
    goto LABEL_30;
  }
  if (!v20)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_8;
    }
    __int16 v38 = 0;
    uint64_t v29 = MEMORY[0x1E4F14500];
    id v30 = "Assertion failed: segments != nullptr";
    long long v31 = (uint8_t *)&v38;
    goto LABEL_30;
  }
  if ([v20 count])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v29 = MEMORY[0x1E4F14500];
      id v30 = "Assertion failed: segments.count == 0";
      long long v31 = buf;
      goto LABEL_30;
    }
LABEL_8:
    uint64_t v21 = 0;
    goto LABEL_9;
  }
  if (![v17 count] || !objc_msgSend(v19, "count") || objc_msgSend(v20, "count")) {
    goto LABEL_8;
  }
  uint64_t v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v17, "count"));
  unint64_t v23 = 0;
  long long v34 = v20;
  while (v23 < [v17 count])
  {
    unint64_t v24 = +[GEOTransitRouteBuilder _stepCountForSegmentWithStartingStepIndex:v23 andStepInfos:v17];
    unint64_t v25 = v24;
    unint64_t v26 = v23;
    if (v23 < v24 + v23)
    {
      do
      {
        id v27 = +[GEOTransitRouteBuilder _stepForStepInfoAtIndex:v26 andStepInfos:v17 andSteps:v21 andCustodian:v36 withDecoderData:v35 andSuggestedRoute:v18 andPointCount:a8];
        if (v27) {
          [v21 addObject:v27];
        }

        ++v26;
        --v25;
      }
      while (v25);
    }
    uint64_t v28 = +[GEOTransitRouteBuilder _segmentForSteps:withRange:segmentIndex:andCustodian:andDecoderData:andSuggestedRoute:andRideSelections:andSectionOptions:andUpdateTripCount:](GEOTransitRouteBuilder, "_segmentForSteps:withRange:segmentIndex:andCustodian:andDecoderData:andSuggestedRoute:andRideSelections:andSectionOptions:andUpdateTripCount:", v21, v23, v24, [v34 count], v36, v35, v18, v33, v32, a12);
    if (v28) {
      [v34 addObject:v28];
    }

    v23 += v24;
  }
  id v20 = v34;
LABEL_9:

  return v21;
}

+ (unint64_t)_stepCountForSegmentWithStartingStepIndex:(unint64_t)a3 andStepInfos:(id)a4
{
  id v5 = a4;
  double v6 = [v5 objectAtIndexedSubscript:a3];
  for (unint64_t i = a3 + 2; i - 1 < [v5 count]; ++i)
  {
    double v8 = [v5 objectAtIndexedSubscript:i - 1];
    uint64_t v9 = [v6 routeSegmentType];
    if (v9 != [v8 routeSegmentType]) {
      goto LABEL_8;
    }
    long long v10 = [v8 transitStep];
    int v11 = [v10 maneuverType];

    switch(v11)
    {
      case 3:
        goto LABEL_8;
      case 5:
        goto LABEL_9;
      case 9:
LABEL_8:
        --i;
LABEL_9:

        goto LABEL_11;
    }
  }
  --i;
LABEL_11:

  return i - a3;
}

+ (id)_stepForStepInfoAtIndex:(unint64_t)a3 andStepInfos:(id)a4 andSteps:(id)a5 andCustodian:(id)a6 withDecoderData:(id)a7 andSuggestedRoute:(id)a8 andPointCount:(unint64_t)a9
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v30 = a8;
  id v18 = [v14 objectAtIndexedSubscript:a3];
  uint64_t v19 = +[GEOTransitRouteBuilder _validPointRangeForStepInfoIndex:a3 andStepInfos:v14 withPointCount:a9];
  uint64_t v21 = v20;
  uint64_t v22 = [v15 count];
  uint64_t v23 = [v18 routeSegmentType];
  switch(v23)
  {
    case 2:
      unint64_t v25 = [v14 objectAtIndexedSubscript:a3];
      uint64_t v26 = +[GEOTransitRouteBuilder _walkingStepForStepInfo:withValidPointRange:andStepCount:andCustodian:andDecoderData:andSuggestedRoute:](GEOTransitRouteBuilder, "_walkingStepForStepInfo:withValidPointRange:andStepCount:andCustodian:andDecoderData:andSuggestedRoute:", v25, v19, v21, [v15 count], v16, v17, v30);
      goto LABEL_7;
    case 5:
      id v27 = [GEOComposedTransitStationRouteStep alloc];
      unint64_t v25 = [v18 transitStep];
      uint64_t v26 = -[GEOComposedTransitStationRouteStep initWithComposedRoute:decoderData:step:stepIndex:duration:pointRange:](v27, "initWithComposedRoute:decoderData:step:stepIndex:duration:pointRange:", v16, v17, v25, v22, [v18 duration], v19, v21);
      goto LABEL_7;
    case 6:
      unint64_t v24 = [GEOComposedTransitTripRouteStep alloc];
      unint64_t v25 = [v18 transitStep];
      uint64_t v26 = -[GEOComposedTransitTripRouteStep initWithComposedRoute:decoderData:step:stepIndex:duration:pointRange:](v24, "initWithComposedRoute:decoderData:step:stepIndex:duration:pointRange:", v16, v17, v25, v22, [v18 duration], v19, v21);
LABEL_7:
      uint64_t v28 = (void *)v26;

      goto LABEL_9;
  }
  uint64_t v28 = 0;
LABEL_9:

  return v28;
}

+ (_NSRange)_validPointRangeForStepInfoIndex:(unint64_t)a3 andStepInfos:(id)a4 withPointCount:(unint64_t)a5
{
  id v7 = a4;
  double v8 = [v7 objectAtIndexedSubscript:a3];
  uint64_t v10 = [v8 pointRange];
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    int v11 = [v8 transitStep];
    unsigned int v12 = [v11 maneuverType];

    if (v12 <= 7 && ((1 << v12) & 0xE4) != 0)
    {
      long long v13 = 0;
      do
      {
        if ((uint64_t)a3 <= 0)
        {
          uint64_t v10 = 0;
          goto LABEL_19;
        }
        id v14 = [v7 objectAtIndexedSubscript:--a3];

        long long v13 = v14;
      }
      while ([v14 pointRange] == 0x7FFFFFFFFFFFFFFFLL);
      id v15 = v14;
      if (v15)
      {
        long long v13 = v15;
        uint64_t v16 = [v15 pointRange];
        uint64_t v10 = v17 + v16 - 1;
        goto LABEL_9;
      }
      uint64_t v10 = 0;
    }
    else
    {
      long long v13 = 0;
      unint64_t v19 = a3 + 1;
      do
      {
        if (v19 >= [v7 count]) {
          goto LABEL_18;
        }
        uint64_t v20 = [v7 objectAtIndexedSubscript:v19];

        ++v19;
        long long v13 = v20;
      }
      while ([v20 pointRange] == 0x7FFFFFFFFFFFFFFFLL);
      id v21 = v20;
      long long v13 = v21;
      if (!v21)
      {
LABEL_18:
        uint64_t v10 = a5 - 1;
        goto LABEL_19;
      }
      uint64_t v10 = [v21 pointRange];
LABEL_9:

LABEL_19:
    }
    uint64_t v18 = 1;
  }
  else
  {
    uint64_t v18 = v9;
  }

  NSUInteger v22 = v10;
  NSUInteger v23 = v18;
  result.length = v23;
  result.location = v22;
  return result;
}

+ (id)_walkingStepForStepInfo:(id)a3 withValidPointRange:(_NSRange)a4 andStepCount:(unint64_t)a5 andCustodian:(id)a6 andDecoderData:(id)a7 andSuggestedRoute:(id)a8
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  id v54 = a8;
  id v15 = [v12 transitStep];
  if ([v15 maneuverType] != 2)
  {
    NSUInteger v23 = [v15 location];
    [v23 coordinate];
    double v25 = v24;
    double v27 = v26;

    uint64_t v28 = [GEOComposedTransitWalkingRouteStep alloc];
    unint64_t v19 = [v12 transitStep];
    uint64_t v22 = -[GEOComposedTransitWalkingRouteStep initWithComposedRoute:decoderData:transitStep:stepIndex:startCoordinate:endCoordinate:pointRange:](v28, "initWithComposedRoute:decoderData:transitStep:stepIndex:startCoordinate:endCoordinate:pointRange:", v13, v14, v19, a5, location, length, v25, v27, v25, v27);
    goto LABEL_5;
  }
  uint64_t v16 = [v12 transitStep];
  int v17 = [v16 hasWalkingIndex];

  if (v17)
  {
    uint64_t v18 = [GEOComposedTransitWalkingRouteStep alloc];
    unint64_t v19 = [v12 walkingStep];
    uint64_t v20 = [v12 maneuverPointRange];
    uint64_t v22 = -[GEOComposedTransitWalkingRouteStep initWithComposedRoute:decoderData:transitStep:stepIndex:geoStep:pointRange:maneuverPointRange:](v18, "initWithComposedRoute:decoderData:transitStep:stepIndex:geoStep:pointRange:maneuverPointRange:", v13, v14, v15, a5, v19, location, length, v20, v21);
LABEL_5:
    uint64_t v29 = (GEOComposedTransitWalkingRouteStep *)v22;
    goto LABEL_29;
  }
  id v30 = [v54 steps];
  unint64_t v31 = [v30 indexOfObject:v15];

  if ((v31 & 0x7FFFFFFFFFFFFFFFLL) != 0)
  {
    unint64_t v19 = [v54 stepsAtIndex:v31 - 1];
  }
  else
  {
    unint64_t v19 = 0;
  }
  if ([v19 maneuverType] != 8 && objc_msgSend(v19, "maneuverType") != 5)
  {
    if ([v19 maneuverType] == 1)
    {
      id v32 = [v19 location];
      [v32 coordinate];
      double v35 = v38;
      double v37 = v39;
      goto LABEL_15;
    }
LABEL_16:
    double v35 = -180.0;
    double v37 = -180.0;
    goto LABEL_17;
  }
  if (![v19 hasStartingStopIndex]) {
    goto LABEL_16;
  }
  id v32 = objc_msgSend(v14, "stopAtIndex:", objc_msgSend(v19, "startingStopIndex"));
  id v33 = [v32 latLng];
  [v33 coordinate];
  double v35 = v34;
  double v37 = v36;

LABEL_15:
LABEL_17:
  uint64_t v40 = [v54 stepsCount];
  double v41 = 0;
  if (v31 != 0x7FFFFFFFFFFFFFFELL && v31 < v40 - 1)
  {
    double v41 = objc_msgSend(v54, "stepsAtIndex:");
  }
  if ([v41 maneuverType] != 7 && objc_msgSend(v41, "maneuverType") != 3)
  {
    if ([v41 maneuverType] == 10)
    {
      long long v42 = [v41 location];
      [v42 coordinate];
      double v45 = v48;
      double v47 = v49;
      goto LABEL_26;
    }
LABEL_27:
    double v45 = -180.0;
    double v47 = -180.0;
    goto LABEL_28;
  }
  if (![v41 hasEndingStopIndex]) {
    goto LABEL_27;
  }
  long long v42 = objc_msgSend(v14, "stopAtIndex:", objc_msgSend(v41, "endingStopIndex"));
  id v43 = [v42 latLng];
  [v43 coordinate];
  double v45 = v44;
  double v47 = v46;

LABEL_26:
LABEL_28:
  long long v50 = [GEOComposedTransitWalkingRouteStep alloc];
  long long v51 = [v12 transitStep];
  uint64_t v29 = -[GEOComposedTransitWalkingRouteStep initWithComposedRoute:decoderData:transitStep:stepIndex:startCoordinate:endCoordinate:pointRange:](v50, "initWithComposedRoute:decoderData:transitStep:stepIndex:startCoordinate:endCoordinate:pointRange:", v13, v14, v51, a5, location, length, v35, v37, v45, v47);

LABEL_29:

  return v29;
}

+ (id)_segmentForSteps:(id)a3 withRange:(_NSRange)a4 segmentIndex:(unint64_t)a5 andCustodian:(id)a6 andDecoderData:(id)a7 andSuggestedRoute:(id)a8 andRideSelections:(id)a9 andSectionOptions:(id)a10 andUpdateTripCount:(unint64_t *)a11
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v15 = a3;
  id v47 = a6;
  id v46 = a7;
  id v48 = a8;
  id v16 = a9;
  id v17 = a10;
  double v45 = v15;
  uint64_t v18 = [v15 objectAtIndex:location];
  unint64_t v19 = [v15 objectAtIndex:length + location - 1];
  NSUInteger v20 = [v18 pointRange];
  NSUInteger v22 = v21;
  v51.NSUInteger location = [v19 pointRange];
  v51.NSUInteger length = v23;
  v50.NSUInteger location = v20;
  v50.NSUInteger length = v22;
  NSRange v24 = NSUnionRange(v50, v51);
  if ([v18 transportType] == 1)
  {
    id v42 = v17;
    id v43 = v16;
    id v25 = v18;
    id v26 = v19;
    double v27 = [v48 steps];
    uint64_t v28 = [v25 transitStep];
    uint64_t v29 = [v27 indexOfObject:v28];

    id v30 = [v48 steps];
    unint64_t v31 = [v26 transitStep];
    uint64_t v32 = [v30 indexOfObject:v31];

    uint64_t v33 = v32 - v29 + 1;
    id v17 = v42;
    id v16 = v43;
  }
  else
  {
    uint64_t v33 = 0;
    uint64_t v29 = 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v34 = [v18 routeSegmentType];
  switch(v34)
  {
    case 2:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v37 = v18;
        double v38 = v37;
        if (v37)
        {
          uint64_t v39 = [v37 stepIndex];
LABEL_16:
          uint64_t v40 = -[GEOComposedWalkingRouteSegment initWithComposedRoute:stepRange:pointRange:segmentIndex:transitIncidentMessageStepIndex:]([GEOComposedWalkingRouteSegment alloc], "initWithComposedRoute:stepRange:pointRange:segmentIndex:transitIncidentMessageStepIndex:", v47, location, length, v24.location, v24.length, a5, v39);

          goto LABEL_17;
        }
      }
      else
      {
        double v38 = 0;
      }
      uint64_t v39 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_16;
    case 5:
      double v36 = -[GEOComposedTransitStationRouteSegment initWithComposedRoute:decoderData:stepRange:transitStepRange:pointRange:segmentIndex:]([GEOComposedTransitStationRouteSegment alloc], "initWithComposedRoute:decoderData:stepRange:transitStepRange:pointRange:segmentIndex:", v47, v46, location, length, v29, v33, v24.location, v24.length, a5);
      goto LABEL_12;
    case 6:
      unint64_t v35 = (*a11)++;
      double v36 = -[GEOComposedTransitTripRouteSegment initWithComposedRoute:rideSelections:sectionOptions:decoderData:tripIndex:stepRange:transitStepRange:pointRange:segmentIndex:]([GEOComposedTransitTripRouteSegment alloc], "initWithComposedRoute:rideSelections:sectionOptions:decoderData:tripIndex:stepRange:transitStepRange:pointRange:segmentIndex:", v47, v16, v17, v46, v35, location, length, v29, v33, v24.location, v24.length, a5);
LABEL_12:
      uint64_t v40 = (GEOComposedWalkingRouteSegment *)v36;
      goto LABEL_17;
  }
  uint64_t v40 = 0;
LABEL_17:

  return v40;
}

+ (id)buildRouteSectionsForSuggestedRoute:(id)a3 fromSteps:(id)a4 andSegments:(id)a5 andCoordinates:(id)a6 andDecoderData:(id)a7
{
  id v11 = a3;
  id v34 = a4;
  id v33 = a5;
  id v12 = a6;
  id v32 = a7;
  if ((unint64_t)[v12 coordinateCount] < 2)
  {
    id v13 = 0;
    goto LABEL_23;
  }
  id v30 = v11;
  id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unsigned int v14 = 0;
  int v15 = 0;
  id v16 = 0;
  id v17 = 0;
  uint64_t v18 = 0;
  unint64_t v19 = 0;
  double v20 = 0.0;
  while (v19 < [v34 count])
  {
    if (v18) {

    }
    else {
      uint64_t v18 = v17;
    }
    NSUInteger v21 = [v34 objectAtIndex:v19];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & (v18 == 0)) == 1)
      {
        NSUInteger v23 = [v21 nextBoardingStep];
        uint64_t v18 = [v23 transitLine];
        uint64_t v25 = [v18 lineColorString];
        goto LABEL_16;
      }
      uint64_t v24 = 0;
      NSUInteger v23 = v18;
      uint64_t v18 = 0;
LABEL_17:

      goto LABEL_18;
    }
    int v22 = [v21 maneuver];
    if (v22 == 3)
    {
      NSUInteger v23 = [v21 transitLine];
      uint64_t v25 = [v23 lineColorString];
LABEL_16:
      id v26 = (void *)v25;

      uint64_t v24 = 0;
      uint64_t v18 = v26;
      goto LABEL_17;
    }
    if (v22 == 9)
    {
      NSUInteger v23 = [v21 transitLine];
      uint64_t v24 = [v23 lineColorString];
      goto LABEL_17;
    }
    uint64_t v24 = 0;
LABEL_18:
    if (+[GEOTransitRouteBuilder _shouldBreakPointSectionAtStep:v21 previousStep:v16])
    {
      +[GEOTransitRouteBuilder _buildPointSectionsInCollection:pointRange:stepIndex:transitLineColor:startDistance:coordinates:fromSteps:andSegments:andDecoderData:](GEOTransitRouteBuilder, "_buildPointSectionsInCollection:pointRange:stepIndex:transitLineColor:startDistance:coordinates:fromSteps:andSegments:andDecoderData:", v31, v14, v15 - v14 + 1, v19 - (v19 != 0), v18, v12, v20, v34, v33, v32);
      double v28 = v27;
      unsigned int v14 = [v21 startPointIndex];
      double v20 = v20 + v28;
    }
    int v15 = [v21 endPointIndex];

    ++v19;
    id v16 = v21;
    id v17 = v18;
    uint64_t v18 = (void *)v24;
  }
  +[GEOTransitRouteBuilder _buildPointSectionsInCollection:pointRange:stepIndex:transitLineColor:startDistance:coordinates:fromSteps:andSegments:andDecoderData:](GEOTransitRouteBuilder, "_buildPointSectionsInCollection:pointRange:stepIndex:transitLineColor:startDistance:coordinates:fromSteps:andSegments:andDecoderData:", v31, v14, v15 - v14 + 1, v19 - 1, v17, v12, v20, v34, v33, v32);
  id v13 = v31;

  id v11 = v30;
LABEL_23:

  return v13;
}

+ (BOOL)_shouldBreakPointSectionAtStep:(id)a3 previousStep:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v9 = 1;
  if ([v5 transportType] != 1)
  {
    if (!v6
      || (int v7 = [v6 transportType], v7 == objc_msgSend(v5, "transportType"))
      && (unsigned int v8 = [v5 startPointIndex], v8 <= objc_msgSend(v6, "endPointIndex")))
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

+ (double)_buildPointSectionsInCollection:(id)a3 pointRange:(_NSRange)a4 stepIndex:(unint64_t)a5 transitLineColor:(id)a6 startDistance:(double)a7 coordinates:(id)a8 fromSteps:(id)a9 andSegments:(id)a10 andDecoderData:(id)a11
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v56 = a3;
  id v60 = a6;
  id v16 = a8;
  id v63 = a9;
  id v17 = a10;
  id v59 = a11;
  if (length >= 2)
  {
    double v61 = a7;
    id v62 = v16;
    [v16 coordinateOnRouteAt:location];
    double v19 = v18;
    NSUInteger v20 = location;
    double v23 = GEOTilePointForCoordinate(v21, v22, 20.0);
    double v25 = v24;
    unint64_t v26 = length - 1;
    double v67 = 0.0;
    uint64_t v27 = 1;
    NSUInteger v28 = location;
    double v29 = v23;
    double v30 = v23;
    double v31 = v24;
    double v32 = v24;
    double v33 = v19;
    unint64_t v34 = 1;
    double v35 = v19;
    NSUInteger v57 = length - 1;
    do
    {
      double v64 = v32;
      double v65 = v35;
      double v36 = v25;
      double v66 = v33;
      NSUInteger v37 = v20 + v34;
      [v16 coordinateOnRouteAt:v20 + v34];
      double v39 = v38;
      double v42 = GEOTilePointForCoordinate(v40, v41, 20.0);
      double v25 = v43;
      double v44 = v67 + GEOMetersBetweenMapPoints(v23, v36, v42, v43);
      if (v29 >= v42) {
        double v29 = v42;
      }
      if (v30 <= v42) {
        double v30 = v42;
      }
      if (v31 >= v25) {
        double v31 = v25;
      }
      double v32 = v64;
      double v35 = v65;
      if (v64 <= v25) {
        double v32 = v25;
      }
      if (v65 >= v39) {
        double v35 = v39;
      }
      double v33 = v66;
      if (v66 <= v39) {
        double v33 = v39;
      }
      ++v27;
      if (v44 <= 16000.0 || v34 >= v26)
      {
        double v67 = v44;
      }
      else
      {
        NSUInteger v46 = length;
        NSUInteger v47 = v20;
        *(double *)&long long v70 = v29;
        *((double *)&v70 + 1) = v31;
        *(double *)&long long v71 = v35;
        *((double *)&v71 + 1) = v30 - v29;
        *(double *)&long long v72 = v32 - v31;
        *((double *)&v72 + 1) = v33 - v35;
        id v48 = +[GEORouteBuilder segmentForPointIndex:withSegments:andSteps:](GEORouteBuilder, "segmentForPointIndex:withSegments:andSteps:", v28, v17, v63, (double)GEOComposedRouteSectionPadAndSquareBounds((double *)&v70));
        unint64_t v49 = +[GEORouteBuilder segmentIndexForPointIndex:v28 withSegments:v17];
        v69[0] = v70;
        v69[1] = v71;
        v69[2] = v72;
        NSRange v50 = +[GEOTransitRouteBuilder _sectionForSteps:withIndex:andSegment:withIndex:andCoordinates:andPointRange:andBounds:andTransitLineColor:andStartDistance:andDecoderData:](GEOTransitRouteBuilder, "_sectionForSteps:withIndex:andSegment:withIndex:andCoordinates:andPointRange:andBounds:andTransitLineColor:andStartDistance:andDecoderData:", v63, a5, v48, v49, v62, v61, v28, v27, v69, v60, v59);

        if (v50) {
          [v56 addObject:v50];
        }
        double v61 = v61 + v44;

        double v67 = 0.0;
        double v33 = v39;
        double v35 = v39;
        double v32 = v25;
        double v31 = v25;
        double v30 = v42;
        double v29 = v42;
        NSUInteger v28 = v37;
        uint64_t v27 = 1;
        id v16 = v62;
        NSUInteger v20 = v47;
        NSUInteger length = v46;
        unint64_t v26 = v57;
      }
      ++v34;
      double v23 = v42;
    }
    while (length != v34);
    *(double *)&long long v70 = v29;
    *((double *)&v70 + 1) = v31;
    *(double *)&long long v71 = v35;
    *((double *)&v71 + 1) = v30 - v29;
    *(double *)&long long v72 = v32 - v31;
    *((double *)&v72 + 1) = v33 - v35;
    NSRange v51 = +[GEORouteBuilder segmentForPointIndex:withSegments:andSteps:](GEORouteBuilder, "segmentForPointIndex:withSegments:andSteps:", v28, v17, v63, (double)GEOComposedRouteSectionPadAndSquareBounds((double *)&v70));
    id v52 = v17;
    unint64_t v53 = +[GEORouteBuilder segmentIndexForPointIndex:v28 withSegments:v17];
    v68[0] = v70;
    v68[1] = v71;
    v68[2] = v72;
    id v54 = +[GEOTransitRouteBuilder _sectionForSteps:withIndex:andSegment:withIndex:andCoordinates:andPointRange:andBounds:andTransitLineColor:andStartDistance:andDecoderData:](GEOTransitRouteBuilder, "_sectionForSteps:withIndex:andSegment:withIndex:andCoordinates:andPointRange:andBounds:andTransitLineColor:andStartDistance:andDecoderData:", v63, a5, v51, v53, v62, v61, v28, v27, v68, v60, v59);

    if (v54) {
      [v56 addObject:v54];
    }
    a7 = v67 + v61;

    id v17 = v52;
    id v16 = v62;
  }

  return a7;
}

+ (id)_sectionForSteps:(id)a3 withIndex:(unint64_t)a4 andSegment:(id)a5 withIndex:(unint64_t)a6 andCoordinates:(id)a7 andPointRange:(_NSRange)a8 andBounds:(id *)a9 andTransitLineColor:(id)a10 andStartDistance:(double)a11 andDecoderData:(id)a12
{
  id v16 = a3;
  id v17 = a5;
  id v18 = a7;
  id v31 = a10;
  id v19 = a12;
  NSUInteger v20 = [v16 objectAtIndex:a4];
  uint64_t v21 = [v20 routeSegmentType];
  if (v21 == 2 || v21 == 5)
  {
    double v24 = [GEOComposedRouteSection alloc];
    long long v25 = *(_OWORD *)&a9->var0.var2;
    v32[0] = *(_OWORD *)&a9->var0.var0;
    v32[1] = v25;
    v32[2] = *(_OWORD *)&a9->var1.var1;
    LODWORD(v27) = 2;
    double v23 = [(GEOComposedRouteSection *)v24 initWithCoordinates:v18 segment:v17 segmentIndex:a6 steps:v16 startCoordinateIndex:a8.location coordinateCount:a8.length bounds:a11 transportType:1.0 finalStepIndex:v32 startDistance:v27 lengthScaleFactor:a4];
  }
  else if (v21 == 6)
  {
    id v29 = v20;
    NSUInteger v28 = [GEOComposedRouteTransitTripSection alloc];
    double v22 = [v29 transitStep];
    LODWORD(v27) = [v22 significanceForEndNode];
    double v23 = [(GEOComposedRouteTransitTripSection *)v28 initWithCoordinates:v18 segment:v17 segmentIndex:a6 steps:v16 startCoordinateIndex:a8.location coordinateCount:a8.length stepIndex:a11 toNodeSignificance:1.0 transitLineColor:a4 startDistance:v27 lengthScaleFactor:v31 decoderData:v19];
  }
  else
  {
    double v23 = 0;
  }

  return v23;
}

+ (id)outputForGeometry:(id)a3 andLine:(id)a4 andStops:(id)a5 andCustodian:(id)a6
{
  v38[1] = *MEMORY[0x1E4F143B8];
  BOOL v9 = (id *)a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (!v9)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    double v32 = MEMORY[0x1E4F14500];
    double v33 = "Assertion failed: geometry != nullptr";
LABEL_17:
    _os_log_fault_impl(&dword_188D96000, v32, OS_LOG_TYPE_FAULT, v33, buf, 2u);
    goto LABEL_18;
  }
  if (!v10)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    double v32 = MEMORY[0x1E4F14500];
    double v33 = "Assertion failed: line != nullptr";
    goto LABEL_17;
  }
  if (![v11 count])
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    double v32 = MEMORY[0x1E4F14500];
    double v33 = "Assertion failed: stops.count != 0";
    goto LABEL_17;
  }
  if (!v12)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    double v32 = MEMORY[0x1E4F14500];
    double v33 = "Assertion failed: custodian != nullptr";
    goto LABEL_17;
  }
  if (![v11 count])
  {
LABEL_18:
    id v13 = 0;
    goto LABEL_19;
  }
  id v13 = objc_alloc_init(GEOTransitRouteBuilderOutput);
  unsigned int v14 = GEOGetGEORouteBuilderLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188D96000, v14, OS_LOG_TYPE_INFO, "generating output for geometry-only route", buf, 2u);
  }

  id v15 = objc_alloc(MEMORY[0x1E4F1CA48]);
  -[GEOPDTransitTripGeometry _readTripLinks]((uint64_t)v9);
  double v35 = objc_msgSend(v15, "initWithCapacity:", objc_msgSend(v9[6], "count") + 1);
  double v36 = +[GEOTransitRouteBuilder _buildPointDataForGeometry:andCreatePointStarts:](GEOTransitRouteBuilder, "_buildPointDataForGeometry:andCreatePointStarts:", v9);
  id v16 = [GEOComposedRouteCoordinateArray alloc];
  v38[0] = v36;
  id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];
  id v18 = [(GEOComposedRouteCoordinateArray *)v16 initWithPointData:v17 lengthMarkers:0 usesZilch:1];

  [(GEORouteBuilderOutput *)v13 setCoordinatesArray:v18];
  id v19 = +[GEOTransitRouteBuilder _buildStepsForGeometry:andPointStarts:andStopCount:andLine:andCustodian:](GEOTransitRouteBuilder, "_buildStepsForGeometry:andPointStarts:andStopCount:andLine:andCustodian:", v9, v35, [v11 count], v10, v12);
  [(GEORouteBuilderOutput *)v13 setSteps:v19];

  NSUInteger v20 = [(GEORouteBuilderOutput *)v13 steps];
  uint64_t v21 = +[GEOTransitRouteBuilder _buildSegmentsForGeometry:andStepCount:andPointCount:andCustodian:](GEOTransitRouteBuilder, "_buildSegmentsForGeometry:andStepCount:andPointCount:andCustodian:", v9, [v20 count], -[GEOComposedRouteCoordinateArray coordinateCount](v18, "coordinateCount"), v12);
  [(GEORouteBuilderOutput *)v13 setSegments:v21];

  double v22 = [(GEORouteBuilderOutput *)v13 steps];
  double v23 = [(GEORouteBuilderOutput *)v13 segments];
  double v24 = [v10 lineColor];
  long long v25 = +[GEOTransitRouteBuilder _buildPointSectionsFromSteps:v22 andSegments:v23 coordinates:v18 andTransitLineColor:v24];
  [(GEORouteBuilderOutput *)v13 setPointSections:v25];

  unint64_t v26 = [(GEORouteBuilderOutput *)v13 steps];
  uint64_t v27 = [(GEORouteBuilderOutput *)v13 segments];
  NSUInteger v28 = +[GEOTransitRouteBuilder _buildLegsFromSteps:v26 segments:v27 andCoordinates:v18 andCustodian:v12];
  [(GEORouteBuilderOutput *)v13 setLegs:v28];

  id v29 = [(GEORouteBuilderOutput *)v13 legs];
  +[GEOTransitRouteBuilder _totalDistanceForLegs:v29];
  -[GEORouteBuilderOutput setDistance:](v13, "setDistance:");

  double v30 = [(GEORouteBuilderOutput *)v13 pointSections];
  id v31 = +[GEORouteBuilder buildMapRegionFromPointSections:v30];
  [(GEORouteBuilderOutput *)v13 setBoundingMapRegion:v31];

LABEL_19:

  return v13;
}

+ (id)_buildPointDataForGeometry:(id)a3 andCreatePointStarts:(id)a4
{
  id v5 = (id *)a3;
  id v6 = a4;
  int v7 = v6;
  if (!v5)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
LABEL_19:
      id v21 = 0;
      goto LABEL_13;
    }
    __int16 v23 = 0;
    id v18 = MEMORY[0x1E4F14500];
    id v19 = "Assertion failed: geometry != nullptr";
    NSUInteger v20 = (uint8_t *)&v23;
LABEL_21:
    _os_log_fault_impl(&dword_188D96000, v18, OS_LOG_TYPE_FAULT, v19, v20, 2u);
    goto LABEL_19;
  }
  if (!v6)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_19;
    }
    *(_WORD *)buf = 0;
    id v18 = MEMORY[0x1E4F14500];
    id v19 = "Assertion failed: pointStarts != nullptr";
    NSUInteger v20 = buf;
    goto LABEL_21;
  }
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  uint64_t v8 = 0;
  for (unint64_t i = 0; ; ++i)
  {
    -[GEOPDTransitTripGeometry _readTripLinks]((uint64_t)v5);
    if (i >= [v5[6] count]) {
      break;
    }
    id v10 = -[GEOPDTransitTripGeometry tripLinks](v5);
    uint64_t v11 = [v10 objectAtIndexedSubscript:i];

    if (v11 && *(void *)(v11 + 16))
    {
      id v12 = -[GEOPDTripLink linkGeometry]((id *)v11);
      id v13 = +[GEOPointUtility unpackPoints:v12 usesZilch:1];

      unint64_t v14 = +[GEOPointUtility pointCount:v13 usesZilch:1];
      if (v14) {
        [v21 appendData:v13];
      }
      id v15 = [NSNumber numberWithUnsignedInteger:v8];
      [v7 setObject:v15 atIndexedSubscript:i];

      v8 += v14;
    }
    else
    {
      id v13 = [NSNumber numberWithUnsignedInteger:v8];
      [v7 setObject:v13 atIndexedSubscript:i];
    }
  }
  id v16 = [NSNumber numberWithUnsignedInteger:v8];
  -[GEOPDTransitTripGeometry _readTripLinks]((uint64_t)v5);
  objc_msgSend(v7, "setObject:atIndexedSubscript:", v16, objc_msgSend(v5[6], "count"));

LABEL_13:

  return v21;
}

+ (id)_buildStepsForGeometry:(id)a3 andPointStarts:(id)a4 andStopCount:(unint64_t)a5 andLine:(id)a6 andCustodian:(id)a7
{
  id v10 = (id *)a3;
  id v11 = a4;
  id v36 = a6;
  id v35 = a7;
  NSUInteger v37 = v11;
  if (!v10)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
LABEL_25:
      id v15 = 0;
      goto LABEL_26;
    }
    __int16 v39 = 0;
    id v29 = MEMORY[0x1E4F14500];
    double v30 = "Assertion failed: geometry != nullptr";
    id v31 = (uint8_t *)&v39;
LABEL_30:
    _os_log_fault_impl(&dword_188D96000, v29, OS_LOG_TYPE_FAULT, v30, v31, 2u);
    goto LABEL_25;
  }
  if (![v11 count])
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_25;
    }
    *(_WORD *)buf = 0;
    id v29 = MEMORY[0x1E4F14500];
    double v30 = "Assertion failed: pointStarts.count > 0";
    id v31 = buf;
    goto LABEL_30;
  }
  if (![v11 count]) {
    goto LABEL_25;
  }
  id v12 = [v11 lastObject];
  uint64_t v13 = [v12 unsignedLongValue];

  if (!v13) {
    goto LABEL_25;
  }
  uint64_t v33 = v13;
  id v14 = objc_alloc(MEMORY[0x1E4F1CA48]);
  -[GEOPDTransitTripGeometry _readTripLinks]((uint64_t)v10);
  id v15 = objc_msgSend(v14, "initWithCapacity:", objc_msgSend(v10[6], "count"));
  unint64_t v16 = 0;
  id v17 = v15;
  while (1)
  {
    -[GEOPDTransitTripGeometry _readTripStepIndexs]((uint64_t)v10);
    if (v16 >= (unint64_t)v10[4]) {
      break;
    }
    unsigned int v18 = -[GEOPDTransitTripGeometry tripStepIndexAtIndex:]((uint64_t)v10, v16);
    -[GEOPDTransitTripGeometry _readTripStepIndexs]((uint64_t)v10);
    if ((unsigned char *)v16 == (char *)v10[4] - 1)
    {
      -[GEOPDTransitTripGeometry _readTripLinks]((uint64_t)v10);
      unsigned int v19 = [v10[6] count];
    }
    else
    {
      unsigned int v19 = -[GEOPDTransitTripGeometry tripStepIndexAtIndex:]((uint64_t)v10, v16 + 1);
    }
    if (v16) {
      int v20 = 4;
    }
    else {
      int v20 = 3;
    }
    if (v16) {
      int v21 = 1;
    }
    else {
      int v21 = 5;
    }
    double v22 = [v37 objectAtIndexedSubscript:v18];
    uint64_t v23 = [v22 unsignedIntegerValue];

    double v24 = [v37 objectAtIndexedSubscript:v19];
    uint64_t v25 = [v24 unsignedIntegerValue];

    unint64_t v26 = [[GEOComposedTransitTripRouteStep alloc] initWithComposedRoute:v35 routeSegmentType:6 stepIndex:v16 pointRange:v23 line:v25 - v23 maneuverType:v36 significance:__PAIR64__(v21, v20)];
    id v15 = v17;
    if (v26) {
      [v17 addObject:v26];
    }

    ++v16;
  }
  if (![v15 count])
  {
    uint64_t v27 = [[GEOComposedTransitTripRouteStep alloc] initWithComposedRoute:v35 routeSegmentType:6 stepIndex:0 pointRange:0 line:v33 - 1 maneuverType:v36 significance:0x500000003];
    [v15 addObject:v27];
  }
  NSUInteger v28 = [[GEOComposedTransitTripRouteStep alloc] initWithComposedRoute:v35 routeSegmentType:6 stepIndex:a5 - 1 pointRange:v33 - 1 line:1 maneuverType:v36 significance:0x500000005];
  [v15 addObject:v28];

LABEL_26:

  return v15;
}

+ (id)_buildSegmentsForGeometry:(id)a3 andStepCount:(unint64_t)a4 andPointCount:(unint64_t)a5 andCustodian:(id)a6
{
  BOOL v9 = (id *)a3;
  id v10 = a6;
  id v11 = v10;
  if (!v9)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_18;
    }
    __int16 v22 = 0;
    unint64_t v16 = MEMORY[0x1E4F14500];
    id v17 = "Assertion failed: geometry != nullptr";
    unsigned int v18 = (uint8_t *)&v22;
LABEL_17:
    _os_log_fault_impl(&dword_188D96000, v16, OS_LOG_TYPE_FAULT, v17, v18, 2u);
    goto LABEL_18;
  }
  if (!a4)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_18;
    }
    __int16 v21 = 0;
    unint64_t v16 = MEMORY[0x1E4F14500];
    id v17 = "Assertion failed: stepCount > 0";
    unsigned int v18 = (uint8_t *)&v21;
    goto LABEL_17;
  }
  if (!a5)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_18;
    }
    __int16 v20 = 0;
    unint64_t v16 = MEMORY[0x1E4F14500];
    id v17 = "Assertion failed: pointCount > 0";
    unsigned int v18 = (uint8_t *)&v20;
    goto LABEL_17;
  }
  if (v10)
  {
    id v12 = objc_alloc(MEMORY[0x1E4F1CA48]);
    -[GEOPDTransitTripGeometry _readTripLinks]((uint64_t)v9);
    uint64_t v13 = objc_msgSend(v12, "initWithCapacity:", objc_msgSend(v9[6], "count"));
    id v14 = -[GEOComposedTransitBaseRouteSegment initWithComposedRoute:stepRange:transitStepRange:pointRange:segmentIndex:]([GEOComposedTransitTripRouteSegment alloc], "initWithComposedRoute:stepRange:transitStepRange:pointRange:segmentIndex:", v11, 0, a4, 0, a4, 0, a5, 0);
    [v13 addObject:v14];

    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    unint64_t v16 = MEMORY[0x1E4F14500];
    id v17 = "Assertion failed: custodian != nullptr";
    unsigned int v18 = buf;
    goto LABEL_17;
  }
LABEL_18:
  uint64_t v13 = 0;
LABEL_6:

  return v13;
}

+ (id)_buildPointSectionsFromSteps:(id)a3 andSegments:(id)a4 coordinates:(id)a5 andTransitLineColor:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ((unint64_t)[v11 coordinateCount] >= 2)
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    unint64_t v15 = 0;
    double v16 = 0.0;
    while (v15 < [v9 count])
    {
      id v17 = [v9 objectAtIndex:v15];
      +[GEOTransitRouteBuilder _buildPointSectionsInCollection:pointRange:stepIndex:transitLineColor:startDistance:andCoordinates:fromSteps:andSegments:](GEOTransitRouteBuilder, "_buildPointSectionsInCollection:pointRange:stepIndex:transitLineColor:startDistance:andCoordinates:fromSteps:andSegments:", v13, [v17 startPointIndex], objc_msgSend(v17, "endPointIndex") - objc_msgSend(v17, "startPointIndex") + 1, v15, v12, v11, v16, v9, v10);
      double v16 = v16 + v18;

      ++v15;
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

+ (double)_buildPointSectionsInCollection:(id)a3 pointRange:(_NSRange)a4 stepIndex:(unint64_t)a5 transitLineColor:(id)a6 startDistance:(double)a7 andCoordinates:(id)a8 fromSteps:(id)a9 andSegments:(id)a10
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v16 = a3;
  id v17 = a6;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  if (length >= 2)
  {
    [v18 coordinateOnRouteAt:location];
    double v23 = GEOTilePointForCoordinate(v21, v22, 20.0);
    double v25 = v24;
    double v26 = 0.0;
    for (uint64_t i = 1; i != length; ++i)
    {
      [v18 coordinateOnRouteAt:location + i];
      double v30 = GEOTilePointForCoordinate(v28, v29, 20.0);
      double v32 = v31;
      double v26 = v26 + GEOMetersBetweenMapPoints(v23, v25, v30, v31);
      double v23 = v30;
      double v25 = v32;
    }
    [v18 coordinateOnRouteAt:location];
    double v34 = v33;
    double v36 = v35;
    [v18 coordinateOnRouteAt:length - 1];
    double v38 = v37;
    double v40 = v39;
    double v41 = [GEOComposedRouteTransitTripSection alloc];
    double v42 = +[GEORouteBuilder segmentForPointIndex:location withSegments:v20 andSteps:v19];
    LODWORD(v45) = 1;
    double v43 = -[GEOComposedRouteTransitTripSection initWithCoordinates:segment:segmentIndex:steps:startCoordinateIndex:coordinateCount:stepIndex:toNodeSignificance:transitLineColor:startDistance:lengthScaleFactor:fallbackStartCoordinate:fallbackEndCoordinate:](v41, "initWithCoordinates:segment:segmentIndex:steps:startCoordinateIndex:coordinateCount:stepIndex:toNodeSignificance:transitLineColor:startDistance:lengthScaleFactor:fallbackStartCoordinate:fallbackEndCoordinate:", v18, v42, +[GEORouteBuilder segmentIndexForPointIndex:withSegments:](GEORouteBuilder, "segmentIndexForPointIndex:withSegments:", location, v20), v19, location, length, a7, 1.0, v34, v36, v38, v40,
            a5,
            v45,
            v17);

    [v16 addObject:v43];
    a7 = v26 + a7;
  }
  return a7;
}

+ (id)_buildLegsFromSteps:(id)a3 segments:(id)a4 andCoordinates:(id)a5 andCustodian:(id)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (![v9 count])
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_26;
    }
    *(_WORD *)buf = 0;
    double v29 = MEMORY[0x1E4F14500];
    double v30 = "Assertion failed: steps.count != 0";
LABEL_25:
    _os_log_fault_impl(&dword_188D96000, v29, OS_LOG_TYPE_FAULT, v30, buf, 2u);
    goto LABEL_26;
  }
  if (!v11)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_26;
    }
    *(_WORD *)buf = 0;
    double v29 = MEMORY[0x1E4F14500];
    double v30 = "Assertion failed: coordinates != nullptr";
    goto LABEL_25;
  }
  if (![v11 coordinateCount])
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_26;
    }
    *(_WORD *)buf = 0;
    double v29 = MEMORY[0x1E4F14500];
    double v30 = "Assertion failed: coordinates.coordinateCount != 0";
    goto LABEL_25;
  }
  if (!v12)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      double v29 = MEMORY[0x1E4F14500];
      double v30 = "Assertion failed: custodian != nullptr";
      goto LABEL_25;
    }
LABEL_26:
    id v13 = 0;
    goto LABEL_27;
  }
  if (![v9 count] || !objc_msgSend(v11, "coordinateCount")) {
    goto LABEL_26;
  }
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v14 = v9;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v33;
    double v17 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v33 != v16) {
          objc_enumerationMutation(v14);
        }
        objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * i), "distance", (void)v32);
        double v17 = v17 + v19;
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v15);
  }
  else
  {
    double v17 = 0.0;
  }

  [v11 coordinateOnRouteAt:0];
  double v22 = [[GEOLocation alloc] initWithLatitude:v20 longitude:v21];
  double v23 = [[GEOComposedWaypoint alloc] initWithLocation:v22 isCurrentLocation:0];
  objc_msgSend(v11, "coordinateOnRouteAt:", objc_msgSend(v11, "coordinateCount") - 1);
  double v26 = [[GEOLocation alloc] initWithLatitude:v24 longitude:v25];

  uint64_t v27 = [[GEOComposedWaypoint alloc] initWithLocation:v26 isCurrentLocation:0];
  double v28 = [[GEOComposedRouteLeg alloc] initWithComposedRoute:v12 legIndex:0 origin:v23 destination:v27 arrivalParameters:0];
  -[GEOComposedRouteLeg setPointRange:](v28, "setPointRange:", 0, [v11 coordinateCount]);
  -[GEOComposedRouteLeg setStepRange:](v28, "setStepRange:", 0, [v14 count]);
  -[GEOComposedRouteLeg setSegmentRange:](v28, "setSegmentRange:", 0, [v10 count]);
  [(GEOComposedRouteLeg *)v28 setDistance:v17];
  [v13 addObject:v28];

LABEL_27:

  return v13;
}

@end