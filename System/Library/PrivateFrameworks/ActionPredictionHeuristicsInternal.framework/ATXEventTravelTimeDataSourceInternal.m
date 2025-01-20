@interface ATXEventTravelTimeDataSourceInternal
+ (id)sharedInstance;
- (ATXEventTravelTimeDataSourceInternal)init;
- (void)travelTimeInfoForEventID:(id)a3 location:(id)a4 expectedArrivalDate:(id)a5 transportType:(id)a6 localOnlyAfterFirstUpdate:(BOOL)a7 heuristicDevice:(id)a8 callback:(id)a9;
@end

@implementation ATXEventTravelTimeDataSourceInternal

- (ATXEventTravelTimeDataSourceInternal)init
{
  v9.receiver = self;
  v9.super_class = (Class)ATXEventTravelTimeDataSourceInternal;
  v2 = [(ATXEventTravelTimeDataSourceInternal *)&v9 init];
  if (v2)
  {
    v3 = objc_opt_new();
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F93B48]) initWithCountLimit:5];
    v5 = (void *)v3[1];
    v3[1] = v4;

    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v3];
    hypothesizerCacheLock = v2->_hypothesizerCacheLock;
    v2->_hypothesizerCacheLock = (_PASLock *)v6;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken4 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken4, &__block_literal_global_3);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_1;

  return v2;
}

void __54__ATXEventTravelTimeDataSourceInternal_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F43D0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_1;
  sharedInstance__pasExprOnceResult_1 = v1;
}

- (void)travelTimeInfoForEventID:(id)a3 location:(id)a4 expectedArrivalDate:(id)a5 transportType:(id)a6 localOnlyAfterFirstUpdate:(BOOL)a7 heuristicDevice:(id)a8 callback:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v58 = a6;
  id v60 = a8;
  v18 = (void (**)(id, void *, void))a9;
  uint64_t v78 = 0;
  v79 = &v78;
  uint64_t v80 = 0x3032000000;
  v81 = __Block_byref_object_copy__7;
  v82 = __Block_byref_object_dispose__7;
  id v83 = 0;
  v61 = [v17 dateByAddingTimeInterval:1200.0];
  v59 = v15;
  if (v15)
  {
    v19 = [v60 eventStore];
    v20 = [v19 eventWithIdentifier:v59];

    v21 = [v20 structuredLocation];
    if (v21
      && ([v20 structuredLocation],
          v22 = objc_claimAutoreleasedReturnValue(),
          [v22 geoLocation],
          v23 = objc_claimAutoreleasedReturnValue(),
          v23,
          v22,
          v21,
          v23))
    {
      uint64_t v24 = [v20 endDate];

      v25 = [v20 structuredLocation];
      uint64_t v26 = [v25 geoLocation];

      v61 = (void *)v24;
      id v16 = (id)v26;
    }
    else
    {
      v25 = __atxlog_handle_heuristic();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        -[ATXEventTravelTimeDataSourceInternal travelTimeInfoForEventID:location:expectedArrivalDate:transportType:localOnlyAfterFirstUpdate:heuristicDevice:callback:].cold.5();
      }
    }
  }
  uint64_t v74 = 0;
  v75 = &v74;
  uint64_t v76 = 0x2020000000;
  char v77 = 0;
  if (v16)
  {
    uint64_t v27 = objc_opt_new();
    v28 = NSString;
    [v16 coordinate];
    uint64_t v30 = v29;
    [v16 coordinate];
    uint64_t v32 = objc_msgSend(v28, "stringWithFormat:", @"%f,%f", v30, v31);
    v33 = *(void **)(v27 + 8);
    *(void *)(v27 + 8) = v32;

    objc_storeStrong((id *)(v27 + 16), a6);
    *(unsigned char *)(v27 + 24) = a7;
    hypothesizerCacheLock = self->_hypothesizerCacheLock;
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __159__ATXEventTravelTimeDataSourceInternal_travelTimeInfoForEventID_location_expectedArrivalDate_transportType_localOnlyAfterFirstUpdate_heuristicDevice_callback___block_invoke;
    v64[3] = &unk_1E68A5248;
    v71 = &v78;
    id v35 = (id)v27;
    id v65 = v35;
    id v66 = v16;
    id v67 = v17;
    id v68 = v61;
    BOOL v73 = a7;
    v72 = &v74;
    id v69 = v58;
    v70 = self;
    [(_PASLock *)hypothesizerCacheLock runWithLockAcquired:v64];
  }
  v36 = (void *)v79[5];
  if (!v36
    || ([v36 currentHypothesis],
        v37 = objc_claimAutoreleasedReturnValue(),
        v37,
        !v37))
  {
    if (*((unsigned char *)v75 + 24))
    {
      v47 = __atxlog_handle_heuristic();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
        -[ATXEventTravelTimeDataSourceInternal travelTimeInfoForEventID:location:expectedArrivalDate:transportType:localOnlyAfterFirstUpdate:heuristicDevice:callback:]();
      }

      if (v16)
      {
        uint64_t v48 = objc_opt_new();
        v49 = NSString;
        [v16 coordinate];
        uint64_t v51 = v50;
        [v16 coordinate];
        uint64_t v53 = objc_msgSend(v49, "stringWithFormat:", @"%f,%f", v51, v52);
        v54 = *(void **)(v48 + 8);
        *(void *)(v48 + 8) = v53;

        objc_storeStrong((id *)(v48 + 16), a6);
        *(unsigned char *)(v48 + 24) = a7;
        v55 = self->_hypothesizerCacheLock;
        v62[0] = MEMORY[0x1E4F143A8];
        v62[1] = 3221225472;
        v62[2] = __159__ATXEventTravelTimeDataSourceInternal_travelTimeInfoForEventID_location_expectedArrivalDate_transportType_localOnlyAfterFirstUpdate_heuristicDevice_callback___block_invoke_35;
        v62[3] = &unk_1E68A5270;
        v44 = (id)v48;
        v63 = v44;
        [(_PASLock *)v55 runWithLockAcquired:v62];

        v46 = 0;
        v40 = 0;
        double v43 = 0.0;
        goto LABEL_27;
      }
      v44 = __atxlog_handle_heuristic();
      double v43 = 0.0;
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
        -[ATXEventTravelTimeDataSourceInternal travelTimeInfoForEventID:location:expectedArrivalDate:transportType:localOnlyAfterFirstUpdate:heuristicDevice:callback:]();
      }
    }
    else
    {
      v44 = __atxlog_handle_heuristic();
      double v43 = 0.0;
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
        -[ATXEventTravelTimeDataSourceInternal travelTimeInfoForEventID:location:expectedArrivalDate:transportType:localOnlyAfterFirstUpdate:heuristicDevice:callback:]();
      }
    }
    v46 = 0;
    v40 = 0;
    goto LABEL_27;
  }
  v38 = __atxlog_handle_heuristic();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
    -[ATXEventTravelTimeDataSourceInternal travelTimeInfoForEventID:location:expectedArrivalDate:transportType:localOnlyAfterFirstUpdate:heuristicDevice:callback:].cold.4();
  }

  v39 = [(id)v79[5] currentHypothesis];
  v40 = [v39 generationDate];

  v41 = [(id)v79[5] currentHypothesis];
  [v41 estimatedTravelTime];
  double v43 = v42;

  v44 = [(id)v79[5] currentHypothesis];
  unint64_t v45 = [v44 travelState];
  if (v45 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %lu)", v45);
    v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v46 = off_1E68A5290[v45];
  }
LABEL_27:

  v56 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
  [v56 setObject:v40 forKeyedSubscript:@"generationDate"];
  v57 = [NSNumber numberWithDouble:v43];
  [v56 setObject:v57 forKeyedSubscript:@"estimatedTravelTime"];

  [v56 setObject:v46 forKeyedSubscript:@"travelState"];
  v18[2](v18, v56, 0);

  _Block_object_dispose(&v74, 8);
  _Block_object_dispose(&v78, 8);
}

void __159__ATXEventTravelTimeDataSourceInternal_travelTimeInfoForEventID_location_expectedArrivalDate_transportType_localOnlyAfterFirstUpdate_heuristicDevice_callback___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  uint64_t v4 = [v3[1] objectForKey:*(void *)(a1 + 32)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 80) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40))
  {
    v7 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __159__ATXEventTravelTimeDataSourceInternal_travelTimeInfoForEventID_location_expectedArrivalDate_transportType_localOnlyAfterFirstUpdate_heuristicDevice_callback___block_invoke_cold_2();
    }
  }
  else
  {
    [*(id *)(a1 + 40) coordinate];
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F64858]), "initWithCoordinate:", v8, v9);
    [v7 setArrivalDate:*(void *)(a1 + 48)];
    [v7 setExpirationDate:*(void *)(a1 + 56)];
    id v10 = *(id *)(a1 + 64);
    if ([v10 isEqualToString:@"AUTOMOBILE"])
    {
      uint64_t v11 = 0;
    }
    else if ([v10 isEqualToString:@"TRANSIT"])
    {
      uint64_t v11 = 1;
    }
    else if ([v10 isEqualToString:@"WALKING"])
    {
      uint64_t v11 = 2;
    }
    else if ([v10 isEqualToString:@"BICYCLE"])
    {
      uint64_t v11 = 3;
    }
    else if ([v10 isEqualToString:@"UNKNOWN_TRANSPORT_TYPE"])
    {
      uint64_t v11 = 4;
    }
    else if ([v10 isEqualToString:@"FERRY"])
    {
      uint64_t v11 = 5;
    }
    else if ([v10 isEqualToString:@"RIDESHARE"])
    {
      uint64_t v11 = 6;
    }
    else
    {
      uint64_t v11 = 0;
    }

    [v7 setTransportType:v11];
    v12 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      [*(id *)(a1 + 40) coordinate];
      uint64_t v14 = v13;
      [*(id *)(a1 + 40) coordinate];
      *(_DWORD *)buf = 134218240;
      uint64_t v31 = v14;
      __int16 v32 = 2048;
      uint64_t v33 = v15;
      _os_log_impl(&dword_1D0F43000, v12, OS_LOG_TYPE_INFO, "Begin Route Hypothesis to destination: (%f, %f)", buf, 0x16u);
    }

    uint64_t v16 = [MEMORY[0x1E4F649C0] hypothesizerForPlannedDestination:v7];
    uint64_t v17 = *(void *)(*(void *)(a1 + 80) + 8);
    v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;

    uint64_t v19 = *(void *)(a1 + 80);
    v20 = *(void **)(*(void *)(v19 + 8) + 40);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __159__ATXEventTravelTimeDataSourceInternal_travelTimeInfoForEventID_location_expectedArrivalDate_transportType_localOnlyAfterFirstUpdate_heuristicDevice_callback___block_invoke_29;
    v24[3] = &unk_1E68A5220;
    char v29 = *(unsigned char *)(a1 + 96);
    uint64_t v27 = v19;
    id v21 = *(id *)(a1 + 40);
    uint64_t v28 = *(void *)(a1 + 88);
    uint64_t v22 = *(void *)(a1 + 72);
    id v25 = v21;
    uint64_t v26 = v22;
    [v20 startHypothesizingWithUpdateHandler:v24];
    [v3[1] setObject:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) forKey:*(void *)(a1 + 32)];
    v23 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      __159__ATXEventTravelTimeDataSourceInternal_travelTimeInfoForEventID_location_expectedArrivalDate_transportType_localOnlyAfterFirstUpdate_heuristicDevice_callback___block_invoke_cold_1();
    }
  }
}

void __159__ATXEventTravelTimeDataSourceInternal_travelTimeInfoForEventID_location_expectedArrivalDate_transportType_localOnlyAfterFirstUpdate_heuristicDevice_callback___block_invoke_29(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 64)) {
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) onlyPerformLocalUpdates];
  }
  v2 = __atxlog_handle_heuristic();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    [*(id *)(a1 + 32) coordinate];
    uint64_t v4 = v3;
    [*(id *)(a1 + 32) coordinate];
    int v12 = 134218240;
    uint64_t v13 = v4;
    __int16 v14 = 2048;
    uint64_t v15 = v5;
    _os_log_impl(&dword_1D0F43000, v2, OS_LOG_TYPE_INFO, "Route hypothesizer received update (%f, %f). Checking for validity.", (uint8_t *)&v12, 0x16u);
  }

  if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) state] == 2
    || [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) state] == 3)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    uint64_t v6 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) state];
      int v12 = 134217984;
      uint64_t v13 = v7;
      _os_log_impl(&dword_1D0F43000, v6, OS_LOG_TYPE_INFO, "Route hypothesizer has failed. Status: %lu. Note: This could be because user is too far from the desired destination.", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    double v8 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      [*(id *)(a1 + 32) coordinate];
      uint64_t v10 = v9;
      [*(id *)(a1 + 32) coordinate];
      int v12 = 134218240;
      uint64_t v13 = v10;
      __int16 v14 = 2048;
      uint64_t v15 = v11;
      _os_log_impl(&dword_1D0F43000, v8, OS_LOG_TYPE_INFO, "Hypothesis is valid (%f, %f). Posting ATXEventTravelTimeUpdated notification.", (uint8_t *)&v12, 0x16u);
    }

    uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 postNotificationName:@"ATXTravelTimeUpdated" object:*(void *)(a1 + 40)];
  }
}

void __159__ATXEventTravelTimeDataSourceInternal_travelTimeInfoForEventID_location_expectedArrivalDate_transportType_localOnlyAfterFirstUpdate_heuristicDevice_callback___block_invoke_35(uint64_t a1, uint64_t a2)
{
  [*(id *)(a2 + 8) removeObjectForKey:*(void *)(a1 + 32)];
  v2 = __atxlog_handle_heuristic();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __159__ATXEventTravelTimeDataSourceInternal_travelTimeInfoForEventID_location_expectedArrivalDate_transportType_localOnlyAfterFirstUpdate_heuristicDevice_callback___block_invoke_35_cold_1();
  }
}

- (void).cxx_destruct
{
}

- (void)travelTimeInfoForEventID:location:expectedArrivalDate:transportType:localOnlyAfterFirstUpdate:heuristicDevice:callback:.cold.1()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_1D0F43000, v0, v1, "Event does not have a route hypothesis. Returning 0 for travel time, nil generationDate, and nil travel state.", v2, v3, v4, v5, v6);
}

- (void)travelTimeInfoForEventID:location:expectedArrivalDate:transportType:localOnlyAfterFirstUpdate:heuristicDevice:callback:.cold.2()
{
  OUTLINED_FUNCTION_1_3();
  _os_log_error_impl(&dword_1D0F43000, v0, OS_LOG_TYPE_ERROR, "Failed to remove the failed RouteHypothesizer from the cache because location was nil.", v1, 2u);
}

- (void)travelTimeInfoForEventID:location:expectedArrivalDate:transportType:localOnlyAfterFirstUpdate:heuristicDevice:callback:.cold.3()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_1D0F43000, v0, v1, "Route hypothesizer failed. Need to re-register it...", v2, v3, v4, v5, v6);
}

- (void)travelTimeInfoForEventID:location:expectedArrivalDate:transportType:localOnlyAfterFirstUpdate:heuristicDevice:callback:.cold.4()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_1D0F43000, v0, v1, "Event has a route hypothesis. Returning travel time information.", v2, v3, v4, v5, v6);
}

- (void)travelTimeInfoForEventID:location:expectedArrivalDate:transportType:localOnlyAfterFirstUpdate:heuristicDevice:callback:.cold.5()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_1D0F43000, v0, v1, "Attempted to create a new GEORouteHypothesizer for event with unspecified structured location or geolocation. Cannot provide travel time updates.", v2, v3, v4, v5, v6);
}

void __159__ATXEventTravelTimeDataSourceInternal_travelTimeInfoForEventID_location_expectedArrivalDate_transportType_localOnlyAfterFirstUpdate_heuristicDevice_callback___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_1D0F43000, v0, v1, "Created and started new GEORouteHypothesizer for event, and added GEORouteHypothesizer to the cache.", v2, v3, v4, v5, v6);
}

void __159__ATXEventTravelTimeDataSourceInternal_travelTimeInfoForEventID_location_expectedArrivalDate_transportType_localOnlyAfterFirstUpdate_heuristicDevice_callback___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_1D0F43000, v0, v1, "Pre-existing route hypothesizer found for event.", v2, v3, v4, v5, v6);
}

void __159__ATXEventTravelTimeDataSourceInternal_travelTimeInfoForEventID_location_expectedArrivalDate_transportType_localOnlyAfterFirstUpdate_heuristicDevice_callback___block_invoke_35_cold_1()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_1D0F43000, v0, v1, "Removed the failed RouteHypothesizer from the cache.", v2, v3, v4, v5, v6);
}

@end