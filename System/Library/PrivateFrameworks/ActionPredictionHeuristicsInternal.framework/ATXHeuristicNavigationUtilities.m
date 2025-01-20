@interface ATXHeuristicNavigationUtilities
+ (BOOL)allowNavigationSuggestionForLocation:(id)a3 maxDistance:(unint64_t)a4;
+ (BOOL)isAtLocation:(id)a3 maxDistance:(unint64_t)a4;
+ (BOOL)isDestinationTooCloseToNavigate:(id)a3;
+ (double)_travelTimeInSecondsWithEvent:(id)a3 destination:(id)a4 transportType:(id)a5 heuristicDevice:(id)a6;
+ (id)_dateIntervalWithEvent:(id)a3;
+ (id)_titleWithTravelTimeInSeconds:(double)a3 destinationName:(id)a4;
+ (id)destinationPlacemarkForEvent:(id)a3 name:(id)a4 schemaType:(unint64_t)a5;
+ (id)destinationPlacemarkForLocation:(id)a3 withDestinationName:(id)a4;
+ (id)fetchLocationForLOI:(int64_t)a3;
+ (id)getCurrentLocation;
+ (id)locationFromEvent:(id)a3 schemaType:(unint64_t)a4;
+ (id)navigationSubtitleForType:(unint64_t)a3;
+ (id)navigationSuggestionActionForDestination:(id)a3 event:(id)a4 transportType:(id)a5 schemaForEvent:(id)a6 predictionReasons:(unint64_t)a7 heuristicDevice:(id)a8 score:(double)a9 shouldClearOnEngagement:(BOOL)a10 validStartDate:(id)a11 validEndDate:(id)a12;
+ (id)navigationSuggestionActionForEvent:(id)a3 schemaForEvent:(id)a4 transportType:(id)a5 predictionReasons:(unint64_t)a6 heuristicDevice:(id)a7 score:(double)a8 validStartDate:(id)a9 validEndDate:(id)a10;
+ (id)navigationSuggestionActionForLOI:(int64_t)a3 destinationName:(id)a4 schemaForEvent:(id)a5 withScore:(double)a6 transportType:(id)a7 predictionReason:(unint64_t)a8 validStartDate:(id)a9 validEndDate:(id)a10 heuristicDevice:(id)a11;
+ (id)placemarkForLOI:(int64_t)a3 name:(id)a4;
+ (id)schemaTypeToString:(unint64_t)a3;
+ (unint64_t)navigationTypeForString:(id)a3;
@end

@implementation ATXHeuristicNavigationUtilities

+ (id)getCurrentLocation
{
  v2 = [MEMORY[0x1E4F935D0] sharedInstance];
  v3 = [v2 getCurrentLocation];

  return v3;
}

+ (BOOL)isDestinationTooCloseToNavigate:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = +[ATXHeuristicNavigationUtilities getCurrentLocation];
  v5 = v4;
  BOOL v6 = v4 != 0;
  if (v4)
  {
    [v4 distanceFromLocation:v3];
    double v8 = v7;
    if (v7 > 500.0)
    {
      BOOL v6 = 0;
      goto LABEL_10;
    }
    v9 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 134217984;
      double v15 = v8 / 1000.0;
      v10 = "Navigation Suggestion: Close to event (distance to: %f). Skipping...";
      v11 = v9;
      uint32_t v12 = 12;
LABEL_7:
      _os_log_impl(&dword_1D0F43000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v14, v12);
    }
  }
  else
  {
    v9 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      v10 = "Navigation Suggestion: Current location missing";
      v11 = v9;
      uint32_t v12 = 2;
      goto LABEL_7;
    }
  }

LABEL_10:
  return v6;
}

+ (id)fetchLocationForLOI:(int64_t)a3
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__17;
  v19 = __Block_byref_object_dispose__17;
  id v20 = 0;
  v4 = [MEMORY[0x1E4F935D0] sharedInstance];
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __55__ATXHeuristicNavigationUtilities_fetchLocationForLOI___block_invoke;
  uint32_t v12 = &unk_1E68A5750;
  int v14 = &v15;
  BOOL v6 = v5;
  v13 = v6;
  [v4 fetchLOILocationOfType:a3 reply:&v9];
  objc_msgSend(MEMORY[0x1E4F93B18], "waitForSemaphore:timeoutSeconds:", v6, 2.0, v9, v10, v11, v12);
  id v7 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v7;
}

void __55__ATXHeuristicNavigationUtilities_fetchLocationForLOI___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    double v8 = __atxlog_handle_modes();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __55__ATXHeuristicNavigationUtilities_fetchLocationForLOI___block_invoke_cold_1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
    }

    uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = 0;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)destinationPlacemarkForLocation:(id)a3 withDestinationName:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  [v6 coordinate];
  double v8 = v7;
  [v6 coordinate];
  double v10 = v9;

  uint64_t v11 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 134283777;
    double v16 = v8;
    __int16 v17 = 2049;
    double v18 = v10;
    _os_log_impl(&dword_1D0F43000, v11, OS_LOG_TYPE_DEFAULT, "ATXHeuristicNavigationUtilities: Geolocation from Structured location: (%{private}f), (%{private}f)", (uint8_t *)&v15, 0x16u);
  }

  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F1E5F0]) initWithLatitude:v8 longitude:v10];
  uint64_t v13 = [MEMORY[0x1E4F1E630] placemarkWithLocation:v12 name:v5 postalAddress:0];

  return v13;
}

+ (id)schemaTypeToString:(unint64_t)a3
{
  if (a3 > 2) {
    return @"Unknown";
  }
  else {
    return off_1E68A5770[a3];
  }
}

+ (id)destinationPlacemarkForEvent:(id)a3 name:(id)a4 schemaType:(unint64_t)a5
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v47 = a4;
  double v8 = [v7 customObjectForKey:@"SGEventMetadataKey"];
  double v9 = [v8 objectForKeyedSubscript:@"SGEventMetadataSchemaOrgKey"];
  v48 = [v9 firstObject];
  double v10 = [v7 preferredLocationWithoutPrediction];
  uint64_t v11 = v10;
  if (!v10) {
    goto LABEL_4;
  }
  uint64_t v12 = [v10 geoLocation];

  if (!v12
    || ([v11 geoLocation],
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        [a1 destinationPlacemarkForLocation:v13 withDestinationName:v47],
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        v13,
        !v14))
  {
LABEL_4:
    if (a5 == 1)
    {
      v27 = [v48 objectForKeyedSubscript:@"reservationFor"];
      v28 = [v27 objectForKeyedSubscript:@"address"];
      objc_opt_class();
      objc_opt_isKindOfClass();

      v29 = objc_opt_new();
      if (v29)
      {
        dispatch_semaphore_t v30 = dispatch_semaphore_create(0);
        v31 = objc_opt_new();
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        v53 = __Block_byref_object_copy__17;
        *(void *)&long long v54 = __Block_byref_object_dispose__17;
        *((void *)&v54 + 1) = 0;
        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = __80__ATXHeuristicNavigationUtilities_destinationPlacemarkForEvent_name_schemaType___block_invoke;
        v49[3] = &unk_1E68A52C8;
        v51 = buf;
        v32 = v30;
        v50 = v32;
        [v31 geocodeAddressString:v29 completionHandler:v49];
        [MEMORY[0x1E4F93B18] waitForSemaphore:v32 timeoutSeconds:1.0];
        v33 = *(void **)(*(void *)&buf[8] + 40);
        if (v33)
        {
          v34 = [v33 location];
          uint64_t v14 = [a1 destinationPlacemarkForLocation:v34 withDestinationName:v47];
        }
        else
        {
          uint64_t v14 = 0;
        }

        _Block_object_dispose(buf, 8);
      }
      else
      {
        uint64_t v14 = 0;
      }
    }
    else
    {
      if (a5)
      {
LABEL_22:
        double v18 = __atxlog_handle_context_heuristic();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v44 = [a1 schemaTypeToString:a5];
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v44;
          _os_log_impl(&dword_1D0F43000, v18, OS_LOG_TYPE_DEFAULT, "ATXHeuristicNavigationUtilities: Destination placemark for %@ is empty. Cannot create suggestion", buf, 0xCu);
        }
LABEL_24:
        uint64_t v14 = 0;
        goto LABEL_25;
      }
      int v15 = [v48 objectForKeyedSubscript:@"reservationFor"];
      double v16 = [v15 objectForKeyedSubscript:@"departureAirport"];
      __int16 v17 = [v16 objectForKeyedSubscript:@"geo"];
      double v18 = [v17 objectForKeyedSubscript:@"latitude"];

      uint64_t v19 = [v48 objectForKeyedSubscript:@"reservationFor"];
      id v20 = [v19 objectForKeyedSubscript:@"departureAirport"];
      v21 = [v20 objectForKeyedSubscript:@"geo"];
      v22 = [v21 objectForKeyedSubscript:@"longitude"];

      if (!v18 || !v22)
      {
        v35 = __atxlog_handle_context_heuristic();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138478083;
          *(void *)&buf[4] = v18;
          *(_WORD *)&buf[12] = 2113;
          *(void *)&buf[14] = v22;
          _os_log_impl(&dword_1D0F43000, v35, OS_LOG_TYPE_DEFAULT, "ATXHeuristicNavigationUtilities: Missing latitude/longitude/destination information: %{private}@, %{private}@", buf, 0x16u);
        }

        goto LABEL_24;
      }
      [v18 doubleValue];
      double v24 = v23;
      [v22 doubleValue];
      v26 = (void *)[objc_alloc(MEMORY[0x1E4F1E5F0]) initWithLatitude:v24 longitude:v25];
      uint64_t v14 = [a1 destinationPlacemarkForLocation:v26 withDestinationName:v47];
    }
    if (v14) {
      goto LABEL_20;
    }
    goto LABEL_22;
  }
LABEL_20:
  double v18 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v36 = [a1 schemaTypeToString:a5];
    v37 = [v14 location];
    [v37 coordinate];
    uint64_t v39 = v38;
    v40 = [v14 location];
    [v40 coordinate];
    v42 = v41;
    v43 = [v14 name];
    *(_DWORD *)buf = 138413059;
    *(void *)&buf[4] = v36;
    *(_WORD *)&buf[12] = 2049;
    *(void *)&buf[14] = v39;
    *(_WORD *)&buf[22] = 2049;
    v53 = v42;
    LOWORD(v54) = 2113;
    *(void *)((char *)&v54 + 2) = v43;
    _os_log_impl(&dword_1D0F43000, v18, OS_LOG_TYPE_DEFAULT, "ATXHeuristicNavigationUtilities: For %@, geolocation information: (%{private}f), (%{private}f), (%{private}@)", buf, 0x2Au);
  }
LABEL_25:

  return v14;
}

void __80__ATXHeuristicNavigationUtilities_destinationPlacemarkForEvent_name_schemaType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __80__ATXHeuristicNavigationUtilities_destinationPlacemarkForEvent_name_schemaType___block_invoke_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  uint64_t v14 = [v5 firstObject];
  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  double v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (unint64_t)navigationTypeForString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"WALKING"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"TRANSIT"])
  {
    unint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"CYCLING"])
  {
    unint64_t v4 = 2;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

+ (id)navigationSubtitleForType:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      unint64_t v4 = v3;
      id v5 = @"DRIVING_NAVIGATION_DESTINATION_SUBTITLE";
      goto LABEL_7;
    case 1uLL:
      id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      unint64_t v4 = v3;
      id v5 = @"WALKING_NAVIGATION_DESTINATION_SUBTITLE";
      goto LABEL_7;
    case 2uLL:
      id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      unint64_t v4 = v3;
      id v5 = @"CYCLING_NAVIGATION_DESTINATION_SUBTITLE";
      goto LABEL_7;
    case 3uLL:
      id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      unint64_t v4 = v3;
      id v5 = @"TRANSIT_NAVIGATION_DESTINATION_SUBTITLE";
LABEL_7:
      id v6 = [v3 localizedStringForKey:v5 value:&stru_1F2719D20 table:0];

      break;
    default:
      id v6 = @"Unknown";
      break;
  }

  return v6;
}

+ (id)locationFromEvent:(id)a3 schemaType:(unint64_t)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [a1 destinationPlacemarkForEvent:v6 name:@"destination" schemaType:a4];
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 location];
  }
  else
  {
    uint64_t v10 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = [v6 eventIdentifier];
      int v13 = 138477827;
      uint64_t v14 = v11;
      _os_log_impl(&dword_1D0F43000, v10, OS_LOG_TYPE_INFO, "Empty placemark for event %{private}@", (uint8_t *)&v13, 0xCu);
    }
    uint64_t v9 = 0;
  }

  return v9;
}

+ (BOOL)isAtLocation:(id)a3 maxDistance:(unint64_t)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = +[ATXHeuristicNavigationUtilities getCurrentLocation];
  id v7 = v6;
  BOOL v8 = 0;
  if (v5 && v6)
  {
    [v6 distanceFromLocation:v5];
    double v10 = v9;
    if (v9 <= (double)a4)
    {
      uint64_t v11 = __atxlog_handle_context_heuristic();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 134217984;
        double v14 = v10 / 1000.0;
        _os_log_impl(&dword_1D0F43000, v11, OS_LOG_TYPE_DEFAULT, "ATXHeuristicNavigationUtilities: At location. Distance is %.2fkm", (uint8_t *)&v13, 0xCu);
      }

      BOOL v8 = 1;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

+ (BOOL)allowNavigationSuggestionForLocation:(id)a3 maxDistance:(unint64_t)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = +[ATXHeuristicNavigationUtilities getCurrentLocation];
  id v7 = v6;
  BOOL v8 = 0;
  if (v5 && v6)
  {
    [v6 distanceFromLocation:v5];
    double v10 = v9;
    if (v9 <= 500.0)
    {
      uint64_t v11 = __atxlog_handle_context_heuristic();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 134218240;
        double v16 = v10;
        __int16 v17 = 2048;
        *(void *)&double v18 = 500;
        int v13 = "ATXHeuristicNavigationUtilities: Too close to the event (%.2fkm < %.2lukm)";
        goto LABEL_9;
      }
    }
    else
    {
      uint64_t v11 = __atxlog_handle_context_heuristic();
      BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      if (v10 <= (double)a4)
      {
        if (v12)
        {
          int v15 = 134217984;
          double v16 = v10 / 1000.0;
          _os_log_impl(&dword_1D0F43000, v11, OS_LOG_TYPE_DEFAULT, "ATXHeuristicNavigationUtilities: Distance to destination is %.2fkm", (uint8_t *)&v15, 0xCu);
        }
        BOOL v8 = 1;
        goto LABEL_14;
      }
      if (v12)
      {
        int v15 = 134218240;
        double v16 = v10 / 1000.0;
        __int16 v17 = 2048;
        double v18 = (double)(a4 / 0x3E8);
        int v13 = "ATXHeuristicNavigationUtilities: Will not create navigation to destination since distance %fKM is beyond %fKM";
LABEL_9:
        _os_log_impl(&dword_1D0F43000, v11, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v15, 0x16u);
      }
    }
    BOOL v8 = 0;
LABEL_14:
  }
  return v8;
}

+ (id)placemarkForLOI:(int64_t)a3 name:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [a1 fetchLocationForLOI:a3];
  BOOL v8 = __atxlog_handle_context_heuristic();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      int v17 = 138477827;
      id v18 = v6;
      _os_log_impl(&dword_1D0F43000, v8, OS_LOG_TYPE_DEFAULT, "ATXHeuristicNavigationUtilities: Resolved (%{private}@) to destination", (uint8_t *)&v17, 0xCu);
    }

    [v7 coordinate];
    double v11 = v10;
    [v7 coordinate];
    BOOL v8 = [objc_alloc(MEMORY[0x1E4F1E5F0]) initWithLatitude:v11 longitude:v12];
    int v13 = [MEMORY[0x1E4F1E630] placemarkWithLocation:v8 name:v6 postalAddress:0];
    double v14 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = [v13 name];
      int v17 = 138477827;
      id v18 = v15;
      _os_log_impl(&dword_1D0F43000, v14, OS_LOG_TYPE_DEFAULT, "ATXHeuristicNavigationUtilities: Location Resolved for (%{private}@)", (uint8_t *)&v17, 0xCu);
    }
  }
  else
  {
    if (v9)
    {
      int v17 = 138412290;
      id v18 = v6;
      _os_log_impl(&dword_1D0F43000, v8, OS_LOG_TYPE_DEFAULT, "ATXHeuristicNavigationUtilities: Unable to resolve %@ to destination", (uint8_t *)&v17, 0xCu);
    }
    int v13 = 0;
  }

  return v13;
}

+ (id)navigationSuggestionActionForLOI:(int64_t)a3 destinationName:(id)a4 schemaForEvent:(id)a5 withScore:(double)a6 transportType:(id)a7 predictionReason:(unint64_t)a8 validStartDate:(id)a9 validEndDate:(id)a10 heuristicDevice:(id)a11
{
  id v18 = a5;
  id v19 = a7;
  id v20 = a9;
  id v21 = a10;
  id v22 = a11;
  double v23 = [a1 placemarkForLOI:a3 name:a4];
  if (v23)
  {
    LOBYTE(v26) = 0;
    double v24 = +[ATXHeuristicNavigationUtilities navigationSuggestionActionForDestination:v23 event:0 transportType:v19 schemaForEvent:v18 predictionReasons:a8 heuristicDevice:v22 score:a6 shouldClearOnEngagement:v26 validStartDate:v20 validEndDate:v21];
  }
  else
  {
    double v24 = 0;
  }

  return v24;
}

+ (double)_travelTimeInSecondsWithEvent:(id)a3 destination:(id)a4 transportType:(id)a5 heuristicDevice:(id)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = a5;
  int v13 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    double v14 = [v9 eventIdentifier];
    int v15 = [v10 name];
    int v28 = 138412546;
    v29 = v14;
    __int16 v30 = 2112;
    v31 = v15;
    _os_log_impl(&dword_1D0F43000, v13, OS_LOG_TYPE_DEFAULT, "ATXHeuristicNavigationUtilities: Compute travel time for event Id %@ (or destination %@)", (uint8_t *)&v28, 0x16u);
  }
  double v16 = objc_opt_new();
  int v17 = [v16 travelTimeToEvent:v9 destination:v10 transportType:v12 heuristicDevice:v11];

  if (v17)
  {
    id v18 = [v16 resolvedTimeInformation];
    id v19 = [v18 objectForKeyedSubscript:@"estimatedTravelTime"];

    id v20 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      [v19 doubleValue];
      int v28 = 134217984;
      v29 = v21;
      _os_log_impl(&dword_1D0F43000, v20, OS_LOG_TYPE_DEFAULT, "ATXHeuristicNavigationUtilities: Travel to destination time: %fs", (uint8_t *)&v28, 0xCu);
    }

    [v19 doubleValue];
    if (v22 == 0.0)
    {
      double v23 = [v17 objectForKeyedSubscript:@"estimatedTravelTime"];

      [v23 doubleValue];
      if (v25 == 0.0)
      {
        double v24 = -1.0;
        goto LABEL_12;
      }
      id v19 = v23;
    }
    else
    {
      double v23 = v19;
    }
    [v19 doubleValue];
    double v24 = v26;
LABEL_12:

    goto LABEL_13;
  }
  double v24 = -1.0;
LABEL_13:

  return v24;
}

+ (id)_titleWithTravelTimeInSeconds:(double)a3 destinationName:(id)a4
{
  id v5 = a4;
  id v6 = objc_opt_new();
  [v6 setUnitsStyle:2];
  [v6 setAllowedUnits:96];
  id v7 = [v6 stringFromTimeInterval:a3];
  BOOL v8 = NSString;
  id v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"NAVIGATION_DESTINATION_TITLE" value:&stru_1F2719D20 table:0];
  id v11 = objc_msgSend(v8, "localizedStringWithFormat:", v10, v7, v5);

  return v11;
}

+ (id)navigationSuggestionActionForDestination:(id)a3 event:(id)a4 transportType:(id)a5 schemaForEvent:(id)a6 predictionReasons:(unint64_t)a7 heuristicDevice:(id)a8 score:(double)a9 shouldClearOnEngagement:(BOOL)a10 validStartDate:(id)a11 validEndDate:(id)a12
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v54 = a6;
  id v21 = a8;
  id v22 = a11;
  id v23 = a12;
  v52 = v20;
  unint64_t v24 = +[ATXHeuristicNavigationUtilities navigationTypeForString:v20];
  double v25 = [v18 name];
  double v26 = +[ATXHeuristicNavigationUtilities navigationSubtitleForType:v24];
  v53 = v23;
  if ([v25 length])
  {
    id v50 = v19;
    v51 = v21;
    id v27 = objc_alloc(MEMORY[0x1E4F28C18]);
    int v28 = v22;
    if (!v22)
    {
      int v28 = [MEMORY[0x1E4F1C9C8] distantPast];
    }
    v49 = v26;
    unint64_t v29 = a7;
    if (v23)
    {
      __int16 v30 = [v27 initWithStartDate:v28 endDate:v23];
    }
    else
    {
      uint64_t v32 = [MEMORY[0x1E4F1C9C8] distantFuture];
      __int16 v30 = [v27 initWithStartDate:v28 endDate:v32];
    }
    if (!v22) {

    }
    v33 = [v51 now];
    int v34 = [v30 containsDate:v33];

    double v35 = 0.0;
    if (v34)
    {
      id v19 = v50;
      [a1 _travelTimeInSecondsWithEvent:v50 destination:v18 transportType:v52 heuristicDevice:v51];
      double v35 = v36;
      if (v36 >= 180.0)
      {
        uint64_t v39 = [a1 _titleWithTravelTimeInSeconds:v25 destinationName:v36];

        double v25 = (void *)v39;
      }
      else
      {
        id v21 = v51;
        v37 = __atxlog_handle_context_heuristic();
        BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
        if (v35 != -1.0)
        {
          if (v38)
          {
            *(_DWORD *)buf = 134217984;
            double v56 = v35;
            _os_log_impl(&dword_1D0F43000, v37, OS_LOG_TYPE_DEFAULT, "ATXHeuristicNavigationUtilities: Travel to destination time is below minimum [%f]. Navigation suggestion is skipped", buf, 0xCu);
          }
          v31 = 0;
          goto LABEL_29;
        }
        if (v38)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0F43000, v37, OS_LOG_TYPE_DEFAULT, "ATXHeuristicNavigationUtilities: Travel to destination time returned -1. Navigation suggestion is included without ETA", buf, 2u);
        }

        double v35 = -1.0;
      }
    }
    else
    {
      id v19 = v50;
    }
    v40 = [ATXContextNavigationSuggestionProducer alloc];
    v41 = [v18 name];
    v37 = [(ATXContextNavigationSuggestionProducer *)v40 initWithTitle:v25 event:v19 schemaForEvent:v54 alternateDestinationTitle:v41];

    id v42 = v53;
    if ((v29 & 0x3000000000) != 0 && v35 > 1800.0)
    {
      uint64_t v43 = [v22 dateByAddingTimeInterval:v35];

      id v42 = (id)v43;
    }
    id v21 = v51;
    v44 = [v18 name];
    v31 = [v37 suggestionForNavigationToDestination:v18 transportType:v24 destinationName:v44 subtitle:v49 predictionReasons:v29 score:a10 shouldClearOnEngagement:a9 validStartDate:v22 validEndDate:v42];

    if (v31)
    {
      +[ATXHeuristicFlightEventUtilities logSuggestion:v31 description:@"ATXHeuristicNavigationUtilities: Navigation to destination suggestion"];
      id v45 = v31;
    }
    else
    {
      v46 = __atxlog_handle_context_heuristic();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v56 = *(double *)&v29;
        _os_log_impl(&dword_1D0F43000, v46, OS_LOG_TYPE_DEFAULT, "ATXHeuristicNavigationUtilities: Could not create navigation suggestion for prediction reason: %llu", buf, 0xCu);
      }

      id v21 = v51;
    }

    id v19 = v50;
LABEL_29:

    double v26 = v49;
    goto LABEL_30;
  }
  __int16 v30 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0F43000, v30, OS_LOG_TYPE_DEFAULT, "ATXHeuristicNavigationUtilities: Travel to destination name is nil or empty. Navigation suggestion is skipped", buf, 2u);
  }
  v31 = 0;
LABEL_30:

  return v31;
}

+ (id)navigationSuggestionActionForEvent:(id)a3 schemaForEvent:(id)a4 transportType:(id)a5 predictionReasons:(unint64_t)a6 heuristicDevice:(id)a7 score:(double)a8 validStartDate:(id)a9 validEndDate:(id)a10
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v55 = a7;
  id v57 = a9;
  id v56 = a10;
  id v20 = [v17 customObjectForKey:@"SGEventMetadataKey"];
  id v21 = v20;
  if (!v18)
  {
    id v22 = [v20 objectForKeyedSubscript:@"SGEventMetadataSchemaOrgKey"];
    id v18 = [v22 firstObject];
  }
  id v23 = [v21 objectForKeyedSubscript:@"SGEventMetadataCategoryDescriptionKey"];
  unsigned int v24 = [v23 isEqualToString:@"Lodging"];

  double v25 = [v17 preferredLocationWithoutPrediction];
  double v26 = v25;
  if ((a6 & 0x80000000) != 0)
  {
    id v37 = v19;
    BOOL v38 = [v18 objectForKeyedSubscript:@"reservationFor"];
    uint64_t v39 = [v38 objectForKeyedSubscript:@"departureAirport"];
    int v28 = [v39 objectForKeyedSubscript:@"iataCode"];

    if (!v28 && v26)
    {
      v40 = [v26 title];

      id v19 = v37;
      if (!v40)
      {
LABEL_23:
        id v47 = __atxlog_handle_context_heuristic();
        if (!os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_35;
        }
        __int16 v60 = 0;
        v48 = "ATXHeuristicNavigationUtilities: For Upcoming flight, destination is empty";
        v49 = (uint8_t *)&v60;
        goto LABEL_27;
      }
      v41 = [v26 title];
      id v42 = [v41 componentsSeparatedByString:@"\n"];
      int v28 = [v42 firstObject];
    }
    id v19 = v37;
    if (v28)
    {
      id v33 = a1;
      id v34 = v17;
      double v35 = v28;
      uint64_t v36 = 0;
      goto LABEL_30;
    }
    goto LABEL_23;
  }
  if (((a6 >> 33) & v24) != 1)
  {
    if ((a6 & 0x300000) == 0)
    {
      id v47 = __atxlog_handle_context_heuristic();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT)) {
        +[ATXHeuristicNavigationUtilities navigationSuggestionActionForEvent:schemaForEvent:transportType:predictionReasons:heuristicDevice:score:validStartDate:validEndDate:](a6, v47);
      }
      goto LABEL_35;
    }
    if (v25 && ([v25 title], uint64_t v43 = objc_claimAutoreleasedReturnValue(), v43, v43))
    {
      id v54 = [v26 title];
      [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@",\n"];
      id v45 = v44 = v19;
      v46 = [v54 componentsSeparatedByCharactersInSet:v45];
      int v28 = [v46 firstObject];

      id v19 = v44;
      if (!v28)
      {
LABEL_21:
        id v47 = __atxlog_handle_context_heuristic();
        if (!os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_35;
        }
        __int16 v58 = 0;
        v48 = "ATXHeuristicNavigationUtilities: For upcoming event, destination is empty";
        v49 = (uint8_t *)&v58;
LABEL_27:
        _os_log_impl(&dword_1D0F43000, v47, OS_LOG_TYPE_DEFAULT, v48, v49, 2u);
        goto LABEL_35;
      }
    }
    else
    {
      int v28 = [v17 title];
      if (!v28) {
        goto LABEL_21;
      }
    }
    id v33 = a1;
    id v34 = v17;
    double v35 = v28;
    uint64_t v36 = 2;
    goto LABEL_30;
  }
  id v27 = [v18 objectForKeyedSubscript:@"reservationFor"];
  int v28 = [v27 objectForKeyedSubscript:@"name"];

  if (!v28 && v26)
  {
    unint64_t v29 = [v26 title];

    if (!v29) {
      goto LABEL_25;
    }
    __int16 v30 = [v26 title];
    [v30 componentsSeparatedByString:@"\n"];
    uint64_t v32 = v31 = v19;
    int v28 = [v32 firstObject];

    id v19 = v31;
  }
  if (!v28)
  {
LABEL_25:
    id v47 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v48 = "ATXHeuristicNavigationUtilities: For concluded flight, destination is empty";
      v49 = buf;
      goto LABEL_27;
    }
LABEL_35:
    int v28 = 0;
    v51 = 0;
    id v50 = v55;
    goto LABEL_36;
  }
  id v33 = a1;
  id v34 = v17;
  double v35 = v28;
  uint64_t v36 = 1;
LABEL_30:
  id v47 = [v33 destinationPlacemarkForEvent:v34 name:v35 schemaType:v36];
  if (!v47)
  {
    v51 = 0;
    id v50 = v55;
    goto LABEL_37;
  }
  id v50 = v55;
  LOBYTE(v53) = 0;
  v51 = [a1 navigationSuggestionActionForDestination:v47 event:v17 transportType:v19 schemaForEvent:v18 predictionReasons:a6 heuristicDevice:v55 score:a8 shouldClearOnEngagement:v53 validStartDate:v57 validEndDate:v56];
LABEL_36:

LABEL_37:

  return v51;
}

+ (id)_dateIntervalWithEvent:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F28C18];
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = [v4 startDate];
  id v7 = [v4 endDate];

  BOOL v8 = (void *)[v5 initWithStartDate:v6 endDate:v7];

  return v8;
}

void __55__ATXHeuristicNavigationUtilities_fetchLocationForLOI___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __80__ATXHeuristicNavigationUtilities_destinationPlacemarkForEvent_name_schemaType___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)navigationSuggestionActionForEvent:(uint64_t)a1 schemaForEvent:(NSObject *)a2 transportType:predictionReasons:heuristicDevice:score:validStartDate:validEndDate:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D0F43000, a2, OS_LOG_TYPE_FAULT, "ATXHeuristicNavigationUtilities: Navigation called for an unsupported prediction %llu reason", (uint8_t *)&v2, 0xCu);
}

@end