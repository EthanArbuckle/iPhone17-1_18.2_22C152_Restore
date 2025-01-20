@interface MTRPluginClientConnection
+ (id)_interfaceForClientProtocol;
+ (id)_interfaceForServerProtocol;
+ (id)clientConnectionQueue;
- (BOOL)_deliverMessagePayloadToPrimaryResident:(id)a3 responseHandler:(id)a4;
- (BOOL)_isRunning;
- (BOOL)_setupConnection;
- (BOOL)backgroundModeEntitled;
- (MTRPluginClient)pluginClient;
- (MTRPluginClientConnection)initWithClientConnection:(id)a3 backgroundModeEntitled:(BOOL)a4 pid:(int)a5 context:(id)a6 delegate:(id)a7 delegateQueue:(id)a8;
- (MTRPluginClientConnectionDelegate)delegate;
- (NSDictionary)context;
- (NSString)description;
- (NSUUID)homeUUID;
- (NSUUID)sessionID;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)queue;
- (int)pid;
- (void)deviceController:(id)a3 controllerNodeIDWithReply:(id)a4;
- (void)deviceController:(id)a3 getIsRunningWithReply:(id)a4;
- (void)deviceController:(id)a3 getUniqueIdentifierWithReply:(id)a4;
- (void)deviceController:(id)a3 nodeID:(id)a4 downloadLogOfType:(int64_t)a5 timeout:(double)a6 completion:(id)a7;
- (void)deviceController:(id)a3 nodeID:(id)a4 getDeviceCachePrimedWithReply:(id)a5;
- (void)deviceController:(id)a3 nodeID:(id)a4 getEstimatedStartTimeWithReply:(id)a5;
- (void)deviceController:(id)a3 nodeID:(id)a4 getEstimatedSubscriptionLatencyWithReply:(id)a5;
- (void)deviceController:(id)a3 nodeID:(id)a4 getStateWithReply:(id)a5;
- (void)deviceController:(id)a3 nodeID:(id)a4 invokeCommandWithEndpointID:(id)a5 clusterID:(id)a6 commandID:(id)a7 commandFields:(id)a8 expectedValues:(id)a9 expectedValueInterval:(id)a10 timedInvokeTimeout:(id)a11 serverSideProcessingTimeout:(id)a12 completion:(id)a13;
- (void)deviceController:(id)a3 nodeID:(id)a4 openCommissioningWindowWithSetupPasscode:(id)a5 discriminator:(id)a6 duration:(id)a7 completion:(id)a8;
- (void)deviceController:(id)a3 nodeID:(id)a4 readAttributePaths:(id)a5 withReply:(id)a6;
- (void)deviceController:(id)a3 nodeID:(id)a4 readAttributeWithEndpointID:(id)a5 clusterID:(id)a6 attributeID:(id)a7 params:(id)a8 withReply:(id)a9;
- (void)deviceController:(id)a3 nodeID:(id)a4 writeAttributeWithEndpointID:(id)a5 clusterID:(id)a6 attributeID:(id)a7 value:(id)a8 expectedValueInterval:(id)a9 timedWriteTimeout:(id)a10;
- (void)deviceController:(id)a3 updateControllerConfiguration:(id)a4;
- (void)interrupted;
- (void)invalidate;
- (void)invalidated;
- (void)resume;
- (void)setBackgroundModeEntitled:(BOOL)a3;
- (void)setConnection:(id)a3;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setHomeUUID:(id)a3;
- (void)setPid:(int)a3;
- (void)setPluginClient:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSessionID:(id)a3;
- (void)updateControllerConfigurationForRemotePeer;
@end

@implementation MTRPluginClientConnection

+ (id)clientConnectionQueue
{
  if (clientConnectionQueue_predicateNAME != -1) {
    dispatch_once(&clientConnectionQueue_predicateNAME, &__block_literal_global_7);
  }
  v2 = (void *)clientConnectionQueue_sSingleConnectionQueue;
  return v2;
}

void __50__MTRPluginClientConnection_clientConnectionQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("MTRPluginClientQueue", v2);
  v1 = (void *)clientConnectionQueue_sSingleConnectionQueue;
  clientConnectionQueue_sSingleConnectionQueue = (uint64_t)v0;
}

- (MTRPluginClientConnection)initWithClientConnection:(id)a3 backgroundModeEntitled:(BOOL)a4 pid:(int)a5 context:(id)a6 delegate:(id)a7 delegateQueue:(id)a8
{
  uint64_t v11 = *(void *)&a5;
  BOOL v12 = a4;
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)MTRPluginClientConnection;
  v18 = [(MTRPluginClientConnection *)&v24 init];
  v19 = v18;
  if (!v18) {
    goto LABEL_4;
  }
  [(MTRPluginClientConnection *)v18 setConnection:v14];
  [(MTRPluginClientConnection *)v19 setContext:v15];
  [(MTRPluginClientConnection *)v19 setBackgroundModeEntitled:v12];
  [(MTRPluginClientConnection *)v19 setPid:v11];
  v20 = [MEMORY[0x263F08C38] UUID];
  [(MTRPluginClientConnection *)v19 setSessionID:v20];

  [(MTRPluginClientConnection *)v19 setDelegate:v16];
  [(MTRPluginClientConnection *)v19 setDelegateQueue:v17];
  v21 = +[MTRPluginClientConnection clientConnectionQueue];
  [(MTRPluginClientConnection *)v19 setQueue:v21];

  if ([(MTRPluginClientConnection *)v19 _setupConnection]) {
    v22 = v19;
  }
  else {
LABEL_4:
  }
    v22 = 0;

  return v22;
}

+ (id)_interfaceForClientProtocol
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_27046DEA0];
}

+ (id)_interfaceForServerProtocol
{
  v7[10] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_27046CF68];
  v3 = (void *)MEMORY[0x263EFFA08];
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  v7[2] = objc_opt_class();
  v7[3] = objc_opt_class();
  v7[4] = objc_opt_class();
  v7[5] = objc_opt_class();
  v7[6] = objc_opt_class();
  v7[7] = objc_opt_class();
  v7[8] = objc_opt_class();
  v7[9] = objc_opt_class();
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:10];
  v5 = [v3 setWithArray:v4];

  [v2 setClasses:v5 forSelector:sel_deviceController_nodeID_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_ argumentIndex:5 ofReply:0];
  [v2 setClasses:v5 forSelector:sel_deviceController_nodeID_invokeCommandWithEndpointID_clusterID_commandID_commandFields_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_completion_ argumentIndex:6 ofReply:0];
  [v2 setClasses:v5 forSelector:sel_deviceController_nodeID_readAttributePaths_withReply_ argumentIndex:2 ofReply:0];
  [v2 setClasses:v5 forSelector:sel_deviceController_nodeID_readAttributePaths_withReply_ argumentIndex:0 ofReply:1];

  return v2;
}

- (BOOL)_setupConnection
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = +[MTRPluginClientManager sharedInstance];
  v4 = [(MTRPluginClientConnection *)self connection];
  v5 = [(MTRPluginClientConnection *)self sessionID];
  v6 = [(MTRPluginClientConnection *)self queue];
  v7 = [v3 addClientForXPCConnection:v4 sessionID:v5 queue:v6];
  [(MTRPluginClientConnection *)self setPluginClient:v7];

  v8 = +[MTRPluginClientConnection _interfaceForClientProtocol];
  v9 = [(MTRPluginClientConnection *)self connection];
  [v9 setRemoteObjectInterface:v8];

  v10 = +[MTRPluginClientConnection _interfaceForServerProtocol];
  uint64_t v11 = [(MTRPluginClientConnection *)self connection];
  [v11 setExportedInterface:v10];

  BOOL v12 = [(MTRPluginClientConnection *)self connection];
  [v12 setExportedObject:self];

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    v13 = [(MTRPluginClientConnection *)self pluginClient];
    int v17 = 138412546;
    v18 = self;
    __int16 v19 = 2112;
    v20 = v13;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Setting up MTRPluginClientConnection: %@ pluginClient : %@", (uint8_t *)&v17, 0x16u);
  }
  id v14 = [(MTRPluginClientConnection *)self pluginClient];
  BOOL v15 = v14 != 0;

  return v15;
}

- (BOOL)_deliverMessagePayloadToPrimaryResident:(id)a3 responseHandler:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [(MTRPluginClientConnection *)self delegate];
    *(_DWORD *)buf = 138412546;
    int v17 = self;
    __int16 v18 = 2112;
    __int16 v19 = v8;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ <= Sending message to delegate %@ to deliver to home hub", buf, 0x16u);
  }
  v9 = [(MTRPluginClientConnection *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    uint64_t v11 = [(MTRPluginClientConnection *)self delegateQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __85__MTRPluginClientConnection__deliverMessagePayloadToPrimaryResident_responseHandler___block_invoke;
    block[3] = &unk_2653E68E0;
    block[4] = self;
    id v14 = v6;
    id v15 = v7;
    dispatch_async(v11, block);
  }
  return v10 & 1;
}

void __85__MTRPluginClientConnection__deliverMessagePayloadToPrimaryResident_responseHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v9 = 0;
  int v6 = [v2 connection:v3 sendMessagePayloadToPrimaryResident:v4 responseHandler:v5 error:&v9];
  id v7 = v9;

  if (v6) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (!v8 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __85__MTRPluginClientConnection__deliverMessagePayloadToPrimaryResident_responseHandler___block_invoke_cold_1((uint64_t)v7);
  }
}

- (BOOL)_isRunning
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [(MTRPluginClientConnection *)v2 connection];
  BOOL v4 = v3 != 0;

  objc_sync_exit(v2);
  return v4;
}

- (void)resume
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    uint64_t v5 = self;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Resuming MTRPluginClientConnection: %@", (uint8_t *)&v4, 0xCu);
  }
  uint64_t v3 = [(MTRPluginClientConnection *)self connection];
  [v3 resume];
}

- (void)invalidate
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    uint64_t v5 = self;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Invalidating MTRPluginClientConnection: %@", (uint8_t *)&v4, 0xCu);
  }
  uint64_t v3 = [(MTRPluginClientConnection *)self connection];
  [v3 invalidate];
}

- (void)invalidated
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    uint64_t v6 = self;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " => Invalidated MTRPluginClientConnection: %@", (uint8_t *)&v5, 0xCu);
  }
  uint64_t v3 = +[MTRPluginClientManager sharedInstance];
  int v4 = [(MTRPluginClientConnection *)self connection];
  [v3 removeClientForXPCConnection:v4];

  [(MTRPluginClientConnection *)self setConnection:0];
}

- (void)interrupted
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    uint64_t v6 = self;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " => Interrupted MTRPluginClientConnection: %@", (uint8_t *)&v5, 0xCu);
  }
  uint64_t v3 = +[MTRPluginClientManager sharedInstance];
  int v4 = [(MTRPluginClientConnection *)self connection];
  [v3 removeClientForXPCConnection:v4];

  [(MTRPluginClientConnection *)self setConnection:0];
}

- (void)updateControllerConfigurationForRemotePeer
{
  id v6 = [(MTRPluginClientConnection *)self pluginClient];
  uint64_t v3 = [(MTRPluginClientConnection *)self homeUUID];
  int v4 = [(MTRPluginClientConnection *)self pluginClient];
  int v5 = [v4 controllerConfiguration];
  [v6 deviceController:v3 updateControllerConfiguration:v5];
}

- (NSString)description
{
  uint64_t v3 = NSString;
  int v4 = (objc_class *)objc_opt_class();
  int v5 = NSStringFromClass(v4);
  id v6 = [(MTRPluginClientConnection *)self connection];
  uint64_t v7 = [(MTRPluginClientConnection *)self pid];
  BOOL v8 = [(MTRPluginClientConnection *)self sessionID];
  id v9 = [(MTRPluginClientConnection *)self homeUUID];
  BOOL v10 = [(MTRPluginClientConnection *)self _isRunning];
  uint64_t v11 = @"NO";
  if (v10) {
    uint64_t v11 = @"YES";
  }
  BOOL v12 = [v3 stringWithFormat:@"<%@: %p xpc %p pid: %d sessionID: %@ Home: %@ Running: %@>", v5, self, v6, v7, v8, v9, v11];

  return (NSString *)v12;
}

- (void)deviceController:(id)a3 nodeID:(id)a4 getStateWithReply:(id)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(MTRPluginClientConnection *)self homeUUID];
  int v12 = [v8 isEqual:v11];

  if (v12)
  {
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x2020000000;
    char v31 = 0;
    v13 = [(MTRPluginClientConnection *)self delegateQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __71__MTRPluginClientConnection_deviceController_nodeID_getStateWithReply___block_invoke;
    block[3] = &unk_2653E6AC8;
    v27 = &v28;
    block[4] = self;
    id v14 = v8;
    id v25 = v14;
    id v15 = v9;
    id v26 = v15;
    dispatch_sync(v13, block);

    if (*((unsigned char *)v29 + 24))
    {
      id v16 = (void *)MEMORY[0x25A290B70]();
      int v17 = [(MTRPluginClientConnection *)self pluginClient];
      [v17 deviceController:v14 nodeID:v15 getStateWithReply:v10];
    }
    else
    {
      __int16 v18 = &_os_log_internal;
      id v19 = &_os_log_internal;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = [(MTRPluginClientConnection *)self pluginClient];
        *(_DWORD *)buf = 138412802;
        v33 = self;
        __int16 v34 = 2048;
        uint64_t v35 = 3;
        __int16 v36 = 2112;
        v37 = v20;
        _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ delegate denied access to operation: %ld for %@", buf, 0x20u);
      }
      id v23 = v10;
      id v21 = v23;
      v22 = v21;
      if (v21)
      {
        (*((void (**)(id, void))v21 + 2))(v21, 0);
      }
    }

    _Block_object_dispose(&v28, 8);
  }
}

void __71__MTRPluginClientConnection_deviceController_nodeID_getStateWithReply___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v2 connection:*(void *)(a1 + 32) allowsOperationWithHome:*(void *)(a1 + 40) operationType:3 nodeId:*(void *)(a1 + 48) commandId:0 endpointId:0 clusterId:0 attributeId:0];
}

uint64_t __71__MTRPluginClientConnection_deviceController_nodeID_getStateWithReply___block_invoke_140(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __71__MTRPluginClientConnection_deviceController_nodeID_getStateWithReply___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)deviceController:(id)a3 nodeID:(id)a4 getDeviceCachePrimedWithReply:(id)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(MTRPluginClientConnection *)self homeUUID];
  int v12 = [v8 isEqual:v11];

  if (v12)
  {
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x2020000000;
    char v31 = 0;
    v13 = [(MTRPluginClientConnection *)self delegateQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __83__MTRPluginClientConnection_deviceController_nodeID_getDeviceCachePrimedWithReply___block_invoke;
    block[3] = &unk_2653E6AC8;
    v27 = &v28;
    block[4] = self;
    id v14 = v8;
    id v25 = v14;
    id v15 = v9;
    id v26 = v15;
    dispatch_sync(v13, block);

    if (*((unsigned char *)v29 + 24))
    {
      id v16 = (void *)MEMORY[0x25A290B70]();
      int v17 = [(MTRPluginClientConnection *)self pluginClient];
      [v17 deviceController:v14 nodeID:v15 getDeviceCachePrimedWithReply:v10];
    }
    else
    {
      __int16 v18 = &_os_log_internal;
      id v19 = &_os_log_internal;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = [(MTRPluginClientConnection *)self pluginClient];
        *(_DWORD *)buf = 138412802;
        v33 = self;
        __int16 v34 = 2048;
        uint64_t v35 = 3;
        __int16 v36 = 2112;
        v37 = v20;
        _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ delegate denied access to operation: %ld for %@", buf, 0x20u);
      }
      id v23 = v10;
      id v21 = v23;
      v22 = v21;
      if (v21)
      {
        (*((void (**)(id, void))v21 + 2))(v21, 0);
      }
    }

    _Block_object_dispose(&v28, 8);
  }
}

void __83__MTRPluginClientConnection_deviceController_nodeID_getDeviceCachePrimedWithReply___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v2 connection:*(void *)(a1 + 32) allowsOperationWithHome:*(void *)(a1 + 40) operationType:3 nodeId:*(void *)(a1 + 48) commandId:0 endpointId:0 clusterId:0 attributeId:0];
}

uint64_t __83__MTRPluginClientConnection_deviceController_nodeID_getDeviceCachePrimedWithReply___block_invoke_141(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __83__MTRPluginClientConnection_deviceController_nodeID_getDeviceCachePrimedWithReply___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)deviceController:(id)a3 nodeID:(id)a4 getEstimatedStartTimeWithReply:(id)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(MTRPluginClientConnection *)self homeUUID];
  int v12 = [v8 isEqual:v11];

  if (v12)
  {
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x2020000000;
    char v31 = 0;
    v13 = [(MTRPluginClientConnection *)self delegateQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __84__MTRPluginClientConnection_deviceController_nodeID_getEstimatedStartTimeWithReply___block_invoke;
    block[3] = &unk_2653E6AC8;
    v27 = &v28;
    block[4] = self;
    id v14 = v8;
    id v25 = v14;
    id v15 = v9;
    id v26 = v15;
    dispatch_sync(v13, block);

    if (*((unsigned char *)v29 + 24))
    {
      id v16 = (void *)MEMORY[0x25A290B70]();
      int v17 = [(MTRPluginClientConnection *)self pluginClient];
      [v17 deviceController:v14 nodeID:v15 getEstimatedStartTimeWithReply:v10];
    }
    else
    {
      __int16 v18 = &_os_log_internal;
      id v19 = &_os_log_internal;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = [(MTRPluginClientConnection *)self pluginClient];
        *(_DWORD *)buf = 138412802;
        v33 = self;
        __int16 v34 = 2048;
        uint64_t v35 = 3;
        __int16 v36 = 2112;
        v37 = v20;
        _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ delegate denied access to operation: %ld for %@", buf, 0x20u);
      }
      id v23 = v10;
      id v21 = v23;
      v22 = v21;
      if (v21)
      {
        (*((void (**)(id, void))v21 + 2))(v21, 0);
      }
    }

    _Block_object_dispose(&v28, 8);
  }
}

void __84__MTRPluginClientConnection_deviceController_nodeID_getEstimatedStartTimeWithReply___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v2 connection:*(void *)(a1 + 32) allowsOperationWithHome:*(void *)(a1 + 40) operationType:3 nodeId:*(void *)(a1 + 48) commandId:0 endpointId:0 clusterId:0 attributeId:0];
}

uint64_t __84__MTRPluginClientConnection_deviceController_nodeID_getEstimatedStartTimeWithReply___block_invoke_142(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __84__MTRPluginClientConnection_deviceController_nodeID_getEstimatedStartTimeWithReply___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)deviceController:(id)a3 nodeID:(id)a4 getEstimatedSubscriptionLatencyWithReply:(id)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(MTRPluginClientConnection *)self homeUUID];
  int v12 = [v8 isEqual:v11];

  if (v12)
  {
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x2020000000;
    char v31 = 0;
    v13 = [(MTRPluginClientConnection *)self delegateQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __94__MTRPluginClientConnection_deviceController_nodeID_getEstimatedSubscriptionLatencyWithReply___block_invoke;
    block[3] = &unk_2653E6AC8;
    v27 = &v28;
    block[4] = self;
    id v14 = v8;
    id v25 = v14;
    id v15 = v9;
    id v26 = v15;
    dispatch_sync(v13, block);

    if (*((unsigned char *)v29 + 24))
    {
      id v16 = (void *)MEMORY[0x25A290B70]();
      int v17 = [(MTRPluginClientConnection *)self pluginClient];
      [v17 deviceController:v14 nodeID:v15 getEstimatedSubscriptionLatencyWithReply:v10];
    }
    else
    {
      __int16 v18 = &_os_log_internal;
      id v19 = &_os_log_internal;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = [(MTRPluginClientConnection *)self pluginClient];
        *(_DWORD *)buf = 138412802;
        v33 = self;
        __int16 v34 = 2048;
        uint64_t v35 = 3;
        __int16 v36 = 2112;
        v37 = v20;
        _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ delegate denied access to operation: %ld for %@", buf, 0x20u);
      }
      id v23 = v10;
      id v21 = v23;
      v22 = v21;
      if (v21)
      {
        (*((void (**)(id, void))v21 + 2))(v21, 0);
      }
    }

    _Block_object_dispose(&v28, 8);
  }
}

void __94__MTRPluginClientConnection_deviceController_nodeID_getEstimatedSubscriptionLatencyWithReply___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v2 connection:*(void *)(a1 + 32) allowsOperationWithHome:*(void *)(a1 + 40) operationType:3 nodeId:*(void *)(a1 + 48) commandId:0 endpointId:0 clusterId:0 attributeId:0];
}

uint64_t __94__MTRPluginClientConnection_deviceController_nodeID_getEstimatedSubscriptionLatencyWithReply___block_invoke_143(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __94__MTRPluginClientConnection_deviceController_nodeID_getEstimatedSubscriptionLatencyWithReply___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)deviceController:(id)a3 nodeID:(id)a4 readAttributeWithEndpointID:(id)a5 clusterID:(id)a6 attributeID:(id)a7 params:(id)a8 withReply:(id)a9
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v32 = a4;
  id v33 = a5;
  id v34 = a6;
  id v16 = a7;
  id v31 = a8;
  id v17 = a9;
  __int16 v18 = [(MTRPluginClientConnection *)self homeUUID];
  LODWORD(a7) = [v15 isEqual:v18];

  if (a7)
  {
    uint64_t v44 = 0;
    v45 = &v44;
    uint64_t v46 = 0x2020000000;
    char v47 = 0;
    id v19 = [(MTRPluginClientConnection *)self delegateQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __120__MTRPluginClientConnection_deviceController_nodeID_readAttributeWithEndpointID_clusterID_attributeID_params_withReply___block_invoke;
    block[3] = &unk_2653E6B18;
    v43 = &v44;
    block[4] = self;
    id v20 = v15;
    id v38 = v20;
    id v21 = v32;
    id v39 = v21;
    id v22 = v33;
    id v40 = v22;
    id v23 = v34;
    id v41 = v23;
    id v24 = v16;
    id v42 = v24;
    dispatch_sync(v19, block);

    if (*((unsigned char *)v45 + 24))
    {
      id v25 = (void *)MEMORY[0x25A290B70]();
      id v26 = [(MTRPluginClientConnection *)self pluginClient];
      [v26 deviceController:v20 nodeID:v21 readAttributeWithEndpointID:v22 clusterID:v23 attributeID:v24 params:v31 withReply:v17];
    }
    else
    {
      v27 = &_os_log_internal;
      id v28 = &_os_log_internal;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v29 = [(MTRPluginClientConnection *)self pluginClient];
        *(_DWORD *)buf = 138412802;
        v49 = self;
        __int16 v50 = 2048;
        uint64_t v51 = 4;
        __int16 v52 = 2112;
        v53 = v29;
        _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ delegate denied access to operation: %ld for %@", buf, 0x20u);
      }
      id v36 = v17;
      id v30 = v36;
      uint64_t v35 = v30;
      if (v30)
      {
        (*((void (**)(id, void))v30 + 2))(v30, 0);
      }
    }

    _Block_object_dispose(&v44, 8);
  }
}

void __120__MTRPluginClientConnection_deviceController_nodeID_readAttributeWithEndpointID_clusterID_attributeID_params_withReply___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = [v2 connection:*(void *)(a1 + 32) allowsOperationWithHome:*(void *)(a1 + 40) operationType:4 nodeId:*(void *)(a1 + 48) commandId:0 endpointId:*(void *)(a1 + 56) clusterId:*(void *)(a1 + 64) attributeId:*(void *)(a1 + 72)];
}

uint64_t __120__MTRPluginClientConnection_deviceController_nodeID_readAttributeWithEndpointID_clusterID_attributeID_params_withReply___block_invoke_144(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __120__MTRPluginClientConnection_deviceController_nodeID_readAttributeWithEndpointID_clusterID_attributeID_params_withReply___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)deviceController:(id)a3 nodeID:(id)a4 readAttributePaths:(id)a5 withReply:(id)a6
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(MTRPluginClientConnection *)self homeUUID];
  int v15 = [v10 isEqual:v14];

  if (v15)
  {
    uint64_t v35 = 0;
    id v36 = &v35;
    uint64_t v37 = 0x2020000000;
    char v38 = 0;
    id v16 = [(MTRPluginClientConnection *)self delegateQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __82__MTRPluginClientConnection_deviceController_nodeID_readAttributePaths_withReply___block_invoke;
    block[3] = &unk_2653E6AC8;
    id v34 = &v35;
    block[4] = self;
    id v17 = v10;
    id v32 = v17;
    id v18 = v11;
    id v33 = v18;
    dispatch_sync(v16, block);

    if (*((unsigned char *)v36 + 24))
    {
      id v19 = (void *)MEMORY[0x25A290B70]();
      id v20 = [(MTRPluginClientConnection *)self pluginClient];
      [v20 deviceController:v17 nodeID:v18 readAttributePaths:v12 withReply:v13];
    }
    else
    {
      id v21 = &_os_log_internal;
      id v22 = &_os_log_internal;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        id v23 = [(MTRPluginClientConnection *)self pluginClient];
        *(_DWORD *)buf = 138412802;
        id v40 = self;
        __int16 v41 = 2048;
        uint64_t v42 = 4;
        __int16 v43 = 2112;
        uint64_t v44 = v23;
        _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ delegate denied access to operation: %ld for %@", buf, 0x20u);
      }
      uint64_t v26 = MEMORY[0x263EF8330];
      uint64_t v27 = 3221225472;
      id v28 = __82__MTRPluginClientConnection_deviceController_nodeID_readAttributePaths_withReply___block_invoke_145;
      v29 = &unk_2653E6AF0;
      id v30 = v13;
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __82__MTRPluginClientConnection_deviceController_nodeID_readAttributePaths_withReply___block_invoke_2;
      v24[3] = &unk_2653E6AF0;
      id v25 = v30;
      __82__MTRPluginClientConnection_deviceController_nodeID_readAttributePaths_withReply___block_invoke_2((uint64_t)v24);
    }
    _Block_object_dispose(&v35, 8);
  }
}

void __82__MTRPluginClientConnection_deviceController_nodeID_readAttributePaths_withReply___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v2 connection:*(void *)(a1 + 32) allowsOperationWithHome:*(void *)(a1 + 40) operationType:4 nodeId:*(void *)(a1 + 48) commandId:0 endpointId:0 clusterId:0 attributeId:0];
}

void __82__MTRPluginClientConnection_deviceController_nodeID_readAttributePaths_withReply___block_invoke_145(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    id v2 = [MEMORY[0x263EFF8C0] array];
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }
}

void __82__MTRPluginClientConnection_deviceController_nodeID_readAttributePaths_withReply___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    id v2 = [MEMORY[0x263EFF8C0] array];
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }
}

- (void)deviceController:(id)a3 nodeID:(id)a4 writeAttributeWithEndpointID:(id)a5 clusterID:(id)a6 attributeID:(id)a7 value:(id)a8 expectedValueInterval:(id)a9 timedWriteTimeout:(id)a10
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v33 = a4;
  id v34 = a5;
  id v35 = a6;
  id v17 = a7;
  id v31 = a8;
  id v32 = a9;
  id v18 = a10;
  id v19 = [(MTRPluginClientConnection *)self homeUUID];
  LODWORD(a7) = [v16 isEqual:v19];

  if (a7)
  {
    uint64_t v43 = 0;
    uint64_t v44 = &v43;
    uint64_t v45 = 0x2020000000;
    char v46 = 0;
    id v20 = [(MTRPluginClientConnection *)self delegateQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __150__MTRPluginClientConnection_deviceController_nodeID_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout___block_invoke;
    block[3] = &unk_2653E6B18;
    uint64_t v42 = &v43;
    block[4] = self;
    id v21 = v16;
    id v37 = v21;
    id v22 = v33;
    id v38 = v22;
    id v23 = v34;
    id v39 = v23;
    id v24 = v35;
    id v40 = v24;
    id v25 = v17;
    id v41 = v25;
    dispatch_sync(v20, block);

    if (*((unsigned char *)v44 + 24))
    {
      uint64_t v26 = (void *)MEMORY[0x25A290B70]();
      uint64_t v27 = [(MTRPluginClientConnection *)self pluginClient];
      [v27 deviceController:v21 nodeID:v22 writeAttributeWithEndpointID:v23 clusterID:v24 attributeID:v25 value:v31 expectedValueInterval:v32 timedWriteTimeout:v18];
    }
    else
    {
      id v28 = &_os_log_internal;
      id v29 = &_os_log_internal;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        id v30 = [(MTRPluginClientConnection *)self pluginClient];
        *(_DWORD *)buf = 138412802;
        v48 = self;
        __int16 v49 = 2048;
        uint64_t v50 = 5;
        __int16 v51 = 2112;
        __int16 v52 = v30;
        _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ delegate denied access to operation: %ld for %@", buf, 0x20u);
      }
    }

    _Block_object_dispose(&v43, 8);
  }
}

void __150__MTRPluginClientConnection_deviceController_nodeID_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = [v2 connection:*(void *)(a1 + 32) allowsOperationWithHome:*(void *)(a1 + 40) operationType:5 nodeId:*(void *)(a1 + 48) commandId:0 endpointId:*(void *)(a1 + 56) clusterId:*(void *)(a1 + 64) attributeId:*(void *)(a1 + 72)];
}

- (void)deviceController:(id)a3 nodeID:(id)a4 invokeCommandWithEndpointID:(id)a5 clusterID:(id)a6 commandID:(id)a7 commandFields:(id)a8 expectedValues:(id)a9 expectedValueInterval:(id)a10 timedInvokeTimeout:(id)a11 serverSideProcessingTimeout:(id)a12 completion:(id)a13
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v19 = a3;
  id v39 = a4;
  id v40 = a5;
  id v41 = a6;
  id v42 = a7;
  id v35 = a8;
  id v20 = self;
  id v36 = a9;
  id v37 = a10;
  id v38 = a11;
  id v21 = a12;
  id v22 = a13;
  id v23 = [(MTRPluginClientConnection *)self homeUUID];
  LODWORD(a6) = [v19 isEqual:v23];

  if (a6)
  {
    uint64_t v50 = 0;
    __int16 v51 = &v50;
    uint64_t v52 = 0x2020000000;
    char v53 = 0;
    id v24 = [(MTRPluginClientConnection *)self delegateQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __210__MTRPluginClientConnection_deviceController_nodeID_invokeCommandWithEndpointID_clusterID_commandID_commandFields_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_completion___block_invoke;
    block[3] = &unk_2653E6B18;
    __int16 v49 = &v50;
    block[4] = self;
    id v25 = v19;
    id v44 = v25;
    id v26 = v39;
    id v45 = v26;
    id v27 = v42;
    id v46 = v27;
    id v28 = v40;
    id v47 = v28;
    id v29 = v41;
    id v48 = v29;
    dispatch_sync(v24, block);

    if (*((unsigned char *)v51 + 24))
    {
      id v30 = (void *)MEMORY[0x25A290B70]();
      id v31 = [(MTRPluginClientConnection *)v20 pluginClient];
      [v31 deviceController:v25 nodeID:v26 invokeCommandWithEndpointID:v28 clusterID:v29 commandID:v27 commandFields:v35 expectedValues:v36 expectedValueInterval:v37 timedInvokeTimeout:v38 serverSideProcessingTimeout:v21 completion:v22];
    }
    else
    {
      id v32 = &_os_log_internal;
      id v33 = &_os_log_internal;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        id v34 = [(MTRPluginClientConnection *)v20 pluginClient];
        *(_DWORD *)buf = 138412802;
        v55 = v20;
        __int16 v56 = 2048;
        uint64_t v57 = 6;
        __int16 v58 = 2112;
        v59 = v34;
        _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ delegate denied access to operation: %ld for %@", buf, 0x20u);
      }
    }

    _Block_object_dispose(&v50, 8);
  }
}

void __210__MTRPluginClientConnection_deviceController_nodeID_invokeCommandWithEndpointID_clusterID_commandID_commandFields_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = [v2 connection:*(void *)(a1 + 32) allowsOperationWithHome:*(void *)(a1 + 40) operationType:6 nodeId:*(void *)(a1 + 48) commandId:*(void *)(a1 + 56) endpointId:*(void *)(a1 + 64) clusterId:*(void *)(a1 + 72) attributeId:0];
}

- (void)deviceController:(id)a3 nodeID:(id)a4 openCommissioningWindowWithSetupPasscode:(id)a5 discriminator:(id)a6 duration:(id)a7 completion:(id)a8
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = [(MTRPluginClientConnection *)self homeUUID];
  int v21 = [v14 isEqual:v20];

  if (v21)
  {
    uint64_t v41 = 0;
    id v42 = &v41;
    uint64_t v43 = 0x2020000000;
    char v44 = 0;
    id v22 = [(MTRPluginClientConnection *)self delegateQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __128__MTRPluginClientConnection_deviceController_nodeID_openCommissioningWindowWithSetupPasscode_discriminator_duration_completion___block_invoke;
    block[3] = &unk_2653E6AC8;
    id v40 = &v41;
    block[4] = self;
    id v23 = v14;
    id v38 = v23;
    id v24 = v15;
    id v39 = v24;
    dispatch_sync(v22, block);

    if (*((unsigned char *)v42 + 24))
    {
      id v25 = (void *)MEMORY[0x25A290B70]();
      id v26 = [(MTRPluginClientConnection *)self pluginClient];
      [v26 deviceController:v23 nodeID:v24 openCommissioningWindowWithSetupPasscode:v16 discriminator:v17 duration:v18 completion:v19];
    }
    else
    {
      id v27 = &_os_log_internal;
      id v28 = &_os_log_internal;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        id v29 = [(MTRPluginClientConnection *)self pluginClient];
        *(_DWORD *)buf = 138412802;
        id v46 = self;
        __int16 v47 = 2048;
        uint64_t v48 = 7;
        __int16 v49 = 2112;
        uint64_t v50 = v29;
        _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ delegate denied access to operation: %ld for %@", buf, 0x20u);
      }
      uint64_t v32 = MEMORY[0x263EF8330];
      uint64_t v33 = 3221225472;
      id v34 = __128__MTRPluginClientConnection_deviceController_nodeID_openCommissioningWindowWithSetupPasscode_discriminator_duration_completion___block_invoke_156;
      id v35 = &unk_2653E6AF0;
      id v36 = v19;
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __128__MTRPluginClientConnection_deviceController_nodeID_openCommissioningWindowWithSetupPasscode_discriminator_duration_completion___block_invoke_2;
      v30[3] = &unk_2653E6AF0;
      id v31 = v36;
      __128__MTRPluginClientConnection_deviceController_nodeID_openCommissioningWindowWithSetupPasscode_discriminator_duration_completion___block_invoke_2((uint64_t)v30);
    }
    _Block_object_dispose(&v41, 8);
  }
}

void __128__MTRPluginClientConnection_deviceController_nodeID_openCommissioningWindowWithSetupPasscode_discriminator_duration_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v2 connection:*(void *)(a1 + 32) allowsOperationWithHome:*(void *)(a1 + 40) operationType:7 nodeId:*(void *)(a1 + 48) commandId:0 endpointId:0 clusterId:0 attributeId:0];
}

void __128__MTRPluginClientConnection_deviceController_nodeID_openCommissioningWindowWithSetupPasscode_discriminator_duration_completion___block_invoke_156(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    id v2 = [MEMORY[0x263F087E8] errorWithDomain:@"kMTRPluginErrorDomain" code:-1009 userInfo:0];
    (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
  }
}

void __128__MTRPluginClientConnection_deviceController_nodeID_openCommissioningWindowWithSetupPasscode_discriminator_duration_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    id v2 = [MEMORY[0x263F087E8] errorWithDomain:@"kMTRPluginErrorDomain" code:-1009 userInfo:0];
    (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
  }
}

- (void)deviceController:(id)a3 nodeID:(id)a4 downloadLogOfType:(int64_t)a5 timeout:(double)a6 completion:(id)a7
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  id v15 = [(MTRPluginClientConnection *)self homeUUID];
  int v16 = [v12 isEqual:v15];

  if (v16)
  {
    uint64_t v36 = 0;
    id v37 = &v36;
    uint64_t v38 = 0x2020000000;
    char v39 = 0;
    id v17 = [(MTRPluginClientConnection *)self delegateQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __90__MTRPluginClientConnection_deviceController_nodeID_downloadLogOfType_timeout_completion___block_invoke;
    block[3] = &unk_2653E6AC8;
    id v35 = &v36;
    block[4] = self;
    id v18 = v12;
    id v33 = v18;
    id v19 = v13;
    id v34 = v19;
    dispatch_sync(v17, block);

    if (*((unsigned char *)v37 + 24))
    {
      id v20 = (void *)MEMORY[0x25A290B70]();
      int v21 = [(MTRPluginClientConnection *)self pluginClient];
      [v21 deviceController:v18 nodeID:v19 downloadLogOfType:a5 timeout:v14 completion:a6];
    }
    else
    {
      id v22 = &_os_log_internal;
      id v23 = &_os_log_internal;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        id v24 = [(MTRPluginClientConnection *)self pluginClient];
        *(_DWORD *)buf = 138412802;
        uint64_t v41 = self;
        __int16 v42 = 2048;
        uint64_t v43 = 9;
        __int16 v44 = 2112;
        id v45 = v24;
        _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ delegate denied access to operation: %ld for %@", buf, 0x20u);
      }
      uint64_t v27 = MEMORY[0x263EF8330];
      uint64_t v28 = 3221225472;
      id v29 = __90__MTRPluginClientConnection_deviceController_nodeID_downloadLogOfType_timeout_completion___block_invoke_157;
      id v30 = &unk_2653E6AF0;
      id v31 = v14;
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __90__MTRPluginClientConnection_deviceController_nodeID_downloadLogOfType_timeout_completion___block_invoke_2;
      v25[3] = &unk_2653E6AF0;
      id v26 = v31;
      __90__MTRPluginClientConnection_deviceController_nodeID_downloadLogOfType_timeout_completion___block_invoke_2((uint64_t)v25);
    }
    _Block_object_dispose(&v36, 8);
  }
}

void __90__MTRPluginClientConnection_deviceController_nodeID_downloadLogOfType_timeout_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v2 connection:*(void *)(a1 + 32) allowsOperationWithHome:*(void *)(a1 + 40) operationType:9 nodeId:*(void *)(a1 + 48) commandId:0 endpointId:0 clusterId:0 attributeId:0];
}

void __90__MTRPluginClientConnection_deviceController_nodeID_downloadLogOfType_timeout_completion___block_invoke_157(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    id v2 = [MEMORY[0x263F087E8] errorWithDomain:@"kMTRPluginErrorDomain" code:-1009 userInfo:0];
    (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
  }
}

void __90__MTRPluginClientConnection_deviceController_nodeID_downloadLogOfType_timeout_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    id v2 = [MEMORY[0x263F087E8] errorWithDomain:@"kMTRPluginErrorDomain" code:-1009 userInfo:0];
    (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
  }
}

- (void)deviceController:(id)a3 getIsRunningWithReply:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MTRPluginClientConnection *)self homeUUID];
  int v9 = [v6 isEqual:v8];

  if (v9)
  {
    uint64_t v23 = 0;
    id v24 = &v23;
    uint64_t v25 = 0x2020000000;
    char v26 = 0;
    id v10 = [(MTRPluginClientConnection *)self delegateQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __68__MTRPluginClientConnection_deviceController_getIsRunningWithReply___block_invoke;
    block[3] = &unk_2653E6B40;
    id v22 = &v23;
    block[4] = self;
    id v11 = v6;
    id v21 = v11;
    dispatch_sync(v10, block);

    if (*((unsigned char *)v24 + 24))
    {
      id v12 = (void *)MEMORY[0x25A290B70]();
      id v13 = [(MTRPluginClientConnection *)self pluginClient];
      [v13 deviceController:v11 getIsRunningWithReply:v7];
    }
    else
    {
      id v14 = &_os_log_internal;
      id v15 = &_os_log_internal;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = [(MTRPluginClientConnection *)self pluginClient];
        *(_DWORD *)buf = 138412802;
        uint64_t v28 = self;
        __int16 v29 = 2048;
        uint64_t v30 = 3;
        __int16 v31 = 2112;
        uint64_t v32 = v16;
        _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ delegate denied access to operation: %ld for %@", buf, 0x20u);
      }
      id v19 = v7;
      id v17 = v19;
      id v18 = v17;
      if (v17)
      {
        (*((void (**)(id, void))v17 + 2))(v17, 0);
      }
    }

    _Block_object_dispose(&v23, 8);
  }
}

void __68__MTRPluginClientConnection_deviceController_getIsRunningWithReply___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 connection:*(void *)(a1 + 32) allowsOperationWithHome:*(void *)(a1 + 40) operationType:3 nodeId:0 commandId:0 endpointId:0 clusterId:0 attributeId:0];
}

uint64_t __68__MTRPluginClientConnection_deviceController_getIsRunningWithReply___block_invoke_158(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __68__MTRPluginClientConnection_deviceController_getIsRunningWithReply___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)deviceController:(id)a3 getUniqueIdentifierWithReply:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MTRPluginClientConnection *)self homeUUID];
  int v9 = [v6 isEqual:v8];

  if (v9)
  {
    uint64_t v23 = 0;
    id v24 = &v23;
    uint64_t v25 = 0x2020000000;
    char v26 = 0;
    id v10 = [(MTRPluginClientConnection *)self delegateQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __75__MTRPluginClientConnection_deviceController_getUniqueIdentifierWithReply___block_invoke;
    block[3] = &unk_2653E6B40;
    id v22 = &v23;
    block[4] = self;
    id v11 = v6;
    id v21 = v11;
    dispatch_sync(v10, block);

    if (*((unsigned char *)v24 + 24))
    {
      id v12 = (void *)MEMORY[0x25A290B70]();
      id v13 = [(MTRPluginClientConnection *)self pluginClient];
      [v13 deviceController:v11 getUniqueIdentifierWithReply:v7];
    }
    else
    {
      id v14 = &_os_log_internal;
      id v15 = &_os_log_internal;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = [(MTRPluginClientConnection *)self pluginClient];
        *(_DWORD *)buf = 138412802;
        uint64_t v28 = self;
        __int16 v29 = 2048;
        uint64_t v30 = 3;
        __int16 v31 = 2112;
        uint64_t v32 = v16;
        _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ delegate denied access to operation: %ld for %@", buf, 0x20u);
      }
      id v19 = v7;
      id v17 = v19;
      id v18 = v17;
      if (v17)
      {
        (*((void (**)(id, void))v17 + 2))(v17, 0);
      }
    }

    _Block_object_dispose(&v23, 8);
  }
}

void __75__MTRPluginClientConnection_deviceController_getUniqueIdentifierWithReply___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 connection:*(void *)(a1 + 32) allowsOperationWithHome:*(void *)(a1 + 40) operationType:3 nodeId:0 commandId:0 endpointId:0 clusterId:0 attributeId:0];
}

uint64_t __75__MTRPluginClientConnection_deviceController_getUniqueIdentifierWithReply___block_invoke_159(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __75__MTRPluginClientConnection_deviceController_getUniqueIdentifierWithReply___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)deviceController:(id)a3 controllerNodeIDWithReply:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MTRPluginClientConnection *)self homeUUID];
  int v9 = [v6 isEqual:v8];

  if (v9)
  {
    uint64_t v23 = 0;
    id v24 = &v23;
    uint64_t v25 = 0x2020000000;
    char v26 = 0;
    id v10 = [(MTRPluginClientConnection *)self delegateQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __72__MTRPluginClientConnection_deviceController_controllerNodeIDWithReply___block_invoke;
    block[3] = &unk_2653E6B40;
    id v22 = &v23;
    block[4] = self;
    id v11 = v6;
    id v21 = v11;
    dispatch_sync(v10, block);

    if (*((unsigned char *)v24 + 24))
    {
      id v12 = (void *)MEMORY[0x25A290B70]();
      id v13 = [(MTRPluginClientConnection *)self pluginClient];
      [v13 deviceController:v11 controllerNodeIDWithReply:v7];
    }
    else
    {
      id v14 = &_os_log_internal;
      id v15 = &_os_log_internal;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = [(MTRPluginClientConnection *)self pluginClient];
        *(_DWORD *)buf = 138412802;
        uint64_t v28 = self;
        __int16 v29 = 2048;
        uint64_t v30 = 3;
        __int16 v31 = 2112;
        uint64_t v32 = v16;
        _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ delegate denied access to operation: %ld for %@", buf, 0x20u);
      }
      id v19 = v7;
      id v17 = v19;
      id v18 = v17;
      if (v17)
      {
        (*((void (**)(id, void))v17 + 2))(v17, 0);
      }
    }

    _Block_object_dispose(&v23, 8);
  }
}

void __72__MTRPluginClientConnection_deviceController_controllerNodeIDWithReply___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 connection:*(void *)(a1 + 32) allowsOperationWithHome:*(void *)(a1 + 40) operationType:3 nodeId:0 commandId:0 endpointId:0 clusterId:0 attributeId:0];
}

uint64_t __72__MTRPluginClientConnection_deviceController_controllerNodeIDWithReply___block_invoke_160(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __72__MTRPluginClientConnection_deviceController_controllerNodeIDWithReply___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)deviceController:(id)a3 updateControllerConfiguration:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MTRPluginClientConnection *)self homeUUID];

  if (v8)
  {
    int v9 = [(MTRPluginClientConnection *)self homeUUID];
    char v10 = [v9 isEqual:v6];

    if ((v10 & 1) == 0)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v6;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = self;
        _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " *** Ignoring new home UUID: %@ for connection: %@, and invalidating", buf, 0x16u);
      }
      [(MTRPluginClientConnection *)self invalidate];
      goto LABEL_15;
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v6;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = self;
      _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " => Assigning home UUID: %@ to connection: %@", buf, 0x16u);
    }
    [(MTRPluginClientConnection *)self setHomeUUID:v6];
    id v11 = [(MTRPluginClientConnection *)self pluginClient];
    [v11 setHomeUUID:v6];
  }
  id v12 = [(MTRPluginClientConnection *)self homeUUID];
  int v13 = [v6 isEqual:v12];

  if (v13)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v29 = 0;
    id v14 = [(MTRPluginClientConnection *)self delegateQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __76__MTRPluginClientConnection_deviceController_updateControllerConfiguration___block_invoke;
    block[3] = &unk_2653E6B40;
    id v21 = buf;
    block[4] = self;
    id v15 = v6;
    id v20 = v15;
    dispatch_sync(v14, block);

    if (*(unsigned char *)(*(void *)&buf[8] + 24))
    {
      int v16 = [(MTRPluginClientConnection *)self pluginClient];
      [v16 deviceController:v15 updateControllerConfiguration:v7];
    }
    else
    {
      int v16 = &_os_log_internal;
      id v17 = &_os_log_internal;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = [(MTRPluginClientConnection *)self pluginClient];
        *(_DWORD *)id v22 = 138412802;
        uint64_t v23 = self;
        __int16 v24 = 2048;
        uint64_t v25 = 1;
        __int16 v26 = 2112;
        uint64_t v27 = v18;
        _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ delegate denied access to operation: %ld for %@", v22, 0x20u);

        int v16 = &_os_log_internal;
      }
    }

    _Block_object_dispose(buf, 8);
  }
LABEL_15:
}

void __76__MTRPluginClientConnection_deviceController_updateControllerConfiguration___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 connection:*(void *)(a1 + 32) allowsOperationWithHome:*(void *)(a1 + 40) operationType:1 nodeId:0 commandId:0 endpointId:0 clusterId:0 attributeId:0];
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConnection:(id)a3
{
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (BOOL)backgroundModeEntitled
{
  return self->_backgroundModeEntitled;
}

- (void)setBackgroundModeEntitled:(BOOL)a3
{
  self->_backgroundModeEntitled = a3;
}

- (NSDictionary)context
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setContext:(id)a3
{
}

- (NSUUID)homeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void)setHomeUUID:(id)a3
{
}

- (NSUUID)sessionID
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSessionID:(id)a3
{
}

- (MTRPluginClientConnectionDelegate)delegate
{
  return (MTRPluginClientConnectionDelegate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDelegateQueue:(id)a3
{
}

- (MTRPluginClient)pluginClient
{
  return (MTRPluginClient *)objc_getProperty(self, a2, 72, 1);
}

- (void)setPluginClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluginClient, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __85__MTRPluginClientConnection__deliverMessagePayloadToPrimaryResident_responseHandler___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_ERROR, " *** Failed to sendMessage to primary home hub with error: %@", (uint8_t *)&v1, 0xCu);
}

@end