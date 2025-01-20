@interface HMAccessorySettingsDataSource
+ (id)defaultLanguageValue;
+ (id)logCategory;
- (HMAccessorySettingsDataSource)initWithContext:(id)a3 localizationManager:(id)a4 messengerFactory:(id)a5 subscriptionProvider:(id)a6 lastEventStoreReadHandle:(id)a7 lastEventStoreWriteHandle:(id)a8 metricsDispatcher:(id)a9;
- (HMAccessorySettingsDataSourceDataSource)dataSource;
- (HMAccessorySettingsDataSourceDelegate)delegate;
- (HMAccessorySettingsMessengerFactory)messengerFactory;
- (_HMContext)context;
- (id)accessoryUUIDForIdentifier:(void *)a3 homeIdentifier:;
- (id)dataSourceHomeWithHomeIdentifier:(void *)a1;
- (id)defaultSettingsWithHomeIdentifier:(id)a3 accessoryIdentifier:(id)a4 keyPaths:(id)a5;
- (id)homeUUIDForIdentifier:(void *)a1;
- (id)localizedTitleForKeyPath:(id)a3;
- (id)mediaSystemUUIDForIdentifier:(void *)a3 homeIdentifier:;
- (id)topicsForHomeUUID:(void *)a3 accessoryUUID:(void *)a4 keyPaths:;
- (void)_didReceiveEvent:(void *)a3 topic:;
- (void)dealloc;
- (void)didReceiveCachedEvent:(id)a3 topic:(id)a4 source:(id)a5;
- (void)didReceiveEvent:(id)a3 topic:(id)a4;
- (void)fetchAccessorySettingsWithAccessoryIdentifier:(id)a3 keyPaths:(id)a4 completionHandler:(id)a5;
- (void)fetchAccessorySettingsWithHomeIdentifier:(id)a3 accessoryIdentifier:(id)a4 keyPaths:(id)a5 completionHandler:(id)a6;
- (void)fetchCachedAccessorySettingsWithHomeIdentifier:(id)a3 accessoryIdentifier:(id)a4 keyPaths:(id)a5 completionHandler:(id)a6;
- (void)notifyDelegateDidReceiveSettingsUpdatesForAccessoryWithIdentifier:(void *)a3 settings:;
- (void)resetSubscriptions;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)subscribeToAccessorySettingsWithAccessoryIdentifier:(id)a3 keyPaths:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6;
- (void)subscribeToAccessorySettingsWithHomeIdentifier:(id)a3 accessoryIdentifier:(id)a4 keyPaths:(id)a5 options:(unint64_t)a6 completionHandler:(id)a7;
- (void)subscribeToMediaSystemSettingsWithHomeIdentifier:(id)a3 mediaSystemIdentifier:(id)a4 keyPaths:(id)a5 options:(unint64_t)a6 completionHandler:(id)a7;
- (void)unsubscribeToAccessorySettingsWithHomeIdentifier:(id)a3 accessoryIdentifier:(id)a4 keyPaths:(id)a5 completionHandler:(id)a6;
- (void)unsubscribeToMediaSystemSettingsWithHomeIdentifier:(id)a3 mediaSystemIdentifier:(id)a4 keyPaths:(id)a5 completionHandler:(id)a6;
@end

@implementation HMAccessorySettingsDataSource

- (void)setDelegate:(id)a3
{
}

- (void)setDataSource:(id)a3
{
}

- (HMAccessorySettingsDataSource)initWithContext:(id)a3 localizationManager:(id)a4 messengerFactory:(id)a5 subscriptionProvider:(id)a6 lastEventStoreReadHandle:(id)a7 lastEventStoreWriteHandle:(id)a8 metricsDispatcher:(id)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v31 = a6;
  id v30 = a7;
  id obj = a8;
  id v29 = a8;
  id v19 = a9;
  if (!v17)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v16)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v18)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  v20 = v19;
  if (!v19)
  {
LABEL_11:
    v26 = (HMCameraView *)_HMFPreconditionFailure();
    return (HMAccessorySettingsDataSource *)[(HMCameraView *)v26 init];
  }
  v32.receiver = self;
  v32.super_class = (Class)HMAccessorySettingsDataSource;
  v21 = [(HMAccessorySettingsDataSource *)&v32 init];
  v22 = v21;
  if (v21)
  {
    v21->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v21->_context, a3);
    uint64_t v23 = [v16 queue];
    workQueue = v22->_workQueue;
    v22->_workQueue = (OS_dispatch_queue *)v23;

    objc_storeStrong((id *)&v22->_localizationManager, a4);
    objc_storeWeak((id *)&v22->_messengerFactory, v18);
    objc_storeStrong((id *)&v22->_eventSubscriptionProvider, a6);
    objc_storeStrong((id *)&v22->_lastEventStoreReadHandle, a7);
    objc_storeStrong((id *)&v22->_lastEventStoreWriteHandle, obj);
    objc_storeStrong((id *)&v22->_metricsDispatcher, a9);
  }

  return v22;
}

- (void)subscribeToAccessorySettingsWithAccessoryIdentifier:(id)a3 keyPaths:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = [(HMAccessorySettingsDataSource *)self context];
  v14 = [v13 delegateCaller];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __132__HMAccessorySettingsDataSource_Deprecated__subscribeToAccessorySettingsWithAccessoryIdentifier_keyPaths_options_completionHandler___block_invoke;
  v18[3] = &unk_1E59417A0;
  v18[4] = self;
  id v19 = v10;
  id v21 = v12;
  unint64_t v22 = a5;
  id v20 = v11;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  [v14 invokeBlock:v18];
}

void __132__HMAccessorySettingsDataSource_Deprecated__subscribeToAccessorySettingsWithAccessoryIdentifier_keyPaths_options_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    v8 = HMAccessorySettingsDataSourceSubscribeOptionsAsString(*(void *)(a1 + 64));
    int v10 = 138544130;
    id v11 = v5;
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    __int16 v14 = 2112;
    uint64_t v15 = v7;
    __int16 v16 = 2112;
    id v17 = v8;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_ERROR, "%{public}@Deprecated API: Subscribing to accessory settings with accessory identifier: %@ key paths: %@ options: %@", (uint8_t *)&v10, 0x2Au);
  }
  v9 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)fetchAccessorySettingsWithAccessoryIdentifier:(id)a3 keyPaths:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HMAccessorySettingsDataSource *)self context];
  __int16 v12 = [v11 delegateCaller];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __118__HMAccessorySettingsDataSource_Deprecated__fetchAccessorySettingsWithAccessoryIdentifier_keyPaths_completionHandler___block_invoke;
  v16[3] = &unk_1E5944360;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  [v12 invokeBlock:v16];
}

void __118__HMAccessorySettingsDataSource_Deprecated__fetchAccessorySettingsWithAccessoryIdentifier_keyPaths_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    int v9 = 138543874;
    id v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    uint64_t v14 = v7;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_ERROR, "%{public}@Deprecated API: Fetching accessory settings with accessory identifier: %@ key paths: %@", (uint8_t *)&v9, 0x20u);
  }
  id v8 = [MEMORY[0x1E4F28C58] hmErrorWithCode:23];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_messengerFactory);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_lastEventStoreWriteHandle, 0);
  objc_storeStrong((id *)&self->_lastEventStoreReadHandle, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_metricsDispatcher, 0);
  objc_storeStrong((id *)&self->_eventSubscriptionProvider, 0);
  objc_storeStrong((id *)&self->_localizationManager, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_messenger, 0);
}

- (HMAccessorySettingsMessengerFactory)messengerFactory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messengerFactory);

  return (HMAccessorySettingsMessengerFactory *)WeakRetained;
}

- (_HMContext)context
{
  return (_HMContext *)objc_getProperty(self, a2, 88, 1);
}

- (HMAccessorySettingsDataSourceDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (HMAccessorySettingsDataSourceDataSource *)WeakRetained;
}

- (HMAccessorySettingsDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HMAccessorySettingsDataSourceDelegate *)WeakRetained;
}

- (void)dealloc
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x19F3A64A0](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    uint64_t v7 = [(HMAccessorySettingsDataSource *)v4 delegate];
    *(_DWORD *)buf = 138543618;
    id v10 = v6;
    __int16 v11 = 2112;
    uint64_t v12 = v7;
    _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_INFO, "%{public}@Deallocating. delegate:%@", buf, 0x16u);
  }
  v8.receiver = v4;
  v8.super_class = (Class)HMAccessorySettingsDataSource;
  [(HMAccessorySettingsDataSource *)&v8 dealloc];
}

- (id)defaultSettingsWithHomeIdentifier:(id)a3 accessoryIdentifier:(id)a4 keyPaths:(id)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = -[HMAccessorySettingsDataSource dataSourceHomeWithHomeIdentifier:](self, v8);
  uint64_t v12 = v11;
  if (v11)
  {
    uint64_t v13 = [v11 supportedSiriEndPointVersion];
    if (v13)
    {
      uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F65590]) initWithVersionString:@"7.2"];
      if ([v13 isAtLeastVersion:v14])
      {
        uint64_t v15 = [MEMORY[0x1E4F1CA48] array];
        if ([v10 containsObject:@"root.siri.allowHeySiri"])
        {
          __int16 v16 = [[HMBooleanSetting alloc] initWithKeyPath:@"root.siri.allowHeySiri" readOnly:1 BOOLValue:0];
          [v15 addObject:v16];
        }
        if ([v10 containsObject:@"root.siri.siriEnabled"])
        {
          id v17 = [[HMBooleanSetting alloc] initWithKeyPath:@"root.siri.siriEnabled" readOnly:1 BOOLValue:0];
          [v15 addObject:v17];
        }
        if ([v10 containsObject:@"root.airPlay.airPlayEnabled"])
        {
          id v18 = [[HMBooleanSetting alloc] initWithKeyPath:@"root.airPlay.airPlayEnabled" readOnly:1 BOOLValue:0];
          [v15 addObject:v18];
        }
        if ([v10 containsObject:@"root.siri.lightWhenUsingSiri"])
        {
          id v19 = [[HMBooleanSetting alloc] initWithKeyPath:@"root.siri.lightWhenUsingSiri" readOnly:1 BOOLValue:1];
          [v15 addObject:v19];
        }
        if ([v10 containsObject:@"root.siri.tapToAccess"])
        {
          id v20 = [[HMBooleanSetting alloc] initWithKeyPath:@"root.siri.tapToAccess" readOnly:1 BOOLValue:1];
          [v15 addObject:v20];
        }
        if ([v10 containsObject:@"root.siri.soundAlert"])
        {
          id v21 = [[HMBooleanSetting alloc] initWithKeyPath:@"root.siri.soundAlert" readOnly:1 BOOLValue:1];
          [v15 addObject:v21];
        }
        if ([v10 containsObject:@"root.siri.language"])
        {
          unint64_t v22 = +[HMAccessorySettingsDataSource defaultLanguageValue];
          uint64_t v23 = [[HMLanguageSetting alloc] initWithKeyPath:@"root.siri.language" readOnly:1 languageValue:v22];
          [v15 addObject:v23];
        }
        if ([v10 containsObject:@"root.locationServices.enabled"])
        {
          v24 = [[HMBooleanSetting alloc] initWithKeyPath:@"root.locationServices.enabled" readOnly:1 BOOLValue:1];
          [v15 addObject:v24];
        }
        v25 = [v12 accessoryWithUniqueIdentifier:v9];
        if ([v10 containsObject:@"root.music.allowExplicitContent"]
          && ([v25 supportsUserMediaSettings] & 1) == 0)
        {
          v26 = [[HMBooleanSetting alloc] initWithKeyPath:@"root.music.allowExplicitContent" readOnly:1 BOOLValue:0];
          [v15 addObject:v26];
        }
        if ([v10 containsObject:@"root.announce.enabled"])
        {
          SEL v27 = [[HMBooleanSetting alloc] initWithKeyPath:@"root.announce.enabled" readOnly:1 BOOLValue:0];
          [v15 addObject:v27];
        }
        if ([v10 containsObject:@"root.general.analytics.shareSiriAnalytics"])
        {
          v28 = [[HMBooleanSetting alloc] initWithKeyPath:@"root.general.analytics.shareSiriAnalytics" readOnly:1 BOOLValue:0];
          [v15 addObject:v28];
        }
        id v29 = (void *)[v15 copy];
      }
      else
      {
        v38 = (void *)MEMORY[0x19F3A64A0]();
        v39 = self;
        v40 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          v41 = HMFGetLogIdentifier();
          int v43 = 138543874;
          v44 = v41;
          __int16 v45 = 2112;
          id v46 = v13;
          __int16 v47 = 2112;
          v48 = v12;
          _os_log_impl(&dword_19D1A8000, v40, OS_LOG_TYPE_ERROR, "%{public}@Failed to get default settings due to unsupported siri endpoint version: %@ for home: %@", (uint8_t *)&v43, 0x20u);
        }
        id v29 = (void *)MEMORY[0x1E4F1CBF0];
      }
    }
    else
    {
      v34 = (void *)MEMORY[0x19F3A64A0]();
      v35 = self;
      v36 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v37 = HMFGetLogIdentifier();
        int v43 = 138543618;
        v44 = v37;
        __int16 v45 = 2112;
        id v46 = v12;
        _os_log_impl(&dword_19D1A8000, v36, OS_LOG_TYPE_ERROR, "%{public}@Failed to get default settings due to unknown supported siri endpoint version for home: %@", (uint8_t *)&v43, 0x16u);
      }
      id v29 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    id v30 = (void *)MEMORY[0x19F3A64A0]();
    id v31 = self;
    objc_super v32 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v33 = HMFGetLogIdentifier();
      int v43 = 138543618;
      v44 = v33;
      __int16 v45 = 2112;
      id v46 = v8;
      _os_log_impl(&dword_19D1A8000, v32, OS_LOG_TYPE_ERROR, "%{public}@Failed to get default settings due to unknown home with identifier: %@", (uint8_t *)&v43, 0x16u);
    }
    id v29 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v29;
}

- (id)dataSourceHomeWithHomeIdentifier:(void *)a1
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    v4 = [a1 dataSource];
    v5 = v4;
    if (v4)
    {
      uint64_t v6 = [v4 accessorySettingsDataSource:a1 homeWithHomeIdentifier:v3];
    }
    else
    {
      uint64_t v7 = (void *)MEMORY[0x19F3A64A0]();
      id v8 = a1;
      id v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v10 = HMFGetLogIdentifier();
        int v12 = 138543362;
        uint64_t v13 = v10;
        _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to data source accessory UUID due to no data source", (uint8_t *)&v12, 0xCu);
      }
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)didReceiveCachedEvent:(id)a3 topic:(id)a4 source:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v11 = a5;
  if (self) {
    Property = objc_getProperty(self, v10, 56, 1);
  }
  else {
    Property = 0;
  }
  dispatch_assert_queue_V2(Property);
  uint64_t v13 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v14 = self;
  uint64_t v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    __int16 v16 = HMFGetLogIdentifier();
    int v17 = 138543874;
    id v18 = v16;
    __int16 v19 = 2112;
    id v20 = v8;
    __int16 v21 = 2112;
    id v22 = v9;
    _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_INFO, "%{public}@Received cached event: %@, topic: %@", (uint8_t *)&v17, 0x20u);
  }
  -[HMAccessorySettingsDataSource _didReceiveEvent:topic:](v14, v8, v9);
}

- (void)_didReceiveEvent:(void *)a3 topic:
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v7 = a3;
  if (a1)
  {
    Property = objc_getProperty(a1, v6, 56, 1);
    dispatch_assert_queue_V2(Property);
    id v55 = 0;
    id v56 = 0;
    id v54 = 0;
    int v9 = HMImmutableSettingChangeEventComponentsFromTopic(v7, &v56, &v55, &v54);
    id v10 = v56;
    id v11 = v55;
    id v12 = v54;
    uint64_t v13 = v12;
    if (v9)
    {
      id v49 = v7;
      id v50 = v5;
      id v14 = v5;
      id v15 = v10;
      id v16 = v11;
      id v58 = 0;
      int v17 = +[HMImmutableSettingChangeEvent decodeSettingFromEvent:v14 error:&v58];
      id v47 = v58;
      id v18 = (void *)MEMORY[0x19F3A64A0]();
      id v19 = a1;
      id v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        __int16 v21 = HMFGetLogIdentifier();
        id v22 = [v19 delegate];
        *(_DWORD *)buf = 138544130;
        *(void *)&uint8_t buf[4] = v21;
        __int16 v61 = 2112;
        id v62 = v17;
        __int16 v63 = 2112;
        id v64 = v47;
        __int16 v65 = 2112;
        id v66 = v22;
        _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_INFO, "%{public}@Modified accessory setting:%@, error:%@, delegate:%@", buf, 0x2Au);
      }
      if (v17)
      {
        uint64_t v23 = [v19 dataSource];
        *(void *)buf = 0;
        id v57 = 0;
        int v24 = [v23 accessorySettingsDataSource:v19 transformHomeUUID:v15 accessoryUUID:v16 toClientHomeIdentifier:buf clientAccessoryIdentifier:&v57];
        id v25 = *(id *)buf;
        id v26 = v57;

        if (v24)
        {
          v59 = v17;
          SEL v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v59 count:1];
          -[HMAccessorySettingsDataSource notifyDelegateDidReceiveSettingsUpdatesForAccessoryWithIdentifier:settings:](v19, v26, v27);
        }
      }
      else
      {
        id v25 = 0;
        id v26 = 0;
      }
    }
    else
    {
      id v52 = v11;
      id v53 = v10;
      id v51 = v12;
      BOOL v28 = HMImmutableSettingChangeEventComponentsFromMediaSystemTopic((uint64_t)v7, &v53, &v52, &v51);
      id v15 = v53;

      id v16 = v52;
      id v29 = v51;

      if (!v28)
      {
        int v43 = (void *)MEMORY[0x19F3A64A0]();
        id v44 = a1;
        __int16 v45 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          id v46 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138544130;
          *(void *)&uint8_t buf[4] = v46;
          __int16 v61 = 2112;
          id v62 = v5;
          __int16 v63 = 2112;
          id v64 = v15;
          __int16 v65 = 2112;
          id v66 = v16;
          _os_log_impl(&dword_19D1A8000, v45, OS_LOG_TYPE_ERROR, "%{public}@Received unknown event: %@ home: %@ target: %@", buf, 0x2Au);
        }
        uint64_t v13 = v29;
        goto LABEL_22;
      }
      id v48 = v29;
      id v49 = v7;
      id v50 = v5;
      id v30 = v5;
      id v15 = v15;
      id v16 = v16;
      id v58 = 0;
      id v31 = +[HMImmutableSettingChangeEvent decodeSettingFromEvent:v30 error:&v58];
      id v32 = v58;
      v33 = (void *)MEMORY[0x19F3A64A0]();
      id v34 = a1;
      v35 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        v36 = HMFGetLogIdentifier();
        v37 = [v34 delegate];
        *(_DWORD *)buf = 138544130;
        *(void *)&uint8_t buf[4] = v36;
        __int16 v61 = 2112;
        id v62 = v31;
        __int16 v63 = 2112;
        id v64 = v32;
        __int16 v65 = 2112;
        id v66 = v37;
        _os_log_impl(&dword_19D1A8000, v35, OS_LOG_TYPE_INFO, "%{public}@Modified media system setting:%@, error:%@, delegate:%@", buf, 0x2Au);
      }
      if (v31)
      {
        v38 = [v34 dataSource];
        *(void *)buf = 0;
        id v57 = 0;
        int v39 = [v38 accessorySettingsDataSource:v34 transformHomeUUID:v15 mediaSystemUUID:v16 toClientHomeIdentifier:buf clientMediaSystemIdentifier:&v57];
        id v40 = *(id *)buf;
        id v41 = v57;

        if (v39)
        {
          v59 = v31;
          v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v59 count:1];
          -[HMAccessorySettingsDataSource notifyDelegateDidReceiveSettingsUpdatesForAccessoryWithIdentifier:settings:](v34, v41, v42);
        }
      }
      else
      {
        id v40 = 0;
        id v41 = 0;
      }

      uint64_t v13 = v48;
    }
    id v7 = v49;
    id v5 = v50;
LABEL_22:
  }
}

- (void)notifyDelegateDidReceiveSettingsUpdatesForAccessoryWithIdentifier:(void *)a3 settings:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [a1 delegate];
  id v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = a1;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544130;
    uint64_t v23 = v11;
    __int16 v24 = 2112;
    id v25 = v5;
    __int16 v26 = 2112;
    id v27 = v6;
    __int16 v28 = 2112;
    id v29 = v7;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Notifying client of did receive settings updates for accessory with identifier: %@ settings: %@ delegate: %@", buf, 0x2Au);
  }
  id v12 = [v9 context];
  uint64_t v13 = [v12 delegateCaller];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __108__HMAccessorySettingsDataSource_notifyDelegateDidReceiveSettingsUpdatesForAccessoryWithIdentifier_settings___block_invoke;
  v17[3] = &unk_1E5944F20;
  id v18 = v7;
  id v19 = v9;
  id v14 = v5;
  id v20 = v14;
  id v15 = v6;
  id v21 = v15;
  id v16 = v7;
  [v13 invokeBlock:v17];
}

uint64_t __108__HMAccessorySettingsDataSource_notifyDelegateDidReceiveSettingsUpdatesForAccessoryWithIdentifier_settings___block_invoke(void *a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    uint64_t v6 = a1[7];
    return [v3 accessorySettingsDataSource:v4 didReceiveSettingsUpdatesForAccessoryWithIdentifier:v5 settings:v6];
  }
  return result;
}

- (void)didReceiveEvent:(id)a3 topic:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v8 = a4;
  if (self) {
    Property = objc_getProperty(self, v7, 56, 1);
  }
  else {
    Property = 0;
  }
  dispatch_assert_queue_V2(Property);
  id v10 = (void *)MEMORY[0x19F3A64A0]();
  id v11 = self;
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = HMFGetLogIdentifier();
    int v14 = 138543874;
    id v15 = v13;
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v8;
    _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@Received live event: %@, topic: %@", (uint8_t *)&v14, 0x20u);
  }
  -[HMAccessorySettingsDataSource _didReceiveEvent:topic:](v11, v6, v8);
}

- (void)unsubscribeToMediaSystemSettingsWithHomeIdentifier:(id)a3 mediaSystemIdentifier:(id)a4 keyPaths:(id)a5 completionHandler:(id)a6
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  int v14 = (void *)MEMORY[0x19F3A64A0]();
  id v15 = self;
  __int16 v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544130;
    int v43 = v17;
    __int16 v44 = 2112;
    id v45 = v10;
    __int16 v46 = 2112;
    id v47 = v11;
    __int16 v48 = 2112;
    id v49 = v12;
    _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_INFO, "%{public}@Unsubscribing to media system settings with home identifier: %@ media system identifier: %@ key paths: %@", buf, 0x2Au);
  }
  __int16 v18 = -[HMAccessorySettingsDataSource homeUUIDForIdentifier:](v15, v10);
  if (v18)
  {
    uint64_t v19 = -[HMAccessorySettingsDataSource mediaSystemUUIDForIdentifier:homeIdentifier:](v15, v11, v10);
    if (v19)
    {
      uint64_t v20 = (void *)v19;
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __133__HMAccessorySettingsDataSource_unsubscribeToMediaSystemSettingsWithHomeIdentifier_mediaSystemIdentifier_keyPaths_completionHandler___block_invoke;
      v39[3] = &unk_1E59419F8;
      id v40 = v18;
      id v21 = v20;
      id v41 = v21;
      uint64_t v23 = objc_msgSend(v12, "na_map:", v39);
      if (v15) {
        id Property = objc_getProperty(v15, v22, 40, 1);
      }
      else {
        id Property = 0;
      }
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __133__HMAccessorySettingsDataSource_unsubscribeToMediaSystemSettingsWithHomeIdentifier_mediaSystemIdentifier_keyPaths_completionHandler___block_invoke_2;
      v37[3] = &unk_1E59449C8;
      v37[4] = v15;
      id v38 = v13;
      [Property unregisterConsumer:v15 topicFilters:v23 completion:v37];

      id v25 = v40;
    }
    else
    {
      id v31 = (void *)MEMORY[0x19F3A64A0]();
      id v32 = v15;
      v33 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        id v34 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        int v43 = v34;
        __int16 v44 = 2112;
        id v45 = v11;
        _os_log_impl(&dword_19D1A8000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to unsubscribe media system settings from cache due to unknown media system identifier: %@", buf, 0x16u);
      }
      id v25 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
      v35 = [(HMAccessorySettingsDataSource *)v32 context];
      v36 = [v35 delegateCaller];
      [v36 callCompletion:v13 error:v25];

      id v21 = 0;
    }
  }
  else
  {
    __int16 v26 = (void *)MEMORY[0x19F3A64A0]();
    id v27 = v15;
    __int16 v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      id v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      int v43 = v29;
      __int16 v44 = 2112;
      id v45 = v10;
      _os_log_impl(&dword_19D1A8000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to unsubscribe media system settings from cache due to unknown home identifier: %@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    id v25 = [(HMAccessorySettingsDataSource *)v27 context];
    uint64_t v30 = [v25 delegateCaller];
    [v30 callCompletion:v13 error:v21];
  }
}

- (id)homeUUIDForIdentifier:(void *)a1
{
  if (a1)
  {
    v2 = -[HMAccessorySettingsDataSource dataSourceHomeWithHomeIdentifier:](a1, a2);
    id v3 = v2;
    if (v2)
    {
      uint64_t v4 = [v2 uuid];
    }
    else
    {
      uint64_t v4 = 0;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)mediaSystemUUIDForIdentifier:(void *)a3 homeIdentifier:
{
  id v5 = a2;
  if (a1)
  {
    id v6 = -[HMAccessorySettingsDataSource dataSourceHomeWithHomeIdentifier:](a1, a3);
    id v7 = v6;
    if (v6)
    {
      id v8 = [v6 mediaSystemWithUniqueIdentifier:v5];
      id v9 = v8;
      if (v8)
      {
        a1 = [v8 uuid];
      }
      else
      {
        a1 = 0;
      }
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

uint64_t __133__HMAccessorySettingsDataSource_unsubscribeToMediaSystemSettingsWithHomeIdentifier_mediaSystemIdentifier_keyPaths_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [NSString stringWithFormat:@"home.%@.mediagroup.stereo.%@.settings.%@.updated", *(void *)(a1 + 32), *(void *)(a1 + 40), a2];
}

void __133__HMAccessorySettingsDataSource_unsubscribeToMediaSystemSettingsWithHomeIdentifier_mediaSystemIdentifier_keyPaths_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = HMFGetLogIdentifier();
    int v10 = 138543618;
    id v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Unsubscribe topics with result: %@", (uint8_t *)&v10, 0x16u);
  }
  id v8 = [*(id *)(a1 + 32) context];
  id v9 = [v8 delegateCaller];
  [v9 callCompletion:*(void *)(a1 + 40) error:v3];
}

- (void)subscribeToMediaSystemSettingsWithHomeIdentifier:(id)a3 mediaSystemIdentifier:(id)a4 keyPaths:(id)a5 options:(unint64_t)a6 completionHandler:(id)a7
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  __int16 v16 = (void *)MEMORY[0x19F3A64A0]();
  id v17 = self;
  __int16 v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    uint64_t v19 = HMFGetLogIdentifier();
    uint64_t v20 = HMAccessorySettingsDataSourceSubscribeOptionsAsString(a6);
    *(_DWORD *)buf = 138544386;
    __int16 v46 = v19;
    __int16 v47 = 2112;
    id v48 = v12;
    __int16 v49 = 2112;
    id v50 = v13;
    __int16 v51 = 2112;
    id v52 = v14;
    __int16 v53 = 2112;
    id v54 = v20;
    _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_INFO, "%{public}@Subscribing to media system settings with home identifier: %@ accessory identifier: %@ key paths: %@ options: %@", buf, 0x34u);
  }
  id v21 = -[HMAccessorySettingsDataSource homeUUIDForIdentifier:](v17, v12);
  if (v21)
  {
    uint64_t v22 = -[HMAccessorySettingsDataSource mediaSystemUUIDForIdentifier:homeIdentifier:](v17, v13, v12);
    if (v22)
    {
      uint64_t v23 = (void *)v22;
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __139__HMAccessorySettingsDataSource_subscribeToMediaSystemSettingsWithHomeIdentifier_mediaSystemIdentifier_keyPaths_options_completionHandler___block_invoke;
      v42[3] = &unk_1E59419F8;
      id v43 = v21;
      id v24 = v23;
      id v44 = v24;
      __int16 v26 = objc_msgSend(v14, "na_map:", v42);
      if (v17) {
        id Property = objc_getProperty(v17, v25, 40, 1);
      }
      else {
        id Property = 0;
      }
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __139__HMAccessorySettingsDataSource_subscribeToMediaSystemSettingsWithHomeIdentifier_mediaSystemIdentifier_keyPaths_options_completionHandler___block_invoke_2;
      v40[3] = &unk_1E5941AC0;
      v40[4] = v17;
      id v41 = v15;
      [Property registerConsumer:v17 topicFilters:v26 completion:v40];

      __int16 v28 = v43;
    }
    else
    {
      id v34 = (void *)MEMORY[0x19F3A64A0]();
      v35 = v17;
      v36 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v37 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        __int16 v46 = v37;
        __int16 v47 = 2112;
        id v48 = v13;
        _os_log_impl(&dword_19D1A8000, v36, OS_LOG_TYPE_ERROR, "%{public}@Failed to subscribe to media system settings due to unknown accessory identifier: %@", buf, 0x16u);
      }
      __int16 v28 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
      id v38 = [(HMAccessorySettingsDataSource *)v35 context];
      int v39 = [v38 delegateCaller];
      [v39 callCompletion:v15 error:v28];

      id v24 = 0;
    }
  }
  else
  {
    id v29 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v30 = v17;
    id v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      id v32 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v46 = v32;
      __int16 v47 = 2112;
      id v48 = v12;
      _os_log_impl(&dword_19D1A8000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to subscribe to media system settings due to unknown home identifier: %@", buf, 0x16u);
    }
    id v24 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    __int16 v28 = [(HMAccessorySettingsDataSource *)v30 context];
    v33 = [v28 delegateCaller];
    [v33 callCompletion:v15 error:v24];
  }
}

uint64_t __139__HMAccessorySettingsDataSource_subscribeToMediaSystemSettingsWithHomeIdentifier_mediaSystemIdentifier_keyPaths_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [NSString stringWithFormat:@"home.%@.mediagroup.stereo.%@.settings.%@.updated", *(void *)(a1 + 32), *(void *)(a1 + 40), a2];
}

void __139__HMAccessorySettingsDataSource_subscribeToMediaSystemSettingsWithHomeIdentifier_mediaSystemIdentifier_keyPaths_options_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  int v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v29 = v11;
      __int16 v30 = 2112;
      id v31 = v6;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Subscribe changed topics with error: %@", buf, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v29 = v12;
      __int16 v30 = 2112;
      id v31 = v5;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Subscribe changed topics, received cached events %@", buf, 0x16u);
    }
    if ([v5 count])
    {
      id v14 = *(void **)(a1 + 32);
      if (v14) {
        id Property = objc_getProperty(v14, v13, 56, 1);
      }
      else {
        id Property = 0;
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __139__HMAccessorySettingsDataSource_subscribeToMediaSystemSettingsWithHomeIdentifier_mediaSystemIdentifier_keyPaths_options_completionHandler___block_invoke_49;
      block[3] = &unk_1E5945628;
      id v16 = v5;
      uint64_t v17 = *(void *)(a1 + 32);
      id v26 = v16;
      uint64_t v27 = v17;
      dispatch_async(Property, block);
    }
  }
  __int16 v18 = [*(id *)(a1 + 32) context];
  uint64_t v19 = [v18 delegateCaller];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __139__HMAccessorySettingsDataSource_subscribeToMediaSystemSettingsWithHomeIdentifier_mediaSystemIdentifier_keyPaths_options_completionHandler___block_invoke_51;
  v22[3] = &unk_1E59454E8;
  id v20 = *(id *)(a1 + 40);
  id v23 = v6;
  id v24 = v20;
  id v21 = v6;
  [v19 invokeBlock:v22];
}

uint64_t __139__HMAccessorySettingsDataSource_subscribeToMediaSystemSettingsWithHomeIdentifier_mediaSystemIdentifier_keyPaths_options_completionHandler___block_invoke_49(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __139__HMAccessorySettingsDataSource_subscribeToMediaSystemSettingsWithHomeIdentifier_mediaSystemIdentifier_keyPaths_options_completionHandler___block_invoke_2_50;
  v3[3] = &unk_1E5941A98;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return objc_msgSend(v1, "na_each:", v3);
}

uint64_t __139__HMAccessorySettingsDataSource_subscribeToMediaSystemSettingsWithHomeIdentifier_mediaSystemIdentifier_keyPaths_options_completionHandler___block_invoke_51(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __139__HMAccessorySettingsDataSource_subscribeToMediaSystemSettingsWithHomeIdentifier_mediaSystemIdentifier_keyPaths_options_completionHandler___block_invoke_2_50(uint64_t a1, void *a2, void *a3)
{
}

- (id)localizedTitleForKeyPath:(id)a3
{
  if (self)
  {
    id v3 = self;
    uint64_t v4 = [a3 uppercaseString];
    id v5 = (void *)[v4 mutableCopy];

    objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", @".", @"_", 1, 0, objc_msgSend(v5, "length"));
    [v5 appendString:@"_LOCALIZATION_KEY"];
    id v6 = (void *)[v5 copy];

    self = (HMAccessorySettingsDataSource *)objc_getProperty(v3, v7, 32, 1);
  }
  else
  {
    id v6 = 0;
  }
  id v8 = [(HMAccessorySettingsDataSource *)self getLocalizedString:v6];

  return v8;
}

- (void)resetSubscriptions
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x19F3A64A0](self, a2);
  uint64_t v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v11 = v6;
    _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Unsubscribe from all subscriptions", buf, 0xCu);
  }
  if (v4) {
    id Property = objc_getProperty(v4, v7, 40, 1);
  }
  else {
    id Property = 0;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__HMAccessorySettingsDataSource_resetSubscriptions__block_invoke;
  v9[3] = &unk_1E5945188;
  v9[4] = v4;
  [Property unregisterConsumer:v4 completion:v9];
}

- (void)unsubscribeToAccessorySettingsWithHomeIdentifier:(id)a3 accessoryIdentifier:(id)a4 keyPaths:(id)a5 completionHandler:(id)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)MEMORY[0x19F3A64A0]();
  id v15 = self;
  id v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544130;
    id v38 = v17;
    __int16 v39 = 2112;
    id v40 = v10;
    __int16 v41 = 2112;
    id v42 = v11;
    __int16 v43 = 2112;
    id v44 = v12;
    _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_INFO, "%{public}@Unsubscribing to accessory settings from cache with home identifier: %@ accessory identifier: %@ key paths: %@", buf, 0x2Au);
  }
  __int16 v18 = -[HMAccessorySettingsDataSource homeUUIDForIdentifier:](v15, v10);
  if (v18)
  {
    uint64_t v19 = -[HMAccessorySettingsDataSource accessoryUUIDForIdentifier:homeIdentifier:](v15, v11, v10);
    if (v19)
    {
      id v20 = v19;
      uint64_t v22 = -[HMAccessorySettingsDataSource topicsForHomeUUID:accessoryUUID:keyPaths:]((uint64_t)v15, v18, v19, v12);
      if (v15) {
        id Property = objc_getProperty(v15, v21, 40, 1);
      }
      else {
        id Property = 0;
      }
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __129__HMAccessorySettingsDataSource_unsubscribeToAccessorySettingsWithHomeIdentifier_accessoryIdentifier_keyPaths_completionHandler___block_invoke;
      v35[3] = &unk_1E59449C8;
      v35[4] = v15;
      id v36 = v13;
      [Property unregisterConsumer:v15 topicFilters:v22 completion:v35];
    }
    else
    {
      id v29 = (void *)MEMORY[0x19F3A64A0]();
      __int16 v30 = v15;
      id v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        uint64_t v32 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v38 = v32;
        __int16 v39 = 2112;
        id v40 = v11;
        _os_log_impl(&dword_19D1A8000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch accessory settings from cache due to unknown accessory identifier: %@", buf, 0x16u);
      }
      uint64_t v22 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
      v33 = [(HMAccessorySettingsDataSource *)v30 context];
      id v34 = [v33 delegateCaller];
      [v34 callCompletion:v13 error:v22];

      id v20 = 0;
    }
  }
  else
  {
    id v24 = (void *)MEMORY[0x19F3A64A0]();
    id v25 = v15;
    id v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v38 = v27;
      __int16 v39 = 2112;
      id v40 = v10;
      _os_log_impl(&dword_19D1A8000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch accessory settings from cache due to unknown home identifier: %@", buf, 0x16u);
    }
    id v20 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    uint64_t v22 = [(HMAccessorySettingsDataSource *)v25 context];
    __int16 v28 = [v22 delegateCaller];
    [v28 callCompletion:v13 error:v20];
  }
}

- (id)accessoryUUIDForIdentifier:(void *)a3 homeIdentifier:
{
  id v5 = a2;
  if (a1)
  {
    id v6 = -[HMAccessorySettingsDataSource dataSourceHomeWithHomeIdentifier:](a1, a3);
    SEL v7 = v6;
    if (v6)
    {
      id v8 = [v6 accessoryWithUniqueIdentifier:v5];
      id v9 = v8;
      if (v8)
      {
        a1 = [v8 uuid];
      }
      else
      {
        a1 = 0;
      }
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (id)topicsForHomeUUID:(void *)a3 accessoryUUID:(void *)a4 keyPaths:
{
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __74__HMAccessorySettingsDataSource_topicsForHomeUUID_accessoryUUID_keyPaths___block_invoke;
    v11[3] = &unk_1E59419F8;
    id v12 = v7;
    id v13 = v8;
    id v9 = objc_msgSend(a4, "na_map:", v11);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void __129__HMAccessorySettingsDataSource_unsubscribeToAccessorySettingsWithHomeIdentifier_accessoryIdentifier_keyPaths_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = HMFGetLogIdentifier();
    int v10 = 138543618;
    id v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Unsubscribe topics with result: %@", (uint8_t *)&v10, 0x16u);
  }
  id v8 = [*(id *)(a1 + 32) context];
  id v9 = [v8 delegateCaller];
  [v9 callCompletion:*(void *)(a1 + 40) error:v3];
}

id __74__HMAccessorySettingsDataSource_topicsForHomeUUID_accessoryUUID_keyPaths___block_invoke(uint64_t a1, uint64_t a2)
{
  return HMImmutableSettingChangeEventTopicFromComponentsHH2(*(void *)(a1 + 32), *(void *)(a1 + 40), a2);
}

- (void)subscribeToAccessorySettingsWithHomeIdentifier:(id)a3 accessoryIdentifier:(id)a4 keyPaths:(id)a5 options:(unint64_t)a6 completionHandler:(id)a7
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v54 = a4;
  id v13 = a5;
  id v53 = a7;
  uint64_t v14 = (void *)MEMORY[0x19F3A64A0]();
  id v15 = self;
  id v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = HMFGetLogIdentifier();
    __int16 v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
    uint64_t v19 = HMAccessorySettingsDataSourceSubscribeOptionsAsString(a6);
    *(_DWORD *)buf = 138544386;
    *(void *)&uint8_t buf[4] = v17;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 2112;
    id v56 = v54;
    *(_WORD *)id v57 = 2112;
    *(void *)&v57[2] = v18;
    *(_WORD *)&v57[10] = 2112;
    *(void *)&v57[12] = v19;
    _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_INFO, "%{public}@Subscribing to accessory settings from cache with home identifier: %@ accessory identifier: %@ # key paths: %@ options: %@", buf, 0x34u);
  }
  id v20 = -[HMAccessorySettingsDataSource homeUUIDForIdentifier:](v15, v12);
  if (v20)
  {
    uint64_t v21 = -[HMAccessorySettingsDataSource accessoryUUIDForIdentifier:homeIdentifier:](v15, v54, v12);
    if (v21)
    {
      uint64_t v22 = (void *)v21;
      id v23 = v20;
      id v24 = v22;
      id v52 = v13;
      id v25 = v13;
      id v26 = v53;
      uint64_t v27 = v26;
      if (v15)
      {
        __int16 v51 = v26;
        __int16 v28 = v23;
        id v29 = (void *)MEMORY[0x19F3A64A0]();
        __int16 v30 = v15;
        id v31 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          uint64_t v32 = HMFGetLogIdentifier();
          v33 = HMAccessorySettingsDataSourceSubscribeOptionsAsString(a6);
          *(_DWORD *)buf = 138544386;
          *(void *)&uint8_t buf[4] = v32;
          *(_WORD *)&unsigned char buf[12] = 2112;
          *(void *)&buf[14] = v28;
          *(_WORD *)&buf[22] = 2112;
          id v56 = v24;
          *(_WORD *)id v57 = 2112;
          *(void *)&v57[2] = v25;
          *(_WORD *)&v57[10] = 2112;
          *(void *)&v57[12] = v33;
          _os_log_impl(&dword_19D1A8000, v31, OS_LOG_TYPE_INFO, "%{public}@Subscribing to accessory settings with home uuid: %@ accessory uuid: %@ key paths: %@ options: %@", buf, 0x34u);
        }
        id v23 = v28;
        id v34 = -[HMAccessorySettingsDataSource topicsForHomeUUID:accessoryUUID:keyPaths:]((uint64_t)v30, v28, v24, v25);
        id Property = objc_getProperty(v30, v35, 40, 1);
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __131__HMAccessorySettingsDataSource_subscribeToAccessorySettingsOnDaemonWithHomeUUID_accessoryUUID_keyPaths_options_completionHandler___block_invoke;
        id v56 = &unk_1E5941AC0;
        *(void *)id v57 = v30;
        uint64_t v27 = v51;
        *(void *)&v57[8] = v51;
        [Property registerConsumer:v30 topicFilters:v34 completion:buf];
      }
      id v13 = v52;
      v37 = v53;
    }
    else
    {
      id v44 = (void *)MEMORY[0x19F3A64A0]();
      uint64_t v45 = v15;
      __int16 v46 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        __int16 v47 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v47;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v54;
        _os_log_impl(&dword_19D1A8000, v46, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch accessory settings from cache due to unknown accessory identifier: %@", buf, 0x16u);
      }
      id v48 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
      __int16 v49 = [(HMAccessorySettingsDataSource *)v45 context];
      id v50 = [v49 delegateCaller];
      v37 = v53;
      [v50 callCompletion:v53 error:v48];

      id v24 = 0;
    }
  }
  else
  {
    id v38 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v39 = v15;
    id v40 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      __int16 v41 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v41;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v12;
      _os_log_impl(&dword_19D1A8000, v40, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch accessory settings from cache due to unknown home identifier: %@", buf, 0x16u);
    }
    id v24 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    id v42 = [(HMAccessorySettingsDataSource *)v39 context];
    __int16 v43 = [v42 delegateCaller];
    v37 = v53;
    [v43 callCompletion:v53 error:v24];
  }
}

void __131__HMAccessorySettingsDataSource_subscribeToAccessorySettingsOnDaemonWithHomeUUID_accessoryUUID_keyPaths_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  int v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v29 = v11;
      __int16 v30 = 2112;
      id v31 = v6;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Subscribe changed topics with error: %@", buf, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v29 = v12;
      __int16 v30 = 2112;
      id v31 = v5;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Subscribe changed topics, received cached events %@", buf, 0x16u);
    }
    if ([v5 count])
    {
      uint64_t v14 = *(void **)(a1 + 32);
      if (v14) {
        id Property = objc_getProperty(v14, v13, 56, 1);
      }
      else {
        id Property = 0;
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __131__HMAccessorySettingsDataSource_subscribeToAccessorySettingsOnDaemonWithHomeUUID_accessoryUUID_keyPaths_options_completionHandler___block_invoke_35;
      block[3] = &unk_1E5945628;
      id v16 = v5;
      uint64_t v17 = *(void *)(a1 + 32);
      id v26 = v16;
      uint64_t v27 = v17;
      dispatch_async(Property, block);
    }
  }
  __int16 v18 = [*(id *)(a1 + 32) context];
  uint64_t v19 = [v18 delegateCaller];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __131__HMAccessorySettingsDataSource_subscribeToAccessorySettingsOnDaemonWithHomeUUID_accessoryUUID_keyPaths_options_completionHandler___block_invoke_37;
  v22[3] = &unk_1E59454E8;
  id v20 = *(id *)(a1 + 40);
  id v23 = v6;
  id v24 = v20;
  id v21 = v6;
  [v19 invokeBlock:v22];
}

uint64_t __131__HMAccessorySettingsDataSource_subscribeToAccessorySettingsOnDaemonWithHomeUUID_accessoryUUID_keyPaths_options_completionHandler___block_invoke_35(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __131__HMAccessorySettingsDataSource_subscribeToAccessorySettingsOnDaemonWithHomeUUID_accessoryUUID_keyPaths_options_completionHandler___block_invoke_2;
  v3[3] = &unk_1E5941A98;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return objc_msgSend(v1, "na_each:", v3);
}

uint64_t __131__HMAccessorySettingsDataSource_subscribeToAccessorySettingsOnDaemonWithHomeUUID_accessoryUUID_keyPaths_options_completionHandler___block_invoke_37(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __131__HMAccessorySettingsDataSource_subscribeToAccessorySettingsOnDaemonWithHomeUUID_accessoryUUID_keyPaths_options_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
}

- (void)fetchCachedAccessorySettingsWithHomeIdentifier:(id)a3 accessoryIdentifier:(id)a4 keyPaths:(id)a5 completionHandler:(id)a6
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = (void *)MEMORY[0x19F3A64A0]();
  id v15 = self;
  id v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544130;
    __int16 v49 = v17;
    __int16 v50 = 2112;
    id v51 = v10;
    __int16 v52 = 2112;
    id v53 = v11;
    __int16 v54 = 2112;
    id v55 = v12;
    _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_INFO, "%{public}@Fetching only cached accessory settings with home identifier: %@ accessory identifier: %@ key paths: %@", buf, 0x2Au);
  }
  __int16 v18 = -[HMAccessorySettingsDataSource homeUUIDForIdentifier:](v15, v10);
  if (v18)
  {
    uint64_t v19 = -[HMAccessorySettingsDataSource accessoryUUIDForIdentifier:homeIdentifier:](v15, v11, v10);
    if (v19)
    {
      objc_initWeak((id *)buf, v15);
      if (v15) {
        id Property = objc_getProperty(v15, v20, 56, 1);
      }
      else {
        id Property = 0;
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __127__HMAccessorySettingsDataSource_fetchCachedAccessorySettingsWithHomeIdentifier_accessoryIdentifier_keyPaths_completionHandler___block_invoke_2;
      block[3] = &unk_1E5941A70;
      uint64_t v22 = Property;
      objc_copyWeak(&v43, (id *)buf);
      id v37 = v18;
      id v23 = v19;
      id v38 = v23;
      id v39 = v12;
      id v40 = v10;
      id v41 = v11;
      id v42 = v13;
      dispatch_async(v22, block);

      objc_destroyWeak(&v43);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      __int16 v30 = (void *)MEMORY[0x19F3A64A0]();
      id v31 = v15;
      uint64_t v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v33 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        __int16 v49 = v33;
        __int16 v50 = 2112;
        id v51 = v11;
        _os_log_impl(&dword_19D1A8000, v32, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch cached accessory settings due to unknown accessory identifier: %@", buf, 0x16u);
      }
      id v34 = [(HMAccessorySettingsDataSource *)v31 context];
      SEL v35 = [v34 delegateCaller];
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __127__HMAccessorySettingsDataSource_fetchCachedAccessorySettingsWithHomeIdentifier_accessoryIdentifier_keyPaths_completionHandler___block_invoke_28;
      v44[3] = &unk_1E59454C0;
      id v45 = v13;
      [v35 invokeBlock:v44];

      id v23 = 0;
    }
  }
  else
  {
    id v24 = (void *)MEMORY[0x19F3A64A0]();
    id v25 = v15;
    id v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v49 = v27;
      __int16 v50 = 2112;
      id v51 = v10;
      _os_log_impl(&dword_19D1A8000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch cached accessory settings due to unknown home identifier: %@", buf, 0x16u);
    }
    __int16 v28 = [(HMAccessorySettingsDataSource *)v25 context];
    id v29 = [v28 delegateCaller];
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __127__HMAccessorySettingsDataSource_fetchCachedAccessorySettingsWithHomeIdentifier_accessoryIdentifier_keyPaths_completionHandler___block_invoke;
    v46[3] = &unk_1E59454C0;
    id v47 = v13;
    [v29 invokeBlock:v46];

    id v23 = v47;
  }
}

void __127__HMAccessorySettingsDataSource_fetchCachedAccessorySettingsWithHomeIdentifier_accessoryIdentifier_keyPaths_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, MEMORY[0x1E4F1CBF0]);
}

void __127__HMAccessorySettingsDataSource_fetchCachedAccessorySettingsWithHomeIdentifier_accessoryIdentifier_keyPaths_completionHandler___block_invoke_28(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, MEMORY[0x1E4F1CBF0]);
}

void __127__HMAccessorySettingsDataSource_fetchCachedAccessorySettingsWithHomeIdentifier_accessoryIdentifier_keyPaths_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  uint64_t v4 = WeakRetained;
  if (WeakRetained) {
    id WeakRetained = objc_getProperty(WeakRetained, v3, 56, 1);
  }
  dispatch_assert_queue_V2(WeakRetained);
  id v5 = *(void **)(v1 + 40);
  id v6 = *(void **)(v1 + 48);
  id v7 = *(id *)(v1 + 32);
  id v8 = v5;
  id v61 = v6;
  if (v4)
  {
    id v9 = (void *)MEMORY[0x19F3A64A0]();
    id v10 = v4;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      v81 = v12;
      __int16 v82 = 2112;
      id v83 = v7;
      __int16 v84 = 2112;
      id v85 = v8;
      __int16 v86 = 2112;
      id v87 = v61;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@Reading accessory settings from cache for home uuid: %@ accessory uuid: %@ key paths: %@", buf, 0x2Au);
    }
    uint64_t v59 = v1;

    id v60 = v7;
    id v13 = -[HMAccessorySettingsDataSource topicsForHomeUUID:accessoryUUID:keyPaths:]((uint64_t)v10, v7, v8, v61);
    id v15 = objc_msgSend(objc_getProperty(v10, v14, 64, 1), "eventsForTopicFilters:", v13);
    if ([v15 count])
    {
      id v57 = v13;
      id v58 = v8;
      id v16 = [MEMORY[0x1E4F1CA48] array];
      long long v75 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      id v17 = v15;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v75 objects:buf count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v76;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v76 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = [v17 objectForKeyedSubscript:*(void *)(*((void *)&v75 + 1) + 8 * i)];
            uint64_t v74 = 0;
            uint64_t v23 = +[HMImmutableSettingChangeEvent decodeSettingFromEvent:v22 error:&v74];
            id v24 = (void *)v23;
            if (v74) {
              BOOL v25 = 1;
            }
            else {
              BOOL v25 = v23 == 0;
            }
            if (!v25) {
              [v16 addObject:v23];
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v75 objects:buf count:16];
        }
        while (v19);
      }

      id v26 = (void *)[v16 copy];
      id v13 = v57;
      id v8 = v58;
    }
    else
    {
      uint64_t v27 = (void *)MEMORY[0x19F3A64A0]();
      __int16 v28 = v10;
      id v29 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        __int16 v30 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v81 = v30;
        __int16 v82 = 2112;
        id v83 = v60;
        __int16 v84 = 2112;
        id v85 = v8;
        _os_log_impl(&dword_19D1A8000, v29, OS_LOG_TYPE_INFO, "%{public}@Found no events in cache for home uuid: %@ accessory uuid: %@", buf, 0x20u);
      }
      id v26 = (void *)MEMORY[0x1E4F1CBF0];
    }

    uint64_t v1 = v59;
    id v7 = v60;
  }
  else
  {
    id v26 = 0;
  }

  id v31 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v32 = v4;
  v33 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    id v34 = HMFGetLogIdentifier();
    id v62 = v31;
    id v36 = *(void **)(v1 + 56);
    SEL v35 = *(void **)(v1 + 64);
    id v37 = *(void **)(v1 + 48);
    id v38 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v26, "count"));
    id v39 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(v1 + 48), "count"));
    *(_DWORD *)buf = 138544898;
    v81 = v34;
    __int16 v82 = 2112;
    id v83 = v36;
    __int16 v84 = 2112;
    id v85 = v35;
    id v31 = v62;
    __int16 v86 = 2112;
    id v87 = v37;
    __int16 v88 = 2112;
    v89 = v38;
    __int16 v90 = 2112;
    v91 = v39;
    __int16 v92 = 2112;
    v93 = v26;
    _os_log_impl(&dword_19D1A8000, v33, OS_LOG_TYPE_INFO, "%{public}@Returning cached accessory settings from event store with home identifier: %@ accessory identifier: %@ expected key paths: %@ found (%@/%@) settings: %@", buf, 0x48u);
  }
  id v40 = [MEMORY[0x1E4F1CA80] setWithArray:*(void *)(v1 + 48)];
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v41 = v26;
  uint64_t v42 = [v41 countByEnumeratingWithState:&v70 objects:v79 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v71;
    do
    {
      for (uint64_t j = 0; j != v43; ++j)
      {
        if (*(void *)v71 != v44) {
          objc_enumerationMutation(v41);
        }
        __int16 v46 = [*(id *)(*((void *)&v70 + 1) + 8 * j) keyPath];
        [v40 removeObject:v46];
      }
      uint64_t v43 = [v41 countByEnumeratingWithState:&v70 objects:v79 count:16];
    }
    while (v43);
  }

  if ([v40 count])
  {
    id v47 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    id v48 = [MEMORY[0x1E4F1CA60] dictionary];
    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = __127__HMAccessorySettingsDataSource_fetchCachedAccessorySettingsWithHomeIdentifier_accessoryIdentifier_keyPaths_completionHandler___block_invoke_32;
    v67[3] = &unk_1E5941A48;
    id v68 = v48;
    id v69 = v47;
    id v49 = v47;
    id v50 = v48;
    objc_msgSend(v40, "na_each:", v67);
    id v51 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52 userInfo:v50];
  }
  else
  {
    id v51 = 0;
  }
  __int16 v52 = [v32 context];
  id v53 = [v52 delegateCaller];
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __127__HMAccessorySettingsDataSource_fetchCachedAccessorySettingsWithHomeIdentifier_accessoryIdentifier_keyPaths_completionHandler___block_invoke_2_34;
  v63[3] = &unk_1E5945138;
  id v54 = *(id *)(v1 + 72);
  id v65 = v41;
  id v66 = v54;
  id v64 = v51;
  id v55 = v41;
  id v56 = v51;
  [v53 invokeBlock:v63];
}

uint64_t __127__HMAccessorySettingsDataSource_fetchCachedAccessorySettingsWithHomeIdentifier_accessoryIdentifier_keyPaths_completionHandler___block_invoke_32(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setObject:*(void *)(a1 + 40) forKeyedSubscript:a2];
}

uint64_t __127__HMAccessorySettingsDataSource_fetchCachedAccessorySettingsWithHomeIdentifier_accessoryIdentifier_keyPaths_completionHandler___block_invoke_2_34(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)fetchAccessorySettingsWithHomeIdentifier:(id)a3 accessoryIdentifier:(id)a4 keyPaths:(id)a5 completionHandler:(id)a6
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v37 = a5;
  id v38 = a6;
  id v12 = (void *)MEMORY[0x19F3A64A0]();
  id v13 = self;
  SEL v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544130;
    uint64_t v44 = v15;
    __int16 v45 = 2112;
    id v46 = v10;
    __int16 v47 = 2112;
    id v48 = v11;
    __int16 v49 = 2112;
    id v50 = v37;
    _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_INFO, "%{public}@Fetching accessory settings with home identifier: %@ accessory identifier: %@ key paths: %@", buf, 0x2Au);
  }
  id v16 = -[HMAccessorySettingsDataSource dataSourceHomeWithHomeIdentifier:](v13, v10);
  id v17 = v16;
  if (v16)
  {
    uint64_t v18 = [v16 accessoryWithUniqueIdentifier:v11];
    if (v18)
    {
      uint64_t v19 = [v17 uuid];
      uint64_t v20 = [v18 uuid];
      id v21 = v19;
      if (v13)
      {
        os_unfair_lock_lock_with_options();
        messenger = v13->_messenger;
        if (!messenger)
        {
          uint64_t v23 = [(HMAccessorySettingsDataSource *)v13 messengerFactory];
          uint64_t v24 = [v23 createAccessorySettingsMessengerWithHomeUUID:v21];
          BOOL v25 = v13->_messenger;
          v13->_messenger = (HMAccessorySettingsMessenger *)v24;

          messenger = v13->_messenger;
        }
        id v26 = messenger;
        os_unfair_lock_unlock(&v13->_lock);
      }
      else
      {
        id v26 = 0;
      }

      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __121__HMAccessorySettingsDataSource_fetchAccessorySettingsWithHomeIdentifier_accessoryIdentifier_keyPaths_completionHandler___block_invoke;
      v39[3] = &unk_1E5941A20;
      void v39[4] = v13;
      id v40 = v21;
      id v41 = v20;
      id v42 = v38;
      id v27 = v20;
      id v28 = v21;
      [(HMAccessorySettingsMessenger *)v26 sendFetchAccessorySettingsRequestWithAccessoryUUID:v27 keyPaths:v37 completionHandler:v39];
    }
    else
    {
      v33 = (void *)MEMORY[0x19F3A64A0]();
      id v34 = v13;
      SEL v35 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        id v36 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v44 = v36;
        __int16 v45 = 2112;
        id v46 = v11;
        _os_log_impl(&dword_19D1A8000, v35, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch accessory settings due to unknown accessory identifier: %@", buf, 0x16u);
      }
      id v26 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
      id v28 = [(HMAccessorySettingsDataSource *)v34 context];
      id v27 = [v28 delegateCaller];
      [v27 callCompletion:v38 error:v26 obj:MEMORY[0x1E4F1CBF0]];
    }
  }
  else
  {
    id v29 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v30 = v13;
    id v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      uint64_t v32 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v44 = v32;
      __int16 v45 = 2112;
      id v46 = v10;
      _os_log_impl(&dword_19D1A8000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch accessory settings due to unknown home identifier: %@", buf, 0x16u);
    }
    uint64_t v18 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    id v26 = [(HMAccessorySettingsDataSource *)v30 context];
    id v28 = [(HMAccessorySettingsMessenger *)v26 delegateCaller];
    [v28 callCompletion:v38 error:v18 obj:MEMORY[0x1E4F1CBF0]];
  }
}

void __121__HMAccessorySettingsDataSource_fetchAccessorySettingsWithHomeIdentifier_accessoryIdentifier_keyPaths_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v7 = a3;
  id v8 = *(void **)(a1 + 32);
  if (v8)
  {
    id Property = objc_getProperty(v8, v6, 56, 1);
    uint64_t v10 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v10 = 0;
    id Property = 0;
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __121__HMAccessorySettingsDataSource_fetchAccessorySettingsWithHomeIdentifier_accessoryIdentifier_keyPaths_completionHandler___block_invoke_2;
  v13[3] = &unk_1E5944A18;
  id v14 = v5;
  uint64_t v15 = v10;
  id v16 = v7;
  id v17 = *(id *)(a1 + 40);
  id v18 = *(id *)(a1 + 48);
  id v19 = *(id *)(a1 + 56);
  id v11 = v7;
  id v12 = v5;
  dispatch_async(Property, v13);
}

void __121__HMAccessorySettingsDataSource_fetchAccessorySettingsWithHomeIdentifier_accessoryIdentifier_keyPaths_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (void *)MEMORY[0x19F3A64A0]();
  id v4 = *(id *)(a1 + 40);
  id v5 = HMFGetOSLogHandle();
  id v6 = v5;
  if (v2)
  {
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    id v7 = HMFGetLogIdentifier();
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    id v38 = v7;
    __int16 v39 = 2112;
    uint64_t v40 = v8;
    __int16 v41 = 2112;
    uint64_t v42 = v9;
    uint64_t v10 = "%{public}@Fetch accessory settings completed with settings: %@ error: %@";
    id v11 = v6;
    os_log_type_t v12 = OS_LOG_TYPE_ERROR;
    uint32_t v13 = 32;
  }
  else
  {
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    id v7 = HMFGetLogIdentifier();
    uint64_t v14 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138543618;
    id v38 = v7;
    __int16 v39 = 2112;
    uint64_t v40 = v14;
    uint64_t v10 = "%{public}@Fetch accessory settings completed with settings: %@";
    id v11 = v6;
    os_log_type_t v12 = OS_LOG_TYPE_INFO;
    uint32_t v13 = 22;
  }
  _os_log_impl(&dword_19D1A8000, v11, v12, v10, buf, v13);

LABEL_7:
  if ([*(id *)(a1 + 48) count])
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id obj = *(id *)(a1 + 48);
    uint64_t v15 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v33;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v33 != v17) {
            objc_enumerationMutation(obj);
          }
          id v19 = *(void **)(*((void *)&v32 + 1) + 8 * v18);
          uint64_t v20 = [v19 keyPath];
          id v21 = HMImmutableSettingChangeEventTopicFromComponentsHH2(*(void *)(a1 + 56), *(void *)(a1 + 64), (uint64_t)v20);
          uint64_t v22 = [HMImmutableSettingChangeEvent alloc];
          uint64_t v23 = [*(id *)(a1 + 64) UUIDString];
          [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
          uint64_t v24 = -[HMImmutableSettingChangeEvent initWithSetting:eventSource:eventTimestamp:](v22, "initWithSetting:eventSource:eventTimestamp:", v19, v23);

          id Property = *(id *)(a1 + 40);
          if (Property)
          {
            id Property = objc_getProperty(Property, v25, 72, 1);
            uint64_t v27 = *(void *)(a1 + 40);
          }
          else
          {
            uint64_t v27 = 0;
          }
          [Property writer:v27 saveEvent:v24 topic:v21];

          ++v18;
        }
        while (v16 != v18);
        uint64_t v28 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
        uint64_t v16 = v28;
      }
      while (v28);
    }
  }
  id v29 = [*(id *)(a1 + 40) context];
  __int16 v30 = [v29 delegateCaller];
  [v30 callCompletion:*(void *)(a1 + 72) error:*(void *)(a1 + 32) obj:*(void *)(a1 + 48)];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t42_30251 != -1) {
    dispatch_once(&logCategory__hmf_once_t42_30251, &__block_literal_global_30252);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v43_30253;

  return v2;
}

uint64_t __44__HMAccessorySettingsDataSource_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v43_30253;
  logCategory__hmf_once_v43_30253 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)defaultLanguageValue
{
  uint64_t v2 = [[HMSettingLanguageValue alloc] initWithInputLanguageCode:@"en-US" outputVoiceLanguageCode:@"en-US" outputVoiceGenderCode:@"f" voiceName:0];
  id v3 = +[HMFObjectCacheHMSettingLanguageValue cachedInstanceForLanguageSettingValue:v2];

  return v3;
}

@end