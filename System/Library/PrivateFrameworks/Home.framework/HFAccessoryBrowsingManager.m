@interface HFAccessoryBrowsingManager
- (BOOL)isBrowsing;
- (HFAccessoryBrowsingManager)init;
- (HMAccessoryBrowser)accessoryBrowser;
- (NSArray)discoveredHMAccessories;
- (NSArray)discoveredSharingDevices;
- (NSHashTable)observers;
- (NSMutableSet)mutableDiscoveredSharingDevices;
- (SFDeviceDiscovery)sharingDeviceBrowser;
- (void)accessoryBrowser:(id)a3 didFindNewAccessory:(id)a4;
- (void)accessoryBrowser:(id)a3 didRemoveNewAccessory:(id)a4;
- (void)addBrowsingObserver:(id)a3;
- (void)removeBrowsingObserver:(id)a3;
- (void)setAccessoryBrowser:(id)a3;
- (void)setIsBrowsing:(BOOL)a3;
- (void)setMutableDiscoveredSharingDevices:(id)a3;
- (void)setObservers:(id)a3;
- (void)setSharingDeviceBrowser:(id)a3;
- (void)startSearchingForNewAccessories;
- (void)stopSearchingForNewAccessoriesWithError:(id)a3;
@end

@implementation HFAccessoryBrowsingManager

- (HFAccessoryBrowsingManager)init
{
  v17.receiver = self;
  v17.super_class = (Class)HFAccessoryBrowsingManager;
  v2 = [(HFAccessoryBrowsingManager *)&v17 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263F0DF28]);
    [(HFAccessoryBrowsingManager *)v2 setAccessoryBrowser:v3];

    v4 = [(HFAccessoryBrowsingManager *)v2 accessoryBrowser];
    [v4 setDelegate:v2];

    v5 = [MEMORY[0x263EFF9C0] set];
    [(HFAccessoryBrowsingManager *)v2 setMutableDiscoveredSharingDevices:v5];

    id v6 = objc_alloc_init(MEMORY[0x263F6C230]);
    [(HFAccessoryBrowsingManager *)v2 setSharingDeviceBrowser:v6];

    v7 = [(HFAccessoryBrowsingManager *)v2 sharingDeviceBrowser];
    [v7 setDiscoveryFlags:16];

    objc_initWeak(&location, v2);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __34__HFAccessoryBrowsingManager_init__block_invoke;
    v14[3] = &unk_264097DE0;
    objc_copyWeak(&v15, &location);
    v8 = [(HFAccessoryBrowsingManager *)v2 sharingDeviceBrowser];
    [v8 setDeviceFoundHandler:v14];

    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __34__HFAccessoryBrowsingManager_init__block_invoke_3;
    v12[3] = &unk_264097DE0;
    objc_copyWeak(&v13, &location);
    v9 = [(HFAccessoryBrowsingManager *)v2 sharingDeviceBrowser];
    [v9 setDeviceLostHandler:v12];

    v10 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    [(HFAccessoryBrowsingManager *)v2 setObservers:v10];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __34__HFAccessoryBrowsingManager_init__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = HFLogForCategory(0x3BuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v3;
    _os_log_debug_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEBUG, "didFindNewSharingDevice: %@", buf, 0xCu);
  }

  id v6 = [WeakRetained mutableDiscoveredSharingDevices];
  [v6 addObject:v3];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v7 = objc_msgSend(WeakRetained, "observers", 0);
  v8 = (void *)[v7 copy];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v12++) accessoryBrowsingManager:WeakRetained didFindNewSharingDevice:v3];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

void __34__HFAccessoryBrowsingManager_init__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = HFLogForCategory(0x3BuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v3;
    _os_log_debug_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEBUG, "didRemoveNewSharingDevice: %@", buf, 0xCu);
  }

  id v6 = [WeakRetained mutableDiscoveredSharingDevices];
  [v6 removeObject:v3];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v7 = objc_msgSend(WeakRetained, "observers", 0);
  v8 = (void *)[v7 copy];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v12++) accessoryBrowsingManager:WeakRetained didRemoveNewSharingDevice:v3];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (NSArray)discoveredHMAccessories
{
  v2 = [(HFAccessoryBrowsingManager *)self accessoryBrowser];
  id v3 = [v2 discoveredAccessories];

  return (NSArray *)v3;
}

- (NSArray)discoveredSharingDevices
{
  v2 = [(HFAccessoryBrowsingManager *)self mutableDiscoveredSharingDevices];
  id v3 = [v2 allObjects];
  v4 = (void *)[v3 copy];

  return (NSArray *)v4;
}

- (void)startSearchingForNewAccessories
{
  id v3 = HFLogForCategory(0x3BuLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "startSearchingForNewAccessories", buf, 2u);
  }

  [(HFAccessoryBrowsingManager *)self setIsBrowsing:1];
  v4 = [(HFAccessoryBrowsingManager *)self accessoryBrowser];
  [v4 startSearchingForNewAccessories];

  v5 = [(HFAccessoryBrowsingManager *)self sharingDeviceBrowser];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__HFAccessoryBrowsingManager_startSearchingForNewAccessories__block_invoke;
  v7[3] = &unk_26408CDF0;
  id v8 = v5;
  id v6 = v5;
  [v6 activateWithCompletion:v7];
}

void __61__HFAccessoryBrowsingManager_startSearchingForNewAccessories__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = HFLogForCategory(0x3BuLL);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v11 = 138412546;
      uint64_t v12 = v6;
      __int16 v13 = 2112;
      id v14 = v3;
      v7 = "Failed to start sharing device browser (%@). Error: %@";
      id v8 = v4;
      uint32_t v9 = 22;
LABEL_6:
      _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v11, v9);
    }
  }
  else if (v5)
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = 138412290;
    uint64_t v12 = v10;
    v7 = "Started sharing device browser (%@)";
    id v8 = v4;
    uint32_t v9 = 12;
    goto LABEL_6;
  }
}

- (void)stopSearchingForNewAccessoriesWithError:(id)a3
{
  id v4 = a3;
  BOOL v5 = HFLogForCategory(0x3BuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "stopSearchingForNewAccessoriesWithError", v8, 2u);
  }

  [(HFAccessoryBrowsingManager *)self setIsBrowsing:0];
  uint64_t v6 = [(HFAccessoryBrowsingManager *)self accessoryBrowser];
  [v6 stopSearchingForNewAccessoriesWithError:v4];

  v7 = [(HFAccessoryBrowsingManager *)self sharingDeviceBrowser];
  [v7 invalidate];
}

- (void)addBrowsingObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFAccessoryBrowsingManager *)self observers];
  [v5 addObject:v4];
}

- (void)removeBrowsingObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFAccessoryBrowsingManager *)self observers];
  [v5 removeObject:v4];
}

- (void)accessoryBrowser:(id)a3 didFindNewAccessory:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = HFLogForCategory(0x3BuLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = objc_msgSend(v5, "hf_prettyDescription");
    *(_DWORD *)buf = 138412290;
    uint64_t v20 = v7;
    _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_INFO, "didFindNewAccessory: %@", buf, 0xCu);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = [(HFAccessoryBrowsingManager *)self observers];
  uint32_t v9 = (void *)[v8 copy];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * v13++) accessoryBrowsingManager:self didFindNewAccessory:v5];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (void)accessoryBrowser:(id)a3 didRemoveNewAccessory:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = HFLogForCategory(0x3BuLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = objc_msgSend(v5, "hf_prettyDescription");
    *(_DWORD *)buf = 138412290;
    uint64_t v20 = v7;
    _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_INFO, "didRemoveNewAccessory: %@", buf, 0xCu);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = [(HFAccessoryBrowsingManager *)self observers];
  uint32_t v9 = (void *)[v8 copy];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * v13++) accessoryBrowsingManager:self didRemoveNewAccessory:v5];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (BOOL)isBrowsing
{
  return self->_isBrowsing;
}

- (void)setIsBrowsing:(BOOL)a3
{
  self->_isBrowsing = a3;
}

- (HMAccessoryBrowser)accessoryBrowser
{
  return self->_accessoryBrowser;
}

- (void)setAccessoryBrowser:(id)a3
{
}

- (SFDeviceDiscovery)sharingDeviceBrowser
{
  return self->_sharingDeviceBrowser;
}

- (void)setSharingDeviceBrowser:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (NSMutableSet)mutableDiscoveredSharingDevices
{
  return self->_mutableDiscoveredSharingDevices;
}

- (void)setMutableDiscoveredSharingDevices:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableDiscoveredSharingDevices, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_sharingDeviceBrowser, 0);
  objc_storeStrong((id *)&self->_accessoryBrowser, 0);
}

@end