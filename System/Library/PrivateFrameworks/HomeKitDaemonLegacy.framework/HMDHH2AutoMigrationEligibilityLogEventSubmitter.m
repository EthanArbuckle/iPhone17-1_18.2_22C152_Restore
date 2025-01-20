@interface HMDHH2AutoMigrationEligibilityLogEventSubmitter
- (HMDHH2AutoMigrationEligibilityLogEventSubmitter)initWithEligibilityStatusDataSource:(id)a3 analyzerDataSource:(id)a4 workQueue:(id)a5;
- (HMDHH2AutoMigrationEligibilityLogEventSubmitterDataSource)eligibilityStatusDataSource;
- (HMMDateProvider)dateProvider;
- (HMMLogEventSubmitting)logEventSubmitter;
- (NSUserDefaults)userDefaults;
- (OS_dispatch_queue)workQueue;
- (void)didReceiveEventFromDispatcher:(id)a3;
- (void)runDailyTask;
- (void)submitHH2AutoMigrationEligibilityStatus;
@end

@implementation HMDHH2AutoMigrationEligibilityLogEventSubmitter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_destroyWeak((id *)&self->_eligibilityStatusDataSource);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (HMMDateProvider)dateProvider
{
  return self->_dateProvider;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (HMDHH2AutoMigrationEligibilityLogEventSubmitterDataSource)eligibilityStatusDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_eligibilityStatusDataSource);
  return (HMDHH2AutoMigrationEligibilityLogEventSubmitterDataSource *)WeakRetained;
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return self->_logEventSubmitter;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)runDailyTask
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__HMDHH2AutoMigrationEligibilityLogEventSubmitter_runDailyTask__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __63__HMDHH2AutoMigrationEligibilityLogEventSubmitter_runDailyTask__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) submitHH2AutoMigrationEligibilityStatus];
}

- (void)submitHH2AutoMigrationEligibilityStatus
{
  v3 = [(HMDHH2AutoMigrationEligibilityLogEventSubmitter *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__HMDHH2AutoMigrationEligibilityLogEventSubmitter_submitHH2AutoMigrationEligibilityStatus__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v3, block);
}

void __90__HMDHH2AutoMigrationEligibilityLogEventSubmitter_submitHH2AutoMigrationEligibilityStatus__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) eligibilityStatusDataSource];
  v3 = [v2 hh2AutoMigrationEligibilityChecker];

  if (v3)
  {
    v4 = dispatch_group_create();
    dispatch_group_enter(v4);
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__176365;
    v36 = __Block_byref_object_dispose__176366;
    id v37 = 0;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __90__HMDHH2AutoMigrationEligibilityLogEventSubmitter_submitHH2AutoMigrationEligibilityStatus__block_invoke_8;
    v29[3] = &unk_1E6A171F0;
    v31 = &v32;
    v5 = v4;
    v30 = v5;
    [v3 fetchIsCurrentUserEligibleForAutoMigrationWithCompletion:v29];
    dispatch_group_enter(v5);
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__176365;
    v27 = __Block_byref_object_dispose__176366;
    id v28 = 0;
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__176365;
    v21 = __Block_byref_object_dispose__176366;
    id v22 = 0;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __90__HMDHH2AutoMigrationEligibilityLogEventSubmitter_submitHH2AutoMigrationEligibilityStatus__block_invoke_2;
    v13[3] = &unk_1E6A17218;
    v15 = &v23;
    v16 = &v17;
    v6 = v5;
    v14 = v6;
    [v3 fetchIsCurrentUserEligibleForMigrationByOwnerWithCompletion:v13];
    dispatch_time_t v7 = dispatch_time(0, 5000000000);
    dispatch_group_wait(v6, v7);
    v8 = [*(id *)(a1 + 32) userDefaults];
    uint64_t v9 = [v8 BOOLForKey:@"HMDHH2AutoMigrationRunOnCurrentBuildFlagKey"];

    v10 = [HMDHH2AutoMigrationEligibilityStatusLogEvent alloc];
    v11 = [(HMDHH2AutoMigrationEligibilityStatusLogEvent *)v10 initWithAutoMigrationEligibilityResult:v33[5] migrationByOwnerManualEligibilityResult:v24[5] migrationByOwnerAutoEligibilityResult:v18[5] didRunMigrationTaskOnCurrentBuild:v9 currentBuildStartedOnHH1:1];
    v12 = [*(id *)(a1 + 32) logEventSubmitter];
    [v12 submitLogEvent:v11];

    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v23, 8);

    _Block_object_dispose(&v32, 8);
  }
}

void __90__HMDHH2AutoMigrationEligibilityLogEventSubmitter_submitHH2AutoMigrationEligibilityStatus__block_invoke_8(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __90__HMDHH2AutoMigrationEligibilityLogEventSubmitter_submitHH2AutoMigrationEligibilityStatus__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)didReceiveEventFromDispatcher:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __81__HMDHH2AutoMigrationEligibilityLogEventSubmitter_didReceiveEventFromDispatcher___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

void __81__HMDHH2AutoMigrationEligibilityLogEventSubmitter_didReceiveEventFromDispatcher___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v8 = v3;

  id v4 = v8;
  if (v8)
  {
    id v5 = [v8 activityName];
    int v6 = [v5 isEqualToString:@"com.apple.homed.hh2.auto.migration"];

    id v4 = v8;
    if (v6)
    {
      uint64_t v7 = [*(id *)(a1 + 40) userDefaults];
      [v7 setBool:1 forKey:@"HMDHH2AutoMigrationRunOnCurrentBuildFlagKey"];

      id v4 = v8;
    }
  }
}

- (HMDHH2AutoMigrationEligibilityLogEventSubmitter)initWithEligibilityStatusDataSource:(id)a3 analyzerDataSource:(id)a4 workQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v27.receiver = self;
  v27.super_class = (Class)HMDHH2AutoMigrationEligibilityLogEventSubmitter;
  id v11 = [(HMDHH2AutoMigrationEligibilityLogEventSubmitter *)&v27 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_eligibilityStatusDataSource, v8);
    uint64_t v13 = [v9 logEventSubmitter];
    logEventSubmitter = v12->_logEventSubmitter;
    v12->_logEventSubmitter = (HMMLogEventSubmitting *)v13;

    uint64_t v15 = [v9 userDefaults];
    userDefaults = v12->_userDefaults;
    v12->_userDefaults = (NSUserDefaults *)v15;

    uint64_t v17 = [v9 dateProvider];
    dateProvider = v12->_dateProvider;
    v12->_dateProvider = (HMMDateProvider *)v17;

    objc_storeStrong((id *)&v12->_workQueue, a5);
    uint64_t v19 = [(NSUserDefaults *)v12->_userDefaults stringForKey:@"HMDHH2AutoMigrationRunOnCurrentBuildSoftwareVersionKey"];
    if (!v19
      || ([v9 currentSoftwareVersion],
          v20 = objc_claimAutoreleasedReturnValue(),
          char v21 = [v19 isEqualToString:v20],
          v20,
          (v21 & 1) == 0))
    {
      id v22 = v12->_userDefaults;
      uint64_t v23 = [v9 currentSoftwareVersion];
      [(NSUserDefaults *)v22 setObject:v23 forKey:@"HMDHH2AutoMigrationRunOnCurrentBuildSoftwareVersionKey"];

      [(NSUserDefaults *)v12->_userDefaults setBool:0 forKey:@"HMDHH2AutoMigrationRunOnCurrentBuildFlagKey"];
      [(NSUserDefaults *)v12->_userDefaults setBool:1 forKey:@"HMDHH2AutoMigrationRunOnCurrentBuildStartedOnHH1Key"];
    }
    v24 = [v9 logEventDispatcher];
    [v24 addObserver:v12 forEventClass:objc_opt_class()];

    uint64_t v25 = [v9 dailyScheduler];
    [v25 registerDailyTaskRunner:v12];
  }
  return v12;
}

@end