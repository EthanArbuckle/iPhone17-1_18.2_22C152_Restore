@interface ACCiAP2ShimServer
+ (id)sharedInstance;
+ (id)stringForClientID:(unsigned int)a3;
+ (void)markClientAsInterestedInBleNotifications:(id)a3;
+ (void)notifyInterestedClientsOfACCBLEAccessoryEvent:(id)a3 withPayload:(id)a4;
+ (void)postNSDistributeNotificationType:(id)a3 notifyDict:(id)a4;
+ (void)postNotifydNotificationType:(id)a3;
+ (void)resetServerState;
- (ACCiAP2ShimServer)init;
- (BOOL)isShuttingDown;
- (BOOL)processXPCMessage:(id)a3 connection:(id)a4;
- (NSLock)clientLock;
- (NSMutableDictionary)accessoryViaConnectionIDList;
- (NSMutableDictionary)accessoryViaKeyUIDList;
- (NSMutableDictionary)clients;
- (NSMutableDictionary)delegateList;
- (OS_dispatch_queue)iap2dhighPriorityRootQueue;
- (OS_dispatch_queue)internalListenerQueue;
- (OS_dispatch_queue)listQueue;
- (OS_xpc_object)listener;
- (__serverFlags)serverFlags;
- (id)_findAccessoryForAccessoryUID:(id)a3 andKeyTag:(id)a4;
- (id)_findAccessoryForConnectionID:(unsigned int)a3;
- (id)_findAccessoryForConnectionID:(unsigned int)a3 andKeyTag:(id)a4;
- (id)findAccessoryForAccessoryUID:(id)a3 andKeyTag:(id)a4;
- (id)findAccessoryForConnectionID:(unsigned int)a3;
- (id)findAccessoryForConnectionID:(unsigned int)a3 andKeyTag:(id)a4;
- (id)findClientWithID:(unsigned int)a3;
- (id)findClientWithXPCConnection:(id)a3;
- (int)iap2AvailableNotifyToken;
- (unsigned)addClientWithCapabilities:(unsigned int)a3 auditToken:(id *)a4 currentClientID:(unsigned int)a5 xpcConnection:(id)a6 eaProtocols:(id)a7 notifyOfAlreadyConnectedAccessories:(BOOL)a8 andBundleId:(id)a9;
- (unsigned)generateClientID;
- (void)_addAccessory:(id)a3;
- (void)_addDelegate:(id)a3;
- (void)_attachAccessory:(id)a3;
- (void)_detachAccessory:(id)a3;
- (void)_iterateAccessories:(id)a3;
- (void)_iterateDelegates:(id)a3;
- (void)_pollForDeathAfterPromptCompletes;
- (void)_removeAccessory:(id)a3;
- (void)_removeDelegate:(id)a3;
- (void)_resetServerState;
- (void)_startServer;
- (void)_stopServer;
- (void)_takeClientAssertionsForAccessoryConnection;
- (void)_takeClientAssertionsForAccessoryDisconnection;
- (void)addAccessory:(id)a3;
- (void)addDelegate:(id)a3;
- (void)dealloc;
- (void)init;
- (void)iterateAccessoriesAsync:(id)a3;
- (void)iterateAccessoriesSync:(id)a3;
- (void)iterateDelegatesAsync:(id)a3;
- (void)iterateDelegatesSync:(id)a3;
- (void)notifyEAClient:(id)a3 ofAccessoryEvent:(const char *)a4 accessory:(id)a5;
- (void)notifyEAClientsOfAccessoryConnection:(id)a3;
- (void)notifyEAClientsOfAccessoryDisconnection:(id)a3;
- (void)notifyEAClientsOfAccessoryEvent:(const char *)a3 accessory:(id)a4;
- (void)notifyEAClientsOfAccessoryReconnection:(id)a3;
- (void)processDetachXPCConnection:(id)a3;
- (void)removeAccessory:(id)a3;
- (void)removeAllClients;
- (void)removeClientForXPCConnection:(id)a3;
- (void)removeClientWithID:(unsigned int)a3;
- (void)removeDelegate:(id)a3;
- (void)sendToClient:(id)a3 notification:(const char *)a4 withPayload:(id)a5;
- (void)sendToInterestedClientsACCBLENotification:(id)a3 withPayload:(id)a4;
- (void)setAccessoryViaConnectionIDList:(id)a3;
- (void)setAccessoryViaKeyUIDList:(id)a3;
- (void)setDelegateList:(id)a3;
- (void)startServer;
- (void)stopServer;
@end

@implementation ACCiAP2ShimServer

- (ACCiAP2ShimServer)init
{
  init_logging();
  v21.receiver = self;
  v21.super_class = (Class)ACCiAP2ShimServer;
  v3 = [(ACCiAP2ShimServer *)&v21 init];
  if (v3)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    delegateList = v3->_delegateList;
    v3->_delegateList = v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    accessoryViaKeyUIDList = v3->_accessoryViaKeyUIDList;
    v3->_accessoryViaKeyUIDList = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    accessoryViaConnectionIDList = v3->_accessoryViaConnectionIDList;
    v3->_accessoryViaConnectionIDList = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    clients = v3->_clients;
    v3->_clients = v10;

    v12 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    clientLock = v3->_clientLock;
    v3->_clientLock = v12;

    v3->_iap2AvailableNotifyToken = -1;
    v3->_isShuttingDown = 0;
    if (notify_register_check(MEMORY[0x263F49DE8], &v3->_iap2AvailableNotifyToken))
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v14 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
        }
        v14 = &_os_log_internal;
        id v15 = &_os_log_internal;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        -[ACCiAP2ShimServer init]();
      }
    }
    [(ACCiAP2ShimServer *)v3 _resetServerState];
    pthread_mutex_lock(&__sharedIAP2ServerLock);
    dispatch_queue_t v16 = dispatch_queue_create("IAP2ServerListenerQueue", 0);
    internalListenerQueue = v3->_internalListenerQueue;
    v3->_internalListenerQueue = (OS_dispatch_queue *)v16;

    dispatch_queue_t v18 = dispatch_queue_create("com.apple.acciap2shimserver.listQ", 0);
    listQueue = v3->_listQueue;
    v3->_listQueue = (OS_dispatch_queue *)v18;

    pthread_mutex_unlock(&__sharedIAP2ServerLock);
  }
  return v3;
}

- (void)dealloc
{
  [(NSMutableDictionary *)self->_delegateList removeAllObjects];
  [(ACCiAP2ShimServer *)self stopServer];
  int iap2AvailableNotifyToken = self->_iap2AvailableNotifyToken;
  if (iap2AvailableNotifyToken != -1)
  {
    notify_cancel(iap2AvailableNotifyToken);
    self->_int iap2AvailableNotifyToken = -1;
  }
  clients = self->_clients;
  self->_clients = 0;

  clientLock = self->_clientLock;
  self->_clientLock = 0;

  delegateList = self->_delegateList;
  self->_delegateList = 0;

  accessoryViaKeyUIDList = self->_accessoryViaKeyUIDList;
  self->_accessoryViaKeyUIDList = 0;

  accessoryViaConnectionIDList = self->_accessoryViaConnectionIDList;
  self->_accessoryViaConnectionIDList = 0;

  internalListenerQueue = self->_internalListenerQueue;
  self->_internalListenerQueue = 0;

  listQueue = self->_listQueue;
  self->_listQueue = 0;

  v11.receiver = self;
  v11.super_class = (Class)ACCiAP2ShimServer;
  [(ACCiAP2ShimServer *)&v11 dealloc];
}

- (void)_startServer
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t state64 = 0;
  int iap2AvailableNotifyToken = self->_iap2AvailableNotifyToken;
  if (iap2AvailableNotifyToken == -1)
  {
    if (gLogObjects) {
      BOOL v6 = gNumLogObjects < 1;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
      }
      v12 = &_os_log_internal;
      id v7 = &_os_log_internal;
    }
    else
    {
      v12 = *(id *)gLogObjects;
    }
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_39;
    }
    *(_WORD *)buf = 0;
    v13 = "[#Server] IAPServer: startServer: invalid notifyToken!";
    v14 = v12;
    os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_38;
  }
  notify_get_state(iap2AvailableNotifyToken, &state64);
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
    }
    v8 = &_os_log_internal;
    id v5 = &_os_log_internal;
  }
  else
  {
    v8 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v27 = state64;
    _os_log_impl(&dword_223B61000, v8, OS_LOG_TYPE_INFO, "[#Server] IAPServer: startServer: isIap2dLoaded=%llu", buf, 0xCu);
  }

  if (gLogObjects) {
    BOOL v9 = gNumLogObjects <= 0;
  }
  else {
    BOOL v9 = 1;
  }
  int v10 = !v9;
  if (state64 == 1)
  {
    if (v10)
    {
      v12 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
      }
      v12 = &_os_log_internal;
      id v16 = &_os_log_internal;
    }
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
      goto LABEL_39;
    }
    *(_WORD *)buf = 0;
    v13 = "[#Server] IAPServer: startServer: Already loaded!";
    v14 = v12;
    os_log_type_t v15 = OS_LOG_TYPE_INFO;
LABEL_38:
    _os_log_impl(&dword_223B61000, v14, v15, v13, buf, 2u);
LABEL_39:

    return;
  }
  if (v10)
  {
    objc_super v11 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
    }
    objc_super v11 = &_os_log_internal;
    id v17 = &_os_log_internal;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_223B61000, v11, OS_LOG_TYPE_INFO, "[#Server] IAPServer: startServer: init listener queue and start runloop", buf, 2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x263F49DF8], 0, 0, 1u);
  internalListenerQueue = self->_internalListenerQueue;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __33__ACCiAP2ShimServer__startServer__block_invoke;
  v24[3] = &unk_2646D0380;
  v24[4] = self;
  dispatch_sync(internalListenerQueue, v24);
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v20 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
    }
    v20 = &_os_log_internal;
    id v21 = &_os_log_internal;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v27) = 1;
    _os_log_impl(&dword_223B61000, v20, OS_LOG_TYPE_INFO, "[#Server] IAPServer: startServer: set kIAP2AvailableNotification state: %d", buf, 8u);
  }

  notify_set_state(self->_iap2AvailableNotifyToken, 1uLL);
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v22 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
    }
    v22 = &_os_log_internal;
    id v23 = &_os_log_internal;
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_223B61000, v22, OS_LOG_TYPE_INFO, "[#Server] IAPServer: startServer: post kIAP2AvailableNotification notification: ", buf, 2u);
  }

  notify_post(MEMORY[0x263F49DE8]);
}

void __33__ACCiAP2ShimServer__startServer__block_invoke(uint64_t a1)
{
  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.iap2d.xpc", *(dispatch_queue_t *)(*(void *)(a1 + 32) + 72), 1uLL);
  uint64_t v3 = *(void *)(a1 + 32);
  BOOL v4 = *(void **)(v3 + 56);
  *(void *)(v3 + 56) = mach_service;

  uint64_t v5 = *(void *)(a1 + 32);
  if (*(void *)(v5 + 56))
  {
    *(void *)v14 = 0;
    os_log_type_t v15 = v14;
    uint64_t v16 = 0x3032000000;
    id v17 = __Block_byref_object_copy_;
    dispatch_queue_t v18 = __Block_byref_object_dispose_;
    id v19 = (id)0xAAAAAAAAAAAAAAAALL;
    id v19 = *(id *)(v5 + 72);
    if (gLogObjects && gNumLogObjects >= 1)
    {
      BOOL v6 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
      }
      BOOL v6 = &_os_log_internal;
      id v9 = &_os_log_internal;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_223B61000, v6, OS_LOG_TYPE_INFO, "[#Server] IAPServer: startServer: set_event_handler and resume _listener", buf, 2u);
    }

    int v10 = *(_xpc_connection_s **)(*(void *)(a1 + 32) + 56);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __33__ACCiAP2ShimServer__startServer__block_invoke_21;
    handler[3] = &unk_2646D0950;
    handler[4] = v14;
    xpc_connection_set_event_handler(v10, handler);
    xpc_connection_resume(*(xpc_connection_t *)(*(void *)(a1 + 32) + 56));
    _Block_object_dispose(v14, 8);
  }
  else
  {
    if (gLogObjects) {
      BOOL v7 = gNumLogObjects < 1;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
      }
      objc_super v11 = &_os_log_internal;
      id v8 = &_os_log_internal;
    }
    else
    {
      objc_super v11 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_223B61000, v11, OS_LOG_TYPE_INFO, "[#Server] IAPServer: startServer: _listener is not valid!\n", v14, 2u);
    }
  }
}

void __33__ACCiAP2ShimServer__startServer__block_invoke_21(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v5 = (_xpc_connection_s *)v3;
  BOOL v6 = v4;
  uint64_t v7 = MEMORY[0x223CBCCB0](v5);
  id v8 = +[ACCiAP2ShimServer sharedInstance];
  if (v7 == MEMORY[0x263EF86F0])
  {
    xpc_connection_set_target_queue(v5, v6);
    *(void *)&long long v16 = MEMORY[0x263EF8330];
    *((void *)&v16 + 1) = 3221225472;
    id v17 = ___xpc_iap2d_handle_incoming_request_block_invoke;
    dispatch_queue_t v18 = &unk_2646D0B58;
    objc_super v11 = v5;
    id v19 = v11;
    id v20 = v8;
    xpc_connection_set_event_handler(v11, &v16);
    xpc_connection_resume(v11);
  }
  else if (v7 == MEMORY[0x263EF8720])
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v12 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
      }
      v12 = &_os_log_internal;
      id v14 = &_os_log_internal;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      string = xpc_dictionary_get_string(v5, (const char *)*MEMORY[0x263EF86B0]);
      LODWORD(v16) = 136315138;
      *(void *)((char *)&v16 + 4) = string;
      _os_log_impl(&dword_223B61000, v12, OS_LOG_TYPE_INFO, "[#Server] _xpc_iap2d_handle_incoming_request connection error: %s\n", (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    id v9 = (void *)MEMORY[0x223CBCBE0](v5);
    if (gLogObjects && gNumLogObjects >= 1)
    {
      int v10 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
      }
      int v10 = &_os_log_internal;
      id v13 = &_os_log_internal;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LODWORD(v16) = 136315138;
      *(void *)((char *)&v16 + 4) = v9;
      _os_log_impl(&dword_223B61000, v10, OS_LOG_TYPE_INFO, "[#Server] _xpc_iap2d_handle_incoming_request unexpected event: %s\n", (uint8_t *)&v16, 0xCu);
    }

    free(v9);
  }
}

- (void)startServer
{
  listQueue = self->_listQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__ACCiAP2ShimServer_startServer__block_invoke;
  block[3] = &unk_2646D0380;
  block[4] = self;
  dispatch_async(listQueue, block);
}

uint64_t __32__ACCiAP2ShimServer_startServer__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startServer];
}

- (void)_pollForDeathAfterPromptCompletes
{
  *(_DWORD *)&self->_serverFlags |= 1u;
}

- (void)_stopServer
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v3 = [(NSMutableDictionary *)self->_delegateList allValues];
  uint64_t v4 = [v3 count];

  if (gLogObjects) {
    BOOL v5 = gNumLogObjects <= 0;
  }
  else {
    BOOL v5 = 1;
  }
  int v6 = !v5;
  if (!v4)
  {
    if (v6)
    {
      id v8 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
      }
      id v8 = &_os_log_internal;
      id v11 = &_os_log_internal;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_223B61000, v8, OS_LOG_TYPE_INFO, "[#Server] IAPServer: stopServer", buf, 2u);
    }

    if (gLogObjects && gNumLogObjects >= 1)
    {
      v12 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
      }
      v12 = &_os_log_internal;
      id v13 = &_os_log_internal;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v14 = [(NSMutableDictionary *)self->_delegateList allValues];
      uint64_t v15 = [v14 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v35 = v15;
      _os_log_impl(&dword_223B61000, v12, OS_LOG_TYPE_INFO, "[#Server] IAPServer: stopServer, _delegateList count %lu", buf, 0xCu);
    }
    if (self->_listener)
    {
      internalListenerQueue = self->_internalListenerQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __32__ACCiAP2ShimServer__stopServer__block_invoke;
      block[3] = &unk_2646D0380;
      block[4] = self;
      dispatch_sync(internalListenerQueue, block);
    }
    int iap2AvailableNotifyToken = self->_iap2AvailableNotifyToken;
    if (iap2AvailableNotifyToken == -1)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        uint64_t v21 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
        }
        uint64_t v21 = &_os_log_internal;
        id v22 = &_os_log_internal;
      }
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_67;
      }
      *(_WORD *)buf = 0;
      id v23 = "[#Server] IAPServer: stopServer: invalid notifyToken!";
      v24 = v21;
      os_log_type_t v25 = OS_LOG_TYPE_DEFAULT;
      uint32_t v26 = 2;
    }
    else
    {
      uint64_t v32 = 0;
      notify_get_state(iap2AvailableNotifyToken, (uint64_t *)&v32);
      if (gLogObjects) {
        BOOL v18 = gNumLogObjects <= 0;
      }
      else {
        BOOL v18 = 1;
      }
      int v19 = !v18;
      if (v32 == 1)
      {
        if (v19)
        {
          id v20 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
          }
          id v20 = &_os_log_internal;
          id v27 = &_os_log_internal;
        }
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v35) = 0;
          _os_log_impl(&dword_223B61000, v20, OS_LOG_TYPE_INFO, "[#Server] IAPServer: stopServer: set kIAP2AvailableNotification state: %d", buf, 8u);
        }

        notify_set_state(self->_iap2AvailableNotifyToken, 0);
        if (gLogObjects && gNumLogObjects >= 1)
        {
          uint64_t v28 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
          }
          uint64_t v28 = &_os_log_internal;
          id v30 = &_os_log_internal;
        }
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_223B61000, v28, OS_LOG_TYPE_INFO, "[#Server] IAPServer: stopServer: post kIAP2AvailableNotification notification: ", buf, 2u);
        }

        notify_post(MEMORY[0x263F49DE8]);
        goto LABEL_74;
      }
      if (v19)
      {
        uint64_t v21 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
        }
        uint64_t v21 = &_os_log_internal;
        id v29 = &_os_log_internal;
      }
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
LABEL_67:

LABEL_74:
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x263F49DF0], 0, 0, 1u);
        [(ACCiAP2ShimServer *)self performSelectorOnMainThread:sel__pollForDeathAfterPromptCompletes withObject:0 waitUntilDone:0];
        return;
      }
      *(_DWORD *)buf = 134217984;
      uint64_t v35 = v32;
      id v23 = "[#Server] IAPServer: stopServer: kIAP2AvailableNotification state %llu, skip post";
      v24 = v21;
      os_log_type_t v25 = OS_LOG_TYPE_INFO;
      uint32_t v26 = 12;
    }
    _os_log_impl(&dword_223B61000, v24, v25, v23, buf, v26);
    goto LABEL_67;
  }
  if (v6)
  {
    uint64_t v7 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
    }
    uint64_t v7 = &_os_log_internal;
    id v9 = &_os_log_internal;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v10 = [(NSMutableDictionary *)self->_delegateList allValues];
    *(_DWORD *)buf = 134217984;
    uint64_t v35 = [v10 count];
    _os_log_impl(&dword_223B61000, v7, OS_LOG_TYPE_INFO, "[#Server] IAPServer: Skip stopServer, there are still %lu delegates registered", buf, 0xCu);
  }
}

void __32__ACCiAP2ShimServer__stopServer__block_invoke(uint64_t a1)
{
  xpc_connection_cancel(*(xpc_connection_t *)(*(void *)(a1 + 32) + 56));
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 56);
  *(void *)(v2 + 56) = 0;
}

- (void)stopServer
{
  listQueue = self->_listQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__ACCiAP2ShimServer_stopServer__block_invoke;
  block[3] = &unk_2646D0380;
  block[4] = self;
  dispatch_async(listQueue, block);
}

uint64_t __31__ACCiAP2ShimServer_stopServer__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopServer];
}

- (void)_addDelegate:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [v4 getUID];
  if (gLogObjects) {
    BOOL v6 = gNumLogObjects < 1;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
    }
    id v8 = &_os_log_internal;
    id v7 = &_os_log_internal;
  }
  else
  {
    id v8 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    delegateList = self->_delegateList;
    int v14 = 138412546;
    id v15 = v4;
    __int16 v16 = 2112;
    id v17 = delegateList;
    _os_log_impl(&dword_223B61000, v8, OS_LOG_TYPE_INFO, "[#Server] ACCiAP2ShimServer before addDelegate %@, delegateList=%@", (uint8_t *)&v14, 0x16u);
  }

  int v10 = [(NSMutableDictionary *)self->_delegateList objectForKey:v5];

  if (!v10) {
    [(NSMutableDictionary *)self->_delegateList setObject:v4 forKey:v5];
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    id v11 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
    }
    id v11 = &_os_log_internal;
    id v12 = &_os_log_internal;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v13 = self->_delegateList;
    int v14 = 138412546;
    id v15 = v4;
    __int16 v16 = 2112;
    id v17 = v13;
    _os_log_impl(&dword_223B61000, v11, OS_LOG_TYPE_INFO, "[#Server] ACCiAP2ShimServer after addDelegate %@, delegateList=%@", (uint8_t *)&v14, 0x16u);
  }
}

- (void)addDelegate:(id)a3
{
  id v4 = a3;
  listQueue = self->_listQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__ACCiAP2ShimServer_addDelegate___block_invoke;
  v7[3] = &unk_2646D0978;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(listQueue, v7);
}

uint64_t __33__ACCiAP2ShimServer_addDelegate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addDelegate:*(void *)(a1 + 40)];
}

- (void)_removeDelegate:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [v4 getUID];
  if (gLogObjects) {
    BOOL v6 = gNumLogObjects < 1;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
    }
    id v8 = &_os_log_internal;
    id v7 = &_os_log_internal;
  }
  else
  {
    id v8 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    delegateList = self->_delegateList;
    int v14 = 138412546;
    id v15 = v4;
    __int16 v16 = 2112;
    id v17 = delegateList;
    _os_log_impl(&dword_223B61000, v8, OS_LOG_TYPE_INFO, "[#Server] ACCiAP2ShimServer before removeDelegate %@, delegateList=%@", (uint8_t *)&v14, 0x16u);
  }

  int v10 = [(NSMutableDictionary *)self->_delegateList objectForKey:v5];

  if (v10) {
    [(NSMutableDictionary *)self->_delegateList removeObjectForKey:v5];
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    id v11 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
    }
    id v11 = &_os_log_internal;
    id v12 = &_os_log_internal;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v13 = self->_delegateList;
    int v14 = 138412546;
    id v15 = v4;
    __int16 v16 = 2112;
    id v17 = v13;
    _os_log_impl(&dword_223B61000, v11, OS_LOG_TYPE_INFO, "[#Server] ACCiAP2ShimServer after removeDelegate %@, delegateList=%@", (uint8_t *)&v14, 0x16u);
  }
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  listQueue = self->_listQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__ACCiAP2ShimServer_removeDelegate___block_invoke;
  v7[3] = &unk_2646D0978;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(listQueue, v7);
}

uint64_t __36__ACCiAP2ShimServer_removeDelegate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeDelegate:*(void *)(a1 + 40)];
}

- (void)_iterateDelegates:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void, uint8_t *))a3;
  delegateList = self->_delegateList;
  p_delegateList = &self->_delegateList;
  uint64_t v7 = [(NSMutableDictionary *)delegateList count];
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects <= 0;
  }
  else {
    BOOL v8 = 1;
  }
  int v9 = !v8;
  if (v7)
  {
    if (v9)
    {
      int v10 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
      }
      int v10 = &_os_log_internal;
      id v12 = &_os_log_internal;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[ACCiAP2ShimServer _iterateDelegates:]((uint64_t)p_delegateList, v10, v13, v14, v15, v16, v17, v18);
    }

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v11 = [(NSMutableDictionary *)*p_delegateList allValues];
    uint64_t v19 = [v11 countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v27;
LABEL_19:
      uint64_t v22 = 0;
      while (1)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(v11);
        }
        uint64_t v23 = *(void *)(*((void *)&v26 + 1) + 8 * v22);
        buf[0] = 1;
        v4[2](v4, v23, buf);
        if (!buf[0]) {
          break;
        }
        if (v20 == ++v22)
        {
          uint64_t v20 = [v11 countByEnumeratingWithState:&v26 objects:v32 count:16];
          if (v20) {
            goto LABEL_19;
          }
          break;
        }
      }
    }
  }
  else
  {
    if (v9)
    {
      id v11 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
      }
      id v11 = &_os_log_internal;
      id v24 = &_os_log_internal;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      os_log_type_t v25 = *p_delegateList;
      *(_DWORD *)buf = 138412290;
      v31 = v25;
      _os_log_impl(&dword_223B61000, v11, OS_LOG_TYPE_INFO, "[#Server] ACCiAP2ShimServer iterateDelegates, no registered delegate! _delegateList=%@", buf, 0xCu);
    }
  }
}

- (void)iterateDelegatesAsync:(id)a3
{
  id v4 = a3;
  listQueue = self->_listQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__ACCiAP2ShimServer_iterateDelegatesAsync___block_invoke;
  v7[3] = &unk_2646D09A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(listQueue, v7);
}

uint64_t __43__ACCiAP2ShimServer_iterateDelegatesAsync___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _iterateDelegates:*(void *)(a1 + 40)];
}

- (void)iterateDelegatesSync:(id)a3
{
  id v4 = a3;
  listQueue = self->_listQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__ACCiAP2ShimServer_iterateDelegatesSync___block_invoke;
  v7[3] = &unk_2646D09A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(listQueue, v7);
}

uint64_t __42__ACCiAP2ShimServer_iterateDelegatesSync___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _iterateDelegates:*(void *)(a1 + 40)];
}

- (void)_addAccessory:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
    }
    uint64_t v7 = &_os_log_internal;
    id v6 = &_os_log_internal;
  }
  else
  {
    uint64_t v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v14 = 138412290;
    id v15 = v4;
    _os_log_impl(&dword_223B61000, v7, OS_LOG_TYPE_INFO, "[#Server] ACCiAP2ShimServer addAccessory %@", (uint8_t *)&v14, 0xCu);
  }

  id v8 = [v4 keyAccessoryUID];
  int v9 = [v4 keyConnectionID];
  int v10 = [(NSMutableDictionary *)self->_accessoryViaKeyUIDList objectForKey:v8];

  if (!v10) {
    [(NSMutableDictionary *)self->_accessoryViaKeyUIDList setObject:v4 forKey:v8];
  }
  id v11 = [(NSMutableDictionary *)self->_accessoryViaConnectionIDList objectForKey:v9];

  if (!v11) {
    [(NSMutableDictionary *)self->_accessoryViaConnectionIDList setObject:v4 forKey:v9];
  }
  [(ACCiAP2ShimServer *)self _attachAccessory:v4];
  if (gLogObjects && gNumLogObjects >= 1)
  {
    id v12 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
    }
    id v12 = &_os_log_internal;
    id v13 = &_os_log_internal;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[ACCiAP2ShimServer _addAccessory:]();
  }
}

- (void)addAccessory:(id)a3
{
  id v4 = a3;
  listQueue = self->_listQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __34__ACCiAP2ShimServer_addAccessory___block_invoke;
  v7[3] = &unk_2646D0978;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(listQueue, v7);
}

uint64_t __34__ACCiAP2ShimServer_addAccessory___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addAccessory:*(void *)(a1 + 40)];
}

- (void)_removeAccessory:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
    }
    uint64_t v7 = &_os_log_internal;
    id v6 = &_os_log_internal;
  }
  else
  {
    uint64_t v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v14 = 138412290;
    id v15 = v4;
    _os_log_impl(&dword_223B61000, v7, OS_LOG_TYPE_INFO, "[#Server] ACCiAP2ShimServer removeAccessory %@", (uint8_t *)&v14, 0xCu);
  }

  id v8 = [v4 keyAccessoryUID];
  int v9 = [v4 keyConnectionID];
  if (v8)
  {
    int v10 = [(NSMutableDictionary *)self->_accessoryViaKeyUIDList objectForKey:v8];

    if (v10) {
      [(NSMutableDictionary *)self->_accessoryViaKeyUIDList removeObjectForKey:v8];
    }
  }
  if (v9)
  {
    id v11 = [(NSMutableDictionary *)self->_accessoryViaConnectionIDList objectForKey:v9];

    if (v11) {
      [(NSMutableDictionary *)self->_accessoryViaConnectionIDList removeObjectForKey:v9];
    }
  }
  [(ACCiAP2ShimServer *)self _detachAccessory:v4];
  if (gLogObjects && gNumLogObjects >= 1)
  {
    id v12 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
    }
    id v12 = &_os_log_internal;
    id v13 = &_os_log_internal;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[ACCiAP2ShimServer _removeAccessory:]();
  }
}

- (void)removeAccessory:(id)a3
{
  id v4 = a3;
  listQueue = self->_listQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __37__ACCiAP2ShimServer_removeAccessory___block_invoke;
  v7[3] = &unk_2646D0978;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(listQueue, v7);
}

uint64_t __37__ACCiAP2ShimServer_removeAccessory___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeAccessory:*(void *)(a1 + 40)];
}

- (void)_iterateAccessories:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void, uint8_t *))a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
    }
    uint64_t v7 = &_os_log_internal;
    id v6 = &_os_log_internal;
  }
  else
  {
    uint64_t v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[ACCiAP2ShimServer _iterateAccessories:]((uint64_t)self, v7, v8, v9, v10, v11, v12, v13);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  int v14 = [(NSMutableDictionary *)self->_accessoryViaKeyUIDList allValues];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v27;
    uint64_t v18 = &_os_log_internal;
LABEL_13:
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v27 != v17) {
        objc_enumerationMutation(v14);
      }
      uint64_t v20 = *(void *)(*((void *)&v26 + 1) + 8 * v19);
      uint64_t v21 = gLogObjects;
      int v22 = gNumLogObjects;
      if (!gLogObjects || gNumLogObjects < 1)
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          uint64_t v32 = v21;
          __int16 v33 = 1024;
          int v34 = v22;
          _os_log_error_impl(&dword_223B61000, v18, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        id v24 = v18;
        os_log_type_t v25 = v18;
      }
      else
      {
        os_log_type_t v25 = *(id *)gLogObjects;
      }
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v32 = v20;
        _os_log_debug_impl(&dword_223B61000, v25, OS_LOG_TYPE_DEBUG, "[#Server] ACCiAP2ShimServer iterateAccessories, accessory=%@", buf, 0xCu);
      }

      buf[0] = 1;
      v4[2](v4, v20, buf);
      if (!buf[0]) {
        break;
      }
      if (v16 == ++v19)
      {
        uint64_t v16 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v16) {
          goto LABEL_13;
        }
        break;
      }
    }
  }
}

- (void)iterateAccessoriesAsync:(id)a3
{
  id v4 = a3;
  listQueue = self->_listQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__ACCiAP2ShimServer_iterateAccessoriesAsync___block_invoke;
  v7[3] = &unk_2646D09A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(listQueue, v7);
}

uint64_t __45__ACCiAP2ShimServer_iterateAccessoriesAsync___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _iterateAccessories:*(void *)(a1 + 40)];
}

- (void)iterateAccessoriesSync:(id)a3
{
  id v4 = a3;
  listQueue = self->_listQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__ACCiAP2ShimServer_iterateAccessoriesSync___block_invoke;
  v7[3] = &unk_2646D09A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(listQueue, v7);
}

uint64_t __44__ACCiAP2ShimServer_iterateAccessoriesSync___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _iterateAccessories:*(void *)(a1 + 40)];
}

- (id)_findAccessoryForConnectionID:(unsigned int)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(NSMutableDictionary *)self->_accessoryViaConnectionIDList allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 connectionID] == a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (id)findAccessoryForConnectionID:(unsigned int)a3
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy_;
  long long v12 = __Block_byref_object_dispose_;
  id v13 = 0;
  listQueue = self->_listQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__ACCiAP2ShimServer_findAccessoryForConnectionID___block_invoke;
  block[3] = &unk_2646D09C8;
  block[4] = self;
  void block[5] = &v8;
  unsigned int v7 = a3;
  dispatch_sync(listQueue, block);
  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

uint64_t __50__ACCiAP2ShimServer_findAccessoryForConnectionID___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _findAccessoryForConnectionID:*(unsigned int *)(a1 + 48)];
  return MEMORY[0x270F9A758]();
}

- (id)_findAccessoryForConnectionID:(unsigned int)a3 andKeyTag:(id)a4
{
  uint64_t v5 = [NSString stringWithFormat:@"%@-%u", a4, *(void *)&a3];
  uint64_t v6 = [(NSMutableDictionary *)self->_accessoryViaConnectionIDList objectForKey:v5];

  return v6;
}

- (id)findAccessoryForConnectionID:(unsigned int)a3 andKeyTag:(id)a4
{
  id v6 = a4;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy_;
  uint64_t v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  listQueue = self->_listQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __60__ACCiAP2ShimServer_findAccessoryForConnectionID_andKeyTag___block_invoke;
  v11[3] = &unk_2646D09F0;
  id v12 = v6;
  id v13 = &v15;
  unsigned int v14 = a3;
  v11[4] = self;
  id v8 = v6;
  dispatch_sync(listQueue, v11);
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

uint64_t __60__ACCiAP2ShimServer_findAccessoryForConnectionID_andKeyTag___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _findAccessoryForConnectionID:*(unsigned int *)(a1 + 56) andKeyTag:*(void *)(a1 + 40)];
  return MEMORY[0x270F9A758]();
}

- (id)_findAccessoryForAccessoryUID:(id)a3 andKeyTag:(id)a4
{
  uint64_t v5 = [NSString stringWithFormat:@"%@-%@", a4, a3];
  id v6 = [(NSMutableDictionary *)self->_accessoryViaKeyUIDList objectForKey:v5];

  return v6;
}

- (id)findAccessoryForAccessoryUID:(id)a3 andKeyTag:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy_;
  uint64_t v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  listQueue = self->_listQueue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __60__ACCiAP2ShimServer_findAccessoryForAccessoryUID_andKeyTag___block_invoke;
  v13[3] = &unk_2646D0A18;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  uint64_t v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(listQueue, v13);
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

uint64_t __60__ACCiAP2ShimServer_findAccessoryForAccessoryUID_andKeyTag___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [*(id *)(a1 + 32) _findAccessoryForAccessoryUID:*(void *)(a1 + 40) andKeyTag:*(void *)(a1 + 48)];
  return MEMORY[0x270F9A758]();
}

- (BOOL)processXPCMessage:(id)a3 connection:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  string = xpc_dictionary_get_string(v6, "requestType");
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __50__ACCiAP2ShimServer_processXPCMessage_connection___block_invoke;
  v16[3] = &unk_2646D0A40;
  id v9 = v6;
  id v17 = v9;
  id v10 = v7;
  id v18 = v10;
  uint64_t v19 = self;
  id v20 = &v22;
  uint64_t v21 = string;
  [(ACCiAP2ShimServer *)self iterateDelegatesSync:v16];
  if (*((unsigned char *)v23 + 24))
  {
    BOOL v11 = 1;
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v12 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
      }
      id v12 = &_os_log_internal;
      id v13 = &_os_log_internal;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      id v15 = "<nil>";
      *(_DWORD *)buf = 138412802;
      if (string) {
        id v15 = string;
      }
      id v27 = v9;
      __int16 v28 = 2112;
      id v29 = v10;
      __int16 v30 = 2080;
      v31 = v15;
      _os_log_debug_impl(&dword_223B61000, v12, OS_LOG_TYPE_DEBUG, "[#Server] processXPCMessage: %@ connection: %@, None of the delegates processed the message! requestType=%s", buf, 0x20u);
    }

    BOOL v11 = *((unsigned char *)v23 + 24) != 0;
  }

  _Block_object_dispose(&v22, 8);
  return v11;
}

void __50__ACCiAP2ShimServer_processXPCMessage_connection___block_invoke(void *a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  char v6 = objc_opt_respondsToSelector();
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects <= 0;
  }
  else {
    BOOL v7 = 1;
  }
  int v8 = !v7;
  if (v6)
  {
    if (v8)
    {
      id v9 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
      }
      id v9 = &_os_log_internal;
      id v11 = &_os_log_internal;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __50__ACCiAP2ShimServer_processXPCMessage_connection___block_invoke_cold_1();
    }

    int v12 = [v5 tryProcessXPCMessage:a1[4] connection:a1[5] server:a1[6]];
    *a3 = v12 ^ 1;
    if (((v12 ^ 1) & 1) == 0) {
      *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
    }
  }
  else
  {
    if (v8)
    {
      id v10 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
      }
      id v10 = &_os_log_internal;
      id v13 = &_os_log_internal;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __50__ACCiAP2ShimServer_processXPCMessage_connection___block_invoke_cold_3();
    }
  }
}

- (void)processDetachXPCConnection:(id)a3
{
  id v4 = a3;
  [(ACCiAP2ShimServer *)self removeClientForXPCConnection:v4];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__ACCiAP2ShimServer_processDetachXPCConnection___block_invoke;
  v6[3] = &unk_2646D0A68;
  id v7 = v4;
  id v5 = v4;
  [(ACCiAP2ShimServer *)self iterateDelegatesSync:v6];
}

void __48__ACCiAP2ShimServer_processDetachXPCConnection___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector()) {
    *a3 = [v5 detachXPCConnection:*(void *)(a1 + 32)] ^ 1;
  }
}

- (void)_attachAccessory:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
    }
    id v7 = &_os_log_internal;
    id v6 = &_os_log_internal;
  }
  else
  {
    id v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v37 = v4;
    _os_log_impl(&dword_223B61000, v7, OS_LOG_TYPE_DEFAULT, "[#Server] ACCiAP2ShimServer _attachAccessory %@", buf, 0xCu);
  }

  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "connectionID"));
  id v10 = [v4 name];
  [v8 setObject:v10 forKey:*MEMORY[0x263F49DC8]];

  id v11 = [v4 manufacturer];
  [v8 setObject:v11 forKey:*MEMORY[0x263F49DB8]];

  int v12 = [v4 model];
  [v8 setObject:v12 forKey:*MEMORY[0x263F49DC0]];

  id v13 = [v4 serialNumber];
  [v8 setObject:v13 forKey:*MEMORY[0x263F49DD8]];

  id v14 = [v4 firmwareVersion];
  [v8 setObject:v14 forKey:*MEMORY[0x263F49DA8]];

  id v15 = [v4 hardwareVersion];
  [v8 setObject:v15 forKey:*MEMORY[0x263F49DB0]];

  if (gLogObjects && gNumLogObjects >= 1)
  {
    uint64_t v16 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
    }
    uint64_t v16 = &_os_log_internal;
    id v17 = &_os_log_internal;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = [v4 name];
    [v4 manufacturer];
    int v34 = v9;
    v20 = uint64_t v19 = self;
    uint64_t v21 = [v4 model];
    uint64_t v22 = [v4 serialNumber];
    uint64_t v23 = [v4 firmwareVersion];
    uint64_t v24 = [v4 hardwareVersion];
    *(_DWORD *)buf = 138413826;
    id v37 = v18;
    __int16 v38 = 2112;
    id v39 = v20;
    __int16 v40 = 2112;
    v41 = v21;
    __int16 v42 = 2112;
    v43 = v22;
    __int16 v44 = 2112;
    v45 = v23;
    __int16 v46 = 2112;
    v47 = v24;
    __int16 v48 = 2112;
    v49 = @"---";
    _os_log_impl(&dword_223B61000, v16, OS_LOG_TYPE_DEFAULT, "[#Server] ACCiAP2ShimServer _attachAccessory: AccName=%@, AccManufacturer=%@, AccModel=%@, AccSerialNumber=%@, AccFWVersion=%@, AccHWVersion=%@, AccDockType=%@", buf, 0x48u);

    self = v19;
    id v9 = v34;
  }
  [v8 setObject:v9 forKey:*MEMORY[0x263F49DE0]];
  char v25 = [v4 model];
  int shouldHideAccessoryWithModelNumber = acc_policies_shouldHideAccessoryWithModelNumber((uint64_t)v25);

  if (shouldHideAccessoryWithModelNumber)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v27 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
      }
      id v27 = &_os_log_internal;
      id v29 = &_os_log_internal;
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_223B61000, v27, OS_LOG_TYPE_INFO, "[#Server] ACCiAP2ShimServer _attachAccessory: should be hiding accessory from settings", buf, 2u);
    }

    uint64_t v28 = 256;
  }
  else
  {
    uint64_t v28 = 0;
  }
  __int16 v30 = [NSNumber numberWithUnsignedInt:v28];
  [v8 setObject:v30 forKey:*MEMORY[0x263F49D98]];

  [(ACCiAP2ShimServer *)self _takeClientAssertionsForAccessoryConnection];
  v35.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&v35.tv_usec = 0xAAAAAAAAAAAAAAAALL;
  gettimeofday(&v35, 0);
  v31 = [NSNumber numberWithLong:v35.tv_sec];
  [v8 setObject:v31 forKey:*MEMORY[0x263F49DA0]];

  if ([v4 dontPublish])
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      uint64_t v32 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
      }
      uint64_t v32 = &_os_log_internal;
      id v33 = &_os_log_internal;
    }
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v37 = v4;
      __int16 v38 = 2112;
      id v39 = v8;
      _os_log_impl(&dword_223B61000, v32, OS_LOG_TYPE_INFO, "[#Server] ACCiAP2ShimServer _attachAccessory: %@, dontPublish set! accessoryDict=%@", buf, 0x16u);
    }
  }
  else
  {
    [(ACCiAP2ShimServer *)self notifyEAClientsOfAccessoryConnection:v8];
  }
}

- (void)_detachAccessory:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [v4 accessoryInfoDict];
  if (gLogObjects) {
    BOOL v6 = gNumLogObjects < 1;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
    }
    id v8 = &_os_log_internal;
    id v7 = &_os_log_internal;
  }
  else
  {
    id v8 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v17 = 138412546;
    id v18 = v4;
    __int16 v19 = 2112;
    id v20 = v5;
    _os_log_impl(&dword_223B61000, v8, OS_LOG_TYPE_INFO, "[#Server] ACCiAP2ShimServer _detachAccessory: %@, accessoryDict=%@", (uint8_t *)&v17, 0x16u);
  }

  if ([v5 count])
  {
    if ([v4 dontPublish])
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v9 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
        }
        id v9 = &_os_log_internal;
        id v10 = &_os_log_internal;
      }
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
        goto LABEL_30;
      }
      int v11 = [v4 connectionID];
      int v17 = 138412546;
      id v18 = v4;
      __int16 v19 = 1024;
      LODWORD(v20) = v11;
      int v12 = "[#Server] ACCiAP2ShimServer _detachAccessory: %@, dontPublish set! connectionID=%d";
      id v13 = v9;
      uint32_t v14 = 18;
    }
    else
    {
      [(ACCiAP2ShimServer *)self _takeClientAssertionsForAccessoryDisconnection];
      [(ACCiAP2ShimServer *)self notifyEAClientsOfAccessoryDisconnection:v5];
      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v9 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
        }
        id v9 = &_os_log_internal;
        id v15 = &_os_log_internal;
      }
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
        goto LABEL_30;
      }
      int v16 = [v4 connectionID];
      int v17 = 67109120;
      LODWORD(v18) = v16;
      int v12 = "[#Server] ACCiAP2ShimServer _detachAccessory: accessory with connectionID=%d detached";
      id v13 = v9;
      uint32_t v14 = 8;
    }
    _os_log_impl(&dword_223B61000, v13, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v17, v14);
LABEL_30:
  }
}

- (void)_takeClientAssertionsForAccessoryDisconnection
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = self->_clients;
  uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = -[NSMutableDictionary objectForKey:](self->_clients, "objectForKey:", *(void *)(*((void *)&v9 + 1) + 8 * v7), (void)v9);
        [v8 takeProcessAssertion:@"external-accessory.disconnect"];
        [v8 setClientRequiresAccReset:0];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (unsigned)addClientWithCapabilities:(unsigned int)a3 auditToken:(id *)a4 currentClientID:(unsigned int)a5 xpcConnection:(id)a6 eaProtocols:(id)a7 notifyOfAlreadyConnectedAccessories:(BOOL)a8 andBundleId:(id)a9
{
  BOOL v56 = a8;
  uint64_t v10 = *(void *)&a5;
  LODWORD(v55) = a3;
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v13 = a6;
  id v14 = a7;
  id v15 = a9;
  if (gLogObjects) {
    BOOL v16 = gNumLogObjects < 1;
  }
  else {
    BOOL v16 = 1;
  }
  if (v16)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
    }
    id v18 = &_os_log_internal;
    id v17 = &_os_log_internal;
  }
  else
  {
    id v18 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v19 = a4->var0[0];
    *(_DWORD *)buf = 67110658;
    *(_DWORD *)v69 = v55;
    *(_WORD *)&v69[4] = 1024;
    *(_DWORD *)&v69[6] = v19;
    __int16 v70 = 1024;
    int v71 = v10;
    __int16 v72 = 2112;
    id v73 = v13;
    __int16 v74 = 2112;
    id v75 = v14;
    __int16 v76 = 1024;
    BOOL v77 = v56;
    __int16 v78 = 2112;
    id v79 = v15;
    _os_log_impl(&dword_223B61000, v18, OS_LOG_TYPE_DEFAULT, "[#Server] addClientWithCapabilities:%u auditToken:%xh currentClienID:%u xpcConnection:%@ eaProtocols:%@ notifyOfAlreadyConnectedAccessories:%d andBundleId:%@", buf, 0x38u);
  }

  [(NSLock *)self->_clientLock lock];
  if (gLogObjects && gNumLogObjects >= 1)
  {
    id v20 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
    }
    id v20 = &_os_log_internal;
    id v21 = &_os_log_internal;
  }
  id v57 = v15;
  id v58 = v14;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    clients = self->_clients;
    *(_DWORD *)buf = 138412290;
    *(void *)v69 = clients;
    _os_log_impl(&dword_223B61000, v20, OS_LOG_TYPE_DEFAULT, "[#Server] addClientWithCapabilities: _clients=%@", buf, 0xCu);
  }

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  uint64_t v23 = [(NSMutableDictionary *)self->_clients allKeys];
  uint64_t v24 = [v23 countByEnumeratingWithState:&v63 objects:v67 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    id v26 = v13;
    uint64_t v27 = *(void *)v64;
LABEL_21:
    uint64_t v28 = 0;
    while (1)
    {
      if (*(void *)v64 != v27) {
        objc_enumerationMutation(v23);
      }
      id v29 = -[NSMutableDictionary objectForKey:](self->_clients, "objectForKey:", *(void *)(*((void *)&v63 + 1) + 8 * v28), v55);
      if ([v29 clientID] == v10) {
        break;
      }

      if (v25 == ++v28)
      {
        uint64_t v25 = [v23 countByEnumeratingWithState:&v63 objects:v67 count:16];
        if (v25) {
          goto LABEL_21;
        }
        id v29 = 0;
        break;
      }
    }
    id v13 = v26;
  }
  else
  {
    id v29 = 0;
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    __int16 v30 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
    }
    __int16 v30 = &_os_log_internal;
    id v31 = &_os_log_internal;
  }
  id v33 = v57;
  uint64_t v32 = v58;
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v69 = v29;
    _os_log_impl(&dword_223B61000, v30, OS_LOG_TYPE_DEFAULT, "[#Server] addClientWithCapabilities: client=%@", buf, 0xCu);
  }

  if (v29)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      int v34 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
      }
      int v34 = &_os_log_internal;
      id v43 = &_os_log_internal;
    }
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      int v44 = [v29 clientID];
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v69 = v44;
      _os_log_impl(&dword_223B61000, v34, OS_LOG_TYPE_DEFAULT, "[#Server] ERROR - already have client for clientID 0x%08x", buf, 8u);
    }
    LODWORD(v10) = 0;
  }
  else
  {
    timeval v35 = [ACCiAP2ShimServerClient alloc];
    long long v36 = *(_OWORD *)&a4->var0[4];
    v62[0] = *(_OWORD *)a4->var0;
    v62[1] = v36;
    id v37 = [(ACCiAP2ShimServerClient *)v35 initWithCapabilities:v55 auditToken:v62 xpcConnection:v13 eaProtocols:v58 andBundleId:v57];
    __int16 v38 = self->_clients;
    if (!v38)
    {
      id v39 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      __int16 v40 = self->_clients;
      self->_clients = v39;

      __int16 v38 = self->_clients;
    }
    v41 = +[ACCiAP2ShimServer stringForClientID:v10];
    int v34 = [(NSMutableDictionary *)v38 objectForKey:v41];

    if (!v10 || v34) {
      uint64_t v10 = [(ACCiAP2ShimServer *)self generateClientID];
    }
    [(ACCiAP2ShimServerClient *)v37 setClientID:v10];
    if (gLogObjects && gNumLogObjects >= 1)
    {
      __int16 v42 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
      }
      __int16 v42 = &_os_log_internal;
      id v45 = &_os_log_internal;
    }
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v69 = v37;
      _os_log_impl(&dword_223B61000, v42, OS_LOG_TYPE_DEFAULT, "[#Server] addClientWithCapabilities: add to _clients, client=%@", buf, 0xCu);
    }

    __int16 v46 = self->_clients;
    v47 = +[ACCiAP2ShimServer stringForClientID:[(ACCiAP2ShimServerClient *)v37 clientID]];
    [(NSMutableDictionary *)v46 setObject:v37 forKey:v47];

    if (gLogObjects) {
      BOOL v48 = gNumLogObjects <= 0;
    }
    else {
      BOOL v48 = 1;
    }
    int v49 = !v48;
    if (v56)
    {
      if (v49)
      {
        uint64_t v50 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
        }
        uint64_t v50 = &_os_log_internal;
        id v52 = &_os_log_internal;
      }
      id v33 = v57;
      uint64_t v32 = v58;
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v69 = v37;
        _os_log_impl(&dword_223B61000, v50, OS_LOG_TYPE_DEFAULT, "[#Server] addClientWithCapabilities: notifying of connected accessories, client=%@", buf, 0xCu);
      }

      v59[0] = MEMORY[0x263EF8330];
      v59[1] = 3221225472;
      v59[2] = __148__ACCiAP2ShimServer_addClientWithCapabilities_auditToken_currentClientID_xpcConnection_eaProtocols_notifyOfAlreadyConnectedAccessories_andBundleId___block_invoke;
      v59[3] = &unk_2646D0A90;
      v60 = v37;
      v61 = self;
      [(ACCiAP2ShimServer *)self iterateAccessoriesAsync:v59];
      v51 = v60;
    }
    else
    {
      if (v49)
      {
        v51 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
        }
        v51 = &_os_log_internal;
        id v53 = &_os_log_internal;
      }
      id v33 = v57;
      uint64_t v32 = v58;
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v69 = v37;
        _os_log_impl(&dword_223B61000, v51, OS_LOG_TYPE_DEFAULT, "[#Server] addClientWithCapabilities: skip notifying of connected accessories, client=%@", buf, 0xCu);
      }
    }
  }
  [(NSLock *)self->_clientLock unlock];

  return v10;
}

void __148__ACCiAP2ShimServer_addClientWithCapabilities_auditToken_currentClientID_xpcConnection_eaProtocols_notifyOfAlreadyConnectedAccessories_andBundleId___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
    }
    uint64_t v6 = &_os_log_internal;
    id v5 = &_os_log_internal;
  }
  else
  {
    uint64_t v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = [v3 accessoryInfoDict];
    int v13 = 138412802;
    uint64_t v14 = v7;
    __int16 v15 = 2112;
    id v16 = v3;
    __int16 v17 = 2112;
    id v18 = v8;
    _os_log_impl(&dword_223B61000, v6, OS_LOG_TYPE_DEFAULT, "[#Server] addClientWithCapabilities: notify connected: client=%@ accessory=%@ accessoryInfoDict=%@", (uint8_t *)&v13, 0x20u);
  }
  uint64_t v11 = a1 + 32;
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void **)(v11 + 8);
  long long v12 = [v3 accessoryInfoDict];
  [v10 notifyEAClient:v9 ofAccessoryEvent:"EAProtocolAccessoryConnected" accessory:v12];
}

- (id)findClientWithID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(NSLock *)self->_clientLock lock];
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
    }
    uint64_t v7 = &_os_log_internal;
    id v6 = &_os_log_internal;
  }
  else
  {
    uint64_t v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    [(ACCiAP2ShimServer *)(uint64_t)self findClientWithID:v7];
  }

  clients = self->_clients;
  uint64_t v9 = +[ACCiAP2ShimServer stringForClientID:v3];
  uint64_t v10 = [(NSMutableDictionary *)clients objectForKey:v9];

  if (gLogObjects && gNumLogObjects >= 1)
  {
    uint64_t v11 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
    }
    uint64_t v11 = &_os_log_internal;
    id v12 = &_os_log_internal;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[ACCiAP2ShimServer findClientWithID:]();
  }

  [(NSLock *)self->_clientLock unlock];
  return v10;
}

- (id)findClientWithXPCConnection:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(NSLock *)self->_clientLock lock];
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
    }
    uint64_t v7 = &_os_log_internal;
    id v6 = &_os_log_internal;
  }
  else
  {
    uint64_t v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[ACCiAP2ShimServer findClientWithXPCConnection:]();
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = [(NSMutableDictionary *)self->_clients allValues];
  id v9 = (id)[v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v13 = [v12 xpcConnection];

        if (v13 == v4)
        {
          id v9 = v12;
          goto LABEL_21;
        }
      }
      id v9 = (id)[v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_21:

  if (gLogObjects && gNumLogObjects >= 1)
  {
    uint64_t v14 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
    }
    uint64_t v14 = &_os_log_internal;
    id v15 = &_os_log_internal;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[ACCiAP2ShimServer findClientWithID:]();
  }

  [(NSLock *)self->_clientLock unlock];
  return v9;
}

- (void)removeClientWithID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v28 = *MEMORY[0x263EF8340];
  [(NSLock *)self->_clientLock lock];
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
    }
    uint64_t v7 = &_os_log_internal;
    id v6 = &_os_log_internal;
  }
  else
  {
    uint64_t v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    clients = self->_clients;
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)uint64_t v27 = v3;
    *(_WORD *)&v27[4] = 2112;
    *(void *)&v27[6] = clients;
    _os_log_impl(&dword_223B61000, v7, OS_LOG_TYPE_DEFAULT, "[#Server] removeClientWithID: clientID=%u _clients=%@", buf, 0x12u);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = [(NSMutableDictionary *)self->_clients allKeys];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
LABEL_13:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v22 != v12) {
        objc_enumerationMutation(v9);
      }
      uint64_t v14 = [(NSMutableDictionary *)self->_clients objectForKey:*(void *)(*((void *)&v21 + 1) + 8 * v13)];
      if ([v14 clientID] == v3) {
        break;
      }

      if (v11 == ++v13)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v11) {
          goto LABEL_13;
        }
        goto LABEL_19;
      }
    }
  }
  else
  {
LABEL_19:
    uint64_t v14 = 0;
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    id v15 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
    }
    id v15 = &_os_log_internal;
    id v16 = &_os_log_internal;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)uint64_t v27 = v14;
    _os_log_impl(&dword_223B61000, v15, OS_LOG_TYPE_DEFAULT, "[#Server] removeClientWithID: client=%@", buf, 0xCu);
  }

  if (!v14)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      long long v19 = (NSMutableDictionary *)*(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
      }
      long long v19 = (NSMutableDictionary *)&_os_log_internal;
      id v20 = &_os_log_internal;
    }
    if (os_log_type_enabled(&v19->super.super, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)uint64_t v27 = v3;
      _os_log_impl(&dword_223B61000, &v19->super.super, OS_LOG_TYPE_DEFAULT, "[#Server] ERROR - couldn't find client for clientID 0x%08x", buf, 8u);
    }
    goto LABEL_39;
  }
  long long v17 = self->_clients;
  long long v18 = +[ACCiAP2ShimServer stringForClientID:v3];
  [(NSMutableDictionary *)v17 removeObjectForKey:v18];

  if (![(NSMutableDictionary *)self->_clients count])
  {
    long long v19 = self->_clients;
    self->_clients = 0;
LABEL_39:
  }
  [(NSLock *)self->_clientLock unlock];
}

- (void)removeClientForXPCConnection:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(NSLock *)self->_clientLock lock];
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
    }
    uint64_t v7 = &_os_log_internal;
    id v6 = &_os_log_internal;
  }
  else
  {
    uint64_t v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    clients = self->_clients;
    *(_DWORD *)buf = 138412546;
    id v31 = v4;
    __int16 v32 = 2112;
    id v33 = clients;
    _os_log_impl(&dword_223B61000, v7, OS_LOG_TYPE_DEFAULT, "[#Server] removeClientForXPCConnection: clientConnection=%@ _clients=%@", buf, 0x16u);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v9 = [(NSMutableDictionary *)self->_clients allKeys];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v26;
LABEL_13:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v26 != v12) {
        objc_enumerationMutation(v9);
      }
      uint64_t v14 = [(NSMutableDictionary *)self->_clients objectForKey:*(void *)(*((void *)&v25 + 1) + 8 * v13)];
      id v15 = [v14 xpcConnection];

      if (v15 == v4) {
        break;
      }

      if (v11 == ++v13)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v11) {
          goto LABEL_13;
        }
        goto LABEL_19;
      }
    }
    id v16 = v14;
    if (gLogObjects && gNumLogObjects >= 1)
    {
      long long v17 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
      }
      long long v17 = &_os_log_internal;
      id v18 = &_os_log_internal;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      long long v19 = [v16 bundleId];
      *(_DWORD *)buf = 138412290;
      id v31 = v19;
      _os_log_impl(&dword_223B61000, v17, OS_LOG_TYPE_INFO, "[#Server] Found client to remove, client bundleID is %@", buf, 0xCu);
    }
    if (!v16) {
      goto LABEL_31;
    }
    uint64_t v20 = [v16 clientID];
    long long v21 = self->_clients;
    long long v22 = +[ACCiAP2ShimServer stringForClientID:v20];
    [(NSMutableDictionary *)v21 removeObjectForKey:v22];

    if ([(NSMutableDictionary *)self->_clients count]) {
      goto LABEL_41;
    }
    long long v23 = self->_clients;
    self->_clients = 0;
  }
  else
  {
LABEL_19:

LABEL_31:
    if (gLogObjects && gNumLogObjects >= 1)
    {
      long long v23 = (NSMutableDictionary *)*(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
      }
      long long v23 = (NSMutableDictionary *)&_os_log_internal;
      id v24 = &_os_log_internal;
    }
    if (os_log_type_enabled(&v23->super.super, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v4;
      _os_log_impl(&dword_223B61000, &v23->super.super, OS_LOG_TYPE_DEFAULT, "[#Server] ERROR - couldn't find client for xpc client %@", buf, 0xCu);
    }
    id v16 = 0;
  }

LABEL_41:
  [(NSLock *)self->_clientLock unlock];
}

- (void)removeAllClients
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  [(NSLock *)self->_clientLock lock];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  obj = self->_clients;
  uint64_t v3 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    BOOL v5 = 0;
    uint64_t v6 = *(void *)v15;
    do
    {
      uint64_t v7 = 0;
      id v8 = v5;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(obj);
        }
        BOOL v5 = [(NSMutableDictionary *)self->_clients objectForKey:*(void *)(*((void *)&v14 + 1) + 8 * v7)];

        int v9 = [v5 clientID];
        uint64_t v10 = dispatch_get_global_queue(0, 0);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __37__ACCiAP2ShimServer_removeAllClients__block_invoke;
        block[3] = &unk_2646D0AB8;
        block[4] = self;
        int v13 = v9;
        dispatch_async(v10, block);

        ++v7;
        id v8 = v5;
      }
      while (v4 != v7);
      uint64_t v4 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }
  [(NSLock *)self->_clientLock unlock];
}

uint64_t __37__ACCiAP2ShimServer_removeAllClients__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 88) lock];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 80);
  uint64_t v3 = +[ACCiAP2ShimServer stringForClientID:*(unsigned int *)(a1 + 40)];
  [v2 removeObjectForKey:v3];

  if (![*(id *)(*(void *)(a1 + 32) + 80) count])
  {
    uint64_t v4 = *(void *)(a1 + 32);
    BOOL v5 = *(void **)(v4 + 80);
    *(void *)(v4 + 80) = 0;
  }
  uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 88);
  return [v6 unlock];
}

- (unsigned)generateClientID
{
  uint64_t v3 = 0;
  do
  {
    do
    {
      uint64_t v4 = (void *)v3;
      uint64_t v5 = arc4random_uniform(0xFFFFFFFF);
      clients = self->_clients;
      uint64_t v7 = +[ACCiAP2ShimServer stringForClientID:v5];
      uint64_t v3 = [(NSMutableDictionary *)clients objectForKey:v7];
    }
    while (!v5);
  }
  while (v3);
  return v5;
}

- (void)_takeClientAssertionsForAccessoryConnection
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  [(NSLock *)self->_clientLock lock];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  obj = self->_clients;
  uint64_t v3 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v19;
    uint64_t v6 = &_os_log_internal;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v9 = gLogObjects;
        int v10 = gNumLogObjects;
        if (gLogObjects) {
          BOOL v11 = gNumLogObjects < 1;
        }
        else {
          BOOL v11 = 1;
        }
        if (v11)
        {
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            uint64_t v24 = v9;
            __int16 v25 = 1024;
            int v26 = v10;
            _os_log_error_impl(&dword_223B61000, v6, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          uint64_t v12 = v6;
          int v13 = v6;
        }
        else
        {
          int v13 = *(id *)gLogObjects;
        }
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          long long v14 = [(NSMutableDictionary *)self->_clients objectForKey:v8];
          long long v15 = [v14 bundleId];
          *(_DWORD *)buf = 138412290;
          uint64_t v24 = (uint64_t)v15;
          _os_log_impl(&dword_223B61000, v13, OS_LOG_TYPE_INFO, "[#Server] client %@\n", buf, 0xCu);
        }
        long long v16 = [(NSMutableDictionary *)self->_clients objectForKey:v8];
        [v16 takeProcessAssertion:@"external-accessory.connect"];
      }
      uint64_t v4 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v4);
  }

  [(NSLock *)self->_clientLock unlock];
}

- (void)notifyEAClient:(id)a3 ofAccessoryEvent:(const char *)a4 accessory:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  int v9 = [v7 canSendConnectionEventForAccessory:v8];
  if (gLogObjects) {
    BOOL v10 = gNumLogObjects < 1;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
    }
    uint64_t v12 = &_os_log_internal;
    id v11 = &_os_log_internal;
  }
  else
  {
    uint64_t v12 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v13 = [v7 bundleId];
    int v18 = 138413058;
    long long v19 = v13;
    __int16 v20 = 2080;
    long long v21 = a4;
    __int16 v22 = 1024;
    int v23 = v9;
    __int16 v24 = 2112;
    id v25 = v8;
    _os_log_impl(&dword_223B61000, v12, OS_LOG_TYPE_INFO, "[#Server] clientToNotify bundle = %@, request = %s, canSendConnectionEvent = %d, accessory=%@", (uint8_t *)&v18, 0x26u);
  }
  if (v9)
  {
    long long v14 = [MEMORY[0x263F08AC0] dataWithPropertyList:v8 format:200 options:0 error:0];
    xpc_object_t v15 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v15, "requestType", a4);
    id v16 = v14;
    xpc_dictionary_set_data(v15, "EAProtocolAccessoryPlistData", (const void *)[v16 bytes], objc_msgSend(v16, "length"));
    long long v17 = [v7 xpcConnection];
    xpc_connection_send_message(v17, v15);
  }
}

- (void)sendToClient:(id)a3 notification:(const char *)a4 withPayload:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  int v9 = v8;
  if (gLogObjects) {
    BOOL v10 = gNumLogObjects <= 0;
  }
  else {
    BOOL v10 = 1;
  }
  int v11 = !v10;
  if (v7 && a4 && v8)
  {
    if (v11)
    {
      uint64_t v12 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
      }
      uint64_t v12 = &_os_log_internal;
      id v15 = &_os_log_internal;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [v7 bundleId];
      int v20 = 138413058;
      long long v21 = v16;
      __int16 v22 = 2080;
      int v23 = "kXPCACCNotificationKey";
      __int16 v24 = 2080;
      id v25 = a4;
      __int16 v26 = 2112;
      uint64_t v27 = v9;
      _os_log_impl(&dword_223B61000, v12, OS_LOG_TYPE_DEFAULT, "[#Server] clientToNotify bundle = %@, request = %s, notificationName = %s, notificationPayload=%@", (uint8_t *)&v20, 0x2Au);
    }
    long long v17 = [MEMORY[0x263F08AC0] dataWithPropertyList:v9 format:200 options:0 error:0];
    xpc_object_t v18 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v18, "requestType", "kXPCACCNotificationKey");
    xpc_dictionary_set_string(v18, "kXPCACCNotificationNameKey", a4);
    int v13 = v17;
    xpc_dictionary_set_data(v18, "kXPCACCNotificationPlistData", (const void *)[v13 bytes], [v13 length]);
    long long v19 = [v7 xpcConnection];
    xpc_connection_send_message(v19, v18);
  }
  else
  {
    if (v11)
    {
      int v13 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
      }
      int v13 = &_os_log_internal;
      id v14 = &_os_log_internal;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v20 = 136315906;
      long long v21 = "-[ACCiAP2ShimServer sendToClient:notification:withPayload:]";
      __int16 v22 = 2112;
      int v23 = (const char *)v7;
      __int16 v24 = 2080;
      id v25 = a4;
      __int16 v26 = 2112;
      uint64_t v27 = v9;
      _os_log_error_impl(&dword_223B61000, v13, OS_LOG_TYPE_ERROR, "[#Server] %s: Received nil param. clientToNotify %@ notificationName %s notificationPayload %@", (uint8_t *)&v20, 0x2Au);
    }
  }
}

- (void)notifyEAClientsOfAccessoryEvent:(const char *)a3 accessory:(id)a4
{
  id v6 = a4;
  id v7 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__ACCiAP2ShimServer_notifyEAClientsOfAccessoryEvent_accessory___block_invoke;
  block[3] = &unk_2646D0AE0;
  id v10 = v6;
  int v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

uint64_t __63__ACCiAP2ShimServer_notifyEAClientsOfAccessoryEvent_accessory___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  [*(id *)(*(void *)(a1 + 32) + 88) lock];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 80);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "objectForKey:", *(void *)(*((void *)&v9 + 1) + 8 * v6), (void)v9);
        [*(id *)(a1 + 32) notifyEAClient:v7 ofAccessoryEvent:*(void *)(a1 + 48) accessory:*(void *)(a1 + 40)];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  return [*(id *)(*(void *)(a1 + 32) + 88) unlock];
}

- (void)sendToInterestedClientsACCBLENotification:(id)a3 withPayload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    long long v9 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __75__ACCiAP2ShimServer_sendToInterestedClientsACCBLENotification_withPayload___block_invoke;
    block[3] = &unk_2646D0B08;
    block[4] = self;
    id v14 = v6;
    id v15 = v8;
    dispatch_async(v9, block);
  }
  else
  {
    if (gLogObjects) {
      BOOL v10 = gNumLogObjects < 1;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
      }
      long long v12 = &_os_log_internal;
      id v11 = &_os_log_internal;
    }
    else
    {
      long long v12 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ACCiAP2ShimServer sendToInterestedClientsACCBLENotification:withPayload:]();
    }
  }
}

uint64_t __75__ACCiAP2ShimServer_sendToInterestedClientsACCBLENotification_withPayload___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  [*(id *)(*(void *)(a1 + 32) + 88) lock];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 80);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "objectForKey:", *(void *)(*((void *)&v9 + 1) + 8 * v6), (void)v9);
        if ([v7 interestedInBLENotifications]) {
          objc_msgSend(*(id *)(a1 + 32), "sendToClient:notification:withPayload:", v7, objc_msgSend(*(id *)(a1 + 40), "cStringUsingEncoding:", 4), *(void *)(a1 + 48));
        }

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  return [*(id *)(*(void *)(a1 + 32) + 88) unlock];
}

- (void)notifyEAClientsOfAccessoryConnection:(id)a3
{
}

- (void)notifyEAClientsOfAccessoryDisconnection:(id)a3
{
}

- (void)notifyEAClientsOfAccessoryReconnection:(id)a3
{
}

+ (void)notifyInterestedClientsOfACCBLEAccessoryEvent:(id)a3 withPayload:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5 && v6)
  {
    id v8 = +[ACCiAP2ShimServer sharedInstance];
    [v8 sendToInterestedClientsACCBLENotification:v5 withPayload:v7];
  }
  else
  {
    if (gLogObjects) {
      BOOL v9 = gNumLogObjects < 1;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
      }
      id v8 = &_os_log_internal;
      id v10 = &_os_log_internal;
    }
    else
    {
      id v8 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[ACCiAP2ShimServer notifyInterestedClientsOfACCBLEAccessoryEvent:withPayload:]();
    }
  }
}

- (void)_resetServerState
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  int iap2AvailableNotifyToken = self->_iap2AvailableNotifyToken;
  if (iap2AvailableNotifyToken == -1)
  {
    if (gLogObjects) {
      BOOL v7 = gNumLogObjects < 1;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
      }
      id v10 = &_os_log_internal;
      id v8 = &_os_log_internal;
    }
    else
    {
      id v10 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      long long v11 = "[#Server] IAPServer: resetServerState: invalid notifyToken!";
      long long v12 = v10;
      os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
LABEL_51:
      _os_log_impl(&dword_223B61000, v12, v13, v11, buf, 2u);
    }
  }
  else
  {
    uint64_t state64 = 0;
    notify_get_state(iap2AvailableNotifyToken, &state64);
    if (gLogObjects) {
      BOOL v4 = gNumLogObjects <= 0;
    }
    else {
      BOOL v4 = 1;
    }
    int v5 = !v4;
    if (state64 == 1)
    {
      if (v5)
      {
        id v6 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
        }
        id v6 = &_os_log_internal;
        id v14 = &_os_log_internal;
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v21) = 0;
        _os_log_impl(&dword_223B61000, v6, OS_LOG_TYPE_INFO, "[#Server] IAPServer: resetServerState: set kIAP2AvailableNotification state: %d", buf, 8u);
      }

      notify_set_state(self->_iap2AvailableNotifyToken, 0);
      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v15 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
        }
        id v15 = &_os_log_internal;
        id v17 = &_os_log_internal;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_223B61000, v15, OS_LOG_TYPE_INFO, "[#Server] IAPServer: resetServerState: post kIAP2AvailableNotification notification: ", buf, 2u);
      }

      notify_post(MEMORY[0x263F49DE8]);
    }
    else
    {
      if (v5)
      {
        BOOL v9 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
        }
        BOOL v9 = &_os_log_internal;
        id v16 = &_os_log_internal;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v21 = state64;
        _os_log_impl(&dword_223B61000, v9, OS_LOG_TYPE_INFO, "[#Server] IAPServer: resetServerState: kIAP2AvailableNotification state %llu, skip post", buf, 0xCu);
      }
    }
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v10 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
      }
      id v10 = &_os_log_internal;
      id v18 = &_os_log_internal;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      long long v11 = "[#Server] IAPServer: resetServerState: cancel notify token";
      long long v12 = v10;
      os_log_type_t v13 = OS_LOG_TYPE_INFO;
      goto LABEL_51;
    }
  }
}

+ (void)resetServerState
{
  id v2 = +[ACCiAP2ShimServer sharedInstance];
}

+ (void)postNotifydNotificationType:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
    }
    id v6 = &_os_log_internal;
    id v5 = &_os_log_internal;
  }
  else
  {
    id v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    id v9 = v3;
    _os_log_impl(&dword_223B61000, v6, OS_LOG_TYPE_INFO, "[#Server] post darwin notification %@", (uint8_t *)&v8, 0xCu);
  }

  id v7 = v3;
  notify_post((const char *)[v7 cStringUsingEncoding:4]);
}

+ (void)postNSDistributeNotificationType:(id)a3 notifyDict:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 1;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
    }
    id v9 = &_os_log_internal;
    id v8 = &_os_log_internal;
  }
  else
  {
    id v9 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412546;
    id v13 = v5;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_223B61000, v9, OS_LOG_TYPE_INFO, "[#Server] post distributed notification %@, userInfo %@", (uint8_t *)&v12, 0x16u);
  }

  uint64_t v10 = [MEMORY[0x263F087C8] defaultCenter];
  long long v11 = v10;
  if (v6) {
    [v10 postNotificationName:v5 object:0 userInfo:v6];
  }
  else {
    [v10 postNotificationName:v5 object:0];
  }
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_4);
  }
  id v2 = (void *)sharedInstance___sharedIAP2Server;
  return v2;
}

uint64_t __35__ACCiAP2ShimServer_sharedInstance__block_invoke()
{
  sharedInstance___sharedIAP2Server = objc_alloc_init(ACCiAP2ShimServer);
  return MEMORY[0x270F9A758]();
}

+ (id)stringForClientID:(unsigned int)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%d", *(void *)&a3);
}

+ (void)markClientAsInterestedInBleNotifications:(id)a3
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects <= 0;
  }
  else {
    BOOL v4 = 1;
  }
  int v5 = !v4;
  xpc_object_t object2 = v3;
  if (v3)
  {
    if (v5)
    {
      id v6 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
      }
      id v6 = &_os_log_internal;
      id v8 = &_os_log_internal;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)uint64_t v50 = "+[ACCiAP2ShimServer markClientAsInterestedInBleNotifications:]";
      _os_log_impl(&dword_223B61000, v6, OS_LOG_TYPE_DEFAULT, "[#Server] %s: iterating clients to find matching xpc_connection object", buf, 0xCu);
    }

    BOOL v7 = +[ACCiAP2ShimServer sharedInstance];
    id v9 = [v7 clientLock];
    [v9 lock];

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id obj = [v7 clients];
    uint64_t v10 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
    if (v10)
    {
      uint64_t v12 = v10;
      uint64_t v13 = *(void *)v45;
      __int16 v14 = &_os_log_internal;
      *(void *)&long long v11 = 134218240;
      long long v41 = v11;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v45 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v44 + 1) + 8 * i);
          id v17 = [v7 clients];
          id v18 = [v17 objectForKey:v16];

          long long v19 = [v18 xpcConnection];
          LODWORD(v17) = xpc_equal(v19, object2);

          if (v17)
          {
            uint64_t v20 = gLogObjects;
            int v21 = gNumLogObjects;
            if (gLogObjects && gNumLogObjects >= 1)
            {
              uint64_t v22 = *(id *)gLogObjects;
            }
            else
            {
              if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v41;
                *(void *)uint64_t v50 = v20;
                *(_WORD *)&v50[8] = 1024;
                *(_DWORD *)&v50[10] = v21;
                _os_log_error_impl(&dword_223B61000, v14, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              int v23 = v14;
              uint64_t v22 = v14;
            }
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              int v24 = [v18 clientID];
              id v25 = [v18 bundleId];
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)uint64_t v50 = v24;
              *(_WORD *)&v50[4] = 2112;
              *(void *)&v50[6] = v25;
              _os_log_impl(&dword_223B61000, v22, OS_LOG_TYPE_DEFAULT, "[#Server] xpc_connection object interested in BLE notifications matches the one for clientID = %u, bundleID = %@", buf, 0x12u);
            }
            uint64_t v26 = [v18 hasEntitlementForAllAccessories];
            uint64_t v27 = v26;
            uint64_t v28 = gLogObjects;
            int v29 = gNumLogObjects;
            if (gLogObjects) {
              BOOL v30 = gNumLogObjects <= 0;
            }
            else {
              BOOL v30 = 1;
            }
            int v31 = !v30;
            if (v26)
            {
              if (v31)
              {
                __int16 v32 = *(id *)gLogObjects;
              }
              else
              {
                if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v41;
                  *(void *)uint64_t v50 = v28;
                  *(_WORD *)&v50[8] = 1024;
                  *(_DWORD *)&v50[10] = v29;
                  _os_log_error_impl(&dword_223B61000, v14, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                }
                id v33 = v14;
                __int16 v32 = v14;
              }
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              {
                int v34 = [v18 clientID];
                timeval v35 = [v18 bundleId];
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)uint64_t v50 = v34;
                *(_WORD *)&v50[4] = 2112;
                *(void *)&v50[6] = v35;
                _os_log_impl(&dword_223B61000, v32, OS_LOG_TYPE_DEFAULT, "[#Server] client has required entitlement. marking as interested for BLE notifications. clientID = %u, bundleID = %@", buf, 0x12u);
              }
            }
            else
            {
              if (v31)
              {
                __int16 v32 = *(id *)gLogObjects;
              }
              else
              {
                if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v41;
                  *(void *)uint64_t v50 = v28;
                  *(_WORD *)&v50[8] = 1024;
                  *(_DWORD *)&v50[10] = v29;
                  _os_log_error_impl(&dword_223B61000, v14, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                }
                long long v36 = v14;
                __int16 v32 = v14;
              }
              if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              {
                int v37 = [v18 clientID];
                __int16 v38 = [v18 bundleId];
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)uint64_t v50 = v37;
                *(_WORD *)&v50[4] = 2112;
                *(void *)&v50[6] = v38;
                _os_log_error_impl(&dword_223B61000, v32, OS_LOG_TYPE_ERROR, "[#Server] interested client does not have entitlement! not marking as interested for BLE notifications. clientID = %u, bundleID = %@", buf, 0x12u);
              }
            }

            [v18 setInterestedInBLENotifications:v27];
          }
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
      }
      while (v12);
    }

    id v39 = [v7 clientLock];
    [v39 unlock];
  }
  else
  {
    if (v5)
    {
      BOOL v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
      }
      BOOL v7 = &_os_log_internal;
      id v40 = &_os_log_internal;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[ACCiAP2ShimServer markClientAsInterestedInBleNotifications:](v7);
    }
  }
}

- (NSMutableDictionary)delegateList
{
  return self->_delegateList;
}

- (void)setDelegateList:(id)a3
{
}

- (NSMutableDictionary)accessoryViaKeyUIDList
{
  return self->_accessoryViaKeyUIDList;
}

- (void)setAccessoryViaKeyUIDList:(id)a3
{
}

- (NSMutableDictionary)accessoryViaConnectionIDList
{
  return self->_accessoryViaConnectionIDList;
}

- (void)setAccessoryViaConnectionIDList:(id)a3
{
}

- (OS_dispatch_queue)listQueue
{
  return self->_listQueue;
}

- (OS_xpc_object)listener
{
  return self->_listener;
}

- (BOOL)isShuttingDown
{
  return self->_isShuttingDown;
}

- (OS_dispatch_queue)iap2dhighPriorityRootQueue
{
  return self->_iap2dhighPriorityRootQueue;
}

- (OS_dispatch_queue)internalListenerQueue
{
  return self->_internalListenerQueue;
}

- (__serverFlags)serverFlags
{
  return self->_serverFlags;
}

- (NSMutableDictionary)clients
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (NSLock)clientLock
{
  return (NSLock *)objc_getProperty(self, a2, 88, 1);
}

- (int)iap2AvailableNotifyToken
{
  return self->_iap2AvailableNotifyToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientLock, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_internalListenerQueue, 0);
  objc_storeStrong((id *)&self->_iap2dhighPriorityRootQueue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_listQueue, 0);
  objc_storeStrong((id *)&self->_accessoryViaConnectionIDList, 0);
  objc_storeStrong((id *)&self->_accessoryViaKeyUIDList, 0);
  objc_storeStrong((id *)&self->_delegateList, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_9();
  _os_log_fault_impl(&dword_223B61000, v0, OS_LOG_TYPE_FAULT, "[#Server] IAPServer: init: failed to register notify token!", v1, 2u);
}

- (void)_iterateDelegates:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_223B61000, a2, a3, "[#Server] ACCiAP2ShimServer iterateDelegates, _delegateList=%@", a5, a6, a7, a8, 2u);
}

- (void)_addAccessory:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_223B61000, v0, v1, "[#Server] ACCiAP2ShimServer addAccessory %@, after add _accessoryViaKeyUIDList=%@");
}

- (void)_removeAccessory:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_223B61000, v0, v1, "[#Server] ACCiAP2ShimServer removeAccessory %@, after remove _accessoryViaKeyUIDList=%@");
}

- (void)_iterateAccessories:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_223B61000, a2, a3, "[#Server] ACCiAP2ShimServer iterateAccessories, _accessoryViaKeyUIDList=%@", a5, a6, a7, a8, 2u);
}

void __50__ACCiAP2ShimServer_processXPCMessage_connection___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_11(&dword_223B61000, v0, v1, "[#Server] processXPCMessage: %@ connection: %@, requestType=%s, try delegate %@");
}

void __50__ACCiAP2ShimServer_processXPCMessage_connection___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_11(&dword_223B61000, v0, v1, "[#Server] processXPCMessage: %@ connection: %@, requestType=%s, delegate does not response to selector , delegate=%@");
}

- (void)findClientWithID:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_223B61000, v0, v1, "[#Server] findClientWithID: client=%@", v2, v3, v4, v5, v6);
}

- (void)findClientWithID:(os_log_t)log .cold.3(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 80);
  v4[0] = 67109378;
  v4[1] = a2;
  __int16 v5 = 2112;
  uint64_t v6 = v3;
  _os_log_debug_impl(&dword_223B61000, log, OS_LOG_TYPE_DEBUG, "[#Server] findClientWithID: clientID=%u _clients=%@", (uint8_t *)v4, 0x12u);
}

- (void)findClientWithXPCConnection:.cold.3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_223B61000, v0, v1, "[#Server] findClientWithID: xpcConnection=%@ _clients=%@");
}

- (void)sendToInterestedClientsACCBLENotification:withPayload:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_10(&dword_223B61000, v0, v1, "[#Server] %s: Received nil param. notificationName %@ notificationPayload %@", v2);
}

+ (void)notifyInterestedClientsOfACCBLEAccessoryEvent:withPayload:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_10(&dword_223B61000, v0, v1, "[#Server] %s: Received nil param. notificationName %@ notificationPayload %@", v2);
}

+ (void)markClientAsInterestedInBleNotifications:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v1 = 136315394;
  int v2 = "+[ACCiAP2ShimServer markClientAsInterestedInBleNotifications:]";
  __int16 v3 = 2112;
  uint64_t v4 = 0;
  _os_log_error_impl(&dword_223B61000, log, OS_LOG_TYPE_ERROR, "[#Server] %s: Received nil param. xpc_connection %@", (uint8_t *)&v1, 0x16u);
}

@end