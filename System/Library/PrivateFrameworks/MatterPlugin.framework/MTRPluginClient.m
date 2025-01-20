@interface MTRPluginClient
- (BOOL)isInRemoteMode;
- (BOOL)respondsToSelector:(SEL)a3;
- (MTRPluginClient)initWithXPCConnection:(id)a3 sessionID:(id)a4 queue:(id)a5;
- (MTRPluginClientXPCProxy)clientProxy;
- (MTRPluginLocalClient)localClient;
- (MTRPluginRemoteClient)remoteClient;
- (NSDictionary)controllerConfiguration;
- (NSMutableDictionary)context;
- (NSMutableDictionary)delegateProxies;
- (NSMutableSet)registeredNodeIDs;
- (NSMutableSet)subscribedMTRDevices;
- (NSString)description;
- (NSUUID)homeUUID;
- (NSUUID)sessionID;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)workQueue;
- (OS_dispatch_source)updateControllerConfigurationTimer;
- (id)_currentTarget;
- (id)_localTarget;
- (id)_remoteTarget;
- (id)forwardingTargetForSelector:(SEL)a3;
- (void)dealloc;
- (void)deviceController:(id)a3 controllerNodeIDWithReply:(id)a4;
- (void)deviceController:(id)a3 getIsRunningWithReply:(id)a4;
- (void)deviceController:(id)a3 getUniqueIdentifierWithReply:(id)a4;
- (void)deviceController:(id)a3 nodeID:(id)a4 downloadLogOfType:(int64_t)a5 timeout:(double)a6 completion:(id)a7;
- (void)deviceController:(id)a3 nodeID:(id)a4 getDeviceCachePrimedWithReply:(id)a5;
- (void)deviceController:(id)a3 nodeID:(id)a4 getEstimatedStartTimeWithReply:(id)a5;
- (void)deviceController:(id)a3 nodeID:(id)a4 getEstimatedSubscriptionLatencyWithReply:(id)a5;
- (void)deviceController:(id)a3 nodeID:(id)a4 getStateWithReply:(id)a5;
- (void)deviceController:(id)a3 nodeID:(id)a4 invokeCommandWithEndpointID:(id)a5 clusterID:(id)a6 commandID:(id)a7 commandFields:(id)a8 expectedValues:(id)a9 expectedValueInterval:(id)a10 timedInvokeTimeout:(id)a11 serverSideProcessingTimeout:(id)a12 completion:(id)a13;
- (void)deviceController:(id)a3 nodeID:(id)a4 readAttributePaths:(id)a5 withReply:(id)a6;
- (void)deviceController:(id)a3 nodeID:(id)a4 readAttributeWithEndpointID:(id)a5 clusterID:(id)a6 attributeID:(id)a7 params:(id)a8 withReply:(id)a9;
- (void)deviceController:(id)a3 nodeID:(id)a4 writeAttributeWithEndpointID:(id)a5 clusterID:(id)a6 attributeID:(id)a7 value:(id)a8 expectedValueInterval:(id)a9 timedWriteTimeout:(id)a10;
- (void)deviceController:(id)a3 updateControllerConfiguration:(id)a4;
- (void)invalidate;
- (void)setClientProxy:(id)a3;
- (void)setContext:(id)a3;
- (void)setControllerConfiguration:(id)a3;
- (void)setDelegateProxies:(id)a3;
- (void)setHomeUUID:(id)a3;
- (void)setLocalClient:(id)a3;
- (void)setRegisteredNodeIDs:(id)a3;
- (void)setRemoteClient:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setSubscribedMTRDevices:(id)a3;
- (void)setUpdateControllerConfigurationTimer:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)setXpcConnection:(id)a3;
@end

@implementation MTRPluginClient

- (MTRPluginClient)initWithXPCConnection:(id)a3 sessionID:(id)a4 queue:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)MTRPluginClient;
  v11 = [(MTRPluginClient *)&v24 init];
  v12 = v11;
  if (v11)
  {
    [(MTRPluginClient *)v11 setWorkQueue:v10];
    [(MTRPluginClient *)v12 setSessionID:v9];
    v13 = [MEMORY[0x263EFF9C0] set];
    [(MTRPluginClient *)v12 setRegisteredNodeIDs:v13];

    v14 = [MEMORY[0x263EFF9A0] dictionary];
    [(MTRPluginClient *)v12 setContext:v14];

    [(MTRPluginClient *)v12 setXpcConnection:v8];
    v15 = [MEMORY[0x263EFF9A0] dictionary];
    [(MTRPluginClient *)v12 setDelegateProxies:v15];

    v16 = [[MTRPluginClientXPCProxy alloc] initWithClient:v12];
    [(MTRPluginClient *)v12 setClientProxy:v16];

    v17 = [[MTRPluginLocalClient alloc] initWithPluginClient:v12];
    [(MTRPluginClient *)v12 setLocalClient:v17];

    v18 = [MTRPluginRemoteClient alloc];
    v19 = [(MTRPluginClient *)v12 workQueue];
    v20 = [(MTRPluginRemoteClient *)v18 initWithClient:v12 queue:v19];
    [(MTRPluginClient *)v12 setRemoteClient:v20];

    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      v21 = [(MTRPluginClient *)v12 workQueue];
      *(_DWORD *)buf = 138412802;
      v26 = v12;
      __int16 v27 = 2112;
      id v28 = v8;
      __int16 v29 = 2112;
      v30 = v21;
      _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ initialized with xpcConnection %@ queue: %@", buf, 0x20u);
    }
    v22 = v12;
  }

  return v12;
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (objc_class *)objc_opt_class();
    v4 = NSStringFromClass(v3);
    *(_DWORD *)buf = 138412546;
    v7 = v4;
    __int16 v8 = 2048;
    id v9 = self;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ dealloc: %p", buf, 0x16u);
  }
  v5.receiver = self;
  v5.super_class = (Class)MTRPluginClient;
  [(MTRPluginClient *)&v5 dealloc];
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  v6 = [(MTRPluginClient *)self xpcConnection];
  v7 = [(MTRPluginClient *)self xpcConnection];
  __int16 v8 = [v3 stringWithFormat:@"<%@: %p xpc %p pid: %d>", v5, self, v6, objc_msgSend(v7, "processIdentifier")];

  return (NSString *)v8;
}

- (void)invalidate
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    v11 = self;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ invalidate", (uint8_t *)&v10, 0xCu);
  }
  v3 = self;
  objc_sync_enter(v3);
  v4 = [(MTRPluginClient *)v3 localClient];
  [v4 invalidate];

  [(MTRPluginClient *)v3 setLocalClient:0];
  objc_super v5 = [(MTRPluginClient *)v3 remoteClient];
  [v5 invalidate];

  [(MTRPluginClient *)v3 setRemoteClient:0];
  v6 = [MEMORY[0x263EFF9C0] set];
  [(MTRPluginClient *)v3 setRegisteredNodeIDs:v6];

  v7 = [MEMORY[0x263EFF9A0] dictionary];
  [(MTRPluginClient *)v3 setContext:v7];

  __int16 v8 = [(MTRPluginClient *)v3 updateControllerConfigurationTimer];

  if (v8)
  {
    id v9 = [(MTRPluginClient *)v3 updateControllerConfigurationTimer];
    dispatch_source_cancel(v9);

    [(MTRPluginClient *)v3 setUpdateControllerConfigurationTimer:0];
  }
  objc_sync_exit(v3);
}

- (BOOL)isInRemoteMode
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (MTRPluginForceRemoteControl())
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      __int16 v8 = self;
      _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ MatterPlugin is overridden to be in remote mode, forcing YES for isInRemoteMode", (uint8_t *)&v7, 0xCu);
    }
    return 1;
  }
  else
  {
    v4 = self;
    objc_sync_enter(v4);
    objc_super v5 = [(MTRPluginClient *)v4 localClient];
    char v3 = [v5 isSuspended];

    objc_sync_exit(v4);
  }
  return v3;
}

- (id)_localTarget
{
  v2 = self;
  objc_sync_enter(v2);
  char v3 = [(MTRPluginClient *)v2 localClient];
  objc_sync_exit(v2);

  return v3;
}

- (id)_remoteTarget
{
  v2 = self;
  objc_sync_enter(v2);
  char v3 = [(MTRPluginClient *)v2 remoteClient];
  objc_sync_exit(v2);

  return v3;
}

- (id)_currentTarget
{
  v2 = self;
  objc_sync_enter(v2);
  if ([(MTRPluginClient *)v2 isInRemoteMode]) {
    [(MTRPluginClient *)v2 _remoteTarget];
  }
  else {
  char v3 = [(MTRPluginClient *)v2 _localTarget];
  }
  objc_sync_exit(v2);

  return v3;
}

- (void)deviceController:(id)a3 updateControllerConfiguration:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = self;
  objc_sync_enter(v8);
  [(MTRPluginClient *)v8 setControllerConfiguration:v7];
  uint64_t v9 = &_os_log_internal;
  id v10 = &_os_log_internal;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [(MTRPluginClient *)v8 controllerConfiguration];
    *(_DWORD *)buf = 138412802;
    v25 = v8;
    __int16 v26 = 2112;
    id v27 = v6;
    __int16 v28 = 2112;
    __int16 v29 = v11;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ deviceController %@ updateControllerConfiguration %@", buf, 0x20u);
  }
  uint64_t v12 = [(MTRPluginClient *)v8 _localTarget];
  v13 = [(MTRPluginClient *)v8 controllerConfiguration];
  [v12 deviceController:v6 updateControllerConfiguration:v13];

  if ([(MTRPluginClient *)v8 isInRemoteMode])
  {
    v14 = [(MTRPluginClient *)v8 updateControllerConfigurationTimer];
    v15 = (void *)MEMORY[0x263EF83A0];
    id v16 = MEMORY[0x263EF83A0];
    uint64_t v18 = MEMORY[0x263EF8330];
    uint64_t v19 = 3221225472;
    v20 = __66__MTRPluginClient_deviceController_updateControllerConfiguration___block_invoke;
    v21 = &unk_2653E6700;
    v22 = v8;
    id v23 = v6;
    v17 = MTRBufferedExecutionBlock(v14, v15, &v18, 0.5);
    -[MTRPluginClient setUpdateControllerConfigurationTimer:](v8, "setUpdateControllerConfigurationTimer:", v17, v18, v19, v20, v21, v22);
  }
  objc_sync_exit(v8);
}

void __66__MTRPluginClient_deviceController_updateControllerConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    v4 = [v2 controllerConfiguration];
    int v8 = 138412802;
    uint64_t v9 = v2;
    __int16 v10 = 2112;
    uint64_t v11 = v3;
    __int16 v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ deviceController %@ (buffered) updateControllerConfiguration %@", (uint8_t *)&v8, 0x20u);
  }
  objc_super v5 = [*(id *)(a1 + 32) _remoteTarget];
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = [*(id *)(a1 + 32) controllerConfiguration];
  [v5 deviceController:v6 updateControllerConfiguration:v7];
}

- (void)deviceController:(id)a3 nodeID:(id)a4 readAttributeWithEndpointID:(id)a5 clusterID:(id)a6 attributeID:(id)a7 params:(id)a8 withReply:(id)a9
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  v21 = (void (**)(id, void))a9;
  v22 = self;
  objc_sync_enter(v22);
  id v23 = [(MTRPluginClient *)v22 xpcConnection];
  BOOL v24 = +[MTRPluginThirdPartyExclusions attributeReadDisallowedOverXPCWithEndpointID:clusterID:attribute:isPrivatelyEntitled:](MTRPluginThirdPartyExclusions, "attributeReadDisallowedOverXPCWithEndpointID:clusterID:attribute:isPrivatelyEntitled:", v17, v18, v19, +[MTRPluginThirdPartyExclusions connectionIsPrivatelyEntitled:v23]);

  if (v24)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v27 = v17;
      __int16 v28 = 2112;
      id v29 = v18;
      __int16 v30 = 2112;
      id v31 = v19;
      _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ERROR: Attribute read disallowed over XPC: EP %@, Cluster %@, Attribute %@", buf, 0x20u);
    }
    v21[2](v21, 0);
  }
  else
  {
    v25 = [(MTRPluginClient *)v22 _localTarget];
    [v25 deviceController:v15 nodeID:v16 readAttributeWithEndpointID:v17 clusterID:v18 attributeID:v19 params:v20 withReply:v21];
  }
  objc_sync_exit(v22);
}

- (void)deviceController:(id)a3 nodeID:(id)a4 readAttributePaths:(id)a5 withReply:(id)a6
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v26 = a3;
  id v27 = a4;
  id v10 = a5;
  __int16 v28 = (void (**)(id, void))a6;
  __int16 v30 = self;
  objc_sync_enter(v30);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v10;
  uint64_t v11 = [obj countByEnumeratingWithState:&v31 objects:v41 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v32;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        id v15 = [v14 endpoint];
        id v16 = [v14 cluster];
        id v17 = [v14 attribute];
        id v18 = [(MTRPluginClient *)v30 xpcConnection];
        BOOL v19 = +[MTRPluginThirdPartyExclusions attributeReadDisallowedOverXPCWithEndpointID:clusterID:attribute:isPrivatelyEntitled:](MTRPluginThirdPartyExclusions, "attributeReadDisallowedOverXPCWithEndpointID:clusterID:attribute:isPrivatelyEntitled:", v15, v16, v17, +[MTRPluginThirdPartyExclusions connectionIsPrivatelyEntitled:v18]);

        if (v19)
        {
          v21 = &_os_log_internal;
          id v22 = &_os_log_internal;
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            id v23 = [v14 endpoint];
            BOOL v24 = [v14 cluster];
            v25 = [v14 attribute];
            *(_DWORD *)buf = 138412802;
            v36 = v23;
            __int16 v37 = 2112;
            v38 = v24;
            __int16 v39 = 2112;
            v40 = v25;
            _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ERROR: Attribute read disallowed over XPC: EP %@, Cluster %@, Attribute %@", buf, 0x20u);
          }
          v28[2](v28, 0);
          id v20 = obj;
          goto LABEL_13;
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v31 objects:v41 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  id v20 = [(MTRPluginClient *)v30 _localTarget];
  [v20 deviceController:v26 nodeID:v27 readAttributePaths:obj withReply:v28];
LABEL_13:

  objc_sync_exit(v30);
}

- (void)deviceController:(id)a3 nodeID:(id)a4 getStateWithReply:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(MTRPluginClient *)self _currentTarget];
  [v11 deviceController:v10 nodeID:v9 getStateWithReply:v8];
}

- (void)deviceController:(id)a3 nodeID:(id)a4 getDeviceCachePrimedWithReply:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(MTRPluginClient *)self _currentTarget];
  [v11 deviceController:v10 nodeID:v9 getDeviceCachePrimedWithReply:v8];
}

- (void)deviceController:(id)a3 nodeID:(id)a4 getEstimatedStartTimeWithReply:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(MTRPluginClient *)self _currentTarget];
  [v11 deviceController:v10 nodeID:v9 getEstimatedStartTimeWithReply:v8];
}

- (void)deviceController:(id)a3 nodeID:(id)a4 getEstimatedSubscriptionLatencyWithReply:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(MTRPluginClient *)self _currentTarget];
  [v11 deviceController:v10 nodeID:v9 getEstimatedSubscriptionLatencyWithReply:v8];
}

- (void)deviceController:(id)a3 nodeID:(id)a4 downloadLogOfType:(int64_t)a5 timeout:(double)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a4;
  id v14 = a3;
  id v15 = [(MTRPluginClient *)self _currentTarget];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __80__MTRPluginClient_deviceController_nodeID_downloadLogOfType_timeout_completion___block_invoke;
  v17[3] = &unk_2653E6CA8;
  v17[4] = self;
  id v18 = v12;
  id v16 = v12;
  [v15 deviceController:v14 nodeID:v13 downloadLogOfType:a5 timeout:v17 completion:a6];
}

void __80__MTRPluginClient_deviceController_nodeID_downloadLogOfType_timeout_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    uint64_t v24 = v7;
    __int16 v25 = 2112;
    id v26 = v5;
    __int16 v27 = 2112;
    id v28 = v6;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ Log download complete with url: %@ error: %@", buf, 0x20u);
  }
  id v8 = [MEMORY[0x263F08850] defaultManager];
  id v22 = v6;
  id v9 = [v8 URLForDirectory:14 inDomain:1 appropriateForURL:v5 create:0 error:&v22];
  id v10 = v22;

  id v11 = [v9 URLByAppendingPathComponent:@"com.apple.Home"];
  id v12 = [v11 URLByAppendingPathComponent:@"DiagnosticLogs"];

  id v13 = [MEMORY[0x263F08850] defaultManager];
  [v13 createDirectoryAtURL:v12 withIntermediateDirectories:0 attributes:0 error:0];

  id v14 = [v5 lastPathComponent];
  id v15 = [v12 URLByAppendingPathComponent:v14];

  id v16 = [MEMORY[0x263F08850] defaultManager];
  id v21 = 0;
  [v16 copyItemAtURL:v5 toURL:v15 error:&v21];
  id v17 = v21;

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138413058;
    uint64_t v24 = v18;
    __int16 v25 = 2112;
    id v26 = v5;
    __int16 v27 = 2112;
    id v28 = v15;
    __int16 v29 = 2112;
    id v30 = v17;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ Moved %@ to: %@ (error: %@)", buf, 0x2Au);
  }
  if (v17) {
    BOOL v19 = 0;
  }
  else {
    BOOL v19 = v15;
  }
  if (v17) {
    id v20 = v17;
  }
  else {
    id v20 = v10;
  }
  (*(void (**)(void, void *, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v19, v20);
}

- (void)deviceController:(id)a3 getIsRunningWithReply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MTRPluginClient *)self _currentTarget];
  [v8 deviceController:v7 getIsRunningWithReply:v6];
}

- (void)deviceController:(id)a3 getUniqueIdentifierWithReply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MTRPluginClient *)self _localTarget];
  [v8 deviceController:v7 getUniqueIdentifierWithReply:v6];
}

- (void)deviceController:(id)a3 controllerNodeIDWithReply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MTRPluginClient *)self _currentTarget];
  [v8 deviceController:v7 controllerNodeIDWithReply:v6];
}

- (BOOL)respondsToSelector:(SEL)a3
{
  if (MTRPluginCheckProtocolContainsSelector(&unk_27046CF68, a3)) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)MTRPluginClient;
  return [(MTRPluginClient *)&v6 respondsToSelector:a3];
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v10.receiver = self;
  v10.super_class = (Class)MTRPluginClient;
  if (-[MTRPluginClient respondsToSelector:](&v10, sel_respondsToSelector_))
  {
    id v5 = self;
  }
  else if (MTRPluginCheckProtocolContainsSelector(&unk_27046CF68, a3))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v6 = NSStringFromSelector(a3);
      id v7 = [(MTRPluginClient *)self localClient];
      *(_DWORD *)buf = 138412802;
      id v12 = self;
      __int16 v13 = 2112;
      id v14 = v6;
      __int16 v15 = 2112;
      id v16 = v7;
      _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ forwardingTargetForSelector %@ to: %@", buf, 0x20u);
    }
    id v5 = [(MTRPluginClient *)self _currentTarget];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)MTRPluginClient;
    id v5 = [(MTRPluginClient *)&v9 forwardingTargetForSelector:a3];
  }
  return v5;
}

- (void)deviceController:(id)a3 nodeID:(id)a4 writeAttributeWithEndpointID:(id)a5 clusterID:(id)a6 attributeID:(id)a7 value:(id)a8 expectedValueInterval:(id)a9 timedWriteTimeout:(id)a10
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v27 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = [(MTRPluginClient *)self xpcConnection];
  BOOL v24 = +[MTRPluginThirdPartyExclusions attributeWriteDisallowedOverXPCWithEndpointID:clusterID:attribute:isPrivatelyEntitled:](MTRPluginThirdPartyExclusions, "attributeWriteDisallowedOverXPCWithEndpointID:clusterID:attribute:isPrivatelyEntitled:", v17, v18, v19, +[MTRPluginThirdPartyExclusions connectionIsPrivatelyEntitled:v23]);

  if (v24)
  {
    __int16 v25 = v27;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v29 = v17;
      __int16 v30 = 2112;
      id v31 = v18;
      __int16 v32 = 2112;
      id v33 = v19;
      _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ERROR: Attribute write disallowed over XPC: EP %@, Cluster %@, Attribute %@", buf, 0x20u);
    }
  }
  else
  {
    id v26 = [(MTRPluginClient *)self _currentTarget];
    __int16 v25 = v27;
    [v26 deviceController:v27 nodeID:v16 writeAttributeWithEndpointID:v17 clusterID:v18 attributeID:v19 value:v20 expectedValueInterval:v21 timedWriteTimeout:v22];
  }
}

- (void)deviceController:(id)a3 nodeID:(id)a4 invokeCommandWithEndpointID:(id)a5 clusterID:(id)a6 commandID:(id)a7 commandFields:(id)a8 expectedValues:(id)a9 expectedValueInterval:(id)a10 timedInvokeTimeout:(id)a11 serverSideProcessingTimeout:(id)a12 completion:(id)a13
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v38 = a3;
  id v37 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v36 = a8;
  id v41 = a9;
  id v22 = a10;
  id v23 = a11;
  id v24 = a12;
  __int16 v25 = (void (**)(id, void, void *))a13;
  id v26 = self;
  id v27 = [(MTRPluginClient *)self xpcConnection];
  LODWORD(a4) = +[MTRPluginThirdPartyExclusions commandDisallowedOverXPCWithEndpointID:clusterID:commandID:isPrivatelyEntitled:](MTRPluginThirdPartyExclusions, "commandDisallowedOverXPCWithEndpointID:clusterID:commandID:isPrivatelyEntitled:", v19, v20, v21, +[MTRPluginThirdPartyExclusions connectionIsPrivatelyEntitled:v27]);

  __int16 v39 = v24;
  v40 = v23;
  if (!a4)
  {
    __int16 v32 = [(MTRPluginClient *)v26 _currentTarget];
    id v35 = v24;
    id v33 = v22;
    id v34 = v23;
    id v28 = v22;
    id v29 = v37;
    id v31 = v38;
    __int16 v30 = v36;
    objc_msgSend(v32, "deviceController:nodeID:invokeCommandWithEndpointID:clusterID:commandID:commandFields:expectedValues:expectedValueInterval:timedInvokeTimeout:serverSideProcessingTimeout:completion:", v38, v37, v19, v20, v21, v41, v33, v34, v35, v25);
    goto LABEL_7;
  }
  id v28 = v22;
  __int16 v30 = v36;
  id v29 = v37;
  id v31 = v38;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v43 = v19;
    __int16 v44 = 2112;
    id v45 = v20;
    __int16 v46 = 2112;
    id v47 = v21;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ERROR: Command disallowed over XPC: EP %@, Cluster %@, Command %@", buf, 0x20u);
  }
  if (v25)
  {
    __int16 v32 = [MEMORY[0x263F087E8] errorWithDomain:@"kMTRPluginErrorDomain" code:-1009 userInfo:0];
    v25[2](v25, 0, v32);
LABEL_7:
  }
}

- (NSMutableDictionary)context
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setContext:(id)a3
{
}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setXpcConnection:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setWorkQueue:(id)a3
{
}

- (NSUUID)sessionID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSessionID:(id)a3
{
}

- (MTRPluginLocalClient)localClient
{
  return (MTRPluginLocalClient *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLocalClient:(id)a3
{
}

- (MTRPluginRemoteClient)remoteClient
{
  return (MTRPluginRemoteClient *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRemoteClient:(id)a3
{
}

- (MTRPluginClientXPCProxy)clientProxy
{
  return (MTRPluginClientXPCProxy *)objc_getProperty(self, a2, 56, 1);
}

- (void)setClientProxy:(id)a3
{
}

- (NSMutableSet)registeredNodeIDs
{
  return (NSMutableSet *)objc_getProperty(self, a2, 64, 1);
}

- (void)setRegisteredNodeIDs:(id)a3
{
}

- (NSDictionary)controllerConfiguration
{
  return (NSDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setControllerConfiguration:(id)a3
{
}

- (NSUUID)homeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 80, 1);
}

- (void)setHomeUUID:(id)a3
{
}

- (NSMutableDictionary)delegateProxies
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDelegateProxies:(id)a3
{
}

- (NSMutableSet)subscribedMTRDevices
{
  return (NSMutableSet *)objc_getProperty(self, a2, 96, 1);
}

- (void)setSubscribedMTRDevices:(id)a3
{
}

- (OS_dispatch_source)updateControllerConfigurationTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 104, 1);
}

- (void)setUpdateControllerConfigurationTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateControllerConfigurationTimer, 0);
  objc_storeStrong((id *)&self->_subscribedMTRDevices, 0);
  objc_storeStrong((id *)&self->_delegateProxies, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_storeStrong((id *)&self->_controllerConfiguration, 0);
  objc_storeStrong((id *)&self->_registeredNodeIDs, 0);
  objc_storeStrong((id *)&self->_clientProxy, 0);
  objc_storeStrong((id *)&self->_remoteClient, 0);
  objc_storeStrong((id *)&self->_localClient, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end