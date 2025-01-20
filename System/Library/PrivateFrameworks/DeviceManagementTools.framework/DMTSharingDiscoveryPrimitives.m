@interface DMTSharingDiscoveryPrimitives
- (BOOL)isActivated;
- (BOOL)isInvalidated;
- (DMTSharingDiscoveryPrimitives)init;
- (NSMutableDictionary)foundDevicesByIdentifier;
- (OS_dispatch_queue)discoveryCallbackQueue;
- (SFDeviceDiscovery)deviceDiscovery;
- (id)deviceFoundHandler;
- (id)deviceLostHandler;
- (id)invalidationHandler;
- (id)sessionForDevice:(id)a3;
- (void)activateWithCompletion:(id)a3;
- (void)addDependencyHandlers;
- (void)deactivate;
- (void)handleDevice:(id)a3;
- (void)setActivated:(BOOL)a3;
- (void)setDeviceFoundHandler:(id)a3;
- (void)setDeviceLostHandler:(id)a3;
- (void)setFoundDevicesByIdentifier:(id)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setInvalidationHandler:(id)a3;
@end

@implementation DMTSharingDiscoveryPrimitives

- (DMTSharingDiscoveryPrimitives)init
{
  v10.receiver = self;
  v10.super_class = (Class)DMTSharingDiscoveryPrimitives;
  v2 = [(DMTSharingDiscoveryPrimitives *)&v10 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.devicemanagementtools.discovery", 0);
    discoveryCallbackQueue = v2->_discoveryCallbackQueue;
    v2->_discoveryCallbackQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = objc_opt_new();
    deviceDiscovery = v2->_deviceDiscovery;
    v2->_deviceDiscovery = (SFDeviceDiscovery *)v5;

    [(SFDeviceDiscovery *)v2->_deviceDiscovery setDispatchQueue:v2->_discoveryCallbackQueue];
    [(SFDeviceDiscovery *)v2->_deviceDiscovery setDiscoveryFlags:0x8000];
    [(SFDeviceDiscovery *)v2->_deviceDiscovery setPurpose:@"RemoteManagementPairing"];
    [(SFDeviceDiscovery *)v2->_deviceDiscovery setChangeFlags:1];
    [(SFDeviceDiscovery *)v2->_deviceDiscovery setFastScanMode:1];
    [(SFDeviceDiscovery *)v2->_deviceDiscovery setScanRate:50];
    uint64_t v7 = objc_opt_new();
    foundDevicesByIdentifier = v2->_foundDevicesByIdentifier;
    v2->_foundDevicesByIdentifier = (NSMutableDictionary *)v7;
  }
  return v2;
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  [(DMTSharingDiscoveryPrimitives *)self addDependencyHandlers];
  objc_initWeak(&location, self);
  uint64_t v5 = [(DMTSharingDiscoveryPrimitives *)self deviceDiscovery];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__DMTSharingDiscoveryPrimitives_activateWithCompletion___block_invoke;
  v7[3] = &unk_2649A9C08;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 activateWithCompletion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __56__DMTSharingDiscoveryPrimitives_activateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    [WeakRetained setActivated:v4 == 0];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)deactivate
{
  id v2 = [(DMTSharingDiscoveryPrimitives *)self deviceDiscovery];
  [v2 invalidate];
}

- (id)sessionForDevice:(id)a3
{
  id v3 = a3;
  id v4 = [[DMTCatalystSharingBackedDeviceSession alloc] initWithDevice:v3];

  return v4;
}

- (void)addDependencyHandlers
{
  objc_initWeak(&location, self);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __54__DMTSharingDiscoveryPrimitives_addDependencyHandlers__block_invoke;
  v17[3] = &unk_2649A9C30;
  objc_copyWeak(&v18, &location);
  id v3 = [(DMTSharingDiscoveryPrimitives *)self deviceDiscovery];
  [v3 setInvalidationHandler:v17];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __54__DMTSharingDiscoveryPrimitives_addDependencyHandlers__block_invoke_2;
  v15[3] = &unk_2649A9C30;
  objc_copyWeak(&v16, &location);
  id v4 = [(DMTSharingDiscoveryPrimitives *)self deviceDiscovery];
  [v4 setInterruptionHandler:v15];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __54__DMTSharingDiscoveryPrimitives_addDependencyHandlers__block_invoke_9;
  v13[3] = &unk_2649A9C58;
  objc_copyWeak(&v14, &location);
  uint64_t v5 = [(DMTSharingDiscoveryPrimitives *)self deviceDiscovery];
  [v5 setDeviceLostHandler:v13];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __54__DMTSharingDiscoveryPrimitives_addDependencyHandlers__block_invoke_11;
  v11[3] = &unk_2649A9C58;
  objc_copyWeak(&v12, &location);
  id v6 = [(DMTSharingDiscoveryPrimitives *)self deviceDiscovery];
  [v6 setDeviceFoundHandler:v11];

  uint64_t v9 = MEMORY[0x263EF8330];
  objc_copyWeak(&v10, &location);
  uint64_t v7 = [(DMTSharingDiscoveryPrimitives *)self deviceDiscovery];
  [v7 setDeviceChangedHandler:&v9];

  id v8 = [(DMTSharingDiscoveryPrimitives *)self deviceDiscovery];
  [v8 setTimeoutHandler:&__block_literal_global_1];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __54__DMTSharingDiscoveryPrimitives_addDependencyHandlers__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained setInvalidated:1];
    id v2 = [v4 invalidationHandler];
    if (v2)
    {
      id v3 = DMTErrorWithCodeAndUserInfo(10, 0);
      ((void (**)(void, void *))v2)[2](v2, v3);
    }
    id WeakRetained = v4;
  }
}

void __54__DMTSharingDiscoveryPrimitives_addDependencyHandlers__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained isInvalidated])
    {
      uint64_t v3 = _DMTLogGeneral_0();
      if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v5 = 0;
        _os_log_impl(&dword_22D3D6000, (os_log_t)v3, OS_LOG_TYPE_INFO, "Interrupted after invalidation, no-op", v5, 2u);
      }
    }
    else
    {
      [v2 setInvalidated:1];
      uint64_t v3 = [v2 invalidationHandler];
      id v4 = DMTErrorWithCodeAndUserInfo(11, 0);
      (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
    }
  }
}

void __54__DMTSharingDiscoveryPrimitives_addDependencyHandlers__block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && [v3 deviceActionType] == 21)
  {
    uint64_t v5 = [WeakRetained foundDevicesByIdentifier];
    id v6 = [v3 identifier];
    uint64_t v7 = [v5 objectForKeyedSubscript:v6];

    if (!v7)
    {
      id v8 = _DMTLogGeneral_0();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __54__DMTSharingDiscoveryPrimitives_addDependencyHandlers__block_invoke_9_cold_1(v8);
      }
    }
    uint64_t v9 = [WeakRetained foundDevicesByIdentifier];
    id v10 = [v3 identifier];
    [v9 setObject:0 forKeyedSubscript:v10];

    v11 = [WeakRetained deviceLostHandler];
    ((void (**)(void, void *))v11)[2](v11, v7);
  }
}

void __54__DMTSharingDiscoveryPrimitives_addDependencyHandlers__block_invoke_11(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v5 = _DMTLogGeneral_0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __54__DMTSharingDiscoveryPrimitives_addDependencyHandlers__block_invoke_11_cold_1(v3, v5);
    }

    [WeakRetained handleDevice:v3];
  }
}

void __54__DMTSharingDiscoveryPrimitives_addDependencyHandlers__block_invoke_12(uint64_t a1, void *a2, int a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v7 = _DMTLogGeneral_0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __54__DMTSharingDiscoveryPrimitives_addDependencyHandlers__block_invoke_12_cold_1((uint64_t)v5, a3, v7);
    }

    if (a3)
    {
      id v8 = _DMTLogGeneral_0();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v9 = 138412546;
        id v10 = v5;
        __int16 v11 = 1024;
        int v12 = [v5 deviceActionType];
        _os_log_impl(&dword_22D3D6000, v8, OS_LOG_TYPE_INFO, "Advertisement data changed for device: %@ with action type: %d", (uint8_t *)&v9, 0x12u);
      }

      [WeakRetained handleDevice:v5];
    }
  }
}

void __54__DMTSharingDiscoveryPrimitives_addDependencyHandlers__block_invoke_14()
{
  v0 = _DMTLogGeneral_0();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __54__DMTSharingDiscoveryPrimitives_addDependencyHandlers__block_invoke_14_cold_1(v0);
  }
}

- (void)handleDevice:(id)a3
{
  id v4 = a3;
  if ([v4 deviceActionType] == 21)
  {
    id v5 = [(DMTSharingDiscoveryPrimitives *)self foundDevicesByIdentifier];
    id v6 = [v4 identifier];
    uint64_t v7 = [v5 objectForKeyedSubscript:v6];

    if (v7)
    {
      uint64_t v8 = _DMTLogGeneral_0();
      if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR)) {
        -[DMTSharingDiscoveryPrimitives handleDevice:]((uint64_t)v7, v8);
      }
    }
    else
    {
      uint64_t v7 = [[DMTSharingDevice alloc] initWithDevice:v4];
      int v9 = [(DMTSharingDiscoveryPrimitives *)self foundDevicesByIdentifier];
      id v10 = [(CATSharingDevice *)v7 identifier];
      [v9 setObject:v7 forKeyedSubscript:v10];

      uint64_t v8 = [(DMTSharingDiscoveryPrimitives *)self deviceFoundHandler];
      (*(void (**)(uint64_t, DMTSharingDevice *))(v8 + 16))(v8, v7);
    }
  }
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)deviceFoundHandler
{
  return self->_deviceFoundHandler;
}

- (void)setDeviceFoundHandler:(id)a3
{
}

- (id)deviceLostHandler
{
  return self->_deviceLostHandler;
}

- (void)setDeviceLostHandler:(id)a3
{
}

- (OS_dispatch_queue)discoveryCallbackQueue
{
  return self->_discoveryCallbackQueue;
}

- (SFDeviceDiscovery)deviceDiscovery
{
  return self->_deviceDiscovery;
}

- (BOOL)isActivated
{
  return self->_activated;
}

- (void)setActivated:(BOOL)a3
{
  self->_activated = a3;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (NSMutableDictionary)foundDevicesByIdentifier
{
  return self->_foundDevicesByIdentifier;
}

- (void)setFoundDevicesByIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foundDevicesByIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceDiscovery, 0);
  objc_storeStrong((id *)&self->_discoveryCallbackQueue, 0);
  objc_storeStrong(&self->_deviceLostHandler, 0);
  objc_storeStrong(&self->_deviceFoundHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
}

void __54__DMTSharingDiscoveryPrimitives_addDependencyHandlers__block_invoke_9_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138543362;
  uint64_t v2 = 0;
  _os_log_error_impl(&dword_22D3D6000, log, OS_LOG_TYPE_ERROR, "Primitives reported a device lost that we've never seen (%{public}@).  This is a known Sharing behavior. Falling through anyways.", (uint8_t *)&v1, 0xCu);
}

void __54__DMTSharingDiscoveryPrimitives_addDependencyHandlers__block_invoke_11_cold_1(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  id v4 = a1;
  __int16 v5 = 1024;
  int v6 = [a1 deviceActionType];
  _os_log_debug_impl(&dword_22D3D6000, a2, OS_LOG_TYPE_DEBUG, "deviceFoundHandler was called for device: %@ with action type: %d", (uint8_t *)&v3, 0x12u);
}

void __54__DMTSharingDiscoveryPrimitives_addDependencyHandlers__block_invoke_12_cold_1(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_debug_impl(&dword_22D3D6000, log, OS_LOG_TYPE_DEBUG, "deviceChangedHandler was called for device: %@ with change flags: %d", (uint8_t *)&v3, 0x12u);
}

void __54__DMTSharingDiscoveryPrimitives_addDependencyHandlers__block_invoke_14_cold_1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_debug_impl(&dword_22D3D6000, log, OS_LOG_TYPE_DEBUG, "timeoutHandler was called, we're not sure why", v1, 2u);
}

- (void)handleDevice:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22D3D6000, a2, OS_LOG_TYPE_ERROR, "Primitives reported a device found that we've already seen (%{public}@). This is a known Sharing behavior.", (uint8_t *)&v2, 0xCu);
}

@end