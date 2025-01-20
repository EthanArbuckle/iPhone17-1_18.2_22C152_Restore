@interface AXRDeviceDiscoveryManager
+ (id)sharedInstance;
- (IDSService)service;
- (NSMutableArray)discoveredDevices;
- (RPCompanionLinkClient)companionLinkClient;
- (id)_init;
- (id)cachedDiscoveredDevices;
- (id)mineDevices;
- (os_unfair_lock_s)devicesLock;
- (unint64_t)_indexOfDeviceWithEffectiveIdentifier:(id)a3;
- (void)_discoveredDevicesChanged;
- (void)_enumerateObservers:(id)a3;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setCompanionLinkClient:(id)a3;
- (void)setDevicesLock:(os_unfair_lock_s)a3;
- (void)setDiscoveredDevices:(id)a3;
- (void)setService:(id)a3;
@end

@implementation AXRDeviceDiscoveryManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedInstance__Manager;

  return v2;
}

uint64_t __43__AXRDeviceDiscoveryManager_sharedInstance__block_invoke()
{
  sharedInstance__Manager = [[AXRDeviceDiscoveryManager alloc] _init];

  return MEMORY[0x270F9A758]();
}

- (id)cachedDiscoveredDevices
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x3032000000;
  v7 = __Block_byref_object_copy_;
  v8 = __Block_byref_object_dispose_;
  id v9 = 0;
  AX_PERFORM_WITH_LOCK();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __52__AXRDeviceDiscoveryManager_cachedDiscoveredDevices__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) discoveredDevices];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)addObserver:(id)a3
{
  p_observersLock = &self->_observersLock;
  id v5 = a3;
  os_unfair_lock_lock(p_observersLock);
  [(NSHashTable *)self->_observers addObject:v5];

  os_unfair_lock_unlock(p_observersLock);
}

- (void)removeObserver:(id)a3
{
  p_observersLock = &self->_observersLock;
  id v5 = a3;
  os_unfair_lock_lock(p_observersLock);
  [(NSHashTable *)self->_observers removeObject:v5];

  os_unfair_lock_unlock(p_observersLock);
}

- (void)_enumerateObservers:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(id, void))a3;
  if (v4)
  {
    p_observersLock = &self->_observersLock;
    os_unfair_lock_lock(&self->_observersLock);
    uint64_t v6 = [(NSHashTable *)self->_observers allObjects];
    os_unfair_lock_unlock(p_observersLock);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          v4[2](v4, *(void *)(*((void *)&v12 + 1) + 8 * v11++));
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (id)_init
{
  v29.receiver = self;
  v29.super_class = (Class)AXRDeviceDiscoveryManager;
  uint64_t v2 = [(AXRDeviceDiscoveryManager *)&v29 init];
  if (v2)
  {
    uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.AXRemoteServices.DiscoveryDeviceQueue", v4);
    deviceQueue = v2->_deviceQueue;
    v2->_deviceQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v7;

    v2->_observersLock._os_unfair_lock_opaque = 0;
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F4A0C0]) initWithService:@"com.apple.private.alloy.accessibility.switchcontrol"];
    [(AXRDeviceDiscoveryManager *)v2 setService:v9];

    id v10 = [(AXRDeviceDiscoveryManager *)v2 mineDevices];
    uint64_t v11 = objc_opt_new();
    [(AXRDeviceDiscoveryManager *)v2 setDiscoveredDevices:v11];

    [(AXRDeviceDiscoveryManager *)v2 setDevicesLock:0];
    id v12 = objc_alloc_init(MEMORY[0x263F62B70]);
    [(AXRDeviceDiscoveryManager *)v2 setCompanionLinkClient:v12];

    long long v13 = [(AXRDeviceDiscoveryManager *)v2 companionLinkClient];
    [v13 setAppID:@"com.apple.AXRemoteServices.DeviceDiscoveryManager"];

    long long v14 = [(AXRDeviceDiscoveryManager *)v2 companionLinkClient];
    [v14 setControlFlags:0x200000002];

    long long v15 = v2->_deviceQueue;
    v16 = [(AXRDeviceDiscoveryManager *)v2 companionLinkClient];
    [v16 setDispatchQueue:v15];

    objc_initWeak(&location, v2);
    uint64_t v17 = [(AXRDeviceDiscoveryManager *)v2 companionLinkClient];
    [v17 setDisconnectHandler:&__block_literal_global_14];

    v18 = [(AXRDeviceDiscoveryManager *)v2 companionLinkClient];
    [v18 setInterruptionHandler:&__block_literal_global_17];

    v19 = [(AXRDeviceDiscoveryManager *)v2 companionLinkClient];
    [v19 setInvalidationHandler:&__block_literal_global_20];

    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __34__AXRDeviceDiscoveryManager__init__block_invoke_21;
    v26[3] = &unk_2646E8368;
    objc_copyWeak(&v27, &location);
    v20 = [(AXRDeviceDiscoveryManager *)v2 companionLinkClient];
    [v20 setDeviceFoundHandler:v26];

    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __34__AXRDeviceDiscoveryManager__init__block_invoke_2;
    v24[3] = &unk_2646E8368;
    objc_copyWeak(&v25, &location);
    v21 = [(AXRDeviceDiscoveryManager *)v2 companionLinkClient];
    [v21 setDeviceLostHandler:v24];

    v22 = [(AXRDeviceDiscoveryManager *)v2 companionLinkClient];
    [v22 activateWithCompletion:&__block_literal_global_35];

    objc_destroyWeak(&v25);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __34__AXRDeviceDiscoveryManager__init__block_invoke()
{
  v0 = ax_remote_connection_log();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_2249E0000, v0, OS_LOG_TYPE_INFO, "discovery companion link disconnected", v1, 2u);
  }
}

void __34__AXRDeviceDiscoveryManager__init__block_invoke_15()
{
  v0 = ax_remote_connection_log();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_2249E0000, v0, OS_LOG_TYPE_INFO, "discovery companion link interrupted", v1, 2u);
  }
}

void __34__AXRDeviceDiscoveryManager__init__block_invoke_18()
{
  v0 = ax_remote_connection_log();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_2249E0000, v0, OS_LOG_TYPE_INFO, "discovery companion link invalidated", v1, 2u);
  }
}

void __34__AXRDeviceDiscoveryManager__init__block_invoke_21(uint64_t a1, void *a2)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 sourceVersion];
  dispatch_queue_t v5 = ax_remote_connection_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = [v3 proximity];
    if (v6 > 19)
    {
      if (v6 == 20)
      {
        uint64_t v7 = "Near";
        goto LABEL_12;
      }
      if (v6 == 30)
      {
        uint64_t v7 = "Far";
        goto LABEL_12;
      }
    }
    else
    {
      if (!v6)
      {
        uint64_t v7 = "Unknown";
        goto LABEL_12;
      }
      if (v6 == 10)
      {
        uint64_t v7 = "Immed";
LABEL_12:
        *(_DWORD *)buf = 138412802;
        id v48 = v3;
        __int16 v49 = 2112;
        v50 = v4;
        __int16 v51 = 2080;
        v52 = v7;
        _os_log_impl(&dword_2249E0000, v5, OS_LOG_TYPE_INFO, "found device: %@ (version: %@), proximity: %s", buf, 0x20u);
        goto LABEL_13;
      }
    }
    uint64_t v7 = "?";
    goto LABEL_12;
  }
LABEL_13:

  if (!v4)
  {
    int v8 = _os_feature_enabled_impl();
    uint64_t v9 = ax_remote_connection_log();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (!v8)
    {
      if (v10)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2249E0000, v9, OS_LOG_TYPE_INFO, "No source version!", buf, 2u);
      }
      goto LABEL_61;
    }
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2249E0000, v9, OS_LOG_TYPE_INFO, "Ignoring source version", buf, 2u);
    }
  }
  uint64_t v9 = [v4 componentsSeparatedByString:@"."];
  uint64_t v11 = [v9 count];
  if (v11 < 1)
  {
    uint64_t v14 = 0;
LABEL_23:
    double v17 = (double)v14;
    goto LABEL_24;
  }
  unint64_t v12 = v11;
  long long v13 = [v9 objectAtIndexedSubscript:0];
  uint64_t v14 = 10000 * [v13 integerValue];

  if (v12 == 1) {
    goto LABEL_23;
  }
  long long v15 = [v9 objectAtIndexedSubscript:1];
  uint64_t v14 = (uint64_t)(fmax((double)[v15 integerValue], 99.0) * 100.0 + (double)v14);

  if (v12 <= 2) {
    goto LABEL_23;
  }
  v16 = [v9 objectAtIndexedSubscript:2];
  double v17 = fmax((double)[v16 integerValue], 99.0) + (double)v14;

LABEL_24:
  if ((uint64_t)v17 <= 3999999)
  {
    int v18 = _os_feature_enabled_impl();
    WeakRetained = ax_remote_connection_log();
    BOOL v20 = os_log_type_enabled(WeakRetained, OS_LOG_TYPE_INFO);
    if (!v18)
    {
      if (v20)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2249E0000, WeakRetained, OS_LOG_TYPE_INFO, "skipping older source version", buf, 2u);
      }
      goto LABEL_60;
    }
    if (v20)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2249E0000, WeakRetained, OS_LOG_TYPE_INFO, "Ignoring rapport version", buf, 2u);
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v21 = [WeakRetained mineDevices];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (!v22)
  {
    id v30 = v21;
    goto LABEL_59;
  }
  uint64_t v23 = v22;
  v38 = v4;
  v39 = v9;
  uint64_t v24 = *(void *)v43;
  while (2)
  {
    for (uint64_t i = 0; i != v23; ++i)
    {
      if (*(void *)v43 != v24) {
        objc_enumerationMutation(v21);
      }
      v26 = *(void **)(*((void *)&v42 + 1) + 8 * i);
      id v27 = objc_msgSend(v3, "idsDeviceIdentifier", v38);
      v28 = [v26 uniqueIDOverride];
      char v29 = [v27 isEqualToString:v28];

      if (v29)
      {
        id v30 = v26;

        if (!v30)
        {
          uint64_t v4 = v38;
          uint64_t v9 = v39;
          goto LABEL_60;
        }
        unint64_t v31 = [v30 deviceType];
        BOOL v32 = v31 > 8 || ((1 << v31) & 0x1E3) == 0;
        uint64_t v9 = v39;
        if (!v32)
        {
          int v33 = _os_feature_enabled_impl();
          v34 = ax_remote_connection_log();
          BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_INFO);
          if (!v33)
          {
            if (v35)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_2249E0000, v34, OS_LOG_TYPE_INFO, "skipping unsupported device type", buf, 2u);
            }
            goto LABEL_58;
          }
          if (v35)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2249E0000, v34, OS_LOG_TYPE_INFO, "Ignoring unsupported device type", buf, 2u);
          }
        }
        v34 = [v3 effectiveIdentifier];
        uint64_t v36 = [WeakRetained _indexOfDeviceWithEffectiveIdentifier:v34];
        v37 = [[AXRemoteDevice alloc] initWithDevice:v3];
        if (v36 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v40 = WeakRetained;
          v41 = v37;
          AX_PERFORM_WITH_LOCK();
          [v40 _discoveredDevicesChanged];
        }
LABEL_58:
        uint64_t v4 = v38;

        goto LABEL_59;
      }
    }
    uint64_t v23 = [v21 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v23) {
      continue;
    }
    break;
  }
  id v30 = v21;
  uint64_t v4 = v38;
  uint64_t v9 = v39;
LABEL_59:

LABEL_60:
LABEL_61:
}

void __34__AXRDeviceDiscoveryManager__init__block_invoke_29(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) discoveredDevices];
  [v2 addObject:*(void *)(a1 + 40)];
}

void __34__AXRDeviceDiscoveryManager__init__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = ax_remote_connection_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v3;
    _os_log_impl(&dword_2249E0000, v4, OS_LOG_TYPE_INFO, "lost device: %@", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v6 = [v3 effectiveIdentifier];
  if ([WeakRetained _indexOfDeviceWithEffectiveIdentifier:v6] != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = MEMORY[0x263EF8330];
    id v8 = WeakRetained;
    AX_PERFORM_WITH_LOCK();
    objc_msgSend(v8, "_discoveredDevicesChanged", v7, 3221225472, __34__AXRDeviceDiscoveryManager__init__block_invoke_31, &unk_2646E8390);
  }
}

void __34__AXRDeviceDiscoveryManager__init__block_invoke_31(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) discoveredDevices];
  [v2 removeObjectAtIndex:*(void *)(a1 + 40)];
}

void __34__AXRDeviceDiscoveryManager__init__block_invoke_2_32(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = ax_remote_connection_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_2249E0000, v3, OS_LOG_TYPE_INFO, "activated discovery companion link with error: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (id)mineDevices
{
  id v2 = [(AXRDeviceDiscoveryManager *)self service];
  id v3 = [v2 linkedDevicesWithRelationship:1];

  return v3;
}

- (unint64_t)_indexOfDeviceWithEffectiveIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(AXRDeviceDiscoveryManager *)self discoveredDevices];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __67__AXRDeviceDiscoveryManager__indexOfDeviceWithEffectiveIdentifier___block_invoke;
  v9[3] = &unk_2646E83D8;
  id v10 = v4;
  id v6 = v4;
  unint64_t v7 = [v5 indexOfObjectPassingTest:v9];

  return v7;
}

uint64_t __67__AXRDeviceDiscoveryManager__indexOfDeviceWithEffectiveIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  uint64_t v4 = [v2 isEqualToString:v3];

  return v4;
}

- (void)_discoveredDevicesChanged
{
  id v3 = [(AXRDeviceDiscoveryManager *)self cachedDiscoveredDevices];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __54__AXRDeviceDiscoveryManager__discoveredDevicesChanged__block_invoke;
  v5[3] = &unk_2646E8340;
  v5[4] = self;
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);
}

void __54__AXRDeviceDiscoveryManager__discoveredDevicesChanged__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __54__AXRDeviceDiscoveryManager__discoveredDevicesChanged__block_invoke_2;
  v2[3] = &unk_2646E8400;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 _enumerateObservers:v2];
}

uint64_t __54__AXRDeviceDiscoveryManager__discoveredDevicesChanged__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 deviceDiscoveryManager:*(void *)(a1 + 32) updatedDevices:*(void *)(a1 + 40)];
}

- (RPCompanionLinkClient)companionLinkClient
{
  return self->_companionLinkClient;
}

- (void)setCompanionLinkClient:(id)a3
{
}

- (NSMutableArray)discoveredDevices
{
  return self->_discoveredDevices;
}

- (void)setDiscoveredDevices:(id)a3
{
}

- (os_unfair_lock_s)devicesLock
{
  return self->_devicesLock;
}

- (void)setDevicesLock:(os_unfair_lock_s)a3
{
  self->_devicesLock = a3;
}

- (IDSService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_discoveredDevices, 0);
  objc_storeStrong((id *)&self->_companionLinkClient, 0);
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_deviceQueue, 0);
}

@end