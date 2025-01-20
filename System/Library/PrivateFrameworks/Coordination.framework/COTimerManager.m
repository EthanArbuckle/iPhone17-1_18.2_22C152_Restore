@interface COTimerManager
- (BOOL)_canDispatchForAssociatedAccessory;
- (BOOL)canDispatch;
- (BOOL)dtMonitoring;
- (COHomeKitAccessoryMemento)memento;
- (COObserverSet)observers;
- (COTimerManager)init;
- (COTimerManager)initWithConnectionProvider:(id)a3;
- (COTimerManager)initWithConnectionProvider:(id)a3 distributedTimersClient:(id)a4;
- (COTimerManagerConnectionProvider)provider;
- (DTTimerClient)dtClient;
- (HMAccessory)accessory;
- (NSUUID)instanceID;
- (NSXPCConnection)lastConnection;
- (id)_remoteInterfaceWithErrorHandler:(id)a3;
- (id)_sendRequestWithName:(id)a3 forTimer:(id)a4 distributedTimers:(id)a5 coordination:(id)a6;
- (id)_timersForAccessory:(id)a3;
- (id)addObserverForName:(id)a3 queue:(id)a4 usingBlock:(id)a5;
- (id)addTimer:(id)a3;
- (id)cluster;
- (id)dismissTimerWithIdentifier:(id)a3;
- (id)initForAccessory:(id)a3 withConnectionProvider:(id)a4;
- (id)removeTimer:(id)a3;
- (id)timers;
- (id)timersForAccessories:(id)a3;
- (id)timersForAccessory:(id)a3;
- (id)timersForAccessoryMementos:(id)a3;
- (id)updateTimer:(id)a3;
- (void)_activateDistributedTimersMonitoring;
- (void)_canDispatchForAssociatedAccessory;
- (void)_emitNotificationForName:(id)a3 timer:(id)a4;
- (void)_handleDTTimerClientEvent:(int64_t)a3 dtTimer:(id)a4;
- (void)_handleNotification:(id)a3;
- (void)_lostConnectionToService;
- (void)_registerObserverWithName:(id)a3;
- (void)_updateCanDispatch;
- (void)_updateMonitoring;
- (void)_withLock:(id)a3;
- (void)dealloc;
- (void)postNotificationName:(id)a3 withUserInfo:(id)a4 callback:(id)a5;
- (void)removeObserver:(id)a3;
- (void)setCanDispatch:(BOOL)a3;
- (void)setDtClient:(id)a3;
- (void)setDtMonitoring:(BOOL)a3;
- (void)setLastConnection:(id)a3;
@end

@implementation COTimerManager

- (COTimerManager)initWithConnectionProvider:(id)a3 distributedTimersClient:(id)a4
{
  v30[2] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)COTimerManager;
  v9 = [(COTimerManager *)&v23 init];
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    if (+[COFeatureStatus isCOClusterEnabled])
    {
      v11 = +[COCluster homeCluster];
    }
    else
    {
      v11 = @"COClusterHome";
    }
    id cluster = v10->_cluster;
    v10->_id cluster = v11;

    v13 = objc_alloc_init(COObserverSet);
    observers = v10->_observers;
    v10->_observers = v13;

    objc_storeStrong((id *)&v10->_provider, a3);
    objc_storeStrong((id *)&v10->_dtClient, a4);
    v15 = [v8 error];
    v10->_canDispatch = v15 == 0;

    v30[0] = 0;
    v30[1] = 0;
    if (xpc_get_instance())
    {
      uint64_t v16 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:v30];
      instanceID = v10->_instanceID;
      v10->_instanceID = (NSUUID *)v16;
    }
    v18 = COLogForCategory(1);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v10->_instanceID;
      v20 = (objc_class *)objc_opt_class();
      v21 = NSStringFromClass(v20);
      *(_DWORD *)buf = 134218498;
      v25 = v10;
      __int16 v26 = 2112;
      v27 = v19;
      __int16 v28 = 2112;
      v29 = v21;
      _os_log_impl(&dword_21D3E0000, v18, OS_LOG_TYPE_DEFAULT, "%p manager created for %@ with %@ provider", buf, 0x20u);
    }
  }

  return v10;
}

- (COTimerManager)initWithConnectionProvider:(id)a3
{
  id v4 = a3;
  v5 = MakeDTTimerClient_0(0);
  v6 = [(COTimerManager *)self initWithConnectionProvider:v4 distributedTimersClient:v5];

  return v6;
}

- (id)initForAccessory:(id)a3 withConnectionProvider:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 uniqueIdentifier];
  v9 = MakeDTTimerClient_0(v8);

  v10 = [(COTimerManager *)self initWithConnectionProvider:v7 distributedTimersClient:v9];
  if (v10)
  {
    v11 = COLogForCategory(1);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [(HMAccessory *)v10->_accessory uniqueIdentifier];
      *(_DWORD *)buf = 134218242;
      v24 = v10;
      __int16 v25 = 2112;
      __int16 v26 = v12;
      _os_log_impl(&dword_21D3E0000, v11, OS_LOG_TYPE_DEFAULT, "%p manager set accessory %@", buf, 0x16u);
    }
    if (+[COFeatureStatus isCOClusterEnabled])
    {
      v13 = [v6 home];
      uint64_t v14 = +[COCluster homeClusterForHomeKitHome:v13];
      id cluster = v10->_cluster;
      v10->_id cluster = (id)v14;
    }
    else
    {
      uint64_t v16 = NSString;
      v13 = [v6 home];
      id cluster = [v13 uniqueIdentifier];
      v17 = [cluster UUIDString];
      uint64_t v18 = [v16 stringWithFormat:@"com.apple.%@-home-mesh", v17];
      id v19 = v10->_cluster;
      v10->_id cluster = (id)v18;
    }
    v20 = [[COHomeKitAccessoryMemento alloc] initWithHomeKitAccessory:v6];
    memento = v10->_memento;
    v10->_memento = v20;
  }
  return v10;
}

- (COTimerManager)init
{
  v3 = objc_alloc_init(_COTimerManagerConnectionProvider);
  id v4 = [(COTimerManager *)self initWithConnectionProvider:v3];

  return v4;
}

- (void)dealloc
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __25__COTimerManager_dealloc__block_invoke;
  v4[3] = &unk_2644445A8;
  v4[4] = self;
  [(COTimerManager *)self _withLock:v4];
  v3.receiver = self;
  v3.super_class = (Class)COTimerManager;
  [(COTimerManager *)&v3 dealloc];
}

void __25__COTimerManager_dealloc__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) lastConnection];
  v1 = objc_msgSend(v3, "co_originalInterruptionHandler");
  [v3 setInterruptionHandler:v1];

  v2 = objc_msgSend(v3, "co_originalInvalidationHandler");
  [v3 setInvalidationHandler:v2];

  [v3 invalidate];
}

- (void)_withLock:(id)a3
{
  p_lock = &self->_lock;
  id v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (id)_remoteInterfaceWithErrorHandler:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__7;
  v12 = __Block_byref_object_dispose__7;
  id v13 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__COTimerManager__remoteInterfaceWithErrorHandler___block_invoke;
  v7[3] = &unk_264444468;
  v7[4] = self;
  v7[5] = &v8;
  [(COTimerManager *)self _withLock:v7];
  v5 = [(id)v9[5] remoteObjectProxyWithErrorHandler:v4];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __51__COTimerManager__remoteInterfaceWithErrorHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) provider];
  uint64_t v3 = [v2 timerManagerServiceConnection];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v7 = [*(id *)(a1 + 32) lastConnection];

  if (v6 != v7)
  {
    uint64_t v8 = (void *)MEMORY[0x263F08D80];
    v9 = &unk_26CDD62D8;
    uint64_t v10 = [v8 interfaceWithProtocol:v9];
    v11 = (void *)MEMORY[0x263EFFA08];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v11, "setWithObjects:", v12, v13, v14, v15, v16, objc_opt_class(), 0);
    [v10 setClasses:v17 forSelector:sel_postNotificationName_withUserInfo_callback_ argumentIndex:1 ofReply:0];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setExportedInterface:v10];
    v34 = [[COTimerManagerMediator alloc] initWithTimerManager:*(void *)(a1 + 32)];
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "setExportedObject:");
    uint64_t v18 = &unk_26CDD9B58;

    id v19 = [MEMORY[0x263F08D80] interfaceWithProtocol:v18];

    v20 = (void *)MEMORY[0x263EFFA08];
    uint64_t v21 = objc_opt_class();
    v22 = objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);

    [v19 setClasses:v22 forSelector:sel_timersAsAccessory_asInstance_withCallback_ argumentIndex:0 ofReply:1];
    objc_super v23 = (void *)MEMORY[0x263EFFA08];
    uint64_t v24 = objc_opt_class();
    uint64_t v25 = objc_opt_class();
    uint64_t v26 = objc_opt_class();
    uint64_t v27 = objc_msgSend(v23, "setWithObjects:", v24, v25, v26, objc_opt_class(), 0);

    [v19 setClasses:v27 forSelector:sel_timersAsAccessory_forAccessories_callback_ argumentIndex:0 ofReply:1];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setRemoteObjectInterface:v19];
    objc_initWeak(location, *(id *)(a1 + 32));
    __int16 v28 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) interruptionHandler];
    v29 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) invalidationHandler];
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "co_setOriginalInterruptionHandler:", v28);
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "co_setOriginalInvalidationHandler:", v29);
    v30 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __51__COTimerManager__remoteInterfaceWithErrorHandler___block_invoke_2;
    v38[3] = &unk_264444A18;
    id v31 = v28;
    id v39 = v31;
    objc_copyWeak(&v40, location);
    [v30 setInterruptionHandler:v38];
    v32 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __51__COTimerManager__remoteInterfaceWithErrorHandler___block_invoke_127;
    v35[3] = &unk_264444A18;
    id v33 = v29;
    id v36 = v33;
    objc_copyWeak(&v37, location);
    [v32 setInvalidationHandler:v35];
    [*(id *)(a1 + 32) setLastConnection:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) resume];
    objc_destroyWeak(&v37);

    objc_destroyWeak(&v40);
    objc_destroyWeak(location);
  }
}

void __51__COTimerManager__remoteInterfaceWithErrorHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v4 = COLogForCategory(1);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __51__COTimerManager__remoteInterfaceWithErrorHandler___block_invoke_2_cold_1();
    }
  }
}

void __51__COTimerManager__remoteInterfaceWithErrorHandler___block_invoke_127(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v4 = COLogForCategory(1);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __51__COTimerManager__remoteInterfaceWithErrorHandler___block_invoke_127_cold_1();
    }
  }
}

- (void)_lostConnectionToService
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [(COTimerManager *)self observers];
  uint64_t v4 = [v3 registeredNames];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [(COTimerManager *)self _registerObserverWithName:*(void *)(*((void *)&v10 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v16 count:16];
    }
    while (v6);
  }

  v9 = COLogForCategory(1);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v15 = self;
    _os_log_impl(&dword_21D3E0000, v9, OS_LOG_TYPE_DEFAULT, "%p posting reset notification", buf, 0xCu);
  }

  [(COTimerManager *)self postNotificationName:@"COTimerManagerStateReset" withUserInfo:0 callback:&__block_literal_global_8];
}

- (id)_sendRequestWithName:(id)a3 forTimer:(id)a4 distributedTimers:(id)a5 coordination:(id)a6
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  long long v12 = (void (**)(id, void *, void *, void *))a5;
  id v13 = a6;
  id v14 = objc_alloc_init(MEMORY[0x263F58190]);
  uint32_t v15 = arc4random();
  uint64_t v16 = COLogForCategory(1);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    [v11 timerID];
    uint64_t v17 = v34 = v11;
    uint64_t v18 = [(COTimerManager *)self dtClient];
    *(_DWORD *)buf = 134219010;
    v48 = self;
    __int16 v49 = 1024;
    uint32_t v50 = v15;
    __int16 v51 = 2114;
    id v52 = v10;
    __int16 v53 = 2114;
    v54 = v17;
    __int16 v55 = 2048;
    v56 = v18;
    _os_log_impl(&dword_21D3E0000, v16, OS_LOG_TYPE_DEFAULT, "%p (%u) %{public}@ timer %{public}@ [DT: %p]", buf, 0x30u);

    id v11 = v34;
  }

  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __79__COTimerManager__sendRequestWithName_forTimer_distributedTimers_coordination___block_invoke;
  v42[3] = &unk_264444B60;
  uint32_t v46 = v15;
  id v19 = v10;
  id v43 = v19;
  id v20 = v11;
  id v44 = v20;
  id v21 = v14;
  id v45 = v21;
  v22 = (void *)MEMORY[0x21D4BD7F0](v42);
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __79__COTimerManager__sendRequestWithName_forTimer_distributedTimers_coordination___block_invoke_130;
  v39[3] = &unk_264444B88;
  v39[4] = self;
  id v23 = v22;
  id v40 = v23;
  id v24 = v13;
  id v41 = v24;
  uint64_t v25 = (void *)MEMORY[0x21D4BD7F0](v39);
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __79__COTimerManager__sendRequestWithName_forTimer_distributedTimers_coordination___block_invoke_2;
  v35[3] = &unk_264444BB0;
  uint32_t v38 = v15;
  uint64_t v26 = v25;
  id v36 = v26;
  id v27 = v23;
  id v37 = v27;
  __int16 v28 = (void *)MEMORY[0x21D4BD7F0](v35);
  v29 = [(COTimerManager *)self dtClient];

  if (v29)
  {
    v30 = (void *)[objc_alloc(MEMORY[0x263F3A658]) initWithMTTimer:v20];
    id v31 = [(COTimerManager *)self dtClient];
    v12[2](v12, v31, v30, v28);
  }
  else
  {
    v26[2](v26);
  }
  id v32 = v21;

  return v32;
}

void __79__COTimerManager__sendRequestWithName_forTimer_distributedTimers_coordination___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = COLogForCategory(1);
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __79__COTimerManager__sendRequestWithName_forTimer_distributedTimers_coordination___block_invoke_cold_1(a1, (uint64_t)v3, v5);
    }

    [*(id *)(a1 + 48) finishWithError:v3];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = *(_DWORD *)(a1 + 56);
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = [*(id *)(a1 + 40) timerID];
      v9[0] = 67109634;
      v9[1] = v6;
      __int16 v10 = 2114;
      uint64_t v11 = v7;
      __int16 v12 = 2114;
      id v13 = v8;
      _os_log_impl(&dword_21D3E0000, v5, OS_LOG_TYPE_DEFAULT, "%u: %{public}@ timer %{public}@ done", (uint8_t *)v9, 0x1Cu);
    }
    [*(id *)(a1 + 48) finishWithNoResult];
  }
}

uint64_t __79__COTimerManager__sendRequestWithName_forTimer_distributedTimers_coordination___block_invoke_130(uint64_t a1)
{
  [*(id *)(a1 + 32) _remoteInterfaceWithErrorHandler:*(void *)(a1 + 40)];
  if (objc_claimAutoreleasedReturnValue()) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }

  return MEMORY[0x270F9A758]();
}

void __79__COTimerManager__sendRequestWithName_forTimer_distributedTimers_coordination___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = v3;
  if (!v3 || [v3 code] != 8)
  {

    goto LABEL_8;
  }
  uint64_t v5 = [v4 domain];
  int v6 = [v5 isEqualToString:@"DTError"];

  if (!v6)
  {
LABEL_8:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_9;
  }
  uint64_t v7 = COLogForCategory(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = *(_DWORD *)(a1 + 48);
    v9[0] = 67109120;
    v9[1] = v8;
    _os_log_impl(&dword_21D3E0000, v7, OS_LOG_TYPE_DEFAULT, "%u: falling back to coordination", (uint8_t *)v9, 8u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_9:
}

- (void)_updateCanDispatch
{
  v19[1] = *MEMORY[0x263EF8340];
  id v3 = [(COTimerManager *)self dtClient];
  uint64_t v4 = [v3 error];

  if ((v4 == 0) == [(COTimerManager *)self canDispatch]) {
    return;
  }
  BOOL v5 = [(COTimerManager *)self canDispatch];
  if (v4)
  {
    if (!v5) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  if (!v5) {
LABEL_4:
  }
    [(COTimerManager *)self setCanDispatch:v4 == 0];
LABEL_5:
  int v6 = [(COTimerManager *)self observers];
  uint64_t v7 = [v6 registeredNames];
  int v8 = [v7 containsObject:@"COTimerManagerCanDispatchDidUpdate"];

  if (v8)
  {
    v9 = [(COTimerManager *)self accessory];

    if (v9)
    {
      uint64_t v10 = [(COTimerManager *)self accessory];
      uint64_t v11 = [v10 uniqueIdentifier];

      uint64_t v18 = @"COAccessoryDispatchabilityKey";
      uint64_t v16 = v11;
      __int16 v12 = objc_msgSend(NSNumber, "numberWithBool:", -[COTimerManager canDispatch](self, "canDispatch"));
      uint64_t v17 = v12;
      id v13 = [NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
      v19[0] = v13;
      uint64_t v14 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
    }
    else
    {
      uint64_t v14 = 0;
    }
    uint32_t v15 = (void *)[objc_alloc(MEMORY[0x263F089F8]) initWithName:@"COTimerManagerCanDispatchDidUpdate" object:self userInfo:v14];
    [(COTimerManager *)self _handleNotification:v15];
  }
}

- (void)_emitNotificationForName:(id)a3 timer:(id)a4
{
  v22[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = v7;
  if (v7)
  {
    uint64_t v9 = *MEMORY[0x263F55D28];
    id v20 = v7;
    uint64_t v21 = v9;
    uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];
    v22[0] = v10;
    uint64_t v11 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
  }
  else
  {
    uint64_t v11 = 0;
  }
  __int16 v12 = [(COTimerManager *)self observers];
  id v13 = [v12 registeredNames];
  int v14 = [v13 containsObject:v6];

  if (v14)
  {
    uint32_t v15 = (void *)[objc_alloc(MEMORY[0x263F089F8]) initWithName:v6 object:self userInfo:v11];
    [(COTimerManager *)self _handleNotification:v15];
  }
  uint64_t v16 = [(COTimerManager *)self observers];
  uint64_t v17 = [v16 registeredNames];
  int v18 = [v17 containsObject:@"COTimerManagerTimersChanged"];

  if (v18)
  {
    id v19 = (void *)[objc_alloc(MEMORY[0x263F089F8]) initWithName:@"COTimerManagerTimersChanged" object:self userInfo:v11];
    [(COTimerManager *)self _handleNotification:v19];
  }
}

- (void)_handleDTTimerClientEvent:(int64_t)a3 dtTimer:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = COLogForCategory(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    BOOL v11 = [(COTimerManager *)self dtMonitoring];
    __int16 v12 = "no";
    *(_DWORD *)int v18 = 134218754;
    *(_WORD *)&v18[12] = 2048;
    *(void *)&v18[4] = self;
    if (v11) {
      __int16 v12 = "yes";
    }
    *(void *)&v18[14] = a3;
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 2080;
    v22 = v12;
    _os_log_debug_impl(&dword_21D3E0000, v7, OS_LOG_TYPE_DEBUG, "%p got Distributed Timers event: %ld [%@] (dtMonitoring: %s)", v18, 0x2Au);
  }

  if (a3 != 11)
  {
    if (v6)
    {
      int v8 = [v6 mtTimer];
      if (!v8)
      {
        uint64_t v9 = COLogForCategory(1);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          -[COTimerManager _handleDTTimerClientEvent:dtTimer:]();
        }

        int v8 = 0;
LABEL_28:

        goto LABEL_29;
      }
    }
    else
    {
      int v8 = 0;
    }
    switch(a3)
    {
      case 0:
      case 1:
      case 2:
        uint64_t v10 = COLogForCategory(1);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)int v18 = 134218240;
          *(void *)&v18[4] = self;
          *(_WORD *)&v18[12] = 2048;
          *(void *)&v18[14] = a3;
          _os_log_impl(&dword_21D3E0000, v10, OS_LOG_TYPE_DEFAULT, "%p ignored DistributedTimers event %ld", v18, 0x16u);
        }
        goto LABEL_24;
      case 3:
        id v13 = [(COTimerManager *)self observers];
        int v14 = [v13 registeredNames];
        int v15 = [v14 containsObject:@"COTimerManagerStateReset"];

        if (v15)
        {
          uint64_t v16 = (void *)[objc_alloc(MEMORY[0x263F089F8]) initWithName:@"COTimerManagerStateReset" object:self userInfo:0];
          [(COTimerManager *)self _handleNotification:v16];
        }
        goto LABEL_28;
      case 4:
        [(COTimerManager *)self _updateCanDispatch];
        goto LABEL_28;
      case 5:
        uint64_t v17 = @"COTimerManagerTimersAdded";
        goto LABEL_27;
      case 6:
        uint64_t v17 = @"COTimerManagerTimersUpdated";
        goto LABEL_27;
      case 7:
        uint64_t v17 = @"COTimerManagerTimersRemoved";
        goto LABEL_27;
      case 9:
        uint64_t v17 = @"COTimerManagerFiringTimerDismissed";
        goto LABEL_27;
      case 10:
        uint64_t v17 = @"COTimerManagerTimerFired";
LABEL_27:
        -[COTimerManager _emitNotificationForName:timer:](self, "_emitNotificationForName:timer:", v17, v8, *(_OWORD *)v18);
        break;
      default:
        uint64_t v10 = COLogForCategory(1);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[COAlarmManager _handleDTTimerClientEvent:dtTimer:]();
        }
LABEL_24:

        break;
    }
    goto LABEL_28;
  }
  [(COTimerManager *)self _updateMonitoring];
LABEL_29:
}

- (void)_activateDistributedTimersMonitoring
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = [(COTimerManager *)self dtClient];
  if (v3)
  {
    uint64_t v4 = [(COTimerManager *)self dtClient];
    BOOL v5 = [v4 eventHandler];

    if (!v5)
    {
      objc_initWeak(&location, self);
      uint64_t v14 = MEMORY[0x263EF8330];
      objc_copyWeak(&v15, &location);
      id v6 = [(COTimerManager *)self dtClient];
      [v6 setEventHandler:&v14];

      id v7 = COLogForCategory(1);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[COAlarmManager _activateDistributedTimersMonitoring]();
      }

      int v8 = [(COTimerManager *)self dtClient];
      [v8 activate];

      [(COTimerManager *)self setDtMonitoring:+[COFeatureStatus isDistributedTimersForHH1Enabled]];
      if (![(COTimerManager *)self dtMonitoring])
      {
        unint64_t v9 = [MEMORY[0x263F3A660] statusFlags];
        uint64_t v10 = COLogForCategory(1);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          int v18 = self;
          __int16 v19 = 2048;
          unint64_t v20 = v9;
          _os_log_impl(&dword_21D3E0000, v10, OS_LOG_TYPE_DEFAULT, "%p DTTimerClientStatusFlags: %ld", buf, 0x16u);
        }

        [(COTimerManager *)self setDtMonitoring:(v9 >> 1) & 1];
      }
      BOOL v11 = COLogForCategory(1);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v12 = [(COTimerManager *)self dtMonitoring];
        id v13 = "no";
        if (v12) {
          id v13 = "yes";
        }
        *(_DWORD *)buf = 134218242;
        int v18 = self;
        __int16 v19 = 2080;
        unint64_t v20 = (unint64_t)v13;
        _os_log_impl(&dword_21D3E0000, v11, OS_LOG_TYPE_DEFAULT, "%p activated DTTimerClient, using Distribued Timers for events: %s", buf, 0x16u);
      }

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
  }
}

void __54__COTimerManager__activateDistributedTimersMonitoring__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _handleDTTimerClientEvent:a2 dtTimer:v5];
}

- (void)_updateMonitoring
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (![(COTimerManager *)self dtMonitoring])
  {
    uint64_t v3 = [MEMORY[0x263F3A660] statusFlags];
    uint64_t v4 = COLogForCategory(1);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v26 = self;
      __int16 v27 = 2048;
      uint64_t v28 = v3;
      _os_log_impl(&dword_21D3E0000, v4, OS_LOG_TYPE_DEFAULT, "%p DTTimerClientStatusFlags update, now: %ld", buf, 0x16u);
    }

    id v5 = COLogForCategory(1);
    id v6 = v5;
    if ((v3 & 2) != 0)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v26 = self;
        _os_log_impl(&dword_21D3E0000, v6, OS_LOG_TYPE_DEFAULT, "%p switching observers to Distributed Timers", buf, 0xCu);
      }

      [(COTimerManager *)self setDtMonitoring:1];
      id v7 = [(COTimerManager *)self observers];
      id v6 = [v7 registeredNames];

      if ([v6 count])
      {
        v23[0] = MEMORY[0x263EF8330];
        v23[1] = 3221225472;
        v23[2] = __35__COTimerManager__updateMonitoring__block_invoke;
        v23[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
        v23[4] = self;
        int v8 = [(COTimerManager *)self _remoteInterfaceWithErrorHandler:v23];
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        uint64_t v16 = v6;
        obj = v6;
        uint64_t v9 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v20;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v20 != v11) {
                objc_enumerationMutation(obj);
              }
              uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * v12);
              uint64_t v14 = COLogForCategory(1);
              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 134218242;
                uint64_t v26 = self;
                __int16 v27 = 2112;
                uint64_t v28 = v13;
                _os_log_debug_impl(&dword_21D3E0000, v14, OS_LOG_TYPE_DEBUG, "%p removing observer %@ from coordinated", buf, 0x16u);
              }

              id v15 = [(COTimerManager *)self memento];
              v18[0] = MEMORY[0x263EF8330];
              v18[1] = 3221225472;
              v18[2] = __35__COTimerManager__updateMonitoring__block_invoke_138;
              v18[3] = &unk_264444C20;
              v18[4] = v13;
              v18[5] = self;
              [v8 removeObserverForNotificationName:v13 asAccessory:v15 withCallback:v18];

              ++v12;
            }
            while (v10 != v12);
            uint64_t v10 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
          }
          while (v10);
        }

        id v6 = v16;
      }
      else
      {
        int v8 = COLogForCategory(1);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          -[COAlarmManager _updateMonitoring]();
        }
      }
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      -[COAlarmManager _updateMonitoring]();
    }
  }
}

void __35__COTimerManager__updateMonitoring__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = COLogForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __35__COTimerManager__updateMonitoring__block_invoke_cold_1();
  }
}

void __35__COTimerManager__updateMonitoring__block_invoke_138(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = COLogForCategory(1);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      int v13 = 134218498;
      uint64_t v14 = v6;
      __int16 v15 = 2112;
      uint64_t v16 = v7;
      __int16 v17 = 2112;
      id v18 = v3;
      int v8 = "%p failed to remove observer for %@ from coordinated: %@";
      uint64_t v9 = v4;
      uint32_t v10 = 32;
LABEL_6:
      _os_log_impl(&dword_21D3E0000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v13, v10);
    }
  }
  else if (v5)
  {
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    int v13 = 134218242;
    uint64_t v14 = v11;
    __int16 v15 = 2112;
    uint64_t v16 = v12;
    int v8 = "%p removed observer for %@ from coordinated";
    uint64_t v9 = v4;
    uint32_t v10 = 22;
    goto LABEL_6;
  }
}

- (id)_timersForAccessory:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F58190]);
  uint32_t v6 = arc4random();
  uint64_t v7 = COLogForCategory(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = [v4 uniqueIdentifier];
    uint64_t v9 = [(COTimerManager *)self dtClient];
    *(_DWORD *)buf = 134218754;
    uint32_t v38 = self;
    __int16 v39 = 1024;
    uint32_t v40 = v6;
    __int16 v41 = 2114;
    v42 = v8;
    __int16 v43 = 2048;
    id v44 = v9;
    _os_log_impl(&dword_21D3E0000, v7, OS_LOG_TYPE_DEFAULT, "%p (%u) retrieving timers for %{public}@ [DT: %p]", buf, 0x26u);
  }
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __38__COTimerManager__timersForAccessory___block_invoke;
  v34[3] = &unk_264444C48;
  uint32_t v36 = v6;
  id v10 = v5;
  id v35 = v10;
  uint64_t v11 = (void *)MEMORY[0x21D4BD7F0](v34);
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __38__COTimerManager__timersForAccessory___block_invoke_139;
  v31[3] = &unk_2644455E0;
  uint32_t v33 = v6;
  id v12 = v10;
  id v32 = v12;
  int v13 = (void *)MEMORY[0x21D4BD7F0](v31);
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __38__COTimerManager__timersForAccessory___block_invoke_141;
  v27[3] = &unk_264444CE0;
  v27[4] = self;
  id v14 = v11;
  id v29 = v14;
  id v15 = v4;
  id v28 = v15;
  id v16 = v13;
  id v30 = v16;
  __int16 v17 = (void (**)(void))MEMORY[0x21D4BD7F0](v27);
  id v18 = [(COTimerManager *)self dtClient];

  if (v18)
  {
    uint64_t v19 = [(COTimerManager *)self dtClient];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    void v22[2] = __38__COTimerManager__timersForAccessory___block_invoke_3;
    v22[3] = &unk_264444D08;
    uint32_t v26 = v6;
    uint64_t v23 = v17;
    id v24 = v14;
    id v25 = v16;
    [v19 fetchTimersWithCompletionHandler:v22];
  }
  else
  {
    v17[2](v17);
  }
  id v20 = v12;

  return v20;
}

void __38__COTimerManager__timersForAccessory___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = COLogForCategory(1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __38__COTimerManager__timersForAccessory___block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) finishWithError:v3];
}

void __38__COTimerManager__timersForAccessory___block_invoke_139(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = COLogForCategory(1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(_DWORD *)(a1 + 40);
    v6[0] = 67109378;
    v6[1] = v5;
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_21D3E0000, v4, OS_LOG_TYPE_DEFAULT, "%u: retrieving timers done: %@", (uint8_t *)v6, 0x12u);
  }

  [*(id *)(a1 + 32) finishWithResult:v3];
}

void __38__COTimerManager__timersForAccessory___block_invoke_141(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteInterfaceWithErrorHandler:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) instanceID];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__COTimerManager__timersForAccessory___block_invoke_2;
  v5[3] = &unk_264444CB8;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  [v2 timersAsAccessory:v3 asInstance:v4 withCallback:v5];
}

uint64_t __38__COTimerManager__timersForAccessory___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __38__COTimerManager__timersForAccessory___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    if ([v6 code] == 8
      && ([v7 domain],
          id v8 = objc_claimAutoreleasedReturnValue(),
          int v9 = [v8 isEqualToString:@"DTError"],
          v8,
          v9))
    {
      id v10 = COLogForCategory(1);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = *(_DWORD *)(a1 + 56);
        v13[0] = 67109120;
        v13[1] = v11;
        _os_log_impl(&dword_21D3E0000, v10, OS_LOG_TYPE_DEFAULT, "%u: falling back to coordination", (uint8_t *)v13, 8u);
      }

      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    id v12 = TimersForDTTimers(v5);
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (BOOL)_canDispatchForAssociatedAccessory
{
  uint64_t v3 = COLogForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    [(COTimerManager *)self _canDispatchForAssociatedAccessory];
  }

  id v4 = [(COTimerManager *)self dtClient];

  if (!v4) {
    goto LABEL_9;
  }
  char v5 = [MEMORY[0x263F3A660] statusFlags];
  if (v5)
  {
    uint64_t v7 = COLogForCategory(1);
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR)) {
      -[COAlarmManager _canDispatchForAssociatedAccessory].cold.4();
    }
    BOOL v9 = 0;
  }
  else
  {
    if ((v5 & 2) == 0)
    {
      id v6 = COLogForCategory(1);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        -[COAlarmManager _canDispatchForAssociatedAccessory]();
      }

LABEL_9:
      uint64_t v7 = [(COTimerManager *)self accessory];
      uint64_t v8 = [(COTimerManager *)self instanceID];
      uint64_t v21 = 0;
      long long v22 = &v21;
      uint64_t v23 = 0x2020000000;
      BOOL v24 = (v7 | v8) == 0;
      if (v7 | v8)
      {
        id v10 = COLogForCategory(1);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          -[COAlarmManager _canDispatchForAssociatedAccessory]();
        }

        int v11 = [(COTimerManager *)self provider];
        id v12 = [v11 timerManagerServiceConnection];

        id v13 = [(COTimerManager *)self _remoteInterfaceWithErrorHandler:&__block_literal_global_144];
        v20[0] = MEMORY[0x263EF8330];
        v20[1] = 3221225472;
        v20[2] = __52__COTimerManager__canDispatchForAssociatedAccessory__block_invoke_2;
        v20[3] = &unk_264444E60;
        v20[4] = &v21;
        v20[5] = self;
        uint64_t v14 = [v12 synchronousRemoteObjectProxyWithErrorHandler:v20];
        id v15 = [(COTimerManager *)self memento];
        v19[0] = MEMORY[0x263EF8330];
        v19[1] = 3221225472;
        void v19[2] = __52__COTimerManager__canDispatchForAssociatedAccessory__block_invoke_145;
        v19[3] = &unk_264444E88;
        v19[4] = &v21;
        [v14 canDispatchAsAccessory:v15 asInstance:v8 reply:v19];

        BOOL v9 = *((unsigned char *)v22 + 24) != 0;
      }
      else
      {
        BOOL v9 = 1;
      }
      _Block_object_dispose(&v21, 8);

      goto LABEL_20;
    }
    id v16 = [(COTimerManager *)self dtClient];
    __int16 v17 = [v16 error];
    BOOL v9 = v17 == 0;

    uint64_t v7 = COLogForCategory(1);
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEBUG)) {
      -[COAlarmManager _canDispatchForAssociatedAccessory]();
    }
  }
LABEL_20:

  return v9;
}

void __52__COTimerManager__canDispatchForAssociatedAccessory__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = COLogForCategory(1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __52__COAlarmManager__canDispatchForAssociatedAccessory__block_invoke_2_cold_1();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
}

uint64_t __52__COTimerManager__canDispatchForAssociatedAccessory__block_invoke_145(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)_handleNotification:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = COLogForCategory(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 name];
    uint64_t v7 = [v4 userInfo];
    int v9 = 134218498;
    id v10 = self;
    __int16 v11 = 2112;
    id v12 = v6;
    __int16 v13 = 2112;
    uint64_t v14 = v7;
    _os_log_impl(&dword_21D3E0000, v5, OS_LOG_TYPE_DEFAULT, "%p forwarding notification %@: %@", (uint8_t *)&v9, 0x20u);
  }
  uint64_t v8 = [(COTimerManager *)self observers];
  [v8 postNotification:v4];
}

- (void)postNotificationName:(id)a3 withUserInfo:(id)a4 callback:(id)a5
{
  uint64_t v8 = (objc_class *)MEMORY[0x263F089F8];
  int v9 = (void (**)(id, void))a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = (id)[[v8 alloc] initWithName:v11 object:self userInfo:v10];

  [(COTimerManager *)self _handleNotification:v12];
  v9[2](v9, 0);
}

- (id)timers
{
  id v3 = [(COTimerManager *)self memento];
  id v4 = [(COTimerManager *)self _timersForAccessory:v3];

  return v4;
}

- (id)timersForAccessory:(id)a3
{
  id v4 = a3;
  char v5 = [[COHomeKitAccessoryMemento alloc] initWithHomeKitAccessory:v4];

  id v6 = [(COTimerManager *)self _timersForAccessory:v5];

  return v6;
}

- (id)timersForAccessories:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F58190]);
  uint32_t v6 = arc4random();
  uint64_t v7 = COLogForCategory(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v4 count];
    int v9 = [(COTimerManager *)self dtClient];
    *(_DWORD *)buf = 134219010;
    __int16 v39 = self;
    __int16 v40 = 1024;
    uint32_t v41 = v6;
    __int16 v42 = 2048;
    uint64_t v43 = v8;
    __int16 v44 = 2114;
    id v45 = v4;
    __int16 v46 = 2048;
    v47 = v9;
    _os_log_impl(&dword_21D3E0000, v7, OS_LOG_TYPE_DEFAULT, "%p (%u) retrieving timers for %ld:%{public}@ [DT: %p]", buf, 0x30u);
  }
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __39__COTimerManager_timersForAccessories___block_invoke;
  v35[3] = &unk_264444C48;
  uint32_t v37 = v6;
  id v10 = v5;
  id v36 = v10;
  id v11 = (void *)MEMORY[0x21D4BD7F0](v35);
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __39__COTimerManager_timersForAccessories___block_invoke_147;
  v32[3] = &unk_264444D30;
  uint32_t v34 = v6;
  id v12 = v10;
  id v33 = v12;
  __int16 v13 = (void *)MEMORY[0x21D4BD7F0](v32);
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __39__COTimerManager_timersForAccessories___block_invoke_149;
  v28[3] = &unk_264444CE0;
  v28[4] = self;
  id v14 = v11;
  id v30 = v14;
  id v15 = v4;
  id v29 = v15;
  id v16 = v13;
  id v31 = v16;
  __int16 v17 = (void (**)(void))MEMORY[0x21D4BD7F0](v28);
  id v18 = [(COTimerManager *)self dtClient];

  if (v18)
  {
    uint64_t v19 = [(COTimerManager *)self dtClient];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    void v22[2] = __39__COTimerManager_timersForAccessories___block_invoke_5;
    v22[3] = &unk_264444DC8;
    uint32_t v27 = v6;
    BOOL v24 = v17;
    id v25 = v14;
    id v23 = v15;
    id v26 = v16;
    [v19 fetchTimersWithCompletionHandler:v22];
  }
  else
  {
    v17[2](v17);
  }
  id v20 = v12;

  return v20;
}

void __39__COTimerManager_timersForAccessories___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = COLogForCategory(1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __38__COTimerManager__timersForAccessory___block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) finishWithError:v3];
}

void __39__COTimerManager_timersForAccessories___block_invoke_147(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = COLogForCategory(1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(_DWORD *)(a1 + 40);
    v6[0] = 67109378;
    v6[1] = v5;
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_21D3E0000, v4, OS_LOG_TYPE_DEFAULT, "%u: retrieving timers done: %@", (uint8_t *)v6, 0x12u);
  }

  [*(id *)(a1 + 32) finishWithResult:v3];
}

void __39__COTimerManager_timersForAccessories___block_invoke_149(id *a1)
{
  id v2 = [a1[4] _remoteInterfaceWithErrorHandler:a1[6]];
  id v3 = objc_msgSend(a1[5], "na_map:", &__block_literal_global_152);
  id v4 = [a1[4] memento];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __39__COTimerManager_timersForAccessories___block_invoke_3;
  v5[3] = &unk_264444DA0;
  id v7 = a1[6];
  id v6 = a1[5];
  id v8 = a1[7];
  [v2 timersAsAccessory:v4 forAccessories:v3 callback:v5];
}

COHomeKitAccessoryMemento *__39__COTimerManager_timersForAccessories___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[COHomeKitAccessoryMemento alloc] initWithHomeKitAccessory:v2];

  return v3;
}

void __39__COTimerManager_timersForAccessories___block_invoke_3(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    id v6 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    id v7 = (void *)a1[4];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __39__COTimerManager_timersForAccessories___block_invoke_4;
    v11[3] = &unk_264444D78;
    id v12 = v5;
    id v13 = v6;
    id v8 = v6;
    [v7 enumerateObjectsUsingBlock:v11];
    (*(void (**)(void, id, uint64_t, uint64_t))(a1[6] + 16))(a1[6], v8, v9, v10);
  }
}

void __39__COTimerManager_timersForAccessories___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v7 = v3;
  id v5 = [v3 uniqueIdentifier];
  id v6 = [v4 objectForKey:v5];

  if (v6) {
    [*(id *)(a1 + 40) setObject:v6 forKey:v7];
  }
}

void __39__COTimerManager_timersForAccessories___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    if ([v6 code] == 8
      && ([v7 domain],
          id v8 = objc_claimAutoreleasedReturnValue(),
          int v9 = [v8 isEqualToString:@"DTError"],
          v8,
          v9))
    {
      uint64_t v10 = COLogForCategory(1);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = *(_DWORD *)(a1 + 64);
        *(_DWORD *)buf = 67109120;
        int v23 = v11;
        _os_log_impl(&dword_21D3E0000, v10, OS_LOG_TYPE_DEFAULT, "%u: falling back to coordination", buf, 8u);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    id v12 = TimersForDTTimers(v5);
    id v13 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    id v14 = *(void **)(a1 + 32);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    void v19[2] = __39__COTimerManager_timersForAccessories___block_invoke_156;
    v19[3] = &unk_264444D78;
    id v20 = v13;
    id v21 = v12;
    id v15 = v12;
    id v16 = v13;
    [v14 enumerateObjectsUsingBlock:v19];
    (*(void (**)(void, id, uint64_t, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v16, v17, v18);
  }
}

uint64_t __39__COTimerManager_timersForAccessories___block_invoke_156(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setObject:*(void *)(a1 + 40) forKey:a2];
}

- (id)timersForAccessoryMementos:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F58190]);
  id v6 = [(COTimerManager *)self dtClient];

  if (v6)
  {
    id v7 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:3328 userInfo:MEMORY[0x263EFFA78]];
    [v5 finishWithError:v7];
    id v8 = v5;
  }
  else
  {
    int v9 = COLogForCategory(1);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [v4 count];
      int v11 = objc_msgSend(v4, "na_map:", &__block_literal_global_160);
      id v12 = [(COTimerManager *)self cluster];
      *(_DWORD *)buf = 134218754;
      uint32_t v27 = self;
      __int16 v28 = 2048;
      uint64_t v29 = v10;
      __int16 v30 = 2112;
      id v31 = v11;
      __int16 v32 = 2112;
      id v33 = v12;
      _os_log_impl(&dword_21D3E0000, v9, OS_LOG_TYPE_DEFAULT, "%p retrieving timers for %ld:%@ in %@...", buf, 0x2Au);
    }
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __45__COTimerManager_timersForAccessoryMementos___block_invoke_161;
    v23[3] = &unk_264444C20;
    id v25 = self;
    id v13 = v5;
    id v24 = v13;
    id v14 = [(COTimerManager *)self _remoteInterfaceWithErrorHandler:v23];
    id v15 = [(COTimerManager *)self memento];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    void v19[2] = __45__COTimerManager_timersForAccessoryMementos___block_invoke_162;
    v19[3] = &unk_264444E38;
    long long v22 = self;
    id v20 = v4;
    id v16 = v13;
    id v21 = v16;
    [v14 timersAsAccessory:v15 forAccessories:v20 callback:v19];

    id v17 = v16;
  }

  return v5;
}

uint64_t __45__COTimerManager_timersForAccessoryMementos___block_invoke(uint64_t a1, void *a2)
{
  return [a2 uniqueIdentifier];
}

void __45__COTimerManager_timersForAccessoryMementos___block_invoke_161(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = COLogForCategory(1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __45__COTimerManager_timersForAccessoryMementos___block_invoke_161_cold_1();
  }

  [*(id *)(a1 + 32) finishWithError:v3];
}

void __45__COTimerManager_timersForAccessoryMementos___block_invoke_162(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = COLogForCategory(1);
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __45__COTimerManager_timersForAccessoryMementos___block_invoke_162_cold_1();
    }

    [*(id *)(a1 + 40) finishWithError:v6];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 134218242;
      uint64_t v20 = v9;
      __int16 v21 = 2112;
      id v22 = v5;
      _os_log_impl(&dword_21D3E0000, v8, OS_LOG_TYPE_DEFAULT, "%p returned %@", buf, 0x16u);
    }

    id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    int v11 = *(void **)(a1 + 32);
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    id v15 = __45__COTimerManager_timersForAccessoryMementos___block_invoke_164;
    id v16 = &unk_264444E10;
    id v17 = v5;
    id v18 = v10;
    id v12 = v10;
    [v11 enumerateObjectsUsingBlock:&v13];
    objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", v12, v13, v14, v15, v16);
  }
}

void __45__COTimerManager_timersForAccessoryMementos___block_invoke_164(uint64_t a1, void *a2)
{
  id v4 = [a2 uniqueIdentifier];
  id v3 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
  if (v3) {
    [*(id *)(a1 + 40) setObject:v3 forKey:v4];
  }
}

- (id)addTimer:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __27__COTimerManager_addTimer___block_invoke_2;
  v8[3] = &unk_264445608;
  id v9 = v4;
  id v10 = self;
  id v5 = v4;
  id v6 = [(COTimerManager *)self _sendRequestWithName:@"add" forTimer:v5 distributedTimers:&__block_literal_global_171 coordination:v8];

  return v6;
}

uint64_t __27__COTimerManager_addTimer___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addTimer:completionHandler:");
}

void __27__COTimerManager_addTimer___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v7 = a3;
  id v8 = a2;
  id v10 = [v6 memento];
  id v9 = [*(id *)(a1 + 40) instanceID];
  [v8 addTimer:v5 asAccessory:v10 asInstance:v9 withCallback:v7];
}

- (id)updateTimer:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __30__COTimerManager_updateTimer___block_invoke_2;
  v8[3] = &unk_264445608;
  id v9 = v4;
  id v10 = self;
  id v5 = v4;
  id v6 = [(COTimerManager *)self _sendRequestWithName:@"update" forTimer:v5 distributedTimers:&__block_literal_global_177 coordination:v8];

  return v6;
}

uint64_t __30__COTimerManager_updateTimer___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateTimer:completionHandler:");
}

void __30__COTimerManager_updateTimer___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 memento];
  [v7 updateTimer:v4 asAccessory:v8 withCallback:v6];
}

- (id)removeTimer:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __30__COTimerManager_removeTimer___block_invoke_2;
  v8[3] = &unk_264445608;
  id v9 = v4;
  id v10 = self;
  id v5 = v4;
  id v6 = [(COTimerManager *)self _sendRequestWithName:@"remove" forTimer:v5 distributedTimers:&__block_literal_global_182_0 coordination:v8];

  return v6;
}

uint64_t __30__COTimerManager_removeTimer___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeTimer:completionHandler:");
}

void __30__COTimerManager_removeTimer___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 memento];
  [v7 removeTimer:v4 asAccessory:v8 withCallback:v6];
}

- (id)dismissTimerWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v4];
  id v6 = (void *)[objc_alloc(MEMORY[0x263F55D90]) initWithIdentifier:v5];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __45__COTimerManager_dismissTimerWithIdentifier___block_invoke_2;
  v10[3] = &unk_264445608;
  id v11 = v4;
  id v12 = self;
  id v7 = v4;
  id v8 = [(COTimerManager *)self _sendRequestWithName:@"dismiss" forTimer:v6 distributedTimers:&__block_literal_global_187_0 coordination:v10];

  return v8;
}

uint64_t __45__COTimerManager_dismissTimerWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dismissTimer:completionHandler:");
}

void __45__COTimerManager_dismissTimerWithIdentifier___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 memento];
  [v7 dismissTimerWithIdentifier:v4 asAccessory:v8 withCallback:v6];
}

- (id)addObserverForName:(id)a3 queue:(id)a4 usingBlock:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = COLogForCategory(1);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 134218242;
    __int16 v21 = self;
    __int16 v22 = 2112;
    id v23 = v8;
    _os_log_impl(&dword_21D3E0000, v11, OS_LOG_TYPE_DEFAULT, "%p adding observer for %@", (uint8_t *)&v20, 0x16u);
  }

  id v12 = [(COTimerManager *)self observers];
  uint64_t v13 = [v12 registeredNames];
  uint64_t v14 = [v12 addObserverForName:v8 observable:self queue:v10 usingBlock:v9];

  [(COTimerManager *)self _activateDistributedTimersMonitoring];
  if (![(COTimerManager *)self dtMonitoring])
  {
    id v15 = COLogForCategory(1);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 134218242;
      __int16 v21 = self;
      __int16 v22 = 2112;
      id v23 = v8;
      _os_log_impl(&dword_21D3E0000, v15, OS_LOG_TYPE_DEFAULT, "%p using Coordination for observer %@", (uint8_t *)&v20, 0x16u);
    }

    int v16 = [v13 containsObject:v8];
    id v17 = COLogForCategory(1);
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
    if (v16)
    {
      if (v18) {
        -[COTimerManager addObserverForName:queue:usingBlock:]((uint64_t)self);
      }
    }
    else
    {
      if (v18) {
        -[COTimerManager addObserverForName:queue:usingBlock:]((uint64_t)self);
      }

      [(COTimerManager *)self _registerObserverWithName:v8];
    }
  }

  return v14;
}

- (void)removeObserver:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = COLogForCategory(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    BOOL v18 = self;
    _os_log_impl(&dword_21D3E0000, v5, OS_LOG_TYPE_DEFAULT, "%p removing observer...", buf, 0xCu);
  }

  id v6 = [(COTimerManager *)self observers];
  [v6 removeObserver:v4];
  if (![(COTimerManager *)self dtMonitoring])
  {
    id v7 = [v4 name];
    id v8 = [v6 registeredNames];
    char v9 = [v8 containsObject:v7];

    if ((v9 & 1) == 0)
    {
      id v10 = COLogForCategory(1);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[COTimerManager removeObserver:]((uint64_t)self);
      }

      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __33__COTimerManager_removeObserver___block_invoke;
      v16[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
      v16[4] = self;
      id v11 = [(COTimerManager *)self _remoteInterfaceWithErrorHandler:v16];
      id v12 = [(COTimerManager *)self memento];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      _DWORD v13[2] = __33__COTimerManager_removeObserver___block_invoke_188;
      v13[3] = &unk_264444C20;
      id v15 = self;
      id v14 = v7;
      [v11 removeObserverForNotificationName:v14 asAccessory:v12 withCallback:v13];
    }
  }
}

void __33__COTimerManager_removeObserver___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = COLogForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __35__COTimerManager__updateMonitoring__block_invoke_cold_1();
  }
}

void __33__COTimerManager_removeObserver___block_invoke_188(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = COLogForCategory(1);
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __33__COTimerManager_removeObserver___block_invoke_188_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 134218242;
    uint64_t v9 = v6;
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    _os_log_impl(&dword_21D3E0000, v5, OS_LOG_TYPE_DEFAULT, "%p removed last observer for %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)_registerObserverWithName:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = COLogForCategory(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    __int16 v21 = self;
    __int16 v22 = 2112;
    id v23 = v4;
    _os_log_impl(&dword_21D3E0000, v5, OS_LOG_TYPE_DEFAULT, "%p registering observer with service for %@", buf, 0x16u);
  }

  uint64_t v6 = [(COTimerManager *)self accessory];
  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    int v8 = _COAssociatedAccessories(v6);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __44__COTimerManager__registerObserverWithName___block_invoke;
    v18[3] = &unk_264444EF8;
    id v9 = v7;
    id v19 = v9;
    [v8 enumerateObjectsUsingBlock:v18];
  }
  else
  {
    id v9 = 0;
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __44__COTimerManager__registerObserverWithName___block_invoke_2;
  v17[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v17[4] = self;
  __int16 v10 = [(COTimerManager *)self _remoteInterfaceWithErrorHandler:v17];
  uint64_t v11 = [(COTimerManager *)self memento];
  uint64_t v12 = [(COTimerManager *)self instanceID];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __44__COTimerManager__registerObserverWithName___block_invoke_191;
  v14[3] = &unk_264444C20;
  id v15 = v4;
  int v16 = self;
  id v13 = v4;
  [v10 addObserverForNotificationName:v13 asAccessory:v11 asInstance:v12 constraints:v9 withCallback:v14];
}

void __44__COTimerManager__registerObserverWithName___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 uniqueIdentifier];
  [v2 addObject:v3];
}

void __44__COTimerManager__registerObserverWithName___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = COLogForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __44__COTimerManager__registerObserverWithName___block_invoke_2_cold_1();
  }
}

void __44__COTimerManager__registerObserverWithName___block_invoke_191(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = COLogForCategory(1);
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __44__COTimerManager__registerObserverWithName___block_invoke_191_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 134218242;
    uint64_t v9 = v6;
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    _os_log_impl(&dword_21D3E0000, v5, OS_LOG_TYPE_DEFAULT, "%p added timer observer for %@", (uint8_t *)&v8, 0x16u);
  }
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (NSXPCConnection)lastConnection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lastConnection);

  return (NSXPCConnection *)WeakRetained;
}

- (void)setLastConnection:(id)a3
{
}

- (DTTimerClient)dtClient
{
  return self->_dtClient;
}

- (void)setDtClient:(id)a3
{
}

- (BOOL)dtMonitoring
{
  return self->_dtMonitoring;
}

- (void)setDtMonitoring:(BOOL)a3
{
  self->_dtMonitoring = a3;
}

- (BOOL)canDispatch
{
  return self->_canDispatch;
}

- (void)setCanDispatch:(BOOL)a3
{
  self->_canDispatch = a3;
}

- (COTimerManagerConnectionProvider)provider
{
  return self->_provider;
}

- (COObserverSet)observers
{
  return self->_observers;
}

- (id)cluster
{
  return self->_cluster;
}

- (COHomeKitAccessoryMemento)memento
{
  return self->_memento;
}

- (NSUUID)instanceID
{
  return self->_instanceID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceID, 0);
  objc_storeStrong((id *)&self->_memento, 0);
  objc_storeStrong(&self->_cluster, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_dtClient, 0);
  objc_destroyWeak((id *)&self->_lastConnection);

  objc_storeStrong((id *)&self->_accessory, 0);
}

void __51__COTimerManager__remoteInterfaceWithErrorHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21D3E0000, v0, v1, "%p connection to timer service interrupted", v2, v3, v4, v5, v6);
}

void __51__COTimerManager__remoteInterfaceWithErrorHandler___block_invoke_127_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21D3E0000, v0, v1, "%p connection to timer service invalidated", v2, v3, v4, v5, v6);
}

void __79__COTimerManager__sendRequestWithName_forTimer_distributedTimers_coordination___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v5 = *(_DWORD *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = [*(id *)(a1 + 40) timerID];
  v8[0] = 67109890;
  v8[1] = v5;
  __int16 v9 = 2114;
  uint64_t v10 = v6;
  __int16 v11 = 2114;
  uint64_t v12 = v7;
  __int16 v13 = 2112;
  uint64_t v14 = a2;
  _os_log_error_impl(&dword_21D3E0000, a3, OS_LOG_TYPE_ERROR, "%u: %{public}@ timer %{public}@ failed: %@", (uint8_t *)v8, 0x26u);
}

- (void)_handleDTTimerClientEvent:dtTimer:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_21D3E0000, v0, v1, "%p ignoring Distributed Timers non-timer event", v2, v3, v4, v5, v6);
}

void __35__COTimerManager__updateMonitoring__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_0(&dword_21D3E0000, v0, v1, "%p failed to get remote proxy - %@");
}

void __38__COTimerManager__timersForAccessory___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10(&dword_21D3E0000, v0, v1, "%u: retrieving timers failed: %{public}@");
}

- (void)_canDispatchForAssociatedAccessory
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a1 dtClient];
  uint64_t v5 = [a1 dtClient];
  uint8_t v6 = [v5 error];
  uint64_t v7 = "yes";
  int v8 = 134218498;
  __int16 v9 = a1;
  if (!v6) {
    uint64_t v7 = "no";
  }
  __int16 v10 = 2048;
  __int16 v11 = v4;
  __int16 v12 = 2080;
  __int16 v13 = v7;
  _os_log_debug_impl(&dword_21D3E0000, a2, OS_LOG_TYPE_DEBUG, "%p _canDispatchForAssociatedAccessory: %p, %s", (uint8_t *)&v8, 0x20u);
}

void __45__COTimerManager_timersForAccessoryMementos___block_invoke_161_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_0(&dword_21D3E0000, v0, v1, "%p failed to retrieve timers (%@)");
}

void __45__COTimerManager_timersForAccessoryMementos___block_invoke_162_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_0(&dword_21D3E0000, v0, v1, "%p retrieving timers failed (%@)");
}

- (void)addObserverForName:(uint64_t)a1 queue:usingBlock:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_0(&dword_21D3E0000, v1, v2, "%p repeated add observer for %@", (void)v3, DWORD2(v3));
}

- (void)addObserverForName:(uint64_t)a1 queue:usingBlock:.cold.2(uint64_t a1)
{
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_0(&dword_21D3E0000, v1, v2, "%p is getting a new observer for %@", (void)v3, DWORD2(v3));
}

- (void)removeObserver:(uint64_t)a1 .cold.1(uint64_t a1)
{
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_0(&dword_21D3E0000, v1, v2, "%p removing last observer for %@", (void)v3, DWORD2(v3));
}

void __33__COTimerManager_removeObserver___block_invoke_188_cold_1()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_6(&dword_21D3E0000, v0, v1, "%p failed to remove observer for %@ - %@");
}

void __44__COTimerManager__registerObserverWithName___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_0(&dword_21D3E0000, v0, v1, "%p failed to get timer remote proxy for add - %@");
}

void __44__COTimerManager__registerObserverWithName___block_invoke_191_cold_1()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_6(&dword_21D3E0000, v0, v1, "%p failed to add timer observer for %@ - %@");
}

@end