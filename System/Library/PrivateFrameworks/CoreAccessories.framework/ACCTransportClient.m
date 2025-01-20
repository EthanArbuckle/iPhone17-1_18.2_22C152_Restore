@interface ACCTransportClient
+ (id)sharedClient;
- (ACCTransportClient)init;
- (ACCTransportClientDelegate)delegate;
- (BOOL)destroyConnectionWithUUID:(id)a3;
- (BOOL)destroyEndpointWithUUID:(id)a3;
- (BOOL)isConnectionAuthenticated:(id)a3;
- (BOOL)processIncomingData:(id)a3 forEndpointWithUUID:(id)a4;
- (BOOL)processOutgoingSecureTunnelData:(id)a3 forEndpoint:(id)a4 forType:(unsigned __int8)a5;
- (BOOL)publishConnectionWithUUID:(id)a3;
- (BOOL)removeProperty:(id)a3 forConnectionWithUUID:(id)a4;
- (BOOL)removeProperty:(id)a3 forEndpointWithUUID:(id)a4;
- (BOOL)setAccessoryInfo:(id)a3 forEndpointWithUUID:(id)a4;
- (BOOL)setProperties:(id)a3 forConnectionWithUUID:(id)a4;
- (BOOL)setProperties:(id)a3 forEndpointWithUUID:(id)a4;
- (BOOL)setProperty:(id)a3 value:(id)a4 forConnectionWithUUID:(id)a5;
- (BOOL)setProperty:(id)a3 value:(id)a4 forEndpointWithUUID:(id)a5;
- (NSMutableDictionary)connectionPropertyChangeHandlers;
- (NSMutableDictionary)endpointDataOutHandlers;
- (NSMutableDictionary)endpointPropertyChangeHandlers;
- (NSMutableDictionary)endpointSecureTunnelDataHandlers;
- (NSXPCConnection)serverConnection;
- (OS_dispatch_queue)endpointEventHandlerQueue;
- (id)_init;
- (id)accessoryInfoForConnectionWithUUID:(id)a3;
- (id)accessoryInfoForEndpointWithUUID:(id)a3;
- (id)connectionUUIDForEndpointWithUUID:(id)a3;
- (id)createConnectionWithType:(int)a3 andIdentifier:(id)a4;
- (id)createEndpointWithTransportType:(int)a3 andProtocol:(int)a4 andIdentifier:(id)a5 andDataOutHandler:(id)a6 forConnectionWithUUID:(id)a7 publishConnection:(BOOL)a8;
- (id)endpointUUIDsForConnectionWithUUID:(id)a3;
- (id)identifierForConnectionWithUUID:(id)a3;
- (id)identifierForEndpointWithUUID:(id)a3;
- (id)propertiesForConnectionWithUUID:(id)a3;
- (id)propertiesForEndpointWithUUID:(id)a3;
- (int)authStatusForConnectionWithUUID:(id)a3 authType:(int)a4;
- (void)_init;
- (void)authStateDidChange:(int)a3 forConnectionWithUUID:(id)a4 previousAuthState:(int)a5 authType:(int)a6 connectionIsAuthenticated:(BOOL)a7 connectionWasAuthenticated:(BOOL)a8;
- (void)connectToServer;
- (void)dealloc;
- (void)launchServer;
- (void)propertiesDidChange:(id)a3 forConnectionWithUUID:(id)a4 previousProperties:(id)a5;
- (void)propertiesDidChange:(id)a3 forEndpointWithUUID:(id)a4 previousProperties:(id)a5 connectionUUID:(id)a6;
- (void)receivedSecureTunnelData:(id)a3 forEndpoint:(id)a4;
- (void)sendOutgoingData:(id)a3 forEndpointWithUUID:(id)a4 connectionUUID:(id)a5 withReply:(id)a6;
- (void)setConnectionAuthenticated:(id)a3 state:(BOOL)a4;
- (void)setConnectionPropertyChangeHandlers:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEndpointDataOutHandlers:(id)a3;
- (void)setEndpointEventHandlerQueue:(id)a3;
- (void)setEndpointPropertyChangeHandlers:(id)a3;
- (void)setEndpointSecureTunnelDataHandlers:(id)a3;
- (void)setHandler:(id)a3 forConnectionProperty:(id)a4;
- (void)setHandler:(id)a3 forEndpointProperty:(id)a4;
- (void)setSecureTunnelDataReceiveHandler:(id)a3 forEndpoint:(id)a4;
- (void)setServerConnection:(id)a3;
@end

@implementation ACCTransportClient

- (ACCTransportClient)init
{
  v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3B8];
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = NSStringFromSelector(sel_sharedClient);
  v9 = NSStringFromSelector(a2);
  [v4 raise:v5, @"Use +[%@ %@] instead of -%@.", v7, v8, v9 format];

  return 0;
}

- (id)_init
{
  init_logging();
  v23.receiver = self;
  v23.super_class = (Class)ACCTransportClient;
  v3 = [(ACCTransportClient *)&v23 init];
  if (v3)
  {
    if (gLogSignpostObjects) {
      BOOL v4 = gNumLogSignpostObjects < 4;
    }
    else {
      BOOL v4 = 1;
    }
    if (v4)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportClient _init]();
      }
      v6 = MEMORY[0x1E4F14500];
      id v5 = MEMORY[0x1E4F14500];
    }
    else
    {
      v6 = *(id *)(gLogSignpostObjects + 24);
    }
    if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
    {
      v7 = *(id *)(gLogSignpostObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportClient _init]();
      }
      v7 = MEMORY[0x1E4F14500];
      id v8 = MEMORY[0x1E4F14500];
    }
    os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v7, v3);

    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_WORD *)v22 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B3C21000, v6, OS_SIGNPOST_EVENT, v9, "TransportClient", "Create shared ACCTransportClient", v22, 2u);
    }

    objc_storeWeak((id *)&v3->_delegate, 0);
    serverConnection = v3->_serverConnection;
    v3->_serverConnection = 0;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    endpointDataOutHandlers = v3->_endpointDataOutHandlers;
    v3->_endpointDataOutHandlers = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    connectionPropertyChangeHandlers = v3->_connectionPropertyChangeHandlers;
    v3->_connectionPropertyChangeHandlers = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    endpointPropertyChangeHandlers = v3->_endpointPropertyChangeHandlers;
    v3->_endpointPropertyChangeHandlers = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    endpointSecureTunnelDataHandlers = v3->_endpointSecureTunnelDataHandlers;
    v3->_endpointSecureTunnelDataHandlers = v17;

    dispatch_queue_t v19 = dispatch_queue_create("TransportClientEndpointEventHandlerQ", 0);
    endpointEventHandlerQueue = v3->_endpointEventHandlerQueue;
    v3->_endpointEventHandlerQueue = (OS_dispatch_queue *)v19;

    [(ACCTransportClient *)v3 connectToServer];
  }
  return v3;
}

- (void)dealloc
{
  if (gLogSignpostObjects) {
    BOOL v3 = gNumLogSignpostObjects < 4;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportClient _init]();
    }
    id v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v5 = *(id *)(gLogSignpostObjects + 24);
  }
  if (gLogSignpostObjects) {
    BOOL v6 = gNumLogSignpostObjects < 4;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportClient _init]();
    }
    id v8 = MEMORY[0x1E4F14500];
    id v7 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v8 = *(id *)(gLogSignpostObjects + 24);
  }
  os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, self);

  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B3C21000, v5, OS_SIGNPOST_EVENT, v9, "TransportClient", "Destroy shared ACCTransportClient", buf, 2u);
  }

  v10 = [(ACCTransportClient *)self serverConnection];
  [v10 invalidate];

  v11.receiver = self;
  v11.super_class = (Class)ACCTransportClient;
  [(ACCTransportClient *)&v11 dealloc];
}

- (void)connectToServer
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(ACCTransportClient *)v2 serverConnection];

  if (!v3)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v4 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      id v4 = MEMORY[0x1E4F14500];
      id v5 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B3C21000, v4, OS_LOG_TYPE_DEFAULT, "Connecting to XPC server...", buf, 2u);
    }

    if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
    {
      BOOL v6 = *(id *)(gLogSignpostObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportClient _init]();
      }
      BOOL v6 = MEMORY[0x1E4F14500];
      id v7 = MEMORY[0x1E4F14500];
    }
    if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
    {
      id v8 = *(id *)(gLogSignpostObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportClient _init]();
      }
      id v8 = MEMORY[0x1E4F14500];
      id v9 = MEMORY[0x1E4F14500];
    }
    os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v8, v2);

    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B3C21000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v10, "TransportClient SERVER", "Connect to server", buf, 2u);
    }

    objc_super v11 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.accessories.transport-server" options:4096];
    [(ACCTransportClient *)v2 setServerConnection:v11];

    v12 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0C7B200];
    v13 = [(ACCTransportClient *)v2 serverConnection];
    [v13 setRemoteObjectInterface:v12];

    v14 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0C79350];
    v15 = [(ACCTransportClient *)v2 serverConnection];
    [v15 setExportedInterface:v14];

    v16 = [(ACCTransportClient *)v2 serverConnection];
    [v16 setExportedObject:v2];

    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, v2);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __37__ACCTransportClient_connectToServer__block_invoke;
    v22[3] = &unk_1E6073488;
    objc_copyWeak(&v23, (id *)buf);
    v17 = [(ACCTransportClient *)v2 serverConnection];
    [v17 setInvalidationHandler:v22];

    uint64_t v20 = MEMORY[0x1E4F143A8];
    objc_copyWeak(&v21, (id *)buf);
    v18 = [(ACCTransportClient *)v2 serverConnection];
    [v18 setInterruptionHandler:&v20];

    dispatch_queue_t v19 = [(ACCTransportClient *)v2 serverConnection];
    [v19 resume];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }
  objc_sync_exit(v2);
}

void __37__ACCTransportClient_connectToServer__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v3 = [WeakRetained serverConnection];
  [v3 setInvalidationHandler:0];

  id v4 = objc_loadWeakRetained(v1);
  [v4 setServerConnection:0];

  if (gLogObjects && gNumLogObjects >= 1)
  {
    id v5 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3C21000, v5, OS_LOG_TYPE_DEFAULT, "XPC connection invalidated!", buf, 2u);
  }

  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    id v7 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportClient _init]();
    }
    id v7 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    id v9 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportClient _init]();
    }
    id v9 = MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
  }
  id v11 = objc_loadWeakRetained(v1);
  os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v9, v11);

  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)v27 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B3C21000, v7, OS_SIGNPOST_INTERVAL_END, v12, "TransportClient SERVER", "Server connection invalidated!", v27, 2u);
  }

  id v13 = objc_loadWeakRetained(v1);
  uint64_t v14 = [v13 delegate];
  if (!v14) {
    goto LABEL_27;
  }
  v15 = (void *)v14;
  id v16 = objc_loadWeakRetained(v1);
  v17 = [v16 delegate];
  char v18 = objc_opt_respondsToSelector();

  if (v18)
  {
    id v13 = objc_loadWeakRetained(v1);
    dispatch_queue_t v19 = [v13 delegate];
    id v20 = objc_loadWeakRetained(v1);
    [v19 transportClientServerDisconnected:v20];

LABEL_27:
  }
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v22 = objc_loadWeakRetained(v1);
  [v22 setEndpointDataOutHandlers:v21];

  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v24 = objc_loadWeakRetained(v1);
  [v24 setConnectionPropertyChangeHandlers:v23];

  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v26 = objc_loadWeakRetained(v1);
  [v26 setEndpointPropertyChangeHandlers:v25];
}

void __37__ACCTransportClient_connectToServer__block_invoke_119(uint64_t a1)
{
  if (gLogSignpostObjects) {
    BOOL v2 = gNumLogSignpostObjects < 4;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportClient _init]();
    }
    id v4 = MEMORY[0x1E4F14500];
    id v3 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v4 = *(id *)(gLogSignpostObjects + 24);
  }
  if (gLogSignpostObjects) {
    BOOL v5 = gNumLogSignpostObjects < 4;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportClient _init]();
    }
    id v7 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v7 = *(id *)(gLogSignpostObjects + 24);
  }
  id v8 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v8);
  os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v7, WeakRetained);

  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B3C21000, v4, OS_SIGNPOST_EVENT, v10, "TransportClient SERVER", "Server connection interrupted!", buf, 2u);
  }

  id v11 = objc_loadWeakRetained(v8);
  os_signpost_id_t v12 = [v11 serverConnection];
  [v12 invalidate];

  id v13 = objc_loadWeakRetained(v8);
  [v13 setServerConnection:0];

  if (gLogObjects && gNumLogObjects >= 1)
  {
    uint64_t v14 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    uint64_t v14 = MEMORY[0x1E4F14500];
    id v15 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v16 = 0;
    _os_log_impl(&dword_1B3C21000, v14, OS_LOG_TYPE_DEFAULT, "XPC connection interrupted!", v16, 2u);
  }
}

- (void)sendOutgoingData:(id)a3 forEndpointWithUUID:(id)a4 connectionUUID:(id)a5 withReply:(id)a6
{
  id v15 = a3;
  id v10 = a4;
  id v11 = a5;
  os_signpost_id_t v12 = (void (**)(id, BOOL))a6;
  id v13 = [(ACCTransportClient *)self endpointDataOutHandlers];
  uint64_t v14 = [v13 objectForKey:v10];

  if (v14) {
    ((void (**)(void, id, id, id))v14)[2](v14, v11, v10, v15);
  }
  if (v12) {
    v12[2](v12, v14 != 0);
  }
}

- (void)authStateDidChange:(int)a3 forConnectionWithUUID:(id)a4 previousAuthState:(int)a5 authType:(int)a6 connectionIsAuthenticated:(BOOL)a7 connectionWasAuthenticated:(BOOL)a8
{
  BOOL v8 = a7;
  id v15 = a4;
  uint64_t v10 = [(ACCTransportClient *)self delegate];
  if (v10)
  {
    id v11 = (void *)v10;
    os_signpost_id_t v12 = [(ACCTransportClient *)self delegate];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      uint64_t v14 = [(ACCTransportClient *)self delegate];
      [v14 transportClient:self authStatusDidChange:v8 forConnectionWithUUID:v15];
    }
  }
}

- (void)propertiesDidChange:(id)a3 forConnectionWithUUID:(id)a4 previousProperties:(id)a5
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v47 = a4;
  id v9 = a5;
  if (gLogObjects) {
    BOOL v10 = gNumLogObjects < 1;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    os_signpost_id_t v12 = MEMORY[0x1E4F14500];
    id v11 = MEMORY[0x1E4F14500];
  }
  else
  {
    os_signpost_id_t v12 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v57 = (uint64_t)v47;
    _os_log_impl(&dword_1B3C21000, v12, OS_LOG_TYPE_DEFAULT, "Connection properties did change! (connectionUUID: %@)", buf, 0xCu);
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    char v13 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    char v13 = MEMORY[0x1E4F14500];
    id v14 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v57 = (uint64_t)v8;
    __int16 v58 = 2112;
    uint64_t v59 = (uint64_t)v9;
    _os_log_impl(&dword_1B3C21000, v13, OS_LOG_TYPE_INFO, "properties: %@, previousProperties: %@", buf, 0x16u);
  }
  id v50 = v9;

  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    id v15 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportClient _init]();
    }
    id v15 = MEMORY[0x1E4F14500];
    id v16 = MEMORY[0x1E4F14500];
  }
  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    v17 = *(id *)(gLogSignpostObjects + 24);
    char v18 = v9;
  }
  else
  {
    char v18 = v9;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportClient _init]();
    }
    v17 = MEMORY[0x1E4F14500];
    id v19 = MEMORY[0x1E4F14500];
  }
  os_signpost_id_t v20 = os_signpost_id_make_with_pointer(v17, self);

  id v49 = v8;
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    uint64_t v21 = [v8 count];
    id v22 = [v8 allKeys];
    uint64_t v23 = [v18 count];
    id v24 = [v18 allKeys];
    *(_DWORD *)buf = 138413314;
    uint64_t v57 = (uint64_t)v47;
    __int16 v58 = 2048;
    uint64_t v59 = v21;
    __int16 v60 = 2112;
    v61 = v22;
    __int16 v62 = 2048;
    uint64_t v63 = v23;
    __int16 v64 = 2112;
    v65 = v24;
    _os_signpost_emit_with_name_impl(&dword_1B3C21000, v15, OS_SIGNPOST_EVENT, v20, "Endpoint PROPERTY", "Connection PropertiesDidChange! %@, %lu properties: %@, previous %lu properties: %@", buf, 0x34u);

    id v8 = v49;
  }

  uint64_t v25 = [(ACCTransportClient *)self delegate];
  if (v25)
  {
    id v26 = (void *)v25;
    v27 = [(ACCTransportClient *)self delegate];
    char v28 = objc_opt_respondsToSelector();

    if (v28)
    {
      v29 = [(ACCTransportClient *)self delegate];
      [v29 transportClient:self propertiesDidChange:v8 forConnectionWithUUID:v47 previousProperties:v18];
    }
  }
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  v48 = self;
  v30 = [(ACCTransportClient *)self connectionPropertyChangeHandlers];
  v31 = [v30 allKeys];

  uint64_t v32 = [v31 countByEnumeratingWithState:&v51 objects:v55 count:16];
  if (v32)
  {
    uint64_t v34 = v32;
    uint64_t v35 = *(void *)v52;
    *(void *)&long long v33 = 134218240;
    long long v46 = v33;
    do
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v52 != v35) {
          objc_enumerationMutation(v31);
        }
        v37 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        v38 = objc_msgSend(v8, "objectForKey:", v37, v46);
        v39 = [v18 objectForKey:v37];
        if ((isNSObjectEqual((unint64_t)v38, (uint64_t)v39) & 1) == 0)
        {
          uint64_t v40 = gLogObjects;
          int v41 = gNumLogObjects;
          if (gLogObjects && gNumLogObjects >= 1)
          {
            v42 = *(id *)gLogObjects;
          }
          else
          {
            v42 = MEMORY[0x1E4F14500];
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v46;
              uint64_t v57 = v40;
              __int16 v58 = 1024;
              LODWORD(v59) = v41;
              _os_log_error_impl(&dword_1B3C21000, v42, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v43 = v42;
          }
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            uint64_t v57 = (uint64_t)v37;
            __int16 v58 = 2112;
            uint64_t v59 = (uint64_t)v38;
            __int16 v60 = 2112;
            v61 = v39;
            _os_log_debug_impl(&dword_1B3C21000, v42, OS_LOG_TYPE_DEBUG, "Calling connection property did change handler for property: %@ (newValue: %@, oldValue: %@)", buf, 0x20u);
          }

          v44 = [(ACCTransportClient *)v48 connectionPropertyChangeHandlers];
          v45 = [v44 objectForKey:v37];

          if (v45) {
            ((void (**)(void, id, void *, void *, void *))v45)[2](v45, v47, v37, v38, v39);
          }

          id v8 = v49;
          char v18 = v50;
        }
      }
      uint64_t v34 = [v31 countByEnumeratingWithState:&v51 objects:v55 count:16];
    }
    while (v34);
  }
}

- (void)propertiesDidChange:(id)a3 forEndpointWithUUID:(id)a4 previousProperties:(id)a5 connectionUUID:(id)a6
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v49 = a3;
  id v46 = a4;
  id v48 = a5;
  id v45 = a6;
  if (gLogObjects) {
    BOOL v9 = gNumLogObjects < 1;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v11 = MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v11 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v63 = (uint64_t)v46;
    __int16 v64 = 2112;
    uint64_t v65 = (uint64_t)v45;
    _os_log_impl(&dword_1B3C21000, v11, OS_LOG_TYPE_DEFAULT, "Endpoint properties did change! (endpointUUID: %@, connectionUUID: %@)", buf, 0x16u);
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    os_signpost_id_t v12 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    os_signpost_id_t v12 = MEMORY[0x1E4F14500];
    id v13 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v63 = (uint64_t)v49;
    __int16 v64 = 2112;
    uint64_t v65 = (uint64_t)v48;
    _os_log_impl(&dword_1B3C21000, v12, OS_LOG_TYPE_INFO, "properties: %@, previousProperties: %@", buf, 0x16u);
  }

  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    id v14 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportClient _init]();
    }
    id v14 = MEMORY[0x1E4F14500];
    id v15 = MEMORY[0x1E4F14500];
  }
  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    id v16 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportClient _init]();
    }
    id v16 = MEMORY[0x1E4F14500];
    id v17 = MEMORY[0x1E4F14500];
  }
  os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v16, self);

  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    uint64_t v19 = [v49 count];
    os_signpost_id_t v20 = [v49 allKeys];
    uint64_t v21 = [v48 count];
    id v22 = [v48 allKeys];
    *(_DWORD *)buf = 138413314;
    uint64_t v63 = (uint64_t)v46;
    __int16 v64 = 2048;
    uint64_t v65 = v19;
    __int16 v66 = 2112;
    v67 = v20;
    __int16 v68 = 2048;
    uint64_t v69 = v21;
    __int16 v70 = 2112;
    v71 = v22;
    _os_signpost_emit_with_name_impl(&dword_1B3C21000, v14, OS_SIGNPOST_EVENT, v18, "Endpoint PROPERTY", "Endpoint PropertiesDidChange! %@, %lu properties: %@, previous %lu properties: %@", buf, 0x34u);
  }
  uint64_t v23 = [(ACCTransportClient *)self delegate];
  if (v23)
  {
    id v24 = [(ACCTransportClient *)self delegate];
    char v25 = objc_opt_respondsToSelector();

    if (v25)
    {
      id v26 = [(ACCTransportClient *)self delegate];
      [v26 transportClient:self propertiesDidChange:v49 forEndpointWithUUID:v46 previousProperties:v48 connectionUUID:v45];
    }
  }
  id obj = [(ACCTransportClient *)self endpointPropertyChangeHandlers];
  objc_sync_enter(obj);
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  v27 = [(ACCTransportClient *)self endpointPropertyChangeHandlers];
  char v28 = [v27 allKeys];

  uint64_t v29 = [v28 countByEnumeratingWithState:&v57 objects:v61 count:16];
  if (v29)
  {
    uint64_t v30 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v58 != v30) {
          objc_enumerationMutation(v28);
        }
        uint64_t v32 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        long long v33 = [v49 objectForKey:v32];
        uint64_t v34 = [v48 objectForKey:v32];
        if ((isNSObjectEqual((unint64_t)v33, (uint64_t)v34) & 1) == 0)
        {
          uint64_t v35 = gLogObjects;
          int v36 = gNumLogObjects;
          if (gLogObjects && gNumLogObjects >= 1)
          {
            v37 = *(id *)gLogObjects;
          }
          else
          {
            v38 = v28;
            v39 = MEMORY[0x1E4F14500];
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              uint64_t v63 = v35;
              __int16 v64 = 1024;
              LODWORD(v65) = v36;
              _os_log_error_impl(&dword_1B3C21000, v39, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            uint64_t v40 = v39;
            v37 = v39;
            char v28 = v38;
          }
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            uint64_t v63 = (uint64_t)v32;
            __int16 v64 = 2112;
            uint64_t v65 = (uint64_t)v33;
            __int16 v66 = 2112;
            v67 = v34;
            _os_log_debug_impl(&dword_1B3C21000, v37, OS_LOG_TYPE_DEBUG, "Calling endpoint property did change handler for property: %@ (newValue: %@, oldValue: %@)", buf, 0x20u);
          }

          int v41 = [(ACCTransportClient *)self endpointPropertyChangeHandlers];
          v42 = [v41 objectForKey:v32];

          if (v42)
          {
            endpointEventHandlerQueue = self->_endpointEventHandlerQueue;
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __96__ACCTransportClient_propertiesDidChange_forEndpointWithUUID_previousProperties_connectionUUID___block_invoke;
            block[3] = &unk_1E6074230;
            id v56 = v42;
            id v51 = v46;
            long long v52 = v32;
            id v53 = v33;
            id v54 = v34;
            id v55 = v45;
            dispatch_async(endpointEventHandlerQueue, block);
          }
        }
      }
      uint64_t v29 = [v28 countByEnumeratingWithState:&v57 objects:v61 count:16];
    }
    while (v29);
  }

  objc_sync_exit(obj);
}

uint64_t __96__ACCTransportClient_propertiesDidChange_forEndpointWithUUID_previousProperties_connectionUUID___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void, void))(a1[9] + 16))(a1[9], a1[4], a1[5], a1[6], a1[7], a1[8]);
}

- (void)receivedSecureTunnelData:(id)a3 forEndpoint:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ACCTransportClient *)self endpointSecureTunnelDataHandlers];
  BOOL v9 = [v8 objectForKey:v7];

  if (gLogObjects) {
    BOOL v10 = gNumLogObjects < 3;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    os_signpost_id_t v12 = MEMORY[0x1E4F14500];
    id v11 = MEMORY[0x1E4F14500];
  }
  else
  {
    os_signpost_id_t v12 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[ACCTransportClient receivedSecureTunnelData:forEndpoint:]();
  }

  if (gLogObjects) {
    BOOL v13 = gNumLogObjects <= 2;
  }
  else {
    BOOL v13 = 1;
  }
  int v14 = !v13;
  if (v9)
  {
    if (v14)
    {
      id v15 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      id v15 = MEMORY[0x1E4F14500];
      id v17 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412546;
      id v20 = v7;
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl(&dword_1B3C21000, v15, OS_LOG_TYPE_DEFAULT, "SecureTunnelData: call dataInHandler, endpoint: %@, data:%@", (uint8_t *)&v19, 0x16u);
    }

    ((void (**)(void, id, id))v9)[2](v9, v7, v6);
  }
  else
  {
    if (v14)
    {
      id v16 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      id v16 = MEMORY[0x1E4F14500];
      id v18 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412546;
      id v20 = v7;
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl(&dword_1B3C21000, v16, OS_LOG_TYPE_DEFAULT, "SecureTunnelData: No dataInHandler! endpoint: %@, data:%@", (uint8_t *)&v19, 0x16u);
    }
  }
}

- (void)launchServer
{
  kdebug_trace();
  [(ACCTransportClient *)self connectToServer];
  id v4 = [(ACCTransportClient *)self serverConnection];
  id v3 = [v4 remoteObjectProxyWithErrorHandler:&__block_literal_global_5];
  [v3 launchServer];
}

void __34__ACCTransportClient_launchServer__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 3;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    BOOL v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    BOOL v5 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

- (id)createConnectionWithType:(int)a3 andIdentifier:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__1;
  int v19 = __Block_byref_object_dispose__1;
  id v20 = 0;
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 1;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    BOOL v9 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  else
  {
    BOOL v9 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v22 = v4;
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl(&dword_1B3C21000, v9, OS_LOG_TYPE_DEFAULT, "Creating connection... (type: %{coreacc:ACCConnection_Type_t}d, identifier: %@)", buf, 0x12u);
  }

  [(ACCTransportClient *)self connectToServer];
  BOOL v10 = [(ACCTransportClient *)self serverConnection];
  id v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_128];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __61__ACCTransportClient_createConnectionWithType_andIdentifier___block_invoke_129;
  v14[3] = &unk_1E6074258;
  v14[4] = &v15;
  [v11 createConnectionWithType:v4 andIdentifier:v6 withReply:v14];

  id v12 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v12;
}

void __61__ACCTransportClient_createConnectionWithType_andIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    BOOL v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    BOOL v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

void __61__ACCTransportClient_createConnectionWithType_andIdentifier___block_invoke_129(uint64_t a1, int a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (gLogObjects) {
    BOOL v6 = gNumLogObjects < 1;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v8 = MEMORY[0x1E4F14500];
    id v7 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v8 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v5;
    __int16 v13 = 1024;
    int v14 = a2;
    _os_log_impl(&dword_1B3C21000, v8, OS_LOG_TYPE_DEFAULT, "Created new accessory connection with UUID: %@, result: %d", (uint8_t *)&v11, 0x12u);
  }

  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  BOOL v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
}

- (BOOL)setProperties:(id)a3 forConnectionWithUUID:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v35 = 0;
  int v36 = &v35;
  uint64_t v37 = 0x2020000000;
  char v38 = 0;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 1;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    BOOL v10 = MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }
  else
  {
    BOOL v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v40 = v7;
    _os_log_impl(&dword_1B3C21000, v10, OS_LOG_TYPE_DEFAULT, "Setting properties for connection: %@", buf, 0xCu);
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    int v11 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    int v11 = MEMORY[0x1E4F14500];
    id v12 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v40 = v6;
    _os_log_impl(&dword_1B3C21000, v11, OS_LOG_TYPE_INFO, "properties: %@", buf, 0xCu);
  }

  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    __int16 v13 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportClient _init]();
    }
    __int16 v13 = MEMORY[0x1E4F14500];
    id v14 = MEMORY[0x1E4F14500];
  }
  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    uint64_t v15 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportClient _init]();
    }
    uint64_t v15 = MEMORY[0x1E4F14500];
    id v16 = MEMORY[0x1E4F14500];
  }
  os_signpost_id_t v17 = os_signpost_id_make_with_pointer(v15, self);

  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    uint64_t v18 = [v6 count];
    int v19 = [v6 allKeys];
    *(_DWORD *)buf = 138412802;
    id v40 = v7;
    __int16 v41 = 2048;
    uint64_t v42 = v18;
    __int16 v43 = 2112;
    v44 = v19;
    _os_signpost_emit_with_name_impl(&dword_1B3C21000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v17, "Connection PROPERTY", "Connection SetProperties! %@, %lu properties: %@", buf, 0x20u);
  }
  [(ACCTransportClient *)self connectToServer];
  id v20 = [(ACCTransportClient *)self serverConnection];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __58__ACCTransportClient_setProperties_forConnectionWithUUID___block_invoke;
  v32[3] = &unk_1E6074280;
  v32[4] = self;
  id v21 = v7;
  id v33 = v21;
  id v22 = v6;
  id v34 = v22;
  __int16 v23 = [v20 synchronousRemoteObjectProxyWithErrorHandler:v32];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __58__ACCTransportClient_setProperties_forConnectionWithUUID___block_invoke_131;
  v27[3] = &unk_1E60742A8;
  id v24 = v21;
  id v28 = v24;
  uint64_t v29 = self;
  id v25 = v22;
  id v30 = v25;
  v31 = &v35;
  [v23 setProperties:v25 forConnectionWithUUID:v24 withReply:v27];

  LOBYTE(v23) = *((unsigned char *)v36 + 24) != 0;
  _Block_object_dispose(&v35, 8);

  return (char)v23;
}

void __58__ACCTransportClient_setProperties_forConnectionWithUUID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v6 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }

  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    id v7 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportClient _init]();
    }
    id v7 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    id v9 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportClient _init]();
    }
    id v9 = MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
  }
  os_signpost_id_t v11 = os_signpost_id_make_with_pointer(v9, *(const void **)(a1 + 32));

  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    id v12 = [v3 localizedFailureReason];
    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v14 = [*(id *)(a1 + 48) count];
    uint64_t v15 = [*(id *)(a1 + 48) allKeys];
    int v16 = 138413058;
    os_signpost_id_t v17 = v12;
    __int16 v18 = 2112;
    uint64_t v19 = v13;
    __int16 v20 = 2048;
    uint64_t v21 = v14;
    __int16 v22 = 2112;
    __int16 v23 = v15;
    _os_signpost_emit_with_name_impl(&dword_1B3C21000, v7, OS_SIGNPOST_INTERVAL_END, v11, "Connection PROPERTY", "ERROR (%@) handling Connection SetProperties! %@, %lu properties: %@", (uint8_t *)&v16, 0x2Au);
  }
}

void __58__ACCTransportClient_setProperties_forConnectionWithUUID___block_invoke_131(uint64_t a1, int a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v6 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v16 = 138412546;
    uint64_t v17 = v7;
    __int16 v18 = 1024;
    LODWORD(v19) = a2;
    _os_log_impl(&dword_1B3C21000, v6, OS_LOG_TYPE_INFO, "Set properties for connection: %@, result: %d", (uint8_t *)&v16, 0x12u);
  }

  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    id v8 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportClient _init]();
    }
    id v8 = MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }
  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    id v10 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportClient _init]();
    }
    id v10 = MEMORY[0x1E4F14500];
    id v11 = MEMORY[0x1E4F14500];
  }
  os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v10, *(const void **)(a1 + 40));

  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = [*(id *)(a1 + 48) count];
    uint64_t v15 = [*(id *)(a1 + 48) allKeys];
    int v16 = 138412802;
    uint64_t v17 = v13;
    __int16 v18 = 2048;
    uint64_t v19 = v14;
    __int16 v20 = 2112;
    uint64_t v21 = v15;
    _os_signpost_emit_with_name_impl(&dword_1B3C21000, v8, OS_SIGNPOST_INTERVAL_END, v12, "Connection PROPERTY", "Connection SetProperties! %@, %lu properties: %@", (uint8_t *)&v16, 0x20u);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a2;
}

- (BOOL)setProperty:(id)a3 value:(id)a4 forConnectionWithUUID:(id)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  v15[0] = a4;
  id v8 = (void *)MEMORY[0x1E4F1C9E8];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  os_signpost_id_t v12 = [v8 dictionaryWithObjects:v15 forKeys:&v14 count:1];

  LOBYTE(v10) = [(ACCTransportClient *)self setProperties:v12 forConnectionWithUUID:v9];
  return (char)v10;
}

- (BOOL)removeProperty:(id)a3 forConnectionWithUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  int v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  [(ACCTransportClient *)self connectToServer];
  id v8 = [(ACCTransportClient *)self serverConnection];
  id v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_135];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__ACCTransportClient_removeProperty_forConnectionWithUUID___block_invoke_136;
  v12[3] = &unk_1E60742D0;
  id v10 = v7;
  id v13 = v10;
  id v14 = &v15;
  [v9 removeProperty:v6 forConnectionWithUUID:v10 withReply:v12];

  LOBYTE(v8) = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return (char)v8;
}

void __59__ACCTransportClient_removeProperty_forConnectionWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

void __59__ACCTransportClient_removeProperty_forConnectionWithUUID___block_invoke_136(uint64_t a1, int a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v6 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138412546;
    uint64_t v9 = v7;
    __int16 v10 = 1024;
    int v11 = a2;
    _os_log_impl(&dword_1B3C21000, v6, OS_LOG_TYPE_INFO, "Remove property for connection: %@, result: %d", (uint8_t *)&v8, 0x12u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (id)createEndpointWithTransportType:(int)a3 andProtocol:(int)a4 andIdentifier:(id)a5 andDataOutHandler:(id)a6 forConnectionWithUUID:(id)a7 publishConnection:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v11 = *(void *)&a4;
  uint64_t v12 = *(void *)&a3;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v35 = 0;
  int v36 = &v35;
  uint64_t v37 = 0x3032000000;
  char v38 = __Block_byref_object_copy__1;
  v39 = __Block_byref_object_dispose__1;
  id v40 = 0;
  if (gLogObjects) {
    BOOL v17 = gNumLogObjects < 1;
  }
  else {
    BOOL v17 = 1;
  }
  if (v17)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    uint64_t v19 = MEMORY[0x1E4F14500];
    id v18 = MEMORY[0x1E4F14500];
  }
  else
  {
    uint64_t v19 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v20 = "NO";
    *(_DWORD *)buf = 67110146;
    __int16 v43 = 1024;
    int v42 = v12;
    if (v8) {
      __int16 v20 = "YES";
    }
    int v44 = v11;
    __int16 v45 = 2112;
    id v46 = v14;
    __int16 v47 = 2112;
    id v48 = v16;
    __int16 v49 = 2080;
    id v50 = v20;
    _os_log_impl(&dword_1B3C21000, v19, OS_LOG_TYPE_DEFAULT, "Creating endpoint... (transportType: %{coreacc:ACCEndpoint_TransportType_t}d, protocol: %{coreacc:ACCEndpoint_Protocol_t}d, identifier: %@, connectionUUID: %@, publishConnection: %s)", buf, 0x2Cu);
  }

  [(ACCTransportClient *)self connectToServer];
  uint64_t v21 = [(ACCTransportClient *)self serverConnection];
  uint64_t v22 = [v21 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_140];
  uint64_t v29 = MEMORY[0x1E4F143A8];
  uint64_t v30 = 3221225472;
  v31 = __138__ACCTransportClient_createEndpointWithTransportType_andProtocol_andIdentifier_andDataOutHandler_forConnectionWithUUID_publishConnection___block_invoke_141;
  uint64_t v32 = &unk_1E60742F8;
  id v23 = v16;
  id v33 = v23;
  id v34 = &v35;
  [v22 createEndpointWithTransportType:v12 andProtocol:v11 andIdentifier:v14 forConnectionWithUUID:v23 withReply:&v29];

  uint64_t v24 = (void *)v36[5];
  if (v15 && v24)
  {
    id v25 = [(ACCTransportClient *)self endpointDataOutHandlers];
    id v26 = _Block_copy(v15);
    [v25 setObject:v26 forKey:v36[5]];

    uint64_t v24 = (void *)v36[5];
  }
  if (v24 && v8)
  {
    [(ACCTransportClient *)self publishConnectionWithUUID:v23];
    uint64_t v24 = (void *)v36[5];
  }
  id v27 = v24;

  _Block_object_dispose(&v35, 8);

  return v27;
}

void __138__ACCTransportClient_createEndpointWithTransportType_andProtocol_andIdentifier_andDataOutHandler_forConnectionWithUUID_publishConnection___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

void __138__ACCTransportClient_createEndpointWithTransportType_andProtocol_andIdentifier_andDataOutHandler_forConnectionWithUUID_publishConnection___block_invoke_141(uint64_t a1, int a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (gLogObjects) {
    BOOL v6 = gNumLogObjects < 1;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    BOOL v8 = MEMORY[0x1E4F14500];
    id v7 = MEMORY[0x1E4F14500];
  }
  else
  {
    BOOL v8 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v12 = 138412802;
    id v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = v9;
    __int16 v16 = 1024;
    int v17 = a2;
    _os_log_impl(&dword_1B3C21000, v8, OS_LOG_TYPE_DEFAULT, "Created new endpoint %@ for connection %@, result: %d", (uint8_t *)&v12, 0x1Cu);
  }

  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v5;
}

- (BOOL)setAccessoryInfo:(id)a3 forEndpointWithUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  __int16 v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  [(ACCTransportClient *)self connectToServer];
  BOOL v8 = [(ACCTransportClient *)self serverConnection];
  uint64_t v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_143];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__ACCTransportClient_setAccessoryInfo_forEndpointWithUUID___block_invoke_144;
  v12[3] = &unk_1E60742D0;
  id v10 = v7;
  id v13 = v10;
  __int16 v14 = &v15;
  [v9 setAccessoryInfo:v6 forEndpointWithUUID:v10 withReply:v12];

  LOBYTE(v8) = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return (char)v8;
}

void __59__ACCTransportClient_setAccessoryInfo_forEndpointWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

void __59__ACCTransportClient_setAccessoryInfo_forEndpointWithUUID___block_invoke_144(uint64_t a1, int a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v6 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138412546;
    uint64_t v9 = v7;
    __int16 v10 = 1024;
    int v11 = a2;
    _os_log_impl(&dword_1B3C21000, v6, OS_LOG_TYPE_INFO, "Set accessory info for endpoint: %@, result: %d", (uint8_t *)&v8, 0x12u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (BOOL)setProperties:(id)a3 forEndpointWithUUID:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v35 = 0;
  int v36 = &v35;
  uint64_t v37 = 0x2020000000;
  char v38 = 0;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 1;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    __int16 v10 = MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }
  else
  {
    __int16 v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v40 = v7;
    _os_log_impl(&dword_1B3C21000, v10, OS_LOG_TYPE_DEFAULT, "Setting properties for endpoint: %@", buf, 0xCu);
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    int v11 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    int v11 = MEMORY[0x1E4F14500];
    id v12 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v40 = v6;
    _os_log_impl(&dword_1B3C21000, v11, OS_LOG_TYPE_INFO, "properties: %@", buf, 0xCu);
  }

  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    id v13 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportClient _init]();
    }
    id v13 = MEMORY[0x1E4F14500];
    id v14 = MEMORY[0x1E4F14500];
  }
  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    uint64_t v15 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportClient _init]();
    }
    uint64_t v15 = MEMORY[0x1E4F14500];
    id v16 = MEMORY[0x1E4F14500];
  }
  os_signpost_id_t v17 = os_signpost_id_make_with_pointer(v15, self);

  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    uint64_t v18 = [v6 count];
    uint64_t v19 = [v6 allKeys];
    *(_DWORD *)buf = 138412802;
    id v40 = v7;
    __int16 v41 = 2048;
    uint64_t v42 = v18;
    __int16 v43 = 2112;
    int v44 = v19;
    _os_signpost_emit_with_name_impl(&dword_1B3C21000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v17, "Endpoint PROPERTY", "Endpoint SetProperties! %@, %lu properties: %@", buf, 0x20u);
  }
  [(ACCTransportClient *)self connectToServer];
  __int16 v20 = [(ACCTransportClient *)self serverConnection];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __56__ACCTransportClient_setProperties_forEndpointWithUUID___block_invoke;
  v32[3] = &unk_1E6074280;
  v32[4] = self;
  id v21 = v7;
  id v33 = v21;
  id v22 = v6;
  id v34 = v22;
  id v23 = [v20 synchronousRemoteObjectProxyWithErrorHandler:v32];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __56__ACCTransportClient_setProperties_forEndpointWithUUID___block_invoke_145;
  v27[3] = &unk_1E60742A8;
  id v24 = v21;
  id v28 = v24;
  uint64_t v29 = self;
  id v25 = v22;
  id v30 = v25;
  v31 = &v35;
  [v23 setProperties:v25 forEndpointWithUUID:v24 withReply:v27];

  LOBYTE(v23) = *((unsigned char *)v36 + 24) != 0;
  _Block_object_dispose(&v35, 8);

  return (char)v23;
}

void __56__ACCTransportClient_setProperties_forEndpointWithUUID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v6 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }

  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    id v7 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportClient _init]();
    }
    id v7 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    id v9 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportClient _init]();
    }
    id v9 = MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
  }
  os_signpost_id_t v11 = os_signpost_id_make_with_pointer(v9, *(const void **)(a1 + 32));

  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    id v12 = [v3 localizedFailureReason];
    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v14 = [*(id *)(a1 + 48) count];
    uint64_t v15 = [*(id *)(a1 + 48) allKeys];
    int v16 = 138413058;
    os_signpost_id_t v17 = v12;
    __int16 v18 = 2112;
    uint64_t v19 = v13;
    __int16 v20 = 2048;
    uint64_t v21 = v14;
    __int16 v22 = 2112;
    id v23 = v15;
    _os_signpost_emit_with_name_impl(&dword_1B3C21000, v7, OS_SIGNPOST_INTERVAL_END, v11, "Endpoint PROPERTY", "ERROR (%@) handling Endpoint SetProperties! %@, %lu properties: %@", (uint8_t *)&v16, 0x2Au);
  }
}

void __56__ACCTransportClient_setProperties_forEndpointWithUUID___block_invoke_145(uint64_t a1, int a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v6 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v16 = 138412546;
    uint64_t v17 = v7;
    __int16 v18 = 1024;
    LODWORD(v19) = a2;
    _os_log_impl(&dword_1B3C21000, v6, OS_LOG_TYPE_INFO, "Set properties for endpoint: %@, result: %d", (uint8_t *)&v16, 0x12u);
  }

  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    id v8 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportClient _init]();
    }
    id v8 = MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }
  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    id v10 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportClient _init]();
    }
    id v10 = MEMORY[0x1E4F14500];
    id v11 = MEMORY[0x1E4F14500];
  }
  os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v10, *(const void **)(a1 + 40));

  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = [*(id *)(a1 + 48) count];
    uint64_t v15 = [*(id *)(a1 + 48) allKeys];
    int v16 = 138412802;
    uint64_t v17 = v13;
    __int16 v18 = 2048;
    uint64_t v19 = v14;
    __int16 v20 = 2112;
    uint64_t v21 = v15;
    _os_signpost_emit_with_name_impl(&dword_1B3C21000, v8, OS_SIGNPOST_INTERVAL_END, v12, "Endpoint PROPERTY", "Endpoint SetProperties! %@, %lu properties: %@", (uint8_t *)&v16, 0x20u);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a2;
}

- (BOOL)setProperty:(id)a3 value:(id)a4 forEndpointWithUUID:(id)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  v15[0] = a4;
  id v8 = (void *)MEMORY[0x1E4F1C9E8];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  os_signpost_id_t v12 = [v8 dictionaryWithObjects:v15 forKeys:&v14 count:1];

  LOBYTE(v10) = [(ACCTransportClient *)self setProperties:v12 forEndpointWithUUID:v9];
  return (char)v10;
}

- (BOOL)removeProperty:(id)a3 forEndpointWithUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  int v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  [(ACCTransportClient *)self connectToServer];
  id v8 = [(ACCTransportClient *)self serverConnection];
  id v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_147];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__ACCTransportClient_removeProperty_forEndpointWithUUID___block_invoke_148;
  v12[3] = &unk_1E60742D0;
  id v10 = v7;
  id v13 = v10;
  id v14 = &v15;
  [v9 removeProperty:v6 forEndpointWithUUID:v10 withReply:v12];

  LOBYTE(v8) = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return (char)v8;
}

void __57__ACCTransportClient_removeProperty_forEndpointWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

void __57__ACCTransportClient_removeProperty_forEndpointWithUUID___block_invoke_148(uint64_t a1, int a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v6 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138412546;
    uint64_t v9 = v7;
    __int16 v10 = 1024;
    int v11 = a2;
    _os_log_impl(&dword_1B3C21000, v6, OS_LOG_TYPE_INFO, "Remove property for endpoint: %@, result: %d", (uint8_t *)&v8, 0x12u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (BOOL)publishConnectionWithUUID:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v15 = 0;
  int v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    uint64_t v7 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  else
  {
    uint64_t v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v4;
    _os_log_impl(&dword_1B3C21000, v7, OS_LOG_TYPE_DEFAULT, "Publishing connection... (connectionUUID: %@)", buf, 0xCu);
  }

  [(ACCTransportClient *)self connectToServer];
  int v8 = [(ACCTransportClient *)self serverConnection];
  uint64_t v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_150];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __48__ACCTransportClient_publishConnectionWithUUID___block_invoke_151;
  v12[3] = &unk_1E60742D0;
  id v10 = v4;
  id v13 = v10;
  id v14 = &v15;
  [v9 publishConnectionWithUUID:v10 withReply:v12];

  LOBYTE(v8) = *((unsigned char *)v16 + 24) != 0;
  _Block_object_dispose(&v15, 8);

  return (char)v8;
}

void __48__ACCTransportClient_publishConnectionWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    BOOL v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    BOOL v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

void __48__ACCTransportClient_publishConnectionWithUUID___block_invoke_151(uint64_t a1, int a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v6 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138412546;
    uint64_t v9 = v7;
    __int16 v10 = 1024;
    int v11 = a2;
    _os_log_impl(&dword_1B3C21000, v6, OS_LOG_TYPE_DEFAULT, "Published connection: %@, result: %d", (uint8_t *)&v8, 0x12u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (BOOL)destroyEndpointWithUUID:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    uint64_t v7 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  else
  {
    uint64_t v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v4;
    _os_log_impl(&dword_1B3C21000, v7, OS_LOG_TYPE_DEFAULT, "Destroying endpoint... (endpointUUID: %@)", buf, 0xCu);
  }

  [(ACCTransportClient *)self connectToServer];
  int v8 = [(ACCTransportClient *)self serverConnection];
  uint64_t v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_153];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __46__ACCTransportClient_destroyEndpointWithUUID___block_invoke_154;
  int v16 = &unk_1E60742D0;
  id v10 = v4;
  id v17 = v10;
  char v18 = &v19;
  [v9 destroyEndpointWithUUID:v10 withReply:&v13];

  int v11 = [(ACCTransportClient *)self endpointDataOutHandlers];
  [v11 removeObjectForKey:v10];

  LOBYTE(v11) = *((unsigned char *)v20 + 24) != 0;
  _Block_object_dispose(&v19, 8);

  return (char)v11;
}

void __46__ACCTransportClient_destroyEndpointWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    BOOL v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    BOOL v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

void __46__ACCTransportClient_destroyEndpointWithUUID___block_invoke_154(uint64_t a1, int a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v6 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138412546;
    uint64_t v9 = v7;
    __int16 v10 = 1024;
    int v11 = a2;
    _os_log_impl(&dword_1B3C21000, v6, OS_LOG_TYPE_DEFAULT, "Destroyed endpoint: %@, result: %d", (uint8_t *)&v8, 0x12u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (BOOL)destroyConnectionWithUUID:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    uint64_t v7 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  else
  {
    uint64_t v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v4;
    _os_log_impl(&dword_1B3C21000, v7, OS_LOG_TYPE_DEFAULT, "Destroying connection... (connectionUUID: %@)", buf, 0xCu);
  }

  if (v4)
  {
    [(ACCTransportClient *)self connectToServer];
    int v8 = [(ACCTransportClient *)self endpointUUIDsForConnectionWithUUID:v4];
    uint64_t v9 = [(ACCTransportClient *)self serverConnection];
    __int16 v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_156_0];
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    char v18 = __48__ACCTransportClient_destroyConnectionWithUUID___block_invoke_157;
    uint64_t v19 = &unk_1E60742D0;
    id v20 = v4;
    uint64_t v21 = &v22;
    [v10 destroyConnectionWithUUID:v20 withReply:&v16];

    int v11 = [(ACCTransportClient *)self endpointDataOutHandlers];
    uint64_t v12 = [v8 allObjects];
    [v11 removeObjectsForKeys:v12];
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      int v8 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportPlugin initWithDelegate:]();
      }
      int v8 = MEMORY[0x1E4F14500];
      id v13 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[ACCTransportClient destroyConnectionWithUUID:](v8);
    }
  }

  BOOL v14 = *((unsigned char *)v23 + 24) != 0;
  _Block_object_dispose(&v22, 8);

  return v14;
}

void __48__ACCTransportClient_destroyConnectionWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    BOOL v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    BOOL v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

void __48__ACCTransportClient_destroyConnectionWithUUID___block_invoke_157(uint64_t a1, int a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v6 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138412546;
    uint64_t v9 = v7;
    __int16 v10 = 1024;
    int v11 = a2;
    _os_log_impl(&dword_1B3C21000, v6, OS_LOG_TYPE_DEFAULT, "Destroyed connection: %@, result: %d", (uint8_t *)&v8, 0x12u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (id)connectionUUIDForEndpointWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  int v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__1;
  BOOL v14 = __Block_byref_object_dispose__1;
  id v15 = 0;
  [(ACCTransportClient *)self connectToServer];
  id v5 = [(ACCTransportClient *)self serverConnection];
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_159];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__ACCTransportClient_connectionUUIDForEndpointWithUUID___block_invoke_160;
  v9[3] = &unk_1E6074320;
  v9[4] = &v10;
  [v6 connectionUUIDForEndpointWithUUID:v4 withReply:v9];

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __56__ACCTransportClient_connectionUUIDForEndpointWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

void __56__ACCTransportClient_connectionUUIDForEndpointWithUUID___block_invoke_160(uint64_t a1, void *a2)
{
}

- (id)endpointUUIDsForConnectionWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  int v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__1;
  BOOL v14 = __Block_byref_object_dispose__1;
  id v15 = 0;
  [(ACCTransportClient *)self connectToServer];
  id v5 = [(ACCTransportClient *)self serverConnection];
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_163];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__ACCTransportClient_endpointUUIDsForConnectionWithUUID___block_invoke_164;
  v9[3] = &unk_1E6074348;
  v9[4] = &v10;
  [v6 endpointUUIDsForConnectionWithUUID:v4 withReply:v9];

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __57__ACCTransportClient_endpointUUIDsForConnectionWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

uint64_t __57__ACCTransportClient_endpointUUIDsForConnectionWithUUID___block_invoke_164(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [MEMORY[0x1E4F1CAD0] setWithArray:a2];

  return MEMORY[0x1F41817F8]();
}

- (int)authStatusForConnectionWithUUID:(id)a3 authType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  [(ACCTransportClient *)self connectToServer];
  id v7 = [(ACCTransportClient *)self serverConnection];
  int v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_168];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__ACCTransportClient_authStatusForConnectionWithUUID_authType___block_invoke_169;
  v10[3] = &unk_1E6074370;
  v10[4] = &v11;
  [v8 authStatusForConnectionWithUUID:v6 authType:v4 withReply:v10];

  LODWORD(v4) = *((_DWORD *)v12 + 6);
  _Block_object_dispose(&v11, 8);

  return v4;
}

void __63__ACCTransportClient_authStatusForConnectionWithUUID_authType___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

uint64_t __63__ACCTransportClient_authStatusForConnectionWithUUID_authType___block_invoke_169(uint64_t result, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)isConnectionAuthenticated:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  [(ACCTransportClient *)self connectToServer];
  id v5 = [(ACCTransportClient *)self serverConnection];
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_172];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__ACCTransportClient_isConnectionAuthenticated___block_invoke_173;
  v8[3] = &unk_1E6074398;
  v8[4] = &v9;
  [v6 isConnectionAuthenticatedForUUID:v4 withReply:v8];

  LOBYTE(v5) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return (char)v5;
}

void __48__ACCTransportClient_isConnectionAuthenticated___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

uint64_t __48__ACCTransportClient_isConnectionAuthenticated___block_invoke_173(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)setConnectionAuthenticated:(id)a3 state:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 1;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    uint64_t v9 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  else
  {
    uint64_t v9 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 1024;
    BOOL v15 = v4;
    _os_log_impl(&dword_1B3C21000, v9, OS_LOG_TYPE_DEFAULT, "setConnectionAuthenticated: %@ state: %d", (uint8_t *)&v12, 0x12u);
  }

  [(ACCTransportClient *)self connectToServer];
  uint64_t v10 = [(ACCTransportClient *)self serverConnection];
  uint64_t v11 = [v10 remoteObjectProxyWithErrorHandler:&__block_literal_global_175];
  [v11 setConnectionAuthenticated:v6 state:v4];
}

void __55__ACCTransportClient_setConnectionAuthenticated_state___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

- (id)accessoryInfoForConnectionWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__1;
  __int16 v14 = __Block_byref_object_dispose__1;
  id v15 = 0;
  [(ACCTransportClient *)self connectToServer];
  id v5 = [(ACCTransportClient *)self serverConnection];
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_177];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__ACCTransportClient_accessoryInfoForConnectionWithUUID___block_invoke_178;
  v9[3] = &unk_1E60743C0;
  v9[4] = &v10;
  [v6 accessoryInfoForConnectionWithUUID:v4 withReply:v9];

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __57__ACCTransportClient_accessoryInfoForConnectionWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

void __57__ACCTransportClient_accessoryInfoForConnectionWithUUID___block_invoke_178(uint64_t a1, void *a2)
{
}

- (id)accessoryInfoForEndpointWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__1;
  __int16 v14 = __Block_byref_object_dispose__1;
  id v15 = 0;
  [(ACCTransportClient *)self connectToServer];
  id v5 = [(ACCTransportClient *)self serverConnection];
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_181];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__ACCTransportClient_accessoryInfoForEndpointWithUUID___block_invoke_182;
  v9[3] = &unk_1E60743C0;
  v9[4] = &v10;
  [v6 accessoryInfoForEndpointWithUUID:v4 withReply:v9];

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __55__ACCTransportClient_accessoryInfoForEndpointWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

void __55__ACCTransportClient_accessoryInfoForEndpointWithUUID___block_invoke_182(uint64_t a1, void *a2)
{
}

- (id)propertiesForConnectionWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__1;
  __int16 v14 = __Block_byref_object_dispose__1;
  id v15 = 0;
  [(ACCTransportClient *)self connectToServer];
  id v5 = [(ACCTransportClient *)self serverConnection];
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_184];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__ACCTransportClient_propertiesForConnectionWithUUID___block_invoke_185;
  v9[3] = &unk_1E60743C0;
  v9[4] = &v10;
  [v6 propertiesForConnectionWithUUID:v4 withReply:v9];

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __54__ACCTransportClient_propertiesForConnectionWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

void __54__ACCTransportClient_propertiesForConnectionWithUUID___block_invoke_185(uint64_t a1, void *a2)
{
}

- (id)propertiesForEndpointWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__1;
  __int16 v14 = __Block_byref_object_dispose__1;
  id v15 = 0;
  [(ACCTransportClient *)self connectToServer];
  id v5 = [(ACCTransportClient *)self serverConnection];
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_187];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__ACCTransportClient_propertiesForEndpointWithUUID___block_invoke_188;
  v9[3] = &unk_1E60743C0;
  v9[4] = &v10;
  [v6 propertiesForEndpointWithUUID:v4 withReply:v9];

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __52__ACCTransportClient_propertiesForEndpointWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

void __52__ACCTransportClient_propertiesForEndpointWithUUID___block_invoke_188(uint64_t a1, void *a2)
{
}

- (id)identifierForConnectionWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__1;
  __int16 v14 = __Block_byref_object_dispose__1;
  id v15 = 0;
  [(ACCTransportClient *)self connectToServer];
  id v5 = [(ACCTransportClient *)self serverConnection];
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_190];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__ACCTransportClient_identifierForConnectionWithUUID___block_invoke_191;
  v9[3] = &unk_1E6074320;
  v9[4] = &v10;
  [v6 identifierForConnectionWithUUID:v4 withReply:v9];

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __54__ACCTransportClient_identifierForConnectionWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

void __54__ACCTransportClient_identifierForConnectionWithUUID___block_invoke_191(uint64_t a1, void *a2)
{
}

- (id)identifierForEndpointWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__1;
  __int16 v14 = __Block_byref_object_dispose__1;
  id v15 = 0;
  [(ACCTransportClient *)self connectToServer];
  id v5 = [(ACCTransportClient *)self serverConnection];
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_193];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__ACCTransportClient_identifierForEndpointWithUUID___block_invoke_194;
  v9[3] = &unk_1E6074320;
  v9[4] = &v10;
  [v6 identifierForEndpointWithUUID:v4 withReply:v9];

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __52__ACCTransportClient_identifierForEndpointWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

void __52__ACCTransportClient_identifierForEndpointWithUUID___block_invoke_194(uint64_t a1, void *a2)
{
}

- (void)setHandler:(id)a3 forConnectionProperty:(id)a4
{
  id aBlock = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = [(ACCTransportClient *)self connectionPropertyChangeHandlers];
    if (aBlock)
    {
      id v8 = _Block_copy(aBlock);
      [v7 setObject:v8 forKey:v6];
    }
    else
    {
      [v7 removeObjectForKey:v6];
    }
  }
}

- (void)setHandler:(id)a3 forEndpointProperty:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 1;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    uint64_t v10 = MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }
  else
  {
    uint64_t v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = "set";
    uint64_t v16 = "-[ACCTransportClient setHandler:forEndpointProperty:]";
    int v15 = 136315650;
    if (!v6) {
      uint64_t v11 = "reset";
    }
    __int16 v17 = 2080;
    char v18 = v11;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl(&dword_1B3C21000, v10, OS_LOG_TYPE_DEFAULT, "%s: %s eventHandler for property %@", (uint8_t *)&v15, 0x20u);
  }

  if (v7)
  {
    uint64_t v12 = [(ACCTransportClient *)self endpointPropertyChangeHandlers];
    objc_sync_enter(v12);
    id v13 = [(ACCTransportClient *)self endpointPropertyChangeHandlers];
    if (v6)
    {
      __int16 v14 = _Block_copy(v6);
      [v13 setObject:v14 forKey:v7];
    }
    else
    {
      [v13 removeObjectForKey:v7];
    }

    objc_sync_exit(v12);
  }
}

- (void)setSecureTunnelDataReceiveHandler:(id)a3 forEndpoint:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 1;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    uint64_t v10 = MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }
  else
  {
    uint64_t v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = "set";
    char v18 = "-[ACCTransportClient setSecureTunnelDataReceiveHandler:forEndpoint:]";
    int v17 = 136315650;
    if (!v6) {
      uint64_t v11 = "reset";
    }
    __int16 v19 = 2080;
    id v20 = v11;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl(&dword_1B3C21000, v10, OS_LOG_TYPE_DEFAULT, "%s: %s eventHandler for endpoint %@", (uint8_t *)&v17, 0x20u);
  }

  if (v7)
  {
    uint64_t v12 = [(ACCTransportClient *)self endpointPropertyChangeHandlers];
    objc_sync_enter(v12);
    id v13 = [(ACCTransportClient *)self endpointSecureTunnelDataHandlers];
    if (v6)
    {
      __int16 v14 = _Block_copy(v6);
      [v13 setObject:v14 forKey:v7];
    }
    else
    {
      [v13 removeObjectForKey:v7];
    }

    objc_sync_exit(v12);
    [(ACCTransportClient *)self connectToServer];
    int v15 = [(ACCTransportClient *)self serverConnection];
    uint64_t v16 = [v15 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_198];
    [v16 enableSecureTunnelDataReceiveHandlerForEndpoint:v7];
  }
}

void __68__ACCTransportClient_setSecureTunnelDataReceiveHandler_forEndpoint___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

- (BOOL)processOutgoingSecureTunnelData:(id)a3 forEndpoint:(id)a4 forType:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  if (gLogObjects) {
    BOOL v10 = gNumLogObjects < 1;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    uint64_t v12 = MEMORY[0x1E4F14500];
    id v11 = MEMORY[0x1E4F14500];
  }
  else
  {
    uint64_t v12 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    id v27 = "-[ACCTransportClient processOutgoingSecureTunnelData:forEndpoint:forType:]";
    __int16 v28 = 2112;
    id v29 = v9;
    __int16 v30 = 1024;
    int v31 = v5;
    __int16 v32 = 2112;
    id v33 = v8;
    _os_log_impl(&dword_1B3C21000, v12, OS_LOG_TYPE_DEFAULT, "%s: Endpoint (%@) received secure data (type %d): %@", buf, 0x26u);
  }

  [(ACCTransportClient *)self connectToServer];
  id v13 = [(ACCTransportClient *)self serverConnection];
  __int16 v14 = [v13 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_200];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __74__ACCTransportClient_processOutgoingSecureTunnelData_forEndpoint_forType___block_invoke_201;
  v18[3] = &unk_1E60743E8;
  char v21 = v5;
  id v15 = v9;
  id v19 = v15;
  id v20 = &v22;
  [v14 sendOutgoingSecureTunnelData:v8 forEndpointWithUUID:v15 forType:v5 withResult:v18];

  BOOL v16 = *((unsigned char *)v23 + 24) != 0;
  _Block_object_dispose(&v22, 8);

  return v16;
}

void __74__ACCTransportClient_processOutgoingSecureTunnelData_forEndpoint_forType___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    uint64_t v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    uint64_t v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

void __74__ACCTransportClient_processOutgoingSecureTunnelData_forEndpoint_forType___block_invoke_201(uint64_t a1, char a2)
{
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v6 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __74__ACCTransportClient_processOutgoingSecureTunnelData_forEndpoint_forType___block_invoke_201_cold_1();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (BOOL)processIncomingData:(id)a3 forEndpointWithUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  BOOL v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  kdebug_trace();
  [(ACCTransportClient *)self connectToServer];
  id v8 = [(ACCTransportClient *)self serverConnection];
  id v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_203];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__ACCTransportClient_processIncomingData_forEndpointWithUUID___block_invoke_204;
  v12[3] = &unk_1E60742D0;
  id v10 = v7;
  id v13 = v10;
  __int16 v14 = &v15;
  [v9 processIncomingData:v6 forEndpointWithUUID:v10 withReply:v12];

  LOBYTE(v8) = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return (char)v8;
}

void __62__ACCTransportClient_processIncomingData_forEndpointWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v5 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();
  }
}

void __62__ACCTransportClient_processIncomingData_forEndpointWithUUID___block_invoke_204(uint64_t a1, char a2)
{
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPlugin initWithDelegate:]();
    }
    id v6 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  else
  {
    id v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __62__ACCTransportClient_processIncomingData_forEndpointWithUUID___block_invoke_204_cold_1();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

+ (id)sharedClient
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__ACCTransportClient_sharedClient__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (sharedClient_once != -1) {
    dispatch_once(&sharedClient_once, block);
  }
  id v2 = (void *)sharedClient_sharedInstance;

  return v2;
}

uint64_t __34__ACCTransportClient_sharedClient__block_invoke(uint64_t a1)
{
  sharedClient_sharedInstance = [objc_alloc(*(Class *)(a1 + 32)) _init];

  return MEMORY[0x1F41817F8]();
}

- (ACCTransportClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ACCTransportClientDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSXPCConnection)serverConnection
{
  return self->_serverConnection;
}

- (void)setServerConnection:(id)a3
{
}

- (NSMutableDictionary)endpointDataOutHandlers
{
  return self->_endpointDataOutHandlers;
}

- (void)setEndpointDataOutHandlers:(id)a3
{
}

- (NSMutableDictionary)connectionPropertyChangeHandlers
{
  return self->_connectionPropertyChangeHandlers;
}

- (void)setConnectionPropertyChangeHandlers:(id)a3
{
}

- (NSMutableDictionary)endpointPropertyChangeHandlers
{
  return self->_endpointPropertyChangeHandlers;
}

- (void)setEndpointPropertyChangeHandlers:(id)a3
{
}

- (NSMutableDictionary)endpointSecureTunnelDataHandlers
{
  return self->_endpointSecureTunnelDataHandlers;
}

- (void)setEndpointSecureTunnelDataHandlers:(id)a3
{
}

- (OS_dispatch_queue)endpointEventHandlerQueue
{
  return self->_endpointEventHandlerQueue;
}

- (void)setEndpointEventHandlerQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpointEventHandlerQueue, 0);
  objc_storeStrong((id *)&self->_endpointSecureTunnelDataHandlers, 0);
  objc_storeStrong((id *)&self->_endpointPropertyChangeHandlers, 0);
  objc_storeStrong((id *)&self->_connectionPropertyChangeHandlers, 0);
  objc_storeStrong((id *)&self->_endpointDataOutHandlers, 0);
  objc_storeStrong((id *)&self->_serverConnection, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_init
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_1(&dword_1B3C21000, MEMORY[0x1E4F14500], v0, "Make sure you have called init_logging_signposts() / init_logging()!\n module %d, gLogSignpostObjects: %p, gNumLogSignpostObjects: %d", v1, v2, v3, v4, v5);
}

- (void)receivedSecureTunnelData:forEndpoint:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_0();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x16u);
}

- (void)destroyConnectionWithUUID:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_fault_impl(&dword_1B3C21000, log, OS_LOG_TYPE_FAULT, "destroyConnectionWithUUID(): connectionUUID == nil", v1, 2u);
}

void __74__ACCTransportClient_processOutgoingSecureTunnelData_forEndpoint_forType___block_invoke_201_cold_1()
{
  OUTLINED_FUNCTION_6_0();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x18u);
}

void __62__ACCTransportClient_processIncomingData_forEndpointWithUUID___block_invoke_204_cold_1()
{
  OUTLINED_FUNCTION_6_0();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x12u);
}

@end