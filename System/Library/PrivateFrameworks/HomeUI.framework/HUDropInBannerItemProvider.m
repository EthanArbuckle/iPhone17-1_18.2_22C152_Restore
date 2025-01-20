@interface HUDropInBannerItemProvider
- (DIDropInCenter)dropInCenter;
- (HMAudioAnalysisLastKnownEventSubscriber)lastKnownEventSubscriber;
- (HMHome)home;
- (HUDropInBannerItemProvider)init;
- (HUDropInBannerItemProvider)initWithHome:(id)a3 delegate:(id)a4;
- (HUDropInBannerItemProviderDelegate)delegate;
- (NSArray)devices;
- (NSMutableDictionary)accessoryIdentifierToEventBulletinsMapping;
- (NSMutableSet)bannerItems;
- (id)invalidationReasons;
- (id)items;
- (id)reloadItems;
- (void)_notifyDelegate;
- (void)_setupDropInDelegatesIfNeeded;
- (void)device:(id)a3 didUpdateState:(int64_t)a4;
- (void)executionEnvironmentDidBecomeActive:(id)a3;
- (void)manager:(id)a3 didAddDevice:(id)a4;
- (void)manager:(id)a3 didRemoveDevice:(id)a4;
- (void)managerDidUpdateDevices:(id)a3;
- (void)serverDisconnectedForDropInCenter:(id)a3;
- (void)setAccessoryIdentifierToEventBulletinsMapping:(id)a3;
- (void)setBannerItems:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDevices:(id)a3;
- (void)setDropInCenter:(id)a3;
- (void)setHome:(id)a3;
- (void)setLastKnownEventSubscriber:(id)a3;
- (void)subscriber:(id)a3 didUpdateBulletins:(id)a4;
@end

@implementation HUDropInBannerItemProvider

- (id)items
{
  v2 = [(HUDropInBannerItemProvider *)self bannerItems];
  v3 = (void *)[v2 copy];

  return v3;
}

- (NSMutableSet)bannerItems
{
  return self->_bannerItems;
}

- (id)invalidationReasons
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)HUDropInBannerItemProvider;
  v2 = [(HFItemProvider *)&v7 invalidationReasons];
  uint64_t v3 = *MEMORY[0x1E4F686B0];
  v8[0] = *MEMORY[0x1E4F686C0];
  v8[1] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  v5 = [v2 setByAddingObjectsFromArray:v4];

  return v5;
}

void __41__HUDropInBannerItemProvider_reloadItems__block_invoke_2_20(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 existingItems];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__HUDropInBannerItemProvider_reloadItems__block_invoke_3_21;
  void v8[3] = &unk_1E6391C00;
  v8[4] = *(void *)(a1 + 32);
  objc_msgSend(v4, "na_each:", v8);

  id v5 = objc_alloc(MEMORY[0x1E4F1CA80]);
  v6 = [v3 allItems];

  objc_super v7 = (void *)[v5 initWithSet:v6];
  [*(id *)(a1 + 32) setBannerItems:v7];
}

id __41__HUDropInBannerItemProvider_reloadItems__block_invoke_17(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained bannerItems];
  v6 = [v3 addedItems];
  [v5 unionSet:v6];

  objc_super v7 = [WeakRetained bannerItems];
  v8 = [v3 removedItems];
  [v7 minusSet:v8];

  v9 = [MEMORY[0x1E4F7A0D8] futureWithResult:v3];

  return v9;
}

- (HUDropInBannerItemProvider)initWithHome:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HUDropInBannerItemProvider;
  v9 = [(HFItemProvider *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    devices = v10->_devices;
    v10->_devices = (NSArray *)MEMORY[0x1E4F1CBF0];

    uint64_t v12 = objc_opt_new();
    accessoryIdentifierToEventBulletinsMapping = v10->_accessoryIdentifierToEventBulletinsMapping;
    v10->_accessoryIdentifierToEventBulletinsMapping = (NSMutableDictionary *)v12;

    v14 = objc_opt_new();
    [(HUDropInBannerItemProvider *)v10 setBannerItems:v14];

    v15 = [MEMORY[0x1E4F69138] sharedInstance];
    [v15 addObserver:v10];
  }
  return v10;
}

- (void)setBannerItems:(id)a3
{
}

- (id)reloadItems
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v4 = [MEMORY[0x1E4F69138] sharedInstance];
  int v5 = [v4 isActive];

  if (v5)
  {
    v6 = HFLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v29 = self;
      __int16 v30 = 2112;
      v31 = v7;
      _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@: %@ Execution env is active. Can set dropin delegates.", buf, 0x16u);
    }
    [(HUDropInBannerItemProvider *)self _setupDropInDelegatesIfNeeded];
  }
  id v8 = [(HUDropInBannerItemProvider *)self dropInCenter];

  if (v8)
  {
    v9 = [(HUDropInBannerItemProvider *)self dropInCenter];
    v10 = [v9 deviceManager];
    v11 = [v10 devices];
    [(HUDropInBannerItemProvider *)self setDevices:v11];
  }
  uint64_t v12 = HFLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = NSStringFromSelector(a2);
    v14 = [(HUDropInBannerItemProvider *)self devices];
    *(_DWORD *)buf = 138412802;
    v29 = self;
    __int16 v30 = 2112;
    v31 = v13;
    __int16 v32 = 2112;
    v33 = v14;
    _os_log_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEFAULT, "%@: %@ Dropin capable devices: %@", buf, 0x20u);
  }
  v15 = HFLogForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = NSStringFromSelector(a2);
    objc_super v17 = [(HUDropInBannerItemProvider *)self accessoryIdentifierToEventBulletinsMapping];
    *(_DWORD *)buf = 138412802;
    v29 = self;
    __int16 v30 = 2112;
    v31 = v16;
    __int16 v32 = 2112;
    v33 = v17;
    _os_log_impl(&dword_1BE345000, v15, OS_LOG_TYPE_DEFAULT, "%@: %@ Event bulletins: %@", buf, 0x20u);
  }
  objc_initWeak((id *)buf, self);
  v18 = [(HUDropInBannerItemProvider *)self devices];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __41__HUDropInBannerItemProvider_reloadItems__block_invoke_3;
  v26[3] = &unk_1E6391BD8;
  objc_copyWeak(v27, (id *)buf);
  v27[1] = (id)a2;
  v19 = [(HFItemProvider *)self reloadItemsWithObjects:v18 keyAdaptor:&__block_literal_global_280 itemAdaptor:&__block_literal_global_12_0 filter:0 itemMap:v26];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __41__HUDropInBannerItemProvider_reloadItems__block_invoke_17;
  v24[3] = &unk_1E6385B38;
  objc_copyWeak(&v25, (id *)buf);
  v20 = [v19 flatMap:v24];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __41__HUDropInBannerItemProvider_reloadItems__block_invoke_2_20;
  v23[3] = &unk_1E6391C28;
  v23[4] = self;
  v21 = [v20 addSuccessBlock:v23];

  objc_destroyWeak(&v25);
  objc_destroyWeak(v27);

  objc_destroyWeak((id *)buf);

  return v21;
}

- (NSArray)devices
{
  return self->_devices;
}

- (DIDropInCenter)dropInCenter
{
  return self->_dropInCenter;
}

- (NSMutableDictionary)accessoryIdentifierToEventBulletinsMapping
{
  return self->_accessoryIdentifierToEventBulletinsMapping;
}

- (void)executionEnvironmentDidBecomeActive:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    int v7 = 138412546;
    id v8 = self;
    __int16 v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@: %@ Execution env did become active", (uint8_t *)&v7, 0x16u);
  }
  [(HUDropInBannerItemProvider *)self _setupDropInDelegatesIfNeeded];
}

- (void)_setupDropInDelegatesIfNeeded
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = NSStringFromSelector(a2);
    int v40 = 138412546;
    v41 = self;
    __int16 v42 = 2112;
    v43 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@: %@ Setting up dropin delegates if needed", (uint8_t *)&v40, 0x16u);
  }
  v6 = [(HUDropInBannerItemProvider *)self home];
  int v7 = objc_msgSend(v6, "hf_hasAtleastOneAudioAnalysisSupportedAccessory");

  if (v7)
  {
    id v8 = [(HUDropInBannerItemProvider *)self dropInCenter];

    if (!v8)
    {
      id v9 = objc_alloc(MEMORY[0x1E4F5F9F0]);
      v10 = [(HUDropInBannerItemProvider *)self home];
      uint64_t v11 = [v10 uniqueIdentifier];
      uint64_t v12 = (void *)[v9 initWithHomeIdentifier:v11 queue:MEMORY[0x1E4F14428]];
      [(HUDropInBannerItemProvider *)self setDropInCenter:v12];

      v13 = HFLogForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = NSStringFromSelector(a2);
        v15 = [(HUDropInBannerItemProvider *)self dropInCenter];
        int v40 = 138412802;
        v41 = self;
        __int16 v42 = 2112;
        v43 = v14;
        __int16 v44 = 2112;
        v45 = v15;
        _os_log_impl(&dword_1BE345000, v13, OS_LOG_TYPE_DEFAULT, "%@: %@ Created DropIn center: %@", (uint8_t *)&v40, 0x20u);
      }
    }
    v16 = [(HUDropInBannerItemProvider *)self lastKnownEventSubscriber];

    if (!v16)
    {
      objc_super v17 = [(HUDropInBannerItemProvider *)self home];
      v18 = [v17 createHomeAudioAnalysisEventSubscriber];
      [(HUDropInBannerItemProvider *)self setLastKnownEventSubscriber:v18];

      v19 = HFLogForCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = NSStringFromSelector(a2);
        v21 = [(HUDropInBannerItemProvider *)self lastKnownEventSubscriber];
        int v40 = 138412802;
        v41 = self;
        __int16 v42 = 2112;
        v43 = v20;
        __int16 v44 = 2112;
        v45 = v21;
        _os_log_impl(&dword_1BE345000, v19, OS_LOG_TYPE_DEFAULT, "%@: %@ Created Last known event subscriber: %@", (uint8_t *)&v40, 0x20u);
      }
      v22 = [(HUDropInBannerItemProvider *)self lastKnownEventSubscriber];
      [v22 setDelegate:self];
    }
    v23 = [(HUDropInBannerItemProvider *)self dropInCenter];
    v24 = [v23 delegate];

    if (!v24)
    {
      id v25 = [(HUDropInBannerItemProvider *)self dropInCenter];
      [v25 setDelegate:self];

      v26 = HFLogForCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = NSStringFromSelector(a2);
        v28 = [(HUDropInBannerItemProvider *)self dropInCenter];
        v29 = [v28 delegate];
        int v40 = 138412802;
        v41 = self;
        __int16 v42 = 2112;
        v43 = v27;
        __int16 v44 = 2112;
        v45 = v29;
        _os_log_impl(&dword_1BE345000, v26, OS_LOG_TYPE_DEFAULT, "%@: %@ DropIn center delegate set to %@", (uint8_t *)&v40, 0x20u);
      }
    }
    __int16 v30 = [(HUDropInBannerItemProvider *)self dropInCenter];
    v31 = [v30 deviceManager];
    __int16 v32 = [v31 delegate];

    if (!v32)
    {
      v33 = [(HUDropInBannerItemProvider *)self dropInCenter];
      uint64_t v34 = [v33 deviceManager];
      [v34 setDelegate:self];

      v35 = HFLogForCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        v36 = NSStringFromSelector(a2);
        v37 = [(HUDropInBannerItemProvider *)self dropInCenter];
        v38 = [v37 deviceManager];
        v39 = [v38 delegate];
        int v40 = 138412802;
        v41 = self;
        __int16 v42 = 2112;
        v43 = v36;
        __int16 v44 = 2112;
        v45 = v39;
        _os_log_impl(&dword_1BE345000, v35, OS_LOG_TYPE_DEFAULT, "%@: %@ DropIn device manager delegate set to %@", (uint8_t *)&v40, 0x20u);
      }
    }
  }
}

- (HMHome)home
{
  return self->_home;
}

- (HUDropInBannerItemProvider)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  int v5 = NSStringFromSelector(sel_initWithHome_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUDropInBannerItemProvider.m", 37, @"%s is unavailable; use %@ instead",
    "-[HUDropInBannerItemProvider init]",
    v5);

  return 0;
}

uint64_t __41__HUDropInBannerItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  return [a2 homeKitIdentifier];
}

id __41__HUDropInBannerItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 device];
  id v3 = [v2 homeKitIdentifier];

  return v3;
}

HUDropInBannerItem *__41__HUDropInBannerItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v5 = [WeakRetained items];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __41__HUDropInBannerItemProvider_reloadItems__block_invoke_4;
  v24[3] = &unk_1E6391BB0;
  id v6 = v3;
  id v25 = v6;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v24);
  int v7 = (HUDropInBannerItem *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    id v8 = [WeakRetained accessoryIdentifierToEventBulletinsMapping];
    id v9 = [v6 homeKitIdentifier];
    v10 = [v9 UUIDString];
    uint64_t v11 = [v8 objectForKey:v10];

    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    v21 = __41__HUDropInBannerItemProvider_reloadItems__block_invoke_5;
    v22 = &unk_1E638F968;
    id v12 = v6;
    id v23 = v12;
    v13 = objc_msgSend(v11, "na_firstObjectPassingTest:", &v19);
    v14 = HFLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = NSStringFromSelector(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 138412802;
      id v27 = WeakRetained;
      __int16 v28 = 2112;
      v29 = v15;
      __int16 v30 = 2112;
      v31 = v13;
      _os_log_impl(&dword_1BE345000, v14, OS_LOG_TYPE_DEFAULT, "%@: %@ Found event bulletin for accessory: %@", buf, 0x20u);
    }
    v16 = [HUDropInBannerItem alloc];
    objc_super v17 = objc_msgSend(WeakRetained, "home", v19, v20, v21, v22);
    int v7 = [(HUDropInBannerItem *)v16 initWithHome:v17 device:v12 eventBulletin:v13];
  }

  return v7;
}

uint64_t __41__HUDropInBannerItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = [a2 device];
  v4 = [v3 homeKitIdentifier];
  int v5 = [*(id *)(a1 + 32) homeKitIdentifier];
  uint64_t v6 = objc_msgSend(v4, "hmf_isEqualToUUID:", v5);

  return v6;
}

uint64_t __41__HUDropInBannerItemProvider_reloadItems__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = [a2 accessoryIdentifier];
  v4 = [*(id *)(a1 + 32) homeKitIdentifier];
  uint64_t v5 = objc_msgSend(v3, "hmf_isEqualToUUID:", v4);

  return v5;
}

void __41__HUDropInBannerItemProvider_reloadItems__block_invoke_3_21(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) accessoryIdentifierToEventBulletinsMapping];
  uint64_t v5 = [v3 device];
  uint64_t v6 = [v5 homeKitIdentifier];
  int v7 = [v6 UUIDString];
  id v8 = [v4 objectForKey:v7];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __41__HUDropInBannerItemProvider_reloadItems__block_invoke_4_22;
  v11[3] = &unk_1E638F968;
  id v12 = v3;
  id v9 = v3;
  v10 = objc_msgSend(v8, "na_firstObjectPassingTest:", v11);
  [v9 setEventBulletin:v10];
}

uint64_t __41__HUDropInBannerItemProvider_reloadItems__block_invoke_4_22(uint64_t a1, void *a2)
{
  id v3 = [a2 accessoryIdentifier];
  v4 = [*(id *)(a1 + 32) device];
  uint64_t v5 = [v4 homeKitIdentifier];
  uint64_t v6 = objc_msgSend(v3, "hmf_isEqualToUUID:", v5);

  return v6;
}

- (void)_notifyDelegate
{
  id v3 = [(HUDropInBannerItemProvider *)self delegate];
  int v4 = [v3 conformsToProtocol:&unk_1F1A64AF0];

  if (v4)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__HUDropInBannerItemProvider__notifyDelegate__block_invoke;
    block[3] = &unk_1E6386018;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __45__HUDropInBannerItemProvider__notifyDelegate__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 didUpdateDropInAvailability:*(void *)(a1 + 32)];
}

- (void)subscriber:(id)a3 didUpdateBulletins:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSStringFromSelector(a2);
    id v9 = [v6 firstObject];
    v10 = [v9 accessoryIdentifier];
    uint64_t v11 = [v10 UUIDString];
    int v16 = 138413058;
    objc_super v17 = self;
    __int16 v18 = 2112;
    uint64_t v19 = v8;
    __int16 v20 = 2112;
    v21 = v11;
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@: %@ Last Known Event Bulletins for accessory with identifier %@: %@", (uint8_t *)&v16, 0x2Au);
  }
  id v12 = [(HUDropInBannerItemProvider *)self accessoryIdentifierToEventBulletinsMapping];
  v13 = [v6 firstObject];
  v14 = [v13 accessoryIdentifier];
  v15 = [v14 UUIDString];
  objc_msgSend(v12, "na_safeSetObject:forKey:", v6, v15);

  [(HUDropInBannerItemProvider *)self _notifyDelegate];
}

- (void)serverDisconnectedForDropInCenter:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = NSStringFromSelector(a2);
    int v7 = 138412546;
    id v8 = self;
    __int16 v9 = 2112;
    v10 = v6;
    _os_log_error_impl(&dword_1BE345000, v5, OS_LOG_TYPE_ERROR, "%@: %@ Disconnected from DropIn process", (uint8_t *)&v7, 0x16u);
  }
}

- (void)managerDidUpdateDevices:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    __int16 v42 = self;
    __int16 v43 = 2112;
    __int16 v44 = v6;
    __int16 v45 = 2112;
    id v46 = v4;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@: %@ Device manager: %@", buf, 0x20u);
  }
  v33 = v4;

  int v7 = [(HUDropInBannerItemProvider *)self dropInCenter];
  id v8 = [v7 deviceManager];
  __int16 v9 = [v8 devices];
  [(HUDropInBannerItemProvider *)self setDevices:v9];

  v10 = HFLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = NSStringFromSelector(a2);
    id v12 = [(HUDropInBannerItemProvider *)self devices];
    *(_DWORD *)buf = 138412802;
    __int16 v42 = self;
    __int16 v43 = 2112;
    __int16 v44 = v11;
    __int16 v45 = 2112;
    id v46 = v12;
    _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "%@: %@ Devices available for drop-in: %@", buf, 0x20u);
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v13 = [(HUDropInBannerItemProvider *)self devices];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v37 != v16) {
          objc_enumerationMutation(v13);
        }
        __int16 v18 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        uint64_t v19 = [MEMORY[0x1E4F1C9C8] now];
        [v19 timeIntervalSince1970];
        double v21 = v20;
        __int16 v22 = [v18 stateExpiration];
        [v22 timeIntervalSince1970];
        double v24 = v23;

        if ([v18 state]) {
          BOOL v25 = v21 <= v24;
        }
        else {
          BOOL v25 = 0;
        }
        if (!v25)
        {
          v26 = HFLogForCategory();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            id v27 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138412802;
            __int16 v42 = self;
            __int16 v43 = 2112;
            __int16 v44 = v27;
            __int16 v45 = 2112;
            id v46 = v18;
            _os_log_impl(&dword_1BE345000, v26, OS_LOG_TYPE_DEFAULT, "%@: %@ Requesting device state refresh for device: %@", buf, 0x20u);
          }
          v35[0] = MEMORY[0x1E4F143A8];
          v35[1] = 3221225472;
          v35[2] = __54__HUDropInBannerItemProvider_managerDidUpdateDevices___block_invoke;
          v35[3] = &unk_1E638CA08;
          v35[5] = v18;
          v35[6] = a2;
          v35[4] = self;
          [v18 refreshStateWithCompletionHandler:v35];
        }
        [v18 setDelegate:self];
        __int16 v28 = [(HUDropInBannerItemProvider *)self home];
        v29 = [v18 homeKitIdentifier];
        __int16 v30 = objc_msgSend(v28, "hf_accessoryWithIdentifier:", v29);

        v31 = [(HUDropInBannerItemProvider *)self lastKnownEventSubscriber];
        uint64_t v32 = [v30 uniqueIdentifier];
        [v31 subscribeLastKnownEventsForAccessory:v32 completion:&__block_literal_global_78_1];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v15);
  }

  [(HUDropInBannerItemProvider *)self _notifyDelegate];
}

void __54__HUDropInBannerItemProvider_managerDidUpdateDevices___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HFLogForCategory();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = NSStringFromSelector(*(SEL *)(a1 + 48));
      uint64_t v8 = *(void *)(a1 + 40);
      int v11 = 138413058;
      uint64_t v12 = v6;
      __int16 v13 = 2112;
      uint64_t v14 = v7;
      __int16 v15 = 2112;
      uint64_t v16 = v8;
      __int16 v17 = 2112;
      id v18 = v3;
      _os_log_error_impl(&dword_1BE345000, v5, OS_LOG_TYPE_ERROR, "%@: %@ Failed to request refresh of device state for device: %@ with error %@", (uint8_t *)&v11, 0x2Au);
LABEL_6:
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v7 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v10 = *(void *)(a1 + 40);
    int v11 = 138412802;
    uint64_t v12 = v9;
    __int16 v13 = 2112;
    uint64_t v14 = v7;
    __int16 v15 = 2112;
    uint64_t v16 = v10;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@: %@ Succeeded to request refresh of device state for device: %@", (uint8_t *)&v11, 0x20u);
    goto LABEL_6;
  }
}

void __54__HUDropInBannerItemProvider_managerDidUpdateDevices___block_invoke_76(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = HFLogForCategory();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      id v6 = v2;
      _os_log_error_impl(&dword_1BE345000, v4, OS_LOG_TYPE_ERROR, "Failed to subscribe for last known events: %@", (uint8_t *)&v5, 0xCu);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v5) = 0;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "Successfully subscribed for last known events", (uint8_t *)&v5, 2u);
  }
}

- (void)manager:(id)a3 didAddDevice:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = NSStringFromSelector(a2);
    int v14 = 138412802;
    __int16 v15 = self;
    __int16 v16 = 2112;
    __int16 v17 = v8;
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@: %@ Added Device: %@", (uint8_t *)&v14, 0x20u);
  }
  [v6 setDelegate:self];
  uint64_t v9 = [(HUDropInBannerItemProvider *)self home];
  uint64_t v10 = [v6 homeKitIdentifier];
  int v11 = objc_msgSend(v9, "hf_accessoryWithIdentifier:", v10);

  uint64_t v12 = [(HUDropInBannerItemProvider *)self lastKnownEventSubscriber];
  __int16 v13 = [v11 uniqueIdentifier];
  [v12 subscribeLastKnownEventsForAccessory:v13 completion:&__block_literal_global_80];

  [(HUDropInBannerItemProvider *)self _notifyDelegate];
}

void __51__HUDropInBannerItemProvider_manager_didAddDevice___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = HFLogForCategory();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      id v6 = v2;
      _os_log_error_impl(&dword_1BE345000, v4, OS_LOG_TYPE_ERROR, "Failed to subscribe for last known events: %@", (uint8_t *)&v5, 0xCu);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v5) = 0;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "Successfully subscribed for last known events", (uint8_t *)&v5, 2u);
  }
}

- (void)manager:(id)a3 didRemoveDevice:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = NSStringFromSelector(a2);
    int v9 = 138412802;
    uint64_t v10 = self;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@: %@ Removed Device: %@", (uint8_t *)&v9, 0x20u);
  }
  [v6 setDelegate:0];
  [(HUDropInBannerItemProvider *)self _notifyDelegate];
}

- (void)device:(id)a3 didUpdateState:(int64_t)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = NSStringFromSelector(a2);
    uint64_t v10 = [MEMORY[0x1E4F5F9E8] stringForDeviceState:a4];
    int v11 = 138413058;
    uint64_t v12 = self;
    __int16 v13 = 2112;
    id v14 = v9;
    __int16 v15 = 2112;
    __int16 v16 = v10;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%@: %@ Updated Device state to %@ for device: %@", (uint8_t *)&v11, 0x2Au);
  }
  [(HUDropInBannerItemProvider *)self _notifyDelegate];
}

- (void)setHome:(id)a3
{
}

- (HUDropInBannerItemProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUDropInBannerItemProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setDropInCenter:(id)a3
{
}

- (void)setDevices:(id)a3
{
}

- (HMAudioAnalysisLastKnownEventSubscriber)lastKnownEventSubscriber
{
  return self->_lastKnownEventSubscriber;
}

- (void)setLastKnownEventSubscriber:(id)a3
{
}

- (void)setAccessoryIdentifierToEventBulletinsMapping:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryIdentifierToEventBulletinsMapping, 0);
  objc_storeStrong((id *)&self->_lastKnownEventSubscriber, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_dropInCenter, 0);
  objc_storeStrong((id *)&self->_bannerItems, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_home, 0);
}

@end