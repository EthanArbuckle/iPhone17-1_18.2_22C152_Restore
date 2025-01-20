@interface HMDFetchedAccessorySettingsController
+ (id)logCategory;
- (HMDFetchedAccessorySettingsController)initWithQueue:(id)a3 dataSource:(id)a4 drivers:(id)a5;
- (HMDFetchedAccessorySettingsController)initWithQueue:(id)a3 dataSource:(id)a4 drivers:(id)a5 notificationCenter:(id)a6;
- (HMDFetchedAccessorySettingsControllerDataSource)dataSource;
- (HMDFetchedAccessorySettingsControllerMutableKeyPathMap)driverMap;
- (NSMutableSet)pendingFetchKeyPaths;
- (NSNotificationCenter)notificationCenter;
- (OS_dispatch_queue)queue;
- (id)cachedSettingForKeyPath:(id)a3;
- (void)_postNotificationForSettings:(void *)a1;
- (void)_postUpdateEventsIfDifferent:(void *)a1;
- (void)_updateCacheWithSettings:(uint64_t)a1;
- (void)applyFetchedSettings:(void *)a1 requestedKeyPaths:(void *)a2;
- (void)driver:(id)a3 didUpdatePrimaryUserInfo:(id)a4;
- (void)driver:(id)a3 didUpdateSettings:(id)a4;
- (void)driverDidReload:(id)a3;
- (void)fetchSettingsForKeyPaths:(id)a3 completion:(id)a4;
- (void)languageValueListWithCompletion:(id)a3;
- (void)setPendingFetchKeyPaths:(id)a3;
- (void)start;
- (void)updateSettingWithKeyPath:(id)a3 settingValue:(id)a4 completion:(id)a5;
@end

@implementation HMDFetchedAccessorySettingsController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_notificationCenter);
  objc_storeStrong((id *)&self->_pendingFetchKeyPaths, 0);
  objc_storeStrong((id *)&self->_driverMap, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_keyPathToSettingCache, 0);
}

- (NSNotificationCenter)notificationCenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_notificationCenter);
  return (NSNotificationCenter *)WeakRetained;
}

- (void)setPendingFetchKeyPaths:(id)a3
{
}

- (NSMutableSet)pendingFetchKeyPaths
{
  return (NSMutableSet *)objc_getProperty(self, a2, 56, 1);
}

- (HMDFetchedAccessorySettingsControllerMutableKeyPathMap)driverMap
{
  return (HMDFetchedAccessorySettingsControllerMutableKeyPathMap *)objc_getProperty(self, a2, 48, 1);
}

- (HMDFetchedAccessorySettingsControllerDataSource)dataSource
{
  return (HMDFetchedAccessorySettingsControllerDataSource *)objc_getProperty(self, a2, 40, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)driverDidReload:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDFetchedAccessorySettingsController *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = [(HMDFetchedAccessorySettingsController *)self driverMap];
  v8 = v6;
  if (v6) {
    id Property = objc_getProperty(v6, v7, 8, 1);
  }
  else {
    id Property = 0;
  }
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __57__HMDFetchedAccessorySettingsController_driverDidReload___block_invoke;
  v29[3] = &unk_1E6A16DF0;
  id v10 = v4;
  id v30 = v10;
  v11 = objc_msgSend(Property, "na_firstObjectPassingTest:", v29);

  if (v11
    && ([v11 driver],
        id v12 = (id)objc_claimAutoreleasedReturnValue(),
        BOOL v13 = v12 == v10,
        v12,
        v13))
  {
    v18 = (void *)MEMORY[0x1E4F1CAD0];
    v19 = [v11 keyPaths];
    v20 = [v18 setWithArray:v19];

    v21 = [(HMDFetchedAccessorySettingsController *)self pendingFetchKeyPaths];
    v22 = [v21 setByAddingObjectsFromSet:v20];
    v23 = (void *)[v22 mutableCopy];
    [(HMDFetchedAccessorySettingsController *)self setPendingFetchKeyPaths:v23];

    objc_initWeak((id *)buf, self);
    v24 = [v11 keyPaths];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __57__HMDFetchedAccessorySettingsController_driverDidReload___block_invoke_2;
    v26[3] = &unk_1E6A16E18;
    objc_copyWeak(&v28, (id *)buf);
    id v25 = v20;
    id v27 = v25;
    [v10 fetchSettingsForKeyPaths:v24 completion:v26];

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v14 = (void *)MEMORY[0x1D9452090]();
    v15 = self;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v32 = v17;
      __int16 v33 = 2112;
      id v34 = v10;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@Did not find driver in list %@", buf, 0x16u);
    }
  }
}

BOOL __57__HMDFetchedAccessorySettingsController_driverDidReload___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 driver];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

void __57__HMDFetchedAccessorySettingsController_driverDidReload___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = [WeakRetained queue];
    dispatch_assert_queue_V2(v5);

    -[HMDFetchedAccessorySettingsController applyFetchedSettings:requestedKeyPaths:](v4, v6);
  }
}

- (void)applyFetchedSettings:(void *)a1 requestedKeyPaths:(void *)a2
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __80__HMDFetchedAccessorySettingsController_applyFetchedSettings_requestedKeyPaths___block_invoke;
  v4[3] = &unk_1E6A16DA0;
  v4[4] = a1;
  v3 = objc_msgSend(a2, "na_filter:", v4);
  if ([v3 count])
  {
    -[HMDFetchedAccessorySettingsController _postUpdateEventsIfDifferent:](a1, v3);
    -[HMDFetchedAccessorySettingsController _updateCacheWithSettings:]((uint64_t)a1, v3);
    -[HMDFetchedAccessorySettingsController _postNotificationForSettings:](a1, v3);
  }
}

uint64_t __80__HMDFetchedAccessorySettingsController_applyFetchedSettings_requestedKeyPaths___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  BOOL v4 = [v2 pendingFetchKeyPaths];
  v5 = [v3 keyPath];

  uint64_t v6 = objc_msgSend(v4, "na_safeContainsObject:", v5);
  return v6;
}

- (void)_postUpdateEventsIfDifferent:(void *)a1
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    BOOL v4 = [a1 queue];
    dispatch_assert_queue_V2(v4);

    v5 = [a1 dataSource];
    v45 = [v5 eventSourceIdentifierNameForFetchedSettingsController:a1];

    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v7 = v6;
    v43 = [a1 pendingFetchKeyPaths];
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v41 = v3;
    id obj = v3;
    uint64_t v47 = [obj countByEnumeratingWithState:&v50 objects:v60 count:16];
    if (!v47) {
      goto LABEL_27;
    }
    uint64_t v46 = *(void *)v51;
    v44 = a1;
    while (1)
    {
      for (uint64_t i = 0; i != v47; ++i)
      {
        if (*(void *)v51 != v46) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        uint64_t v10 = [v9 keyPath];
        if (v10)
        {
          v11 = (void *)v10;
          id v12 = [v9 keyPath];
          int v13 = [v43 containsObject:v12];

          if (v13)
          {
            v14 = (void *)MEMORY[0x1D9452090]();
            id v15 = a1;
            v16 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              v17 = HMFGetLogIdentifier();
              v18 = [v9 keyPath];
              *(_DWORD *)buf = 138543618;
              v55 = v17;
              __int16 v56 = 2114;
              v57 = v18;
              _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Removing keyPath %{public}@ from pending fetch", buf, 0x16u);

              a1 = v44;
            }

            v19 = [v15 pendingFetchKeyPaths];
            v20 = [v9 keyPath];
            [v19 removeObject:v20];
          }
        }
        v21 = [a1 dataSource];
        v22 = [v9 keyPath];
        v23 = [v21 controller:a1 topicForKeyPath:v22];

        v24 = [a1 dataSource];
        id v25 = [v24 eventStoreReadHandle];

        v26 = [v25 lastEventForTopic:v23];
        if (!v26)
        {
          id v27 = 0;
          goto LABEL_24;
        }
        v48 = v25;
        id v49 = 0;
        id v27 = [MEMORY[0x1E4F2E858] decodeSettingFromEvent:v26 error:&v49];
        id v28 = v49;
        if (v28)
        {
          v29 = (void *)MEMORY[0x1D9452090]();
          id v30 = a1;
          v31 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            v32 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            v55 = v32;
            __int16 v56 = 2112;
            v57 = v23;
            __int16 v58 = 2112;
            id v59 = v28;
            _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_INFO, "%{public}@Error reading stored setting for topic %@, error: %@", buf, 0x20u);
          }
          a1 = v44;
        }

        if (!v27 || ![v27 isEqual:v9])
        {
          id v25 = v48;
LABEL_24:
          v38 = (void *)[objc_alloc(MEMORY[0x1E4F2E858]) initWithSetting:v9 eventSource:v45 eventTimestamp:v7];
          v39 = [a1 dataSource];
          v40 = [v39 eventForwarder];
          [v40 forwardEvent:v38 topic:v23 completion:&__block_literal_global_84_172271];

          goto LABEL_25;
        }
        __int16 v33 = (void *)MEMORY[0x1D9452090]();
        id v34 = a1;
        uint64_t v35 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          v36 = HMFGetLogIdentifier();
          v37 = [v9 keyPath];
          *(_DWORD *)buf = 138543618;
          v55 = v36;
          __int16 v56 = 2114;
          v57 = v37;
          _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_INFO, "%{public}@Skip sending event for keyPath: %{public}@ as it matches stored", buf, 0x16u);

          a1 = v44;
        }

        id v25 = v48;
LABEL_25:
      }
      uint64_t v47 = [obj countByEnumeratingWithState:&v50 objects:v60 count:16];
      if (!v47)
      {
LABEL_27:

        id v3 = v41;
        break;
      }
    }
  }
}

- (void)_updateCacheWithSettings:(uint64_t)a1
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v4);
          }
          v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          v9 = *(void **)(a1 + 16);
          uint64_t v10 = objc_msgSend(v8, "keyPath", (void)v11);
          [v9 setObject:v8 forKeyedSubscript:v10];
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v5);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  }
}

- (void)_postNotificationForSettings:(void *)a1
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id obj = a2;
  if (a1)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v3 = [obj countByEnumeratingWithState:&v13 objects:v19 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v14;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v14 != v5) {
            objc_enumerationMutation(obj);
          }
          double v7 = *(void **)(*((void *)&v13 + 1) + 8 * v6);
          v8 = [a1 notificationCenter];
          v9 = [a1 dataSource];
          v17[1] = @"HMDFetchedAccessorySettingsControllerSettingsUpdateNotification";
          v18[0] = v7;
          v17[0] = @"HMDFetchedAccessorySettingsControllerSettingsUpdateNotificationSettingValueCodingKey";
          uint64_t v10 = [v7 keyPath];
          v18[1] = v10;
          long long v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
          [v8 postNotificationName:@"HMDFetchedAccessorySettingsControllerSettingsUpdateNotification" object:v9 userInfo:v11];

          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [obj countByEnumeratingWithState:&v13 objects:v19 count:16];
      }
      while (v4);
    }
  }
}

- (void)driver:(id)a3 didUpdatePrimaryUserInfo:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1D9452090]();
  v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    long long v11 = HMFGetLogIdentifier();
    int v12 = 138543362;
    long long v13 = v11;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Primary user is not supported", (uint8_t *)&v12, 0xCu);
  }
}

- (void)driver:(id)a3 didUpdateSettings:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDFetchedAccessorySettingsController *)self queue];
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x1D9452090]();
  uint64_t v10 = self;
  long long v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v42 = v12;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Received setting updates", buf, 0xCu);
  }
  long long v13 = [(HMDFetchedAccessorySettingsController *)v10 driverMap];
  long long v15 = [(HMDFetchedAccessorySettingsControllerMutableKeyPathMap *)v13 availableKeyPaths];

  long long v16 = [MEMORY[0x1E4F1CA48] array];
  v17 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v34 = MEMORY[0x1E4F143A8];
  uint64_t v35 = 3221225472;
  v36 = __66__HMDFetchedAccessorySettingsController_driver_didUpdateSettings___block_invoke;
  v37 = &unk_1E6A16DC8;
  id v18 = v15;
  id v38 = v18;
  id v19 = v16;
  id v39 = v19;
  id v20 = v17;
  id v40 = v20;
  v21 = objc_msgSend(v7, "na_filter:", &v34);
  if ([v20 count])
  {
    id v22 = v7;
    id v23 = v6;
    v24 = (void *)MEMORY[0x1D9452090]();
    id v25 = v10;
    v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v27 = v33 = v18;
      *(_DWORD *)buf = 138543618;
      v42 = v27;
      __int16 v43 = 2112;
      id v44 = v20;
      _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_INFO, "%{public}@Ignoring updates for unknown keypaths: %@", buf, 0x16u);

      id v18 = v33;
    }

    id v6 = v23;
    id v7 = v22;
  }
  if (objc_msgSend(v21, "count", v33, v34, v35, v36, v37))
  {
    id v28 = (void *)MEMORY[0x1D9452090]();
    v29 = v10;
    id v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v32 = id v31 = v18;
      *(_DWORD *)buf = 138543874;
      v42 = v32;
      __int16 v43 = 2114;
      id v44 = v19;
      __int16 v45 = 2112;
      uint64_t v46 = v21;
      _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@Received update for keyPaths: %{public}@ settings: %@", buf, 0x20u);

      id v18 = v31;
    }

    -[HMDFetchedAccessorySettingsController _updateCacheWithSettings:]((uint64_t)v29, v21);
    -[HMDFetchedAccessorySettingsController _postUpdateEventsIfDifferent:](v29, v21);
    -[HMDFetchedAccessorySettingsController _postNotificationForSettings:](v29, v21);
  }
}

uint64_t __66__HMDFetchedAccessorySettingsController_driver_didUpdateSettings___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = (void *)a1[4];
  id v4 = a2;
  uint64_t v5 = [v4 keyPath];
  LODWORD(v3) = [v3 containsObject:v5];

  if (v3) {
    id v6 = (void *)a1[5];
  }
  else {
    id v6 = (void *)a1[6];
  }
  id v7 = [v4 keyPath];
  [v6 addObject:v7];

  v8 = (void *)a1[4];
  v9 = [v4 keyPath];

  uint64_t v10 = [v8 containsObject:v9];
  return v10;
}

- (id)cachedSettingForKeyPath:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v6 = [(NSMutableDictionary *)self->_keyPathToSettingCache objectForKeyedSubscript:v4];
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (void)languageValueListWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDFetchedAccessorySettingsController *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__HMDFetchedAccessorySettingsController_languageValueListWithCompletion___block_invoke;
  v7[3] = &unk_1E6A19530;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __73__HMDFetchedAccessorySettingsController_languageValueListWithCompletion___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) driverMap];
  v2 = -[HMDFetchedAccessorySettingsControllerMutableKeyPathMap objectForKeyedSubscript:](v3, @"root.siri.availableLanguages");
  [v2 languageValueListWithCompletion:*(void *)(a1 + 40)];
}

- (void)updateSettingWithKeyPath:(id)a3 settingValue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = [(HMDFetchedAccessorySettingsController *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __90__HMDFetchedAccessorySettingsController_updateSettingWithKeyPath_settingValue_completion___block_invoke;
  v15[3] = &unk_1E6A18398;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __90__HMDFetchedAccessorySettingsController_updateSettingWithKeyPath_settingValue_completion___block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) driverMap];
  id v4 = [(HMDFetchedAccessorySettingsControllerMutableKeyPathMap *)v2 availableKeyPaths];
  char v5 = [v4 containsObject:*(void *)(a1 + 40)];

  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = *(id *)(a1 + 32);
  id v8 = HMFGetOSLogHandle();
  id v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      uint64_t v11 = *(void *)(a1 + 40);
      int v36 = 138543618;
      v37 = v10;
      __int16 v38 = 2114;
      uint64_t v39 = v11;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Got setting update request keyPath: %{public}@", (uint8_t *)&v36, 0x16u);
    }
    id v12 = *(id *)(a1 + 48);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }
    id v14 = v13;

    id v15 = *(id *)(a1 + 48);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v16 = v15;
    }
    else {
      id v16 = 0;
    }
    id v17 = v16;

    id v18 = *(id *)(a1 + 48);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v19 = v18;
    }
    else {
      id v19 = 0;
    }
    id v20 = v19;

    if (v14)
    {
      v21 = [*(id *)(a1 + 32) driverMap];
      id v22 = -[HMDFetchedAccessorySettingsControllerMutableKeyPathMap objectForKeyedSubscript:](v21, *(void **)(a1 + 40));
      [v22 updateSettingWithKeyPath:*(void *)(a1 + 40) BOOLSettingValue:v14 completion:*(void *)(a1 + 56)];
    }
    else if (v17)
    {
      v21 = [*(id *)(a1 + 32) driverMap];
      id v22 = -[HMDFetchedAccessorySettingsControllerMutableKeyPathMap objectForKeyedSubscript:](v21, *(void **)(a1 + 40));
      [v22 updateSettingWithKeyPath:*(void *)(a1 + 40) integerSettingValue:v17 completion:*(void *)(a1 + 56)];
    }
    else
    {
      if (!v20)
      {
        v29 = (void *)MEMORY[0x1D9452090]();
        id v30 = *(id *)(a1 + 32);
        id v31 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          v32 = HMFGetLogIdentifier();
          uint64_t v33 = *(void *)(a1 + 40);
          uint64_t v34 = *(void **)(a1 + 48);
          int v36 = 138543874;
          v37 = v32;
          __int16 v38 = 2114;
          uint64_t v39 = v33;
          __int16 v40 = 2112;
          id v41 = v34;
          _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_ERROR, "%{public}@Do not support provided type for update keypath: %{public}@ settingValue: %@", (uint8_t *)&v36, 0x20u);
        }
        uint64_t v35 = *(void *)(a1 + 56);
        v21 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
        (*(void (**)(uint64_t, void *))(v35 + 16))(v35, v21);
        goto LABEL_23;
      }
      v21 = [*(id *)(a1 + 32) driverMap];
      id v22 = -[HMDFetchedAccessorySettingsControllerMutableKeyPathMap objectForKeyedSubscript:](v21, *(void **)(a1 + 40));
      [v22 updateSettingWithKeyPath:*(void *)(a1 + 40) languageSettingValue:v20 completion:*(void *)(a1 + 56)];
    }

LABEL_23:
    goto LABEL_24;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    id v23 = HMFGetLogIdentifier();
    uint64_t v24 = *(void *)(a1 + 40);
    id v25 = [*(id *)(a1 + 32) driverMap];
    id v27 = [(HMDFetchedAccessorySettingsControllerMutableKeyPathMap *)v25 availableKeyPaths];
    int v36 = 138543874;
    v37 = v23;
    __int16 v38 = 2114;
    uint64_t v39 = v24;
    __int16 v40 = 2114;
    id v41 = v27;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Provided keypath: %{public}@ not in available keypaths: %{public}@", (uint8_t *)&v36, 0x20u);
  }
  uint64_t v28 = *(void *)(a1 + 56);
  id v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
  (*(void (**)(uint64_t, id))(v28 + 16))(v28, v14);
LABEL_24:
}

- (void)fetchSettingsForKeyPaths:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDFetchedAccessorySettingsController *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__HMDFetchedAccessorySettingsController_fetchSettingsForKeyPaths_completion___block_invoke;
  block[3] = &unk_1E6A193D0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __77__HMDFetchedAccessorySettingsController_fetchSettingsForKeyPaths_completion___block_invoke(uint64_t a1)
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    char v5 = HMFGetLogIdentifier();
    id v6 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v92 = v5;
    __int16 v93 = 2114;
    v94 = v6;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Received fetch request for keyPaths: %{public}@", buf, 0x16u);
  }
  v69 = [MEMORY[0x1E4F1CA48] array];
  v70 = [MEMORY[0x1E4F1CA48] array];
  id v7 = [*(id *)(a1 + 32) driverMap];
  uint64_t v9 = [(HMDFetchedAccessorySettingsControllerMutableKeyPathMap *)v7 availableKeyPaths];

  v71 = [MEMORY[0x1E4F1CAD0] setWithArray:*(void *)(a1 + 40)];
  v66 = (void *)v9;
  if (([v71 isSubsetOfSet:v9] & 1) == 0)
  {
    id v10 = objc_msgSend(v71, "hmf_removedObjectsFromSet:", v9);
    uint64_t v11 = (void *)MEMORY[0x1D9452090]();
    id v12 = *(id *)(a1 + 32);
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      id v15 = [*(id *)(a1 + 32) driverMap];
      id v17 = [(HMDFetchedAccessorySettingsControllerMutableKeyPathMap *)v15 availableKeyPaths];
      *(_DWORD *)buf = 138543874;
      v92 = v14;
      __int16 v93 = 2114;
      v94 = v10;
      __int16 v95 = 2114;
      v96 = v17;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Some provided keypaths: %{public}@ not in available keypaths: %{public}@", buf, 0x20u);
    }
    id v18 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    [v70 addObject:v18];
  }
  id v19 = dispatch_group_create();
  id v20 = [*(id *)(a1 + 32) driverMap];
  uint64_t v65 = a1;
  id v21 = *(id *)(a1 + 40);
  v63 = v21;
  v64 = v20;
  if (v20)
  {
    id v23 = v21;
    uint64_t v24 = [(HMDFetchedAccessorySettingsControllerMutableKeyPathMap *)v20 availableKeyPaths];
    id v25 = (void *)[v24 mutableCopy];

    v26 = [MEMORY[0x1E4F1CAD0] setWithArray:v23];
    v62 = v25;
    id v27 = objc_msgSend(v25, "hmf_removedObjectsFromSet:", v26);

    id obj = [MEMORY[0x1E4F1CA48] array];
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    id v29 = objc_getProperty(v20, v28, 8, 1);
    uint64_t v30 = [v29 countByEnumeratingWithState:&v86 objects:buf count:16];
    if (v30)
    {
      uint64_t v32 = v30;
      uint64_t v33 = *(void *)v87;
      do
      {
        uint64_t v34 = 0;
        do
        {
          if (*(void *)v87 != v33) {
            objc_enumerationMutation(v29);
          }
          uint64_t v35 = *(void **)(*((void *)&v86 + 1) + 8 * v34);
          int v36 = (void *)MEMORY[0x1E4F1CAD0];
          if (v35) {
            id Property = objc_getProperty(*(id *)(*((void *)&v86 + 1) + 8 * v34), v31, 16, 1);
          }
          else {
            id Property = 0;
          }
          __int16 v38 = [v36 setWithArray:Property];
          uint64_t v39 = objc_msgSend(v38, "hmf_removedObjectsFromSet:", v27);
          __int16 v40 = [v39 allObjects];

          if ([v40 count])
          {
            id v41 = [HMDFetchedAccessorySettingsControllerKeyPathMapItem alloc];
            uint64_t v42 = [v35 driver];
            __int16 v43 = [(HMDFetchedAccessorySettingsControllerKeyPathMapItem *)v41 initWithDriver:v42 keyPaths:v40];
            [obj addObject:v43];
          }
          ++v34;
        }
        while (v32 != v34);
        uint64_t v44 = [v29 countByEnumeratingWithState:&v86 objects:buf count:16];
        uint64_t v32 = v44;
      }
      while (v44);
    }

    __int16 v45 = (void *)[obj copy];
  }
  else
  {
    __int16 v45 = 0;
  }

  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id obja = v45;
  uint64_t v46 = [obja countByEnumeratingWithState:&v82 objects:v90 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v83;
    do
    {
      for (uint64_t i = 0; i != v47; ++i)
      {
        if (*(void *)v83 != v48) {
          objc_enumerationMutation(obja);
        }
        long long v50 = *(void **)(*((void *)&v82 + 1) + 8 * i);
        dispatch_group_enter(v19);
        long long v51 = (void *)MEMORY[0x1E4F1CAD0];
        long long v52 = [v50 keyPaths];
        long long v53 = [v51 setWithArray:v52];
        v54 = objc_msgSend(v71, "na_setByIntersectingWithSet:", v53);
        v55 = [v54 allObjects];

        __int16 v56 = [v50 driver];
        v78[0] = MEMORY[0x1E4F143A8];
        v78[1] = 3221225472;
        v78[2] = __77__HMDFetchedAccessorySettingsController_fetchSettingsForKeyPaths_completion___block_invoke_70;
        v78[3] = &unk_1E6A17DC8;
        id v79 = v69;
        id v80 = v70;
        v81 = v19;
        [v56 fetchSettingsForKeyPaths:v55 completion:v78];
      }
      uint64_t v47 = [obja countByEnumeratingWithState:&v82 objects:v90 count:16];
    }
    while (v47);
  }

  v57 = [*(id *)(v65 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__HMDFetchedAccessorySettingsController_fetchSettingsForKeyPaths_completion___block_invoke_2;
  block[3] = &unk_1E6A18488;
  uint64_t v58 = *(void *)(v65 + 32);
  id v59 = *(void **)(v65 + 40);
  id v73 = v70;
  uint64_t v74 = v58;
  id v75 = v59;
  id v76 = v69;
  id v77 = *(id *)(v65 + 48);
  id v60 = v69;
  id v61 = v70;
  dispatch_group_notify(v19, v57, block);
}

void __77__HMDFetchedAccessorySettingsController_fetchSettingsForKeyPaths_completion___block_invoke_70(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  [*(id *)(a1 + 32) addObjectsFromArray:a2];
  if (v5) {
    [*(id *)(a1 + 40) addObject:v5];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __77__HMDFetchedAccessorySettingsController_fetchSettingsForKeyPaths_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) count])
  {
    v2 = (void *)MEMORY[0x1D9452090]();
    id v3 = *(id *)(a1 + 40);
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      id v5 = HMFGetLogIdentifier();
      int v13 = 138543362;
      id v14 = v5;
      _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_DEBUG, "%{public}@At least one of the driver's returned an error setting error on completion", (uint8_t *)&v13, 0xCu);
    }
    id v6 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    uint64_t v11 = *(void *)(a1 + 48);
    uint64_t v12 = *(void *)(a1 + 56);
    int v13 = 138543874;
    id v14 = v10;
    __int16 v15 = 2114;
    uint64_t v16 = v11;
    __int16 v17 = 2112;
    uint64_t v18 = v12;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Finishing fetch request for keyPaths: %{public}@ restuls: %@", (uint8_t *)&v13, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (void)start
{
  logger = self->_logger;
  if (os_signpost_enabled(logger))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D49D5000, logger, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "LocalSettingsFetch", "", buf, 2u);
  }
  id v5 = [(HMDFetchedAccessorySettingsController *)self dataSource];
  id v6 = [v5 setupActivity];
  id v7 = v6;
  if (v6)
  {
    *(void *)buf = v6;
  }
  else
  {
    id v8 = objc_alloc(MEMORY[0x1E4F653F0]);
    uint64_t v9 = NSString;
    id v10 = MEMORY[0x1D94505D0](self, a2);
    uint64_t v11 = [v9 stringWithFormat:@"%@, %s:%ld", v10, "/Library/Caches/com.apple.xbs/Sources/HomeKit_executables_legacy/Sources/homed/Media/Media Accessory/Apple/Settings/Fetched Settings/HMDFetchedAccessorySettingsController.m", 184];
    *(void *)buf = [v8 initWithName:v11];
  }
  uint64_t v12 = [(HMDFetchedAccessorySettingsController *)self dataSource];
  int v13 = [v12 currentAccessorySetupMetricDispatcher];
  [v13 markSetupBeginStage:5 error:0];

  id v14 = [(HMDFetchedAccessorySettingsController *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__HMDFetchedAccessorySettingsController_start__block_invoke;
  block[3] = &unk_1E6A16D78;
  void block[4] = self;
  id v16 = *(id *)buf;
  unint64_t v17 = 0xEEEEB0B5B2B2EEEELL;
  dispatch_async(v14, block);

  __HMFActivityScopeLeave();
}

void __46__HMDFetchedAccessorySettingsController_start__block_invoke(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  v2 = dispatch_group_create();
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = __Block_byref_object_copy__172304;
  v42[4] = __Block_byref_object_dispose__172305;
  id v43 = 0;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v3 = [*(id *)(a1 + 32) driverMap];
  id v5 = v3;
  if (v3) {
    id Property = objc_getProperty(v3, v4, 8, 1);
  }
  else {
    id Property = 0;
  }
  id obj = Property;

  uint64_t v7 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v7)
  {
    uint64_t v23 = *(void *)v39;
    do
    {
      uint64_t v24 = v7;
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v39 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        dispatch_group_enter(v2);
        id v10 = [v9 keyPaths];
        uint64_t v11 = [MEMORY[0x1E4F1CAD0] setWithArray:v10];
        uint64_t v12 = [*(id *)(a1 + 32) pendingFetchKeyPaths];
        int v13 = [v12 setByAddingObjectsFromSet:v11];
        id v14 = (void *)[v13 mutableCopy];
        [*(id *)(a1 + 32) setPendingFetchKeyPaths:v14];

        id v15 = *(id *)(a1 + 40);
        uint64_t v44 = @"keyPaths";
        __int16 v45 = v10;
        id v16 = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];

        objc_initWeak(&location, *(id *)(a1 + 32));
        unint64_t v17 = [v9 driver];
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __46__HMDFetchedAccessorySettingsController_start__block_invoke_53;
        v29[3] = &unk_1E6A16D28;
        objc_copyWeak(&v36, &location);
        uint64_t v30 = v2;
        id v18 = v10;
        id v31 = v18;
        uint64_t v32 = v9;
        id v33 = *(id *)(a1 + 40);
        uint64_t v35 = v42;
        id v19 = v11;
        id v34 = v19;
        [v17 startWithKeyPaths:v18 completion:v29];

        objc_destroyWeak(&v36);
        objc_destroyWeak(&location);
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v7);
  }

  id v20 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__HMDFetchedAccessorySettingsController_start__block_invoke_68;
  block[3] = &unk_1E6A16D50;
  id v21 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v27 = v42;
  uint64_t v28 = *(void *)(a1 + 48);
  id v26 = v21;
  dispatch_group_notify(v2, v20, block);

  _Block_object_dispose(v42, 8);
}

void __46__HMDFetchedAccessorySettingsController_start__block_invoke_53(uint64_t a1, void *a2, void *a3)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v9 = [WeakRetained queue];
    dispatch_assert_queue_V2(v9);

    id v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = v8;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = HMFGetLogIdentifier();
      id v14 = v8;
      id v15 = v6;
      id v16 = v5;
      unint64_t v17 = a3;
      id v18 = *(void **)(a1 + 40);
      [*(id *)(a1 + 48) driver];
      id v19 = v37 = a1;
      *(_DWORD *)buf = 138543874;
      long long v41 = v13;
      __int16 v42 = 2114;
      id v43 = v18;
      a3 = v17;
      id v5 = v16;
      id v6 = v15;
      id v8 = v14;
      __int16 v44 = 2112;
      __int16 v45 = v19;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Fetched at startup: keyPaths: %{public}@ settings from driver: %@", buf, 0x20u);

      a1 = v37;
    }

    id v20 = (void *)MEMORY[0x1D9452090]();
    id v21 = v11;
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v41 = v23;
      __int16 v42 = 2112;
      id v43 = v5;
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Fetched at startup: settings: %@", buf, 0x16u);
    }
    uint64_t v24 = *(void **)(a1 + 56);
    v39[0] = *(void *)(a1 + 40);
    v38[0] = @"keyPaths";
    v38[1] = @"error.code";
    id v25 = NSNumber;
    id v26 = v24;
    id v27 = objc_msgSend(v25, "numberWithInteger:", objc_msgSend(v6, "code"));
    v39[1] = v27;
    v38[2] = @"domain";
    uint64_t v28 = [v6 domain];
    id v29 = (void *)v28;
    uint64_t v30 = &stru_1F2C9F1A8;
    if (v28) {
      uint64_t v30 = (__CFString *)v28;
    }
    v39[2] = v30;
    id v31 = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:3];

    if (v6)
    {
      uint64_t v32 = (void *)MEMORY[0x1D9452090]();
      id v33 = (os_unfair_lock_s *)v21;
      id v34 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v36 = uint64_t v35 = a1;
        *(_DWORD *)buf = 138543618;
        long long v41 = v36;
        __int16 v42 = 2112;
        id v43 = v6;
        _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_ERROR, "%{public}@Driver error on start %@", buf, 0x16u);

        a1 = v35;
      }

      os_unfair_lock_lock_with_options();
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), a3);
      os_unfair_lock_unlock(v33 + 2);
    }
    -[HMDFetchedAccessorySettingsController applyFetchedSettings:requestedKeyPaths:](v21, v5);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __46__HMDFetchedAccessorySettingsController_start__block_invoke_68(uint64_t a1)
{
  v38[2] = *MEMORY[0x1E4F143B8];
  v2 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
  os_unfair_lock_lock_with_options();
  id v3 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  os_unfair_lock_unlock(v2);
  os_signpost_id_t v4 = *(void *)(a1 + 56);
  id v5 = *(id **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v32 = v3;
  if (v5)
  {
    uint64_t v7 = [v5 dataSource];
    v37[0] = @"error.code";
    id v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v32, "code"));
    v37[1] = @"domain";
    v38[0] = v8;
    uint64_t v9 = [v32 domain];
    id v10 = (void *)v9;
    id v11 = &stru_1F2C9F1A8;
    if (v9) {
      id v11 = (__CFString *)v9;
    }
    v38[1] = v11;
    id v12 = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2];

    int v13 = v5[3];
    id v14 = v13;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D49D5000, v14, OS_SIGNPOST_INTERVAL_END, v4, "LocalSettingsFetch", "", buf, 2u);
    }

    id v15 = (void *)MEMORY[0x1D9452090]([v6 end]);
    id v16 = v5;
    unint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      id v18 = HMFGetLogIdentifier();
      id v19 = [v16 dataSource];
      [v19 setupStartTimestamp];
      *(_DWORD *)buf = 138543618;
      id v34 = v18;
      __int16 v35 = 2048;
      double v36 = v20;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Setup start timestamp %f", buf, 0x16u);
    }
    __uint64_t v21 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    id v22 = [v16 dataSource];
    [v22 setupStartTimestamp];
    double v24 = v23;

    id v25 = (void *)MEMORY[0x1D9452090]();
    id v26 = v16;
    id v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      double v28 = (double)(v21 / 0x3B9ACA00) - v24;
      if (v28 >= 0.0) {
        double v29 = (double)(v21 / 0x3B9ACA00) - v24;
      }
      else {
        double v29 = -v28;
      }
      uint64_t v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v34 = v30;
      __int16 v35 = 2048;
      double v36 = v29;
      _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_INFO, "%{public}@Settings creation latency %f", buf, 0x16u);
    }
    [v7 setSetupStartTimestamp:0.0];
    id v31 = [v7 currentAccessorySetupMetricDispatcher];
    [v31 markSetupEndStage:5 error:v32];
  }
}

- (HMDFetchedAccessorySettingsController)initWithQueue:(id)a3 dataSource:(id)a4 drivers:(id)a5 notificationCenter:(id)a6
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v40.receiver = self;
  v40.super_class = (Class)HMDFetchedAccessorySettingsController;
  id v15 = [(HMDFetchedAccessorySettingsController *)&v40 init];
  id v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_queue, a3);
    objc_storeStrong((id *)&v16->_dataSource, a4);
    uint64_t v17 = [MEMORY[0x1E4F1CA80] set];
    pendingFetchKeyPaths = v16->_pendingFetchKeyPaths;
    v16->_pendingFetchKeyPaths = (NSMutableSet *)v17;

    id v19 = [HMDFetchedAccessorySettingsControllerMutableKeyPathMap alloc];
    id v20 = v13;
    if (v19)
    {
      v41.receiver = v19;
      v41.super_class = (Class)HMDFetchedAccessorySettingsControllerMutableKeyPathMap;
      __uint64_t v21 = [(HMDFetchedAccessorySettingsController *)&v41 init];
      if (v21)
      {
        uint64_t v22 = [v20 mutableCopy];
        double v23 = *(void **)&v21->_lock._os_unfair_lock_opaque;
        *(void *)&v21->_lock._os_unfair_lock_opaque = v22;
      }
    }
    else
    {
      __uint64_t v21 = 0;
    }

    driverMap = v16->_driverMap;
    v16->_driverMap = (HMDFetchedAccessorySettingsControllerMutableKeyPathMap *)v21;

    v16->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v16->_notificationCenter, v14);
    uint64_t v25 = objc_opt_new();
    keyPathToSettingCache = v16->_keyPathToSettingCache;
    v16->_keyPathToSettingCache = (NSMutableDictionary *)v25;

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v27 = v20;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v36 objects:v42 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v37;
      do
      {
        uint64_t v31 = 0;
        do
        {
          if (*(void *)v37 != v30) {
            objc_enumerationMutation(v27);
          }
          id v32 = objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * v31), "driver", (void)v36);
          [v32 setDelegate:v16];

          ++v31;
        }
        while (v29 != v31);
        uint64_t v29 = [v27 countByEnumeratingWithState:&v36 objects:v42 count:16];
      }
      while (v29);
    }

    uint64_t v33 = HMFGetOSLogHandle();
    logger = v16->_logger;
    v16->_logger = (OS_os_log *)v33;
  }
  return v16;
}

- (HMDFetchedAccessorySettingsController)initWithQueue:(id)a3 dataSource:(id)a4 drivers:(id)a5
{
  id v8 = (void *)MEMORY[0x1E4F28EB8];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 defaultCenter];
  id v13 = [(HMDFetchedAccessorySettingsController *)self initWithQueue:v11 dataSource:v10 drivers:v9 notificationCenter:v12];

  return v13;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_172337 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_172337, &__block_literal_global_36_172338);
  }
  v2 = (void *)logCategory__hmf_once_v1_172339;
  return v2;
}

uint64_t __52__HMDFetchedAccessorySettingsController_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_172339;
  logCategory__hmf_once_v1_172339 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end