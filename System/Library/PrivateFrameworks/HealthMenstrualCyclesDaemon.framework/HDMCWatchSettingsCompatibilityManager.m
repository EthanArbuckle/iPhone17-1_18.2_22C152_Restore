@interface HDMCWatchSettingsCompatibilityManager
- (HDMCWatchSettingsCompatibilityManager)initWithProfile:(id)a3 userDefaults:(id)a4;
- (HDMCWatchSettingsCompatibilityManagerDelegate)delegate;
- (void)_queue_computeAndApplyChangesForAllFeatures;
- (void)_queue_computeAndApplyChangesForFeature:(id)a3;
- (void)daemonReady:(id)a3;
- (void)featureSettingsManager:(id)a3 didUpdateSettingsForFeatureIdentifier:(id)a4;
- (void)profileDidBecomeReady:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation HDMCWatchSettingsCompatibilityManager

- (HDMCWatchSettingsCompatibilityManager)initWithProfile:(id)a3 userDefaults:(id)a4
{
  v20[2] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)HDMCWatchSettingsCompatibilityManager;
  v9 = [(HDMCWatchSettingsCompatibilityManager *)&v19 init];
  if (v9)
  {
    if ([v7 profileType] != 1)
    {
      v18 = [MEMORY[0x263F08690] currentHandler];
      [v18 handleFailureInMethod:a2, v9, @"HDMCWatchSettingsCompatibilityManager.m", 32, @"Invalid parameter not satisfying: %@", @"profile.profileType == HKProfileTypePrimary" object file lineNumber description];
    }
    objc_storeWeak((id *)&v9->_profile, v7);
    objc_storeStrong((id *)&v9->_userDefaults, a4);
    uint64_t v10 = HKCreateSerialDispatchQueue();
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v10;

    v12 = +[HDMCWatchFeatureSettings algorithmicProjectionsSettings];
    v20[0] = v12;
    v13 = +[HDMCWatchFeatureSettings hiddenLoggingRowsSettings];
    v20[1] = v13;
    uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
    managedFeatures = v9->_managedFeatures;
    v9->_managedFeatures = (NSArray *)v14;

    id WeakRetained = objc_loadWeakRetained((id *)&v9->_profile);
    [WeakRetained registerProfileReadyObserver:v9 queue:v9->_queue];
  }
  return v9;
}

- (void)profileDidBecomeReady:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = self->_managedFeatures;
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
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * v9);
        id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
        v12 = objc_msgSend(WeakRetained, "featureSettingsManager", (void)v15);
        v13 = [v10 featureIdentifier];
        [v12 registerObserver:self featureIdentifier:v13 queue:self->_queue];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  uint64_t v14 = [v4 daemon];
  [v14 registerDaemonReadyObserver:self queue:self->_queue];
}

- (void)daemonReady:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v5 = [WeakRetained database];
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__HDMCWatchSettingsCompatibilityManager_daemonReady___block_invoke;
  v7[3] = &unk_2647508B0;
  v7[4] = self;
  [v5 performWhenDataProtectedByFirstUnlockIsAvailableOnQueue:queue block:v7];
}

void __53__HDMCWatchSettingsCompatibilityManager_daemonReady___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  v3 = [WeakRetained daemon];
  id v4 = [v3 maintenanceWorkCoordinator];
  v5 = (void *)MEMORY[0x263F43248];
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(v8 + 24);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __53__HDMCWatchSettingsCompatibilityManager_daemonReady___block_invoke_2;
  v11[3] = &unk_2647508B0;
  v11[4] = v8;
  uint64_t v10 = [v5 maintenanceOperationWithName:v7 queue:v9 synchronousBlock:v11];
  [v4 enqueueMaintenanceOperation:v10];
}

uint64_t __53__HDMCWatchSettingsCompatibilityManager_daemonReady___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_computeAndApplyChangesForAllFeatures");
}

- (void)featureSettingsManager:(id)a3 didUpdateSettingsForFeatureIdentifier:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  uint64_t v6 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v6;
    *(_DWORD *)buf = 138543618;
    id v23 = (id)objc_opt_class();
    __int16 v24 = 2114;
    id v25 = v5;
    id v8 = v23;
    _os_log_impl(&dword_225722000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notified of update to settings for %{public}@", buf, 0x16u);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v9 = self->_managedFeatures;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        long long v15 = objc_msgSend(v14, "featureIdentifier", (void)v17);
        int v16 = [v15 isEqualToString:v5];

        if (v16) {
          [(HDMCWatchSettingsCompatibilityManager *)self _queue_computeAndApplyChangesForFeature:v14];
        }
      }
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }
}

- (void)_queue_computeAndApplyChangesForAllFeatures
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v3 = self->_managedFeatures;
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
        -[HDMCWatchSettingsCompatibilityManager _queue_computeAndApplyChangesForFeature:](self, "_queue_computeAndApplyChangesForFeature:", *(void *)(*((void *)&v8 + 1) + 8 * v7++), (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_queue_computeAndApplyChangesForFeature:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v6 = [WeakRetained featureSettingsManager];
  uint64_t v7 = [v4 featureIdentifier];
  id v23 = 0;
  long long v8 = [v6 featureSettingsForFeatureIdentifier:v7 error:&v23];
  long long v9 = v23;

  if (v8)
  {
    long long v10 = [v4 userDefaultsChangesFromFeatureSettings:v8 currentUserDefaults:self->_userDefaults];
    [(NSUserDefaults *)self->_userDefaults setValuesForKeysWithDictionary:v10];
    _HKInitializeLogging();
    long long v11 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = v11;
      uint64_t v13 = objc_opt_class();
      id v14 = v13;
      long long v15 = [v4 featureIdentifier];
      *(_DWORD *)buf = 138543874;
      id v25 = v13;
      __int16 v26 = 2114;
      v27 = v15;
      __int16 v28 = 2114;
      v29 = v10;
      _os_log_impl(&dword_225722000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Applied changes for %{public}@: %{public}@", buf, 0x20u);
    }
    id v16 = objc_loadWeakRetained((id *)&self->_delegate);
    long long v17 = (void *)MEMORY[0x263EFFA08];
    long long v18 = [v10 allKeys];
    long long v19 = [v17 setWithArray:v18];
    [v16 watchSettingsCompatibilityManager:self didChangeUserDefaultsKeys:v19];
  }
  else
  {
    _HKInitializeLogging();
    long long v20 = (void *)*MEMORY[0x263F09930];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    long long v10 = v20;
    v21 = objc_opt_class();
    id v16 = v21;
    v22 = [v4 featureIdentifier];
    *(_DWORD *)buf = 138543874;
    id v25 = v21;
    __int16 v26 = 2114;
    v27 = v22;
    __int16 v28 = 2114;
    v29 = v9;
    _os_log_error_impl(&dword_225722000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] Error retrieving %{public}@ feature settings: %{public}@", buf, 0x20u);
  }
LABEL_7:
}

- (HDMCWatchSettingsCompatibilityManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HDMCWatchSettingsCompatibilityManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_managedFeatures, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end