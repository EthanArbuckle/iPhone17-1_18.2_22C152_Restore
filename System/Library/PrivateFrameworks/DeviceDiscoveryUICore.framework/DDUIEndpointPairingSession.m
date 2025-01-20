@interface DDUIEndpointPairingSession
- (BOOL)_handleIncomingMessage:(id)a3;
- (BOOL)activated;
- (DDUIDevice)remoteDevice;
- (DDUIEndpointPairingSession)initWithTransportSession:(id)a3 mode:(unint64_t)a4;
- (DDUIEndpointPairingTransportSession)transportSession;
- (NSDictionary)incomingMessage;
- (NSDictionary)startUserInfo;
- (NSUUID)sessionID;
- (OS_dispatch_group)activateGroup;
- (id)completionHandler;
- (id)errorHandler;
- (id)processInitialMessage:(id)a3;
- (unint64_t)mode;
- (unint64_t)sessionType;
- (unint64_t)state;
- (void)_activateWithErrorHandler:(id)a3 completionHandler:(id)a4;
- (void)_clearBlocks;
- (void)_failPairing;
- (void)_pairWithInfo:(id)a3;
- (void)_sendPairingWithInfo:(id)a3;
- (void)activateWithErrorHandler:(id)a3 completionHandler:(id)a4;
- (void)cancelWithMessage:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)pairWithMessage:(id)a3;
- (void)pairWithMessage:(id)a3 errorHandler:(id)a4 completionHandler:(id)a5;
- (void)setActivateGroup:(id)a3;
- (void)setActivated:(BOOL)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setIncomingMessage:(id)a3;
- (void)setMode:(unint64_t)a3;
- (void)setSessionID:(id)a3;
- (void)setSessionType:(unint64_t)a3;
- (void)setStartUserInfo:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setTransportSession:(id)a3;
@end

@implementation DDUIEndpointPairingSession

- (DDUIEndpointPairingSession)initWithTransportSession:(id)a3 mode:(unint64_t)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v21.receiver = self;
  v21.super_class = (Class)DDUIEndpointPairingSession;
  v8 = [(DDUIEndpointPairingSession *)&v21 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_transportSession, a3);
    v9->_mode = a4;
    v9->_state = 0;
    v10 = [v7 sessionID];
    if (v10)
    {
      id v11 = objc_alloc(MEMORY[0x1E4F29128]);
      v12 = [v7 sessionID];
      uint64_t v13 = [v11 initWithUUIDString:v12];
      sessionID = v9->_sessionID;
      v9->_sessionID = (NSUUID *)v13;
    }
    else
    {
      uint64_t v15 = [MEMORY[0x1E4F29128] UUID];
      v12 = v9->_sessionID;
      v9->_sessionID = (NSUUID *)v15;
    }

    dispatch_group_t v16 = dispatch_group_create();
    activateGroup = v9->_activateGroup;
    v9->_activateGroup = (OS_dispatch_group *)v16;

    dispatch_group_enter((dispatch_group_t)v9->_activateGroup);
    v18 = _DDUICoreLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = [v7 remoteDevice];
      *(_DWORD *)buf = 134218754;
      v23 = v9;
      __int16 v24 = 2112;
      id v25 = v7;
      __int16 v26 = 2048;
      unint64_t v27 = a4;
      __int16 v28 = 2112;
      v29 = v19;
      _os_log_impl(&dword_1CFC71000, v18, OS_LOG_TYPE_DEFAULT, "-[DDUIEndpointPairingSession init] {self: %p, transportSession: %@, mode: %lu, remoteDevice: %@}", buf, 0x2Au);
    }
  }

  return v9;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = _DDUICoreLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t mode = self->_mode;
    unint64_t state = self->_state;
    *(_DWORD *)buf = 134218496;
    v9 = self;
    __int16 v10 = 2048;
    unint64_t v11 = state;
    __int16 v12 = 2048;
    unint64_t v13 = mode;
    _os_log_impl(&dword_1CFC71000, v3, OS_LOG_TYPE_DEFAULT, "-[DDUIEndpointPairingSession dealloc] {self: %p, state: %lu, mode: %lu}", buf, 0x20u);
  }

  unint64_t v6 = self->_state;
  if (v6 == 2 || !v6 && self->_mode == 1) {
    [(DDUIEndpointPairingSession *)self _failPairing];
  }
  if (!self->_activated) {
    dispatch_group_leave((dispatch_group_t)self->_activateGroup);
  }
  v7.receiver = self;
  v7.super_class = (Class)DDUIEndpointPairingSession;
  [(DDUIEndpointPairingSession *)&v7 dealloc];
}

- (DDUIDevice)remoteDevice
{
  return (DDUIDevice *)[(DDUIEndpointPairingTransportSession *)self->_transportSession remoteDevice];
}

- (void)cancelWithMessage:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v4 = [a3 dictionaryRepresentation];
  v5 = _DDUICoreLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t mode = self->_mode;
    unint64_t state = self->_state;
    *(_DWORD *)buf = 134218754;
    dispatch_group_t v16 = self;
    __int16 v17 = 2048;
    unint64_t v18 = state;
    __int16 v19 = 2048;
    unint64_t v20 = mode;
    __int16 v21 = 2112;
    v22 = v4;
    _os_log_impl(&dword_1CFC71000, v5, OS_LOG_TYPE_DEFAULT, "-[DDUIEndpointPairingSession cancelWithMessage:] {self: %p, state: %lu, mode: %lu, info: %@}", buf, 0x2Au);
  }

  unint64_t v8 = self->_state;
  if (v8 == 2 || !v8 && self->_mode == 1)
  {
    self->_unint64_t state = 5;
    unint64_t v13 = @"type";
    uint64_t v14 = &unk_1F2651540;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    __int16 v10 = (void *)[v9 mutableCopy];

    if (v4) {
      [v10 setObject:v4 forKeyedSubscript:@"usi"];
    }
    transportSession = self->_transportSession;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __48__DDUIEndpointPairingSession_cancelWithMessage___block_invoke;
    v12[3] = &unk_1E685FDA8;
    v12[4] = self;
    [(DDUIEndpointPairingTransportSession *)transportSession sendMessage:v10 withCompletion:v12];
  }
}

void __48__DDUIEndpointPairingSession_cancelWithMessage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = _DDUICoreLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 134218242;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1CFC71000, v4, OS_LOG_TYPE_DEFAULT, "DDUIEndpointPairingSession cancel finished sending {self: %p, error: %@}", (uint8_t *)&v6, 0x16u);
  }
}

- (void)invalidate
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = _DDUICoreLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t mode = self->_mode;
    unint64_t state = self->_state;
    int v10 = 134218496;
    unint64_t v11 = self;
    __int16 v12 = 2048;
    unint64_t v13 = state;
    __int16 v14 = 2048;
    unint64_t v15 = mode;
    _os_log_impl(&dword_1CFC71000, v3, OS_LOG_TYPE_DEFAULT, "-[DDUIEndpointPairingSession invalidate] {self: %p, state: %lu, mode: %lu}", (uint8_t *)&v10, 0x20u);
  }

  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;

  id errorHandler = self->_errorHandler;
  self->_id errorHandler = 0;

  unint64_t v8 = self->_state;
  if (v8 == 2 || !v8 && self->_mode == 1)
  {
    self->_unint64_t state = 5;
    [(DDUIEndpointPairingSession *)self _failPairing];
  }
  else
  {
    [(DDUIEndpointPairingTransportSession *)self->_transportSession invalidate];
    transportSession = self->_transportSession;
    self->_transportSession = 0;
  }
}

- (void)pairWithMessage:(id)a3 errorHandler:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  [(DDUIEndpointPairingSession *)self _activateWithErrorHandler:a4 completionHandler:a5];
  id v9 = [v8 dictionaryRepresentation];

  [(DDUIEndpointPairingSession *)self _pairWithInfo:v9];
}

- (void)pairWithMessage:(id)a3
{
  id v4 = [a3 dictionaryRepresentation];
  [(DDUIEndpointPairingSession *)self _pairWithInfo:v4];
}

- (void)_sendPairingWithInfo:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(DDUIEndpointPairingSession *)self mode];
  if (v5 == 1)
  {
    __int16 v14 = @"type";
    unint64_t v15 = &unk_1F2651570;
    unint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    uint64_t v7 = (void *)[v11 mutableCopy];

    if (v4) {
      [v7 setObject:v4 forKeyedSubscript:@"usi"];
    }
    [(DDUIEndpointPairingSession *)self setState:3];
    id v8 = [(DDUIEndpointPairingSession *)self transportSession];
    id v9 = v8;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __51__DDUIEndpointPairingSession__sendPairingWithInfo___block_invoke_22;
    v12[3] = &unk_1E685FDA8;
    v12[4] = self;
    int v10 = v12;
    goto LABEL_9;
  }
  if (!v5)
  {
    [(DDUIEndpointPairingSession *)self setState:2];
    uint64_t v16 = @"type";
    v17[0] = &unk_1F2651558;
    int v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    uint64_t v7 = (void *)[v6 mutableCopy];

    if (v4) {
      [v7 setObject:v4 forKeyedSubscript:@"usi"];
    }
    id v8 = [(DDUIEndpointPairingSession *)self transportSession];
    id v9 = v8;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __51__DDUIEndpointPairingSession__sendPairingWithInfo___block_invoke;
    v13[3] = &unk_1E685FDA8;
    v13[4] = self;
    int v10 = v13;
LABEL_9:
    [v8 sendMessage:v7 withCompletion:v10];
  }
}

void __51__DDUIEndpointPairingSession__sendPairingWithInfo___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _DDUICoreLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 134218242;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1CFC71000, v4, OS_LOG_TYPE_DEFAULT, "DDUIEndpointPairingSession start message finished sending {self: %p, error: %@}", (uint8_t *)&v6, 0x16u);
  }
}

void __51__DDUIEndpointPairingSession__sendPairingWithInfo___block_invoke_22(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _DDUICoreLog();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __51__DDUIEndpointPairingSession__sendPairingWithInfo___block_invoke_22_cold_1(a1, (uint64_t)v3, v5);
    }

    int v6 = [*(id *)(a1 + 32) errorHandler];

    if (v6)
    {
      uint64_t v7 = [*(id *)(a1 + 32) errorHandler];
      ((void (**)(void, id))v7)[2](v7, v3);
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v8 = *(void **)(a1 + 32);
      id v9 = [v8 startUserInfo];
      int v14 = 134218498;
      unint64_t v15 = v8;
      __int16 v16 = 2112;
      uint64_t v17 = 0;
      __int16 v18 = 2112;
      __int16 v19 = v9;
      _os_log_impl(&dword_1CFC71000, v5, OS_LOG_TYPE_DEFAULT, "DDUIEndpointPairingSession accept message finished sending {self: %p, error: %@, startUserInfo: %@}", (uint8_t *)&v14, 0x20u);
    }
    uint64_t v10 = [*(id *)(a1 + 32) completionHandler];

    if (v10)
    {
      unint64_t v11 = [DDUIPairCompleteMessage alloc];
      __int16 v12 = [(DDUIPairCompleteMessage *)v11 initWithDictionaryRepresentation:MEMORY[0x1E4F1CC08]];
      unint64_t v13 = [*(id *)(a1 + 32) completionHandler];
      ((void (**)(void, void, void, DDUIPairCompleteMessage *))v13)[2](v13, 0, 0, v12);
    }
    [*(id *)(a1 + 32) _clearBlocks];
  }
}

- (void)activateWithErrorHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__DDUIEndpointPairingSession_activateWithErrorHandler_completionHandler___block_invoke;
  v8[3] = &unk_1E685FDD0;
  id v9 = v6;
  id v7 = v6;
  [(DDUIEndpointPairingSession *)self _activateWithErrorHandler:a3 completionHandler:v8];
}

uint64_t __73__DDUIEndpointPairingSession_activateWithErrorHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_activateWithErrorHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_state)
  {
    id location = 0;
    objc_initWeak(&location, self);
    self->_unint64_t state = 1;
    transportSession = self->_transportSession;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __74__DDUIEndpointPairingSession__activateWithErrorHandler_completionHandler___block_invoke;
    v16[3] = &unk_1E685FDF8;
    objc_copyWeak(&v18, &location);
    id v9 = v6;
    id v17 = v9;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __74__DDUIEndpointPairingSession__activateWithErrorHandler_completionHandler___block_invoke_25;
    v14[3] = &unk_1E685FE20;
    objc_copyWeak(&v15, &location);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __74__DDUIEndpointPairingSession__activateWithErrorHandler_completionHandler___block_invoke_2;
    v10[3] = &unk_1E685FE48;
    objc_copyWeak(&v13, &location);
    id v11 = v7;
    id v12 = v9;
    [(DDUIEndpointPairingTransportSession *)transportSession activateWithErrorHandler:v16 messageHandler:v14 completion:v10];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
}

void __74__DDUIEndpointPairingSession__activateWithErrorHandler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v5 = _DDUICoreLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __74__DDUIEndpointPairingSession__activateWithErrorHandler_completionHandler___block_invoke_cold_1((uint64_t)WeakRetained, (uint64_t)v3, v5);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __74__DDUIEndpointPairingSession__activateWithErrorHandler_completionHandler___block_invoke_25(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _handleIncomingMessage:v5];
  }
}

void __74__DDUIEndpointPairingSession__activateWithErrorHandler_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v5 = _DDUICoreLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134218498;
      id v8 = WeakRetained;
      __int16 v9 = 2048;
      uint64_t v10 = [WeakRetained mode];
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_impl(&dword_1CFC71000, v5, OS_LOG_TYPE_DEFAULT, "DDUIEndpointPairingSession activated {self: %p,  mode: %lu, inSession: %@}", (uint8_t *)&v7, 0x20u);
    }

    [WeakRetained setCompletionHandler:*(void *)(a1 + 32)];
    [WeakRetained setErrorHandler:*(void *)(a1 + 40)];
    [WeakRetained setState:2];
    id v6 = [WeakRetained activateGroup];
    dispatch_group_leave(v6);

    [WeakRetained setActivated:1];
  }
}

- (void)_pairWithInfo:(id)a3
{
  id v4 = a3;
  id location = 0;
  objc_initWeak(&location, self);
  id v5 = [(DDUIEndpointPairingSession *)self activateGroup];
  id v6 = DDUICorePrimaryQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__DDUIEndpointPairingSession__pairWithInfo___block_invoke;
  block[3] = &unk_1E685FE70;
  objc_copyWeak(&v10, &location);
  id v9 = v4;
  id v7 = v4;
  dispatch_group_notify(v5, v6, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __44__DDUIEndpointPairingSession__pairWithInfo___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _sendPairingWithInfo:*(void *)(a1 + 32)];
}

- (id)processInitialMessage:(id)a3
{
  id v4 = a3;
  if ([(DDUIEndpointPairingSession *)self _handleIncomingMessage:v4])
  {
    id v5 = [DDUIPairInitiateMessage alloc];
    id v6 = [v4 objectForKeyedSubscript:@"usi"];
    id v7 = [(DDUIPairInitiateMessage *)v5 initWithDictionaryRepresentation:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)_handleIncomingMessage:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"type"];
  uint64_t v6 = [v5 unsignedIntegerValue];

  unint64_t v7 = v6 - 1;
  id v8 = _DDUICoreLog();
  id v9 = v8;
  if ((unint64_t)(v6 - 1) >= 4)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      [(DDUIEndpointPairingSession *)(uint64_t)self _handleIncomingMessage:v9];
    }
    goto LABEL_19;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t state = self->_state;
    if (state > 5) {
      __int16 v11 = @"invalid";
    }
    else {
      __int16 v11 = off_1E685FEB8[state];
    }
    unint64_t mode = self->_mode;
    uint64_t v13 = off_1E685FEE8[v7];
    *(_DWORD *)buf = 134219010;
    v31 = self;
    __int16 v32 = 2112;
    v33 = v11;
    __int16 v34 = 2048;
    unint64_t v35 = mode;
    __int16 v36 = 2112;
    v37 = v13;
    __int16 v38 = 2112;
    id v39 = v4;
    _os_log_impl(&dword_1CFC71000, v9, OS_LOG_TYPE_DEFAULT, "-[DDUIEndpointPairingSession _handleIncomingMessage] {self: %p, state: %@, mode: %lu, messageType: %@, message: %@}", buf, 0x34u);
  }

  if (self->_state == 2)
  {
    switch(v6)
    {
      case 4:
        self->_unint64_t state = 5;
        (*((void (**)(void))self->_errorHandler + 2))();
        break;
      case 3:
        self->_unint64_t state = 5;
        id completionHandler = (void (**)(id, uint64_t, void, void *))self->_completionHandler;
        __int16 v19 = [DDUIPairCompleteMessage alloc];
        __int16 v16 = [v4 objectForKeyedSubscript:@"usi"];
        id v17 = [(DDUIPairCompleteMessage *)v19 initWithDictionaryRepresentation:v16];
        completionHandler[2](completionHandler, 1, 0, v17);
LABEL_17:

        [(DDUIEndpointPairingSession *)self _clearBlocks];
        break;
      case 2:
        self->_unint64_t state = 4;
        if (self->_mode != 1)
        {
          __int16 v21 = [DDUIPairCompleteMessage alloc];
          v22 = [v4 objectForKeyedSubscript:@"usi"];
          id v9 = [(DDUIPairCompleteMessage *)v21 initWithDictionaryRepresentation:v22];

          uint64_t v23 = [v9 listenerUUID];

          if (v23)
          {
            transportSession = self->_transportSession;
            id v25 = [v9 listenerUUID];
            v28[0] = MEMORY[0x1E4F143A8];
            v28[1] = 3221225472;
            v28[2] = __53__DDUIEndpointPairingSession__handleIncomingMessage___block_invoke;
            v28[3] = &unk_1E685FE98;
            v28[4] = self;
            id v9 = v9;
            v29 = v9;
            [(DDUIEndpointPairingTransportSession *)transportSession generateNetworkEndpointIdentifierForRemoteDevice:v25 withCompletion:v28];
          }
          else
          {
            __int16 v26 = _DDUICoreLog();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134217984;
              v31 = self;
              _os_log_impl(&dword_1CFC71000, v26, OS_LOG_TYPE_DEFAULT, "No listener returned from remote device, skipping generating mapping {self: %p}", buf, 0xCu);
            }

            unint64_t v27 = [(DDUIEndpointPairingSession *)self completionHandler];
            ((void (**)(void, void, void, NSObject *))v27)[2](v27, 0, 0, v9);

            [(DDUIEndpointPairingSession *)self _clearBlocks];
          }
          goto LABEL_19;
        }
        id v14 = self->_completionHandler;
        id v15 = [DDUIPairCompleteMessage alloc];
        __int16 v16 = [v4 objectForKeyedSubscript:@"usi"];
        id v17 = [(DDUIPairCompleteMessage *)v15 initWithDictionaryRepresentation:v16];
        (*((void (**)(id, void, void, DDUIPairCompleteMessage *))v14 + 2))(v14, 0, 0, v17);
        goto LABEL_17;
    }
    id v9 = self->_completionHandler;
    self->_id completionHandler = 0;
LABEL_19:
  }
  return v7 < 4;
}

void __53__DDUIEndpointPairingSession__handleIncomingMessage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _DDUICoreLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 134218242;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_1CFC71000, v4, OS_LOG_TYPE_DEFAULT, "-[DDUIEndpointPairingSession _handleIncomingMessage].block generated mapping {self: %p, identifier: %@}", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v6 = [*(id *)(a1 + 32) completionHandler];
  ((void (**)(void, void, id, void))v6)[2](v6, 0, v3, *(void *)(a1 + 40));

  [*(id *)(a1 + 32) _clearBlocks];
}

- (void)_failPairing
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = _DDUICoreLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t mode = self->_mode;
    unint64_t state = self->_state;
    *(_DWORD *)buf = 134218496;
    id v14 = self;
    __int16 v15 = 2048;
    unint64_t v16 = state;
    __int16 v17 = 2048;
    unint64_t v18 = mode;
    _os_log_impl(&dword_1CFC71000, v3, OS_LOG_TYPE_DEFAULT, "-[DDUIEndpointPairingSession _failPairing] {self: %p, state: %lu, mode: %lu}", buf, 0x20u);
  }

  uint64_t v11 = @"type";
  id v12 = &unk_1F2651588;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  int v7 = self->_transportSession;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__DDUIEndpointPairingSession__failPairing__block_invoke;
  v9[3] = &unk_1E685FB50;
  v9[4] = self;
  id v10 = v7;
  uint64_t v8 = v7;
  [(DDUIEndpointPairingTransportSession *)v8 sendMessage:v6 withTimeout:v9 completion:1.0];
}

void __42__DDUIEndpointPairingSession__failPairing__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _DDUICoreLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 134218242;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1CFC71000, v4, OS_LOG_TYPE_DEFAULT, "DDUIEndpointPairingSession pairing failure finished sending {self: %p, error: %@}", (uint8_t *)&v6, 0x16u);
  }

  [*(id *)(a1 + 40) invalidate];
}

- (void)_clearBlocks
{
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;

  id errorHandler = self->_errorHandler;
  self->_id errorHandler = 0;
}

- (unint64_t)sessionType
{
  return self->sessionType;
}

- (void)setSessionType:(unint64_t)a3
{
  self->sessionType = a3;
}

- (NSDictionary)incomingMessage
{
  return self->incomingMessage;
}

- (void)setIncomingMessage:(id)a3
{
}

- (DDUIEndpointPairingTransportSession)transportSession
{
  return self->_transportSession;
}

- (void)setTransportSession:(id)a3
{
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_unint64_t mode = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_unint64_t state = a3;
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (NSDictionary)startUserInfo
{
  return self->_startUserInfo;
}

- (void)setStartUserInfo:(id)a3
{
}

- (OS_dispatch_group)activateGroup
{
  return self->_activateGroup;
}

- (void)setActivateGroup:(id)a3
{
}

- (NSUUID)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (BOOL)activated
{
  return self->_activated;
}

- (void)setActivated:(BOOL)a3
{
  self->_activated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_activateGroup, 0);
  objc_storeStrong((id *)&self->_startUserInfo, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_transportSession, 0);
  objc_storeStrong((id *)&self->incomingMessage, 0);
}

void __51__DDUIEndpointPairingSession__sendPairingWithInfo___block_invoke_22_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 134218242;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1(&dword_1CFC71000, a2, a3, "DDUIEndpointPairingSession accept message failed to send {self: %p, error: %@}", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

void __74__DDUIEndpointPairingSession__activateWithErrorHandler_completionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 134218242;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1(&dword_1CFC71000, a2, a3, "DDUIEndpointPairingSession failed to activate {self: %p, error: %@}", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

- (void)_handleIncomingMessage:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = *(void *)(a1 + 48);
  id v4 = @"invalid";
  if (v3 <= 5) {
    id v4 = off_1E685FEB8[v3];
  }
  uint64_t v5 = *(void *)(a1 + 40);
  int v6 = 134219010;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  id v9 = v4;
  __int16 v10 = 2048;
  uint64_t v11 = v5;
  __int16 v12 = 2112;
  uint64_t v13 = @"invalid";
  __int16 v14 = 2112;
  uint64_t v15 = a2;
  _os_log_error_impl(&dword_1CFC71000, log, OS_LOG_TYPE_ERROR, "-[DDUIEndpointPairingSession _handleIncomingMessage] -- invalid message type! {self: %p, state: %@, mode: %lu, messageType: %@, message: %@}", (uint8_t *)&v6, 0x34u);
}

@end