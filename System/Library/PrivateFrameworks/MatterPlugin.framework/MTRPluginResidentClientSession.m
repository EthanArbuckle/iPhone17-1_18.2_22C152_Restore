@interface MTRPluginResidentClientSession
- (MTRPluginProtobufMessageTransport)transport;
- (MTRPluginResidentClientSession)initWithTransport:(id)a3 workQueue:(id)a4 sessionID:(id)a5 homeID:(id)a6 peerAddress:(id)a7;
- (NSDate)timeOfLastActivity;
- (NSMutableSet)registeredNodeIDs;
- (NSMutableSet)subscribedMTRDevices;
- (NSString)description;
- (NSUUID)homeID;
- (NSUUID)sessionID;
- (OS_dispatch_queue)workQueue;
- (OS_dispatch_source)internalStateUpdateSource;
- (id)_deviceNodeMessageForDevice:(id)a3 messageValue:(id)a4;
- (id)_dictionaryFromCommandFields:(id)a3;
- (id)_validateAndFindDeviceControllerForMessage:(id)a3 deviceControllerMessage:(id *)a4;
- (id)_validateAndFindDeviceControllerMatchingHomeInMessage:(id)a3;
- (id)_validateAndFindDeviceNodeForMessage:(id)a3;
- (id)deviceController;
- (id)peerAddress;
- (void)_registerForMessages;
- (void)_registerNodeID:(id)a3;
- (void)_sendMessageToHomeWithID:(id)a3 messageType:(int)a4 pbCodable:(id)a5 errorBlock:(id)a6 replyBlock:(id)a7;
- (void)_unregisterNodeID:(id)a3;
- (void)device:(id)a3 internalStateUpdated:(id)a4;
- (void)device:(id)a3 receivedAttributeReport:(id)a4;
- (void)device:(id)a3 receivedEventReport:(id)a4;
- (void)device:(id)a3 stateChanged:(unint64_t)a4;
- (void)deviceBecameActive:(id)a3;
- (void)deviceCachePrimed:(id)a3;
- (void)deviceConfigurationChanged:(id)a3;
- (void)invalidate;
- (void)messageTransport:(id)a3 handleCloseSession:(id)a4;
- (void)messageTransport:(id)a3 handleControllerConfigUpdate:(id)a4;
- (void)messageTransport:(id)a3 handleDeviceInvokeCommand:(id)a4;
- (void)messageTransport:(id)a3 handleDeviceReadAttribute:(id)a4;
- (void)messageTransport:(id)a3 handleDeviceReadMultipleAttributes:(id)a4;
- (void)messageTransport:(id)a3 handleDeviceWriteAttribute:(id)a4;
- (void)messageTransport:(id)a3 handleDownloadDiagnosticLog:(id)a4;
- (void)messageTransport:(id)a3 handleGetControllerIsRunning:(id)a4;
- (void)messageTransport:(id)a3 handleGetControllerNodeID:(id)a4;
- (void)messageTransport:(id)a3 handleGetControllerUniqueID:(id)a4;
- (void)messageTransport:(id)a3 handleGetDeviceEstimatedStartTime:(id)a4;
- (void)messageTransport:(id)a3 handleGetDeviceEstimatedSubscriptionLatency:(id)a4;
- (void)messageTransport:(id)a3 handleGetDeviceIsCachePrimed:(id)a4;
- (void)messageTransport:(id)a3 handleGetDeviceState:(id)a4;
- (void)messageTransport:(id)a3 updateTimeOfActivity:(id)a4;
- (void)setHomeID:(id)a3;
- (void)setInternalStateUpdateSource:(id)a3;
- (void)setPeerAddress:(id)a3;
- (void)setRegisteredNodeIDs:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setSubscribedMTRDevices:(id)a3;
- (void)setTimeOfLastActivity:(id)a3;
- (void)setTransport:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation MTRPluginResidentClientSession

- (MTRPluginResidentClientSession)initWithTransport:(id)a3 workQueue:(id)a4 sessionID:(id)a5 homeID:(id)a6 peerAddress:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v26.receiver = self;
  v26.super_class = (Class)MTRPluginResidentClientSession;
  v17 = [(MTRPluginResidentClientSession *)&v26 init];
  if (v17)
  {
    v18 = [MEMORY[0x263EFF910] date];
    [(MTRPluginResidentClientSession *)v17 setTimeOfLastActivity:v18];

    [(MTRPluginResidentClientSession *)v17 setSessionID:v14];
    [(MTRPluginResidentClientSession *)v17 setHomeID:v15];
    v19 = [MEMORY[0x263EFF9C0] set];
    [(MTRPluginResidentClientSession *)v17 setRegisteredNodeIDs:v19];

    v20 = [MEMORY[0x263EFF9C0] set];
    [(MTRPluginResidentClientSession *)v17 setSubscribedMTRDevices:v20];

    [(MTRPluginResidentClientSession *)v17 setTransport:v12];
    [(MTRPluginResidentClientSession *)v17 setWorkQueue:v13];
    v21 = (void *)[v16 copy];
    [(MTRPluginResidentClientSession *)v17 setPeerAddress:v21];

    v22 = [(MTRPluginResidentClientSession *)v17 workQueue];
    [v12 setDelegate:v17 delegateQueue:v22 forSessionID:v14];

    v23 = (void *)MEMORY[0x25A290B70]();
    [(MTRPluginResidentClientSession *)v17 _registerForMessages];
    v24 = v17;
  }

  return v17;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(MTRPluginResidentClientSession *)self sessionID];
  v7 = [(MTRPluginResidentClientSession *)self homeID];
  v8 = [(MTRPluginResidentClientSession *)self timeOfLastActivity];
  v9 = [v3 stringWithFormat:@"<%@: %p sid: %@ hid: %@ lastActivity: %@>", v5, self, v6, v7, v8];

  return (NSString *)v9;
}

- (id)deviceController
{
  v3 = +[MTRPluginDeviceControllerRegistry sharedInstance];
  v4 = [(MTRPluginResidentClientSession *)self homeID];
  v5 = [v3 deviceControllerForUUID:v4];

  return v5;
}

- (void)_registerNodeID:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(MTRPluginResidentClientSession *)self registeredNodeIDs];
  char v6 = [v5 containsObject:v4];

  if ((v6 & 1) == 0)
  {
    v7 = [(MTRPluginResidentClientSession *)self deviceController];
    v8 = [MEMORY[0x263F10DA8] deviceWithNodeID:v4 controller:v7];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138413058;
      v17 = self;
      __int16 v18 = 2112;
      uint64_t v19 = (uint64_t)v4;
      __int16 v20 = 2112;
      v21 = v7;
      __int16 v22 = 2112;
      v23 = v8;
      _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ register nodeID: %@, forController: %@, device: %@", (uint8_t *)&v16, 0x2Au);
    }
    if (v8)
    {
      v9 = [(MTRPluginResidentClientSession *)self registeredNodeIDs];
      [v9 addObject:v4];

      v10 = [(MTRPluginResidentClientSession *)self subscribedMTRDevices];
      [v10 addObject:v8];

      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138412546;
        v17 = self;
        __int16 v18 = 2112;
        uint64_t v19 = (uint64_t)v8;
        _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ Adding delegate for MTRDevice: %@", (uint8_t *)&v16, 0x16u);
      }
      v11 = [(MTRPluginResidentClientSession *)self workQueue];
      [v8 addDelegate:self queue:v11];

      id v12 = [v8 getAllAttributesReport];
      uint64_t v13 = [v12 count];
      BOOL v14 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
      if (v13)
      {
        if (v14)
        {
          uint64_t v15 = [v12 count];
          int v16 = 138412546;
          v17 = self;
          __int16 v18 = 2048;
          uint64_t v19 = v15;
          _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ Reporting all known attributes %lu", (uint8_t *)&v16, 0x16u);
        }
        [(MTRPluginResidentClientSession *)self device:v8 receivedAttributeReport:v12];
      }
      else if (v14)
      {
        int v16 = 138412290;
        v17 = self;
        _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ No known attributes to report", (uint8_t *)&v16, 0xCu);
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[MTRPluginResidentClientSession _registerNodeID:]();
    }
  }
}

- (void)_unregisterNodeID:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(MTRPluginResidentClientSession *)self registeredNodeIDs];
  int v6 = [v5 containsObject:v4];

  if (v6)
  {
    v7 = [(MTRPluginResidentClientSession *)self deviceController];
    v8 = [MEMORY[0x263F10DA8] deviceWithNodeID:v4 controller:v7];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138413058;
      id v12 = self;
      __int16 v13 = 2112;
      id v14 = v4;
      __int16 v15 = 2112;
      int v16 = v7;
      __int16 v17 = 2112;
      __int16 v18 = v8;
      _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ unregister nodeID: %@, forController: %@, device: %@", (uint8_t *)&v11, 0x2Au);
    }
    if (v8)
    {
      v9 = [(MTRPluginResidentClientSession *)self registeredNodeIDs];
      [v9 removeObject:v4];

      v10 = [(MTRPluginResidentClientSession *)self subscribedMTRDevices];
      [v10 removeObject:v8];

      [v8 removeDelegate:self];
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[MTRPluginResidentClientSession _unregisterNodeID:]();
    }
  }
}

- (void)_registerForMessages
{
  v3 = [(MTRPluginResidentClientSession *)self transport];
  id v4 = [(MTRPluginResidentClientSession *)self sessionID];
  [v3 registerForRequestMessageWithType:&unk_27046A878 requestHandler:sel_messageTransport_handleGetControllerIsRunning_ forSessionID:v4];

  v5 = [(MTRPluginResidentClientSession *)self transport];
  int v6 = [(MTRPluginResidentClientSession *)self sessionID];
  [v5 registerForRequestMessageWithType:&unk_27046A890 requestHandler:sel_messageTransport_handleGetControllerUniqueID_ forSessionID:v6];

  v7 = [(MTRPluginResidentClientSession *)self transport];
  v8 = [(MTRPluginResidentClientSession *)self sessionID];
  [v7 registerForRequestMessageWithType:&unk_27046A8A8 requestHandler:sel_messageTransport_handleGetControllerNodeID_ forSessionID:v8];

  v9 = [(MTRPluginResidentClientSession *)self transport];
  v10 = [(MTRPluginResidentClientSession *)self sessionID];
  [v9 registerForRequestMessageWithType:&unk_27046A8C0 requestHandler:sel_messageTransport_handleControllerConfigUpdate_ forSessionID:v10];

  int v11 = [(MTRPluginResidentClientSession *)self transport];
  id v12 = [(MTRPluginResidentClientSession *)self sessionID];
  [v11 registerForRequestMessageWithType:&unk_27046A8D8 requestHandler:sel_messageTransport_handleCloseSession_ forSessionID:v12];

  __int16 v13 = [(MTRPluginResidentClientSession *)self transport];
  id v14 = [(MTRPluginResidentClientSession *)self sessionID];
  [v13 registerForRequestMessageWithType:&unk_27046A8F0 requestHandler:sel_messageTransport_handleGetDeviceState_ forSessionID:v14];

  __int16 v15 = [(MTRPluginResidentClientSession *)self transport];
  int v16 = [(MTRPluginResidentClientSession *)self sessionID];
  [v15 registerForRequestMessageWithType:&unk_27046A908 requestHandler:sel_messageTransport_handleGetDeviceIsCachePrimed_ forSessionID:v16];

  __int16 v17 = [(MTRPluginResidentClientSession *)self transport];
  __int16 v18 = [(MTRPluginResidentClientSession *)self sessionID];
  [v17 registerForRequestMessageWithType:&unk_27046A920 requestHandler:sel_messageTransport_handleGetDeviceEstimatedStartTime_ forSessionID:v18];

  uint64_t v19 = [(MTRPluginResidentClientSession *)self transport];
  __int16 v20 = [(MTRPluginResidentClientSession *)self sessionID];
  [v19 registerForRequestMessageWithType:&unk_27046A938 requestHandler:sel_messageTransport_handleGetDeviceEstimatedSubscriptionLatency_ forSessionID:v20];

  v21 = [(MTRPluginResidentClientSession *)self transport];
  __int16 v22 = [(MTRPluginResidentClientSession *)self sessionID];
  [v21 registerForRequestMessageWithType:&unk_27046A950 requestHandler:sel_messageTransport_handleDeviceReadAttribute_ forSessionID:v22];

  v23 = [(MTRPluginResidentClientSession *)self transport];
  uint64_t v24 = [(MTRPluginResidentClientSession *)self sessionID];
  [v23 registerForRequestMessageWithType:&unk_27046A968 requestHandler:sel_messageTransport_handleDeviceReadMultipleAttributes_ forSessionID:v24];

  v25 = [(MTRPluginResidentClientSession *)self transport];
  objc_super v26 = [(MTRPluginResidentClientSession *)self sessionID];
  [v25 registerForRequestMessageWithType:&unk_27046A980 requestHandler:sel_messageTransport_handleDeviceWriteAttribute_ forSessionID:v26];

  v27 = [(MTRPluginResidentClientSession *)self transport];
  v28 = [(MTRPluginResidentClientSession *)self sessionID];
  [v27 registerForRequestMessageWithType:&unk_27046A998 requestHandler:sel_messageTransport_handleDeviceInvokeCommand_ forSessionID:v28];

  v29 = [(MTRPluginResidentClientSession *)self transport];
  v30 = [(MTRPluginResidentClientSession *)self sessionID];
  [v29 registerForRequestMessageWithType:&unk_27046A9B0 requestHandler:sel_messageTransport_handleDownloadDiagnosticLog_ forSessionID:v30];

  id v32 = [(MTRPluginResidentClientSession *)self deviceController];
  v31 = [(MTRPluginResidentClientSession *)self workQueue];
  [v32 addDeviceControllerDelegate:self queue:v31];
}

- (id)_validateAndFindDeviceControllerMatchingHomeInMessage:(id)a3
{
  id v4 = a3;
  v5 = [v4 homeIdentifier];
  int v6 = [(MTRPluginResidentClientSession *)self homeID];
  int v7 = [v5 isEqual:v6];

  if (!v7
    || ([(MTRPluginResidentClientSession *)self deviceController],
        (v8 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[MTRPluginResidentClientSession _validateAndFindDeviceControllerMatchingHomeInMessage:]();
    }
    v9 = [v4 responseHandler];
    v10 = [MEMORY[0x263F087E8] errorWithDomain:@"kMTRPluginErrorDomain" code:-1002 userInfo:0];
    ((void (**)(void, void *, void))v9)[2](v9, v10, 0);

    v8 = 0;
  }

  return v8;
}

- (id)_validateAndFindDeviceControllerForMessage:(id)a3 deviceControllerMessage:(id *)a4
{
  id v6 = a3;
  int v7 = +[MTRPluginPBMDeviceControllerMessage deviceControllerMessageFromMessage:v6];
  v8 = v7;
  if (v7)
  {
    if (a4) {
      *a4 = v7;
    }
    v9 = [(MTRPluginResidentClientSession *)self _validateAndFindDeviceControllerMatchingHomeInMessage:v6];
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[MTRPluginResidentClientSession _validateAndFindDeviceControllerForMessage:deviceControllerMessage:]();
    }
    v10 = [v6 responseHandler];
    int v11 = [MEMORY[0x263F087E8] errorWithDomain:@"kMTRPluginErrorDomain" code:-1007 userInfo:0];
    ((void (**)(void, void *, void))v10)[2](v10, v11, 0);

    v9 = 0;
  }

  return v9;
}

- (id)_validateAndFindDeviceNodeForMessage:(id)a3
{
  id v4 = a3;
  v5 = +[MTRPluginPBMDeviceNodeMessage deviceNodeMessageFromMessage:v4];
  if (!v5)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[MTRPluginResidentClientSession _validateAndFindDeviceNodeForMessage:]();
    }
    id v6 = [v4 responseHandler];
    v9 = [MEMORY[0x263F087E8] errorWithDomain:@"kMTRPluginErrorDomain" code:-1003 userInfo:0];
    ((void (**)(void, void *, void))v6)[2](v6, v9, 0);
    v10 = 0;
    goto LABEL_10;
  }
  id v6 = [(MTRPluginResidentClientSession *)self _validateAndFindDeviceControllerForMessage:v4 deviceControllerMessage:0];
  if (v6)
  {
    int v7 = NSNumber;
    v8 = [v5 node];
    v9 = objc_msgSend(v7, "numberWithUnsignedLongLong:", objc_msgSend(v8, "nodeID"));

    v10 = [MEMORY[0x263F10DA8] deviceWithNodeID:v9 controller:v6];
    if (!v10)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[MTRPluginResidentClientSession _validateAndFindDeviceNodeForMessage:]();
      }
      int v11 = [v4 responseHandler];
      id v12 = [MEMORY[0x263F087E8] errorWithDomain:@"kMTRPluginErrorDomain" code:-1001 userInfo:0];
      ((void (**)(void, void *, void))v11)[2](v11, v12, 0);
    }
LABEL_10:

    goto LABEL_12;
  }
  v10 = 0;
LABEL_12:

  return v10;
}

- (void)messageTransport:(id)a3 updateTimeOfActivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(MTRPluginResidentClientSession *)self workQueue];
  dispatch_assert_queue_V2(v8);

  v9 = self;
  objc_sync_enter(v9);
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    -[MTRPluginResidentClientSession messageTransport:updateTimeOfActivity:]();
  }
  [(MTRPluginResidentClientSession *)v9 setTimeOfLastActivity:v7];
  objc_sync_exit(v9);
}

- (void)messageTransport:(id)a3 handleGetControllerIsRunning:(id)a4
{
  v20[5] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(MTRPluginResidentClientSession *)self workQueue];
  dispatch_assert_queue_V2(v8);

  v9 = [v7 responseHandler];

  if (v9)
  {
    v10 = self;
    objc_sync_enter(v10);
    int v11 = [v7 responseHandler];

    if (v11)
    {
      id v12 = [(MTRPluginResidentClientSession *)v10 _validateAndFindDeviceControllerForMessage:v7 deviceControllerMessage:0];
      if (v12)
      {
        __int16 v13 = objc_alloc_init(MTRPluginPBMVariableValueResponseMessage);
        id v14 = [MTRPluginPBMVariableValue alloc];
        __int16 v15 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v12, "isRunning"));
        int v16 = [(MTRPluginPBMVariableValue *)v14 initWithObjectValue:v15];
        [(MTRPluginPBMVariableValueResponseMessage *)v13 setValue:v16];

        __int16 v17 = &_os_log_internal;
        id v18 = &_os_log_internal;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          -[MTRPluginResidentClientSession messageTransport:handleGetControllerIsRunning:]((uint64_t)v10, [v12 isRunning], (uint64_t)v7, (uint64_t)v20);
        }

        uint64_t v19 = [v7 responseHandler];
        ((void (**)(void, void, MTRPluginPBMVariableValueResponseMessage *))v19)[2](v19, 0, v13);
      }
    }
    objc_sync_exit(v10);
  }
}

- (void)messageTransport:(id)a3 handleGetControllerUniqueID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(MTRPluginResidentClientSession *)self workQueue];
  dispatch_assert_queue_V2(v8);

  v9 = [v7 responseHandler];

  if (v9)
  {
    v10 = self;
    objc_sync_enter(v10);
    int v11 = [v7 responseHandler];

    if (v11)
    {
      id v12 = [(MTRPluginResidentClientSession *)v10 _validateAndFindDeviceControllerForMessage:v7 deviceControllerMessage:0];
      if (v12)
      {
        __int16 v13 = objc_alloc_init(MTRPluginPBMVariableValueResponseMessage);
        id v14 = [MTRPluginPBMVariableValue alloc];
        __int16 v15 = [v12 uniqueIdentifier];
        int v16 = [(MTRPluginPBMVariableValue *)v14 initWithObjectValue:v15];
        [(MTRPluginPBMVariableValueResponseMessage *)v13 setValue:v16];

        __int16 v17 = &_os_log_internal;
        id v18 = &_os_log_internal;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          [v12 uniqueIdentifier];
          objc_claimAutoreleasedReturnValue();
          -[MTRPluginResidentClientSession messageTransport:handleGetControllerUniqueID:]();
        }

        uint64_t v19 = [v7 responseHandler];
        ((void (**)(void, void, MTRPluginPBMVariableValueResponseMessage *))v19)[2](v19, 0, v13);
      }
    }
    objc_sync_exit(v10);
  }
}

- (void)messageTransport:(id)a3 handleGetControllerNodeID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(MTRPluginResidentClientSession *)self workQueue];
  dispatch_assert_queue_V2(v8);

  v9 = [v7 responseHandler];

  if (v9)
  {
    v10 = self;
    objc_sync_enter(v10);
    int v11 = [v7 responseHandler];

    if (v11)
    {
      id v12 = [(MTRPluginResidentClientSession *)v10 _validateAndFindDeviceControllerForMessage:v7 deviceControllerMessage:0];
      if (v12)
      {
        __int16 v13 = objc_alloc_init(MTRPluginPBMVariableValueResponseMessage);
        id v14 = [MTRPluginPBMVariableValue alloc];
        __int16 v15 = [v12 controllerNodeID];
        int v16 = [(MTRPluginPBMVariableValue *)v14 initWithObjectValue:v15];
        [(MTRPluginPBMVariableValueResponseMessage *)v13 setValue:v16];

        __int16 v17 = &_os_log_internal;
        id v18 = &_os_log_internal;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          [v12 controllerNodeID];
          objc_claimAutoreleasedReturnValue();
          -[MTRPluginResidentClientSession messageTransport:handleGetControllerNodeID:]();
        }

        uint64_t v19 = [v7 responseHandler];
        ((void (**)(void, void, MTRPluginPBMVariableValueResponseMessage *))v19)[2](v19, 0, v13);
      }
    }
    objc_sync_exit(v10);
  }
}

- (void)messageTransport:(id)a3 handleControllerConfigUpdate:(id)a4
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v38 = a3;
  id v39 = a4;
  id v6 = [(MTRPluginResidentClientSession *)self workQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = [v39 responseHandler];

  if (v7)
  {
    v8 = self;
    objc_sync_enter(v8);
    v9 = [v39 responseHandler];

    if (v9)
    {
      id v50 = 0;
      uint64_t v10 = [(MTRPluginResidentClientSession *)v8 _validateAndFindDeviceControllerForMessage:v39 deviceControllerMessage:&v50];
      id v11 = v50;
      v41 = (void *)v10;
      if (v10 && v11)
      {
        v36 = v11;
        id v12 = [v11 value];
        __int16 v13 = [v12 object];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v14 = [v36 value];
          v37 = [v14 object];
        }
        else
        {
          v37 = 0;
        }

        __int16 v15 = [(MTRPluginResidentClientSession *)v8 registeredNodeIDs];
        v40 = (void *)[v15 mutableCopy];

        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        int v16 = [v37 objectForKey:*MEMORY[0x263F10BA0]];
        uint64_t v17 = [v16 countByEnumeratingWithState:&v46 objects:v60 count:16];
        if (v17)
        {
          uint64_t v18 = *(void *)v47;
          uint64_t v19 = *MEMORY[0x263F10B98];
          __int16 v20 = &_os_log_internal;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v47 != v18) {
                objc_enumerationMutation(v16);
              }
              __int16 v22 = *(void **)(*((void *)&v46 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & (v22 != 0)) != 0)
              {
                v23 = [v22 objectForKey:v19];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  uint64_t v24 = [v22 objectForKey:v19];

                  if (v24)
                  {
                    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412802;
                      v53 = v8;
                      __int16 v54 = 2112;
                      v55 = v41;
                      __int16 v56 = 2112;
                      v57 = v24;
                      _os_log_impl(&dword_2558FC000, v20, OS_LOG_TYPE_DEFAULT, "%@  => controller: %@ register nodeID: %@", buf, 0x20u);
                    }
                    [(MTRPluginResidentClientSession *)v8 _registerNodeID:v24];
                    [v40 removeObject:v24];
                  }
                }
                else
                {

                  uint64_t v24 = 0;
                }
              }
              else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                -[MTRPluginResidentClientSession messageTransport:handleControllerConfigUpdate:](v58, (uint64_t)v22, &v59);
              }
            }
            uint64_t v17 = [v16 countByEnumeratingWithState:&v46 objects:v60 count:16];
          }
          while (v17);
        }

        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v25 = v40;
        uint64_t v26 = [v25 countByEnumeratingWithState:&v42 objects:v51 count:16];
        if (v26)
        {
          uint64_t v27 = *(void *)v43;
          v28 = &_os_log_internal;
          do
          {
            for (uint64_t j = 0; j != v26; ++j)
            {
              if (*(void *)v43 != v27) {
                objc_enumerationMutation(v25);
              }
              v30 = *(void **)(*((void *)&v42 + 1) + 8 * j);
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412802;
                v53 = v8;
                __int16 v54 = 2112;
                v55 = v41;
                __int16 v56 = 2112;
                v57 = v30;
                _os_log_impl(&dword_2558FC000, v28, OS_LOG_TYPE_DEFAULT, "%@  => controller: %@ unregister nodeIDToUnregister: %@", buf, 0x20u);
              }
              [(MTRPluginResidentClientSession *)v8 _unregisterNodeID:v30];
            }
            uint64_t v26 = [v25 countByEnumeratingWithState:&v42 objects:v51 count:16];
          }
          while (v26);
        }

        v31 = &_os_log_internal;
        id v32 = &_os_log_internal;
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          v33 = [(MTRPluginResidentClientSession *)v8 registeredNodeIDs];
          *(_DWORD *)buf = 138412802;
          v53 = v8;
          __int16 v54 = 2112;
          v55 = v41;
          __int16 v56 = 2112;
          v57 = v33;
          _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@  => controller: %@ self.registeredNodeIDs: %@", buf, 0x20u);
        }
        id v11 = v36;
      }
      v34 = v11;
    }
    v35 = [v39 responseHandler];
    v35[2](v35, 0, 0);

    objc_sync_exit(v8);
  }
}

- (void)messageTransport:(id)a3 handleCloseSession:(id)a4
{
  v5 = [(MTRPluginResidentClientSession *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[MTRPluginResidentClientSession messageTransport:handleCloseSession:](self);
  }
  id v6 = +[MTRPluginResidentServer sharedInstance];
  [v6 removeResidentClientSession:self];
}

- (void)messageTransport:(id)a3 handleGetDeviceState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(MTRPluginResidentClientSession *)self workQueue];
  dispatch_assert_queue_V2(v8);

  v9 = [v7 responseHandler];

  if (v9)
  {
    uint64_t v10 = self;
    objc_sync_enter(v10);
    id v11 = [v7 responseHandler];

    if (v11)
    {
      id v12 = [(MTRPluginResidentClientSession *)v10 _validateAndFindDeviceNodeForMessage:v7];
      if (v12)
      {
        __int16 v13 = objc_alloc_init(MTRPluginPBMVariableValueResponseMessage);
        id v14 = [MTRPluginPBMVariableValue alloc];
        __int16 v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "state"));
        int v16 = [(MTRPluginPBMVariableValue *)v14 initWithObjectValue:v15];
        [(MTRPluginPBMVariableValueResponseMessage *)v13 setValue:v16];

        uint64_t v17 = &_os_log_internal;
        id v18 = &_os_log_internal;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          [v12 nodeID];
          objc_claimAutoreleasedReturnValue();
          -[MTRPluginResidentClientSession messageTransport:handleGetDeviceState:]();
        }

        uint64_t v19 = [v7 responseHandler];
        ((void (**)(void, void, MTRPluginPBMVariableValueResponseMessage *))v19)[2](v19, 0, v13);
      }
    }
    objc_sync_exit(v10);
  }
}

- (void)messageTransport:(id)a3 handleGetDeviceIsCachePrimed:(id)a4
{
  v20[5] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(MTRPluginResidentClientSession *)self workQueue];
  dispatch_assert_queue_V2(v8);

  v9 = [v7 responseHandler];

  if (v9)
  {
    uint64_t v10 = self;
    objc_sync_enter(v10);
    id v11 = [v7 responseHandler];

    if (v11)
    {
      id v12 = [(MTRPluginResidentClientSession *)v10 _validateAndFindDeviceNodeForMessage:v7];
      if (v12)
      {
        __int16 v13 = objc_alloc_init(MTRPluginPBMVariableValueResponseMessage);
        id v14 = [MTRPluginPBMVariableValue alloc];
        __int16 v15 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v12, "deviceCachePrimed"));
        int v16 = [(MTRPluginPBMVariableValue *)v14 initWithObjectValue:v15];
        [(MTRPluginPBMVariableValueResponseMessage *)v13 setValue:v16];

        uint64_t v17 = &_os_log_internal;
        id v18 = &_os_log_internal;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          -[MTRPluginResidentClientSession messageTransport:handleGetDeviceIsCachePrimed:]((uint64_t)v10, [v12 deviceCachePrimed], (uint64_t)v7, (uint64_t)v20);
        }

        uint64_t v19 = [v7 responseHandler];
        ((void (**)(void, void, MTRPluginPBMVariableValueResponseMessage *))v19)[2](v19, 0, v13);
      }
    }
    objc_sync_exit(v10);
  }
}

- (void)messageTransport:(id)a3 handleGetDeviceEstimatedStartTime:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(MTRPluginResidentClientSession *)self workQueue];
  dispatch_assert_queue_V2(v8);

  v9 = [v7 responseHandler];

  if (v9)
  {
    uint64_t v10 = self;
    objc_sync_enter(v10);
    id v11 = [(MTRPluginResidentClientSession *)v10 _validateAndFindDeviceNodeForMessage:v7];
    if (v11)
    {
      id v12 = objc_alloc_init(MTRPluginPBMVariableValueResponseMessage);
      __int16 v13 = [MTRPluginPBMVariableValue alloc];
      id v14 = [v11 estimatedStartTime];
      __int16 v15 = [(MTRPluginPBMVariableValue *)v13 initWithObjectValue:v14];
      [(MTRPluginPBMVariableValueResponseMessage *)v12 setValue:v15];

      int v16 = &_os_log_internal;
      id v17 = &_os_log_internal;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        [v11 estimatedStartTime];
        objc_claimAutoreleasedReturnValue();
        -[MTRPluginResidentClientSession messageTransport:handleGetDeviceEstimatedStartTime:]();
      }

      id v18 = [v7 responseHandler];
      ((void (**)(void, void, MTRPluginPBMVariableValueResponseMessage *))v18)[2](v18, 0, v12);
    }
    objc_sync_exit(v10);
  }
}

- (void)messageTransport:(id)a3 handleGetDeviceEstimatedSubscriptionLatency:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(MTRPluginResidentClientSession *)self workQueue];
  dispatch_assert_queue_V2(v8);

  v9 = [v7 responseHandler];

  if (v9)
  {
    uint64_t v10 = self;
    objc_sync_enter(v10);
    id v11 = [(MTRPluginResidentClientSession *)v10 _validateAndFindDeviceNodeForMessage:v7];
    if (v11)
    {
      id v12 = objc_alloc_init(MTRPluginPBMVariableValueResponseMessage);
      __int16 v13 = [MTRPluginPBMVariableValue alloc];
      id v14 = [v11 estimatedSubscriptionLatency];
      __int16 v15 = [(MTRPluginPBMVariableValue *)v13 initWithObjectValue:v14];
      [(MTRPluginPBMVariableValueResponseMessage *)v12 setValue:v15];

      int v16 = &_os_log_internal;
      id v17 = &_os_log_internal;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        [v11 estimatedSubscriptionLatency];
        objc_claimAutoreleasedReturnValue();
        -[MTRPluginResidentClientSession messageTransport:handleGetDeviceEstimatedSubscriptionLatency:]();
      }

      id v18 = [v7 responseHandler];
      ((void (**)(void, void, MTRPluginPBMVariableValueResponseMessage *))v18)[2](v18, 0, v12);
    }
    objc_sync_exit(v10);
  }
}

- (void)messageTransport:(id)a3 handleDeviceReadAttribute:(id)a4
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(MTRPluginResidentClientSession *)self workQueue];
  dispatch_assert_queue_V2(v8);

  v9 = [v7 responseHandler];

  if (v9)
  {
    uint64_t v10 = self;
    objc_sync_enter(v10);
    id v11 = +[MTRPluginPBMDeviceNodeReadAttributeMessage deviceNodeReadAttributeMessageFromMessage:v7];
    if (v11)
    {
      id v12 = [(MTRPluginResidentClientSession *)v10 _validateAndFindDeviceControllerMatchingHomeInMessage:v7];
      if (!v12)
      {
LABEL_23:

        objc_sync_exit(v10);
        goto LABEL_24;
      }
      __int16 v13 = NSNumber;
      id v14 = [v11 node];
      __int16 v15 = objc_msgSend(v13, "numberWithUnsignedLongLong:", objc_msgSend(v14, "nodeID"));

      v34 = [MEMORY[0x263F10DA8] deviceWithNodeID:v15 controller:v12];
      if (v34)
      {
        int v16 = NSNumber;
        id v17 = [v11 attributePath];
        id v18 = [v17 clusterPath];
        objc_msgSend(v16, "numberWithUnsignedInt:", objc_msgSend(v18, "endpointID"));
        v33 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();

        uint64_t v19 = NSNumber;
        __int16 v20 = [v11 attributePath];
        v21 = [v20 clusterPath];
        __int16 v22 = objc_msgSend(v19, "numberWithUnsignedInt:", objc_msgSend(v21, "clusterID"));

        v23 = NSNumber;
        uint64_t v24 = [v11 attributePath];
        id v32 = objc_msgSend(v23, "numberWithUnsignedInt:", objc_msgSend(v24, "attributeID"));

        if ([v11 hasReadParams])
        {
          id v25 = [v11 readParams];
          uint64_t v30 = [v25 readParams];
        }
        else
        {
          uint64_t v30 = 0;
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138413826;
          v36 = v10;
          __int16 v37 = 2112;
          id v38 = v33;
          __int16 v39 = 2112;
          v40 = v22;
          __int16 v41 = 2112;
          long long v42 = v32;
          __int16 v43 = 2112;
          uint64_t v44 = v30;
          __int16 v45 = 2112;
          long long v46 = v15;
          __int16 v47 = 2112;
          id v48 = v7;
          _os_log_debug_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%@ Reading attribute: endpointID (%@), clusterID (%@), attributeID (%@), readParams (%@) from local device nodeID (%@) connection for message %@", buf, 0x48u);
        }
        uint64_t v26 = objc_msgSend(v34, "readAttributeWithEndpointID:clusterID:attributeID:params:", v33, v22, v32, v30, v30);
        uint64_t v27 = objc_alloc_init(MTRPluginPBMVariableValueResponseMessage);
        if (v26)
        {
          v28 = [[MTRPluginPBMVariableValue alloc] initWithObjectValue:v26];
          [(MTRPluginPBMVariableValueResponseMessage *)v27 setValue:v28];
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
          -[MTRPluginResidentClientSession messageTransport:handleDeviceReadAttribute:]();
        }
        v29 = [v7 responseHandler];
        ((void (**)(void, void, MTRPluginPBMVariableValueResponseMessage *))v29)[2](v29, 0, v27);
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[MTRPluginResidentClientSession messageTransport:handleDeviceReadAttribute:]();
        }
        v33 = [v7 responseHandler];
        __int16 v22 = [MEMORY[0x263F087E8] errorWithDomain:@"kMTRPluginErrorDomain" code:-1001 userInfo:0];
        ((void (**)(void, void *, void))v33)[2](v33, v22, 0);
      }
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[MTRPluginResidentClientSession messageTransport:handleDeviceReadAttribute:]();
      }
      id v12 = [v7 responseHandler];
      __int16 v15 = [MEMORY[0x263F087E8] errorWithDomain:@"kMTRPluginErrorDomain" code:-1007 userInfo:0];
      ((void (**)(void, void *, void))v12)[2](v12, v15, 0);
    }

    goto LABEL_23;
  }
LABEL_24:
}

- (void)messageTransport:(id)a3 handleDeviceReadMultipleAttributes:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(MTRPluginResidentClientSession *)self workQueue];
  dispatch_assert_queue_V2(v8);

  v9 = [v7 responseHandler];

  if (v9)
  {
    uint64_t v10 = self;
    objc_sync_enter(v10);
    id v11 = +[MTRPluginPBMDeviceNodeReadMultipleAttributesMessage deviceNodeReadMultipleAttributesMessageFromMessage:v7];
    if (v11)
    {
      id v12 = [(MTRPluginResidentClientSession *)v10 _validateAndFindDeviceControllerMatchingHomeInMessage:v7];
      if (!v12)
      {
LABEL_18:

        objc_sync_exit(v10);
        goto LABEL_19;
      }
      __int16 v13 = NSNumber;
      id v14 = [v11 node];
      __int16 v15 = objc_msgSend(v13, "numberWithUnsignedLongLong:", objc_msgSend(v14, "nodeID"));

      __int16 v20 = [MEMORY[0x263F10DA8] deviceWithNodeID:v15 controller:v12];
      if (v20)
      {
        int v16 = [v11 attributeRequestPaths];
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138413058;
          __int16 v22 = v10;
          __int16 v23 = 2112;
          uint64_t v24 = v16;
          __int16 v25 = 2112;
          uint64_t v26 = v15;
          __int16 v27 = 2112;
          id v28 = v7;
          _os_log_debug_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%@ Reading multiple attributes: (%@), from local device nodeID (%@) connection for message %@", buf, 0x2Au);
        }
        id v17 = [v20 readAttributePaths:v16];
        id v18 = [[MTRPluginPBMVariableValueResponseMessage alloc] initWithObjectValue:v17];
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
          -[MTRPluginResidentClientSession messageTransport:handleDeviceReadMultipleAttributes:]();
        }
        uint64_t v19 = [v7 responseHandler];
        ((void (**)(void, void, MTRPluginPBMVariableValueResponseMessage *))v19)[2](v19, 0, v18);
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[MTRPluginResidentClientSession messageTransport:handleDeviceReadAttribute:]();
        }
        int v16 = [v7 responseHandler];
        id v17 = [MEMORY[0x263F087E8] errorWithDomain:@"kMTRPluginErrorDomain" code:-1001 userInfo:0];
        ((void (**)(void, void *, void))v16)[2](v16, v17, 0);
      }
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[MTRPluginResidentClientSession messageTransport:handleDeviceReadMultipleAttributes:]();
      }
      id v12 = [v7 responseHandler];
      __int16 v15 = [MEMORY[0x263F087E8] errorWithDomain:@"kMTRPluginErrorDomain" code:-1007 userInfo:0];
      ((void (**)(void, void *, void))v12)[2](v12, v15, 0);
    }

    goto LABEL_18;
  }
LABEL_19:
}

- (void)messageTransport:(id)a3 handleDeviceWriteAttribute:(id)a4
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(MTRPluginResidentClientSession *)self workQueue];
  dispatch_assert_queue_V2(v8);

  v9 = [v7 responseHandler];

  if (v9)
  {
    uint64_t v10 = self;
    objc_sync_enter(v10);
    id v11 = +[MTRPluginPBMDeviceNodeWriteAttributeMessage deviceNodeWriteAttributeMessageFromMessage:v7];
    if (v11)
    {
      id v12 = [(MTRPluginResidentClientSession *)v10 _validateAndFindDeviceControllerMatchingHomeInMessage:v7];
      if (!v12)
      {
LABEL_26:

        objc_sync_exit(v10);
        goto LABEL_27;
      }
      __int16 v13 = NSNumber;
      id v14 = [v11 node];
      __int16 v15 = objc_msgSend(v13, "numberWithUnsignedLongLong:", objc_msgSend(v14, "nodeID"));

      uint64_t v16 = [MEMORY[0x263F10DA8] deviceWithNodeID:v15 controller:v12];
      id v17 = (void *)v16;
      if (v16)
      {
        id v32 = (void *)v16;
        id v18 = NSNumber;
        uint64_t v19 = [v11 attributePath];
        __int16 v20 = [v19 clusterPath];
        objc_msgSend(v18, "numberWithUnsignedInt:", objc_msgSend(v20, "endpointID"));
        v36 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();

        v21 = NSNumber;
        __int16 v22 = [v11 attributePath];
        __int16 v23 = [v22 clusterPath];
        uint64_t v35 = objc_msgSend(v21, "numberWithUnsignedInt:", objc_msgSend(v23, "clusterID"));

        uint64_t v24 = NSNumber;
        __int16 v25 = [v11 attributePath];
        v34 = objc_msgSend(v24, "numberWithUnsignedInt:", objc_msgSend(v25, "attributeID"));

        uint64_t v26 = [v11 value];
        v33 = [v26 object];

        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138413826;
          id v38 = v10;
          __int16 v39 = 2112;
          v40 = v36;
          __int16 v41 = 2112;
          uint64_t v42 = v35;
          __int16 v43 = 2112;
          uint64_t v44 = v34;
          __int16 v45 = 2112;
          long long v46 = v33;
          __int16 v47 = 2112;
          id v48 = v15;
          __int16 v49 = 2112;
          id v50 = v7;
          _os_log_debug_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%@ Writing attribute: endpointID (%@), clusterID (%@), attributeID (%@), value (%@) from local device nodeID (%@) connection for message %@", buf, 0x48u);
        }
        int v27 = [v11 hasExpectedValueInterval];
        if (v27)
        {
          id v28 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v11, "expectedValueInterval"));
        }
        else
        {
          id v28 = 0;
        }
        int v30 = [v11 hasTimedWriteTimeout];
        if (v30)
        {
          v31 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v11, "timedWriteTimeout"));
        }
        else
        {
          v31 = 0;
        }
        [v32 writeAttributeWithEndpointID:v36 clusterID:v35 attributeID:v34 value:v33 expectedValueInterval:v28 timedWriteTimeout:v31];
        if (v30) {

        }
        id v17 = v32;
        if (v27) {

        }
        uint64_t v29 = (void *)v35;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[MTRPluginResidentClientSession messageTransport:handleDeviceWriteAttribute:]();
        }
        v36 = [v7 responseHandler];
        uint64_t v29 = [MEMORY[0x263F087E8] errorWithDomain:@"kMTRPluginErrorDomain" code:-1001 userInfo:0];
        ((void (**)(void, void *, void))v36)[2](v36, v29, 0);
      }
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[MTRPluginResidentClientSession messageTransport:handleDeviceWriteAttribute:]();
      }
      id v12 = [v7 responseHandler];
      __int16 v15 = [MEMORY[0x263F087E8] errorWithDomain:@"kMTRPluginErrorDomain" code:-1007 userInfo:0];
      ((void (**)(void, void *, void))v12)[2](v12, v15, 0);
    }

    goto LABEL_26;
  }
LABEL_27:
}

- (id)_dictionaryFromCommandFields:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  if (v5)
  {
    id v6 = [MEMORY[0x263EFF9A0] dictionary];
    id v7 = [v5 objectForKey:@"type"];
    v8 = [v5 objectForKey:@"value"];
    if (v7)
    {
      [v6 setObject:v7 forKey:@"type"];
      if (v8)
      {
        [v6 setObject:v8 forKey:@"value"];
      }
      else
      {
        uint64_t v10 = [MEMORY[0x263EFF8C0] array];
        [v6 setObject:v10 forKey:@"value"];
      }
      id v9 = v6;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[MTRPluginResidentClientSession _dictionaryFromCommandFields:]();
      }
      id v9 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[MTRPluginResidentClientSession _dictionaryFromCommandFields:]();
    }
    id v9 = 0;
  }

  return v9;
}

- (void)messageTransport:(id)a3 handleDeviceInvokeCommand:(id)a4
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(MTRPluginResidentClientSession *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [v7 responseHandler];

  if (v9)
  {
    uint64_t v10 = self;
    objc_sync_enter(v10);
    id v11 = +[MTRPluginPBMDeviceNodeInvokeCommmandMessage deviceNodeInvokeCommandMessageFromMessage:v7];
    if (v11)
    {
      id v12 = [(MTRPluginResidentClientSession *)v10 _validateAndFindDeviceControllerMatchingHomeInMessage:v7];
      if (v12)
      {
        __int16 v13 = NSNumber;
        id v14 = [v11 node];
        uint64_t v15 = objc_msgSend(v13, "numberWithUnsignedLongLong:", objc_msgSend(v14, "nodeID"));

        v40 = (void *)v15;
        __int16 v41 = [MEMORY[0x263F10DA8] deviceWithNodeID:v15 controller:v12];
        if (v41)
        {
          uint64_t v16 = NSNumber;
          id v17 = [v11 commandPath];
          id v18 = [v17 clusterPath];
          __int16 v39 = objc_msgSend(v16, "numberWithUnsignedInt:", objc_msgSend(v18, "endpointID"));

          uint64_t v19 = NSNumber;
          __int16 v20 = [v11 commandPath];
          v21 = [v20 clusterPath];
          id v38 = objc_msgSend(v19, "numberWithUnsignedInt:", objc_msgSend(v21, "clusterID"));

          __int16 v22 = NSNumber;
          __int16 v23 = [v11 commandPath];
          __int16 v37 = objc_msgSend(v22, "numberWithUnsignedInt:", objc_msgSend(v23, "commandID"));

          uint64_t v24 = [v11 commandFields];
          __int16 v25 = [v24 object];
          v36 = [(MTRPluginResidentClientSession *)v10 _dictionaryFromCommandFields:v25];

          if ([v11 hasExpectedValues])
          {
            uint64_t v26 = [v11 expectedValues];
            uint64_t v35 = [v26 array];
          }
          else
          {
            uint64_t v35 = 0;
          }
          if ([v11 hasExpectedValueInterval])
          {
            v31 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v11, "expectedValueInterval"));
          }
          else
          {
            v31 = 0;
          }
          if ([v11 hasTimedInvokeTimeout])
          {
            id v32 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v11, "timedInvokeTimeout"));
          }
          else
          {
            id v32 = 0;
          }
          if ([v11 hasServerSideProcessingTimeout])
          {
            v33 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v11, "serverSideProcessingTimeout"));
          }
          else
          {
            v33 = 0;
          }
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138414850;
            __int16 v47 = v10;
            __int16 v48 = 2112;
            __int16 v49 = v39;
            __int16 v50 = 2112;
            uint64_t v51 = v38;
            __int16 v52 = 2112;
            v53 = v37;
            __int16 v54 = 2112;
            v55 = v36;
            __int16 v56 = 2112;
            v57 = v35;
            __int16 v58 = 2112;
            uint64_t v59 = v31;
            __int16 v60 = 2112;
            uint64_t v61 = v32;
            __int16 v62 = 2112;
            v63 = v33;
            __int16 v64 = 2112;
            v65 = v40;
            __int16 v66 = 2112;
            id v67 = v7;
            _os_log_debug_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%@ Invoking command on: endpointID (%@), clusterID (%@), commandID (%@), commandFields (%@), expectedValues (%@),                      expectedValueInterval (%@), timedInvokeTimeout (%@), serverSideProcessingTimeout (%@), from device nodeID (%@) for message %@", buf, 0x70u);
          }
          v34 = [(MTRPluginResidentClientSession *)v10 workQueue];
          v42[0] = MEMORY[0x263EF8330];
          v42[1] = 3221225472;
          v42[2] = __77__MTRPluginResidentClientSession_messageTransport_handleDeviceInvokeCommand___block_invoke;
          v42[3] = &unk_2653E6728;
          id v43 = v7;
          uint64_t v44 = v10;
          id v45 = v40;
          [v41 _invokeCommandWithEndpointID:v39 clusterID:v38 commandID:v37 commandFields:v36 expectedValues:v35 expectedValueInterval:v31 timedInvokeTimeout:v32 serverSideProcessingTimeout:v33 queue:v34 completion:v42];
        }
        else
        {
          uint64_t v29 = [v7 responseHandler];
          int v30 = [MEMORY[0x263F087E8] errorWithDomain:@"kMTRPluginErrorDomain" code:-1001 userInfo:0];
          ((void (**)(void, void *, void))v29)[2](v29, v30, 0);
        }
      }
    }
    else
    {
      int v27 = [v7 responseHandler];
      id v28 = [MEMORY[0x263F087E8] errorWithDomain:@"kMTRPluginErrorDomain" code:-1007 userInfo:0];
      ((void (**)(void, void *, void))v27)[2](v27, v28, 0);
    }
    objc_sync_exit(v10);
  }
}

void __77__MTRPluginResidentClientSession_messageTransport_handleDeviceInvokeCommand___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (id *)(a1 + 32);
  v8 = [*(id *)(a1 + 32) responseHandler];

  if (v8)
  {
    if (v6)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        __77__MTRPluginResidentClientSession_messageTransport_handleDeviceInvokeCommand___block_invoke_cold_2();
      }
      id v9 = [*v7 responseHandler];
      ((void (*)(MTRPluginPBMVariableValueResponseMessage *, id, void))v9->_header)(v9, v6, 0);
    }
    else
    {
      id v9 = objc_alloc_init(MTRPluginPBMVariableValueResponseMessage);
      uint64_t v10 = [[MTRPluginPBMVariableValue alloc] initWithObjectValue:v5];
      [(MTRPluginPBMVariableValueResponseMessage *)v9 setValue:v10];

      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
        __77__MTRPluginResidentClientSession_messageTransport_handleDeviceInvokeCommand___block_invoke_cold_1();
      }
      id v11 = [*v7 responseHandler];
      ((void (**)(void, void, MTRPluginPBMVariableValueResponseMessage *))v11)[2](v11, 0, v9);
    }
  }
}

- (void)messageTransport:(id)a3 handleDownloadDiagnosticLog:(id)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(MTRPluginResidentClientSession *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [v7 responseHandler];

  if (v9)
  {
    uint64_t v10 = self;
    objc_sync_enter(v10);
    id v11 = +[MTRPluginPBMDeviceNodeDownloadDiagnosticLog deviceNodeDownloadDiagnosticLogMessageFromMessage:v7];
    if (v11)
    {
      id v12 = [(MTRPluginResidentClientSession *)v10 _validateAndFindDeviceControllerMatchingHomeInMessage:v7];
      if (v12)
      {
        __int16 v13 = NSNumber;
        id v14 = [v11 node];
        uint64_t v15 = objc_msgSend(v13, "numberWithUnsignedLongLong:", objc_msgSend(v14, "nodeID"));

        uint64_t v16 = [MEMORY[0x263F10DA8] deviceWithNodeID:v15 controller:v12];
        if (v16)
        {
          id v17 = &_os_log_internal;
          id v18 = &_os_log_internal;
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            int v27 = [v11 logType];
            [v11 timeoutInterval];
            *(_DWORD *)buf = 138413314;
            uint64_t v35 = v10;
            __int16 v36 = 1024;
            int v37 = v27;
            __int16 v38 = 2048;
            uint64_t v39 = v28;
            __int16 v40 = 2112;
            __int16 v41 = v15;
            __int16 v42 = 2112;
            id v43 = v7;
            _os_log_debug_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%@ Invoking download diagnostic log of type (%d), timeout (%lf), from device nodeID (%@) for message %@", buf, 0x30u);
          }

          int v19 = [v11 logType];
          [v11 timeoutInterval];
          double v21 = v20;
          __int16 v22 = [(MTRPluginResidentClientSession *)v10 workQueue];
          v29[0] = MEMORY[0x263EF8330];
          v29[1] = 3221225472;
          v29[2] = __79__MTRPluginResidentClientSession_messageTransport_handleDownloadDiagnosticLog___block_invoke;
          v29[3] = &unk_2653E6750;
          id v30 = v7;
          v31 = v10;
          id v32 = v11;
          id v33 = v15;
          [v16 downloadLogOfType:v19 timeout:v22 queue:v29 completion:v21];
        }
        else
        {
          __int16 v25 = [v7 responseHandler];
          uint64_t v26 = [MEMORY[0x263F087E8] errorWithDomain:@"kMTRPluginErrorDomain" code:-1001 userInfo:0];
          ((void (**)(void, void *, void))v25)[2](v25, v26, 0);
        }
      }
    }
    else
    {
      __int16 v23 = [v7 responseHandler];
      uint64_t v24 = [MEMORY[0x263F087E8] errorWithDomain:@"kMTRPluginErrorDomain" code:-1007 userInfo:0];
      ((void (**)(void, void *, void))v23)[2](v23, v24, 0);
    }
    objc_sync_exit(v10);
  }
}

void __79__MTRPluginResidentClientSession_messageTransport_handleDownloadDiagnosticLog___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (id *)(a1 + 32);
  v8 = [*(id *)(a1 + 32) responseHandler];

  if (v8)
  {
    if (v6)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        __79__MTRPluginResidentClientSession_messageTransport_handleDownloadDiagnosticLog___block_invoke_cold_2(a1, (uint64_t)v6);
      }
      id v9 = [*v7 responseHandler];
      ((void (**)(void, id, void))v9)[2](v9, v6, 0);
    }
    else
    {
      id v9 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v5];
      if (v9)
      {
        uint64_t v10 = objc_alloc_init(MTRPluginPBMVariableValueResponseMessage);
        id v11 = [[MTRPluginPBMVariableValue alloc] initWithObjectValue:v9];
        [(MTRPluginPBMVariableValueResponseMessage *)v10 setValue:v11];

        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
          __79__MTRPluginResidentClientSession_messageTransport_handleDownloadDiagnosticLog___block_invoke_cold_1(a1);
        }
        id v12 = 0;
      }
      else
      {
        id v12 = [MEMORY[0x263F087E8] errorWithDomain:@"kMTRPluginErrorDomain" code:-1011 userInfo:0];
        uint64_t v10 = 0;
      }
      __int16 v13 = [*v7 responseHandler];
      ((void (**)(void, void *, MTRPluginPBMVariableValueResponseMessage *))v13)[2](v13, v12, v10);
    }
  }
}

- (void)invalidate
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(MTRPluginResidentClientSession *)v2 registeredNodeIDs];
  id v4 = (void *)[v3 copy];

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    int v19 = v2;
    __int16 v20 = 2112;
    double v21 = v4;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ invalidating registered nodeIDs; %@",
      buf,
      0x16u);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        -[MTRPluginResidentClientSession _unregisterNodeID:](v2, "_unregisterNodeID:", *(void *)(*((void *)&v13 + 1) + 8 * v8++), (void)v13);
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  id v9 = [(MTRPluginResidentClientSession *)v2 transport];
  [v9 removeDelegate:v2];

  uint64_t v10 = [(MTRPluginResidentClientSession *)v2 deviceController];
  [v10 removeDeviceControllerDelegate:v2];

  id v11 = [(MTRPluginResidentClientSession *)v2 internalStateUpdateSource];

  if (v11)
  {
    id v12 = [(MTRPluginResidentClientSession *)v2 internalStateUpdateSource];
    dispatch_source_cancel(v12);

    [(MTRPluginResidentClientSession *)v2 setInternalStateUpdateSource:0];
  }

  objc_sync_exit(v2);
}

- (void)_sendMessageToHomeWithID:(id)a3 messageType:(int)a4 pbCodable:(id)a5 errorBlock:(id)a6 replyBlock:(id)a7
{
  uint64_t v10 = *(void *)&a4;
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  long long v16 = [(MTRPluginResidentClientSession *)self sessionID];
  id v17 = [(MTRPluginResidentClientSession *)self homeID];
  id v18 = +[MTRPluginPBMHeader requestHeaderWithSessionID:v16 homeID:v17 messageType:v10];
  [v13 setHeader:v18];

  if ([v13 isValid])
  {
    int v19 = [v13 data];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __103__MTRPluginResidentClientSession__sendMessageToHomeWithID_messageType_pbCodable_errorBlock_replyBlock___block_invoke;
    v26[3] = &unk_2653E6778;
    v26[4] = self;
    int v30 = v10;
    id v20 = v12;
    id v27 = v20;
    id v28 = v14;
    id v29 = v15;
    double v21 = +[MTRPluginProtobufMessage messageWithProtobufData:v19 responseHandler:v26];

    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      -[MTRPluginResidentClientSession _sendMessageToHomeWithID:messageType:pbCodable:errorBlock:replyBlock:](self, (uint64_t)v21, (uint64_t)v20);
    }
    uint64_t v22 = [(MTRPluginResidentClientSession *)self transport];
    __int16 v23 = [(MTRPluginResidentClientSession *)self peerAddress];
    [v22 sendMessageToRemotePeer:v21 peerDestination:v23];

    goto LABEL_11;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    __int16 v25 = [(MTRPluginResidentClientSession *)self peerAddress];
    *(_DWORD *)buf = 138413315;
    id v32 = self;
    __int16 v33 = 1024;
    int v34 = v10;
    __int16 v35 = 2112;
    id v36 = v13;
    __int16 v37 = 2112;
    id v38 = v12;
    __int16 v39 = 2113;
    __int16 v40 = v25;
    _os_log_error_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%@ Failed to send message type %d (%@) to homeID: %@, destination: %{private}@ as it is invalid", buf, 0x30u);

    if (v14) {
      goto LABEL_7;
    }
  }
  else if (v14)
  {
LABEL_7:
    uint64_t v24 = [MEMORY[0x263F087E8] errorWithDomain:@"kMTRPluginErrorDomain" code:-1003 userInfo:0];
    (*((void (**)(id, void *))v14 + 2))(v14, v24);

    goto LABEL_11;
  }
  if (v15) {
    (*((void (**)(id, void))v15 + 2))(v15, 0);
  }
LABEL_11:
}

void __103__MTRPluginResidentClientSession__sendMessageToHomeWithID_messageType_pbCodable_errorBlock_replyBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __103__MTRPluginResidentClientSession__sendMessageToHomeWithID_messageType_pbCodable_errorBlock_replyBlock___block_invoke_cold_3(a1, (uint64_t)v5);
    }
    uint64_t v7 = *(void *)(a1 + 48);
    if (v7) {
      (*(void (**)(uint64_t, id))(v7 + 16))(v7, v5);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __103__MTRPluginResidentClientSession__sendMessageToHomeWithID_messageType_pbCodable_errorBlock_replyBlock___block_invoke_cold_2(a1);
    }
    id v8 = +[MTRPluginResidentServer sharedInstance];
    [v8 removeResidentClientSession:*(void *)(a1 + 32)];
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      unsigned int v10 = *(_DWORD *)(a1 + 64);
      id v11 = +[MTRPluginPBMHeader messageTypeAsString:v10];
      uint64_t v12 = *(void *)(a1 + 40);
      int v19 = 138413058;
      uint64_t v20 = v9;
      __int16 v21 = 1024;
      unsigned int v22 = v10;
      __int16 v23 = 2112;
      uint64_t v24 = v11;
      __int16 v25 = 2112;
      uint64_t v26 = v12;
      _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ Response received for message %d (%@) from homeID %@", (uint8_t *)&v19, 0x26u);
    }
    uint64_t v13 = *(void *)(a1 + 56);
    if (v13) {
      (*(void (**)(uint64_t, id))(v13 + 16))(v13, v6);
    }
    id v8 = *(id *)(a1 + 32);
    objc_sync_enter(v8);
    id v14 = [MEMORY[0x263EFF910] date];
    [*(id *)(a1 + 32) setTimeOfLastActivity:v14];

    id v15 = &_os_log_internal;
    id v16 = &_os_log_internal;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      id v17 = *(void **)(a1 + 32);
      id v18 = [v17 timeOfLastActivity];
      __103__MTRPluginResidentClientSession__sendMessageToHomeWithID_messageType_pbCodable_errorBlock_replyBlock___block_invoke_cold_1((uint64_t)v17, v18, (uint8_t *)&v19);
    }

    objc_sync_exit(v8);
  }
}

- (id)_deviceNodeMessageForDevice:(id)a3 messageValue:(id)a4
{
  id v5 = a4;
  if (a3)
  {
    id v6 = [a3 nodeID];
    a3 = +[MTRPluginPBMDeviceNodeMessage deviceNodeMessageWithNodeID:v6];

    if (v5)
    {
      uint64_t v7 = [[MTRPluginPBMVariableValue alloc] initWithObjectValue:v5];
      [a3 setValue:v7];
    }
  }

  return a3;
}

- (void)device:(id)a3 stateChanged:(unint64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = [(MTRPluginResidentClientSession *)self workQueue];
    dispatch_assert_queue_V2(v7);

    id v8 = self;
    objc_sync_enter(v8);
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      -[MTRPluginResidentClientSession device:stateChanged:]();
    }
    uint64_t v9 = [NSNumber numberWithUnsignedInteger:a4];
    unsigned int v10 = [(MTRPluginResidentClientSession *)v8 _deviceNodeMessageForDevice:v6 messageValue:v9];

    id v11 = [(MTRPluginResidentClientSession *)v8 homeID];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __54__MTRPluginResidentClientSession_device_stateChanged___block_invoke;
    v13[3] = &unk_2653E67A0;
    v13[4] = v8;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __54__MTRPluginResidentClientSession_device_stateChanged___block_invoke_103;
    v12[3] = &unk_2653E67C8;
    v12[4] = v8;
    [(MTRPluginResidentClientSession *)v8 _sendMessageToHomeWithID:v11 messageType:1008 pbCodable:v10 errorBlock:v13 replyBlock:v12];

    objc_sync_exit(v8);
  }
}

void __54__MTRPluginResidentClientSession_device_stateChanged___block_invoke()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __54__MTRPluginResidentClientSession_device_stateChanged___block_invoke_cold_1();
  }
}

void __54__MTRPluginResidentClientSession_device_stateChanged___block_invoke_103()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    __54__MTRPluginResidentClientSession_device_stateChanged___block_invoke_103_cold_1();
  }
}

- (void)device:(id)a3 receivedAttributeReport:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    -[MTRPluginResidentClientSession device:receivedAttributeReport:]();
    if (!v6) {
      goto LABEL_5;
    }
  }
  else if (!v6)
  {
    goto LABEL_5;
  }
  if (v7)
  {
    id v8 = [(MTRPluginResidentClientSession *)self workQueue];
    dispatch_assert_queue_V2(v8);

    uint64_t v9 = self;
    objc_sync_enter(v9);
    unsigned int v10 = [(MTRPluginResidentClientSession *)v9 _deviceNodeMessageForDevice:v6 messageValue:v7];
    id v11 = [(MTRPluginResidentClientSession *)v9 homeID];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __65__MTRPluginResidentClientSession_device_receivedAttributeReport___block_invoke;
    v13[3] = &unk_2653E67A0;
    v13[4] = v9;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __65__MTRPluginResidentClientSession_device_receivedAttributeReport___block_invoke_105;
    v12[3] = &unk_2653E67C8;
    v12[4] = v9;
    [(MTRPluginResidentClientSession *)v9 _sendMessageToHomeWithID:v11 messageType:1009 pbCodable:v10 errorBlock:v13 replyBlock:v12];

    objc_sync_exit(v9);
  }
LABEL_5:
}

void __65__MTRPluginResidentClientSession_device_receivedAttributeReport___block_invoke()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __65__MTRPluginResidentClientSession_device_receivedAttributeReport___block_invoke_cold_1();
  }
}

void __65__MTRPluginResidentClientSession_device_receivedAttributeReport___block_invoke_105()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    __65__MTRPluginResidentClientSession_device_receivedAttributeReport___block_invoke_105_cold_1();
  }
}

- (void)device:(id)a3 receivedEventReport:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    -[MTRPluginResidentClientSession device:receivedEventReport:]();
    if (!v6) {
      goto LABEL_5;
    }
  }
  else if (!v6)
  {
    goto LABEL_5;
  }
  if (v7)
  {
    id v8 = [(MTRPluginResidentClientSession *)self workQueue];
    dispatch_assert_queue_V2(v8);

    uint64_t v9 = self;
    objc_sync_enter(v9);
    unsigned int v10 = [(MTRPluginResidentClientSession *)v9 _deviceNodeMessageForDevice:v6 messageValue:v7];
    id v11 = [(MTRPluginResidentClientSession *)v9 homeID];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __61__MTRPluginResidentClientSession_device_receivedEventReport___block_invoke;
    v13[3] = &unk_2653E67A0;
    v13[4] = v9;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __61__MTRPluginResidentClientSession_device_receivedEventReport___block_invoke_106;
    v12[3] = &unk_2653E67C8;
    v12[4] = v9;
    [(MTRPluginResidentClientSession *)v9 _sendMessageToHomeWithID:v11 messageType:1010 pbCodable:v10 errorBlock:v13 replyBlock:v12];

    objc_sync_exit(v9);
  }
LABEL_5:
}

void __61__MTRPluginResidentClientSession_device_receivedEventReport___block_invoke()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __61__MTRPluginResidentClientSession_device_receivedEventReport___block_invoke_cold_1();
  }
}

void __61__MTRPluginResidentClientSession_device_receivedEventReport___block_invoke_106()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    __61__MTRPluginResidentClientSession_device_receivedEventReport___block_invoke_106_cold_1();
  }
}

- (void)deviceBecameActive:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    -[MTRPluginResidentClientSession deviceBecameActive:]();
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v4)
  {
LABEL_3:
    id v5 = [(MTRPluginResidentClientSession *)self workQueue];
    dispatch_assert_queue_V2(v5);

    id v6 = self;
    objc_sync_enter(v6);
    id v7 = [(MTRPluginResidentClientSession *)v6 _deviceNodeMessageForDevice:v4 messageValue:0];
    id v8 = [(MTRPluginResidentClientSession *)v6 homeID];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __53__MTRPluginResidentClientSession_deviceBecameActive___block_invoke;
    v10[3] = &unk_2653E67A0;
    v10[4] = v6;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __53__MTRPluginResidentClientSession_deviceBecameActive___block_invoke_107;
    v9[3] = &unk_2653E67C8;
    v9[4] = v6;
    [(MTRPluginResidentClientSession *)v6 _sendMessageToHomeWithID:v8 messageType:1011 pbCodable:v7 errorBlock:v10 replyBlock:v9];

    objc_sync_exit(v6);
  }
LABEL_4:
}

void __53__MTRPluginResidentClientSession_deviceBecameActive___block_invoke()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __53__MTRPluginResidentClientSession_deviceBecameActive___block_invoke_cold_1();
  }
}

void __53__MTRPluginResidentClientSession_deviceBecameActive___block_invoke_107()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    __53__MTRPluginResidentClientSession_deviceBecameActive___block_invoke_107_cold_1();
  }
}

- (void)deviceCachePrimed:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    -[MTRPluginResidentClientSession deviceCachePrimed:]();
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v4)
  {
LABEL_3:
    id v5 = [(MTRPluginResidentClientSession *)self workQueue];
    dispatch_assert_queue_V2(v5);

    id v6 = self;
    objc_sync_enter(v6);
    id v7 = [(MTRPluginResidentClientSession *)v6 _deviceNodeMessageForDevice:v4 messageValue:0];
    id v8 = [(MTRPluginResidentClientSession *)v6 homeID];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __52__MTRPluginResidentClientSession_deviceCachePrimed___block_invoke;
    v10[3] = &unk_2653E67A0;
    v10[4] = v6;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __52__MTRPluginResidentClientSession_deviceCachePrimed___block_invoke_108;
    v9[3] = &unk_2653E67C8;
    v9[4] = v6;
    [(MTRPluginResidentClientSession *)v6 _sendMessageToHomeWithID:v8 messageType:1012 pbCodable:v7 errorBlock:v10 replyBlock:v9];

    objc_sync_exit(v6);
  }
LABEL_4:
}

void __52__MTRPluginResidentClientSession_deviceCachePrimed___block_invoke()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __52__MTRPluginResidentClientSession_deviceCachePrimed___block_invoke_cold_1();
  }
}

void __52__MTRPluginResidentClientSession_deviceCachePrimed___block_invoke_108()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    __52__MTRPluginResidentClientSession_deviceCachePrimed___block_invoke_108_cold_1();
  }
}

- (void)deviceConfigurationChanged:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    -[MTRPluginResidentClientSession deviceConfigurationChanged:]();
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v4)
  {
LABEL_3:
    id v5 = [(MTRPluginResidentClientSession *)self workQueue];
    dispatch_assert_queue_V2(v5);

    id v6 = self;
    objc_sync_enter(v6);
    id v7 = [(MTRPluginResidentClientSession *)v6 _deviceNodeMessageForDevice:v4 messageValue:0];
    id v8 = [(MTRPluginResidentClientSession *)v6 homeID];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __61__MTRPluginResidentClientSession_deviceConfigurationChanged___block_invoke;
    v10[3] = &unk_2653E67A0;
    v10[4] = v6;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __61__MTRPluginResidentClientSession_deviceConfigurationChanged___block_invoke_109;
    v9[3] = &unk_2653E67C8;
    v9[4] = v6;
    [(MTRPluginResidentClientSession *)v6 _sendMessageToHomeWithID:v8 messageType:1013 pbCodable:v7 errorBlock:v10 replyBlock:v9];

    objc_sync_exit(v6);
  }
LABEL_4:
}

void __61__MTRPluginResidentClientSession_deviceConfigurationChanged___block_invoke()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __61__MTRPluginResidentClientSession_deviceConfigurationChanged___block_invoke_cold_1();
  }
}

void __61__MTRPluginResidentClientSession_deviceConfigurationChanged___block_invoke_109()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    __61__MTRPluginResidentClientSession_deviceConfigurationChanged___block_invoke_109_cold_1();
  }
}

- (void)device:(id)a3 internalStateUpdated:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    -[MTRPluginResidentClientSession device:internalStateUpdated:]();
    if (!v6) {
      goto LABEL_5;
    }
  }
  else if (!v6)
  {
    goto LABEL_5;
  }
  if (v7)
  {
    id v8 = [(MTRPluginResidentClientSession *)self workQueue];
    dispatch_assert_queue_V2(v8);

    uint64_t v9 = [(MTRPluginResidentClientSession *)self _deviceNodeMessageForDevice:v6 messageValue:v7];
    unsigned int v10 = [(MTRPluginResidentClientSession *)self internalStateUpdateSource];
    id v11 = [(MTRPluginResidentClientSession *)self workQueue];
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    id v16 = __62__MTRPluginResidentClientSession_device_internalStateUpdated___block_invoke;
    id v17 = &unk_2653E6700;
    id v18 = self;
    id v19 = v9;
    id v12 = v9;
    uint64_t v13 = MTRBufferedExecutionBlock(v10, v11, &v14, 0.5);
    -[MTRPluginResidentClientSession setInternalStateUpdateSource:](self, "setInternalStateUpdateSource:", v13, v14, v15, v16, v17, v18);
  }
LABEL_5:
}

void __62__MTRPluginResidentClientSession_device_internalStateUpdated___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [v2 homeID];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __62__MTRPluginResidentClientSession_device_internalStateUpdated___block_invoke_2;
  v6[3] = &unk_2653E67A0;
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __62__MTRPluginResidentClientSession_device_internalStateUpdated___block_invoke_110;
  v5[3] = &unk_2653E67C8;
  v5[4] = v7;
  [v2 _sendMessageToHomeWithID:v3 messageType:1014 pbCodable:v4 errorBlock:v6 replyBlock:v5];
}

void __62__MTRPluginResidentClientSession_device_internalStateUpdated___block_invoke_2()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __62__MTRPluginResidentClientSession_device_internalStateUpdated___block_invoke_2_cold_1();
  }
}

void __62__MTRPluginResidentClientSession_device_internalStateUpdated___block_invoke_110()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    __62__MTRPluginResidentClientSession_device_internalStateUpdated___block_invoke_110_cold_1();
  }
}

- (NSUUID)sessionID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSessionID:(id)a3
{
}

- (NSDate)timeOfLastActivity
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTimeOfLastActivity:(id)a3
{
}

- (NSUUID)homeID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void)setHomeID:(id)a3
{
}

- (id)peerAddress
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setPeerAddress:(id)a3
{
}

- (NSMutableSet)registeredNodeIDs
{
  return (NSMutableSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRegisteredNodeIDs:(id)a3
{
}

- (NSMutableSet)subscribedMTRDevices
{
  return (NSMutableSet *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSubscribedMTRDevices:(id)a3
{
}

- (MTRPluginProtobufMessageTransport)transport
{
  return (MTRPluginProtobufMessageTransport *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTransport:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_source)internalStateUpdateSource
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 72, 1);
}

- (void)setInternalStateUpdateSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalStateUpdateSource, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_subscribedMTRDevices, 0);
  objc_storeStrong((id *)&self->_registeredNodeIDs, 0);
  objc_storeStrong(&self->_peerAddress, 0);
  objc_storeStrong((id *)&self->_homeID, 0);
  objc_storeStrong((id *)&self->_timeOfLastActivity, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

- (void)_registerNodeID:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_2558FC000, &_os_log_internal, v0, "%@ *** No device created for nodeID: %@", v1, v2, v3, v4, v5);
}

- (void)_unregisterNodeID:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_2558FC000, &_os_log_internal, v0, "%@ *** No device to unregister for nodeID: %@", v1, v2, v3, v4, v5);
}

- (void)_validateAndFindDeviceControllerMatchingHomeInMessage:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_2558FC000, &_os_log_internal, v0, "%@ failed to find controller for home for incoming request message %@", v1, v2, v3, v4, v5);
}

- (void)_validateAndFindDeviceControllerForMessage:deviceControllerMessage:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_2558FC000, &_os_log_internal, v0, "%@ failed to decode message for incoming controller request message %@", v1, v2, v3, v4, v5);
}

- (void)_validateAndFindDeviceNodeForMessage:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_2558FC000, &_os_log_internal, v0, "%@ failed to decode message for incoming device request message %@", v1, v2, v3, v4, v5);
}

- (void)_validateAndFindDeviceNodeForMessage:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_13(&dword_2558FC000, &_os_log_internal, v0, "%@ failed to find nodeID (%@) for incoming device request message %@", v1, v2, v3, v4, v5);
}

- (void)messageTransport:updateTimeOfActivity:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_9(&dword_2558FC000, &_os_log_internal, v0, "%@ Updating timeOfActivity to: %@", v1, v2, v3, v4, v5);
}

- (void)messageTransport:(uint64_t)a3 handleGetControllerIsRunning:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  OUTLINED_FUNCTION_15(a1, 5.7781e-34, a2, a3, a4);
  *(_WORD *)(v5 + 12) = v9;
  if (!v10) {
    uint64_t v7 = v8;
  }
  *(void *)(v5 + 14) = v7;
  *(_WORD *)(v5 + 22) = v9;
  *(void *)(v5 + 24) = v4;
  OUTLINED_FUNCTION_5(&dword_2558FC000, &_os_log_internal, v4, "%@ responding to controller is running state with: %@ for message %@", v6);
}

- (void)messageTransport:handleGetControllerUniqueID:.cold.1()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_4(v1, v2, v3, v4, 5.7781e-34);
  OUTLINED_FUNCTION_5(&dword_2558FC000, &_os_log_internal, v5, "%@ responding to controller get uniqueID with: %@ for message %@", v6);
}

- (void)messageTransport:handleGetControllerNodeID:.cold.1()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_4(v1, v2, v3, v4, 5.7781e-34);
  OUTLINED_FUNCTION_5(&dword_2558FC000, &_os_log_internal, v5, "%@ responding to controller get nodeID with: %@ for message %@", v6);
}

- (void)messageTransport:(void *)a3 handleControllerConfigUpdate:.cold.1(uint8_t *buf, uint64_t a2, void *a3)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a2;
  _os_log_error_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Invalid nodeIDInfo: %@", buf, 0xCu);
}

- (void)messageTransport:(void *)a1 handleCloseSession:.cold.1(void *a1)
{
  id v6 = [a1 sessionID];
  OUTLINED_FUNCTION_2(&dword_2558FC000, &_os_log_internal, v1, "%@ Removing sessionID %@, since the peer requested to close the session", v2, v3, v4, v5, 2u);
}

- (void)messageTransport:handleGetDeviceState:.cold.1()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_4(v1, v2, v3, v4, 5.7781e-34);
  OUTLINED_FUNCTION_5(&dword_2558FC000, &_os_log_internal, v5, "%@ responding to device state for nodeID: %@, for message %@", v6);
}

- (void)messageTransport:(uint64_t)a3 handleGetDeviceIsCachePrimed:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  OUTLINED_FUNCTION_15(a1, 5.7781e-34, a2, a3, a4);
  *(_WORD *)(v5 + 12) = v9;
  if (!v10) {
    uint64_t v7 = v8;
  }
  *(void *)(v5 + 14) = v7;
  *(_WORD *)(v5 + 22) = v9;
  *(void *)(v5 + 24) = v4;
  OUTLINED_FUNCTION_5(&dword_2558FC000, &_os_log_internal, v4, "%@ responding to device cachePrimed for nodeID: %@, for message %@", v6);
}

- (void)messageTransport:handleGetDeviceEstimatedStartTime:.cold.1()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_4(v1, v2, v3, v4, 5.7781e-34);
  OUTLINED_FUNCTION_5(&dword_2558FC000, &_os_log_internal, v5, "%@ responding to device estimatedStartTime for nodeID: %@, for message %@", v6);
}

- (void)messageTransport:handleGetDeviceEstimatedSubscriptionLatency:.cold.1()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_4(v1, v2, v3, v4, 5.7781e-34);
  OUTLINED_FUNCTION_5(&dword_2558FC000, &_os_log_internal, v5, "%@ responding to device estimatedSubscriptionLatency for nodeID: %@, for message %@", v6);
}

- (void)messageTransport:handleDeviceReadAttribute:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_2558FC000, &_os_log_internal, v0, "%@ failed to decode read attribute message for incoming device request message %@", v1, v2, v3, v4, v5);
}

- (void)messageTransport:handleDeviceReadAttribute:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_2558FC000, &_os_log_internal, v0, "%@ failed to find node for read attribute for incoming device request message %@", v1, v2, v3, v4, v5);
}

- (void)messageTransport:handleDeviceReadAttribute:.cold.3()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_2558FC000, &_os_log_internal, v0, "%@ responding to device read attribute for nodeID: %@, for message %@", v1);
}

- (void)messageTransport:handleDeviceReadMultipleAttributes:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_2558FC000, &_os_log_internal, v0, "%@ failed to decode read multiple attribute message for incoming device request message %@", v1, v2, v3, v4, v5);
}

- (void)messageTransport:handleDeviceReadMultipleAttributes:.cold.3()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_2558FC000, &_os_log_internal, v0, "%@ responding to device read multiple attribute for nodeID: %@, for message %@", v1);
}

- (void)messageTransport:handleDeviceWriteAttribute:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_2558FC000, &_os_log_internal, v0, "%@ failed to decode write attribute message for incoming device request message %@", v1, v2, v3, v4, v5);
}

- (void)messageTransport:handleDeviceWriteAttribute:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_2558FC000, &_os_log_internal, v0, "%@ failed to find node for write attribute for incoming device request message %@", v1, v2, v3, v4, v5);
}

- (void)_dictionaryFromCommandFields:.cold.1()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_13(&dword_2558FC000, &_os_log_internal, v2, "%@ *** commandFields is invalid type %@:%@", v3, v4, v5, v6, v7);
}

- (void)_dictionaryFromCommandFields:.cold.2()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_13(&dword_2558FC000, &_os_log_internal, v2, "%@ *** commandFields is missing type %@:%@", v3, v4, v5, v6, v7);
}

void __77__MTRPluginResidentClientSession_messageTransport_handleDeviceInvokeCommand___block_invoke_cold_1()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_12();
  uint64_t v3 = v0;
  OUTLINED_FUNCTION_5(&dword_2558FC000, &_os_log_internal, v1, "%@ responding to invoke command for nodeID: %@, for message %@", v2);
}

void __77__MTRPluginResidentClientSession_messageTransport_handleDeviceInvokeCommand___block_invoke_cold_2()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_12();
  uint64_t v4 = v0;
  __int16 v5 = v1;
  uint64_t v6 = v2;
  _os_log_error_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%@ Failed to invoke command for nodeID: %@, with error %@, for message %@", v3, 0x2Au);
}

void __79__MTRPluginResidentClientSession_messageTransport_handleDownloadDiagnosticLog___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 40);
  [*(id *)(a1 + 48) logType];
  int v3 = 138413058;
  uint64_t v4 = v1;
  OUTLINED_FUNCTION_8();
  uint64_t v5 = v2;
  _os_log_debug_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%@ responding to download log of type %d for nodeID: %@, for message %@", (uint8_t *)&v3, 0x26u);
}

void __79__MTRPluginResidentClientSession_messageTransport_handleDownloadDiagnosticLog___block_invoke_cold_2(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 40);
  [*(id *)(a1 + 48) logType];
  int v6 = 138413314;
  uint64_t v7 = v3;
  OUTLINED_FUNCTION_8();
  uint64_t v8 = a2;
  __int16 v9 = v4;
  uint64_t v10 = v5;
  _os_log_error_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%@ Failed to download diagnostic log of type %d for nodeID: %@, with error %@, for message %@", (uint8_t *)&v6, 0x30u);
}

- (void)_sendMessageToHomeWithID:(uint64_t)a3 messageType:pbCodable:errorBlock:replyBlock:.cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v6 = [a1 peerAddress];
  int v7 = 138413059;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  __int16 v11 = 2112;
  uint64_t v12 = a3;
  __int16 v13 = 2113;
  uint64_t v14 = v6;
  _os_log_debug_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%@ Attempting to send message %@ to homeID: %@, destination: %{private}@", (uint8_t *)&v7, 0x2Au);
}

void __103__MTRPluginResidentClientSession__sendMessageToHomeWithID_messageType_pbCodable_errorBlock_replyBlock___block_invoke_cold_1(uint64_t a1, void *a2, uint8_t *buf)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%@ Response received, updating timeOfActivity to: %@", buf, 0x16u);
}

void __103__MTRPluginResidentClientSession__sendMessageToHomeWithID_messageType_pbCodable_errorBlock_replyBlock___block_invoke_cold_2(uint64_t a1)
{
  int v6 = [*(id *)(a1 + 32) sessionID];
  OUTLINED_FUNCTION_2(&dword_2558FC000, &_os_log_internal, v1, "%@ Removing sessionID %@, since the peer rejected with an error message", v2, v3, v4, v5, 2u);
}

void __103__MTRPluginResidentClientSession__sendMessageToHomeWithID_messageType_pbCodable_errorBlock_replyBlock___block_invoke_cold_3(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(unsigned int *)(a1 + 64);
  int v6 = +[MTRPluginPBMHeader messageTypeAsString:v5];
  uint64_t v7 = *(void *)(a1 + 40);
  int v8 = 138413314;
  uint64_t v9 = v4;
  __int16 v10 = 1024;
  int v11 = v5;
  __int16 v12 = 2112;
  __int16 v13 = v6;
  __int16 v14 = 2112;
  uint64_t v15 = v7;
  __int16 v16 = 2112;
  uint64_t v17 = a2;
  _os_log_error_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%@ Response received for message %d (%@) from homeID %@ with error: %@", (uint8_t *)&v8, 0x30u);
}

- (void)device:stateChanged:.cold.1()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  __int16 v2 = 2048;
  uint64_t v3 = v0;
  OUTLINED_FUNCTION_5(&dword_2558FC000, &_os_log_internal, v0, "%@ device %@ stateChanged %lu", v1);
}

void __54__MTRPluginResidentClientSession_device_stateChanged___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_2558FC000, &_os_log_internal, v0, "%@ Failed to send state changed value with error: %@", v1, v2, v3, v4, 2u);
}

void __54__MTRPluginResidentClientSession_device_stateChanged___block_invoke_103_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7(&dword_2558FC000, &_os_log_internal, v0, "%@ Successfully sent state changed report", v1, v2, v3, v4, v5);
}

- (void)device:receivedAttributeReport:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_2558FC000, &_os_log_internal, v0, "%@ device %@ receivedAttributeReport %@, sending to remote controller", v1);
}

void __65__MTRPluginResidentClientSession_device_receivedAttributeReport___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_2558FC000, &_os_log_internal, v0, "%@ Failed to send attribute report with error: %@", v1, v2, v3, v4, 2u);
}

void __65__MTRPluginResidentClientSession_device_receivedAttributeReport___block_invoke_105_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7(&dword_2558FC000, &_os_log_internal, v0, "%@ Successfully sent attribute report", v1, v2, v3, v4, v5);
}

- (void)device:receivedEventReport:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_2558FC000, &_os_log_internal, v0, "%@ device %@ receivedEventReport %@", v1);
}

void __61__MTRPluginResidentClientSession_device_receivedEventReport___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_2558FC000, &_os_log_internal, v0, "%@ Failed to send event report with error: %@", v1, v2, v3, v4, 2u);
}

void __61__MTRPluginResidentClientSession_device_receivedEventReport___block_invoke_106_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7(&dword_2558FC000, &_os_log_internal, v0, "%@ Successfully sent event report", v1, v2, v3, v4, v5);
}

- (void)deviceBecameActive:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_9(&dword_2558FC000, &_os_log_internal, v0, "%@ deviceBecameActive %@", v1, v2, v3, v4, v5);
}

void __53__MTRPluginResidentClientSession_deviceBecameActive___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_2558FC000, &_os_log_internal, v0, "%@ Failed to send device became active with error: %@", v1, v2, v3, v4, 2u);
}

void __53__MTRPluginResidentClientSession_deviceBecameActive___block_invoke_107_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7(&dword_2558FC000, &_os_log_internal, v0, "%@ Successfully sent device became active", v1, v2, v3, v4, v5);
}

- (void)deviceCachePrimed:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_9(&dword_2558FC000, &_os_log_internal, v0, "%@ deviceCachePrimed %@", v1, v2, v3, v4, v5);
}

void __52__MTRPluginResidentClientSession_deviceCachePrimed___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_2558FC000, &_os_log_internal, v0, "%@ Failed to send device cache primed with error: %@", v1, v2, v3, v4, 2u);
}

void __52__MTRPluginResidentClientSession_deviceCachePrimed___block_invoke_108_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7(&dword_2558FC000, &_os_log_internal, v0, "%@ Successfully sent device cache primed active", v1, v2, v3, v4, v5);
}

- (void)deviceConfigurationChanged:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_9(&dword_2558FC000, &_os_log_internal, v0, "%@ deviceConfigurationChanged %@", v1, v2, v3, v4, v5);
}

void __61__MTRPluginResidentClientSession_deviceConfigurationChanged___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_2558FC000, &_os_log_internal, v0, "%@ Failed to send device configChanged with error: %@", v1, v2, v3, v4, 2u);
}

void __61__MTRPluginResidentClientSession_deviceConfigurationChanged___block_invoke_109_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7(&dword_2558FC000, &_os_log_internal, v0, "%@ Successfully sent device configChanged", v1, v2, v3, v4, v5);
}

- (void)device:internalStateUpdated:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_2558FC000, &_os_log_internal, v0, "%@ device %@ internalStateUpdated with value: %@", v1);
}

void __62__MTRPluginResidentClientSession_device_internalStateUpdated___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_2558FC000, &_os_log_internal, v0, "%@ Failed to send device internal state updated with error: %@", v1, v2, v3, v4, 2u);
}

void __62__MTRPluginResidentClientSession_device_internalStateUpdated___block_invoke_110_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7(&dword_2558FC000, &_os_log_internal, v0, "%@ Successfully sent device internal state updated", v1, v2, v3, v4, v5);
}

@end