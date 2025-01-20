@interface MTRPluginRemoteClient
- (MTRPluginClient)client;
- (MTRPluginProtobufMessageTransport)transport;
- (MTRPluginRemoteClient)initWithClient:(id)a3 queue:(id)a4;
- (void)_registerForMessages;
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
- (void)messageTransport:(id)a3 handleDeviceAttributeReport:(id)a4;
- (void)messageTransport:(id)a3 handleDeviceBecameActive:(id)a4;
- (void)messageTransport:(id)a3 handleDeviceCachePrimed:(id)a4;
- (void)messageTransport:(id)a3 handleDeviceConfigurationChanged:(id)a4;
- (void)messageTransport:(id)a3 handleDeviceEventReport:(id)a4;
- (void)messageTransport:(id)a3 handleDeviceInternalStateUpdated:(id)a4;
- (void)messageTransport:(id)a3 handleDeviceStateChanged:(id)a4;
- (void)sendControllerMessageToHomeWithID:(id)a3 controllerMessageType:(int)a4 queryRequestValue:(id)a5 errorBlock:(id)a6 replyBlock:(id)a7;
- (void)sendDeviceMessageToNodeWithID:(id)a3 homeID:(id)a4 deviceNodeMessageType:(int)a5 errorBlock:(id)a6 replyBlock:(id)a7;
- (void)sendMessageToHomeWithID:(id)a3 messageType:(int)a4 pbCodable:(id)a5 errorBlock:(id)a6 replyBlock:(id)a7;
- (void)sendOnewayMessageToHomeWithID:(id)a3 messageType:(int)a4 pbCodable:(id)a5;
- (void)setClient:(id)a3;
- (void)setTransport:(id)a3;
@end

@implementation MTRPluginRemoteClient

- (MTRPluginRemoteClient)initWithClient:(id)a3 queue:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MTRPluginRemoteClient;
  v8 = [(MTRPluginRemoteClient *)&v15 init];
  if (v8)
  {
    v9 = +[MTRPluginProtobufOverModernTransport sharedInstance];
    [(MTRPluginRemoteClient *)v8 setTransport:v9];

    [(MTRPluginRemoteClient *)v8 setClient:v6];
    v10 = [(MTRPluginRemoteClient *)v8 transport];
    v11 = [(MTRPluginRemoteClient *)v8 client];
    v12 = [v11 sessionID];
    [v10 setDelegate:v8 delegateQueue:v7 forSessionID:v12];

    [(MTRPluginRemoteClient *)v8 _registerForMessages];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [v6 sessionID];
      *(_DWORD *)buf = 138412546;
      v17 = v8;
      __int16 v18 = 2112;
      v19 = v13;
      _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ Created remote dispatcher with session ID: %@", buf, 0x16u);
    }
  }

  return v8;
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (objc_class *)objc_opt_class();
    v4 = NSStringFromClass(v3);
    *(_DWORD *)buf = 138412546;
    id v7 = v4;
    __int16 v8 = 2048;
    v9 = self;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ dealloc: %p", buf, 0x16u);
  }
  v5.receiver = self;
  v5.super_class = (Class)MTRPluginRemoteClient;
  [(MTRPluginRemoteClient *)&v5 dealloc];
}

- (void)invalidate
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(MTRPluginRemoteClient *)v2 client];
  v4 = [v3 homeUUID];

  if (v4)
  {
    objc_super v5 = &_os_log_internal;
    id v6 = &_os_log_internal;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [(MTRPluginRemoteClient *)v2 client];
      __int16 v8 = [v7 homeUUID];
      int v13 = 138412546;
      v14 = v2;
      __int16 v15 = 2112;
      v16 = v8;
      _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ Sending session close to resident session for controller %@", (uint8_t *)&v13, 0x16u);
    }
    v9 = objc_alloc_init(MTRPluginPBMDeviceControllerMessage);
    uint64_t v10 = [(MTRPluginRemoteClient *)v2 client];
    v11 = [v10 homeUUID];
    [(MTRPluginRemoteClient *)v2 sendOnewayMessageToHomeWithID:v11 messageType:8 pbCodable:v9];
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    v14 = v2;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ Invalidating remote client", (uint8_t *)&v13, 0xCu);
  }
  v12 = [(MTRPluginRemoteClient *)v2 transport];
  [v12 removeDelegate:v2];

  objc_sync_exit(v2);
}

- (void)_registerForMessages
{
  v3 = [(MTRPluginRemoteClient *)self transport];
  v4 = [(MTRPluginRemoteClient *)self client];
  objc_super v5 = [v4 sessionID];
  [v3 registerForRequestMessageWithType:&unk_27046AAB8 requestHandler:sel_messageTransport_handleDeviceStateChanged_ forSessionID:v5];

  id v6 = [(MTRPluginRemoteClient *)self transport];
  id v7 = [(MTRPluginRemoteClient *)self client];
  __int16 v8 = [v7 sessionID];
  [v6 registerForRequestMessageWithType:&unk_27046AAD0 requestHandler:sel_messageTransport_handleDeviceAttributeReport_ forSessionID:v8];

  v9 = [(MTRPluginRemoteClient *)self transport];
  uint64_t v10 = [(MTRPluginRemoteClient *)self client];
  v11 = [v10 sessionID];
  [v9 registerForRequestMessageWithType:&unk_27046AAE8 requestHandler:sel_messageTransport_handleDeviceEventReport_ forSessionID:v11];

  v12 = [(MTRPluginRemoteClient *)self transport];
  int v13 = [(MTRPluginRemoteClient *)self client];
  v14 = [v13 sessionID];
  [v12 registerForRequestMessageWithType:&unk_27046AB00 requestHandler:sel_messageTransport_handleDeviceBecameActive_ forSessionID:v14];

  __int16 v15 = [(MTRPluginRemoteClient *)self transport];
  v16 = [(MTRPluginRemoteClient *)self client];
  uint64_t v17 = [v16 sessionID];
  [v15 registerForRequestMessageWithType:&unk_27046AB18 requestHandler:sel_messageTransport_handleDeviceCachePrimed_ forSessionID:v17];

  __int16 v18 = [(MTRPluginRemoteClient *)self transport];
  v19 = [(MTRPluginRemoteClient *)self client];
  uint64_t v20 = [v19 sessionID];
  [v18 registerForRequestMessageWithType:&unk_27046AB30 requestHandler:sel_messageTransport_handleDeviceConfigurationChanged_ forSessionID:v20];

  id v23 = [(MTRPluginRemoteClient *)self transport];
  v21 = [(MTRPluginRemoteClient *)self client];
  v22 = [v21 sessionID];
  [v23 registerForRequestMessageWithType:&unk_27046AB48 requestHandler:sel_messageTransport_handleDeviceInternalStateUpdated_ forSessionID:v22];
}

- (void)sendOnewayMessageToHomeWithID:(id)a3 messageType:(int)a4 pbCodable:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(MTRPluginRemoteClient *)self client];
  v11 = [v10 sessionID];
  v12 = +[MTRPluginPBMHeader onewayHeaderWithSessionID:v11 homeID:v8 messageType:v6];
  [v9 setHeader:v12];

  if ([v9 isValid])
  {
    int v13 = [v9 data];
    v14 = +[MTRPluginProtobufMessage messageWithProtobufData:v13];

    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      -[MTRPluginRemoteClient sendOnewayMessageToHomeWithID:messageType:pbCodable:]();
    }
    __int16 v15 = [(MTRPluginRemoteClient *)self transport];
    [v15 sendMessageToPrimaryHomeHub:v14];
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    int v16 = 138413058;
    uint64_t v17 = self;
    __int16 v18 = 1024;
    int v19 = v6;
    __int16 v20 = 2112;
    id v21 = v9;
    __int16 v22 = 2112;
    id v23 = v8;
    _os_log_error_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%@ Failed to send one way message type %d for (%@) to home hub for home %@ since it is invalid", (uint8_t *)&v16, 0x26u);
  }
}

- (void)sendMessageToHomeWithID:(id)a3 messageType:(int)a4 pbCodable:(id)a5 errorBlock:(id)a6 replyBlock:(id)a7
{
  uint64_t v10 = *(void *)&a4;
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  int v16 = [(MTRPluginRemoteClient *)self client];
  uint64_t v17 = [v16 sessionID];
  __int16 v18 = +[MTRPluginPBMHeader requestHeaderWithSessionID:v17 homeID:v12 messageType:v10];
  [v13 setHeader:v18];

  if ([v13 isValid])
  {
    int v19 = [v13 data];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __93__MTRPluginRemoteClient_sendMessageToHomeWithID_messageType_pbCodable_errorBlock_replyBlock___block_invoke;
    v23[3] = &unk_2653E6778;
    v23[4] = self;
    int v27 = v10;
    id v24 = v12;
    id v25 = v14;
    id v26 = v15;
    __int16 v20 = +[MTRPluginProtobufMessage messageWithProtobufData:v19 responseHandler:v23];

    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      -[MTRPluginRemoteClient sendMessageToHomeWithID:messageType:pbCodable:errorBlock:replyBlock:]();
    }
    id v21 = [(MTRPluginRemoteClient *)self transport];
    [v21 sendMessageToPrimaryHomeHub:v20];

    goto LABEL_11;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138413058;
    v29 = self;
    __int16 v30 = 1024;
    int v31 = v10;
    __int16 v32 = 2112;
    id v33 = v13;
    __int16 v34 = 2112;
    id v35 = v12;
    _os_log_error_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%@ Failed to send message type %d for (%@) to home hub for home %@ since it is invalid", buf, 0x26u);
    if (v14) {
      goto LABEL_7;
    }
  }
  else if (v14)
  {
LABEL_7:
    __int16 v22 = [MEMORY[0x263F087E8] errorWithDomain:@"kMTRPluginErrorDomain" code:-1003 userInfo:0];
    (*((void (**)(id, void *))v14 + 2))(v14, v22);

    goto LABEL_11;
  }
  if (v15) {
    (*((void (**)(id, void))v15 + 2))(v15, 0);
  }
LABEL_11:
}

void __93__MTRPluginRemoteClient_sendMessageToHomeWithID_messageType_pbCodable_errorBlock_replyBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __93__MTRPluginRemoteClient_sendMessageToHomeWithID_messageType_pbCodable_errorBlock_replyBlock___block_invoke_cold_1(a1, (uint64_t)v5);
    }
    uint64_t v7 = *(void *)(a1 + 48);
    if (v7)
    {
      id v8 = *(void (**)(void))(v7 + 16);
LABEL_10:
      v8();
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      unsigned int v10 = *(_DWORD *)(a1 + 64);
      v11 = +[MTRPluginPBMHeader messageTypeAsString:v10];
      uint64_t v12 = *(void *)(a1 + 40);
      int v14 = 138413058;
      uint64_t v15 = v9;
      __int16 v16 = 1024;
      unsigned int v17 = v10;
      __int16 v18 = 2112;
      int v19 = v11;
      __int16 v20 = 2112;
      uint64_t v21 = v12;
      _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ Response received for message type %d (%@) from homeID %@", (uint8_t *)&v14, 0x26u);
    }
    uint64_t v13 = *(void *)(a1 + 56);
    if (v13)
    {
      id v8 = *(void (**)(void))(v13 + 16);
      goto LABEL_10;
    }
  }
}

- (void)sendControllerMessageToHomeWithID:(id)a3 controllerMessageType:(int)a4 queryRequestValue:(id)a5 errorBlock:(id)a6 replyBlock:(id)a7
{
  uint64_t v10 = *(void *)&a4;
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  id v15 = a6;
  __int16 v16 = objc_alloc_init(MTRPluginPBMDeviceControllerMessage);
  if (v13)
  {
    unsigned int v17 = [[MTRPluginPBMVariableValue alloc] initWithObjectValue:v13];
    if (v17) {
      [(MTRPluginPBMDeviceControllerMessage *)v16 setValue:v17];
    }
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    -[MTRPluginRemoteClient sendControllerMessageToHomeWithID:controllerMessageType:queryRequestValue:errorBlock:replyBlock:]();
  }
  [(MTRPluginRemoteClient *)self sendMessageToHomeWithID:v12 messageType:v10 pbCodable:v16 errorBlock:v15 replyBlock:v14];
}

- (void)sendDeviceMessageToNodeWithID:(id)a3 homeID:(id)a4 deviceNodeMessageType:(int)a5 errorBlock:(id)a6 replyBlock:(id)a7
{
  uint64_t v9 = *(void *)&a5;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  id v15 = a6;
  __int16 v16 = objc_alloc_init(MTRPluginPBMDeviceNodeMessage);
  uint64_t v17 = [v12 unsignedLongValue];
  __int16 v18 = [(MTRPluginPBMDeviceNodeMessage *)v16 node];
  [v18 setNodeID:v17];

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v19 = 138413058;
    __int16 v20 = self;
    __int16 v21 = 2112;
    id v22 = v13;
    __int16 v23 = 2112;
    id v24 = v12;
    __int16 v25 = 1024;
    int v26 = v9;
    _os_log_debug_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%@ Sending request to resident for homeID: %@, nodeID: %@, for message type: %d", (uint8_t *)&v19, 0x26u);
  }
  [(MTRPluginRemoteClient *)self sendMessageToHomeWithID:v13 messageType:v9 pbCodable:v16 errorBlock:v15 replyBlock:v14];
}

- (void)deviceController:(id)a3 getIsRunningWithReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    -[MTRPluginRemoteClient deviceController:getIsRunningWithReply:]();
  }
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __64__MTRPluginRemoteClient_deviceController_getIsRunningWithReply___block_invoke;
  v14[3] = &unk_2653E6960;
  id v15 = v7;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __64__MTRPluginRemoteClient_deviceController_getIsRunningWithReply___block_invoke_2;
  v11[3] = &unk_2653E6988;
  v11[4] = v8;
  id v9 = v6;
  id v12 = v9;
  id v10 = v15;
  id v13 = v10;
  [(MTRPluginRemoteClient *)v8 sendControllerMessageToHomeWithID:v9 controllerMessageType:1 queryRequestValue:0 errorBlock:v14 replyBlock:v11];

  objc_sync_exit(v8);
}

uint64_t __64__MTRPluginRemoteClient_deviceController_getIsRunningWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __64__MTRPluginRemoteClient_deviceController_getIsRunningWithReply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    __64__MTRPluginRemoteClient_deviceController_getIsRunningWithReply___block_invoke_2_cold_1();
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)deviceController:(id)a3 getUniqueIdentifierWithReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    -[MTRPluginRemoteClient deviceController:getUniqueIdentifierWithReply:]();
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __71__MTRPluginRemoteClient_deviceController_getUniqueIdentifierWithReply___block_invoke;
  v12[3] = &unk_2653E6960;
  id v13 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __71__MTRPluginRemoteClient_deviceController_getUniqueIdentifierWithReply___block_invoke_2;
  v10[3] = &unk_2653E69B0;
  id v9 = v13;
  id v11 = v9;
  [(MTRPluginRemoteClient *)v8 sendControllerMessageToHomeWithID:v6 controllerMessageType:2 queryRequestValue:0 errorBlock:v12 replyBlock:v10];

  objc_sync_exit(v8);
}

void __71__MTRPluginRemoteClient_deviceController_getUniqueIdentifierWithReply___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F08C38] UUID];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __71__MTRPluginRemoteClient_deviceController_getUniqueIdentifierWithReply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = +[MTRPluginPBMVariableValueResponseMessage variableValueFromResponsePayloadData:a2];
  v4 = [v3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v3 object];
  }
  else
  {
    id v5 = 0;
  }

  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v5);
}

- (void)deviceController:(id)a3 controllerNodeIDWithReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    -[MTRPluginRemoteClient deviceController:controllerNodeIDWithReply:]();
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __68__MTRPluginRemoteClient_deviceController_controllerNodeIDWithReply___block_invoke;
  v12[3] = &unk_2653E6960;
  id v13 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __68__MTRPluginRemoteClient_deviceController_controllerNodeIDWithReply___block_invoke_54;
  v10[3] = &unk_2653E69B0;
  id v9 = v13;
  id v11 = v9;
  [(MTRPluginRemoteClient *)v8 sendControllerMessageToHomeWithID:v6 controllerMessageType:3 queryRequestValue:0 errorBlock:v12 replyBlock:v10];

  objc_sync_exit(v8);
}

uint64_t __68__MTRPluginRemoteClient_deviceController_controllerNodeIDWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __68__MTRPluginRemoteClient_deviceController_controllerNodeIDWithReply___block_invoke_54(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = +[MTRPluginPBMVariableValueResponseMessage variableValueFromResponsePayloadData:a2];
  v4 = [v3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v3 object];
  }
  else
  {
    id v5 = 0;
  }

  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v5);
}

- (void)deviceController:(id)a3 updateControllerConfiguration:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412802;
    id v10 = v8;
    __int16 v11 = 2112;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ Forwarding remote request to updateControllerConfiguration: %@ state: %@", (uint8_t *)&v9, 0x20u);
  }
  [(MTRPluginRemoteClient *)v8 sendControllerMessageToHomeWithID:v6 controllerMessageType:9 queryRequestValue:v7 errorBlock:0 replyBlock:0];
  objc_sync_exit(v8);
}

- (void)deviceController:(id)a3 nodeID:(id)a4 getStateWithReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = self;
  objc_sync_enter(v11);
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    -[MTRPluginRemoteClient deviceController:nodeID:getStateWithReply:]();
  }
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __67__MTRPluginRemoteClient_deviceController_nodeID_getStateWithReply___block_invoke;
  v18[3] = &unk_2653E69D8;
  v18[4] = v11;
  id v19 = v9;
  id v12 = v8;
  id v20 = v12;
  id v21 = v10;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __67__MTRPluginRemoteClient_deviceController_nodeID_getStateWithReply___block_invoke_55;
  v15[3] = &unk_2653E6988;
  v15[4] = v11;
  id v13 = v19;
  id v16 = v13;
  id v14 = v21;
  id v17 = v14;
  [(MTRPluginRemoteClient *)v11 sendDeviceMessageToNodeWithID:v13 homeID:v12 deviceNodeMessageType:1000 errorBlock:v18 replyBlock:v15];

  objc_sync_exit(v11);
}

uint64_t __67__MTRPluginRemoteClient_deviceController_nodeID_getStateWithReply___block_invoke(uint64_t a1)
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __67__MTRPluginRemoteClient_deviceController_nodeID_getStateWithReply___block_invoke_cold_1();
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

uint64_t __67__MTRPluginRemoteClient_deviceController_nodeID_getStateWithReply___block_invoke_55(uint64_t a1, uint64_t a2)
{
  v3 = +[MTRPluginPBMVariableValueResponseMessage variableValueFromResponsePayloadData:a2];
  v4 = [v3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v3 object];
  }
  else
  {
    id v5 = 0;
  }

  uint64_t v6 = [v5 unsignedIntegerValue];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    __67__MTRPluginRemoteClient_deviceController_nodeID_getStateWithReply___block_invoke_55_cold_1(a1, v6, v7, v8, v9, v10, v11, v12);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)deviceController:(id)a3 nodeID:(id)a4 getDeviceCachePrimedWithReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = self;
  objc_sync_enter(v11);
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    -[MTRPluginRemoteClient deviceController:nodeID:getDeviceCachePrimedWithReply:]();
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __79__MTRPluginRemoteClient_deviceController_nodeID_getDeviceCachePrimedWithReply___block_invoke;
  v17[3] = &unk_2653E69D8;
  v17[4] = v11;
  id v12 = v9;
  id v18 = v12;
  id v13 = v8;
  id v19 = v13;
  id v20 = v10;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __79__MTRPluginRemoteClient_deviceController_nodeID_getDeviceCachePrimedWithReply___block_invoke_56;
  v15[3] = &unk_2653E69B0;
  id v14 = v20;
  id v16 = v14;
  [(MTRPluginRemoteClient *)v11 sendDeviceMessageToNodeWithID:v12 homeID:v13 deviceNodeMessageType:1001 errorBlock:v17 replyBlock:v15];

  objc_sync_exit(v11);
}

uint64_t __79__MTRPluginRemoteClient_deviceController_nodeID_getDeviceCachePrimedWithReply___block_invoke(uint64_t a1)
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __79__MTRPluginRemoteClient_deviceController_nodeID_getDeviceCachePrimedWithReply___block_invoke_cold_1();
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

uint64_t __79__MTRPluginRemoteClient_deviceController_nodeID_getDeviceCachePrimedWithReply___block_invoke_56(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = BOOLFromResponsePayload(a2);
  v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v3);
}

- (void)deviceController:(id)a3 nodeID:(id)a4 getEstimatedStartTimeWithReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = self;
  objc_sync_enter(v11);
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    -[MTRPluginRemoteClient deviceController:nodeID:getEstimatedStartTimeWithReply:]();
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __80__MTRPluginRemoteClient_deviceController_nodeID_getEstimatedStartTimeWithReply___block_invoke;
  v17[3] = &unk_2653E69D8;
  v17[4] = v11;
  id v12 = v9;
  id v18 = v12;
  id v13 = v8;
  id v19 = v13;
  id v20 = v10;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __80__MTRPluginRemoteClient_deviceController_nodeID_getEstimatedStartTimeWithReply___block_invoke_57;
  v15[3] = &unk_2653E69B0;
  id v14 = v20;
  id v16 = v14;
  [(MTRPluginRemoteClient *)v11 sendDeviceMessageToNodeWithID:v12 homeID:v13 deviceNodeMessageType:1003 errorBlock:v17 replyBlock:v15];

  objc_sync_exit(v11);
}

uint64_t __80__MTRPluginRemoteClient_deviceController_nodeID_getEstimatedStartTimeWithReply___block_invoke(uint64_t a1)
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __80__MTRPluginRemoteClient_deviceController_nodeID_getEstimatedStartTimeWithReply___block_invoke_cold_1();
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __80__MTRPluginRemoteClient_deviceController_nodeID_getEstimatedStartTimeWithReply___block_invoke_57(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = +[MTRPluginPBMVariableValueResponseMessage variableValueFromResponsePayloadData:a2];
  v4 = [v3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v3 object];
  }
  else
  {
    id v5 = 0;
  }

  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v5);
}

- (void)deviceController:(id)a3 nodeID:(id)a4 getEstimatedSubscriptionLatencyWithReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = self;
  objc_sync_enter(v11);
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    -[MTRPluginRemoteClient deviceController:nodeID:getEstimatedSubscriptionLatencyWithReply:]();
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __90__MTRPluginRemoteClient_deviceController_nodeID_getEstimatedSubscriptionLatencyWithReply___block_invoke;
  v17[3] = &unk_2653E69D8;
  v17[4] = v11;
  id v12 = v9;
  id v18 = v12;
  id v13 = v8;
  id v19 = v13;
  id v20 = v10;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __90__MTRPluginRemoteClient_deviceController_nodeID_getEstimatedSubscriptionLatencyWithReply___block_invoke_58;
  v15[3] = &unk_2653E69B0;
  id v14 = v20;
  id v16 = v14;
  [(MTRPluginRemoteClient *)v11 sendDeviceMessageToNodeWithID:v12 homeID:v13 deviceNodeMessageType:1004 errorBlock:v17 replyBlock:v15];

  objc_sync_exit(v11);
}

uint64_t __90__MTRPluginRemoteClient_deviceController_nodeID_getEstimatedSubscriptionLatencyWithReply___block_invoke(uint64_t a1)
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __90__MTRPluginRemoteClient_deviceController_nodeID_getEstimatedSubscriptionLatencyWithReply___block_invoke_cold_1();
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __90__MTRPluginRemoteClient_deviceController_nodeID_getEstimatedSubscriptionLatencyWithReply___block_invoke_58(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = +[MTRPluginPBMVariableValueResponseMessage variableValueFromResponsePayloadData:a2];
  v4 = [v3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v3 object];
  }
  else
  {
    id v5 = 0;
  }

  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v5);
}

- (void)deviceController:(id)a3 nodeID:(id)a4 readAttributeWithEndpointID:(id)a5 clusterID:(id)a6 attributeID:(id)a7 params:(id)a8 withReply:(id)a9
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = self;
  objc_sync_enter(v22);
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413826;
    __int16 v30 = v22;
    __int16 v31 = 2112;
    id v32 = v17;
    __int16 v33 = 2112;
    id v34 = v18;
    __int16 v35 = 2112;
    id v36 = v19;
    __int16 v37 = 2112;
    id v38 = v20;
    __int16 v39 = 2112;
    id v40 = v16;
    __int16 v41 = 2112;
    id v42 = v15;
    _os_log_debug_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%@ Forwarding remote request to readAttribute: endpointID (%@), clusterID (%@), attributeID (%@), readParams (%@) from device nodeID (%@) for controllerID %@", buf, 0x48u);
  }
  __int16 v23 = +[MTRPluginPBMDeviceNodeReadAttributeMessage deviceNodeReadAttributeMessageWithNodeID:v16 endpointID:v17 clusterID:v18 attributeID:v19 readParams:v20];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __116__MTRPluginRemoteClient_deviceController_nodeID_readAttributeWithEndpointID_clusterID_attributeID_params_withReply___block_invoke;
  v27[3] = &unk_2653E6A00;
  v27[4] = v22;
  id v28 = v21;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __116__MTRPluginRemoteClient_deviceController_nodeID_readAttributeWithEndpointID_clusterID_attributeID_params_withReply___block_invoke_60;
  v25[3] = &unk_2653E6A28;
  v25[4] = v22;
  id v24 = v28;
  id v26 = v24;
  [(MTRPluginRemoteClient *)v22 sendMessageToHomeWithID:v15 messageType:1005 pbCodable:v23 errorBlock:v27 replyBlock:v25];

  objc_sync_exit(v22);
}

void __116__MTRPluginRemoteClient_deviceController_nodeID_readAttributeWithEndpointID_clusterID_attributeID_params_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __116__MTRPluginRemoteClient_deviceController_nodeID_readAttributeWithEndpointID_clusterID_attributeID_params_withReply___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __116__MTRPluginRemoteClient_deviceController_nodeID_readAttributeWithEndpointID_clusterID_attributeID_params_withReply___block_invoke_60(uint64_t a1, uint64_t a2)
{
  id v3 = +[MTRPluginPBMVariableValueResponseMessage variableValueFromResponsePayloadData:a2];
  v4 = [v3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v3 object];
  }
  else
  {
    id v5 = 0;
  }

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    __116__MTRPluginRemoteClient_deviceController_nodeID_readAttributeWithEndpointID_clusterID_attributeID_params_withReply___block_invoke_60_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)deviceController:(id)a3 nodeID:(id)a4 readAttributePaths:(id)a5 withReply:(id)a6
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = self;
  objc_sync_enter(v14);
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    id v22 = v14;
    __int16 v23 = 2112;
    id v24 = v12;
    __int16 v25 = 2112;
    id v26 = v11;
    __int16 v27 = 2112;
    id v28 = v10;
    _os_log_debug_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%@ Forwarding remote request to read multiple attributes: %@ from device nodeID (%@) for controllerID %@", buf, 0x2Au);
  }
  id v15 = +[MTRPluginPBMDeviceNodeReadMultipleAttributesMessage deviceNodeReadMultipleAttributesMessageWithNodeID:v11 readAttributePaths:v12];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __78__MTRPluginRemoteClient_deviceController_nodeID_readAttributePaths_withReply___block_invoke;
  v19[3] = &unk_2653E6A00;
  v19[4] = v14;
  id v20 = v13;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __78__MTRPluginRemoteClient_deviceController_nodeID_readAttributePaths_withReply___block_invoke_62;
  v17[3] = &unk_2653E6A28;
  v17[4] = v14;
  id v16 = v20;
  id v18 = v16;
  [(MTRPluginRemoteClient *)v14 sendMessageToHomeWithID:v10 messageType:1015 pbCodable:v15 errorBlock:v19 replyBlock:v17];

  objc_sync_exit(v14);
}

void __78__MTRPluginRemoteClient_deviceController_nodeID_readAttributePaths_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __78__MTRPluginRemoteClient_deviceController_nodeID_readAttributePaths_withReply___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __78__MTRPluginRemoteClient_deviceController_nodeID_readAttributePaths_withReply___block_invoke_62(uint64_t a1, uint64_t a2)
{
  id v3 = +[MTRPluginPBMVariableValueResponseMessage variableValueFromResponsePayloadData:a2];
  v4 = [v3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v3 object];
  }
  else
  {
    id v5 = 0;
  }

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    __78__MTRPluginRemoteClient_deviceController_nodeID_readAttributePaths_withReply___block_invoke_62_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)deviceController:(id)a3 nodeID:(id)a4 writeAttributeWithEndpointID:(id)a5 clusterID:(id)a6 attributeID:(id)a7 value:(id)a8 expectedValueInterval:(id)a9 timedWriteTimeout:(id)a10
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = self;
  objc_sync_enter(v24);
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413826;
    __int16 v27 = v24;
    __int16 v28 = 2112;
    id v29 = v18;
    __int16 v30 = 2112;
    id v31 = v19;
    __int16 v32 = 2112;
    id v33 = v20;
    __int16 v34 = 2112;
    id v35 = v21;
    __int16 v36 = 2112;
    id v37 = v17;
    __int16 v38 = 2112;
    id v39 = v16;
    _os_log_debug_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%@ Forwarding remote request to writeAttribute: endpointID (%@), clusterID (%@), attributeID (%@), value (%@) from device nodeID (%@) for controllerID %@", buf, 0x48u);
  }
  __int16 v25 = +[MTRPluginPBMDeviceNodeWriteAttributeMessage deviceNodeWriteAttributeMessageWithNodeID:v17 endpointID:v18 clusterID:v19 attributeID:v20 value:v21 expectedValueInterval:v22 timedWriteTimeout:v23];
  [(MTRPluginRemoteClient *)v24 sendMessageToHomeWithID:v16 messageType:1006 pbCodable:v25 errorBlock:0 replyBlock:0];

  objc_sync_exit(v24);
}

- (void)deviceController:(id)a3 nodeID:(id)a4 invokeCommandWithEndpointID:(id)a5 clusterID:(id)a6 commandID:(id)a7 commandFields:(id)a8 expectedValues:(id)a9 expectedValueInterval:(id)a10 timedInvokeTimeout:(id)a11 serverSideProcessingTimeout:(id)a12 completion:(id)a13
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v32 = a3;
  id v33 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  id v25 = a12;
  id v26 = a13;
  __int16 v27 = self;
  objc_sync_enter(v27);
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138414850;
    id v39 = v27;
    __int16 v40 = 2112;
    id v41 = v18;
    __int16 v42 = 2112;
    id v43 = v19;
    __int16 v44 = 2112;
    id v45 = v20;
    __int16 v46 = 2112;
    id v47 = v21;
    __int16 v48 = 2112;
    id v49 = v22;
    __int16 v50 = 2112;
    id v51 = v23;
    __int16 v52 = 2112;
    id v53 = v24;
    __int16 v54 = 2112;
    id v55 = v25;
    __int16 v56 = 2112;
    id v57 = v33;
    __int16 v58 = 2112;
    id v59 = v32;
    _os_log_debug_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%@ Forwarding remote request to invokeCommand: endpointID (%@), clusterID (%@), commandID (%@), commandFields (%@), expectedValues (%@),                expectedValueInterval (%@), timedInvokeTimeout (%@), serverSideProcessingTimeout (%@), from device nodeID (%@) for controllerID %@", buf, 0x70u);
  }
  id v31 = v21;
  __int16 v28 = +[MTRPluginPBMDeviceNodeInvokeCommmandMessage deviceNodeInvokeCommandMessageWithNodeID:v33 invokeCommandWithEndpointID:v18 clusterID:v19 commandID:v20 commandFields:v21 expectedValues:v22 expectedValueInterval:v23 timedInvokeTimeout:v24 serverSideProcessingTimeout:v25];
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __206__MTRPluginRemoteClient_deviceController_nodeID_invokeCommandWithEndpointID_clusterID_commandID_commandFields_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_completion___block_invoke;
  v36[3] = &unk_2653E6A00;
  v36[4] = v27;
  id v37 = v26;
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __206__MTRPluginRemoteClient_deviceController_nodeID_invokeCommandWithEndpointID_clusterID_commandID_commandFields_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_completion___block_invoke_65;
  v34[3] = &unk_2653E6A28;
  v34[4] = v27;
  id v29 = v37;
  id v35 = v29;
  [(MTRPluginRemoteClient *)v27 sendMessageToHomeWithID:v32 messageType:1007 pbCodable:v28 errorBlock:v36 replyBlock:v34];

  objc_sync_exit(v27);
}

void __206__MTRPluginRemoteClient_deviceController_nodeID_invokeCommandWithEndpointID_clusterID_commandID_commandFields_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __206__MTRPluginRemoteClient_deviceController_nodeID_invokeCommandWithEndpointID_clusterID_commandID_commandFields_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_completion___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __206__MTRPluginRemoteClient_deviceController_nodeID_invokeCommandWithEndpointID_clusterID_commandID_commandFields_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_completion___block_invoke_65(uint64_t a1, uint64_t a2)
{
  id v3 = +[MTRPluginPBMVariableValueResponseMessage variableValueFromResponsePayloadData:a2];
  v4 = [v3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v3 object];
  }
  else
  {
    id v5 = 0;
  }

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    __206__MTRPluginRemoteClient_deviceController_nodeID_invokeCommandWithEndpointID_clusterID_commandID_commandFields_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_completion___block_invoke_65_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)deviceController:(id)a3 nodeID:(id)a4 downloadLogOfType:(int64_t)a5 timeout:(double)a6 completion:(id)a7
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  id v15 = self;
  objc_sync_enter(v15);
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413314;
    id v23 = v15;
    __int16 v24 = 1024;
    int v25 = a5;
    __int16 v26 = 2048;
    double v27 = a6;
    __int16 v28 = 2112;
    id v29 = v13;
    __int16 v30 = 2112;
    id v31 = v12;
    _os_log_debug_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%@ Forwarding remote request to downloadLogOfType: (%d), timeout (%lf), from device nodeID (%@) for controllerID %@", buf, 0x30u);
  }
  id v16 = +[MTRPluginPBMDeviceNodeDownloadDiagnosticLog deviceNodeDownloadDiagnosticLogOfType:a5 timeout:v13 nodeID:a6];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __86__MTRPluginRemoteClient_deviceController_nodeID_downloadLogOfType_timeout_completion___block_invoke;
  v20[3] = &unk_2653E6A00;
  v20[4] = v15;
  id v21 = v14;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __86__MTRPluginRemoteClient_deviceController_nodeID_downloadLogOfType_timeout_completion___block_invoke_67;
  v18[3] = &unk_2653E6A28;
  v18[4] = v15;
  id v17 = v21;
  id v19 = v17;
  [(MTRPluginRemoteClient *)v15 sendMessageToHomeWithID:v12 messageType:1016 pbCodable:v16 errorBlock:v20 replyBlock:v18];

  objc_sync_exit(v15);
}

void __86__MTRPluginRemoteClient_deviceController_nodeID_downloadLogOfType_timeout_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __86__MTRPluginRemoteClient_deviceController_nodeID_downloadLogOfType_timeout_completion___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __86__MTRPluginRemoteClient_deviceController_nodeID_downloadLogOfType_timeout_completion___block_invoke_67(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = 0;
  id v3 = +[MTRPluginPBMDeviceNodeDownloadDiagnosticLog urlFromResponsePayload:a2 error:&v6];
  id v4 = v6;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ URL (%@) from response diagnostic log, error: %@", buf, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)messageTransport:(id)a3 handleDeviceStateChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  __int16 v9 = [MTRPluginPBMDeviceNodeMessage alloc];
  id v10 = [v7 messageData];
  __int16 v11 = [(MTRPluginPBMDeviceNodeMessage *)v9 initWithData:v10];

  if (!v11 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[MTRPluginRemoteClient messageTransport:handleDeviceStateChanged:]();
  }
  id v12 = NSNumber;
  uint64_t v13 = [(MTRPluginPBMDeviceNodeMessage *)v11 node];
  id v14 = objc_msgSend(v12, "numberWithUnsignedLongLong:", objc_msgSend(v13, "nodeID"));

  id v15 = [(MTRPluginPBMDeviceNodeMessage *)v11 value];
  id v16 = [v15 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v17 = [(MTRPluginPBMDeviceNodeMessage *)v11 value];
    id v18 = [v17 object];
  }
  else
  {
    id v18 = 0;
  }

  if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    if (!v14) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  -[MTRPluginRemoteClient messageTransport:handleDeviceStateChanged:]();
  if (v14)
  {
LABEL_9:
    id v19 = [(MTRPluginRemoteClient *)v8 client];
    id v20 = [v19 clientProxy];
    objc_msgSend(v20, "device:stateChanged:", v14, objc_msgSend(v18, "unsignedIntegerValue"));
  }
LABEL_10:
  id v21 = [v7 responseHandler];

  if (v21)
  {
    id v22 = [v7 responseHandler];
    v22[2](v22, 0, 0);
  }
  objc_sync_exit(v8);
}

- (void)messageTransport:(id)a3 handleDeviceAttributeReport:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  __int16 v9 = [MTRPluginPBMDeviceNodeMessage alloc];
  id v10 = [v7 messageData];
  __int16 v11 = [(MTRPluginPBMDeviceNodeMessage *)v9 initWithData:v10];

  if (!v11 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[MTRPluginRemoteClient messageTransport:handleDeviceAttributeReport:]();
  }
  id v12 = NSNumber;
  uint64_t v13 = [(MTRPluginPBMDeviceNodeMessage *)v11 node];
  id v14 = objc_msgSend(v12, "numberWithUnsignedLongLong:", objc_msgSend(v13, "nodeID"));

  id v15 = [(MTRPluginPBMDeviceNodeMessage *)v11 value];
  id v16 = [v15 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v17 = [(MTRPluginPBMDeviceNodeMessage *)v11 value];
    id v18 = [v17 object];
  }
  else
  {
    id v18 = 0;
  }

  if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    if (!v14) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  -[MTRPluginRemoteClient messageTransport:handleDeviceAttributeReport:]();
  if (v14)
  {
LABEL_9:
    id v19 = [(MTRPluginRemoteClient *)v8 client];
    id v20 = [v19 localClient];
    [v20 device:v14 injectAttributeReport:v18];

    id v21 = [(MTRPluginRemoteClient *)v8 client];
    id v22 = [v21 clientProxy];
    [v22 device:v14 receivedAttributeReport:v18];
  }
LABEL_10:
  id v23 = [v7 responseHandler];

  if (v23)
  {
    __int16 v24 = [v7 responseHandler];
    v24[2](v24, 0, 0);
  }
  objc_sync_exit(v8);
}

- (void)messageTransport:(id)a3 handleDeviceEventReport:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  __int16 v9 = [MTRPluginPBMDeviceNodeMessage alloc];
  id v10 = [v7 messageData];
  __int16 v11 = [(MTRPluginPBMDeviceNodeMessage *)v9 initWithData:v10];

  if (!v11 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[MTRPluginRemoteClient messageTransport:handleDeviceEventReport:]();
  }
  id v12 = NSNumber;
  uint64_t v13 = [(MTRPluginPBMDeviceNodeMessage *)v11 node];
  id v14 = objc_msgSend(v12, "numberWithUnsignedLongLong:", objc_msgSend(v13, "nodeID"));

  id v15 = [(MTRPluginPBMDeviceNodeMessage *)v11 value];
  id v16 = [v15 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v17 = [(MTRPluginPBMDeviceNodeMessage *)v11 value];
    id v18 = [v17 object];
  }
  else
  {
    id v18 = 0;
  }

  if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    if (!v14) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  -[MTRPluginRemoteClient messageTransport:handleDeviceEventReport:]();
  if (v14)
  {
LABEL_9:
    id v19 = [(MTRPluginRemoteClient *)v8 client];
    id v20 = [v19 localClient];
    [v20 device:v14 injectEventReport:v18];

    id v21 = [(MTRPluginRemoteClient *)v8 client];
    id v22 = [v21 clientProxy];
    [v22 device:v14 receivedEventReport:v18];
  }
LABEL_10:
  id v23 = [v7 responseHandler];

  if (v23)
  {
    __int16 v24 = [v7 responseHandler];
    v24[2](v24, 0, 0);
  }
  objc_sync_exit(v8);
}

- (void)messageTransport:(id)a3 handleDeviceBecameActive:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  __int16 v9 = [MTRPluginPBMDeviceNodeMessage alloc];
  id v10 = [v7 messageData];
  __int16 v11 = [(MTRPluginPBMDeviceNodeMessage *)v9 initWithData:v10];

  if (!v11 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[MTRPluginRemoteClient messageTransport:handleDeviceBecameActive:]();
  }
  id v12 = NSNumber;
  uint64_t v13 = [(MTRPluginPBMDeviceNodeMessage *)v11 node];
  id v14 = objc_msgSend(v12, "numberWithUnsignedLongLong:", objc_msgSend(v13, "nodeID"));

  if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    if (!v14) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  -[MTRPluginRemoteClient messageTransport:handleDeviceBecameActive:]();
  if (v14)
  {
LABEL_6:
    id v15 = [(MTRPluginRemoteClient *)v8 client];
    id v16 = [v15 clientProxy];
    [v16 deviceBecameActive:v14];
  }
LABEL_7:
  id v17 = [v7 responseHandler];

  if (v17)
  {
    id v18 = [v7 responseHandler];
    v18[2](v18, 0, 0);
  }
  objc_sync_exit(v8);
}

- (void)messageTransport:(id)a3 handleDeviceCachePrimed:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  __int16 v9 = [MTRPluginPBMDeviceNodeMessage alloc];
  id v10 = [v7 messageData];
  __int16 v11 = [(MTRPluginPBMDeviceNodeMessage *)v9 initWithData:v10];

  if (!v11 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[MTRPluginRemoteClient messageTransport:handleDeviceCachePrimed:]();
  }
  id v12 = NSNumber;
  uint64_t v13 = [(MTRPluginPBMDeviceNodeMessage *)v11 node];
  id v14 = objc_msgSend(v12, "numberWithUnsignedLongLong:", objc_msgSend(v13, "nodeID"));

  if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    if (!v14) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  -[MTRPluginRemoteClient messageTransport:handleDeviceCachePrimed:]();
  if (v14)
  {
LABEL_6:
    id v15 = [(MTRPluginRemoteClient *)v8 client];
    id v16 = [v15 clientProxy];
    [v16 deviceCachePrimed:v14];
  }
LABEL_7:
  id v17 = [v7 responseHandler];

  if (v17)
  {
    id v18 = [v7 responseHandler];
    v18[2](v18, 0, 0);
  }
  objc_sync_exit(v8);
}

- (void)messageTransport:(id)a3 handleDeviceConfigurationChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  __int16 v9 = [MTRPluginPBMDeviceNodeMessage alloc];
  id v10 = [v7 messageData];
  __int16 v11 = [(MTRPluginPBMDeviceNodeMessage *)v9 initWithData:v10];

  if (!v11 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[MTRPluginRemoteClient messageTransport:handleDeviceConfigurationChanged:]();
  }
  id v12 = NSNumber;
  uint64_t v13 = [(MTRPluginPBMDeviceNodeMessage *)v11 node];
  id v14 = objc_msgSend(v12, "numberWithUnsignedLongLong:", objc_msgSend(v13, "nodeID"));

  if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    if (!v14) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  -[MTRPluginRemoteClient messageTransport:handleDeviceConfigurationChanged:]();
  if (v14)
  {
LABEL_6:
    id v15 = [(MTRPluginRemoteClient *)v8 client];
    id v16 = [v15 clientProxy];
    [v16 deviceConfigurationChanged:v14];
  }
LABEL_7:
  id v17 = [v7 responseHandler];

  if (v17)
  {
    id v18 = [v7 responseHandler];
    v18[2](v18, 0, 0);
  }
  objc_sync_exit(v8);
}

- (void)messageTransport:(id)a3 handleDeviceInternalStateUpdated:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  __int16 v9 = [MTRPluginPBMDeviceNodeMessage alloc];
  id v10 = [v7 messageData];
  __int16 v11 = [(MTRPluginPBMDeviceNodeMessage *)v9 initWithData:v10];

  if (!v11 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[MTRPluginRemoteClient messageTransport:handleDeviceInternalStateUpdated:]();
  }
  id v12 = NSNumber;
  uint64_t v13 = [(MTRPluginPBMDeviceNodeMessage *)v11 node];
  id v14 = objc_msgSend(v12, "numberWithUnsignedLongLong:", objc_msgSend(v13, "nodeID"));

  id v15 = [(MTRPluginPBMDeviceNodeMessage *)v11 value];
  id v16 = [v15 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v17 = [(MTRPluginPBMDeviceNodeMessage *)v11 value];
    id v18 = [v17 object];
  }
  else
  {
    id v18 = 0;
  }

  if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    if (!v14) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  -[MTRPluginRemoteClient messageTransport:handleDeviceInternalStateUpdated:]();
  if (v14)
  {
LABEL_9:
    id v19 = [(MTRPluginRemoteClient *)v8 client];
    id v20 = [v19 clientProxy];
    [v20 device:v14 internalStateUpdated:v18];
  }
LABEL_10:
  id v21 = [v7 responseHandler];

  if (v21)
  {
    id v22 = [v7 responseHandler];
    v22[2](v22, 0, 0);
  }
  objc_sync_exit(v8);
}

- (MTRPluginClient)client
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
  return (MTRPluginClient *)WeakRetained;
}

- (void)setClient:(id)a3
{
}

- (MTRPluginProtobufMessageTransport)transport
{
  return (MTRPluginProtobufMessageTransport *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTransport:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transport, 0);
  objc_destroyWeak((id *)&self->_client);
}

- (void)sendOnewayMessageToHomeWithID:messageType:pbCodable:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_0(&dword_2558FC000, &_os_log_internal, v0, "%@ Attempting to send one way message %@ to home hub and homeID: %@", v1, v2, v3, v4, v5);
}

- (void)sendMessageToHomeWithID:messageType:pbCodable:errorBlock:replyBlock:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_0(&dword_2558FC000, &_os_log_internal, v0, "%@ Attempting to send message %@ to home hub and homeID: %@", v1, v2, v3, v4, v5);
}

void __93__MTRPluginRemoteClient_sendMessageToHomeWithID_messageType_pbCodable_errorBlock_replyBlock___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(unsigned int *)(a1 + 64);
  id v6 = +[MTRPluginPBMHeader messageTypeAsString:v5];
  uint64_t v7 = *(void *)(a1 + 40);
  int v8 = 138413314;
  uint64_t v9 = v4;
  __int16 v10 = 1024;
  int v11 = v5;
  __int16 v12 = 2112;
  uint64_t v13 = v6;
  __int16 v14 = 2112;
  uint64_t v15 = v7;
  __int16 v16 = 2112;
  uint64_t v17 = a2;
  _os_log_error_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%@ Response received for message type %d (%@) from homeID %@ with error: %@", (uint8_t *)&v8, 0x30u);
}

- (void)sendControllerMessageToHomeWithID:controllerMessageType:queryRequestValue:errorBlock:replyBlock:.cold.1()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  __int16 v2 = 1024;
  int v3 = v0;
  _os_log_debug_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%@ Sending request to resident for homeID: %@, for message type: %d", v1, 0x1Cu);
}

- (void)deviceController:getIsRunningWithReply:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_9(&dword_2558FC000, &_os_log_internal, v0, "%@ Forwarding remote request to get controller run state for controllerID: %@", v1, v2, v3, v4, v5);
}

void __64__MTRPluginRemoteClient_deviceController_getIsRunningWithReply___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_2558FC000, &_os_log_internal, v0, "%@ Remote controller %@ isRunning: %@", v1, v2, v3, v4, 2u);
}

- (void)deviceController:getUniqueIdentifierWithReply:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_9(&dword_2558FC000, &_os_log_internal, v0, "%@ Forwarding remote request to get controller unique ID for controllerID: %@", v1, v2, v3, v4, v5);
}

- (void)deviceController:controllerNodeIDWithReply:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_9(&dword_2558FC000, &_os_log_internal, v0, "%@ Forwarding remote request to get controller node ID for controllerID: %@", v1, v2, v3, v4, v5);
}

- (void)deviceController:nodeID:getStateWithReply:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_0(&dword_2558FC000, &_os_log_internal, v0, "%@ Forwarding remote request to get device state for nodeID: %@ for controllerID: %@", v1, v2, v3, v4, v5);
}

void __67__MTRPluginRemoteClient_deviceController_nodeID_getStateWithReply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_13(&dword_2558FC000, &_os_log_internal, v0, "%@ Failed to get state of device %@ from controller %@", v1, v2, v3, v4, 2u);
}

void __67__MTRPluginRemoteClient_deviceController_nodeID_getStateWithReply___block_invoke_55_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)deviceController:nodeID:getDeviceCachePrimedWithReply:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_0(&dword_2558FC000, &_os_log_internal, v0, "%@ Forwarding remote request to get device is cache primed for nodeID: %@ for controllerID: %@", v1, v2, v3, v4, v5);
}

void __79__MTRPluginRemoteClient_deviceController_nodeID_getDeviceCachePrimedWithReply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_13(&dword_2558FC000, &_os_log_internal, v0, "%@ Failed to get cachePrimed of device %@ from controller %@", v1, v2, v3, v4, 2u);
}

- (void)deviceController:nodeID:getEstimatedStartTimeWithReply:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_0(&dword_2558FC000, &_os_log_internal, v0, "%@ Forwarding remote request to get device estimatedStartTime for nodeID: %@ for controllerID: %@", v1, v2, v3, v4, v5);
}

void __80__MTRPluginRemoteClient_deviceController_nodeID_getEstimatedStartTimeWithReply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_13(&dword_2558FC000, &_os_log_internal, v0, "%@ Failed to getEstimatedStartTime of device %@ from controller %@", v1, v2, v3, v4, 2u);
}

- (void)deviceController:nodeID:getEstimatedSubscriptionLatencyWithReply:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_0(&dword_2558FC000, &_os_log_internal, v0, "%@ Forwarding remote request to get device estimatedSubscriptionLatency for nodeID: %@ for controllerID: %@", v1, v2, v3, v4, v5);
}

void __90__MTRPluginRemoteClient_deviceController_nodeID_getEstimatedSubscriptionLatencyWithReply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_13(&dword_2558FC000, &_os_log_internal, v0, "%@ Failed to getEstimatedSubscriptionLatency of device %@ from controller %@", v1, v2, v3, v4, 2u);
}

void __116__MTRPluginRemoteClient_deviceController_nodeID_readAttributeWithEndpointID_clusterID_attributeID_params_withReply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_2558FC000, &_os_log_internal, v0, "%@ Failed to readAttribute with error: %@", v1, v2, v3, v4, 2u);
}

void __116__MTRPluginRemoteClient_deviceController_nodeID_readAttributeWithEndpointID_clusterID_attributeID_params_withReply___block_invoke_60_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_9(&dword_2558FC000, &_os_log_internal, v0, "%@ Successfully finished readAttribute with value: %@", v1, v2, v3, v4, 2u);
}

void __78__MTRPluginRemoteClient_deviceController_nodeID_readAttributePaths_withReply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_2558FC000, &_os_log_internal, v0, "%@ Failed to readMultipleAttributes with error: %@", v1, v2, v3, v4, 2u);
}

void __78__MTRPluginRemoteClient_deviceController_nodeID_readAttributePaths_withReply___block_invoke_62_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_9(&dword_2558FC000, &_os_log_internal, v0, "%@ Successfully finished readMultipleAttributes with value: %@", v1, v2, v3, v4, 2u);
}

void __206__MTRPluginRemoteClient_deviceController_nodeID_invokeCommandWithEndpointID_clusterID_commandID_commandFields_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_2558FC000, &_os_log_internal, v0, "%@ Failed to complete invokeCommand with error: %@", v1, v2, v3, v4, 2u);
}

void __206__MTRPluginRemoteClient_deviceController_nodeID_invokeCommandWithEndpointID_clusterID_commandID_commandFields_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_completion___block_invoke_65_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_9(&dword_2558FC000, &_os_log_internal, v0, "%@ Successfully completed invokeCommand with response: %@", v1, v2, v3, v4, 2u);
}

void __86__MTRPluginRemoteClient_deviceController_nodeID_downloadLogOfType_timeout_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_2558FC000, &_os_log_internal, v0, "%@ Failed to complete download diagnostic log with error: %@", v1, v2, v3, v4, 2u);
}

- (void)messageTransport:handleDeviceStateChanged:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_0(&dword_2558FC000, &_os_log_internal, v0, "%@ Received state changed for node ID: %@, state: %@", v1, v2, v3, v4, v5);
}

- (void)messageTransport:handleDeviceStateChanged:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_2558FC000, &_os_log_internal, v0, "%@ received invalid device state changed from message: %@", v1, v2, v3, v4, v5);
}

- (void)messageTransport:handleDeviceAttributeReport:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_0(&dword_2558FC000, &_os_log_internal, v0, "%@ Received attribute report for node ID: %@, report: %@", v1, v2, v3, v4, v5);
}

- (void)messageTransport:handleDeviceAttributeReport:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_2558FC000, &_os_log_internal, v0, "%@ received invalid attribute report format from message: %@", v1, v2, v3, v4, v5);
}

- (void)messageTransport:handleDeviceEventReport:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_0(&dword_2558FC000, &_os_log_internal, v0, "%@ Received event report for node ID: %@, report: %@", v1, v2, v3, v4, v5);
}

- (void)messageTransport:handleDeviceEventReport:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_2558FC000, &_os_log_internal, v0, "%@ received invalid device event report format from message: %@", v1, v2, v3, v4, v5);
}

- (void)messageTransport:handleDeviceBecameActive:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_9(&dword_2558FC000, &_os_log_internal, v0, "%@ Received device became active for node ID: %@", v1, v2, v3, v4, v5);
}

- (void)messageTransport:handleDeviceBecameActive:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_2558FC000, &_os_log_internal, v0, "%@ received invalid device became active format from message: %@", v1, v2, v3, v4, v5);
}

- (void)messageTransport:handleDeviceCachePrimed:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_9(&dword_2558FC000, &_os_log_internal, v0, "%@ Received device cache primed for node ID: %@", v1, v2, v3, v4, v5);
}

- (void)messageTransport:handleDeviceCachePrimed:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_2558FC000, &_os_log_internal, v0, "%@ received invalid device is cached primed format from message: %@", v1, v2, v3, v4, v5);
}

- (void)messageTransport:handleDeviceConfigurationChanged:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_9(&dword_2558FC000, &_os_log_internal, v0, "%@ Received device configChanged for node ID: %@", v1, v2, v3, v4, v5);
}

- (void)messageTransport:handleDeviceConfigurationChanged:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_2558FC000, &_os_log_internal, v0, "%@ received invalid device configurationChanged format from message: %@", v1, v2, v3, v4, v5);
}

- (void)messageTransport:handleDeviceInternalStateUpdated:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_9(&dword_2558FC000, &_os_log_internal, v0, "%@ Received device internal state changed for node ID: %@", v1, v2, v3, v4, v5);
}

- (void)messageTransport:handleDeviceInternalStateUpdated:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_2558FC000, &_os_log_internal, v0, "%@ received invalid device internalStateUpdated format from message: %@", v1, v2, v3, v4, v5);
}

@end