@interface AXServer
- (AXDispatchTimer)assertionRetryTimer;
- (AXIPCClient)client;
- (AXIPCServer)server;
- (AXServer)init;
- (BOOL)_connectIfNecessary;
- (BOOL)_connectServerIfNecessary;
- (BOOL)sendSimpleMessage:(id)a3 enqueueError:(id *)a4;
- (BOOL)sendSimpleMessageWithResult:(id)a3;
- (BOOL)shouldRegisterClientCallbackSourceOnMainRunloop;
- (NSMutableArray)actionHandlers;
- (NSMutableArray)assertionWorkBacklog;
- (NSString)serverIdentifier;
- (OS_dispatch_queue)assertionWorkQueue;
- (id)_handleActionResult:(id)a3;
- (id)_sendMessage:(id)a3 error:(id *)a4;
- (id)_serviceName;
- (id)sendMessage:(id)a3;
- (id)sendSimpleMessageWithObjectResult:(id)a3;
- (int)_actionResultKey;
- (void)_connectIfNecessary;
- (void)_connectServerIfNecessary;
- (void)_didConnectToServer;
- (void)_ensureAssertionsHaveBeenProcessedWithCompletion:(id)a3;
- (void)_initializeAssertionBookkeeping;
- (void)_processAssertionBacklog;
- (void)_registerActionHandler:(id)a3 withIdentifierCallback:(id)a4 retryInterval:(double)a5 registrationMessageKey:(int)a6;
- (void)_removeActionHandler:(id)a3 registrationMessageKey:(int)a4;
- (void)acquireAssertionWithType:(id)a3 identifier:(id)a4;
- (void)dealloc;
- (void)relinquishAssertionWithType:(id)a3 identifier:(id)a4;
- (void)sendAsynchronousMessage:(id)a3 replyOnQueue:(id)a4 BOOLResultHandler:(id)a5;
- (void)sendAsynchronousMessage:(id)a3 replyOnQueue:(id)a4 handler:(id)a5;
- (void)sendAsynchronousMessage:(id)a3 replyOnQueue:(id)a4 objectResultHandler:(id)a5;
- (void)sendSimpleMessage:(id)a3;
- (void)setActionHandlers:(id)a3;
- (void)setAssertionRetryTimer:(id)a3;
- (void)setAssertionWorkBacklog:(id)a3;
- (void)setAssertionWorkQueue:(id)a3;
- (void)setClient:(id)a3;
- (void)setServer:(id)a3;
- (void)setServerIdentifier:(id)a3;
- (void)setShouldRegisterClientCallbackSourceOnMainRunloop:(BOOL)a3;
@end

@implementation AXServer

void __32__AXServer__handleActionResult___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) actionHandlers];
  v3 = (void *)[v2 copy];

  id v5 = *(id *)(a1 + 40);
  id v4 = v3;
  AXPerformBlockAsynchronouslyOnMainThread();
}

- (id)_handleActionResult:(id)a3
{
  v3 = [a3 payload];
  id v4 = [v3 objectForKey:@"type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v4 integerValue];
    v7 = [v3 objectForKey:@"payload"];
    id v5 = v7;
    AX_PERFORM_WITH_LOCK();
  }
  return 0;
}

void __32__AXServer__handleActionResult___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6), "handler", (void)v8);
        v7 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
        v7[2](v7, *(void *)(a1 + 48), *(void *)(a1 + 40));

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (AXServer)init
{
  v7.receiver = self;
  v7.super_class = (Class)AXServer;
  id v2 = [(AXServer *)&v7 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.accessibility.AXServer.assertion", 0);
    [(AXServer *)v2 setAssertionWorkQueue:v3];

    *(void *)&v2->_clientLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = objc_opt_new();
    actionHandlers = v2->_actionHandlers;
    v2->_actionHandlers = (NSMutableArray *)v4;
  }
  return v2;
}

- (void)dealloc
{
  [(AXServer *)self _willClearServer];
  dispatch_queue_t v3 = [(AXServer *)self client];
  [v3 setPortDeathHandler:0];

  v4.receiver = self;
  v4.super_class = (Class)AXServer;
  [(AXServer *)&v4 dealloc];
}

- (NSString)serverIdentifier
{
  serverIdentifier = self->_serverIdentifier;
  if (!serverIdentifier)
  {
    id v4 = [NSString alloc];
    uint64_t v5 = (NSString *)[v4 initWithFormat:@"%@-%d-%d", @"com.apple.accessibility.AXSystemReplyServer", getpid(), serverIdentifier_count];
    uint64_t v6 = self->_serverIdentifier;
    self->_serverIdentifier = v5;

    ++serverIdentifier_count;
    serverIdentifier = self->_serverIdentifier;
  }

  return serverIdentifier;
}

- (void)sendSimpleMessage:(id)a3
{
}

- (BOOL)sendSimpleMessage:(id)a3 enqueueError:(id *)a4
{
  id v6 = a3;
  [(AXServer *)self _connectIfNecessary];
  objc_super v7 = [(AXServer *)self client];
  LOBYTE(a4) = [v7 sendSimpleMessage:v6 withError:a4];

  return (char)a4;
}

- (BOOL)sendSimpleMessageWithResult:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  uint64_t v5 = [(AXServer *)self sendSimpleMessageWithObjectResult:v4];
  id v6 = __UIAccessibilityCastAsClass();

  char v7 = [v6 BOOLValue];
  return v7;
}

- (id)sendSimpleMessageWithObjectResult:(id)a3
{
  id v4 = a3;
  if ([(AXServer *)self _connectIfNecessary])
  {
    uint64_t v5 = [(AXServer *)self client];
    id v12 = 0;
    id v6 = [v5 sendMessage:v4 withError:&v12];
    id v7 = v12;

    if (v7)
    {
      long long v8 = AXLogIPC();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[AXServer sendSimpleMessageWithObjectResult:](v4, v7);
      }
    }
    long long v9 = [v6 payload];
    long long v10 = [v9 objectForKey:@"result"];
  }
  else
  {
    long long v10 = 0;
  }

  return v10;
}

- (id)sendMessage:(id)a3
{
  return [(AXServer *)self _sendMessage:a3 error:0];
}

- (id)_sendMessage:(id)a3 error:(id *)a4
{
  if (a3)
  {
    id v6 = a3;
    [(AXServer *)self _connectIfNecessary];
    id v7 = [(AXServer *)self client];
    long long v8 = [v7 sendMessage:v6 withError:a4];
  }
  else
  {
    long long v8 = 0;
  }

  return v8;
}

- (void)sendAsynchronousMessage:(id)a3 replyOnQueue:(id)a4 BOOLResultHandler:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__AXServer_sendAsynchronousMessage_replyOnQueue_BOOLResultHandler___block_invoke;
  v10[3] = &unk_1E5586700;
  id v11 = v8;
  id v9 = v8;
  [(AXServer *)self sendAsynchronousMessage:a3 replyOnQueue:a4 objectResultHandler:v10];
}

uint64_t __67__AXServer_sendAsynchronousMessage_replyOnQueue_BOOLResultHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [a2 BOOLValue];
  id v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);

  return v4(v2, v3);
}

- (void)sendAsynchronousMessage:(id)a3 replyOnQueue:(id)a4 objectResultHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__AXServer_sendAsynchronousMessage_replyOnQueue_objectResultHandler___block_invoke;
  v12[3] = &unk_1E5586A60;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(AXServer *)self sendAsynchronousMessage:v11 replyOnQueue:a4 handler:v12];
}

void __69__AXServer_sendAsynchronousMessage_replyOnQueue_objectResultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = AXLogIPC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __69__AXServer_sendAsynchronousMessage_replyOnQueue_objectResultHandler___block_invoke_cold_1(a1, v5);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = [a2 payload];
    id v9 = [v8 objectForKey:@"result"];
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v9);
  }
}

- (void)sendAsynchronousMessage:(id)a3 replyOnQueue:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  if (v8)
  {
    [(AXServer *)self _connectIfNecessary];
    id v11 = [(AXServer *)self client];
    [v11 sendAsyncMessage:v8 replyOnQueue:v10 replyHandler:v9];
  }
  else
  {
    _AXLogWithFacility();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__AXServer_sendAsynchronousMessage_replyOnQueue_handler___block_invoke;
    block[3] = &unk_1E5586638;
    id v13 = v9;
    dispatch_async(v10, block);
  }
}

uint64_t __57__AXServer_sendAsynchronousMessage_replyOnQueue_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_processAssertionBacklog
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = [a2 type];
  uint64_t v7 = [a2 identifier];
  int v8 = 138412802;
  uint64_t v9 = a1;
  __int16 v10 = 2112;
  id v11 = v6;
  __int16 v12 = 2112;
  id v13 = v7;
  _os_log_error_impl(&dword_18D308000, a3, OS_LOG_TYPE_ERROR, "Timed out trying to %@ assertion with type: %@ identifier: error: %@. will retry.", (uint8_t *)&v8, 0x20u);
}

void __36__AXServer__processAssertionBacklog__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _processAssertionBacklog];
}

- (void)_initializeAssertionBookkeeping
{
  uint64_t v3 = [(AXServer *)self assertionWorkBacklog];

  if (!v3)
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    [(AXServer *)self setAssertionWorkBacklog:v4];
  }
  id v5 = [(AXServer *)self assertionRetryTimer];

  if (!v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F48318]);
    uint64_t v7 = [(AXServer *)self assertionWorkQueue];
    id v8 = (id)[v6 initWithTargetSerialQueue:v7];

    [v8 setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
    [(AXServer *)self setAssertionRetryTimer:v8];
  }
}

- (void)acquireAssertionWithType:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__AXServer_acquireAssertionWithType_identifier___block_invoke;
  aBlock[3] = &unk_1E5586A88;
  aBlock[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v8 = v7;
  id v9 = v6;
  __int16 v10 = _Block_copy(aBlock);
  id v11 = [(AXServer *)self assertionWorkQueue];
  dispatch_async(v11, v10);
}

void __48__AXServer_acquireAssertionWithType_identifier___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _initializeAssertionBookkeeping];
  uint64_t v3 = [[AXAssertionWorkItem alloc] initWithType:*(void *)(a1 + 40) identifier:*(void *)(a1 + 48) isAcquisition:1];
  uint64_t v2 = [*(id *)(a1 + 32) assertionWorkBacklog];
  [v2 addObject:v3];

  [*(id *)(a1 + 32) _processAssertionBacklog];
}

- (void)relinquishAssertionWithType:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__AXServer_relinquishAssertionWithType_identifier___block_invoke;
  aBlock[3] = &unk_1E5586A88;
  aBlock[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v8 = v7;
  id v9 = v6;
  __int16 v10 = _Block_copy(aBlock);
  id v11 = [(AXServer *)self assertionWorkQueue];
  dispatch_async(v11, v10);
}

void __51__AXServer_relinquishAssertionWithType_identifier___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _initializeAssertionBookkeeping];
  uint64_t v3 = [[AXAssertionWorkItem alloc] initWithType:*(void *)(a1 + 40) identifier:*(void *)(a1 + 48) isAcquisition:0];
  uint64_t v2 = [*(id *)(a1 + 32) assertionWorkBacklog];
  [v2 addObject:v3];

  [*(id *)(a1 + 32) _processAssertionBacklog];
}

- (void)_didConnectToServer
{
  uint64_t v3 = [(AXServer *)self _actionResultKey];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = [(AXServer *)self server];
    [v5 setHandlerWithTarget:self selector:sel__handleActionResult_ forKey:v4];
  }
}

- (AXIPCClient)client
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = __Block_byref_object_copy__4;
  id v8 = __Block_byref_object_dispose__4;
  id v9 = 0;
  AX_PERFORM_WITH_LOCK();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (AXIPCClient *)v2;
}

void __18__AXServer_client__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 32);
  if (!v2)
  {
    uint64_t v3 = [AXIPCClient alloc];
    uint64_t v4 = [*(id *)(a1 + 32) _serviceName];
    uint64_t v5 = [(AXIPCClient *)v3 initWithServiceName:v4];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "setShouldRegisterCallbackSourceOnMainRunloop:", objc_msgSend(*(id *)(a1 + 32), "shouldRegisterClientCallbackSourceOnMainRunloop"));
    LODWORD(v8) = 1.0;
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setTimeout:v8];
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    id v2 = *(void **)(*(void *)(a1 + 32) + 32);
  }
  id v9 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v9, v2);
}

- (void)setClient:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AX_PERFORM_WITH_LOCK();
}

void __22__AXServer_setClient___block_invoke(uint64_t a1)
{
}

- (BOOL)_connectIfNecessary
{
  id v3 = [(AXServer *)self client];
  if ([v3 isConnected])
  {
    BOOL v4 = 1;
  }
  else
  {
    id v15 = 0;
    [v3 connectWithError:&v15];
    id v5 = v15;
    BOOL v4 = v5 == 0;
    if (v5)
    {
      uint64_t v6 = AXLogSystemApp();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        [(AXServer *)v5 _connectIfNecessary];
      }
    }
    else
    {
      id v7 = [(AXServer *)self serverIdentifier];
      [v3 setClientIdentifier:v7];

      objc_initWeak(&location, self);
      id v8 = objc_initWeak(&from, v3);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __31__AXServer__connectIfNecessary__block_invoke;
      v10[3] = &unk_1E5586AD8;
      objc_copyWeak(&v11, &location);
      objc_copyWeak(&v12, &from);
      [v3 setPortDeathHandler:v10];

      objc_destroyWeak(&v12);
      objc_destroyWeak(&v11);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
    [(AXServer *)self _didConnectToClient];
  }
  return v4;
}

void __31__AXServer__connectIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _wasDisconnectedFromClient];
  [v2 setPortDeathHandler:0];
  [WeakRetained setClient:0];
  [WeakRetained _willClearServer];
  id v3 = [WeakRetained server];
  [v3 stopServerWithError:0];

  [WeakRetained setServer:0];
}

- (BOOL)_connectServerIfNecessary
{
  id v3 = [(AXServer *)self server];
  char v4 = [v3 isRunning];

  if ((v4 & 1) == 0)
  {
    uint64_t v6 = [(AXServer *)self server];

    if (v6)
    {
LABEL_4:
      id v7 = [(AXServer *)self server];
      char v8 = [v7 isRunning];

      if ((v8 & 1) == 0)
      {
        id v9 = [(AXServer *)self server];
        id v21 = 0;
        int v10 = [v9 startServerWithError:&v21];
        id v11 = v21;

        if (!v10 || v11)
        {
          v16 = AXLogIPC();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            [(AXServer *)(uint64_t)v11 _connectServerIfNecessary];
          }
        }
        else
        {
          [(AXServer *)self _didConnectToServer];
        }
      }
      id v13 = [(AXServer *)self server];
      char v5 = [v13 isRunning];
      goto LABEL_22;
    }
    id v12 = [(AXServer *)self client];
    id v13 = v12;
    if (v12)
    {
      uint64_t v14 = [v12 clientCallbackPort];
      if (v14)
      {
        id v15 = -[AXIPCServer initWithPort:serviceRunLoopSource:]([AXIPCServer alloc], "initWithPort:serviceRunLoopSource:", v14, [v13 clientCallbackSource]);
        [(AXServer *)self setServer:v15];

        goto LABEL_4;
      }
      v17 = AXLogIPC();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v18 = "not connecting to server, no client callback port yet";
        v19 = buf;
        goto LABEL_20;
      }
    }
    else
    {
      v17 = AXLogIPC();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        __int16 v23 = 0;
        v18 = "not connecting to server, no client yet";
        v19 = (uint8_t *)&v23;
LABEL_20:
        _os_log_impl(&dword_18D308000, v17, OS_LOG_TYPE_INFO, v18, v19, 2u);
      }
    }

    char v5 = 0;
LABEL_22:

    return v5;
  }
  return 1;
}

- (void)_ensureAssertionsHaveBeenProcessedWithCompletion:(id)a3
{
  id v4 = a3;
  char v5 = [(AXServer *)self assertionWorkQueue];
  dispatch_async(v5, v4);
}

- (void)_registerActionHandler:(id)a3 withIdentifierCallback:(id)a4 retryInterval:(double)a5 registrationMessageKey:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v10 = a3;
  id v11 = a4;
  if ([(AXServer *)self _connectIfNecessary])
  {
    [(AXServer *)self _connectServerIfNecessary];
    id v12 = [MEMORY[0x1E4F29128] UUID];
    id v13 = [v12 UUIDString];

    uint64_t v14 = objc_opt_new();
    [v14 setIdentifier:v13];
    [v14 setHandler:v10];
    id v15 = [[AXIPCMessage alloc] initWithKey:v6 payload:&unk_1EDC633A8];
    v16 = [(AXServer *)self client];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __95__AXServer__registerActionHandler_withIdentifierCallback_retryInterval_registrationMessageKey___block_invoke_2;
    v21[3] = &unk_1E5586B28;
    v21[4] = self;
    id v22 = v14;
    id v23 = v13;
    id v24 = v11;
    id v25 = v10;
    double v26 = a5;
    int v27 = v6;
    id v17 = v11;
    id v18 = v10;
    id v19 = v13;
    id v20 = v14;
    [v16 sendAsyncMessage:v15 withReplyHandler:v21];
  }
  else
  {
    uint64_t v28 = MEMORY[0x1E4F143A8];
    uint64_t v29 = 3221225472;
    v30 = __95__AXServer__registerActionHandler_withIdentifierCallback_retryInterval_registrationMessageKey___block_invoke;
    v31 = &unk_1E5586B00;
    v32 = self;
    id v33 = v10;
    id v34 = v11;
    double v35 = a5;
    int v36 = v6;
    id v20 = v11;
    id v15 = (AXIPCMessage *)v10;
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

uint64_t __95__AXServer__registerActionHandler_withIdentifierCallback_retryInterval_registrationMessageKey___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _registerActionHandler:*(void *)(a1 + 40) withIdentifierCallback:*(void *)(a1 + 48) retryInterval:*(unsigned int *)(a1 + 64) registrationMessageKey:*(double *)(a1 + 56)];
}

void __95__AXServer__registerActionHandler_withIdentifierCallback_retryInterval_registrationMessageKey___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 payload];
  id v4 = [v3 objectForKey:@"result"];
  int v5 = [v4 BOOLValue];

  if (v5)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __95__AXServer__registerActionHandler_withIdentifierCallback_retryInterval_registrationMessageKey___block_invoke_3;
    id v15 = &unk_1E5586470;
    uint64_t v16 = v6;
    id v7 = &v17;
    id v17 = *(id *)(a1 + 40);
    AX_PERFORM_WITH_LOCK();
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v7 = &v8;
    id v8 = *(id *)(a1 + 64);
    id v9 = *(id *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 72);
    int v11 = *(_DWORD *)(a1 + 80);
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

void __95__AXServer__registerActionHandler_withIdentifierCallback_retryInterval_registrationMessageKey___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) actionHandlers];
  [v2 addObject:*(void *)(a1 + 40)];
}

uint64_t __95__AXServer__registerActionHandler_withIdentifierCallback_retryInterval_registrationMessageKey___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _registerActionHandler:*(void *)(a1 + 40) withIdentifierCallback:*(void *)(a1 + 48) retryInterval:*(unsigned int *)(a1 + 64) registrationMessageKey:*(double *)(a1 + 56)];
}

- (void)_removeActionHandler:(id)a3 registrationMessageKey:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if (v6)
  {
    [(AXServer *)self _connectIfNecessary];
    uint64_t v10 = 0;
    int v11 = &v10;
    uint64_t v12 = 0x2020000000;
    char v13 = 0;
    id v9 = v6;
    AX_PERFORM_WITH_LOCK();
    if (!*((unsigned char *)v11 + 24))
    {
      id v7 = [[AXIPCMessage alloc] initWithKey:v4 payload:&unk_1EDC633D0];
      id v8 = [(AXServer *)self client];
      [v8 sendSimpleMessage:v7];
    }
    _Block_object_dispose(&v10, 8);
  }
}

void __56__AXServer__removeActionHandler_registrationMessageKey___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) actionHandlers];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__AXServer__removeActionHandler_registrationMessageKey___block_invoke_2;
  v4[3] = &unk_1E5586B50;
  id v5 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 indexOfObjectPassingTest:v4];
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [v2 removeObjectAtIndex:v3];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 count] != 0;
  }
}

uint64_t __56__AXServer__removeActionHandler_registrationMessageKey___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (int)_actionResultKey
{
  return 0;
}

- (AXIPCServer)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
}

- (void)setServerIdentifier:(id)a3
{
}

- (BOOL)shouldRegisterClientCallbackSourceOnMainRunloop
{
  return self->_shouldRegisterClientCallbackSourceOnMainRunloop;
}

- (void)setShouldRegisterClientCallbackSourceOnMainRunloop:(BOOL)a3
{
  self->_shouldRegisterClientCallbackSourceOnMainRunloop = a3;
}

- (NSMutableArray)assertionWorkBacklog
{
  return self->_assertionWorkBacklog;
}

- (void)setAssertionWorkBacklog:(id)a3
{
}

- (AXDispatchTimer)assertionRetryTimer
{
  return self->_assertionRetryTimer;
}

- (void)setAssertionRetryTimer:(id)a3
{
}

- (OS_dispatch_queue)assertionWorkQueue
{
  return self->_assertionWorkQueue;
}

- (void)setAssertionWorkQueue:(id)a3
{
}

- (NSMutableArray)actionHandlers
{
  return self->_actionHandlers;
}

- (void)setActionHandlers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionHandlers, 0);
  objc_storeStrong((id *)&self->_assertionWorkQueue, 0);
  objc_storeStrong((id *)&self->_assertionRetryTimer, 0);
  objc_storeStrong((id *)&self->_assertionWorkBacklog, 0);
  objc_storeStrong((id *)&self->_serverIdentifier, 0);
  objc_storeStrong((id *)&self->_client, 0);

  objc_storeStrong((id *)&self->_server, 0);
}

- (id)_serviceName
{
  return 0;
}

- (void)sendSimpleMessageWithObjectResult:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a1, "key"));
  uint64_t v4 = objc_msgSend(a2, "ax_nonRedundantDescription");
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2(&dword_18D308000, v5, v6, "couldn't send message (%@): %@", v7, v8, v9, v10, v11);
}

void __69__AXServer_sendAsynchronousMessage_replyOnQueue_objectResultHandler___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v2 = objc_msgSend(a2, "ax_nonRedundantDescription");
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2(&dword_18D308000, v3, v4, "couldn't get async result for message %@: %@", v5, v6, v7, v8, v9);
}

- (void)_connectIfNecessary
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(a1, "ax_nonRedundantDescription");
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_18D308000, a2, OS_LOG_TYPE_DEBUG, "AX SystemApp: Error: %{public}@", (uint8_t *)&v4, 0xCu);
}

- (void)_connectServerIfNecessary
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18D308000, a2, OS_LOG_TYPE_ERROR, "failed to start ipc server due to: %@", (uint8_t *)&v2, 0xCu);
}

@end