@interface COService
+ (BOOL)_isAllowedClient:(id)a3;
- (BOOL)_applicableToCluster:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (COCoordinationServiceClientSet)clients;
- (COService)initWithListenerProvider:(id)a3 addOnProvider:(id)a4 delegate:(id)a5;
- (COServiceAddOnProvider)addOnProvider;
- (COServiceDelegate)delegate;
- (COServiceListenerProvider)listenerProvider;
- (NSDictionary)addOns;
- (NSDictionary)assertions;
- (NSXPCListener)listener;
- (OS_dispatch_queue)dispatchQueue;
- (id)_addOnForCluster:(id)a3;
- (id)_clustersForAddOn:(id)a3;
- (id)_newClientForConnection:(id)a3;
- (id)_uniqueAddOns;
- (id)clientForConnection:(id)a3;
- (id)currentClient;
- (void)_addMesh:(id)a3 forClusters:(id)a4;
- (void)_addOnAdded:(id)a3;
- (void)_addOnForCluster:(id)a3 completion:(id)a4;
- (void)_addOnRemoved:(id)a3;
- (void)_clientLost:(id)a3;
- (void)_configureServiceInterfacesOnConnection:(id)a3;
- (void)_releaseAssertionForCluster:(id)a3;
- (void)_removeMeshForClusters:(id)a3;
- (void)_serviceReady;
- (void)_takeAssertionForCluster:(id)a3;
- (void)joinClusters:(id)a3 usingMeshController:(id)a4 withClusterIdentifier:(id)a5 completion:(id)a6;
- (void)leaveClusters:(id)a3 withClusterIdentifier:(id)a4 completion:(id)a5;
- (void)setAddOns:(id)a3;
- (void)setAssertions:(id)a3;
- (void)setClients:(id)a3;
@end

@implementation COService

- (COService)initWithListenerProvider:(id)a3 addOnProvider:(id)a4 delegate:(id)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v29.receiver = self;
  v29.super_class = (Class)COService;
  v12 = [(COService *)&v29 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_listenerProvider, a3);
    objc_storeStrong((id *)&v13->_addOnProvider, a4);
    objc_storeWeak((id *)&v13->_delegate, v11);
    v14 = objc_alloc_init(COCoordinationServiceClientSet);
    clients = v13->_clients;
    v13->_clients = v14;

    v16 = (NSDictionary *)objc_alloc_init(NSDictionary);
    assertions = v13->_assertions;
    v13->_assertions = v16;

    v18 = (NSDictionary *)objc_alloc_init(NSDictionary);
    addOns = v13->_addOns;
    v13->_addOns = v18;

    uint64_t v20 = [(COServiceListenerProvider *)v13->_listenerProvider dispatchQueue];
    dispatchQueue = v13->_dispatchQueue;
    v13->_dispatchQueue = (OS_dispatch_queue *)v20;

    uint64_t v22 = [(COServiceListenerProvider *)v13->_listenerProvider serviceListener];
    listener = v13->_listener;
    v13->_listener = (NSXPCListener *)v22;

    [(NSXPCListener *)v13->_listener _setQueue:v13->_dispatchQueue];
    [(NSXPCListener *)v13->_listener setDelegate:v13];
    v24 = COCoreLogForCategory(1);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = (objc_class *)objc_opt_class();
      v26 = NSStringFromClass(v25);
      v27 = v13->_listener;
      *(_DWORD *)buf = 134218498;
      v31 = v13;
      __int16 v32 = 2112;
      v33 = v26;
      __int16 v34 = 2112;
      v35 = v27;
      _os_log_impl(&dword_2217C1000, v24, OS_LOG_TYPE_DEFAULT, "%p <%@> created with listener %@", buf, 0x20u);
    }
  }

  return v13;
}

- (void)_serviceReady
{
}

+ (BOOL)_isAllowedClient:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__COService__isAllowedClient___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_isAllowedClient__once != -1) {
    dispatch_once(&_isAllowedClient__once, block);
  }
  if (v4) {
    [v4 auditToken];
  }
  memset(buf, 0, 32);
  v5 = 0;
  CPCopyBundleIdentifierAndTeamFromAuditToken();
  int v6 = [v4 processIdentifier];
  if (v6 == getpid())
  {
    v7 = [MEMORY[0x263F086E0] mainBundle];
    v5 = [v7 bundleIdentifier];

    if (!v5)
    {
      BOOL v8 = 1;
      goto LABEL_12;
    }
    objc_msgSend(v4, "co_SetClientBundleIdentifier:", v5);
    BOOL v8 = 1;
  }
  else
  {
    id v9 = COCoreLogForCategory(1);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = [v4 processIdentifier];
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = a1;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = 0;
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = v11;
      *(_WORD *)&buf[28] = 2112;
      *(void *)&buf[30] = _isAllowedClient__sAllowedClients;
      _os_log_error_impl(&dword_2217C1000, v9, OS_LOG_TYPE_ERROR, "%@ disallowed client %@ [%d] attempted to connect - allowed clients: %@", buf, 0x26u);
    }

    BOOL v8 = 0;
  }

LABEL_12:
  return v8;
}

void __30__COService__isAllowedClient___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"com.apple.coordinated", @"com.apple.willowd", @"com.apple.SoundBoard", @"com.apple.homehubd", @"com.apple.Coordination.cmdmesh", @"com.apple.nexusd", @"com.apple.homepodsettingsd", @"com.apple.HomePlatformSettingsUI.HPSUIViewService", @"com.apple.conductord", @"com.apple.Home", @"com.apple.homed", 0);
  v3 = (void *)_isAllowedClient__sAllowedClients;
  _isAllowedClient__sAllowedClients = v2;

  if ([MEMORY[0x263F33F80] isOpalEnabled])
  {
    uint64_t v4 = [(id)_isAllowedClient__sAllowedClients setByAddingObject:@"com.apple.opal"];
    v5 = (void *)_isAllowedClient__sAllowedClients;
    _isAllowedClient__sAllowedClients = v4;
  }
  int v6 = [MEMORY[0x263F08AB0] processInfo];
  v7 = [v6 arguments];

  uint64_t v8 = [v7 indexOfObject:@"--allowed"];
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = v8 + 1;
    if (v8 + 1 < (unint64_t)[v7 count])
    {
      id v10 = [v7 objectAtIndex:v9];
      int v11 = [v10 componentsSeparatedByString:@","];

      v12 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v13 = v11;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v24 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = [*(id *)(*((void *)&v23 + 1) + 8 * i) stringByTrimmingCharactersInSet:v12];
            if ([v18 length])
            {
              uint64_t v19 = [(id)_isAllowedClient__sAllowedClients setByAddingObject:v18];
              uint64_t v20 = (void *)_isAllowedClient__sAllowedClients;
              _isAllowedClient__sAllowedClients = v19;
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
        }
        while (v15);
      }
    }
  }
  v21 = COCoreLogForCategory(1);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218242;
    uint64_t v28 = v22;
    __int16 v29 = 2112;
    uint64_t v30 = _isAllowedClient__sAllowedClients;
    _os_log_impl(&dword_2217C1000, v21, OS_LOG_TYPE_DEFAULT, "%p allowing %@", buf, 0x16u);
  }
}

- (id)clientForConnection:(id)a3
{
  id v4 = a3;
  v5 = [(COService *)self clients];
  int v6 = [v5 serviceClientForXPCConnection:v4];

  return v6;
}

- (id)currentClient
{
  v3 = [MEMORY[0x263F08D68] currentConnection];
  id v4 = [(COService *)self clientForConnection:v3];

  return v4;
}

- (void)joinClusters:(id)a3 usingMeshController:(id)a4 withClusterIdentifier:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  v12 = [(COService *)self dispatchQueue];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __79__COService_joinClusters_usingMeshController_withClusterIdentifier_completion___block_invoke;
  v16[3] = &unk_2645CB4D0;
  v16[4] = self;
  id v17 = v10;
  id v18 = v9;
  id v19 = v11;
  id v13 = v11;
  id v14 = v9;
  id v15 = v10;
  dispatch_async(v12, v16);
}

uint64_t __79__COService_joinClusters_usingMeshController_withClusterIdentifier_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _addMesh:*(void *)(a1 + 40) forClusters:*(void *)(a1 + 48)];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
  return v2();
}

- (void)leaveClusters:(id)a3 withClusterIdentifier:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [(COService *)self dispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__COService_leaveClusters_withClusterIdentifier_completion___block_invoke;
  block[3] = &unk_2645CB330;
  block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, block);
}

uint64_t __60__COService_leaveClusters_withClusterIdentifier_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _removeMeshForClusters:*(void *)(a1 + 40)];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = COCoreLogForCategory(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    long long v25 = self;
    __int16 v26 = 1024;
    int v27 = [v7 processIdentifier];
    _os_log_impl(&dword_2217C1000, v8, OS_LOG_TYPE_DEFAULT, "%p received new connection from %d", buf, 0x12u);
  }

  id v9 = [(COService *)self listenerProvider];
  if ([(id)objc_opt_class() _isAllowedClient:v7]
    && ((objc_opt_respondsToSelector() & 1) == 0
     || [v9 serviceShouldAcceptNewConnection:v7]))
  {
    [(COService *)self _configureServiceInterfacesOnConnection:v7];
    id v10 = [(COService *)self dispatchQueue];
    [v7 _setQueue:v10];

    objc_initWeak((id *)buf, self);
    objc_initWeak(&location, v7);
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    id v18 = __48__COService_listener_shouldAcceptNewConnection___block_invoke;
    id v19 = &unk_2645CDBA8;
    objc_copyWeak(&v21, (id *)buf);
    objc_copyWeak(&v22, &location);
    uint64_t v20 = self;
    id v11 = (void *)MEMORY[0x223C8B4A0](&v16);
    objc_msgSend(v7, "setInterruptionHandler:", v11, v16, v17, v18, v19);
    [v7 setInvalidationHandler:v11];
    id v12 = [(COService *)self _newClientForConnection:v7];
    id v13 = [(COService *)self clients];
    [v13 addServiceClient:v12];

    [v7 resume];
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
    BOOL v14 = 1;
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

void __48__COService_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = v3;
  if (WeakRetained && v3)
  {
    v5 = COCoreLogForCategory(1);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v8 = 134218240;
      uint64_t v9 = v6;
      __int16 v10 = 1024;
      int v11 = [v4 processIdentifier];
      _os_log_impl(&dword_2217C1000, v5, OS_LOG_TYPE_DEFAULT, "Service %p lost connection from %d", (uint8_t *)&v8, 0x12u);
    }

    id v7 = [WeakRetained clientForConnection:v4];
    if (v7) {
      [WeakRetained _clientLost:v7];
    }
  }
}

- (void)_takeAssertionForCluster:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(COService *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = COCoreLogForCategory(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[COService _takeAssertionForCluster:]();
  }

  if ([(COService *)self _applicableToCluster:v4])
  {
    id v7 = [(COService *)self delegate];
    int v8 = v7;
    if (v7)
    {
      uint64_t v9 = [v7 takeAssertionForCluster:v4];
      __int16 v10 = [(COService *)self assertions];
      int v11 = [v10 objectForKey:v4];
      id v12 = (id)[v11 mutableCopy];

      if (!v12) {
        id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
      }
      [v12 addObject:v9];
      id v13 = (void *)[v10 mutableCopy];
      [v13 setObject:v12 forKey:v4];
      [(COService *)self setAssertions:v13];
      BOOL v14 = COCoreLogForCategory(1);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 134218754;
        uint64_t v16 = self;
        __int16 v17 = 2048;
        id v18 = v9;
        __int16 v19 = 2112;
        id v20 = v4;
        __int16 v21 = 2048;
        uint64_t v22 = [v12 count];
        _os_log_impl(&dword_2217C1000, v14, OS_LOG_TYPE_DEFAULT, "%p took assertion %p for %@ (now %lu)", (uint8_t *)&v15, 0x2Au);
      }
    }
  }
}

- (void)_releaseAssertionForCluster:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(COService *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = COCoreLogForCategory(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[COService _releaseAssertionForCluster:]();
  }

  id v7 = [(COService *)self assertions];
  int v8 = [v7 objectForKey:v4];
  uint64_t v9 = (void *)[v8 mutableCopy];

  if ([v9 count])
  {
    [v9 removeLastObject];
    __int16 v10 = (void *)[v7 mutableCopy];
    if ([v9 count]) {
      [v10 setObject:v9 forKey:v4];
    }
    else {
      [v10 removeObjectForKey:v4];
    }
    [(COService *)self setAssertions:v10];
    int v11 = COCoreLogForCategory(1);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134218498;
      id v13 = self;
      __int16 v14 = 2112;
      id v15 = v4;
      __int16 v16 = 2048;
      uint64_t v17 = [v9 count];
      _os_log_impl(&dword_2217C1000, v11, OS_LOG_TYPE_DEFAULT, "%p released assertion for %@ (remaining %lu)", (uint8_t *)&v12, 0x20u);
    }
  }
}

- (BOOL)_applicableToCluster:(id)a3
{
  return 0;
}

- (void)_addOnForCluster:(id)a3 completion:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  int v8 = [(COService *)self dispatchQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v20 = 0;
  __int16 v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__21;
  long long v24 = __Block_byref_object_dispose__21;
  id v25 = 0;
  uint64_t v9 = [(COService *)self _addOnForCluster:v6];
  __int16 v10 = (void *)v21[5];
  v21[5] = v9;

  if (v21[5])
  {
    v7[2](v7);
  }
  else if ([(COService *)self _applicableToCluster:v6])
  {
    int v11 = [(COService *)self delegate];
    if (v11)
    {
      int v12 = COCoreLogForCategory(1);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        int v27 = self;
        __int16 v28 = 2112;
        id v29 = v6;
        _os_log_impl(&dword_2217C1000, v12, OS_LOG_TYPE_DEFAULT, "%p not in cluster %@ and will request creation", buf, 0x16u);
      }

      objc_initWeak((id *)buf, self);
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __41__COService__addOnForCluster_completion___block_invoke;
      v15[3] = &unk_2645CB688;
      objc_copyWeak(&v19, (id *)buf);
      uint64_t v18 = &v20;
      id v16 = v6;
      uint64_t v17 = v7;
      [v11 waitForClusterBootstrap:v16 completion:v15];

      objc_destroyWeak(&v19);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      __int16 v14 = COCoreLogForCategory(1);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        int v27 = self;
        __int16 v28 = 2112;
        id v29 = v6;
        _os_log_impl(&dword_2217C1000, v14, OS_LOG_TYPE_DEFAULT, "%p not in cluster %@ and does not have delegate", buf, 0x16u);
      }

      ((void (*)(void (**)(void), void))v7[2])(v7, 0);
    }
  }
  else
  {
    id v13 = COCoreLogForCategory(1);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      int v27 = self;
      __int16 v28 = 2112;
      id v29 = v6;
      _os_log_impl(&dword_2217C1000, v13, OS_LOG_TYPE_DEFAULT, "%p not in cluster %@ and cannot request creation", buf, 0x16u);
    }

    ((void (*)(void (**)(void), void))v7[2])(v7, 0);
  }
  _Block_object_dispose(&v20, 8);
}

void __41__COService__addOnForCluster_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained dispatchQueue];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __41__COService__addOnForCluster_completion___block_invoke_2;
    v5[3] = &unk_2645CDBD0;
    uint64_t v8 = *(void *)(a1 + 48);
    v5[4] = v3;
    id v6 = *(id *)(a1 + 32);
    id v7 = *(id *)(a1 + 40);
    dispatch_async(v4, v5);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __41__COService__addOnForCluster_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) _addOnForCluster:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  v5 = COCoreLogForCategory(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    int v10 = 134218498;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    uint64_t v13 = v7;
    __int16 v14 = 2048;
    uint64_t v15 = v8;
    _os_log_impl(&dword_2217C1000, v5, OS_LOG_TYPE_DEFAULT, "%p after cluster %@ creation request got %p", (uint8_t *)&v10, 0x20u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_addMesh:(id)a3 forClusters:(id)a4
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(COService *)self dispatchQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = COCoreLogForCategory(1);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v41 = self;
    __int16 v42 = 2048;
    id v43 = v6;
    __int16 v44 = 2112;
    id v45 = v7;
    _os_log_impl(&dword_2217C1000, v9, OS_LOG_TYPE_DEFAULT, "%p will add %p for clusters %@", buf, 0x20u);
  }

  int v10 = [(COService *)self addOns];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v35 objects:v48 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    __int16 v14 = 0;
    char v15 = 0;
    uint64_t v16 = *(void *)v36;
    while (2)
    {
      uint64_t v17 = 0;
      uint64_t v18 = v14;
      do
      {
        if (*(void *)v36 != v16) {
          objc_enumerationMutation(v11);
        }
        __int16 v14 = [v10 objectForKey:*(void *)(*((void *)&v35 + 1) + 8 * v17)];

        if (v14)
        {
          id v19 = [v14 meshController];
          int v20 = [v6 isEqual:v19];

          if (!v20)
          {

            uint64_t v22 = COCoreLogForCategory(1);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
              -[COService _addMesh:forClusters:]();
            }

            [(COService *)self _removeMeshForClusters:v11];
            goto LABEL_21;
          }
          char v15 = 1;
        }
        ++v17;
        uint64_t v18 = v14;
      }
      while (v13 != v17);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v35 objects:v48 count:16];
      if (v13) {
        continue;
      }
      break;
    }

    if (v15)
    {
      __int16 v21 = COCoreLogForCategory(1);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218498;
        v41 = self;
        __int16 v42 = 2048;
        id v43 = v6;
        __int16 v44 = 2112;
        id v45 = v11;
        _os_log_debug_impl(&dword_2217C1000, v21, OS_LOG_TYPE_DEBUG, "%p already associated with %p for clusters %@", buf, 0x20u);
      }
      goto LABEL_32;
    }
  }
  else
  {

    __int16 v14 = 0;
  }
LABEL_21:
  uint64_t v23 = v14;
  long long v24 = [(COService *)self addOnProvider];
  __int16 v14 = [v24 serviceAddOn];

  id v25 = COCoreLogForCategory(1);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    v41 = self;
    __int16 v42 = 2048;
    id v43 = v14;
    __int16 v44 = 2048;
    id v45 = v6;
    __int16 v46 = 2112;
    id v47 = v11;
    _os_log_impl(&dword_2217C1000, v25, OS_LOG_TYPE_DEFAULT, "%p associating %p with %p for clusters %@", buf, 0x2Au);
  }

  if (v14)
  {
    [v6 addAddOn:v14];
    __int16 v21 = [v10 mutableCopy];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v26 = v11;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v32 != v29) {
            objc_enumerationMutation(v26);
          }
          -[NSObject setObject:forKey:](v21, "setObject:forKey:", v14, *(void *)(*((void *)&v31 + 1) + 8 * i), (void)v31);
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v28);
    }

    [(COService *)self setAddOns:v21];
    [(COService *)self _addOnAdded:v14];
LABEL_32:
  }
}

- (void)_removeMeshForClusters:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(COService *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = COCoreLogForCategory(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    long long v24 = self;
    __int16 v25 = 2112;
    id v26 = v4;
    _os_log_impl(&dword_2217C1000, v6, OS_LOG_TYPE_DEFAULT, "%p will remove from clusters %@", buf, 0x16u);
  }

  id v7 = [(COService *)self addOns];
  uint64_t v8 = [v4 anyObject];
  uint64_t v9 = [v7 objectForKey:v8];

  int v10 = [v9 meshController];
  id v11 = COCoreLogForCategory(1);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    long long v24 = self;
    __int16 v25 = 2048;
    id v26 = v9;
    __int16 v27 = 2048;
    uint64_t v28 = v10;
    __int16 v29 = 2112;
    id v30 = v4;
    _os_log_impl(&dword_2217C1000, v11, OS_LOG_TYPE_DEFAULT, "%p disassociating %p with %p for clusters %@", buf, 0x2Au);
  }

  if (v9)
  {
    if (v10) {
      [v10 removeAddOn:v9];
    }
    [(COService *)self _addOnRemoved:v9];
    uint64_t v12 = (void *)[v7 mutableCopy];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v13 = v4;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v19;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v19 != v16) {
            objc_enumerationMutation(v13);
          }
          objc_msgSend(v12, "removeObjectForKey:", *(void *)(*((void *)&v18 + 1) + 8 * v17++), (void)v18);
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v15);
    }

    [(COService *)self setAddOns:v12];
  }
}

- (id)_clustersForAddOn:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(COService *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v7 = [(COService *)self addOns];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v13 = [v7 objectForKey:v12];
        if ([v13 isEqual:v4]) {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  return v6;
}

- (id)_addOnForCluster:(id)a3
{
  id v4 = a3;
  v5 = [(COService *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(COService *)self addOns];
  id v7 = [v6 objectForKey:v4];

  return v7;
}

- (id)_uniqueAddOns
{
  uint64_t v3 = [(COService *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = objc_alloc(MEMORY[0x263EFFA08]);
  v5 = [(COService *)self addOns];
  id v6 = [v5 allValues];
  id v7 = (void *)[v4 initWithArray:v6];

  return v7;
}

- (id)_newClientForConnection:(id)a3
{
  id v3 = a3;
  id v4 = [[COCoordinationServiceClient alloc] initWithConnection:v3];

  return v4;
}

- (void)_configureServiceInterfacesOnConnection:(id)a3
{
  id v3 = [(COService *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);
}

- (void)_clientLost:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(COService *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = COCoreLogForCategory(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = 134218242;
    uint64_t v9 = self;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_2217C1000, v6, OS_LOG_TYPE_INFO, "%p lost connection for client %@", (uint8_t *)&v8, 0x16u);
  }

  id v7 = [(COService *)self clients];
  [v7 removeServiceClient:v4];
}

- (void)_addOnAdded:(id)a3
{
  id v3 = [(COService *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);
}

- (void)_addOnRemoved:(id)a3
{
  id v3 = [(COService *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);
}

- (COServiceListenerProvider)listenerProvider
{
  return self->_listenerProvider;
}

- (COServiceAddOnProvider)addOnProvider
{
  return self->_addOnProvider;
}

- (COServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (COServiceDelegate *)WeakRetained;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (COCoordinationServiceClientSet)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
}

- (NSDictionary)assertions
{
  return self->_assertions;
}

- (void)setAssertions:(id)a3
{
}

- (NSDictionary)addOns
{
  return self->_addOns;
}

- (void)setAddOns:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addOns, 0);
  objc_storeStrong((id *)&self->_assertions, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_addOnProvider, 0);
  objc_storeStrong((id *)&self->_listenerProvider, 0);
}

- (void)_takeAssertionForCluster:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_1(&dword_2217C1000, v0, v1, "%p attempting to take assertion for %@");
}

- (void)_releaseAssertionForCluster:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_1(&dword_2217C1000, v0, v1, "%p attempting to release assertion for %@");
}

- (void)_addMesh:forClusters:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_2217C1000, v0, OS_LOG_TYPE_ERROR, "%p will remove existing use before add of clusters %@", v1, 0x16u);
}

@end