@interface MTRPluginLocalClient
+ (id)localDispatchQueue;
- (BOOL)isSuspended;
- (MTRPluginClient)pluginClient;
- (MTRPluginLocalClient)initWithPluginClient:(id)a3;
- (NSMutableDictionary)context;
- (NSMutableSet)registeredMTRDeviceControllerIDs;
- (NSMutableSet)registeredNodeIDs;
- (NSMutableSet)subscribedMTRDevices;
- (NSString)description;
- (id)_deviceForControllerUUID:(id)a3 nodeID:(id)a4;
- (id)deviceController;
- (void)_registerDevice:(id)a3;
- (void)_unregisterDevice:(id)a3;
- (void)addDelegateForDevice:(id)a3 interestedPathsForAttributes:(id)a4 interestedPathsForEvents:(id)a5;
- (void)controller:(id)a3 suspendedChangedTo:(BOOL)a4;
- (void)dealloc;
- (void)device:(id)a3 injectAttributeReport:(id)a4;
- (void)device:(id)a3 injectEventReport:(id)a4;
- (void)device:(id)a3 internalStateUpdated:(id)a4;
- (void)device:(id)a3 receivedAttributeReport:(id)a4;
- (void)device:(id)a3 receivedEventReport:(id)a4;
- (void)device:(id)a3 stateChanged:(unint64_t)a4;
- (void)deviceBecameActive:(id)a3;
- (void)deviceCachePrimed:(id)a3;
- (void)deviceConfigurationChanged:(id)a3;
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
- (void)invalidate;
- (void)logState;
- (void)removeDelegateForDevice:(id)a3;
- (void)reportAllAttributesForDevice:(id)a3;
- (void)setContext:(id)a3;
- (void)setPluginClient:(id)a3;
- (void)setRegisteredMTRDeviceControllerIDs:(id)a3;
- (void)setRegisteredNodeIDs:(id)a3;
- (void)setSubscribedMTRDevices:(id)a3;
- (void)setSuspended:(BOOL)a3;
@end

@implementation MTRPluginLocalClient

+ (id)localDispatchQueue
{
  if (localDispatchQueue_predicateNAME != -1) {
    dispatch_once(&localDispatchQueue_predicateNAME, &__block_literal_global_1);
  }
  v2 = (void *)localDispatchQueue_sLocalDispatchQueue;
  return v2;
}

void __42__MTRPluginLocalClient_localDispatchQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("MTRPluginLocalDispatchQueue", v2);
  v1 = (void *)localDispatchQueue_sLocalDispatchQueue;
  localDispatchQueue_sLocalDispatchQueue = (uint64_t)v0;
}

- (MTRPluginLocalClient)initWithPluginClient:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MTRPluginLocalClient;
  v5 = [(MTRPluginLocalClient *)&v13 init];
  v6 = v5;
  if (v5)
  {
    [(MTRPluginLocalClient *)v5 setPluginClient:v4];
    v7 = [MEMORY[0x263EFF9C0] set];
    [(MTRPluginLocalClient *)v6 setRegisteredNodeIDs:v7];

    v8 = [MEMORY[0x263EFF9C0] set];
    [(MTRPluginLocalClient *)v6 setSubscribedMTRDevices:v8];

    v9 = [MEMORY[0x263EFF9C0] set];
    [(MTRPluginLocalClient *)v6 setRegisteredMTRDeviceControllerIDs:v9];

    v10 = [MEMORY[0x263EFF9A0] dictionary];
    [(MTRPluginLocalClient *)v6 setContext:v10];

    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v15 = v6;
      __int16 v16 = 2112;
      id v17 = v4;
      _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ initialized with pluginClient %@", buf, 0x16u);
    }
    v11 = v6;
  }

  return v6;
}

- (void)dealloc
{
  [(MTRPluginLocalClient *)self setPluginClient:0];
  v3.receiver = self;
  v3.super_class = (Class)MTRPluginLocalClient;
  [(MTRPluginLocalClient *)&v3 dealloc];
}

- (void)invalidate
{
  [(MTRPluginLocalClient *)self setPluginClient:0];
  objc_super v3 = +[MTRPluginLocalClient localDispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__MTRPluginLocalClient_invalidate__block_invoke;
  block[3] = &unk_2653E66D8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __34__MTRPluginLocalClient_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "registeredMTRDeviceControllerIDs", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v13 + 1) + 8 * v6);
        v8 = +[MTRPluginDeviceControllerRegistry sharedInstance];
        v9 = [v8 deviceControllerForUUID:v7];

        [v9 removeDeviceControllerDelegate:*(void *)(a1 + 32)];
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }

  v10 = [MEMORY[0x263EFF9C0] set];
  [*(id *)(a1 + 32) setRegisteredNodeIDs:v10];

  v11 = [MEMORY[0x263EFF9C0] set];
  [*(id *)(a1 + 32) setSubscribedMTRDevices:v11];

  v12 = [MEMORY[0x263EFF9C0] set];
  [*(id *)(a1 + 32) setRegisteredMTRDeviceControllerIDs:v12];
}

- (void)_registerDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[MTRPluginLocalClient localDispatchQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__MTRPluginLocalClient__registerDevice___block_invoke;
  v7[3] = &unk_2653E6700;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __40__MTRPluginLocalClient__registerDevice___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    v2 = [*(id *)(a1 + 40) registeredNodeIDs];
    uint64_t v3 = [*(id *)(a1 + 32) nodeID];
    char v4 = [v2 containsObject:v3];

    if ((v4 & 1) == 0)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = *(void **)(a1 + 32);
        uint64_t v5 = *(void **)(a1 + 40);
        int v11 = 138412546;
        v12 = v5;
        __int16 v13 = 2112;
        long long v14 = v6;
        _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@  => registering device: %@", (uint8_t *)&v11, 0x16u);
      }
      uint64_t v7 = [*(id *)(a1 + 40) registeredNodeIDs];
      id v8 = [*(id *)(a1 + 32) nodeID];
      [v7 addObject:v8];

      [*(id *)(a1 + 40) addDelegateForDevice:*(void *)(a1 + 32) interestedPathsForAttributes:0 interestedPathsForEvents:0];
      [*(id *)(a1 + 40) reportAllAttributesForDevice:*(void *)(a1 + 32)];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(void **)(a1 + 40);
        v10 = [v9 registeredNodeIDs];
        int v11 = 138412546;
        v12 = v9;
        __int16 v13 = 2112;
        long long v14 = v10;
        _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "   => %@ Registered nodeIDs: %@", (uint8_t *)&v11, 0x16u);
      }
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "** Tried to register nil device", (uint8_t *)&v11, 2u);
  }
}

- (void)_unregisterDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[MTRPluginLocalClient localDispatchQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__MTRPluginLocalClient__unregisterDevice___block_invoke;
  v7[3] = &unk_2653E6700;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __42__MTRPluginLocalClient__unregisterDevice___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    v2 = [*(id *)(a1 + 40) pluginClient];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = *(void **)(a1 + 32);
      uint64_t v3 = *(void *)(a1 + 40);
      int v12 = 138412546;
      uint64_t v13 = v3;
      __int16 v14 = 2112;
      uint64_t v15 = v4;
      _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@  => unregistering device: %@", (uint8_t *)&v12, 0x16u);
    }
    [*(id *)(a1 + 40) removeDelegateForDevice:*(void *)(a1 + 32)];
    uint64_t v5 = [*(id *)(a1 + 40) registeredNodeIDs];
    id v6 = [*(id *)(a1 + 32) nodeID];
    int v7 = [v5 containsObject:v6];

    if (v7)
    {
      id v8 = [*(id *)(a1 + 40) registeredNodeIDs];
      v9 = [*(id *)(a1 + 32) nodeID];
      [v8 removeObject:v9];
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " => Device wasn't registered, ignoring", (uint8_t *)&v12, 2u);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      int v11 = [v2 registeredNodeIDs];
      int v12 = 138412546;
      uint64_t v13 = v10;
      __int16 v14 = 2112;
      uint64_t v15 = v11;
      _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "   => %@ Registered nodeIDs: %@", (uint8_t *)&v12, 0x16u);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12) = 0;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "** Tried to unregister nil device", (uint8_t *)&v12, 2u);
  }
}

- (id)_deviceForControllerUUID:(id)a3 nodeID:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = +[MTRPluginLocalClient localDispatchQueue];
  dispatch_assert_queue_V2(v8);

  v9 = +[MTRPluginDeviceControllerRegistry sharedInstance];
  uint64_t v10 = [v9 deviceControllerForUUID:v7];

  if (v10)
  {
    -[MTRPluginLocalClient setSuspended:](self, "setSuspended:", [v10 isSuspended]);
    int v11 = [(MTRPluginLocalClient *)self registeredMTRDeviceControllerIDs];
    int v12 = [v10 uniqueIdentifier];
    char v13 = [v11 containsObject:v12];

    if ((v13 & 1) == 0)
    {
      __int16 v14 = [(MTRPluginLocalClient *)self registeredMTRDeviceControllerIDs];
      uint64_t v15 = [v10 uniqueIdentifier];
      [v14 addObject:v15];

      uint64_t v16 = +[MTRPluginLocalClient localDispatchQueue];
      [v10 addDeviceControllerDelegate:self queue:v16];
    }
    id v17 = [MEMORY[0x263F10DA8] deviceWithNodeID:v6 controller:v10];
    [(MTRPluginLocalClient *)self _registerDevice:v17];
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = [(MTRPluginLocalClient *)self pluginClient];
      int v20 = 138412802;
      v21 = self;
      __int16 v22 = 2112;
      v23 = v18;
      __int16 v24 = 2112;
      id v25 = v6;
      _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ Cannot find device controller for client %@ nodeID %@", (uint8_t *)&v20, 0x20u);
    }
    id v17 = 0;
  }

  return v17;
}

- (void)deviceController:(id)a3 nodeID:(id)a4 getStateWithReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = +[MTRPluginLocalClient localDispatchQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __66__MTRPluginLocalClient_deviceController_nodeID_getStateWithReply___block_invoke;
  v15[3] = &unk_2653E67F0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __66__MTRPluginLocalClient_deviceController_nodeID_getStateWithReply___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    int v8 = 138412802;
    uint64_t v9 = v2;
    __int16 v10 = 2112;
    int v11 = v3;
    __int16 v12 = 2112;
    uint64_t v13 = v4;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ getState controllerUUID %@ nodeID %@", (uint8_t *)&v8, 0x20u);
  }
  uint64_t v5 = [*(id *)(a1 + 32) _deviceForControllerUUID:*(void *)(a1 + 40) nodeID:*(void *)(a1 + 48)];
  uint64_t v6 = [v5 state];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138412802;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    int v11 = v5;
    __int16 v12 = 2048;
    uint64_t v13 = v6;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@  => device %@ state %lu", (uint8_t *)&v8, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)deviceController:(id)a3 nodeID:(id)a4 getDeviceCachePrimedWithReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = +[MTRPluginLocalClient localDispatchQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __78__MTRPluginLocalClient_deviceController_nodeID_getDeviceCachePrimedWithReply___block_invoke;
  v15[3] = &unk_2653E67F0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __78__MTRPluginLocalClient_deviceController_nodeID_getDeviceCachePrimedWithReply___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    int v8 = 138412802;
    uint64_t v9 = v2;
    __int16 v10 = 2112;
    int v11 = v3;
    __int16 v12 = 2112;
    uint64_t v13 = v4;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ getDeviceCachePrimed controllerUUID %@ nodeID %@", (uint8_t *)&v8, 0x20u);
  }
  uint64_t v5 = [*(id *)(a1 + 32) _deviceForControllerUUID:*(void *)(a1 + 40) nodeID:*(void *)(a1 + 48)];
  unsigned int v6 = [v5 deviceCachePrimed];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138412802;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    int v11 = v5;
    __int16 v12 = 2048;
    uint64_t v13 = v6;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@  => device %@ deviceCachePrimed %lu", (uint8_t *)&v8, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)deviceController:(id)a3 nodeID:(id)a4 getEstimatedStartTimeWithReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = +[MTRPluginLocalClient localDispatchQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __79__MTRPluginLocalClient_deviceController_nodeID_getEstimatedStartTimeWithReply___block_invoke;
  v15[3] = &unk_2653E67F0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __79__MTRPluginLocalClient_deviceController_nodeID_getEstimatedStartTimeWithReply___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void **)(a1 + 48);
    int v8 = 138412802;
    uint64_t v9 = v2;
    __int16 v10 = 2112;
    int v11 = v3;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ getEstimatedStartTime controllerUUID %@ nodeID %@", (uint8_t *)&v8, 0x20u);
  }
  uint64_t v5 = [*(id *)(a1 + 32) _deviceForControllerUUID:*(void *)(a1 + 40) nodeID:*(void *)(a1 + 48)];
  unsigned int v6 = [v5 estimatedStartTime];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138412802;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    int v11 = v5;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@  => device %@ estimatedStartTime %@", (uint8_t *)&v8, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)deviceController:(id)a3 nodeID:(id)a4 getEstimatedSubscriptionLatencyWithReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = +[MTRPluginLocalClient localDispatchQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __89__MTRPluginLocalClient_deviceController_nodeID_getEstimatedSubscriptionLatencyWithReply___block_invoke;
  v15[3] = &unk_2653E67F0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __89__MTRPluginLocalClient_deviceController_nodeID_getEstimatedSubscriptionLatencyWithReply___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void **)(a1 + 48);
    int v8 = 138412802;
    uint64_t v9 = v2;
    __int16 v10 = 2112;
    int v11 = v3;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ getEstimatedSubscriptionLatency controllerUUID %@ nodeID %@", (uint8_t *)&v8, 0x20u);
  }
  uint64_t v5 = [*(id *)(a1 + 32) _deviceForControllerUUID:*(void *)(a1 + 40) nodeID:*(void *)(a1 + 48)];
  unsigned int v6 = [v5 estimatedSubscriptionLatency];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138412802;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    int v11 = v5;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@  => device %@ estimatedSubscriptionLatency %@", (uint8_t *)&v8, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)deviceController:(id)a3 nodeID:(id)a4 readAttributeWithEndpointID:(id)a5 clusterID:(id)a6 attributeID:(id)a7 params:(id)a8 withReply:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  __int16 v22 = +[MTRPluginLocalClient localDispatchQueue];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __115__MTRPluginLocalClient_deviceController_nodeID_readAttributeWithEndpointID_clusterID_attributeID_params_withReply___block_invoke;
  v30[3] = &unk_2653E6818;
  v30[4] = self;
  id v31 = v15;
  id v32 = v16;
  id v33 = v17;
  id v34 = v18;
  id v35 = v19;
  id v36 = v20;
  id v37 = v21;
  id v23 = v21;
  id v24 = v20;
  id v25 = v19;
  id v26 = v18;
  id v27 = v17;
  id v28 = v16;
  id v29 = v15;
  dispatch_async(v22, v30);
}

void __115__MTRPluginLocalClient_deviceController_nodeID_readAttributeWithEndpointID_clusterID_attributeID_params_withReply___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    uint64_t v6 = *(void *)(a1 + 64);
    uint64_t v7 = *(void *)(a1 + 72);
    uint64_t v8 = *(void *)(a1 + 80);
    int v11 = 138413826;
    uint64_t v12 = v2;
    __int16 v13 = 2112;
    uint64_t v14 = v3;
    __int16 v15 = 2112;
    uint64_t v16 = v4;
    __int16 v17 = 2112;
    uint64_t v18 = v5;
    __int16 v19 = 2112;
    uint64_t v20 = v6;
    __int16 v21 = 2112;
    uint64_t v22 = v7;
    __int16 v23 = 2112;
    uint64_t v24 = v8;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ readAttributeWithEndpointID controllerUUID %@ nodeID %@ endpointID %@ clusterID %@ attribute %@ params %@", (uint8_t *)&v11, 0x48u);
  }
  uint64_t v9 = [*(id *)(a1 + 32) _deviceForControllerUUID:*(void *)(a1 + 40) nodeID:*(void *)(a1 + 48)];
  __int16 v10 = [v9 readAttributeWithEndpointID:*(void *)(a1 + 56) clusterID:*(void *)(a1 + 64) attributeID:*(void *)(a1 + 72) params:*(void *)(a1 + 80)];
  (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
}

- (void)deviceController:(id)a3 nodeID:(id)a4 readAttributePaths:(id)a5 withReply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = +[MTRPluginLocalClient localDispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__MTRPluginLocalClient_deviceController_nodeID_readAttributePaths_withReply___block_invoke;
  block[3] = &unk_2653E6840;
  block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(v14, block);
}

void __77__MTRPluginLocalClient_deviceController_nodeID_readAttributePaths_withReply___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void **)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    int v9 = 138413058;
    uint64_t v10 = v2;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    __int16 v15 = 2112;
    uint64_t v16 = v5;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ readAttributePaths controllerUUID %@ nodeID %@ attributePaths %@", (uint8_t *)&v9, 0x2Au);
  }
  uint64_t v6 = [*(id *)(a1 + 32) _deviceForControllerUUID:*(void *)(a1 + 40) nodeID:*(void *)(a1 + 48)];
  uint64_t v7 = [v6 readAttributePaths:*(void *)(a1 + 56)];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138412802;
    uint64_t v10 = v8;
    __int16 v11 = 2112;
    id v12 = v6;
    __int16 v13 = 2112;
    uint64_t v14 = v7;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@  => device %@ readAttributePaths %@", (uint8_t *)&v9, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (void)deviceController:(id)a3 nodeID:(id)a4 writeAttributeWithEndpointID:(id)a5 clusterID:(id)a6 attributeID:(id)a7 value:(id)a8 expectedValueInterval:(id)a9 timedWriteTimeout:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  if ((MTRPluginForceRemoteControl() & 1) == 0)
  {
    uint64_t v24 = +[MTRPluginLocalClient localDispatchQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __145__MTRPluginLocalClient_deviceController_nodeID_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout___block_invoke;
    block[3] = &unk_2653E6868;
    block[4] = self;
    id v26 = v16;
    id v27 = v17;
    id v28 = v18;
    id v29 = v19;
    id v30 = v20;
    id v31 = v21;
    id v32 = v22;
    id v33 = v23;
    dispatch_async(v24, block);
  }
}

void __145__MTRPluginLocalClient_deviceController_nodeID_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    uint64_t v6 = *(void *)(a1 + 64);
    uint64_t v7 = *(void *)(a1 + 72);
    uint64_t v8 = *(void *)(a1 + 80);
    uint64_t v9 = *(void *)(a1 + 88);
    uint64_t v10 = *(void *)(a1 + 96);
    int v13 = 138414338;
    uint64_t v14 = v2;
    __int16 v15 = 2112;
    id v16 = v3;
    __int16 v17 = 2112;
    uint64_t v18 = v4;
    __int16 v19 = 2112;
    uint64_t v20 = v5;
    __int16 v21 = 2112;
    uint64_t v22 = v6;
    __int16 v23 = 2112;
    uint64_t v24 = v7;
    __int16 v25 = 2112;
    uint64_t v26 = v8;
    __int16 v27 = 2112;
    uint64_t v28 = v9;
    __int16 v29 = 2112;
    uint64_t v30 = v10;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ writeAttributeWithEndpointID controllerUUID %@ nodeID %@ endpointID %@ clusterID %@ attribute %@ value %@ expectedValueInterval %@ timedWriteTimeout %@", (uint8_t *)&v13, 0x5Cu);
  }
  __int16 v11 = [*(id *)(a1 + 32) _deviceForControllerUUID:*(void *)(a1 + 40) nodeID:*(void *)(a1 + 48)];
  [v11 writeAttributeWithEndpointID:*(void *)(a1 + 56) clusterID:*(void *)(a1 + 64) attributeID:*(void *)(a1 + 72) value:*(void *)(a1 + 80) expectedValueInterval:*(void *)(a1 + 88) timedWriteTimeout:*(void *)(a1 + 96)];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    int v13 = 138412546;
    uint64_t v14 = v12;
    __int16 v15 = 2112;
    id v16 = v11;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@  => device %@", (uint8_t *)&v13, 0x16u);
  }
}

- (void)deviceController:(id)a3 nodeID:(id)a4 invokeCommandWithEndpointID:(id)a5 clusterID:(id)a6 commandID:(id)a7 commandFields:(id)a8 expectedValues:(id)a9 expectedValueInterval:(id)a10 timedInvokeTimeout:(id)a11 serverSideProcessingTimeout:(id)a12 completion:(id)a13
{
  id v34 = a3;
  id v36 = a4;
  id v35 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  id v24 = a12;
  id v25 = a13;
  if ((MTRPluginForceRemoteControl() & 1) == 0)
  {
    [(MTRPluginLocalClient *)self pluginClient];
    id v33 = v21;
    v27 = uint64_t v26 = v18;
    +[MTRPluginLocalClient localDispatchQueue];
    v29 = uint64_t v28 = v19;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __205__MTRPluginLocalClient_deviceController_nodeID_invokeCommandWithEndpointID_clusterID_commandID_commandFields_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_completion___block_invoke;
    block[3] = &unk_2653E6890;
    block[4] = self;
    id v38 = v34;
    id v39 = v36;
    id v40 = v35;
    id v41 = v26;
    id v42 = v28;
    id v43 = v20;
    id v44 = v33;
    id v45 = v22;
    id v46 = v23;
    id v47 = v24;
    id v48 = v27;
    id v49 = v25;
    id v30 = v27;
    id v18 = v26;
    id v31 = v30;
    dispatch_async(v29, block);

    id v19 = v28;
    id v21 = v33;
  }
}

void __205__MTRPluginLocalClient_deviceController_nodeID_invokeCommandWithEndpointID_clusterID_commandID_commandFields_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_completion___block_invoke(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    uint64_t v6 = *(void *)(a1 + 64);
    uint64_t v7 = *(void *)(a1 + 72);
    uint64_t v8 = *(void *)(a1 + 80);
    uint64_t v9 = *(void *)(a1 + 88);
    uint64_t v10 = *(void *)(a1 + 96);
    uint64_t v11 = *(void *)(a1 + 104);
    *(_DWORD *)buf = 138414594;
    uint64_t v34 = v2;
    __int16 v35 = 2112;
    id v36 = v3;
    __int16 v37 = 2112;
    uint64_t v38 = v4;
    __int16 v39 = 2112;
    uint64_t v40 = v5;
    __int16 v41 = 2112;
    uint64_t v42 = v6;
    __int16 v43 = 2112;
    uint64_t v44 = v7;
    __int16 v45 = 2112;
    uint64_t v46 = v8;
    __int16 v47 = 2112;
    uint64_t v48 = v9;
    __int16 v49 = 2112;
    uint64_t v50 = v10;
    __int16 v51 = 2112;
    uint64_t v52 = v11;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ invokeCommandWithEndpointID controllerUUID %@ nodeID %@ endpointID %@ clusterID %@ commandID %@ commandFields %@ expectedValues %@ expectedValueInterval %@ timedInvokeTimeout %@", buf, 0x66u);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    int v13 = *(void **)(a1 + 80);
    *(_DWORD *)buf = 138412546;
    uint64_t v34 = v12;
    __int16 v35 = 2112;
    id v36 = v13;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ commandFields: %@", buf, 0x16u);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    __int16 v15 = [*(id *)(a1 + 80) allKeys];
    *(_DWORD *)buf = 138412546;
    uint64_t v34 = v14;
    __int16 v35 = 2112;
    id v36 = v15;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ commandFields allKeys: %@", buf, 0x16u);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = *(void *)(a1 + 32);
    __int16 v17 = [*(id *)(a1 + 80) allObjects];
    *(_DWORD *)buf = 138412546;
    uint64_t v34 = v16;
    __int16 v35 = 2112;
    id v36 = v17;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ commandFields allObjects: %@", buf, 0x16u);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = *(void *)(a1 + 32);
    id v19 = [*(id *)(a1 + 80) objectForKey:@"value"];
    id v20 = (objc_class *)objc_opt_class();
    id v21 = NSStringFromClass(v20);
    *(_DWORD *)buf = 138412546;
    uint64_t v34 = v18;
    __int16 v35 = 2112;
    id v36 = v21;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ commandFields objectForKey: 'value' class: %@", buf, 0x16u);
  }
  id v22 = [*(id *)(a1 + 32) _deviceForControllerUUID:*(void *)(a1 + 40) nodeID:*(void *)(a1 + 48)];
  uint64_t v23 = *(void *)(a1 + 64);
  uint64_t v32 = *(void *)(a1 + 56);
  uint64_t v24 = *(void *)(a1 + 72);
  uint64_t v25 = *(void *)(a1 + 80);
  uint64_t v26 = *(void *)(a1 + 88);
  uint64_t v27 = *(void *)(a1 + 96);
  uint64_t v29 = *(void *)(a1 + 104);
  uint64_t v28 = *(void *)(a1 + 112);
  id v30 = [*(id *)(a1 + 120) workQueue];
  [v22 _invokeCommandWithEndpointID:v32 clusterID:v23 commandID:v24 commandFields:v25 expectedValues:v26 expectedValueInterval:v27 timedInvokeTimeout:v29 serverSideProcessingTimeout:v28 queue:v30 completion:*(void *)(a1 + 128)];

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v31 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    uint64_t v34 = v31;
    __int16 v35 = 2112;
    id v36 = v22;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@  => device %@", buf, 0x16u);
  }
}

- (void)deviceController:(id)a3 nodeID:(id)a4 openCommissioningWindowWithSetupPasscode:(id)a5 discriminator:(id)a6 duration:(id)a7 completion:(id)a8
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if ((MTRPluginForceRemoteControl() & 1) == 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    uint64_t v10 = self;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ openCommissioningWindowWithSetupPasscode not implemented", (uint8_t *)&v9, 0xCu);
  }
}

- (void)deviceController:(id)a3 nodeID:(id)a4 downloadLogOfType:(int64_t)a5 timeout:(double)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  if ((MTRPluginForceRemoteControl() & 1) == 0)
  {
    __int16 v15 = +[MTRPluginLocalClient localDispatchQueue];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __85__MTRPluginLocalClient_deviceController_nodeID_downloadLogOfType_timeout_completion___block_invoke;
    v16[3] = &unk_2653E68B8;
    v16[4] = self;
    int64_t v20 = a5;
    id v17 = v13;
    id v18 = v12;
    double v21 = a6;
    id v19 = v14;
    dispatch_async(v15, v16);
  }
}

void __85__MTRPluginLocalClient_deviceController_nodeID_downloadLogOfType_timeout_completion___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = *(void *)(a1 + 64);
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v10 = 138412802;
    uint64_t v11 = v3;
    __int16 v12 = 1024;
    int v13 = v2;
    __int16 v14 = 2112;
    uint64_t v15 = v4;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ downloadLogOfType: %d  nodeID: %@", (uint8_t *)&v10, 0x1Cu);
  }
  uint64_t v5 = [*(id *)(a1 + 32) _deviceForControllerUUID:*(void *)(a1 + 48) nodeID:*(void *)(a1 + 40)];
  uint64_t v6 = *(void *)(a1 + 64);
  double v7 = *(double *)(a1 + 72);
  uint64_t v8 = [*(id *)(a1 + 32) pluginClient];
  int v9 = [v8 workQueue];
  [v5 downloadLogOfType:v6 timeout:v9 queue:*(void *)(a1 + 56) completion:v7];
}

- (void)deviceController:(id)a3 getIsRunningWithReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[MTRPluginLocalClient localDispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__MTRPluginLocalClient_deviceController_getIsRunningWithReply___block_invoke;
  block[3] = &unk_2653E68E0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __63__MTRPluginLocalClient_deviceController_getIsRunningWithReply___block_invoke(void *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = a1[4];
    uint64_t v3 = (void *)a1[5];
    int v9 = 138412546;
    uint64_t v10 = v2;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ getIsRunningWithReply controllerUUID %@", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v4 = +[MTRPluginDeviceControllerRegistry sharedInstance];
  uint64_t v5 = [v4 deviceControllerForUUID:a1[5]];

  int v6 = [v5 isRunning];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = a1[4];
    uint64_t v8 = @"NO";
    int v9 = 138412802;
    if (v6) {
      uint64_t v8 = @"YES";
    }
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    __int16 v14 = v8;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@  => controller %@ isRunning %@", (uint8_t *)&v9, 0x20u);
  }
  (*(void (**)(void))(a1[6] + 16))();
}

- (void)deviceController:(id)a3 getUniqueIdentifierWithReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[MTRPluginLocalClient localDispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__MTRPluginLocalClient_deviceController_getUniqueIdentifierWithReply___block_invoke;
  block[3] = &unk_2653E68E0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __70__MTRPluginLocalClient_deviceController_getUniqueIdentifierWithReply___block_invoke(void *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = a1[4];
    uint64_t v3 = (void *)a1[5];
    int v8 = 138412546;
    uint64_t v9 = v2;
    __int16 v10 = 2112;
    __int16 v11 = v3;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ getUniqueIdentifierWithReply controllerUUID %@", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v4 = +[MTRPluginDeviceControllerRegistry sharedInstance];
  uint64_t v5 = [v4 deviceControllerForUUID:a1[5]];

  id v6 = [v5 uniqueIdentifier];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = a1[4];
    int v8 = 138412802;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    __int16 v11 = v5;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@  => controller %@ uniqueIdentifier %@", (uint8_t *)&v8, 0x20u);
  }
  (*(void (**)(void))(a1[6] + 16))();
}

- (void)deviceController:(id)a3 controllerNodeIDWithReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = +[MTRPluginLocalClient localDispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__MTRPluginLocalClient_deviceController_controllerNodeIDWithReply___block_invoke;
  block[3] = &unk_2653E68E0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __67__MTRPluginLocalClient_deviceController_controllerNodeIDWithReply___block_invoke(void *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = a1[4];
    uint64_t v3 = (void *)a1[5];
    int v8 = 138412546;
    uint64_t v9 = v2;
    __int16 v10 = 2112;
    __int16 v11 = v3;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ controllerNodeIDWithReply controllerUUID %@", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v4 = +[MTRPluginDeviceControllerRegistry sharedInstance];
  uint64_t v5 = [v4 deviceControllerForUUID:a1[5]];

  id v6 = [v5 controllerNodeID];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = a1[4];
    int v8 = 138412802;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    __int16 v11 = v5;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@  => controller %@ controllerNodeID %@", (uint8_t *)&v8, 0x20u);
  }
  (*(void (**)(void))(a1[6] + 16))();
}

- (void)deviceController:(id)a3 updateControllerConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = +[MTRPluginLocalClient localDispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__MTRPluginLocalClient_deviceController_updateControllerConfiguration___block_invoke;
  block[3] = &unk_2653E6908;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __71__MTRPluginLocalClient_deviceController_updateControllerConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    __int16 v43 = v2;
    __int16 v44 = 2112;
    uint64_t v45 = v3;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ Got updateControllerConfiguration %@", buf, 0x16u);
  }
  uint64_t v4 = [*(id *)(a1 + 32) pluginClient];
  uint64_t v5 = [v4 registeredNodeIDs];
  uint64_t v32 = (void *)[v5 mutableCopy];

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v6 = [*(id *)(a1 + 40) objectForKey:*MEMORY[0x263F10BA0]];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v37 objects:v50 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v38;
    uint64_t v10 = *MEMORY[0x263F10B98];
    __int16 v11 = &_os_log_internal;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v38 != v9) {
          objc_enumerationMutation(v6);
        }
        id v13 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && v13)
        {
          uint64_t v14 = [v13 objectForKey:v10];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v15 = [v13 objectForKey:v10];

            if (!v15) {
              continue;
            }
            uint64_t v16 = [*(id *)(a1 + 32) _deviceForControllerUUID:*(void *)(a1 + 48) nodeID:v15];
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              id v17 = *(void **)(a1 + 32);
              uint64_t v18 = *(void *)(a1 + 48);
              *(_DWORD *)buf = 138412802;
              __int16 v43 = v17;
              __int16 v44 = 2112;
              uint64_t v45 = v18;
              __int16 v46 = 2112;
              __int16 v47 = v16;
              _os_log_impl(&dword_2558FC000, v11, OS_LOG_TYPE_DEFAULT, "%@  => controller: %@ register device: %@", buf, 0x20u);
            }
            [*(id *)(a1 + 32) _registerDevice:v16];
            [v32 removeObject:v15];
          }
          else
          {
            uint64_t v15 = v14;
          }
        }
        else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          -[MTRPluginResidentClientSession messageTransport:handleControllerConfigUpdate:](v48, (uint64_t)v13, &v49);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v37 objects:v50 count:16];
    }
    while (v8);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v19 = v32;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v34;
    uint64_t v23 = &_os_log_internal;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v34 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v25 = [*(id *)(a1 + 32) _deviceForControllerUUID:*(void *)(a1 + 48) nodeID:*(void *)(*((void *)&v33 + 1) + 8 * j)];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v26 = *(void **)(a1 + 32);
          uint64_t v27 = *(void *)(a1 + 48);
          *(_DWORD *)buf = 138412802;
          __int16 v43 = v26;
          __int16 v44 = 2112;
          uint64_t v45 = v27;
          __int16 v46 = 2112;
          __int16 v47 = v25;
          _os_log_impl(&dword_2558FC000, v23, OS_LOG_TYPE_DEFAULT, "%@  => controller: %@ unregister device: %@", buf, 0x20u);
        }
        [*(id *)(a1 + 32) _unregisterDevice:v25];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v21);
  }

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v28 = *(void **)(a1 + 32);
    uint64_t v29 = *(void *)(a1 + 48);
    id v30 = [v28 pluginClient];
    uint64_t v31 = [v30 registeredNodeIDs];
    *(_DWORD *)buf = 138412802;
    __int16 v43 = v28;
    __int16 v44 = 2112;
    uint64_t v45 = v29;
    __int16 v46 = 2112;
    __int16 v47 = v31;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@  => controller: %@ self.pluginClient.registeredNodeIDs: %@", buf, 0x20u);
  }
}

- (NSString)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  id v6 = [(MTRPluginLocalClient *)self pluginClient];
  uint64_t v7 = [v3 stringWithFormat:@"<%@: %p client: %@>", v5, self, v6];

  return (NSString *)v7;
}

- (id)deviceController
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v3 = +[MTRPluginLocalClient localDispatchQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = +[MTRPluginDeviceControllerRegistry sharedInstance];
  id v6 = [(MTRPluginLocalClient *)v4 pluginClient];
  uint64_t v7 = [v6 homeUUID];
  uint64_t v8 = [v5 deviceControllerForUUID:v7];

  if (!v8)
  {
    uint64_t v9 = &_os_log_internal;
    id v10 = &_os_log_internal;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = [(MTRPluginLocalClient *)v4 pluginClient];
      id v12 = [v11 homeUUID];
      int v14 = 138412546;
      uint64_t v15 = v4;
      __int16 v16 = 2112;
      id v17 = v12;
      _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ *** deviceController nil (not found) for controllerUUID: %@", (uint8_t *)&v14, 0x16u);
    }
  }
  objc_sync_exit(v4);

  return v8;
}

- (void)addDelegateForDevice:(id)a3 interestedPathsForAttributes:(id)a4 interestedPathsForEvents:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = +[MTRPluginLocalClient localDispatchQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __99__MTRPluginLocalClient_addDelegateForDevice_interestedPathsForAttributes_interestedPathsForEvents___block_invoke;
  v15[3] = &unk_2653E6930;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __99__MTRPluginLocalClient_addDelegateForDevice_interestedPathsForAttributes_interestedPathsForEvents___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void **)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    int v20 = 138413058;
    uint64_t v21 = v2;
    __int16 v22 = 2112;
    uint64_t v23 = v3;
    __int16 v24 = 2112;
    uint64_t v25 = v4;
    __int16 v26 = 2112;
    uint64_t v27 = v5;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ addDelegateForDevice: %@ interestedPathsForAttributes: %@ interestedPathsForEvents: %@", (uint8_t *)&v20, 0x2Au);
  }
  id v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  uint64_t v7 = [*(id *)(a1 + 32) subscribedMTRDevices];
  int v8 = [v7 containsObject:*(void *)(a1 + 40)];

  if (v8)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      int v20 = 138412546;
      uint64_t v21 = v9;
      __int16 v22 = 2112;
      uint64_t v23 = v10;
      _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ Cannot call addDelegate again to device %@ - ignoring", (uint8_t *)&v20, 0x16u);
    }
  }
  else
  {
    __int16 v11 = [*(id *)(a1 + 32) subscribedMTRDevices];
    [v11 addObject:*(void *)(a1 + 40)];

    id v12 = &_os_log_internal;
    id v13 = &_os_log_internal;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      uint64_t v14 = *(void *)(a1 + 40);
      id v16 = +[MTRPluginLocalClient localDispatchQueue];
      int v20 = 138412802;
      uint64_t v21 = v15;
      __int16 v22 = 2112;
      uint64_t v23 = v14;
      __int16 v24 = 2112;
      uint64_t v25 = v16;
      _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ Setting delegate on device: %@ queue: %@", (uint8_t *)&v20, 0x20u);
    }
    uint64_t v18 = *(void *)(a1 + 32);
    id v17 = *(void **)(a1 + 40);
    id v19 = +[MTRPluginLocalClient localDispatchQueue];
    [v17 addDelegate:v18 queue:v19];
  }
  objc_sync_exit(v6);
}

- (void)removeDelegateForDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[MTRPluginLocalClient localDispatchQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__MTRPluginLocalClient_removeDelegateForDevice___block_invoke;
  v7[3] = &unk_2653E6700;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __48__MTRPluginLocalClient_removeDelegateForDevice___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  uint64_t v3 = [*(id *)(a1 + 32) subscribedMTRDevices];
  char v4 = [v3 containsObject:*(void *)(a1 + 40)];

  BOOL v5 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      int v11 = 138412546;
      uint64_t v12 = v6;
      __int16 v13 = 2112;
      uint64_t v14 = v7;
      _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ removing delegate on device: %@", (uint8_t *)&v11, 0x16u);
    }
    [*(id *)(a1 + 40) removeDelegate:*(void *)(a1 + 32)];
    id v8 = [*(id *)(a1 + 32) subscribedMTRDevices];
    [v8 removeObject:*(void *)(a1 + 40)];
  }
  else if (v5)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    int v11 = 138412546;
    uint64_t v12 = v9;
    __int16 v13 = 2112;
    uint64_t v14 = v10;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ Cannot find device %@ to removeDelegate - ignoring", (uint8_t *)&v11, 0x16u);
  }
  objc_sync_exit(v2);
}

- (void)reportAllAttributesForDevice:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[MTRPluginLocalClient localDispatchQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__MTRPluginLocalClient_reportAllAttributesForDevice___block_invoke;
  v7[3] = &unk_2653E6700;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __53__MTRPluginLocalClient_reportAllAttributesForDevice___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) getAllAttributesReport];
  uint64_t v3 = [v2 count];
  BOOL v4 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v7 = 138412546;
      uint64_t v8 = v5;
      __int16 v9 = 2048;
      uint64_t v10 = [v2 count];
      _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ Reporting all known attributes %lu", (uint8_t *)&v7, 0x16u);
    }
    [*(id *)(a1 + 40) device:*(void *)(a1 + 32) receivedAttributeReport:v2];
  }
  else if (v4)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ No known attributes to report", (uint8_t *)&v7, 0xCu);
  }
}

- (void)logState
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = &_os_log_internal;
  id v4 = &_os_log_internal;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [(MTRPluginLocalClient *)v2 subscribedMTRDevices];
    *(_DWORD *)buf = 138412546;
    uint64_t v18 = v2;
    __int16 v19 = 2048;
    uint64_t v20 = [v5 count];
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ logState for %lu devices:", buf, 0x16u);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [(MTRPluginLocalClient *)v2 subscribedMTRDevices];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    __int16 v9 = &_os_log_internal;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v11 = *(void *)(*((void *)&v12 + 1) + 8 * i);
          *(_DWORD *)buf = 138412546;
          uint64_t v18 = v2;
          __int16 v19 = 2112;
          uint64_t v20 = v11;
          _os_log_impl(&dword_2558FC000, v9, OS_LOG_TYPE_DEFAULT, "%@     => %@", buf, 0x16u);
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v2);
}

- (void)device:(id)a3 stateChanged:(unint64_t)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = +[MTRPluginLocalClient localDispatchQueue];
  dispatch_assert_queue_V2(v7);

  if ((MTRPluginForceRemoteControl() & 1) == 0)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [v6 nodeID];
      int v12 = 138412802;
      long long v13 = self;
      __int16 v14 = 2112;
      long long v15 = v8;
      __int16 v16 = 2048;
      unint64_t v17 = a4;
      _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ device %@ stateChanged %lu", (uint8_t *)&v12, 0x20u);
    }
    __int16 v9 = [(MTRPluginLocalClient *)self pluginClient];
    uint64_t v10 = [v9 clientProxy];
    uint64_t v11 = [v6 nodeID];
    [v10 device:v11 stateChanged:a4];
  }
}

- (void)device:(id)a3 receivedAttributeReport:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[MTRPluginLocalClient localDispatchQueue];
  dispatch_assert_queue_V2(v8);

  if ((MTRPluginForceRemoteControl() & 1) == 0)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v9 = [v6 nodeID];
      int v13 = 138412802;
      __int16 v14 = self;
      __int16 v15 = 2112;
      __int16 v16 = v9;
      __int16 v17 = 2048;
      uint64_t v18 = [v7 count];
      _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ device %@ receivedAttributeReport %ld", (uint8_t *)&v13, 0x20u);
    }
    uint64_t v10 = [(MTRPluginLocalClient *)self pluginClient];
    uint64_t v11 = [v10 clientProxy];
    int v12 = [v6 nodeID];
    [v11 device:v12 receivedAttributeReport:v7];
  }
}

- (void)device:(id)a3 receivedEventReport:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[MTRPluginLocalClient localDispatchQueue];
  dispatch_assert_queue_V2(v8);

  if ((MTRPluginForceRemoteControl() & 1) == 0)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v9 = [v6 nodeID];
      int v13 = 138412802;
      __int16 v14 = self;
      __int16 v15 = 2112;
      __int16 v16 = v9;
      __int16 v17 = 2048;
      uint64_t v18 = [v7 count];
      _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ device %@ receivedEventReport %ld", (uint8_t *)&v13, 0x20u);
    }
    uint64_t v10 = [(MTRPluginLocalClient *)self pluginClient];
    uint64_t v11 = [v10 clientProxy];
    int v12 = [v6 nodeID];
    [v11 device:v12 receivedEventReport:v7];
  }
}

- (void)deviceBecameActive:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = +[MTRPluginLocalClient localDispatchQueue];
  dispatch_assert_queue_V2(v5);

  if ((MTRPluginForceRemoteControl() & 1) == 0)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v4 nodeID];
      int v10 = 138412546;
      uint64_t v11 = self;
      __int16 v12 = 2112;
      int v13 = v6;
      _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ deviceBecameActive %@", (uint8_t *)&v10, 0x16u);
    }
    id v7 = [(MTRPluginLocalClient *)self pluginClient];
    uint64_t v8 = [v7 clientProxy];
    __int16 v9 = [v4 nodeID];
    [v8 deviceBecameActive:v9];
  }
}

- (void)deviceCachePrimed:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = +[MTRPluginLocalClient localDispatchQueue];
  dispatch_assert_queue_V2(v5);

  if ((MTRPluginForceRemoteControl() & 1) == 0)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v4 nodeID];
      int v10 = 138412546;
      uint64_t v11 = self;
      __int16 v12 = 2112;
      int v13 = v6;
      _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ deviceCachePrimed %@", (uint8_t *)&v10, 0x16u);
    }
    id v7 = [(MTRPluginLocalClient *)self pluginClient];
    uint64_t v8 = [v7 clientProxy];
    __int16 v9 = [v4 nodeID];
    [v8 deviceCachePrimed:v9];
  }
}

- (void)deviceConfigurationChanged:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = +[MTRPluginLocalClient localDispatchQueue];
  dispatch_assert_queue_V2(v5);

  if ((MTRPluginForceRemoteControl() & 1) == 0)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v4 nodeID];
      int v10 = 138412546;
      uint64_t v11 = self;
      __int16 v12 = 2112;
      int v13 = v6;
      _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ deviceConfigurationChanged %@", (uint8_t *)&v10, 0x16u);
    }
    id v7 = [(MTRPluginLocalClient *)self pluginClient];
    uint64_t v8 = [v7 clientProxy];
    __int16 v9 = [v4 nodeID];
    [v8 deviceConfigurationChanged:v9];
  }
}

- (void)device:(id)a3 internalStateUpdated:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[MTRPluginLocalClient localDispatchQueue];
  dispatch_assert_queue_V2(v8);

  if ((MTRPluginForceRemoteControl() & 1) == 0)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v9 = [v6 nodeID];
      int v13 = 138412546;
      uint64_t v14 = self;
      __int16 v15 = 2112;
      __int16 v16 = v9;
      _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ device %@ internalStateUpdated", (uint8_t *)&v13, 0x16u);
    }
    int v10 = [(MTRPluginLocalClient *)self pluginClient];
    uint64_t v11 = [v10 clientProxy];
    __int16 v12 = [v6 nodeID];
    [v11 device:v12 internalStateUpdated:v7];
  }
}

- (void)device:(id)a3 injectAttributeReport:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[MTRPluginLocalClient localDispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__MTRPluginLocalClient_device_injectAttributeReport___block_invoke;
  block[3] = &unk_2653E6908;
  id v12 = v6;
  int v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __53__MTRPluginLocalClient_device_injectAttributeReport___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x263F10DA8];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) deviceController];
  id v5 = [v2 deviceWithNodeID:v3 controller:v4];

  if (objc_opt_respondsToSelector()) {
    [v5 _injectAttributeReport:*(void *)(a1 + 48) fromSubscription:1];
  }
}

- (void)device:(id)a3 injectEventReport:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[MTRPluginLocalClient localDispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__MTRPluginLocalClient_device_injectEventReport___block_invoke;
  block[3] = &unk_2653E6908;
  id v12 = v6;
  int v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __49__MTRPluginLocalClient_device_injectEventReport___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x263F10DA8];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) deviceController];
  id v5 = [v2 deviceWithNodeID:v3 controller:v4];

  if (objc_opt_respondsToSelector()) {
    [v5 _injectEventReport:*(void *)(a1 + 48)];
  }
}

- (void)controller:(id)a3 suspendedChangedTo:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"NO";
    *(_DWORD *)uint64_t v8 = 138412802;
    *(void *)&v8[4] = self;
    *(_WORD *)&v8[12] = 2112;
    if (v4) {
      id v7 = @"YES";
    }
    *(void *)&v8[14] = a3;
    __int16 v9 = 2112;
    id v10 = v7;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ controller %@ suspendedChangedTo: %@", v8, 0x20u);
  }
  -[MTRPluginLocalClient setSuspended:](self, "setSuspended:", v4, *(_OWORD *)v8);
}

- (BOOL)isSuspended
{
  return self->_suspended;
}

- (void)setSuspended:(BOOL)a3
{
  self->_suspended = a3;
}

- (MTRPluginClient)pluginClient
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pluginClient);
  return (MTRPluginClient *)WeakRetained;
}

- (void)setPluginClient:(id)a3
{
}

- (NSMutableSet)registeredNodeIDs
{
  return (NSMutableSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRegisteredNodeIDs:(id)a3
{
}

- (NSMutableSet)subscribedMTRDevices
{
  return (NSMutableSet *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSubscribedMTRDevices:(id)a3
{
}

- (NSMutableSet)registeredMTRDeviceControllerIDs
{
  return (NSMutableSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRegisteredMTRDeviceControllerIDs:(id)a3
{
}

- (NSMutableDictionary)context
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_registeredMTRDeviceControllerIDs, 0);
  objc_storeStrong((id *)&self->_subscribedMTRDevices, 0);
  objc_storeStrong((id *)&self->_registeredNodeIDs, 0);
  objc_destroyWeak((id *)&self->_pluginClient);
}

@end