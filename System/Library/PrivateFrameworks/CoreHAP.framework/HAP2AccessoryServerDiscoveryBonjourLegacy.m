@interface HAP2AccessoryServerDiscoveryBonjourLegacy
+ (id)new;
- (BOOL)isDiscovering;
- (CUBonjourBrowser)browser;
- (HAP2AccessoryServerDiscoveryBonjourLegacy)init;
- (HAP2AccessoryServerDiscoveryBonjourLegacy)initWithLocalDomainAndServiceType:(id)a3;
- (HAP2AccessoryServerDiscoveryBonjourLegacy)initWithServiceType:(id)a3 domain:(id)a4;
- (HAP2AccessoryServerDiscoveryDelegate)delegate;
- (HAP2PropertyLock)propertyLock;
- (NSString)domain;
- (NSString)type;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)workQueue;
- (void)_handleBrowserStopped:(id)a3;
- (void)_handleDeviceFoundOrChanged:(id)a3;
- (void)_handleDeviceLost:(id)a3;
- (void)_reconfirmAccessory:(id)a3;
- (void)_startBrowser;
- (void)_startDiscovering;
- (void)_stopBrowser;
- (void)_stopDiscovering;
- (void)dealloc;
- (void)reconfirmAccessory:(id)a3;
- (void)setBrowser:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDiscovering:(BOOL)a3;
- (void)startDiscovering;
- (void)stopDiscovering;
@end

@implementation HAP2AccessoryServerDiscoveryBonjourLegacy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyLock, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_browser, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (HAP2PropertyLock)propertyLock
{
  return self->_propertyLock;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NSString)domain
{
  return self->_domain;
}

- (NSString)type
{
  return self->_type;
}

- (void)_handleBrowserStopped:(id)a3
{
  id v4 = a3;
  v5 = [(HAP2AccessoryServerDiscoveryBonjourLegacy *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HAP2AccessoryServerDiscoveryBonjourLegacy *)self browser];

  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  v7 = hap2Log_browser;
  if (v6 == v4)
  {
    if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D4758000, v7, OS_LOG_TYPE_ERROR, "Failed to start browser", buf, 2u);
    }
    v8 = [MEMORY[0x1E4F28C58] hapErrorWithCode:1];
    [(HAP2AccessoryServerDiscoveryBonjourLegacy *)self setBrowser:0];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_DEFAULT, "No longer discovering", buf, 2u);
    }
    v8 = 0;
  }
  [(HAP2AccessoryServerDiscoveryBonjourLegacy *)self setDiscovering:0];
  v9 = [(HAP2AccessoryServerDiscoveryBonjourLegacy *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v10 = [(HAP2AccessoryServerDiscoveryBonjourLegacy *)self delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__HAP2AccessoryServerDiscoveryBonjourLegacy__handleBrowserStopped___block_invoke;
    block[3] = &unk_1E69F4708;
    id v12 = v9;
    v13 = self;
    id v14 = v8;
    dispatch_async(v10, block);
  }
}

uint64_t __67__HAP2AccessoryServerDiscoveryBonjourLegacy__handleBrowserStopped___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) discovery:*(void *)(a1 + 40) didStopDiscoveringWithError:*(void *)(a1 + 48)];
}

- (void)_handleDeviceLost:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HAP2AccessoryServerDiscoveryBonjourLegacy *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if ([(HAP2AccessoryServerDiscoveryBonjourLegacy *)self isDiscovering])
  {
    id v6 = [(HAP2AccessoryServerDiscoveryBonjourLegacy *)self delegate];
    if (v6)
    {
      v7 = [(HAP2AccessoryServerDiscoveryBonjourLegacy *)self type];
      v8 = [(HAP2AccessoryServerDiscoveryBonjourLegacy *)self domain];
      v9 = accessoryInfoForBonjourDevice(v4, v7, v8);

      if (v9)
      {
        if (hap2LogInitialize_onceToken != -1) {
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
        }
        v10 = (void *)hap2Log_browser;
        if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_DEFAULT))
        {
          v11 = v10;
          id v12 = [v9 rawDiscoveryInfo];
          v13 = [v12 objectForKeyedSubscript:@"bonjourServiceName"];
          id v14 = [v9 rawDiscoveryInfo];
          v15 = [v14 objectForKeyedSubscript:@"bonjourServiceType"];
          v16 = [v9 deviceID];
          int v18 = 138478339;
          v19 = v13;
          __int16 v20 = 2112;
          v21 = v15;
          __int16 v22 = 2112;
          v23 = v16;
          _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_DEFAULT, "Lost accessory: %{private}@.%@: %@", (uint8_t *)&v18, 0x20u);
        }
        if (objc_opt_respondsToSelector()) {
          [v6 discovery:self didLoseAccessory:v9 error:0];
        }
      }
    }
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    v17 = hap2Log_browser;
    if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_INFO, "Ignoring lost event while not discovering", (uint8_t *)&v18, 2u);
    }
  }
}

- (void)_handleDeviceFoundOrChanged:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HAP2AccessoryServerDiscoveryBonjourLegacy *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if ([(HAP2AccessoryServerDiscoveryBonjourLegacy *)self isDiscovering])
  {
    id v6 = [(HAP2AccessoryServerDiscoveryBonjourLegacy *)self delegate];
    if (v6)
    {
      v7 = [(HAP2AccessoryServerDiscoveryBonjourLegacy *)self type];
      v8 = [(HAP2AccessoryServerDiscoveryBonjourLegacy *)self domain];
      v9 = accessoryInfoForBonjourDevice(v4, v7, v8);

      if (v9)
      {
        if (hap2LogInitialize_onceToken != -1) {
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
        }
        v10 = (void *)hap2Log_browser;
        if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_DEFAULT))
        {
          v11 = v10;
          id v12 = [v9 rawDiscoveryInfo];
          v13 = [v12 objectForKeyedSubscript:@"bonjourServiceName"];
          id v14 = [v9 rawDiscoveryInfo];
          v15 = [v14 objectForKeyedSubscript:@"bonjourServiceType"];
          v16 = [v9 deviceID];
          int v18 = 138478339;
          v19 = v13;
          __int16 v20 = 2112;
          v21 = v15;
          __int16 v22 = 2112;
          v23 = v16;
          _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_DEFAULT, "Found accessory: %{private}@.%@: %@", (uint8_t *)&v18, 0x20u);
        }
        [v6 discovery:self didDiscoverAccessory:v9];
      }
    }
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    v17 = hap2Log_browser;
    if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_INFO, "Ignoring found/changed event while not discovering", (uint8_t *)&v18, 2u);
    }
  }
}

- (void)_stopBrowser
{
  v3 = [(HAP2AccessoryServerDiscoveryBonjourLegacy *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HAP2AccessoryServerDiscoveryBonjourLegacy *)self browser];
  [(HAP2AccessoryServerDiscoveryBonjourLegacy *)self setBrowser:0];
  [v4 invalidate];
}

- (void)_startBrowser
{
  v3 = [(HAP2AccessoryServerDiscoveryBonjourLegacy *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = objc_alloc_init(MEMORY[0x1E4F5E0F0]);
  [v4 setBrowseFlags:0x800000000000000];
  [v4 setChangeFlags:0xFFFFFFFFLL];
  [v4 setControlFlags:1];
  v5 = [(HAP2AccessoryServerDiscoveryBonjourLegacy *)self workQueue];
  [v4 setDispatchQueue:v5];

  id v6 = [(HAP2AccessoryServerDiscoveryBonjourLegacy *)self domain];
  [v4 setDomain:v6];

  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  [v4 setLabel:v8];

  v9 = [(HAP2AccessoryServerDiscoveryBonjourLegacy *)self type];
  [v4 setServiceType:v9];

  objc_initWeak(&location, self);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __58__HAP2AccessoryServerDiscoveryBonjourLegacy__startBrowser__block_invoke;
  v22[3] = &unk_1E69F2100;
  objc_copyWeak(&v23, &location);
  [v4 setDeviceFoundHandler:v22];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __58__HAP2AccessoryServerDiscoveryBonjourLegacy__startBrowser__block_invoke_18;
  v20[3] = &unk_1E69F2100;
  objc_copyWeak(&v21, &location);
  [v4 setDeviceLostHandler:v20];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __58__HAP2AccessoryServerDiscoveryBonjourLegacy__startBrowser__block_invoke_19;
  v18[3] = &unk_1E69F2128;
  objc_copyWeak(&v19, &location);
  [v4 setDeviceChangedHandler:v18];
  [v4 setInterruptionHandler:&__block_literal_global_23];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __58__HAP2AccessoryServerDiscoveryBonjourLegacy__startBrowser__block_invoke_24;
  v15 = &unk_1E69F4540;
  objc_copyWeak(&v17, &location);
  id v10 = v4;
  id v16 = v10;
  v11 = (void *)MEMORY[0x1D944E2D0](&v12);
  objc_msgSend(v10, "setInvalidationHandler:", v11, v12, v13, v14, v15);
  [v10 activate];
  [(HAP2AccessoryServerDiscoveryBonjourLegacy *)self setBrowser:v10];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

void __58__HAP2AccessoryServerDiscoveryBonjourLegacy__startBrowser__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _handleDeviceFoundOrChanged:v3];
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    id v6 = hap2Log_browser;
    if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_INFO, "Bonjour browser found event after discovery died", v7, 2u);
    }
  }
}

void __58__HAP2AccessoryServerDiscoveryBonjourLegacy__startBrowser__block_invoke_18(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _handleDeviceLost:v3];
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    id v6 = hap2Log_browser;
    if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_INFO, "Bonjour browser lost event after discovery died", v7, 2u);
    }
  }
}

void __58__HAP2AccessoryServerDiscoveryBonjourLegacy__startBrowser__block_invoke_19(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _handleDeviceFoundOrChanged:v3];
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    id v6 = hap2Log_browser;
    if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_INFO, "Bonjour browser changed event after discovery died", v7, 2u);
    }
  }
}

void __58__HAP2AccessoryServerDiscoveryBonjourLegacy__startBrowser__block_invoke_24(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _handleBrowserStopped:*(void *)(a1 + 32)];
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    id v4 = hap2Log_browser;
    if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_INFO, "Bonjour browser invalidate event after discovery died", v5, 2u);
    }
  }
  [*(id *)(a1 + 32) setInvalidationHandler:0];
}

void __58__HAP2AccessoryServerDiscoveryBonjourLegacy__startBrowser__block_invoke_21()
{
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  v0 = hap2Log_browser;
  if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_error_impl(&dword_1D4758000, v0, OS_LOG_TYPE_ERROR, "Bonjour browser crashed", v1, 2u);
  }
}

- (void)_reconfirmAccessory:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HAP2AccessoryServerDiscoveryBonjourLegacy *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if ([(HAP2AccessoryServerDiscoveryBonjourLegacy *)self isDiscovering])
  {
    id v6 = [v4 deviceID];
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    v7 = hap2Log_browser;
    if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_DEFAULT, "Attempting to reconfirm accessory '%@'", (uint8_t *)&buf, 0xCu);
    }
    v8 = [(HAP2AccessoryServerDiscoveryBonjourLegacy *)self browser];
    v9 = [v8 devices];

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __65__HAP2AccessoryServerDiscoveryBonjourLegacy__reconfirmAccessory___block_invoke;
    v13[3] = &unk_1E69F20D8;
    id v10 = v6;
    id v14 = v10;
    p_long long buf = &buf;
    [v9 enumerateObjectsUsingBlock:v13];
    if (!*(unsigned char *)(*((void *)&buf + 1) + 24))
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      v11 = hap2Log_browser;
      if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)id v16 = 138412290;
        id v17 = v10;
        _os_log_error_impl(&dword_1D4758000, v11, OS_LOG_TYPE_ERROR, "Unable to reconfirm accessory '%@'", v16, 0xCu);
      }
    }

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v12 = hap2Log_browser;
    if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1D4758000, v12, OS_LOG_TYPE_INFO, "Not discovering", (uint8_t *)&buf, 2u);
    }
  }
}

void __65__HAP2AccessoryServerDiscoveryBonjourLegacy__reconfirmAccessory___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  v7 = [(HAPDeviceID *)v6 identifierStr];
  if (v7)
  {
    v8 = [[HAPDeviceID alloc] initWithDeviceIDString:v7];
    v9 = v8;
    if (v8)
    {
      if ([(HAPDeviceID *)v8 isEqualToDeviceID:*(void *)(a1 + 32)])
      {
        if (hap2LogInitialize_onceToken != -1) {
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
        }
        id v10 = hap2Log_browser;
        if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO))
        {
          int v13 = 138412290;
          id v14 = v9;
          _os_log_impl(&dword_1D4758000, v10, OS_LOG_TYPE_INFO, "Reconfirming accessory '%@'", (uint8_t *)&v13, 0xCu);
        }
        [(HAPDeviceID *)v6 reconfirm];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
        *a4 = 1;
      }
    }
    else
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      uint64_t v12 = hap2Log_browser;
      if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO))
      {
        int v13 = 138412546;
        id v14 = v7;
        __int16 v15 = 2112;
        id v16 = v6;
        _os_log_impl(&dword_1D4758000, v12, OS_LOG_TYPE_INFO, "Ignoring bonjour device that has an invalid device id '%@': %@", (uint8_t *)&v13, 0x16u);
      }
    }
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    v11 = hap2Log_browser;
    if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      id v14 = v6;
      _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_INFO, "Ignoring bonjour device that has a no device id: %@", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)_stopDiscovering
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = [(HAP2AccessoryServerDiscoveryBonjourLegacy *)self workQueue];
  dispatch_assert_queue_V2(v3);

  BOOL v4 = [(HAP2AccessoryServerDiscoveryBonjourLegacy *)self isDiscovering];
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  v5 = hap2Log_browser;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = v5;
      v7 = [(HAP2AccessoryServerDiscoveryBonjourLegacy *)self type];
      int v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_DEFAULT, "Stopping discovery of services with type '%@'", (uint8_t *)&v8, 0xCu);
    }
    [(HAP2AccessoryServerDiscoveryBonjourLegacy *)self setDiscovering:0];
    [(HAP2AccessoryServerDiscoveryBonjourLegacy *)self _stopBrowser];
  }
  else if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_INFO, "Not discovering", (uint8_t *)&v8, 2u);
  }
}

- (void)_startDiscovering
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [(HAP2AccessoryServerDiscoveryBonjourLegacy *)self workQueue];
  dispatch_assert_queue_V2(v3);

  BOOL v4 = [(HAP2AccessoryServerDiscoveryBonjourLegacy *)self isDiscovering];
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  v5 = hap2Log_browser;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_INFO, "Already discovering", buf, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = v5;
      v7 = [(HAP2AccessoryServerDiscoveryBonjourLegacy *)self type];
      *(_DWORD *)long long buf = 138412290;
      int v18 = v7;
      _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_DEFAULT, "Starting to discover services with type '%@'", buf, 0xCu);
    }
    [(HAP2AccessoryServerDiscoveryBonjourLegacy *)self _startBrowser];
    [(HAP2AccessoryServerDiscoveryBonjourLegacy *)self setDiscovering:1];
    int v8 = [(HAP2AccessoryServerDiscoveryBonjourLegacy *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      v9 = [(HAP2AccessoryServerDiscoveryBonjourLegacy *)self delegateQueue];
      uint64_t v11 = MEMORY[0x1E4F143A8];
      uint64_t v12 = 3221225472;
      int v13 = __62__HAP2AccessoryServerDiscoveryBonjourLegacy__startDiscovering__block_invoke;
      id v14 = &unk_1E69F46E0;
      id v15 = v8;
      id v16 = self;
      dispatch_async(v9, &v11);
    }
    uint64_t v10 = [(HAP2AccessoryServerDiscoveryBonjourLegacy *)self workQueue];
    dispatch_async(v10, &__block_literal_global_11652);
  }
}

uint64_t __62__HAP2AccessoryServerDiscoveryBonjourLegacy__startDiscovering__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) discovery:*(void *)(a1 + 40) didStartDiscoveringWithError:0];
}

void __62__HAP2AccessoryServerDiscoveryBonjourLegacy__startDiscovering__block_invoke_2()
{
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  v0 = hap2Log_browser;
  if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1D4758000, v0, OS_LOG_TYPE_DEFAULT, "Now discovering", v1, 2u);
  }
}

- (void)reconfirmAccessory:(id)a3
{
  id v4 = a3;
  v5 = [(HAP2AccessoryServerDiscoveryBonjourLegacy *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__HAP2AccessoryServerDiscoveryBonjourLegacy_reconfirmAccessory___block_invoke;
  v7[3] = &unk_1E69F46E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __64__HAP2AccessoryServerDiscoveryBonjourLegacy_reconfirmAccessory___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reconfirmAccessory:*(void *)(a1 + 40)];
}

- (void)stopDiscovering
{
  id v3 = [(HAP2AccessoryServerDiscoveryBonjourLegacy *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__HAP2AccessoryServerDiscoveryBonjourLegacy_stopDiscovering__block_invoke;
  block[3] = &unk_1E69F4330;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __60__HAP2AccessoryServerDiscoveryBonjourLegacy_stopDiscovering__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopDiscovering];
}

- (void)startDiscovering
{
  id v3 = [(HAP2AccessoryServerDiscoveryBonjourLegacy *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__HAP2AccessoryServerDiscoveryBonjourLegacy_startDiscovering__block_invoke;
  block[3] = &unk_1E69F4330;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __61__HAP2AccessoryServerDiscoveryBonjourLegacy_startDiscovering__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startDiscovering];
}

- (OS_dispatch_queue)delegateQueue
{
  return (OS_dispatch_queue *)dispatch_get_global_queue(0, 0);
}

- (void)setBrowser:(id)a3
{
  id v4 = (CUBonjourBrowser *)a3;
  v5 = [(HAP2AccessoryServerDiscoveryBonjourLegacy *)self workQueue];
  dispatch_assert_queue_V2(v5);

  browser = self->_browser;
  self->_browser = v4;
}

- (CUBonjourBrowser)browser
{
  id v3 = [(HAP2AccessoryServerDiscoveryBonjourLegacy *)self workQueue];
  dispatch_assert_queue_V2(v3);

  browser = self->_browser;

  return browser;
}

- (void)setDiscovering:(BOOL)a3
{
  v5 = [(HAP2AccessoryServerDiscoveryBonjourLegacy *)self propertyLock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__HAP2AccessoryServerDiscoveryBonjourLegacy_setDiscovering___block_invoke;
  v6[3] = &unk_1E69F3DF8;
  v6[4] = self;
  BOOL v7 = a3;
  [v5 performWritingBlock:v6];
}

uint64_t __60__HAP2AccessoryServerDiscoveryBonjourLegacy_setDiscovering___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 8) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)isDiscovering
{
  v2 = self;
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v3 = [(HAP2AccessoryServerDiscoveryBonjourLegacy *)self propertyLock];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__HAP2AccessoryServerDiscoveryBonjourLegacy_isDiscovering__block_invoke;
  v5[3] = &unk_1E69F44F0;
  v5[4] = v2;
  v5[5] = &v6;
  [v3 performReadingBlock:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __58__HAP2AccessoryServerDiscoveryBonjourLegacy_isDiscovering__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 8);
  return result;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  v5 = [(HAP2AccessoryServerDiscoveryBonjourLegacy *)self propertyLock];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__HAP2AccessoryServerDiscoveryBonjourLegacy_setDelegate___block_invoke;
  v7[3] = &unk_1E69F46E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performWritingBlock:v7];
}

id __57__HAP2AccessoryServerDiscoveryBonjourLegacy_setDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
}

- (HAP2AccessoryServerDiscoveryDelegate)delegate
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__11656;
  uint64_t v11 = __Block_byref_object_dispose__11657;
  id v12 = 0;
  id v3 = [(HAP2AccessoryServerDiscoveryBonjourLegacy *)self propertyLock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__HAP2AccessoryServerDiscoveryBonjourLegacy_delegate__block_invoke;
  v6[3] = &unk_1E69F44F0;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 performReadingBlock:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (HAP2AccessoryServerDiscoveryDelegate *)v4;
}

uint64_t __53__HAP2AccessoryServerDiscoveryBonjourLegacy_delegate__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));

  return MEMORY[0x1F41817F8]();
}

- (void)dealloc
{
  browser = self->_browser;
  if (browser) {
    [(CUBonjourBrowser *)browser invalidate];
  }
  v4.receiver = self;
  v4.super_class = (Class)HAP2AccessoryServerDiscoveryBonjourLegacy;
  [(HAP2AccessoryServerDiscoveryBonjourLegacy *)&v4 dealloc];
}

- (HAP2AccessoryServerDiscoveryBonjourLegacy)initWithLocalDomainAndServiceType:(id)a3
{
  return [(HAP2AccessoryServerDiscoveryBonjourLegacy *)self initWithServiceType:a3 domain:@"local."];
}

- (HAP2AccessoryServerDiscoveryBonjourLegacy)initWithServiceType:(id)a3 domain:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HAP2AccessoryServerDiscoveryBonjourLegacy;
  uint64_t v9 = [(HAP2AccessoryServerDiscoveryBonjourLegacy *)&v18 init];
  uint64_t v10 = v9;
  if (v9)
  {
    uint64_t v11 = (const char *)HAPDispatchQueueName(v9, @"workQueue");
    id v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create(v11, v12);
    workQueue = v10->_workQueue;
    v10->_workQueue = (OS_dispatch_queue *)v13;

    uint64_t v15 = +[HAP2PropertyLock lockWithName:@"HAP2AccessoryServerDiscoveryBonjourLegacy.propertyLock"];
    propertyLock = v10->_propertyLock;
    v10->_propertyLock = (HAP2PropertyLock *)v15;

    objc_storeStrong((id *)&v10->_type, a3);
    objc_storeStrong((id *)&v10->_domain, a4);
  }

  return v10;
}

- (HAP2AccessoryServerDiscoveryBonjourLegacy)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  objc_super v4 = NSString;
  v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)new
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  objc_super v4 = NSString;
  v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end