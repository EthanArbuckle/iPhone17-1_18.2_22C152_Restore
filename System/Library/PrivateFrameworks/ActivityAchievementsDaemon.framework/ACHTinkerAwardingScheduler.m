@interface ACHTinkerAwardingScheduler
- (ACHAwardsKeyValueClient)keyValueClient;
- (ACHDataStore)dataStore;
- (ACHDatabaseAssertionClient)assertionClient;
- (ACHEarnedInstanceAwardingEngine)awardingEngine;
- (ACHEarnedInstanceStore)earnedInstanceStore;
- (ACHTemplateStore)templateStore;
- (ACHTinkerAwardingScheduler)initWithHealthStore:(id)a3 assertionClient:(id)a4 dataStore:(id)a5 earnedInstanceStore:(id)a6 templateStore:(id)a7 awardingEngine:(id)a8;
- (ACHTinkerAwardingScheduler)initWithProfile:(id)a3 dataStore:(id)a4 earnedInstanceStore:(id)a5 templateStore:(id)a6 awardingEngine:(id)a7;
- (ACHXPCScheduler)xpcScheduler;
- (BOOL)_didRunToday;
- (BOOL)_shouldRunImmediatelyOnTemplateLoad;
- (BOOL)dataStoreIsLoaded;
- (BOOL)maintenanceTaskScheduled;
- (BOOL)periodicActivityRequiresProtectedData:(id)a3;
- (BOOL)shouldRetryEarnedInstanceDeletion;
- (BOOL)shouldRunImmediatelyOnDataStoreLoad;
- (HDKeyValueDomain)localKeyValueDomain;
- (HDMaintenanceOperation)maintenanceOperation;
- (HDPeriodicActivity)scheduler;
- (HDProfile)profile;
- (HKHealthStore)healthStore;
- (HKKeyValueDomain)localKeyValueHSDomain;
- (NSCalendar)calendar;
- (NSDate)lastSuccessfulRunDate;
- (NSMutableArray)awardEvaluationCompletionBlocks;
- (NSNumber)coalescingDelayOverride;
- (NSNumber)forceActivityAppInstalled;
- (OS_dispatch_queue)awardingEvaluationQueue;
- (OS_dispatch_queue)queue;
- (_HKDelayedOperation)operation;
- (id)_lastSuccessfulRunDateKey;
- (id)diagnosticDescription;
- (void)_client_scheduleMaintenanceTaskForAwardingWithCompletion:(id)a3;
- (void)_daemon_scheduleMaintenanceTaskForAwardingWithCompletion:(id)a3;
- (void)_queue_addAwardingCompletion:(id)a3;
- (void)_queue_callAwardingCompletionsWithSuccess:(BOOL)a3 error:(id)a4;
- (void)_queue_client_performCleanupTasks;
- (void)_queue_client_requestAwardingEvaluation;
- (void)_queue_daemon_performCleanupTasks;
- (void)_queue_daemon_requestAwardingEvaluation;
- (void)_queue_performCleanupTasks;
- (void)_queue_removeMaintenanceOperation;
- (void)_queue_requestAwardingEvaluation;
- (void)_runXPCActivityWithCompletion:(id)a3;
- (void)_startUp;
- (void)_systemTimeZoneDidChange:(id)a3;
- (void)activate;
- (void)addAwardingCompletion:(id)a3;
- (void)clearLastSuccessfulRunDate;
- (void)daemonReady:(id)a3;
- (void)dataStoreDidPopulate:(id)a3;
- (void)overrideCoalescingDelay:(double)a3;
- (void)performPeriodicActivity:(id)a3 completion:(id)a4;
- (void)periodicActivity:(id)a3 configureXPCActivityCriteria:(id)a4;
- (void)requestAwardingEvaluationWithCompletion:(id)a3;
- (void)scheduleMaintenanceTaskForAwardingWithCompletion:(id)a3;
- (void)setAssertionClient:(id)a3;
- (void)setAwardEvaluationCompletionBlocks:(id)a3;
- (void)setAwardingEngine:(id)a3;
- (void)setAwardingEvaluationQueue:(id)a3;
- (void)setCalendar:(id)a3;
- (void)setCoalescingDelayOverride:(id)a3;
- (void)setDataStore:(id)a3;
- (void)setDataStoreIsLoaded:(BOOL)a3;
- (void)setEarnedInstanceStore:(id)a3;
- (void)setForceActivityAppInstalled:(id)a3;
- (void)setHealthStore:(id)a3;
- (void)setKeyValueClient:(id)a3;
- (void)setLastSuccessfulRunDate:(id)a3;
- (void)setLocalKeyValueDomain:(id)a3;
- (void)setLocalKeyValueHSDomain:(id)a3;
- (void)setMaintenanceOperation:(id)a3;
- (void)setMaintenanceTaskScheduled:(BOOL)a3;
- (void)setOperation:(id)a3;
- (void)setProfile:(id)a3;
- (void)setQueue:(id)a3;
- (void)setScheduler:(id)a3;
- (void)setShouldRetryEarnedInstanceDeletion:(BOOL)a3;
- (void)setShouldRunImmediatelyOnDataStoreLoad:(BOOL)a3;
- (void)setTemplateStore:(id)a3;
- (void)setXpcScheduler:(id)a3;
- (void)setlastSuccessfulRunDate:(id)a3;
- (void)templateStore:(id)a3 didAddNewTemplates:(id)a4;
- (void)templateStoreDidFinishInitialFetch:(id)a3;
@end

@implementation ACHTinkerAwardingScheduler

- (ACHTinkerAwardingScheduler)initWithHealthStore:(id)a3 assertionClient:(id)a4 dataStore:(id)a5 earnedInstanceStore:(id)a6 templateStore:(id)a7 awardingEngine:(id)a8
{
  id v35 = a3;
  id v34 = a4;
  id v15 = a5;
  id v33 = a6;
  id v16 = a7;
  id v17 = a8;
  v36.receiver = self;
  v36.super_class = (Class)ACHTinkerAwardingScheduler;
  v18 = [(ACHTinkerAwardingScheduler *)&v36 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_healthStore, a3);
    objc_storeStrong((id *)&v19->_assertionClient, a4);
    uint64_t v20 = [v15 keyValueClient];
    keyValueClient = v19->_keyValueClient;
    v19->_keyValueClient = (ACHAwardsKeyValueClient *)v20;

    objc_storeStrong((id *)&v19->_dataStore, a5);
    objc_storeStrong((id *)&v19->_earnedInstanceStore, a6);
    objc_storeStrong((id *)&v19->_templateStore, a7);
    objc_storeStrong((id *)&v19->_awardingEngine, a8);
    *(_WORD *)&v19->_dataStoreIsLoaded = 0;
    uint64_t v22 = HKCreateSerialDispatchQueue();
    queue = v19->_queue;
    v19->_queue = (OS_dispatch_queue *)v22;

    uint64_t v24 = [MEMORY[0x263EFF8F0] autoupdatingCurrentCalendar];
    calendar = v19->_calendar;
    v19->_calendar = (NSCalendar *)v24;

    uint64_t v26 = HKCreateSerialDispatchQueue();
    awardingEvaluationQueue = v19->_awardingEvaluationQueue;
    v19->_awardingEvaluationQueue = (OS_dispatch_queue *)v26;

    v28 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    awardEvaluationCompletionBlocks = v19->_awardEvaluationCompletionBlocks;
    v19->_awardEvaluationCompletionBlocks = v28;

    uint64_t v30 = [objc_alloc(MEMORY[0x263F0A470]) initWithCategory:3 domainName:@"com.apple.ActivityAchievements.TinkerAwardingScheduler" healthStore:v19->_healthStore];
    localKeyValueHSDomain = v19->_localKeyValueHSDomain;
    v19->_localKeyValueHSDomain = (HKKeyValueDomain *)v30;
  }
  return v19;
}

- (ACHTinkerAwardingScheduler)initWithProfile:(id)a3 dataStore:(id)a4 earnedInstanceStore:(id)a5 templateStore:(id)a6 awardingEngine:(id)a7
{
  id v13 = a3;
  id v31 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v32.receiver = self;
  v32.super_class = (Class)ACHTinkerAwardingScheduler;
  id v17 = [(ACHTinkerAwardingScheduler *)&v32 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_profile, a3);
    objc_storeStrong((id *)&v18->_dataStore, a4);
    objc_storeStrong((id *)&v18->_earnedInstanceStore, a5);
    objc_storeStrong((id *)&v18->_templateStore, a6);
    objc_storeStrong((id *)&v18->_awardingEngine, a7);
    uint64_t v19 = HKCreateSerialDispatchQueue();
    queue = v18->_queue;
    v18->_queue = (OS_dispatch_queue *)v19;

    uint64_t v21 = [MEMORY[0x263EFF8F0] autoupdatingCurrentCalendar];
    calendar = v18->_calendar;
    v18->_calendar = (NSCalendar *)v21;

    uint64_t v23 = HKCreateSerialDispatchQueue();
    awardingEvaluationQueue = v18->_awardingEvaluationQueue;
    v18->_awardingEvaluationQueue = (OS_dispatch_queue *)v23;

    v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    awardEvaluationCompletionBlocks = v18->_awardEvaluationCompletionBlocks;
    v18->_awardEvaluationCompletionBlocks = v25;

    *(_WORD *)&v18->_dataStoreIsLoaded = 0;
    uint64_t v27 = [objc_alloc(MEMORY[0x263F43218]) initWithCategory:0 domainName:@"com.apple.ActivityAchievements.TinkerAwardingScheduler" profile:v13];
    localKeyValueDomain = v18->_localKeyValueDomain;
    v18->_localKeyValueDomain = (HDKeyValueDomain *)v27;

    v29 = [(HDProfile *)v18->_profile daemon];
    [v29 registerForDaemonReady:v18];
  }
  return v18;
}

- (void)activate
{
  v3 = ACHLogAwardScheduling();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21F5DA000, v3, OS_LOG_TYPE_DEFAULT, "Activating tinker scheduler", v4, 2u);
  }

  [(ACHTinkerAwardingScheduler *)self _startUp];
}

- (void)setlastSuccessfulRunDate:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_lastSuccessfulRunDate, a3);
  v6 = NSNumber;
  [v5 timeIntervalSinceReferenceDate];
  v7 = objc_msgSend(v6, "numberWithDouble:");
  v8 = [(ACHTinkerAwardingScheduler *)self localKeyValueDomain];

  if (v8)
  {
    v9 = [(ACHTinkerAwardingScheduler *)self localKeyValueDomain];
    v10 = [(ACHTinkerAwardingScheduler *)self _lastSuccessfulRunDateKey];
    uint64_t v22 = 0;
    v11 = (id *)&v22;
    v12 = &v22;
  }
  else
  {
    v9 = [(ACHTinkerAwardingScheduler *)self localKeyValueHSDomain];
    v10 = [(ACHTinkerAwardingScheduler *)self _lastSuccessfulRunDateKey];
    uint64_t v21 = 0;
    v11 = (id *)&v21;
    v12 = &v21;
  }
  objc_msgSend(v9, "setNumber:forKey:error:", v7, v10, v12, v21, v22);
  id v13 = *v11;

  if (v13)
  {
    id v14 = ACHLogAwardScheduling();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[ACHCompanionAwardingScheduler setlastSuccessfulRunDate:]((uint64_t)v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }
}

- (id)_lastSuccessfulRunDateKey
{
  return NSStringFromSelector(sel_lastSuccessfulRunDate);
}

- (NSDate)lastSuccessfulRunDate
{
  lastSuccessfulRunDate = self->_lastSuccessfulRunDate;
  if (!lastSuccessfulRunDate)
  {
    v4 = [(ACHTinkerAwardingScheduler *)self localKeyValueDomain];

    if (v4)
    {
      id v5 = [(ACHTinkerAwardingScheduler *)self localKeyValueDomain];
      v6 = [(ACHTinkerAwardingScheduler *)self _lastSuccessfulRunDateKey];
      uint64_t v22 = 0;
      v7 = (id *)&v22;
      v8 = &v22;
    }
    else
    {
      id v5 = [(ACHTinkerAwardingScheduler *)self localKeyValueHSDomain];
      v6 = [(ACHTinkerAwardingScheduler *)self _lastSuccessfulRunDateKey];
      uint64_t v21 = 0;
      v7 = (id *)&v21;
      v8 = &v21;
    }
    v9 = objc_msgSend(v5, "numberForKey:error:", v6, v8, v21, v22);
    id v10 = *v7;

    if (v10)
    {
      v11 = ACHLogAwardScheduling();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        [(ACHCompanionAwardingScheduler *)(uint64_t)v10 lastSuccessfulRunDate];
      }
    }
    if (v9)
    {
      [v9 doubleValue];
      objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSinceReferenceDate:");
    }
    else
    {
      [MEMORY[0x263EFF910] distantPast];
    }
    uint64_t v18 = (NSDate *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = self->_lastSuccessfulRunDate;
    self->_lastSuccessfulRunDate = v18;

    lastSuccessfulRunDate = self->_lastSuccessfulRunDate;
  }
  return lastSuccessfulRunDate;
}

- (void)clearLastSuccessfulRunDate
{
  lastSuccessfulRunDate = self->_lastSuccessfulRunDate;
  self->_lastSuccessfulRunDate = 0;

  v4 = [(ACHTinkerAwardingScheduler *)self localKeyValueDomain];

  if (v4)
  {
    id v5 = [(ACHTinkerAwardingScheduler *)self localKeyValueDomain];
    v6 = (void *)MEMORY[0x263EFFA08];
    v7 = NSStringFromSelector(sel_lastSuccessfulRunDate);
    v8 = [v6 setWithObject:v7];
    uint64_t v13 = 0;
    [v5 removeValuesForKeys:v8 error:&v13];
  }
  else
  {
    id v12 = [(ACHTinkerAwardingScheduler *)self localKeyValueHSDomain];
    v9 = (void *)MEMORY[0x263EFFA08];
    id v10 = NSStringFromSelector(sel_lastSuccessfulRunDate);
    v11 = [v9 setWithObject:v10];
    [v12 removeValuesForKeys:v11 completion:&__block_literal_global_21];
  }
}

void __56__ACHTinkerAwardingScheduler_clearLastSuccessfulRunDate__block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    id v5 = ACHLogAwardScheduling();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      id v7 = v4;
      _os_log_impl(&dword_21F5DA000, v5, OS_LOG_TYPE_DEFAULT, "Error clearning last run date: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (BOOL)maintenanceTaskScheduled
{
  v3 = [(ACHTinkerAwardingScheduler *)self queue];
  dispatch_assert_queue_V2(v3);

  return self->_maintenanceTaskScheduled;
}

- (void)setMaintenanceTaskScheduled:(BOOL)a3
{
  id v5 = [(ACHTinkerAwardingScheduler *)self queue];
  dispatch_assert_queue_V2(v5);

  self->_maintenanceTaskScheduled = a3;
}

- (void)_systemTimeZoneDidChange:(id)a3
{
  id v4 = [(ACHTinkerAwardingScheduler *)self queue];
  dispatch_assert_queue_not_V2(v4);

  id v5 = [(ACHTinkerAwardingScheduler *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__ACHTinkerAwardingScheduler__systemTimeZoneDidChange___block_invoke;
  block[3] = &unk_264515DB8;
  block[4] = self;
  dispatch_sync(v5, block);
}

void __55__ACHTinkerAwardingScheduler__systemTimeZoneDidChange___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263EFF8F0] autoupdatingCurrentCalendar];
  [*(id *)(a1 + 32) setCalendar:v2];
}

- (void)daemonReady:(id)a3
{
  objc_msgSend(MEMORY[0x263F43498], "sharedDiagnosticManager", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 addObject:self];
}

- (void)_startUp
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__systemTimeZoneDidChange_ name:*MEMORY[0x263EFF5D0] object:0];

  id v4 = [(ACHTinkerAwardingScheduler *)self templateStore];
  [v4 addObserver:self];

  id v5 = [(ACHTinkerAwardingScheduler *)self dataStore];
  [v5 addObserver:self];
}

- (void)templateStoreDidFinishInitialFetch:(id)a3
{
  id v4 = a3;
  id v5 = [(ACHTinkerAwardingScheduler *)self profile];

  if (v5)
  {
    int v6 = ACHLogAwardScheduling();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_21F5DA000, v6, OS_LOG_TYPE_DEFAULT, "Templates are loaded, setting up daily periodic activity for awarding.", (uint8_t *)buf, 2u);
    }

    id v7 = objc_alloc(MEMORY[0x263F432C8]);
    profile = self->_profile;
    double v9 = (double)(uint64_t)*MEMORY[0x263EF81E8];
    id v10 = ACHLogAwardScheduling();
    v11 = (HDPeriodicActivity *)[v7 initWithProfile:profile name:@"com.apple.activity_achievements.tinker_scheduler" interval:self delegate:v10 loggingCategory:v9];
    scheduler = self->_scheduler;
    self->_scheduler = v11;
  }
  else
  {
    objc_initWeak(buf, self);
    uint64_t v13 = [ACHXPCScheduler alloc];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __65__ACHTinkerAwardingScheduler_templateStoreDidFinishInitialFetch___block_invoke;
    v22[3] = &unk_264517820;
    objc_copyWeak(&v23, buf);
    uint64_t v14 = [(ACHXPCScheduler *)v13 initWithName:@"com.apple.activity_achievements.tinker_scheduler" performHandler:v22];
    xpcScheduler = self->_xpcScheduler;
    self->_xpcScheduler = v14;

    objc_destroyWeak(&v23);
    objc_destroyWeak(buf);
  }
  uint64_t v16 = [v4 allTemplates];
  if ([v16 count])
  {
    BOOL v17 = [(ACHTinkerAwardingScheduler *)self _shouldRunImmediatelyOnTemplateLoad];

    if (v17)
    {
      uint64_t v18 = ACHLogAwardScheduling();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_21F5DA000, v18, OS_LOG_TYPE_DEFAULT, "Templates are loaded and should run immediately on template load is set, requesting evaluation.", (uint8_t *)buf, 2u);
      }

      [(ACHTinkerAwardingScheduler *)self scheduleMaintenanceTaskForAwardingWithCompletion:0];
      goto LABEL_16;
    }
  }
  else
  {
  }
  uint64_t v19 = [v4 allTemplates];
  uint64_t v20 = [v19 count];

  if (!v20)
  {
    uint64_t v21 = ACHLogAwardScheduling();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_21F5DA000, v21, OS_LOG_TYPE_DEFAULT, "Initial fetch completed, but no templates exist. Will run when new templates are added.", (uint8_t *)buf, 2u);
    }
  }
LABEL_16:
}

void __65__ACHTinkerAwardingScheduler_templateStoreDidFinishInitialFetch___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _runXPCActivityWithCompletion:v3];
}

- (void)templateStore:(id)a3 didAddNewTemplates:(id)a4
{
  if (objc_msgSend(a4, "count", a3))
  {
    [(ACHTinkerAwardingScheduler *)self scheduleMaintenanceTaskForAwardingWithCompletion:0];
  }
}

- (void)_runXPCActivityWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = ACHLogAwardScheduling();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F5DA000, v5, OS_LOG_TYPE_DEFAULT, "Request awarding evaluation for periodic update", buf, 2u);
  }

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__ACHTinkerAwardingScheduler__runXPCActivityWithCompletion___block_invoke;
  v7[3] = &unk_264517848;
  id v8 = v4;
  id v6 = v4;
  [(ACHTinkerAwardingScheduler *)self scheduleMaintenanceTaskForAwardingWithCompletion:v7];
}

void __60__ACHTinkerAwardingScheduler__runXPCActivityWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = ACHLogAwardScheduling();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109378;
    v7[1] = a2;
    __int16 v8 = 2114;
    id v9 = v5;
    _os_log_impl(&dword_21F5DA000, v6, OS_LOG_TYPE_DEFAULT, "Periodic activity awarding evaluation finished with success=%d, error=%{public}@", (uint8_t *)v7, 0x12u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)periodicActivity:(id)a3 configureXPCActivityCriteria:(id)a4
{
  id v4 = (const char *)*MEMORY[0x263EF8180];
  xpc_object_t xdict = a4;
  xpc_dictionary_set_BOOL(xdict, v4, 1);
  xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x263EF8280], (const char *)*MEMORY[0x263EF8288]);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x263EF82A8], 1);
}

- (void)performPeriodicActivity:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = ACHLogAwardScheduling();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F5DA000, v6, OS_LOG_TYPE_DEFAULT, "XPC requested tinker awarding run", buf, 2u);
  }

  id v7 = [(ACHTinkerAwardingScheduler *)self queue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __65__ACHTinkerAwardingScheduler_performPeriodicActivity_completion___block_invoke;
  v9[3] = &unk_264517070;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(v7, v9);
}

void __65__ACHTinkerAwardingScheduler_performPeriodicActivity_completion___block_invoke(uint64_t a1)
{
  id v2 = ACHLogAwardScheduling();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F5DA000, v2, OS_LOG_TYPE_DEFAULT, "Request awarding evaluation for periodic update", buf, 2u);
  }

  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __65__ACHTinkerAwardingScheduler_performPeriodicActivity_completion___block_invoke_309;
  v4[3] = &unk_264517848;
  id v3 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [v3 scheduleMaintenanceTaskForAwardingWithCompletion:v4];
}

void __65__ACHTinkerAwardingScheduler_performPeriodicActivity_completion___block_invoke_309(uint64_t a1, int a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = ACHLogAwardScheduling();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109378;
    v7[1] = a2;
    __int16 v8 = 2114;
    id v9 = v5;
    _os_log_impl(&dword_21F5DA000, v6, OS_LOG_TYPE_DEFAULT, "Periodic activity awarding evaluation finished with success=%d, error=%{public}@", (uint8_t *)v7, 0x12u);
  }

  (*(void (**)(double))(*(void *)(a1 + 32) + 16))(3600.0);
}

- (BOOL)periodicActivityRequiresProtectedData:(id)a3
{
  return 1;
}

- (id)diagnosticDescription
{
  return @"Tinker Awarding Scheduler";
}

- (void)requestAwardingEvaluationWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = ACHLogAwardScheduling();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F5DA000, v5, OS_LOG_TYPE_DEFAULT, "Awarding evaluation requested", buf, 2u);
  }

  id v6 = [(ACHTinkerAwardingScheduler *)self healthStore];

  if (v6)
  {
    [(ACHTinkerAwardingScheduler *)self _client_scheduleMaintenanceTaskForAwardingWithCompletion:v4];
  }
  else
  {
    id v7 = [(ACHTinkerAwardingScheduler *)self queue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __70__ACHTinkerAwardingScheduler_requestAwardingEvaluationWithCompletion___block_invoke;
    v8[3] = &unk_264517070;
    v8[4] = self;
    id v9 = v4;
    dispatch_async(v7, v8);
  }
}

void __70__ACHTinkerAwardingScheduler_requestAwardingEvaluationWithCompletion___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __70__ACHTinkerAwardingScheduler_requestAwardingEvaluationWithCompletion___block_invoke_2;
  v3[3] = &unk_264517870;
  objc_copyWeak(&v5, &location);
  id v4 = *(id *)(a1 + 40);
  id v2 = (void *)MEMORY[0x223C507A0](v3);
  objc_msgSend(*(id *)(a1 + 32), "_queue_addAwardingCompletion:", v2);
  objc_msgSend(*(id *)(a1 + 32), "_queue_requestAwardingEvaluation");

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __70__ACHTinkerAwardingScheduler_requestAwardingEvaluationWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = [MEMORY[0x263EFF910] date];
  [WeakRetained setLastSuccessfulRunDate:v6];

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);
  }
}

- (void)scheduleMaintenanceTaskForAwardingWithCompletion:(id)a3
{
  id v5 = a3;
  id v4 = [(ACHTinkerAwardingScheduler *)self healthStore];

  if (v4) {
    [(ACHTinkerAwardingScheduler *)self _client_scheduleMaintenanceTaskForAwardingWithCompletion:v5];
  }
  else {
    [(ACHTinkerAwardingScheduler *)self _daemon_scheduleMaintenanceTaskForAwardingWithCompletion:v5];
  }
}

- (void)_client_scheduleMaintenanceTaskForAwardingWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = ACHLogAwardScheduling();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_21F5DA000, v5, OS_LOG_TYPE_DEFAULT, "Running awarding...", (uint8_t *)buf, 2u);
  }

  id v6 = [(ACHTinkerAwardingScheduler *)self queue];
  dispatch_assert_queue_not_V2(v6);

  objc_initWeak(buf, self);
  uint64_t v7 = [(ACHTinkerAwardingScheduler *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __87__ACHTinkerAwardingScheduler__client_scheduleMaintenanceTaskForAwardingWithCompletion___block_invoke;
  block[3] = &unk_264517A00;
  objc_copyWeak(&v11, buf);
  block[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_sync(v7, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(buf);
}

void __87__ACHTinkerAwardingScheduler__client_scheduleMaintenanceTaskForAwardingWithCompletion___block_invoke(id *a1)
{
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __87__ACHTinkerAwardingScheduler__client_scheduleMaintenanceTaskForAwardingWithCompletion___block_invoke_2;
  v8[3] = &unk_264517870;
  id v2 = a1 + 6;
  objc_copyWeak(&v10, a1 + 6);
  id v9 = a1[5];
  id v3 = (void *)MEMORY[0x223C507A0](v8);
  objc_msgSend(a1[4], "_queue_addAwardingCompletion:", v3);
  id WeakRetained = objc_loadWeakRetained(v2);
  char v5 = [WeakRetained maintenanceTaskScheduled];

  if (v5)
  {
    id v6 = ACHLogAwardScheduling();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_21F5DA000, v6, OS_LOG_TYPE_DEFAULT, "Task already running, only adding an awarding completion handler.", v7, 2u);
    }
  }
  else
  {
    id v6 = objc_loadWeakRetained(v2);
    [v6 _queue_requestAwardingEvaluation];
  }

  objc_destroyWeak(&v10);
}

void __87__ACHTinkerAwardingScheduler__client_scheduleMaintenanceTaskForAwardingWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = [MEMORY[0x263EFF910] date];
  [WeakRetained setLastSuccessfulRunDate:v6];

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v10);
  }
  if (a2)
  {
    id v8 = objc_loadWeakRetained((id *)(a1 + 40));
    id v9 = [MEMORY[0x263EFF910] date];
    [v8 setlastSuccessfulRunDate:v9];
  }
}

- (void)_daemon_scheduleMaintenanceTaskForAwardingWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  char v5 = [(ACHTinkerAwardingScheduler *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  _DWORD v7[2] = __87__ACHTinkerAwardingScheduler__daemon_scheduleMaintenanceTaskForAwardingWithCompletion___block_invoke;
  v7[3] = &unk_264517938;
  void v7[4] = self;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __87__ACHTinkerAwardingScheduler__daemon_scheduleMaintenanceTaskForAwardingWithCompletion___block_invoke(id *a1)
{
  id v2 = [a1[4] maintenanceOperation];

  if (v2)
  {
    objc_msgSend(a1[4], "_queue_addAwardingCompletion:", a1[5]);
    id v3 = ACHLogAwardScheduling();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F5DA000, v3, OS_LOG_TYPE_DEFAULT, "Maintenance operation already scheduled. Skipping enqueueing another one.", buf, 2u);
    }
  }
  else
  {
    id v4 = ACHLogAwardScheduling();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F5DA000, v4, OS_LOG_TYPE_DEFAULT, "Creating maintenance operation for awarding for periodic running", buf, 2u);
    }

    char v5 = (void *)MEMORY[0x263F43248];
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __87__ACHTinkerAwardingScheduler__daemon_scheduleMaintenanceTaskForAwardingWithCompletion___block_invoke_317;
    uint64_t v14 = &unk_264517910;
    objc_copyWeak(&v16, a1 + 6);
    id v15 = a1[5];
    id v6 = [v5 maintenanceOperationWithName:@"com.apple.ActivityAchievements.TinkerRun" asynchronousBlock:&v11];
    objc_msgSend(a1[4], "setMaintenanceOperation:", v6, v11, v12, v13, v14);

    uint64_t v7 = [a1[4] profile];
    id v8 = [v7 daemon];
    id v9 = [v8 maintenanceWorkCoordinator];
    id v10 = [a1[4] maintenanceOperation];
    [v9 enqueueMaintenanceOperation:v10];

    objc_destroyWeak(&v16);
  }
}

void __87__ACHTinkerAwardingScheduler__daemon_scheduleMaintenanceTaskForAwardingWithCompletion___block_invoke_317(uint64_t a1, void *a2)
{
  id v3 = a2;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __87__ACHTinkerAwardingScheduler__daemon_scheduleMaintenanceTaskForAwardingWithCompletion___block_invoke_2;
  v12[3] = &unk_2645178E8;
  objc_copyWeak(&v15, (id *)(a1 + 40));
  id v13 = *(id *)(a1 + 32);
  id v4 = (void (**)(void))v3;
  id v14 = v4;
  char v5 = (void *)MEMORY[0x223C507A0](v12);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = [WeakRetained queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __87__ACHTinkerAwardingScheduler__daemon_scheduleMaintenanceTaskForAwardingWithCompletion___block_invoke_3;
    block[3] = &unk_264517070;
    block[4] = v7;
    id v11 = v5;
    dispatch_async(v8, block);
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9) {
      (*(void (**)(uint64_t, void, void))(v9 + 16))(v9, 0, 0);
    }
    v4[2](v4);
  }

  objc_destroyWeak(&v15);
}

void __87__ACHTinkerAwardingScheduler__daemon_scheduleMaintenanceTaskForAwardingWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v6 = [WeakRetained queue];
  dispatch_assert_queue_V2(v6);

  objc_msgSend(WeakRetained, "_queue_removeMaintenanceOperation");
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v9);
  }
  if (a2)
  {
    id v8 = [MEMORY[0x263EFF910] date];
    [WeakRetained setlastSuccessfulRunDate:v8];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __87__ACHTinkerAwardingScheduler__daemon_scheduleMaintenanceTaskForAwardingWithCompletion___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_addAwardingCompletion:", *(void *)(a1 + 40));
  id v2 = *(void **)(a1 + 32);
  return objc_msgSend(v2, "_queue_requestAwardingEvaluation");
}

- (void)_queue_removeMaintenanceOperation
{
  id v3 = [(ACHTinkerAwardingScheduler *)self queue];
  dispatch_assert_queue_V2(v3);

  [(ACHTinkerAwardingScheduler *)self setMaintenanceOperation:0];
}

- (void)_queue_requestAwardingEvaluation
{
  id v3 = [(ACHTinkerAwardingScheduler *)self healthStore];

  if (v3)
  {
    [(ACHTinkerAwardingScheduler *)self _queue_client_requestAwardingEvaluation];
  }
  else
  {
    [(ACHTinkerAwardingScheduler *)self _queue_daemon_requestAwardingEvaluation];
  }
}

- (void)_queue_client_requestAwardingEvaluation
{
  id v3 = [(ACHTinkerAwardingScheduler *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(ACHTinkerAwardingScheduler *)self awardingEvaluationQueue];
  dispatch_assert_queue_not_V2(v4);

  if ([(ACHTinkerAwardingScheduler *)self dataStoreIsLoaded])
  {
    [(ACHTinkerAwardingScheduler *)self setShouldRunImmediatelyOnDataStoreLoad:0];
    [(ACHTinkerAwardingScheduler *)self setMaintenanceTaskScheduled:1];
    char v5 = [(ACHTinkerAwardingScheduler *)self awardingEvaluationQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __69__ACHTinkerAwardingScheduler__queue_client_requestAwardingEvaluation__block_invoke;
    block[3] = &unk_264515DB8;
    block[4] = self;
    dispatch_async(v5, block);
  }
  else
  {
    id v6 = ACHLogAwardScheduling();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F5DA000, v6, OS_LOG_TYPE_DEFAULT, "Requesting historical evaluation, but data store isn't loaded yet. Waiting on data store", buf, 2u);
    }

    [(ACHTinkerAwardingScheduler *)self setShouldRunImmediatelyOnDataStoreLoad:1];
  }
}

void __69__ACHTinkerAwardingScheduler__queue_client_requestAwardingEvaluation__block_invoke(uint64_t a1)
{
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = __Block_byref_object_copy__23;
  v6[4] = __Block_byref_object_dispose__23;
  [@"com.apple.activityawardsd.watch.family_setup.full_history_evaluation" UTF8String];
  id v7 = (id)os_transaction_create();
  id v2 = ACHLogAwardScheduling();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F5DA000, v2, OS_LOG_TYPE_DEFAULT, "Requesting historical evaluation from engine", buf, 2u);
  }

  id v3 = [*(id *)(a1 + 32) awardingEngine];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __69__ACHTinkerAwardingScheduler__queue_client_requestAwardingEvaluation__block_invoke_322;
  v4[3] = &unk_264517988;
  void v4[4] = *(void *)(a1 + 32);
  v4[5] = v6;
  [v3 requestHistoricalEvaluationForAllSourcesWithCompletion:v4];

  _Block_object_dispose(v6, 8);
}

void __69__ACHTinkerAwardingScheduler__queue_client_requestAwardingEvaluation__block_invoke_322(uint64_t a1, int a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = ACHLogAwardScheduling();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"NO";
    if (a2) {
      id v7 = @"YES";
    }
    *(_DWORD *)buf = 138543618;
    BOOL v17 = v7;
    __int16 v18 = 2114;
    id v19 = v5;
    _os_log_impl(&dword_21F5DA000, v6, OS_LOG_TYPE_DEFAULT, "Historical evaluation complete with success: %{public}@, error: %{public}@", buf, 0x16u);
  }

  id v8 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__ACHTinkerAwardingScheduler__queue_client_requestAwardingEvaluation__block_invoke_329;
  block[3] = &unk_264517960;
  uint64_t v9 = *(void *)(a1 + 32);
  char v15 = a2;
  block[4] = v9;
  id v14 = v5;
  id v10 = v5;
  dispatch_sync(v8, block);

  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = 0;
}

uint64_t __69__ACHTinkerAwardingScheduler__queue_client_requestAwardingEvaluation__block_invoke_329(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_callAwardingCompletionsWithSuccess:error:", *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 40));
}

- (void)_queue_daemon_requestAwardingEvaluation
{
  id v3 = [(ACHTinkerAwardingScheduler *)self queue];
  dispatch_assert_queue_V2(v3);

  awardingEvaluationQueue = self->_awardingEvaluationQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__ACHTinkerAwardingScheduler__queue_daemon_requestAwardingEvaluation__block_invoke;
  block[3] = &unk_264515DB8;
  block[4] = self;
  dispatch_async(awardingEvaluationQueue, block);
}

void __69__ACHTinkerAwardingScheduler__queue_daemon_requestAwardingEvaluation__block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) profile];
  id v3 = [v2 database];
  id v36 = 0;
  id v4 = +[ACHDatabaseAssertion assertionWithDatabase:v3 identifier:@"Tinker Awarding Scheduler" timeout:&v36 error:60.0];
  id v5 = v36;

  if (v4)
  {
    id v6 = [MEMORY[0x263F431B0] transactionWithOwner:*(void *)(a1 + 32)];
    id v7 = ACHDatabaseContextWithAccessibilityAssertion(v4);
    [v7 setCacheScope:1];
    id v8 = *(void **)(*(void *)(a1 + 32) + 56);
    id v33 = v5;
    int v9 = [v8 clearAllPropertiesWithError:&v33 databaseContext:v7];
    id v10 = v33;

    uint64_t v11 = ACHLogAwardScheduling();
    uint64_t v12 = v11;
    if (!v9 || v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __72__ACHCompanionAwardingScheduler__queue_daemon_requestAwardingEvaluation__block_invoke_cold_1((uint64_t)v10, v12, v19, v20, v21, v22, v23, v24);
      }

      v25 = [*(id *)(a1 + 32) queue];
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __69__ACHTinkerAwardingScheduler__queue_daemon_requestAwardingEvaluation__block_invoke_333;
      v30[3] = &unk_264517960;
      v30[4] = *(void *)(a1 + 32);
      char v32 = v9;
      char v15 = &v31;
      id v31 = v10;
      dispatch_sync(v25, v30);

      [v4 invalidate];
      [v6 invalidate];
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21F5DA000, v12, OS_LOG_TYPE_DEFAULT, "DataStore cleared, requesting historical evaluation from engine", buf, 2u);
      }

      uint64_t v13 = *(void *)(a1 + 32);
      id v14 = *(void **)(v13 + 80);
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __69__ACHTinkerAwardingScheduler__queue_daemon_requestAwardingEvaluation__block_invoke_334;
      v26[3] = &unk_2645179D8;
      v26[4] = v13;
      char v15 = &v27;
      id v16 = v7;
      id v27 = v16;
      id v28 = v4;
      id v29 = v6;
      [v14 requestHistoricalEvaluationForAllSourcesWithDatabaseContext:v16 completion:v26];
    }
  }
  else
  {
    BOOL v17 = ACHLogAwardScheduling();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v38 = v5;
      _os_log_impl(&dword_21F5DA000, v17, OS_LOG_TYPE_DEFAULT, "Failed to get accessibility assertion for 60 seconds with error %{public}@", buf, 0xCu);
    }

    __int16 v18 = [*(id *)(a1 + 32) queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __69__ACHTinkerAwardingScheduler__queue_daemon_requestAwardingEvaluation__block_invoke_331;
    block[3] = &unk_264515DE0;
    block[4] = *(void *)(a1 + 32);
    id v10 = v5;
    id v35 = v10;
    dispatch_sync(v18, block);
  }
}

uint64_t __69__ACHTinkerAwardingScheduler__queue_daemon_requestAwardingEvaluation__block_invoke_331(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_callAwardingCompletionsWithSuccess:error:", 0, *(void *)(a1 + 40));
}

uint64_t __69__ACHTinkerAwardingScheduler__queue_daemon_requestAwardingEvaluation__block_invoke_333(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_callAwardingCompletionsWithSuccess:error:", *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 40));
}

void __69__ACHTinkerAwardingScheduler__queue_daemon_requestAwardingEvaluation__block_invoke_334(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  if (a2)
  {
    id v7 = (void *)v6[7];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __69__ACHTinkerAwardingScheduler__queue_daemon_requestAwardingEvaluation__block_invoke_2;
    v18[3] = &unk_2645179B0;
    v18[4] = v6;
    id v8 = &v19;
    uint64_t v9 = *(void *)(a1 + 40);
    id v19 = *(id *)(a1 + 48);
    id v20 = *(id *)(a1 + 56);
    [v7 commitAllPropertiesToDatabaseWithContext:v9 completion:v18];
  }
  else
  {
    id v10 = [v6 queue];
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __69__ACHTinkerAwardingScheduler__queue_daemon_requestAwardingEvaluation__block_invoke_4;
    id v14 = &unk_264517960;
    uint64_t v15 = *(void *)(a1 + 32);
    char v17 = 0;
    id v8 = &v16;
    id v16 = v5;
    dispatch_sync(v10, &v11);

    objc_msgSend(*(id *)(a1 + 48), "invalidate", v11, v12, v13, v14, v15);
    [*(id *)(a1 + 56) invalidate];
  }
}

void __69__ACHTinkerAwardingScheduler__queue_daemon_requestAwardingEvaluation__block_invoke_2(id *a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = [a1[4] queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__ACHTinkerAwardingScheduler__queue_daemon_requestAwardingEvaluation__block_invoke_3;
  block[3] = &unk_264517960;
  id v7 = a1[4];
  char v11 = a2;
  block[4] = v7;
  id v10 = v5;
  id v8 = v5;
  dispatch_sync(v6, block);

  [a1[5] invalidate];
  [a1[6] invalidate];
}

uint64_t __69__ACHTinkerAwardingScheduler__queue_daemon_requestAwardingEvaluation__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_callAwardingCompletionsWithSuccess:error:", *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 40));
}

uint64_t __69__ACHTinkerAwardingScheduler__queue_daemon_requestAwardingEvaluation__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_callAwardingCompletionsWithSuccess:error:", *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 40));
}

- (void)_queue_performCleanupTasks
{
  id v3 = [(ACHTinkerAwardingScheduler *)self healthStore];

  if (v3)
  {
    [(ACHTinkerAwardingScheduler *)self _queue_client_performCleanupTasks];
  }
  else
  {
    [(ACHTinkerAwardingScheduler *)self _queue_daemon_performCleanupTasks];
  }
}

- (void)_queue_client_performCleanupTasks
{
  id v3 = [ACHEarnedInstanceCleanupUtility alloc];
  id v4 = [(ACHTinkerAwardingScheduler *)self healthStore];
  id v5 = [(ACHTinkerAwardingScheduler *)self keyValueClient];
  id v6 = [(ACHTinkerAwardingScheduler *)self earnedInstanceStore];
  id v7 = [(ACHEarnedInstanceCleanupUtility *)v3 initWithHealthStore:v4 keyValueClient:v5 earnedInstanceStore:v6];

  [(ACHEarnedInstanceCleanupUtility *)v7 performCleanup];
}

- (void)_queue_daemon_performCleanupTasks
{
  id v3 = [ACHEarnedInstanceCleanupUtility alloc];
  id v4 = [(ACHTinkerAwardingScheduler *)self earnedInstanceStore];
  id v5 = [(ACHTinkerAwardingScheduler *)self profile];
  id v6 = [(ACHEarnedInstanceCleanupUtility *)v3 initWithEarnedInstanceStore:v4 profile:v5];

  [(ACHEarnedInstanceCleanupUtility *)v6 performCleanup];
}

- (BOOL)_didRunToday
{
  id v2 = [(ACHTinkerAwardingScheduler *)self lastSuccessfulRunDate];
  id v3 = [MEMORY[0x263EFF910] date];
  [v3 timeIntervalSinceDate:v2];
  BOOL v5 = v4 < 86400.0;

  return v5;
}

- (BOOL)_shouldRunImmediatelyOnTemplateLoad
{
  return ![(ACHTinkerAwardingScheduler *)self _didRunToday];
}

- (void)overrideCoalescingDelay:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(ACHTinkerAwardingScheduler *)self setCoalescingDelayOverride:v4];
}

- (void)addAwardingCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [(ACHTinkerAwardingScheduler *)self queue];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __52__ACHTinkerAwardingScheduler_addAwardingCompletion___block_invoke;
    v6[3] = &unk_264517070;
    v6[4] = self;
    id v7 = v4;
    dispatch_sync(v5, v6);
  }
}

uint64_t __52__ACHTinkerAwardingScheduler_addAwardingCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_addAwardingCompletion:", *(void *)(a1 + 40));
}

- (void)_queue_addAwardingCompletion:(id)a3
{
  id v9 = a3;
  id v4 = [(ACHTinkerAwardingScheduler *)self queue];
  dispatch_assert_queue_V2(v4);

  BOOL v5 = v9;
  if (v9)
  {
    awardEvaluationCompletionBlocks = self->_awardEvaluationCompletionBlocks;
    id v7 = (void *)[v9 copy];
    id v8 = (void *)MEMORY[0x223C507A0]();
    [(NSMutableArray *)awardEvaluationCompletionBlocks addObject:v8];

    BOOL v5 = v9;
  }
}

- (void)_queue_callAwardingCompletionsWithSuccess:(BOOL)a3 error:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = [(ACHTinkerAwardingScheduler *)self queue];
  dispatch_assert_queue_V2(v6);

  [(ACHTinkerAwardingScheduler *)self _queue_performCleanupTasks];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = self->_awardEvaluationCompletionBlocks;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v14 + 1) + 8 * v11++) + 16))();
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  uint64_t v12 = ACHLogAwardScheduling();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_21F5DA000, v12, OS_LOG_TYPE_DEFAULT, "Calling run completion handlers", v13, 2u);
  }

  [(ACHTinkerAwardingScheduler *)self setMaintenanceTaskScheduled:0];
  [(NSMutableArray *)self->_awardEvaluationCompletionBlocks removeAllObjects];
}

- (void)dataStoreDidPopulate:(id)a3
{
  id v4 = [(ACHTinkerAwardingScheduler *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__ACHTinkerAwardingScheduler_dataStoreDidPopulate___block_invoke;
  block[3] = &unk_264515DB8;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __51__ACHTinkerAwardingScheduler_dataStoreDidPopulate___block_invoke(uint64_t a1)
{
  id v2 = ACHLogAwardScheduling();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21F5DA000, v2, OS_LOG_TYPE_DEFAULT, "[ACHTinkerAwardingScheduler] received data store is loaded", v4, 2u);
  }

  [*(id *)(a1 + 32) setDataStoreIsLoaded:1];
  uint64_t result = [*(id *)(a1 + 32) shouldRunImmediatelyOnDataStoreLoad];
  if (result) {
    return objc_msgSend(*(id *)(a1 + 32), "_queue_client_requestAwardingEvaluation");
  }
  return result;
}

- (void)setLastSuccessfulRunDate:(id)a3
{
}

- (BOOL)dataStoreIsLoaded
{
  return self->_dataStoreIsLoaded;
}

- (void)setDataStoreIsLoaded:(BOOL)a3
{
  self->_dataStoreIsLoaded = a3;
}

- (BOOL)shouldRunImmediatelyOnDataStoreLoad
{
  return self->_shouldRunImmediatelyOnDataStoreLoad;
}

- (void)setShouldRunImmediatelyOnDataStoreLoad:(BOOL)a3
{
  self->_shouldRunImmediatelyOnDataStoreLoad = a3;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (ACHDatabaseAssertionClient)assertionClient
{
  return self->_assertionClient;
}

- (void)setAssertionClient:(id)a3
{
}

- (ACHAwardsKeyValueClient)keyValueClient
{
  return self->_keyValueClient;
}

- (void)setKeyValueClient:(id)a3
{
}

- (HDProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
}

- (ACHDataStore)dataStore
{
  return self->_dataStore;
}

- (void)setDataStore:(id)a3
{
}

- (ACHEarnedInstanceStore)earnedInstanceStore
{
  return self->_earnedInstanceStore;
}

- (void)setEarnedInstanceStore:(id)a3
{
}

- (ACHTemplateStore)templateStore
{
  return self->_templateStore;
}

- (void)setTemplateStore:(id)a3
{
}

- (ACHEarnedInstanceAwardingEngine)awardingEngine
{
  return self->_awardingEngine;
}

- (void)setAwardingEngine:(id)a3
{
}

- (HDPeriodicActivity)scheduler
{
  return self->_scheduler;
}

- (void)setScheduler:(id)a3
{
}

- (ACHXPCScheduler)xpcScheduler
{
  return self->_xpcScheduler;
}

- (void)setXpcScheduler:(id)a3
{
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)shouldRetryEarnedInstanceDeletion
{
  return self->_shouldRetryEarnedInstanceDeletion;
}

- (void)setShouldRetryEarnedInstanceDeletion:(BOOL)a3
{
  self->_shouldRetryEarnedInstanceDeletion = a3;
}

- (NSNumber)forceActivityAppInstalled
{
  return self->_forceActivityAppInstalled;
}

- (void)setForceActivityAppInstalled:(id)a3
{
}

- (_HKDelayedOperation)operation
{
  return self->_operation;
}

- (void)setOperation:(id)a3
{
}

- (NSMutableArray)awardEvaluationCompletionBlocks
{
  return self->_awardEvaluationCompletionBlocks;
}

- (void)setAwardEvaluationCompletionBlocks:(id)a3
{
}

- (OS_dispatch_queue)awardingEvaluationQueue
{
  return self->_awardingEvaluationQueue;
}

- (void)setAwardingEvaluationQueue:(id)a3
{
}

- (NSNumber)coalescingDelayOverride
{
  return self->_coalescingDelayOverride;
}

- (void)setCoalescingDelayOverride:(id)a3
{
}

- (HKKeyValueDomain)localKeyValueHSDomain
{
  return self->_localKeyValueHSDomain;
}

- (void)setLocalKeyValueHSDomain:(id)a3
{
}

- (HDKeyValueDomain)localKeyValueDomain
{
  return self->_localKeyValueDomain;
}

- (void)setLocalKeyValueDomain:(id)a3
{
}

- (HDMaintenanceOperation)maintenanceOperation
{
  return self->_maintenanceOperation;
}

- (void)setMaintenanceOperation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maintenanceOperation, 0);
  objc_storeStrong((id *)&self->_localKeyValueDomain, 0);
  objc_storeStrong((id *)&self->_localKeyValueHSDomain, 0);
  objc_storeStrong((id *)&self->_coalescingDelayOverride, 0);
  objc_storeStrong((id *)&self->_awardingEvaluationQueue, 0);
  objc_storeStrong((id *)&self->_awardEvaluationCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_operation, 0);
  objc_storeStrong((id *)&self->_forceActivityAppInstalled, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_xpcScheduler, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_awardingEngine, 0);
  objc_storeStrong((id *)&self->_templateStore, 0);
  objc_storeStrong((id *)&self->_earnedInstanceStore, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_keyValueClient, 0);
  objc_storeStrong((id *)&self->_assertionClient, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_lastSuccessfulRunDate, 0);
}

@end