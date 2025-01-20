@interface LBAttendingStatesServiceClient
- (BOOL)isAttending;
- (LBAttendingStatesServiceClient)initWithDelegate:(id)a3;
- (LBAttendingStatesServiceDelegate)delegate;
- (NSString)xpcConnectionUUIDString;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)queue;
- (id)_connection;
- (id)_newConnection;
- (id)_service;
- (id)remoteObjectProxy;
- (void)_invalidate;
- (void)dealloc;
- (void)directActionJarvisAnnounceMessageTriggerWithDeviceId:(id)a3;
- (void)dismissAttending;
- (void)invalidate;
- (void)localAttendingStartedWithRootRequestId:(id)a3;
- (void)localAttendingStopped;
- (void)localAttendingStoppedUnexpectedlyWithError:(id)a3;
- (void)localAttendingWillStartWithRootRequestId:(id)a3;
- (void)requestDismissed;
- (void)setDelegate:(id)a3;
- (void)setIsAttending:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setRemoteObjectProxy:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)setXpcConnectionUUIDString:(id)a3;
- (void)siriDidPrompt;
- (void)siriDidPromptWithRootRequestId:(id)a3;
- (void)siriPromptWillStart;
- (void)siriPromptWillStartWithRootRequestId:(id)a3;
- (void)speechRecognizerReadyForNewTurnWithSpeechStartDetectedAtHostTime:(unint64_t)a3 audioRecordType:(int64_t)a4 audioRecordDeviceId:(id)a5;
- (void)speechStartDetectedWithHostTime:(unint64_t)a3 audioRecordType:(int64_t)a4 audioRecordDeviceId:(id)a5;
- (void)speechStartDetectedWithShouldDuckTTS:(BOOL)a3;
- (void)startUpdateStates;
@end

@implementation LBAttendingStatesServiceClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnectionUUIDString, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_remoteObjectProxy, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setIsAttending:(BOOL)a3
{
  self->_isAttending = a3;
}

- (BOOL)isAttending
{
  return self->_isAttending;
}

- (void)setXpcConnectionUUIDString:(id)a3
{
}

- (NSString)xpcConnectionUUIDString
{
  return self->_xpcConnectionUUIDString;
}

- (void)setDelegate:(id)a3
{
}

- (LBAttendingStatesServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (LBAttendingStatesServiceDelegate *)WeakRetained;
}

- (void)setRemoteObjectProxy:(id)a3
{
}

- (id)remoteObjectProxy
{
  return self->_remoteObjectProxy;
}

- (void)setXpcConnection:(id)a3
{
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)_service
{
  v2 = [(LBAttendingStatesServiceClient *)self _connection];
  v3 = [v2 remoteObjectProxy];

  return v3;
}

- (id)_connection
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    v4 = [MEMORY[0x263F08C38] UUID];
    v5 = [v4 UUIDString];
    xpcConnectionUUIDString = self->_xpcConnectionUUIDString;
    self->_xpcConnectionUUIDString = v5;

    v7 = LBLogContextFacilityLocalSRBridge;
    if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
    {
      v8 = self->_xpcConnectionUUIDString;
      *(_DWORD *)buf = 136315394;
      v27 = "-[LBAttendingStatesServiceClient _connection]";
      __int16 v28 = 2114;
      v29 = v8;
      _os_log_impl(&dword_21F71B000, v7, OS_LOG_TYPE_DEFAULT, "%s Creating new xpc connection %{public}@...", buf, 0x16u);
    }
    v9 = [(LBAttendingStatesServiceClient *)self _newConnection];
    v10 = self->_xpcConnection;
    self->_xpcConnection = v9;

    objc_initWeak((id *)buf, self);
    v11 = self->_xpcConnectionUUIDString;
    v12 = self->_xpcConnection;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __45__LBAttendingStatesServiceClient__connection__block_invoke;
    v23[3] = &unk_264522090;
    v13 = v11;
    v24 = v13;
    objc_copyWeak(&v25, (id *)buf);
    [(NSXPCConnection *)v12 setInterruptionHandler:v23];
    v14 = self->_xpcConnection;
    uint64_t v17 = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    v19 = __45__LBAttendingStatesServiceClient__connection__block_invoke_16;
    v20 = &unk_264522090;
    v15 = v13;
    v21 = v15;
    objc_copyWeak(&v22, (id *)buf);
    [(NSXPCConnection *)v14 setInvalidationHandler:&v17];
    [(NSXPCConnection *)self->_xpcConnection resume];
    objc_destroyWeak(&v22);

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
    xpcConnection = self->_xpcConnection;
  }
  return xpcConnection;
}

void __45__LBAttendingStatesServiceClient__connection__block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v2 = (void *)LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v6 = [WeakRetained xpcConnectionUUIDString];
    int v17 = 136315906;
    uint64_t v18 = "-[LBAttendingStatesServiceClient _connection]_block_invoke";
    __int16 v19 = 2112;
    v20 = @"com.apple.siri.attendingstates.xpc";
    __int16 v21 = 2114;
    id v22 = v3;
    __int16 v23 = 2114;
    v24 = v6;
    _os_log_impl(&dword_21F71B000, v4, OS_LOG_TYPE_DEFAULT, "%s xpc connection %@(%{public}@) Interrupted (current connection: %{public}@", (uint8_t *)&v17, 0x2Au);
  }
  v7 = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v8 = v7;
  if (v7)
  {
    v9 = *(void **)(a1 + 32);
    v10 = [v7 xpcConnectionUUIDString];
    LOBYTE(v9) = [v9 isEqualToString:v10];

    if (v9)
    {
      [v8[3] setInvalidationHandler:0];
      [v8[3] invalidate];
      id v11 = v8[3];
      v8[3] = 0;

      if (*((unsigned char *)v8 + 8))
      {
        *((unsigned char *)v8 + 8) = 0;
        v12 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.localsrbridge" code:501 userInfo:0];
        v13 = objc_loadWeakRetained(v8 + 5);
        [v13 localAttendingStoppedUnexpectedlyWithError:v12];
LABEL_9:

        goto LABEL_10;
      }
      v16 = LBLogContextFacilityLocalSRBridge;
      if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 136315138;
        uint64_t v18 = "-[LBAttendingStatesServiceClient _connection]_block_invoke";
        _os_log_impl(&dword_21F71B000, v16, OS_LOG_TYPE_DEFAULT, "%s Skip reporting unexpected stop due to xpc interruption, since Siri is not in attending state", (uint8_t *)&v17, 0xCu);
      }
    }
    else
    {
      v14 = (void *)LBLogContextFacilityLocalSRBridge;
      if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_INFO))
      {
        v15 = *(__CFString **)(a1 + 32);
        v12 = v14;
        v13 = [v8 xpcConnectionUUIDString];
        int v17 = 136315650;
        uint64_t v18 = "-[LBAttendingStatesServiceClient _connection]_block_invoke";
        __int16 v19 = 2112;
        v20 = v15;
        __int16 v21 = 2112;
        id v22 = v13;
        _os_log_impl(&dword_21F71B000, v12, OS_LOG_TYPE_INFO, "%s Ignore since the UUID of xpc connection not match : %@ vs. %@", (uint8_t *)&v17, 0x20u);
        goto LABEL_9;
      }
    }
  }
LABEL_10:
}

void __45__LBAttendingStatesServiceClient__connection__block_invoke_16(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v2 = (void *)LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v6 = [WeakRetained xpcConnectionUUIDString];
    int v17 = 136315906;
    uint64_t v18 = "-[LBAttendingStatesServiceClient _connection]_block_invoke";
    __int16 v19 = 2112;
    v20 = @"com.apple.siri.attendingstates.xpc";
    __int16 v21 = 2112;
    id v22 = v3;
    __int16 v23 = 2114;
    v24 = v6;
    _os_log_impl(&dword_21F71B000, v4, OS_LOG_TYPE_DEFAULT, "%s xpc connection %@(%@) Invalidated (current connection: %{public}@", (uint8_t *)&v17, 0x2Au);
  }
  id v7 = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = v7;
  if (v7)
  {
    v9 = *(void **)(a1 + 32);
    v10 = [v7 xpcConnectionUUIDString];
    LOBYTE(v9) = [v9 isEqualToString:v10];

    if (v9)
    {
      id v11 = (void *)*((void *)v8 + 3);
      *((void *)v8 + 3) = 0;

      if (*((unsigned char *)v8 + 8))
      {
        *((unsigned char *)v8 + 8) = 0;
        v12 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.localsrbridge" code:501 userInfo:0];
        v13 = objc_loadWeakRetained((id *)v8 + 5);
        [v13 localAttendingStoppedUnexpectedlyWithError:v12];
LABEL_9:

        goto LABEL_10;
      }
      v16 = LBLogContextFacilityLocalSRBridge;
      if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 136315138;
        uint64_t v18 = "-[LBAttendingStatesServiceClient _connection]_block_invoke";
        _os_log_impl(&dword_21F71B000, v16, OS_LOG_TYPE_DEFAULT, "%s Skip reporting unexpected stop due to xpc invalidation, since Siri is not in attending state", (uint8_t *)&v17, 0xCu);
      }
    }
    else
    {
      v14 = (void *)LBLogContextFacilityLocalSRBridge;
      if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_INFO))
      {
        v15 = *(__CFString **)(a1 + 32);
        v12 = v14;
        v13 = [v8 xpcConnectionUUIDString];
        int v17 = 136315650;
        uint64_t v18 = "-[LBAttendingStatesServiceClient _connection]_block_invoke";
        __int16 v19 = 2112;
        v20 = v15;
        __int16 v21 = 2112;
        id v22 = v13;
        _os_log_impl(&dword_21F71B000, v12, OS_LOG_TYPE_INFO, "%s Ignore since the UUID of xpc connection not match : %@ vs. %@", (uint8_t *)&v17, 0x20u);
        goto LABEL_9;
      }
    }
  }
LABEL_10:
}

- (id)_newConnection
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.siri.attendingstates.xpc" options:0];
  id v4 = (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D12A6E8];
  [v3 setRemoteObjectInterface:v4];

  id v5 = (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D12A598];
  [v3 setExportedInterface:v5];

  [v3 setExportedObject:self];
  [v3 _setQueue:self->_queue];
  return v3;
}

- (void)speechRecognizerReadyForNewTurnWithSpeechStartDetectedAtHostTime:(unint64_t)a3 audioRecordType:(int64_t)a4 audioRecordDeviceId:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v9 = LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315906;
    v15 = "-[LBAttendingStatesServiceClient speechRecognizerReadyForNewTurnWithSpeechStartDetectedAtHostTime:audioRecordT"
          "ype:audioRecordDeviceId:]";
    __int16 v16 = 2048;
    unint64_t v17 = a3;
    __int16 v18 = 2048;
    int64_t v19 = a4;
    __int16 v20 = 2114;
    id v21 = v8;
    _os_log_impl(&dword_21F71B000, v9, OS_LOG_TYPE_DEFAULT, "%s hostTime : %llu, audioRecordType : %lld, deviceId : %{public}@", (uint8_t *)&v14, 0x2Au);
  }
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    id v13 = objc_loadWeakRetained((id *)p_delegate);
    [v13 speechRecognizerReadyForNewTurnWithSpeechStartDetectedAtHostTime:a3 audioRecordType:a4 audioRecordDeviceId:v8];
  }
}

- (void)speechStartDetectedWithShouldDuckTTS:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    id v11 = "-[LBAttendingStatesServiceClient speechStartDetectedWithShouldDuckTTS:]";
    __int16 v12 = 1026;
    BOOL v13 = v3;
    _os_log_impl(&dword_21F71B000, v5, OS_LOG_TYPE_DEFAULT, "%s shouldDuckTTS: %{public}d", (uint8_t *)&v10, 0x12u);
  }
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)p_delegate);
    [v9 speechStartDetectedWithShouldDuckTTS:v3];
  }
}

- (void)speechStartDetectedWithHostTime:(unint64_t)a3 audioRecordType:(int64_t)a4 audioRecordDeviceId:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v9 = LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315906;
    v15 = "-[LBAttendingStatesServiceClient speechStartDetectedWithHostTime:audioRecordType:audioRecordDeviceId:]";
    __int16 v16 = 2048;
    unint64_t v17 = a3;
    __int16 v18 = 2048;
    int64_t v19 = a4;
    __int16 v20 = 2114;
    id v21 = v8;
    _os_log_impl(&dword_21F71B000, v9, OS_LOG_TYPE_DEFAULT, "%s hostTime : %llu, audioRecordType : %lld, deviceId : %{public}@", (uint8_t *)&v14, 0x2Au);
  }
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    id v13 = objc_loadWeakRetained((id *)p_delegate);
    [v13 speechStartDetectedWithHostTime:a3 audioRecordType:a4 audioRecordDeviceId:v8];
  }
}

- (void)localAttendingStopped
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  BOOL v3 = LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[LBAttendingStatesServiceClient localAttendingStopped]";
    _os_log_impl(&dword_21F71B000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }
  self->_isAttending = 0;
}

- (void)localAttendingStoppedUnexpectedlyWithError:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  uint64_t v6 = LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    id v9 = "-[LBAttendingStatesServiceClient localAttendingStoppedUnexpectedlyWithError:]";
    _os_log_impl(&dword_21F71B000, v6, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v8, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained localAttendingStoppedUnexpectedlyWithError:v5];
}

- (void)localAttendingStartedWithRootRequestId:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    id v11 = "-[LBAttendingStatesServiceClient localAttendingStartedWithRootRequestId:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_21F71B000, v5, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v10, 0x16u);
  }
  self->_isAttending = 1;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)p_delegate);
    [v9 localAttendingStartedWithRootRequestId:v4];
  }
}

- (void)localAttendingWillStartWithRootRequestId:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    id v11 = "-[LBAttendingStatesServiceClient localAttendingWillStartWithRootRequestId:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_21F71B000, v5, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v10, 0x16u);
  }
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)p_delegate);
    [v9 localAttendingWillStartWithRootRequestId:v4];
  }
}

- (void)requestDismissed
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__LBAttendingStatesServiceClient_requestDismissed__block_invoke;
  block[3] = &unk_264522130;
  block[4] = self;
  dispatch_async(queue, block);
}

void __50__LBAttendingStatesServiceClient_requestDismissed__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[LBAttendingStatesServiceClient requestDismissed]_block_invoke";
    _os_log_impl(&dword_21F71B000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }
  BOOL v3 = [*(id *)(a1 + 32) _service];
  [v3 requestDismissed];
}

- (void)dismissAttending
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__LBAttendingStatesServiceClient_dismissAttending__block_invoke;
  block[3] = &unk_264522130;
  block[4] = self;
  dispatch_async(queue, block);
}

void __50__LBAttendingStatesServiceClient_dismissAttending__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[LBAttendingStatesServiceClient dismissAttending]_block_invoke";
    _os_log_impl(&dword_21F71B000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }
  BOOL v3 = [*(id *)(a1 + 32) _service];
  [v3 dismissAttending];
}

- (void)directActionJarvisAnnounceMessageTriggerWithDeviceId:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __87__LBAttendingStatesServiceClient_directActionJarvisAnnounceMessageTriggerWithDeviceId___block_invoke;
  v7[3] = &unk_264522060;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __87__LBAttendingStatesServiceClient_directActionJarvisAnnounceMessageTriggerWithDeviceId___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[LBAttendingStatesServiceClient directActionJarvisAnnounceMessageTriggerWithDeviceId:]_block_invoke";
    _os_log_impl(&dword_21F71B000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }
  BOOL v3 = [*(id *)(a1 + 32) _service];
  [v3 directActionJarvisAnnounceMessageTriggerWithDeviceId:*(void *)(a1 + 40)];
}

- (void)siriDidPromptWithRootRequestId:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__LBAttendingStatesServiceClient_siriDidPromptWithRootRequestId___block_invoke;
  v7[3] = &unk_264522060;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __65__LBAttendingStatesServiceClient_siriDidPromptWithRootRequestId___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 136315394;
    id v6 = "-[LBAttendingStatesServiceClient siriDidPromptWithRootRequestId:]_block_invoke";
    __int16 v7 = 2112;
    uint64_t v8 = v3;
    _os_log_impl(&dword_21F71B000, v2, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v5, 0x16u);
  }
  id v4 = [*(id *)(a1 + 40) _service];
  [v4 siriDidPromptWithRootRequestId:*(void *)(a1 + 32)];
}

- (void)siriPromptWillStartWithRootRequestId:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71__LBAttendingStatesServiceClient_siriPromptWillStartWithRootRequestId___block_invoke;
  v7[3] = &unk_264522060;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __71__LBAttendingStatesServiceClient_siriPromptWillStartWithRootRequestId___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 136315394;
    id v6 = "-[LBAttendingStatesServiceClient siriPromptWillStartWithRootRequestId:]_block_invoke";
    __int16 v7 = 2112;
    uint64_t v8 = v3;
    _os_log_impl(&dword_21F71B000, v2, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v5, 0x16u);
  }
  id v4 = [*(id *)(a1 + 40) _service];
  [v4 siriPromptWillStartWithRootRequestId:*(void *)(a1 + 32)];
}

- (void)siriDidPrompt
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__LBAttendingStatesServiceClient_siriDidPrompt__block_invoke;
  block[3] = &unk_264522130;
  block[4] = self;
  dispatch_async(queue, block);
}

void __47__LBAttendingStatesServiceClient_siriDidPrompt__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _service];
  [v1 siriDidPrompt];
}

- (void)siriPromptWillStart
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__LBAttendingStatesServiceClient_siriPromptWillStart__block_invoke;
  block[3] = &unk_264522130;
  block[4] = self;
  dispatch_async(queue, block);
}

void __53__LBAttendingStatesServiceClient_siriPromptWillStart__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _service];
  [v1 siriPromptWillStart];
}

- (void)_invalidate
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    uint64_t v8 = "-[LBAttendingStatesServiceClient _invalidate]";
    _os_log_impl(&dword_21F71B000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v7, 0xCu);
  }
  [(NSXPCConnection *)self->_xpcConnection setInvalidationHandler:0];
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = 0;

  id remoteObjectProxy = self->_remoteObjectProxy;
  self->_id remoteObjectProxy = 0;

  xpcConnectionUUIDString = self->_xpcConnectionUUIDString;
  self->_xpcConnectionUUIDString = 0;
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__LBAttendingStatesServiceClient_invalidate__block_invoke;
  block[3] = &unk_264522130;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __44__LBAttendingStatesServiceClient_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)startUpdateStates
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__LBAttendingStatesServiceClient_startUpdateStates__block_invoke;
  block[3] = &unk_264522130;
  block[4] = self;
  dispatch_async(queue, block);
}

void __51__LBAttendingStatesServiceClient_startUpdateStates__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    int v5 = "-[LBAttendingStatesServiceClient startUpdateStates]_block_invoke";
    _os_log_impl(&dword_21F71B000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }
  uint64_t v3 = [*(id *)(a1 + 32) _service];
  [v3 startUpdateStates];
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v6 = "-[LBAttendingStatesServiceClient dealloc]";
    _os_log_impl(&dword_21F71B000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  [(LBAttendingStatesServiceClient *)self _invalidate];
  v4.receiver = self;
  v4.super_class = (Class)LBAttendingStatesServiceClient;
  [(LBAttendingStatesServiceClient *)&v4 dealloc];
}

- (LBAttendingStatesServiceClient)initWithDelegate:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)LBAttendingStatesServiceClient;
  int v5 = [(LBAttendingStatesServiceClient *)&v11 init];
  if (v5)
  {
    if (LBLogInitIfNeeded_once != -1) {
      dispatch_once(&LBLogInitIfNeeded_once, &__block_literal_global);
    }
    uint64_t v6 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v7 = dispatch_queue_create("LBAttendingStatesServiceClient Queue", v6);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    objc_storeWeak((id *)&v5->_delegate, v4);
  }
  uint64_t v9 = LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v13 = "-[LBAttendingStatesServiceClient initWithDelegate:]";
    __int16 v14 = 2048;
    v15 = v5;
    _os_log_impl(&dword_21F71B000, v9, OS_LOG_TYPE_DEFAULT, "%s created %p", buf, 0x16u);
  }

  return v5;
}

@end