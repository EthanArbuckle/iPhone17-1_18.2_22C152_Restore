@interface HDDatabasePruningCoordinator
+ (void)registerDisabledPeriodicActivitiesForUnsupportedDaemon:(id)a3;
- (HDDatabasePruningCoordinator)initWithDaemon:(id)a3;
- (id)diagnosticDescription;
- (void)dealloc;
- (void)performPeriodicActivity:(id)a3 completion:(id)a4;
- (void)periodicActivity:(id)a3 configureXPCActivityCriteria:(id)a4;
- (void)profileDidBecomeReady:(id)a3;
@end

@implementation HDDatabasePruningCoordinator

- (HDDatabasePruningCoordinator)initWithDaemon:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDDatabasePruningCoordinator;
  v5 = [(HDDatabasePruningCoordinator *)&v11 init];
  v6 = v5;
  if (v5)
  {
    id v7 = objc_storeWeak((id *)&v5->_daemon, v4);
    v8 = [v4 primaryProfile];
    [v8 registerProfileReadyObserver:v6 queue:0];

    v9 = [MEMORY[0x1E4F65CF8] sharedDiagnosticManager];
    [v9 addObject:v6];
  }
  return v6;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F65CF8] sharedDiagnosticManager];
  [v3 removeObject:self];

  v4.receiver = self;
  v4.super_class = (Class)HDDatabasePruningCoordinator;
  [(HDDatabasePruningCoordinator *)&v4 dealloc];
}

- (void)profileDidBecomeReady:(id)a3
{
  objc_super v4 = [HDPeriodicActivity alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  v5 = [WeakRetained primaryProfile];
  v6 = HKLogInfrastructure();
  id v7 = [(HDPeriodicActivity *)v4 initWithProfile:v5 name:@"com.apple.healthd.prune-database" interval:self delegate:v6 loggingCategory:28800.0];
  activity = self->_activity;
  self->_activity = v7;
}

+ (void)registerDisabledPeriodicActivitiesForUnsupportedDaemon:(id)a3
{
  HKLogInfrastructure();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  +[HDPeriodicActivity registerDisabledPeriodicActivityWithName:@"com.apple.healthd.prune-database" loggingCategory:v3];
}

- (void)periodicActivity:(id)a3 configureXPCActivityCriteria:(id)a4
{
  v5 = (const char *)*MEMORY[0x1E4F14138];
  xpc_object_t xdict = a4;
  xpc_dictionary_set_BOOL(xdict, v5, 1);
  xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142D0]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  id v7 = [WeakRetained behavior];
  int v8 = [v7 isAppleWatch];

  v9 = (const char **)MEMORY[0x1E4F14310];
  if (!v8) {
    v9 = (const char **)MEMORY[0x1E4F14318];
  }
  xpc_dictionary_set_BOOL(xdict, *v9, 1);
}

- (void)performPeriodicActivity:(id)a3 completion:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  if ([v6 BOOLForKey:@"HDPPTTestRunning"])
  {
    (*((void (**)(id, void, void, double))v5 + 2))(v5, 0, 0, 0.0);
  }
  else
  {
    v31 = v6;
    id v7 = +[HKDaemonTransaction transactionWithOwner:self activityName:@"pruneDatabase"];
    p_daemon = &self->_daemon;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
    v29 = [WeakRetained profileManager];
    v9 = [v29 allProfileIdentifiers];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __67__HDDatabasePruningCoordinator_performPeriodicActivity_completion___block_invoke;
    v36[3] = &unk_1E62F70B0;
    id v37 = v7;
    id v38 = v5;
    id v10 = v7;
    id v11 = v9;
    v12 = v36;
    if (self)
    {
      id v28 = v10;
      id v13 = objc_alloc_init(MEMORY[0x1E4F65D90]);
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __100__HDDatabasePruningCoordinator__pruneProfilesWithIdentifiers_takeAccessibilityAssertion_completion___block_invoke;
      v45[3] = &unk_1E62F95A8;
      v45[4] = self;
      v26 = v12;
      v46 = v12;
      [v13 setDidFinish:v45];
      v33 = v13;
      [v13 beginTask];
      id v14 = objc_loadWeakRetained((id *)&self->_daemon);
      v35 = [v14 profileManager];

      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v27 = v11;
      id obj = v11;
      uint64_t v15 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v34 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v42 != v34) {
              objc_enumerationMutation(obj);
            }
            uint64_t v18 = *(void *)(*((void *)&v41 + 1) + 8 * i);
            v19 = [v35 profileForIdentifier:v18];
            if (v19)
            {
              _HKInitializeLogging();
              v20 = *MEMORY[0x1E4F29F28];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                uint64_t v48 = v18;
                _os_log_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_DEFAULT, "Pruning database for profile %{public}@", buf, 0xCu);
              }
              v21 = [v19 attachmentManager];
              [v21 runMaintenanceOperationIfNeeded];

              [v33 beginTask];
              v22 = [[HDDatabasePruningTask alloc] initWithProfile:v19];
              id v23 = objc_loadWeakRetained((id *)p_daemon);
              v24 = [v23 maintenanceWorkCoordinator];
              v25 = [MEMORY[0x1E4F1C9C8] date];
              v39[0] = MEMORY[0x1E4F143A8];
              v39[1] = 3221225472;
              v39[2] = __100__HDDatabasePruningCoordinator__pruneProfilesWithIdentifiers_takeAccessibilityAssertion_completion___block_invoke_299;
              v39[3] = &unk_1E62F5D48;
              v39[4] = v18;
              id v40 = v33;
              [(HDDatabasePruningTask *)v22 enqueueMaintenanceOperationOnCoordinator:v24 takeAccessibilityAssertion:1 nowDate:v25 completion:v39];
            }
          }
          uint64_t v16 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
        }
        while (v16);
      }

      [v33 finishTask];
      id v11 = v27;
      id v10 = v28;
      v12 = v26;
    }

    v6 = v31;
  }
}

void __67__HDDatabasePruningCoordinator_performPeriodicActivity_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  objc_super v4 = *(void **)(a1 + 32);
  id v5 = a3;
  [v4 invalidate];
  (*(void (**)(double))(*(void *)(a1 + 40) + 16))(0.0);
}

void __100__HDDatabasePruningCoordinator__pruneProfilesWithIdentifiers_takeAccessibilityAssertion_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = (void *)MEMORY[0x1E4F1C9C8];
  id v8 = a4;
  v9 = [v7 now];
  id v10 = v9;
  if (v6)
  {
    id v11 = (void *)MEMORY[0x1E4F1CB18];
    id v12 = v9;
    id v13 = [v11 standardUserDefaults];
    [v13 setObject:v12 forKey:@"HDDatabasePruningLastAttemptDateKey"];

    id v14 = [NSNumber numberWithBool:a3];
    [v13 setObject:v14 forKey:@"HDDatabasePruningCompletedKey"];
  }
  uint64_t v15 = *(void *)(a1 + 40);
  id v16 = [v8 firstObject];

  (*(void (**)(uint64_t, uint64_t, id))(v15 + 16))(v15, a3, v16);
}

uint64_t __100__HDDatabasePruningCoordinator__pruneProfilesWithIdentifiers_takeAccessibilityAssertion_completion___block_invoke_299(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v2 = *MEMORY[0x1E4F29F28];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1BCB7D000, v2, OS_LOG_TYPE_DEFAULT, "Finished pruning database for profile %{public}@", (uint8_t *)&v5, 0xCu);
  }
  return [*(id *)(a1 + 40) finishTask];
}

- (id)diagnosticDescription
{
  v2 = "in";
  if (self)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    objc_super v4 = [v3 objectForKey:@"HDDatabasePruningLastAttemptDateKey"];
    int v5 = [v3 objectForKey:@"HDDatabasePruningCompletedKey"];
    int v6 = [v5 BOOLValue];

    if (v6) {
      v2 = "";
    }
  }
  else
  {
    objc_super v4 = 0;
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v8 = HKDiagnosticStringFromDate();
  [v7 appendFormat:@"Last attempt: %@ (%scomplete)", v8, v2];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);

  objc_destroyWeak((id *)&self->_daemon);
}

@end