@interface ACHActivityAwardingSource
- (ACHAchievementProgressEngine)progressEngine;
- (ACHActivityAwardingDataProvider)dataProvider;
- (ACHActivityAwardingDataProvider)progressDataProvider;
- (ACHActivityAwardingEnvironment)environment;
- (ACHActivityAwardingEnvironment)progressEnvironment;
- (ACHActivityAwardingSource)initWithHealthStore:(id)a3 dataStore:(id)a4 templateStore:(id)a5 pauseRingsCoordinator:(id)a6 awardingEngine:(id)a7 progressEngine:(id)a8;
- (ACHActivityAwardingSource)initWithProfile:(id)a3 dataStore:(id)a4 templateStore:(id)a5 awardingEngine:(id)a6 progressEngine:(id)a7;
- (ACHActivitySummaryIterator)activitySummaryIterator;
- (ACHActivitySummaryUtility)activitySummaryUtility;
- (ACHActivityTriggerGenerator)triggerGenerator;
- (ACHCurrentActivitySummaryQuery)currentActivitySummaryQuery;
- (ACHDataStore)dataStore;
- (ACHDataStoreActivityProperties)latestDataStoreProperties;
- (ACHEarnedInstanceAwardingEngine)engine;
- (ACHTemplateStore)templateStore;
- (BOOL)_hasMetGoalForTemplate:(id)a3 andActivitySummary:(id)a4;
- (BOOL)_isAchievementStillEarnableForTemplate:(id)a3 andProgressEnvironment:(id)a4;
- (BOOL)isAppleWatch;
- (BOOL)isObservingSummaryUpdates;
- (BOOL)providesProgressForTemplate:(id)a3;
- (FIPauseRingsCoordinator)pauseRingsCoordinator;
- (HDProfile)profile;
- (HKActivitySummary)todayActivitySummary;
- (HKActivitySummary)yesterdayActivitySummary;
- (HKHealthStore)healthStore;
- (NSArray)dataStorePropertyKeys;
- (NSCalendar)gregorianUTCCalendar;
- (NSDictionary)dataStoreProperties;
- (NSNumber)overrideIsAppleWatch;
- (NSString)overrideWatchCountryCode;
- (NSString)uniqueName;
- (NSString)watchCountryCode;
- (OS_dispatch_queue)internalQueue;
- (id)_progressUpdateForTemplate:(id)a3 environment:(id)a4;
- (id)_queue_evaluateTriggers:(unint64_t)a3 activitySummary:(id)a4 templates:(id)a5 shouldLog:(BOOL)a6;
- (id)_queue_goalQuantityForTemplate:(id)a3 environment:(id)a4;
- (id)_queue_progressQuantityForTemplate:(id)a3 environment:(id)a4;
- (id)currentDate;
- (id)earnedInstancesForHistoricalInterval:(id)a3 databaseContext:(id)a4;
- (id)earnedInstancesForHistoricalInterval:(id)a3 error:(id *)a4;
- (unint64_t)_queue_triggersWithChangedSummaryFields:(unint64_t)a3 dataProvider:(id)a4;
- (unsigned)_creatorDevice;
- (void)_queue_observeSummaries;
- (void)_queue_startCurrentSummaryQuery;
- (void)_queue_updateDataProvider:(id)a3 forDateInterval:(id)a4 awardingBlock:(id)a5;
- (void)_queue_updateDataProvider:(id)a3 forDateInterval:(id)a4 awardingBlock:(id)a5 error:(id *)a6;
- (void)_queue_updateProgressDataProviderIfNeeded;
- (void)_runIncrementallyForChangedSummaryFields:(unint64_t)a3;
- (void)currentActivitySummaryHelper:(id)a3 didUpdateTodayActivitySummary:(id)a4 changedFields:(unint64_t)a5;
- (void)currentActivitySummaryHelper:(id)a3 didUpdateYesterdayActivitySummary:(id)a4 changedFields:(unint64_t)a5;
- (void)dataStoreDidClearAllProperties:(id)a3 completion:(id)a4;
- (void)requestAchievementProgressUpdatesForTemplates:(id)a3;
- (void)setActivitySummaryIterator:(id)a3;
- (void)setActivitySummaryUtility:(id)a3;
- (void)setCurrentActivitySummaryQuery:(id)a3;
- (void)setCurrentDateOverride:(id)a3;
- (void)setDataProvider:(id)a3;
- (void)setDataStore:(id)a3;
- (void)setDataStoreProperties:(id)a3;
- (void)setEngine:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setGregorianUTCCalendar:(id)a3;
- (void)setHealthStore:(id)a3;
- (void)setInternalQueue:(id)a3;
- (void)setIsObservingSummaryUpdates:(BOOL)a3;
- (void)setLatestDataStoreProperties:(id)a3;
- (void)setOverrideIsAppleWatch:(id)a3;
- (void)setOverrideWatchCountryCode:(id)a3;
- (void)setPauseRingsCoordinator:(id)a3;
- (void)setProfile:(id)a3;
- (void)setProgressDataProvider:(id)a3;
- (void)setProgressEngine:(id)a3;
- (void)setProgressEnvironment:(id)a3;
- (void)setTemplateStore:(id)a3;
- (void)setTodayActivitySummary:(id)a3;
- (void)setTriggerGenerator:(id)a3;
- (void)setWatchCountryCode:(id)a3;
- (void)setYesterdayActivitySummary:(id)a3;
- (void)startUp;
@end

@implementation ACHActivityAwardingSource

void __75__ACHActivityAwardingSource_requestAchievementProgressUpdatesForTemplates___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 200);
  v3 = ACHLogAwardEngine();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F5DA000, v3, OS_LOG_TYPE_DEFAULT, "[ACHActivityAwardingSource] received request for progress update.", buf, 2u);
    }

    v3 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v5 = *(id *)(*(void *)(a1 + 32) + 120);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = *(id *)(a1 + 40);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = objc_msgSend(*(id *)(a1 + 32), "_progressUpdateForTemplate:environment:", *(void *)(*((void *)&v14 + 1) + 8 * v10), v5, (void)v14);
          if (v11) {
            [v3 addObject:v11];
          }

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v8);
    }

    v12 = [*(id *)(a1 + 32) progressEngine];
    id v13 = [v3 copy];
    [v12 processAchievementProgressUpdates:v13];
  }
  else if (v4)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F5DA000, v3, OS_LOG_TYPE_DEFAULT, "[ACHActivityAwardingSource] received request for progress update but progressDataProvider isn't ready, skipping...", buf, 2u);
  }
}

- (id)_queue_goalQuantityForTemplate:(id)a3 environment:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 graceGoalExpression];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [v5 goalExpression];
  }
  uint64_t v10 = v9;

  v11 = [MEMORY[0x263F087F0] expressionWithFormat:v10];
  v12 = [v11 expressionValueWithObject:v6 context:0];

  id v13 = [v5 canonicalUnit];
  long long v14 = ACHHKQuantityWithValueAndUnit();

  return v14;
}

- (BOOL)_isAchievementStillEarnableForTemplate:(id)a3 andProgressEnvironment:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263F236C0]);
  id v9 = [v8 validateTemplate:v6];
  if ([v9 isValid])
  {
    if (v7)
    {
      uint64_t v10 = [v6 uniqueName];
      v11 = [(ACHActivityAwardingSource *)self progressDataProvider];
      v29 = [v11 todayActivitySummary];

      v12 = [v6 graceProgressExpression];
      id v13 = v12;
      if (v12)
      {
        id v14 = v12;
      }
      else
      {
        id v14 = [v6 progressExpression];
      }
      id v16 = v14;

      v27 = v16;
      v26 = [MEMORY[0x263F087F0] expressionWithFormat:v16];
      long long v17 = [v26 expressionValueWithObject:v7 context:0];
      v18 = [(ACHActivityAwardingSource *)self currentDate];
      int v19 = [v17 intValue];
      int v20 = -v19;
      v28 = v10;
      if (([v10 isEqualToString:@"PerfectWeekMove"] & 1) != 0
        || ([v10 isEqualToString:@"PerfectWeekExercise"] & 1) != 0
        || ([v10 isEqualToString:@"PerfectWeekStand"] & 1) != 0
        || [v10 isEqualToString:@"PerfectWeekAll"])
      {
        if ([(ACHActivityAwardingSource *)self _hasMetGoalForTemplate:v6 andActivitySummary:v29])
        {
          int v20 = 1 - v19;
        }
        uint64_t v21 = ACHStartOfFitnessWeekBeforeDateInCalendar();
      }
      else
      {
        int v25 = [v10 hasPrefix:@"PerfectMonth_"];
        BOOL v15 = 1;
        if (!v25) {
          goto LABEL_16;
        }
        if ([(ACHActivityAwardingSource *)self _hasMetGoalForTemplate:v6 andActivitySummary:v29])
        {
          int v20 = 1 - v19;
        }
        uint64_t v21 = [(NSCalendar *)self->_gregorianUTCCalendar hk_startOfMonthForDate:v18];
      }
      v22 = (void *)v21;
      v23 = [(NSCalendar *)self->_gregorianUTCCalendar dateByAddingUnit:16 value:v20 toDate:v18 options:0];
      BOOL v15 = [(NSCalendar *)self->_gregorianUTCCalendar isDate:v22 inSameDayAsDate:v23];

LABEL_16:
      goto LABEL_17;
    }
    BOOL v15 = 1;
  }
  else
  {
    BOOL v15 = 0;
  }
LABEL_17:

  return v15;
}

- (id)_progressUpdateForTemplate:(id)a3 environment:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263F236C0]);
  id v9 = [v8 validateTemplate:v6];
  if ([v9 isValid])
  {
    uint64_t v10 = [(ACHActivityAwardingSource *)self _queue_goalQuantityForTemplate:v6 environment:v7];
    v11 = [(ACHActivityAwardingSource *)self _queue_progressQuantityForTemplate:v6 environment:v7];
    if (![(ACHActivityAwardingSource *)self _isAchievementStillEarnableForTemplate:v6 andProgressEnvironment:v7])
    {
      v12 = ACHLogAwardEngine();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = [v6 uniqueName];
        int v22 = 138412802;
        v23 = v13;
        __int16 v24 = 2112;
        int v25 = v11;
        __int16 v26 = 2112;
        v27 = v10;
        _os_log_impl(&dword_21F5DA000, v12, OS_LOG_TYPE_DEFAULT, "[ACHActivityAwardingSource] cannot earn %@ anymore, setting progress and goal to 0 (was: %@/%@)", (uint8_t *)&v22, 0x20u);
      }
      id v14 = [v6 canonicalUnit];
      uint64_t v15 = ACHHKQuantityWithValueAndUnit();

      id v16 = [v6 canonicalUnit];
      uint64_t v17 = ACHHKQuantityWithValueAndUnit();

      uint64_t v10 = (void *)v15;
      v11 = (void *)v17;
    }
    id v18 = objc_alloc(MEMORY[0x263F23640]);
    int v19 = [v6 uniqueName];
    int v20 = (void *)[v18 initWithTemplateUniqueName:v19 progressQuantity:v11 goalQuantity:v10];
  }
  else
  {
    int v20 = 0;
  }

  return v20;
}

- (ACHActivityAwardingDataProvider)progressDataProvider
{
  return self->_progressDataProvider;
}

- (id)_queue_progressQuantityForTemplate:(id)a3 environment:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
  id v9 = [(ACHActivityAwardingSource *)self currentDate];
  char IsAvailableForCalendarAndDate = ACHTemplateIsAvailableForCalendarAndDate(v6, v8, v9);

  if (IsAvailableForCalendarAndDate)
  {
    v11 = [v6 graceProgressExpression];
    v12 = v11;
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      id v13 = [v6 progressExpression];
    }
    id v14 = v13;

    id v16 = [MEMORY[0x263F087F0] expressionWithFormat:v14];
    uint64_t v17 = [v16 expressionValueWithObject:v7 context:0];
    id v18 = [v6 canonicalUnit];
    uint64_t v15 = ACHHKQuantityWithValueAndUnit();
  }
  else
  {
    id v14 = [v6 canonicalUnit];
    uint64_t v15 = ACHHKQuantityWithValueAndUnit();
  }

  return v15;
}

- (id)currentDate
{
  currentDateOverride = self->_currentDateOverride;
  if (currentDateOverride)
  {
    v3 = currentDateOverride;
  }
  else
  {
    v3 = [MEMORY[0x263EFF910] date];
  }
  return v3;
}

- (BOOL)_hasMetGoalForTemplate:(id)a3 andActivitySummary:(id)a4
{
  id v5 = a3;
  if (a4)
  {
    id v6 = a4;
    [v6 _activeEnergyCompletionPercentage];
    double v8 = v7;
    [v6 _moveMinutesCompletionPercentage];
    double v10 = v9;
    [v6 _exerciseTimeCompletionPercentage];
    double v12 = v11;
    [v6 _standHoursCompletionPercentage];
    double v14 = v13;

    uint64_t v15 = [v5 graceProgressExpression];
    id v16 = v15;
    if (v15)
    {
      id v17 = v15;
    }
    else
    {
      id v17 = [v5 progressExpression];
    }
    int v19 = v17;

    uint64_t v20 = [&unk_26D116460 indexOfObject:v19];
    double v21 = v8 + v10;
    switch(v20)
    {
      case 0:
      case 1:
        BOOL v22 = v21 < 1.0;
        goto LABEL_11;
      case 2:
        BOOL v22 = v12 < 1.0;
        goto LABEL_11;
      case 3:
        BOOL v22 = v14 < 1.0;
LABEL_11:
        BOOL v18 = !v22;
        break;
      case 4:
        BOOL v23 = v21 >= 1.0;
        if (v12 < 1.0) {
          BOOL v23 = 0;
        }
        BOOL v18 = v14 >= 1.0 && v23;
        break;
      default:
        BOOL v18 = 1;
        break;
    }
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (void)requestAchievementProgressUpdatesForTemplates:(id)a3
{
  id v4 = a3;
  id v5 = [(ACHActivityAwardingSource *)self internalQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __75__ACHActivityAwardingSource_requestAchievementProgressUpdatesForTemplates___block_invoke;
  v7[3] = &unk_264515DE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (ACHAchievementProgressEngine)progressEngine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_progressEngine);
  return (ACHAchievementProgressEngine *)WeakRetained;
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (BOOL)providesProgressForTemplate:(id)a3
{
  id v3 = a3;
  unint64_t v4 = +[ACHActivityTriggerGenerator allPossibleTriggers];
  uint64_t v5 = [v3 triggers];

  return (v5 & v4) != 0;
}

- (ACHActivityAwardingSource)initWithHealthStore:(id)a3 dataStore:(id)a4 templateStore:(id)a5 pauseRingsCoordinator:(id)a6 awardingEngine:(id)a7 progressEngine:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  v41.receiver = self;
  v41.super_class = (Class)ACHActivityAwardingSource;
  double v21 = [(ACHActivityAwardingSource *)&v41 init];
  BOOL v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_healthStore, a3);
    objc_storeWeak((id *)&v22->_dataStore, v16);
    objc_storeWeak((id *)&v22->_templateStore, v17);
    objc_storeStrong((id *)&v22->_pauseRingsCoordinator, a6);
    objc_storeWeak((id *)&v22->_engine, v19);
    objc_storeWeak((id *)&v22->_progressEngine, v20);
    BOOL v23 = objc_alloc_init(ACHActivityAwardingDataProvider);
    dataProvider = v22->_dataProvider;
    v22->_dataProvider = v23;

    int v25 = objc_alloc_init(ACHActivityAwardingDataProvider);
    progressDataProvider = v22->_progressDataProvider;
    v22->_progressDataProvider = v25;

    v27 = [[ACHActivityTriggerGenerator alloc] initWithPauseRingsCoordinator:v18];
    triggerGenerator = v22->_triggerGenerator;
    v22->_triggerGenerator = v27;

    v29 = [[ACHActivityAwardingEnvironment alloc] initWithDataProvider:v22->_dataProvider];
    environment = v22->_environment;
    v22->_environment = v29;

    v31 = [[ACHActivityAwardingEnvironment alloc] initWithDataProvider:v22->_progressDataProvider];
    progressEnvironment = v22->_progressEnvironment;
    v22->_progressEnvironment = v31;

    uint64_t v33 = HKCreateSerialDispatchQueue();
    internalQueue = v22->_internalQueue;
    v22->_internalQueue = (OS_dispatch_queue *)v33;

    uint64_t v35 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendarWithUTCTimeZone");
    gregorianUTCCalendar = v22->_gregorianUTCCalendar;
    v22->_gregorianUTCCalendar = (NSCalendar *)v35;

    v37 = [[ACHActivitySummaryIterator alloc] initWithHealthStore:v15 shouldIncludePrivateProperties:1];
    activitySummaryIterator = v22->_activitySummaryIterator;
    v22->_activitySummaryIterator = v37;

    id WeakRetained = objc_loadWeakRetained((id *)&v22->_dataStore);
    [WeakRetained addPropertyProvider:v22];

    [(ACHActivityAwardingSource *)v22 startUp];
  }

  return v22;
}

- (ACHActivityAwardingSource)initWithProfile:(id)a3 dataStore:(id)a4 templateStore:(id)a5 awardingEngine:(id)a6 progressEngine:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v41.receiver = self;
  v41.super_class = (Class)ACHActivityAwardingSource;
  id v17 = [(ACHActivityAwardingSource *)&v41 init];
  id v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_profile, v12);
    objc_storeWeak((id *)&v18->_dataStore, v13);
    objc_storeWeak((id *)&v18->_templateStore, v14);
    objc_storeWeak((id *)&v18->_engine, v15);
    objc_storeWeak((id *)&v18->_progressEngine, v16);
    id v19 = objc_alloc_init(ACHActivityAwardingDataProvider);
    dataProvider = v18->_dataProvider;
    v18->_dataProvider = v19;

    double v21 = objc_alloc_init(ACHActivityAwardingDataProvider);
    progressDataProvider = v18->_progressDataProvider;
    v18->_progressDataProvider = v21;

    BOOL v23 = [[ACHActivityTriggerGenerator alloc] initWithPauseRingsCoordinator:0];
    triggerGenerator = v18->_triggerGenerator;
    v18->_triggerGenerator = v23;

    int v25 = [[ACHActivityAwardingEnvironment alloc] initWithDataProvider:v18->_dataProvider];
    environment = v18->_environment;
    v18->_environment = v25;

    v27 = [[ACHActivityAwardingEnvironment alloc] initWithDataProvider:v18->_progressDataProvider];
    progressEnvironment = v18->_progressEnvironment;
    v18->_progressEnvironment = v27;

    uint64_t v29 = HKCreateSerialDispatchQueue();
    internalQueue = v18->_internalQueue;
    v18->_internalQueue = (OS_dispatch_queue *)v29;

    uint64_t v31 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendarWithUTCTimeZone");
    gregorianUTCCalendar = v18->_gregorianUTCCalendar;
    v18->_gregorianUTCCalendar = (NSCalendar *)v31;

    uint64_t v33 = [ACHActivitySummaryUtility alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&v18->_profile);
    uint64_t v35 = [(ACHActivitySummaryUtility *)v33 initWithProfile:WeakRetained shouldIncludePrivateProperties:1];
    activitySummaryUtility = v18->_activitySummaryUtility;
    v18->_activitySummaryUtility = (ACHActivitySummaryUtility *)v35;

    id v37 = objc_loadWeakRetained((id *)&v18->_dataStore);
    [v37 addPropertyProvider:v18];

    id v38 = objc_loadWeakRetained((id *)&v18->_profile);
    v39 = [v38 daemon];
    [v39 registerForDaemonReady:v18];
  }
  return v18;
}

- (void)startUp
{
  if (![(ACHActivityAwardingSource *)self isAppleWatch])
  {
    id v3 = [(ACHActivityAwardingSource *)self internalQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __36__ACHActivityAwardingSource_startUp__block_invoke;
    block[3] = &unk_264515DB8;
    block[4] = self;
    dispatch_async(v3, block);
  }
}

uint64_t __36__ACHActivityAwardingSource_startUp__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) healthStore];

  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    return objc_msgSend(v3, "_queue_startCurrentSummaryQuery");
  }
  else
  {
    return objc_msgSend(v3, "_queue_observeSummaries");
  }
}

- (BOOL)isAppleWatch
{
  id v3 = [(ACHActivityAwardingSource *)self overrideIsAppleWatch];

  if (v3)
  {
    unint64_t v4 = [(ACHActivityAwardingSource *)self overrideIsAppleWatch];
    char v5 = [v4 BOOLValue];
  }
  else
  {
    double v7 = [(ACHActivityAwardingSource *)self profile];

    if (v7)
    {
      unint64_t v4 = [(ACHActivityAwardingSource *)self profile];
      id v8 = [v4 daemon];
      double v9 = [v8 behavior];
      char v6 = [v9 isAppleWatch];

      goto LABEL_6;
    }
    unint64_t v4 = [MEMORY[0x263F0A980] sharedBehavior];
    char v5 = [v4 isAppleWatch];
  }
  char v6 = v5;
LABEL_6:

  return v6;
}

- (NSString)watchCountryCode
{
  id v3 = [(ACHActivityAwardingSource *)self overrideWatchCountryCode];

  if (v3) {
    [(ACHActivityAwardingSource *)self overrideWatchCountryCode];
  }
  else {
  unint64_t v4 = ACHPairedWatchCountryCode();
  }
  return (NSString *)v4;
}

- (void)setCurrentDateOverride:(id)a3
{
}

- (unsigned)_creatorDevice
{
  if ([(ACHActivityAwardingSource *)self isAppleWatch]) {
    return 1;
  }
  else {
    return 2;
  }
}

- (void)_queue_startCurrentSummaryQuery
{
  id v3 = [(ACHActivityAwardingSource *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  unint64_t v4 = [(ACHActivityAwardingSource *)self currentActivitySummaryQuery];

  if (!v4)
  {
    objc_initWeak(&location, self);
    id v5 = objc_alloc(MEMORY[0x263F236A8]);
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 3221225472;
    double v11 = __60__ACHActivityAwardingSource__queue_startCurrentSummaryQuery__block_invoke;
    id v12 = &unk_264515EE8;
    objc_copyWeak(&v13, &location);
    char v6 = (void *)[v5 initWithUpdateHandler:&v9];
    -[ACHActivityAwardingSource setCurrentActivitySummaryQuery:](self, "setCurrentActivitySummaryQuery:", v6, v9, v10, v11, v12);

    [(ACHActivityAwardingSource *)self setIsObservingSummaryUpdates:1];
    double v7 = [(ACHActivityAwardingSource *)self healthStore];
    id v8 = [(ACHActivityAwardingSource *)self currentActivitySummaryQuery];
    [v7 executeQuery:v8];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __60__ACHActivityAwardingSource__queue_startCurrentSummaryQuery__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5, uint64_t a6, void *a7)
{
  id v18 = a2;
  id v13 = a3;
  id v14 = a5;
  id v15 = a7;
  if (v13 && a4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained currentActivitySummaryHelper:0 didUpdateTodayActivitySummary:v13 changedFields:a4];
  }
  if (v14 && a6)
  {
    id v17 = objc_loadWeakRetained((id *)(a1 + 32));
    [v17 currentActivitySummaryHelper:0 didUpdateYesterdayActivitySummary:v14 changedFields:a6];
  }
}

- (NSString)uniqueName
{
  return (NSString *)@"ActivityAwardingSource";
}

- (void)_queue_updateDataProvider:(id)a3 forDateInterval:(id)a4 awardingBlock:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [(ACHActivityAwardingSource *)self internalQueue];
  dispatch_assert_queue_V2(v12);

  id v13 = [(ACHActivityAwardingSource *)self gregorianUTCCalendar];
  id v14 = [v10 startDate];
  id v15 = objc_msgSend(v13, "hk_activitySummaryDateComponentsFromDate:", v14);

  id v16 = [(ACHActivityAwardingSource *)self gregorianUTCCalendar];
  id v17 = [v10 endDate];
  id v18 = objc_msgSend(v16, "hk_activitySummaryDateComponentsFromDate:", v17);

  id v19 = (void *)[objc_alloc(MEMORY[0x263F236B0]) initWithStartDateComponents:v15 endDateComponents:v18];
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = __Block_byref_object_copy__29;
  v42[4] = __Block_byref_object_dispose__29;
  id v43 = 0;
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__29;
  v40 = __Block_byref_object_dispose__29;
  id v41 = 0;
  id v20 = [(ACHActivityAwardingSource *)self activitySummaryIterator];
  id v21 = [(ACHActivityAwardingSource *)self progressDataProvider];
  BOOL v22 = v21 == v9;
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __91__ACHActivityAwardingSource__queue_updateDataProvider_forDateInterval_awardingBlock_error___block_invoke;
  v30[3] = &unk_2645182F0;
  id v23 = v9;
  id v31 = v23;
  v32 = self;
  v34 = v42;
  uint64_t v35 = 16398;
  id v24 = v11;
  id v33 = v24;
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __91__ACHActivityAwardingSource__queue_updateDataProvider_forDateInterval_awardingBlock_error___block_invoke_298;
  v29[3] = &unk_2645167A8;
  v29[4] = &v36;
  [v20 enumerateActivitySummariesForDateComponentInterval:v19 includeNilSummaries:v22 handler:v30 errorHandler:v29];

  id v25 = [(ACHActivityAwardingSource *)self dataProvider];

  if (v25 == v23) {
    [(ACHActivityAwardingSource *)self _queue_updateProgressDataProviderIfNeeded];
  }
  id v26 = (id)v37[5];
  v27 = v26;
  if (v26)
  {
    if (a6) {
      *a6 = v26;
    }
    else {
      _HKLogDroppedError();
    }
  }

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(v42, 8);
}

void __91__ACHActivityAwardingSource__queue_updateDataProvider_forDateInterval_awardingBlock_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = [*(id *)(a1 + 32) properties];
  uint64_t v9 = [v8 storeValuesValidBeforeSummaryIndex];
  uint64_t v10 = [v6 _activitySummaryIndex];

  id v12 = *(void **)(a1 + 32);
  id v11 = *(void **)(a1 + 40);
  if (v6)
  {
    if (v12 == (void *)v11[14] && v9 >= v10) {
      goto LABEL_24;
    }
  }
  uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
  id v15 = *(id *)(v14 + 40);
  if (v6 && !v15)
  {
    id v16 = [v11 dataProvider];

    id v17 = (id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    if (v12 == v16 && v9 >= v10)
    {
      objc_storeStrong(v17, a2);
      id v18 = ACHLogAwardEngine();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v35 = 0;
        _os_log_impl(&dword_21F5DA000, v18, OS_LOG_TYPE_DEFAULT, "[ACHActivityAwardingSource] Yesterday's summary has already been processed for the data provider, ignoring.", v35, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "setLastCheckedIndex:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "_activitySummaryIndex"));
      goto LABEL_24;
    }
    id v15 = *v17;
    id v12 = *(void **)(a1 + 32);
    goto LABEL_18;
  }
  if (v6)
  {
LABEL_18:
    [v12 setYesterdayActivitySummary:v15];
    id v21 = [*(id *)(a1 + 40) activitySummaryIterator];
    BOOL v22 = (void *)[v21 newEmptyActivitySummaryFromSummary:v6];
    [*(id *)(a1 + 32) setTodayActivitySummary:v22];

    uint64_t v23 = objc_msgSend(*(id *)(a1 + 40), "_queue_triggersWithChangedSummaryFields:dataProvider:", *(void *)(a1 + 64), *(void *)(a1 + 32));
    uint64_t v24 = *(void *)(a1 + 48);
    if (v24) {
      (*(void (**)(uint64_t, uint64_t, void))(v24 + 16))(v24, v23, *(void *)(a1 + 32));
    }
    [*(id *)(a1 + 32) updatePreviousPropertiesWithCurrentProperties];
    [*(id *)(a1 + 32) setTodayActivitySummary:v6];
    uint64_t v25 = objc_msgSend(*(id *)(a1 + 40), "_queue_triggersWithChangedSummaryFields:dataProvider:", *(void *)(a1 + 64), *(void *)(a1 + 32));
    uint64_t v26 = *(void *)(a1 + 48);
    if (v26) {
      (*(void (**)(uint64_t, uint64_t, void))(v26 + 16))(v26, v25, *(void *)(a1 + 32));
    }
    uint64_t v27 = [v6 _activitySummaryIndex];
    uint64_t v28 = [*(id *)(a1 + 32) properties];
    [v28 setStoreValuesValidBeforeSummaryIndex:v27];

    [*(id *)(a1 + 32) updatePreviousPropertiesWithCurrentProperties];
    uint64_t v29 = (id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    v30 = a2;
    goto LABEL_23;
  }
  if (v15)
  {
    id v19 = v15;
    id v20 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v19;
  }
  else
  {
    uint64_t v31 = [*(id *)(a1 + 32) yesterdayActivitySummary];
    uint64_t v32 = *(void *)(*(void *)(a1 + 56) + 8);
    id v20 = *(void **)(v32 + 40);
    *(void *)(v32 + 40) = v31;
  }

  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "setYesterdayActivitySummary:");
    id v33 = [*(id *)(a1 + 40) activitySummaryIterator];
    id v6 = (id)[v33 newEmptyActivitySummaryFromSummary:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];

    [v6 _setActivitySummaryIndex:_HKCacheIndexFromDateComponents()];
    [*(id *)(a1 + 32) setTodayActivitySummary:v6];
    objc_msgSend(*(id *)(a1 + 40), "_queue_triggersWithChangedSummaryFields:dataProvider:", *(void *)(a1 + 64), *(void *)(a1 + 32));
    [*(id *)(a1 + 32) updatePreviousPropertiesWithCurrentProperties];
    uint64_t v29 = (id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    v30 = v6;
LABEL_23:
    objc_storeStrong(v29, v30);
    goto LABEL_24;
  }
  v34 = ACHLogAwardEngine();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
    __91__ACHActivityAwardingSource__queue_updateDataProvider_forDateInterval_awardingBlock_error___block_invoke_cold_1(v34);
  }

  id v6 = 0;
LABEL_24:
}

void __91__ACHActivityAwardingSource__queue_updateDataProvider_forDateInterval_awardingBlock_error___block_invoke_298(uint64_t a1, void *a2)
{
}

- (void)_queue_updateDataProvider:(id)a3 forDateInterval:(id)a4 awardingBlock:(id)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(ACHActivityAwardingSource *)self internalQueue];
  dispatch_assert_queue_V2(v11);

  id v12 = [(ACHActivityAwardingSource *)self gregorianUTCCalendar];
  id v13 = [v9 startDate];
  uint64_t v14 = objc_msgSend(v12, "hk_activitySummaryDateComponentsFromDate:", v13);

  id v15 = [(ACHActivityAwardingSource *)self gregorianUTCCalendar];
  id v16 = [v9 endDate];
  id v17 = objc_msgSend(v15, "hk_activitySummaryDateComponentsFromDate:", v16);

  id v18 = (void *)[objc_alloc(MEMORY[0x263F236B0]) initWithStartDateComponents:v14 endDateComponents:v17];
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__29;
  v37[4] = __Block_byref_object_dispose__29;
  id v38 = 0;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__29;
  uint64_t v35 = __Block_byref_object_dispose__29;
  id v36 = (id)[MEMORY[0x263EFFA68] mutableCopy];
  id v19 = [(ACHActivityAwardingSource *)self activitySummaryUtility];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __85__ACHActivityAwardingSource__queue_updateDataProvider_forDateInterval_awardingBlock___block_invoke;
  v24[3] = &unk_264518318;
  uint64_t v28 = &v31;
  uint64_t v29 = v37;
  id v20 = v8;
  id v25 = v20;
  uint64_t v26 = self;
  uint64_t v30 = 16398;
  id v21 = v10;
  id v27 = v21;
  [v19 enumerateActivitySummariesForDateComponentInterval:v18 handler:v24];

  BOOL v22 = ACHLogAwardEngine();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = v32[5];
    *(_DWORD *)buf = 138412290;
    uint64_t v40 = v23;
    _os_log_impl(&dword_21F5DA000, v22, OS_LOG_TYPE_DEFAULT, "Summaries: %@", buf, 0xCu);
  }

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(v37, 8);
}

void __85__ACHActivityAwardingSource__queue_updateDataProvider_forDateInterval_awardingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v15 = a2;
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "addObject:");
  uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v6 = *(void *)(v4 + 40);
  id v5 = (id *)(v4 + 40);
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "setYesterdayActivitySummary:");
    id v7 = [*(id *)(a1 + 40) activitySummaryUtility];
    id v8 = (void *)[v7 newEmptyActivitySummaryFromSummary:v15];
    [*(id *)(a1 + 32) setTodayActivitySummary:v8];

    uint64_t v9 = objc_msgSend(*(id *)(a1 + 40), "_queue_triggersWithChangedSummaryFields:dataProvider:", *(void *)(a1 + 72), *(void *)(a1 + 32));
    uint64_t v10 = *(void *)(a1 + 48);
    if (v10) {
      (*(void (**)(uint64_t, uint64_t, void))(v10 + 16))(v10, v9, *(void *)(a1 + 32));
    }
    [*(id *)(a1 + 32) updatePreviousPropertiesWithCurrentProperties];
    [*(id *)(a1 + 32) setTodayActivitySummary:v15];
    uint64_t v11 = objc_msgSend(*(id *)(a1 + 40), "_queue_triggersWithChangedSummaryFields:dataProvider:", *(void *)(a1 + 72), *(void *)(a1 + 32));
    uint64_t v12 = *(void *)(a1 + 48);
    if (v12) {
      (*(void (**)(uint64_t, uint64_t, void))(v12 + 16))(v12, v11, *(void *)(a1 + 32));
    }
    uint64_t v13 = [v15 _activitySummaryIndex];
    uint64_t v14 = [*(id *)(a1 + 32) properties];
    [v14 setStoreValuesValidBeforeSummaryIndex:v13];

    [*(id *)(a1 + 32) updatePreviousPropertiesWithCurrentProperties];
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a2);
  }
  else
  {
    objc_storeStrong(v5, a2);
    objc_msgSend(*(id *)(a1 + 32), "setLastCheckedIndex:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), "_activitySummaryIndex"));
  }
}

- (id)earnedInstancesForHistoricalInterval:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(ACHActivityAwardingSource *)self internalQueue];
  dispatch_assert_queue_not_V2(v7);

  uint64_t v21 = 0;
  BOOL v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__29;
  id v25 = __Block_byref_object_dispose__29;
  id v26 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v8 = [(ACHActivityAwardingSource *)self internalQueue];
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  id v15 = __72__ACHActivityAwardingSource_earnedInstancesForHistoricalInterval_error___block_invoke;
  id v16 = &unk_264515EC0;
  id v17 = self;
  id v9 = v6;
  id v18 = v9;
  id v19 = &v21;
  id v20 = a4;
  dispatch_sync(v8, &v13);

  id v10 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v11 = objc_msgSend(v10, "initWithArray:", v22[5], v13, v14, v15, v16, v17);

  _Block_object_dispose(&v21, 8);
  return v11;
}

void __72__ACHActivityAwardingSource_earnedInstancesForHistoricalInterval_error___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) watchCountryCode];
  id v3 = ACHLogAwardEngine();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    id v26 = v4;
    _os_log_impl(&dword_21F5DA000, v3, OS_LOG_TYPE_DEFAULT, "[ACHActivityAwardingSource] running historical for interval: %@", buf, 0xCu);
  }

  id v5 = *(void **)(a1 + 32);
  id v6 = [v5 dataProvider];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __72__ACHActivityAwardingSource_earnedInstancesForHistoricalInterval_error___block_invoke_302;
  v22[3] = &unk_264518340;
  uint64_t v7 = *(void *)(a1 + 40);
  v22[4] = *(void *)(a1 + 32);
  id v8 = v2;
  uint64_t v9 = *(void *)(a1 + 48);
  id v23 = v8;
  uint64_t v24 = v9;
  id v21 = 0;
  objc_msgSend(v5, "_queue_updateDataProvider:forDateInterval:awardingBlock:error:", v6, v7, v22, &v21);
  id v10 = v21;

  uint64_t v11 = ACHLogAwardEngine();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [*(id *)(a1 + 32) dataProvider];
    uint64_t v13 = [v12 properties];
    uint64_t v14 = [v13 dictionaryRepresentation];
    *(_DWORD *)buf = 138412290;
    id v26 = v14;
    _os_log_impl(&dword_21F5DA000, v11, OS_LOG_TYPE_DEFAULT, "[ACHActivityAwardingSource] dataprovider properties: %@", buf, 0xCu);
  }
  if (v10)
  {
    id v15 = ACHLogAwardEngine();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      __72__ACHActivityAwardingSource_earnedInstancesForHistoricalInterval_error___block_invoke_cold_1((uint64_t)v10, v15);
    }

    id v16 = *(void **)(a1 + 56);
    if (v16) {
      *id v16 = v10;
    }
    else {
      _HKLogDroppedError();
    }
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count])
  {
    id v17 = ACHLogAwardEngine();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "count"));
      *(_DWORD *)buf = 138543362;
      id v26 = v18;
      _os_log_impl(&dword_21F5DA000, v17, OS_LOG_TYPE_DEFAULT, "Activity source awarded %{public}@ earned instances.", buf, 0xCu);
    }
    if ((unint64_t)[*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count] <= 0xA)
    {
      id v19 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "hk_map:", &__block_literal_global_27);
      id v20 = ACHLogAwardEngine();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = v19;
        _os_log_impl(&dword_21F5DA000, v20, OS_LOG_TYPE_DEFAULT, "Activity source awarded earned instances with unique names: %@.", buf, 0xCu);
      }
    }
  }
  if ([*(id *)(a1 + 32) isAppleWatch]
    && ([*(id *)(a1 + 32) isObservingSummaryUpdates] & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_queue_startCurrentSummaryQuery");
  }
}

void __72__ACHActivityAwardingSource_earnedInstancesForHistoricalInterval_error___block_invoke_302(uint64_t a1, uint64_t a2, void *a3)
{
  id v12 = a3;
  id v5 = [v12 todayActivitySummary];
  id v6 = [v5 _gregorianDateComponents];
  uint64_t v7 = [*(id *)(a1 + 32) templateStore];
  id v8 = [v7 availableTemplatesForDateComponents:v6 countryCode:*(void *)(a1 + 40)];
  uint64_t v9 = (void *)[v8 mutableCopy];

  id v10 = (void *)MEMORY[0x223C50570]();
  uint64_t v11 = objc_msgSend(*(id *)(a1 + 32), "_queue_evaluateTriggers:activitySummary:templates:shouldLog:", a2, v5, v9, objc_msgSend(*(id *)(a1 + 32), "isAppleWatch"));
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObjectsFromArray:v11];
}

uint64_t __72__ACHActivityAwardingSource_earnedInstancesForHistoricalInterval_error___block_invoke_305(uint64_t a1, void *a2)
{
  return [a2 templateUniqueName];
}

- (id)earnedInstancesForHistoricalInterval:(id)a3 databaseContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ACHActivityAwardingSource *)self internalQueue];
  dispatch_assert_queue_not_V2(v8);

  if (!v7)
  {
    id v7 = [MEMORY[0x263F431E0] contextForReadingProtectedData];
  }
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__29;
  id v26 = __Block_byref_object_dispose__29;
  id v27 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v9 = [(ACHActivityAwardingSource *)self internalQueue];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  id v16 = __82__ACHActivityAwardingSource_earnedInstancesForHistoricalInterval_databaseContext___block_invoke;
  id v17 = &unk_264518390;
  id v18 = self;
  id v10 = v7;
  id v19 = v10;
  id v11 = v6;
  id v20 = v11;
  id v21 = &v22;
  dispatch_sync(v9, &v14);

  id v12 = objc_msgSend(MEMORY[0x263EFFA08], "setWithArray:", v23[5], v14, v15, v16, v17, v18);

  _Block_object_dispose(&v22, 8);
  return v12;
}

void __82__ACHActivityAwardingSource_earnedInstancesForHistoricalInterval_databaseContext___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) watchCountryCode];
  id v3 = [*(id *)(a1 + 32) profile];
  uint64_t v4 = [v3 database];
  id v5 = (void *)[*(id *)(a1 + 40) copyForReadingProtectedData];
  id v15 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __82__ACHActivityAwardingSource_earnedInstancesForHistoricalInterval_databaseContext___block_invoke_2;
  v11[3] = &unk_264518368;
  v11[4] = *(void *)(a1 + 32);
  id v12 = *(id *)(a1 + 48);
  id v6 = v2;
  uint64_t v7 = *(void *)(a1 + 56);
  id v13 = v6;
  uint64_t v14 = v7;
  int v8 = [v4 performTransactionWithContext:v5 error:&v15 block:v11 inaccessibilityHandler:0];
  id v9 = v15;

  if (!v8 || v9)
  {
    id v10 = ACHLogAwardEngine();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = v9;
      _os_log_impl(&dword_21F5DA000, v10, OS_LOG_TYPE_DEFAULT, "Activity source transaction error: %{public}@", buf, 0xCu);
    }
  }
}

uint64_t __82__ACHActivityAwardingSource_earnedInstancesForHistoricalInterval_databaseContext___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [v2 dataProvider];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __82__ACHActivityAwardingSource_earnedInstancesForHistoricalInterval_databaseContext___block_invoke_3;
  v12[3] = &unk_264518340;
  uint64_t v4 = *(void *)(a1 + 40);
  v12[4] = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  id v13 = v5;
  uint64_t v14 = v6;
  objc_msgSend(v2, "_queue_updateDataProvider:forDateInterval:awardingBlock:", v3, v4, v12);

  if ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count])
  {
    uint64_t v7 = ACHLogAwardEngine();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "count"));
      *(_DWORD *)buf = 138543362;
      id v16 = v8;
      _os_log_impl(&dword_21F5DA000, v7, OS_LOG_TYPE_DEFAULT, "Activity source awarded %{public}@ earned instances.", buf, 0xCu);
    }
    if ((unint64_t)[*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count] <= 0xA)
    {
      id v9 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "hk_map:", &__block_literal_global_311);
      id v10 = ACHLogAwardEngine();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v9;
        _os_log_impl(&dword_21F5DA000, v10, OS_LOG_TYPE_DEFAULT, "Activity source awarded earned instances with unique names: %@.", buf, 0xCu);
      }
    }
  }
  if ([*(id *)(a1 + 32) isAppleWatch]
    && ([*(id *)(a1 + 32) isObservingSummaryUpdates] & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_queue_observeSummaries");
  }

  return 1;
}

void __82__ACHActivityAwardingSource_earnedInstancesForHistoricalInterval_databaseContext___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v10 = [a3 todayActivitySummary];
  id v5 = [v10 _gregorianDateComponents];
  uint64_t v6 = [*(id *)(a1 + 32) templateStore];
  uint64_t v7 = [v6 availableTemplatesForDateComponents:v5 countryCode:*(void *)(a1 + 40)];
  int v8 = (void *)[v7 mutableCopy];

  id v9 = objc_msgSend(*(id *)(a1 + 32), "_queue_evaluateTriggers:activitySummary:templates:shouldLog:", a2, v10, v8, objc_msgSend(*(id *)(a1 + 32), "isAppleWatch"));
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObjectsFromArray:v9];
}

uint64_t __82__ACHActivityAwardingSource_earnedInstancesForHistoricalInterval_databaseContext___block_invoke_309(uint64_t a1, void *a2)
{
  return [a2 templateUniqueName];
}

- (void)_queue_updateProgressDataProviderIfNeeded
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21F5DA000, a2, OS_LOG_TYPE_ERROR, "[ACHActivityAwardingSource] Error updating progress data provider: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_runIncrementallyForChangedSummaryFields:(unint64_t)a3
{
  id v5 = [(ACHActivityAwardingSource *)self engine];
  uint64_t v6 = [(ACHActivityAwardingSource *)self uniqueName];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __70__ACHActivityAwardingSource__runIncrementallyForChangedSummaryFields___block_invoke;
  v7[3] = &unk_2645183B8;
  v7[4] = self;
  void v7[5] = a3;
  [v5 requestIncrementalEvaluationForSource:v6 evaluationBlock:v7];
}

id __70__ACHActivityAwardingSource__runIncrementallyForChangedSummaryFields___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) internalQueue];
  dispatch_assert_queue_not_V2(v4);

  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__29;
  id v15 = __Block_byref_object_dispose__29;
  id v16 = 0;
  id v5 = [*(id *)(a1 + 32) internalQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__ACHActivityAwardingSource__runIncrementallyForChangedSummaryFields___block_invoke_2;
  block[3] = &unk_264517A48;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  void block[5] = &v11;
  block[6] = v7;
  block[4] = v6;
  dispatch_sync(v5, block);

  int v8 = [MEMORY[0x263EFFA08] setWithArray:v12[5]];
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __70__ACHActivityAwardingSource__runIncrementallyForChangedSummaryFields___block_invoke_2(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) todayActivitySummary];
  id v3 = [*(id *)(a1 + 32) dataProvider];
  [v3 setTodayActivitySummary:v2];

  uint64_t v4 = [*(id *)(a1 + 32) yesterdayActivitySummary];
  id v5 = [*(id *)(a1 + 32) dataProvider];
  [v5 setYesterdayActivitySummary:v4];

  id v22 = [*(id *)(a1 + 32) watchCountryCode];
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 48);
  int v8 = [v6 dataProvider];
  uint64_t v9 = objc_msgSend(v6, "_queue_triggersWithChangedSummaryFields:dataProvider:", v7, v8);

  id v10 = [*(id *)(a1 + 32) templateStore];
  uint64_t v11 = [*(id *)(a1 + 32) dataProvider];
  id v12 = [v11 todayActivitySummary];
  uint64_t v13 = [v12 _gregorianDateComponents];
  uint64_t v14 = [v10 availableTemplatesForDateComponents:v13 countryCode:v22];

  id v15 = *(void **)(a1 + 32);
  id v16 = [v15 dataProvider];
  uint64_t v17 = [v16 todayActivitySummary];
  uint64_t v18 = objc_msgSend(v15, "_queue_evaluateTriggers:activitySummary:templates:shouldLog:", v9, v17, v14, 1);
  uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8);
  id v20 = *(void **)(v19 + 40);
  *(void *)(v19 + 40) = v18;

  id v21 = [*(id *)(a1 + 32) dataProvider];
  [v21 updatePreviousPropertiesWithCurrentProperties];

  objc_msgSend(*(id *)(a1 + 32), "_queue_updateProgressDataProviderIfNeeded");
}

- (unint64_t)_queue_triggersWithChangedSummaryFields:(unint64_t)a3 dataProvider:(id)a4
{
  __int16 v4 = a3;
  id v6 = a4;
  uint64_t v7 = [(ACHActivityAwardingSource *)self internalQueue];
  dispatch_assert_queue_V2(v7);

  int v8 = [v6 todayActivitySummary];
  uint64_t v9 = [v8 activityMoveMode];

  if (v9 == 2)
  {
    if ((v4 & 0x4000) != 0)
    {
      id v10 = [(ACHActivityAwardingSource *)self triggerGenerator];
      uint64_t v11 = [v10 triggersForNewMoveTimeDataWithDataProvider:v6];
      goto LABEL_8;
    }
  }
  else if ((v4 & 2) != 0)
  {
    id v10 = [(ACHActivityAwardingSource *)self triggerGenerator];
    uint64_t v11 = [v10 triggersForNewMoveDataWithDataProvider:v6];
LABEL_8:
    unint64_t v12 = v11;

    if ((v4 & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  unint64_t v12 = 0;
  if ((v4 & 4) != 0)
  {
LABEL_9:
    uint64_t v13 = [(ACHActivityAwardingSource *)self triggerGenerator];
    v12 |= [v13 triggersForNewExerciseDataWithDataProvider:v6];
  }
LABEL_10:
  if ((v4 & 8) != 0)
  {
    uint64_t v14 = [(ACHActivityAwardingSource *)self triggerGenerator];
    v12 |= [v14 triggersForNewStandDataWithDataProvider:v6];

    if ((v12 & 0x40) == 0) {
      goto LABEL_16;
    }
  }
  else if ((v12 & 0x40) == 0)
  {
    goto LABEL_16;
  }
  id v15 = [v6 todayActivitySummary];
  uint64_t v16 = [v15 _activitySummaryIndex];
  uint64_t v17 = [v6 properties];
  uint64_t v18 = [v17 mostRecentAllGoalsMadeIndex];

  if (v16 > v18)
  {
    uint64_t v19 = [v6 properties];
    objc_msgSend(v19, "setTotalAllGoalsMade:", objc_msgSend(v19, "totalAllGoalsMade") + 1);

    id v20 = [v6 todayActivitySummary];
    uint64_t v21 = [v20 _activitySummaryIndex];
    id v22 = [v6 properties];
    [v22 setMostRecentAllGoalsMadeIndex:v21];
  }
LABEL_16:

  return v12;
}

- (id)_queue_evaluateTriggers:(unint64_t)a3 activitySummary:(id)a4 templates:(id)a5 shouldLog:(BOOL)a6
{
  BOOL v75 = a6;
  uint64_t v94 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v67 = a5;
  id v10 = [(ACHActivityAwardingSource *)self internalQueue];
  dispatch_assert_queue_V2(v10);

  if (a3)
  {
    uint64_t v11 = [v9 _gregorianDateComponents];
    unint64_t v12 = [(ACHActivityAwardingSource *)self environment];
    [v12 setCurrentDateComponents:v11];

    uint64_t v13 = [(ACHActivityAwardingSource *)self gregorianUTCCalendar];
    v72 = (void *)v11;
    uint64_t v14 = [v13 dateFromComponents:v11];

    id v15 = [(ACHActivityAwardingSource *)self profile];

    if (v15)
    {
      uint64_t v16 = [(ACHActivityAwardingSource *)self profile];
      uint64_t v17 = [(ACHActivityAwardingSource *)self gregorianUTCCalendar];
      v84 = 0;
      uint64_t v18 = ACHExperienceTypeForDateWithProfile(v16, v17, v14, &v84);
      uint64_t v19 = v84;
    }
    else
    {
      uint64_t v16 = [(ACHActivityAwardingSource *)self healthStore];
      uint64_t v17 = [(ACHActivityAwardingSource *)self gregorianUTCCalendar];
      v83 = 0;
      uint64_t v18 = ACHExperienceTypeForDateWithHealthStore(v16, v17, v14, &v83);
      uint64_t v19 = v83;
    }
    id v21 = v19;
    id v22 = [(ACHActivityAwardingSource *)self environment];
    [v22 setExperienceType:v18];

    id v23 = v21;
    if (v21)
    {
      uint64_t v24 = [(ACHActivityAwardingSource *)self environment];
      [v24 setExperienceType:3];

      id v25 = ACHLogAwardEngine();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v87 = v21;
        _os_log_impl(&dword_21F5DA000, v25, OS_LOG_TYPE_DEFAULT, "ActivityAwardingSource failed to get date of birth with error %@, defaulting to FIExperienceTypeSimplified", buf, 0xCu);
      }
    }
    v82[0] = MEMORY[0x263EF8330];
    v82[1] = 3221225472;
    v82[2] = __89__ACHActivityAwardingSource__queue_evaluateTriggers_activitySummary_templates_shouldLog___block_invoke;
    v82[3] = &__block_descriptor_40_e38_B24__0__ACHTemplate_8__NSDictionary_16l;
    v82[4] = a3;
    id v26 = [MEMORY[0x263F08A98] predicateWithBlock:v82];
    id v27 = [v67 filteredArrayUsingPredicate:v26];

    id v71 = objc_alloc_init(MEMORY[0x263EFF980]);
    if (v75)
    {
      uint64_t v28 = ACHLogAwardEngine();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v29 = ACHTriggerOptionsToString();
        uint64_t v30 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v27, "count"));
        *(_DWORD *)buf = 138413058;
        id v87 = v29;
        __int16 v88 = 2114;
        v89 = v30;
        __int16 v90 = 2114;
        v91 = v72;
        __int16 v92 = 2112;
        id v93 = v9;
        _os_log_impl(&dword_21F5DA000, v28, OS_LOG_TYPE_DEFAULT, "Activity source is evaluating triggers %@ for %{public}@ templates using activity summary with date %{public}@, values: %@", buf, 0x2Au);
      }
    }
    id v66 = v9;
    id v31 = objc_alloc_init(MEMORY[0x263F236C0]);
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    id obj = v27;
    uint64_t v77 = [obj countByEnumeratingWithState:&v78 objects:v85 count:16];
    if (v77)
    {
      uint64_t v32 = *(void *)v79;
      uint64_t v73 = *(void *)v79;
      id v74 = v31;
      v68 = self;
      id v69 = v21;
      v70 = v14;
      do
      {
        for (uint64_t i = 0; i != v77; ++i)
        {
          if (*(void *)v79 != v32) {
            objc_enumerationMutation(obj);
          }
          v34 = *(void **)(*((void *)&v78 + 1) + 8 * i);
          uint64_t v35 = objc_msgSend(v31, "validateTemplate:", v34, v66);
          if ([v35 isValid])
          {
            id v36 = [v34 gracePredicate];
            id v37 = v36;
            if (v36)
            {
              id v38 = v36;
            }
            else
            {
              id v38 = [v34 predicate];
            }
            v39 = v38;

            uint64_t v41 = [MEMORY[0x263F08A98] predicateWithFormat:v39];
            [v41 allowEvaluation];
            v42 = [(ACHActivityAwardingSource *)self environment];
            int v43 = [v41 evaluateWithObject:v42];

            if (v43)
            {
              if (v75)
              {
                v44 = ACHLogAwardEngine();
                if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
                {
                  v45 = [v34 uniqueName];
                  *(_DWORD *)buf = 138412546;
                  id v87 = v45;
                  __int16 v88 = 2112;
                  v89 = v39;
                  _os_log_impl(&dword_21F5DA000, v44, OS_LOG_TYPE_DEFAULT, "Template predicate is true, creating earned instance. Template: %@, predicate: %@", buf, 0x16u);
                }
                v46 = [(ACHActivityAwardingSource *)self environment];
                [v46 setValueForKeyLoggingEnabled:1];

                v47 = ACHLogAwardEngine();
                if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_21F5DA000, v47, OS_LOG_TYPE_DEFAULT, "Evaluating predicate with valueForKey logging enabled:", buf, 2u);
                }

                v48 = [(ACHActivityAwardingSource *)self environment];
                [v41 evaluateWithObject:v48];

                v49 = [(ACHActivityAwardingSource *)self environment];
                [v49 setValueForKeyLoggingEnabled:0];
              }
              id v50 = objc_alloc_init(MEMORY[0x263F236B8]);
              v51 = [v34 uniqueName];
              [v50 setTemplateUniqueName:v51];

              [v72 year];
              [v72 month];
              [v72 day];
              v52 = ACHDateComponentsForYearMonthDay();
              [v50 setEarnedDateComponents:v52];

              v53 = [v34 graceValueExpression];
              if ((v53
                 || ([v34 valueExpression], (v53 = objc_claimAutoreleasedReturnValue()) != 0))
                && ([v34 canonicalUnit],
                    v54 = objc_claimAutoreleasedReturnValue(),
                    v54,
                    v54))
              {
                uint64_t v55 = [MEMORY[0x263F087F0] expressionWithFormat:v53];
                v56 = self;
                v57 = (void *)v55;
                v58 = [(ACHActivityAwardingSource *)v56 environment];
                v59 = [v57 expressionValueWithObject:v58 context:0];

                if (v59)
                {
                  v60 = (void *)MEMORY[0x263F0A630];
                  v61 = [v34 canonicalUnit];
                  [v59 doubleValue];
                  v62 = objc_msgSend(v60, "quantityWithUnit:doubleValue:", v61);
                  [v50 setValue:v62];
                }
                BOOL v63 = v75;
                self = v68;
              }
              else
              {
                BOOL v63 = v75;
              }
              uint64_t v14 = v70;
              if (v63)
              {
                v64 = ACHLogAwardEngine();
                if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  id v87 = v50;
                  _os_log_impl(&dword_21F5DA000, v64, OS_LOG_TYPE_DEFAULT, "Created earned instance: %@", buf, 0xCu);
                }
              }
              [v71 addObject:v50];

              id v23 = v69;
            }

            uint64_t v32 = v73;
            id v31 = v74;
          }
          else
          {
            v39 = ACHLogAwardEngine();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v40 = [v34 uniqueName];
              *(_DWORD *)buf = 138412290;
              id v87 = v40;
              _os_log_impl(&dword_21F5DA000, v39, OS_LOG_TYPE_DEFAULT, "Template has invalid predicates, skipping: %@", buf, 0xCu);
            }
          }
        }
        uint64_t v77 = [obj countByEnumeratingWithState:&v78 objects:v85 count:16];
      }
      while (v77);
    }

    id v20 = (id)[v71 copy];
    id v9 = v66;
  }
  else
  {
    id v20 = objc_alloc_init(MEMORY[0x263EFF8C0]);
  }

  return v20;
}

BOOL __89__ACHActivityAwardingSource__queue_evaluateTriggers_activitySummary_templates_shouldLog___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  return ([a2 triggers] & v2) != 0;
}

- (void)_queue_observeSummaries
{
  id v3 = [(ACHActivityAwardingSource *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  [(ACHActivityAwardingSource *)self setIsObservingSummaryUpdates:1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  __int16 v4 = [WeakRetained currentActivitySummaryHelper];
  [v4 addObserver:self];
}

- (void)currentActivitySummaryHelper:(id)a3 didUpdateTodayActivitySummary:(id)a4 changedFields:(unint64_t)a5
{
  id v7 = a4;
  if (([v7 _isDataLoading] & 1) == 0)
  {
    int v8 = [(ACHActivityAwardingSource *)self internalQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __102__ACHActivityAwardingSource_currentActivitySummaryHelper_didUpdateTodayActivitySummary_changedFields___block_invoke;
    block[3] = &unk_264516558;
    block[4] = self;
    id v10 = v7;
    unint64_t v11 = a5;
    dispatch_async(v8, block);
  }
}

uint64_t __102__ACHActivityAwardingSource_currentActivitySummaryHelper_didUpdateTodayActivitySummary_changedFields___block_invoke(uint64_t a1)
{
  uint64_t v2 = (uint64_t *)(a1 + 40);
  [*(id *)(a1 + 32) setTodayActivitySummary:*(void *)(a1 + 40)];
  id v3 = ACHLogAwardEngine();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __102__ACHActivityAwardingSource_currentActivitySummaryHelper_didUpdateTodayActivitySummary_changedFields___block_invoke_cold_1(v2, v3);
  }

  int IsAppleWatch = ACHConfigurationSupportsIncrementalEvaluationWithIsAppleWatch([*(id *)(a1 + 32) isAppleWatch]);
  id v5 = *(void **)(a1 + 32);
  if (IsAppleWatch) {
    return [v5 _runIncrementallyForChangedSummaryFields:*(void *)(a1 + 48)];
  }
  else {
    return objc_msgSend(v5, "_queue_updateProgressDataProviderIfNeeded");
  }
}

- (void)currentActivitySummaryHelper:(id)a3 didUpdateYesterdayActivitySummary:(id)a4 changedFields:(unint64_t)a5
{
  id v7 = a4;
  if (([v7 _isDataLoading] & 1) == 0)
  {
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __106__ACHActivityAwardingSource_currentActivitySummaryHelper_didUpdateYesterdayActivitySummary_changedFields___block_invoke;
    block[3] = &unk_264516558;
    block[4] = self;
    id v10 = v7;
    unint64_t v11 = a5;
    dispatch_async(internalQueue, block);
  }
}

uint64_t __106__ACHActivityAwardingSource_currentActivitySummaryHelper_didUpdateYesterdayActivitySummary_changedFields___block_invoke(uint64_t a1)
{
  uint64_t v2 = (uint64_t *)(a1 + 40);
  [*(id *)(a1 + 32) setYesterdayActivitySummary:*(void *)(a1 + 40)];
  id v3 = ACHLogAwardEngine();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __106__ACHActivityAwardingSource_currentActivitySummaryHelper_didUpdateYesterdayActivitySummary_changedFields___block_invoke_cold_1(v2, v3);
  }

  int IsAppleWatch = ACHConfigurationSupportsIncrementalEvaluationWithIsAppleWatch([*(id *)(a1 + 32) isAppleWatch]);
  id v5 = *(void **)(a1 + 32);
  if (IsAppleWatch) {
    return [v5 _runIncrementallyForChangedSummaryFields:*(void *)(a1 + 48)];
  }
  else {
    return objc_msgSend(v5, "_queue_updateProgressDataProviderIfNeeded");
  }
}

- (NSArray)dataStorePropertyKeys
{
  id v3 = [(ACHActivityAwardingSource *)self internalQueue];
  dispatch_assert_queue_not_V2(v3);

  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  unint64_t v11 = __Block_byref_object_copy__29;
  unint64_t v12 = __Block_byref_object_dispose__29;
  id v13 = 0;
  __int16 v4 = [(ACHActivityAwardingSource *)self internalQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__ACHActivityAwardingSource_dataStorePropertyKeys__block_invoke;
  v7[3] = &unk_264516580;
  v7[4] = self;
  void v7[5] = &v8;
  dispatch_sync(v4, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSArray *)v5;
}

void __50__ACHActivityAwardingSource_dataStorePropertyKeys__block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) dataProvider];
  uint64_t v2 = [v6 properties];
  uint64_t v3 = [v2 dictionaryKeys];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (NSDictionary)dataStoreProperties
{
  uint64_t v3 = [(ACHActivityAwardingSource *)self internalQueue];
  dispatch_assert_queue_not_V2(v3);

  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  unint64_t v11 = __Block_byref_object_copy__29;
  unint64_t v12 = __Block_byref_object_dispose__29;
  id v13 = 0;
  uint64_t v4 = [(ACHActivityAwardingSource *)self internalQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__ACHActivityAwardingSource_dataStoreProperties__block_invoke;
  v7[3] = &unk_264516580;
  v7[4] = self;
  void v7[5] = &v8;
  dispatch_sync(v4, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSDictionary *)v5;
}

void __48__ACHActivityAwardingSource_dataStoreProperties__block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) dataProvider];
  uint64_t v2 = [v6 properties];
  uint64_t v3 = [v2 dictionaryRepresentation];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)setDataStoreProperties:(id)a3
{
  id v4 = a3;
  id v5 = [(ACHActivityAwardingSource *)self internalQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__ACHActivityAwardingSource_setDataStoreProperties___block_invoke;
  v7[3] = &unk_264515DE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __52__ACHActivityAwardingSource_setDataStoreProperties___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_alloc_init(ACHDataStoreActivityProperties);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 200);
  *(void *)(v3 + 200) = v2;

  [*(id *)(*(void *)(a1 + 32) + 200) setValuesForKeysWithDictionary:*(void *)(a1 + 40)];
  id v5 = [*(id *)(a1 + 32) dataProvider];
  id v6 = [v5 properties];
  [v6 setValuesForKeysWithDictionary:*(void *)(a1 + 40)];

  id v7 = *(void **)(a1 + 32);
  return objc_msgSend(v7, "_queue_updateProgressDataProviderIfNeeded");
}

- (void)dataStoreDidClearAllProperties:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = [(ACHActivityAwardingSource *)self internalQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __71__ACHActivityAwardingSource_dataStoreDidClearAllProperties_completion___block_invoke;
  v8[3] = &unk_264517070;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

uint64_t __71__ACHActivityAwardingSource_dataStoreDidClearAllProperties_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dataProvider];
  [v2 clearAllProperties];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (NSCalendar)gregorianUTCCalendar
{
  return self->_gregorianUTCCalendar;
}

- (void)setGregorianUTCCalendar:(id)a3
{
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  return (HDProfile *)WeakRetained;
}

- (void)setProfile:(id)a3
{
}

- (ACHEarnedInstanceAwardingEngine)engine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  return (ACHEarnedInstanceAwardingEngine *)WeakRetained;
}

- (void)setEngine:(id)a3
{
}

- (void)setProgressEngine:(id)a3
{
}

- (ACHDataStore)dataStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataStore);
  return (ACHDataStore *)WeakRetained;
}

- (void)setDataStore:(id)a3
{
}

- (ACHTemplateStore)templateStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_templateStore);
  return (ACHTemplateStore *)WeakRetained;
}

- (void)setTemplateStore:(id)a3
{
}

- (FIPauseRingsCoordinator)pauseRingsCoordinator
{
  return self->_pauseRingsCoordinator;
}

- (void)setPauseRingsCoordinator:(id)a3
{
}

- (ACHActivityAwardingDataProvider)dataProvider
{
  return self->_dataProvider;
}

- (void)setDataProvider:(id)a3
{
}

- (ACHActivityTriggerGenerator)triggerGenerator
{
  return self->_triggerGenerator;
}

- (void)setTriggerGenerator:(id)a3
{
}

- (ACHActivityAwardingEnvironment)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
}

- (void)setProgressDataProvider:(id)a3
{
}

- (ACHActivityAwardingEnvironment)progressEnvironment
{
  return self->_progressEnvironment;
}

- (void)setProgressEnvironment:(id)a3
{
}

- (HKActivitySummary)todayActivitySummary
{
  return self->_todayActivitySummary;
}

- (void)setTodayActivitySummary:(id)a3
{
}

- (HKActivitySummary)yesterdayActivitySummary
{
  return self->_yesterdayActivitySummary;
}

- (void)setYesterdayActivitySummary:(id)a3
{
}

- (ACHActivitySummaryIterator)activitySummaryIterator
{
  return self->_activitySummaryIterator;
}

- (void)setActivitySummaryIterator:(id)a3
{
}

- (ACHActivitySummaryUtility)activitySummaryUtility
{
  return self->_activitySummaryUtility;
}

- (void)setActivitySummaryUtility:(id)a3
{
}

- (void)setInternalQueue:(id)a3
{
}

- (NSNumber)overrideIsAppleWatch
{
  return self->_overrideIsAppleWatch;
}

- (void)setOverrideIsAppleWatch:(id)a3
{
}

- (NSString)overrideWatchCountryCode
{
  return self->_overrideWatchCountryCode;
}

- (void)setOverrideWatchCountryCode:(id)a3
{
}

- (void)setWatchCountryCode:(id)a3
{
}

- (BOOL)isObservingSummaryUpdates
{
  return self->_isObservingSummaryUpdates;
}

- (void)setIsObservingSummaryUpdates:(BOOL)a3
{
  self->_isObservingSummaryUpdates = a3;
}

- (ACHCurrentActivitySummaryQuery)currentActivitySummaryQuery
{
  return self->_currentActivitySummaryQuery;
}

- (void)setCurrentActivitySummaryQuery:(id)a3
{
}

- (ACHDataStoreActivityProperties)latestDataStoreProperties
{
  return self->_latestDataStoreProperties;
}

- (void)setLatestDataStoreProperties:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestDataStoreProperties, 0);
  objc_storeStrong((id *)&self->_currentActivitySummaryQuery, 0);
  objc_storeStrong((id *)&self->_watchCountryCode, 0);
  objc_storeStrong((id *)&self->_overrideWatchCountryCode, 0);
  objc_storeStrong((id *)&self->_overrideIsAppleWatch, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_activitySummaryUtility, 0);
  objc_storeStrong((id *)&self->_activitySummaryIterator, 0);
  objc_storeStrong((id *)&self->_yesterdayActivitySummary, 0);
  objc_storeStrong((id *)&self->_todayActivitySummary, 0);
  objc_storeStrong((id *)&self->_progressEnvironment, 0);
  objc_storeStrong((id *)&self->_progressDataProvider, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_triggerGenerator, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_pauseRingsCoordinator, 0);
  objc_destroyWeak((id *)&self->_templateStore);
  objc_destroyWeak((id *)&self->_dataStore);
  objc_destroyWeak((id *)&self->_progressEngine);
  objc_destroyWeak((id *)&self->_engine);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_gregorianUTCCalendar, 0);
  objc_storeStrong((id *)&self->_currentDateOverride, 0);
}

void __91__ACHActivityAwardingSource__queue_updateDataProvider_forDateInterval_awardingBlock_error___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21F5DA000, log, OS_LOG_TYPE_ERROR, "[ACHActivityAwardingSource] Updating progressDataProvider, but unable to determine goals for empty summary, skipping...", v1, 2u);
}

void __72__ACHActivityAwardingSource_earnedInstancesForHistoricalInterval_error___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21F5DA000, a2, OS_LOG_TYPE_ERROR, "Error updating activity data provider: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __102__ACHActivityAwardingSource_currentActivitySummaryHelper_didUpdateTodayActivitySummary_changedFields___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_21F5DA000, a2, OS_LOG_TYPE_DEBUG, "Today summary changed: %@", (uint8_t *)&v3, 0xCu);
}

void __106__ACHActivityAwardingSource_currentActivitySummaryHelper_didUpdateYesterdayActivitySummary_changedFields___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_21F5DA000, a2, OS_LOG_TYPE_DEBUG, "Yesterday summary changed: %@", (uint8_t *)&v3, 0xCu);
}

@end