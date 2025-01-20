@interface HKMCViewModelProvider
- ($0AC6E346AE4835514AAA8AC86D8F4844)_test_managedDayRange;
- ($0AC6E346AE4835514AAA8AC86D8F4844)activeDayRange;
- (BOOL)_didFetchInitialAnalysis;
- (BOOL)_didFetchMinimumAnalysis;
- (BOOL)_ppt_didFetchAnalysis;
- (BOOL)_ppt_didFetchDaySummaries;
- (HKCalendarCache)calendarCache;
- (HKMCViewModelProvider)initWithHealthStore:(id)a3 analysisProvider:(id)a4 pregnancyModelProvider:(id)a5 maximumActiveDuration:(int64_t)a6 minimumBufferDuration:(int64_t)a7 shouldFetchCycleFactors:(BOOL)a8 calendarCache:(id)a9;
- (HKMCViewModelProvider)initWithHealthStore:(id)a3 analysisProvider:(id)a4 pregnancyModelProvider:(id)a5 maximumActiveDuration:(int64_t)a6 minimumBufferDuration:(int64_t)a7 shouldFetchCycleFactors:(BOOL)a8 calendarCache:(id)a9 queue:(id)a10;
- (id)_copyWithDataSource:(id)a3 cycleFactorsDataSource:(id)a4 minimumBufferDuration:(int64_t)a5;
- (id)_initWithDataSource:(id)a3 cycleFactorsDataSource:(id)a4 analysisProvider:(id)a5 maximumActiveDuration:(int64_t)a6 minimumBufferDuration:(int64_t)a7 prefetchDuration:(int64_t)a8 shouldFetchCycleFactors:(BOOL)a9 calendarCache:(id)a10 queue:(id)a11;
- (id)_viewModelWithDayIndex:(int64_t)a3 fetchedDaySummary:(id)a4;
- (id)copyWithMinimumBufferDuration:(int64_t)a3;
- (id)dayViewModelAtIndex:(int64_t)a3;
- (int64_t)_fetchStateForDayIndex:(int64_t)a3;
- (int64_t)maximumActiveDuration;
- (int64_t)minimumBufferDuration;
- (int64_t)todayDayIndex;
- (unint64_t)_bleedingAfterPregnancyLevel:(int64_t)a3;
- (unint64_t)_bleedingInPregnancyLevel:(int64_t)a3;
- (unint64_t)_fertileWindowLevelWithDayIndex:(int64_t)a3;
- (unint64_t)_menstruationLevelWithDayIndex:(int64_t)a3 menstrualFlow:(int64_t)a4 partiallyLoggedPeriod:(BOOL *)a5;
- (unint64_t)_pregnancyStateWithDayIndex:(int64_t)a3 cycleFactors:(id)a4;
- (void)_queue_notifyObserversDidUpdate;
- (void)_queue_runNotifyObserversOperationNow;
- (void)_setFetchState:(int64_t)a3 forDayIndexRange:(id)a4;
- (void)_updateManagedDayRangeIfNeeded;
- (void)analysisProvider:(id)a3 didUpdateAnalysis:(id)a4;
- (void)cycleFactorsDataSource:(id)a3 didFetchCycleFactors:(id)a4;
- (void)cycleFactorsDataSource:(id)a3 didUpdatePregnancyModel:(id)a4;
- (void)dealloc;
- (void)registerObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setActiveCycles:(id)a3;
- (void)setActiveDayRange:(id)a3;
- (void)setMaximumActiveDuration:(int64_t)a3;
- (void)setTodayDayIndex:(int64_t)a3;
- (void)viewModelProviderDataSource:(id)a3 didFetchDaySummaries:(id)a4 forDayIndexRange:(id)a5 daySummaryAnchor:(id)a6;
- (void)viewModelProviderDataSourceDidUpdateDaySummaries:(id)a3;
@end

@implementation HKMCViewModelProvider

- (void)setActiveCycles:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (![v5 count])
  {
    v22 = [MEMORY[0x263F08690] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"HKMCViewModelProvider+HKMCCycle.m", 21, @"Invalid parameter not satisfying: %@", @"activeCycles.count > 0" object file lineNumber description];
  }
  v23 = self;
  v6 = [(HKMCViewModelProvider *)self calendarCache];
  v7 = [v6 currentCalendar];
  uint64_t v8 = HKMCTodayIndex(v7);

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v25;
    int64_t v13 = 0xFFFFFFFF80000000;
    uint64_t v14 = 0x7FFFFFFFLL;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v17 = [v16 menstruationSegment];
        uint64_t v18 = [v17 days];

        if (v18 < v14) {
          uint64_t v14 = v18;
        }
        v19 = [v16 lastDayIndex];
        uint64_t v20 = [v19 integerValue];
        if (v20) {
          uint64_t v21 = v20;
        }
        else {
          uint64_t v21 = v8;
        }

        if (v21 > v13) {
          int64_t v13 = v21;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v11);
  }
  else
  {
    int64_t v13 = 0xFFFFFFFF80000000;
    uint64_t v14 = 0x7FFFFFFFLL;
  }

  [(HKMCViewModelProvider *)v23 setMaximumActiveDuration:v13 - v14 + 1];
  -[HKMCViewModelProvider setActiveDayRange:](v23, "setActiveDayRange:", v14, v13 - v14 + 1);
}

- (HKMCViewModelProvider)initWithHealthStore:(id)a3 analysisProvider:(id)a4 pregnancyModelProvider:(id)a5 maximumActiveDuration:(int64_t)a6 minimumBufferDuration:(int64_t)a7 shouldFetchCycleFactors:(BOOL)a8 calendarCache:(id)a9
{
  return [(HKMCViewModelProvider *)self initWithHealthStore:a3 analysisProvider:a4 pregnancyModelProvider:a5 maximumActiveDuration:a6 minimumBufferDuration:a7 shouldFetchCycleFactors:a8 calendarCache:a9 queue:MEMORY[0x263EF83A0]];
}

- (HKMCViewModelProvider)initWithHealthStore:(id)a3 analysisProvider:(id)a4 pregnancyModelProvider:(id)a5 maximumActiveDuration:(int64_t)a6 minimumBufferDuration:(int64_t)a7 shouldFetchCycleFactors:(BOOL)a8 calendarCache:(id)a9 queue:(id)a10
{
  id v16 = a10;
  id v17 = a9;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  uint64_t v21 = [[HKMCViewModelProviderDataSource alloc] initWithHealthStore:v20 calendarCache:v17 queue:v16];
  v22 = [[HKMCCycleFactorsDataSource alloc] initWithHealthStore:v20 pregnancyModelProvider:v18 queue:v16];

  LOBYTE(v25) = a8;
  v23 = [(HKMCViewModelProvider *)self _initWithDataSource:v21 cycleFactorsDataSource:v22 analysisProvider:v19 maximumActiveDuration:a6 minimumBufferDuration:a7 prefetchDuration:5 * a7 shouldFetchCycleFactors:v25 calendarCache:v17 queue:v16];

  return v23;
}

- (id)_initWithDataSource:(id)a3 cycleFactorsDataSource:(id)a4 analysisProvider:(id)a5 maximumActiveDuration:(int64_t)a6 minimumBufferDuration:(int64_t)a7 prefetchDuration:(int64_t)a8 shouldFetchCycleFactors:(BOOL)a9 calendarCache:(id)a10 queue:(id)a11
{
  id v17 = a3;
  id v41 = a4;
  id v40 = a5;
  id v42 = a10;
  id v18 = a11;
  v46.receiver = self;
  v46.super_class = (Class)HKMCViewModelProvider;
  id v19 = [(HKMCViewModelProvider *)&v46 init];
  id v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_queue, a11);
    objc_storeStrong((id *)&v20->_dataSource, a3);
    [(HKMCViewModelProviderDataSource *)v20->_dataSource setDelegate:v20];
    objc_storeStrong((id *)&v20->_cycleFactorsDataSource, a4);
    objc_storeStrong((id *)&v20->_analysisProvider, a5);
    [(HKMCAnalysisProvider *)v20->_analysisProvider addObserver:v20 queue:v18];
    id v21 = v18;
    if (a9) {
      [(HKMCCycleFactorsDataSourceProviding *)v20->_cycleFactorsDataSource setDelegate:v20];
    }
    if (a7 > a8)
    {
      v37 = [MEMORY[0x263F08690] currentHandler];
      [v37 handleFailureInMethod:a2, v20, @"HKMCViewModelProvider.m", 134, @"Invalid parameter not satisfying: %@", @"minimumBufferDuration <= prefetchDuration" object file lineNumber description];
    }
    v20->_maximumActiveDuration = a6;
    v20->_minimumBufferDuration = a7;
    v20->_prefetchDuration = a8;
    v20->_shouldFetchCycleFactors = a9;
    uint64_t v22 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v20->_observers;
    v20->_observers = (NSHashTable *)v22;

    uint64_t v24 = [MEMORY[0x263F089C8] indexSet];
    fetchStartedDayIndexes = v20->_fetchStartedDayIndexes;
    v20->_fetchStartedDayIndexes = (NSMutableIndexSet *)v24;

    uint64_t v26 = [MEMORY[0x263F089C8] indexSet];
    fetchCompletedDayIndexes = v20->_fetchCompletedDayIndexes;
    v20->_fetchCompletedDayIndexes = (NSMutableIndexSet *)v26;

    uint64_t v28 = [MEMORY[0x263EFF9A0] dictionary];
    daySummariesByDayIndex = v20->_daySummariesByDayIndex;
    v20->_daySummariesByDayIndex = (NSMutableDictionary *)v28;

    objc_storeStrong((id *)&v20->_calendarCache, a10);
    v30 = [v42 currentCalendar];
    v20->_todayDayIndex = HKMCTodayIndex(v30);

    objc_initWeak(&location, v20);
    id v31 = objc_alloc(MEMORY[0x263F0A9B0]);
    v32 = v21;
    queue = v20->_queue;
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __190__HKMCViewModelProvider__initWithDataSource_cycleFactorsDataSource_analysisProvider_maximumActiveDuration_minimumBufferDuration_prefetchDuration_shouldFetchCycleFactors_calendarCache_queue___block_invoke;
    v43[3] = &unk_2646E96D0;
    objc_copyWeak(&v44, &location);
    uint64_t v34 = [v31 initWithQueue:queue delay:v43 block:1.0];
    notifyObserversOperation = v20->_notifyObserversOperation;
    v20->_notifyObserversOperation = (_HKDelayedOperation *)v34;

    objc_destroyWeak(&v44);
    objc_destroyWeak(&location);
    id v18 = v32;
  }

  return v20;
}

void __190__HKMCViewModelProvider__initWithDataSource_cycleFactorsDataSource_analysisProvider_maximumActiveDuration_minimumBufferDuration_prefetchDuration_shouldFetchCycleFactors_calendarCache_queue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_runNotifyObserversOperationNow");
}

- (id)copyWithMinimumBufferDuration:(int64_t)a3
{
  id v5 = [HKMCViewModelProviderDataSource alloc];
  v6 = [(HKMCAnalysisProvider *)self->_analysisProvider healthStore];
  v7 = [(HKMCViewModelProviderDataSource *)v5 initWithHealthStore:v6 calendarCache:self->_calendarCache queue:self->_queue];

  uint64_t v8 = [HKMCCycleFactorsDataSource alloc];
  id v9 = [(HKMCAnalysisProvider *)self->_analysisProvider healthStore];
  uint64_t v10 = [(HKMCCycleFactorsDataSource *)v8 initWithHealthStore:v9 pregnancyModelProvider:0 queue:self->_queue];

  id v11 = [(HKMCViewModelProvider *)self _copyWithDataSource:v7 cycleFactorsDataSource:v10 minimumBufferDuration:a3];
  return v11;
}

- (id)_copyWithDataSource:(id)a3 cycleFactorsDataSource:(id)a4 minimumBufferDuration:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v28) = self->_shouldFetchCycleFactors;
  id v11 = (void *)[v10 _initWithDataSource:v9 cycleFactorsDataSource:v8 analysisProvider:self->_analysisProvider maximumActiveDuration:self->_maximumActiveDuration minimumBufferDuration:a5 prefetchDuration:5 * a5 shouldFetchCycleFactors:v28 calendarCache:self->_calendarCache queue:self->_queue];

  uint64_t v12 = [(NSMutableIndexSet *)self->_fetchCompletedDayIndexes mutableCopy];
  int64_t v13 = (void *)v11[12];
  v11[12] = v12;

  fetchCompletedDayIndexes = self->_fetchCompletedDayIndexes;
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __90__HKMCViewModelProvider__copyWithDataSource_cycleFactorsDataSource_minimumBufferDuration___block_invoke;
  v29[3] = &unk_2646E96F8;
  v15 = v11;
  id v30 = v15;
  [(NSMutableIndexSet *)fetchCompletedDayIndexes hk_enumerateDayIndexRangesUsingBlock:v29];
  uint64_t v16 = [(NSMutableDictionary *)self->_daySummariesByDayIndex mutableCopy];
  id v17 = (void *)v15[13];
  v15[13] = v16;

  uint64_t v18 = [(NSArray *)self->_cycleFactors copy];
  id v19 = (void *)v15[14];
  v15[14] = v18;

  uint64_t v20 = [(HKMCAnalysis *)self->_analysis copy];
  id v21 = (void *)v15[16];
  v15[16] = v20;

  uint64_t v22 = [(HKMCPregnancyModel *)self->_lastPregnancyModel copy];
  v23 = (void *)v15[17];
  v15[17] = v22;

  uint64_t v24 = [(NSNumber *)self->_minimumAnalysisAnchor copy];
  uint64_t v25 = (void *)v15[15];
  v15[15] = v24;

  objc_msgSend(v15, "setActiveDayRange:", self->_activeDayRange.start, self->_activeDayRange.duration);
  _HKInitializeLogging();
  uint64_t v26 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEBUG)) {
    -[HKMCViewModelProvider _copyWithDataSource:cycleFactorsDataSource:minimumBufferDuration:](v26, (uint64_t)self, (uint64_t)v15);
  }

  return v15;
}

uint64_t __90__HKMCViewModelProvider__copyWithDataSource_cycleFactorsDataSource_minimumBufferDuration___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(result + 32);
  *(void *)(v3 + 72) = a2;
  *(void *)(v3 + 80) = a3;
  return result;
}

- (id)dayViewModelAtIndex:(int64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(HKMCViewModelProvider *)self _fetchStateForDayIndex:a3] == 2)
  {
    daySummariesByDayIndex = self->_daySummariesByDayIndex;
    v6 = [NSNumber numberWithInteger:a3];
    v7 = [(NSMutableDictionary *)daySummariesByDayIndex objectForKeyedSubscript:v6];

    id v8 = [(HKMCViewModelProvider *)self _viewModelWithDayIndex:a3 fetchedDaySummary:v7];
  }
  else
  {
    id v8 = +[HKMCDayViewModel unfetchedDayViewModel];
  }
  return v8;
}

- (void)setActiveDayRange:(id)a3
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  uint64_t v22 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (var1 <= self->_maximumActiveDuration)
  {
    if (self->_activeDayRange.start != var0 || self->_activeDayRange.duration != var1)
    {
      _HKInitializeLogging();
      int64_t v13 = (void *)*MEMORY[0x263F09930];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEBUG)) {
        -[HKMCViewModelProvider setActiveDayRange:](v13, (uint64_t)self);
      }
      self->_activeDayRange.start = var0;
      self->_activeDayRange.duration = var1;
      [(HKMCViewModelProvider *)self _updateManagedDayRangeIfNeeded];
    }
  }
  else
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR))
    {
      v7 = v6;
      id v8 = objc_opt_class();
      id v9 = v8;
      id v10 = NSStringFromHKDayIndexRange();
      id v11 = [NSNumber numberWithInteger:self->_maximumActiveDuration];
      int v14 = 138544130;
      v15 = v8;
      __int16 v16 = 2048;
      id v17 = self;
      __int16 v18 = 2114;
      id v19 = v10;
      __int16 v20 = 2114;
      id v21 = v11;
      _os_log_error_impl(&dword_2249E9000, v7, OS_LOG_TYPE_ERROR, "[%{public}@:%p] Ignoring invalid active day range: %{public}@, maximum duration is %{public}@", (uint8_t *)&v14, 0x2Au);
    }
  }
}

- (id)_viewModelWithDayIndex:(int64_t)a3 fetchedDaySummary:(id)a4
{
  id v6 = a4;
  char v27 = 0;
  unint64_t v7 = -[HKMCViewModelProvider _menstruationLevelWithDayIndex:menstrualFlow:partiallyLoggedPeriod:](self, "_menstruationLevelWithDayIndex:menstrualFlow:partiallyLoggedPeriod:", a3, [v6 menstrualFlow], &v27);
  unint64_t v8 = [(HKMCViewModelProvider *)self _fertileWindowLevelWithDayIndex:a3];
  id v9 = [(HKCalendarCache *)self->_calendarCache currentCalendar];
  id v10 = v9;
  cycleFactors = self->_cycleFactors;
  if (cycleFactors)
  {
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __66__HKMCViewModelProvider__viewModelWithDayIndex_fetchedDaySummary___block_invoke;
    v24[3] = &unk_2646E9720;
    id v25 = v9;
    int64_t v26 = a3;
    v23 = [(NSArray *)cycleFactors hk_filter:v24];
    unint64_t v12 = [(HKMCViewModelProvider *)self _pregnancyStateWithDayIndex:a3 cycleFactors:self->_cycleFactors];
    unint64_t v13 = -[HKMCViewModelProvider _bleedingInPregnancyLevel:](self, "_bleedingInPregnancyLevel:", [v6 bleedingInPregnancyFlow]);
    unint64_t v14 = -[HKMCViewModelProvider _bleedingAfterPregnancyLevel:](self, "_bleedingAfterPregnancyLevel:", [v6 bleedingAfterPregnancyFlow]);

    if (v6) {
      goto LABEL_11;
    }
  }
  else
  {
    v23 = 0;
    unint64_t v12 = 0;
    unint64_t v13 = 0;
    unint64_t v14 = 0;
    if (v6) {
      goto LABEL_11;
    }
  }
  if (!v7 && !v8 && !v12 && !v13 && !v14 && ![v23 count])
  {
    if ([(HKMCViewModelProvider *)self _didFetchInitialAnalysis]) {
      +[HKMCDayViewModel emptyDayViewModel];
    }
    else {
    __int16 v20 = +[HKMCDayViewModel unfetchedDayViewModel];
    }
    id v19 = v23;
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v15 = v8;
  unint64_t v16 = v7;
  id v17 = v10;
  char v18 = v27;
  BYTE1(v22) = [(HKMCViewModelProvider *)self _didFetchInitialAnalysis];
  LOBYTE(v22) = v18;
  id v10 = v17;
  id v19 = v23;
  __int16 v20 = +[HKMCDayViewModel dayViewModelWithMenstruationLevel:fertileWindowLevel:pregnancyState:bleedingInPregnancyLevel:bleedingAfterPregnancyLevel:daySummary:cycleFactors:partiallyLoggedPeriod:fetched:](HKMCDayViewModel, "dayViewModelWithMenstruationLevel:fertileWindowLevel:pregnancyState:bleedingInPregnancyLevel:bleedingAfterPregnancyLevel:daySummary:cycleFactors:partiallyLoggedPeriod:fetched:", v16, v15, v12, v13, v14, v6, v23, v22);
LABEL_12:

  return v20;
}

BOOL __66__HKMCViewModelProvider__viewModelWithDayIndex_fetchedDaySummary___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(a2, "hk_dayIndexRangeWithCalendar:", *(void *)(a1 + 32));
  uint64_t v5 = *(void *)(a1 + 40);
  BOOL v7 = v5 < v3;
  uint64_t v6 = v5 - v3;
  return !v7 && v6 < v4;
}

- (unint64_t)_pregnancyStateWithDayIndex:(int64_t)a3 cycleFactors:(id)a4
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v6 = a4;
  BOOL v7 = [(HKCalendarCache *)self->_calendarCache currentCalendar];
  uint64_t v8 = [MEMORY[0x263F0A480] recentPregnancyStartThresholdInDays];
  uint64_t v44 = [MEMORY[0x263F0A480] recentPregnancyEndThresholdInDays];
  uint64_t v9 = [MEMORY[0x263F0A480] maximumNumberOfWeeksPregnant];
  id v10 = [(HKMCPregnancyModel *)self->_lastPregnancyModel estimatedDueDate];

  int64_t v46 = a3;
  if (!v10) {
    goto LABEL_5;
  }
  id v11 = [(HKMCPregnancyModel *)self->_lastPregnancyModel estimatedDueDate];
  uint64_t v12 = objc_msgSend(v11, "hk_dayIndexWithCalendar:", v7);

  if (v12 != a3) {
    goto LABEL_5;
  }
  unint64_t v13 = [(HKMCPregnancyModel *)self->_lastPregnancyModel pregnancyEndDate];

  unint64_t v14 = [(HKMCPregnancyModel *)self->_lastPregnancyModel pregnancyEndDate];
  uint64_t v15 = objc_msgSend(v14, "hk_dayIndexWithCalendar:", v7);

  unint64_t v16 = 4;
  if (v13)
  {
    if (v15 < v46)
    {
LABEL_5:
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v41 = v6;
      id obj = v6;
      uint64_t v17 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
      if (!v17)
      {
        uint64_t v47 = 0;
        goto LABEL_44;
      }
      uint64_t v18 = v17;
      uint64_t v19 = 0;
      uint64_t v47 = 0;
      uint64_t v42 = 7 * v9;
      v43 = self;
      uint64_t v20 = *(void *)v50;
      id v21 = (void *)*MEMORY[0x263F093C0];
      uint64_t v45 = v8 + 1;
      while (1)
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v50 != v20) {
            objc_enumerationMutation(obj);
          }
          v23 = *(void **)(*((void *)&v49 + 1) + 8 * v22);
          uint64_t v24 = objc_msgSend(v23, "categoryType", v41);
          id v25 = [v24 identifier];
          if (v25 != v21)
          {

            goto LABEL_38;
          }
          int64_t v26 = [v23 startDate];
          uint64_t v27 = objc_msgSend(v26, "hk_dayIndexWithCalendar:", v7);

          if (v27 > v19)
          {
            uint64_t v28 = objc_msgSend(v23, "hk_dayIndexRangeWithCalendar:", v7);
            int64_t v30 = v29;
            id v31 = [v23 startDate];
            uint64_t v19 = objc_msgSend(v31, "hk_dayIndexWithCalendar:", v7);

            v32 = [v23 endDate];
            uint64_t v33 = objc_msgSend(v32, "hk_dayIndexWithCalendar:", v7);

            if (v45 + v19 >= v33) {
              uint64_t v34 = v33 - v19;
            }
            else {
              uint64_t v34 = v45;
            }
            if (v46 < v28 || v46 - v28 >= v30)
            {
              BOOL v37 = v46 - v33 > v44 || v46 < v33;
              uint64_t v36 = v47;
              if (!v37) {
                uint64_t v36 = 1;
              }
              goto LABEL_37;
            }
            if (v43->_todayDayIndex >= v46)
            {
              BOOL v38 = v46 - v19 >= v34 || v46 < v19;
              uint64_t v36 = 5;
              if (v38) {
                uint64_t v36 = 6;
              }
              goto LABEL_37;
            }
            if (v46 - v19 < v42)
            {
              BOOL v35 = v46 - v19 >= v34 || v46 < v19;
              uint64_t v36 = 2;
              if (!v35) {
                uint64_t v36 = 3;
              }
LABEL_37:
              uint64_t v47 = v36;
              goto LABEL_38;
            }
            uint64_t v47 = 0;
          }
LABEL_38:
          ++v22;
        }
        while (v18 != v22);
        uint64_t v39 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
        uint64_t v18 = v39;
        if (!v39)
        {
LABEL_44:

          id v6 = v41;
          unint64_t v16 = v47;
          break;
        }
      }
    }
  }

  return v16;
}

- (unint64_t)_bleedingInPregnancyLevel:(int64_t)a3
{
  unint64_t v3 = 1;
  if (a3 == 1) {
    unint64_t v3 = 2;
  }
  if (a3) {
    return v3;
  }
  else {
    return 0;
  }
}

- (unint64_t)_bleedingAfterPregnancyLevel:(int64_t)a3
{
  unint64_t v3 = 1;
  if (a3 == 1) {
    unint64_t v3 = 2;
  }
  if (a3) {
    return v3;
  }
  else {
    return 0;
  }
}

- (unint64_t)_menstruationLevelWithDayIndex:(int64_t)a3 menstrualFlow:(int64_t)a4 partiallyLoggedPeriod:(BOOL *)a5
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  if ((unint64_t)(a4 - 1) < 5) {
    return qword_224A17B48[a4 - 1];
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v9 = [(HKMCAnalysis *)self->_analysis cycles];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v37;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v37 != v12) {
          objc_enumerationMutation(v9);
        }
        unint64_t v14 = [*(id *)(*((void *)&v36 + 1) + 8 * i) menstruationSegment];
        int64_t v15 = [v14 days];
        int64_t v17 = v16;

        if (a3 >= v15 && a3 - v15 < v17)
        {

          return 3;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v36 objects:v41 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v19 = [(HKMCAnalysis *)self->_analysis menstruationProjections];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v33;
    unint64_t v5 = 2;
    while (2)
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v33 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void **)(*((void *)&v32 + 1) + 8 * j);
        int64_t v25 = [v24 mostLikelyDays];
        if (a3 >= v25 && a3 - v25 < v26) {
          goto LABEL_32;
        }
        int64_t v28 = [v24 allDays];
        if (a3 >= v28 && a3 - v28 < v29)
        {
          unint64_t v5 = 1;
LABEL_32:
          *a5 = [v24 isPartiallyLogged];

          return v5;
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v32 objects:v40 count:16];
      if (v21) {
        continue;
      }
      break;
    }
  }

  return 0;
}

- (unint64_t)_fertileWindowLevelWithDayIndex:(int64_t)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  unint64_t v5 = [(HKMCAnalysis *)self->_analysis cycles];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v40;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v40 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        uint64_t v11 = [v10 fertileWindowSegment];

        if (v11)
        {
          uint64_t v12 = [v10 fertileWindowSegment];
          uint64_t v13 = [v12 days];
          uint64_t v15 = v14 + v13 - 1;
          if (v14 <= 0) {
            uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
          }
          if (v15 == a3)
          {
            if ([v10 ovulationConfirmationType] == 1)
            {

LABEL_39:
              unint64_t v25 = 3;
              goto LABEL_41;
            }
            uint64_t v16 = [v10 ovulationConfirmationType];

            if (v16 == 2) {
              goto LABEL_39;
            }
          }
          else
          {
          }
          int64_t v17 = [v10 fertileWindowSegment];
          int64_t v18 = [v17 days];
          int64_t v20 = v19;

          if (a3 >= v18 && a3 - v18 < v20)
          {
            unint64_t v25 = 2;
            goto LABEL_41;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v39 objects:v44 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  unint64_t v5 = [(HKMCAnalysis *)self->_analysis fertileWindowProjections];
  uint64_t v22 = [v5 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v36;
    unint64_t v25 = 3;
LABEL_22:
    uint64_t v26 = 0;
    while (1)
    {
      if (*(void *)v36 != v24) {
        objc_enumerationMutation(v5);
      }
      uint64_t v27 = *(void **)(*((void *)&v35 + 1) + 8 * v26);
      if ([v27 predictionPrimarySource] == 3 || objc_msgSend(v27, "predictionPrimarySource") == 4)
      {
        uint64_t v28 = [v27 allDays];
        uint64_t v30 = v29 + v28 - 1;
        if (v29 <= 0) {
          uint64_t v30 = 0x7FFFFFFFFFFFFFFFLL;
        }
        if (v30 == a3) {
          break;
        }
      }
      int64_t v31 = [v27 allDays];
      if (a3 >= v31 && a3 - v31 < v32)
      {
        unint64_t v25 = 1;
        break;
      }
      if (v23 == ++v26)
      {
        uint64_t v23 = [v5 countByEnumeratingWithState:&v35 objects:v43 count:16];
        if (v23) {
          goto LABEL_22;
        }
        goto LABEL_36;
      }
    }
  }
  else
  {
LABEL_36:
    unint64_t v25 = 0;
  }
LABEL_41:

  return v25;
}

- (void)_updateManagedDayRangeIfNeeded
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  uint64_t start = self->_managedDayRange.start;
  uint64_t duration = self->_managedDayRange.duration;
  HKIntersectionDayIndexRange();
  int64_t v5 = self->_managedDayRange.start;
  if (v6)
  {
    int64_t minimumBufferDuration = self->_minimumBufferDuration;
    int64_t prefetchDuration = self->_prefetchDuration;
    uint64_t v9 = self->_maximumActiveDuration + 2 * prefetchDuration;
    int64_t v10 = self->_activeDayRange.start;
    if (v10 < minimumBufferDuration + v5)
    {
      if (v5 >= v10) {
        int64_t v11 = self->_activeDayRange.start;
      }
      else {
        int64_t v11 = self->_managedDayRange.start;
      }
      uint64_t start = v11 - prefetchDuration;
      int64_t v12 = self->_managedDayRange.duration;
      uint64_t v13 = v5 + v12 - 1;
      BOOL v14 = v12 <= 0;
      uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
      if (!v14) {
        uint64_t v15 = v13;
      }
      uint64_t v16 = v15 - start;
      if (v9 >= v16 + 1) {
        uint64_t duration = v16 + 1;
      }
      else {
        uint64_t duration = self->_maximumActiveDuration + 2 * prefetchDuration;
      }
    }
    int64_t v17 = self->_activeDayRange.duration;
    uint64_t v18 = v10 + v17 - 1;
    BOOL v14 = v17 <= 0;
    uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
    if (v14) {
      uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
    }
    if (duration > 0) {
      uint64_t v19 = duration + start - 1;
    }
    if (v18 > v19 - minimumBufferDuration)
    {
      if (v19 <= v18) {
        uint64_t v20 = v18;
      }
      else {
        uint64_t v20 = v19;
      }
      uint64_t v21 = v20 + prefetchDuration;
      if (v9 >= v21 - start + 1) {
        uint64_t duration = v21 - start + 1;
      }
      else {
        uint64_t duration = v9;
      }
      uint64_t start = v21 - duration + 1;
    }
  }
  else
  {
    int64_t v22 = self->_prefetchDuration;
    uint64_t start = self->_activeDayRange.start - v22;
    uint64_t duration = self->_activeDayRange.duration + 2 * v22;
  }
  if (v5 != start || self->_managedDayRange.duration != duration)
  {
    uint64_t v24 = objc_msgSend(MEMORY[0x263F088D0], "hk_indexSetWithDayIndexRange:");
    unint64_t v25 = objc_msgSend(MEMORY[0x263F088D0], "hk_indexSetWithDayIndexRange:", start, duration);
    self->_managedDayRange.uint64_t start = start;
    self->_managedDayRange.uint64_t duration = duration;
    _HKInitializeLogging();
    uint64_t v26 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = v26;
      uint64_t v28 = objc_opt_class();
      id v29 = v28;
      uint64_t v30 = NSStringFromHKDayIndexRange();
      *(_DWORD *)buf = 138543874;
      long long v36 = v28;
      __int16 v37 = 2048;
      long long v38 = self;
      __int16 v39 = 2114;
      long long v40 = v30;
      _os_log_impl(&dword_2249E9000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Updated managed day range: %{public}@", buf, 0x20u);
    }
    int64_t v31 = objc_msgSend(v24, "hk_indexSetSubtractingIndexes:", v25);
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __55__HKMCViewModelProvider__updateManagedDayRangeIfNeeded__block_invoke;
    v34[3] = &unk_2646E96F8;
    v34[4] = self;
    objc_msgSend(v31, "hk_enumerateDayIndexRangesUsingBlock:", v34);
    int64_t v32 = objc_msgSend(v25, "hk_indexSetSubtractingIndexes:", v24);
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __55__HKMCViewModelProvider__updateManagedDayRangeIfNeeded__block_invoke_2;
    v33[3] = &unk_2646E96F8;
    v33[4] = self;
    objc_msgSend(v32, "hk_enumerateDayIndexRangesUsingBlock:", v33);
    if (self->_shouldFetchCycleFactors) {
      -[HKMCCycleFactorsDataSourceProviding startObservingCycleFactorsInDayIndexRange:](self->_cycleFactorsDataSource, "startObservingCycleFactorsInDayIndexRange:", start, duration);
    }
  }
}

void __55__HKMCViewModelProvider__updateManagedDayRangeIfNeeded__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a2;
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "cancelFetchForDaySummariesInDayIndexRange:", a2, a3);
  objc_msgSend(*(id *)(a1 + 32), "_setFetchState:forDayIndexRange:", 0, v4, a3);
  uint64_t v6 = v4 + a3;
  do
  {
    do
    {
      uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 104);
      uint64_t v8 = [NSNumber numberWithInteger:v4];
      [v7 setObject:0 forKeyedSubscript:v8];

      ++v4;
    }
    while (a3 < 1);
  }
  while (v6 > v4);
}

uint64_t __55__HKMCViewModelProvider__updateManagedDayRangeIfNeeded__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 32), "_setFetchState:forDayIndexRange:", 1, a2, a3);
  uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 8);
  return objc_msgSend(v6, "fetchDaySummariesInDayIndexRange:", a2, a3);
}

- (int64_t)_fetchStateForDayIndex:(int64_t)a3
{
  if (-[NSMutableIndexSet containsIndex:](self->_fetchCompletedDayIndexes, "containsIndex:")) {
    return 2;
  }
  else {
    return [(NSMutableIndexSet *)self->_fetchStartedDayIndexes containsIndex:a3];
  }
}

- (void)_setFetchState:(int64_t)a3 forDayIndexRange:(id)a4
{
  int64_t var1 = a4.var1;
  int64_t var0 = a4.var0;
  if (a4.var0 < 0)
  {
    int64_t v12 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v13 = [NSString stringWithUTF8String:"NSRange NSRangeFromHKDayIndexRange(HKDayIndexRange)"];
    [v12 handleFailureInFunction:v13 file:@"HKDayIndexRange.h" lineNumber:46 description:@"Cannot convert day index ranges less than 0 to NSRange"];
  }
  p_fetchStartedDayIndexes = &self->_fetchStartedDayIndexes;
  -[NSMutableIndexSet removeIndexesInRange:](self->_fetchStartedDayIndexes, "removeIndexesInRange:", var0, var1);
  fetchCompletedDayIndexes = self->_fetchCompletedDayIndexes;
  p_fetchCompletedDayIndexes = &self->_fetchCompletedDayIndexes;
  -[NSMutableIndexSet removeIndexesInRange:](fetchCompletedDayIndexes, "removeIndexesInRange:", var0, var1);
  if (a3 != 1)
  {
    if (a3 != 2) {
      return;
    }
    p_fetchStartedDayIndexes = p_fetchCompletedDayIndexes;
  }
  int64_t v11 = *p_fetchStartedDayIndexes;
  -[NSMutableIndexSet addIndexesInRange:](v11, "addIndexesInRange:", var0, var1);
}

- (BOOL)_didFetchInitialAnalysis
{
  return self->_analysis != 0;
}

- (BOOL)_didFetchMinimumAnalysis
{
  v2 = self;
  unint64_t v3 = [(HKMCAnalysis *)self->_analysis latestSampleInfo];
  uint64_t v4 = [v3 anchor];
  LOBYTE(v2) = v4 >= [(NSNumber *)v2->_minimumAnalysisAnchor longLongValue];

  return (char)v2;
}

- (void)cycleFactorsDataSource:(id)a3 didFetchCycleFactors:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a4;
  _HKInitializeLogging();
  uint64_t v6 = (os_log_t *)MEMORY[0x263F09930];
  uint64_t v7 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = v7;
    uint64_t v9 = objc_opt_class();
    int64_t v10 = NSNumber;
    id v11 = v9;
    int64_t v12 = objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
    uint64_t v13 = HKSensitiveLogItem();
    *(_DWORD *)buf = 138543874;
    uint64_t v21 = v9;
    __int16 v22 = 2048;
    uint64_t v23 = self;
    __int16 v24 = 2112;
    unint64_t v25 = v13;
    _os_log_impl(&dword_2249E9000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Fetched %@ cycle factors", buf, 0x20u);
  }
  if ([(NSArray *)self->_cycleFactors isEqualToArray:v5])
  {
    if (HKShowSensitiveLogItems())
    {
      _HKInitializeLogging();
      os_log_t v14 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEBUG)) {
        -[HKMCViewModelProvider cycleFactorsDataSource:didFetchCycleFactors:](v14, (uint64_t)self);
      }
    }
  }
  else
  {
    uint64_t v15 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F09F88] ascending:1];
    uint64_t v19 = v15;
    uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v19 count:1];
    int64_t v17 = [v5 sortedArrayUsingDescriptors:v16];
    cycleFactors = self->_cycleFactors;
    self->_cycleFactors = v17;

    [(HKMCViewModelProvider *)self _queue_notifyObserversDidUpdate];
  }
}

- (void)cycleFactorsDataSource:(id)a3 didUpdatePregnancyModel:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v6 = (HKMCPregnancyModel *)a4;
  lastPregnancyModel = self->_lastPregnancyModel;
  int v8 = HKShowSensitiveLogItems();
  if (lastPregnancyModel == v6)
  {
    if (v8)
    {
      _HKInitializeLogging();
      int64_t v12 = (void *)*MEMORY[0x263F09930];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = v12;
        int v15 = 138543618;
        id v16 = (id)objc_opt_class();
        __int16 v17 = 2048;
        uint64_t v18 = self;
        id v14 = v16;
        _os_log_impl(&dword_2249E9000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Skipping update due to identical pregnancy model", (uint8_t *)&v15, 0x16u);
      }
    }
  }
  else
  {
    if (v8)
    {
      _HKInitializeLogging();
      uint64_t v9 = (void *)*MEMORY[0x263F09930];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
      {
        int64_t v10 = v9;
        int v15 = 138543618;
        id v16 = (id)objc_opt_class();
        __int16 v17 = 2048;
        uint64_t v18 = self;
        id v11 = v16;
        _os_log_impl(&dword_2249E9000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Updated pregnancy model", (uint8_t *)&v15, 0x16u);
      }
    }
    objc_storeStrong((id *)&self->_lastPregnancyModel, a4);
    [(HKMCViewModelProvider *)self _queue_notifyObserversDidUpdate];
  }
}

- (void)viewModelProviderDataSource:(id)a3 didFetchDaySummaries:(id)a4 forDayIndexRange:(id)a5 daySummaryAnchor:(id)a6
{
  int64_t var1 = a5.var1;
  int64_t var0 = a5.var0;
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v10 = a4;
  long long v35 = (NSNumber *)a6;
  _HKInitializeLogging();
  id v11 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    int64_t v12 = v11;
    uint64_t v13 = objc_opt_class();
    id v14 = NSNumber;
    id v15 = v13;
    id v16 = objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
    __int16 v17 = NSStringFromHKDayIndexRange();
    *(_DWORD *)buf = 138544130;
    uint64_t v47 = v13;
    __int16 v48 = 2048;
    long long v49 = self;
    __int16 v50 = 2112;
    long long v51 = v16;
    __int16 v52 = 2114;
    v53 = v17;
    _os_log_impl(&dword_2249E9000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Fetched %@ summaries in range: %{public}@", buf, 0x2Au);
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v18 = [(NSMutableDictionary *)self->_daySummariesByDayIndex allKeys];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v41 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        uint64_t v24 = [v23 integerValue];
        if (v24 >= var0 && v24 - var0 < var1) {
          [(NSMutableDictionary *)self->_daySummariesByDayIndex setObject:0 forKeyedSubscript:v23];
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v20);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v26 = v10;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v37;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v37 != v29) {
          objc_enumerationMutation(v26);
        }
        int64_t v31 = *(void **)(*((void *)&v36 + 1) + 8 * j);
        daySummariesByDayIndex = self->_daySummariesByDayIndex;
        long long v33 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v31, "dayIndex"));
        [(NSMutableDictionary *)daySummariesByDayIndex setObject:v31 forKeyedSubscript:v33];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v36 objects:v44 count:16];
    }
    while (v28);
  }

  -[HKMCViewModelProvider _setFetchState:forDayIndexRange:](self, "_setFetchState:forDayIndexRange:", 2, var0, var1);
  minimumAnalysisAnchor = self->_minimumAnalysisAnchor;
  self->_minimumAnalysisAnchor = v35;

  [(HKMCViewModelProvider *)self _queue_notifyObserversDidUpdate];
}

- (void)viewModelProviderDataSourceDidUpdateDaySummaries:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  uint64_t v4 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    *(_DWORD *)uint64_t v7 = 138543618;
    *(void *)&v7[4] = objc_opt_class();
    *(_WORD *)&v7[12] = 2048;
    *(void *)&v7[14] = self;
    id v6 = *(id *)&v7[4];
    _os_log_impl(&dword_2249E9000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Updated summaries", v7, 0x16u);
  }
  -[HKMCViewModelProviderDataSource fetchDaySummariesInDayIndexRange:](self->_dataSource, "fetchDaySummariesInDayIndexRange:", self->_managedDayRange.start, self->_managedDayRange.duration, *(_OWORD *)v7, *(void *)&v7[16], v8);
}

- (void)analysisProvider:(id)a3 didUpdateAnalysis:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = (HKMCAnalysis *)a4;
  _HKInitializeLogging();
  id v6 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v6;
    int v10 = 138543618;
    id v11 = (id)objc_opt_class();
    __int16 v12 = 2048;
    uint64_t v13 = self;
    id v8 = v11;
    _os_log_impl(&dword_2249E9000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Updated analysis", (uint8_t *)&v10, 0x16u);
  }
  analysis = self->_analysis;
  self->_analysis = v5;

  [(HKMCViewModelProvider *)self _queue_notifyObserversDidUpdate];
}

- (void)registerObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)_queue_notifyObserversDidUpdate
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if ([(HKMCViewModelProvider *)self _didFetchInitialAnalysis]
    && ![(HKMCViewModelProvider *)self _didFetchMinimumAnalysis])
  {
    _HKInitializeLogging();
    uint64_t v4 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
    {
      id v5 = v4;
      id v6 = objc_opt_class();
      analysis = self->_analysis;
      id v8 = v6;
      uint64_t v9 = [(HKMCAnalysis *)analysis latestSampleInfo];
      int v10 = HKSensitiveLogItem();
      minimumAnalysisAnchor = self->_minimumAnalysisAnchor;
      int v12 = 138544130;
      uint64_t v13 = v6;
      __int16 v14 = 2048;
      id v15 = self;
      __int16 v16 = 2114;
      __int16 v17 = v10;
      __int16 v18 = 2114;
      uint64_t v19 = minimumAnalysisAnchor;
      _os_log_impl(&dword_2249E9000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Delaying notifying observers of updates due to outdated analysis: %{public}@ < %{public}@", (uint8_t *)&v12, 0x2Au);
    }
    [(_HKDelayedOperation *)self->_notifyObserversOperation execute];
  }
  else
  {
    notifyObserversOperation = self->_notifyObserversOperation;
    [(_HKDelayedOperation *)notifyObserversOperation executeWithDelay:0.0];
  }
}

- (void)_queue_runNotifyObserversOperationNow
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  unint64_t v3 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = v3;
    id v5 = objc_opt_class();
    id v6 = NSNumber;
    observers = self->_observers;
    id v8 = v5;
    uint64_t v9 = objc_msgSend(v6, "numberWithUnsignedInteger:", -[NSHashTable count](observers, "count"));
    *(_DWORD *)buf = 138543874;
    uint64_t v21 = v5;
    __int16 v22 = 2048;
    uint64_t v23 = self;
    __int16 v24 = 2114;
    unint64_t v25 = v9;
    _os_log_impl(&dword_2249E9000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Notifying %{public}@ observers of updates", buf, 0x20u);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int v10 = self->_observers;
  uint64_t v11 = [(NSHashTable *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v14++), "viewModelProviderDidUpdate:", self, (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [(NSHashTable *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  unint64_t v3 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = v3;
    *(_DWORD *)buf = 138543618;
    id v8 = (id)objc_opt_class();
    __int16 v9 = 2048;
    int v10 = self;
    id v5 = v8;
    _os_log_impl(&dword_2249E9000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Dealloc", buf, 0x16u);
  }
  v6.receiver = self;
  v6.super_class = (Class)HKMCViewModelProvider;
  [(HKMCViewModelProvider *)&v6 dealloc];
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)_test_managedDayRange
{
  int64_t duration = self->_managedDayRange.duration;
  int64_t start = self->_managedDayRange.start;
  result.int64_t var1 = duration;
  result.int64_t var0 = start;
  return result;
}

- (BOOL)_ppt_didFetchAnalysis
{
  return self->_analysis != 0;
}

- (BOOL)_ppt_didFetchDaySummaries
{
  return [(NSMutableIndexSet *)self->_fetchCompletedDayIndexes count] != 0;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)activeDayRange
{
  int64_t duration = self->_activeDayRange.duration;
  int64_t start = self->_activeDayRange.start;
  result.int64_t var1 = duration;
  result.int64_t var0 = start;
  return result;
}

- (int64_t)minimumBufferDuration
{
  return self->_minimumBufferDuration;
}

- (int64_t)maximumActiveDuration
{
  return self->_maximumActiveDuration;
}

- (void)setMaximumActiveDuration:(int64_t)a3
{
  self->_maximumActiveDuration = a3;
}

- (HKCalendarCache)calendarCache
{
  return self->_calendarCache;
}

- (int64_t)todayDayIndex
{
  return self->_todayDayIndex;
}

- (void)setTodayDayIndex:(int64_t)a3
{
  self->_todayDayIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarCache, 0);
  objc_storeStrong((id *)&self->_notifyObserversOperation, 0);
  objc_storeStrong((id *)&self->_lastPregnancyModel, 0);
  objc_storeStrong((id *)&self->_analysis, 0);
  objc_storeStrong((id *)&self->_minimumAnalysisAnchor, 0);
  objc_storeStrong((id *)&self->_cycleFactors, 0);
  objc_storeStrong((id *)&self->_daySummariesByDayIndex, 0);
  objc_storeStrong((id *)&self->_fetchCompletedDayIndexes, 0);
  objc_storeStrong((id *)&self->_fetchStartedDayIndexes, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_analysisProvider, 0);
  objc_storeStrong((id *)&self->_cycleFactorsDataSource, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

- (void)_copyWithDataSource:(void *)a1 cycleFactorsDataSource:(uint64_t)a2 minimumBufferDuration:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a1;
  int v7 = 138543874;
  id v8 = (id)objc_opt_class();
  __int16 v9 = 2050;
  uint64_t v10 = a2;
  __int16 v11 = 2050;
  uint64_t v12 = a3;
  id v6 = v8;
  _os_log_debug_impl(&dword_2249E9000, v5, OS_LOG_TYPE_DEBUG, "[%{public}@] Copying %{public}p to %{public}p", (uint8_t *)&v7, 0x20u);
}

- (void)setActiveDayRange:(void *)a1 .cold.1(void *a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  unint64_t v3 = a1;
  uint64_t v4 = objc_opt_class();
  id v5 = v4;
  id v6 = NSStringFromHKDayIndexRange();
  int v7 = 138543874;
  id v8 = v4;
  __int16 v9 = 2048;
  uint64_t v10 = a2;
  __int16 v11 = 2114;
  uint64_t v12 = v6;
  _os_log_debug_impl(&dword_2249E9000, v3, OS_LOG_TYPE_DEBUG, "[%{public}@:%p] Updated active day range: %{public}@", (uint8_t *)&v7, 0x20u);
}

- (void)cycleFactorsDataSource:(void *)a1 didFetchCycleFactors:(uint64_t)a2 .cold.1(void *a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  unint64_t v3 = a1;
  int v5 = 138543618;
  id v6 = (id)objc_opt_class();
  __int16 v7 = 2048;
  uint64_t v8 = a2;
  id v4 = v6;
  _os_log_debug_impl(&dword_2249E9000, v3, OS_LOG_TYPE_DEBUG, "[%{public}@:%p] No factors changed, skipping notifying observers", (uint8_t *)&v5, 0x16u);
}

@end