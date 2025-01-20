@interface HDWatchSettingsReconciliationManager
- (HDWatchSettingsReconciliationManager)initWithProfile:(id)a3 userDefaults:(id)a4 managedKeys:(id)a5 debugIdentifier:(id)a6 loggingCategory:(id)a7;
- (HDWatchSettingsReconciliationManagerDelegate)delegate;
- (NSString)description;
- (id)_queue_settingValuesForSettingKeys:(id)a3 error:(id *)a4;
- (void)_queue_applyReconciledValueFromSettingValues:(id)a3 forSettingKeys:(id)a4 completion:(id)a5;
- (void)_queue_reconcileValuesForAllKeys;
- (void)_queue_reconcileValuesForKeys:(id)a3;
- (void)_startKeyValueObserving;
- (void)daemonReady:(id)a3;
- (void)dealloc;
- (void)featureSettingsManager:(id)a3 didUpdateSettingsForFeatureIdentifier:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)profileDidBecomeReady:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation HDWatchSettingsReconciliationManager

- (HDWatchSettingsReconciliationManager)initWithProfile:(id)a3 userDefaults:(id)a4 managedKeys:(id)a5 debugIdentifier:(id)a6 loggingCategory:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v25.receiver = self;
  v25.super_class = (Class)HDWatchSettingsReconciliationManager;
  v17 = [(HDWatchSettingsReconciliationManager *)&v25 init];
  if (v17)
  {
    id v24 = v13;
    if ([v12 profileType] != 1)
    {
      v22 = [MEMORY[0x1E4F28B00] currentHandler];
      [v22 handleFailureInMethod:a2, v17, @"HDWatchSettingsReconciliationManager.m", 44, @"Invalid parameter not satisfying: %@", @"profile.profileType == HKProfileTypePrimary" object file lineNumber description];
    }
    objc_storeWeak((id *)&v17->_profile, v12);
    uint64_t v18 = HKCreateSerialDispatchQueue();
    queue = v17->_queue;
    v17->_queue = (OS_dispatch_queue *)v18;

    objc_storeStrong((id *)&v17->_userDefaults, a4);
    objc_storeStrong((id *)&v17->_managedKeys, a5);
    objc_storeStrong((id *)&v17->_debugIdentifier, a6);
    objc_storeStrong((id *)&v17->_loggingCategory, a7);
    [(HDWatchSettingsReconciliationManager *)v17 _startKeyValueObserving];
    id WeakRetained = objc_loadWeakRetained((id *)&v17->_profile);
    [WeakRetained registerProfileReadyObserver:v17 queue:v17->_queue];

    id v13 = v24;
  }

  return v17;
}

- (void)_startKeyValueObserving
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = self->_managedKeys;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        userDefaults = self->_userDefaults;
        v9 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v7), "defaultsEnabledKey", (void)v10);
        [(NSUserDefaults *)userDefaults addObserver:self forKeyPath:v9 options:3 context:0];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)dealloc
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v3 = self->_managedKeys;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v15 + 1) + 8 * v7);
        id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
        long long v10 = [WeakRetained featureSettingsManager];
        long long v11 = [v8 featureIdentifier];
        [v10 unregisterObserver:self featureIdentifier:v11];

        userDefaults = self->_userDefaults;
        long long v13 = [v8 defaultsEnabledKey];
        [(NSUserDefaults *)userDefaults removeObserver:self forKeyPath:v13];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }

  v14.receiver = self;
  v14.super_class = (Class)HDWatchSettingsReconciliationManager;
  [(HDWatchSettingsReconciliationManager *)&v14 dealloc];
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@:%@>", objc_opt_class(), self->_debugIdentifier];
}

- (void)profileDidBecomeReady:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = self->_managedKeys;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v15 + 1) + 8 * v9);
        id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
        long long v12 = objc_msgSend(WeakRetained, "featureSettingsManager", (void)v15);
        long long v13 = [v10 featureIdentifier];
        [v12 registerObserver:self featureIdentifier:v13 queue:self->_queue];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  objc_super v14 = [v4 daemon];
  [v14 registerDaemonReadyObserver:self queue:self->_queue];
}

- (void)daemonReady:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v5 = [WeakRetained database];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__HDWatchSettingsReconciliationManager_daemonReady___block_invoke;
  v7[3] = &unk_1E62F3208;
  v7[4] = self;
  [v5 performWhenDataProtectedByFirstUnlockIsAvailableOnQueue:queue block:v7];
}

void __52__HDWatchSettingsReconciliationManager_daemonReady___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  v3 = [WeakRetained daemon];
  id v4 = [v3 maintenanceWorkCoordinator];
  uint64_t v5 = [*(id *)(a1 + 32) description];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(v6 + 16);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__HDWatchSettingsReconciliationManager_daemonReady___block_invoke_2;
  v9[3] = &unk_1E62F3208;
  v9[4] = v6;
  uint64_t v8 = +[HDMaintenanceOperation maintenanceOperationWithName:v5 queue:v7 synchronousBlock:v9];
  [v4 enqueueMaintenanceOperation:v8];
}

uint64_t __52__HDWatchSettingsReconciliationManager_daemonReady___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_reconcileValuesForAllKeys");
}

- (void)featureSettingsManager:(id)a3 didUpdateSettingsForFeatureIdentifier:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  loggingCategory = self->_loggingCategory;
  if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    long long v13 = self;
    __int16 v14 = 2114;
    id v15 = v5;
    _os_log_impl(&dword_1BCB7D000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notified of update to settings for %{public}@", buf, 0x16u);
  }
  managedKeys = self->_managedKeys;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __101__HDWatchSettingsReconciliationManager_featureSettingsManager_didUpdateSettingsForFeatureIdentifier___block_invoke;
  v10[3] = &unk_1E6309828;
  id v11 = v5;
  id v8 = v5;
  uint64_t v9 = [(NSArray *)managedKeys hk_firstObjectPassingTest:v10];
  if (v9) {
    [(HDWatchSettingsReconciliationManager *)self _queue_reconcileValuesForKeys:v9];
  }
}

uint64_t __101__HDWatchSettingsReconciliationManager_featureSettingsManager_didUpdateSettingsForFeatureIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 featureIdentifier];
  uint64_t v4 = [v2 isEqualToString:v3];

  return v4;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  _HKInitializeLogging();
  loggingCategory = self->_loggingCategory;
  if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *MEMORY[0x1E4F284E0];
    id v15 = loggingCategory;
    uint64_t v16 = [v12 objectForKeyedSubscript:v14];
    long long v17 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];
    *(_DWORD *)buf = 138544130;
    v30 = self;
    __int16 v31 = 2114;
    id v32 = v10;
    __int16 v33 = 2114;
    v34 = v16;
    __int16 v35 = 2114;
    v36 = v17;
    _os_log_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@ changed: %{public}@ -> %{public}@", buf, 0x2Au);
  }
  managedKeys = self->_managedKeys;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __87__HDWatchSettingsReconciliationManager_observeValueForKeyPath_ofObject_change_context___block_invoke;
  v27[3] = &unk_1E6309828;
  id v19 = v10;
  id v28 = v19;
  uint64_t v20 = [(NSArray *)managedKeys hk_firstObjectPassingTest:v27];
  if (v20)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    v22 = [WeakRetained database];
    queue = self->_queue;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __87__HDWatchSettingsReconciliationManager_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
    v25[3] = &unk_1E62F31C0;
    v25[4] = self;
    id v26 = v20;
    [v22 performWhenDataProtectedByFirstUnlockIsAvailableOnQueue:queue block:v25];
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)HDWatchSettingsReconciliationManager;
    [(HDWatchSettingsReconciliationManager *)&v24 observeValueForKeyPath:v19 ofObject:v11 change:v12 context:a6];
  }
}

uint64_t __87__HDWatchSettingsReconciliationManager_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 defaultsEnabledKey];
  uint64_t v4 = [v2 isEqualToString:v3];

  return v4;
}

uint64_t __87__HDWatchSettingsReconciliationManager_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_reconcileValuesForKeys:", *(void *)(a1 + 40));
}

- (void)_queue_reconcileValuesForAllKeys
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v3 = self->_managedKeys;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        -[HDWatchSettingsReconciliationManager _queue_reconcileValuesForKeys:](self, "_queue_reconcileValuesForKeys:", *(void *)(*((void *)&v8 + 1) + 8 * v7++), (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_queue_reconcileValuesForKeys:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  loggingCategory = self->_loggingCategory;
  if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = self;
    __int16 v14 = 2114;
    id v15 = v4;
    _os_log_impl(&dword_1BCB7D000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@] Beginning reconciliation for %{public}@", buf, 0x16u);
  }
  id v11 = 0;
  uint64_t v6 = [(HDWatchSettingsReconciliationManager *)self _queue_settingValuesForSettingKeys:v4 error:&v11];
  id v7 = v11;
  if (v6)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __70__HDWatchSettingsReconciliationManager__queue_reconcileValuesForKeys___block_invoke;
    v9[3] = &unk_1E6309850;
    v9[4] = self;
    id v10 = v6;
    [(HDWatchSettingsReconciliationManager *)self _queue_applyReconciledValueFromSettingValues:v10 forSettingKeys:v4 completion:v9];
  }
  else
  {
    _HKInitializeLogging();
    long long v8 = self->_loggingCategory;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      uint64_t v13 = self;
      __int16 v14 = 2114;
      id v15 = v4;
      __int16 v16 = 2114;
      id v17 = v7;
      _os_log_error_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] Error retrieving settings values for %{public}@: %{public}@", buf, 0x20u);
    }
  }
}

void __70__HDWatchSettingsReconciliationManager__queue_reconcileValuesForKeys___block_invoke(uint64_t a1, char a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  id v12 = a6;
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
    [WeakRetained watchSettingsReconciliationManager:*(void *)(a1 + 32) didReconcileValuesForKeys:v11 didUpdateFeatureSetting:a3 didUpdateUserDefault:a4];
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v14 = *(void *)(a1 + 32);
    id v15 = *(NSObject **)(v14 + 48);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = *(void **)(a1 + 40);
      int v19 = 138544130;
      uint64_t v20 = v14;
      __int16 v21 = 2114;
      id v22 = v18;
      __int16 v23 = 2114;
      id v24 = v11;
      __int16 v25 = 2114;
      id v26 = v12;
      _os_log_error_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_ERROR, "[%{public}@] Error applying reconciled values: %{public}@ for %{public}@: %{public}@", (uint8_t *)&v19, 0x2Au);
    }
  }
  _HKInitializeLogging();
  uint64_t v16 = *(void *)(a1 + 32);
  id v17 = *(NSObject **)(v16 + 48);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138543618;
    uint64_t v20 = v16;
    __int16 v21 = 2114;
    id v22 = v11;
    _os_log_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Completed reconciliation for %{public}@", (uint8_t *)&v19, 0x16u);
  }
}

- (id)_queue_settingValuesForSettingKeys:(id)a3 error:(id *)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  long long v8 = [WeakRetained featureSettingsManager];
  long long v9 = [v6 featureIdentifier];
  id v26 = 0;
  id v10 = [v8 featureSettingsForFeatureIdentifier:v9 error:&v26];
  id v11 = v26;

  if (v10)
  {
    id v12 = [v6 featureSettingEnabledKey];
    id v13 = [v10 numberForKey:v12];

    userDefaults = self->_userDefaults;
    id v15 = [v6 defaultsEnabledKey];
    id v25 = v11;
    uint64_t v16 = [(NSUserDefaults *)userDefaults hk_safeNumberIfExistsForKeyPath:v15 error:&v25];
    id v17 = v25;

    if (v17)
    {
      if (a4)
      {
        id v17 = v17;
        uint64_t v18 = 0;
        *a4 = v17;
      }
      else
      {
        _HKLogDroppedError();
        uint64_t v18 = 0;
      }
    }
    else
    {
      uint64_t v20 = self->_userDefaults;
      __int16 v21 = [v6 lastReconciledEnabledKey];
      id v24 = 0;
      id v22 = [(NSUserDefaults *)v20 hk_safeNumberIfExistsForKeyPath:v21 error:&v24];
      id v17 = v24;

      if (v17)
      {
        if (a4)
        {
          uint64_t v18 = 0;
          *a4 = v17;
        }
        else
        {
          _HKLogDroppedError();
          uint64_t v18 = 0;
        }
      }
      else
      {
        uint64_t v18 = [[HDWatchSettingValues alloc] initWithFeatureSettingEnabledValue:v13 defaultsEnabledValue:v16 lastReconciledEnabledValue:v22];
      }
    }
  }
  else
  {
    id v19 = v11;
    id v13 = v19;
    if (v19)
    {
      if (a4)
      {
        id v13 = v19;
        uint64_t v18 = 0;
        *a4 = v13;
      }
      else
      {
        _HKLogDroppedError();
        uint64_t v18 = 0;
      }
      id v17 = v13;
    }
    else
    {
      id v17 = 0;
      uint64_t v18 = 0;
    }
  }

  return v18;
}

- (void)_queue_applyReconciledValueFromSettingValues:(id)a3 forSettingKeys:(id)a4 completion:(id)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v11 = [v8 reconciledEnabledValue];
  _HKInitializeLogging();
  loggingCategory = self->_loggingCategory;
  BOOL v13 = os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      *(_DWORD *)buf = 138544130;
      v39 = self;
      __int16 v40 = 2114;
      id v41 = v11;
      __int16 v42 = 2114;
      id v43 = v8;
      __int16 v44 = 2114;
      id v45 = v9;
      _os_log_impl(&dword_1BCB7D000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@] Applying reconciled value %{public}@ from %{public}@ for %{public}@", buf, 0x2Au);
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __111__HDWatchSettingsReconciliationManager__queue_applyReconciledValueFromSettingValues_forSettingKeys_completion___block_invoke;
    aBlock[3] = &unk_1E6309878;
    id v14 = v11;
    id v33 = v14;
    id v15 = v8;
    id v34 = v15;
    __int16 v35 = self;
    id v16 = v9;
    id v36 = v16;
    id v25 = v10;
    id v17 = v10;
    id v37 = v17;
    uint64_t v18 = (void (**)(void *, void))_Block_copy(aBlock);
    id v19 = [v15 featureSettingEnabledValue];
    char v20 = [v14 isEqual:v19];

    if (v20)
    {
      v18[2](v18, 0);
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
      __int16 v21 = [WeakRetained database];
      id v22 = +[HDDatabaseTransactionContext contextForWriting];
      id v31 = 0;
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __111__HDWatchSettingsReconciliationManager__queue_applyReconciledValueFromSettingValues_forSettingKeys_completion___block_invoke_2;
      v26[3] = &unk_1E63098C8;
      v29 = v18;
      v26[4] = self;
      id v30 = v17;
      id v27 = v16;
      id v28 = v14;
      [v21 performTransactionWithContext:v22 error:&v31 block:v26 inaccessibilityHandler:0];
      id v23 = v31;
    }
    id v10 = v25;
  }
  else
  {
    if (v13)
    {
      *(_DWORD *)buf = 138543874;
      v39 = self;
      __int16 v40 = 2114;
      id v41 = v8;
      __int16 v42 = 2114;
      id v43 = v9;
      _os_log_impl(&dword_1BCB7D000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@] No value to reconcile from %{public}@ for %{public}@", buf, 0x20u);
    }
    (*((void (**)(id, uint64_t, void, void, id, void))v10 + 2))(v10, 1, 0, 0, v9, 0);
  }
}

uint64_t __111__HDWatchSettingsReconciliationManager__queue_applyReconciledValueFromSettingValues_forSettingKeys_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) lastReconciledEnabledValue];
  LOBYTE(v2) = [v2 isEqual:v3];

  if ((v2 & 1) == 0)
  {
    id v4 = *(void **)(*(void *)(a1 + 48) + 24);
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = [*(id *)(a1 + 56) lastReconciledEnabledKey];
    [v4 setObject:v5 forKey:v6];
  }
  id v7 = *(void **)(a1 + 32);
  id v8 = [*(id *)(a1 + 40) defaultsEnabledValue];
  LOBYTE(v7) = [v7 isEqual:v8];

  if ((v7 & 1) == 0)
  {
    id v9 = *(void **)(*(void *)(a1 + 48) + 24);
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = [*(id *)(a1 + 56) defaultsEnabledKey];
    [v9 setObject:v10 forKey:v11];
  }
  id v12 = *(uint64_t (**)(void))(*(void *)(a1 + 64) + 16);

  return v12();
}

uint64_t __111__HDWatchSettingsReconciliationManager__queue_applyReconciledValueFromSettingValues_forSettingKeys_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __111__HDWatchSettingsReconciliationManager__queue_applyReconciledValueFromSettingValues_forSettingKeys_completion___block_invoke_3;
  v20[3] = &unk_1E62F2F20;
  id v21 = *(id *)(a1 + 56);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __111__HDWatchSettingsReconciliationManager__queue_applyReconciledValueFromSettingValues_forSettingKeys_completion___block_invoke_4;
  id v16 = &unk_1E63098A0;
  uint64_t v17 = *(void *)(a1 + 32);
  id v19 = *(id *)(a1 + 64);
  id v18 = *(id *)(a1 + 40);
  [a2 onCommit:v20 orRollback:&v13];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  id v7 = objc_msgSend(WeakRetained, "featureSettingsManager", v13, v14, v15, v16, v17);
  uint64_t v8 = *(void *)(a1 + 48);
  id v9 = [*(id *)(a1 + 40) featureSettingEnabledKey];
  uint64_t v10 = [*(id *)(a1 + 40) featureIdentifier];
  uint64_t v11 = [v7 setFeatureSettingsNumber:v8 forKey:v9 featureIdentifier:v10 suppressNotificationsToObserver:*(void *)(a1 + 32) error:a3];

  return v11;
}

uint64_t __111__HDWatchSettingsReconciliationManager__queue_applyReconciledValueFromSettingValues_forSettingKeys_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __111__HDWatchSettingsReconciliationManager__queue_applyReconciledValueFromSettingValues_forSettingKeys_completion___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 48);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543618;
    uint64_t v7 = v4;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] Rolled back feature settings changes, not updating user defaults: %{public}@", (uint8_t *)&v6, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (HDWatchSettingsReconciliationManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HDWatchSettingsReconciliationManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_loggingCategory, 0);
  objc_storeStrong((id *)&self->_debugIdentifier, 0);
  objc_storeStrong((id *)&self->_managedKeys, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end