@interface GEONavdRemoteProxy
- (GEONavdRemoteProxy)init;
- (GEONavdXPCInterface)remoteObjectProxyThreadUnsafe;
- (void)_connectToDaemonIfNeededThreadUnsafe;
- (void)close;
- (void)dealloc;
- (void)didPostUINotification:(unint64_t)a3 forDestination:(id)a4 fromClient:(id)a5;
- (void)forceCacheRefresh;
- (void)navdProxyReceivedData:(id)a3 ofType:(id)a4;
- (void)navdProxyReceivedHypothesis:(id)a3 forClient:(id)a4;
- (void)onlyPerformLocalUpdatesForPlannedDestination:(id)a3 client:(id)a4;
- (void)open;
- (void)registerObserver:(id)a3;
- (void)requestRefreshForPlannedDestination:(id)a3 client:(id)a4;
- (void)startMonitoringDestination:(id)a3 forClient:(id)a4 uuid:(id)a5 handler:(id)a6;
- (void)statusWithCallback:(id)a3;
- (void)stopMonitoringDestination:(id)a3 forClient:(id)a4 uuid:(id)a5;
- (void)unregisterObserver:(id)a3;
@end

@implementation GEONavdRemoteProxy

- (GEONavdRemoteProxy)init
{
  v12.receiver = self;
  v12.super_class = (Class)GEONavdRemoteProxy;
  v2 = [(GEONavdServerProxy *)&v12 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    observers = v2->_observers;
    v2->_observers = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    handlers = v2->_handlers;
    v2->_handlers = v5;

    uint64_t v7 = geo_dispatch_queue_create();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    if (DarwinNotifyCenter) {
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)navdRestarted, @"com.apple.navd.restarted", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
    v10 = v2;
  }

  return v2;
}

- (void)open
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__GEONavdRemoteProxy_open__block_invoke;
  block[3] = &unk_1E53D79D8;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __26__GEONavdRemoteProxy_open__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _connectToDaemonIfNeededThreadUnsafe];
}

- (void)close
{
  v3 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavdRemoteProxy");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_INFO, "Closing a connection", buf, 2u);
  }

  *(void *)buf = 0;
  uint64_t v7 = buf;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__85;
  v10 = __Block_byref_object_dispose__85;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__GEONavdRemoteProxy_close__block_invoke;
  v5[3] = &unk_1E53D89C0;
  v5[4] = self;
  v5[5] = buf;
  dispatch_sync(queue, v5);
  [*((id *)v7 + 5) invalidate];
  _Block_object_dispose(buf, 8);
}

void __27__GEONavdRemoteProxy_close__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 8));
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0;
}

- (void)_connectToDaemonIfNeededThreadUnsafe
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (!self->_connection)
  {
    v3 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavdRemoteProxy");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_INFO, "Opening a connection", buf, 2u);
    }

    v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.navd" options:0];
    connection = self->_connection;
    self->_connection = v4;

    v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED8360B0];
    [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v6];

    uint64_t v7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED7F95D8];
    [(NSXPCConnection *)self->_connection setExportedInterface:v7];

    [(NSXPCConnection *)self->_connection setExportedObject:self];
    objc_initWeak(&location, self);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __58__GEONavdRemoteProxy__connectToDaemonIfNeededThreadUnsafe__block_invoke;
    v32[3] = &unk_1E53D7B90;
    v22 = &v33;
    objc_copyWeak(&v33, &location);
    [(NSXPCConnection *)self->_connection setInterruptionHandler:v32];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __58__GEONavdRemoteProxy__connectToDaemonIfNeededThreadUnsafe__block_invoke_84;
    v30[3] = &unk_1E53D7B90;
    v23 = &v31;
    objc_copyWeak(&v31, &location);
    [(NSXPCConnection *)self->_connection setInvalidationHandler:v30];
    [(NSXPCConnection *)self->_connection resume];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    obj = self->_handlers;
    uint64_t v8 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v26 objects:v37 count:16];
    if (v8)
    {
      uint64_t v25 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v27 != v25) {
            objc_enumerationMutation(obj);
          }
          v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          id v11 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
          GEOFindOrCreateLog("com.apple.GeoServices", "GEONavdRemoteProxy");
          objc_super v12 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            v13 = [v10 description];
            *(_DWORD *)buf = 138477827;
            v36 = v13;
            _os_log_impl(&dword_188D96000, v12, OS_LOG_TYPE_DEBUG, "reconnect handler : %{private}@", buf, 0xCu);
          }
          v14 = [(NSMutableDictionary *)self->_handlers objectForKeyedSubscript:v10];
          v15 = [v14 objectForKeyedSubscript:@"Stopped"];
          char v16 = [v15 BOOLValue];

          if (v16)
          {
            [v14 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"Stopped"];
            v17 = [v14 objectForKeyedSubscript:@"UUID"];
            v18 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavdRemoteProxy");
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_188D96000, v18, OS_LOG_TYPE_DEBUG, "handler reconnected", buf, 2u);
            }

            v19 = [v14 objectForKeyedSubscript:@"Destination"];
            [v11 startMonitoringDestination:v19 forClient:v10 uuid:v17];
            v20 = [v14 objectForKeyedSubscript:@"LocalOnly"];
            int v21 = [v20 BOOLValue];

            if (v21) {
              [v11 onlyPerformLocalUpdatesForPlannedDestination:v19 client:v10];
            }
          }
          else
          {
            v17 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavdRemoteProxy");
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_188D96000, v17, OS_LOG_TYPE_DEBUG, "handler already connected", buf, 2u);
            }
          }
        }
        uint64_t v8 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v26 objects:v37 count:16];
      }
      while (v8);
    }

    objc_destroyWeak(v23);
    objc_destroyWeak(v22);
    objc_destroyWeak(&location);
  }
}

void __58__GEONavdRemoteProxy__connectToDaemonIfNeededThreadUnsafe__block_invoke(uint64_t a1)
{
  uint64_t v2 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavdRemoteProxy");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_INFO, "Connection interrupted", v5, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained close];
  }
}

void __58__GEONavdRemoteProxy__connectToDaemonIfNeededThreadUnsafe__block_invoke_84(uint64_t a1)
{
  uint64_t v2 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavdRemoteProxy");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_INFO, "Connection invalidated", buf, 2u);
  }

  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained[4];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__GEONavdRemoteProxy__connectToDaemonIfNeededThreadUnsafe__block_invoke_85;
    block[3] = &unk_1E53D79D8;
    block[4] = v4;
    dispatch_sync(v5, block);
  }
}

void __58__GEONavdRemoteProxy__connectToDaemonIfNeededThreadUnsafe__block_invoke_85(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0;

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(*(void *)(a1 + 32) + 24);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    uint64_t v8 = MEMORY[0x1E4F1CC38];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v10 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "objectForKeyedSubscript:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
        [v10 setObject:v8 forKeyedSubscript:@"Stopped"];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__GEONavdRemoteProxy_registerObserver___block_invoke;
  v7[3] = &unk_1E53D8998;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __39__GEONavdRemoteProxy_registerObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__GEONavdRemoteProxy_unregisterObserver___block_invoke;
  v7[3] = &unk_1E53D8998;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __41__GEONavdRemoteProxy_unregisterObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
}

- (GEONavdXPCInterface)remoteObjectProxyThreadUnsafe
{
  [(GEONavdRemoteProxy *)self _connectToDaemonIfNeededThreadUnsafe];
  connection = self->_connection;

  return (GEONavdXPCInterface *)[(NSXPCConnection *)connection remoteObjectProxy];
}

- (void)statusWithCallback:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__GEONavdRemoteProxy_statusWithCallback___block_invoke;
  v7[3] = &unk_1E53D7ED0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __41__GEONavdRemoteProxy_statusWithCallback___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) remoteObjectProxyThreadUnsafe];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41__GEONavdRemoteProxy_statusWithCallback___block_invoke_2;
  v3[3] = &unk_1E53ECE28;
  id v4 = *(id *)(a1 + 40);
  [v2 statusWithCallback:v3];
}

uint64_t __41__GEONavdRemoteProxy_statusWithCallback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)startMonitoringDestination:(id)a3 forClient:(id)a4 uuid:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  long long v13 = (void *)[a6 copy];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__GEONavdRemoteProxy_startMonitoringDestination_forClient_uuid_handler___block_invoke;
  block[3] = &unk_1E53ECE50;
  block[4] = self;
  id v20 = v11;
  id v22 = v12;
  id v23 = v13;
  id v21 = v10;
  id v15 = v12;
  id v16 = v10;
  id v17 = v13;
  id v18 = v11;
  dispatch_sync(queue, block);
}

void __72__GEONavdRemoteProxy_startMonitoringDestination_forClient_uuid_handler___block_invoke(uint64_t a1)
{
  v10[4] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v9[0] = @"Handler";
  v3 = (void *)MEMORY[0x18C120660](*(void *)(a1 + 64));
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v10[0] = v3;
  v10[1] = v4;
  v9[1] = @"Destination";
  v9[2] = @"Stopped";
  v9[3] = @"UUID";
  v10[2] = MEMORY[0x1E4F1CC28];
  v10[3] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];
  uint64_t v7 = (void *)[v2 initWithDictionary:v6];
  [*(id *)(*(void *)(a1 + 32) + 24) setObject:v7 forKeyedSubscript:*(void *)(a1 + 40)];

  id v8 = [*(id *)(a1 + 32) remoteObjectProxyThreadUnsafe];
  [v8 startMonitoringDestination:*(void *)(a1 + 48) forClient:*(void *)(a1 + 40) uuid:*(void *)(a1 + 56)];
}

- (void)requestRefreshForPlannedDestination:(id)a3 client:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__GEONavdRemoteProxy_requestRefreshForPlannedDestination_client___block_invoke;
  block[3] = &unk_1E53D99F0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

void __65__GEONavdRemoteProxy_requestRefreshForPlannedDestination_client___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) remoteObjectProxyThreadUnsafe];
  [v2 requestRefreshForPlannedDestination:*(void *)(a1 + 40) client:*(void *)(a1 + 48)];
}

- (void)onlyPerformLocalUpdatesForPlannedDestination:(id)a3 client:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__GEONavdRemoteProxy_onlyPerformLocalUpdatesForPlannedDestination_client___block_invoke;
  block[3] = &unk_1E53D99F0;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(queue, block);
}

void __74__GEONavdRemoteProxy_onlyPerformLocalUpdatesForPlannedDestination_client___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:*(void *)(a1 + 40)];
  [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"LocalOnly"];
  id v2 = [*(id *)(a1 + 32) remoteObjectProxyThreadUnsafe];
  [v2 onlyPerformLocalUpdatesForPlannedDestination:*(void *)(a1 + 48) client:*(void *)(a1 + 40)];
}

- (void)stopMonitoringDestination:(id)a3 forClient:(id)a4 uuid:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __63__GEONavdRemoteProxy_stopMonitoringDestination_forClient_uuid___block_invoke;
  v15[3] = &unk_1E53D8AF8;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_sync(queue, v15);
}

void __63__GEONavdRemoteProxy_stopMonitoringDestination_forClient_uuid___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) removeObjectForKey:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) remoteObjectProxyThreadUnsafe];
  [v2 stopMonitoringDestination:*(void *)(a1 + 48) forClient:*(void *)(a1 + 40) uuid:*(void *)(a1 + 56)];
}

- (void)didPostUINotification:(unint64_t)a3 forDestination:(id)a4 fromClient:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [(GEONavdRemoteProxy *)self remoteObjectProxyThreadUnsafe];
  [v10 didPostUINotification:a3 forDestination:v9 fromClient:v8];
}

- (void)forceCacheRefresh
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__GEONavdRemoteProxy_forceCacheRefresh__block_invoke;
  block[3] = &unk_1E53D79D8;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __39__GEONavdRemoteProxy_forceCacheRefresh__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) remoteObjectProxyThreadUnsafe];
  [v1 forceCacheRefresh];
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  if (DarwinNotifyCenter) {
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.navd.restarted", 0);
  }
  observers = self->_observers;
  self->_observers = 0;

  handlers = self->_handlers;
  self->_handlers = 0;

  [(GEONavdRemoteProxy *)self close];
  queue = self->_queue;
  self->_queue = 0;

  v7.receiver = self;
  v7.super_class = (Class)GEONavdRemoteProxy;
  [(GEONavdRemoteProxy *)&v7 dealloc];
}

- (void)navdProxyReceivedData:(id)a3 ofType:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavdRemoteProxy");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138477827;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_DEBUG, "Navd remote proxy received data. Message type: %{private}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__85;
  id v20 = __Block_byref_object_dispose__85;
  id v21 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__GEONavdRemoteProxy_navdProxyReceivedData_ofType___block_invoke;
  block[3] = &unk_1E53D89C0;
  block[4] = self;
  void block[5] = &buf;
  dispatch_sync(queue, block);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__GEONavdRemoteProxy_navdProxyReceivedData_ofType___block_invoke_2;
  v12[3] = &unk_1E53DC248;
  id v14 = v7;
  p_long long buf = &buf;
  id v13 = v6;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v12);

  _Block_object_dispose(&buf, 8);
}

void __51__GEONavdRemoteProxy_navdProxyReceivedData_ofType___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __51__GEONavdRemoteProxy_navdProxyReceivedData_ofType___block_invoke_2(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(*(void *)(a1[6] + 8) + 40);
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
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "navdProxyReceivedData:ofType:", a1[4], a1[5], (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)navdProxyReceivedHypothesis:(id)a3 forClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__90;
  id v20 = __Block_byref_object_dispose__91;
  id v21 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__GEONavdRemoteProxy_navdProxyReceivedHypothesis_forClient___block_invoke;
  block[3] = &unk_1E53DC248;
  id v15 = &v16;
  block[4] = self;
  id v9 = v7;
  id v14 = v9;
  dispatch_sync(queue, block);
  if (v17[5])
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __60__GEONavdRemoteProxy_navdProxyReceivedHypothesis_forClient___block_invoke_2;
    v10[3] = &unk_1E53D89C0;
    uint64_t v12 = &v16;
    id v11 = v6;
    dispatch_async(MEMORY[0x1E4F14428], v10);
  }
  _Block_object_dispose(&v16, 8);
}

void __60__GEONavdRemoteProxy_navdProxyReceivedHypothesis_forClient___block_invoke(void *a1)
{
  id v5 = [*(id *)(a1[4] + 24) objectForKeyedSubscript:a1[5]];
  uint64_t v2 = [v5 objectForKey:@"Handler"];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __60__GEONavdRemoteProxy_navdProxyReceivedHypothesis_forClient___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end