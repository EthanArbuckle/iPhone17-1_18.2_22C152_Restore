@interface CCUIConnectivityManager
+ (CCUIConnectivityManager)sharedInstance;
- (CCUIConnectivityManager)init;
- (NEVPNConnectivityManager)vpnConnectivityManager;
- (NSHashTable)hotspotViewControllersObservingStateChanges;
- (NSHashTable)vpnViewControllersObservingStateChanges;
- (NSHashTable)wifiViewControllersObservingStateChanges;
- (WFControlCenterStateMonitor)wifiStateMonitor;
- (WFPersonalHotspotStateMonitor)hotspotStateMonitor;
- (void)_hostAPStateChanged;
- (void)_networkTetheringStateChanged;
- (void)addHotspotViewControllerObservingStateChanges:(id)a3;
- (void)addVPNViewControllerObservingStateChanges:(id)a3;
- (void)addWiFiViewControllerObservingStateChanges:(id)a3;
- (void)connectivityManagerDidChange:(id)a3;
- (void)removeHotspotViewControllerObservingStateChanges:(id)a3;
- (void)removeVPNViewControllerObservingStateChanges:(id)a3;
- (void)removeWiFiViewControllerObservingStateChanges:(id)a3;
- (void)setHotspotViewControllersObservingStateChanges:(id)a3;
- (void)setVpnViewControllersObservingStateChanges:(id)a3;
- (void)setWifiViewControllersObservingStateChanges:(id)a3;
@end

@implementation CCUIConnectivityManager

+ (CCUIConnectivityManager)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_14);
  }
  v2 = (void *)sharedInstance_sharedInstance_0;

  return (CCUIConnectivityManager *)v2;
}

uint64_t __41__CCUIConnectivityManager_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_0 = objc_alloc_init(CCUIConnectivityManager);

  return MEMORY[0x1F41817F8]();
}

- (CCUIConnectivityManager)init
{
  v34.receiver = self;
  v34.super_class = (Class)CCUIConnectivityManager;
  v2 = [(CCUIConnectivityManager *)&v34 init];
  if (!v2) {
    return v2;
  }
  uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
  vpnViewControllersObservingStateChanges = v2->_vpnViewControllersObservingStateChanges;
  v2->_vpnViewControllersObservingStateChanges = (NSHashTable *)v3;

  uint64_t v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
  wifiViewControllersObservingStateChanges = v2->_wifiViewControllersObservingStateChanges;
  v2->_wifiViewControllersObservingStateChanges = (NSHashTable *)v5;

  uint64_t v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
  hotspotViewControllersObservingStateChanges = v2->_hotspotViewControllersObservingStateChanges;
  v2->_hotspotViewControllersObservingStateChanges = (NSHashTable *)v7;

  uint64_t v9 = [objc_alloc(MEMORY[0x1E4F38D48]) initWithDelegate:v2];
  vpnConnectivityManager = v2->_vpnConnectivityManager;
  v2->_vpnConnectivityManager = (NEVPNConnectivityManager *)v9;

  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2050000000;
  v11 = (void *)getWFControlCenterStateMonitorClass_softClass;
  uint64_t v43 = getWFControlCenterStateMonitorClass_softClass;
  if (!getWFControlCenterStateMonitorClass_softClass)
  {
    uint64_t v35 = MEMORY[0x1E4F143A8];
    uint64_t v36 = 3221225472;
    v37 = __getWFControlCenterStateMonitorClass_block_invoke;
    v38 = &unk_1E6A89EB0;
    v39 = &v40;
    __getWFControlCenterStateMonitorClass_block_invoke((uint64_t)&v35);
    v11 = (void *)v41[3];
  }
  v12 = v11;
  _Block_object_dispose(&v40, 8);
  v13 = (WFControlCenterStateMonitor *)objc_alloc_init(v12);
  wifiStateMonitor = v2->_wifiStateMonitor;
  v2->_wifiStateMonitor = v13;

  objc_initWeak(&location, v2);
  v15 = v2->_wifiStateMonitor;
  uint64_t v28 = MEMORY[0x1E4F143A8];
  uint64_t v29 = 3221225472;
  v30 = __31__CCUIConnectivityManager_init__block_invoke;
  v31 = &unk_1E6A8A620;
  objc_copyWeak(&v32, &location);
  [(WFControlCenterStateMonitor *)v15 setHandler:&v28];
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2050000000;
  v16 = (void *)getWFPersonalHotspotStateMonitorClass_softClass;
  uint64_t v43 = getWFPersonalHotspotStateMonitorClass_softClass;
  if (!getWFPersonalHotspotStateMonitorClass_softClass)
  {
    uint64_t v35 = MEMORY[0x1E4F143A8];
    uint64_t v36 = 3221225472;
    v37 = __getWFPersonalHotspotStateMonitorClass_block_invoke;
    v38 = &unk_1E6A89EB0;
    v39 = &v40;
    __getWFPersonalHotspotStateMonitorClass_block_invoke((uint64_t)&v35);
    v16 = (void *)v41[3];
  }
  v17 = v16;
  _Block_object_dispose(&v40, 8);
  v18 = (WFPersonalHotspotStateMonitor *)objc_alloc_init(v17);
  hotspotStateMonitor = v2->_hotspotStateMonitor;
  v2->_hotspotStateMonitor = v18;

  v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v20 addObserver:v2 selector:sel__networkTetheringStateChanged name:*MEMORY[0x1E4FA7A80] object:0];
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2020000000;
  v21 = (id *)getWFInterfaceHostAPStateChangeNotificationSymbolLoc_ptr;
  uint64_t v43 = getWFInterfaceHostAPStateChangeNotificationSymbolLoc_ptr;
  if (!getWFInterfaceHostAPStateChangeNotificationSymbolLoc_ptr)
  {
    uint64_t v35 = MEMORY[0x1E4F143A8];
    uint64_t v36 = 3221225472;
    v37 = __getWFInterfaceHostAPStateChangeNotificationSymbolLoc_block_invoke;
    v38 = &unk_1E6A89EB0;
    v39 = &v40;
    v22 = (void *)WiFiKitLibrary();
    v23 = dlsym(v22, "WFInterfaceHostAPStateChangeNotification");
    *(void *)(v39[1] + 24) = v23;
    getWFInterfaceHostAPStateChangeNotificationSymbolLoc_ptr = *(void *)(v39[1] + 24);
    v21 = (id *)v41[3];
  }
  _Block_object_dispose(&v40, 8);
  if (v21)
  {
    id v24 = *v21;
    [v20 addObserver:v2 selector:sel__hostAPStateChanged name:v24 object:0];

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
    return v2;
  }
  v26 = [MEMORY[0x1E4F28B00] currentHandler];
  v27 = [NSString stringWithUTF8String:"NSString *getWFInterfaceHostAPStateChangeNotification(void)"];
  objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, @"CCUIConnectivityManager.m", 23, @"%s", dlerror(), v28, v29, v30, v31);

  __break(1u);
  return result;
}

void __31__CCUIConnectivityManager_init__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__CCUIConnectivityManager_init__block_invoke_2;
  block[3] = &unk_1E6A89FA8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __31__CCUIConnectivityManager_init__block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_msgSend(WeakRetained, "wifiViewControllersObservingStateChanges", 0);

  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) updateState];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)addVPNViewControllerObservingStateChanges:(id)a3
{
  id v4 = a3;
  id v5 = [(CCUIConnectivityManager *)self vpnViewControllersObservingStateChanges];
  [v5 addObject:v4];
}

- (void)removeVPNViewControllerObservingStateChanges:(id)a3
{
  id v4 = a3;
  id v5 = [(CCUIConnectivityManager *)self vpnViewControllersObservingStateChanges];
  [v5 removeObject:v4];
}

- (void)addWiFiViewControllerObservingStateChanges:(id)a3
{
  id v4 = a3;
  id v5 = [(CCUIConnectivityManager *)self wifiViewControllersObservingStateChanges];
  [v5 addObject:v4];
}

- (void)removeWiFiViewControllerObservingStateChanges:(id)a3
{
  id v4 = a3;
  id v5 = [(CCUIConnectivityManager *)self wifiViewControllersObservingStateChanges];
  [v5 removeObject:v4];
}

- (void)addHotspotViewControllerObservingStateChanges:(id)a3
{
  id v4 = a3;
  id v5 = [(CCUIConnectivityManager *)self hotspotViewControllersObservingStateChanges];
  [v5 addObject:v4];
}

- (void)removeHotspotViewControllerObservingStateChanges:(id)a3
{
  id v4 = a3;
  id v5 = [(CCUIConnectivityManager *)self hotspotViewControllersObservingStateChanges];
  [v5 removeObject:v4];
}

- (void)connectivityManagerDidChange:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__CCUIConnectivityManager_connectivityManagerDidChange___block_invoke;
  block[3] = &unk_1E6A898F8;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __56__CCUIConnectivityManager_connectivityManagerDidChange___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v1 = objc_msgSend(*(id *)(a1 + 32), "vpnViewControllersObservingStateChanges", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        [*(id *)(*((void *)&v6 + 1) + 8 * v5++) updateState];
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)_networkTetheringStateChanged
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__CCUIConnectivityManager__networkTetheringStateChanged__block_invoke;
  block[3] = &unk_1E6A898F8;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __56__CCUIConnectivityManager__networkTetheringStateChanged__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v1 = objc_msgSend(*(id *)(a1 + 32), "hotspotViewControllersObservingStateChanges", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        [*(id *)(*((void *)&v6 + 1) + 8 * v5++) updateState];
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)_hostAPStateChanged
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__CCUIConnectivityManager__hostAPStateChanged__block_invoke;
  block[3] = &unk_1E6A898F8;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __46__CCUIConnectivityManager__hostAPStateChanged__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v1 = objc_msgSend(*(id *)(a1 + 32), "hotspotViewControllersObservingStateChanges", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        [*(id *)(*((void *)&v6 + 1) + 8 * v5++) updateDiscoverability];
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (NEVPNConnectivityManager)vpnConnectivityManager
{
  return self->_vpnConnectivityManager;
}

- (WFPersonalHotspotStateMonitor)hotspotStateMonitor
{
  return self->_hotspotStateMonitor;
}

- (WFControlCenterStateMonitor)wifiStateMonitor
{
  return self->_wifiStateMonitor;
}

- (NSHashTable)vpnViewControllersObservingStateChanges
{
  return self->_vpnViewControllersObservingStateChanges;
}

- (void)setVpnViewControllersObservingStateChanges:(id)a3
{
}

- (NSHashTable)wifiViewControllersObservingStateChanges
{
  return self->_wifiViewControllersObservingStateChanges;
}

- (void)setWifiViewControllersObservingStateChanges:(id)a3
{
}

- (NSHashTable)hotspotViewControllersObservingStateChanges
{
  return self->_hotspotViewControllersObservingStateChanges;
}

- (void)setHotspotViewControllersObservingStateChanges:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hotspotViewControllersObservingStateChanges, 0);
  objc_storeStrong((id *)&self->_wifiViewControllersObservingStateChanges, 0);
  objc_storeStrong((id *)&self->_vpnViewControllersObservingStateChanges, 0);
  objc_storeStrong((id *)&self->_wifiStateMonitor, 0);
  objc_storeStrong((id *)&self->_hotspotStateMonitor, 0);

  objc_storeStrong((id *)&self->_vpnConnectivityManager, 0);
}

@end