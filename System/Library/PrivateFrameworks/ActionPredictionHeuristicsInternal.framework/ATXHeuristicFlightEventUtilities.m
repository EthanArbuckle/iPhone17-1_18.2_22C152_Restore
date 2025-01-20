@interface ATXHeuristicFlightEventUtilities
+ (BOOL)currentLocationIsWithinAirportForEvent:(id)a3;
+ (CLLocationCoordinate2D)locationAtArrivalAirport:(id)a3 event:(id)a4 heuristicDevice:(id)a5;
+ (id)_dateIntervalWithEvent:(id)a3;
+ (id)fetchDestinationPlacemarkForFlightEvent:(id)a3 heuristicDevice:(id)a4;
+ (id)flightInformationSchemaForEvent:(id)a3;
+ (id)flightInformationSpotlightSuggestionForEvent:(id)a3 schemaForFlight:(id)a4 predictionReasons:(unint64_t)a5 score:(double)a6 validStartDate:(id)a7 validEndDate:(id)a8;
+ (id)flightSchemaForEvent:(id)a3;
+ (id)lastFlightLegEndTimeForEvent:(id)a3 heuristicDevice:(id)a4;
+ (id)updatedFlightInformationSchemaForEvent:(id)a3 schemaForFlight:(id)a4 heuristicDevice:(id)a5;
+ (void)logSuggestion:(id)a3 description:(id)a4;
@end

@implementation ATXHeuristicFlightEventUtilities

+ (void)logSuggestion:(id)a3 description:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 atxActionCriteria];
  v8 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v7 startDate];
    v10 = [v7 endDate];
    int v11 = 138413058;
    id v12 = v6;
    __int16 v13 = 2112;
    v14 = v9;
    __int16 v15 = 2112;
    v16 = v10;
    __int16 v17 = 2112;
    id v18 = v5;
    _os_log_impl(&dword_1D0F43000, v8, OS_LOG_TYPE_DEFAULT, "%@: start: %@, end: %@, %@", (uint8_t *)&v11, 0x2Au);
  }
}

+ (id)flightSchemaForEvent:(id)a3
{
  v3 = [a3 customObjectForKey:@"SGEventMetadataKey"];
  v4 = [v3 objectForKeyedSubscript:@"SGEventMetadataSchemaOrgKey"];
  id v5 = [v4 firstObject];

  return v5;
}

+ (id)flightInformationSchemaForEvent:(id)a3
{
  v28[1] = *MEMORY[0x1E4F143B8];
  v3 = [a3 customObjectForKey:@"SGEventMetadataKey"];
  DeepCopy = (void *)CFPropertyListCreateDeepCopy(0, v3, 1uLL);
  id v5 = [DeepCopy objectForKeyedSubscript:@"SGEventMetadataSchemaOrgKey"];
  id v6 = [v5 firstObject];
  v7 = [v6 objectForKeyedSubscript:@"reservationFor"];
  v8 = [v6 objectForKeyedSubscript:@"reservationFor"];
  v9 = [v8 objectForKeyedSubscript:@"arrivalAirport"];

  v10 = [v9 objectForKeyedSubscript:@"address"];
  int v11 = [v10 objectForKeyedSubscript:@"addressLocality"];

  id v12 = [v9 objectForKeyedSubscript:@"iataCode"];
  if (v12) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 0;
  }
  if (v13)
  {
    v25 = DeepCopy;
    v26 = v3;
    v14 = [MEMORY[0x1E4F5DF68] sharedInstance];
    __int16 v15 = [v14 cityForIataCode:v12];
    v16 = [v15 capitalizedString];

    if (v16)
    {
      __int16 v17 = [v9 objectForKeyedSubscript:@"address"];
      if (v17)
      {
        id v18 = [v9 objectForKeyedSubscript:@"address"];
        uint64_t v19 = v18;
        v20 = @"addressLocality";
        v21 = v16;
      }
      else
      {
        v27 = @"addressLocality";
        v28[0] = v16;
        uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
        v20 = @"address";
        id v18 = v9;
        v21 = v19;
      }
      [v18 setObject:v21 forKeyedSubscript:v20];
    }
    [v7 setObject:v9 forKeyedSubscript:@"arrivalAirport"];
    [v6 setObject:v7 forKeyedSubscript:@"reservationFor"];

    DeepCopy = v25;
    v3 = v26;
  }
  if (v6) {
    id v22 = v6;
  }
  else {
    id v22 = (id)objc_opt_new();
  }
  v23 = v22;

  return v23;
}

+ (id)updatedFlightInformationSchemaForEvent:(id)a3 schemaForFlight:(id)a4 heuristicDevice:(id)a5
{
  v31[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [v7 customObjectForKey:@"SGEventMetadataKey"];
  int v11 = v10;
  if (v10
    && ([v10 objectForKeyedSubscript:@"SGEventMetadataCategoryDescriptionKey"],
        id v12 = objc_claimAutoreleasedReturnValue(),
        char v13 = [v12 isEqualToString:@"Flight"],
        v12,
        (v13 & 1) != 0))
  {
    id DeepCopy = (id)CFPropertyListCreateDeepCopy(0, v8, 1uLL);
    __int16 v15 = +[ATXHeuristicFlightEventUtilities fetchDestinationPlacemarkForFlightEvent:v7 heuristicDevice:v9];
    v16 = v15;
    if (v15)
    {
      __int16 v17 = [v15 locality];
      uint64_t v18 = [v16 country];
      uint64_t v19 = (void *)v18;
      if (v17 && v18)
      {
        v28 = [DeepCopy objectForKeyedSubscript:@"reservationFor"];
        v20 = [DeepCopy objectForKeyedSubscript:@"reservationFor"];
        v21 = [v20 objectForKeyedSubscript:@"arrivalAirport"];

        v26 = v21;
        id v22 = [v21 objectForKeyedSubscript:@"address"];
        v23 = [v22 objectForKeyedSubscript:@"addressLocality"];
        v29 = [v22 objectForKeyedSubscript:@"addressCountry"];
        v27 = v19;
        if (!v23
          || !v29
          || ![v17 isEqualToString:v23]
          || ([v19 isEqualToString:v29] & 1) == 0)
        {
          if (v22)
          {
            [v22 setObject:v17 forKeyedSubscript:@"addressLocality"];
            [v22 setObject:v19 forKeyedSubscript:@"addressCountry"];
          }
          else
          {
            v30[0] = @"addressLocality";
            v30[1] = @"addressCountry";
            v31[0] = v17;
            v31[1] = v19;
            v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];
            id v22 = (void *)[v24 mutableCopy];
          }
        }
        [v26 setObject:v22 forKeyedSubscript:@"address"];
        [v28 setObject:v26 forKeyedSubscript:@"arrivalAirport"];
        [DeepCopy setObject:v28 forKeyedSubscript:@"reservationFor"];

        uint64_t v19 = v27;
      }
    }
  }
  else
  {
    id DeepCopy = v8;
  }

  return DeepCopy;
}

+ (id)lastFlightLegEndTimeForEvent:(id)a3 heuristicDevice:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 endDate];
  id v9 = [v7 endDate];

  v10 = [v9 dateByAddingTimeInterval:43200.0];

  int v11 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0F43000, v11, OS_LOG_TYPE_DEFAULT, "lastFlightLedEnd Event search", buf, 2u);
  }

  id v12 = [[ATXCalendarEventsDataSource alloc] initWithDevice:v6];
  char v13 = [(ATXCalendarEventsDataSource *)v12 flightEventsFromStartDate:v8 endDate:v10 reason:@"last flight leg computation"];
  v14 = [MEMORY[0x1E4F1C9C8] date];
  __int16 v15 = (void *)MEMORY[0x1E4F28F60];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __81__ATXHeuristicFlightEventUtilities_lastFlightLegEndTimeForEvent_heuristicDevice___block_invoke;
  v26[3] = &unk_1E68A4FD0;
  id v27 = v14;
  id v16 = v14;
  __int16 v17 = [v15 predicateWithBlock:v26];
  uint64_t v18 = [v13 filteredArrayUsingPredicate:v17];

  uint64_t v19 = [(ATXCalendarEventsDataSource *)v12 sortEkEvents:v18];
  if ([v19 count])
  {
    v25 = v10;
    v20 = v8;
    v21 = [v19 lastObject];
    id v22 = [a1 lastFlightLegEndTimeForEvent:v21 heuristicDevice:v6];
    if (v22) {
      [a1 lastFlightLegEndTimeForEvent:v21 heuristicDevice:v6];
    }
    else {
    v23 = [v21 endDate];
    }

    id v8 = v20;
    v10 = v25;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

BOOL __81__ATXHeuristicFlightEventUtilities_lastFlightLegEndTimeForEvent_heuristicDevice___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 endDate];
  BOOL v4 = [v2 compare:v3] == -1;

  return v4;
}

+ (id)fetchDestinationPlacemarkForFlightEvent:(id)a3 heuristicDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  id v9 = (void *)MEMORY[0x1D25F43D0]();
  v10 = [a1 lastFlightLegEndTimeForEvent:v6 heuristicDevice:v7];
  if (!v10)
  {
    int v11 = [v6 endDate];
    v10 = [v11 dateByAddingTimeInterval:43200.0];
  }
  id v12 = objc_opt_new();
  char v13 = [v6 startDate];
  [v12 setFromDate:v13];

  v14 = (void *)MEMORY[0x1D25F43D0]([v12 setToDate:v10]);
  __int16 v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", &unk_1F27274A0, 0);
  [v12 setMatchingCategories:v15];

  id v16 = objc_opt_new();
  v103[0] = 0;
  v100[0] = MEMORY[0x1E4F143A8];
  v100[1] = 3221225472;
  v100[2] = __92__ATXHeuristicFlightEventUtilities_fetchDestinationPlacemarkForFlightEvent_heuristicDevice___block_invoke;
  v100[3] = &unk_1E68A4FF8;
  id v101 = 0;
  id v17 = v16;
  id v102 = v17;
  v90 = v8;
  [v8 iterScoredEventsWithQuery:v12 error:v103 block:v100];
  id v89 = v103[0];
  uint64_t v18 = [MEMORY[0x1E4F1C9C8] date];
  id v19 = v6;
  v20 = [v6 startDate];
  uint64_t v21 = [v20 dateByAddingTimeInterval:-3600.0];

  id v22 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0F43000, v22, OS_LOG_TYPE_DEFAULT, "fetchDestinationPlacemark Event search", buf, 2u);
  }

  v91 = v7;
  v23 = [[ATXCalendarEventsDataSource alloc] initWithDevice:v7];
  v24 = [(ATXCalendarEventsDataSource *)v23 flightEventsFromStartDate:v21 endDate:v10 reason:@"destination placemark event search"];
  v25 = (void *)MEMORY[0x1E4F28F60];
  v97[0] = MEMORY[0x1E4F143A8];
  v97[1] = 3221225472;
  v97[2] = __92__ATXHeuristicFlightEventUtilities_fetchDestinationPlacemarkForFlightEvent_heuristicDevice___block_invoke_202;
  v97[3] = &unk_1E68A4FD0;
  id v85 = v18;
  id v98 = v85;
  v26 = [v25 predicateWithBlock:v97];
  v86 = v24;
  id v27 = [v24 filteredArrayUsingPredicate:v26];

  v87 = v23;
  v28 = [(ATXCalendarEventsDataSource *)v23 sortEkEvents:v27];
  v95 = objc_opt_new();
  v94 = objc_opt_new();
  v29 = objc_opt_new();
  v30 = v19;
  v96 = v28;
  v88 = (void *)v21;
  if ((unint64_t)[v28 count] < 2) {
    goto LABEL_22;
  }
  v92 = v29;
  v76 = v27;
  v79 = v12;
  v74 = [v28 firstObject];
  v31 = +[ATXHeuristicFlightEventUtilities flightSchemaForEvent:](ATXHeuristicFlightEventUtilities, "flightSchemaForEvent:");
  v32 = [v31 objectForKeyedSubscript:@"reservationFor"];
  v33 = [v32 objectForKeyedSubscript:@"arrivalAirport"];
  v34 = [v33 objectForKeyedSubscript:@"iataCode"];

  v35 = [v31 objectForKeyedSubscript:@"reservationFor"];
  v36 = [v35 objectForKeyedSubscript:@"departureAirport"];
  v37 = [v36 objectForKeyedSubscript:@"iataCode"];

  if (v34) {
    [v95 addObject:v34];
  }
  if (v37) {
    [v94 addObject:v37];
  }
  v81 = v10;
  v83 = v30;
  [v92 addObject:v74];
  v38 = v96;
  if ((unint64_t)[v96 count] < 2) {
    goto LABEL_21;
  }
  unint64_t v39 = 1;
  while (1)
  {
    v40 = v37;
    v41 = v34;
    v42 = v31;
    v43 = [v38 objectAtIndexedSubscript:v39];
    v31 = +[ATXHeuristicFlightEventUtilities flightSchemaForEvent:v43];

    v44 = [v31 objectForKeyedSubscript:@"reservationFor"];
    v45 = [v44 objectForKeyedSubscript:@"arrivalAirport"];
    v34 = [v45 objectForKeyedSubscript:@"iataCode"];

    v46 = [v31 objectForKeyedSubscript:@"reservationFor"];
    v47 = [v46 objectForKeyedSubscript:@"departureAirport"];
    v37 = [v47 objectForKeyedSubscript:@"iataCode"];

    if (!v34 || !v37) {
      goto LABEL_17;
    }
    v48 = [v95 lastObject];
    if (![v48 isEqualToString:v37]) {
      break;
    }
    char v49 = [v94 containsObject:v34];

    if (v49) {
      goto LABEL_20;
    }
    [v94 addObject:v37];
    [v95 addObject:v34];
    [v92 addObject:v43];
LABEL_17:

    ++v39;
    v38 = v96;
    if (v39 >= [v96 count]) {
      goto LABEL_21;
    }
  }

LABEL_20:
LABEL_21:

  v10 = v81;
  v30 = v83;
  id v12 = v79;
  id v27 = v76;
  v29 = v92;
LABEL_22:
  v50 = v29;
  if ([v29 count])
  {
    id v51 = [v29 lastObject];
  }
  else
  {
    id v51 = v30;
  }
  v52 = v51;
  uint64_t v53 = [v51 endLocation];
  if (!v53) {
    goto LABEL_32;
  }
  v54 = (void *)v53;
  v55 = [v52 endLocation];
  v56 = [v55 geoLocation];

  if (!v56) {
    goto LABEL_32;
  }
  v82 = v10;
  v84 = v30;
  v77 = v27;
  id v78 = v17;
  v80 = v12;
  v57 = +[ATXHeuristicFlightEventUtilities flightInformationSchemaForEvent:v52];
  v58 = [v57 objectForKeyedSubscript:@"reservationFor"];
  v59 = [v58 objectForKeyedSubscript:@"arrivalAirport"];
  v60 = [v59 objectForKeyedSubscript:@"address"];
  v61 = [v60 objectForKeyedSubscript:@"addressLocality"];

  v75 = v57;
  v62 = [v57 objectForKeyedSubscript:@"reservationFor"];
  v63 = [v62 objectForKeyedSubscript:@"arrivalAirport"];
  v64 = [v63 objectForKeyedSubscript:@"address"];
  v65 = [v64 objectForKeyedSubscript:@"addressCountry"];

  id v66 = objc_alloc_init(MEMORY[0x1E4F1BA58]);
  v67 = v66;
  if (v61)
  {
    v93 = v50;
    [v66 setCity:v61];
    if (v65) {
      [v67 setCountry:v65];
    }
    v68 = (void *)MEMORY[0x1E4F1E630];
    v69 = [v52 endLocation];
    v70 = [v69 geoLocation];
    v71 = [v52 endLocation];
    v72 = [v71 title];
    v62 = [v68 placemarkWithLocation:v70 name:v72 postalAddress:v67];

    v50 = v93;
  }
  v30 = v84;

  id v12 = v80;
  v10 = v82;
  id v27 = v77;
  id v17 = v78;
  if (!v61) {
LABEL_32:
  }
    v62 = 0;

  return v62;
}

void __92__ATXHeuristicFlightEventUtilities_fetchDestinationPlacemarkForFlightEvent_heuristicDevice___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = (id *)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
    v3 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __92__ATXHeuristicFlightEventUtilities_fetchDestinationPlacemarkForFlightEvent_heuristicDevice___block_invoke_cold_1(v2, v3);
    }
  }
  else
  {
    BOOL v4 = *(void **)(a1 + 40);
    [v4 addObject:a2];
  }
}

BOOL __92__ATXHeuristicFlightEventUtilities_fetchDestinationPlacemarkForFlightEvent_heuristicDevice___block_invoke_202(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 endDate];
  BOOL v4 = [v2 compare:v3] == -1;

  return v4;
}

+ (CLLocationCoordinate2D)locationAtArrivalAirport:(id)a3 event:(id)a4 heuristicDevice:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = [a1 fetchDestinationPlacemarkForFlightEvent:a4 heuristicDevice:a5];
  v10 = v9;
  if (v9)
  {
    int v11 = [v9 location];
    [v11 coordinate];
    CLLocationDegrees latitude = v12;
    CLLocationDegrees longitude = v14;
  }
  else
  {
    id v16 = [v8 objectForKeyedSubscript:@"geo"];
    int v11 = [v16 objectForKeyedSubscript:@"latitude"];

    id v17 = [v8 objectForKeyedSubscript:@"geo"];
    uint64_t v18 = [v17 objectForKeyedSubscript:@"longitude"];

    if (v11 && v18)
    {
      [v11 doubleValue];
      CLLocationDegrees v20 = v19;
      [v18 doubleValue];
      CLLocationDegrees v22 = v21;
      v23 = __atxlog_handle_context_heuristic();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        int v28 = 134218240;
        CLLocationDegrees v29 = v20;
        __int16 v30 = 2048;
        CLLocationDegrees v31 = v22;
        _os_log_impl(&dword_1D0F43000, v23, OS_LOG_TYPE_DEFAULT, "ATXHeuristicFlightEventUtilities: Geolocation from Schema metadata: %f, %f", (uint8_t *)&v28, 0x16u);
      }

      CLLocationCoordinate2D v24 = CLLocationCoordinate2DMake(v20, v22);
      CLLocationDegrees latitude = v24.latitude;
      CLLocationDegrees longitude = v24.longitude;
    }
    else
    {
      v25 = __atxlog_handle_context_heuristic();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        int v28 = 138412546;
        CLLocationDegrees v29 = *(double *)&v11;
        __int16 v30 = 2112;
        CLLocationDegrees v31 = *(double *)&v18;
        _os_log_impl(&dword_1D0F43000, v25, OS_LOG_TYPE_DEFAULT, "ATXHeuristicFlightEventUtilities: Missing latitude/longitude information: %@, %@", (uint8_t *)&v28, 0x16u);
      }

      CLLocationDegrees latitude = *MEMORY[0x1E4F1E750];
      CLLocationDegrees longitude = *(double *)(MEMORY[0x1E4F1E750] + 8);
    }
  }
  double v26 = latitude;
  double v27 = longitude;
  result.CLLocationDegrees longitude = v27;
  result.CLLocationDegrees latitude = v26;
  return result;
}

+ (BOOL)currentLocationIsWithinAirportForEvent:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 endLocation];
  if (!v4) {
    goto LABEL_20;
  }
  id v5 = (void *)v4;
  id v6 = [v3 endLocation];
  id v7 = [v6 geoLocation];

  if (!v7) {
    goto LABEL_20;
  }
  unint64_t v8 = 0x1E68A4000uLL;
  id v9 = [v3 endLocation];
  v10 = [v9 geoLocation];
  int v11 = +[ATXHeuristicNavigationUtilities destinationPlacemarkForLocation:v10 withDestinationName:0];

  if (!v11)
  {
    v34 = [v3 customObjectForKey:@"SGEventMetadataKey"];
    id v16 = [v34 objectForKeyedSubscript:@"SGEventMetadataSchemaOrgKey"];
    id v17 = [v16 firstObject];
    uint64_t v18 = [v17 objectForKeyedSubscript:@"reservationFor"];
    double v19 = [v18 objectForKeyedSubscript:@"arrivalAirport"];
    CLLocationDegrees v20 = [v19 objectForKeyedSubscript:@"geo"];
    double v21 = [v20 objectForKeyedSubscript:@"latitude"];

    CLLocationDegrees v22 = [v17 objectForKeyedSubscript:@"reservationFor"];
    v23 = [v22 objectForKeyedSubscript:@"arrivalAirport"];
    CLLocationCoordinate2D v24 = [v23 objectForKeyedSubscript:@"geo"];
    v25 = [v24 objectForKeyedSubscript:@"longitude"];

    if (v21) {
      BOOL v26 = v25 == 0;
    }
    else {
      BOOL v26 = 1;
    }
    int v27 = !v26;
    if (v26)
    {
      uint64_t v32 = __atxlog_handle_context_heuristic();
      unint64_t v8 = 0x1E68A4000;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138478083;
        v36 = v21;
        __int16 v37 = 2113;
        v38 = v25;
        _os_log_impl(&dword_1D0F43000, v32, OS_LOG_TYPE_DEFAULT, "ATXHeuristicFlightEventUtilities: Missing latitude/longitude/destination information: %{private}@, %{private}@", buf, 0x16u);
      }

      int v11 = 0;
    }
    else
    {
      [v21 doubleValue];
      double v29 = v28;
      [v25 doubleValue];
      CLLocationDegrees v31 = (void *)[objc_alloc(MEMORY[0x1E4F1E5F0]) initWithLatitude:v29 longitude:v30];
      unint64_t v8 = 0x1E68A4000uLL;
      int v11 = +[ATXHeuristicNavigationUtilities destinationPlacemarkForLocation:v31 withDestinationName:0];
    }
    if (!v27) {
      goto LABEL_22;
    }
    if (v11) {
      goto LABEL_4;
    }
LABEL_20:
    int v11 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0F43000, v11, OS_LOG_TYPE_DEFAULT, "ATXHeuristicFlightEventUtilities: Unable to determine if we are at airport. Missing location", buf, 2u);
    }
LABEL_22:
    LOBYTE(v14) = 0;
    goto LABEL_23;
  }
LABEL_4:
  double v12 = *(void **)(v8 + 1456);
  char v13 = [v11 location];
  int v14 = [v12 isAtLocation:v13 maxDistance:5000];

  __int16 v15 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v36) = v14;
    _os_log_impl(&dword_1D0F43000, v15, OS_LOG_TYPE_DEFAULT, "ATXHeursiticFlightEventUtilities: Are we at the airport: (%{BOOL}d)", buf, 8u);
  }

LABEL_23:
  return v14;
}

+ (id)_dateIntervalWithEvent:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F28C18];
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = [v4 startDate];
  id v7 = [v4 endDate];

  unint64_t v8 = (void *)[v5 initWithStartDate:v6 endDate:v7];

  return v8;
}

+ (id)flightInformationSpotlightSuggestionForEvent:(id)a3 schemaForFlight:(id)a4 predictionReasons:(unint64_t)a5 score:(double)a6 validStartDate:(id)a7 validEndDate:(id)a8
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  id v17 = a8;
  uint64_t v18 = [v15 objectForKeyedSubscript:@"reservationFor"];
  double v19 = [v18 objectForKeyedSubscript:@"flightNumber"];

  if ([v19 length])
  {
    CLLocationDegrees v20 = NSString;
    double v21 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    CLLocationDegrees v22 = [v21 localizedStringForKey:@"FLIGHT_CATEGORY" value:&stru_1F2719D20 table:0];
    v23 = objc_msgSend(v20, "localizedStringWithFormat:", v22, v19);

    CLLocationCoordinate2D v24 = [ATXContextFlightEventSuggestionProducer alloc];
    v25 = [a1 _dateIntervalWithEvent:v14];
    BOOL v26 = [(ATXContextFlightEventSuggestionProducer *)v24 initWithTitle:v23 flightInformationSchema:v15 urlString:0 teamIdentifier:0 validFromStartDate:v16 validToEndDate:v17 alternateDestinationTitle:0 dateInterval:v25];

    int v27 = [v14 startDate];
    double v28 = [(ATXContextFlightEventSuggestionProducer *)v26 suggestionForFlightInformationWithReason:a5 score:v27 date:a6];

    +[ATXHeuristicFlightEventUtilities logSuggestion:v28 description:@"ATXHeuristicFlightEventUtilities: Flight info suggestion"];
  }
  else
  {
    double v29 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v32 = v19;
      _os_log_impl(&dword_1D0F43000, v29, OS_LOG_TYPE_DEFAULT, "ATXHeuristicFlightEventUtilities: Flight Information: Missing information: Flight Info : %@", buf, 0xCu);
    }

    double v28 = 0;
  }

  return v28;
}

void __92__ATXHeuristicFlightEventUtilities_fetchDestinationPlacemarkForFlightEvent_heuristicDevice___block_invoke_cold_1(id *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [*a1 localizedDescription];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_1D0F43000, a2, OS_LOG_TYPE_ERROR, "ATXHeuristicFlightEventUtilities: Error while resolving events: %@", (uint8_t *)&v4, 0xCu);
}

@end