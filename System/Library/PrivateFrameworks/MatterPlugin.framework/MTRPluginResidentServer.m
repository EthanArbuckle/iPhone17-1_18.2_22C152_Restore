@interface MTRPluginResidentServer
+ (id)sharedInstance;
- (BOOL)running;
- (MTRPluginProtobufMessageTransport)transport;
- (MTRPluginResidentServer)init;
- (NSMutableArray)sessions;
- (OS_dispatch_queue)workQueue;
- (id)_clientSessionForSessionID:(id)a3;
- (void)_checkForMaxSessionsLimit;
- (void)_deregisterForSignificantTimeChangeNotifications;
- (void)_registerForSignificantTimeChangeNotifications;
- (void)_registerSessionForSessionID:(id)a3 incomingNewMessage:(id)a4;
- (void)_unregisterSessionForSessionID:(id)a3;
- (void)messageTransport:(id)a3 handleIncomingMessage:(id)a4;
- (void)removeResidentClientSession:(id)a3;
- (void)setRunning:(BOOL)a3;
- (void)setSessions:(id)a3;
- (void)setTransport:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)start;
- (void)stop;
- (void)timeZoneOrTimeChanged:(id)a3;
@end

@implementation MTRPluginResidentServer

+ (id)sharedInstance
{
  if (sharedInstance_creation != -1) {
    dispatch_once(&sharedInstance_creation, &__block_literal_global);
  }
  v2 = (void *)sharedInstance_sInstance;
  return v2;
}

uint64_t __41__MTRPluginResidentServer_sharedInstance__block_invoke()
{
  sharedInstance_sInstance = objc_alloc_init(MTRPluginResidentServer);
  return MEMORY[0x270F9A758]();
}

- (MTRPluginResidentServer)init
{
  v9.receiver = self;
  v9.super_class = (Class)MTRPluginResidentServer;
  v2 = [(MTRPluginResidentServer *)&v9 init];
  if (v2)
  {
    v3 = +[MTRPluginProtobufOverModernTransport sharedInstance];
    [(MTRPluginResidentServer *)v2 setTransport:v3];

    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("MTRPluginResidentServerQueue", v4);
    [(MTRPluginResidentServer *)v2 setWorkQueue:v5];

    v6 = [MEMORY[0x263EFF980] array];
    [(MTRPluginResidentServer *)v2 setSessions:v6];

    [(MTRPluginResidentServer *)v2 setRunning:0];
    v7 = v2;
  }

  return v2;
}

- (void)start
{
  v3 = [(MTRPluginResidentServer *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__MTRPluginResidentServer_start__block_invoke;
  block[3] = &unk_2653E66D8;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __32__MTRPluginResidentServer_start__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t result = [*(id *)(a1 + 32) running];
  if ((result & 1) == 0)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      int v8 = 138412290;
      uint64_t v9 = v3;
      _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ Starting resident server to listen on incoming requests", (uint8_t *)&v8, 0xCu);
    }
    v4 = [*(id *)(a1 + 32) transport];
    dispatch_queue_t v5 = *(void **)(a1 + 32);
    v6 = [v5 workQueue];
    [v4 setDelegate:v5 delegateQueue:v6];

    [*(id *)(a1 + 32) _registerForSignificantTimeChangeNotifications];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412290;
      uint64_t v9 = v7;
      _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ Registering to receive new session and control channel information", (uint8_t *)&v8, 0xCu);
    }
    return [*(id *)(a1 + 32) setRunning:1];
  }
  return result;
}

- (void)stop
{
  uint64_t v3 = [(MTRPluginResidentServer *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__MTRPluginResidentServer_stop__block_invoke;
  block[3] = &unk_2653E66D8;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __31__MTRPluginResidentServer_stop__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t result = [*(id *)(a1 + 32) running];
  if (result)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v17 = v3;
      _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ Stopping resident server from listening for incoming requests", buf, 0xCu);
    }
    [*(id *)(a1 + 32) _deregisterForSignificantTimeChangeNotifications];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v4 = objc_msgSend(*(id *)(a1 + 32), "sessions", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * v8++) invalidate];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }

    uint64_t v9 = [*(id *)(a1 + 32) sessions];
    [v9 removeAllObjects];

    uint64_t v10 = [*(id *)(a1 + 32) transport];
    [v10 removeDelegate:*(void *)(a1 + 32)];

    return [*(id *)(a1 + 32) setRunning:0];
  }
  return result;
}

- (id)_clientSessionForSessionID:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(MTRPluginResidentServer *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v6 = [(MTRPluginResidentServer *)self sessions];
    id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          long long v11 = [v10 sessionID];
          char v12 = [v11 isEqual:v4];

          if (v12)
          {
            id v7 = v10;
            goto LABEL_12;
          }
        }
        id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)_registerSessionForSessionID:(id)a3 incomingNewMessage:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(MTRPluginResidentServer *)self workQueue];
  dispatch_assert_queue_V2(v8);

  if (v6
    && v7
    && ([v7 homeIdentifier], (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0)
    && (uint64_t v10 = (void *)v9,
        [v7 sourceAddress],
        long long v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        v11))
  {
    char v12 = [(MTRPluginResidentServer *)self _clientSessionForSessionID:v6];

    if (!v12)
    {
      long long v13 = [MTRPluginResidentClientSession alloc];
      long long v14 = [(MTRPluginResidentServer *)self transport];
      long long v15 = [(MTRPluginResidentServer *)self workQueue];
      long long v16 = [v7 homeIdentifier];
      long long v17 = [v7 sourceAddress];
      uint64_t v18 = [(MTRPluginResidentClientSession *)v13 initWithTransport:v14 workQueue:v15 sessionID:v6 homeID:v16 peerAddress:v17];

      if (v18)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v19 = [v7 homeIdentifier];
          v20 = [v7 homeIdentifier];
          int v22 = 138413314;
          v23 = self;
          __int16 v24 = 2112;
          v25 = v18;
          __int16 v26 = 2112;
          id v27 = v6;
          __int16 v28 = 2112;
          v29 = v19;
          __int16 v30 = 2112;
          v31 = v20;
          _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ Registered session: %@ for sessionID : %@  controllerID: %@  homeID: %@", (uint8_t *)&v22, 0x34u);
        }
        v21 = [(MTRPluginResidentServer *)self sessions];
        [v21 addObject:v18];

        [(MTRPluginResidentServer *)self _checkForMaxSessionsLimit];
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        -[MTRPluginResidentServer _registerSessionForSessionID:incomingNewMessage:]((uint64_t)self, (uint64_t)v6, v7);
      }
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[MTRPluginResidentServer _registerSessionForSessionID:incomingNewMessage:]((uint64_t)self, v7);
  }
}

- (void)_unregisterSessionForSessionID:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(MTRPluginResidentServer *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    id v6 = [(MTRPluginResidentServer *)self _clientSessionForSessionID:v4];
    if (v6)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 138412802;
        uint64_t v9 = self;
        __int16 v10 = 2112;
        long long v11 = v6;
        __int16 v12 = 2112;
        id v13 = v4;
        _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ Found session to remove: %@ for sessionID : %@", (uint8_t *)&v8, 0x20u);
      }
      [v6 invalidate];
      id v7 = [(MTRPluginResidentServer *)self sessions];
      [v7 removeObject:v6];
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[MTRPluginResidentServer _unregisterSessionForSessionID:]();
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[MTRPluginResidentServer _unregisterSessionForSessionID:]();
  }
}

- (void)_registerForSignificantTimeChangeNotifications
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(MTRPluginResidentServer *)self workQueue];
  dispatch_assert_queue_V2(v3);

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    int v8 = self;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_INFO, "%@ Registering for signification time change notifications", (uint8_t *)&v7, 0xCu);
  }
  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel_timeZoneOrTimeChanged_ name:*MEMORY[0x263EFF5D0] object:0];

  uint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 addObserver:self selector:sel_timeZoneOrTimeChanged_ name:*MEMORY[0x263EFF5C8] object:0];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)significantTimeChangedNotification, @"SignificantTimeChangeNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_deregisterForSignificantTimeChangeNotifications
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(MTRPluginResidentServer *)self workQueue];
  dispatch_assert_queue_V2(v3);

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    int v8 = self;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_INFO, "%@ De-registering for signification time change notifications", (uint8_t *)&v7, 0xCu);
  }
  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x263EFF5D0] object:0];

  uint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self name:*MEMORY[0x263EFF5C8] object:0];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"SignificantTimeChangeNotification", 0);
}

- (void)timeZoneOrTimeChanged:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    int v7 = self;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_INFO, "%@ Received significant time changed notification, resetting all session times", buf, 0xCu);
  }
  id v4 = [(MTRPluginResidentServer *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__MTRPluginResidentServer_timeZoneOrTimeChanged___block_invoke;
  block[3] = &unk_2653E66D8;
  block[4] = self;
  dispatch_async(v4, block);
}

void __49__MTRPluginResidentServer_timeZoneOrTimeChanged___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF910] date];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "sessions", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
        uint64_t v9 = [*(id *)(a1 + 32) transport];
        [v8 messageTransport:v9 updateTimeOfActivity:v2];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)_checkForMaxSessionsLimit
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(MTRPluginResidentServer *)self workQueue];
  dispatch_assert_queue_V2(v3);

  unint64_t active = MTRPluginMaxActiveClientSessions();
  v21 = self;
  uint64_t v5 = [(MTRPluginResidentServer *)self sessions];
  unint64_t v6 = [v5 count];

  unint64_t v7 = v6 - active;
  if (v6 > active)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v29 = self;
      __int16 v30 = 2048;
      unint64_t v31 = v6;
      __int16 v32 = 2048;
      unint64_t v33 = active;
      _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_INFO, "%@ Total sessions %lu reached above limit of %lu, removing oldest session ", buf, 0x20u);
    }
    uint64_t v8 = [(MTRPluginResidentServer *)self sessions];
    uint64_t v9 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"timeOfLastActivity" ascending:0];
    id v27 = v9;
    long long v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v27 count:1];
    [v8 sortUsingDescriptors:v10];

    long long v11 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", v6 - 1, v7);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v12 = [(MTRPluginResidentServer *)self sessions];
    long long v13 = [v12 objectsAtIndexes:v11];

    uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v23;
      long long v17 = &_os_log_internal;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v19 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v29 = v21;
            __int16 v30 = 2112;
            unint64_t v31 = (unint64_t)v19;
            _os_log_impl(&dword_2558FC000, v17, OS_LOG_TYPE_INFO, "%@ Invalidating session %@", buf, 0x16u);
          }
          [v19 invalidate];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v15);
    }

    v20 = [(MTRPluginResidentServer *)v21 sessions];
    [v20 removeObjectsAtIndexes:v11];
  }
}

- (void)removeResidentClientSession:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MTRPluginResidentServer *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__MTRPluginResidentServer_removeResidentClientSession___block_invoke;
  v7[3] = &unk_2653E6700;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __55__MTRPluginResidentServer_removeResidentClientSession___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = [*(id *)(a1 + 40) sessionID];
    int v6 = 138412546;
    uint64_t v7 = v2;
    __int16 v8 = 2112;
    uint64_t v9 = v3;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ Removing client session with identifier: %@", (uint8_t *)&v6, 0x16u);
  }
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 40) sessionID];
  [v4 _unregisterSessionForSessionID:v5];
}

- (void)messageTransport:(id)a3 handleIncomingMessage:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a4;
  int v6 = [(MTRPluginResidentServer *)self workQueue];
  dispatch_assert_queue_V2(v6);

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [v5 sessionIdentifier];
    int v9 = 138412546;
    uint64_t v10 = self;
    __int16 v11 = 2112;
    long long v12 = v7;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ Received new session with identifier: %@", (uint8_t *)&v9, 0x16u);
  }
  __int16 v8 = [v5 sessionIdentifier];
  [(MTRPluginResidentServer *)self _registerSessionForSessionID:v8 incomingNewMessage:v5];
}

- (MTRPluginProtobufMessageTransport)transport
{
  return (MTRPluginProtobufMessageTransport *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTransport:(id)a3
{
}

- (NSMutableArray)sessions
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSessions:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setWorkQueue:(id)a3
{
}

- (BOOL)running
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_transport, 0);
}

- (void)_registerSessionForSessionID:(uint64_t)a1 incomingNewMessage:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v7 = [a2 sourceAddress];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x16u);
}

- (void)_registerSessionForSessionID:(void *)a3 incomingNewMessage:.cold.2(uint64_t a1, uint64_t a2, void *a3)
{
  os_log_type_t v4 = [a3 homeIdentifier];
  id v5 = [a3 homeIdentifier];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(v6, v7, v8, v9, v10, 0x34u);
}

- (void)_unregisterSessionForSessionID:.cold.1()
{
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0xCu);
}

- (void)_unregisterSessionForSessionID:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x20u);
}

@end