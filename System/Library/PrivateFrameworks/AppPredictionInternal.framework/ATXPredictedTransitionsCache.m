@interface ATXPredictedTransitionsCache
+ (id)ceilingDateToNextHour:(id)a3;
+ (id)getNextTransitionInCache:(id)a3 fromDate:(id)a4;
+ (void)removeEntriesFromCache:(id)a3 beforeDate:(id)a4;
- (ATXPredictedTransitionsCache)initWithLocationManager:(id)a3;
- (BOOL)cacheHeadingFromLoiType:(int64_t)a3 toLoiType:(int64_t)a4 forDate:(id)a5;
- (id)cacheForDestinationLoiType:(int64_t)a3;
- (id)getNextHomeToWorkTransitionsOnActivity:(id)a3;
- (id)getNextWorkToHomeTransitionsOnActivity:(id)a3;
- (void)dump;
- (void)fetchEntriesStartingDate:(id)a3 onActivity:(id)a4;
- (void)prewarmOnActivity:(id)a3;
- (void)pruneStaleEntries;
@end

@implementation ATXPredictedTransitionsCache

- (ATXPredictedTransitionsCache)initWithLocationManager:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXPredictedTransitionsCache;
  v6 = [(ATXPredictedTransitionsCache *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_manager, a3);
    uint64_t v8 = objc_opt_new();
    homeToWork = v7->_homeToWork;
    v7->_homeToWork = (NSMutableDictionary *)v8;

    uint64_t v10 = objc_opt_new();
    workToHome = v7->_workToHome;
    v7->_workToHome = (NSMutableDictionary *)v10;
  }
  return v7;
}

- (id)getNextHomeToWorkTransitionsOnActivity:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  uint64_t v6 = [v4 now];
  [(ATXPredictedTransitionsCache *)self fetchEntriesStartingDate:v6 onActivity:v5];

  LOBYTE(v6) = [v5 shouldDefer];
  if (v6)
  {
    v7 = 0;
  }
  else
  {
    uint64_t v8 = objc_opt_class();
    homeToWork = self->_homeToWork;
    uint64_t v10 = [MEMORY[0x1E4F1C9C8] now];
    v7 = [v8 getNextTransitionInCache:homeToWork fromDate:v10];
  }
  return v7;
}

- (id)getNextWorkToHomeTransitionsOnActivity:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  uint64_t v6 = [v4 now];
  [(ATXPredictedTransitionsCache *)self fetchEntriesStartingDate:v6 onActivity:v5];

  LOBYTE(v6) = [v5 shouldDefer];
  if (v6)
  {
    v7 = 0;
  }
  else
  {
    uint64_t v8 = objc_opt_class();
    workToHome = self->_workToHome;
    uint64_t v10 = [MEMORY[0x1E4F1C9C8] now];
    v7 = [v8 getNextTransitionInCache:workToHome fromDate:v10];
  }
  return v7;
}

+ (id)ceilingDateToNextHour:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a3;
  id v5 = [v3 currentCalendar];
  uint64_t v6 = [v5 components:60 fromDate:v4];

  v7 = [v5 dateFromComponents:v6];
  uint64_t v8 = [v7 dateByAddingTimeInterval:3600.0];

  return v8;
}

+ (id)getNextTransitionInCache:(id)a3 fromDate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [(id)objc_opt_class() ceilingDateToNextHour:v5];

  uint64_t v8 = [v6 objectForKeyedSubscript:v7];

  return v8;
}

- (void)prewarmOnActivity:(id)a3
{
  id v4 = a3;
  [(ATXPredictedTransitionsCache *)self dump];
  id v5 = [MEMORY[0x1E4F1C9C8] now];
  [(ATXPredictedTransitionsCache *)self fetchEntriesStartingDate:v5 onActivity:v4];
}

- (void)fetchEntriesStartingDate:(id)a3 onActivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(ATXPredictedTransitionsCache *)self pruneStaleEntries];
  uint64_t v8 = +[_ATXGlobals sharedInstance];
  double v9 = (double)(unint64_t)[v8 transitionLookaheadMinSeconds];

  uint64_t v10 = [v6 dateByAddingTimeInterval:v9];
  v11 = [(id)objc_opt_class() ceilingDateToNextHour:v10];
  v12 = +[_ATXGlobals sharedInstance];
  double v13 = (double)(unint64_t)[v12 transitionLookaheadMaxSeconds];

  v14 = [v6 dateByAddingTimeInterval:v13];
  v15 = __atxlog_handle_dailyroutines();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[ATXPredictedTransitionsCache fetchEntriesStartingDate:onActivity:]();
  }

  [v11 timeIntervalSinceReferenceDate];
  double v17 = v16;
  uint64_t v18 = [v14 timeIntervalSinceReferenceDate];
  if (v17 >= v19)
  {
LABEL_17:
    v21 = v11;
LABEL_18:
    [(ATXPredictedTransitionsCache *)self dump];
    v11 = v21;
  }
  else
  {
    while (1)
    {
      v20 = (void *)MEMORY[0x1D25F6CC0](v18);
      if ([v7 shouldDefer]) {
        break;
      }
      if (![(ATXPredictedTransitionsCache *)self cacheHeadingFromLoiType:1 toLoiType:0 forDate:v11])
      {
        v26 = __atxlog_handle_dailyroutines();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
LABEL_15:
        }
          -[ATXPredictedTransitionsCache fetchEntriesStartingDate:onActivity:]();
LABEL_16:

        goto LABEL_17;
      }
      if (![(ATXPredictedTransitionsCache *)self cacheHeadingFromLoiType:0 toLoiType:1 forDate:v11])
      {
        v26 = __atxlog_handle_dailyroutines();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_15;
        }
        goto LABEL_16;
      }
      v21 = [v11 dateByAddingTimeInterval:3600.0];

      [v21 timeIntervalSinceReferenceDate];
      double v23 = v22;
      uint64_t v18 = [v14 timeIntervalSinceReferenceDate];
      v11 = v21;
      if (v23 >= v24) {
        goto LABEL_18;
      }
    }
    v25 = __atxlog_handle_dailyroutines();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_1D0FA3000, v25, OS_LOG_TYPE_DEFAULT, "Abandoning cache update early since we were asked to defer", v27, 2u);
    }
  }
}

- (BOOL)cacheHeadingFromLoiType:(int64_t)a3 toLoiType:(int64_t)a4 forDate:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  double v9 = __atxlog_handle_dailyroutines();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[ATXPredictedTransitionsCache cacheHeadingFromLoiType:toLoiType:forDate:].cold.7();
  }

  uint64_t v10 = [MEMORY[0x1E4F935D0] stringForLOIType:a3];
  v11 = [MEMORY[0x1E4F935D0] stringForLOIType:a4];
  v12 = [(ATXPredictedTransitionsCache *)self cacheForDestinationLoiType:a4];
  double v13 = v12;
  if (v12)
  {
    v14 = [v12 objectForKeyedSubscript:v8];

    if (v14)
    {
      v15 = __atxlog_handle_dailyroutines();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[ATXPredictedTransitionsCache cacheHeadingFromLoiType:toLoiType:forDate:].cold.6();
      }
      BOOL v16 = 1;
      goto LABEL_38;
    }
    double v17 = [(ATXPredictedLocationsManagerProtocol *)self->_manager getPredictedLocationsOfInterestFromLOIName:v10 startDate:v8];
    v15 = v17;
    if (v17)
    {
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      uint64_t v18 = v17;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        v31 = v11;
        uint64_t v21 = *(void *)v33;
        while (2)
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v33 != v21) {
              objc_enumerationMutation(v18);
            }
            if ([*(id *)(*((void *)&v32 + 1) + 8 * i) type] == a4)
            {
              double v24 = __atxlog_handle_dailyroutines();
              v11 = v31;
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
                -[ATXPredictedTransitionsCache cacheHeadingFromLoiType:toLoiType:forDate:].cold.5();
              }

              int v23 = 1;
              goto LABEL_25;
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v32 objects:v36 count:16];
          if (v20) {
            continue;
          }
          break;
        }
        int v23 = 0;
        v11 = v31;
      }
      else
      {
        int v23 = 0;
      }
LABEL_25:

      v25 = objc_opt_new();
      if (!v23)
      {
        v28 = __atxlog_handle_dailyroutines();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
          -[ATXPredictedTransitionsCache cacheHeadingFromLoiType:toLoiType:forDate:].cold.4();
        }
        v27 = v25;
        goto LABEL_32;
      }
      uint64_t v26 = [(ATXPredictedLocationsManagerProtocol *)self->_manager getPredictedExitTimesFromLOIName:v10 startDate:v8];
      if (v26)
      {
        v27 = v26;

        v28 = __atxlog_handle_dailyroutines();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
          -[ATXPredictedTransitionsCache cacheHeadingFromLoiType:toLoiType:forDate:]();
        }
LABEL_32:

        [v13 setObject:v27 forKeyedSubscript:v8];
        BOOL v16 = 1;
        v25 = v27;
LABEL_37:

LABEL_38:
        goto LABEL_39;
      }
      v29 = __atxlog_handle_dailyroutines();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
        -[ATXPredictedTransitionsCache cacheHeadingFromLoiType:toLoiType:forDate:]();
      }
    }
    else
    {
      v25 = __atxlog_handle_dailyroutines();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        -[ATXPredictedTransitionsCache cacheHeadingFromLoiType:toLoiType:forDate:]();
      }
    }
    BOOL v16 = 0;
    goto LABEL_37;
  }
  BOOL v16 = 0;
LABEL_39:

  return v16;
}

- (id)cacheForDestinationLoiType:(int64_t)a3
{
  if (a3 == 1)
  {
    homeToWork = self->_homeToWork;
    goto LABEL_5;
  }
  if (!a3)
  {
    homeToWork = self->_workToHome;
LABEL_5:
    id v4 = homeToWork;
    goto LABEL_9;
  }
  id v5 = __atxlog_handle_dailyroutines();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
    -[ATXPredictedTransitionsCache cacheForDestinationLoiType:]();
  }

  id v4 = 0;
LABEL_9:
  return v4;
}

- (void)dump
{
}

- (void)pruneStaleEntries
{
  v3 = objc_opt_class();
  homeToWork = self->_homeToWork;
  id v5 = [MEMORY[0x1E4F1C9C8] now];
  [v3 removeEntriesFromCache:homeToWork beforeDate:v5];

  id v6 = objc_opt_class();
  workToHome = self->_workToHome;
  id v8 = [MEMORY[0x1E4F1C9C8] now];
  [v6 removeEntriesFromCache:workToHome beforeDate:v8];
}

+ (void)removeEntriesFromCache:(id)a3 beforeDate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 allKeys];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__ATXPredictedTransitionsCache_removeEntriesFromCache_beforeDate___block_invoke;
  v11[3] = &unk_1E68ACA90;
  id v12 = v5;
  id v8 = v5;
  double v9 = objc_msgSend(v7, "_pas_filteredArrayWithTest:", v11);

  uint64_t v10 = __atxlog_handle_dailyroutines();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    +[ATXPredictedTransitionsCache removeEntriesFromCache:beforeDate:]();
  }

  [v6 removeObjectsForKeys:v9];
}

BOOL __66__ATXPredictedTransitionsCache_removeEntriesFromCache_beforeDate___block_invoke(uint64_t a1, void *a2)
{
  [a2 timeIntervalSinceReferenceDate];
  double v4 = v3;
  [*(id *)(a1 + 32) timeIntervalSinceReferenceDate];
  return v4 < v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workToHome, 0);
  objc_storeStrong((id *)&self->_homeToWork, 0);
  objc_storeStrong((id *)&self->_manager, 0);
}

- (void)fetchEntriesStartingDate:onActivity:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "Abandoning cache update early because an error was detected", v2, v3, v4, v5, v6);
}

- (void)fetchEntriesStartingDate:onActivity:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1D0FA3000, v0, v1, "Fetching entries from %@ to %@");
}

- (void)cacheHeadingFromLoiType:toLoiType:forDate:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "Error while attempting to fetch predicted LOI", v2, v3, v4, v5, v6);
}

- (void)cacheHeadingFromLoiType:toLoiType:forDate:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "Error while attempting to fetch predicted exit times", v2, v3, v4, v5, v6);
}

- (void)cacheHeadingFromLoiType:toLoiType:forDate:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1D0FA3000, v0, v1, "Caching transition to %@ for time: %@");
}

- (void)cacheHeadingFromLoiType:toLoiType:forDate:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_3(&dword_1D0FA3000, v0, v1, "Caching no transition for time: %@", v2, v3, v4, v5, v6);
}

- (void)cacheHeadingFromLoiType:toLoiType:forDate:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_3(&dword_1D0FA3000, v0, v1, "Found ->%@ transition", v2, v3, v4, v5, v6);
}

- (void)cacheHeadingFromLoiType:toLoiType:forDate:.cold.6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_3(&dword_1D0FA3000, v0, v1, "Skipping time %@, already cached", v2, v3, v4, v5, v6);
}

- (void)cacheHeadingFromLoiType:toLoiType:forDate:.cold.7()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_3(&dword_1D0FA3000, v0, v1, "Attempting to update for time: %@", v2, v3, v4, v5, v6);
}

- (void)cacheForDestinationLoiType:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_FAULT, "Asked to cache for unsupported loi type %ld", v1, 0xCu);
}

+ (void)removeEntriesFromCache:beforeDate:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_3(&dword_1D0FA3000, v0, v1, "Pruning dates: %@", v2, v3, v4, v5, v6);
}

@end