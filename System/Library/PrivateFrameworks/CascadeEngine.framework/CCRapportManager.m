@interface CCRapportManager
- (CCRapportManager)initWithQueue:(id)a3 forSharedUse:(BOOL)a4;
- (CCRapportManagerDelegate)delegate;
- (NSMutableDictionary)registeredRequests;
- (OS_dispatch_queue)queue;
- (id)deviceWithIdentifier:(id)a3;
- (id)discoveredDevices;
- (id)localDevice;
- (void)activateDirectLinkToDevice:(id)a3 completionHandler:(id)a4;
- (void)activateDiscoveryClientWithCompletion:(id)a3;
- (void)activateDiscoveryLinkWithCompletion:(id)a3;
- (void)createDiscoveryClientIfNotExists;
- (void)createDiscoveryClientWithControlFlags:(unint64_t)a3;
- (void)createSharedDiscoveryClientIfNotExists;
- (void)device:(id)a3 didChange:(unsigned int)a4;
- (void)didDiscoverDevice:(id)a3;
- (void)didLoseDevice:(id)a3;
- (void)finishedSendingRequestsToDevice:(id)a3;
- (void)handleActivationForDevice:(id)a3 error:(id)a4;
- (void)handleDiscoveryClientActivationOrError:(id)a3;
- (void)handleDiscoveryClientInvalidation;
- (void)handleInterruptionForDevice:(id)a3;
- (void)invalidateDirectLinkToDevice:(id)a3;
- (void)localDeviceUpdated:(id)a3;
- (void)registerEventID:(id)a3 eventHandler:(id)a4;
- (void)registerForSigterm;
- (void)registerLocalDeviceUpdatedHandler:(id)a3;
- (void)registerRequestID:(id)a3 requestHandler:(id)a4;
- (void)sendEvent:(id)a3 event:(id)a4 toDevice:(id)a5 completionHandler:(id)a6;
- (void)sendNextRequestToDevice:(id)a3;
- (void)sendRequest:(id)a3 request:(id)a4 device:(id)a5 options:(id)a6 responseHandler:(id)a7;
- (void)sendRequest:(id)a3 request:(id)a4 toDevice:(id)a5 responseHandler:(id)a6;
- (void)setDelegate:(id)a3;
- (void)setRegisteredRequests:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation CCRapportManager

- (CCRapportManager)initWithQueue:(id)a3 forSharedUse:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CCRapportManager;
  v8 = [(CCRapportManager *)&v17 init];
  if (v8)
  {
    uint64_t v9 = objc_opt_new();
    devices = v8->_devices;
    v8->_devices = (NSMutableDictionary *)v9;

    uint64_t v11 = objc_opt_new();
    unsupportedDevices = v8->_unsupportedDevices;
    v8->_unsupportedDevices = (NSMutableDictionary *)v11;

    uint64_t v13 = objc_opt_new();
    registeredRequests = v8->_registeredRequests;
    v8->_registeredRequests = (NSMutableDictionary *)v13;

    objc_storeStrong((id *)&v8->_queue, a3);
    v8->_sharedUse = 0;
    if (v4)
    {
      if (os_variant_allows_internal_security_policies())
      {
        v8->_sharedUse = 1;
      }
      else
      {
        v15 = __biome_log_for_category();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
          -[CCRapportManager initWithQueue:forSharedUse:]();
        }
      }
    }
    [(CCRapportManager *)v8 registerForSigterm];
  }

  return v8;
}

- (void)registerForSigterm
{
  signal(15, (void (__cdecl *)(int))1);
  v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF83F0], 0xFuLL, 0, (dispatch_queue_t)self->_queue);
  sigtermSource = self->_sigtermSource;
  self->_sigtermSource = v3;

  v5 = self->_sigtermSource;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __38__CCRapportManager_registerForSigterm__block_invoke;
  handler[3] = &unk_265277CC0;
  handler[4] = self;
  dispatch_source_set_event_handler(v5, handler);
  dispatch_activate((dispatch_object_t)self->_sigtermSource);
}

uint64_t __38__CCRapportManager_registerForSigterm__block_invoke(uint64_t a1)
{
  v2 = __biome_log_for_category();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl(&dword_249B69000, v2, OS_LOG_TYPE_DEFAULT, "CCRapportManager: received SIGTERM", v4, 2u);
  }

  return [*(id *)(a1 + 32) stop];
}

- (void)createDiscoveryClientIfNotExists
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v2 = BMDevicePlatformGetDescription();
  OUTLINED_FUNCTION_4();
  _os_log_fault_impl(&dword_249B69000, a1, OS_LOG_TYPE_FAULT, "BMRapportManager: could not determine appropriate control flags for device platform: %@", v3, 0xCu);
}

- (void)createSharedDiscoveryClientIfNotExists
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_249B69000, v0, v1, "CCRapportManager: createSharedDiscoveryClientIfNotExists not currently supported", v2, v3, v4, v5, v6);
}

- (void)createDiscoveryClientWithControlFlags:(unint64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_discoveryClient)
  {
    uint64_t v5 = __biome_log_for_category();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[CCRapportManager createDiscoveryClientWithControlFlags:]();
    }
  }
  else
  {
    uint8_t v6 = (RPCompanionLinkClient *)objc_alloc_init(MEMORY[0x263F62B70]);
    discoveryClient = self->_discoveryClient;
    self->_discoveryClient = v6;

    [(RPCompanionLinkClient *)self->_discoveryClient setDispatchQueue:self->_queue];
    [(RPCompanionLinkClient *)self->_discoveryClient setControlFlags:a3];
    [(RPCompanionLinkClient *)self->_discoveryClient setServiceType:@"com.apple.biomesyncd.cascade.rapport"];
    objc_initWeak(&location, self);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __58__CCRapportManager_createDiscoveryClientWithControlFlags___block_invoke;
    v16[3] = &unk_265277CE8;
    objc_copyWeak(&v17, &location);
    [(RPCompanionLinkClient *)self->_discoveryClient setInvalidationHandler:v16];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __58__CCRapportManager_createDiscoveryClientWithControlFlags___block_invoke_2;
    v14[3] = &unk_265277D10;
    objc_copyWeak(&v15, &location);
    [(RPCompanionLinkClient *)self->_discoveryClient setDeviceFoundHandler:v14];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __58__CCRapportManager_createDiscoveryClientWithControlFlags___block_invoke_3;
    v12[3] = &unk_265277D10;
    objc_copyWeak(&v13, &location);
    [(RPCompanionLinkClient *)self->_discoveryClient setDeviceLostHandler:v12];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __58__CCRapportManager_createDiscoveryClientWithControlFlags___block_invoke_4;
    v10[3] = &unk_265277D38;
    objc_copyWeak(&v11, &location);
    [(RPCompanionLinkClient *)self->_discoveryClient setDeviceChangedHandler:v10];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __58__CCRapportManager_createDiscoveryClientWithControlFlags___block_invoke_5;
    v8[3] = &unk_265277D10;
    objc_copyWeak(&v9, &location);
    [(RPCompanionLinkClient *)self->_discoveryClient setLocalDeviceUpdatedHandler:v8];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

void __58__CCRapportManager_createDiscoveryClientWithControlFlags___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleDiscoveryClientInvalidation];
}

void __58__CCRapportManager_createDiscoveryClientWithControlFlags___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained didDiscoverDevice:v3];
}

void __58__CCRapportManager_createDiscoveryClientWithControlFlags___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained didLoseDevice:v3];
}

void __58__CCRapportManager_createDiscoveryClientWithControlFlags___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained device:v5 didChange:a3];
}

void __58__CCRapportManager_createDiscoveryClientWithControlFlags___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained localDeviceUpdated:v3];
}

- (void)activateDiscoveryLinkWithCompletion:(id)a3
{
  BOOL sharedUse = self->_sharedUse;
  id v5 = a3;
  if (sharedUse) {
    [(CCRapportManager *)self createSharedDiscoveryClientIfNotExists];
  }
  else {
    [(CCRapportManager *)self createDiscoveryClientIfNotExists];
  }
  [(CCRapportManager *)self activateDiscoveryClientWithCompletion:v5];
}

- (void)activateDiscoveryClientWithCompletion:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(id, uint64_t))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  unint64_t discoveryClientState = self->_discoveryClientState;
  if (discoveryClientState == 1)
  {
    v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      [(CCRapportManager *)(uint64_t)self activateDiscoveryClientWithCompletion:v9];
    }
  }
  else if (discoveryClientState == 2)
  {
    uint8_t v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      [(CCRapportManager *)(uint64_t)self activateDiscoveryClientWithCompletion:v7];
    }

    v4[2](v4, 1);
  }
  else
  {
    self->_unint64_t discoveryClientState = 1;
    v10 = __biome_log_for_category();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      discoveryClient = self->_discoveryClient;
      *(_DWORD *)buf = 138412290;
      id v17 = discoveryClient;
      _os_log_impl(&dword_249B69000, v10, OS_LOG_TYPE_DEFAULT, "CCRapportManager: activating %@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    v12 = self->_discoveryClient;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __58__CCRapportManager_activateDiscoveryClientWithCompletion___block_invoke;
    v13[3] = &unk_265277D60;
    objc_copyWeak(&v15, (id *)buf);
    v14 = v4;
    [(RPCompanionLinkClient *)v12 activateWithCompletion:v13];

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
}

uint64_t __58__CCRapportManager_activateDiscoveryClientWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained handleDiscoveryClientActivationOrError:v4];

  uint8_t v6 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v6();
}

- (void)handleDiscoveryClientActivationOrError:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(RPCompanionLinkClient *)self->_discoveryClient activeDevices];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        [(CCRapportManager *)self didDiscoverDevice:*(void *)(*((void *)&v14 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  v10 = __biome_log_for_category();
  id v11 = v10;
  if (v4)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CCRapportManager handleDiscoveryClientActivationOrError:]();
    }
    unint64_t v12 = 0;
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v13 = 0;
    unint64_t v12 = 2;
    _os_log_impl(&dword_249B69000, v11, OS_LOG_TYPE_DEFAULT, "CCRapportManager: activated successfully", v13, 2u);
  }
  else
  {
    unint64_t v12 = 2;
  }

  self->_unint64_t discoveryClientState = v12;
}

- (void)handleDiscoveryClientInvalidation
{
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_249B69000, v0, OS_LOG_TYPE_DEBUG, "CCRapportManager: invalidated", v1, 2u);
}

- (void)registerRequestID:(id)a3 requestHandler:(id)a4
{
  queue = self->_queue;
  id v7 = a4;
  id v10 = a3;
  dispatch_assert_queue_V2(queue);
  if (self->_sharedUse) {
    [(CCRapportManager *)self createSharedDiscoveryClientIfNotExists];
  }
  else {
    [(CCRapportManager *)self createDiscoveryClientIfNotExists];
  }
  uint64_t v8 = (void *)[v7 copy];
  uint64_t v9 = (void *)MEMORY[0x24C5B0C10]();
  [(NSMutableDictionary *)self->_registeredRequests setObject:v9 forKeyedSubscript:v10];

  [(RPCompanionLinkClient *)self->_discoveryClient registerRequestID:v10 options:0 handler:v7];
}

- (void)registerEventID:(id)a3 eventHandler:(id)a4
{
  id v6 = a3;
  queue = self->_queue;
  id v8 = a4;
  dispatch_assert_queue_V2(queue);
  uint64_t v9 = __biome_log_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[CCRapportManager registerEventID:eventHandler:]();
  }

  if (self->_sharedUse) {
    [(CCRapportManager *)self createSharedDiscoveryClientIfNotExists];
  }
  else {
    [(CCRapportManager *)self createDiscoveryClientIfNotExists];
  }
  [(RPCompanionLinkClient *)self->_discoveryClient registerEventID:v6 options:0 handler:v8];
}

- (void)start
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(CCRapportManager *)self activateDiscoveryLinkWithCompletion:&__block_literal_global];
}

- (id)discoveredDevices
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  devices = self->_devices;
  return (id)[(NSMutableDictionary *)devices allValues];
}

- (id)localDevice
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = [CCRapportDevice alloc];
  id v4 = [(RPCompanionLinkClient *)self->_discoveryClient localDevice];
  id v5 = [(CCRapportDevice *)v3 initWithRPCompanionLinkDevice:v4];

  return v5;
}

- (void)registerLocalDeviceUpdatedHandler:(id)a3
{
}

- (id)deviceWithIdentifier:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CCRapportManager *)self localDevice];
  id v6 = [v5 rapportIdentifier];
  int v7 = [v6 isEqualToString:v4];

  if (v7)
  {
    id v8 = [(CCRapportManager *)self localDevice];
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v9 = [(NSMutableDictionary *)self->_devices allValues];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          long long v15 = [v14 rapportIdentifier];
          char v16 = [v15 isEqualToString:v4];

          if (v16)
          {
            id v8 = v14;

            goto LABEL_13;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    id v8 = 0;
  }
LABEL_13:

  return v8;
}

- (void)stop
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = __biome_log_for_category();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_249B69000, v3, OS_LOG_TYPE_INFO, "CCRapportManager: stop", buf, 2u);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v4 = [(NSMutableDictionary *)self->_devices allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v25 objects:v32 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v26;
    *(void *)&long long v6 = 138412290;
    long long v20 = v6;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v25 + 1) + 8 * v9);
        uint64_t v11 = __biome_log_for_category();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          uint64_t v12 = [v10 shortenedRapportIdentifier];
          *(_DWORD *)buf = v20;
          v31 = v12;
          _os_log_impl(&dword_249B69000, v11, OS_LOG_TYPE_INFO, "CCRapportDevice[%@]: tearing down client", buf, 0xCu);
        }
        id v13 = [v10 client];
        [v13 setInvalidationHandler:0];

        long long v14 = [v10 client];
        [v14 invalidate];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v4 countByEnumeratingWithState:&v25 objects:v32 count:16];
    }
    while (v7);
  }

  [(NSMutableDictionary *)self->_devices removeAllObjects];
  [(NSMutableDictionary *)self->_unsupportedDevices removeAllObjects];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v15 = self->_registeredRequests;
  uint64_t v16 = [(NSMutableDictionary *)v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v22;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(v15);
        }
        -[RPCompanionLinkClient deregisterRequestID:](self->_discoveryClient, "deregisterRequestID:", *(void *)(*((void *)&v21 + 1) + 8 * v19++), v20, (void)v21);
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableDictionary *)v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v17);
  }

  [(NSMutableDictionary *)self->_registeredRequests removeAllObjects];
  [(RPCompanionLinkClient *)self->_discoveryClient invalidate];
}

- (void)sendRequest:(id)a3 request:(id)a4 toDevice:(id)a5 responseHandler:(id)a6
{
}

- (void)sendRequest:(id)a3 request:(id)a4 device:(id)a5 options:(id)a6 responseHandler:(id)a7
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v17 = __biome_log_for_category();
  uint64_t v18 = v17;
  if (v14)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[CCRapportManager sendRequest:request:device:options:responseHandler:](v14, v18);
    }

    if (v13) {
      uint64_t v19 = v13;
    }
    else {
      uint64_t v19 = (void *)MEMORY[0x263EFFA78];
    }
    uint64_t v18 = [v19 mutableCopy];
    [v18 setObject:v12 forKeyedSubscript:@"~~REQUEST_ID~~"];
    long long v20 = (void *)[v16 copy];
    [v18 setObject:v20 forKeyedSubscript:@"~~RESPONSE_HANDLER~~"];

    [v18 setObject:v15 forKeyedSubscript:@"~~OPTIONS~~"];
    long long v21 = [v14 requestQueue];
    [v21 addObject:v18];

    long long v22 = __biome_log_for_category();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      long long v23 = [v14 requestQueue];
      *(_DWORD *)buf = 138412546;
      id v51 = v14;
      __int16 v52 = 2112;
      v53 = v23;
      _os_log_impl(&dword_249B69000, v22, OS_LOG_TYPE_DEFAULT, "device %@ requestQueue %@", buf, 0x16u);
    }
    long long v24 = [v14 client];
    BOOL v25 = v24 == 0;

    if (v25)
    {
      objc_initWeak(&location, v14);
      objc_initWeak(&from, self);
      dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
      long long v26 = __biome_log_for_category();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        long long v27 = [v14 shortenedRapportIdentifier];
        -[CCRapportManager sendRequest:request:device:options:responseHandler:](v27, (uint64_t)buf, v26);
      }

      id v28 = objc_alloc_init(MEMORY[0x263F62B70]);
      [v14 setClient:v28];

      v29 = [v14 device];
      v30 = [v14 client];
      [v30 setDestinationDevice:v29];

      v31 = [v14 device];
      uint64_t v32 = [v31 statusFlags];

      if ((v32 & 0x20000000000) != 0)
      {
        uint64_t v33 = [v14 client];
        [v33 setControlFlags:0x2000000000000];
      }
      v34 = [v14 client];
      [v34 setServiceType:@"com.apple.biomesyncd.cascade.rapport"];

      queue = self->_queue;
      v36 = [v14 client];
      [v36 setDispatchQueue:queue];

      v45[0] = MEMORY[0x263EF8330];
      v45[1] = 3221225472;
      v45[2] = __71__CCRapportManager_sendRequest_request_device_options_responseHandler___block_invoke;
      v45[3] = &unk_265277DA8;
      objc_copyWeak(&v46, &from);
      objc_copyWeak(&v47, &location);
      v37 = [v14 client];
      [v37 setInterruptionHandler:v45];

      v43[0] = MEMORY[0x263EF8330];
      v43[1] = 3221225472;
      v43[2] = __71__CCRapportManager_sendRequest_request_device_options_responseHandler___block_invoke_2;
      v43[3] = &unk_265277CE8;
      objc_copyWeak(&v44, &location);
      v38 = [v14 client];
      [v38 setInvalidationHandler:v43];

      v39 = [v14 client];
      v40[0] = MEMORY[0x263EF8330];
      v40[1] = 3221225472;
      v40[2] = __71__CCRapportManager_sendRequest_request_device_options_responseHandler___block_invoke_3;
      v40[3] = &unk_265277DD0;
      objc_copyWeak(&v41, &from);
      objc_copyWeak(&v42, &location);
      [v39 activateWithCompletion:v40];

      objc_destroyWeak(&v42);
      objc_destroyWeak(&v41);
      objc_destroyWeak(&v44);
      objc_destroyWeak(&v47);
      objc_destroyWeak(&v46);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
    else
    {
      [(CCRapportManager *)self sendNextRequestToDevice:v14];
    }
  }
  else if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
  {
    -[CCRapportManager sendRequest:request:device:options:responseHandler:]();
  }
}

void __71__CCRapportManager_sendRequest_request_device_options_responseHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained handleInterruptionForDevice:v2];
}

void __71__CCRapportManager_sendRequest_request_device_options_responseHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidateClientWithError:0];
}

void __71__CCRapportManager_sendRequest_request_device_options_responseHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained handleActivationForDevice:v5 error:v4];
}

- (void)sendEvent:(id)a3 event:(id)a4 toDevice:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v14 = __biome_log_for_category();
  id v15 = v14;
  if (v12)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[CCRapportManager sendEvent:event:toDevice:completionHandler:](v12, v15);
    }

    if ([v12 linkState])
    {
      id v16 = [v12 client];
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __63__CCRapportManager_sendEvent_event_toDevice_completionHandler___block_invoke_2;
      v18[3] = &unk_265277DF8;
      id v19 = v12;
      long long v20 = self;
      id v21 = v10;
      id v22 = v11;
      id v23 = v13;
      [v16 sendEventID:v21 event:v22 options:0 completion:v18];

      uint64_t v17 = v19;
    }
    else
    {
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __63__CCRapportManager_sendEvent_event_toDevice_completionHandler___block_invoke;
      v24[3] = &unk_265277DF8;
      v24[4] = self;
      id v25 = v10;
      id v26 = v11;
      id v27 = v12;
      id v28 = v13;
      [(CCRapportManager *)self activateDirectLinkToDevice:v27 completionHandler:v24];

      uint64_t v17 = v25;
    }
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[CCRapportManager sendRequest:request:device:options:responseHandler:]();
    }
  }
}

uint64_t __63__CCRapportManager_sendEvent_event_toDevice_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendEvent:*(void *)(a1 + 40) event:*(void *)(a1 + 48) toDevice:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 64)];
}

void __63__CCRapportManager_sendEvent_event_toDevice_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 code] == -71148)
  {
    id v3 = [v5 domain];
    int v4 = [v3 isEqualToString:*MEMORY[0x263F62C18]];

    if (v4)
    {
      [*(id *)(a1 + 32) invalidateClientWithError:v5];
      [*(id *)(a1 + 40) sendEvent:*(void *)(a1 + 48) event:*(void *)(a1 + 56) toDevice:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 64)];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (void)activateDirectLinkToDevice:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v8 = [v6 client];

  if (!v8)
  {
    uint64_t v9 = __biome_log_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[CCRapportManager activateDirectLinkToDevice:completionHandler:](v6, v9);
    }

    id v10 = objc_alloc_init(MEMORY[0x263F62B70]);
    [v6 setClient:v10];

    id v11 = [v6 device];
    id v12 = [v6 client];
    [v12 setDestinationDevice:v11];

    id v13 = [v6 client];
    [v13 setServiceType:@"com.apple.biomesyncd.cascade.rapport"];

    queue = self->_queue;
    id v15 = [v6 client];
    [v15 setDispatchQueue:queue];

    objc_initWeak(&location, v6);
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __65__CCRapportManager_activateDirectLinkToDevice_completionHandler___block_invoke;
    v26[3] = &unk_265277E20;
    v26[4] = self;
    objc_copyWeak(&v27, &location);
    id v16 = [v6 client];
    [v16 setInterruptionHandler:v26];

    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __65__CCRapportManager_activateDirectLinkToDevice_completionHandler___block_invoke_2;
    v24[3] = &unk_265277CE8;
    objc_copyWeak(&v25, &location);
    uint64_t v17 = [v6 client];
    [v17 setInvalidationHandler:v24];

    objc_destroyWeak(&v25);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  [v6 setLinkState:1];
  uint64_t v18 = [v6 client];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __65__CCRapportManager_activateDirectLinkToDevice_completionHandler___block_invoke_3;
  v21[3] = &unk_265277E48;
  id v22 = v6;
  id v23 = v7;
  id v19 = v7;
  id v20 = v6;
  [v18 activateWithCompletion:v21];
}

void __65__CCRapportManager_activateDirectLinkToDevice_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [v1 handleInterruptionForDevice:WeakRetained];
}

void __65__CCRapportManager_activateDirectLinkToDevice_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidateClientWithError:0];
}

void __65__CCRapportManager_activateDirectLinkToDevice_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 setLinkState:2];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)invalidateDirectLinkToDevice:(id)a3
{
}

- (void)handleActivationForDevice:(id)a3 error:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (__CFString *)a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v8 = __biome_log_for_category();
  uint64_t v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [v6 shortenedRapportIdentifier];
      id v11 = (void *)v10;
      id v12 = @"failed with error, ";
      if (!v7) {
        id v12 = @"completed";
      }
      *(_DWORD *)id v22 = 138412802;
      *(void *)&v22[4] = v10;
      *(_WORD *)&v22[12] = 2112;
      *(void *)&v22[14] = v12;
      if (v7) {
        id v13 = v7;
      }
      else {
        id v13 = &stru_26FDBAF88;
      }
      *(_WORD *)&v22[22] = 2112;
      id v23 = v13;
      _os_log_impl(&dword_249B69000, v9, OS_LOG_TYPE_DEFAULT, "CCRapportDevice[%@]: activation %@%@", v22, 0x20u);
    }
    if (v7)
    {
      if ([(__CFString *)v7 code] == -71165)
      {
        id v14 = [(__CFString *)v7 domain];
        int v15 = [v14 isEqualToString:*MEMORY[0x263F62C18]];

        if (v15)
        {
          unsupportedDevices = self->_unsupportedDevices;
          uint64_t v17 = [v6 rapportIdentifier];
          [(NSMutableDictionary *)unsupportedDevices setObject:v6 forKeyedSubscript:v17];

          devices = self->_devices;
          id v19 = [v6 rapportIdentifier];
          [(NSMutableDictionary *)devices setObject:0 forKeyedSubscript:v19];

          id v20 = __biome_log_for_category();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            id v21 = [v6 shortenedRapportIdentifier];
            *(_DWORD *)id v22 = 138412290;
            *(void *)&v22[4] = v21;
            _os_log_impl(&dword_249B69000, v20, OS_LOG_TYPE_DEFAULT, "CCRapportDevice[%@]: determined to not support service com.apple.biomesyncd.cascade.rapport", v22, 0xCu);
          }
        }
      }
      objc_msgSend(v6, "invalidateClientWithError:", v7, *(_OWORD *)v22, *(void *)&v22[16]);
    }
    else
    {
      [(CCRapportManager *)self sendNextRequestToDevice:v6];
    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CCRapportManager handleActivationForDevice:error:]();
    }
  }
}

- (void)handleInterruptionForDevice:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = __biome_log_for_category();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [v4 shortenedRapportIdentifier];
      int v8 = 138412290;
      uint64_t v9 = v7;
      _os_log_impl(&dword_249B69000, v6, OS_LOG_TYPE_DEFAULT, "CCRapportDevice[%@]: interrupted", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    -[CCRapportManager handleInterruptionForDevice:]();
  }
}

- (void)sendNextRequestToDevice:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    id v5 = [v4 requestQueue];
    id v6 = [v5 popFirstObject];

    if (v6)
    {
      id v7 = [v6 objectForKeyedSubscript:@"~~REQUEST_ID~~"];
      int v8 = [v6 objectForKeyedSubscript:@"~~OPTIONS~~"];
      uint64_t v9 = (void *)[v8 mutableCopy];
      uint64_t v10 = v9;
      if (v9) {
        id v11 = v9;
      }
      else {
        id v11 = (id)objc_opt_new();
      }
      id v12 = v11;

      uint64_t v13 = [v6 objectForKeyedSubscript:@"~~RESPONSE_HANDLER~~"];
      id v14 = (void *)v13;
      if (v7 && v13)
      {
        [v6 setObject:0 forKeyedSubscript:@"~~REQUEST_ID~~"];
        [v6 setObject:0 forKeyedSubscript:@"~~OPTIONS~~"];
        [v6 setObject:0 forKeyedSubscript:@"~~RESPONSE_HANDLER~~"];
        int v15 = __biome_log_for_category();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          id v16 = [v4 shortenedRapportIdentifier];
          *(_DWORD *)buf = 138412802;
          id v26 = v16;
          __int16 v27 = 2112;
          id v28 = v6;
          __int16 v29 = 2112;
          v30 = v12;
          _os_log_impl(&dword_249B69000, v15, OS_LOG_TYPE_DEFAULT, "CCRapportDevice[%@]: being sent request %@ with options %@", buf, 0x20u);
        }
        objc_initWeak((id *)buf, v4);
        uint64_t v17 = NSNumber;
        uint64_t v18 = [v4 requestQueue];
        id v19 = objc_msgSend(v17, "numberWithInt:", objc_msgSend(v18, "count") != 0);
        [v12 setObject:v19 forKeyedSubscript:*MEMORY[0x263F62C48]];

        id v20 = [v4 client];
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __44__CCRapportManager_sendNextRequestToDevice___block_invoke;
        v22[3] = &unk_265277E70;
        id v23 = v14;
        objc_copyWeak(&v24, (id *)buf);
        v22[4] = self;
        [v20 sendRequestID:v7 request:v6 options:v12 responseHandler:v22];

        objc_destroyWeak(&v24);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        id v21 = __biome_log_for_category();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
          [(CCRapportManager *)v4 sendNextRequestToDevice:v21];
        }

        [(CCRapportManager *)self sendNextRequestToDevice:v4];
      }
    }
  }
  else
  {
    id v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[CCRapportManager sendNextRequestToDevice:]();
    }
  }
}

void __44__CCRapportManager_sendNextRequestToDevice___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v9 = a4;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if ([v9 code] == -71148
    && ([v9 domain],
        id v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 isEqualToString:*MEMORY[0x263F62C18]],
        v5,
        v6))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained invalidateClientWithError:v9];
  }
  else
  {
    int v8 = *(void **)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [v8 sendNextRequestToDevice:WeakRetained];
  }
}

- (void)finishedSendingRequestsToDevice:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = __biome_log_for_category();
  int v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [v4 shortenedRapportIdentifier];
      int v8 = 138412290;
      id v9 = v7;
      _os_log_impl(&dword_249B69000, v6, OS_LOG_TYPE_DEFAULT, "CCRapportDevice[%@]: request queue empty, invalidating client", (uint8_t *)&v8, 0xCu);
    }
    [v4 invalidateClientWithError:0];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[CCRapportManager finishedSendingRequestsToDevice:]();
    }
  }
}

- (void)device:(id)a3 didChange:(unsigned int)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  devices = self->_devices;
  int v8 = objc_msgSend(v6, "CC_companionLinkDeviceIdentifier");
  id v9 = [(NSMutableDictionary *)devices objectForKeyedSubscript:v8];

  if (v9)
  {
    while (1)
    {
      signed int v10 = a4 & -a4;
      if (v10 <= 31) {
        break;
      }
      if (v10 <= 127)
      {
        if (v10 == 32)
        {
          id v11 = __biome_log_for_category();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
            -[CCRapportManager device:didChange:].cold.4((uint64_t)v24, (uint64_t)v9);
          }
        }
        else
        {
          if (v10 != 64)
          {
LABEL_19:
            id v11 = __biome_log_for_category();
            if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_39;
            }
            id v12 = [v9 shortenedRapportIdentifier];
            *(_DWORD *)buf = 138412546;
            __int16 v27 = v12;
            __int16 v28 = 1024;
            LODWORD(v29) = a4 & -a4;
            id v14 = v11;
            int v15 = "CCRapportDevice[%@]: got unexpected change flag: RPDeviceChangeFlags(%x)";
            uint32_t v16 = 18;
            goto LABEL_55;
          }
          id v11 = __biome_log_for_category();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
            -[CCRapportManager device:didChange:].cold.5((uint64_t)v23, (uint64_t)v9);
          }
        }
      }
      else
      {
        switch(v10)
        {
          case 128:
            id v11 = __biome_log_for_category();
            if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
              break;
            }
            id v12 = [v9 shortenedRapportIdentifier];
            int v19 = [v6 proximity];
            if (v19 > 19)
            {
              if (v19 == 20)
              {
                id v20 = "Near";
              }
              else
              {
                if (v19 != 30) {
                  goto LABEL_52;
                }
                id v20 = "Far";
              }
            }
            else if (v19)
            {
              if (v19 == 10)
              {
                id v20 = "Immed";
                goto LABEL_53;
              }
LABEL_52:
              id v20 = "?";
            }
            else
            {
              id v20 = "Unknown";
            }
LABEL_53:
            *(_DWORD *)buf = 138412546;
            __int16 v27 = v12;
            __int16 v28 = 2080;
            __int16 v29 = v20;
            id v14 = v11;
            int v15 = "CCRapportDevice[%@]: proximity changed: %s";
LABEL_54:
            uint32_t v16 = 22;
LABEL_55:
            _os_log_debug_impl(&dword_249B69000, v14, OS_LOG_TYPE_DEBUG, v15, buf, v16);
LABEL_56:

            break;
          case 256:
            id v11 = __biome_log_for_category();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
              -[CCRapportManager device:didChange:].cold.6((uint64_t)v22, (uint64_t)v9);
            }
            break;
          case 512:
            id v11 = __biome_log_for_category();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
              -[CCRapportManager device:didChange:].cold.7((uint64_t)v21, (uint64_t)v9);
            }
            break;
          default:
            goto LABEL_19;
        }
      }
LABEL_39:

      a4 ^= v10;
    }
    switch(v10)
    {
      case 0:
        break;
      case 1:
        id v11 = __biome_log_for_category();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          -[CCRapportManager device:didChange:]((uint64_t)v31, (uint64_t)v9);
        }
        goto LABEL_39;
      case 2:
        id v11 = __biome_log_for_category();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          -[CCRapportManager device:didChange:]((uint64_t)v30, (uint64_t)v9);
        }
        goto LABEL_39;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_19;
      case 4:
        id v11 = __biome_log_for_category();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_39;
        }
        id v12 = [v9 shortenedRapportIdentifier];
        int v17 = [v6 proximity];
        if (v17 > 19)
        {
          if (v17 == 20)
          {
            uint64_t v18 = "Near";
            goto LABEL_49;
          }
          if (v17 == 30)
          {
            uint64_t v18 = "Far";
            goto LABEL_49;
          }
        }
        else
        {
          if (!v17)
          {
            uint64_t v18 = "Unknown";
            goto LABEL_49;
          }
          if (v17 == 10)
          {
            uint64_t v18 = "Immed";
LABEL_49:
            *(_DWORD *)buf = 138412546;
            __int16 v27 = v12;
            __int16 v28 = 2080;
            __int16 v29 = v18;
            id v14 = v11;
            int v15 = "CCRapportDevice[%@]: distance changed: %s";
            goto LABEL_54;
          }
        }
        uint64_t v18 = "?";
        goto LABEL_49;
      case 8:
        id v11 = __biome_log_for_category();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          -[CCRapportManager device:didChange:]((uint64_t)v25, (uint64_t)v9);
        }
        goto LABEL_39;
      default:
        if (v10 != 16) {
          goto LABEL_19;
        }
        id v11 = __biome_log_for_category();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_39;
        }
        id v12 = [v9 shortenedRapportIdentifier];
        uint64_t v13 = [v9 name];
        *(_DWORD *)buf = 138412546;
        __int16 v27 = v12;
        __int16 v28 = 2112;
        __int16 v29 = v13;
        _os_log_debug_impl(&dword_249B69000, v11, OS_LOG_TYPE_DEBUG, "CCRapportDevice[%@]: name changed: %@", buf, 0x16u);

        goto LABEL_56;
    }
  }
}

- (void)didDiscoverDevice:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = objc_msgSend(v4, "CC_companionLinkDeviceIdentifier");

  if (v5)
  {
    id v6 = [v4 model];

    if (v6)
    {
      devices = self->_devices;
      int v8 = objc_msgSend(v4, "CC_companionLinkDeviceIdentifier");
      uint64_t v9 = [(NSMutableDictionary *)devices objectForKeyedSubscript:v8];
      if (v9)
      {
        signed int v10 = (CCRapportDevice *)v9;
      }
      else
      {
        unsupportedDevices = self->_unsupportedDevices;
        id v12 = objc_msgSend(v4, "CC_companionLinkDeviceIdentifier");
        signed int v10 = [(NSMutableDictionary *)unsupportedDevices objectForKeyedSubscript:v12];

        if (!v10)
        {
          signed int v10 = [[CCRapportDevice alloc] initWithRPCompanionLinkDevice:v4];
          id v14 = __biome_log_for_category();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
            -[CCRapportManager didDiscoverDevice:]();
          }

          uint64_t v15 = [(CCRapportDevice *)v10 serviceTypes];
          if (v15
            && (uint32_t v16 = (void *)v15,
                [(CCRapportDevice *)v10 serviceTypes],
                int v17 = objc_claimAutoreleasedReturnValue(),
                char v18 = [v17 containsObject:@"com.apple.biomesyncd.cascade.rapport"],
                v17,
                v16,
                (v18 & 1) == 0))
          {
            __int16 v28 = __biome_log_for_category();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v29 = [(CCRapportDevice *)v10 shortenedRapportIdentifier];
              int v31 = 138412290;
              uint64_t v32 = v29;
              _os_log_impl(&dword_249B69000, v28, OS_LOG_TYPE_DEFAULT, "CCRapportDevice[%@]: ignoring device not listing service from serviceTypescom.apple.biomesyncd.cascade.rapport", (uint8_t *)&v31, 0xCu);
            }
            v30 = self->_unsupportedDevices;
            uint64_t v13 = [(CCRapportDevice *)v10 rapportIdentifier];
            [(NSMutableDictionary *)v30 setObject:v10 forKeyedSubscript:v13];
          }
          else
          {
            uint64_t v13 = [(CCRapportManager *)self delegate];
            int v19 = [v13 rapportManager:self isDeviceSupported:v10];
            id v20 = __biome_log_for_category();
            BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
            if (v19)
            {
              if (v21)
              {
                id v22 = [(CCRapportDevice *)v10 shortenedRapportIdentifier];
                int v31 = 138412290;
                uint64_t v32 = v22;
                _os_log_impl(&dword_249B69000, v20, OS_LOG_TYPE_DEFAULT, "CCRapportDevice[%@]: discovered", (uint8_t *)&v31, 0xCu);
              }
              id v23 = self->_devices;
              id v24 = [(CCRapportDevice *)v10 rapportIdentifier];
              [(NSMutableDictionary *)v23 setObject:v10 forKeyedSubscript:v24];

              [v13 rapportManager:self didDiscoverCCRapportDevice:v10];
            }
            else
            {
              if (v21)
              {
                id v25 = [(CCRapportDevice *)v10 shortenedRapportIdentifier];
                int v31 = 138412290;
                uint64_t v32 = v25;
                _os_log_impl(&dword_249B69000, v20, OS_LOG_TYPE_DEFAULT, "CCRapportDevice[%@]: ignoring unsupported device", (uint8_t *)&v31, 0xCu);
              }
              id v26 = self->_unsupportedDevices;
              __int16 v27 = [(CCRapportDevice *)v10 rapportIdentifier];
              [(NSMutableDictionary *)v26 setObject:v10 forKeyedSubscript:v27];
            }
          }
          goto LABEL_12;
        }
      }
      uint64_t v13 = __biome_log_for_category();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[CCRapportManager didDiscoverDevice:].cold.4();
      }
LABEL_12:

      goto LABEL_13;
    }
    __biome_log_for_category();
    signed int v10 = (CCRapportDevice *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_ERROR)) {
      -[CCRapportManager didDiscoverDevice:]();
    }
  }
  else
  {
    __biome_log_for_category();
    signed int v10 = (CCRapportDevice *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_ERROR)) {
      -[CCRapportManager didDiscoverDevice:]();
    }
  }
LABEL_13:
}

- (void)didLoseDevice:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  devices = self->_devices;
  id v7 = objc_msgSend(v5, "CC_companionLinkDeviceIdentifier");

  int v8 = [(NSMutableDictionary *)devices objectForKeyedSubscript:v7];

  if (v8)
  {
    uint64_t v9 = __biome_log_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      signed int v10 = [v8 shortenedRapportIdentifier];
      int v15 = 138412290;
      uint32_t v16 = v10;
      _os_log_impl(&dword_249B69000, v9, OS_LOG_TYPE_DEFAULT, "CCRapportDevice[%@]: lost", (uint8_t *)&v15, 0xCu);
    }
    id v11 = [(CCRapportManager *)self delegate];
    [v11 rapportManager:self didLoseNearbyCCRapportDevice:v8];

    id v12 = [MEMORY[0x263F087E8] errorWithDomain:@"CCRapportErrorDomain" code:7 userInfo:0];
    [v8 invalidateClientWithError:v12];

    uint64_t v13 = self->_devices;
    id v14 = [v8 rapportIdentifier];
    [(NSMutableDictionary *)v13 setObject:0 forKeyedSubscript:v14];
  }
}

- (void)localDeviceUpdated:(id)a3
{
  id v4 = a3;
  id v6 = [[CCRapportDevice alloc] initWithRPCompanionLinkDevice:v4];

  id v5 = [(CCRapportManager *)self delegate];
  [v5 rapportManager:self localDeviceUpdated:v6];
}

- (CCRapportManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CCRapportManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableDictionary)registeredRequests
{
  return self->_registeredRequests;
}

- (void)setRegisteredRequests:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_registeredRequests, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sigtermSource, 0);
  objc_storeStrong((id *)&self->_unsupportedDevices, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_discoveryClient, 0);
}

- (void)initWithQueue:forSharedUse:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_249B69000, v0, v1, "CCRapportManager: shared-use only supported internally", v2, v3, v4, v5, v6);
}

- (void)createDiscoveryClientWithControlFlags:.cold.1()
{
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_249B69000, v0, OS_LOG_TYPE_DEBUG, "CCRapportManager: shared discovery client already exists", v1, 2u);
}

- (void)activateDiscoveryClientWithCompletion:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 8);
  int v4 = 138412290;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_5(&dword_249B69000, a2, a3, "CCRapportManager: already activated %@", (uint8_t *)&v4);
}

- (void)activateDiscoveryClientWithCompletion:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 8);
  int v4 = 138412290;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_5(&dword_249B69000, a2, a3, "CCRapportManager: already activating %@", (uint8_t *)&v4);
}

- (void)handleDiscoveryClientActivationOrError:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7(&dword_249B69000, v0, v1, "CCRapportManager: failed to activate with error: %@", v2, v3, v4, v5, v6);
}

- (void)registerEventID:eventHandler:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_249B69000, v0, v1, "CCRapportManager: registerEventID %@", v2);
}

- (void)sendRequest:request:device:options:responseHandler:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_249B69000, v0, v1, "sendRequest:request:device:options:responseHandler: passed nil device", v2, v3, v4, v5, v6);
}

- (void)sendRequest:(NSObject *)a3 request:device:options:responseHandler:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_5(&dword_249B69000, a3, (uint64_t)a3, "CCRapportDevice[%@]: activating client", (uint8_t *)a2);
}

- (void)sendRequest:(void *)a1 request:(NSObject *)a2 device:options:responseHandler:.cold.3(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 shortenedRapportIdentifier];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_249B69000, a2, v4, "CCRapportDevice[%@]: enqueueing request", v5);
}

- (void)sendEvent:(void *)a1 event:(NSObject *)a2 toDevice:completionHandler:.cold.2(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = [a1 linkState];
  _os_log_debug_impl(&dword_249B69000, a2, OS_LOG_TYPE_DEBUG, "device: %@ linkState %lu", (uint8_t *)&v3, 0x16u);
}

- (void)activateDirectLinkToDevice:(void *)a1 completionHandler:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v3 = [a1 shortenedRapportIdentifier];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_249B69000, a2, v4, "CCRapportDevice[%@]: activating client", v5);
}

- (void)handleActivationForDevice:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_249B69000, v0, OS_LOG_TYPE_ERROR, "handleActivationForDevice:error: passed nil device", v1, 2u);
}

- (void)handleInterruptionForDevice:.cold.1()
{
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_249B69000, v0, OS_LOG_TYPE_ERROR, "handleInterruptionForDevice: passed nil device", v1, 2u);
}

- (void)sendNextRequestToDevice:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_249B69000, v0, v1, "sendNextRequestToDevice: passed nil device", v2, v3, v4, v5, v6);
}

- (void)sendNextRequestToDevice:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a1 shortenedRapportIdentifier];
  OUTLINED_FUNCTION_8();
  uint64_t v7 = a2;
  _os_log_fault_impl(&dword_249B69000, a3, OS_LOG_TYPE_FAULT, "CCRapportDevice[%@]: expected request id and response handler in %@", v6, 0x16u);
}

- (void)finishedSendingRequestsToDevice:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_249B69000, v0, v1, "finishedSendingRequestsToDevice: passed nil device", v2, v3, v4, v5, v6);
}

- (void)device:(uint64_t)a1 didChange:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_1(a1, a2), "shortenedRapportIdentifier");
  OUTLINED_FUNCTION_6((uint64_t)v2, 5.7779e-34);
  OUTLINED_FUNCTION_0(&dword_249B69000, v3, v4, "CCRapportDevice[%@]: advertisement data changed");
}

- (void)device:(uint64_t)a1 didChange:(uint64_t)a2 .cold.2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_1(a1, a2), "shortenedRapportIdentifier");
  OUTLINED_FUNCTION_6((uint64_t)v2, 5.7779e-34);
  OUTLINED_FUNCTION_0(&dword_249B69000, v3, v4, "CCRapportDevice[%@]: pairing flags/attributes changed");
}

- (void)device:(uint64_t)a1 didChange:(uint64_t)a2 .cold.3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_1(a1, a2), "shortenedRapportIdentifier");
  OUTLINED_FUNCTION_6((uint64_t)v2, 5.7779e-34);
  OUTLINED_FUNCTION_0(&dword_249B69000, v3, v4, "CCRapportDevice[%@]: distance wifi information element changed");
}

- (void)device:(uint64_t)a1 didChange:(uint64_t)a2 .cold.4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_1(a1, a2), "shortenedRapportIdentifier");
  OUTLINED_FUNCTION_6((uint64_t)v2, 5.7779e-34);
  OUTLINED_FUNCTION_0(&dword_249B69000, v3, v4, "CCRapportDevice[%@]: RSSI changed");
}

- (void)device:(uint64_t)a1 didChange:(uint64_t)a2 .cold.5(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_1(a1, a2), "shortenedRapportIdentifier");
  OUTLINED_FUNCTION_6((uint64_t)v2, 5.7779e-34);
  OUTLINED_FUNCTION_0(&dword_249B69000, v3, v4, "CCRapportDevice[%@]: SSID changed");
}

- (void)device:(uint64_t)a1 didChange:(uint64_t)a2 .cold.6(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_1(a1, a2), "shortenedRapportIdentifier");
  OUTLINED_FUNCTION_6((uint64_t)v2, 5.7779e-34);
  OUTLINED_FUNCTION_0(&dword_249B69000, v3, v4, "CCRapportDevice[%@]: distance/angle/something changed");
}

- (void)device:(uint64_t)a1 didChange:(uint64_t)a2 .cold.7(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_1(a1, a2), "shortenedRapportIdentifier");
  OUTLINED_FUNCTION_6((uint64_t)v2, 5.7779e-34);
  OUTLINED_FUNCTION_0(&dword_249B69000, v3, v4, "CCRapportDevice[%@]: no transports available; expect a lost callback");
}

- (void)didDiscoverDevice:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7(&dword_249B69000, v0, v1, "CCRapportManager: skipping RPCompanionLinkDevice missing identifier: %@", v2, v3, v4, v5, v6);
}

- (void)didDiscoverDevice:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7(&dword_249B69000, v0, v1, "CCRapportManager: skipping RPCompanionLinkDevice missing model: %@", v2, v3, v4, v5, v6);
}

- (void)didDiscoverDevice:.cold.3()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_249B69000, v0, v1, "%@", v2);
}

- (void)didDiscoverDevice:.cold.4()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_8();
  uint64_t v3 = v0;
  _os_log_debug_impl(&dword_249B69000, v1, OS_LOG_TYPE_DEBUG, "CCRapportManager: already discovered device, %@ as %@", v2, 0x16u);
}

@end