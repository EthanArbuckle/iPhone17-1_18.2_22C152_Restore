@interface HKActivitySummaryDataProvider
- (BOOL)_sampleDate:(id)a3 withinHourBeforeDate:(id)a4;
- (BOOL)activitySummariesAreLoading;
- (HKActivitySummary)latestActivitySummary;
- (HKActivitySummaryDataProvider)initWithHealthStore:(id)a3 dateCache:(id)a4 displayTypeController:(id)a5 unitController:(id)a6;
- (HKActivitySummaryDataProvider)initWithHealthStore:(id)a3 dateCache:(id)a4 displayTypeController:(id)a5 unitController:(id)a6 activityMoveMode:(int64_t)a7;
- (HKDateCache)dateCache;
- (HKDisplayTypeController)displayTypeController;
- (HKHealthStore)healthStore;
- (HKUnitPreferenceController)unitController;
- (id)_averageActivitySummariesForDateRange:(id)a3 averagePeriod:(int64_t)a4;
- (id)_buildActivitySummaryFromAverages:(_WDActivitySummaryAverages *)a3 pausedAverages:(_WDActivitySummaryAverages *)a4 averagePeriod:(int64_t)a5 startDate:(id)a6 calendar:(id)a7 energyUnit:(id)a8 standHourUnit:(id)a9;
- (id)_buildHourlyActivitySummaryFromDate:(id)a3 calendar:(id)a4 moveQuantity:(id)a5 exerciseQuantity:(id)a6 standQuantity:(id)a7 moveGoal:(id)a8 exerciseGoal:(id)a9 standGoal:(id)a10;
- (id)_dayActivitySummariesForDateRange:(id)a3;
- (id)_fetchOperationForTimeScope:(int64_t)a3 withCompletion:(id)a4;
- (id)_hourActivitySummariesForDateRange:(id)a3;
- (id)_hourlySummariesFromStartDate:(id)a3 endDate:(id)a4 calendar:(id)a5 activeEnergyData:(id)a6 appleMoveTimeData:(id)a7 exerciseData:(id)a8 standData:(id)a9 dayGoalData:(id)a10;
- (id)_predicateForStartDate:(id)a3 endDate:(id)a4 calendar:(id)a5;
- (id)_predicateForStartDate:(id)a3 endDate:(id)a4 calendar:(id)a5 activityMoveMode:(int64_t)a6;
- (id)_queriesForTimeScope:(int64_t)a3 withCompletion:(id)a4;
- (id)activitySummariesForDateRange:(id)a3 timeScope:(int64_t)a4;
- (id)activitySummariesForTimeScope:(int64_t)a3;
- (id)cachedCalendar;
- (int64_t)_weekOfYearForDateComponents:(id)a3 calendar:(id)a4;
- (int64_t)activityMoveMode;
- (void)_alertObserversDidUpdateValues;
- (void)_averageActivitySummariesForCachedData:(id)a3 averagePeriod:(int64_t)a4 handler:(id)a5;
- (void)_clearCaches;
- (void)_fetchValueWithRetryCount:(int64_t)a3;
- (void)_hourActivitySummariesForDateRange:(id)a3 pageHandler:(id)a4;
- (void)_hourlyActivityDataForStartDate:(id)a3 endDate:(id)a4 healthStore:(id)a5 calendar:(id)a6 handler:(id)a7;
- (void)_hourlyActivityPageDataArrived:(id)a3 pageNumber:(id)a4 error:(id)a5;
- (void)_hourlyPageInProgress:(id)a3;
- (void)_mainQueueFetchValueWithRetryCount:(int64_t)a3;
- (void)_partitionAndProcessActivitySummariesForAllTimeScopes:(id)a3;
- (void)_setupActivitySummaryChangeObserver;
- (void)_stopActivitySummaryChangeObserver;
- (void)_submitHourlyQueryForPageNumber:(id)a3 startDate:(id)a4 endDate:(id)a5;
- (void)_transitionToFetchFailureForTimeScope:(int64_t)a3;
- (void)_unitPreferencesDidUpdate:(id)a3;
- (void)addObserver:(id)a3;
- (void)dateCacheDidUpdate:(id)a3 onNotification:(id)a4;
- (void)dealloc;
- (void)removeObserver:(id)a3;
@end

@implementation HKActivitySummaryDataProvider

- (HKActivitySummaryDataProvider)initWithHealthStore:(id)a3 dateCache:(id)a4 displayTypeController:(id)a5 unitController:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v34.receiver = self;
  v34.super_class = (Class)HKActivitySummaryDataProvider;
  v15 = [(HKActivitySummaryDataProvider *)&v34 init];
  if (v15)
  {
    id v16 = objc_alloc(MEMORY[0x1E4F2B5F0]);
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    id v33 = v14;
    id v18 = v13;
    id v19 = v12;
    v21 = id v20 = v11;
    uint64_t v22 = [v16 initWithName:v21 loggingCategory:*MEMORY[0x1E4F29F90]];
    observers = v15->_observers;
    v15->_observers = (HKSynchronousObserverSet *)v22;

    v24 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    activitySummaryForTimeScopeCache = v15->_activitySummaryForTimeScopeCache;
    v15->_activitySummaryForTimeScopeCache = v24;

    objc_storeStrong((id *)&v15->_healthStore, a3);
    objc_storeStrong((id *)&v15->_dateCache, a4);
    objc_storeStrong((id *)&v15->_displayTypeController, a5);
    objc_storeStrong((id *)&v15->_unitController, a6);
    v26 = [(HKActivitySummaryDataProvider *)v15 dateCache];
    [v26 registerObserver:v15];

    [(HKActivitySummaryDataProvider *)v15 _setupActivitySummaryChangeObserver];
    v27 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v27 addObserver:v15 selector:sel__unitPreferencesDidUpdate_ name:@"HKUnitPreferenceControllerUnitPreferencesDidChangeNotification" object:0];

    id v11 = v20;
    id v12 = v19;
    id v13 = v18;
    id v14 = v33;
    v28 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    hourlyActivitySummaryCache = v15->_hourlyActivitySummaryCache;
    v15->_hourlyActivitySummaryCache = v28;

    [(NSCache *)v15->_hourlyActivitySummaryCache setEvictsObjectsWhenApplicationEntersBackground:0];
    [(NSCache *)v15->_hourlyActivitySummaryCache setMinimumObjectCount:10];
    v30 = [[HKThrottleCallback alloc] initWithThrottleDelay:1.0];
    databaseChangesThrottle = v15->_databaseChangesThrottle;
    v15->_databaseChangesThrottle = v30;
  }
  return v15;
}

- (HKActivitySummaryDataProvider)initWithHealthStore:(id)a3 dateCache:(id)a4 displayTypeController:(id)a5 unitController:(id)a6 activityMoveMode:(int64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v36.receiver = self;
  v36.super_class = (Class)HKActivitySummaryDataProvider;
  v17 = [(HKActivitySummaryDataProvider *)&v36 init];
  if (v17)
  {
    id v35 = v15;
    id v18 = v13;
    id v19 = objc_alloc(MEMORY[0x1E4F2B5F0]);
    id v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    id v34 = v16;
    uint64_t v22 = v21 = v14;
    uint64_t v23 = [v19 initWithName:v22 loggingCategory:*MEMORY[0x1E4F29F90]];
    observers = v17->_observers;
    v17->_observers = (HKSynchronousObserverSet *)v23;

    v25 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    activitySummaryForTimeScopeCache = v17->_activitySummaryForTimeScopeCache;
    v17->_activitySummaryForTimeScopeCache = v25;

    objc_storeStrong((id *)&v17->_healthStore, a3);
    objc_storeStrong((id *)&v17->_dateCache, a4);
    objc_storeStrong((id *)&v17->_displayTypeController, a5);
    objc_storeStrong((id *)&v17->_unitController, a6);
    v17->_activityMoveMode = a7;
    v27 = [(HKActivitySummaryDataProvider *)v17 dateCache];
    [v27 registerObserver:v17];

    [(HKActivitySummaryDataProvider *)v17 _setupActivitySummaryChangeObserver];
    v28 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v28 addObserver:v17 selector:sel__unitPreferencesDidUpdate_ name:@"HKUnitPreferenceControllerUnitPreferencesDidChangeNotification" object:0];

    id v13 = v18;
    id v14 = v21;
    id v16 = v34;
    id v15 = v35;
    v29 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    hourlyActivitySummaryCache = v17->_hourlyActivitySummaryCache;
    v17->_hourlyActivitySummaryCache = v29;

    [(NSCache *)v17->_hourlyActivitySummaryCache setEvictsObjectsWhenApplicationEntersBackground:0];
    [(NSCache *)v17->_hourlyActivitySummaryCache setMinimumObjectCount:10];
    v31 = [[HKThrottleCallback alloc] initWithThrottleDelay:1.0];
    databaseChangesThrottle = v17->_databaseChangesThrottle;
    v17->_databaseChangesThrottle = v31;
  }
  return v17;
}

- (void)dealloc
{
  [(HKActivitySummaryDataProvider *)self _stopActivitySummaryChangeObserver];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HKActivitySummaryDataProvider;
  [(HKActivitySummaryDataProvider *)&v4 dealloc];
}

- (BOOL)activitySummariesAreLoading
{
  return self->_outstandingFetchOperation != 0;
}

- (HKActivitySummary)latestActivitySummary
{
  v2 = [(HKActivitySummaryDataProvider *)self activitySummariesForTimeScope:2];
  v3 = [v2 lastObject];

  return (HKActivitySummary *)v3;
}

- (id)activitySummariesForTimeScope:(int64_t)a3
{
  activitySummaryForTimeScopeCache = self->_activitySummaryForTimeScopeCache;
  v5 = [NSNumber numberWithInteger:a3];
  v6 = [(NSCache *)activitySummaryForTimeScopeCache objectForKey:v5];

  if (v6)
  {
    id v7 = v6;
  }
  else if (![(HKActivitySummaryDataProvider *)self activitySummariesAreLoading])
  {
    [(HKActivitySummaryDataProvider *)self _fetchValueWithRetryCount:3];
  }

  return v6;
}

- (id)activitySummariesForDateRange:(id)a3 timeScope:(int64_t)a4
{
  id v6 = a3;
  switch(a4)
  {
    case 0:
    case 1:
    case 2:
      id v7 = self;
      id v8 = v6;
      uint64_t v9 = 0;
      goto LABEL_6;
    case 3:
      id v7 = self;
      id v8 = v6;
      uint64_t v9 = 1;
LABEL_6:
      uint64_t v10 = [(HKActivitySummaryDataProvider *)v7 _averageActivitySummariesForDateRange:v8 averagePeriod:v9];
      goto LABEL_8;
    case 4:
    case 5:
      uint64_t v10 = [(HKActivitySummaryDataProvider *)self _dayActivitySummariesForDateRange:v6];
      goto LABEL_8;
    case 6:
      uint64_t v10 = [(HKActivitySummaryDataProvider *)self _hourActivitySummariesForDateRange:v6];
LABEL_8:
      id v11 = (void *)v10;
      break;
    default:
      id v11 = 0;
      break;
  }

  return v11;
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)_partitionAndProcessActivitySummariesForAllTimeScopes:(id)a3
{
  id v4 = a3;
  v31 = [MEMORY[0x1E4F1CA48] array];
  v29 = [MEMORY[0x1E4F1CA48] array];
  v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = [(HKActivitySummaryDataProvider *)self dateCache];
  id v7 = HKCalendarDateTransformNone();
  id v8 = HKGenerateDateRangeForCharts(v6, 4, v7);

  uint64_t v9 = [v8 minValue];
  uint64_t v10 = [v8 maxValue];
  id v11 = [(HKActivitySummaryDataProvider *)self dateCache];
  id v12 = HKCalendarDateTransformNone();
  id v13 = HKGenerateDateRangeForCharts(v11, 5, v12);

  id v14 = [v13 minValue];
  id v15 = [(HKActivitySummaryDataProvider *)self dateCache];
  id v16 = HKCalendarDateTransformNone();
  id v33 = HKGenerateDateRangeForCharts(v15, 6, v16);

  v17 = [v33 minValue];
  id v18 = [(HKActivitySummaryDataProvider *)self cachedCalendar];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __87__HKActivitySummaryDataProvider__partitionAndProcessActivitySummariesForAllTimeScopes___block_invoke;
  v39[3] = &unk_1E6D553E0;
  id v40 = v18;
  id v41 = v10;
  id v42 = v17;
  id v19 = v5;
  id v43 = v19;
  id v44 = v14;
  id v20 = v29;
  id v45 = v20;
  id v46 = v9;
  id v21 = v31;
  id v47 = v21;
  id v32 = v9;
  id v30 = v14;
  id v22 = v17;
  id v23 = v10;
  id v24 = v18;
  [v4 enumerateObjectsUsingBlock:v39];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__HKActivitySummaryDataProvider__partitionAndProcessActivitySummariesForAllTimeScopes___block_invoke_2;
  block[3] = &unk_1E6D54460;
  block[4] = self;
  id v35 = v4;
  id v36 = v21;
  id v37 = v20;
  id v38 = v19;
  id v25 = v19;
  id v26 = v20;
  id v27 = v21;
  id v28 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __87__HKActivitySummaryDataProvider__partitionAndProcessActivitySummariesForAllTimeScopes___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = *(void **)(a1 + 32);
  id v10 = v6;
  id v8 = [v6 dateComponentsForCalendar:v7];
  uint64_t v9 = [v7 dateFromComponents:v8];

  if (HKUIObjectIsLarger(*(void **)(a1 + 40), (uint64_t)v9))
  {
    if (HKUIObjectIsLargerOrEqual(v9, *(void *)(a1 + 48))) {
      [*(id *)(a1 + 56) addObject:v10];
    }
    if (HKUIObjectIsLargerOrEqual(v9, *(void *)(a1 + 64))) {
      [*(id *)(a1 + 72) addObject:v10];
    }
    if (HKUIObjectIsLargerOrEqual(v9, *(void *)(a1 + 80))) {
      [*(id *)(a1 + 88) addObject:v10];
    }
  }
  else
  {
    *a4 = 1;
  }
}

uint64_t __87__HKActivitySummaryDataProvider__partitionAndProcessActivitySummariesForAllTimeScopes___block_invoke_2(void *a1)
{
  [*(id *)(a1[4] + 16) setObject:a1[5] forKey:&unk_1F3C222D0];
  [*(id *)(a1[4] + 16) setObject:a1[5] forKey:&unk_1F3C222E8];
  [*(id *)(a1[4] + 16) setObject:a1[6] forKey:&unk_1F3C22300];
  [*(id *)(a1[4] + 16) setObject:a1[7] forKey:&unk_1F3C22318];
  [*(id *)(a1[4] + 16) setObject:a1[8] forKey:&unk_1F3C22330];
  v2 = (void *)a1[4];
  return [v2 _alertObserversDidUpdateValues];
}

- (void)_fetchValueWithRetryCount:(int64_t)a3
{
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    [(HKActivitySummaryDataProvider *)self _mainQueueFetchValueWithRetryCount:a3];
  }
  else
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __59__HKActivitySummaryDataProvider__fetchValueWithRetryCount___block_invoke;
    v5[3] = &unk_1E6D54F50;
    v5[4] = self;
    v5[5] = a3;
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

uint64_t __59__HKActivitySummaryDataProvider__fetchValueWithRetryCount___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _mainQueueFetchValueWithRetryCount:*(void *)(a1 + 40)];
}

- (void)_mainQueueFetchValueWithRetryCount:(int64_t)a3
{
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    if (a3)
    {
LABEL_3:
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __68__HKActivitySummaryDataProvider__mainQueueFetchValueWithRetryCount___block_invoke;
      v10[3] = &unk_1E6D52D18;
      v10[4] = self;
      v10[5] = a3;
      id v6 = [(HKActivitySummaryDataProvider *)self _fetchOperationForTimeScope:2 withCompletion:v10];
      outstandingFetchOperation = self->_outstandingFetchOperation;
      self->_outstandingFetchOperation = v6;

      [(HKFetchOperation *)self->_outstandingFetchOperation setHighPriority:1];
      id v8 = +[HKOutstandingFetchOperationManager sharedOperationManager];
      [v8 addFetchOperation:self->_outstandingFetchOperation];

      return;
    }
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"HKActivitySummaryDataProvider.m" lineNumber:354 description:@"_mainQueueFetchValueWithRetryCount must be run on the main queue"];

    if (a3) {
      goto LABEL_3;
    }
  }
  [(HKActivitySummaryDataProvider *)self _transitionToFetchFailureForTimeScope:2];
}

void __68__HKActivitySummaryDataProvider__mainQueueFetchValueWithRetryCount___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__HKActivitySummaryDataProvider__mainQueueFetchValueWithRetryCount___block_invoke_2;
  block[3] = &unk_1E6D50ED8;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
  if (v7)
  {
    _HKInitializeLogging();
    id v8 = *MEMORY[0x1E4F29FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
      __68__HKActivitySummaryDataProvider__mainQueueFetchValueWithRetryCount___block_invoke_cold_1((void *)(a1 + 32), (uint64_t)v7, v8);
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __68__HKActivitySummaryDataProvider__mainQueueFetchValueWithRetryCount___block_invoke_328;
    v11[3] = &unk_1E6D54F50;
    uint64_t v9 = *(void *)(a1 + 40);
    v11[4] = *(void *)(a1 + 32);
    v11[5] = v9;
    id v10 = (void *)MEMORY[0x1E4F14428];
    dispatch_async(MEMORY[0x1E4F14428], v11);
  }
  else
  {
    [*(id *)(a1 + 32) _partitionAndProcessActivitySummariesForAllTimeScopes:v6];
  }
}

void __68__HKActivitySummaryDataProvider__mainQueueFetchValueWithRetryCount___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 32);
  *(void *)(v1 + 32) = 0;
}

uint64_t __68__HKActivitySummaryDataProvider__mainQueueFetchValueWithRetryCount___block_invoke_328(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchValueWithRetryCount:*(void *)(a1 + 40) - 1];
}

- (void)_transitionToFetchFailureForTimeScope:(int64_t)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  _HKInitializeLogging();
  id v4 = *MEMORY[0x1E4F29FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = self;
    _os_log_impl(&dword_1E0B26000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Reached max retry count for Activity Summary. Aborting", (uint8_t *)&v6, 0xCu);
  }
  outstandingFetchOperation = self->_outstandingFetchOperation;
  self->_outstandingFetchOperation = 0;
}

- (id)_fetchOperationForTimeScope:(int64_t)a3 withCompletion:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(HKActivitySummaryDataProvider *)self healthStore];
  uint64_t v8 = [[HKHealthQueryFetchOperation alloc] initWithHealthStore:v7 operationDescription:@"ActivitySummaryQuery" completion:v6];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __76__HKActivitySummaryDataProvider__fetchOperationForTimeScope_withCompletion___block_invoke;
  v14[3] = &unk_1E6D55408;
  uint64_t v9 = v8;
  id v15 = v9;
  id v10 = [(HKActivitySummaryDataProvider *)self _queriesForTimeScope:a3 withCompletion:v14];
  v16[0] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  [(HKHealthQueryFetchOperation *)v9 setQueries:v11];

  id v12 = v9;
  return v12;
}

uint64_t __76__HKActivitySummaryDataProvider__fetchOperationForTimeScope_withCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) completedWithResults:a2 error:a3];
}

- (id)_queriesForTimeScope:(int64_t)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = [(HKActivitySummaryDataProvider *)self cachedCalendar];
  uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v9 = [v7 dateByAddingUnit:4 value:-5 toDate:v8 options:0];
  id v10 = +[HKValueRange valueRangeWithMinValue:v9 maxValue:v8];
  id v11 = +[HKGraphZoomLevelConfiguration chartDataRangeForTimeScope:dataRange:firstWeekday:calendar:cadence:alignment:](HKGraphZoomLevelConfiguration, "chartDataRangeForTimeScope:dataRange:firstWeekday:calendar:cadence:alignment:", a3, v10, [v7 firstWeekday], v7, 0, 3);
  id v12 = [v11 startDate];
  id v13 = [v11 endDate];
  id v14 = [(HKActivitySummaryDataProvider *)self _predicateForStartDate:v12 endDate:v13 calendar:v7 activityMoveMode:self->_activityMoveMode];
  id v15 = objc_alloc(MEMORY[0x1E4F2ABB0]);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __69__HKActivitySummaryDataProvider__queriesForTimeScope_withCompletion___block_invoke;
  v19[3] = &unk_1E6D55430;
  id v20 = v6;
  id v16 = v6;
  v17 = (void *)[v15 initWithPredicate:v14 resultsHandler:v19];

  return v17;
}

uint64_t __69__HKActivitySummaryDataProvider__queriesForTimeScope_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_setupActivitySummaryChangeObserver
{
  [(HKActivitySummaryDataProvider *)self _stopActivitySummaryChangeObserver];
  v3 = [(HKActivitySummaryDataProvider *)self healthStore];
  id v4 = [(HKActivitySummaryDataProvider *)self dateCache];
  v5 = HKCalendarDateTransformNone();
  id v6 = HKGenerateDateRangeForCharts(v4, 2, v5);

  id v7 = [v6 minValue];
  uint64_t v8 = [v6 maxValue];
  uint64_t v9 = [(HKActivitySummaryDataProvider *)self cachedCalendar];
  id v10 = [(HKActivitySummaryDataProvider *)self _predicateForStartDate:v7 endDate:v8 calendar:v9 activityMoveMode:self->_activityMoveMode];
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F2ABB0]) initWithPredicate:v10 resultsHandler:&__block_literal_global_69];
  objc_initWeak(&location, self);
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __68__HKActivitySummaryDataProvider__setupActivitySummaryChangeObserver__block_invoke_2;
  id v15 = &unk_1E6D55478;
  objc_copyWeak(&v16, &location);
  [v11 setUpdateHandler:&v12];
  objc_storeStrong((id *)&self->_observerQuery, v11);
  objc_msgSend(v3, "executeQuery:", self->_observerQuery, v12, v13, v14, v15);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __68__HKActivitySummaryDataProvider__setupActivitySummaryChangeObserver__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)*((void *)WeakRetained + 7);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __68__HKActivitySummaryDataProvider__setupActivitySummaryChangeObserver__block_invoke_3;
    v4[3] = &unk_1E6D50ED8;
    v4[4] = v2;
    [v3 executeWithThrottle:v4];
  }
}

void __68__HKActivitySummaryDataProvider__setupActivitySummaryChangeObserver__block_invoke_3(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__HKActivitySummaryDataProvider__setupActivitySummaryChangeObserver__block_invoke_4;
  block[3] = &unk_1E6D50ED8;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __68__HKActivitySummaryDataProvider__setupActivitySummaryChangeObserver__block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) _clearCaches];
  v2 = *(void **)(a1 + 32);
  return [v2 _alertObserversDidUpdateValues];
}

- (void)_stopActivitySummaryChangeObserver
{
  if (self->_observerQuery)
  {
    v3 = [(HKActivitySummaryDataProvider *)self healthStore];
    [v3 stopQuery:self->_observerQuery];

    observerQuery = self->_observerQuery;
    self->_observerQuery = 0;
  }
}

- (void)_clearCaches
{
  [(NSCache *)self->_activitySummaryForTimeScopeCache removeAllObjects];
  hourlyActivitySummaryCache = self->_hourlyActivitySummaryCache;
  [(NSCache *)hourlyActivitySummaryCache removeAllObjects];
}

- (void)_alertObserversDidUpdateValues
{
  observers = self->_observers;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __63__HKActivitySummaryDataProvider__alertObserversDidUpdateValues__block_invoke;
  v3[3] = &unk_1E6D554A0;
  v3[4] = self;
  [(HKSynchronousObserverSet *)observers notifyObservers:v3];
}

uint64_t __63__HKActivitySummaryDataProvider__alertObserversDidUpdateValues__block_invoke(uint64_t a1, void *a2)
{
  return [a2 activitySummaryDataProviderDidUpdateActivitySummaries:*(void *)(a1 + 32)];
}

- (void)_unitPreferencesDidUpdate:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__HKActivitySummaryDataProvider__unitPreferencesDidUpdate___block_invoke;
  v6[3] = &unk_1E6D513B0;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __59__HKActivitySummaryDataProvider__unitPreferencesDidUpdate___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) userInfo];
  id v4 = [v2 objectForKeyedSubscript:@"HKUnitPreferenceControllerUnitPreferenceChangedKey"];

  v3 = [MEMORY[0x1E4F2B448] quantityTypeForIdentifier:*MEMORY[0x1E4F2A5C0]];
  if ([v4 containsObject:v3])
  {
    [*(id *)(a1 + 40) _clearCaches];
    [*(id *)(a1 + 40) _alertObserversDidUpdateValues];
  }
}

- (void)dateCacheDidUpdate:(id)a3 onNotification:(id)a4
{
  [(HKActivitySummaryDataProvider *)self _clearCaches];
  cachedCalendar = self->_cachedCalendar;
  self->_cachedCalendar = 0;

  [(HKActivitySummaryDataProvider *)self _setupActivitySummaryChangeObserver];
  [(HKActivitySummaryDataProvider *)self _alertObserversDidUpdateValues];
}

- (id)cachedCalendar
{
  cachedCalendar = self->_cachedCalendar;
  if (!cachedCalendar)
  {
    id v4 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
    id v5 = self->_cachedCalendar;
    self->_cachedCalendar = v4;

    cachedCalendar = self->_cachedCalendar;
  }
  return cachedCalendar;
}

- (id)_dayActivitySummariesForDateRange:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HKActivitySummaryDataProvider *)self activitySummariesForTimeScope:2];
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v7 = [(HKActivitySummaryDataProvider *)self cachedCalendar];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v17 = v5;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          id v14 = [v13 dateComponentsForCalendar:v7];
          id v15 = [v7 dateFromComponents:v14];
          if ([v4 containsValue:v15 exclusiveStart:0 exclusiveEnd:1]) {
            [v6 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }

    id v5 = v17;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_averageActivitySummariesForDateRange:(id)a3 averagePeriod:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(HKActivitySummaryDataProvider *)self activitySummariesForTimeScope:2];
  if (v7)
  {
    id v8 = [v6 minValue];
    uint64_t v9 = [v6 maxValue];
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __85__HKActivitySummaryDataProvider__averageActivitySummariesForDateRange_averagePeriod___block_invoke;
    v17[3] = &unk_1E6D554C8;
    id v18 = v8;
    id v19 = v9;
    id v11 = v10;
    id v20 = v11;
    id v12 = v9;
    id v13 = v8;
    [(HKActivitySummaryDataProvider *)self _averageActivitySummariesForCachedData:v7 averagePeriod:a4 handler:v17];
    id v14 = v20;
    id v15 = v11;
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

void __85__HKActivitySummaryDataProvider__averageActivitySummariesForDateRange_averagePeriod___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a3;
  id v5 = a2;
  id v6 = [v5 minValue];
  id v7 = [v5 maxValue];

  uint64_t v8 = [v7 compare:*(void *)(a1 + 32)];
  uint64_t v9 = [*(id *)(a1 + 40) compare:v6];
  if (v8 != -1 && v9 != -1) {
    [*(id *)(a1 + 48) addObject:v11];
  }
}

- (int64_t)_weekOfYearForDateComponents:(id)a3 calendar:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  if ([v6 weekOfYear] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = [v5 dateFromComponents:v6];

    int64_t v8 = [v5 component:0x2000 fromDate:v7];
    id v6 = (id)v7;
  }
  else
  {
    int64_t v8 = [v6 weekOfYear];
  }

  return v8;
}

- (void)_averageActivitySummariesForCachedData:(id)a3 averagePeriod:(int64_t)a4 handler:(id)a5
{
  uint64_t v116 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = [(HKActivitySummaryDataProvider *)self cachedCalendar];
  id v10 = [(HKActivitySummaryDataProvider *)self displayTypeController];
  uint64_t v11 = [v10 displayTypeWithIdentifier:&unk_1F3C22348];

  v78 = self;
  id v12 = [(HKActivitySummaryDataProvider *)self unitController];
  v72 = (void *)v11;
  id v13 = [v12 unitForDisplayType:v11];

  id v14 = [MEMORY[0x1E4F2B618] countUnit];
  id v15 = [MEMORY[0x1E4F2B618] minuteUnit];
  long long v111 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  id obj = v7;
  v73 = (void (**)(void, void, void, void))v8;
  uint64_t v80 = [obj countByEnumeratingWithState:&v111 objects:v115 count:16];
  if (!v80)
  {
    v81 = 0;
    id v16 = 0;
    uint64_t v85 = 0;
    uint64_t v86 = 0;
    double v17 = 0.0;
    double v18 = 0.0;
    uint64_t v83 = 0;
    uint64_t v84 = 0;
    double v91 = 0.0;
    double v92 = 0.0;
    double v89 = 0.0;
    double v90 = 0.0;
    double v88 = 0.0;
    double v19 = 0.0;
    double v20 = 0.0;
    double v21 = 0.0;
    int64_t v22 = a4;
    goto LABEL_28;
  }
  id v16 = 0;
  uint64_t v85 = 0;
  uint64_t v86 = 0;
  double v17 = 0.0;
  uint64_t v79 = *(void *)v112;
  double v18 = 0.0;
  uint64_t v83 = 0;
  uint64_t v84 = 0;
  v81 = 0;
  uint64_t v82 = -1;
  double v91 = 0.0;
  double v92 = 0.0;
  double v89 = 0.0;
  double v90 = 0.0;
  double v88 = 0.0;
  double v19 = 0.0;
  double v20 = 0.0;
  double v21 = 0.0;
  int64_t v22 = a4;
  v74 = v14;
  v75 = v15;
  while (2)
  {
    uint64_t v23 = 0;
    id v24 = v16;
    do
    {
      if (*(void *)v112 != v79) {
        objc_enumerationMutation(obj);
      }
      id v25 = *(void **)(*((void *)&v111 + 1) + 8 * v23);
      id v26 = [v25 dateComponentsForCalendar:v9];

      if (v22 == 1)
      {
        id v16 = v26;
        uint64_t v27 = [(HKActivitySummaryDataProvider *)v78 _weekOfYearForDateComponents:v26 calendar:v9];
        goto LABEL_10;
      }
      if (!v22)
      {
        id v16 = v26;
        uint64_t v27 = [v26 month];
LABEL_10:
        uint64_t v28 = v27;
        goto LABEL_12;
      }
      id v16 = v26;
      uint64_t v28 = 0;
LABEL_12:
      if (v28 != v82)
      {
        uint64_t v29 = [v9 dateFromComponents:v16];
        id v30 = v14;
        v31 = (void *)v29;
        double v102 = v21;
        double v103 = v20;
        uint64_t v104 = v83;
        double v105 = v19;
        uint64_t v106 = v86;
        double v107 = v17;
        uint64_t v108 = v85;
        double v109 = v18;
        uint64_t v110 = v84;
        double v93 = v92;
        double v94 = v91;
        uint64_t v95 = 0;
        double v96 = v90;
        uint64_t v97 = 0;
        double v98 = v89;
        uint64_t v99 = 0;
        double v100 = v88;
        uint64_t v101 = 0;
        int64_t v32 = v22;
        id v33 = v81;
        id v34 = v9;
        id v35 = [(HKActivitySummaryDataProvider *)v78 _buildActivitySummaryFromAverages:&v102 pausedAverages:&v93 averagePeriod:v32 startDate:v81 calendar:v9 energyUnit:v13 standHourUnit:v30];
        if (v35)
        {
          id v36 = +[HKValueRange valueRangeWithMinValue:v81 maxValue:v31];
          LOBYTE(v102) = 0;
          ((void (**)(void, void *, void *, double *))v73)[2](v73, v36, v35, &v102);
          int v37 = LOBYTE(v102);

          id v33 = v81;
          if (v37)
          {

            uint64_t v9 = v34;
            id v15 = v75;
            int64_t v22 = a4;
            id v14 = v74;
            goto LABEL_28;
          }
        }

        uint64_t v85 = 0;
        uint64_t v86 = 0;
        double v17 = 0.0;
        double v18 = 0.0;
        double v91 = 0.0;
        double v92 = 0.0;
        double v89 = 0.0;
        double v90 = 0.0;
        double v88 = 0.0;
        double v19 = 0.0;
        double v20 = 0.0;
        v81 = v31;
        uint64_t v82 = v28;
        double v21 = 0.0;
        uint64_t v9 = v34;
        id v15 = v75;
        int64_t v22 = a4;
        id v14 = v74;
      }
      id v38 = [v25 appleMoveTime];
      [v38 doubleValueForUnit:v15];
      double v87 = v39;

      id v40 = [v25 appleMoveTimeGoal];
      [v40 doubleValueForUnit:v15];
      uint64_t v84 = v41;

      id v42 = [v25 activeEnergyBurned];
      [v42 doubleValueForUnit:v13];
      double v44 = v43;

      id v45 = [v25 activeEnergyBurnedGoal];
      [v45 doubleValueForUnit:v13];
      uint64_t v83 = v46;

      id v47 = [v25 appleExerciseTime];
      [v47 doubleValueForUnit:v15];
      double v49 = v48;

      v50 = [v25 exerciseTimeGoal];

      if (v50)
      {
        v51 = [v25 exerciseTimeGoal];
        [v51 doubleValueForUnit:v15];
        uint64_t v86 = v52;
      }
      v53 = [v25 appleStandHours];
      [v53 doubleValueForUnit:v14];
      double v55 = v54;

      v56 = [v25 standHoursGoal];

      if (v56)
      {
        v57 = [v25 standHoursGoal];
        [v57 doubleValueForUnit:v14];
        uint64_t v85 = v58;
      }
      if ([v25 isPaused])
      {
        v59 = [v25 appleMoveTime];
        [v59 doubleValueForUnit:v15];
        double v88 = v88 + v60;

        v61 = [v25 activeEnergyBurned];
        [v61 doubleValueForUnit:v13];
        double v91 = v91 + v62;

        v63 = [v25 appleExerciseTime];
        [v63 doubleValueForUnit:v15];
        double v90 = v90 + v64;

        v65 = [v25 appleStandHours];
        [v65 doubleValueForUnit:v14];
        double v89 = v89 + v66;

        double v67 = 1.0;
        double v92 = v92 + 1.0;
      }
      else
      {
        double v67 = 1.0;
      }
      double v18 = v18 + v87;
      double v20 = v20 + v44;
      double v19 = v19 + v49;
      double v17 = v17 + v55;
      double v21 = v21 + v67;
      ++v23;
      id v24 = v16;
    }
    while (v80 != v23);
    uint64_t v80 = [obj countByEnumeratingWithState:&v111 objects:v115 count:16];
    if (v80) {
      continue;
    }
    break;
  }
LABEL_28:

  double v102 = v21;
  double v103 = v20;
  uint64_t v104 = v83;
  double v105 = v19;
  uint64_t v106 = v86;
  double v107 = v17;
  uint64_t v108 = v85;
  double v109 = v18;
  uint64_t v110 = v84;
  double v93 = v92;
  double v94 = v91;
  uint64_t v95 = 0;
  double v96 = v90;
  uint64_t v97 = 0;
  double v98 = v89;
  uint64_t v99 = 0;
  double v100 = v88;
  uint64_t v101 = 0;
  v68 = v81;
  v69 = [(HKActivitySummaryDataProvider *)v78 _buildActivitySummaryFromAverages:&v102 pausedAverages:&v93 averagePeriod:v22 startDate:v81 calendar:v9 energyUnit:v13 standHourUnit:v14];
  if (v69 && v16)
  {
    v70 = [v9 dateFromComponents:v16];
    v71 = +[HKValueRange valueRangeWithMinValue:v81 maxValue:v70];
    LOBYTE(v102) = 0;
    ((void (**)(void, void *, void *, double *))v73)[2](v73, v71, v69, &v102);

    v68 = v81;
  }
}

- (id)_buildActivitySummaryFromAverages:(_WDActivitySummaryAverages *)a3 pausedAverages:(_WDActivitySummaryAverages *)a4 averagePeriod:(int64_t)a5 startDate:(id)a6 calendar:(id)a7 energyUnit:(id)a8 standHourUnit:(id)a9
{
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = 0;
  if (v16 && a3->var0 > 0.0)
  {
    id v20 = objc_alloc_init(MEMORY[0x1E4F2ABA8]);
    id v48 = v17;
    if (a5 == 1)
    {
      uint64_t v23 = objc_msgSend(v16, "hk_dateBeforeDateForCalendar:rangeUnit:", v17, 0x2000);
      id v24 = [v17 components:30 fromDate:v23];
      id v25 = v17;
      int64_t v22 = v24;
      [v24 setCalendar:v25];
    }
    else if (a5)
    {
      int64_t v22 = 0;
    }
    else
    {
      double v21 = [v17 components:14 fromDate:v16];
      [v21 setCalendar:v17];
      int64_t v22 = v21;
      [v21 setDay:1];
    }
    double var0 = a3->var0;
    double v27 = a4->var0;
    BOOL v28 = a3->var0 == a4->var0;
    if (a4->var0 == 0.0 || var0 == v27)
    {
      objc_msgSend(v20, "_setGregorianDateComponents:", v22, var0, v48);
      v31 = [MEMORY[0x1E4F2B618] minuteUnit];
      double v39 = [MEMORY[0x1E4F2B370] quantityWithUnit:v31 doubleValue:a3->var7 / a3->var0];
      [v20 setAppleMoveTime:v39];

      id v40 = [MEMORY[0x1E4F2B370] quantityWithUnit:v31 doubleValue:a3->var8];
      [v20 setAppleMoveTimeGoal:v40];

      uint64_t v41 = [MEMORY[0x1E4F2B370] quantityWithUnit:v18 doubleValue:a3->var1 / a3->var0];
      [v20 setActiveEnergyBurned:v41];

      id v42 = [MEMORY[0x1E4F2B370] quantityWithUnit:v18 doubleValue:a3->var2];
      [v20 setActiveEnergyBurnedGoal:v42];

      double v43 = [MEMORY[0x1E4F2B370] quantityWithUnit:v31 doubleValue:a3->var3 / a3->var0];
      [v20 setAppleExerciseTime:v43];

      double v44 = [MEMORY[0x1E4F2B370] quantityWithUnit:v31 doubleValue:a3->var4];
      [v20 setExerciseTimeGoal:v44];

      id v38 = [MEMORY[0x1E4F2B370] quantityWithUnit:v19 doubleValue:a3->var5 / a3->var0];
    }
    else
    {
      double v29 = var0 - v27;
      id v30 = v22;
      if (var0 - v27 <= 0.0)
      {
        id v47 = [MEMORY[0x1E4F28B00] currentHandler];
        [v47 handleFailureInMethod:a2 object:self file:@"HKActivitySummaryDataProvider.m" lineNumber:692 description:@"_buildActivitySummaryFromAverages: Detected zero unpaused days"];

        id v30 = v22;
      }
      int64_t v22 = v30;
      objc_msgSend(v20, "_setGregorianDateComponents:", v30, v48);
      v31 = [MEMORY[0x1E4F2B618] minuteUnit];
      int64_t v32 = [MEMORY[0x1E4F2B370] quantityWithUnit:v31 doubleValue:(a3->var7 - a4->var7) / v29];
      [v20 setAppleMoveTime:v32];

      id v33 = [MEMORY[0x1E4F2B370] quantityWithUnit:v31 doubleValue:a3->var8];
      [v20 setAppleMoveTimeGoal:v33];

      id v34 = [MEMORY[0x1E4F2B370] quantityWithUnit:v18 doubleValue:(a3->var1 - a4->var1) / v29];
      [v20 setActiveEnergyBurned:v34];

      id v35 = [MEMORY[0x1E4F2B370] quantityWithUnit:v18 doubleValue:a3->var2];
      [v20 setActiveEnergyBurnedGoal:v35];

      id v36 = [MEMORY[0x1E4F2B370] quantityWithUnit:v31 doubleValue:(a3->var3 - a4->var3) / v29];
      [v20 setAppleExerciseTime:v36];

      int v37 = [MEMORY[0x1E4F2B370] quantityWithUnit:v31 doubleValue:a3->var4];
      [v20 setExerciseTimeGoal:v37];

      id v38 = [MEMORY[0x1E4F2B370] quantityWithUnit:v19 doubleValue:(a3->var5 - a4->var5) / v29];
      BOOL v28 = 0;
    }
    [v20 setAppleStandHours:v38];

    id v45 = [MEMORY[0x1E4F2B370] quantityWithUnit:v19 doubleValue:a3->var6];
    [v20 setStandHoursGoal:v45];

    [v20 setActivityMoveMode:self->_activityMoveMode];
    [v20 setPaused:v28];

    id v17 = v49;
  }

  return v20;
}

- (id)_hourActivitySummariesForDateRange:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__19;
  id v15 = __Block_byref_object_dispose__19;
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__HKActivitySummaryDataProvider__hourActivitySummariesForDateRange___block_invoke;
  v8[3] = &unk_1E6D554F0;
  v8[4] = self;
  id v10 = &v11;
  id v5 = v4;
  id v9 = v5;
  [(HKActivitySummaryDataProvider *)self _hourActivitySummariesForDateRange:v5 pageHandler:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __68__HKActivitySummaryDataProvider__hourActivitySummariesForDateRange___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, unsigned char *a6)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (!v11)
  {
    [*(id *)(a1 + 32) _submitHourlyQueryForPageNumber:v14 startDate:v12 endDate:v13];
    goto LABEL_14;
  }
  id v15 = [v11 activitySummaryItems];

  if (!v15)
  {
LABEL_14:
    *a6 = 1;
    uint64_t v25 = *(void *)(*(void *)(a1 + 48) + 8);
    id v26 = *(void **)(v25 + 40);
    *(void *)(v25 + 40) = 0;

    goto LABEL_15;
  }
  id v27 = v14;
  id v28 = v13;
  id v29 = v12;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v16 = [v11 activitySummaryItems];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v31;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v31 != v19) {
          objc_enumerationMutation(v16);
        }
        double v21 = *(void **)(*((void *)&v30 + 1) + 8 * v20);
        int64_t v22 = [*(id *)(a1 + 32) cachedCalendar];
        uint64_t v23 = [v21 dateComponentsForCalendar:v22];
        id v24 = [v22 dateFromComponents:v23];
        if ([*(id *)(a1 + 40) containsValue:v24 exclusiveStart:0 exclusiveEnd:1]) {
          [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v21];
        }

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v18);
  }

  id v13 = v28;
  id v12 = v29;
  id v14 = v27;
LABEL_15:
}

- (void)_submitHourlyQueryForPageNumber:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(NSCache *)self->_hourlyActivitySummaryCache objectForKey:v8];
  if (!v11)
  {
    id v12 = [(HKActivitySummaryDataProvider *)self healthStore];
    id v13 = [(HKActivitySummaryDataProvider *)self cachedCalendar];
    [(HKActivitySummaryDataProvider *)self _hourlyPageInProgress:v8];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __83__HKActivitySummaryDataProvider__submitHourlyQueryForPageNumber_startDate_endDate___block_invoke;
    v14[3] = &unk_1E6D55540;
    void v14[4] = self;
    id v15 = v8;
    [(HKActivitySummaryDataProvider *)self _hourlyActivityDataForStartDate:v9 endDate:v10 healthStore:v12 calendar:v13 handler:v14];
  }
}

void __83__HKActivitySummaryDataProvider__submitHourlyQueryForPageNumber_startDate_endDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __83__HKActivitySummaryDataProvider__submitHourlyQueryForPageNumber_startDate_endDate___block_invoke_2;
  v10[3] = &unk_1E6D55518;
  id v7 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  id v11 = v5;
  id v12 = v7;
  id v13 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

uint64_t __83__HKActivitySummaryDataProvider__submitHourlyQueryForPageNumber_startDate_endDate___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _hourlyActivityPageDataArrived:*(void *)(a1 + 40) pageNumber:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

- (void)_hourlyPageInProgress:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(WDHourlyActivitySummaryPage);
  [(WDHourlyActivitySummaryPage *)v5 setActivitySummaryItems:0];
  [(NSCache *)self->_hourlyActivitySummaryCache setObject:v5 forKey:v4];
}

- (void)_hourlyActivityPageDataArrived:(id)a3 pageNumber:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (v8)
  {
    id v11 = objc_alloc_init(WDHourlyActivitySummaryPage);
    [(WDHourlyActivitySummaryPage *)v11 setActivitySummaryItems:v8];
    [(NSCache *)self->_hourlyActivitySummaryCache setObject:v11 forKey:v10];
  }
  else
  {
    _HKInitializeLogging();
    id v12 = *MEMORY[0x1E4F29FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
      -[HKActivitySummaryDataProvider _hourlyActivityPageDataArrived:pageNumber:error:]((uint64_t)self, (uint64_t)v9, v12);
    }
    [(NSCache *)self->_hourlyActivitySummaryCache removeObjectForKey:v10];
  }
  [(HKActivitySummaryDataProvider *)self _alertObserversDidUpdateValues];
}

- (void)_hourActivitySummariesForDateRange:(id)a3 pageHandler:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void *, void *, void *, void *, unsigned char *))a4;
  id v7 = [v5 minValue];
  uint64_t v25 = v5;
  id v8 = [v5 maxValue];
  id v24 = v7;
  [v7 timeIntervalSinceReferenceDate];
  int64_t v10 = vcvtmd_s64_f64(v9);
  uint64_t v23 = v8;
  [v8 timeIntervalSinceReferenceDate];
  uint64_t v12 = v10 / 432000;
  uint64_t v27 = (uint64_t)vcvtmd_s64_f64(v11) / 432000;
  uint64_t v13 = 432000 * (v10 / 432000);
  do
  {
    if (v12 > v27) {
      break;
    }
    id v14 = [NSNumber numberWithInteger:v12];
    id v15 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)v13];
    ++v12;
    v13 += 432000;
    id v16 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)v13];
    uint64_t v17 = +[HKGraphZoomLevelConfiguration defaultCalendar];
    uint64_t v18 = objc_msgSend(v15, "hk_dateBeforeDateForCalendar:rangeUnit:", v17, 32);

    uint64_t v19 = +[HKGraphZoomLevelConfiguration defaultCalendar];
    uint64_t v20 = objc_msgSend(v16, "hk_dateBeforeDateForCalendar:rangeUnit:", v19, 32);

    double v21 = [(NSCache *)self->_hourlyActivitySummaryCache objectForKey:v14];
    unsigned __int8 v28 = 0;
    v6[2](v6, v21, v18, v20, v14, &v28);
    int v22 = v28;
  }
  while (!v22);
}

- (id)_buildHourlyActivitySummaryFromDate:(id)a3 calendar:(id)a4 moveQuantity:(id)a5 exerciseQuantity:(id)a6 standQuantity:(id)a7 moveGoal:(id)a8 exerciseGoal:(id)a9 standGoal:(id)a10
{
  uint64_t v35 = self;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v36 = a10;
  id v20 = a4;
  id v21 = a3;
  int v22 = objc_alloc_init(HKHourlyActivitySummary);
  uint64_t v23 = [v20 components:62 fromDate:v21];

  id v24 = v19;
  uint64_t v25 = v16;
  [v23 setCalendar:v20];

  [(HKHourlyActivitySummary *)v22 setHourlyDateComponents:v23];
  if (v16)
  {
    [(HKHourlyActivitySummary *)v22 setAppleExerciseTime:v16];
    if (v24) {
      [(HKHourlyActivitySummary *)v22 setExerciseTimeGoal:v24];
    }
  }
  id v26 = v15;
  unsigned __int8 v28 = v35;
  uint64_t v27 = v36;
  if (v26)
  {
    if (v35->_activityMoveMode != 2)
    {
      [(HKHourlyActivitySummary *)v22 setActiveEnergyBurned:v26];
      if (!v18) {
        goto LABEL_12;
      }
      goto LABEL_10;
    }
    [(HKHourlyActivitySummary *)v22 setAppleMoveTime:v26];
  }
  if (!v18)
  {
LABEL_12:
    if (!v17) {
      goto LABEL_18;
    }
    goto LABEL_15;
  }
LABEL_10:
  if (v35->_activityMoveMode == 2)
  {
    [(HKHourlyActivitySummary *)v22 setAppleMoveTimeGoal:v18];
    goto LABEL_12;
  }
  [(HKHourlyActivitySummary *)v22 setActiveEnergyBurnedGoal:v18];
  if (!v17) {
    goto LABEL_18;
  }
LABEL_15:
  -[HKHourlyActivitySummary setAppleStandHours:](v22, "setAppleStandHours:", v17, v35);
  if (v36)
  {
    [(HKHourlyActivitySummary *)v22 setStandHoursGoal:v36];
  }
  else
  {
    id v29 = v25;
    long long v30 = v24;
    long long v31 = (void *)MEMORY[0x1E4F2B370];
    long long v32 = [MEMORY[0x1E4F2B618] countUnit];
    long long v33 = [v31 quantityWithUnit:v32 doubleValue:1.0];
    [(HKHourlyActivitySummary *)v22 setStandHoursGoal:v33];

    id v24 = v30;
    uint64_t v25 = v29;
    uint64_t v27 = 0;
  }
LABEL_18:
  -[HKHourlyActivitySummary setActivityMoveMode:](v22, "setActivityMoveMode:", v28->_activityMoveMode, v35);

  return v22;
}

- (BOOL)_sampleDate:(id)a3 withinHourBeforeDate:(id)a4
{
  id v5 = a3;
  [a4 timeIntervalSinceReferenceDate];
  double v7 = v6;
  [v5 timeIntervalSinceReferenceDate];
  double v9 = v8;

  return v7 - v9 < (double)(unint64_t)*MEMORY[0x1E4F296F0] && v7 - v9 >= 0.0;
}

- (id)_hourlySummariesFromStartDate:(id)a3 endDate:(id)a4 calendar:(id)a5 activeEnergyData:(id)a6 appleMoveTimeData:(id)a7 exerciseData:(id)a8 standData:(id)a9 dayGoalData:(id)a10
{
  id v15 = a3;
  id v69 = a4;
  id v16 = a5;
  id v60 = a6;
  id v59 = a7;
  id v17 = a8;
  id v18 = a9;
  id v19 = a10;
  id v61 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v68 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v68 setHour:1];
  id v20 = v15;
  double v62 = [MEMORY[0x1E4F2B618] countUnit];
  v71 = v16;
  uint64_t v58 = v20;
  if ((unint64_t)[v19 count] < 2)
  {
    v73 = 0;
  }
  else
  {
    id v21 = [v19 objectAtIndexedSubscript:1];
    int v22 = [v21 dateComponentsForCalendar:v16];

    id v20 = v58;
    v73 = [v16 dateFromComponents:v22];
  }
  uint64_t v23 = v60;
  if (self->_activityMoveMode == 2) {
    uint64_t v23 = v59;
  }
  id v67 = v23;
  if (objc_msgSend(v20, "hk_isBeforeOrEqualToDate:", v69))
  {
    unint64_t v24 = 0;
    unint64_t v75 = 0;
    unint64_t v25 = 0;
    unint64_t v26 = 0;
    uint64_t v27 = v20;
    id v65 = v18;
    id v66 = v17;
    id v70 = v19;
    while (1)
    {
      unsigned __int8 v28 = v27;
      if (v24 >= [v67 count])
      {
        unint64_t v74 = v24;
        uint64_t v35 = 0;
      }
      else
      {
        unint64_t v63 = v26;
        unint64_t v29 = v25;
        long long v30 = [v67 objectAtIndexedSubscript:v24];
        [v30 startDate];
        long long v32 = v31 = v24;
        int v33 = [v32 isEqual:v27];

        if (v33)
        {
          id v34 = [v67 objectAtIndexedSubscript:v31];
          uint64_t v35 = [v34 quantityValue];

          unint64_t v74 = v31 + 1;
        }
        else
        {
          unint64_t v74 = v31;
          uint64_t v35 = 0;
        }
        unint64_t v25 = v29;
        unint64_t v26 = v63;
      }
      if (v75 >= [v17 count])
      {
        id v40 = 0;
      }
      else
      {
        id v36 = [v17 objectAtIndexedSubscript:v75];
        int v37 = [v36 startDate];
        int v38 = [v37 isEqual:v27];

        if (v38)
        {
          double v39 = [v17 objectAtIndexedSubscript:v75];
          id v40 = [v39 quantityValue];

          ++v75;
        }
        else
        {
          id v40 = 0;
        }
        id v19 = v70;
      }
      if (v25 >= [v18 count])
      {
        uint64_t v46 = 0;
      }
      else
      {
        uint64_t v41 = (void *)MEMORY[0x1E4F1C9C8];
        id v42 = [v18 objectAtIndexedSubscript:v25];
        [v42 timeStamp];
        double v43 = objc_msgSend(v41, "dateWithTimeIntervalSinceReferenceDate:");

        if ([(HKActivitySummaryDataProvider *)self _sampleDate:v43 withinHourBeforeDate:v27])
        {
          double v44 = [v18 objectAtIndexedSubscript:v25];
          if ([v44 state]) {
            double v45 = 0.0;
          }
          else {
            double v45 = 1.0;
          }

          uint64_t v46 = [MEMORY[0x1E4F2B370] quantityWithUnit:v62 doubleValue:v45];
          ++v25;
        }
        else
        {
          uint64_t v46 = 0;
        }
        id v19 = v70;
      }
      if (v26 >= [v19 count])
      {
        id v47 = 0;
        if (v35) {
          goto LABEL_35;
        }
      }
      else
      {
        id v47 = [v19 objectAtIndexedSubscript:v26];
        if (v35) {
          goto LABEL_35;
        }
      }
      if (v40 || v46)
      {
LABEL_35:
        if ([v47 activityMoveMode] == self->_activityMoveMode
          && ([v47 isPaused] & 1) == 0)
        {
          unint64_t v64 = v25;
          if (v47)
          {
            if (self->_activityMoveMode == 2) {
              [v47 appleMoveTimeGoal];
            }
            else {
            double v49 = [v47 activeEnergyBurnedGoal];
            }
            v51 = v71;
            v50 = [v47 exerciseTimeGoal];
            id v48 = [v47 standHoursGoal];
          }
          else
          {
            id v48 = 0;
            double v49 = 0;
            v50 = 0;
            v51 = v71;
          }
          uint64_t v52 = [(HKActivitySummaryDataProvider *)self _buildHourlyActivitySummaryFromDate:v28 calendar:v51 moveQuantity:v35 exerciseQuantity:v40 standQuantity:v46 moveGoal:v49 exerciseGoal:v50 standGoal:v48];
          [v61 addObject:v52];

          id v19 = v70;
          unint64_t v25 = v64;
        }
      }
      uint64_t v27 = [v71 dateByAddingComponents:v68 toDate:v28 options:0];

      if (v73)
      {
        if (objc_msgSend(v27, "hk_isAfterOrEqualToDate:") && v26 < objc_msgSend(v19, "count") - 1)
        {
          if (v26 + 2 < [v19 count])
          {
            v53 = [v19 objectAtIndexedSubscript:v26 + 2];
            double v54 = [v53 dateComponentsForCalendar:v71];

            uint64_t v55 = [v71 dateFromComponents:v54];

            id v19 = v70;
            v73 = (void *)v55;
          }
          ++v26;
        }
      }
      else
      {
        v73 = 0;
      }

      id v18 = v65;
      id v17 = v66;
      unint64_t v24 = v74;
      if ((objc_msgSend(v27, "hk_isBeforeOrEqualToDate:", v69) & 1) == 0) {
        goto LABEL_54;
      }
    }
  }
  uint64_t v27 = v20;
LABEL_54:
  id v56 = v61;

  return v56;
}

- (void)_hourlyActivityDataForStartDate:(id)a3 endDate:(id)a4 healthStore:(id)a5 calendar:(id)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v17 setHour:1];
  objc_initWeak(&location, self);
  id v18 = objc_alloc(MEMORY[0x1E4F2B840]);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __102__HKActivitySummaryDataProvider__hourlyActivityDataForStartDate_endDate_healthStore_calendar_handler___block_invoke;
  v25[3] = &unk_1E6D55590;
  id v19 = v15;
  id v26 = v19;
  id v20 = v12;
  id v27 = v20;
  id v21 = v13;
  id v28 = v21;
  objc_copyWeak(&v31, &location);
  id v22 = v16;
  id v30 = v22;
  id v23 = v14;
  id v29 = v23;
  unint64_t v24 = (void *)[v18 initWithStartDate:v20 endDate:v21 moveIntervalComponents:v17 exerciseIntervalComponents:v17 initialQueryResultsHandler:v25];
  [v23 executeQuery:v24];

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);
}

void __102__HKActivitySummaryDataProvider__hourlyActivityDataForStartDate_endDate_healthStore_calendar_handler___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  double v11 = [v9 activeEnergyResults];
  if (!v11)
  {
    id v4 = [v9 appleMoveTimeResults];
    if (!v4) {
      goto LABEL_11;
    }
  }
  id v12 = [v9 appleExerciseTimeResults];
  if (!v12)
  {

    if (v11) {
      id v14 = v11;
    }
    else {
      id v14 = v4;
    }

    goto LABEL_11;
  }
  id v13 = [v9 appleStandHourResults];

  if (v11)
  {

    if (!v13) {
      goto LABEL_11;
    }
LABEL_13:
    id v15 = objc_msgSend(a1[4], "hk_activitySummaryDateComponentsFromDate:", a1[5]);
    id v16 = objc_msgSend(a1[4], "hk_activitySummaryDateComponentsFromDate:", a1[6]);
    id v17 = [MEMORY[0x1E4F2B3C0] predicateForActivitySummariesBetweenStartDateComponents:v15 endDateComponents:v16];
    id v18 = objc_alloc(MEMORY[0x1E4F2ABB0]);
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    id v22 = __102__HKActivitySummaryDataProvider__hourlyActivityDataForStartDate_endDate_healthStore_calendar_handler___block_invoke_2;
    id v23 = &unk_1E6D55568;
    objc_copyWeak(&v29, a1 + 9);
    id v24 = a1[5];
    id v25 = a1[6];
    id v26 = a1[4];
    id v27 = v9;
    id v28 = a1[8];
    id v19 = (void *)[v18 initWithPredicate:v17 resultsHandler:&v20];
    objc_msgSend(a1[7], "executeQuery:", v19, v20, v21, v22, v23);

    objc_destroyWeak(&v29);
    goto LABEL_14;
  }

  if (v13) {
    goto LABEL_13;
  }
LABEL_11:
  (*((void (**)(void))a1[8] + 2))();
LABEL_14:
}

void __102__HKActivitySummaryDataProvider__hourlyActivityDataForStartDate_endDate_healthStore_calendar_handler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v16 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (v16 && WeakRetained)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    double v11 = [*(id *)(a1 + 56) activeEnergyResults];
    id v12 = [*(id *)(a1 + 56) appleMoveTimeResults];
    id v13 = [*(id *)(a1 + 56) appleExerciseTimeResults];
    id v14 = [*(id *)(a1 + 56) appleStandHourResults];
    id v15 = [WeakRetained _hourlySummariesFromStartDate:v8 endDate:v9 calendar:v10 activeEnergyData:v11 appleMoveTimeData:v12 exerciseData:v13 standData:v14 dayGoalData:v16];

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

- (id)_predicateForStartDate:(id)a3 endDate:(id)a4 calendar:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  uint64_t v9 = objc_msgSend(v7, "hk_activitySummaryDateComponentsFromDate:", a3);
  uint64_t v10 = objc_msgSend(v7, "hk_activitySummaryDateComponentsFromDate:", v8);

  double v11 = [MEMORY[0x1E4F2B3C0] predicateForActivitySummariesBetweenStartDateComponents:v9 endDateComponents:v10];

  return v11;
}

- (id)_predicateForStartDate:(id)a3 endDate:(id)a4 calendar:(id)a5 activityMoveMode:(int64_t)a6
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a4;
  double v11 = objc_msgSend(v9, "hk_activitySummaryDateComponentsFromDate:", a3);
  id v12 = objc_msgSend(v9, "hk_activitySummaryDateComponentsFromDate:", v10);

  id v13 = [MEMORY[0x1E4F2B3C0] predicateForActivitySummariesBetweenStartDateComponents:v11 endDateComponents:v12];
  if (a6 == 2)
  {
    id v14 = [MEMORY[0x1E4F2B3C0] predicateForActivitySummariesWithActivityMoveMode:2];
    id v15 = (void *)MEMORY[0x1E4F28BA0];
    v26[0] = v13;
    v26[1] = v14;
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
    id v17 = [v15 andPredicateWithSubpredicates:v16];
  }
  else
  {
    id v14 = [MEMORY[0x1E4F2B3C0] predicateForActivitySummariesWithActivityMoveMode:1];
    id v16 = [MEMORY[0x1E4F2B3C0] predicateForActivitySummariesWithActivityMoveMode:0];
    id v18 = (void *)MEMORY[0x1E4F28BA0];
    v25[0] = v14;
    v25[1] = v16;
    id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
    uint64_t v20 = [v18 orPredicateWithSubpredicates:v19];

    uint64_t v21 = (void *)MEMORY[0x1E4F28BA0];
    v24[0] = v20;
    v24[1] = v13;
    id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
    id v17 = [v21 andPredicateWithSubpredicates:v22];
  }
  return v17;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (HKDateCache)dateCache
{
  return self->_dateCache;
}

- (HKDisplayTypeController)displayTypeController
{
  return self->_displayTypeController;
}

- (HKUnitPreferenceController)unitController
{
  return self->_unitController;
}

- (int64_t)activityMoveMode
{
  return self->_activityMoveMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitController, 0);
  objc_storeStrong((id *)&self->_displayTypeController, 0);
  objc_storeStrong((id *)&self->_dateCache, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_databaseChangesThrottle, 0);
  objc_storeStrong((id *)&self->_hourlyActivitySummaryCache, 0);
  objc_storeStrong((id *)&self->_observerQuery, 0);
  objc_storeStrong((id *)&self->_outstandingFetchOperation, 0);
  objc_storeStrong((id *)&self->_cachedCalendar, 0);
  objc_storeStrong((id *)&self->_activitySummaryForTimeScopeCache, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

void __68__HKActivitySummaryDataProvider__mainQueueFetchValueWithRetryCount___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)v3 = 138543618;
  *(void *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1_2(&dword_1E0B26000, a2, a3, "%{public}@: Received error fetching activity summaries %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

- (void)_hourlyActivityPageDataArrived:(uint64_t)a1 pageNumber:(uint64_t)a2 error:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)v3 = 138543618;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1_2(&dword_1E0B26000, a2, a3, "%{public}@: Received error fetching hourly activity summaries %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

@end