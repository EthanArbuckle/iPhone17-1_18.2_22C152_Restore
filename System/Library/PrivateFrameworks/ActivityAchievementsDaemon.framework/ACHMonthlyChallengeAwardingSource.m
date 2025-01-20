@interface ACHMonthlyChallengeAwardingSource
- (ACHAchievementProgressEngine)progressEngine;
- (ACHCurrentActivitySummaryQuery)summaryQuery;
- (ACHEarnedInstanceAwardingEngine)engine;
- (ACHEarnedInstanceStore)earnedInstanceStore;
- (ACHMonthlyChallengeAwardingSource)initWithHealthStore:(id)a3 awardingEngine:(id)a4 templateStore:(id)a5 earnedInstanceStore:(id)a6 monthlyDataSource:(id)a7 creatorDevice:(unsigned __int8)a8 progressEngine:(id)a9;
- (ACHMonthlyChallengeAwardingSource)initWithProfile:(id)a3 awardingEngine:(id)a4 templateStore:(id)a5 earnedInstanceStore:(id)a6 monthlyDataSource:(id)a7 creatorDevice:(unsigned __int8)a8 progressEngine:(id)a9;
- (ACHMonthlyChallengeDataSource)monthlyDataSource;
- (ACHTemplateStore)templateStore;
- (BOOL)isAppleWatch;
- (BOOL)providesProgressForTemplate:(id)a3;
- (HDProfile)profile;
- (HKAnchoredObjectQuery)workoutQuery;
- (HKHealthStore)healthStore;
- (NSArray)dataStorePropertyKeys;
- (NSDictionary)dataStoreProperties;
- (NSNumber)overrideIsAppleWatch;
- (NSString)uniqueName;
- (OS_dispatch_queue)internalQueue;
- (id)_earnedDateComponentsForTemplate:(id)a3;
- (id)_earnedInstancesForInterval:(id)a3;
- (id)_evaluationEnvironmentForTemplate:(id)a3;
- (id)_evaluationEnvironmentForTemplate:(id)a3 andDateComponentInterval:(id)a4;
- (id)_monthlyChallengeTemplatesForHistoricalInterval:(id)a3;
- (id)_queue_goalQuantityForTemplate:(id)a3;
- (id)_queue_progressQuantityForTemplate:(id)a3;
- (id)earnedInstancesForHistoricalInterval:(id)a3 databaseContext:(id)a4;
- (id)earnedInstancesForHistoricalInterval:(id)a3 error:(id *)a4;
- (unsigned)creatorDevice;
- (void)_requestIncrementalEvaluation;
- (void)_startQueries;
- (void)currentActivitySummaryHelper:(id)a3 didUpdateTodayActivitySummary:(id)a4 changedFields:(unint64_t)a5;
- (void)currentActivitySummaryHelper:(id)a3 didUpdateYesterdayActivitySummary:(id)a4 changedFields:(unint64_t)a5;
- (void)daemonReady:(id)a3;
- (void)requestAchievementProgressUpdatesForTemplates:(id)a3;
- (void)samplesAdded:(id)a3 anchor:(id)a4;
- (void)setCreatorDevice:(unsigned __int8)a3;
- (void)setEarnedInstanceStore:(id)a3;
- (void)setEngine:(id)a3;
- (void)setHealthStore:(id)a3;
- (void)setInternalQueue:(id)a3;
- (void)setMonthlyDataSource:(id)a3;
- (void)setOverrideIsAppleWatch:(id)a3;
- (void)setProfile:(id)a3;
- (void)setProgressEngine:(id)a3;
- (void)setSummaryQuery:(id)a3;
- (void)setTemplateStore:(id)a3;
- (void)setWorkoutQuery:(id)a3;
@end

@implementation ACHMonthlyChallengeAwardingSource

- (BOOL)providesProgressForTemplate:(id)a3
{
  id v3 = a3;
  if (ACHTemplateIsMonthlyChallenge())
  {
    v4 = [v3 uniqueName];
    v5 = [v4 componentsSeparatedByString:@"_"];

    if ([v5 count] == 3)
    {
      v6 = [v5 objectAtIndexedSubscript:1];
      uint64_t v7 = [v6 integerValue];

      v8 = [v5 objectAtIndexedSubscript:2];
      uint64_t v9 = [v8 integerValue];

      v10 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
      uint64_t v11 = *MEMORY[0x263F234C0];
      v12 = [MEMORY[0x263EFF910] date];
      v13 = [v10 components:v11 fromDate:v12];

      BOOL v14 = v7 == [v13 year] && v9 == objc_msgSend(v13, "month");
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (ACHMonthlyChallengeAwardingSource)initWithHealthStore:(id)a3 awardingEngine:(id)a4 templateStore:(id)a5 earnedInstanceStore:(id)a6 monthlyDataSource:(id)a7 creatorDevice:(unsigned __int8)a8 progressEngine:(id)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a9;
  v27.receiver = self;
  v27.super_class = (Class)ACHMonthlyChallengeAwardingSource;
  v22 = [(ACHMonthlyChallengeAwardingSource *)&v27 init];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_healthStore, a3);
    objc_storeWeak((id *)&v23->_engine, v17);
    objc_storeWeak((id *)&v23->_progressEngine, v21);
    objc_storeWeak((id *)&v23->_templateStore, v18);
    objc_storeWeak((id *)&v23->_earnedInstanceStore, v19);
    objc_storeWeak((id *)&v23->_monthlyDataSource, v20);
    v23->_creatorDevice = a8;
    uint64_t v24 = HKCreateSerialDispatchQueue();
    internalQueue = v23->_internalQueue;
    v23->_internalQueue = (OS_dispatch_queue *)v24;

    [(ACHMonthlyChallengeAwardingSource *)v23 _startQueries];
  }

  return v23;
}

- (void)_startQueries
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc(MEMORY[0x263F236A8]);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __50__ACHMonthlyChallengeAwardingSource__startQueries__block_invoke;
  v17[3] = &unk_264515EE8;
  objc_copyWeak(&v18, &location);
  v4 = (ACHCurrentActivitySummaryQuery *)[v3 initWithUpdateHandler:v17];
  summaryQuery = self->_summaryQuery;
  self->_summaryQuery = v4;

  id v6 = objc_alloc(MEMORY[0x263F0A0C8]);
  uint64_t v7 = [MEMORY[0x263F0A6E8] workoutType];
  v8 = [MEMORY[0x263F0A670] latestAnchor];
  uint64_t v9 = (HKAnchoredObjectQuery *)[v6 initWithType:v7 predicate:0 anchor:v8 limit:0 resultsHandler:&__block_literal_global_0];
  workoutQuery = self->_workoutQuery;
  self->_workoutQuery = v9;

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __50__ACHMonthlyChallengeAwardingSource__startQueries__block_invoke_3;
  v15[3] = &unk_264515D90;
  objc_copyWeak(&v16, &location);
  [(HKAnchoredObjectQuery *)self->_workoutQuery setUpdateHandler:v15];
  uint64_t v11 = [(ACHMonthlyChallengeAwardingSource *)self healthStore];
  v12 = [(ACHMonthlyChallengeAwardingSource *)self summaryQuery];
  [v11 executeQuery:v12];

  v13 = [(ACHMonthlyChallengeAwardingSource *)self healthStore];
  BOOL v14 = [(ACHMonthlyChallengeAwardingSource *)self workoutQuery];
  [v13 executeQuery:v14];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __50__ACHMonthlyChallengeAwardingSource__startQueries__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5, uint64_t a6, void *a7)
{
  id v18 = a2;
  id v13 = a3;
  id v14 = a5;
  id v15 = a7;
  if (v13)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained currentActivitySummaryHelper:0 didUpdateTodayActivitySummary:v13 changedFields:a4];
  }
  if (v14)
  {
    id v17 = objc_loadWeakRetained((id *)(a1 + 32));
    [v17 currentActivitySummaryHelper:0 didUpdateYesterdayActivitySummary:v14 changedFields:a6];
  }
}

void __50__ACHMonthlyChallengeAwardingSource__startQueries__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained samplesAdded:v4 anchor:&unk_26D1160B8];
}

- (ACHMonthlyChallengeAwardingSource)initWithProfile:(id)a3 awardingEngine:(id)a4 templateStore:(id)a5 earnedInstanceStore:(id)a6 monthlyDataSource:(id)a7 creatorDevice:(unsigned __int8)a8 progressEngine:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a9;
  v26.receiver = self;
  v26.super_class = (Class)ACHMonthlyChallengeAwardingSource;
  id v21 = [(ACHMonthlyChallengeAwardingSource *)&v26 init];
  v22 = v21;
  if (v21)
  {
    objc_storeWeak((id *)&v21->_profile, v15);
    objc_storeWeak((id *)&v22->_engine, v16);
    objc_storeWeak((id *)&v22->_progressEngine, v20);
    objc_storeWeak((id *)&v22->_templateStore, v17);
    objc_storeWeak((id *)&v22->_earnedInstanceStore, v18);
    objc_storeWeak((id *)&v22->_monthlyDataSource, v19);
    v22->_creatorDevice = a8;
    id WeakRetained = objc_loadWeakRetained((id *)&v22->_profile);
    uint64_t v24 = [WeakRetained daemon];
    [v24 registerForDaemonReady:v22];
  }
  return v22;
}

- (BOOL)isAppleWatch
{
  id v3 = [(ACHMonthlyChallengeAwardingSource *)self overrideIsAppleWatch];

  if (v3)
  {
    id v4 = [(ACHMonthlyChallengeAwardingSource *)self overrideIsAppleWatch];
    char v5 = [v4 BOOLValue];
  }
  else
  {
    uint64_t v7 = [(ACHMonthlyChallengeAwardingSource *)self profile];

    if (v7)
    {
      id v4 = [(ACHMonthlyChallengeAwardingSource *)self profile];
      v8 = [v4 daemon];
      uint64_t v9 = [v8 behavior];
      char v6 = [v9 isAppleWatch];

      goto LABEL_6;
    }
    id v4 = [MEMORY[0x263F0A980] sharedBehavior];
    char v5 = [v4 isAppleWatch];
  }
  char v6 = v5;
LABEL_6:

  return v6;
}

- (void)daemonReady:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  char v5 = [WeakRetained currentActivitySummaryHelper];
  [v5 addObserver:self];

  id v8 = [(ACHMonthlyChallengeAwardingSource *)self profile];
  char v6 = [v8 dataManager];
  uint64_t v7 = [MEMORY[0x263F0A598] workoutType];
  [v6 addObserver:self forDataType:v7];
}

- (NSString)uniqueName
{
  return (NSString *)@"MonthlyChallengeAwardingSource";
}

- (id)earnedInstancesForHistoricalInterval:(id)a3 error:(id *)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  char v6 = ACHLogMonthlyChallenges();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = v5;
    _os_log_impl(&dword_21F5DA000, v6, OS_LOG_TYPE_DEFAULT, "MonthlyChallengeAwardingSource querying for earned instances in interval: %{public}@", (uint8_t *)&v9, 0xCu);
  }

  uint64_t v7 = [(ACHMonthlyChallengeAwardingSource *)self _earnedInstancesForInterval:v5];

  return v7;
}

- (id)earnedInstancesForHistoricalInterval:(id)a3 databaseContext:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = ACHLogMonthlyChallenges();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_21F5DA000, v8, OS_LOG_TYPE_DEFAULT, "MonthlyChallengeAwardingSource querying for earned instances in interval: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__0;
  uint64_t v24 = __Block_byref_object_dispose__0;
  id v25 = 0;
  if (!v7)
  {
    id v7 = [MEMORY[0x263F431E0] contextForReadingProtectedData];
  }
  int v9 = [(ACHMonthlyChallengeAwardingSource *)self profile];
  id v10 = [v9 database];
  uint64_t v11 = (void *)[v7 copyForReadingProtectedData];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __90__ACHMonthlyChallengeAwardingSource_earnedInstancesForHistoricalInterval_databaseContext___block_invoke;
  v17[3] = &unk_264515F30;
  p_long long buf = &buf;
  id v20 = 0;
  void v17[4] = self;
  id v12 = v6;
  id v18 = v12;
  [v10 performTransactionWithContext:v11 error:&v20 block:v17 inaccessibilityHandler:0];
  id v13 = v20;

  if (v13)
  {
    id v14 = ACHLogMonthlyChallenges();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[ACHMonthlyChallengeAwardingSource earnedInstancesForHistoricalInterval:databaseContext:]((uint64_t)v13, v14);
    }
  }
  id v15 = *(id *)(*((void *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);
  return v15;
}

uint64_t __90__ACHMonthlyChallengeAwardingSource_earnedInstancesForHistoricalInterval_databaseContext___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _earnedInstancesForInterval:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return 1;
}

- (void)currentActivitySummaryHelper:(id)a3 didUpdateTodayActivitySummary:(id)a4 changedFields:(unint64_t)a5
{
  id v6 = [(ACHMonthlyChallengeAwardingSource *)self progressEngine];
  [v6 requestProgressUpdateForProgressProvider:self];

  if (ACHConfigurationSupportsIncrementalEvaluationWithIsAppleWatch([(ACHMonthlyChallengeAwardingSource *)self isAppleWatch]))
  {
    id v7 = ACHLogMonthlyChallenges();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_21F5DA000, v7, OS_LOG_TYPE_DEFAULT, "MonthlyChallengeAwardingProvider found today summary updated, requesting incremental evaluation", v8, 2u);
    }

    [(ACHMonthlyChallengeAwardingSource *)self _requestIncrementalEvaluation];
  }
}

- (void)currentActivitySummaryHelper:(id)a3 didUpdateYesterdayActivitySummary:(id)a4 changedFields:(unint64_t)a5
{
  id v6 = [(ACHMonthlyChallengeAwardingSource *)self progressEngine];
  [v6 requestProgressUpdateForProgressProvider:self];

  if (ACHConfigurationSupportsIncrementalEvaluationWithIsAppleWatch([(ACHMonthlyChallengeAwardingSource *)self isAppleWatch]))
  {
    id v7 = ACHLogMonthlyChallenges();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_21F5DA000, v7, OS_LOG_TYPE_DEFAULT, "MonthlyChallengeAwardingProvider found yesterday summary updated, requesting incremental evaluation", v8, 2u);
    }

    [(ACHMonthlyChallengeAwardingSource *)self _requestIncrementalEvaluation];
  }
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [(ACHMonthlyChallengeAwardingSource *)self progressEngine];
  [v6 requestProgressUpdateForProgressProvider:self];

  if (ACHConfigurationSupportsIncrementalEvaluationWithIsAppleWatch([(ACHMonthlyChallengeAwardingSource *)self isAppleWatch]))
  {
    id v7 = ACHLogMonthlyChallenges();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134217984;
      uint64_t v9 = [v5 count];
      _os_log_impl(&dword_21F5DA000, v7, OS_LOG_TYPE_DEFAULT, "MonthlyChallengeAwardingProvider found %lu new workout samples, requesting incremental evaluation", (uint8_t *)&v8, 0xCu);
    }

    [(ACHMonthlyChallengeAwardingSource *)self _requestIncrementalEvaluation];
  }
}

- (void)requestAchievementProgressUpdatesForTemplates:(id)a3
{
  id v4 = a3;
  id v5 = [(ACHMonthlyChallengeAwardingSource *)self internalQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __83__ACHMonthlyChallengeAwardingSource_requestAchievementProgressUpdatesForTemplates___block_invoke;
  v7[3] = &unk_264515DE0;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __83__ACHMonthlyChallengeAwardingSource_requestAchievementProgressUpdatesForTemplates___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v16 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v2 = objc_alloc_init(MEMORY[0x263F236C0]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v3 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v8 = objc_msgSend(v2, "validateTemplate:", v7, v16);
        if ([v8 isValid])
        {
          uint64_t v9 = objc_msgSend(*(id *)(a1 + 40), "_queue_goalQuantityForTemplate:", v7);
          uint64_t v10 = objc_msgSend(*(id *)(a1 + 40), "_queue_progressQuantityForTemplate:", v7);
          id v11 = objc_alloc(MEMORY[0x263F23640]);
          id v12 = [v7 uniqueName];
          id v13 = (void *)[v11 initWithTemplateUniqueName:v12 progressQuantity:v10 goalQuantity:v9];

          [v16 addObject:v13];
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v4);
  }

  id v14 = [*(id *)(a1 + 40) progressEngine];
  id v15 = (void *)[v16 copy];
  [v14 processAchievementProgressUpdates:v15];
}

- (id)_queue_progressQuantityForTemplate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ACHMonthlyChallengeAwardingSource *)self _evaluationEnvironmentForTemplate:v4];
  id v6 = [v4 graceProgressExpression];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [v4 progressExpression];
  }
  uint64_t v9 = v8;

  uint64_t v10 = [MEMORY[0x263F087F0] expressionWithFormat:v9];
  id v11 = [v10 expressionValueWithObject:v5 context:0];
  id v12 = [v4 canonicalUnit];
  id v13 = ACHHKQuantityWithValueAndUnit();

  return v13;
}

- (id)_queue_goalQuantityForTemplate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ACHMonthlyChallengeAwardingSource *)self _evaluationEnvironmentForTemplate:v4];
  id v6 = [v4 graceGoalExpression];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [v4 goalExpression];
  }
  uint64_t v9 = v8;

  uint64_t v10 = [MEMORY[0x263F087F0] expressionWithFormat:v9];
  id v11 = [v10 expressionValueWithObject:v5 context:0];
  id v12 = [v4 canonicalUnit];
  id v13 = ACHHKQuantityWithValueAndUnit();

  return v13;
}

- (id)_evaluationEnvironmentForTemplate:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F236B0];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = [v5 availabilityStart];
  id v8 = [v5 availabilityEnd];
  uint64_t v9 = (void *)[v6 initWithStartDateComponents:v7 endDateComponents:v8];

  uint64_t v10 = [(ACHMonthlyChallengeAwardingSource *)self _evaluationEnvironmentForTemplate:v5 andDateComponentInterval:v9];

  return v10;
}

- (id)_evaluationEnvironmentForTemplate:(id)a3 andDateComponentInterval:(id)a4
{
  id v5 = a4;
  id v6 = [ACHMonthlyChallengeEvaluationEnvironment alloc];
  id v7 = [(ACHMonthlyChallengeAwardingSource *)self monthlyDataSource];
  id v8 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
  uint64_t v9 = [(ACHMonthlyChallengeEvaluationEnvironment *)v6 initWithMonthlyChallengeDataSource:v7 dateComponentInterval:v5 calendar:v8];

  return v9;
}

- (id)_earnedInstancesForInterval:(id)a3
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  v38 = a3;
  v39 = [MEMORY[0x263EFF9C0] set];
  uint64_t v3 = [(ACHMonthlyChallengeAwardingSource *)self _monthlyChallengeTemplatesForHistoricalInterval:v38];
  id v4 = ACHLogMonthlyChallenges();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218498;
    uint64_t v54 = [v3 count];
    __int16 v55 = 2114;
    v56 = v38;
    __int16 v57 = 2114;
    v58 = v3;
    _os_log_impl(&dword_21F5DA000, v4, OS_LOG_TYPE_DEFAULT, "Found %lu monthly templates for interval %{public}@: %{public}@", buf, 0x20u);
  }

  id v46 = objc_alloc_init(MEMORY[0x263F236C0]);
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = v3;
  uint64_t v47 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v47)
  {
    uint64_t v45 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v47; ++i)
      {
        if (*(void *)v49 != v45) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(NSObject **)(*((void *)&v48 + 1) + 8 * i);
        id v7 = [v46 validateTemplate:v6];
        if ([v7 isValid])
        {
          id v8 = [(ACHMonthlyChallengeAwardingSource *)self _evaluationEnvironmentForTemplate:v6];
          uint64_t v9 = [v6 gracePredicate];
          uint64_t v10 = v9;
          if (v9)
          {
            id v11 = v9;
          }
          else
          {
            id v11 = [v6 predicate];
          }
          id v13 = v11;

          id v14 = [MEMORY[0x263F08A98] predicateWithFormat:v13];
          int v15 = [v14 evaluateWithObject:v8];

          if (v15)
          {
            id v16 = ACHLogMonthlyChallenges();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              id v17 = [v6 uniqueName];
              *(_DWORD *)long long buf = 138543618;
              uint64_t v54 = (uint64_t)v17;
              __int16 v55 = 2114;
              v56 = v6;
              _os_log_impl(&dword_21F5DA000, v16, OS_LOG_TYPE_DEFAULT, "Template %{public}@ evaluated to true for monthly challenge; full template: %{public}@",
                buf,
                0x16u);
            }
            long long v18 = [(ACHMonthlyChallengeAwardingSource *)self _earnedDateComponentsForTemplate:v6];
            if (v18)
            {
              long long v19 = objc_alloc_init(MEMORY[0x263F236B8]);
              long long v20 = [v6 uniqueName];
              [v19 setTemplateUniqueName:v20];

              [v19 setEarnedDateComponents:v18];
              long long v21 = [v6 graceValueExpression];
              uint64_t v22 = v21;
              if (v21)
              {
                id v43 = v21;
              }
              else
              {
                id v43 = [v6 valueExpression];
              }

              uint64_t v24 = [v6 canonicalUnit];
              if (v24) {
                BOOL v25 = v43 == 0;
              }
              else {
                BOOL v25 = 1;
              }
              int v26 = !v25;

              if (v26)
              {
                id v27 = objc_alloc(MEMORY[0x263F236B0]);
                v28 = [v6 availabilityStart];
                v41 = (void *)[v27 initWithStartDateComponents:v28 endDateComponents:v18];

                v40 = [(ACHMonthlyChallengeAwardingSource *)self _evaluationEnvironmentForTemplate:v6 andDateComponentInterval:v41];
                v29 = [MEMORY[0x263F087F0] expressionWithFormat:v43];
                v30 = [v29 expressionValueWithObject:v40 context:0];
                if (v30)
                {
                  v31 = (void *)MEMORY[0x263F0A630];
                  v32 = [v6 canonicalUnit];
                  [v30 doubleValue];
                  v33 = objc_msgSend(v31, "quantityWithUnit:doubleValue:", v32);
                  [v19 setValue:v33];
                }
              }
              [v39 addObject:v19];
              v34 = ACHLogMonthlyChallenges();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
              {
                v35 = [v6 uniqueName];
                *(_DWORD *)long long buf = 138543618;
                uint64_t v54 = (uint64_t)v35;
                __int16 v55 = 2112;
                v56 = v19;
                _os_log_impl(&dword_21F5DA000, v34, OS_LOG_TYPE_DEFAULT, "Earned instance created for template %{public}@: %@", buf, 0x16u);
              }
            }
            else
            {
              long long v19 = ACHLogMonthlyChallenges();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v23 = [v6 uniqueName];
                *(_DWORD *)long long buf = 138412290;
                uint64_t v54 = (uint64_t)v23;
                _os_log_impl(&dword_21F5DA000, v19, OS_LOG_TYPE_DEFAULT, "Unable to determine earned date components for %@, not creating earned instance.", buf, 0xCu);
              }
            }
          }
        }
        else
        {
          id v8 = ACHLogAwardEngine();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            id v12 = [v6 uniqueName];
            *(_DWORD *)long long buf = 138412290;
            uint64_t v54 = (uint64_t)v12;
            _os_log_impl(&dword_21F5DA000, v8, OS_LOG_TYPE_DEFAULT, "Template has invalid predicates, skipping: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v47 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
    }
    while (v47);
  }

  v36 = (void *)[v39 copy];
  return v36;
}

- (id)_earnedDateComponentsForTemplate:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v35 = objc_alloc_init(MEMORY[0x263F236C0]);
  v36 = [v35 validateTemplate:v3];
  if ([v36 isValid])
  {
    v38 = [v3 availabilityStart];
    id v4 = [v3 availabilityEnd];
    id v5 = ACHLogMonthlyChallenges();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v3 uniqueName];
      *(_DWORD *)long long buf = 138412290;
      v40 = v6;
      _os_log_impl(&dword_21F5DA000, v5, OS_LOG_TYPE_DEFAULT, "[Earned Instance Date: %@] Determining earned instance date", buf, 0xCu);
    }
    id v8 = __70__ACHMonthlyChallengeAwardingSource__earnedDateComponentsForTemplate___block_invoke(v7, v38, v4);
    if ([0 isEqual:v8])
    {
      uint64_t v9 = 0;
    }
    else
    {
      id v16 = 0;
      do
      {
        id v17 = objc_alloc(MEMORY[0x263F236B0]);
        long long v18 = [v3 availabilityStart];
        long long v19 = [v17 initWithStartDateComponents:v18 endDateComponents:v8];

        long long v20 = [(ACHMonthlyChallengeAwardingSource *)self _evaluationEnvironmentForTemplate:v3 andDateComponentInterval:v19];
        long long v21 = ACHLogMonthlyChallenges();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v22 = [v3 uniqueName];
          *(_DWORD *)long long buf = 138412546;
          v40 = v22;
          __int16 v41 = 2112;
          v42 = v19;
          _os_log_impl(&dword_21F5DA000, v21, OS_LOG_TYPE_DEFAULT, "[Earned Instance Date: %@] Evaluating for interval: %@", buf, 0x16u);
        }
        uint64_t v23 = [v3 gracePredicate];
        uint64_t v24 = v23;
        if (v23)
        {
          id v25 = v23;
        }
        else
        {
          id v25 = [v3 predicate];
        }
        int v26 = v25;

        id v27 = [MEMORY[0x263F08A98] predicateWithFormat:v26];
        int v28 = [v27 evaluateWithObject:v20];

        if (v28)
        {
          v29 = ACHLogMonthlyChallenges();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            v30 = [v3 uniqueName];
            *(_DWORD *)long long buf = 138412802;
            v40 = v30;
            __int16 v41 = 2112;
            v42 = v8;
            __int16 v43 = 2112;
            v44 = v38;
            _os_log_impl(&dword_21F5DA000, v29, OS_LOG_TYPE_DEFAULT, "[Earned Instance Date: %@] Updating mostRecentEarnedDateComponents to: %@, oldestUnearnedDateComponents = %@", buf, 0x20u);
          }
          v31 = v4;
          id v4 = v8;
        }
        else
        {
          v29 = ACHLogMonthlyChallenges();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            v32 = [v3 uniqueName];
            *(_DWORD *)long long buf = 138412802;
            v40 = v32;
            __int16 v41 = 2112;
            v42 = v8;
            __int16 v43 = 2112;
            v44 = v4;
            _os_log_impl(&dword_21F5DA000, v29, OS_LOG_TYPE_DEFAULT, "[Earned Instance Date: %@] Updating oldestUnearnedDateComponents to: %@, mostRecentEarnedDateComponents = %@", buf, 0x20u);
          }
          v31 = v38;
          v38 = v8;
        }

        v33 = v8;
        uint64_t v9 = v33;

        id v8 = __70__ACHMonthlyChallengeAwardingSource__earnedDateComponentsForTemplate___block_invoke(v34, v38, v4);

        id v16 = v9;
      }
      while (([v9 isEqual:v8] & 1) == 0);
    }
    uint64_t v10 = ACHLogMonthlyChallenges();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [v3 uniqueName];
      *(_DWORD *)long long buf = 138412546;
      v40 = v11;
      __int16 v41 = 2112;
      v42 = v4;
      _os_log_impl(&dword_21F5DA000, v10, OS_LOG_TYPE_DEFAULT, "[Earned Instance Date: %@] Determined earned date is: %@", buf, 0x16u);
    }
    id v12 = v4;

    id v13 = v38;
  }
  else
  {
    id v14 = ACHLogMonthlyChallenges();
    id v13 = v14;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      -[ACHMonthlyChallengeAwardingSource _earnedDateComponentsForTemplate:](v3, v14);
      id v12 = 0;
      id v13 = v14;
    }
    else
    {
      id v12 = 0;
    }
  }

  return v12;
}

id __70__ACHMonthlyChallengeAwardingSource__earnedDateComponentsForTemplate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  uint64_t v6 = [v5 day];
  uint64_t v7 = [v4 day];

  uint64_t v8 = v7 + v6;
  if (v7 + v6 < 0 != __OFADD__(v7, v6)) {
    ++v8;
  }
  uint64_t v9 = v8 >> 1;
  uint64_t v10 = (void *)[v5 copy];

  [v10 setDay:v9];
  return v10;
}

- (id)_monthlyChallengeTemplatesForHistoricalInterval:(id)a3
{
  id v4 = a3;
  id v5 = [(ACHMonthlyChallengeAwardingSource *)self templateStore];
  uint64_t v6 = [v5 allTemplates];

  uint64_t v7 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
  uint64_t v8 = [v4 startDate];
  uint64_t v9 = [v7 startOfDayForDate:v8];

  id v10 = objc_alloc(MEMORY[0x263F08798]);
  id v11 = [v4 endDate];

  id v12 = (void *)[v10 initWithStartDate:v9 endDate:v11];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __85__ACHMonthlyChallengeAwardingSource__monthlyChallengeTemplatesForHistoricalInterval___block_invoke;
  v17[3] = &unk_264515F58;
  id v18 = v7;
  id v19 = v12;
  id v13 = v12;
  id v14 = v7;
  int v15 = objc_msgSend(v6, "hk_filter:", v17);

  return v15;
}

uint64_t __85__ACHMonthlyChallengeAwardingSource__monthlyChallengeTemplatesForHistoricalInterval___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (ACHTemplateIsMonthlyChallenge()
    && ([v3 availabilityStart], (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0)
    && (id v5 = (void *)v4,
        [v3 availabilityEnd],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = [v3 availabilityStart];
    uint64_t v9 = [v7 dateFromComponents:v8];

    id v10 = *(void **)(a1 + 32);
    id v11 = [v3 availabilityEnd];
    id v12 = [v10 dateFromComponents:v11];

    uint64_t v13 = 0;
    if (v9 && v12)
    {
      id v14 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v9 endDate:v12];
      uint64_t v13 = [*(id *)(a1 + 40) intersectsDateInterval:v14];
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (void)_requestIncrementalEvaluation
{
  id v3 = [(ACHMonthlyChallengeAwardingSource *)self engine];
  uint64_t v4 = [(ACHMonthlyChallengeAwardingSource *)self uniqueName];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __66__ACHMonthlyChallengeAwardingSource__requestIncrementalEvaluation__block_invoke;
  v5[3] = &unk_264515F80;
  v5[4] = self;
  [v3 requestIncrementalEvaluationForSource:v4 evaluationBlock:v5];
}

id __66__ACHMonthlyChallengeAwardingSource__requestIncrementalEvaluation__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = ACHLogMonthlyChallenges();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v3;
    _os_log_impl(&dword_21F5DA000, v4, OS_LOG_TYPE_DEFAULT, "MonthlyChallengeAwardingProvider starting incremental evaluation for date range: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  id v5 = [*(id *)(a1 + 32) _earnedInstancesForInterval:v3];

  return v5;
}

- (NSArray)dataStorePropertyKeys
{
  return (NSArray *)MEMORY[0x263EFFA68];
}

- (NSDictionary)dataStoreProperties
{
  return (NSDictionary *)MEMORY[0x263EFFA78];
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

- (ACHAchievementProgressEngine)progressEngine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_progressEngine);
  return (ACHAchievementProgressEngine *)WeakRetained;
}

- (void)setProgressEngine:(id)a3
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

- (ACHEarnedInstanceStore)earnedInstanceStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_earnedInstanceStore);
  return (ACHEarnedInstanceStore *)WeakRetained;
}

- (void)setEarnedInstanceStore:(id)a3
{
}

- (ACHMonthlyChallengeDataSource)monthlyDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_monthlyDataSource);
  return (ACHMonthlyChallengeDataSource *)WeakRetained;
}

- (void)setMonthlyDataSource:(id)a3
{
}

- (unsigned)creatorDevice
{
  return self->_creatorDevice;
}

- (void)setCreatorDevice:(unsigned __int8)a3
{
  self->_creatorDevice = a3;
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
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

- (ACHCurrentActivitySummaryQuery)summaryQuery
{
  return self->_summaryQuery;
}

- (void)setSummaryQuery:(id)a3
{
}

- (HKAnchoredObjectQuery)workoutQuery
{
  return self->_workoutQuery;
}

- (void)setWorkoutQuery:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutQuery, 0);
  objc_storeStrong((id *)&self->_summaryQuery, 0);
  objc_storeStrong((id *)&self->_overrideIsAppleWatch, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_destroyWeak((id *)&self->_monthlyDataSource);
  objc_destroyWeak((id *)&self->_earnedInstanceStore);
  objc_destroyWeak((id *)&self->_templateStore);
  objc_destroyWeak((id *)&self->_progressEngine);
  objc_destroyWeak((id *)&self->_engine);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

- (void)earnedInstancesForHistoricalInterval:(uint64_t)a1 databaseContext:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21F5DA000, a2, OS_LOG_TYPE_ERROR, "MonthlyChallengeAwardingSource historical evaluation transaction error: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_earnedDateComponentsForTemplate:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 uniqueName];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_21F5DA000, a2, OS_LOG_TYPE_ERROR, "[Earned Instance Date: %@] Template is invalid, skipping search.", (uint8_t *)&v4, 0xCu);
}

@end