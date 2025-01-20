@interface COCapabilityManager
- (COCapabilityManager)init;
- (COCapabilityManager)initWithConnectionProvider:(id)a3;
- (COCapabilityManagerConnectionProvider)provider;
- (NSArray)observers;
- (NSSet)registeredCapabilities;
- (NSXPCConnection)lastConnection;
- (OS_dispatch_queue)observerQueue;
- (id)_remoteInterfaceWithErrorHandler:(id)a3;
- (id)addObserverForCapability:(id)a3 inCluster:(id)a4 usingBlock:(id)a5;
- (void)_lostConnectionToService;
- (void)_notifyObserver:(id)a3 available:(BOOL)a4;
- (void)_registerCapabililty:(id)a3;
- (void)_registerObserver:(id)a3;
- (void)_withLock:(id)a3;
- (void)availabilityChanged:(BOOL)a3 ofCapability:(id)a4 inCluster:(id)a5;
- (void)dealloc;
- (void)registerCapability:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setLastConnection:(id)a3;
- (void)setObservers:(id)a3;
- (void)setRegisteredCapabilities:(id)a3;
- (void)unregisterCapability:(id)a3;
@end

@implementation COCapabilityManager

- (COCapabilityManager)initWithConnectionProvider:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)COCapabilityManager;
  v6 = [(COCapabilityManager *)&v17 init];
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_provider, a3);
    v8 = (NSSet *)objc_alloc_init(MEMORY[0x263EFFA08]);
    registeredCapabilities = v7->_registeredCapabilities;
    v7->_registeredCapabilities = v8;

    v10 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF8C0]);
    observers = v7->_observers;
    v7->_observers = v10;

    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.coordination.COCapabilityManager.observer", v12);
    observerQueue = v7->_observerQueue;
    v7->_observerQueue = (OS_dispatch_queue *)v13;

    v15 = COLogForCategory(3);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      [(COCapabilityManager *)(uint64_t)v7 initWithConnectionProvider:v15];
    }
  }
  return v7;
}

- (COCapabilityManager)init
{
  v3 = objc_alloc_init(_COCapabilityManagerConnectionProvider);
  v4 = [(COCapabilityManager *)self initWithConnectionProvider:v3];

  return v4;
}

- (void)dealloc
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __30__COCapabilityManager_dealloc__block_invoke;
  v4[3] = &unk_2644445A8;
  v4[4] = self;
  [(COCapabilityManager *)self _withLock:v4];
  v3.receiver = self;
  v3.super_class = (Class)COCapabilityManager;
  [(COCapabilityManager *)&v3 dealloc];
}

void __30__COCapabilityManager_dealloc__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) lastConnection];
  v1 = objc_msgSend(v3, "co_originalInterruptionHandler");
  [v3 setInterruptionHandler:v1];

  v2 = objc_msgSend(v3, "co_originalInvalidationHandler");
  [v3 setInvalidationHandler:v2];

  [v3 invalidate];
}

- (void)registerCapability:(id)a3
{
  id v4 = a3;
  id v5 = [(COCapabilityManager *)self registeredCapabilities];
  char v6 = [v5 containsObject:v4];

  if (v6)
  {
    v7 = COLogForCategory(3);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[COCapabilityManager registerCapability:]();
    }
  }
  else
  {
    v8 = [(COCapabilityManager *)self registeredCapabilities];
    v9 = [v8 setByAddingObject:v4];

    [(COCapabilityManager *)self setRegisteredCapabilities:v9];
    [(COCapabilityManager *)self _registerCapabililty:v4];
  }
}

- (void)unregisterCapability:(id)a3
{
  id v4 = a3;
  id v5 = [(COCapabilityManager *)self registeredCapabilities];
  if ([v5 containsObject:v4])
  {
    char v6 = [v5 mutableCopy];
    [v6 removeObject:v4];
    [(COCapabilityManager *)self setRegisteredCapabilities:v6];
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __44__COCapabilityManager_unregisterCapability___block_invoke;
    v10[3] = &unk_264445350;
    objc_copyWeak(&v12, &location);
    id v7 = v4;
    id v11 = v7;
    v8 = [(COCapabilityManager *)self _remoteInterfaceWithErrorHandler:v10];
    v9 = COLogForCategory(3);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[COCapabilityManager unregisterCapability:]();
    }

    [v8 unregisterCapability:v7];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    char v6 = COLogForCategory(3);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[COCapabilityManager unregisterCapability:]();
    }
  }
}

void __44__COCapabilityManager_unregisterCapability___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = COLogForCategory(3);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 134218498;
      id v8 = WeakRetained;
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_error_impl(&dword_21D3E0000, v5, OS_LOG_TYPE_ERROR, "%p failed to unregister Capability(%@): %@", (uint8_t *)&v7, 0x20u);
    }
  }
}

- (id)addObserverForCapability:(id)a3 inCluster:(id)a4 usingBlock:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = +[COCluster _clusterForCluster:a4];
  __int16 v11 = [[_COCapabilityObserver alloc] initWithCapability:v9 cluster:v10 block:v8];

  id v12 = [(COCapabilityManager *)self observers];
  uint64_t v13 = (void *)[v12 mutableCopy];

  [v13 addObject:v11];
  [(COCapabilityManager *)self setObservers:v13];
  v14 = COLogForCategory(3);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[COCapabilityManager addObserverForCapability:inCluster:usingBlock:]();
  }

  [(COCapabilityManager *)self _registerObserver:v11];

  return v11;
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(COCapabilityManager *)self observers];
  uint64_t v6 = [v5 indexOfObject:v4];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = v6;
    id v8 = (void *)[v5 mutableCopy];
    id v9 = [v8 objectAtIndex:v7];
    [v8 removeObjectAtIndex:v7];
    [(COCapabilityManager *)self setObservers:v8];
    objc_initWeak(&location, self);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __38__COCapabilityManager_removeObserver___block_invoke;
    v14[3] = &unk_264445350;
    objc_copyWeak(&v16, &location);
    id v15 = v4;
    uint64_t v10 = [(COCapabilityManager *)self _remoteInterfaceWithErrorHandler:v14];
    __int16 v11 = COLogForCategory(3);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[COCapabilityManager removeObserver:]();
    }

    id v12 = [v9 capability];
    uint64_t v13 = [v9 cluster];
    [v10 removeObserverForCapability:v12 inCluster:v13];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

void __38__COCapabilityManager_removeObserver___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = COLogForCategory(3);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 134218754;
      id v8 = WeakRetained;
      __int16 v9 = 2048;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      uint64_t v12 = v6;
      __int16 v13 = 2112;
      id v14 = v3;
      _os_log_error_impl(&dword_21D3E0000, v5, OS_LOG_TYPE_ERROR, "%p failed to remove Observer(%p/%@): %@", (uint8_t *)&v7, 0x2Au);
    }
  }
}

- (void)availabilityChanged:(BOOL)a3 ofCapability:(id)a4 inCluster:(id)a5
{
  BOOL v21 = a3;
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  __int16 v9 = COLogForCategory(3);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    v28 = self;
    if (v21) {
      int v10 = 89;
    }
    else {
      int v10 = 78;
    }
    __int16 v29 = 2112;
    id v30 = v7;
    __int16 v31 = 2112;
    id v32 = v8;
    __int16 v33 = 1024;
    int v34 = v10;
    _os_log_impl(&dword_21D3E0000, v9, OS_LOG_TYPE_DEFAULT, "%p received notification that Capability(%@) in Cluster(%@) is Available(%c)", buf, 0x26u);
  }

  v20 = self;
  __int16 v11 = [(COCapabilityManager *)self observers];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        objc_super v17 = [v16 capability];
        if ([v17 isEqualToString:v7])
        {
          v18 = [v16 cluster];
          int v19 = [v18 isEqual:v8];

          if (v19) {
            [(COCapabilityManager *)v20 _notifyObserver:v16 available:v21];
          }
        }
        else
        {
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v13);
  }
}

- (NSSet)registeredCapabilities
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__5;
  __int16 v9 = __Block_byref_object_dispose__5;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __45__COCapabilityManager_registeredCapabilities__block_invoke;
  v4[3] = &unk_264444468;
  v4[4] = self;
  void v4[5] = &v5;
  [(COCapabilityManager *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSSet *)v2;
}

void __45__COCapabilityManager_registeredCapabilities__block_invoke(uint64_t a1)
{
}

- (void)setRegisteredCapabilities:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__COCapabilityManager_setRegisteredCapabilities___block_invoke;
  v6[3] = &unk_2644444E0;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [(COCapabilityManager *)self _withLock:v6];
}

uint64_t __49__COCapabilityManager_setRegisteredCapabilities___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result != *(void *)(*(void *)(a1 + 40) + 16))
  {
    uint64_t result = objc_msgSend((id)result, "isEqualToSet:");
    if ((result & 1) == 0)
    {
      *(void *)(*(void *)(a1 + 40) + 16) = [*(id *)(a1 + 32) copy];
      return MEMORY[0x270F9A758]();
    }
  }
  return result;
}

- (NSArray)observers
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__5;
  __int16 v9 = __Block_byref_object_dispose__5;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __32__COCapabilityManager_observers__block_invoke;
  v4[3] = &unk_264444468;
  v4[4] = self;
  void v4[5] = &v5;
  [(COCapabilityManager *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

void __32__COCapabilityManager_observers__block_invoke(uint64_t a1)
{
}

- (void)setObservers:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __36__COCapabilityManager_setObservers___block_invoke;
  v6[3] = &unk_2644444E0;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [(COCapabilityManager *)self _withLock:v6];
}

uint64_t __36__COCapabilityManager_setObservers___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result != *(void *)(*(void *)(a1 + 40) + 24))
  {
    uint64_t result = objc_msgSend((id)result, "isEqualToArray:");
    if ((result & 1) == 0)
    {
      *(void *)(*(void *)(a1 + 40) + 24) = [*(id *)(a1 + 32) copy];
      return MEMORY[0x270F9A758]();
    }
  }
  return result;
}

- (void)_notifyObserver:(id)a3 available:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = COLogForCategory(3);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (v4) {
      int v8 = 89;
    }
    else {
      int v8 = 78;
    }
    __int16 v9 = [v6 capability];
    id v10 = [v6 cluster];
    *(_DWORD *)buf = 134219266;
    objc_super v17 = self;
    __int16 v18 = 2048;
    id v19 = v6;
    __int16 v20 = 2112;
    id v21 = v6;
    __int16 v22 = 1024;
    int v23 = v8;
    __int16 v24 = 2112;
    long long v25 = v9;
    __int16 v26 = 2112;
    v27 = v10;
    _os_log_impl(&dword_21D3E0000, v7, OS_LOG_TYPE_DEFAULT, "%p notifying Observer(%p/%@) of Availability(%c) for Capability(%@) in Cluster(%@)", buf, 0x3Au);
  }
  __int16 v11 = [(COCapabilityManager *)self observerQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __49__COCapabilityManager__notifyObserver_available___block_invoke;
  v13[3] = &unk_264445538;
  id v14 = v6;
  BOOL v15 = v4;
  id v12 = v6;
  dispatch_async(v11, v13);
}

uint64_t __49__COCapabilityManager__notifyObserver_available___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) notify:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_withLock:(id)a3
{
  p_lock = &self->_lock;
  BOOL v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (id)_remoteInterfaceWithErrorHandler:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  __int16 v9 = &v8;
  uint64_t v10 = 0x3032000000;
  __int16 v11 = __Block_byref_object_copy__5;
  id v12 = __Block_byref_object_dispose__5;
  id v13 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__COCapabilityManager__remoteInterfaceWithErrorHandler___block_invoke;
  v7[3] = &unk_264444468;
  v7[4] = self;
  v7[5] = &v8;
  [(COCapabilityManager *)self _withLock:v7];
  id v5 = [(id)v9[5] remoteObjectProxyWithErrorHandler:v4];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __56__COCapabilityManager__remoteInterfaceWithErrorHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) provider];
  uint64_t v3 = [v2 capabilityManagerServiceConnection];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v7 = [*(id *)(a1 + 32) lastConnection];

  if (v6 != v7)
  {
    uint64_t v8 = (void *)MEMORY[0x263F08D80];
    __int16 v9 = &unk_26CDD5A70;
    uint64_t v10 = [v8 interfaceWithProtocol:v9];
    __int16 v11 = +[COCluster _allowedClusterClasses];
    [v10 setClasses:v11 forSelector:sel_availabilityChanged_ofCapability_inCluster_ argumentIndex:2 ofReply:0];

    id v12 = [[COCapabilityManagerClientInterfaceMediator alloc] initWithCapabilityManager:*(void *)(a1 + 32)];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setExportedInterface:v10];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setExportedObject:v12];
    id v13 = &unk_26CDD9AF8;

    id v14 = [MEMORY[0x263F08D80] interfaceWithProtocol:v13];

    BOOL v15 = +[COCluster _allowedClusterClasses];
    [v14 setClasses:v15 forSelector:sel_addObserverForCapability_inCluster_ argumentIndex:1 ofReply:0];

    id v16 = +[COCluster _allowedClusterClasses];
    [v14 setClasses:v16 forSelector:sel_removeObserverForCapability_inCluster_ argumentIndex:1 ofReply:0];

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setRemoteObjectInterface:v14];
    objc_initWeak(&location, *(id *)(a1 + 32));
    objc_super v17 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) interruptionHandler];
    __int16 v18 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) invalidationHandler];
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "co_setOriginalInterruptionHandler:", v17);
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "co_setOriginalInvalidationHandler:", v18);
    id v19 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __56__COCapabilityManager__remoteInterfaceWithErrorHandler___block_invoke_2;
    v26[3] = &unk_264444A18;
    id v20 = v17;
    id v27 = v20;
    objc_copyWeak(&v28, &location);
    [v19 setInterruptionHandler:v26];
    id v21 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __56__COCapabilityManager__remoteInterfaceWithErrorHandler___block_invoke_68;
    v23[3] = &unk_264444A18;
    id v22 = v18;
    id v24 = v22;
    objc_copyWeak(&v25, &location);
    [v21 setInvalidationHandler:v23];
    [*(id *)(a1 + 32) setLastConnection:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) resume];
    objc_destroyWeak(&v25);

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
}

void __56__COCapabilityManager__remoteInterfaceWithErrorHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v4 = COLogForCategory(3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __56__COCapabilityManager__remoteInterfaceWithErrorHandler___block_invoke_2_cold_1((uint64_t)WeakRetained, v4);
    }
  }
}

void __56__COCapabilityManager__remoteInterfaceWithErrorHandler___block_invoke_68(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v4 = COLogForCategory(3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __56__COCapabilityManager__remoteInterfaceWithErrorHandler___block_invoke_68_cold_1((uint64_t)WeakRetained, v4);
    }
  }
}

- (void)_lostConnectionToService
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(COCapabilityManager *)self observers];
  uint64_t v4 = [(COCapabilityManager *)self registeredCapabilities];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        [(COCapabilityManager *)self _registerObserver:*(void *)(*((void *)&v20 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v27 count:16];
    }
    while (v7);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = v4;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        -[COCapabilityManager _registerCapabililty:](self, "_registerCapabililty:", *(void *)(*((void *)&v16 + 1) + 8 * v14++), (void)v16);
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v26 count:16];
    }
    while (v12);
  }

  BOOL v15 = COLogForCategory(3);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v25 = self;
    _os_log_impl(&dword_21D3E0000, v15, OS_LOG_TYPE_DEFAULT, "%p done restoring state after lost connection to service", buf, 0xCu);
  }
}

- (void)_registerCapabililty:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __44__COCapabilityManager__registerCapabililty___block_invoke;
  v8[3] = &unk_264445350;
  objc_copyWeak(&v10, &location);
  id v5 = v4;
  id v9 = v5;
  uint64_t v6 = [(COCapabilityManager *)self _remoteInterfaceWithErrorHandler:v8];
  uint64_t v7 = COLogForCategory(3);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[COCapabilityManager _registerCapabililty:]();
  }

  [v6 registerCapability:v5];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __44__COCapabilityManager__registerCapabililty___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = COLogForCategory(3);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 134218498;
      id v8 = WeakRetained;
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_error_impl(&dword_21D3E0000, v5, OS_LOG_TYPE_ERROR, "%p failed to register Capability(%@): %@", (uint8_t *)&v7, 0x20u);
    }
  }
}

- (void)_registerObserver:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __41__COCapabilityManager__registerObserver___block_invoke;
  v10[3] = &unk_264445350;
  objc_copyWeak(&v12, &location);
  id v5 = v4;
  id v11 = v5;
  uint64_t v6 = [(COCapabilityManager *)self _remoteInterfaceWithErrorHandler:v10];
  int v7 = COLogForCategory(3);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[COCapabilityManager _registerObserver:]();
  }

  id v8 = [v5 capability];
  __int16 v9 = [v5 cluster];
  [v6 addObserverForCapability:v8 inCluster:v9];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __41__COCapabilityManager__registerObserver___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = COLogForCategory(3);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 134218754;
      id v8 = WeakRetained;
      __int16 v9 = 2048;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      uint64_t v12 = v6;
      __int16 v13 = 2112;
      id v14 = v3;
      _os_log_error_impl(&dword_21D3E0000, v5, OS_LOG_TYPE_ERROR, "%p failed to add Observer(%p/%@): %@", (uint8_t *)&v7, 0x2Au);
    }
  }
}

- (OS_dispatch_queue)observerQueue
{
  return self->_observerQueue;
}

- (NSXPCConnection)lastConnection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lastConnection);

  return (NSXPCConnection *)WeakRetained;
}

- (void)setLastConnection:(id)a3
{
}

- (COCapabilityManagerConnectionProvider)provider
{
  return self->_provider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provider, 0);
  objc_destroyWeak((id *)&self->_lastConnection);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_registeredCapabilities, 0);
}

- (void)initWithConnectionProvider:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  int v7 = 134218242;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_debug_impl(&dword_21D3E0000, a3, OS_LOG_TYPE_DEBUG, "%p created with %@ provider", (uint8_t *)&v7, 0x16u);
}

- (void)registerCapability:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21D3E0000, v0, v1, "%p ignoring duplicate registration of Capability(%@)");
}

- (void)unregisterCapability:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0(&dword_21D3E0000, v0, v1, "%p unregistering Capability(%@)");
}

- (void)unregisterCapability:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21D3E0000, v0, v1, "%p cannot unregister Capability(%@) that is not registered");
}

- (void)addObserverForCapability:inCluster:usingBlock:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_21D3E0000, v0, v1, "%p adding Observer(%p/%@)");
}

- (void)removeObserver:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_21D3E0000, v0, v1, "%p removing Observer(%p/%@)");
}

void __56__COCapabilityManager__remoteInterfaceWithErrorHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21D3E0000, a2, OS_LOG_TYPE_ERROR, "%p connection to Capability service interrupted", (uint8_t *)&v2, 0xCu);
}

void __56__COCapabilityManager__remoteInterfaceWithErrorHandler___block_invoke_68_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21D3E0000, a2, OS_LOG_TYPE_ERROR, "%p connection to Capability service invalidated", (uint8_t *)&v2, 0xCu);
}

- (void)_registerCapabililty:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0(&dword_21D3E0000, v0, v1, "%p registering Capability(%@)");
}

- (void)_registerObserver:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_21D3E0000, v0, v1, "%p registering Observer(%p/%@) with service");
}

@end