@interface ATXSleepSuggestionServer
+ (id)sharedInstance;
- (ATXSleepSuggestionServer)init;
- (ATXSleepSuggestionServer)initWithEvents:(id)a3;
- (BOOL)isSleepScheduleBetweenTheBoundariesWithBedtime:(id)a3 wakeupTime:(id)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSArray)events;
- (NSXPCListener)listener;
- (id)queryEvents;
- (void)predictedSleepSuggestionWithCompletionHandler:(id)a3;
- (void)queryEvents;
- (void)setEvents:(id)a3;
- (void)setListener:(id)a3;
@end

@implementation ATXSleepSuggestionServer

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_5 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6_5, &__block_literal_global_41);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_6;
  return v2;
}

void __42__ATXSleepSuggestionServer_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_6;
  sharedInstance__pasExprOnceResult_6 = v1;
}

- (ATXSleepSuggestionServer)init
{
  v8.receiver = self;
  v8.super_class = (Class)ATXSleepSuggestionServer;
  v2 = [(ATXSleepSuggestionServer *)&v8 init];
  if (v2)
  {
    v3 = __atxlog_handle_sleep_schedule();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, "ATXSleepSuggestionServer: launched", v7, 2u);
    }

    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.proactive.sleepSchedule"];
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v4;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    [(NSXPCListener *)v2->_listener resume];
  }
  return v2;
}

- (ATXSleepSuggestionServer)initWithEvents:(id)a3
{
  id v5 = a3;
  v6 = [(ATXSleepSuggestionServer *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_events, a3);
  }

  return v7;
}

- (void)predictedSleepSuggestionWithCompletionHandler:(id)a3
{
  v82[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, void, void *))a3;
  if (!self->_events)
  {
    id v5 = [(ATXSleepSuggestionServer *)self queryEvents];
    events = self->_events;
    self->_events = v5;
  }
  v7 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  objc_super v8 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
  [v7 setTimeZone:v8];

  id v9 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v9 setDateFormat:@"HH:mm"];
  v10 = objc_opt_new();
  v11 = objc_opt_new();
  v12 = self->_events;
  if (v12 && [(NSArray *)v12 count])
  {
    v67 = v7;
    v68 = (void (**)(id, void *, void))v4;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    v66 = self;
    v13 = self->_events;
    uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v70 objects:v80 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v71;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v71 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v70 + 1) + 8 * i);
          v19 = [v18 startDate];
          v20 = [v9 stringFromDate:v19];
          [v10 addObject:v20];

          v21 = __atxlog_handle_modes();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
            -[ATXSleepSuggestionServer predictedSleepSuggestionWithCompletionHandler:].cold.8((uint64_t)v79, (uint64_t)v18);
          }

          v22 = [v18 endDate];
          v23 = [v9 stringFromDate:v22];
          [v11 addObject:v23];

          v24 = __atxlog_handle_modes();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
            -[ATXSleepSuggestionServer predictedSleepSuggestionWithCompletionHandler:].cold.7((uint64_t)v78, (uint64_t)v18);
          }
        }
        uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v70 objects:v80 count:16];
      }
      while (v15);
    }

    if ((unint64_t)[v10 count] >= 3 && (unint64_t)objc_msgSend(v11, "count") > 2)
    {
      [v10 sortUsingSelector:sel_compare_];
      [v11 sortUsingSelector:sel_compare_];
      v37 = __atxlog_handle_sleep_schedule();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
        -[ATXSleepSuggestionServer predictedSleepSuggestionWithCompletionHandler:].cold.6();
      }

      v38 = __atxlog_handle_sleep_schedule();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
        -[ATXSleepSuggestionServer predictedSleepSuggestionWithCompletionHandler:].cold.5();
      }

      id v31 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
      v39 = objc_msgSend(v11, "objectAtIndexedSubscript:", (unint64_t)objc_msgSend(v11, "count") >> 1);
      v40 = [v39 componentsSeparatedByString:@":"];
      v41 = [v40 firstObject];
      objc_msgSend(v31, "setHour:", objc_msgSend(v41, "integerValue"));

      v69 = v39;
      v42 = [v39 componentsSeparatedByString:@":"];
      v43 = [v42 lastObject];
      objc_msgSend(v31, "setMinute:", objc_msgSend(v43, "integerValue"));

      [v31 setCalendar:v67];
      v44 = [v67 timeZone];
      [v31 setTimeZone:v44];

      id v45 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
      v46 = objc_msgSend(v10, "objectAtIndexedSubscript:", (unint64_t)objc_msgSend(v10, "count") >> 1);
      v47 = [v46 componentsSeparatedByString:@":"];
      v48 = [v47 firstObject];
      objc_msgSend(v45, "setHour:", objc_msgSend(v48, "integerValue"));

      v49 = [v46 componentsSeparatedByString:@":"];
      v50 = [v49 lastObject];
      objc_msgSend(v45, "setMinute:", objc_msgSend(v50, "integerValue"));

      [v45 setCalendar:v67];
      v51 = [v67 timeZone];
      [v45 setTimeZone:v51];

      v52 = __atxlog_handle_sleep_schedule();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG)) {
        [(ATXSleepSuggestionServer *)v45 predictedSleepSuggestionWithCompletionHandler:v52];
      }

      if ([(ATXSleepSuggestionServer *)v66 isSleepScheduleBetweenTheBoundariesWithBedtime:v45 wakeupTime:v31])
      {
        v53 = (NSArray *)[objc_alloc(MEMORY[0x1E4F4B2F8]) initWithBedtimeComponents:v45 wakeupComponents:v31 weekdays:127];
        v54 = (void *)[objc_alloc(MEMORY[0x1E4F4B2E8]) initWithOccurence:v53];
        id v55 = objc_alloc(MEMORY[0x1E4F1CB18]);
        v56 = (void *)[v55 initWithSuiteName:*MEMORY[0x1E4F4B688]];
        uint64_t v57 = 3600 * [v45 hour];
        uint64_t v58 = [v45 minute];
        [v56 setInteger:v57 + 60 * v58 forKey:*MEMORY[0x1E4F4B768]];
        v68[2](v68, v54, 0);
        v59 = v66->_events;
        v66->_events = 0;
      }
      else
      {
        v60 = __atxlog_handle_sleep_schedule();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
          -[ATXSleepSuggestionServer predictedSleepSuggestionWithCompletionHandler:]();
        }

        v61 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v62 = *MEMORY[0x1E4F4ADF8];
        uint64_t v63 = *MEMORY[0x1E4F4AE00];
        uint64_t v74 = *MEMORY[0x1E4F28228];
        v75 = @"Predicted schedule isn't between the boundaries";
        v64 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v75 forKeys:&v74 count:1];
        v65 = [v61 errorWithDomain:v62 code:v63 userInfo:v64];
        ((void (**)(id, void *, void *))v68)[2](v68, 0, v65);

        v53 = v66->_events;
        v66->_events = 0;
      }

      v7 = v67;
      uint64_t v4 = (void (**)(id, void, void *))v68;
    }
    else
    {
      v25 = __atxlog_handle_sleep_schedule();
      v7 = v67;
      uint64_t v4 = (void (**)(id, void, void *))v68;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[ATXSleepSuggestionServer predictedSleepSuggestionWithCompletionHandler:]();
      }

      v26 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v27 = *MEMORY[0x1E4F4ADF8];
      uint64_t v28 = *MEMORY[0x1E4F4ADF0];
      uint64_t v76 = *MEMORY[0x1E4F28228];
      v77 = @"Couldn't find enough events to predict sleep schedule";
      v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v77 forKeys:&v76 count:1];
      v30 = [v26 errorWithDomain:v27 code:v28 userInfo:v29];
      ((void (**)(id, void *, void *))v68)[2](v68, 0, v30);

      id v31 = v66->_events;
      v66->_events = 0;
    }
  }
  else
  {
    v32 = __atxlog_handle_modes();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      -[ATXSleepSuggestionServer predictedSleepSuggestionWithCompletionHandler:]();
    }

    v33 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v34 = *MEMORY[0x1E4F4ADF8];
    uint64_t v35 = *MEMORY[0x1E4F4AE00];
    uint64_t v81 = *MEMORY[0x1E4F28228];
    v82[0] = @"ATXSleepSuggestionServer: Failed to retrieve userIsFirstBacklightOnAfterWakeup";
    id v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v82 forKeys:&v81 count:1];
    v36 = [v33 errorWithDomain:v34 code:v35 userInfo:v31];
    v4[2](v4, 0, v36);
  }
}

- (id)queryEvents
{
  v48[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:1];
  uint64_t v3 = [MEMORY[0x1E4F5B5F8] userIsFirstBacklightOnAfterWakeup];
  uint64_t v4 = (void *)MEMORY[0x1E4F5B518];
  v33 = (void *)v3;
  v48[0] = v3;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:1];
  uint64_t v34 = (void *)v2;
  uint64_t v47 = v2;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
  v7 = [v4 eventQueryWithPredicate:0 eventStreams:v5 offset:0 limit:100000 sortDescriptors:v6];

  objc_super v8 = [MEMORY[0x1E4F5B560] knowledgeStore];
  id v9 = __atxlog_handle_default();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [v7 eventStreams];
    v11 = [v10 firstObject];
    v12 = [v11 name];
    *(_DWORD *)buf = 138543874;
    v42 = v12;
    __int16 v43 = 2080;
    v44 = "-[ATXSleepSuggestionServer queryEvents]";
    __int16 v45 = 2112;
    v46 = v7;
    _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_DEFAULT, "Duet query: %{public}@, %s, %@", buf, 0x20u);
  }
  id v39 = 0;
  v32 = v8;
  v13 = [v8 executeQuery:v7 error:&v39];
  id v14 = v39;
  uint64_t v15 = objc_opt_new();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v16 = v13;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v36 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        v22 = [v21 endDate];
        v23 = [v21 startDate];
        [v22 timeIntervalSinceDate:v23];
        double v25 = v24;

        uint64_t v26 = [v21 startDate];
        if (v26)
        {
          uint64_t v27 = (void *)v26;
          uint64_t v28 = [v21 endDate];

          if (v28)
          {
            if (v25 >= 14400.0 && v25 < 72000.0) {
              [v15 addObject:v21];
            }
          }
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v18);
  }

  if (v14)
  {
    v29 = __atxlog_handle_modes();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      [(ATXSleepSuggestionServer *)v14 queryEvents];
    }

    id v30 = 0;
  }
  else
  {
    id v30 = v15;
  }

  return v30;
}

- (BOOL)isSleepScheduleBetweenTheBoundariesWithBedtime:(id)a3 wakeupTime:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  double v7 = (double)[v6 hour];
  uint64_t v8 = [v6 minute];

  double v9 = (double)v8 / 60.0 + v7;
  uint64_t v10 = [v5 hour];
  uint64_t v11 = [v5 minute];

  int v12 = [MEMORY[0x1E4F93640] isTime:v9 betweenStartTime:19.9833333 endTime:11.0166667];
  if (v12)
  {
    v13 = (void *)MEMORY[0x1E4F93640];
    LOBYTE(v12) = [v13 isTime:(double)v11 / 60.0 + (double)v10 betweenStartTime:19.9833333 endTime:11.0166667];
  }
  return v12;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = __atxlog_handle_sleep_schedule();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v12 = 0;
    _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "ATXSleepSuggestionServer: connection attempted", v12, 2u);
  }

  double v7 = [v5 valueForEntitlement:@"com.apple.proactive.sleepSchedule"];
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0 && ([v7 BOOLValue] & 1) != 0)
  {
    uint64_t v8 = ATXSleepSuggestionInterface();
    [v5 setExportedInterface:v8];

    [v5 setExportedObject:self];
    [v5 setInterruptionHandler:&__block_literal_global_54_1];
    [v5 setInvalidationHandler:&__block_literal_global_57];
    [v5 resume];
    BOOL v9 = 1;
  }
  else
  {
    uint64_t v10 = __atxlog_handle_sleep_schedule();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ATXSleepSuggestionServer listener:shouldAcceptNewConnection:]();
    }

    BOOL v9 = 0;
  }

  return v9;
}

void __63__ATXSleepSuggestionServer_listener_shouldAcceptNewConnection___block_invoke()
{
  v0 = __atxlog_handle_sleep_schedule();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __63__ATXSleepSuggestionServer_listener_shouldAcceptNewConnection___block_invoke_cold_1();
  }
}

void __63__ATXSleepSuggestionServer_listener_shouldAcceptNewConnection___block_invoke_55()
{
  v0 = __atxlog_handle_sleep_schedule();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __63__ATXSleepSuggestionServer_listener_shouldAcceptNewConnection___block_invoke_55_cold_1();
  }
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (NSArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)predictedSleepSuggestionWithCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "ATXSleepSuggestionServer: Failed to retrieve userIsFirstBacklightOnAfterWakeup", v2, v3, v4, v5, v6);
}

- (void)predictedSleepSuggestionWithCompletionHandler:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "Couldn't find enough events to predict sleep schedule", v2, v3, v4, v5, v6);
}

- (void)predictedSleepSuggestionWithCompletionHandler:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "Predicted schedule isn't between the boundaries", v2, v3, v4, v5, v6);
}

- (void)predictedSleepSuggestionWithCompletionHandler:(NSObject *)a3 .cold.4(void *a1, void *a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v6 = 134218752;
  uint64_t v7 = [a1 hour];
  __int16 v8 = 2048;
  uint64_t v9 = [a1 minute];
  __int16 v10 = 2048;
  uint64_t v11 = [a2 hour];
  __int16 v12 = 2048;
  uint64_t v13 = [a2 minute];
  _os_log_debug_impl(&dword_1D0FA3000, a3, OS_LOG_TYPE_DEBUG, "Predicted Bedtime: %ld:%ld, Wakeup: %ld:%ld", (uint8_t *)&v6, 0x2Au);
}

- (void)predictedSleepSuggestionWithCompletionHandler:.cold.5()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_DEBUG, "Sorted wakeup time array:%@", v1, 0xCu);
}

- (void)predictedSleepSuggestionWithCompletionHandler:.cold.6()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_DEBUG, "Sorted bedtime array:%@", v1, 0xCu);
}

- (void)predictedSleepSuggestionWithCompletionHandler:(uint64_t)a1 .cold.7(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_1_2(a1, a2), "endDate");
  _DWORD *v3 = 138412290;
  void *v2 = v4;
  OUTLINED_FUNCTION_4_4(&dword_1D0FA3000, v5, v6, "ATXModeIsSleepingBasedOnBacklightDataFeaturizer: Wakeup time counted in the prediction:%@");
}

- (void)predictedSleepSuggestionWithCompletionHandler:(uint64_t)a1 .cold.8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_1_2(a1, a2), "startDate");
  _DWORD *v3 = 138412290;
  void *v2 = v4;
  OUTLINED_FUNCTION_4_4(&dword_1D0FA3000, v5, v6, "ATXModeIsSleepingBasedOnBacklightDataFeaturizer: Bedtime counted in the prediction:%@");
}

- (void)queryEvents
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXModeIsSleepingBasedOnBacklightDataFeaturizer: Error querying Core Duet: %@", v4, 0xCu);
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v2 = 2112;
  uint64_t v3 = @"com.apple.proactive.sleepSchedule";
  _os_log_error_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_ERROR, "ATXSleepSuggestionServer: rejecting connection %@ without entitlement %@", v1, 0x16u);
}

void __63__ATXSleepSuggestionServer_listener_shouldAcceptNewConnection___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "ATXSleepSuggestionServer: interruption", v2, v3, v4, v5, v6);
}

void __63__ATXSleepSuggestionServer_listener_shouldAcceptNewConnection___block_invoke_55_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "ATXSleepSuggestionServer: invalidated", v2, v3, v4, v5, v6);
}

@end