@interface FIUIModel
+ (BOOL)isWheelchairUser;
+ (id)_dailyTotalsQueryFromDate:(id)a3 toDate:(id)a4 dataType:(id)a5 predicate:(id)a6 sendUpdates:(BOOL)a7 handler:(id)a8;
+ (id)dailyTotalQueryForDate:(id)a3 dataType:(id)a4 predicate:(id)a5 sendUpdates:(BOOL)a6 handler:(id)a7;
- (FIUIModel)init;
- (FIUIModel)initWithHealthStore:(id)a3;
- (FIUIWeeklyGoalModel)weeklyGoalModel;
- (HKHealthStore)healthStore;
- (NSDictionary)currentActivitySummaryQueryCollectionIntervalOverrides;
- (id)_createCurrentActivitySummaryQuery;
- (id)startCurrentActivitySummaryQueryWithHandler:(id)a3;
- (void)_printStatisticsCollection:(id)a3;
- (void)_printUpdatedStatistics:(id)a3;
- (void)_queue_restartCurrentActivitySummaryQueryAfterError;
- (void)addObserver:(id)a3;
- (void)executeQuery:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setCurrentActivitySummaryQueryCollectionIntervalOverrides:(id)a3;
- (void)stopCurrentActivitySummaryQueryForClientToken:(id)a3;
- (void)stopQuery:(id)a3;
@end

@implementation FIUIModel

+ (id)dailyTotalQueryForDate:(id)a3 dataType:(id)a4 predicate:(id)a5 sendUpdates:(BOOL)a6 handler:(id)a7
{
  BOOL v7 = a6;
  v12 = (void *)MEMORY[0x263EFF8F0];
  id v13 = a7;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = [v12 currentCalendar];
  v18 = [v17 startOfDayForDate:v16];

  v19 = objc_msgSend(v17, "hk_startOfDateByAddingDays:toDate:", 1, v18);
  v20 = [a1 _dailyTotalsQueryFromDate:v18 toDate:v19 dataType:v15 predicate:v14 sendUpdates:v7 handler:v13];

  return v20;
}

+ (id)_dailyTotalsQueryFromDate:(id)a3 toDate:(id)a4 dataType:(id)a5 predicate:(id)a6 sendUpdates:(BOOL)a7 handler:(id)a8
{
  BOOL v9 = a7;
  v31[2] = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a6;
  id v15 = a8;
  id v16 = (objc_class *)MEMORY[0x263EFF918];
  id v17 = a5;
  id v18 = a4;
  id v19 = objc_alloc_init(v16);
  [v19 setDay:1];
  v20 = [MEMORY[0x263F0A668] predicateForSamplesWithStartDate:v13 endDate:v18 options:0];

  if (v14)
  {
    v21 = (void *)MEMORY[0x263F08730];
    v31[0] = v14;
    v31[1] = v20;
    v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:2];
    id v23 = [v21 andPredicateWithSubpredicates:v22];
  }
  else
  {
    id v23 = v20;
  }
  v24 = (void *)[objc_alloc(MEMORY[0x263F0A7E0]) initWithQuantityType:v17 quantitySamplePredicate:v23 options:16 anchorDate:v13 intervalComponents:v19];

  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __85__FIUIModel__dailyTotalsQueryFromDate_toDate_dataType_predicate_sendUpdates_handler___block_invoke;
  v29[3] = &unk_2644A7A28;
  id v25 = v15;
  id v30 = v25;
  [v24 setInitialResultsHandler:v29];
  if (v9)
  {
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __85__FIUIModel__dailyTotalsQueryFromDate_toDate_dataType_predicate_sendUpdates_handler___block_invoke_3;
    v27[3] = &unk_2644A7A78;
    id v28 = v25;
    [v24 setStatisticsUpdateHandler:v27];
  }
  return v24;
}

void __85__FIUIModel__dailyTotalsQueryFromDate_toDate_dataType_predicate_sendUpdates_handler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __85__FIUIModel__dailyTotalsQueryFromDate_toDate_dataType_predicate_sendUpdates_handler___block_invoke_2;
  v14[3] = &unk_2644A7A00;
  id v10 = *(id *)(a1 + 32);
  id v15 = v7;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v11 = v9;
  id v12 = v8;
  id v13 = v7;
  dispatch_async(MEMORY[0x263EF83A0], v14);
}

uint64_t __85__FIUIModel__dailyTotalsQueryFromDate_toDate_dataType_predicate_sendUpdates_handler___block_invoke_2(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void, void))(result + 16))(result, a1[4], 0, a1[5], a1[6]);
  }
  return result;
}

void __85__FIUIModel__dailyTotalsQueryFromDate_toDate_dataType_predicate_sendUpdates_handler___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __85__FIUIModel__dailyTotalsQueryFromDate_toDate_dataType_predicate_sendUpdates_handler___block_invoke_4;
  block[3] = &unk_2644A7A50;
  id v13 = *(id *)(a1 + 32);
  id v22 = v12;
  id v23 = v13;
  id v19 = v9;
  id v20 = v10;
  id v21 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  id v17 = v9;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void *__85__FIUIModel__dailyTotalsQueryFromDate_toDate_dataType_predicate_sendUpdates_handler___block_invoke_4(void *result)
{
  uint64_t v1 = result[8];
  if (v1) {
    return (void *)(*(uint64_t (**)(void, void, void, void, void))(v1 + 16))(result[8], result[4], result[5], result[6], result[7]);
  }
  return result;
}

- (FIUIModel)init
{
  return [(FIUIModel *)self initWithHealthStore:0];
}

- (FIUIModel)initWithHealthStore:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)FIUIModel;
  v6 = [(FIUIModel *)&v21 init];
  id v7 = v6;
  if (v6)
  {
    p_healthStore = (void **)&v6->_healthStore;
    objc_storeStrong((id *)&v6->_healthStore, a3);
    if (!v7->_healthStore)
    {
      id v9 = objc_alloc_init(MEMORY[0x263F0A410]);
      id v10 = *p_healthStore;
      *p_healthStore = v9;
    }
    currentActivitySummaryQueryCollectionIntervalOverrides = v7->_currentActivitySummaryQueryCollectionIntervalOverrides;
    v7->_currentActivitySummaryQueryCollectionIntervalOverrides = 0;

    uint64_t v12 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v12;

    uint64_t v14 = [MEMORY[0x263EFF9A0] dictionary];
    currentActivitySummaryQueryClients = v7->_currentActivitySummaryQueryClients;
    v7->_currentActivitySummaryQueryClients = (NSMutableDictionary *)v14;

    uint64_t v16 = [MEMORY[0x263EFF9A0] dictionary];
    currentActivityCacheQueryClients = v7->_currentActivityCacheQueryClients;
    v7->_currentActivityCacheQueryClients = (NSMutableDictionary *)v16;

    uint64_t v18 = HKCreateSerialDispatchQueue();
    activityQueryClientQueue = v7->_activityQueryClientQueue;
    v7->_activityQueryClientQueue = (OS_dispatch_queue *)v18;
  }
  return v7;
}

- (FIUIWeeklyGoalModel)weeklyGoalModel
{
  weeklyGoalModel = self->_weeklyGoalModel;
  if (!weeklyGoalModel)
  {
    v4 = [[FIUIWeeklyGoalModel alloc] initWithHealthStore:self->_healthStore];
    id v5 = self->_weeklyGoalModel;
    self->_weeklyGoalModel = v4;

    weeklyGoalModel = self->_weeklyGoalModel;
  }
  return weeklyGoalModel;
}

- (void)_printStatisticsCollection:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = (os_log_t *)MEMORY[0x263F098C8];
  v6 = (void *)*MEMORY[0x263F098C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEBUG)) {
    -[FIUIModel _printStatisticsCollection:](v6, a2);
  }
  if ([MEMORY[0x263F0A980] isAppleInternalInstall])
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v18 = v4;
    id v7 = [v4 statistics];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v20;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * v11);
          _HKInitializeLogging();
          os_log_t v13 = *v5;
          if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v14 = v13;
            id v15 = [v12 startDate];
            uint64_t v16 = [v12 sumQuantity];
            *(_DWORD *)buf = 138412546;
            v24 = v15;
            __int16 v25 = 2112;
            v26 = v16;
            _os_log_debug_impl(&dword_21E433000, v14, OS_LOG_TYPE_DEBUG, "Date:%@ %@", buf, 0x16u);
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v9);
    }

    id v4 = v18;
  }
  _HKInitializeLogging();
  id v17 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG)) {
    -[FIUIModel _printStatisticsCollection:](v17);
  }
}

- (void)_printUpdatedStatistics:(id)a3
{
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = (os_log_t *)MEMORY[0x263F098C8];
  v6 = (void *)*MEMORY[0x263F098C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEBUG)) {
    -[FIUIModel _printStatisticsCollection:](v6, a2);
  }
  if ([MEMORY[0x263F0A980] isAppleInternalInstall])
  {
    _HKInitializeLogging();
    os_log_t v7 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG)) {
      -[FIUIModel _printUpdatedStatistics:](v7, v4);
    }
  }
  _HKInitializeLogging();
  uint64_t v8 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG)) {
    -[FIUIModel _printStatisticsCollection:](v8);
  }
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)executeQuery:(id)a3
{
}

- (void)stopQuery:(id)a3
{
}

+ (BOOL)isWheelchairUser
{
  id v2 = objc_alloc_init(MEMORY[0x263F0A410]);
  v3 = [v2 wheelchairUseWithError:0];
  BOOL v4 = FIUIIsWheelchairUserForWheelchairUse([v3 wheelchairUse]);

  return v4;
}

- (id)startCurrentActivitySummaryQueryWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(FIUIClientToken);
  activityQueryClientQueue = self->_activityQueryClientQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__FIUIModel_startCurrentActivitySummaryQueryWithHandler___block_invoke;
  block[3] = &unk_2644A7AC8;
  void block[4] = self;
  id v14 = v4;
  os_log_t v7 = v5;
  os_log_t v13 = v7;
  id v8 = v4;
  dispatch_sync(activityQueryClientQueue, block);
  uint64_t v9 = v13;
  uint64_t v10 = v7;

  return v10;
}

void __57__FIUIModel_startCurrentActivitySummaryQueryWithHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 24);
  v3 = _Block_copy(*(const void **)(a1 + 48));
  [v2 setObject:v3 forKey:*(void *)(a1 + 40)];

  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 24) count];
  id v5 = *(void **)(a1 + 32);
  if (v4 && !v5[5])
  {
    uint64_t v8 = [v5 _createCurrentActivitySummaryQuery];
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(void **)(v11 + 96);
    uint64_t v13 = *(void *)(v11 + 40);
    [v12 executeQuery:v13];
  }
  else
  {
    v6 = v5[11];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __57__FIUIModel_startCurrentActivitySummaryQueryWithHandler___block_invoke_2;
    v14[3] = &unk_2644A7AA0;
    id v7 = *(id *)(a1 + 48);
    void v14[4] = *(void *)(a1 + 32);
    id v15 = v7;
    dispatch_async(v6, v14);
  }
}

uint64_t __57__FIUIModel_startCurrentActivitySummaryQueryWithHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 72));
}

- (void)stopCurrentActivitySummaryQueryForClientToken:(id)a3
{
  id v4 = a3;
  activityQueryClientQueue = self->_activityQueryClientQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__FIUIModel_stopCurrentActivitySummaryQueryForClientToken___block_invoke;
  v7[3] = &unk_2644A7AF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(activityQueryClientQueue, v7);
}

void __59__FIUIModel_stopCurrentActivitySummaryQueryForClientToken___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) removeObjectForKey:*(void *)(a1 + 40)];
  if (![*(id *)(*(void *)(a1 + 32) + 24) count])
  {
    [*(id *)(*(void *)(a1 + 32) + 96) stopQuery:*(void *)(*(void *)(a1 + 32) + 40)];
    uint64_t v2 = *(void *)(a1 + 32);
    v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0;

    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 72);
    *(void *)(v4 + 72) = 0;

    *(void *)(*(void *)(a1 + 32) + 56) = 0;
  }
}

- (void)_queue_restartCurrentActivitySummaryQueryAfterError
{
  [(HKHealthStore *)self->_healthStore stopQuery:self->_queue_currentActivitySummaryQuery];
  int64_t queue_activitySummaryQueryRetries = self->_queue_activitySummaryQueryRetries;
  self->_int64_t queue_activitySummaryQueryRetries = queue_activitySummaryQueryRetries + 1;
  if (queue_activitySummaryQueryRetries >= 5) {
    int64_t queue_activitySummaryQueryRetries = 5;
  }
  dispatch_time_t v4 = dispatch_time(0, 1000000000 * queue_activitySummaryQueryRetries);
  activityQueryClientQueue = self->_activityQueryClientQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__FIUIModel__queue_restartCurrentActivitySummaryQueryAfterError__block_invoke;
  block[3] = &unk_2644A7B18;
  void block[4] = self;
  dispatch_after(v4, activityQueryClientQueue, block);
}

uint64_t __64__FIUIModel__queue_restartCurrentActivitySummaryQueryAfterError__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  uint64_t v2 = *MEMORY[0x263F098C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 56);
    int v8 = 134217984;
    uint64_t v9 = v3;
    _os_log_impl(&dword_21E433000, v2, OS_LOG_TYPE_DEFAULT, "[FM] Restarting current activity summary query for clients. Retry attempt: %ld", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v4 = [*(id *)(a1 + 32) _createCurrentActivitySummaryQuery];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return [*(id *)(*(void *)(a1 + 32) + 96) executeQuery:*(void *)(*(void *)(a1 + 32) + 40)];
}

- (id)_createCurrentActivitySummaryQuery
{
  id v3 = objc_alloc(MEMORY[0x263F0A988]);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__FIUIModel__createCurrentActivitySummaryQuery__block_invoke;
  v6[3] = &unk_2644A7B68;
  v6[4] = self;
  uint64_t v4 = (void *)[v3 initWithUpdateHandler:v6];
  [v4 _setCollectionIntervals:self->_currentActivitySummaryQueryCollectionIntervalOverrides];
  return v4;
}

void __47__FIUIModel__createCurrentActivitySummaryQuery__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(NSObject **)(v8 + 88);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__FIUIModel__createCurrentActivitySummaryQuery__block_invoke_2;
  block[3] = &unk_2644A7B40;
  id v13 = v7;
  uint64_t v14 = v8;
  id v15 = v6;
  id v10 = v6;
  id v11 = v7;
  dispatch_async(v9, block);
}

void __47__FIUIModel__createCurrentActivitySummaryQuery__block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = (uint64_t *)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
    _HKInitializeLogging();
    id v3 = *MEMORY[0x263F098C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_ERROR)) {
      __47__FIUIModel__createCurrentActivitySummaryQuery__block_invoke_2_cold_1(v2, v3);
    }
    objc_msgSend(*(id *)(a1 + 40), "_queue_restartCurrentActivitySummaryQueryAfterError");
  }
  else
  {
    *(void *)(*(void *)(a1 + 40) + 56) = 0;
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 72), *(id *)(a1 + 48));
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v4 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 24), "allValues", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v8++) + 16))();
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (NSDictionary)currentActivitySummaryQueryCollectionIntervalOverrides
{
  return self->_currentActivitySummaryQueryCollectionIntervalOverrides;
}

- (void)setCurrentActivitySummaryQueryCollectionIntervalOverrides:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentActivitySummaryQueryCollectionIntervalOverrides, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_activityQueryClientQueue, 0);
  objc_storeStrong((id *)&self->_queue_currentActivityCacheForClients, 0);
  objc_storeStrong((id *)&self->_queue_currentActivitySummaryForClients, 0);
  objc_storeStrong((id *)&self->_queue_currentActivityCacheQuery, 0);
  objc_storeStrong((id *)&self->_queue_currentActivitySummaryQuery, 0);
  objc_storeStrong((id *)&self->_currentActivityCacheQueryClients, 0);
  objc_storeStrong((id *)&self->_currentActivitySummaryQueryClients, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_weeklyGoalModel, 0);
}

- (void)_printStatisticsCollection:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_21E433000, log, OS_LOG_TYPE_DEBUG, "\n", v1, 2u);
}

- (void)_printStatisticsCollection:(void *)a1 .cold.2(void *a1, const char *a2)
{
  id v3 = a1;
  uint64_t v4 = NSStringFromSelector(a2);
  OUTLINED_FUNCTION_0(&dword_21E433000, v5, v6, "%@", v7, v8, v9, v10, 2u);
}

- (void)_printUpdatedStatistics:(void *)a1 .cold.2(void *a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a1;
  uint64_t v4 = [a2 startDate];
  uint64_t v5 = [a2 sumQuantity];
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_debug_impl(&dword_21E433000, v3, OS_LOG_TYPE_DEBUG, "Date:%@ %@", (uint8_t *)&v6, 0x16u);
}

void __47__FIUIModel__createCurrentActivitySummaryQuery__block_invoke_2_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_21E433000, a2, OS_LOG_TYPE_ERROR, "[FM] Error For Current Activity Summary Query: %{public}@", (uint8_t *)&v3, 0xCu);
}

@end