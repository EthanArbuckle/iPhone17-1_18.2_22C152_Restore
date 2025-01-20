@interface HMDCompositeSettingsControllerManager
+ (id)immutableSettingFromFetchReturn:(id)a3;
+ (id)logCategory;
+ (id)zoneNameForHomeUUID:(id)a3;
- (HMDCompositeSettingControllerManagerStateManager)stateManager;
- (HMDCompositeSettingsControllerManager)initWithDataSource:(id)a3;
- (HMDCompositeSettingsControllerManager)initWithDataSource:(id)a3 registry:(id)a4 controllerFactory:(id)a5 stateManagerFactory:(id)a6 logEventSubmitter:(id)a7;
- (HMDCompositeSettingsControllerManagerDataSource)dataSource;
- (HMMLogEventSubmitting)logEventSubmitter;
- (NSArray)homes;
- (NSMapTable)stringToCompositeSettingsController;
- (id)dataSourceIsCurrentDevicePrimaryResidentForHomeUUID:(void *)a1;
- (id)dumpStateInfo;
- (void)_createSettingControllerForAccessory:(id)a3 homeUUID:(id)a4;
- (void)_manageCharacteristicsBackedSettingsChangeForHomeUUID:(void *)a3 accessoryUUID:;
- (void)_postSettingUpdatesIfDifferentWithHome:(void *)a3 uuid:(void *)a4 settings:(void *)a5 metadata:;
- (void)_publishCharacteristicBackedSettingsChangeForHomeUUID:(void *)a3 accessoryUUID:(void *)a4 allowHeySiri:(void *)a5 tapToAccess:;
- (void)_updateLanguageEventIfNeededWithHome:(void *)a3 uuid:;
- (void)accessorySettingsLocalMessageHandler:(id)a3 didReceiveFetchRequestMessage:(id)a4 withHomeUUID:(id)a5 accessoryUUID:(id)a6 keyPaths:(id)a7 callerVersion:(id)a8 callerPrivilege:(unint64_t)a9 siriAvailableLanguagesSetting:(id)a10;
- (void)accessorySettingsLocalMessageHandler:(id)a3 didReceiveUpdateRequestMessage:(id)a4 withHomeUUID:(id)a5 accessoryUUID:(id)a6 keyPath:(id)a7 value:(id)a8 callerVersion:(id)a9;
- (void)applyOnboardingSelections:(id)a3 accessoryUUID:(id)a4 homeUUID:(id)a5 completion:(id)a6;
- (void)didConfigureCompositeSettingsControllerForHomeUUID:(id)a3 accessoryUUID:(id)a4;
- (void)didUpdateCurrentRunState:(int64_t)a3 updatedState:(int64_t)a4 forHome:(id)a5;
- (void)didUpdateSiriEndpointSettingForHomeUUID:(id)a3 accessoryUUID:(id)a4;
- (void)languagesDidChangeForHome:(id)a3;
- (void)localFetchSettingsForUUID:(id)a3 homeUUID:(id)a4 withKeyPaths:(id)a5 callerVersion:(id)a6 callerPrivilege:(unint64_t)a7 completion:(id)a8;
- (void)localFetchSettingsForUUID:(id)a3 homeUUID:(id)a4 withKeyPaths:(id)a5 completion:(id)a6;
- (void)localUpdateSettingForUUID:(id)a3 homeUUID:(id)a4 keyPath:(id)a5 value:(id)a6 callerVersion:(id)a7 completion:(id)a8;
- (void)localUpdateSettingForUUID:(id)a3 homeUUID:(id)a4 keyPath:(id)a5 value:(id)a6 completion:(id)a7;
- (void)removeHomeZone:(id)a3;
- (void)settingsController:(id)a3 didUpdateSettings:(id)a4 metadata:(id)a5;
@end

@implementation HMDCompositeSettingsControllerManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateManager, 0);
  objc_storeStrong((id *)&self->_stringToCompositeSettingsController, 0);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong(&self->_compositeSettingsControllerFactory, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_registry, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

- (HMDCompositeSettingControllerManagerStateManager)stateManager
{
  return (HMDCompositeSettingControllerManagerStateManager *)objc_getProperty(self, a2, 56, 1);
}

- (NSMapTable)stringToCompositeSettingsController
{
  return (NSMapTable *)objc_getProperty(self, a2, 48, 1);
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return (HMMLogEventSubmitting *)objc_getProperty(self, a2, 40, 1);
}

- (HMDCompositeSettingsControllerManagerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDCompositeSettingsControllerManagerDataSource *)WeakRetained;
}

- (NSArray)homes
{
  v2 = [(HMDCompositeSettingsControllerManager *)self dataSource];
  v3 = [v2 homes];

  return (NSArray *)v3;
}

- (void)languagesDidChangeForHome:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v15 = v8;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling languages changed for homeUUID: %@", buf, 0x16u);
  }
  if (v6) {
    Property = objc_getProperty(v6, v9, 24, 1);
  }
  else {
    Property = 0;
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __67__HMDCompositeSettingsControllerManager_languagesDidChangeForHome___block_invoke;
  v12[3] = &unk_264A2F820;
  v12[4] = v6;
  id v13 = v4;
  id v11 = v4;
  dispatch_async(Property, v12);
}

void __67__HMDCompositeSettingsControllerManager_languagesDidChangeForHome___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "stringToCompositeSettingsController", 0);
  v3 = [v2 objectEnumerator];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v9 = *(void **)(a1 + 40);
        v10 = [v8 homeUUID];
        LODWORD(v9) = objc_msgSend(v9, "hmf_isEqualToUUID:", v10);

        if (v9)
        {
          id v11 = *(void **)(a1 + 32);
          v12 = [v8 homeUUID];
          id v13 = [v8 uuid];
          -[HMDCompositeSettingsControllerManager _updateLanguageEventIfNeededWithHome:uuid:](v11, v12, v13);
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
}

- (void)_updateLanguageEventIfNeededWithHome:(void *)a3 uuid:
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v7 = a3;
  if (a1)
  {
    Property = objc_getProperty(a1, v6, 24, 1);
    dispatch_assert_queue_V2(Property);
    v9 = [a1 dataSource];
    v10 = [v9 eventStoreReadHandle];
    id v11 = [a1 stateManager];
    uint64_t v12 = [v11 stateForHomeUUID:v5];

    if (v12 == 3 && v10)
    {
      [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
      double v14 = v13;
      long long v15 = [v9 eventSourceForCompositeSettingsController];
      long long v16 = [v9 languageListProviderForHomeUUID:v5];
      uint64_t v17 = [v16 languageValueList];
      uint64_t v18 = (void *)v17;
      uint64_t v19 = (void *)MEMORY[0x263EFFA68];
      if (v17) {
        uint64_t v19 = (void *)v17;
      }
      id v20 = v19;

      if ([v20 count])
      {
        v44 = MEMORY[0x230FBBF00](v5, v7, @"root.siri.availableLanguages");
        uint64_t v21 = objc_msgSend(v10, "lastEventForTopic:");
        v40 = (void *)v21;
        v41 = v15;
        if (v21)
        {
          id v45 = 0;
          v22 = [MEMORY[0x263F0E3F8] decodeSettingFromEvent:v21 error:&v45];
          id v23 = v45;
          if (v23)
          {
            v42 = v22;
            context = (void *)MEMORY[0x230FBD990]();
            id v24 = a1;
            v25 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              v26 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543874;
              v47 = v26;
              __int16 v48 = 2112;
              v49 = v44;
              __int16 v50 = 2112;
              id v51 = v23;
              _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_INFO, "%{public}@Error reading stored setting for topic %@, error: %@", buf, 0x20u);
            }
            long long v15 = v41;
            v22 = v42;
          }
        }
        else
        {
          v22 = 0;
        }
        v31 = (void *)[objc_alloc(MEMORY[0x263F0E420]) initWithKeyPath:@"root.siri.availableLanguages" readOnly:1 languageValues:v20];
        v32 = v31;
        if (!v22 || ([v31 isEqual:v22] & 1) == 0)
        {
          v43 = v22;
          v33 = (void *)MEMORY[0x230FBD990]();
          id v34 = a1;
          v35 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          {
            v36 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            v47 = v36;
            __int16 v48 = 2112;
            v49 = v44;
            __int16 v50 = 2112;
            id v51 = v32;
            _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_DEBUG, "%{public}@Updating language event for topic %@, with Value: %@", buf, 0x20u);
          }
          long long v15 = v41;
          v37 = (void *)[objc_alloc(MEMORY[0x263F0E3F8]) initWithSetting:v32 eventSource:v41 eventTimestamp:v14];
          v38 = [v9 eventForwarder];
          [v38 forwardEvent:v37 topic:v44 completion:&__block_literal_global_121_218319];

          v22 = v43;
        }
      }
    }
    else
    {
      v27 = (void *)MEMORY[0x230FBD990]();
      id v28 = a1;
      v29 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        v30 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v47 = v30;
        _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_INFO, "%{public}@Not checking for need to post language events because this device is not the primary resident.", buf, 0xCu);
      }
    }
  }
}

- (void)didUpdateCurrentRunState:(int64_t)a3 updatedState:(int64_t)a4 forHome:(id)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a5;
  v9 = (void *)MEMORY[0x230FBD990]();
  v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544130;
    v29 = v12;
    __int16 v30 = 2048;
    int64_t v31 = a3;
    __int16 v32 = 2048;
    int64_t v33 = a4;
    __int16 v34 = 2112;
    id v35 = v8;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@CurrentState: %ld, UpdatedState: %ld, Home:%@", buf, 0x2Au);
  }
  double v13 = [(HMDCompositeSettingsControllerManager *)v10 dataSource];
  double v14 = [v13 homes];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __87__HMDCompositeSettingsControllerManager_didUpdateCurrentRunState_updatedState_forHome___block_invoke;
  v26[3] = &unk_264A2B2D0;
  id v15 = v8;
  id v27 = v15;
  long long v16 = objc_msgSend(v14, "na_firstObjectPassingTest:", v26);

  if (!v16)
  {
    uint64_t v18 = (void *)MEMORY[0x230FBD990]();
    uint64_t v19 = v10;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v29 = v21;
      __int16 v30 = 2112;
      int64_t v31 = (int64_t)v15;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Home not found %@", buf, 0x16u);
    }
  }
  if (v10) {
    Property = objc_getProperty(v10, v17, 24, 1);
  }
  else {
    Property = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __87__HMDCompositeSettingsControllerManager_didUpdateCurrentRunState_updatedState_forHome___block_invoke_144;
  block[3] = &unk_264A2F820;
  block[4] = v10;
  id v25 = v16;
  id v23 = v16;
  dispatch_async(Property, block);
}

uint64_t __87__HMDCompositeSettingsControllerManager_didUpdateCurrentRunState_updatedState_forHome___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 uuid];
  uint64_t v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(void *)(a1 + 32));

  return v4;
}

void __87__HMDCompositeSettingsControllerManager_didUpdateCurrentRunState_updatedState_forHome___block_invoke_144(uint64_t a1)
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  if (v1)
  {
    Property = objc_getProperty(v1, v2, 24, 1);
    dispatch_assert_queue_V2(Property);
    id v5 = [v1 stateManager];
    uint64_t v6 = [v3 uuid];
    uint64_t v7 = [v5 stateForHomeUUID:v6];

    int v8 = 0;
    switch(v7)
    {
      case 1:
        v9 = (void *)MEMORY[0x230FBD990]();
        id v10 = v1;
        id v11 = HMFGetOSLogHandle();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
          goto LABEL_36;
        }
        uint64_t v12 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v71 = v12;
        __int16 v72 = 2048;
        uint64_t v73 = 1;
        double v13 = "%{public}@Not creating controllers for state %ld";
        double v14 = v11;
        os_log_type_t v15 = OS_LOG_TYPE_INFO;
        uint32_t v16 = 22;
        goto LABEL_35;
      case 2:
        goto LABEL_6;
      case 3:
        int v8 = 1;
LABEL_6:
        uint64_t v17 = (void *)MEMORY[0x230FBD990]();
        id v18 = v1;
        uint64_t v19 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          id v20 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          v71 = v20;
          __int16 v72 = 2048;
          uint64_t v73 = v7;
          __int16 v74 = 2112;
          id v75 = v3;
          _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@creating controller for state %ld, home: %@", buf, 0x20u);
        }
        id v21 = v3;
        id v23 = objc_getProperty(v18, v22, 24, 1);
        dispatch_assert_queue_V2(v23);
        if (v8)
        {
          id v51 = v21;
          id v52 = v3;
          long long v67 = 0u;
          long long v68 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          id v24 = [v18 stringToCompositeSettingsController];
          id v25 = [v24 objectEnumerator];

          id obj = v25;
          uint64_t v56 = [v25 countByEnumeratingWithState:&v65 objects:buf count:16];
          if (v56)
          {
            uint64_t v54 = *(void *)v66;
            v55 = v18;
            do
            {
              uint64_t v26 = 0;
              do
              {
                if (*(void *)v66 != v54) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v58 = v26;
                id v27 = *(void **)(*((void *)&v65 + 1) + 8 * v26);
                id v28 = +[HMDCompositeSettingsAccessorySettingsModel allKeyPaths];
                v29 = +[HMDHomeKitVersion currentVersion];
                v57 = v27;
                __int16 v30 = [v27 fetchSynchronousSettingsForKeyPaths:v28 callerVersion:v29 callerPrivilege:3];

                int64_t v31 = [MEMORY[0x263EFF9A0] dictionary];
                __int16 v32 = [MEMORY[0x263EFF9A0] dictionary];
                long long v61 = 0u;
                long long v62 = 0u;
                long long v63 = 0u;
                long long v64 = 0u;
                id v33 = v30;
                uint64_t v34 = [v33 countByEnumeratingWithState:&v61 objects:v69 count:16];
                if (v34)
                {
                  uint64_t v35 = v34;
                  uint64_t v36 = *(void *)v62;
                  do
                  {
                    for (uint64_t i = 0; i != v35; ++i)
                    {
                      if (*(void *)v62 != v36) {
                        objc_enumerationMutation(v33);
                      }
                      v38 = *(void **)(*((void *)&v61 + 1) + 8 * i);
                      v39 = [v38 setting];
                      v40 = [v38 metadata];
                      v41 = [v38 metadata];
                      v42 = [v41 keyPath];

                      if (v39) {
                        BOOL v43 = v40 == 0;
                      }
                      else {
                        BOOL v43 = 1;
                      }
                      if (!v43 && v42 != 0)
                      {
                        [v31 setObject:v39 forKeyedSubscript:v42];
                        [v32 setObject:v40 forKeyedSubscript:v42];
                      }
                    }
                    uint64_t v35 = [v33 countByEnumeratingWithState:&v61 objects:v69 count:16];
                  }
                  while (v35);
                }

                id v45 = [v57 homeUUID];
                v46 = [v57 uuid];
                id v18 = v55;
                -[HMDCompositeSettingsControllerManager _postSettingUpdatesIfDifferentWithHome:uuid:settings:metadata:](v55, v45, v46, v31, v32);

                uint64_t v26 = v58 + 1;
              }
              while (v58 + 1 != v56);
              uint64_t v56 = [obj countByEnumeratingWithState:&v65 objects:buf count:16];
            }
            while (v56);
          }

          id v21 = v51;
          id v3 = v52;
        }
        v47 = [v21 accessories];
        __int16 v48 = objc_msgSend(v47, "na_filter:", &__block_literal_global_152);
        v59[0] = MEMORY[0x263EF8330];
        v59[1] = 3221225472;
        v59[2] = __87__HMDCompositeSettingsControllerManager__actualScanHomeAndCreateControllers_isPrimary___block_invoke_2;
        v59[3] = &unk_264A27D00;
        v59[4] = v18;
        id v49 = v21;
        id v60 = v49;
        id v50 = (id)objc_msgSend(v48, "na_map:", v59);

        break;
      case 4:
        v9 = (void *)MEMORY[0x230FBD990]();
        id v10 = v1;
        id v11 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          uint64_t v12 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v71 = v12;
          double v13 = "%{public}@In uninitialized/Unknown state";
          double v14 = v11;
          os_log_type_t v15 = OS_LOG_TYPE_ERROR;
          uint32_t v16 = 12;
LABEL_35:
          _os_log_impl(&dword_22F52A000, v14, v15, v13, buf, v16);
        }
LABEL_36:

        break;
      default:
        break;
    }
  }
}

- (void)_postSettingUpdatesIfDifferentWithHome:(void *)a3 uuid:(void *)a4 settings:(void *)a5 metadata:
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v59 = a3;
  id v10 = a4;
  id v56 = a5;
  if (a1)
  {
    Property = objc_getProperty(a1, v11, 24, 1);
    dispatch_assert_queue_V2(Property);
    double v13 = [a1 dataSource];
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    double v15 = v14;
    id v51 = [v13 eventSourceForCompositeSettingsController];
    id v52 = v13;
    v57 = [v13 eventStoreReadHandle];
    uint32_t v16 = [a1 stateManager];
    uint64_t v17 = [v16 stateForHomeUUID:v9];

    id v18 = (void *)MEMORY[0x230FBD990]();
    id v19 = a1;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      id v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      v69 = v21;
      __int16 v70 = 2112;
      id v71 = v57;
      __int16 v72 = 2048;
      uint64_t v73 = [v10 count];
      __int16 v74 = 2048;
      uint64_t v75 = v17;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Posting updates with eventStoreHandle:%@, for settings count:%lu, with run state:%ld", buf, 0x2Au);
    }
    if (v17 == 3 && v57)
    {
      uint64_t v54 = v19;
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      id v50 = v10;
      id obj = v10;
      uint64_t v58 = [obj countByEnumeratingWithState:&v63 objects:v67 count:16];
      if (v58)
      {
        uint64_t v55 = *(void *)v64;
        id v53 = v9;
        do
        {
          for (uint64_t i = 0; i != v58; ++i)
          {
            if (*(void *)v64 != v55) {
              objc_enumerationMutation(obj);
            }
            uint64_t v23 = *(void *)(*((void *)&v63 + 1) + 8 * i);
            uint64_t v24 = [obj objectForKeyedSubscript:v23];
            id v25 = MEMORY[0x230FBBF00](v9, v59, v23);
            uint64_t v26 = [v57 lastEventForTopic:v25];
            long long v61 = (void *)v26;
            if (v26)
            {
              id v62 = 0;
              id v27 = [MEMORY[0x263F0E3F8] decodeSettingFromEvent:v26 error:&v62];
              id v28 = v62;
              if (v28)
              {
                v29 = (void *)MEMORY[0x230FBD990]();
                id v30 = v54;
                int64_t v31 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v33 = uint64_t v32 = v24;
                  *(_DWORD *)buf = 138543874;
                  v69 = v33;
                  __int16 v70 = 2112;
                  id v71 = v25;
                  __int16 v72 = 2112;
                  uint64_t v73 = (uint64_t)v28;
                  _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_INFO, "%{public}@Error reading stored setting for topic %@, error: %@", buf, 0x20u);

                  uint64_t v24 = v32;
                }

                id v9 = v53;
              }
            }
            else
            {
              id v27 = 0;
            }
            uint64_t v34 = [HMDCompositeSettingOperationResult alloc];
            uint64_t v35 = [v56 objectForKeyedSubscript:v23];
            uint64_t v36 = (void *)v24;
            v37 = [(HMDCompositeSettingOperationResult *)v34 initWithKeyPath:v23 setting:v24 metadata:v35 error:0];
            v38 = +[HMDCompositeSettingsControllerManager immutableSettingFromFetchReturn:v37];

            if (v27 && [v27 isEqual:v38])
            {
              v39 = (void *)MEMORY[0x230FBD990]();
              id v40 = v54;
              v41 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
              {
                v42 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543874;
                v69 = v42;
                __int16 v70 = 2112;
                id v71 = v59;
                __int16 v72 = 2112;
                uint64_t v73 = v23;
                _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_INFO, "%{public}@Skip sending event for accessory %@ setting %@ as it matches stored", buf, 0x20u);
              }
              id v9 = v53;
            }
            else
            {
              BOOL v43 = (void *)[objc_alloc(MEMORY[0x263F0E3F8]) initWithSetting:v38 eventSource:v51 eventTimestamp:v15];
              v44 = [v52 eventForwarder];
              [v44 forwardEvent:v43 topic:v25 completion:&__block_literal_global_118_218344];
            }
          }
          uint64_t v58 = [obj countByEnumeratingWithState:&v63 objects:v67 count:16];
        }
        while (v58);
      }

      id v45 = (void *)MEMORY[0x230FBD990]();
      id v46 = v54;
      v47 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        __int16 v48 = HMFGetLogIdentifier();
        id v49 = HMFBooleanToString();
        *(_DWORD *)buf = 138543618;
        v69 = v48;
        __int16 v70 = 2112;
        id v71 = v49;
        _os_log_impl(&dword_22F52A000, v47, OS_LOG_TYPE_INFO, "%{public}@Diff from persistent store?: %@, skipping all updates", buf, 0x16u);
      }
      -[HMDCompositeSettingsControllerManager _updateLanguageEventIfNeededWithHome:uuid:](v46, v9, v59);
      id v10 = v50;
    }
  }
}

uint64_t __87__HMDCompositeSettingsControllerManager__actualScanHomeAndCreateControllers_isPrimary___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    *(void *)buf = 0;
    *(void *)&buf[8] = 0;
    int v8 = [v3 uuid];

    if (v8)
    {
      id v9 = [v3 uuid];
      [v9 getUUIDBytes:buf];
    }
    else
    {
      *(_OWORD *)buf = *MEMORY[0x263F42690];
    }
    long long v26 = *(_OWORD *)buf;
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&buf[12] = 1040;
    *(_DWORD *)&buf[14] = 16;
    *(_WORD *)&buf[18] = 2096;
    *(void *)&buf[20] = &v26;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Creating controller for: %{uuid_t}.16P", buf, 0x1Cu);
  }
  id v10 = [*(id *)(a1 + 40) uuid];
  id v11 = [v3 uuid];
  id v12 = v3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    double v13 = v12;
  }
  else {
    double v13 = 0;
  }
  id v14 = v13;

  double v15 = [*(id *)(a1 + 32) stringToCompositeSettingsController];
  uint32_t v16 = [NSString stringWithFormat:@"%@.%@", v10, v11];
  uint64_t v17 = [v15 objectForKey:v16];

  if (v17)
  {
    id v18 = (void *)MEMORY[0x230FBD990]();
    id v19 = *(id *)(a1 + 32);
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      id v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v21;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v11;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v10;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@controller for uuid:%@, homeUUID:%@ already exists", buf, 0x20u);
    }
  }
  else
  {
    SEL v22 = *(void **)(a1 + 32);
    uint64_t v23 = [*(id *)(a1 + 40) uuid];
    [v22 _createSettingControllerForAccessory:v14 homeUUID:v23];
  }
  return 0;
}

BOOL __87__HMDCompositeSettingsControllerManager__actualScanHomeAndCreateControllers_isPrimary___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 siriEndpointProfile];
    BOOL v7 = v6 != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)didUpdateSiriEndpointSettingForHomeUUID:(id)a3 accessoryUUID:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(HMDCompositeSettingsControllerManager *)self stateManager];
  uint64_t v9 = [v8 stateForHomeUUID:v6];

  if (v9 == 3)
  {
    if (self) {
      Property = objc_getProperty(self, v10, 24, 1);
    }
    else {
      Property = 0;
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __95__HMDCompositeSettingsControllerManager_didUpdateSiriEndpointSettingForHomeUUID_accessoryUUID___block_invoke;
    block[3] = &unk_264A2F2F8;
    block[4] = self;
    id v17 = v6;
    id v18 = v7;
    dispatch_async(Property, block);
  }
  else
  {
    id v12 = (void *)MEMORY[0x230FBD990]();
    double v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      double v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      id v20 = v15;
      __int16 v21 = 2112;
      id v22 = v6;
      __int16 v23 = 2112;
      id v24 = v7;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Ignoring siri endpoint setting update as we are not the primary resident for home:%@ accessory:%@", buf, 0x20u);
    }
  }
}

void __95__HMDCompositeSettingsControllerManager_didUpdateSiriEndpointSettingForHomeUUID_accessoryUUID___block_invoke(void **a1)
{
}

- (void)_manageCharacteristicsBackedSettingsChangeForHomeUUID:(void *)a3 accessoryUUID:
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v7 = a3;
  if (a1)
  {
    Property = objc_getProperty(a1, v6, 24, 1);
    dispatch_assert_queue_V2(Property);
    uint64_t v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = a1;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v5;
      *(_WORD *)&buf[22] = 2112;
      uint64_t v55 = v7;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@managing characteristic backed settings for home:%@, accessory:%@", buf, 0x20u);
    }
    double v13 = [v10 dataSource];
    id v14 = [v13 siriEndpointBridge];

    if (!v14)
    {
      uint64_t v25 = (void *)MEMORY[0x230FBD990]();
      id v26 = v10;
      uint64_t v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        id v28 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v28;
        _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@Nil siriEndpointBridge", buf, 0xCu);
      }
      goto LABEL_27;
    }
    double v15 = [v14 readValueValueForAccessoryUUID:v7 homeUUID:v5 forKeyPath:@"root.siri.allowHeySiri"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint32_t v16 = v15;
    }
    else {
      uint32_t v16 = 0;
    }
    id v17 = v16;

    id v18 = [v14 readValueValueForAccessoryUUID:v7 homeUUID:v5 forKeyPath:@"root.siri.tapToAccess"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v19 = v18;
    }
    else {
      id v19 = 0;
    }
    id v20 = v19;

    uint64_t v21 = [v17 BOOLValue];
    uint64_t v22 = [v20 BOOLValue];

    if (v17)
    {
      __int16 v23 = [[HMDCompositeBoolSetting alloc] initWithValue:v21 readVersion:@"7.2" writeVersion:@"7.2"];
      if (v20)
      {
LABEL_13:
        id v24 = [[HMDCompositeBoolSetting alloc] initWithValue:v22 readVersion:@"7.2" writeVersion:@"7.2"];
        goto LABEL_19;
      }
    }
    else
    {
      __int16 v23 = 0;
      if (v20) {
        goto LABEL_13;
      }
    }
    id v24 = 0;
LABEL_19:
    id v29 = v5;
    id v30 = v7;
    int64_t v31 = v23;
    uint64_t v32 = v24;
    uint64_t v34 = objc_getProperty(v10, v33, 24, 1);
    dispatch_assert_queue_V2(v34);
    if (v31
      && v32
      && ![(HMDCompositeBoolSetting *)v31 BOOLValue]
      && ![(HMDCompositeBoolSetting *)v32 BOOLValue])
    {
      id v45 = (void *)MEMORY[0x230FBD990]();
      id v46 = v10;
      v47 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        __int16 v48 = v52 = v45;
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v48;
        _os_log_impl(&dword_22F52A000, v47, OS_LOG_TYPE_INFO, "%{public}@Setting Siri enabled to NO", buf, 0xCu);

        id v45 = v52;
      }

      id v53 = [[HMDCompositeSettingBoolValue alloc] initWithValue:0];
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __134__HMDCompositeSettingsControllerManager__processCharacteristicBackedSettingsChangeForHomeUUID_accessoryUUID_allowHeySiri_tapToAccess___block_invoke;
      uint64_t v55 = &unk_264A27C90;
      id v56 = v46;
      id v49 = v29;
      id v57 = v49;
      id v50 = v30;
      id v58 = v50;
      id v59 = v31;
      id v60 = v32;
      [v46 localUpdateSettingForUUID:v50 homeUUID:v49 keyPath:@"root.siri.siriEnabled" value:v53 completion:buf];
    }
    else
    {
      uint64_t v35 = (void *)MEMORY[0x230FBD990]();
      id v36 = v10;
      v37 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v51 = v31;
        v38 = v32;
        v39 = v14;
        id v40 = v7;
        id v41 = v5;
        id v42 = v30;
        v44 = id v43 = v29;
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v44;
        _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_INFO, "%{public}@Not transforming allowHeySiri and tapToAccess settings", buf, 0xCu);

        id v29 = v43;
        id v30 = v42;
        id v5 = v41;
        id v7 = v40;
        id v14 = v39;
        uint64_t v32 = v38;
        int64_t v31 = v51;
      }

      -[HMDCompositeSettingsControllerManager _publishCharacteristicBackedSettingsChangeForHomeUUID:accessoryUUID:allowHeySiri:tapToAccess:](v36, v29, v30, v31, v32);
    }

LABEL_27:
  }
}

void __134__HMDCompositeSettingsControllerManager__processCharacteristicBackedSettingsChangeForHomeUUID_accessoryUUID_allowHeySiri_tapToAccess___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)MEMORY[0x230FBD990]();
  id v11 = a1[4];
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    double v13 = HMFGetLogIdentifier();
    int v14 = 138544130;
    double v15 = v13;
    __int16 v16 = 2112;
    id v17 = v7;
    __int16 v18 = 2112;
    id v19 = v9;
    __int16 v20 = 2112;
    id v21 = v8;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Siri enabled setting update returned result:%@, home:%@ accessory:%@", (uint8_t *)&v14, 0x2Au);
  }
  -[HMDCompositeSettingsControllerManager _publishCharacteristicBackedSettingsChangeForHomeUUID:accessoryUUID:allowHeySiri:tapToAccess:](a1[4], a1[5], a1[6], a1[7], a1[8]);
}

- (void)_publishCharacteristicBackedSettingsChangeForHomeUUID:(void *)a3 accessoryUUID:(void *)a4 allowHeySiri:(void *)a5 tapToAccess:
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a1)
  {
    double v13 = [a1 stringToCompositeSettingsController];
    int v14 = [NSString stringWithFormat:@"%@.%@", v9, v10];
    double v15 = [v13 objectForKey:v14];

    if (v15)
    {
      id v51 = @"root.siri.siriEnabled";
      __int16 v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v51 count:1];
      id v17 = +[HMDHomeKitVersion currentVersion];
      __int16 v18 = [v15 fetchSynchronousSettingsForKeyPaths:v16 callerVersion:v17 callerPrivilege:3];

      if ([v18 count]
        && ([v18 firstObject],
            id v19 = objc_claimAutoreleasedReturnValue(),
            [v19 setting],
            __int16 v20 = objc_claimAutoreleasedReturnValue(),
            v20,
            v19,
            v20))
      {
        v47 = v9;
        id v50 = v12;
        id v21 = [v18 firstObject];
        uint64_t v22 = [v21 setting];

        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          __int16 v23 = v22;
        }
        else {
          __int16 v23 = 0;
        }
        id v49 = v23;

        id v24 = [MEMORY[0x263EFF9A0] dictionary];
        uint64_t v25 = [MEMORY[0x263EFF9A0] dictionary];
        __int16 v48 = v11;
        if (v11)
        {
          id v26 = (void *)v25;
          uint64_t v27 = [HMDCompositeBoolSetting alloc];
          if ([(HMDCompositeBoolSetting *)v11 BOOLValue]) {
            uint64_t v28 = [v49 BOOLValue];
          }
          else {
            uint64_t v28 = 0;
          }
          id v11 = [(HMDCompositeBoolSetting *)v27 initWithValue:v28 readVersion:@"7.2" writeVersion:@"7.2"];
          v38 = [HMDCompositeSettingMetadata alloc];
          v39 = [[HMDCompositeSettingPrivileges alloc] initWithMinReadUserPrivilege:4];
          id v46 = [(HMDCompositeSettingMetadata *)v38 initWithKeyPath:@"root.siri.allowHeySiri" constraint:0 privileges:v39];
        }
        else
        {
          id v26 = (void *)v25;
          id v46 = 0;
        }
        id v40 = v50;
        if (v50)
        {
          id v41 = [HMDCompositeBoolSetting alloc];
          if ([(HMDCompositeSettingMetadata *)v50 BOOLValue]) {
            uint64_t v42 = [v49 BOOLValue];
          }
          else {
            uint64_t v42 = 0;
          }
          id v43 = [(HMDCompositeBoolSetting *)v41 initWithValue:v42 readVersion:@"7.2" writeVersion:@"7.2"];
          v44 = [HMDCompositeSettingMetadata alloc];
          id v45 = [[HMDCompositeSettingPrivileges alloc] initWithMinReadUserPrivilege:4];
          id v40 = [(HMDCompositeSettingMetadata *)v44 initWithKeyPath:@"root.siri.tapToAccess" constraint:0 privileges:v45];
        }
        else
        {
          id v43 = 0;
        }
        [v24 setObject:v11 forKeyedSubscript:@"root.siri.allowHeySiri"];
        [v24 setObject:v43 forKeyedSubscript:@"root.siri.tapToAccess"];
        [v26 setObject:v46 forKeyedSubscript:@"root.siri.allowHeySiri"];
        [v26 setObject:v40 forKeyedSubscript:@"root.siri.tapToAccess"];
        id v9 = v47;
        -[HMDCompositeSettingsControllerManager _postSettingUpdatesIfDifferentWithHome:uuid:settings:metadata:](a1, v47, v10, v24, v26);

        id v11 = v48;
        id v12 = v50;
      }
      else
      {
        id v29 = (void *)MEMORY[0x230FBD990]();
        id v30 = a1;
        int64_t v31 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v33 = id v32 = v9;
          *(_DWORD *)buf = 138543618;
          id v53 = v33;
          __int16 v54 = 2112;
          id v55 = v18;
          _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch SiriEnabled setting operation result:%@", buf, 0x16u);

          id v9 = v32;
        }
      }
    }
    else
    {
      uint64_t v34 = (void *)MEMORY[0x230FBD990]();
      id v35 = a1;
      id v36 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v37 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        id v53 = v37;
        __int16 v54 = 2112;
        id v55 = v9;
        __int16 v56 = 2112;
        id v57 = v10;
        _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_ERROR, "%{public}@No controller for home:%@ accessory:%@", buf, 0x20u);
      }
    }
  }
}

- (void)didConfigureCompositeSettingsControllerForHomeUUID:(id)a3 accessoryUUID:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDCompositeSettingsControllerManager *)self stateManager];
  uint64_t v9 = [v8 stateForHomeUUID:v6];

  if (v9 == 3)
  {
    if (self) {
      Property = objc_getProperty(self, v10, 24, 1);
    }
    else {
      Property = 0;
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __106__HMDCompositeSettingsControllerManager_didConfigureCompositeSettingsControllerForHomeUUID_accessoryUUID___block_invoke;
    block[3] = &unk_264A2F2F8;
    block[4] = self;
    id v17 = v6;
    id v18 = v7;
    dispatch_async(Property, block);
  }
  else
  {
    id v12 = (void *)MEMORY[0x230FBD990]();
    double v13 = self;
    int v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      double v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      __int16 v20 = v15;
      __int16 v21 = 2112;
      id v22 = v6;
      __int16 v23 = 2112;
      id v24 = v7;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Ignoring composite setting controller configuration update as we are not the primary resident for home:%@ accessory:%@", buf, 0x20u);
    }
  }
}

void __106__HMDCompositeSettingsControllerManager_didConfigureCompositeSettingsControllerForHomeUUID_accessoryUUID___block_invoke(void **a1)
{
}

- (void)removeHomeZone:(id)a3
{
  id v5 = a3;
  if (self) {
    Property = objc_getProperty(self, v4, 24, 1);
  }
  else {
    Property = 0;
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__HMDCompositeSettingsControllerManager_removeHomeZone___block_invoke;
  v8[3] = &unk_264A2F820;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(Property, v8);
}

void __56__HMDCompositeSettingsControllerManager_removeHomeZone___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    id v2 = *(id *)(a1 + 40);
    id v6 = [(id)objc_opt_class() zoneNameForHomeUUID:v2];
    id v4 = objc_getProperty(v1, v3, 16, 1);
    objc_msgSend(v4, "removeZoneWithZoneName:uuid:workQueue:", v6, v2, objc_getProperty(v1, v5, 24, 1));
  }
}

- (void)applyOnboardingSelections:(id)a3 accessoryUUID:(id)a4 homeUUID:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v14 = a6;
  if (self) {
    Property = objc_getProperty(self, v13, 24, 1);
  }
  else {
    Property = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __101__HMDCompositeSettingsControllerManager_applyOnboardingSelections_accessoryUUID_homeUUID_completion___block_invoke;
  block[3] = &unk_264A2DDC0;
  block[4] = self;
  id v21 = v10;
  id v22 = v11;
  id v23 = v12;
  id v24 = v14;
  id v16 = v14;
  id v17 = v12;
  id v18 = v11;
  id v19 = v10;
  dispatch_async(Property, block);
}

void __101__HMDCompositeSettingsControllerManager_applyOnboardingSelections_accessoryUUID_homeUUID_completion___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = *(void **)(a1 + 48);
  SEL v3 = *(void **)(a1 + 56);
  id v4 = *(void **)(a1 + 64);
  id v5 = *(id *)(a1 + 40);
  id v6 = v2;
  id v7 = v3;
  id v8 = v4;
  id v10 = v8;
  if (!v1) {
    goto LABEL_7;
  }
  if (!v5)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v6)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v7)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (v8)
  {
    Property = objc_getProperty(v1, v9, 24, 1);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __102__HMDCompositeSettingsControllerManager__applyOnboardingSelections_accessoryUUID_homeUUID_completion___block_invoke;
    block[3] = &unk_264A2DDC0;
    block[4] = v1;
    id v14 = v7;
    id v17 = v10;
    id v15 = v6;
    id v16 = v5;
    dispatch_async(Property, block);

LABEL_7:
    return;
  }
LABEL_11:
  id v12 = (id *)_HMFPreconditionFailure();
  __102__HMDCompositeSettingsControllerManager__applyOnboardingSelections_accessoryUUID_homeUUID_completion___block_invoke(v12);
}

void __102__HMDCompositeSettingsControllerManager__applyOnboardingSelections_accessoryUUID_homeUUID_completion___block_invoke(id *a1)
{
  uint64_t v92 = *MEMORY[0x263EF8340];
  id v2 = [a1[4] stateManager];
  uint64_t v3 = [v2 stateForHomeUUID:a1[5]];

  if (v3 != 3)
  {
    id v46 = (void *)MEMORY[0x230FBD990]();
    id v47 = a1[4];
    __int16 v48 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      id v49 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v89 = v49;
      _os_log_impl(&dword_22F52A000, v48, OS_LOG_TYPE_INFO, "%{public}@Device is not a primary resident", buf, 0xCu);
    }
    id v6 = [MEMORY[0x263F087E8] hmfErrorWithCode:14];
    id v50 = (void (*)(void))*((void *)a1[8] + 2);
    goto LABEL_12;
  }
  id v4 = [a1[4] stringToCompositeSettingsController];
  id v5 = [NSString stringWithFormat:@"%@.%@", a1[5], a1[6]];
  id v6 = [v4 objectForKey:v5];

  if (!v6 || ([v6 configured] & 1) == 0)
  {
    id v51 = (void *)MEMORY[0x230FBD990]();
    id v52 = a1[4];
    id v53 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
    {
      __int16 v54 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v89 = v54;
      _os_log_impl(&dword_22F52A000, v53, OS_LOG_TYPE_INFO, "%{public}@Controller is not created or not configured", buf, 0xCu);
    }
    id v50 = (void (*)(void))*((void *)a1[8] + 2);
LABEL_12:
    v50();
    goto LABEL_13;
  }
  id v7 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:7];
  id v8 = [HMDCompositeSettingsKeyPathValueItem alloc];
  p_cache = HMDAnalyticsCharacteristicEventData.cache;
  id v10 = [[HMDCompositeSettingBoolValue alloc] initWithValue:1];
  id v11 = [(HMDCompositeSettingsKeyPathValueItem *)v8 initWithKeyPath:@"root.siriEndpoint.enabled" value:v10];
  [v7 addObject:v11];

  id v12 = [HMDCompositeSettingsKeyPathValueItem alloc];
  double v13 = -[HMDCompositeSettingBoolValue initWithValue:]([HMDCompositeSettingBoolValue alloc], "initWithValue:", [a1[7] allowHeySiri]);
  id v14 = [(HMDCompositeSettingsKeyPathValueItem *)v12 initWithKeyPath:@"root.siri.siriEnabled" value:v13];
  [v7 addObject:v14];

  id v15 = [HMDCompositeSettingsKeyPathValueItem alloc];
  id v16 = -[HMDCompositeSettingBoolValue initWithValue:]([HMDCompositeSettingBoolValue alloc], "initWithValue:", [a1[7] isAirPlayEnabled]);
  id v17 = [(HMDCompositeSettingsKeyPathValueItem *)v15 initWithKeyPath:@"root.airPlay.airPlayEnabled" value:v16];
  [v7 addObject:v17];

  id v18 = [HMDCompositeSettingsKeyPathValueItem alloc];
  id v19 = -[HMDCompositeSettingBoolValue initWithValue:]([HMDCompositeSettingBoolValue alloc], "initWithValue:", [a1[7] isExplicitContentAllowed]);
  __int16 v20 = [(HMDCompositeSettingsKeyPathValueItem *)v18 initWithKeyPath:@"root.music.allowExplicitContent" value:v19];
  [v7 addObject:v20];

  id v21 = [HMDCompositeSettingsKeyPathValueItem alloc];
  id v22 = -[HMDCompositeSettingBoolValue initWithValue:]([HMDCompositeSettingBoolValue alloc], "initWithValue:", [a1[7] isShareSiriAnalyticsEnabled]);
  id v23 = [(HMDCompositeSettingsKeyPathValueItem *)v21 initWithKeyPath:@"root.general.analytics.shareSiriAnalytics" value:v22];
  [v7 addObject:v23];

  id v24 = [HMDCompositeSettingsKeyPathValueItem alloc];
  uint64_t v25 = -[HMDCompositeSettingBoolValue initWithValue:]([HMDCompositeSettingBoolValue alloc], "initWithValue:", [a1[7] isDoorbellChimeEnabled]);
  id v26 = [(HMDCompositeSettingsKeyPathValueItem *)v24 initWithKeyPath:@"root.doorbellChime.enabled" value:v25];
  [v7 addObject:v26];

  uint64_t v27 = [HMDCompositeSettingsKeyPathValueItem alloc];
  uint64_t v28 = -[HMDCompositeSettingBoolValue initWithValue:]([HMDCompositeSettingBoolValue alloc], "initWithValue:", [a1[7] isLightWhenUsingSiriEnabled]);
  id v29 = [(HMDCompositeSettingsKeyPathValueItem *)v27 initWithKeyPath:@"root.siri.lightWhenUsingSiri" value:v28];
  [v7 addObject:v29];

  id v30 = [HMDCompositeSettingsKeyPathValueItem alloc];
  int64_t v31 = -[HMDCompositeSettingBoolValue initWithValue:]([HMDCompositeSettingBoolValue alloc], "initWithValue:", [a1[7] isAnnounceEnabled]);
  id v32 = [(HMDCompositeSettingsKeyPathValueItem *)v30 initWithKeyPath:@"root.announce.enabled" value:v31];
  v77 = v7;
  [v7 addObject:v32];

  SEL v33 = [a1[7] languageValue];

  if (v33)
  {
    uint64_t v34 = [HMDCompositeSettingLanguageValue alloc];
    uint64_t v75 = [a1[7] languageValue];
    id v35 = [v75 inputLanguageCode];
    id v36 = [a1[7] languageValue];
    v37 = [v36 outputVoiceLanguageCode];
    v38 = [a1[7] languageValue];
    v39 = [v38 outputVoiceGenderCode];
    id v40 = [a1[7] languageValue];
    id v41 = [v40 voiceName];
    uint64_t v42 = [(HMDCompositeSettingLanguageValue *)v34 initWithInputLanguage:v35 outputVoiceLanguageCode:v37 outputVoiceGenderCode:v39 voiceName:v41];

    uint64_t v43 = v42;
    v44 = v36;
    id v45 = v75;

    p_cache = (void **)(HMDAnalyticsCharacteristicEventData + 16);
  }
  else
  {
    id v45 = [MEMORY[0x263F0E050] defaultLanguageValue];
    id v55 = [HMDCompositeSettingLanguageValue alloc];
    id v35 = [v45 inputLanguageCode];
    v44 = [v45 outputVoiceLanguageCode];
    v37 = [v45 outputVoiceGenderCode];
    v38 = [v45 voiceName];
    uint64_t v43 = [(HMDCompositeSettingLanguageValue *)v55 initWithInputLanguage:v35 outputVoiceLanguageCode:v44 outputVoiceGenderCode:v37 voiceName:v38];
  }

  uint64_t v76 = (void *)v43;
  __int16 v56 = [[HMDCompositeSettingsKeyPathValueItem alloc] initWithKeyPath:@"root.siri.language" value:v43];
  [v77 addObject:v56];

  id v57 = +[HMDHomeKitVersion currentVersion];
  uint64_t v58 = objc_msgSend(objc_alloc((Class)(p_cache + 138)), "initWithValue:", objc_msgSend(a1[7], "allowHeySiri"));
  id v59 = [a1[4] dataSource];
  id v60 = [v59 siriEndpointBridge];
  id v62 = a1[5];
  id v61 = a1[6];
  id v87 = 0;
  uint64_t v63 = [v60 siriEndpointCertificationReasonForAccessoryUUID:v61 homeUUID:v62 error:&v87];
  id v64 = v87;

  if (v64)
  {
    long long v65 = (void *)MEMORY[0x230FBD990]();
    id v66 = a1[4];
    long long v67 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
    {
      long long v68 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v89 = v68;
      __int16 v90 = 2112;
      id v91 = v64;
      _os_log_impl(&dword_22F52A000, v67, OS_LOG_TYPE_ERROR, "%{public}@Error while checking certification status error:%@", buf, 0x16u);
    }
  }
  id v70 = a1[5];
  id v69 = a1[6];
  id v71 = a1[4];
  v78[0] = MEMORY[0x263EF8330];
  v78[1] = 3221225472;
  v78[2] = __102__HMDCompositeSettingsControllerManager__applyOnboardingSelections_accessoryUUID_homeUUID_completion___block_invoke_131;
  v78[3] = &unk_264A27C68;
  uint64_t v86 = v63;
  v78[4] = v71;
  id v85 = a1[8];
  id v79 = a1[6];
  id v80 = a1[5];
  id v81 = v58;
  id v6 = v6;
  id v82 = v6;
  id v83 = v77;
  id v84 = v57;
  id v72 = v57;
  id v73 = v77;
  id v74 = v58;
  [v71 localUpdateSettingForUUID:v69 homeUUID:v70 keyPath:@"root.siri.allowHeySiri" value:v74 completion:v78];

LABEL_13:
}

void __102__HMDCompositeSettingsControllerManager__applyOnboardingSelections_accessoryUUID_homeUUID_completion___block_invoke_131(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = [v7 error];

  if (v10)
  {
    id v11 = [HMDCompositeSettingsControllerManagerOnboardingLogEvent alloc];
    id v12 = [v7 error];
    double v13 = [(HMDCompositeSettingsControllerManagerOnboardingLogEvent *)v11 initWithError:v12 siriEndpointCertificationReason:*(void *)(a1 + 96)];

    id v14 = [*(id *)(a1 + 32) logEventSubmitter];
    [v14 submitLogEvent:v13];

    id v15 = (void *)MEMORY[0x230FBD990]();
    id v16 = *(id *)(a1 + 32);
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      id v19 = [v7 error];
      *(_DWORD *)buf = 138543618;
      uint64_t v34 = v18;
      __int16 v35 = 2112;
      id v36 = v19;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Applying onboarding selections to controller failed with error: %@", buf, 0x16u);
    }
    uint64_t v20 = *(void *)(a1 + 88);
    id v21 = [v7 error];
    (*(void (**)(uint64_t, void *, uint64_t))(v20 + 16))(v20, v21, 1);
  }
  else
  {
    id v22 = *(void **)(a1 + 32);
    uint64_t v23 = *(void *)(a1 + 40);
    uint64_t v24 = *(void *)(a1 + 48);
    uint64_t v25 = *(void *)(a1 + 56);
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __102__HMDCompositeSettingsControllerManager__applyOnboardingSelections_accessoryUUID_homeUUID_completion___block_invoke_133;
    v27[3] = &unk_264A27C40;
    id v26 = *(void **)(a1 + 88);
    uint64_t v32 = *(void *)(a1 + 96);
    v27[4] = v22;
    id v31 = v26;
    id v28 = *(id *)(a1 + 64);
    id v29 = *(id *)(a1 + 72);
    id v30 = *(id *)(a1 + 80);
    [v22 localUpdateSettingForUUID:v23 homeUUID:v24 keyPath:@"root.siri.tapToAccess" value:v25 completion:v27];
  }
}

void __102__HMDCompositeSettingsControllerManager__applyOnboardingSelections_accessoryUUID_homeUUID_completion___block_invoke_133(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = [v7 error];

  if (v10)
  {
    id v11 = [HMDCompositeSettingsControllerManagerOnboardingLogEvent alloc];
    id v12 = [v7 error];
    double v13 = [(HMDCompositeSettingsControllerManagerOnboardingLogEvent *)v11 initWithError:v12 siriEndpointCertificationReason:*(void *)(a1 + 72)];

    id v14 = [*(id *)(a1 + 32) logEventSubmitter];
    [v14 submitLogEvent:v13];

    id v15 = (void *)MEMORY[0x230FBD990]();
    id v16 = *(id *)(a1 + 32);
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      id v19 = [v7 error];
      *(_DWORD *)buf = 138543618;
      id v31 = v18;
      __int16 v32 = 2112;
      SEL v33 = v19;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Applying onboarding selections to controller failed with error: %@", buf, 0x16u);
    }
    uint64_t v20 = *(void *)(a1 + 64);
    id v21 = [v7 error];
    (*(void (**)(uint64_t, void *, uint64_t))(v20 + 16))(v20, v21, 1);
  }
  else
  {
    id v22 = *(void **)(a1 + 40);
    uint64_t v23 = *(void *)(a1 + 48);
    uint64_t v25 = *(void *)(a1 + 56);
    uint64_t v24 = *(void **)(a1 + 64);
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __102__HMDCompositeSettingsControllerManager__applyOnboardingSelections_accessoryUUID_homeUUID_completion___block_invoke_134;
    v27[3] = &unk_264A27C18;
    uint64_t v26 = *(void *)(a1 + 32);
    uint64_t v29 = *(void *)(a1 + 72);
    v27[4] = v26;
    id v28 = v24;
    [v22 updateSettingsForKeyPaths:v23 callerVersion:v25 completion:v27];
  }
}

void __102__HMDCompositeSettingsControllerManager__applyOnboardingSelections_accessoryUUID_homeUUID_completion___block_invoke_134(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 error];

  id v5 = [HMDCompositeSettingsControllerManagerOnboardingLogEvent alloc];
  id v6 = v5;
  if (v4)
  {
    id v7 = [v3 error];
    id v8 = [(HMDCompositeSettingsControllerManagerOnboardingLogEvent *)v6 initWithError:v7 siriEndpointCertificationReason:*(void *)(a1 + 48)];

    id v9 = [*(id *)(a1 + 32) logEventSubmitter];
    [v9 submitLogEvent:v8];

    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = *(id *)(a1 + 32);
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      double v13 = HMFGetLogIdentifier();
      id v14 = [v3 error];
      int v22 = 138543618;
      uint64_t v23 = v13;
      __int16 v24 = 2112;
      uint64_t v25 = v14;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Applying onboarding selections to controller failed with error: %@", (uint8_t *)&v22, 0x16u);
    }
    uint64_t v15 = *(void *)(a1 + 40);
    id v16 = [v3 error];
    (*(void (**)(uint64_t, void *, uint64_t))(v15 + 16))(v15, v16, 1);
  }
  else
  {
    id v8 = [(HMDCompositeSettingsControllerManagerOnboardingLogEvent *)v5 initWithError:0 siriEndpointCertificationReason:*(void *)(a1 + 48)];
    id v17 = [*(id *)(a1 + 32) logEventSubmitter];
    [v17 submitLogEvent:v8];

    id v18 = (void *)MEMORY[0x230FBD990]();
    id v19 = *(id *)(a1 + 32);
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      id v21 = HMFGetLogIdentifier();
      int v22 = 138543362;
      uint64_t v23 = v21;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Applying onboarding selections to controller successful", (uint8_t *)&v22, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)settingsController:(id)a3 didUpdateSettings:(id)a4 metadata:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = [v10 homeUUID];
  id v11 = [v10 uuid];

  -[HMDCompositeSettingsControllerManager _postSettingUpdatesIfDifferentWithHome:uuid:settings:metadata:](self, v12, v11, v9, v8);
}

- (id)dumpStateInfo
{
  return (id)MEMORY[0x263EFFA78];
}

- (void)localUpdateSettingForUUID:(id)a3 homeUUID:(id)a4 keyPath:(id)a5 value:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = +[HMDHomeKitVersion currentVersion];
  [(HMDCompositeSettingsControllerManager *)self localUpdateSettingForUUID:v16 homeUUID:v15 keyPath:v14 value:v13 callerVersion:v17 completion:v12];
}

- (void)localUpdateSettingForUUID:(id)a3 homeUUID:(id)a4 keyPath:(id)a5 value:(id)a6 callerVersion:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v20 = a8;
  if (self) {
    Property = objc_getProperty(self, v19, 24, 1);
  }
  else {
    Property = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __115__HMDCompositeSettingsControllerManager_localUpdateSettingForUUID_homeUUID_keyPath_value_callerVersion_completion___block_invoke;
  block[3] = &unk_264A2C9E0;
  block[4] = self;
  id v29 = v14;
  id v30 = v15;
  id v31 = v16;
  id v32 = v17;
  id v33 = v18;
  id v34 = v20;
  id v22 = v20;
  id v23 = v18;
  id v24 = v17;
  id v25 = v16;
  id v26 = v15;
  id v27 = v14;
  dispatch_async(Property, block);
}

void __115__HMDCompositeSettingsControllerManager_localUpdateSettingForUUID_homeUUID_keyPath_value_callerVersion_completion___block_invoke(uint64_t a1)
{
  v79[1] = *MEMORY[0x263EF8340];
  v1 = *(void **)(a1 + 32);
  id v2 = *(void **)(a1 + 48);
  id v3 = *(void **)(a1 + 56);
  id v4 = *(void **)(a1 + 64);
  id v5 = *(void **)(a1 + 72);
  id v6 = *(void **)(a1 + 80);
  id v71 = *(id *)(a1 + 40);
  id v7 = v2;
  id v8 = v3;
  id v9 = v4;
  id v70 = v5;
  id v11 = v6;
  if (v1)
  {
    Property = objc_getProperty(v1, v10, 24, 1);
    dispatch_assert_queue_V2(Property);
    if (v71)
    {
      if (v7)
      {
        if (v8)
        {
          if (v9)
          {
            if (v70)
            {
              if (v11)
              {
                id v13 = -[HMDCompositeSettingsControllerManager dataSourceIsCurrentDevicePrimaryResidentForHomeUUID:](v1, v7);
                id v14 = v13;
                if (!v13 || ([v13 BOOLValue] & 1) == 0)
                {
                  id v17 = [MEMORY[0x263F087E8] hmErrorWithCode:-1 description:@"Not a primary resident" reason:0 suggestion:0];
                  id v32 = (void *)MEMORY[0x230FBD990]();
                  id v33 = v1;
                  id v34 = HMFGetOSLogHandle();
                  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                  {
                    HMFGetLogIdentifier();
                    id v69 = v7;
                    v36 = id v35 = v9;
                    *(_DWORD *)buf = 138543618;
                    *(void *)&uint8_t buf[4] = v36;
                    *(_WORD *)&buf[12] = 2112;
                    *(void *)&buf[14] = v17;
                    _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_ERROR, "%{public}@Error: %@", buf, 0x16u);

                    id v9 = v35;
                    id v7 = v69;
                  }

                  id v19 = [[HMDCompositeSettingOperationResult alloc] initWithKeyPath:v8 setting:0 metadata:0 error:v17];
                  v11[2](v11, v19, v71, v7);
                  goto LABEL_25;
                }
                long long v68 = v9;
                id v15 = [v1 stringToCompositeSettingsController];
                id v16 = [NSString stringWithFormat:@"%@.%@", v7, v71];
                id v17 = [v15 objectForKey:v16];

                id v66 = v17;
                if (!v17)
                {
                  long long v67 = v14;
                  uint64_t v37 = (void *)MEMORY[0x230FBD990]();
                  id v38 = v1;
                  v39 = HMFGetOSLogHandle();
                  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                  {
                    id v40 = HMFGetLogIdentifier();
                    *(_DWORD *)buf = 138543874;
                    *(void *)&uint8_t buf[4] = v40;
                    *(_WORD *)&buf[12] = 2112;
                    *(void *)&buf[14] = v71;
                    *(_WORD *)&buf[22] = 2112;
                    id v73 = v7;
                    _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_ERROR, "%{public}@Unconfigured controller for uuid:%@, home:%@", buf, 0x20u);
                  }
                  id v19 = [MEMORY[0x263F087E8] hmErrorWithCode:21];
                  id v41 = [[HMDCompositeSettingOperationResult alloc] initWithKeyPath:v8 setting:0 metadata:0 error:v19];
                  v11[2](v11, v41, v71, v7);

                  id v17 = 0;
                  id v14 = v67;
                  id v9 = v68;
                  goto LABEL_25;
                }
                id v18 = [v1 dataSource];
                id v19 = [v18 siriEndpointBridge];

                if (([v8 isEqualToString:@"root.siri.tapToAccess"] & 1) == 0
                  && ![v8 isEqualToString:@"root.siri.allowHeySiri"])
                {
                  *(void *)buf = MEMORY[0x263EF8330];
                  *(void *)&buf[8] = 3221225472;
                  *(void *)&buf[16] = __116__HMDCompositeSettingsControllerManager__localUpdateSettingForUUID_homeUUID_keyPath_value_callerVersion_completion___block_invoke_2_113;
                  id v73 = &unk_264A27BF0;
                  *(void *)&v74[16] = v11;
                  *(void *)id v74 = v71;
                  *(void *)&v74[8] = v7;
                  id v9 = v68;
                  [v17 updateSettingForKeyPath:v8 value:v68 callerVersion:v70 completion:buf];

LABEL_25:
                  goto LABEL_26;
                }
                id v20 = (void *)MEMORY[0x230FBD990]();
                id v21 = v1;
                id v22 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
                {
                  id v23 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138544386;
                  *(void *)&uint8_t buf[4] = v23;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v7;
                  *(_WORD *)&buf[22] = 2112;
                  id v73 = v71;
                  *(_WORD *)id v74 = 2112;
                  *(void *)&v74[2] = v8;
                  *(_WORD *)&v74[10] = 2112;
                  *(void *)&v74[12] = v68;
                  _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Characteristic backed keyPath update for home:%@, accessory:%@, keyPath:%@, value:%@", buf, 0x34u);
                }
                id v24 = v68;
                objc_opt_class();
                int v25 = objc_opt_isKindOfClass() & 1;
                if (v25) {
                  id v26 = v24;
                }
                else {
                  id v26 = 0;
                }
                id v27 = v26;

                if (!v25)
                {
                  uint64_t v42 = v21;
                  id v43 = v27;
                  id v44 = v24;
                  contexta = (void *)MEMORY[0x230FBD990]();
                  id v45 = v42;
                  id v46 = HMFGetOSLogHandle();
                  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
                  {
                    id v47 = HMFGetLogIdentifier();
                    *(_DWORD *)buf = 138543618;
                    *(void *)&uint8_t buf[4] = v47;
                    *(_WORD *)&buf[12] = 2112;
                    *(void *)&buf[14] = v44;
                    _os_log_impl(&dword_22F52A000, v46, OS_LOG_TYPE_ERROR, "%{public}@Invalid BOOL value:%@", buf, 0x16u);
                  }
                  __int16 v48 = [HMDCompositeSettingOperationResult alloc];
                  id v49 = [MEMORY[0x263F087E8] hmErrorWithCode:43 userInfo:0];
                  id v50 = [(HMDCompositeSettingOperationResult *)v48 initWithKeyPath:v8 setting:0 metadata:0 error:v49];

                  id v27 = v43;
                  goto LABEL_42;
                }
                if ([v24 BOOLValue])
                {
                  if (v19)
                  {
                    id v62 = (void *)[objc_alloc(MEMORY[0x263F0E728]) initWithBoolValue:1];
                    *(void *)buf = MEMORY[0x263EF8330];
                    *(void *)&buf[8] = 3221225472;
                    *(void *)&buf[16] = __116__HMDCompositeSettingsControllerManager__localUpdateSettingForUUID_homeUUID_keyPath_value_callerVersion_completion___block_invoke;
                    id v73 = &unk_264A27BC8;
                    id v28 = v8;
                    *(void *)id v74 = v28;
                    context = (id *)v79;
                    v79[0] = v11;
                    id v27 = v24;
                    id v29 = v71;
                    *(void *)&v74[8] = v29;
                    id v30 = v7;
                    *(void *)&v74[16] = v30;
                    uint64_t v75 = v66;
                    id v76 = v27;
                    id v77 = v70;
                    id v78 = v21;
                    [(HMDCompositeSettingOperationResult *)v19 writeSettingValue:v62 accessoryUUID:v29 homeUUID:v30 forKeyPath:v28 completionHandler:buf];

                    id v31 = v75;
LABEL_36:

LABEL_43:
                    id v17 = v66;
                    id v9 = v68;
                    goto LABEL_25;
                  }
                  id v53 = [HMDCompositeSettingOperationResult alloc];
                  __int16 v54 = [MEMORY[0x263F087E8] hmErrorWithCode:27 userInfo:0];
                  id v50 = [(HMDCompositeSettingOperationResult *)v53 initWithKeyPath:v8 setting:0 metadata:0 error:v54];

                  id v55 = (void *)MEMORY[0x230FBD990]();
                  id v56 = v21;
                  id v57 = HMFGetOSLogHandle();
                  if (!os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_41;
                  }
                }
                else
                {
                  if (v19)
                  {
                    id v31 = (void (**)(id, HMDCompositeSettingOperationResult *, id, id))objc_msgSend(objc_alloc(MEMORY[0x263F0E728]), "initWithBoolValue:", objc_msgSend(v24, "BOOLValue"));
                    *(void *)buf = MEMORY[0x263EF8330];
                    *(void *)&buf[8] = 3221225472;
                    *(void *)&buf[16] = __116__HMDCompositeSettingsControllerManager__localUpdateSettingForUUID_homeUUID_keyPath_value_callerVersion_completion___block_invoke_112;
                    id v73 = &unk_264A2F6E8;
                    id v51 = v8;
                    *(void *)id v74 = v51;
                    context = (id *)&v75;
                    uint64_t v75 = v11;
                    id v27 = v24;
                    id v52 = v71;
                    *(void *)&v74[8] = v52;
                    *(void *)&v74[16] = v7;
                    [(HMDCompositeSettingOperationResult *)v19 writeSettingValue:v31 accessoryUUID:v52 homeUUID:*(void *)&v74[16] forKeyPath:v51 completionHandler:buf];
                    goto LABEL_36;
                  }
                  uint64_t v58 = [HMDCompositeSettingOperationResult alloc];
                  id v59 = [MEMORY[0x263F087E8] hmErrorWithCode:27 userInfo:0];
                  id v50 = [(HMDCompositeSettingOperationResult *)v58 initWithKeyPath:v8 setting:0 metadata:0 error:v59];

                  id v55 = (void *)MEMORY[0x230FBD990]();
                  id v56 = v21;
                  id v57 = HMFGetOSLogHandle();
                  if (!os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_41;
                  }
                }
                HMFGetLogIdentifier();
                contextb = v56;
                v61 = id v60 = v55;
                *(_DWORD *)buf = 138543362;
                *(void *)&uint8_t buf[4] = v61;
                _os_log_impl(&dword_22F52A000, v57, OS_LOG_TYPE_ERROR, "%{public}@No Siri endpoint bridge", buf, 0xCu);

                id v55 = v60;
                id v56 = contextb;
LABEL_41:

LABEL_42:
                v11[2](v11, v50, v71, v7);

                goto LABEL_43;
              }
LABEL_49:
              _HMFPreconditionFailure();
            }
LABEL_48:
            _HMFPreconditionFailure();
            goto LABEL_49;
          }
LABEL_47:
          _HMFPreconditionFailure();
          goto LABEL_48;
        }
LABEL_46:
        _HMFPreconditionFailure();
        goto LABEL_47;
      }
    }
    else
    {
      _HMFPreconditionFailure();
    }
    _HMFPreconditionFailure();
    goto LABEL_46;
  }
LABEL_26:
}

- (id)dataSourceIsCurrentDevicePrimaryResidentForHomeUUID:(void *)a1
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [a1 dataSource];
  if (v4)
  {
    id v5 = [a1 stateManager];
    BOOL v6 = [v5 stateForHomeUUID:v3] == 3;

    id v7 = [MEMORY[0x263F42508] BOOLeanWithBool:v6];
  }
  else
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = a1;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      int v13 = 138543362;
      id v14 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to determine current device is primary resident due to no data source", (uint8_t *)&v13, 0xCu);
    }
    id v7 = 0;
  }

  return v7;
}

void __116__HMDCompositeSettingsControllerManager__localUpdateSettingForUUID_homeUUID_keyPath_value_callerVersion_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = [[HMDCompositeSettingOperationResult alloc] initWithKeyPath:*(void *)(a1 + 32) setting:0 metadata:0 error:v3];
    (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
  }
  else
  {
    id v5 = *(void **)(a1 + 56);
    uint64_t v6 = *(void *)(a1 + 64);
    uint64_t v7 = *(void *)(a1 + 72);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __116__HMDCompositeSettingsControllerManager__localUpdateSettingForUUID_homeUUID_keyPath_value_callerVersion_completion___block_invoke_2;
    v10[3] = &unk_264A27BA0;
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 80);
    id v11 = v8;
    uint64_t v12 = v9;
    id v13 = *(id *)(a1 + 48);
    id v14 = *(id *)(a1 + 40);
    id v15 = *(id *)(a1 + 88);
    [v5 updateSettingForKeyPath:@"root.siri.siriEnabled" value:v6 callerVersion:v7 completion:v10];
  }
}

void __116__HMDCompositeSettingsControllerManager__localUpdateSettingForUUID_homeUUID_keyPath_value_callerVersion_completion___block_invoke_112(uint64_t a1, void *a2)
{
  id v9 = a2;
  if (v9)
  {
    id v3 = [[HMDCompositeSettingOperationResult alloc] initWithKeyPath:*(void *)(a1 + 32) setting:0 metadata:0 error:v9];
  }
  else
  {
    id v4 = [[HMDCompositeBoolSetting alloc] initWithValue:0 readVersion:@"7.2" writeVersion:@"7.2"];
    id v5 = [HMDCompositeSettingMetadata alloc];
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = [[HMDCompositeSettingPrivileges alloc] initWithMinReadUserPrivilege:4];
    id v8 = [(HMDCompositeSettingMetadata *)v5 initWithKeyPath:v6 constraint:0 privileges:v7];

    id v3 = [[HMDCompositeSettingOperationResult alloc] initWithKeyPath:*(void *)(a1 + 32) setting:v4 metadata:v8 error:0];
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

uint64_t __116__HMDCompositeSettingsControllerManager__localUpdateSettingForUUID_homeUUID_keyPath_value_callerVersion_completion___block_invoke_2_113(void *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void, void))(a1[6] + 16))(a1[6], a2, a1[4], a1[5]);
}

void __116__HMDCompositeSettingsControllerManager__localUpdateSettingForUUID_homeUUID_keyPath_value_callerVersion_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 error];

  if (v4)
  {
    id v5 = [HMDCompositeSettingOperationResult alloc];
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = [v3 error];

    id v11 = [(HMDCompositeSettingOperationResult *)v5 initWithKeyPath:v6 setting:0 metadata:0 error:v7];
  }
  else
  {
    -[HMDCompositeSettingsControllerManager _manageCharacteristicsBackedSettingsChangeForHomeUUID:accessoryUUID:](*(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56));
    id v8 = [HMDCompositeSettingOperationResult alloc];
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v7 = [v3 setting];
    id v10 = [v3 metadata];

    id v11 = [(HMDCompositeSettingOperationResult *)v8 initWithKeyPath:v9 setting:v7 metadata:v10 error:0];
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (void)localFetchSettingsForUUID:(id)a3 homeUUID:(id)a4 withKeyPaths:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = +[HMDHomeKitVersion currentVersion];
  [(HMDCompositeSettingsControllerManager *)self localFetchSettingsForUUID:v13 homeUUID:v12 withKeyPaths:v11 callerVersion:v14 callerPrivilege:3 completion:v10];
}

- (void)localFetchSettingsForUUID:(id)a3 homeUUID:(id)a4 withKeyPaths:(id)a5 callerVersion:(id)a6 callerPrivilege:(unint64_t)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v19 = a8;
  if (self) {
    Property = objc_getProperty(self, v18, 24, 1);
  }
  else {
    Property = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __130__HMDCompositeSettingsControllerManager_localFetchSettingsForUUID_homeUUID_withKeyPaths_callerVersion_callerPrivilege_completion___block_invoke;
  block[3] = &unk_264A27B50;
  block[4] = self;
  id v27 = v14;
  id v28 = v15;
  id v29 = v16;
  id v31 = v19;
  unint64_t v32 = a7;
  id v30 = v17;
  id v21 = v19;
  id v22 = v17;
  id v23 = v16;
  id v24 = v15;
  id v25 = v14;
  dispatch_async(Property, block);
}

void __130__HMDCompositeSettingsControllerManager_localFetchSettingsForUUID_homeUUID_withKeyPaths_callerVersion_callerPrivilege_completion___block_invoke(uint64_t a1)
{
  v64[1] = *MEMORY[0x263EF8340];
  id v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 48);
  id v4 = *(void **)(a1 + 56);
  id v5 = *(void **)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 80);
  id v53 = *(id *)(a1 + 40);
  id v7 = v3;
  id v56 = v4;
  id v9 = v5;
  if (v2)
  {
    Property = objc_getProperty(v2, v8, 24, 1);
    dispatch_assert_queue_V2(Property);
    id v11 = -[HMDCompositeSettingsControllerManager dataSourceIsCurrentDevicePrimaryResidentForHomeUUID:](v2, v7);
    id v12 = v11;
    if (v11 && ([v11 BOOLValue] & 1) != 0)
    {
      id v13 = [v2 stringToCompositeSettingsController];
      id v14 = v53;
      id v15 = [NSString stringWithFormat:@"%@.%@", v7, v53];
      id v16 = [v13 objectForKey:v15];

      id v52 = v16;
      if (v16)
      {
        objc_msgSend(v56, "na_filter:", &__block_literal_global_218416);
        id v54 = (id)objc_claimAutoreleasedReturnValue();
        if ([v54 count])
        {
          v64[0] = @"root.siri.siriEnabled";
          id v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v64 count:1];
          id v18 = [v16 fetchSynchronousSettingsForKeyPaths:v17 callerVersion:v9 callerPrivilege:v6];
        }
        else
        {
          id v18 = 0;
        }
        uint64_t v50 = v6;
        id v51 = v18;
        if ([v18 count])
        {
          id v33 = [v18 firstObject];
          id v34 = [v33 setting];

          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v35 = v34;
          }
          else {
            id v35 = 0;
          }
          id v36 = v35;

          char v37 = [v36 BOOLValue];
        }
        else
        {
          char v37 = 0;
        }
        id v38 = (void *)MEMORY[0x230FBD990]();
        id v39 = v2;
        id v40 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          id v49 = v38;
          v42 = char v41 = v37;
          id v43 = HMFBooleanToString();
          *(_DWORD *)buf = 138544130;
          *(void *)&uint8_t buf[4] = v42;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v43;
          *(_WORD *)&buf[22] = 2112;
          id v60 = v53;
          LOWORD(v61) = 2112;
          *(void *)((char *)&v61 + 2) = v7;
          _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_INFO, "%{public}@Siri is enabled:%@ for owner:%@, home:%@", buf, 0x2Au);

          char v37 = v41;
          id v38 = v49;
        }

        *(void *)buf = MEMORY[0x263EF8330];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __120__HMDCompositeSettingsControllerManager__localFetchSettingsForUUID_homeUUID_withKeyPaths_callerVersion_callerPrivilege___block_invoke_87;
        id v60 = &unk_264A27B78;
        *(void *)&long long v61 = v39;
        *((void *)&v61 + 1) = v53;
        id v62 = v7;
        char v63 = v37;
        id v44 = objc_msgSend(v54, "na_map:", buf);
        v57[0] = MEMORY[0x263EF8330];
        v57[1] = 3221225472;
        v57[2] = __120__HMDCompositeSettingsControllerManager__localFetchSettingsForUUID_homeUUID_withKeyPaths_callerVersion_callerPrivilege___block_invoke_2_92;
        v57[3] = &unk_264A2A698;
        id v26 = v54;
        id v58 = v26;
        id v45 = objc_msgSend(v56, "na_filter:", v57);
        id v46 = [MEMORY[0x263EFF980] array];
        if ([v45 count])
        {
          id v47 = [v52 fetchSynchronousSettingsForKeyPaths:v45 callerVersion:v9 callerPrivilege:v50];
          uint64_t v48 = [v47 mutableCopy];

          id v14 = v53;
          id v46 = (void *)v48;
        }
        objc_msgSend(v46, "na_safeAddObjectsFromArray:", v44);
        id v55 = (id)[v46 copy];

        unint64_t v32 = v51;
      }
      else
      {
        id v27 = (void *)MEMORY[0x230FBD990]();
        id v28 = v2;
        id v29 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          id v30 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v30;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v53;
          *(_WORD *)&buf[22] = 2112;
          id v60 = v7;
          _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@Unconfigured controller for uuid:%@, home:%@", buf, 0x20u);
        }
        id v31 = [MEMORY[0x263F087E8] hmErrorWithCode:21];
        *(void *)buf = MEMORY[0x263EF8330];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __120__HMDCompositeSettingsControllerManager__localFetchSettingsForUUID_homeUUID_withKeyPaths_callerVersion_callerPrivilege___block_invoke_84;
        id v60 = &unk_264A2C320;
        *(void *)&long long v61 = v31;
        id v26 = v31;
        objc_msgSend(v56, "na_map:", buf);
        id v55 = (id)objc_claimAutoreleasedReturnValue();
        unint64_t v32 = (void *)v61;
      }

      id v25 = v52;
    }
    else
    {
      id v19 = v9;
      id v20 = [MEMORY[0x263F087E8] hmErrorWithCode:-1 description:@"Not a primary resident" reason:0 suggestion:0];
      id v21 = (void *)MEMORY[0x230FBD990]();
      id v22 = v2;
      id v23 = HMFGetOSLogHandle();
      id v14 = v53;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        id v24 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        *(void *)&uint8_t buf[4] = v24;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v20;
        *(_WORD *)&buf[22] = 2112;
        id v60 = v53;
        LOWORD(v61) = 2112;
        *(void *)((char *)&v61 + 2) = v7;
        _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Error: %@, owner:%@, home:%@", buf, 0x2Au);
      }
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __120__HMDCompositeSettingsControllerManager__localFetchSettingsForUUID_homeUUID_withKeyPaths_callerVersion_callerPrivilege___block_invoke;
      id v60 = &unk_264A2C320;
      *(void *)&long long v61 = v20;
      id v25 = v20;
      objc_msgSend(v56, "na_map:", buf);
      id v55 = (id)objc_claimAutoreleasedReturnValue();
      id v26 = (id)v61;
      id v9 = v19;
    }
  }
  else
  {
    id v55 = 0;
    id v14 = v53;
  }

  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
}

HMDCompositeSettingOperationResult *__120__HMDCompositeSettingsControllerManager__localFetchSettingsForUUID_homeUUID_withKeyPaths_callerVersion_callerPrivilege___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[HMDCompositeSettingOperationResult alloc] initWithKeyPath:v3 setting:0 metadata:0 error:*(void *)(a1 + 32)];

  return v4;
}

HMDCompositeSettingOperationResult *__120__HMDCompositeSettingsControllerManager__localFetchSettingsForUUID_homeUUID_withKeyPaths_callerVersion_callerPrivilege___block_invoke_84(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[HMDCompositeSettingOperationResult alloc] initWithKeyPath:v3 setting:0 metadata:0 error:*(void *)(a1 + 32)];

  return v4;
}

HMDCompositeSettingOperationResult *__120__HMDCompositeSettingsControllerManager__localFetchSettingsForUUID_homeUUID_withKeyPaths_callerVersion_callerPrivilege___block_invoke_87(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) dataSource];
  id v5 = [v4 siriEndpointBridge];
  uint64_t v6 = [v5 readValueValueForAccessoryUUID:*(void *)(a1 + 40) homeUUID:*(void *)(a1 + 48) forKeyPath:v3];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    id v9 = [HMDCompositeBoolSetting alloc];
    if ([v8 BOOLValue]) {
      BOOL v10 = *(unsigned char *)(a1 + 56) != 0;
    }
    else {
      BOOL v10 = 0;
    }
    id v12 = [(HMDCompositeBoolSetting *)v9 initWithValue:v10 readVersion:@"7.2" writeVersion:@"7.2"];
    id v14 = [HMDCompositeSettingMetadata alloc];
    id v15 = [[HMDCompositeSettingPrivileges alloc] initWithMinReadUserPrivilege:4];
    id v16 = [(HMDCompositeSettingMetadata *)v14 initWithKeyPath:v3 constraint:0 privileges:v15];

    id v13 = [[HMDCompositeSettingOperationResult alloc] initWithKeyPath:v3 setting:v12 metadata:v16 error:0];
  }
  else
  {
    id v11 = [HMDCompositeSettingOperationResult alloc];
    id v12 = [MEMORY[0x263F087E8] hmErrorWithCode:74];
    id v13 = [(HMDCompositeSettingOperationResult *)v11 initWithKeyPath:v3 setting:0 metadata:0 error:v12];
  }

  return v13;
}

uint64_t __120__HMDCompositeSettingsControllerManager__localFetchSettingsForUUID_homeUUID_withKeyPaths_callerVersion_callerPrivilege___block_invoke_2_92(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

uint64_t __120__HMDCompositeSettingsControllerManager__localFetchSettingsForUUID_homeUUID_withKeyPaths_callerVersion_callerPrivilege___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isEqualToString:@"root.siri.tapToAccess"]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [v2 isEqualToString:@"root.siri.allowHeySiri"];
  }

  return v3;
}

- (void)_createSettingControllerForAccessory:(id)a3 homeUUID:(id)a4
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v8 = a4;
  if (!self) {
    goto LABEL_26;
  }
  for (uint64_t i = objc_getProperty(self, v7, 24, 1); ; uint64_t i = 0)
  {
    dispatch_assert_queue_V2(i);
    BOOL v10 = [(HMDCompositeSettingsControllerManager *)self stateManager];
    uint64_t v11 = [v10 stateForHomeUUID:v8];

    if ((unint64_t)(v11 - 4) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      id v12 = (void *)MEMORY[0x230FBD990]();
      id v13 = self;
      id v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v15 = HMFGetLogIdentifier();
        id v16 = [v6 uuid];
        *(_DWORD *)buf = 138543874;
        id v52 = v15;
        __int16 v53 = 2112;
        id v54 = v16;
        __int16 v55 = 2112;
        id v56 = v8;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Current state is not resident or primary resident for owner:%@, home:%@", buf, 0x20u);
      }
      goto LABEL_23;
    }
    if (!v8)
    {
      _HMFPreconditionFailure();
      goto LABEL_25;
    }
    id v17 = [v6 uuid];

    if (v17) {
      break;
    }
LABEL_25:
    _HMFPreconditionFailure();
LABEL_26:
    ;
  }
  if (self) {
    id Property = objc_getProperty(self, v18, 16, 1);
  }
  else {
    id Property = 0;
  }
  id v20 = Property;
  id v22 = [v6 uuid];
  if (self)
  {
    id v23 = objc_getProperty(self, v21, 24, 1);
    id v24 = [(id)objc_opt_class() zoneNameForHomeUUID:v8];
    [v20 createDatabaseAdapterIfNotExistForUUID:v22 homeUUID:v8 accessory:v6 workQueue:v23 zoneName:v24];

    id v26 = objc_getProperty(self, v25, 16, 1);
  }
  else
  {
    uint64_t v50 = [(id)objc_opt_class() zoneNameForHomeUUID:v8];
    [v20 createDatabaseAdapterIfNotExistForUUID:v22 homeUUID:v8 accessory:v6 workQueue:0 zoneName:v50];

    id v26 = 0;
  }
  id v27 = v26;
  id v28 = [v6 uuid];
  id v29 = [v27 databaseAdapterForUUID:v28];

  if (v11 == 3)
  {
    if (self)
    {
      id v30 = [&unk_26E474428 arrayByAddingObjectsFromArray:&unk_26E474440];
      id v32 = objc_getProperty(self, v31, 32, 1);
    }
    else
    {
      id v30 = 0;
      id v32 = 0;
    }
    id v33 = v32;
    uint64_t v34 = objc_opt_class();
    id v35 = [v6 uuid];
    id v36 = (*((void (**)(id, void *, uint64_t, id, void *, void *))v32 + 2))(v33, v29, v34, v8, v35, v30);

    char v37 = (void *)MEMORY[0x230FBD990]();
    id v38 = self;
    id v39 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      id v40 = HMFGetLogIdentifier();
      char v41 = [v6 uuid];
      *(_DWORD *)buf = 138544386;
      id v52 = v40;
      __int16 v53 = 2112;
      id v54 = v36;
      __int16 v55 = 2112;
      id v56 = v41;
      __int16 v57 = 2112;
      id v58 = v8;
      __int16 v59 = 2112;
      id v60 = v30;
      _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_INFO, "%{public}@Created setting controller %@ for owner:%@ home:%@ blocklist: %@", buf, 0x34u);
    }
    uint64_t v42 = [(HMDCompositeSettingsControllerManager *)v38 stringToCompositeSettingsController];
    id v43 = [v6 uuid];
    id v44 = [NSString stringWithFormat:@"%@.%@", v8, v43];
    [v42 setObject:v36 forKey:v44];
  }
  else
  {
    id v45 = (void *)MEMORY[0x230FBD990]();
    id v46 = self;
    id v47 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      uint64_t v48 = HMFGetLogIdentifier();
      id v49 = [v6 uuid];
      *(_DWORD *)buf = 138543874;
      id v52 = v48;
      __int16 v53 = 2112;
      id v54 = v49;
      __int16 v55 = 2112;
      id v56 = v8;
      _os_log_impl(&dword_22F52A000, v47, OS_LOG_TYPE_ERROR, "%{public}@Current state is not primary resident for owner:%@, home:%@ so skipping controller creation", buf, 0x20u);
    }
  }

LABEL_23:
}

- (HMDCompositeSettingsControllerManager)initWithDataSource:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(HMDCompositeSettingsOwnerToDatabaseAdapterRegistry);
  id v6 = +[HMDMetricsManager sharedLogEventSubmitter];
  id v7 = [(HMDCompositeSettingsControllerManager *)self initWithDataSource:v4 registry:v5 controllerFactory:0 stateManagerFactory:0 logEventSubmitter:v6];

  return v7;
}

- (HMDCompositeSettingsControllerManager)initWithDataSource:(id)a3 registry:(id)a4 controllerFactory:(id)a5 stateManagerFactory:(id)a6 logEventSubmitter:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v12)
  {
    id v17 = v16;
    v46.receiver = self;
    v46.super_class = (Class)HMDCompositeSettingsControllerManager;
    id v18 = [(HMDCompositeSettingsControllerManager *)&v46 init];
    if (!v18)
    {
LABEL_9:

      return v18;
    }
    uint64_t v19 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    stringToCompositeSettingsController = v18->_stringToCompositeSettingsController;
    v18->_stringToCompositeSettingsController = (NSMapTable *)v19;

    objc_storeWeak((id *)&v18->_dataSource, v12);
    uint64_t v21 = [v12 workQueue];
    workQueue = v18->_workQueue;
    v18->_workQueue = (OS_dispatch_queue *)v21;

    objc_storeStrong((id *)&v18->_registry, a4);
    id v23 = _Block_copy(v14);
    id compositeSettingsControllerFactory = v18->_compositeSettingsControllerFactory;
    v18->_id compositeSettingsControllerFactory = v23;

    objc_storeStrong((id *)&v18->_logEventSubmitter, a7);
    if (v14)
    {
      if (v15)
      {
LABEL_5:
        SEL v25 = objc_msgSend(v12, "uuid", v40, v41, v42, v43);
        uint64_t v26 = (*((void (**)(id, void *))v15 + 2))(v15, v25);
        stateManager = v18->_stateManager;
        v18->_stateManager = (HMDCompositeSettingControllerManagerStateManager *)v26;
LABEL_8:

        goto LABEL_9;
      }
    }
    else
    {
      objc_initWeak(&location, v18);
      uint64_t v40 = MEMORY[0x263EF8330];
      uint64_t v41 = 3221225472;
      uint64_t v42 = __125__HMDCompositeSettingsControllerManager_initWithDataSource_registry_controllerFactory_stateManagerFactory_logEventSubmitter___block_invoke;
      id v43 = &unk_264A27B28;
      objc_copyWeak(&v44, &location);
      id v28 = _Block_copy(&v40);
      id v29 = v18->_compositeSettingsControllerFactory;
      v18->_id compositeSettingsControllerFactory = v28;

      objc_destroyWeak(&v44);
      objc_destroyWeak(&location);
      if (v15) {
        goto LABEL_5;
      }
    }
    id v30 = [HMDCompositeSettingControllerManagerStateManager alloc];
    SEL v25 = [MEMORY[0x263F08A00] defaultCenter];
    stateManager = [v12 uuid];
    uint64_t v31 = [(HMDCompositeSettingControllerManagerStateManager *)v30 initWithDataSource:v18 notificationRegistrationProvider:v25 subscribeWithOptions:15 delegate:v18 uuid:stateManager];
    id v32 = v18->_stateManager;
    v18->_stateManager = (HMDCompositeSettingControllerManagerStateManager *)v31;

    goto LABEL_8;
  }
  uint64_t v34 = _HMFPreconditionFailure();
  return (HMDCompositeSettingsControllerManager *)__125__HMDCompositeSettingsControllerManager_initWithDataSource_registry_controllerFactory_stateManagerFactory_logEventSubmitter___block_invoke(v34, v35, v36, v37, v38, v39);
}

HMDCompositeSettingsController *__125__HMDCompositeSettingsControllerManager_initWithDataSource_registry_controllerFactory_stateManagerFactory_logEventSubmitter___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5, void *a6)
{
  BOOL v10 = (id *)(a1 + 32);
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a2;
  id WeakRetained = objc_loadWeakRetained(v10);
  id v16 = [[HMDCompositeSettingsController alloc] initWithDatabaseAdapter:v14 model:a3 homeUUID:v13 ownerUUID:v12 settingKeyPathBlockList:v11];

  [(HMDCompositeSettingsController *)v16 setDelegate:WeakRetained];
  [(HMDCompositeSettingsController *)v16 start];

  return v16;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t35_218472 != -1) {
    dispatch_once(&logCategory__hmf_once_t35_218472, &__block_literal_global_138_218473);
  }
  id v2 = (void *)logCategory__hmf_once_v36_218474;
  return v2;
}

void __52__HMDCompositeSettingsControllerManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v36_218474;
  logCategory__hmf_once_v36_218474 = v0;
}

+ (id)zoneNameForHomeUUID:(id)a3
{
  return (id)[NSString stringWithFormat:@"HMDCompositeSettingsZone.%@", a3];
}

+ (id)immutableSettingFromFetchReturn:(id)a3
{
  id v3 = a3;
  id v4 = [v3 setting];
  id v5 = [v3 metadata];
  if (!v4)
  {
    id v12 = 0;
    goto LABEL_30;
  }
  id v6 = v4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    id v8 = v6;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  if ((isKindOfClass & 1) == 0)
  {
    id v13 = v6;
    objc_opt_class();
    char v14 = objc_opt_isKindOfClass();
    if (v14) {
      id v15 = v13;
    }
    else {
      id v15 = 0;
    }
    id v11 = v15;

    if (v14)
    {
      id v16 = objc_alloc(MEMORY[0x263F0E400]);
      id v17 = [v3 keyPath];
      id v18 = [v13 stringValue];
      id v12 = (void *)[v16 initWithKeyPath:v17 readOnly:0 stringValue:v18];
    }
    else
    {
      id v45 = v9;
      id v19 = v13;
      objc_opt_class();
      char v20 = objc_opt_isKindOfClass();
      if (v20) {
        uint64_t v21 = v19;
      }
      else {
        uint64_t v21 = 0;
      }
      id v17 = v21;

      if (v20)
      {
        id v44 = v17;
        id v22 = [v5 constraint];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v23 = v22;
        }
        else {
          id v23 = 0;
        }
        id v24 = v23;

        id v40 = objc_alloc(MEMORY[0x263F0E138]);
        id v18 = [v3 keyPath];
        uint64_t v42 = [v19 numberValue];
        uint64_t v25 = [v42 integerValue];
        uint64_t v26 = [v24 max];
        uint64_t v27 = [v24 min];
        uint64_t v28 = [v24 step];

        id v12 = (void *)[v40 initWithKeyPath:v18 readOnly:0 integerValue:v25 maxValue:v26 minValue:v27 valueStepSize:v28];
      }
      else
      {
        id v29 = v19;
        objc_opt_class();
        char v30 = objc_opt_isKindOfClass();
        if (v30) {
          uint64_t v31 = v29;
        }
        else {
          uint64_t v31 = 0;
        }
        id v18 = v31;

        if ((v30 & 1) == 0)
        {
          id v12 = 0;
          id v9 = v45;
          goto LABEL_28;
        }
        id v44 = v17;
        id v43 = objc_alloc(MEMORY[0x263F0E418]);
        uint64_t v32 = [v3 keyPath];
        id v39 = objc_alloc(MEMORY[0x263F0E740]);
        uint64_t v41 = [v29 inputLanguageCode];
        id v33 = [v29 outputVoiceLanguageCode];
        uint64_t v34 = [v29 outputVoiceGenderCode];
        id v35 = [v29 voiceName];
        uint64_t v36 = (void *)[v39 initWithInputLanguageCode:v41 outputVoiceLanguageCode:v33 outputVoiceGenderCode:v34 voiceName:v35];
        char v37 = v43;
        uint64_t v42 = (void *)v32;
        id v12 = (void *)[v37 initWithKeyPath:v32 readOnly:0 languageValue:v36];
      }
      id v17 = v44;
      id v9 = v45;
    }
LABEL_28:

    goto LABEL_29;
  }
  id v10 = objc_alloc(MEMORY[0x263F0E130]);
  id v11 = [v3 keyPath];
  id v12 = objc_msgSend(v10, "initWithKeyPath:readOnly:BOOLValue:", v11, 0, objc_msgSend(v6, "BOOLValue"));
LABEL_29:

LABEL_30:
  return v12;
}

- (void)accessorySettingsLocalMessageHandler:(id)a3 didReceiveUpdateRequestMessage:(id)a4 withHomeUUID:(id)a5 accessoryUUID:(id)a6 keyPath:(id)a7 value:(id)a8 callerVersion:(id)a9
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v42 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  uint64_t v21 = [(HMDCompositeSettingsControllerManager *)self dataSource];
  id v22 = [v21 settingsControllerForAccessoryUUID:v17 homeUUID:v16];

  if (v22)
  {
    id v23 = (void *)MEMORY[0x230FBD990]();
    id v24 = self;
    uint64_t v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      contexta = v17;
      id v26 = v16;
      id v27 = v15;
      v29 = id v28 = v20;
      *(_DWORD *)buf = 138543874;
      id v49 = v29;
      __int16 v50 = 2114;
      id v51 = v18;
      __int16 v52 = 2112;
      id v53 = v19;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Update using current accessory keyPath: %{public}@, value: %@", buf, 0x20u);

      id v20 = v28;
      id v15 = v27;
      id v16 = v26;
      id v17 = contexta;
    }

    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __210__HMDCompositeSettingsControllerManager_AccessorySettingsLocalMessageHandlerDelegate__accessorySettingsLocalMessageHandler_didReceiveUpdateRequestMessage_withHomeUUID_accessoryUUID_keyPath_value_callerVersion___block_invoke;
    v45[3] = &unk_264A2E210;
    v45[4] = v24;
    id v46 = v18;
    id v47 = v15;
    [v22 updateSettingWithKeyPath:v46 settingValue:v19 completion:v45];
  }
  else
  {
    char v30 = +[HMDCompositeSettingValue compositeSettingValueFromImmutableSettingsValue:v19];
    if (v30)
    {
      v43[0] = MEMORY[0x263EF8330];
      v43[1] = 3221225472;
      v43[2] = __210__HMDCompositeSettingsControllerManager_AccessorySettingsLocalMessageHandlerDelegate__accessorySettingsLocalMessageHandler_didReceiveUpdateRequestMessage_withHomeUUID_accessoryUUID_keyPath_value_callerVersion___block_invoke_11;
      v43[3] = &unk_264A2E238;
      v43[4] = self;
      id v44 = v15;
      [(HMDCompositeSettingsControllerManager *)self localUpdateSettingForUUID:v17 homeUUID:v16 keyPath:v18 value:v30 callerVersion:v20 completion:v43];
    }
    else
    {
      context = (void *)MEMORY[0x230FBD990]();
      uint64_t v31 = self;
      uint64_t v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v39 = v18;
        id v33 = v17;
        id v34 = v16;
        id v35 = v15;
        v37 = id v36 = v20;
        *(_DWORD *)buf = 138543618;
        id v49 = v37;
        __int16 v50 = 2112;
        id v51 = v19;
        _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@Failed to update setting due to no composite setting value conversion for setting value: %@", buf, 0x16u);

        id v20 = v36;
        id v15 = v35;
        id v16 = v34;
        id v17 = v33;
        id v18 = v39;
      }

      id v38 = [MEMORY[0x263F087E8] hmfErrorWithCode:15];
      [v15 respondWithError:v38];
    }
  }
}

void __210__HMDCompositeSettingsControllerManager_AccessorySettingsLocalMessageHandlerDelegate__accessorySettingsLocalMessageHandler_didReceiveUpdateRequestMessage_withHomeUUID_accessoryUUID_keyPath_value_callerVersion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = HMFGetLogIdentifier();
    uint64_t v8 = *(void *)(a1 + 40);
    int v10 = 138543874;
    id v11 = v7;
    __int16 v12 = 2114;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Update %{public}@ result: %@", (uint8_t *)&v10, 0x20u);
  }
  id v9 = *(void **)(a1 + 48);
  if (v3) {
    [v9 respondWithError:v3];
  }
  else {
    [v9 respondWithSuccess];
  }
}

void __210__HMDCompositeSettingsControllerManager_AccessorySettingsLocalMessageHandlerDelegate__accessorySettingsLocalMessageHandler_didReceiveUpdateRequestMessage_withHomeUUID_accessoryUUID_keyPath_value_callerVersion___block_invoke_11(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  int v10 = [v7 error];
  id v11 = (void *)MEMORY[0x230FBD990]();
  id v12 = *(id *)(a1 + 32);
  uint64_t v13 = HMFGetOSLogHandle();
  __int16 v14 = v13;
  if (v10)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v15 = HMFGetLogIdentifier();
      int v17 = 138543618;
      id v18 = v15;
      __int16 v19 = 2112;
      id v20 = v10;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Update completed with error: %@", (uint8_t *)&v17, 0x16u);
    }
    [*(id *)(a1 + 40) respondWithError:v10];
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      int v17 = 138543362;
      id v18 = v16;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Update complete", (uint8_t *)&v17, 0xCu);
    }
    [*(id *)(a1 + 40) respondWithSuccess];
  }
}

- (void)accessorySettingsLocalMessageHandler:(id)a3 didReceiveFetchRequestMessage:(id)a4 withHomeUUID:(id)a5 accessoryUUID:(id)a6 keyPaths:(id)a7 callerVersion:(id)a8 callerPrivilege:(unint64_t)a9 siriAvailableLanguagesSetting:(id)a10
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v33 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a10;
  id v22 = [(HMDCompositeSettingsControllerManager *)self dataSource];
  id v23 = [v22 settingsControllerForAccessoryUUID:v18 homeUUID:v17];

  if (v23)
  {
    id v24 = (void *)MEMORY[0x230FBD990]();
    uint64_t v25 = self;
    id v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      id v32 = v21;
      id v28 = v27 = v20;
      *(_DWORD *)buf = 138543618;
      id v42 = v28;
      __int16 v43 = 2114;
      id v44 = v19;
      _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@Fetch using current accessory %{public}@", buf, 0x16u);

      id v20 = v27;
      id v21 = v32;
    }

    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __250__HMDCompositeSettingsControllerManager_AccessorySettingsLocalMessageHandlerDelegate__accessorySettingsLocalMessageHandler_didReceiveFetchRequestMessage_withHomeUUID_accessoryUUID_keyPaths_callerVersion_callerPrivilege_siriAvailableLanguagesSetting___block_invoke;
    v39[3] = &unk_264A2E1A0;
    v39[4] = v25;
    id v40 = v16;
    id v29 = v16;
    [v23 fetchSettingsForKeyPaths:v19 completion:v39];
  }
  else
  {
    uint64_t v30 = objc_msgSend(v19, "na_filter:", &__block_literal_global_260402);

    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __250__HMDCompositeSettingsControllerManager_AccessorySettingsLocalMessageHandlerDelegate__accessorySettingsLocalMessageHandler_didReceiveFetchRequestMessage_withHomeUUID_accessoryUUID_keyPaths_callerVersion_callerPrivilege_siriAvailableLanguagesSetting___block_invoke_2;
    v34[3] = &unk_264A2E1E8;
    id v35 = v21;
    id v36 = self;
    id v37 = v18;
    id v38 = v16;
    id v31 = v16;
    [(HMDCompositeSettingsControllerManager *)self localFetchSettingsForUUID:v37 homeUUID:v17 withKeyPaths:v30 callerVersion:v20 callerPrivilege:a9 completion:v34];

    id v19 = (id)v30;
  }
}

void __250__HMDCompositeSettingsControllerManager_AccessorySettingsLocalMessageHandlerDelegate__accessorySettingsLocalMessageHandler_didReceiveFetchRequestMessage_withHomeUUID_accessoryUUID_keyPaths_callerVersion_callerPrivilege_siriAvailableLanguagesSetting___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = HMFGetLogIdentifier();
    int v15 = 138543874;
    id v16 = v10;
    __int16 v17 = 2112;
    id v18 = v5;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Fetched settings %@, error: %@", (uint8_t *)&v15, 0x20u);
  }
  id v11 = objc_alloc_init(MEMORY[0x263F0E578]);
  id v12 = (void *)[objc_alloc(MEMORY[0x263F0E060]) initWithSettings:v5 failureInformation:v11];
  uint64_t v13 = *(void **)(a1 + 40);
  __int16 v14 = [v12 payloadCopy];
  [v13 respondWithPayload:v14 error:v6];
}

void __250__HMDCompositeSettingsControllerManager_AccessorySettingsLocalMessageHandlerDelegate__accessorySettingsLocalMessageHandler_didReceiveFetchRequestMessage_withHomeUUID_accessoryUUID_keyPaths_callerVersion_callerPrivilege_siriAvailableLanguagesSetting___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v36 = a3;
  id v34 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263F0E578]);
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v37 objects:v49 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v38 != v13) {
          objc_enumerationMutation(v10);
        }
        int v15 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        id v16 = +[HMDCompositeSettingsControllerManager immutableSettingFromFetchReturn:](HMDCompositeSettingsControllerManager, "immutableSettingFromFetchReturn:", v15, v34, v36, (void)v37);
        if (v16)
        {
          [v9 addObject:v16];
        }
        else
        {
          __int16 v17 = [v15 keyPath];
          [v8 setFetchFailureType:0 forKeyPath:v17];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v37 objects:v49 count:16];
    }
    while (v12);
  }

  if (*(void *)(a1 + 32)) {
    objc_msgSend(v9, "addObject:");
  }
  id v18 = objc_msgSend(v8, "failedKeyPaths", v34);
  uint64_t v19 = [v18 count];

  id v20 = (void *)MEMORY[0x230FBD990]();
  id v21 = *(id *)(a1 + 40);
  id v22 = HMFGetOSLogHandle();
  id v23 = v22;
  if (v19)
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      id v24 = HMFGetLogIdentifier();
      uint64_t v25 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138544130;
      id v42 = v24;
      __int16 v43 = 2112;
      uint64_t v44 = v25;
      __int16 v45 = 2112;
      id v46 = v9;
      __int16 v47 = 2112;
      id v48 = v8;
      id v26 = "%{public}@Fetch completed for accessory uuid: %@ settings: %@ failures: %@";
      id v27 = v23;
      os_log_type_t v28 = OS_LOG_TYPE_ERROR;
      uint32_t v29 = 42;
LABEL_18:
      _os_log_impl(&dword_22F52A000, v27, v28, v26, buf, v29);
    }
  }
  else if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    id v24 = HMFGetLogIdentifier();
    uint64_t v30 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    id v42 = v24;
    __int16 v43 = 2112;
    uint64_t v44 = v30;
    __int16 v45 = 2112;
    id v46 = v9;
    id v26 = "%{public}@Fetch completed for accessory uuid: %@ settings: %@";
    id v27 = v23;
    os_log_type_t v28 = OS_LOG_TYPE_INFO;
    uint32_t v29 = 32;
    goto LABEL_18;
  }

  id v31 = (void *)[objc_alloc(MEMORY[0x263F0E060]) initWithSettings:v9 failureInformation:v8];
  id v32 = *(void **)(a1 + 56);
  id v33 = [v31 payloadCopy];
  [v32 respondWithPayload:v33 error:0];
}

uint64_t __250__HMDCompositeSettingsControllerManager_AccessorySettingsLocalMessageHandlerDelegate__accessorySettingsLocalMessageHandler_didReceiveFetchRequestMessage_withHomeUUID_accessoryUUID_keyPaths_callerVersion_callerPrivilege_siriAvailableLanguagesSetting___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 isEqual:@"root.siri.availableLanguages"] ^ 1;
}

@end