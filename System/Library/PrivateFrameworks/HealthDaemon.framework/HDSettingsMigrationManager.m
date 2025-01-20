@interface HDSettingsMigrationManager
- (HDSettingsMigrationManager)initWithProfile:(id)a3 identifier:(id)a4 currentMigrationVersion:(int64_t)a5 migrationSteps:(id)a6 delegate:(id)a7 loggingCategory:(id)a8;
- (HDSettingsMigrationManager)initWithProfile:(id)a3 identifier:(id)a4 currentMigrationVersion:(int64_t)a5 migrationSteps:(id)a6 delegate:(id)a7 migrationVersionDefaults:(id)a8 lastMigratedVersionKey:(id)a9 loggingCategory:(id)a10;
- (HDSettingsMigrationManagerDelegate)delegate;
- (NSString)description;
- (void)_queue_performMigrationFromCurrentMigrationVersion:(int64_t)a3;
- (void)daemonReady:(id)a3;
- (void)profileDidBecomeReady:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation HDSettingsMigrationManager

- (HDSettingsMigrationManager)initWithProfile:(id)a3 identifier:(id)a4 currentMigrationVersion:(int64_t)a5 migrationSteps:(id)a6 delegate:(id)a7 loggingCategory:(id)a8
{
  v14 = (objc_class *)MEMORY[0x1E4F1CB18];
  id v15 = a8;
  id v16 = a7;
  id v17 = a6;
  id v18 = a4;
  id v19 = a3;
  v20 = (void *)[[v14 alloc] initWithSuiteName:@"com.apple.private.health.settings-migration"];
  v21 = [NSString stringWithFormat:@"HDSettingsMigrationManager_LastCompletedVersion_%@", v18];
  v22 = [(HDSettingsMigrationManager *)self initWithProfile:v19 identifier:v18 currentMigrationVersion:a5 migrationSteps:v17 delegate:v16 migrationVersionDefaults:v20 lastMigratedVersionKey:v21 loggingCategory:v15];

  return v22;
}

- (HDSettingsMigrationManager)initWithProfile:(id)a3 identifier:(id)a4 currentMigrationVersion:(int64_t)a5 migrationSteps:(id)a6 delegate:(id)a7 migrationVersionDefaults:(id)a8 lastMigratedVersionKey:(id)a9 loggingCategory:(id)a10
{
  id obj = a3;
  id v16 = a4;
  id v27 = a6;
  id v17 = a7;
  id v26 = a8;
  id v25 = a9;
  id v18 = a10;
  v29.receiver = self;
  v29.super_class = (Class)HDSettingsMigrationManager;
  id v19 = [(HDSettingsMigrationManager *)&v29 init];
  v20 = v19;
  if (v19)
  {
    objc_storeWeak((id *)&v19->_profile, obj);
    objc_storeStrong((id *)&v20->_identifier, a4);
    v20->_currentMigrationVersion = a5;
    objc_storeStrong((id *)&v20->_migrationSteps, a6);
    objc_storeWeak((id *)&v20->_delegate, v17);
    objc_storeStrong((id *)&v20->_migrationVersionDefaults, a8);
    objc_storeStrong((id *)&v20->_lastMigratedVersionKey, a9);
    objc_storeStrong((id *)&v20->_loggingCategory, a10);
    uint64_t v21 = HKCreateSerialDispatchQueue();
    queue = v20->_queue;
    v20->_queue = (OS_dispatch_queue *)v21;

    id WeakRetained = objc_loadWeakRetained((id *)&v20->_profile);
    [WeakRetained registerProfileReadyObserver:v20 queue:v20->_queue];
  }
  return v20;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@:%@>", objc_opt_class(), self->_identifier];
}

- (void)profileDidBecomeReady:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  id v6 = [v5 daemon];

  [v6 registerDaemonReadyObserver:self queue:self->_queue];
}

- (void)daemonReady:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v4 = [(NSUserDefaults *)self->_migrationVersionDefaults hk_safeNumberIfExistsForKeyPath:self->_lastMigratedVersionKey error:0];
  int64_t currentMigrationVersion = self->_currentMigrationVersion;
  if (currentMigrationVersion <= [v4 integerValue])
  {
    _HKInitializeLogging();
    loggingCategory = self->_loggingCategory;
    if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v15 = self;
      __int16 v16 = 2114;
      uint64_t v17 = (uint64_t)v4;
      _os_log_impl(&dword_1BCB7D000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@] Current migration version: %{public}@, no migration needed", buf, 0x16u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained settingsMigrationManagerDidCompleteMigration:self didRunMigrationSteps:0];
  }
  else
  {
    if (v4) {
      uint64_t v6 = [v4 integerValue];
    }
    else {
      uint64_t v6 = -1;
    }
    _HKInitializeLogging();
    v9 = self->_loggingCategory;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v15 = self;
      __int16 v16 = 2050;
      uint64_t v17 = v6;
      _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Current migration version: %{public}ld, scheduling migration", buf, 0x16u);
    }
    id v10 = objc_loadWeakRetained((id *)&self->_profile);
    v11 = [v10 database];
    queue = self->_queue;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __42__HDSettingsMigrationManager_daemonReady___block_invoke;
    v13[3] = &unk_1E62F3198;
    v13[4] = self;
    v13[5] = v6;
    [v11 performWhenDataProtectedByFirstUnlockIsAvailableOnQueue:queue block:v13];
  }
}

void __42__HDSettingsMigrationManager_daemonReady___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  v3 = [WeakRetained daemon];
  v4 = [v3 maintenanceWorkCoordinator];
  id v5 = [*(id *)(a1 + 32) description];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(v6 + 64);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__HDSettingsMigrationManager_daemonReady___block_invoke_2;
  v10[3] = &unk_1E62F3198;
  uint64_t v8 = *(void *)(a1 + 40);
  v10[4] = v6;
  v10[5] = v8;
  v9 = +[HDMaintenanceOperation maintenanceOperationWithName:v5 queue:v7 synchronousBlock:v10];
  [v4 enqueueMaintenanceOperation:v9];
}

uint64_t __42__HDSettingsMigrationManager_daemonReady___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_performMigrationFromCurrentMigrationVersion:", *(void *)(a1 + 40));
}

- (void)_queue_performMigrationFromCurrentMigrationVersion:(int64_t)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = self->_migrationSteps;
  uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        int64_t v10 = [v9 migrationVersion];
        _HKInitializeLogging();
        loggingCategory = self->_loggingCategory;
        BOOL v12 = os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT);
        if (v10 <= a3)
        {
          if (v12)
          {
            *(_DWORD *)buf = 138543618;
            objc_super v29 = self;
            __int16 v30 = 2114;
            v31 = v9;
            _os_log_impl(&dword_1BCB7D000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping migration step as it has already occurred: %{public}@", buf, 0x16u);
          }
        }
        else
        {
          if (v12)
          {
            *(_DWORD *)buf = 138543618;
            objc_super v29 = self;
            __int16 v30 = 2114;
            v31 = v9;
            _os_log_impl(&dword_1BCB7D000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@] Performing migration step: %{public}@", buf, 0x16u);
          }
          id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
          id v23 = 0;
          char v14 = [v9 performStepWithProfile:WeakRetained error:&v23];
          id v15 = v23;

          if ((v14 & 1) == 0)
          {
            _HKInitializeLogging();
            v20 = self->_loggingCategory;
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543874;
              objc_super v29 = self;
              __int16 v30 = 2114;
              v31 = v9;
              __int16 v32 = 2114;
              id v33 = v15;
              _os_log_error_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_ERROR, "[%{public}@] Error performing step %{public}@: %{public}@", buf, 0x20u);
            }

            uint64_t v19 = 0;
            goto LABEL_21;
          }
          migrationVersionDefaults = self->_migrationVersionDefaults;
          uint64_t v17 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "migrationVersion"));
          [(NSUserDefaults *)migrationVersionDefaults setObject:v17 forKey:self->_lastMigratedVersionKey];

          _HKInitializeLogging();
          uint64_t v18 = self->_loggingCategory;
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            objc_super v29 = self;
            __int16 v30 = 2114;
            v31 = v9;
            _os_log_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Completed migration step: %{public}@", buf, 0x16u);
          }
        }
      }
      uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v24 objects:v34 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v19 = 1;
LABEL_21:

  id v21 = objc_loadWeakRetained((id *)&self->_delegate);
  [v21 settingsMigrationManagerDidCompleteMigration:self didRunMigrationSteps:v19];
}

- (HDSettingsMigrationManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HDSettingsMigrationManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_loggingCategory, 0);
  objc_storeStrong((id *)&self->_lastMigratedVersionKey, 0);
  objc_storeStrong((id *)&self->_migrationVersionDefaults, 0);
  objc_storeStrong((id *)&self->_migrationSteps, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end