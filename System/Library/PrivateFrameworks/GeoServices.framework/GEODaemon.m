@interface GEODaemon
- (BOOL)isOfflineService;
- (BOOL)shouldAllowIncomingConnection:(id)a3;
- (GEODaemon)initWithPort:(const char *)a3 createXPCListenerBlock:(id)a4;
- (GEOPairedDeviceConnection)devConnection;
- (NSSet)peers;
- (NSString)description;
- (OS_dispatch_queue)serverQueue;
- (OS_dispatch_queue)submitBGSTQueue;
- (id)_createPeerForConnection:(id)a3;
- (id)captureStatePlistWithHints:(os_state_hints_s *)a3;
- (id)initPrimaryDaemon;
- (id)startServerClassIfNecessary:(Class)a3;
- (void)_handleNewConnection:(id)a3;
- (void)_localeChanged:(id)a3;
- (void)_logState;
- (void)_shutdown;
- (void)_withServerProxyForIncomingPairedDeviceMessage:(id)a3 perform:(id)a4;
- (void)addServer:(id)a3;
- (void)addServerClass:(Class)a3;
- (void)dealloc;
- (void)initializeAndStartPairedDeviceConnectionIfNecessary;
- (void)installSignalHandlers;
- (void)pairedDeviceConnection:(id)a3 handleIncomingMessage:(id)a4;
- (void)pairedDeviceConnection:(id)a3 handleIncomingMessage:(id)a4 completionHandler:(id)a5;
- (void)pairedDeviceConnectionNeedsStateSynchronization:(id)a3;
- (void)peerDidConnect:(id)a3;
- (void)peerDidDisconnect:(id)a3;
- (void)shutdown;
- (void)start;
@end

@implementation GEODaemon

- (NSSet)peers
{
  return &self->_peers->super;
}

void __41__GEODaemon_startServerClassIfNecessary___block_invoke(void *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = objc_msgSend(*(id *)(a1[4] + 8), "allValues", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v7, "serverClass"), "isEqual:", a1[6]))
        {
          v8 = [v7 server];

          if (!v8) {
            [v7 startServerWithDaemon:a1[4]];
          }
          uint64_t v9 = [v7 server];
          uint64_t v10 = *(void *)(a1[5] + 8);
          v11 = *(void **)(v10 + 40);
          *(void *)(v10 + 40) = v9;

          goto LABEL_13;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (void)peerDidDisconnect:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(NSMutableSet *)self->_peers removeObject:v4];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [(NSMutableDictionary *)self->_servers allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v11 + 1) + 8 * v9) server];
        [v10 peerDidDisconnect:v4];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)peerDidConnect:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [(NSMutableDictionary *)self->_servers allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        long long v11 = objc_msgSend((id)objc_msgSend(v10, "serverClass"), "identifier");
        int v12 = [v4 isForServerIdentifier:v11];

        if (v12)
        {
          long long v13 = [v10 server];

          if (!v13) {
            [v10 startServerWithDaemon:self];
          }
          long long v14 = [v10 server];
          [v14 peerDidConnect:v4];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

void __49__GEODaemon_initWithPort_createXPCListenerBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = MEMORY[0x18C1213B0]();
  if (v4 != MEMORY[0x1E4F145A8])
  {
    uint64_t v5 = v4;
    if (v4 != MEMORY[0x1E4F14578])
    {
      uint64_t v10 = GEOGetGEODaemonLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v11 = 134217984;
        uint64_t v12 = v5;
        _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_ERROR, "Unexpected event type: %p", (uint8_t *)&v11, 0xCu);
      }

      abort();
    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _handleNewConnection:v3];
    goto LABEL_11;
  }
  if (v3 == (id)MEMORY[0x1E4F14528])
  {
    WeakRetained = GEOGetGEODaemonLog();
    if (!os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_11;
    }
    LOWORD(v11) = 0;
    uint64_t v9 = "Listener connection went invalid";
LABEL_10:
    _os_log_impl(&dword_188D96000, WeakRetained, OS_LOG_TYPE_DEBUG, v9, (uint8_t *)&v11, 2u);
    goto LABEL_11;
  }
  id v7 = (id)MEMORY[0x1E4F14550];
  uint64_t v8 = GEOGetGEODaemonLog();
  WeakRetained = v8;
  if (v3 != v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v11 = 134217984;
      uint64_t v12 = (uint64_t)v3;
      _os_log_impl(&dword_188D96000, WeakRetained, OS_LOG_TYPE_ERROR, "Unexpected error event: %p", (uint8_t *)&v11, 0xCu);
    }

    abort();
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v11) = 0;
    uint64_t v9 = "Idle exiting";
    goto LABEL_10;
  }
LABEL_11:
}

- (void)_handleNewConnection:(id)a3
{
  uint64_t v4 = (_xpc_connection_s *)a3;
  if ([(GEODaemon *)self shouldAllowIncomingConnection:v4])
  {
    uint64_t v5 = [(GEODaemon *)self _createPeerForConnection:v4];
    peers = self->_peers;
    if (!peers)
    {
      id v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      uint64_t v8 = self->_peers;
      self->_peers = v7;

      peers = self->_peers;
    }
    [(NSMutableSet *)peers addObject:v5];
  }
  else
  {
    uint64_t v9 = GEOGetGEODaemonLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_ERROR, "Rejecting incoming connection", v10, 2u);
    }

    xpc_connection_cancel(v4);
  }
}

- (BOOL)shouldAllowIncomingConnection:(id)a3
{
  return 1;
}

- (id)_createPeerForConnection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[GEOPeer alloc] initWithConnection:v4 daemon:self];

  return v5;
}

- (OS_dispatch_queue)serverQueue
{
  return self->_serverQueue;
}

- (id)startServerClassIfNecessary:(Class)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__105;
  uint64_t v13 = __Block_byref_object_dispose__105;
  id v14 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serverQueue);
  serverQueue = self->_serverQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__GEODaemon_startServerClassIfNecessary___block_invoke;
  block[3] = &unk_1E53F6D68;
  block[5] = &v9;
  block[6] = a3;
  block[4] = self;
  dispatch_async_and_wait(serverQueue, block);
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (BOOL)isOfflineService
{
  return 0;
}

- (id)initPrimaryDaemon
{
  v2 = [(GEODaemon *)self initWithPort:"com.apple.geod" createXPCListenerBlock:&__block_literal_global_11_3];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F1CA20] currentLocale];
    uint64_t v4 = objc_msgSend(v3, "_geo_languageAndLocale");
    knownLocale = v2->_knownLocale;
    v2->_knownLocale = (NSString *)v4;

    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29078]) initWithMemoryCapacity:0 diskCapacity:0 directoryURL:0];
    [MEMORY[0x1E4F29078] setSharedURLCache:v6];
    [(GEODaemon *)v2 installSignalHandlers];
    id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v2 selector:sel__localeChanged_ name:*MEMORY[0x1E4F1C370] object:0];

    uint64_t v8 = v2;
  }

  return v2;
}

xpc_connection_t __30__GEODaemon_initPrimaryDaemon__block_invoke(int a1, NSObject *a2, char *name)
{
  xpc_connection_t mach_service = xpc_connection_create_mach_service(name, a2, 1uLL);

  return mach_service;
}

- (GEODaemon)initWithPort:(const char *)a3 createXPCListenerBlock:(id)a4
{
  id v6 = (void (**)(id, void, const char *))a4;
  v18.receiver = self;
  v18.super_class = (Class)GEODaemon;
  id v7 = [(GEODaemon *)&v18 init];
  if (v7)
  {
    uint64_t v8 = geo_dispatch_workloop_create_with_format();
    serverQueue = v7->_serverQueue;
    v7->_serverQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = ((void (**)(id, OS_dispatch_queue *, const char *))v6)[2](v6, v7->_serverQueue, a3);
    listener = v7->_listener;
    v7->_listener = (OS_xpc_object *)v10;

    objc_initWeak(&location, v7);
    uint64_t v12 = v7->_listener;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __49__GEODaemon_initWithPort_createXPCListenerBlock___block_invoke;
    handler[3] = &unk_1E53DF960;
    objc_copyWeak(&v16, &location);
    xpc_connection_set_event_handler(v12, handler);
    uint64_t v13 = v7;
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (void)installSignalHandlers
{
  signal(29, (void (__cdecl *)(int))1);
  objc_initWeak(&location, self);
  id v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14480], 0x1DuLL, 0, MEMORY[0x1E4F14428]);
  sigInfoSrc = self->_sigInfoSrc;
  self->_sigInfoSrc = v3;

  uint64_t v5 = self->_sigInfoSrc;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __34__GEODaemon_installSignalHandlers__block_invoke;
  handler[3] = &unk_1E53D7B90;
  objc_copyWeak(&v22, &location);
  dispatch_source_set_event_handler(v5, handler);
  dispatch_activate((dispatch_object_t)self->_sigInfoSrc);
  signal(15, (void (__cdecl *)(int))1);
  id v6 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14480], 0xFuLL, 0, (dispatch_queue_t)self->_serverQueue);
  sigTermSrc = self->_sigTermSrc;
  self->_sigTermSrc = v6;

  uint64_t v8 = self->_sigTermSrc;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __34__GEODaemon_installSignalHandlers__block_invoke_18;
  v19[3] = &unk_1E53D7B90;
  objc_copyWeak(&v20, &location);
  dispatch_source_set_event_handler(v8, v19);
  dispatch_activate((dispatch_object_t)self->_sigTermSrc);
  signal(30, (void (__cdecl *)(int))1);
  uint64_t v9 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14480], 0x1EuLL, 0, (dispatch_queue_t)self->_serverQueue);
  sigUsr1Src = self->_sigUsr1Src;
  self->_sigUsr1Src = v9;

  uint64_t v11 = self->_sigUsr1Src;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __34__GEODaemon_installSignalHandlers__block_invoke_19;
  v17[3] = &unk_1E53D7B90;
  objc_copyWeak(&v18, &location);
  dispatch_source_set_event_handler(v11, v17);
  dispatch_activate((dispatch_object_t)self->_sigUsr1Src);
  signal(31, (void (__cdecl *)(int))1);
  uint64_t v12 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14480], 0x1FuLL, 0, (dispatch_queue_t)self->_serverQueue);
  sigUsr2Src = self->_sigUsr2Src;
  self->_sigUsr2Src = v12;

  id v14 = self->_sigUsr2Src;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __34__GEODaemon_installSignalHandlers__block_invoke_20;
  v15[3] = &unk_1E53D7B90;
  objc_copyWeak(&v16, &location);
  dispatch_source_set_event_handler(v14, v15);
  dispatch_activate((dispatch_object_t)self->_sigUsr2Src);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __34__GEODaemon_installSignalHandlers__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = GEOGetGEODaemonLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v4 = 138412290;
    id v5 = WeakRetained;
    _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_DEBUG, "SIGINFO received: %@", (uint8_t *)&v4, 0xCu);
  }
}

void __34__GEODaemon_installSignalHandlers__block_invoke_18(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = GEOGetGEODaemonLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v5 = 138412290;
    id v6 = WeakRetained;
    _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_DEBUG, "SIGTERM received: %@", (uint8_t *)&v5, 0xCu);
  }
  id v4 = objc_loadWeakRetained((id *)(a1 + 32));
  [v4 _shutdown];
}

void __34__GEODaemon_installSignalHandlers__block_invoke_19(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = GEOGetGEODaemonLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v5 = 138412290;
    id v6 = WeakRetained;
    _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_DEBUG, "SIGUSR1 received: %@", (uint8_t *)&v5, 0xCu);
  }
  id v4 = objc_loadWeakRetained((id *)(a1 + 32));
  [v4 _shutdown];
}

void __34__GEODaemon_installSignalHandlers__block_invoke_20(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = GEOGetGEODaemonLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v5 = 138412290;
    id v6 = WeakRetained;
    _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_DEBUG, "SIGUSR2 received: %@", (uint8_t *)&v5, 0xCu);
  }
  id v4 = objc_loadWeakRetained((id *)(a1 + 32));
  [v4 _logState];
}

- (void)initializeAndStartPairedDeviceConnectionIfNecessary
{
  if (PairedDeviceRegistryLibraryCore() && [getPDRRegistryClass() supportsPairedDevice])
  {
    id v3 = +[GEOPairedDeviceConnection sharedInstance];
    devConnection = self->_devConnection;
    self->_devConnection = v3;

    [(GEOPairedDeviceConnection *)self->_devConnection setDelegateQueue:self->_serverQueue];
    [(GEOPairedDeviceConnection *)self->_devConnection setDelegate:self];
    int v5 = self->_devConnection;
    [(GEOPairedDeviceConnection *)v5 start];
  }
}

- (void)start
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  GEORegisterPListStateCaptureLegacy();
  xpc_connection_activate(self->_listener);
  if ([(NSMutableArray *)self->_serversToStart count])
  {
    dispatch_time_t v3 = dispatch_time(0, 100000000);
    serverQueue = self->_serverQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __18__GEODaemon_start__block_invoke;
    block[3] = &unk_1E53D79D8;
    block[4] = self;
    dispatch_after(v3, serverQueue, block);
  }
  objc_initWeak(&location, self);
  if (BackgroundSystemTasksLibraryCore())
  {
    int v5 = (OS_dispatch_queue *)geo_dispatch_queue_create();
    submitBGSTQueue = self->_submitBGSTQueue;
    self->_submitBGSTQueue = v5;

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    obuint64_t j = [(NSMutableDictionary *)self->_servers allValues];
    uint64_t v18 = [obj countByEnumeratingWithState:&v27 objects:v36 count:16];
    if (v18)
    {
      uint64_t v17 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v28 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v7 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          uint64_t v8 = objc_msgSend((id)objc_msgSend(v7, "serverClass", obj), "possibleBackgroundTaskIdentifiers");
          uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v35 count:16];
          if (v9)
          {
            uint64_t v10 = *(void *)v24;
            do
            {
              for (uint64_t j = 0; j != v9; ++j)
              {
                if (*(void *)v24 != v10) {
                  objc_enumerationMutation(v8);
                }
                uint64_t v12 = *(void *)(*((void *)&v23 + 1) + 8 * j);
                uint64_t v13 = GEOGetGEODaemonLog();
                if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138543362;
                  uint64_t v34 = v12;
                  _os_log_impl(&dword_188D96000, v13, OS_LOG_TYPE_DEBUG, "Registering handler for background task identifier '%{public}@'", buf, 0xCu);
                }

                id v14 = [getBGSystemTaskSchedulerClass() sharedScheduler];
                v21[0] = MEMORY[0x1E4F143A8];
                v21[1] = 3221225472;
                v21[2] = __18__GEODaemon_start__block_invoke_26;
                v21[3] = &unk_1E53F6CF0;
                objc_copyWeak(&v22, &location);
                v21[4] = v7;
                v21[5] = self;
                [v14 registerForTaskWithIdentifier:v12 usingQueue:0 launchHandler:v21];

                objc_destroyWeak(&v22);
              }
              uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v35 count:16];
            }
            while (v9);
          }
        }
        uint64_t v18 = [obj countByEnumeratingWithState:&v27 objects:v36 count:16];
      }
      while (v18);
    }

    long long v15 = self->_submitBGSTQueue;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __18__GEODaemon_start__block_invoke_3;
    v20[3] = &unk_1E53D79D8;
    v20[4] = self;
    dispatch_async(v15, v20);
  }
  objc_destroyWeak(&location);
}

void __18__GEODaemon_start__block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = GEOGetLaunchLog();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  id v4 = GEOGetLaunchLog();
  int v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_188D96000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "StartServers", "", buf, 2u);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "startServerWithDaemon:", *(void *)(a1 + 32), (void)v15);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v8);
  }

  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(void **)(v11 + 16);
  *(void *)(v11 + 16) = 0;

  uint64_t v13 = GEOGetLaunchLog();
  id v14 = v13;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_188D96000, v14, OS_SIGNPOST_INTERVAL_END, v3, "StartServers", "", buf, 2u);
  }
}

void __18__GEODaemon_start__block_invoke_26(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)(a1 + 48));
    id v6 = [v5 serverQueue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __18__GEODaemon_start__block_invoke_2;
    v8[3] = &unk_1E53D8998;
    long long v9 = *(_OWORD *)(a1 + 32);
    dispatch_async_and_wait(v6, v8);

    uint64_t v7 = [*(id *)(a1 + 32) server];
    [v7 runBackgroundTask:v3];
  }
  else
  {
    [v3 setTaskCompleted];
  }
}

void __18__GEODaemon_start__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) server];

  if (!v2)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    [v3 startServerWithDaemon:v4];
  }
}

void __18__GEODaemon_start__block_invoke_3(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v1 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "allValues", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v1);
        }
        id v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        uint64_t v7 = objc_msgSend((id)objc_msgSend(v6, "serverClass"), "possibleBackgroundTaskIdentifiers");
        uint64_t v8 = [v7 count];

        if (v8) {
          objc_msgSend((id)objc_msgSend(v6, "serverClass"), "submitBackgroundTasksNeededDuringDaemonStart");
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v3);
  }
}

- (void)shutdown
{
  serverQueue = self->_serverQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __21__GEODaemon_shutdown__block_invoke;
  block[3] = &unk_1E53D79D8;
  block[4] = self;
  dispatch_async_and_wait(serverQueue, block);
}

uint64_t __21__GEODaemon_shutdown__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _shutdown];
}

- (void)_shutdown
{
  uint64_t v3 = GEOGetGEODaemonLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_INFO, "Shutdown requested", buf, 2u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serverQueue);
  uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"GEODaemonShouldTerminateNotification" object:self];

  id v5 = GEOGetGEODaemonLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_INFO, "Shutdown complete", v6, 2u);
  }

  xpc_transaction_exit_clean();
}

- (void)_withServerProxyForIncomingPairedDeviceMessage:(id)a3 perform:(id)a4
{
  pairedDeviceMessageTypeToServerIdentifier = self->_pairedDeviceMessageTypeToServerIdentifier;
  uint64_t v7 = NSNumber;
  uint64_t v8 = (void (**)(id, void *))a4;
  long long v9 = objc_msgSend(v7, "numberWithInt:", objc_msgSend(a3, "type"));
  id v13 = [(NSMutableDictionary *)pairedDeviceMessageTypeToServerIdentifier objectForKey:v9];

  if (v13)
  {
    long long v10 = -[NSMutableDictionary objectForKey:](self->_servers, "objectForKey:");
  }
  else
  {
    long long v10 = 0;
  }
  long long v11 = [v10 server];

  if (!v11) {
    [v10 startServerWithDaemon:self];
  }
  long long v12 = [v10 server];
  v8[2](v8, v12);
}

- (void)pairedDeviceConnection:(id)a3 handleIncomingMessage:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__GEODaemon_pairedDeviceConnection_handleIncomingMessage___block_invoke;
  v7[3] = &unk_1E53F6D18;
  id v8 = v5;
  id v6 = v5;
  [(GEODaemon *)self _withServerProxyForIncomingPairedDeviceMessage:v6 perform:v7];
}

void __58__GEODaemon_pairedDeviceConnection_handleIncomingMessage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (!v3)
  {
    id v5 = GEOGetGEODaemonLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      uint64_t v8 = [*(id *)(a1 + 32) type];
      if ((int)v8 <= 99)
      {
        if (v8)
        {
          if (v8 == 1)
          {
            uint64_t v7 = @"PING";
          }
          else if (v8 == 2)
          {
            uint64_t v7 = @"GET_STORAGE_INFO";
          }
          else
          {
LABEL_26:
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
            uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          uint64_t v7 = @"INVALID";
        }
      }
      else
      {
        switch((int)v8)
        {
          case 'd':
            uint64_t v7 = @"CONFIGURE_SUBSCRIPTION_SHOULD_SYNC";
            break;
          case 'e':
            uint64_t v7 = @"START_STOP_SUBSCRIPTION_DOWNLOAD";
            break;
          case 'f':
            uint64_t v7 = @"CHECKIN_WITH_SUBSCRIPTION_STATE_SUMMARY";
            break;
          case 'g':
            uint64_t v7 = @"SET_SUBSCRIPTION_STATE_SUMMARY";
            break;
          case 'h':
            uint64_t v7 = @"SET_OBSERVED_SUBSCRIPTION_IDENTIFIERS";
            break;
          case 'i':
            uint64_t v7 = @"UPDATE_SUBSCRIPTION_STATE";
            break;
          default:
            goto LABEL_26;
        }
      }
      *(_DWORD *)buf = 138543362;
      long long v11 = v7;
      long long v9 = "No handler is registered for paired device message %{public}@";
      goto LABEL_37;
    }
LABEL_38:

    goto LABEL_39;
  }
  if (([v3 handleIncomingPairedDeviceMessage:*(void *)(a1 + 32)] & 1) == 0)
  {
    id v5 = GEOGetGEODaemonLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      uint64_t v6 = [*(id *)(a1 + 32) type];
      if ((int)v6 <= 99)
      {
        if (v6)
        {
          if (v6 == 1)
          {
            uint64_t v7 = @"PING";
          }
          else if (v6 == 2)
          {
            uint64_t v7 = @"GET_STORAGE_INFO";
          }
          else
          {
LABEL_35:
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
            uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          uint64_t v7 = @"INVALID";
        }
      }
      else
      {
        switch((int)v6)
        {
          case 'd':
            uint64_t v7 = @"CONFIGURE_SUBSCRIPTION_SHOULD_SYNC";
            break;
          case 'e':
            uint64_t v7 = @"START_STOP_SUBSCRIPTION_DOWNLOAD";
            break;
          case 'f':
            uint64_t v7 = @"CHECKIN_WITH_SUBSCRIPTION_STATE_SUMMARY";
            break;
          case 'g':
            uint64_t v7 = @"SET_SUBSCRIPTION_STATE_SUMMARY";
            break;
          case 'h':
            uint64_t v7 = @"SET_OBSERVED_SUBSCRIPTION_IDENTIFIERS";
            break;
          case 'i':
            uint64_t v7 = @"UPDATE_SUBSCRIPTION_STATE";
            break;
          default:
            goto LABEL_35;
        }
      }
      *(_DWORD *)buf = 138543362;
      long long v11 = v7;
      long long v9 = "Unhandled message: %{public}@";
LABEL_37:
      _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_FAULT, v9, buf, 0xCu);

      goto LABEL_38;
    }
    goto LABEL_38;
  }
LABEL_39:
}

- (void)pairedDeviceConnection:(id)a3 handleIncomingMessage:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __76__GEODaemon_pairedDeviceConnection_handleIncomingMessage_completionHandler___block_invoke;
  v14[3] = &unk_1E53F6D40;
  id v11 = v9;
  id v15 = v11;
  long long v17 = &v18;
  id v12 = v10;
  id v16 = v12;
  [(GEODaemon *)self _withServerProxyForIncomingPairedDeviceMessage:v11 perform:v14];
  if (!*((unsigned char *)v19 + 24))
  {
    id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"GEOPairedDeviceConnectionErrorDomain" code:6 userInfo:0];
    (*((void (**)(id, void, void *))v12 + 2))(v12, 0, v13);
  }
  _Block_object_dispose(&v18, 8);
}

void __76__GEODaemon_pairedDeviceConnection_handleIncomingMessage_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (!v3)
  {
    id v5 = GEOGetGEODaemonLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      uint64_t v8 = [*(id *)(a1 + 32) type];
      if ((int)v8 <= 99)
      {
        if (v8)
        {
          if (v8 == 1)
          {
            uint64_t v7 = @"PING";
          }
          else if (v8 == 2)
          {
            uint64_t v7 = @"GET_STORAGE_INFO";
          }
          else
          {
LABEL_26:
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
            uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          uint64_t v7 = @"INVALID";
        }
      }
      else
      {
        switch((int)v8)
        {
          case 'd':
            uint64_t v7 = @"CONFIGURE_SUBSCRIPTION_SHOULD_SYNC";
            break;
          case 'e':
            uint64_t v7 = @"START_STOP_SUBSCRIPTION_DOWNLOAD";
            break;
          case 'f':
            uint64_t v7 = @"CHECKIN_WITH_SUBSCRIPTION_STATE_SUMMARY";
            break;
          case 'g':
            uint64_t v7 = @"SET_SUBSCRIPTION_STATE_SUMMARY";
            break;
          case 'h':
            uint64_t v7 = @"SET_OBSERVED_SUBSCRIPTION_IDENTIFIERS";
            break;
          case 'i':
            uint64_t v7 = @"UPDATE_SUBSCRIPTION_STATE";
            break;
          default:
            goto LABEL_26;
        }
      }
      *(_DWORD *)buf = 138543362;
      id v11 = v7;
      id v9 = "No handler is registered for paired device message %{public}@";
      goto LABEL_37;
    }
LABEL_38:

    goto LABEL_39;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v3 handleIncomingPairedDeviceMessage:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 40)];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    id v5 = GEOGetGEODaemonLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      uint64_t v6 = [*(id *)(a1 + 32) type];
      if ((int)v6 <= 99)
      {
        if (v6)
        {
          if (v6 == 1)
          {
            uint64_t v7 = @"PING";
          }
          else if (v6 == 2)
          {
            uint64_t v7 = @"GET_STORAGE_INFO";
          }
          else
          {
LABEL_35:
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
            uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          uint64_t v7 = @"INVALID";
        }
      }
      else
      {
        switch((int)v6)
        {
          case 'd':
            uint64_t v7 = @"CONFIGURE_SUBSCRIPTION_SHOULD_SYNC";
            break;
          case 'e':
            uint64_t v7 = @"START_STOP_SUBSCRIPTION_DOWNLOAD";
            break;
          case 'f':
            uint64_t v7 = @"CHECKIN_WITH_SUBSCRIPTION_STATE_SUMMARY";
            break;
          case 'g':
            uint64_t v7 = @"SET_SUBSCRIPTION_STATE_SUMMARY";
            break;
          case 'h':
            uint64_t v7 = @"SET_OBSERVED_SUBSCRIPTION_IDENTIFIERS";
            break;
          case 'i':
            uint64_t v7 = @"UPDATE_SUBSCRIPTION_STATE";
            break;
          default:
            goto LABEL_35;
        }
      }
      *(_DWORD *)buf = 138543362;
      id v11 = v7;
      id v9 = "Unhandled message: %{public}@";
LABEL_37:
      _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_FAULT, v9, buf, 0xCu);

      goto LABEL_38;
    }
    goto LABEL_38;
  }
LABEL_39:
}

- (void)pairedDeviceConnectionNeedsStateSynchronization:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = GEOGetGEODaemonLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_INFO, "Requested paired device state synchronization", buf, 2u);
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(NSMutableDictionary *)self->_servers allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v10, "serverClass"), "performsPairedDeviceSynchronization"))
        {
          id v11 = [v10 server];

          if (!v11) {
            [v10 startServerWithDaemon:self];
          }
          uint64_t v12 = [v10 server];
          [v12 setNeedsPairedDeviceSynchronization];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v7);
  }
}

- (void)addServerClass:(Class)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = [(objc_class *)a3 identifier];
  uint64_t v6 = [(NSMutableDictionary *)self->_servers objectForKey:v5];

  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: [_servers objectForKey:identifier] == ((void *)0)", buf, 2u);
    }
  }
  else
  {
    uint64_t v7 = +[_GEOServerProxy proxyForClass:a3];
    uint64_t v8 = +[GEOPlatform sharedPlatform];
    int v9 = [v8 isGUIUser];

    if (v9)
    {
      uint64_t v10 = [(objc_class *)a3 launchMode];
      if (v10 == 2)
      {
        [v7 startServerWithDaemon:self];
      }
      else if (v10 == 1)
      {
        serversToStart = self->_serversToStart;
        if (!serversToStart)
        {
          uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
          long long v13 = self->_serversToStart;
          self->_serversToStart = v12;

          serversToStart = self->_serversToStart;
        }
        [(NSMutableArray *)serversToStart addObject:v7];
      }
    }
    servers = self->_servers;
    if (!servers)
    {
      long long v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v16 = self->_servers;
      self->_servers = v15;

      servers = self->_servers;
    }
    [(NSMutableDictionary *)servers setObject:v7 forKey:v5];
    long long v17 = [(objc_class *)a3 handledPairedDeviceMessageTypes];
    if ([v17 count])
    {
      if (!self->_pairedDeviceMessageTypeToServerIdentifier)
      {
        uint64_t v18 = [MEMORY[0x1E4F1CA60] dictionary];
        pairedDeviceMessageTypeToServerIdentifier = self->_pairedDeviceMessageTypeToServerIdentifier;
        self->_pairedDeviceMessageTypeToServerIdentifier = v18;
      }
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v20 = v17;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v29;
        do
        {
          uint64_t v24 = 0;
          do
          {
            if (*(void *)v29 != v23) {
              objc_enumerationMutation(v20);
            }
            uint64_t v25 = *(void *)(*((void *)&v28 + 1) + 8 * v24);
            long long v26 = -[NSMutableDictionary objectForKey:](self->_pairedDeviceMessageTypeToServerIdentifier, "objectForKey:", v25, (void)v28);

            if (v26 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: [_pairedDeviceMessageTypeToServerIdentifier objectForKey:messageType] == nil", buf, 2u);
            }
            [(NSMutableDictionary *)self->_pairedDeviceMessageTypeToServerIdentifier setObject:v5 forKey:v25];
            ++v24;
          }
          while (v22 != v24);
          uint64_t v27 = [v20 countByEnumeratingWithState:&v28 objects:v33 count:16];
          uint64_t v22 = v27;
        }
        while (v27);
      }
    }
  }
}

- (void)addServer:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(id)objc_opt_class() identifier];
  uint64_t v6 = [(NSMutableDictionary *)self->_servers objectForKey:v5];

  if (v6)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_21;
    }
    *(_WORD *)buf = 0;
    uint64_t v23 = MEMORY[0x1E4F14500];
    uint64_t v24 = "Assertion failed: [_servers objectForKey:identifier] == ((void *)0)";
LABEL_26:
    _os_log_fault_impl(&dword_188D96000, v23, OS_LOG_TYPE_FAULT, v24, buf, 2u);
    goto LABEL_21;
  }
  uint64_t v7 = [v4 daemon];

  if (v7 != self)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_21;
    }
    *(_WORD *)buf = 0;
    uint64_t v23 = MEMORY[0x1E4F14500];
    uint64_t v24 = "Assertion failed: server.daemon == self";
    goto LABEL_26;
  }
  uint64_t v8 = +[_GEOServerProxy proxyForServer:v4 daemon:self];
  servers = self->_servers;
  if (!servers)
  {
    uint64_t v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v11 = self->_servers;
    self->_servers = v10;

    servers = self->_servers;
  }
  [(NSMutableDictionary *)servers setObject:v8 forKey:v5];
  uint64_t v12 = [(id)objc_opt_class() handledPairedDeviceMessageTypes];
  if ([v12 count])
  {
    uint64_t v25 = v8;
    if (!self->_pairedDeviceMessageTypeToServerIdentifier)
    {
      long long v13 = [MEMORY[0x1E4F1CA60] dictionary];
      pairedDeviceMessageTypeToServerIdentifier = self->_pairedDeviceMessageTypeToServerIdentifier;
      self->_pairedDeviceMessageTypeToServerIdentifier = v13;
    }
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v15 = v12;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v27;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v27 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v26 + 1) + 8 * v19);
          uint64_t v21 = [(NSMutableDictionary *)self->_pairedDeviceMessageTypeToServerIdentifier objectForKey:v20];

          if (v21 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: [_pairedDeviceMessageTypeToServerIdentifier objectForKey:messageType] == nil", buf, 2u);
          }
          [(NSMutableDictionary *)self->_pairedDeviceMessageTypeToServerIdentifier setObject:v5 forKey:v20];
          ++v19;
        }
        while (v17 != v19);
        uint64_t v22 = [v15 countByEnumeratingWithState:&v26 objects:v31 count:16];
        uint64_t v17 = v22;
      }
      while (v22);
    }

    uint64_t v8 = v25;
  }

LABEL_21:
}

- (void)dealloc
{
  sigInfoSrc = self->_sigInfoSrc;
  if (sigInfoSrc) {
    dispatch_source_set_event_handler(sigInfoSrc, &__block_literal_global_42_0);
  }
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"GEODaemomDidTerminateNotification" object:0];

  GEOUnregisterStateCaptureLegacy();
  v6.receiver = self;
  v6.super_class = (Class)GEODaemon;
  [(GEODaemon *)&v6 dealloc];
}

- (void)_localeChanged:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA20], "currentLocale", a3);
  objc_msgSend(v4, "_geo_languageAndLocale");
  id v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  int v6 = [(NSString *)self->_knownLocale isEqual:v5];
  uint64_t v7 = GEOGetGEODaemonLog();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8)
    {
      int v10 = 138412290;
      id v11 = v5;
      _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_DEBUG, "Locale changed but identifier is still \"%@\", not exiting", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    if (v8)
    {
      knownLocale = self->_knownLocale;
      int v10 = 138412546;
      id v11 = knownLocale;
      __int16 v12 = 2112;
      long long v13 = v5;
      _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_DEBUG, "Locale changed from \"%@\" -> \"%@\", exiting soon ...", (uint8_t *)&v10, 0x16u);
    }

    [(GEODaemon *)self shutdown];
  }
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@: %p, servers: %@> peers: %@", objc_opt_class(), self, self->_servers, self->_peers];
}

- (void)_logState
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = GEOGetGEODaemonLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id v4 = [(GEODaemon *)self captureStatePlistWithHints:0];
    int v5 = 138412290;
    int v6 = v4;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v5, 0xCu);
  }
}

- (id)captureStatePlistWithHints:(os_state_hints_s *)a3
{
  p_isa = (id *)&self->super.isa;
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"servers";
  uint64_t v5 = [(NSMutableDictionary *)self->_servers count];
  if (v5)
  {
    id v3 = [p_isa[1] allValues];
    int v6 = objc_msgSend(v3, "_geo_map:", &__block_literal_global_54_0);
  }
  else
  {
    int v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v11[1] = @"peers";
  v12[0] = v6;
  uint64_t v7 = [p_isa[3] count];
  if (v7)
  {
    p_isa = [p_isa[3] allObjects];
    BOOL v8 = objc_msgSend(p_isa, "_geo_map:", &__block_literal_global_67_0);
  }
  else
  {
    BOOL v8 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v12[1] = v8;
  int v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  if (v7)
  {
  }
  if (v5)
  {
  }

  return v9;
}

id __40__GEODaemon_captureStatePlistWithHints___block_invoke(uint64_t a1, void *a2)
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8[0] = @"class";
  id v2 = a2;
  id v3 = NSStringFromClass((Class)[v2 serverClass]);
  v8[1] = @"identifier";
  v9[0] = v3;
  id v4 = (void *)[v2 serverClass];

  uint64_t v5 = [v4 identifier];
  v9[1] = v5;
  int v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v6;
}

id __40__GEODaemon_captureStatePlistWithHints___block_invoke_2(uint64_t a1, void *a2)
{
  void v12[3] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v11[0] = @"id";
  id v3 = [v2 peerID];
  if (v3)
  {
    id v4 = [v2 peerID];
  }
  else
  {
    id v4 = @"nil";
  }
  v12[0] = v4;
  v11[1] = @"bundleIdentifier";
  uint64_t v5 = [v2 bundleIdentifier];
  if (v5)
  {
    int v6 = [v2 bundleIdentifier];
  }
  else
  {
    int v6 = @"nil";
  }
  v12[1] = v6;
  void v11[2] = @"debugIdentifier";
  uint64_t v7 = [v2 debugIdentifier];
  if (v7)
  {
    BOOL v8 = [v2 debugIdentifier];
  }
  else
  {
    BOOL v8 = @"nil";
  }
  v12[2] = v8;
  int v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  if (v7) {

  }
  if (v5) {
  if (v3)
  }

  return v9;
}

- (OS_dispatch_queue)submitBGSTQueue
{
  return self->_submitBGSTQueue;
}

- (GEOPairedDeviceConnection)devConnection
{
  return (GEOPairedDeviceConnection *)objc_getProperty(self, a2, 112, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedDeviceMessageTypeToServerIdentifier, 0);
  objc_storeStrong((id *)&self->_devConnection, 0);
  objc_storeStrong((id *)&self->_submitBGSTQueue, 0);
  objc_storeStrong((id *)&self->_knownLocale, 0);
  objc_storeStrong((id *)&self->_offlineServiceConenction, 0);
  objc_storeStrong((id *)&self->_serverQueue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_sigUsr2Src, 0);
  objc_storeStrong((id *)&self->_sigUsr1Src, 0);
  objc_storeStrong((id *)&self->_sigTermSrc, 0);
  objc_storeStrong((id *)&self->_sigInfoSrc, 0);
  objc_storeStrong((id *)&self->_peers, 0);
  objc_storeStrong((id *)&self->_serversToStart, 0);

  objc_storeStrong((id *)&self->_servers, 0);
}

@end