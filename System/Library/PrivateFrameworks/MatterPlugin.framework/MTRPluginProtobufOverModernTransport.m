@interface MTRPluginProtobufOverModernTransport
+ (id)sharedInstance;
- (BOOL)_installResponseHandlerForIncomingProtobufMessage:(id)a3 hmfMessage:(id)a4;
- (BOOL)deregisterForRequestMessageWithType:(id)a3 forSessionID:(id)a4;
- (BOOL)dispatchIncomingMessage:(id)a3;
- (BOOL)registerForRequestMessageWithType:(id)a3 requestHandler:(SEL)a4 forSessionID:(id)a5;
- (BOOL)start;
- (BOOL)stop;
- (MTRPluginProtobufMessageDispatcher)messageDispatcher;
- (MTRPluginProtobufOverModernTransport)init;
- (NSString)description;
- (void)_handleResponseWithPayload:(id)a3 error:(id)a4 forMessage:(id)a5;
- (void)_sendMessageToPrimaryHomeHub:(id)a3;
- (void)_sendMessageToRemotePeer:(id)a3 peerDestination:(id)a4;
- (void)removeDelegate:(id)a3;
- (void)sendMessageToPrimaryHomeHub:(id)a3;
- (void)sendMessageToRemotePeer:(id)a3 peerDestination:(id)a4;
- (void)setDelegate:(id)a3 delegateQueue:(id)a4;
- (void)setDelegate:(id)a3 delegateQueue:(id)a4 forSessionID:(id)a5;
- (void)setMessageDispatcher:(id)a3;
@end

@implementation MTRPluginProtobufOverModernTransport

+ (id)sharedInstance
{
  if (sharedInstance_creation_4 != -1) {
    dispatch_once(&sharedInstance_creation_4, &__block_literal_global_8);
  }
  v2 = (void *)sharedInstance_sInstance_4;
  return v2;
}

uint64_t __54__MTRPluginProtobufOverModernTransport_sharedInstance__block_invoke()
{
  sharedInstance_sInstance_4 = objc_alloc_init(MTRPluginProtobufOverModernTransport);
  return MEMORY[0x270F9A758]();
}

- (MTRPluginProtobufOverModernTransport)init
{
  v5.receiver = self;
  v5.super_class = (Class)MTRPluginProtobufOverModernTransport;
  v2 = [(MTRPluginProtobufOverModernTransport *)&v5 init];
  if (v2)
  {
    v3 = objc_alloc_init(MTRPluginProtobufMessageDispatcher);
    [(MTRPluginProtobufOverModernTransport *)v2 setMessageDispatcher:v3];
  }
  return v2;
}

- (void)sendMessageToRemotePeer:(id)a3 peerDestination:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = (void *)MEMORY[0x25A290B70]();
  v8 = self;
  objc_sync_enter(v8);
  [(MTRPluginProtobufOverModernTransport *)v8 _sendMessageToRemotePeer:v9 peerDestination:v6];
  objc_sync_exit(v8);
}

- (void)sendMessageToPrimaryHomeHub:(id)a3
{
  id v6 = a3;
  v4 = (void *)MEMORY[0x25A290B70]();
  objc_super v5 = self;
  objc_sync_enter(v5);
  [(MTRPluginProtobufOverModernTransport *)v5 _sendMessageToPrimaryHomeHub:v6];
  objc_sync_exit(v5);
}

- (void)_sendMessageToPrimaryHomeHub:(id)a3
{
  v26[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = v5;
  if (v5 && ([v5 messageData], v7 = objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    v8 = clientConnectionForMessage(v6);
    if (v8)
    {
      v25 = @"HMDHomeMatterRequestProtobufPayloadKey";
      id v9 = [v6 messageData];
      v26[0] = v9;
      v10 = [NSDictionary dictionaryWithObjects:v26 forKeys:&v25 count:1];
      v11 = [v6 responseHandler];
      if (v11)
      {
        v12 = v23;
        v23[0] = MEMORY[0x263EF8330];
        v23[1] = 3221225472;
        v23[2] = __69__MTRPluginProtobufOverModernTransport__sendMessageToPrimaryHomeHub___block_invoke;
        v23[3] = &unk_2653E6CD0;
        v23[4] = self;
        v3 = &v24;
        id v24 = v6;
      }
      else
      {
        v12 = 0;
      }
      char v19 = [v8 _deliverMessagePayloadToPrimaryResident:v10 responseHandler:v12];

      if ((v19 & 1) == 0)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[MTRPluginProtobufOverModernTransport _sendMessageToPrimaryHomeHub:]();
        }
        v20 = [v6 responseHandler];

        if (v20)
        {
          v21 = [v6 responseHandler];
          v22 = [MEMORY[0x263F087E8] errorWithDomain:@"kMTRPluginErrorDomain" code:-1005 userInfo:0];
          ((void (**)(void, void *, void))v21)[2](v21, v22, 0);
        }
      }
      if (v11) {
    }
      }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[MTRPluginProtobufOverModernTransport _sendMessageToPrimaryHomeHub:]();
      }
      v16 = [v6 responseHandler];

      if (v16)
      {
        v17 = [v6 responseHandler];
        v18 = [MEMORY[0x263F087E8] errorWithDomain:@"kMTRPluginErrorDomain" code:-1002 userInfo:0];
        ((void (**)(void, void *, void))v17)[2](v17, v18, 0);
      }
    }
  }
  else
  {
    v13 = [v6 responseHandler];

    if (v13)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[MTRPluginProtobufOverModernTransport _sendMessageToPrimaryHomeHub:]((uint64_t)self);
      }
      v14 = [v6 responseHandler];
      v15 = [MEMORY[0x263F087E8] errorWithDomain:@"kMTRPluginErrorDomain" code:-1000 userInfo:0];
      ((void (**)(void, void *, void))v14)[2](v14, v15, 0);
    }
  }
}

uint64_t __69__MTRPluginProtobufOverModernTransport__sendMessageToPrimaryHomeHub___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleResponseWithPayload:a3 error:a2 forMessage:*(void *)(a1 + 40)];
}

- (void)_sendMessageToRemotePeer:(id)a3 peerDestination:(id)a4
{
  v32[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v6 && ([v6 messageData], v8 = objc_claimAutoreleasedReturnValue(), v8, v8))
  {
    id v9 = (void *)MEMORY[0x263F42568];
    v31 = @"HMDHomeMatterRequestProtobufPayloadKey";
    v10 = [v6 messageData];
    v32[0] = v10;
    v11 = [NSDictionary dictionaryWithObjects:v32 forKeys:&v31 count:1];
    v12 = [v9 messageWithName:@"HMDHomeMatterRequestKey" destination:v7 payload:v11];

    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    v21 = __81__MTRPluginProtobufOverModernTransport__sendMessageToRemotePeer_peerDestination___block_invoke;
    v22 = &unk_2653E6CD0;
    v23 = self;
    id v13 = v6;
    id v24 = v13;
    [v12 setResponseHandler:&v19];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v26 = self;
      __int16 v27 = 2112;
      id v28 = v13;
      __int16 v29 = 2112;
      id v30 = v7;
      _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ <= Sending message: %@ to remote peer: %@", buf, 0x20u);
    }
    v14 = +[MTRPluginServer sharedInstance];
    v15 = [v13 homeIdentifier];
    [v14 _deliverMessageToDelegate:v12 homeUUID:v15];
  }
  else
  {
    v16 = [v6 responseHandler];

    if (v16)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[MTRPluginProtobufOverModernTransport _sendMessageToRemotePeer:peerDestination:]((uint64_t)self);
      }
      v17 = [v6 responseHandler];
      v18 = [MEMORY[0x263F087E8] errorWithDomain:@"kMTRPluginErrorDomain" code:-1000 userInfo:0];
      ((void (**)(void, void *, void))v17)[2](v17, v18, 0);
    }
  }
}

uint64_t __81__MTRPluginProtobufOverModernTransport__sendMessageToRemotePeer_peerDestination___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleResponseWithPayload:a3 error:a2 forMessage:*(void *)(a1 + 40)];
}

- (void)setDelegate:(id)a3 delegateQueue:(id)a4 forSessionID:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = self;
  objc_sync_enter(v10);
  v11 = [(MTRPluginProtobufOverModernTransport *)v10 messageDispatcher];
  [v11 setDelegate:v12 delegateQueue:v8 forSessionID:v9];

  objc_sync_exit(v10);
}

- (void)setDelegate:(id)a3 delegateQueue:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = self;
  objc_sync_enter(v7);
  id v8 = [(MTRPluginProtobufOverModernTransport *)v7 messageDispatcher];
  [v8 setDelegate:v9 delegateQueue:v6];

  objc_sync_exit(v7);
}

- (void)removeDelegate:(id)a3
{
  id v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  id v5 = [(MTRPluginProtobufOverModernTransport *)v4 messageDispatcher];
  [v5 removeDelegate:v6];

  objc_sync_exit(v4);
}

- (BOOL)registerForRequestMessageWithType:(id)a3 requestHandler:(SEL)a4 forSessionID:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = self;
  objc_sync_enter(v10);
  v11 = [(MTRPluginProtobufOverModernTransport *)v10 messageDispatcher];
  LOBYTE(a4) = [v11 registerForRequestMessageWithType:v8 requestHandler:a4 forSessionID:v9];

  objc_sync_exit(v10);
  return (char)a4;
}

- (BOOL)deregisterForRequestMessageWithType:(id)a3 forSessionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  id v9 = [(MTRPluginProtobufOverModernTransport *)v8 messageDispatcher];
  char v10 = [v9 deregisterForRequestMessageWithType:v6 forSessionID:v7];

  objc_sync_exit(v8);
  return v10;
}

- (BOOL)start
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = self;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ Starting Matter remote message transport over HomeKit Modern Transport", (uint8_t *)&v4, 0xCu);
  }
  return 1;
}

- (BOOL)stop
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = self;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ Stopping Matter remote message transport over HomeKit Modern Transport", (uint8_t *)&v4, 0xCu);
  }
  return 1;
}

- (NSString)description
{
  v3 = NSString;
  int v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p>", v5, self];

  return (NSString *)v6;
}

- (BOOL)dispatchIncomingMessage:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = self;
  objc_sync_enter(v6);
  id v7 = [v5 messagePayload];
  id v8 = objc_msgSend(v7, "hmf_dataForKey:", @"HMDHomeMatterRequestProtobufPayloadKey");

  if (v8)
  {
    id v9 = +[MTRPluginProtobufMessage messageWithProtobufData:v8];
    BOOL v10 = v9 != 0;
    id v11 = &_os_log_internal;
    if (v9)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = [v5 name];
        id v13 = [v5 identifier];
        *(_DWORD *)buf = 138413058;
        v32 = v6;
        __int16 v33 = 2112;
        v34 = v9;
        __int16 v35 = 2112;
        v36 = v12;
        __int16 v37 = 2112;
        v38 = v13;
        _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ => Received incoming protobuf message: %@ from HMFMessage (%@: %@)", buf, 0x2Au);
      }
      BOOL v14 = [(MTRPluginProtobufOverModernTransport *)v6 _installResponseHandlerForIncomingProtobufMessage:v9 hmfMessage:v5];
      v15 = [v5 destination];
      [v9 setSourceAddress:v15];

      v16 = [(MTRPluginProtobufOverModernTransport *)v6 messageDispatcher];
      if (v14)
      {
        v17 = v29;
        v29[0] = MEMORY[0x263EF8330];
        v29[1] = 3221225472;
        v29[2] = __64__MTRPluginProtobufOverModernTransport_dispatchIncomingMessage___block_invoke;
        v29[3] = &unk_2653E66D8;
        v3 = &v30;
        id v30 = v5;
      }
      else
      {
        v17 = 0;
      }
      int v25 = [v16 invokeMessageHandlersForMessage:v9 transport:v6 errorBlock:v17];

      if (v25)
      {
        v26 = [v9 messageType];
        BOOL v27 = [v26 intValue] == 9;

        if (!v27)
        {
          [v9 setHintRequestCheckinMessageFromPeer:1];
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v32 = v6;
            __int16 v33 = 2112;
            v34 = v9;
            _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ => Received new incoming protobuf message: %@ without checkin, requesting piggyback checkin as part of response", buf, 0x16u);
          }
        }
      }
      if (!v14)
      {
        BOOL v10 = 1;
        goto LABEL_22;
      }
      id v24 = *v3;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        v22 = [v5 name];
        v23 = [v5 identifier];
        -[MTRPluginProtobufOverModernTransport dispatchIncomingMessage:](v22, v23, (uint64_t)buf, (uint64_t)v6);
      }

      id v24 = [MEMORY[0x263F087E8] errorWithDomain:@"kMTRPluginErrorDomain" code:-1003 userInfo:0];
      [v5 respondWithError:v24];
    }
  }
  else
  {
    v18 = &_os_log_internal;
    id v19 = &_os_log_internal;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = [v5 name];
      v21 = [v5 identifier];
      -[MTRPluginProtobufOverModernTransport dispatchIncomingMessage:](v20, v21, (uint64_t)buf, (uint64_t)v6);
    }

    id v9 = [MEMORY[0x263F087E8] errorWithDomain:@"kMTRPluginErrorDomain" code:-1003 userInfo:0];
    [v5 respondWithError:v9];
    BOOL v10 = 0;
  }
LABEL_22:

  objc_sync_exit(v6);
  return v10;
}

void __64__MTRPluginProtobufOverModernTransport_dispatchIncomingMessage___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:@"kMTRPluginErrorDomain" code:-1010 userInfo:0];
  [v1 respondWithError:v2];
}

- (BOOL)_installResponseHandlerForIncomingProtobufMessage:(id)a3 hmfMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 messageHeader];
  int v9 = [v8 messageDirection];

  if (v9 == 2)
  {
    BOOL v10 = [v6 messageHeader];
    id v11 = [v10 responseHeaderForRequestHeader];

    objc_initWeak(&location, v6);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __101__MTRPluginProtobufOverModernTransport__installResponseHandlerForIncomingProtobufMessage_hmfMessage___block_invoke;
    v14[3] = &unk_2653E6CF8;
    id v15 = v7;
    id v12 = v11;
    id v16 = v12;
    v17 = self;
    objc_copyWeak(&v18, &location);
    [v6 setResponseHandler:v14];
    objc_destroyWeak(&v18);

    objc_destroyWeak(&location);
  }

  return v9 == 2;
}

void __101__MTRPluginProtobufOverModernTransport__installResponseHandlerForIncomingProtobufMessage_hmfMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    [*(id *)(a1 + 32) respondWithError:v5];
    goto LABEL_29;
  }
  if (!v6)
  {
    id v12 = objc_alloc_init(MTRPluginPBMVariableValueResponseMessage);
    [(MTRPluginPBMVariableValueResponseMessage *)v12 setHeader:*(void *)(a1 + 40)];
    id v11 = [(MTRPluginPBMVariableValueResponseMessage *)v12 data];
    goto LABEL_14;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    int v9 = v7;
  }
  else {
    int v9 = 0;
  }
  BOOL v10 = v9;
  if (isKindOfClass)
  {
    [(MTRPluginPBMVariableValueResponseMessage *)v7 setHeader:*(void *)(a1 + 40)];
    id v11 = [(MTRPluginPBMVariableValueResponseMessage *)v7 data];
    id v12 = v7;
    goto LABEL_14;
  }
  objc_opt_class();
  int v13 = objc_opt_isKindOfClass() & 1;
  if (v13) {
    BOOL v14 = v7;
  }
  else {
    BOOL v14 = 0;
  }
  id v15 = v14;
  id v12 = 0;
  id v11 = v7;
  if (v13)
  {
LABEL_14:
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    if ([WeakRetained hintRequestCheckinMessageFromPeer])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v17 = v12;
      }
      else {
        v17 = 0;
      }
      id v18 = v17;

      if (v18)
      {
        [(MTRPluginPBMVariableValueResponseMessage *)v18 setCheckinRequested:1];
        id v19 = v12;
        if (!v11)
        {
LABEL_20:
          id v5 = [MEMORY[0x263F087E8] errorWithDomain:@"kMTRPluginErrorDomain" code:-1003 userInfo:0];
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v20 = *(void *)(a1 + 48);
            v21 = [*(id *)(a1 + 32) name];
            v22 = [*(id *)(a1 + 32) identifier];
            *(_DWORD *)buf = 138413058;
            uint64_t v32 = v20;
            __int16 v33 = 2112;
            v34 = v21;
            __int16 v35 = 2112;
            v36 = v22;
            __int16 v37 = 2112;
            id v38 = v5;
            _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ <= Sending response for incoming request HMFMessage (%@ : %@) with error: %@", buf, 0x2Au);
          }
          [*(id *)(a1 + 32) respondWithError:v5];
LABEL_28:

          goto LABEL_29;
        }
LABEL_25:
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v23 = *(void *)(a1 + 48);
          id v24 = [*(id *)(a1 + 40) shortDescription];
          int v25 = [*(id *)(a1 + 32) name];
          v26 = [*(id *)(a1 + 32) identifier];
          *(_DWORD *)buf = 138413058;
          uint64_t v32 = v23;
          __int16 v33 = 2112;
          v34 = v24;
          __int16 v35 = 2112;
          v36 = v25;
          __int16 v37 = 2112;
          id v38 = v26;
          _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ <= Sending response %@ for incoming request HMFMessage (%@ : %@)", buf, 0x2Au);
        }
        BOOL v27 = *(void **)(a1 + 32);
        __int16 v29 = @"HMDHomeMatterRequestProtobufPayloadKey";
        id v30 = v11;
        id v28 = [NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
        [v27 respondWithPayload:v28];

        id v5 = 0;
        goto LABEL_28;
      }
    }
    else
    {
    }
    id v19 = 0;
    if (!v11) {
      goto LABEL_20;
    }
    goto LABEL_25;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __101__MTRPluginProtobufOverModernTransport__installResponseHandlerForIncomingProtobufMessage_hmfMessage___block_invoke_cold_1(a1);
  }
  id v5 = 0;
LABEL_29:
}

- (void)_handleResponseWithPayload:(id)a3 error:(id)a4 forMessage:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    objc_msgSend(v8, "hmf_dataForKey:", @"HMDHomeMatterRequestProtobufPayloadKey");
    id v12 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      int v13 = +[MTRPluginProtobufMessage messageWithProtobufData:v12];
      if (v13)
      {
        BOOL v14 = [[MTRPluginPBMVariableValueResponseMessage alloc] initWithData:v12];
        if (v14)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            int v20 = 138412546;
            v21 = self;
            __int16 v22 = 2112;
            id v23 = v13;
            _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ => Received responseValue in response for protobuf message %@", (uint8_t *)&v20, 0x16u);
          }
          id v9 = [(MTRPluginPBMVariableValueResponseMessage *)v14 error];
          if (v9) {
            id v15 = 0;
          }
          else {
            id v15 = v12;
          }
          v17 = [v10 responseHandler];

          if (v17)
          {
            id v18 = [v10 responseHandler];
            ((void (**)(void, id, id))v18)[2](v18, v9, v15);
          }
          if ([(MTRPluginPBMVariableValueResponseMessage *)v14 checkinRequested])
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
            {
              int v20 = 138412546;
              v21 = self;
              __int16 v22 = 2112;
              id v23 = v10;
              _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ => Received responseValue for message %@ that is requesting a checkin, scheduling a checkin", (uint8_t *)&v20, 0x16u);
            }
            id v19 = clientConnectionForMessage(v10);
            [v19 updateControllerConfigurationForRemotePeer];
          }
        }
        else
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            -[MTRPluginProtobufOverModernTransport _handleResponseWithPayload:error:forMessage:]();
          }
          id v9 = [MEMORY[0x263F087E8] errorWithDomain:@"kMTRPluginErrorDomain" code:-1008 userInfo:0];
          id v15 = 0;
        }
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[MTRPluginProtobufOverModernTransport _handleResponseWithPayload:error:forMessage:]();
        }
        id v9 = [v10 responseHandler];

        if (!v9) {
          goto LABEL_34;
        }
        id v15 = [v10 responseHandler];
        BOOL v14 = [MEMORY[0x263F087E8] errorWithDomain:@"kMTRPluginErrorDomain" code:-1003 userInfo:0];
        (*((void (**)(id, MTRPluginPBMVariableValueResponseMessage *, void))v15 + 2))(v15, v14, 0);
        id v9 = 0;
      }
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[MTRPluginProtobufOverModernTransport _handleResponseWithPayload:error:forMessage:]();
      }
      id v16 = [v10 responseHandler];

      if (!v16)
      {
        id v9 = 0;
        goto LABEL_35;
      }
      int v13 = [v10 responseHandler];
      id v15 = [MEMORY[0x263F087E8] errorWithDomain:@"kMTRPluginErrorDomain" code:-1003 userInfo:0];
      ((void (**)(void, id, void))v13)[2](v13, v15, 0);
      id v9 = 0;
    }

LABEL_34:
    goto LABEL_35;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[MTRPluginProtobufOverModernTransport _handleResponseWithPayload:error:forMessage:].cold.4();
  }
  id v11 = [v10 responseHandler];

  if (v11)
  {
    id v12 = [v10 responseHandler];
    ((void (**)(void, id, void))v12)[2](v12, v9, 0);
LABEL_35:
  }
}

- (MTRPluginProtobufMessageDispatcher)messageDispatcher
{
  return (MTRPluginProtobufMessageDispatcher *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMessageDispatcher:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)_sendMessageToPrimaryHomeHub:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%@ Unable to send message over to home hub since message is nil", (uint8_t *)&v1, 0xCu);
}

- (void)_sendMessageToPrimaryHomeHub:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_2558FC000, &_os_log_internal, v0, "%@ No connection found to _deliverMessagePayloadToPrimaryResident for message: %@", v1, v2, v3, v4, v5);
}

- (void)_sendMessageToPrimaryHomeHub:.cold.3()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_2558FC000, &_os_log_internal, v0, "%@ Failed to _deliverMessagePayloadToPrimaryResident for connection: %@", v1, v2, v3, v4, v5);
}

- (void)_sendMessageToRemotePeer:(uint64_t)a1 peerDestination:.cold.1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%@ Unable to send message over to remote peer since message is nil", (uint8_t *)&v1, 0xCu);
}

- (void)dispatchIncomingMessage:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  OUTLINED_FUNCTION_2_0((uint64_t)a1, (uint64_t)a2, a3, a4, 5.7781e-34);
  _os_log_error_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%@ => Received invalid incoming HMFMessage (%@: %@) to dispatch as it is missing protobuf payload", v6, 0x20u);
}

- (void)dispatchIncomingMessage:(uint64_t)a3 .cold.2(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  OUTLINED_FUNCTION_2_0((uint64_t)a1, (uint64_t)a2, a3, a4, 5.7781e-34);
  _os_log_error_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%@ => Received invalid HMFMessage (%@ : %@), failed to unpack protobuf data", v6, 0x20u);
}

void __101__MTRPluginProtobufOverModernTransport__installResponseHandlerForIncomingProtobufMessage_hmfMessage___block_invoke_cold_1(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  OUTLINED_FUNCTION_2(&dword_2558FC000, &_os_log_internal, v1, "%@ Failed to respond to incoming protobuf message %@ due to malformed response", v2, v3, v4, v5, 2u);
}

- (void)_handleResponseWithPayload:error:forMessage:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_2558FC000, &_os_log_internal, v0, "%@ => Received invalid HMFMessage payload in response for message %@ as it is missing protobuf payload", v1, v2, v3, v4, v5);
}

- (void)_handleResponseWithPayload:error:forMessage:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_2558FC000, &_os_log_internal, v0, "%@ => Received invalid HMFMessage payload in response for message %@, failed to unpack protobuf data", v1, v2, v3, v4, v5);
}

- (void)_handleResponseWithPayload:error:forMessage:.cold.3()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_2558FC000, &_os_log_internal, v0, "%@ => Received invalid responseValue in response for protobuf message %@", v1, v2, v3, v4, v5);
}

- (void)_handleResponseWithPayload:error:forMessage:.cold.4()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  __int16 v3 = v0;
  uint64_t v4 = v1;
  _os_log_error_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%@ Received error %@ in response for message: %@", v2, 0x20u);
}

@end