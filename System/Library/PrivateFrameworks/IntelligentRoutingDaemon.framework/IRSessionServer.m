@interface IRSessionServer
+ (BOOL)isGlobalLowLatencyMiLoWithPersistenceManager:(id)a3;
- (BOOL)shouldAcceptNewConnection:(id)a3;
- (BOOL)unregisterWithServiceIdentifier:(id)a3 withConnection:(id)a4;
- (IRAVOutputContextController)audioAVOutputContextController;
- (IRAVOutputDeviceProvider)avOutputDeviceProvider;
- (IRBackgroundActivitiesManager)backgroundActivitiesManager;
- (IRBiomeProvider)biomeProvider;
- (IRDisplayMonitor)displayMonitor;
- (IRPersistenceManager)persistenceManager;
- (IRProximityProvider)proximityProvider;
- (IRRapportProvider)rapportProvider;
- (IRSessionServer)initWithQueue:(id)a3;
- (NSMutableDictionary)connections;
- (NSMutableDictionary)services;
- (OS_dispatch_queue)queue;
- (id)registerWithServiceIdentifier:(id)a3 withConnection:(id)a4;
- (os_unfair_lock_s)lock;
- (unint64_t)stateCaptureHandle;
- (void)_dispatchToConnectionsForServiceContainer:(id)a3 usingBlock:(id)a4;
- (void)_logConnectionsAndServices;
- (void)_logStateOnStateCaptureEvent;
- (void)_refreshUpdateModeForServiceIdentifier:(id)a3;
- (void)dealloc;
- (void)performXPCActivityUnderServerContext:(id)a3;
- (void)refreshUpdateModeForServiceIdentifier:(id)a3;
- (void)serviceContainer:(id)a3 didSpotOnLocationCompleteForClientIds:(id)a4 withError:(id)a5;
- (void)serviceContainer:(id)a3 didUpdateBundlesWithSignificantInteractionPattern:(id)a4;
- (void)serviceContainer:(id)a3 didUpdateContexts:(id)a4 withReason:(id)a5;
- (void)setAudioAVOutputContextController:(id)a3;
- (void)setAvOutputDeviceProvider:(id)a3;
- (void)setBackgroundActivitiesManager:(id)a3;
- (void)setBiomeProvider:(id)a3;
- (void)setConnections:(id)a3;
- (void)setDisplayMonitor:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setPersistenceManager:(id)a3;
- (void)setProximityProvider:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRapportProvider:(id)a3;
- (void)setServices:(id)a3;
- (void)setStateCaptureHandle:(unint64_t)a3;
@end

@implementation IRSessionServer

void __100__IRSessionServer_IRServiceContainerDelegate___dispatchToConnectionsForServiceContainer_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
  os_unfair_lock_lock(v4);
  v5 = [*(id *)(a1 + 40) serviceIdentifier];
  if (v5)
  {
    v6 = [v3 connections];
    v7 = [v6 objectForKeyedSubscript:v5];

    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __100__IRSessionServer_IRServiceContainerDelegate___dispatchToConnectionsForServiceContainer_usingBlock___block_invoke_2;
    v8[3] = &unk_26539FB08;
    id v9 = *(id *)(a1 + 48);
    [v7 enumerateObjectsUsingBlock:v8];
  }
  os_unfair_lock_unlock(v4);
}

uint64_t __93__IRSessionServer_IRServiceContainerDelegate__serviceContainer_didUpdateContexts_withReason___block_invoke(uint64_t a1, void *a2)
{
  return [a2 didUpdateContexts:*(void *)(a1 + 32) withReason:*(void *)(a1 + 40)];
}

uint64_t __100__IRSessionServer_IRServiceContainerDelegate___dispatchToConnectionsForServiceContainer_usingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)serviceContainer:(id)a3 didUpdateContexts:(id)a4 withReason:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __93__IRSessionServer_IRServiceContainerDelegate__serviceContainer_didUpdateContexts_withReason___block_invoke;
  v12[3] = &unk_26539FB58;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(IRSessionServer *)self _dispatchToConnectionsForServiceContainer:a3 usingBlock:v12];
}

- (void)_dispatchToConnectionsForServiceContainer:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IRSessionServer *)self queue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __100__IRSessionServer_IRServiceContainerDelegate___dispatchToConnectionsForServiceContainer_usingBlock___block_invoke;
  v11[3] = &unk_26539FB30;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  IRDispatchAsyncWithStrongSelf(v8, self, v11);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)refreshUpdateModeForServiceIdentifier:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = [(IRSessionServer *)self services];
  id v7 = [v6 objectForKeyedSubscript:v4];

  if (v7)
  {
    [(IRSessionServer *)self _refreshUpdateModeForServiceIdentifier:v4];
  }
  else
  {
    id v8 = *MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR)) {
      -[IRSessionServer refreshUpdateModeForServiceIdentifier:]((uint64_t)v4, v8);
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)_refreshUpdateModeForServiceIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(IRSessionServer *)self services];
  id v12 = [v5 objectForKeyedSubscript:v4];

  uint64_t v6 = [v12 getUpdateMode];
  id v7 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K = %@", @"mode", &unk_2703AF068];
  id v8 = [(IRSessionServer *)self connections];
  id v9 = [v8 objectForKeyedSubscript:v4];

  id v10 = [v9 filteredArrayUsingPredicate:v7];
  uint64_t v11 = [v10 count] != 0;

  if (v6 != v11) {
    [v12 setUpdateMode:v11];
  }
}

- (NSMutableDictionary)services
{
  return self->_services;
}

- (NSMutableDictionary)connections
{
  return self->_connections;
}

- (IRSessionServer)initWithQueue:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)IRSessionServer;
  v5 = [(IRSessionServer *)&v35 init];
  uint64_t v6 = v5;
  if (v5)
  {
    [(IRSessionServer *)v5 setQueue:v4];
    [(IRSessionServer *)v6 setLock:0];
    id v7 = objc_opt_new();
    [(IRSessionServer *)v6 setConnections:v7];

    id v8 = objc_opt_new();
    [(IRSessionServer *)v6 setServices:v8];

    id v9 = objc_alloc_init(IRAVOutputDeviceProvider);
    [(IRSessionServer *)v6 setAvOutputDeviceProvider:v9];

    id v10 = [IRAVOutputDeviceDiscoverySessionController alloc];
    uint64_t v11 = [(IRSessionServer *)v6 avOutputDeviceProvider];
    id v12 = [(IRAVOutputDeviceDiscoverySessionController *)v10 initWithAVOutputDeviceProvider:v11];
    id v13 = [(IRSessionServer *)v6 avOutputDeviceProvider];
    [v13 setDiscoverySessionController:v12];

    id v14 = objc_alloc_init(IRPersistenceManager);
    [(IRSessionServer *)v6 setPersistenceManager:v14];

    v15 = objc_alloc_init(IRBiomeProvider);
    [(IRSessionServer *)v6 setBiomeProvider:v15];

    v16 = [(IRSessionServer *)v6 biomeProvider];
    v17 = [v16 createStandardBiomeInterface];
    v18 = [(IRSessionServer *)v6 biomeProvider];
    [v18 setBiomeInterface:v17];

    v19 = objc_alloc_init(IRRapportProvider);
    [(IRSessionServer *)v6 setRapportProvider:v19];

    v20 = objc_alloc_init(IRProximityProvider);
    [(IRSessionServer *)v6 setProximityProvider:v20];

    v21 = [[IRBackgroundActivitiesManager alloc] initWithServer:v6];
    [(IRSessionServer *)v6 setBackgroundActivitiesManager:v21];

    v22 = objc_alloc_init(IRDisplayMonitor);
    [(IRSessionServer *)v6 setDisplayMonitor:v22];

    v23 = [[IRAVOutputContextController alloc] initWithOutputContextType:0];
    [(IRSessionServer *)v6 setAudioAVOutputContextController:v23];

    v24 = [(IRSessionServer *)v6 persistenceManager];
    LODWORD(v17) = [v24 connectToStore];

    if (v17)
    {
      v25 = [(IRSessionServer *)v6 persistenceManager];
      +[IRServiceStore idendifyAndDeleteDuplicateServicesWithWithPersistenceManager:v25];

      v26 = [(IRSessionServer *)v6 persistenceManager];
      +[IRServiceStore adjustDBToStaticTokens:v26];

      v27 = [(IRSessionServer *)v6 persistenceManager];
      +[IRServiceStore adjustFirstSeenDateOfCandidates:v27];
    }
    else
    {
      v28 = *MEMORY[0x263F50090];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR)) {
        -[IRSessionServer initWithQueue:](v28);
      }
    }
    objc_initWeak(&location, v6);
    v29 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v30 = dispatch_queue_create("com.apple.intelligentroutingd.stateCapture", v29);
    uint64_t v32 = MEMORY[0x263EF8330];
    objc_copyWeak(&v33, &location);
    -[IRSessionServer setStateCaptureHandle:](v6, "setStateCaptureHandle:", os_state_add_handler(), v32, 3221225472, __33__IRSessionServer_initWithQueue___block_invoke, &unk_26539FA98);

    notify_post((const char *)[(id)*MEMORY[0x263F500A8] UTF8String]);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }

  return v6;
}

uint64_t __33__IRSessionServer_initWithQueue___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 16) == 3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v3 = WeakRetained;
    if (WeakRetained) {
      [WeakRetained _logStateOnStateCaptureEvent];
    }
  }
  return 0;
}

- (id)registerWithServiceIdentifier:(id)a3 withConnection:(id)a4
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v8 = [(IRSessionServer *)self connections];
  id v9 = [v8 objectForKeyedSubscript:v6];

  if (v9)
  {
    id v10 = [(IRSessionServer *)self connections];
    uint64_t v11 = [v10 objectForKeyedSubscript:v6];
    int v12 = [v11 containsObject:v7];

    if (v12)
    {
      id v13 = (id)*MEMORY[0x263F50090];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v34 = NSNumber;
        objc_super v35 = [v7 client];
        v36 = [v35 connection];
        v37 = objc_msgSend(v34, "numberWithInt:", objc_msgSend(v36, "processIdentifier"));
        *(_DWORD *)buf = 138412546;
        id v44 = v6;
        __int16 v45 = 2112;
        v46 = v37;
        _os_log_error_impl(&dword_25418E000, v13, OS_LOG_TYPE_ERROR, "#session-server, [ErrorId - Duplicate connection] Registering the same connection twice: %@ for pid: %@", buf, 0x16u);
      }
LABEL_6:
      id v14 = 0;
      goto LABEL_14;
    }
  }
  else
  {
    v15 = objc_opt_new();
    v16 = [(IRSessionServer *)self connections];
    [v16 setObject:v15 forKeyedSubscript:v6];
  }
  v17 = [(IRSessionServer *)self connections];
  v18 = [v17 objectForKeyedSubscript:v6];
  [v18 addObject:v7];

  v19 = [(IRSessionServer *)self services];
  id v14 = [v19 objectForKeyedSubscript:v6];

  if (!v14)
  {
    v39 = [IRServiceContainer alloc];
    v41 = [(IRSessionServer *)self avOutputDeviceProvider];
    v40 = [(IRSessionServer *)self biomeProvider];
    v20 = [(IRSessionServer *)self rapportProvider];
    v21 = [(IRSessionServer *)self proximityProvider];
    v22 = [(IRSessionServer *)self persistenceManager];
    v23 = [(IRSessionServer *)self displayMonitor];
    v24 = [(IRSessionServer *)self audioAVOutputContextController];
    v25 = [(IRSessionServer *)self persistenceManager];
    LOBYTE(v38) = +[IRSessionServer isGlobalLowLatencyMiLoWithPersistenceManager:v25];
    id v14 = [(IRServiceContainer *)v39 initWithServiceIdentifier:v6 delegate:self avOutputDeviceProvider:v41 biomeProvider:v40 rapportProvider:v20 proximityProvider:v21 persistenceManager:v22 displayMonitor:v23 audioAVOutputContextController:v24 isLowLatencyMiLo:v38];

    if (!v14)
    {
      id v33 = *MEMORY[0x263F50090];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR)) {
        -[IRSessionServer registerWithServiceIdentifier:withConnection:]((uint64_t)v6, v33);
      }
      goto LABEL_6;
    }
    v26 = [(IRSessionServer *)self services];
    [v26 setObject:v14 forKeyedSubscript:v6];
  }
  [(IRServiceContainer *)v14 requestUpdatedBundlesWithSignificantInteraction];
  v27 = (id)*MEMORY[0x263F50090];
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = NSNumber;
    v29 = [v7 client];
    dispatch_queue_t v30 = [v29 connection];
    v31 = objc_msgSend(v28, "numberWithInt:", objc_msgSend(v30, "processIdentifier"));
    *(_DWORD *)buf = 138412546;
    id v44 = v6;
    __int16 v45 = 2112;
    v46 = v31;
    _os_log_impl(&dword_25418E000, v27, OS_LOG_TYPE_DEFAULT, "#session-server, New connection registered for serviceIdentifier: %@ and pid: %@", buf, 0x16u);
  }
  [(IRSessionServer *)self _logConnectionsAndServices];
LABEL_14:
  os_unfair_lock_unlock(lock);

  return v14;
}

- (BOOL)unregisterWithServiceIdentifier:(id)a3 withConnection:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v9 = [(IRSessionServer *)self connections];
  id v10 = [v9 objectForKeyedSubscript:v6];
  char v11 = [v10 containsObject:v7];

  if ((v11 & 1) == 0)
  {
    v19 = (id)*MEMORY[0x263F50090];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = NSNumber;
      v21 = [v7 client];
      v22 = [v21 connection];
      v23 = objc_msgSend(v20, "numberWithInt:", objc_msgSend(v22, "processIdentifier"));
      int v39 = 138412546;
      id v40 = v6;
      __int16 v41 = 2112;
      v42 = v23;
      _os_log_error_impl(&dword_25418E000, v19, OS_LOG_TYPE_ERROR, "#session-server, [ErrorId - Unregister unavailable connection] Unregistering a connection which is not available: %@ for pid: %@", (uint8_t *)&v39, 0x16u);
    }
    goto LABEL_9;
  }
  int v12 = [(IRSessionServer *)self services];
  id v13 = [v12 objectForKeyedSubscript:v6];

  if (!v13)
  {
    v19 = (id)*MEMORY[0x263F50090];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_super v35 = NSNumber;
      v36 = [v7 client];
      v37 = [v36 connection];
      uint64_t v38 = objc_msgSend(v35, "numberWithInt:", objc_msgSend(v37, "processIdentifier"));
      int v39 = 138412546;
      id v40 = v6;
      __int16 v41 = 2112;
      v42 = v38;
      _os_log_error_impl(&dword_25418E000, v19, OS_LOG_TYPE_ERROR, "#session-server, [ErrorId - Unregister unavailable identifier] Unregistering a serviceIdentifier which is not available: %@ for pid: %@", (uint8_t *)&v39, 0x16u);
    }
LABEL_9:

    BOOL v24 = 0;
    goto LABEL_14;
  }
  id v14 = [(IRSessionServer *)self connections];
  v15 = [v14 objectForKeyedSubscript:v6];
  [v15 removeObject:v7];

  v16 = [(IRSessionServer *)self connections];
  v17 = [v16 objectForKeyedSubscript:v6];
  uint64_t v18 = [v17 count];

  if (v18)
  {
    [(IRSessionServer *)self _refreshUpdateModeForServiceIdentifier:v6];
  }
  else
  {
    v25 = [(IRSessionServer *)self connections];
    [v25 removeObjectForKey:v6];

    v26 = [(IRSessionServer *)self services];
    v27 = [v26 objectForKeyedSubscript:v6];
    [v27 deallocSync];

    v28 = [(IRSessionServer *)self services];
    [v28 removeObjectForKey:v6];
  }
  v29 = (id)*MEMORY[0x263F50090];
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_queue_t v30 = NSNumber;
    v31 = [v7 client];
    uint64_t v32 = [v31 connection];
    id v33 = objc_msgSend(v30, "numberWithInt:", objc_msgSend(v32, "processIdentifier"));
    int v39 = 138412546;
    id v40 = v6;
    __int16 v41 = 2112;
    v42 = v33;
    _os_log_impl(&dword_25418E000, v29, OS_LOG_TYPE_DEFAULT, "#session-server, Unregister connection for serviceIdentifier: %@ and pid: %@", (uint8_t *)&v39, 0x16u);
  }
  [(IRSessionServer *)self _logConnectionsAndServices];
  BOOL v24 = 1;
LABEL_14:
  os_unfair_lock_unlock(p_lock);

  return v24;
}

- (BOOL)shouldAcceptNewConnection:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = [[IRSessionClientProxy alloc] initWithConnection:v4];
  if (v6)
  {
    id v7 = [[IRSessionConnection alloc] initWithServer:self client:v6];
    id v8 = IRMakeXPCServerInterface();
    [v4 setExportedInterface:v8];

    id v9 = IRMakeXPCClientInterface();
    [v4 setRemoteObjectInterface:v9];

    [v4 setExportedObject:v7];
    objc_initWeak(&location, v7);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __45__IRSessionServer_shouldAcceptNewConnection___block_invoke;
    v16[3] = &unk_26539FA70;
    objc_copyWeak(&v17, &location);
    [v4 setInterruptionHandler:v16];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __45__IRSessionServer_shouldAcceptNewConnection___block_invoke_2;
    v14[3] = &unk_26539FA70;
    objc_copyWeak(&v15, &location);
    [v4 setInvalidationHandler:v14];
    [v4 resume];
    id v10 = (id)*MEMORY[0x263F50090];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      char v11 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "processIdentifier"));
      *(_DWORD *)buf = 138412290;
      v20 = v11;
      _os_log_impl(&dword_25418E000, v10, OS_LOG_TYPE_DEFAULT, "#session-server, Accepting connection for pid: %@", buf, 0xCu);
    }
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    id v7 = (IRSessionConnection *)(id)*MEMORY[0x263F50090];
    if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_ERROR))
    {
      int v12 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "processIdentifier"));
      [(IRSessionServer *)v12 shouldAcceptNewConnection:&v7->super];
    }
  }

  os_unfair_lock_unlock(p_lock);
  return v6 != 0;
}

void __45__IRSessionServer_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained xpcInvalidationHandler];
}

void __45__IRSessionServer_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained xpcInterruptionHandler];
}

- (void)performXPCActivityUnderServerContext:(id)a3
{
  id v4 = a3;
  v5 = [(IRSessionServer *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__IRSessionServer_performXPCActivityUnderServerContext___block_invoke;
  v7[3] = &unk_26539FAC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  IRDispatchAsyncWithStrongSelf(v5, self, v7);
}

void __56__IRSessionServer_performXPCActivityUnderServerContext___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
  os_unfair_lock_lock(v3);
  uint64_t v4 = *(void *)(a1 + 40);
  v5 = [v7 persistenceManager];
  id v6 = [v7 services];
  (*(void (**)(uint64_t, void *, void *))(v4 + 16))(v4, v5, v6);

  os_unfair_lock_unlock(v3);
}

+ (BOOL)isGlobalLowLatencyMiLoWithPersistenceManager:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 connectToStore])
  {
    +[IRServiceStore fetchAllServicesWithPersistenceManager:v3];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v21)
    {
      uint64_t v20 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v23 != v20) {
            objc_enumerationMutation(obj);
          }
          v5 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          id v6 = [IRServiceStore alloc];
          id v7 = [v5 serviceIdentifier];
          id v8 = v3;
          id v9 = [(IRServiceStore *)v6 initWithPersistenceManager:v3 serviceIdentifier:v7];

          id v10 = IRCreateServicePackageAdapter([v5 servicePackage]);
          char v11 = [(IRServiceStore *)v9 fetchCandidatesContainer];
          int v12 = +[IRPreferences shared];
          id v13 = [v12 numberOfHistoryEventsInCache];
          id v14 = -[IRServiceStore fetchHistoryEventsContainerWithLimit:](v9, "fetchHistoryEventsContainerWithLimit:", [v13 unsignedIntValue]);
          id v15 = [v14 historyEvents];
          char v16 = [v10 shouldAskForLowLatencyMiLo:v11 historyEventsAsc:v15];

          if (v16)
          {
            BOOL v17 = 1;
            id v3 = v8;
            goto LABEL_13;
          }
          id v3 = v8;
        }
        uint64_t v21 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v21) {
          continue;
        }
        break;
      }
    }
    BOOL v17 = 0;
LABEL_13:
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (void)dealloc
{
  [(IRSessionServer *)self stateCaptureHandle];
  os_state_remove_handler();
  v3.receiver = self;
  v3.super_class = (Class)IRSessionServer;
  [(IRSessionServer *)&v3 dealloc];
}

- (void)_logConnectionsAndServices
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)*MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = NSNumber;
    v5 = v3;
    id v6 = [(IRSessionServer *)self services];
    id v7 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
    int v9 = 138412290;
    id v10 = v7;
    _os_log_impl(&dword_25418E000, v5, OS_LOG_TYPE_DEFAULT, "#session-server, Number of active services: %@", (uint8_t *)&v9, 0xCu);
  }
  id v8 = [(IRSessionServer *)self connections];
  [v8 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_4];
}

void __45__IRSessionServer__logConnectionsAndServices__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a2;
  v5 = (void *)*MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = NSNumber;
    id v7 = v5;
    id v8 = objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(a3, "count"));
    int v9 = 138412546;
    id v10 = v4;
    __int16 v11 = 2112;
    int v12 = v8;
    _os_log_impl(&dword_25418E000, v7, OS_LOG_TYPE_DEFAULT, "#session-server, [%@]: number of active connections: %@", (uint8_t *)&v9, 0x16u);
  }
}

- (void)_logStateOnStateCaptureEvent
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  objc_super v3 = (os_log_t *)MEMORY[0x263F500A0];
  id v4 = (void *)*MEMORY[0x263F500A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F500A0], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    id v6 = +[IRPreferences shared];
    id v7 = [v6 preferenceString];
    int v22 = 138412290;
    long long v23 = v7;
    _os_log_impl(&dword_25418E000, v5, OS_LOG_TYPE_DEFAULT, "#session-server, %@", (uint8_t *)&v22, 0xCu);
  }
  os_log_t v8 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = v8;
    id v10 = [(IRSessionServer *)self persistenceManager];
    __int16 v11 = +[IRServiceStore generateLogForStringNumEntitiesInDatabaseWithPersistenceManager:v10];
    int v22 = 138412290;
    long long v23 = v11;
    _os_log_impl(&dword_25418E000, v9, OS_LOG_TYPE_DEFAULT, "#session-server, %@", (uint8_t *)&v22, 0xCu);
  }
  os_log_t v12 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = v12;
    id v14 = [(IRSessionServer *)self persistenceManager];
    id v15 = +[IRServiceStore generateLogForServicesDatabaseWithPersistenceManager:v14];
    int v22 = 138412290;
    long long v23 = v15;
    _os_log_impl(&dword_25418E000, v13, OS_LOG_TYPE_DEFAULT, "#session-server, %@", (uint8_t *)&v22, 0xCu);
  }
  char v16 = [(IRSessionServer *)self rapportProvider];
  [v16 logActiveDevices];

  BOOL v17 = [(IRSessionServer *)self avOutputDeviceProvider];
  [v17 logActiveDevices];

  os_log_t v18 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    v19 = v18;
    uint64_t v20 = +[IRAirPlaySettings shared];
    uint64_t v21 = [v20 dumpState];
    int v22 = 138412290;
    long long v23 = v21;
    _os_log_impl(&dword_25418E000, v19, OS_LOG_TYPE_DEFAULT, "#session-server, %@", (uint8_t *)&v22, 0xCu);
  }
}

- (IRPersistenceManager)persistenceManager
{
  return self->_persistenceManager;
}

- (void)setPersistenceManager:(id)a3
{
}

- (IRBiomeProvider)biomeProvider
{
  return self->_biomeProvider;
}

- (void)setBiomeProvider:(id)a3
{
}

- (void)setQueue:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_os_unfair_lock_t lock = a3;
}

- (void)setConnections:(id)a3
{
}

- (void)setServices:(id)a3
{
}

- (IRAVOutputDeviceProvider)avOutputDeviceProvider
{
  return self->_avOutputDeviceProvider;
}

- (void)setAvOutputDeviceProvider:(id)a3
{
}

- (IRRapportProvider)rapportProvider
{
  return self->_rapportProvider;
}

- (void)setRapportProvider:(id)a3
{
}

- (IRProximityProvider)proximityProvider
{
  return self->_proximityProvider;
}

- (void)setProximityProvider:(id)a3
{
}

- (IRBackgroundActivitiesManager)backgroundActivitiesManager
{
  return self->_backgroundActivitiesManager;
}

- (void)setBackgroundActivitiesManager:(id)a3
{
}

- (IRDisplayMonitor)displayMonitor
{
  return self->_displayMonitor;
}

- (void)setDisplayMonitor:(id)a3
{
}

- (IRAVOutputContextController)audioAVOutputContextController
{
  return self->_audioAVOutputContextController;
}

- (void)setAudioAVOutputContextController:(id)a3
{
}

- (unint64_t)stateCaptureHandle
{
  return self->_stateCaptureHandle;
}

- (void)setStateCaptureHandle:(unint64_t)a3
{
  self->_stateCaptureHandle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioAVOutputContextController, 0);
  objc_storeStrong((id *)&self->_displayMonitor, 0);
  objc_storeStrong((id *)&self->_backgroundActivitiesManager, 0);
  objc_storeStrong((id *)&self->_proximityProvider, 0);
  objc_storeStrong((id *)&self->_rapportProvider, 0);
  objc_storeStrong((id *)&self->_avOutputDeviceProvider, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_biomeProvider, 0);

  objc_storeStrong((id *)&self->_persistenceManager, 0);
}

- (void)serviceContainer:(id)a3 didSpotOnLocationCompleteForClientIds:(id)a4 withError:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __112__IRSessionServer_IRServiceContainerDelegate__serviceContainer_didSpotOnLocationCompleteForClientIds_withError___block_invoke;
  v12[3] = &unk_26539FB58;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(IRSessionServer *)self _dispatchToConnectionsForServiceContainer:a3 usingBlock:v12];
}

void __112__IRSessionServer_IRServiceContainerDelegate__serviceContainer_didSpotOnLocationCompleteForClientIds_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v7 = v3;
  v5 = [v3 client];
  id v6 = [v5 clientIdentifier];
  LODWORD(v4) = [v4 containsObject:v6];

  if (v4) {
    [v7 didSpotOnLocationComplete:*(void *)(a1 + 40)];
  }
}

- (void)serviceContainer:(id)a3 didUpdateBundlesWithSignificantInteractionPattern:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __114__IRSessionServer_IRServiceContainerDelegate__serviceContainer_didUpdateBundlesWithSignificantInteractionPattern___block_invoke;
  v8[3] = &unk_26539FB80;
  id v9 = v6;
  id v7 = v6;
  [(IRSessionServer *)self _dispatchToConnectionsForServiceContainer:a3 usingBlock:v8];
}

uint64_t __114__IRSessionServer_IRServiceContainerDelegate__serviceContainer_didUpdateBundlesWithSignificantInteractionPattern___block_invoke(uint64_t a1, void *a2)
{
  return [a2 didUpdateBundlesWithSignificantInteractionPattern:*(void *)(a1 + 32)];
}

- (void)initWithQueue:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_25418E000, log, OS_LOG_TYPE_ERROR, "#session-server, [ErrorId - Server Init - DB access error] Cannot connect to store during server init", v1, 2u);
}

- (void)registerWithServiceIdentifier:(uint64_t)a1 withConnection:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_25418E000, a2, OS_LOG_TYPE_ERROR, "#session-server, [ErrorId - Service create error] Could not create a new service for identifier: %@", (uint8_t *)&v2, 0xCu);
}

- (void)shouldAcceptNewConnection:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_25418E000, log, OS_LOG_TYPE_ERROR, "#session-server, [ErrorId - Client proxy create error] Cant create a client proxy, rejecting connection for pid: %@", buf, 0xCu);
}

- (void)refreshUpdateModeForServiceIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_25418E000, a2, OS_LOG_TYPE_ERROR, "#session-server, [ErrorId - Refresh unavailable service] Refreshing update mode for a a serviceIdentifier which is not available: %@", (uint8_t *)&v2, 0xCu);
}

@end