@interface SYIncomingFullSyncSession
- (BOOL)canRestart;
- (BOOL)canRollback;
- (BOOL)isResetSync;
- (BOOL)isSending;
- (OS_os_activity)sessionActivity;
- (SYIncomingFullSyncSession)initWithService:(id)a3;
- (unint64_t)protocolVersion;
- (unsigned)state;
- (void)_cancelSession;
- (void)_continueProcessing;
- (void)_handleBatchChunk:(id)a3 completion:(id)a4;
- (void)_handleEndSync:(id)a3 completion:(id)a4;
- (void)_installStateListener;
- (void)_notifyErrorAndShutdown;
- (void)_processNextState;
- (void)_sendEndSessionResponse:(id)a3;
- (void)_sessionComplete;
- (void)_sessionEnded;
- (void)_setStateQuietly:(unsigned int)a3;
- (void)cancelWithError:(id)a3;
- (void)setCanRestart:(BOOL)a3;
- (void)setCanRollback:(BOOL)a3;
- (void)setState:(unsigned int)a3;
- (void)start:(id)a3;
@end

@implementation SYIncomingFullSyncSession

- (SYIncomingFullSyncSession)initWithService:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SYIncomingFullSyncSession;
  v5 = [(SYSession *)&v12 initWithService:v4];
  v6 = v5;
  if (v5)
  {
    v5->_state = 0;
    v7 = [v4 serviceActivity];
    os_activity_t v8 = _os_activity_create(&dword_21C7C9000, "SYSession (v1 Full Sync, Incoming)", v7, OS_ACTIVITY_FLAG_DEFAULT);

    sessionActivity = v6->_sessionActivity;
    v6->_sessionActivity = (OS_os_activity *)v8;

    [(SYIncomingFullSyncSession *)v6 _installStateListener];
    v10 = v6;
  }

  return v6;
}

- (unsigned)state
{
  return self->_state;
}

- (void)setState:(unsigned int)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = self;
  objc_sync_enter(v4);
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  v5 = (id)qword_26AB04788;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v8 = 138543618;
    v9 = v7;
    __int16 v10 = 1024;
    unsigned int v11 = a3;
    _os_log_impl(&dword_21C7C9000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Setting state to %{companionsync:SYSessionState}d", (uint8_t *)&v8, 0x12u);
  }
  v4->_state = a3;
  dispatch_source_merge_data((dispatch_source_t)v4->_stateUpdateSource, 1uLL);
  objc_sync_exit(v4);
}

- (void)_setStateQuietly:(unsigned int)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = self;
  objc_sync_enter(v4);
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  v5 = (id)qword_26AB04788;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v8 = 138543618;
    v9 = v7;
    __int16 v10 = 1024;
    unsigned int v11 = a3;
    _os_log_impl(&dword_21C7C9000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Setting state (quietly) to %{companionsync:SYSessionState}d", (uint8_t *)&v8, 0x12u);
  }
  v4->_state = a3;
  objc_sync_exit(v4);
}

- (BOOL)isResetSync
{
  return 1;
}

- (BOOL)isSending
{
  return 0;
}

- (unint64_t)protocolVersion
{
  return 1;
}

- (void)_sessionEnded
{
  v3 = [(SYSession *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(SYSession *)self targetQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__SYIncomingFullSyncSession__sessionEnded__block_invoke;
  block[3] = &unk_264422AB0;
  block[4] = self;
  dispatch_sync(v4, block);

  v5 = [(SYSession *)self service];
  v6 = [(SYSession *)self error];
  [v5 sessionDidEnd:self withError:v6];

  [(SYSession *)self didCompleteSession];
}

void __42__SYIncomingFullSyncSession__sessionEnded__block_invoke(uint64_t a1)
{
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  v2 = qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21C7C9000, v2, OS_LOG_TYPE_INFO, "Delegate: -syncSession:didEndWithError:", v6, 2u);
  }
  v3 = [*(id *)(a1 + 32) delegate];
  id v4 = *(void **)(a1 + 32);
  v5 = [v4 error];
  [v3 syncSession:v4 didEndWithError:v5];
}

- (void)_cancelSession
{
  id v9 = (id)objc_opt_new();
  v3 = [(SYSession *)self service];
  id v4 = (void *)[v3 _newMessageHeader];
  [v9 setHeader:v4];

  v5 = [(SYSession *)self identifier];
  [v9 setSyncID:v5];

  v6 = [SYErrorInfo alloc];
  v7 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:-128 userInfo:0];
  int v8 = [(SYErrorInfo *)v6 initWithError:v7];
  [v9 setError:v8];

  [v9 setErrorResolution:0];
  [(SYIncomingFullSyncSession *)self _sendEndSessionResponse:v9];
  [(SYIncomingFullSyncSession *)self _sessionEnded];
}

- (void)_notifyErrorAndShutdown
{
  id v9 = (id)objc_opt_new();
  v3 = [(SYSession *)self service];
  id v4 = (void *)[v3 _newMessageHeader];
  [v9 setHeader:v4];

  v5 = [(SYSession *)self identifier];
  [v9 setSyncID:v5];

  v6 = [SYErrorInfo alloc];
  v7 = [(SYSession *)self error];
  int v8 = [(SYErrorInfo *)v6 initWithError:v7];
  [v9 setError:v8];

  [v9 setErrorResolution:1];
  [(SYIncomingFullSyncSession *)self _sendEndSessionResponse:v9];
  [(SYIncomingFullSyncSession *)self _sessionEnded];
}

- (void)_sessionComplete
{
  id v6 = (id)objc_opt_new();
  v3 = [(SYSession *)self service];
  id v4 = (void *)[v3 _newMessageHeader];
  [v6 setHeader:v4];

  v5 = [(SYSession *)self identifier];
  [v6 setSyncID:v5];

  [(SYIncomingFullSyncSession *)self _sendEndSessionResponse:v6];
  [(SYIncomingFullSyncSession *)self _sessionEnded];
}

- (void)_processNextState
{
  v3 = [(SYSession *)self queue];
  dispatch_assert_queue_V2(v3);

  v4.opaque[0] = 0;
  v4.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_sessionActivity, &v4);
  switch([(SYIncomingFullSyncSession *)self state])
  {
    case 1u:
      [(SYIncomingFullSyncSession *)self _continueProcessing];
      break;
    case 3u:
      [(SYIncomingFullSyncSession *)self _cancelSession];
      break;
    case 5u:
      [(SYIncomingFullSyncSession *)self _notifyErrorAndShutdown];
      break;
    case 9u:
      [(SYIncomingFullSyncSession *)self _sessionComplete];
      break;
    default:
      break;
  }
  os_activity_scope_leave(&v4);
}

- (void)_installStateListener
{
  v3 = [(SYSession *)self queue];
  os_activity_scope_state_s v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF83B8], 0, 0, v3);
  stateUpdateSource = self->_stateUpdateSource;
  self->_stateUpdateSource = v4;

  objc_initWeak(&location, self);
  id v6 = self->_stateUpdateSource;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__SYIncomingFullSyncSession__installStateListener__block_invoke;
  v7[3] = &unk_264422C90;
  objc_copyWeak(&v8, &location);
  dispatch_source_set_event_handler(v6, v7);
  dispatch_resume((dispatch_object_t)self->_stateUpdateSource);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __50__SYIncomingFullSyncSession__installStateListener__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _processNextState];
    id WeakRetained = v2;
  }
}

- (void)start:(id)a3
{
  v43[1] = *MEMORY[0x263EF8340];
  os_activity_scope_state_s v4 = (void (**)(id, void, id))a3;
  v5 = [(SYSession *)self delegate];

  if (v5)
  {
    id v6 = [(SYSession *)self serializer];
    if (objc_opt_respondsToSelector())
    {
    }
    else
    {
      uint64_t v12 = [(SYSession *)self serializer];
      char v13 = objc_opt_respondsToSelector();

      if ((v13 & 1) == 0)
      {
        id v19 = objc_alloc(MEMORY[0x263F087E8]);
        v40[0] = @"SYDelegateProtocolName";
        v20 = NSStringFromProtocol((Protocol *)&unk_26CD34ED8);
        v40[1] = @"SYDelegateMethodNames";
        v41[0] = v20;
        v21 = NSStringFromSelector(sel_decodeChangeData_fromProtocolVersion_ofType_);
        v39[0] = v21;
        v22 = NSStringFromSelector(sel_SYObjectWithData_);
        v39[1] = v22;
        v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:2];
        v41[1] = v23;
        v24 = [NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:2];
        v25 = (void *)[v19 initWithSYError:2020 userInfo:v24];

        v26 = [(SYSession *)self queue];
        v31[0] = MEMORY[0x263EF8330];
        v31[1] = 3221225472;
        v31[2] = __35__SYIncomingFullSyncSession_start___block_invoke_2;
        v31[3] = &unk_264422990;
        v31[4] = self;
        id v32 = v25;
        id v27 = v25;
        dispatch_async(v26, v31);

        v4[2](v4, 0, v27);
        goto LABEL_12;
      }
    }
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter((os_activity_t)self->_sessionActivity, &state);
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    v14 = (id)qword_26AB04788;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      v17 = [(SYSession *)self identifier];
      *(_DWORD *)buf = 138543618;
      id v36 = v16;
      __int16 v37 = 2114;
      v38 = v17;
      _os_log_impl(&dword_21C7C9000, v14, OS_LOG_TYPE_DEFAULT, "Starting %{public}@ with identifier %{public}@", buf, 0x16u);
    }
    [(SYSession *)self didStartSession];
    v18 = [(SYSession *)self queue];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __35__SYIncomingFullSyncSession_start___block_invoke_71;
    v28[3] = &unk_264422E88;
    v28[4] = self;
    v29 = v4;
    dispatch_async(v18, v28);

    os_activity_scope_leave(&state);
  }
  else
  {
    id v7 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v42 = *MEMORY[0x263F08320];
    v43[0] = @"You cannot start an SYSession without a delegate.";
    id v8 = [NSDictionary dictionaryWithObjects:v43 forKeys:&v42 count:1];
    id v9 = (void *)[v7 initWithSYError:2001 userInfo:v8];

    __int16 v10 = [(SYSession *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __35__SYIncomingFullSyncSession_start___block_invoke;
    block[3] = &unk_264422990;
    block[4] = self;
    id v34 = v9;
    id v11 = v9;
    dispatch_async(v10, block);

    v4[2](v4, 0, v11);
  }
LABEL_12:
}

void __35__SYIncomingFullSyncSession_start___block_invoke(uint64_t a1)
{
  v2.opaque[0] = 0;
  v2.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(void *)(a1 + 32) + 208), &v2);
  [*(id *)(a1 + 32) setError:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _notifyErrorAndShutdown];
  os_activity_scope_leave(&v2);
}

void __35__SYIncomingFullSyncSession_start___block_invoke_2(uint64_t a1)
{
  v2.opaque[0] = 0;
  v2.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(void *)(a1 + 32) + 208), &v2);
  [*(id *)(a1 + 32) setError:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _notifyErrorAndShutdown];
  os_activity_scope_leave(&v2);
}

void __35__SYIncomingFullSyncSession_start___block_invoke_71(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  char v13 = __Block_byref_object_copy__10;
  v14 = __Block_byref_object_dispose__10;
  id v15 = 0;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  os_activity_scope_state_s v2 = [*(id *)(a1 + 32) targetQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__SYIncomingFullSyncSession_start___block_invoke_72;
  block[3] = &unk_264423C30;
  block[4] = *(void *)(a1 + 32);
  void block[5] = &v6;
  block[6] = &v10;
  dispatch_sync(v2, block);

  if (*((unsigned char *)v7 + 24))
  {
    [*(id *)(a1 + 32) setState:1];
  }
  else
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    v3 = qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = v11[5];
      *(_DWORD *)buf = 138412290;
      uint64_t v17 = v4;
      _os_log_impl(&dword_21C7C9000, v3, OS_LOG_TYPE_DEFAULT, "Delegate didn't reset its store: %@", buf, 0xCu);
    }
    [*(id *)(a1 + 32) setError:v11[5]];
    [*(id *)(a1 + 32) setState:5];
    [*(id *)(a1 + 32) _handleError:v11[5]];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v10, 8);
}

void __35__SYIncomingFullSyncSession_start___block_invoke_72(uint64_t a1)
{
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  os_activity_scope_state_s v2 = qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C7C9000, v2, OS_LOG_TYPE_INFO, "Delegate: -syncSession:resetDataStoreWithError:", buf, 2u);
  }
  v3 = [*(id *)(a1 + 32) delegate];
  uint64_t v4 = *(void *)(a1 + 32);
  id v8 = 0;
  char v5 = [v3 syncSession:v4 resetDataStoreWithError:&v8];
  id v6 = v8;
  id v7 = v8;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5;

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v6);
  }
}

- (void)cancelWithError:(id)a3
{
  id v4 = a3;
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_sessionActivity, &v8);
  if ([(SYIncomingFullSyncSession *)self state] != 11)
  {
    id v6 = [v4 domain];
    if ([v6 isEqualToString:@"SYErrorDomain"])
    {
      uint64_t v7 = [v4 code];

      if (v7 == -128)
      {
        uint64_t v5 = 3;
        goto LABEL_8;
      }
    }
    else
    {
    }
    [(SYSession *)self setError:v4];
    uint64_t v5 = 5;
    goto LABEL_8;
  }
  [(SYSession *)self setError:v4];
  uint64_t v5 = 12;
LABEL_8:
  [(SYIncomingFullSyncSession *)self setState:v5];
  os_activity_scope_leave(&v8);
}

- (BOOL)canRestart
{
  return self->canRestart;
}

- (void)setCanRestart:(BOOL)a3
{
  self->canRestart = a3;
}

- (BOOL)canRollback
{
  return self->canRollback;
}

- (void)setCanRollback:(BOOL)a3
{
  self->canRollback = a3;
}

- (OS_os_activity)sessionActivity
{
  return self->_sessionActivity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateUpdateSource, 0);
  objc_storeStrong((id *)&self->_sessionActivity, 0);
}

- (void)_continueProcessing
{
  OUTLINED_FUNCTION_1_4();
  objc_opt_class();
  uint64_t v2 = OUTLINED_FUNCTION_0();
  MEMORY[0x270EF2BB8](v2, v3, v4);
}

- (void)_sendEndSessionResponse:(id)a3
{
  OUTLINED_FUNCTION_1_4();
  objc_opt_class();
  uint64_t v3 = OUTLINED_FUNCTION_0();
  MEMORY[0x270EF2BB8](v3, v4, v5);
}

- (void)_handleBatchChunk:(id)a3 completion:(id)a4
{
  OUTLINED_FUNCTION_1_4();
  objc_opt_class();
  uint64_t v4 = OUTLINED_FUNCTION_0();
  MEMORY[0x270EF2BB8](v4, v5, v6);
}

- (void)_handleEndSync:(id)a3 completion:(id)a4
{
  OUTLINED_FUNCTION_1_4();
  objc_opt_class();
  uint64_t v4 = OUTLINED_FUNCTION_0();
  MEMORY[0x270EF2BB8](v4, v5, v6);
}

@end