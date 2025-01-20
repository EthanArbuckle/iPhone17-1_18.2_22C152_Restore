@interface HMDHH2AutoMigrationEligibilityLogEventSubmitter
- (HMDHH2AutoMigrationEligibilityLogEventSubmitter)initWithEligibilityStatusDataSource:(id)a3 analyzerDataSource:(id)a4 workQueue:(id)a5;
- (HMDHH2AutoMigrationEligibilityLogEventSubmitterDataSource)eligibilityStatusDataSource;
- (HMMDateProvider)dateProvider;
- (HMMLogEventSubmitting)logEventSubmitter;
- (NSUserDefaults)userDefaults;
- (OS_dispatch_queue)workQueue;
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
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__HMDHH2AutoMigrationEligibilityLogEventSubmitter_runDailyTask__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __63__HMDHH2AutoMigrationEligibilityLogEventSubmitter_runDailyTask__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) submitHH2AutoMigrationEligibilityStatus];
}

- (void)submitHH2AutoMigrationEligibilityStatus
{
  v9 = [[HMDHH2AutoMigrationEligibilityResult alloc] initWithStatus:2048 iCloudAccountStatus:0 unsupportedDevices:0 hasOnlyEmptyHomes:0 numberOwnedNonEmptyHomes:0 numberUnownedSharedHomes:0 numberOwnedSharedHomes:0];
  v3 = [(HMDHH2AutoMigrationEligibilityLogEventSubmitter *)self userDefaults];
  uint64_t v4 = [v3 BOOLForKey:@"HMDHH2AutoMigrationRunOnCurrentBuildFlagKey"];

  v5 = [(HMDHH2AutoMigrationEligibilityLogEventSubmitter *)self userDefaults];
  uint64_t v6 = [v5 BOOLForKey:@"HMDHH2AutoMigrationRunOnCurrentBuildStartedOnHH1Key"];

  v7 = [[HMDHH2AutoMigrationEligibilityStatusLogEvent alloc] initWithAutoMigrationEligibilityResult:v9 migrationByOwnerManualEligibilityResult:v9 migrationByOwnerAutoEligibilityResult:v9 didRunMigrationTaskOnCurrentBuild:v4 currentBuildStartedOnHH1:v6];
  v8 = [(HMDHH2AutoMigrationEligibilityLogEventSubmitter *)self logEventSubmitter];
  [v8 submitLogEvent:v7];
}

- (HMDHH2AutoMigrationEligibilityLogEventSubmitter)initWithEligibilityStatusDataSource:(id)a3 analyzerDataSource:(id)a4 workQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v27.receiver = self;
  v27.super_class = (Class)HMDHH2AutoMigrationEligibilityLogEventSubmitter;
  v11 = [(HMDHH2AutoMigrationEligibilityLogEventSubmitter *)&v27 init];
  v12 = v11;
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
    v19 = [(NSUserDefaults *)v12->_userDefaults stringForKey:@"HMDHH2AutoMigrationRunOnCurrentBuildSoftwareVersionKey"];
    if (!v19
      || ([v9 currentSoftwareVersion],
          v20 = objc_claimAutoreleasedReturnValue(),
          char v21 = [v19 isEqualToString:v20],
          v20,
          (v21 & 1) == 0))
    {
      v22 = v12->_userDefaults;
      v23 = [v9 currentSoftwareVersion];
      [(NSUserDefaults *)v22 setObject:v23 forKey:@"HMDHH2AutoMigrationRunOnCurrentBuildSoftwareVersionKey"];

      [(NSUserDefaults *)v12->_userDefaults setBool:0 forKey:@"HMDHH2AutoMigrationRunOnCurrentBuildFlagKey"];
      [(NSUserDefaults *)v12->_userDefaults setBool:0 forKey:@"HMDHH2AutoMigrationRunOnCurrentBuildStartedOnHH1Key"];
    }
    v24 = [v9 logEventDispatcher];
    [v24 addObserver:v12 forEventClass:objc_opt_class()];

    v25 = [v9 dailyScheduler];
    [v25 registerDailyTaskRunner:v12];
  }
  return v12;
}

@end