@interface SYOutgoingSyncAllObjectsSession
- (BOOL)_handleBatchSyncEndResponse:(id)a3 error:(id *)a4;
- (BOOL)canRestart;
- (BOOL)canRollback;
- (BOOL)isResetSync;
- (BOOL)isSending;
- (BOOL)wasCancelled;
- (SYOutgoingSyncAllObjectsSession)initWithService:(id)a3;
- (double)remainingSessionTime;
- (unint64_t)protocolVersion;
- (unsigned)state;
- (void)_fetchChanges;
- (void)_installStateListener;
- (void)_installTimers;
- (void)_processNextState;
- (void)_sendChanges;
- (void)_sessionCompleteWithError:(id)a3;
- (void)_sessionFailed;
- (void)_setStateQuietly:(unsigned int)a3;
- (void)cancelWithError:(id)a3;
- (void)setCanRestart:(BOOL)a3;
- (void)setCanRollback:(BOOL)a3;
- (void)setState:(unsigned int)a3;
- (void)start:(id)a3;
@end

@implementation SYOutgoingSyncAllObjectsSession

- (SYOutgoingSyncAllObjectsSession)initWithService:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SYOutgoingSyncAllObjectsSession;
  v5 = [(SYSession *)&v16 initWithService:v4];
  v6 = v5;
  if (v5)
  {
    v5->_state = 0;
    v7 = [v4 serviceActivity];
    os_activity_t v8 = _os_activity_create(&dword_21C7C9000, "SYSession (v1 Outgoing AllObjects)", v7, OS_ACTIVITY_FLAG_DEFAULT);

    sessionActivity = v6->_sessionActivity;
    v6->_sessionActivity = (OS_os_activity *)v8;

    uint64_t v10 = objc_opt_new();
    changesToSend = v6->_changesToSend;
    v6->_changesToSend = (NSMutableArray *)v10;

    v12 = objc_opt_new();
    v13 = [v12 UUIDString];
    [(SYSession *)v6 setIdentifier:v13];

    v14 = v6;
  }

  return v6;
}

- (unsigned)state
{
  v2 = self;
  objc_sync_enter(v2);
  unsigned int state = v2->_state;
  objc_sync_exit(v2);

  return state;
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
  v4->_unsigned int state = a3;
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
  v4->_unsigned int state = a3;
  objc_sync_exit(v4);
}

- (BOOL)isResetSync
{
  return 1;
}

- (BOOL)isSending
{
  return 1;
}

- (unint64_t)protocolVersion
{
  return 1;
}

- (double)remainingSessionTime
{
  [(SYSession *)self fullSessionTimeout];
  if (v3 == 0.0) {
    return 1.79769313e308;
  }
  double sessionStartTime = self->_sessionStartTime;
  if (sessionStartTime > 0.0) {
    return v3 + sessionStartTime - CFAbsoluteTimeGetCurrent();
  }
  return 60.0;
}

- (void)_fetchChanges
{
  double v3 = [(SYSession *)self queue];
  dispatch_assert_queue_V2(v3);

  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __48__SYOutgoingSyncAllObjectsSession__fetchChanges__block_invoke;
  v22[3] = &unk_2644231B0;
  v22[4] = self;
  id v4 = (void *)MEMORY[0x21D4B17C0](v22);
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__4;
  v20 = __Block_byref_object_dispose__4;
  id v21 = 0;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  int v15 = 1;
  v5 = [(SYSession *)self targetQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__SYOutgoingSyncAllObjectsSession__fetchChanges__block_invoke_67;
  block[3] = &unk_264422D80;
  __int16 v10 = &v12;
  block[4] = self;
  id v6 = v4;
  id v9 = v6;
  unsigned int v11 = &v16;
  dispatch_sync(v5, block);

  uint64_t v7 = *((unsigned int *)v13 + 6);
  if (v7 == 2)
  {
    [(SYOutgoingSyncAllObjectsSession *)self _sendChanges];
  }
  else
  {
    if (v7 == 5)
    {
      [(SYSession *)self setError:v17[5]];
      self->_errorIsLocal = 1;
      uint64_t v7 = *((unsigned int *)v13 + 6);
    }
    [(SYOutgoingSyncAllObjectsSession *)self setState:v7];
  }

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
}

uint64_t __48__SYOutgoingSyncAllObjectsSession__fetchChanges__block_invoke(uint64_t a1, void *a2)
{
  v24[2] = *MEMORY[0x263EF8340];
  id v3 = a2;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(void *)(a1 + 32) + 208), &state);
  id v4 = [*(id *)(a1 + 32) serializer];
  char v5 = objc_opt_respondsToSelector();

  id v6 = *(void **)(a1 + 32);
  if (v5)
  {
    uint64_t v7 = [v6 serializer];
    uint64_t v8 = objc_msgSend(v7, "encodeSYChangeForBackwardCompatibility:protocolVersion:", v3, objc_msgSend(*(id *)(a1 + 32), "protocolVersion"));
  }
  else
  {
    id v9 = [v6 serializer];
    char v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) == 0)
    {
      id v13 = objc_alloc(MEMORY[0x263F087E8]);
      v23[0] = @"SYDelegateProtocolName";
      uint64_t v14 = NSStringFromProtocol((Protocol *)&unk_26CD34ED8);
      v23[1] = @"SYDelegateMethodNames";
      v24[0] = v14;
      int v15 = NSStringFromSelector(sel_encodeSYChangeForBackwardCompatibility_protocolVersion_);
      v22[0] = v15;
      uint64_t v16 = NSStringFromSelector(sel_dataWithSYObject_);
      v22[1] = v16;
      v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
      v24[1] = v17;
      uint64_t v18 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
      v19 = (void *)[v13 initWithSYError:2020 userInfo:v18];
      [*(id *)(a1 + 32) setError:v19];

      [*(id *)(a1 + 32) setState:5];
      unsigned int v11 = 0;
      uint64_t v12 = 0;
      goto LABEL_7;
    }
    uint64_t v7 = [*(id *)(a1 + 32) serializer];
    uint64_t v8 = [v7 dataWithSYObject:v3];
  }
  unsigned int v11 = (void *)v8;

  [*(id *)(*(void *)(a1 + 32) + 248) addObject:v11];
  uint64_t v12 = 1;
LABEL_7:

  os_activity_scope_leave(&state);
  return v12;
}

void __48__SYOutgoingSyncAllObjectsSession__fetchChanges__block_invoke_67(uint64_t a1)
{
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) == 1)
  {
    v2 = 0;
    do
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      id v3 = qword_26AB04788;
      if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21C7C9000, v3, OS_LOG_TYPE_INFO, "Delegate: -syncSession:enqueueChanges:error:", buf, 2u);
      }
      id v4 = [*(id *)(a1 + 32) delegate];
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      id v10 = v2;
      int v7 = [v4 syncSession:v5 enqueueChanges:v6 error:&v10];
      id v8 = v10;
      id v9 = v10;

      *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v7;
      if (v9) {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v8);
      }
      v2 = v9;
    }
    while (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) == 1);
  }
}

- (void)_sendChanges
{
  id v3 = [(SYSession *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = objc_opt_new();
  uint64_t v5 = [(SYSession *)self service];
  uint64_t v6 = (void *)[v5 _newMessageHeader];
  [v4 setHeader:v6];

  int v7 = [(SYSession *)self identifier];
  [v4 setSyncID:v7];

  id v8 = (void *)[(NSMutableArray *)self->_changesToSend copy];
  [v4 setAllObjects:v8];

  [(SYOutgoingSyncAllObjectsSession *)self setState:8];
  id v9 = [v5 syncEngine];
  int64_t v10 = [(SYSession *)self priority];
  unsigned int v11 = [(SYSession *)self combinedEngineOptions:0];
  uint64_t v12 = [(SYSession *)self wrappedUserContext];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __47__SYOutgoingSyncAllObjectsSession__sendChanges__block_invoke;
  v13[3] = &unk_264422E20;
  v13[4] = self;
  [v9 enqueueSyncRequest:v4 withMessageID:2 priority:v10 options:v11 userContext:v12 callback:v13];
}

void __47__SYOutgoingSyncAllObjectsSession__sendChanges__block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(void *)(a1 + 32) + 208), &v11);
  id v9 = *(void **)(a1 + 32);
  if (!a2)
  {
    [v9 setError:v8];
    *(unsigned char *)(*(void *)(a1 + 32) + 220) = 1;
    uint64_t v10 = 5;
    goto LABEL_5;
  }
  if ([v9 state] == 8)
  {
    uint64_t v10 = 7;
LABEL_5:
    [*(id *)(a1 + 32) setState:v10];
  }
  os_activity_scope_leave(&v11);
}

- (void)_sessionFailed
{
  uint64_t v3 = [(SYSession *)self error];
  id v4 = (void *)v3;
  if (self->_cancelled)
  {
    id v6 = (id)v3;
    uint64_t v5 = [objc_alloc(MEMORY[0x263F087E8]) initWithSYError:-128 userInfo:0];

    id v4 = (void *)v5;
  }
  id v7 = v4;
  [(SYOutgoingSyncAllObjectsSession *)self _sessionCompleteWithError:v4];
}

- (void)_sessionCompleteWithError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SYSession *)self queue];
  dispatch_assert_queue_V2(v5);

  sessionTimer = self->_sessionTimer;
  if (sessionTimer)
  {
    dispatch_source_cancel(sessionTimer);
    id v7 = self->_sessionTimer;
    self->_sessionTimer = 0;
  }
  id v8 = [(SYSession *)self targetQueue];
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  id v13 = __61__SYOutgoingSyncAllObjectsSession__sessionCompleteWithError___block_invoke;
  uint64_t v14 = &unk_264422990;
  int v15 = self;
  id v16 = v4;
  id v9 = v4;
  dispatch_sync(v8, &v11);

  uint64_t v10 = [(SYSession *)self service];
  [v10 sessionDidEnd:self withError:v9];

  [(SYSession *)self didCompleteSession];
}

void __61__SYOutgoingSyncAllObjectsSession__sessionCompleteWithError___block_invoke(uint64_t a1)
{
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  v2 = qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21C7C9000, v2, OS_LOG_TYPE_INFO, "Delegate: -syncSession:didEndWithError:", v4, 2u);
  }
  uint64_t v3 = [*(id *)(a1 + 32) delegate];
  [v3 syncSession:*(void *)(a1 + 32) didEndWithError:*(void *)(a1 + 40)];
}

- (void)_processNextState
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(SYSession *)self queue];
  dispatch_assert_queue_V2(v3);

  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_sessionActivity, &v8);
  switch([(SYOutgoingSyncAllObjectsSession *)self state])
  {
    case 1u:
      [(SYOutgoingSyncAllObjectsSession *)self _fetchChanges];
      break;
    case 3u:
      self->_cancelled = 1;
      [(SYOutgoingSyncAllObjectsSession *)self _sessionFailed];
      break;
    case 5u:
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      id v4 = (id)qword_26AB04788;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = (objc_class *)objc_opt_class();
        NSStringFromClass(v5);
        id v6 = (id)objc_claimAutoreleasedReturnValue();
        id v7 = [(SYSession *)self error];
        *(_DWORD *)buf = 138543618;
        id v10 = v6;
        __int16 v11 = 2112;
        uint64_t v12 = v7;
        _os_log_impl(&dword_21C7C9000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ entered error state. Error = %@", buf, 0x16u);
      }
      goto LABEL_9;
    case 9u:
LABEL_9:
      [(SYOutgoingSyncAllObjectsSession *)self _sessionCompleteWithError:0];
      break;
    default:
      break;
  }
  os_activity_scope_leave(&v8);
}

- (void)_installTimers
{
  objc_initWeak(&location, self);
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __49__SYOutgoingSyncAllObjectsSession__installTimers__block_invoke;
  uint64_t v14 = &unk_264422C90;
  objc_copyWeak(&v15, &location);
  uint64_t v3 = (void *)MEMORY[0x21D4B17C0](&v11);
  self->_double sessionStartTime = CFAbsoluteTimeGetCurrent();
  [(SYSession *)self fullSessionTimeout];
  if (v4 != 0.0)
  {
    uint64_t v5 = [(SYSession *)self queue];
    id v6 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v5);
    sessionTimer = self->_sessionTimer;
    self->_sessionTimer = v6;

    dispatch_source_set_event_handler((dispatch_source_t)self->_sessionTimer, v3);
    os_activity_scope_state_s v8 = self->_sessionTimer;
    [(SYSession *)self fullSessionTimeout];
    dispatch_time_t v10 = dispatch_walltime(0, (uint64_t)(v9 * 1000000000.0));
    dispatch_source_set_timer(v8, v10, 0xFFFFFFFFFFFFFFFFLL, 0x37E11D600uLL);
    dispatch_resume((dispatch_object_t)self->_sessionTimer);
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __49__SYOutgoingSyncAllObjectsSession__installTimers__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  WeakRetained = (os_activity_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v7.opaque[0] = 0;
    v7.opaque[1] = 0;
    os_activity_scope_enter(WeakRetained[26], &v7);
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    uint64_t v3 = (id)qword_26AB04788;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      double v4 = (objc_class *)objc_opt_class();
      uint64_t v5 = NSStringFromClass(v4);
      __44__SYOutgoingBatchSyncSession__installTimers__block_invoke_cold_1(v5, buf, v3);
    }

    id v6 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:2007 userInfo:0];
    [(os_activity_t *)v2 setError:v6];

    [(os_activity_t *)v2 setState:5];
    os_activity_scope_leave(&v7);
  }
}

- (void)_installStateListener
{
  uint64_t v3 = [(SYSession *)self queue];
  double v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF83B8], 0, 0, v3);
  stateUpdateSource = self->_stateUpdateSource;
  self->_stateUpdateSource = v4;

  objc_initWeak(&location, self);
  id v6 = self->_stateUpdateSource;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__SYOutgoingSyncAllObjectsSession__installStateListener__block_invoke;
  v7[3] = &unk_264422C90;
  objc_copyWeak(&v8, &location);
  dispatch_source_set_event_handler(v6, v7);
  dispatch_resume((dispatch_object_t)self->_stateUpdateSource);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __56__SYOutgoingSyncAllObjectsSession__installStateListener__block_invoke(uint64_t a1)
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
  v42[1] = *MEMORY[0x263EF8340];
  double v4 = (void (**)(id, void, id))a3;
  uint64_t v5 = [(SYSession *)self delegate];

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
        v39[0] = @"SYDelegateProtocolName";
        v20 = NSStringFromProtocol((Protocol *)&unk_26CD34ED8);
        v39[1] = @"SYDelegateMethodNames";
        v40[0] = v20;
        id v21 = NSStringFromSelector(sel_encodeSYChangeForBackwardCompatibility_protocolVersion_);
        v38[0] = v21;
        v22 = NSStringFromSelector(sel_dataWithSYObject_);
        v38[1] = v22;
        v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:2];
        v40[1] = v23;
        v24 = [NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:2];
        v25 = (void *)[v19 initWithSYError:2020 userInfo:v24];

        v26 = [(SYSession *)self queue];
        v30[0] = MEMORY[0x263EF8330];
        v30[1] = 3221225472;
        v30[2] = __41__SYOutgoingSyncAllObjectsSession_start___block_invoke_2;
        v30[3] = &unk_264422990;
        v30[4] = self;
        id v31 = v25;
        id v27 = v25;
        dispatch_async(v26, v30);

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
    uint64_t v14 = (id)qword_26AB04788;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      v17 = [(SYSession *)self identifier];
      *(_DWORD *)buf = 138543618;
      id v35 = v16;
      __int16 v36 = 2114;
      v37 = v17;
      _os_log_impl(&dword_21C7C9000, v14, OS_LOG_TYPE_DEFAULT, "Starting %{public}@ with identifier %{public}@", buf, 0x16u);
    }
    uint64_t v18 = [(SYSession *)self queue];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __41__SYOutgoingSyncAllObjectsSession_start___block_invoke_74;
    v28[3] = &unk_264422AB0;
    v28[4] = self;
    dispatch_async(v18, v28);

    os_activity_scope_leave(&state);
  }
  else
  {
    id v7 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v41 = *MEMORY[0x263F08320];
    v42[0] = @"You cannot start an SYSession without a delegate.";
    id v8 = [NSDictionary dictionaryWithObjects:v42 forKeys:&v41 count:1];
    uint64_t v9 = (void *)[v7 initWithSYError:2001 userInfo:v8];

    dispatch_time_t v10 = [(SYSession *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __41__SYOutgoingSyncAllObjectsSession_start___block_invoke;
    block[3] = &unk_264422990;
    block[4] = self;
    id v33 = v9;
    id v11 = v9;
    dispatch_async(v10, block);

    v4[2](v4, 0, v11);
  }
LABEL_12:
}

void __41__SYOutgoingSyncAllObjectsSession_start___block_invoke(uint64_t a1)
{
  v2.opaque[0] = 0;
  v2.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(void *)(a1 + 32) + 208), &v2);
  [*(id *)(a1 + 32) setError:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _sessionFailed];
  os_activity_scope_leave(&v2);
}

void __41__SYOutgoingSyncAllObjectsSession_start___block_invoke_2(uint64_t a1)
{
  v2.opaque[0] = 0;
  v2.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(void *)(a1 + 32) + 208), &v2);
  [*(id *)(a1 + 32) setError:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _sessionFailed];
  os_activity_scope_leave(&v2);
}

uint64_t __41__SYOutgoingSyncAllObjectsSession_start___block_invoke_74(uint64_t a1)
{
  os_activity_t v2 = _os_activity_create(&dword_21C7C9000, "SYSession (Outgoing)", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DETACHED);
  uint64_t v3 = *(void *)(a1 + 32);
  double v4 = *(void **)(v3 + 208);
  *(void *)(v3 + 208) = v2;

  [*(id *)(a1 + 32) didStartSession];
  [*(id *)(a1 + 32) _installStateListener];
  [*(id *)(a1 + 32) _installTimers];
  uint64_t v5 = *(void **)(a1 + 32);
  return [v5 setState:1];
}

- (void)cancelWithError:(id)a3
{
  id v4 = a3;
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_sessionActivity, &v8);
  uint64_t v5 = [v4 domain];
  if (![v5 isEqualToString:@"SYErrorDomain"])
  {

    goto LABEL_5;
  }
  uint64_t v6 = [v4 code];

  if (v6 != -128)
  {
LABEL_5:
    [(SYSession *)self setError:v4];
    uint64_t v7 = 5;
    goto LABEL_6;
  }
  uint64_t v7 = 3;
LABEL_6:
  [(SYOutgoingSyncAllObjectsSession *)self setState:v7];
  os_activity_scope_leave(&v8);
}

- (BOOL)_handleBatchSyncEndResponse:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v15.opaque[0] = 0;
  v15.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_sessionActivity, &v15);
  uint64_t v7 = [v6 syncID];
  os_activity_scope_state_s v8 = [(SYSession *)self identifier];
  char v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    if ([v6 hasError])
    {
      dispatch_time_t v10 = (void *)MEMORY[0x263F087E8];
      id v11 = [v6 error];
      uint64_t v12 = [v10 errorFromSYErrorInfo:v11];

      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      char v13 = qword_26AB04788;
      if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v12;
        _os_log_impl(&dword_21C7C9000, v13, OS_LOG_TYPE_DEFAULT, "Received an error SYSyncEndResponse: %@", buf, 0xCu);
      }
      [(SYSession *)self setError:v12];
      [(SYOutgoingSyncAllObjectsSession *)self setState:5];
    }
    else
    {
      [(SYOutgoingSyncAllObjectsSession *)self setState:9];
    }
  }
  else if (a4)
  {
    *a4 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:2006 userInfo:0];
  }
  os_activity_scope_leave(&v15);

  return v9;
}

- (BOOL)wasCancelled
{
  return self->_cancelled;
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
  objc_storeStrong((id *)&self->_changesToSend, 0);
  objc_storeStrong((id *)&self->_sessionTimer, 0);
  objc_storeStrong((id *)&self->_stateUpdateSource, 0);
  objc_storeStrong((id *)&self->_sessionActivity, 0);
}

@end