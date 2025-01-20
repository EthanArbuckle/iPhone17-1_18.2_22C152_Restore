@interface SYIncomingTransactionSession
- (BOOL)canRestart;
- (BOOL)canRollback;
- (BOOL)isResetSync;
- (BOOL)isSending;
- (BOOL)wasCancelled;
- (SYIncomingTransactionSession)initWithService:(id)a3 transaction:(id)a4 completion:(id)a5;
- (unint64_t)protocolVersion;
- (unsigned)state;
- (void)_sendCancelled;
- (void)_sendChanges;
- (void)_sendComplete;
- (void)cancelWithError:(id)a3;
- (void)didCompleteSession;
- (void)setCanRestart:(BOOL)a3;
- (void)setCanRollback:(BOOL)a3;
- (void)setState:(unsigned int)a3;
- (void)start:(id)a3;
@end

@implementation SYIncomingTransactionSession

- (SYIncomingTransactionSession)initWithService:(id)a3 transaction:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)SYIncomingTransactionSession;
  v11 = [(SYSession *)&v20 initWithService:v8];
  if (v11)
  {
    v12 = [v9 header];
    [v12 timestamp];
    -[SYSession setBirthDate:](v11, "setBirthDate:");

    objc_storeStrong((id *)&v11->_message, a4);
    uint64_t v13 = [v10 copy];
    id completion = v11->_completion;
    v11->_id completion = (id)v13;

    v15 = [v8 serviceActivity];
    os_activity_t v16 = _os_activity_create(&dword_21C7C9000, "SYSession (v1 Delta Sync, Incoming)", v15, OS_ACTIVITY_FLAG_DEFAULT);

    sessionActivity = v11->_sessionActivity;
    v11->_sessionActivity = (OS_os_activity *)v16;

    v18 = v11;
  }

  return v11;
}

- (BOOL)isSending
{
  return 0;
}

- (BOOL)isResetSync
{
  return 0;
}

- (BOOL)wasCancelled
{
  return 0;
}

- (unint64_t)protocolVersion
{
  return 1;
}

- (void)_sendComplete
{
  v3 = [(SYSession *)self queue];
  dispatch_assert_queue_V2(v3);

  v4 = [(SYSession *)self targetQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__SYIncomingTransactionSession__sendComplete__block_invoke;
  block[3] = &unk_264422AB0;
  block[4] = self;
  dispatch_sync(v4, block);

  v5 = [(SYSession *)self service];
  v6 = [(SYSession *)self error];
  [v5 sessionDidEnd:self withError:v6];

  [(SYIncomingTransactionSession *)self didCompleteSession];
}

void __45__SYIncomingTransactionSession__sendComplete__block_invoke(uint64_t a1)
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
  v4 = *(void **)(a1 + 32);
  v5 = [v4 error];
  [v3 syncSession:v4 didEndWithError:v5];
}

- (void)_sendCancelled
{
  v3 = [(SYSession *)self queue];
  dispatch_assert_queue_V2(v3);

  v4 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:-128 userInfo:0];
  v5 = [(SYSession *)self targetQueue];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  id v10 = __46__SYIncomingTransactionSession__sendCancelled__block_invoke;
  v11 = &unk_264422990;
  v12 = self;
  id v13 = v4;
  id v6 = v4;
  dispatch_sync(v5, &v8);

  v7 = [(SYSession *)self service];
  [v7 sessionDidEnd:self withError:v6];

  [(SYIncomingTransactionSession *)self didCompleteSession];
}

void __46__SYIncomingTransactionSession__sendCancelled__block_invoke(uint64_t a1)
{
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  v2 = qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21C7C9000, v2, OS_LOG_TYPE_INFO, "Delegate: -syncSession:didEndWithError:", v4, 2u);
  }
  v3 = [*(id *)(a1 + 32) delegate];
  [v3 syncSession:*(void *)(a1 + 32) didEndWithError:*(void *)(a1 + 40)];
}

- (void)_sendChanges
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v1 = a1;
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  int v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_21C7C9000, v1, OS_LOG_TYPE_ERROR, "Unable to create an _SYLazyChangeArray object for %{public}@", (uint8_t *)&v4, 0xCu);
}

void __44__SYIncomingTransactionSession__sendChanges__block_invoke(uint64_t a1)
{
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  v2 = qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C7C9000, v2, OS_LOG_TYPE_INFO, "Delegate: -syncSession:applyChanges:completion:", buf, 2u);
  }
  v3 = [*(id *)(a1 + 32) delegate];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = MEMORY[0x263EF8330];
  uint64_t v6 = 3221225472;
  v7 = __44__SYIncomingTransactionSession__sendChanges__block_invoke_2;
  uint64_t v8 = &unk_264422968;
  uint64_t v9 = v4;
  objc_msgSend(v3, "syncSession:applyChanges:completion:");
}

void __44__SYIncomingTransactionSession__sendChanges__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(void *)(a1 + 32) + 208), &state);
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  uint64_t v6 = qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEBUG)) {
    __44__SYIncomingTransactionSession__sendChanges__block_invoke_2_cold_1(a2, v6);
  }
  v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__SYIncomingTransactionSession__sendChanges__block_invoke_5;
  block[3] = &unk_264422940;
  uint64_t v8 = *(void *)(a1 + 32);
  char v12 = a2;
  block[4] = v8;
  id v11 = v5;
  id v9 = v5;
  dispatch_async(v7, block);

  os_activity_scope_leave(&state);
}

void __44__SYIncomingTransactionSession__sendChanges__block_invoke_5(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(void *)(a1 + 32) + 208), &v12);
  if (!*(unsigned char *)(a1 + 48))
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v10 = (id)qword_26AB04788;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = _SYObfuscate(*(void **)(a1 + 40));
      *(_DWORD *)buf = 138543362;
      v14 = v11;
      _os_log_impl(&dword_21C7C9000, v10, OS_LOG_TYPE_DEFAULT, "Client failed to process incoming SYChangeMessage, returning error: %{public}@", buf, 0xCu);
    }
    [*(id *)(a1 + 32) setError:*(void *)(a1 + 40)];
    goto LABEL_17;
  }
  if ([*(id *)(a1 + 32) state] != 12)
  {
    uint64_t v9 = 9;
    goto LABEL_18;
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  v2 = (id)qword_26AB04788;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = [*(id *)(a1 + 32) error];
    uint64_t v4 = _SYObfuscate(v3);
    *(_DWORD *)buf = 138543362;
    v14 = v4;
    _os_log_impl(&dword_21C7C9000, v2, OS_LOG_TYPE_DEFAULT, "An error occurred while client was processing: %{public}@", buf, 0xCu);
  }
  id v5 = [*(id *)(a1 + 32) error];
  uint64_t v6 = [v5 domain];
  if (([v6 isEqualToString:@"SYErrorDomain"] & 1) == 0)
  {

    goto LABEL_17;
  }
  v7 = [*(id *)(a1 + 32) error];
  BOOL v8 = [v7 code] == -128;

  if (!v8)
  {
LABEL_17:
    uint64_t v9 = 5;
    goto LABEL_18;
  }
  uint64_t v9 = 3;
LABEL_18:
  [*(id *)(a1 + 32) setState:v9];
  [*(id *)(a1 + 32) _sendComplete];
  os_activity_scope_leave(&v12);
}

- (void)start:(id)a3
{
  id v4 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_sessionActivity, &state);
  [(SYSession *)self didStartSession];
  id v5 = [(SYSession *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__SYIncomingTransactionSession_start___block_invoke;
  v7[3] = &unk_264422E88;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);

  os_activity_scope_leave(&state);
}

void __38__SYIncomingTransactionSession_start___block_invoke(uint64_t a1)
{
  v30[2] = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) didStartSession];
  v2 = *(void **)(a1 + 32);
  if (v2[27] && v2[28])
  {
    v3 = [v2 serializer];
    if (objc_opt_respondsToSelector())
    {
    }
    else
    {
      id v4 = [*(id *)(a1 + 32) serializer];
      char v5 = objc_opt_respondsToSelector();

      if ((v5 & 1) == 0)
      {
        id v15 = objc_alloc(MEMORY[0x263F087E8]);
        v29[0] = @"SYDelegateProtocolName";
        os_activity_t v16 = NSStringFromProtocol((Protocol *)&unk_26CD34ED8);
        v30[0] = v16;
        v29[1] = @"SYDelegateMethodNames";
        v17 = NSStringFromSelector(sel_decodeChangeData_fromProtocolVersion_ofType_);
        v28[0] = v17;
        v18 = NSStringFromSelector(sel_SYObjectWithData_);
        v28[1] = v18;
        v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:2];
        v30[1] = v19;
        objc_super v20 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
        v21 = (void *)[v15 initWithSYError:2020 userInfo:v20];

        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        [*(id *)(a1 + 32) setError:v21];
        [*(id *)(a1 + 32) _sendComplete];

        return;
      }
    }
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v6 = (void *)qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      id v8 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v8);
      id v10 = [*(id *)(a1 + 32) identifier];
      *(_DWORD *)buf = 138543618;
      v25 = v9;
      __int16 v26 = 2114;
      v27 = v10;
      _os_log_impl(&dword_21C7C9000, v7, OS_LOG_TYPE_DEFAULT, "Starting %{public}@ with identifier %{public}@", buf, 0x16u);
    }
    os_activity_t v11 = _os_activity_create(&dword_21C7C9000, "SYSession (v1 Delta Sync, Incoming)", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DETACHED);
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = *(void **)(v12 + 208);
    *(void *)(v12 + 208) = v11;

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    v14 = [*(id *)(a1 + 32) queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __38__SYIncomingTransactionSession_start___block_invoke_71;
    block[3] = &unk_264422AB0;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(v14, block);
  }
  else
  {
    id v22 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:2013 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    [*(id *)(a1 + 32) setError:v22];
    [*(id *)(a1 + 32) _sendComplete];
  }
}

uint64_t __38__SYIncomingTransactionSession_start___block_invoke_71(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendChanges];
}

- (void)cancelWithError:(id)a3
{
  id v4 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_sessionActivity, &state);
  if ([(SYIncomingTransactionSession *)self state] != 11)
  {
    char v5 = [v4 domain];
    if ([v5 isEqualToString:@"SYErrorDomain"])
    {
      uint64_t v6 = [v4 code];

      if (v6 == -128)
      {
        [(SYIncomingTransactionSession *)self setState:3];
        v7 = [(SYSession *)self queue];
        v10[0] = MEMORY[0x263EF8330];
        v10[1] = 3221225472;
        v10[2] = __48__SYIncomingTransactionSession_cancelWithError___block_invoke;
        v10[3] = &unk_264422AB0;
        v10[4] = self;
        id v8 = v10;
LABEL_8:
        dispatch_async(v7, v8);

        goto LABEL_9;
      }
    }
    else
    {
    }
    [(SYSession *)self setError:v4];
    [(SYIncomingTransactionSession *)self setState:5];
    v7 = [(SYSession *)self queue];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __48__SYIncomingTransactionSession_cancelWithError___block_invoke_2;
    v9[3] = &unk_264422AB0;
    v9[4] = self;
    id v8 = v9;
    goto LABEL_8;
  }
  [(SYIncomingTransactionSession *)self setState:12];
  [(SYSession *)self setError:v4];
LABEL_9:
  os_activity_scope_leave(&state);
}

uint64_t __48__SYIncomingTransactionSession_cancelWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendCancelled];
}

uint64_t __48__SYIncomingTransactionSession_cancelWithError___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendComplete];
}

- (void)didCompleteSession
{
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_sessionActivity, &state);
  v5.receiver = self;
  v5.super_class = (Class)SYIncomingTransactionSession;
  [(SYSession *)&v5 didCompleteSession];
  id completion = (void (**)(id, void, void *))self->_completion;
  if (completion)
  {
    id v4 = [(SYSession *)self wrappedUserContext];
    completion[2](completion, 0, v4);
  }
  os_activity_scope_leave(&state);
}

- (unsigned)state
{
  return self->state;
}

- (void)setState:(unsigned int)a3
{
  self->os_activity_scope_state_s state = a3;
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

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_sessionActivity, 0);
}

void __44__SYIncomingTransactionSession__sendChanges__block_invoke_2_cold_1(char a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2 = "NO";
  if (a1) {
    v2 = "YES";
  }
  int v3 = 136315138;
  id v4 = v2;
  _os_log_debug_impl(&dword_21C7C9000, a2, OS_LOG_TYPE_DEBUG, "Delegate callout complete: -syncSession:applyChanges:completion:, v1 transaction, success = %s", (uint8_t *)&v3, 0xCu);
}

@end