@interface SYReceivingSession
- (BOOL)_handleEndSessionResponse:(id)a3 error:(id *)a4;
- (BOOL)_handleRestartSessionResponse:(id)a3 error:(id *)a4;
- (BOOL)_handleStartSessionResponse:(id)a3 error:(id *)a4;
- (BOOL)_handleSyncBatchResponse:(id)a3 error:(id *)a4;
- (BOOL)_hasCompleted;
- (BOOL)_hasStarted;
- (BOOL)_isMissingSyncBatches;
- (BOOL)_postAsyncResetRequestReturningError:(id *)a3;
- (BOOL)canRestart;
- (BOOL)canRollback;
- (BOOL)isResetSync;
- (BOOL)isSending;
- (BOOL)metadataModified;
- (BOOL)wasCancelled;
- (SYReceivingSession)initWithService:(id)a3 isReset:(BOOL)a4 metadata:(id)a5;
- (id)_newMessageHeader;
- (unsigned)state;
- (void)_continue;
- (void)_handleEndSession:(id)a3 response:(id)a4 completion:(id)a5;
- (void)_handleRestartSession:(id)a3 response:(id)a4 completion:(id)a5;
- (void)_handleSyncBatch:(id)a3 response:(id)a4 completion:(id)a5;
- (void)_installStateListener;
- (void)_installTimers;
- (void)_midStreamErrorHandled;
- (void)_notifyErrorAndShutdown;
- (void)_processNextState;
- (void)_sendEndSessionAndError:(id)a3;
- (void)_sessionCancelled;
- (void)_sessionFinished;
- (void)_sessionRestarted;
- (void)_setCancelled;
- (void)_setCompleted;
- (void)_setStarted;
- (void)_setStateQuietly:(unsigned int)a3;
- (void)_tweakMessageHeader:(id)a3;
- (void)cancelWithError:(id)a3;
- (void)setCanRestart:(BOOL)a3;
- (void)setCanRollback:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setSessionMetadata:(id)a3;
- (void)setState:(unsigned int)a3;
- (void)start:(id)a3;
@end

@implementation SYReceivingSession

- (SYReceivingSession)initWithService:(id)a3 isReset:(BOOL)a4 metadata:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v20.receiver = self;
  v20.super_class = (Class)SYReceivingSession;
  v10 = [(SYSession *)&v20 initWithService:v8];
  v11 = v10;
  if (v10)
  {
    v10->_flagsLock._os_unfair_lock_opaque = 0;
    v12 = [v8 serviceActivity];
    os_activity_t v13 = _os_activity_create(&dword_21C7C9000, "SYSession (Incoming)", v12, OS_ACTIVITY_FLAG_DEFAULT);

    sessionActivity = v11->_sessionActivity;
    v11->_sessionActivity = (OS_os_activity *)v13;

    if (v6) {
      __int16 v15 = 64;
    }
    else {
      __int16 v15 = 0;
    }
    *(_WORD *)&v11->_flags = *(_WORD *)&v11->_flags & 0xFF80 | v15;
    uint64_t v16 = objc_opt_new();
    receivedBatchIndices = v11->_receivedBatchIndices;
    v11->_receivedBatchIndices = (NSMutableIndexSet *)v16;

    if (v9)
    {
      [(SYReceivingSession *)v11 setSessionMetadata:v9];
      *(_WORD *)&v11->_flags &= ~0x400u;
    }
    v18 = v11;
  }

  return v11;
}

- (void)setDelegate:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SYReceivingSession;
  id v4 = a3;
  [(SYSession *)&v8 setDelegate:v4];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    BOOL v6 = (OS_dispatch_group *)dispatch_group_create();
    asyncResetGroupToWaitOn = self->_asyncResetGroupToWaitOn;
    self->_asyncResetGroupToWaitOn = v6;
  }
}

- (void)setSessionMetadata:(id)a3
{
  id v4 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_sessionActivity, &state);
  v5.receiver = self;
  v5.super_class = (Class)SYReceivingSession;
  [(SYSession *)&v5 setSessionMetadata:v4];
  os_unfair_lock_lock(&self->_flagsLock);
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_flagsLock);
  os_activity_scope_leave(&state);
}

- (BOOL)metadataModified
{
  v2 = self;
  p_flagsLock = &self->_flagsLock;
  os_unfair_lock_lock(&self->_flagsLock);
  LODWORD(v2) = (*(_WORD *)&v2->_flags >> 10) & 1;
  os_unfair_lock_unlock(p_flagsLock);
  return (char)v2;
}

- (unsigned)state
{
  v2 = self;
  p_flagsLock = &self->_flagsLock;
  os_unfair_lock_lock(&self->_flagsLock);
  LODWORD(v2) = *(_WORD *)&v2->_flags & 0xF;
  os_unfair_lock_unlock(p_flagsLock);
  return v2;
}

- (void)setState:(unsigned int)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_sessionActivity, &v10);
  p_flagsLock = &self->_flagsLock;
  os_unfair_lock_lock(&self->_flagsLock);
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  BOOL v6 = qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = *(_WORD *)&self->_flags & 0xF;
    *(_DWORD *)buf = 138543874;
    v12 = self;
    __int16 v13 = 1024;
    int v14 = v7;
    __int16 v15 = 1024;
    unsigned int v16 = a3;
    _os_log_impl(&dword_21C7C9000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Set state from %{companionsync:SYSessionState}d to %{companionsync:SYSessionState}d", buf, 0x18u);
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF0 | a3 & 0xF;
  stateUpdateSource = self->_stateUpdateSource;
  if (stateUpdateSource)
  {
    if (!dispatch_source_testcancel(stateUpdateSource)) {
      dispatch_source_merge_data(stateUpdateSource, 1uLL);
    }
  }
  else
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v9 = qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C7C9000, v9, OS_LOG_TYPE_DEFAULT, "No dispatch source set up for state-change notifications!", buf, 2u);
    }
  }
  os_unfair_lock_unlock(p_flagsLock);
  os_activity_scope_leave(&v10);
}

- (void)_setStateQuietly:(unsigned int)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v7.opaque[0] = 0;
  v7.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_sessionActivity, &v7);
  os_unfair_lock_lock(&self->_flagsLock);
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  objc_super v5 = qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = *(_WORD *)&self->_flags & 0xF;
    *(_DWORD *)buf = 138543874;
    id v9 = self;
    __int16 v10 = 1024;
    int v11 = v6;
    __int16 v12 = 1024;
    unsigned int v13 = a3;
    _os_log_impl(&dword_21C7C9000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Setting state (quietly) from %{companionsync:SYSessionState}d to %{companionsync:SYSessionState}d", buf, 0x18u);
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF0 | a3 & 0xF;
  os_unfair_lock_unlock(&self->_flagsLock);
  os_activity_scope_leave(&v7);
}

- (BOOL)canRestart
{
  v2 = self;
  p_flagsLock = &self->_flagsLock;
  os_unfair_lock_lock(&self->_flagsLock);
  LODWORD(v2) = (*(_WORD *)&v2->_flags >> 4) & 1;
  os_unfair_lock_unlock(p_flagsLock);
  return (char)v2;
}

- (void)setCanRestart:(BOOL)a3
{
  BOOL v3 = a3;
  p_flagsLock = &self->_flagsLock;
  os_unfair_lock_lock(&self->_flagsLock);
  if (v3) {
    __int16 v6 = 16;
  }
  else {
    __int16 v6 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v6;
  os_unfair_lock_unlock(p_flagsLock);
}

- (BOOL)canRollback
{
  v2 = self;
  p_flagsLock = &self->_flagsLock;
  os_unfair_lock_lock(&self->_flagsLock);
  LODWORD(v2) = (*(_WORD *)&v2->_flags >> 5) & 1;
  os_unfair_lock_unlock(p_flagsLock);
  return (char)v2;
}

- (void)setCanRollback:(BOOL)a3
{
  BOOL v3 = a3;
  p_flagsLock = &self->_flagsLock;
  os_unfair_lock_lock(&self->_flagsLock);
  if (v3) {
    __int16 v6 = 32;
  }
  else {
    __int16 v6 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFDF | v6;
  os_unfair_lock_unlock(p_flagsLock);
}

- (BOOL)isResetSync
{
  v2 = self;
  p_flagsLock = &self->_flagsLock;
  os_unfair_lock_lock(&self->_flagsLock);
  LODWORD(v2) = (*(_WORD *)&v2->_flags >> 6) & 1;
  os_unfair_lock_unlock(p_flagsLock);
  return (char)v2;
}

- (BOOL)isSending
{
  return 0;
}

- (BOOL)wasCancelled
{
  v2 = self;
  p_flagsLock = &self->_flagsLock;
  os_unfair_lock_lock(&self->_flagsLock);
  LODWORD(v2) = HIBYTE(*(_WORD *)&v2->_flags) & 1;
  os_unfair_lock_unlock(p_flagsLock);
  return (char)v2;
}

- (void)_setCompleted
{
  p_flagsLock = &self->_flagsLock;
  os_unfair_lock_lock(&self->_flagsLock);
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(p_flagsLock);
}

- (BOOL)_hasCompleted
{
  v2 = self;
  p_flagsLock = &self->_flagsLock;
  os_unfair_lock_lock(&self->_flagsLock);
  LODWORD(v2) = (*(_WORD *)&v2->_flags >> 9) & 1;
  os_unfair_lock_unlock(p_flagsLock);
  return (char)v2;
}

- (void)_setCancelled
{
  p_flagsLock = &self->_flagsLock;
  os_unfair_lock_lock(&self->_flagsLock);
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_flagsLock);
}

- (void)_setStarted
{
  [(SYSession *)self didStartSession];
  os_unfair_lock_lock(&self->_flagsLock);
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_flagsLock);
}

- (BOOL)_hasStarted
{
  v2 = self;
  p_flagsLock = &self->_flagsLock;
  os_unfair_lock_lock(&self->_flagsLock);
  LODWORD(v2) = (*(_WORD *)&v2->_flags >> 7) & 1;
  os_unfair_lock_unlock(p_flagsLock);
  return (char)v2;
}

- (id)_newMessageHeader
{
  BOOL v3 = [(SYSession *)self service];
  id v4 = (void *)[v3 _newMessageHeader];

  [(SYReceivingSession *)self _tweakMessageHeader:v4];
  return v4;
}

- (void)_tweakMessageHeader:(id)a3
{
  id v9 = a3;
  [(SYSession *)self perMessageTimeout];
  if (v4 == 0.0)
  {
    objc_super v5 = [MEMORY[0x263EFF910] distantFuture];
    [v5 timeIntervalSinceReferenceDate];
    objc_msgSend(v9, "setTimeout:");

    __int16 v6 = v5;
  }
  else
  {
    double Current = CFAbsoluteTimeGetCurrent();
    [(SYSession *)self perMessageTimeout];
    [v9 setTimeout:Current + v8];
    __int16 v6 = v9;
  }
}

- (void)_sendEndSessionAndError:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(SYSession *)self queue];
  dispatch_assert_queue_V2(v5);

  stateUpdateSource = self->_stateUpdateSource;
  if (stateUpdateSource) {
    dispatch_source_cancel(stateUpdateSource);
  }
  sessionTimer = self->_sessionTimer;
  if (sessionTimer)
  {
    dispatch_source_cancel(sessionTimer);
    double v8 = self->_sessionTimer;
    self->_sessionTimer = 0;
  }
  [(SYReceivingSession *)self _setCompleted];
  id v9 = [(SYSession *)self targetQueue];
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __46__SYReceivingSession__sendEndSessionAndError___block_invoke;
  __int16 v15 = &unk_264422990;
  unsigned int v16 = self;
  id v17 = v4;
  id v10 = v4;
  dispatch_sync(v9, &v12);

  int v11 = [(SYSession *)self service];
  [v11 sessionDidEnd:self withError:v10];

  [(SYSession *)self didCompleteSession];
}

void __46__SYReceivingSession__sendEndSessionAndError___block_invoke(uint64_t a1)
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
  BOOL v3 = [*(id *)(a1 + 32) delegate];
  [v3 syncSession:*(void *)(a1 + 32) didEndWithError:*(void *)(a1 + 40)];
}

- (void)_midStreamErrorHandled
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  BOOL v3 = [(SYSession *)self queue];
  dispatch_assert_queue_V2(v3);

  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_sessionActivity, &v10);
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  id v4 = qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v12 = self;
    _os_log_impl(&dword_21C7C9000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: _midStreamErrorHandled", buf, 0xCu);
  }
  objc_super v5 = [(SYSession *)self error];
  __int16 v6 = [v5 domain];
  if (([v6 isEqualToString:@"SYErrorDomain"] & 1) == 0)
  {

    goto LABEL_9;
  }
  os_activity_scope_state_s v7 = [(SYSession *)self error];
  BOOL v8 = [v7 code] == -128;

  if (!v8)
  {
LABEL_9:
    [(SYReceivingSession *)self _setStateQuietly:5];
    goto LABEL_10;
  }
  os_unfair_lock_lock(&self->_flagsLock);
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFEF0 | 0x103;
  os_unfair_lock_unlock(&self->_flagsLock);
LABEL_10:
  id v9 = [(SYSession *)self error];
  [(SYReceivingSession *)self _sendEndSessionAndError:v9];

  os_activity_scope_leave(&v10);
}

- (void)_notifyErrorAndShutdown
{
  id v3 = [(SYSession *)self error];
  [(SYReceivingSession *)self _sendEndSessionAndError:v3];
}

- (void)_sessionCancelled
{
  id v3 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:-128 userInfo:0];
  [(SYReceivingSession *)self _sendEndSessionAndError:v3];
}

- (void)_sessionRestarted
{
}

- (void)_sessionFinished
{
}

- (void)_processNextState
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = [(SYSession *)self queue];
  dispatch_assert_queue_V2(v3);

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_sessionActivity, &state);
  uint64_t v4 = [(SYReceivingSession *)self state];
  switch([(SYReceivingSession *)self state])
  {
    case 3u:
      [(SYReceivingSession *)self _sessionCancelled];
      break;
    case 4u:
      [(SYReceivingSession *)self _sessionRestarted];
      break;
    case 5u:
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      objc_super v5 = (id)qword_26AB04788;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v6 = [(SYSession *)self error];
        os_activity_scope_state_s v7 = _SYObfuscate(v6);
        *(_DWORD *)buf = 138543618;
        v25 = self;
        __int16 v26 = 2114;
        v27 = v7;
        _os_log_impl(&dword_21C7C9000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ entered error state. Error = %{public}@", buf, 0x16u);
      }
      [(SYReceivingSession *)self _notifyErrorAndShutdown];
      break;
    case 9u:
      [(SYReceivingSession *)self _sessionFinished];
      break;
    case 0xCu:
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      BOOL v8 = (id)qword_26AB04788;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = [(SYSession *)self error];
        _SYObfuscate(v9);
        os_activity_scope_state_s v10 = (SYReceivingSession *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v25 = v10;
        _os_log_impl(&dword_21C7C9000, v8, OS_LOG_TYPE_DEFAULT, "Error occurred while waiting for async client operation to complete. Will send error as part of response to that operation. Error = %{public}@", buf, 0xCu);
      }
      break;
    default:
      break;
  }
  int v11 = [(SYSession *)self stateResponders];
  uint64_t v12 = [NSNumber numberWithUnsignedInt:v4];
  uint64_t v13 = [v11 objectForKeyedSubscript:v12];

  if ([v13 count])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v14 = v13;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v19 != v16) {
            objc_enumerationMutation(v14);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v18 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v18 + 1) + 8 * i));
        }
        uint64_t v15 = [v14 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v15);
    }

    objc_msgSend(v14, "removeAllObjects", (void)v18);
  }

  os_activity_scope_leave(&state);
}

- (void)_installTimers
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = [(SYSession *)self identifier];
  uint64_t v4 = (void *)[v3 copy];

  objc_super v5 = (void *)MEMORY[0x263EFF910];
  [(SYSession *)self fullSessionTimeout];
  __int16 v6 = objc_msgSend(v5, "dateWithTimeIntervalSinceNow:");
  objc_initWeak(&location, self);
  uint64_t v21 = MEMORY[0x263EF8330];
  uint64_t v22 = 3221225472;
  v23 = __36__SYReceivingSession__installTimers__block_invoke;
  v24 = &unk_264423368;
  objc_copyWeak(&v27, &location);
  id v7 = v4;
  id v25 = v7;
  id v8 = v6;
  id v26 = v8;
  id v9 = (void *)MEMORY[0x21D4B17C0](&v21);
  [(SYSession *)self fullSessionTimeout];
  if (v10 != 0.0)
  {
    int v11 = dispatch_get_global_queue(21, 0);
    uint64_t v12 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v11);
    sessionTimer = self->_sessionTimer;
    self->_sessionTimer = v12;

    dispatch_source_set_event_handler((dispatch_source_t)self->_sessionTimer, v9);
    id v14 = self->_sessionTimer;
    [(SYSession *)self fullSessionTimeout];
    dispatch_time_t v16 = dispatch_walltime(0, (uint64_t)(v15 * 1000000000.0));
    dispatch_source_set_timer(v14, v16, 0xFFFFFFFFFFFFFFFFLL, 0x37E11D600uLL);
    dispatch_resume((dispatch_object_t)self->_sessionTimer);
    id v17 = (void *)MEMORY[0x263EFF910];
    [(SYSession *)self fullSessionTimeout];
    long long v18 = objc_msgSend(v17, "dateWithTimeIntervalSinceNow:");
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    long long v19 = (id)qword_26AB04788;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      [(SYSession *)self fullSessionTimeout];
      *(_DWORD *)buf = 134218242;
      uint64_t v30 = v20;
      __int16 v31 = 2114;
      v32 = v18;
      _os_log_impl(&dword_21C7C9000, v19, OS_LOG_TYPE_DEFAULT, "Session timeout is %.02f seconds. Timer will fire at %{public}@", buf, 0x16u);
    }
  }
  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

void __36__SYReceivingSession__installTimers__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  id v3 = qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, (os_log_type_t)0x90u))
  {
    __34__SYSendingSession__installTimers__block_invoke_cold_1(a1, (uint64_t)WeakRetained, v3);
    if (!WeakRetained) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if (WeakRetained)
  {
LABEL_5:
    uint64_t v4 = [WeakRetained queue];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __36__SYReceivingSession__installTimers__block_invoke_10;
    v5[3] = &unk_264422990;
    v5[4] = WeakRetained;
    id v6 = *(id *)(a1 + 40);
    dispatch_async(v4, v5);
  }
LABEL_6:
}

void __36__SYReceivingSession__installTimers__block_invoke_10(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(void *)(a1 + 32) + 232), &v10);
  v2 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:2007 userInfo:0];
  [*(id *)(a1 + 32) setError:v2];

  if ([*(id *)(a1 + 32) state] == 11)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v3 = qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEBUG)) {
      __36__SYReceivingSession__installTimers__block_invoke_10_cold_1(v3);
    }
    uint64_t v4 = 12;
  }
  else
  {
    uint64_t v4 = 5;
  }
  [*(id *)(a1 + 32) setState:v4];
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  objc_super v5 = (id)qword_26AB04788;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = *(void **)(a1 + 40);
    [v6 timeIntervalSinceNow];
    *(_DWORD *)buf = 138543618;
    uint64_t v12 = v6;
    __int16 v13 = 2048;
    uint64_t v14 = v7;
    _os_log_impl(&dword_21C7C9000, v5, OS_LOG_TYPE_DEFAULT, "Session timeout timer fired. Expected to fire at %{public}@, delta is %.02f", buf, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 248));
  id v9 = WeakRetained;
  if (WeakRetained) {
    dispatch_block_cancel(WeakRetained);
  }

  os_activity_scope_leave(&v10);
}

- (void)_installStateListener
{
  id v3 = [(SYSession *)self queue];
  uint64_t v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF83B8], 0, 0, v3);
  stateUpdateSource = self->_stateUpdateSource;
  self->_stateUpdateSource = v4;

  objc_initWeak(&location, self);
  id v6 = self->_stateUpdateSource;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__SYReceivingSession__installStateListener__block_invoke;
  v7[3] = &unk_264422C90;
  objc_copyWeak(&v8, &location);
  dispatch_source_set_event_handler(v6, v7);
  dispatch_resume((dispatch_object_t)self->_stateUpdateSource);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __43__SYReceivingSession__installStateListener__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _processNextState];
    id WeakRetained = v2;
  }
}

- (BOOL)_isMissingSyncBatches
{
  uint64_t v3 = [(NSMutableIndexSet *)self->_receivedBatchIndices lastIndex];
  return v3 != 0x7FFFFFFFFFFFFFFFLL
      && -[NSMutableIndexSet countOfIndexesInRange:](self->_receivedBatchIndices, "countOfIndexesInRange:", 0, v3 + 1) != v3 + 1;
}

- (BOOL)_postAsyncResetRequestReturningError:(id *)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  [(SYReceivingSession *)self setState:10];
  dispatch_group_enter((dispatch_group_t)self->_asyncResetGroupToWaitOn);
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__11;
  id v25 = __Block_byref_object_dispose__11;
  id v26 = 0;
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 1;
  objc_initWeak(&location, self);
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  objc_super v5 = qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C7C9000, v5, OS_LOG_TYPE_INFO, "Delegate: -resetDataStoreForSyncSession:completion:", buf, 2u);
  }
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  uint64_t v7 = [(SYSession *)self delegate];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __59__SYReceivingSession__postAsyncResetRequestReturningError___block_invoke;
  v14[3] = &unk_264423C58;
  objc_copyWeak(v15, &location);
  v15[1] = *(id *)&Current;
  v14[4] = &v17;
  v14[5] = &v21;
  [v7 resetDataStoreForSyncSession:self completion:v14];

  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  id v8 = (id)qword_26AB04788;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    char v9 = *((unsigned char *)v18 + 24);
    _SYObfuscate((void *)v22[5]);
    os_activity_scope_state_s v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[SYReceivingSession _postAsyncResetRequestReturningError:](v9, v10, buf, v8);
  }

  int v11 = (void *)v22[5];
  if (v11) {
    *a3 = v11;
  }
  BOOL v12 = *((unsigned char *)v18 + 24) != 0;
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v12;
}

void __59__SYReceivingSession__postAsyncResetRequestReturningError___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id WeakRetained = (dispatch_group_t *)objc_loadWeakRetained((id *)(a1 + 48));
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  id v8 = (void *)qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
  {
    char v9 = v8;
    double v10 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 56);
    int v11 = _SYObfuscate(WeakRetained);
    if (a2) {
      BOOL v12 = "YES";
    }
    else {
      BOOL v12 = "NO";
    }
    __int16 v13 = _SYObfuscate(v6);
    int v19 = 134218754;
    double v20 = v10;
    __int16 v21 = 2114;
    uint64_t v22 = v11;
    __int16 v23 = 2080;
    v24 = v12;
    __int16 v25 = 2114;
    id v26 = v13;
    _os_log_impl(&dword_21C7C9000, v9, OS_LOG_TYPE_DEFAULT, "Async reset-data completion called after %.02f seconds with strongSelf = %{public}@, success = %s, error = %{public}@", (uint8_t *)&v19, 0x2Au);
  }
  if (!a2)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    uint64_t v15 = (void *)qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_time_t v16 = v15;
      uint64_t v17 = _SYObfuscate(WeakRetained);
      long long v18 = _SYObfuscate(v6);
      int v19 = 138543618;
      double v20 = *(double *)&v17;
      __int16 v21 = 2114;
      uint64_t v22 = v18;
      _os_log_impl(&dword_21C7C9000, v16, OS_LOG_TYPE_DEFAULT, "Error reported from async reset-data in session %{public}@: %{public}@", (uint8_t *)&v19, 0x16u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    [(dispatch_group_t *)WeakRetained setError:v6];
    uint64_t v14 = 5;
    goto LABEL_16;
  }
  if ([(dispatch_group_t *)WeakRetained state] == 10)
  {
    uint64_t v14 = 1;
LABEL_16:
    [(dispatch_group_t *)WeakRetained setState:v14];
  }
  dispatch_group_leave(WeakRetained[30]);
}

- (void)start:(id)a3
{
  v25[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(id, void, id))a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_sessionActivity, &state);
  objc_super v5 = [(SYSession *)self delegate];
  BOOL v6 = v5 == 0;

  if (v6)
  {
    id v10 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v24 = *MEMORY[0x263F08320];
    v25[0] = @"You cannot start an SYSession without a delegate.";
    int v11 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
    BOOL v12 = (void *)[v10 initWithSYError:2001 userInfo:v11];

    __int16 v13 = [(SYSession *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __28__SYReceivingSession_start___block_invoke;
    block[3] = &unk_264422990;
    block[4] = self;
    id v14 = v12;
    id v18 = v14;
    dispatch_async(v13, block);

    v4[2](v4, 0, v14);
  }
  else
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    uint64_t v7 = (id)qword_26AB04788;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(SYSession *)self identifier];
      *(_DWORD *)buf = 138543618;
      __int16 v21 = self;
      __int16 v22 = 2114;
      __int16 v23 = v8;
      _os_log_impl(&dword_21C7C9000, v7, OS_LOG_TYPE_DEFAULT, "Starting %{public}@ with identifier %{public}@", buf, 0x16u);
    }
    char v9 = [(SYSession *)self queue];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    id v15[2] = __28__SYReceivingSession_start___block_invoke_19;
    v15[3] = &unk_264422E88;
    v15[4] = self;
    dispatch_time_t v16 = v4;
    dispatch_async(v9, v15);
  }
  os_activity_scope_leave(&state);
}

uint64_t __28__SYReceivingSession_start___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendEndSessionAndError:*(void *)(a1 + 40)];
}

void __28__SYReceivingSession_start___block_invoke_19(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __28__SYReceivingSession_start___block_invoke_2;
  v36[3] = &unk_264423C80;
  id v2 = (id *)(a1 + 32);
  v36[4] = *(void *)(a1 + 32);
  id v37 = *(id *)(a1 + 40);
  uint64_t v3 = (void (**)(void, void))MEMORY[0x21D4B17C0](v36);
  int v4 = [*v2 state];
  if (v4)
  {
    if (v4 == 5)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      id v10 = qword_26AB04788;
      if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21C7C9000, v10, OS_LOG_TYPE_DEFAULT, "Receiving session entered error state during initialization", buf, 2u);
      }
      int v11 = [*(id *)(a1 + 32) error];
      ((void (**)(void, void *))v3)[2](v3, v11);
    }
    else if (v4 == 3)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      objc_super v5 = qword_26AB04788;
      if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21C7C9000, v5, OS_LOG_TYPE_DEFAULT, "Receiving session canceled during initialization", buf, 2u);
      }
      BOOL v6 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:-128 userInfo:0];
      ((void (**)(void, void *))v3)[2](v3, v6);
    }
    else
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      BOOL v12 = (void *)qword_26AB04788;
      if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v13 = *(void **)(a1 + 32);
        id v14 = v12;
        int v15 = [v13 state];
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v15;
        _os_log_impl(&dword_21C7C9000, v14, OS_LOG_TYPE_DEFAULT, "Unexpected state during initialization: %{companionsync:SYSessionState}d", buf, 8u);
      }
      dispatch_time_t v16 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:2011 userInfo:0];
      ((void (**)(void, void *))v3)[2](v3, v16);
    }
    goto LABEL_36;
  }
  [*(id *)(a1 + 32) fullSessionTimeout];
  if (v7 < 0.0)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v8 = qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C7C9000, v8, OS_LOG_TYPE_DEFAULT, "Pre-expired session arrived. Dropping.", buf, 2u);
    }
    char v9 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:2007 userInfo:0];
    ((void (**)(void, void *))v3)[2](v3, v9);

    goto LABEL_36;
  }
  if (![*(id *)(a1 + 32) isResetSync]) {
    goto LABEL_33;
  }
  *(void *)buf = 0;
  v41 = buf;
  uint64_t v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__11;
  v44 = __Block_byref_object_dispose__11;
  id v45 = 0;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  uint64_t v17 = [*(id *)(a1 + 32) delegate];
  id v18 = [*(id *)(a1 + 32) targetQueue];
  uint64_t v24 = MEMORY[0x263EF8330];
  uint64_t v25 = 3221225472;
  id v26 = __28__SYReceivingSession_start___block_invoke_21;
  uint64_t v27 = &unk_264423CA8;
  id v19 = v17;
  uint64_t v20 = *(void *)(a1 + 32);
  id v28 = v19;
  uint64_t v29 = v20;
  uint64_t v30 = &v32;
  __int16 v31 = buf;
  dispatch_sync(v18, &v24);

  int v21 = *((unsigned __int8 *)v33 + 24);
  if (*((unsigned char *)v33 + 24))
  {

    _Block_object_dispose(&v32, 8);
    _Block_object_dispose(buf, 8);

LABEL_33:
    objc_msgSend(*(id *)(a1 + 32), "_installStateListener", v24, v25, v26, v27);
    [*(id *)(a1 + 32) _installTimers];
    [*(id *)(a1 + 32) _setStarted];
    if (![*(id *)(a1 + 32) state]) {
      [*(id *)(a1 + 32) setState:1];
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_36;
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  __int16 v22 = qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = *((void *)v41 + 5);
    *(_DWORD *)v38 = 138412290;
    uint64_t v39 = v23;
    _os_log_impl(&dword_21C7C9000, v22, OS_LOG_TYPE_DEFAULT, "Delegate failed reset-store operation: %@", v38, 0xCu);
  }
  v3[2](v3, *((void *)v41 + 5));

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(buf, 8);

  if (v21) {
    goto LABEL_33;
  }
LABEL_36:
}

void __28__SYReceivingSession_start___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) queue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __28__SYReceivingSession_start___block_invoke_3;
  v8[3] = &unk_264422990;
  v8[4] = *(void *)(a1 + 32);
  id v9 = v3;
  id v5 = v3;
  dispatch_async(v4, v8);

  (*(void (**)(void, void, id, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, v5, v6, v7);
}

uint64_t __28__SYReceivingSession_start___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendEndSessionAndError:*(void *)(a1 + 40)];
}

void __28__SYReceivingSession_start___block_invoke_21(void *a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v8 = qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C7C9000, v8, OS_LOG_TYPE_INFO, "Delegate: -syncSession:resetDataStoreWithError:", buf, 2u);
    }
    double Current = CFAbsoluteTimeGetCurrent();
    id v10 = (void *)a1[4];
    uint64_t v11 = a1[5];
    id v17 = 0;
    char v12 = [v10 syncSession:v11 resetDataStoreWithError:&v17];
    id v13 = v17;
    id v7 = v17;
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v12;
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v14 = (void *)qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_INFO))
    {
      int v15 = v14;
      CFAbsoluteTime v16 = CFAbsoluteTimeGetCurrent();
      *(_DWORD *)buf = 134217984;
      double v20 = Current - v16;
      _os_log_impl(&dword_21C7C9000, v15, OS_LOG_TYPE_INFO, "Delegate callout complete after %.02f seconds: -syncSession:resetDataStoreWithError:", buf, 0xCu);
    }
    if (!*(unsigned char *)(*(void *)(a1[6] + 8) + 24)) {
      objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), v13);
    }
    id v5 = 0;
    goto LABEL_15;
  }
  id v2 = (void *)a1[5];
  id v18 = 0;
  char v3 = [v2 _postAsyncResetRequestReturningError:&v18];
  id v4 = v18;
  id v5 = v4;
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v3;
  if (!*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    uint64_t v6 = *(void *)(a1[7] + 8);
    id v5 = v4;
    id v7 = *(id *)(v6 + 40);
    *(void *)(v6 + 40) = v5;
LABEL_15:
  }
}

- (void)cancelWithError:(id)a3
{
  id v4 = a3;
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_sessionActivity, &v10);
  [(SYReceivingSession *)self _setCancelled];
  id v5 = [(SYSession *)self _cancelPendingMessagesReturningFailures];
  if ([v5 count])
  {
    uint64_t v6 = [(SYSession *)self service];
    [v6 sessionFailedToCancelMessageUUIDs:v5];
  }
  id v7 = [v4 domain];
  if ([v7 isEqualToString:@"SYErrorDomain"])
  {
    uint64_t v8 = [v4 code];

    if (v8 == -128)
    {
      uint64_t v9 = 3;
      goto LABEL_8;
    }
  }
  else
  {
  }
  [(SYSession *)self setError:v4];
  uint64_t v9 = 5;
LABEL_8:
  if ([(SYReceivingSession *)self state] == 11)
  {
    [(SYSession *)self setError:v4];
    uint64_t v9 = 12;
  }
  if ([(SYReceivingSession *)self _hasStarted]) {
    [(SYReceivingSession *)self setState:v9];
  }
  else {
    [(SYReceivingSession *)self _setStateQuietly:v9];
  }

  os_activity_scope_leave(&v10);
}

- (void)_handleSyncBatch:(id)a3 response:(id)a4 completion:(id)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_sessionActivity, &state);
  uint64_t v11 = [v8 sessionID];
  [v9 setSessionID:v11];

  objc_msgSend(v9, "setIndex:", objc_msgSend(v8, "index"));
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  char v12 = (id)qword_26AB04788;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[SYReceivingSession _handleSyncBatch:response:completion:](v38, [v8 index], v12);
  }

  -[NSMutableIndexSet addIndex:](self->_receivedBatchIndices, "addIndex:", [v8 index]);
  id v13 = [_SYLazyChangeArray alloc];
  id v14 = [v8 changes];
  int v15 = [(SYSession *)self serializer];
  CFAbsoluteTime v16 = [(_SYLazyChangeArray *)v13 initWithSourceArray:v14 decoder:v15];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__SYReceivingSession__handleSyncBatch_response_completion___block_invoke;
  block[3] = &unk_264423D48;
  id v17 = v8;
  id v29 = v17;
  uint64_t v30 = self;
  id v18 = v9;
  id v31 = v18;
  id v19 = v10;
  id v33 = v19;
  double v20 = v16;
  uint64_t v32 = v20;
  dispatch_block_t v21 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  __int16 v22 = (id)qword_26AB04788;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    -[SYReceivingSession _handleSyncBatch:response:completion:](v37, [(SYReceivingSession *)self state], v22);
  }

  if ([(SYReceivingSession *)self state] == 10)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    uint64_t v23 = (void *)qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = v23;
      uint64_t v25 = (void *)MEMORY[0x21D4B17C0](v21);
      *(_DWORD *)buf = 138412290;
      v36 = v25;
      _os_log_impl(&dword_21C7C9000, v24, OS_LOG_TYPE_DEFAULT, "First batch arrived, we're still waiting on reset completion-- using dispatch_group_notify with block %@", buf, 0xCu);
    }
    objc_storeWeak(&self->_weakBlockWaitingForReset, v21);
    asyncResetGroupToWaitOn = self->_asyncResetGroupToWaitOn;
    uint64_t v27 = [(SYSession *)self targetQueue];
    dispatch_group_notify(asyncResetGroupToWaitOn, v27, v21);
  }
  else
  {
    uint64_t v27 = [(SYSession *)self targetQueue];
    dispatch_async(v27, v21);
  }

  os_activity_scope_leave(&state);
}

void __59__SYReceivingSession__handleSyncBatch_response_completion___block_invoke(uint64_t a1)
{
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  id v2 = (void *)qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEBUG)) {
    __59__SYReceivingSession__handleSyncBatch_response_completion___block_invoke_cold_1(a1, v2);
  }
  int v3 = [*(id *)(a1 + 40) state];
  id v4 = *(void **)(a1 + 40);
  if (v3 == 5)
  {
    id v5 = [v4 queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__SYReceivingSession__handleSyncBatch_response_completion___block_invoke_23;
    block[3] = &unk_264423CD0;
    uint64_t v6 = *(void **)(a1 + 48);
    void block[4] = *(void *)(a1 + 40);
    id v7 = &v18;
    id v18 = v6;
    id v8 = &v19;
    id v19 = *(id *)(a1 + 64);
    dispatch_async(v5, block);
  }
  else
  {
    [v4 _setStateQuietly:11];
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v9 = qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C7C9000, v9, OS_LOG_TYPE_INFO, "Delegate: -syncSession:applyChanges:completion:", buf, 2u);
    }
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    id v5 = [*(id *)(a1 + 40) delegate];
    uint64_t v11 = *(void *)(a1 + 40);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __59__SYReceivingSession__handleSyncBatch_response_completion___block_invoke_25;
    v13[3] = &unk_264423D20;
    v13[4] = v11;
    *(CFAbsoluteTime *)&v15[1] = Current;
    id v7 = &v14;
    uint64_t v12 = *(void *)(a1 + 56);
    id v14 = *(id *)(a1 + 48);
    id v8 = (id *)v15;
    v15[0] = *(id *)(a1 + 64);
    [v5 syncSession:v11 applyChanges:v12 completion:v13];
  }
}

void __59__SYReceivingSession__handleSyncBatch_response_completion___block_invoke_23(uint64_t a1)
{
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(void *)(a1 + 32) + 232), &state);
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  id v2 = qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_21C7C9000, v2, OS_LOG_TYPE_DEFAULT, "Returning error state in response to a sync batch", v9, 2u);
  }
  int v3 = [SYErrorInfo alloc];
  id v4 = [*(id *)(a1 + 32) error];
  id v5 = [(SYErrorInfo *)v3 initWithError:v4];
  [*(id *)(a1 + 40) setError:v5];

  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v8 = [*(id *)(a1 + 32) wrappedUserContext];
  (*(void (**)(uint64_t, uint64_t, void *))(v6 + 16))(v6, v7, v8);

  os_activity_scope_leave(&state);
}

void __59__SYReceivingSession__handleSyncBatch_response_completion___block_invoke_25(uint64_t a1, int a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(void *)(a1 + 32) + 232), &state);
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  uint64_t v6 = (id)qword_26AB04788;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    double v11 = *(double *)(a1 + 56);
    uint64_t v12 = [*(id *)(a1 + 40) index];
    id v13 = "NO";
    *(_DWORD *)buf = 134218498;
    double v21 = Current - v11;
    if (a2) {
      id v13 = "YES";
    }
    __int16 v22 = 2048;
    uint64_t v23 = v12;
    __int16 v24 = 2080;
    uint64_t v25 = v13;
    _os_log_debug_impl(&dword_21C7C9000, v6, OS_LOG_TYPE_DEBUG, "Delegate callout complete after %.02f seconds: -syncSession:applyChanges:completion:, chunkIndex = %llu, success = %s", buf, 0x20u);
  }

  uint64_t v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__SYReceivingSession__handleSyncBatch_response_completion___block_invoke_26;
  block[3] = &unk_264423CF8;
  id v8 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  char v18 = a2;
  id v15 = v8;
  id v16 = v5;
  id v17 = *(id *)(a1 + 48);
  id v9 = v5;
  dispatch_async(v7, block);

  os_activity_scope_leave(&state);
}

void __59__SYReceivingSession__handleSyncBatch_response_completion___block_invoke_26(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v18.opaque[0] = 0;
  v18.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(void *)(a1 + 32) + 232), &v18);
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  id v2 = (id)qword_26AB04788;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = *(void **)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) index];
    int v5 = *(unsigned __int8 *)(a1 + 64);
    *(_DWORD *)buf = 138543874;
    if (v5) {
      uint64_t v6 = "YES";
    }
    else {
      uint64_t v6 = "NO";
    }
    double v20 = v3;
    __int16 v21 = 2048;
    uint64_t v22 = v4;
    __int16 v23 = 2080;
    __int16 v24 = v6;
    _os_log_impl(&dword_21C7C9000, v2, OS_LOG_TYPE_INFO, "%{public}@: Building response for processed changes, chunkIndex = %llu, success = %s", buf, 0x20u);
  }

  if (*(unsigned char *)(a1 + 64))
  {
    if ([*(id *)(a1 + 32) state] != 12)
    {
      [*(id *)(a1 + 32) setState:1];
      goto LABEL_22;
    }
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    uint64_t v7 = (id)qword_26AB04788;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [*(id *)(a1 + 32) error];
      id v9 = _SYObfuscate(v8);
      *(_DWORD *)buf = 138543362;
      double v20 = v9;
      _os_log_impl(&dword_21C7C9000, v7, OS_LOG_TYPE_DEFAULT, "Detected error that occurred while waiting, attaching to batch response. Error = %{public}@", buf, 0xCu);
    }
    id v10 = [SYErrorInfo alloc];
    double v11 = [*(id *)(a1 + 32) error];
    uint64_t v12 = [(SYErrorInfo *)v10 initWithError:v11];
    [*(id *)(a1 + 40) setError:v12];
  }
  else
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v13 = (id)qword_26AB04788;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = _SYObfuscate(*(void **)(a1 + 48));
      *(_DWORD *)buf = 138543362;
      double v20 = v14;
      _os_log_impl(&dword_21C7C9000, v13, OS_LOG_TYPE_DEFAULT, "Failed to process sync batch, returning error: %{public}@", buf, 0xCu);
    }
    double v11 = [[SYErrorInfo alloc] initWithError:*(void *)(a1 + 48)];
    [*(id *)(a1 + 40) setError:v11];
  }

  [*(id *)(a1 + 32) _midStreamErrorHandled];
LABEL_22:
  uint64_t v15 = *(void *)(a1 + 56);
  uint64_t v16 = *(void *)(a1 + 40);
  id v17 = [*(id *)(a1 + 32) wrappedUserContext];
  (*(void (**)(uint64_t, uint64_t, void *))(v15 + 16))(v15, v16, v17);

  os_activity_scope_leave(&v18);
}

- (void)_handleRestartSession:(id)a3 response:(id)a4 completion:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_sessionActivity, &state);
  double v11 = [v8 sessionID];
  [v9 setSessionID:v11];

  if ([(SYReceivingSession *)self isResetSync] && [(SYReceivingSession *)self canRestart])
  {
    uint64_t v12 = [(SYSession *)self targetQueue];
    id v13 = block;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__SYReceivingSession__handleRestartSession_response_completion___block_invoke;
    block[3] = &unk_264423CD0;
    void block[4] = v9;
    void block[5] = self;
    id v22 = v10;
    dispatch_async(v12, block);

LABEL_7:
    uint64_t v15 = (void *)v13[4];
    goto LABEL_13;
  }
  if (![(SYReceivingSession *)self isResetSync] && [(SYReceivingSession *)self canRollback])
  {
    id v14 = [(SYSession *)self targetQueue];
    id v13 = v19;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __64__SYReceivingSession__handleRestartSession_response_completion___block_invoke_28;
    v19[3] = &unk_264423CD0;
    v19[4] = v9;
    v19[5] = self;
    id v20 = v10;
    dispatch_async(v14, v19);

    goto LABEL_7;
  }
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:2008 userInfo:0];
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  uint64_t v16 = qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v25 = v15;
    _os_log_impl(&dword_21C7C9000, v16, OS_LOG_TYPE_DEFAULT, "Rejecting restart request: %@", buf, 0xCu);
  }
  [v9 setAccepted:0];
  id v17 = [[SYErrorInfo alloc] initWithError:v15];
  [v9 setError:v17];

  os_activity_scope_state_s v18 = [(SYSession *)self wrappedUserContext];
  (*((void (**)(id, id, void *))v10 + 2))(v10, v9, v18);

LABEL_13:
  os_activity_scope_leave(&state);
}

void __64__SYReceivingSession__handleRestartSession_response_completion___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  id v2 = qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C7C9000, v2, OS_LOG_TYPE_INFO, "Delegate: -syncSession:resetDataStoreWithError: (restart session)", buf, 2u);
  }
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v4 = [*(id *)(a1 + 40) delegate];
  uint64_t v5 = *(void *)(a1 + 40);
  id v22 = 0;
  uint64_t v6 = [v4 syncSession:v5 resetDataStoreWithError:&v22];
  id v7 = v22;
  [*(id *)(a1 + 32) setAccepted:v6];

  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  id v8 = (void *)qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_INFO))
  {
    id v9 = v8;
    CFAbsoluteTime v10 = CFAbsoluteTimeGetCurrent();
    *(_DWORD *)buf = 134217984;
    double v24 = v10 - Current;
    _os_log_impl(&dword_21C7C9000, v9, OS_LOG_TYPE_INFO, "Delegate callout complete after %.02f seconds: -syncSession:resetDataStoreWithError: (restart session)", buf, 0xCu);
  }
  if (v7)
  {
    double v11 = [[SYErrorInfo alloc] initWithError:v7];
    [*(id *)(a1 + 32) setError:v11];
  }
  uint64_t v12 = [*(id *)(a1 + 40) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__SYReceivingSession__handleRestartSession_response_completion___block_invoke_27;
  block[3] = &unk_264422CB8;
  id v13 = *(id *)(a1 + 32);
  uint64_t v14 = *(void *)(a1 + 40);
  uint64_t v15 = *(void **)(a1 + 48);
  id v18 = v13;
  uint64_t v19 = v14;
  id v20 = v7;
  id v21 = v15;
  id v16 = v7;
  dispatch_async(v12, block);
}

void __64__SYReceivingSession__handleRestartSession_response_completion___block_invoke_27(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) accepted])
  {
    [*(id *)(a1 + 40) setState:4];
  }
  else
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v2 = qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 48);
      int v7 = 138412290;
      uint64_t v8 = v3;
      _os_log_impl(&dword_21C7C9000, v2, OS_LOG_TYPE_DEFAULT, "Client rejected reset session restart: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = [*(id *)(a1 + 40) wrappedUserContext];
  (*(void (**)(uint64_t, uint64_t, void *))(v4 + 16))(v4, v5, v6);
}

void __64__SYReceivingSession__handleRestartSession_response_completion___block_invoke_28(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  id v2 = qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C7C9000, v2, OS_LOG_TYPE_INFO, "Delegate: -syncSession:rollbackChangesWithError: (restart session)", buf, 2u);
  }
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v4 = [*(id *)(a1 + 40) delegate];
  uint64_t v5 = *(void *)(a1 + 40);
  id v22 = 0;
  uint64_t v6 = [v4 syncSession:v5 rollbackChangesWithError:&v22];
  id v7 = v22;
  [*(id *)(a1 + 32) setAccepted:v6];

  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  uint64_t v8 = (void *)qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = v8;
    CFAbsoluteTime v10 = CFAbsoluteTimeGetCurrent();
    *(_DWORD *)buf = 134217984;
    double v24 = v10 - Current;
    _os_log_impl(&dword_21C7C9000, v9, OS_LOG_TYPE_INFO, "Delegate callout complete after %.02f seconds: -syncSession:rollbackChangesWithError: (restart session)", buf, 0xCu);
  }
  if (v7)
  {
    double v11 = [[SYErrorInfo alloc] initWithError:v7];
    [*(id *)(a1 + 32) setError:v11];
  }
  uint64_t v12 = [*(id *)(a1 + 40) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__SYReceivingSession__handleRestartSession_response_completion___block_invoke_29;
  block[3] = &unk_264422CB8;
  id v13 = *(id *)(a1 + 32);
  uint64_t v14 = *(void *)(a1 + 40);
  uint64_t v15 = *(void **)(a1 + 48);
  id v18 = v13;
  uint64_t v19 = v14;
  id v20 = v7;
  id v21 = v15;
  id v16 = v7;
  dispatch_async(v12, block);
}

void __64__SYReceivingSession__handleRestartSession_response_completion___block_invoke_29(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) accepted])
  {
    [*(id *)(a1 + 40) setState:4];
  }
  else
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v2 = qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 48);
      int v7 = 138412290;
      uint64_t v8 = v3;
      _os_log_impl(&dword_21C7C9000, v2, OS_LOG_TYPE_DEFAULT, "Client rejected delta session rollback: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = [*(id *)(a1 + 40) wrappedUserContext];
  (*(void (**)(uint64_t, uint64_t, void *))(v4 + 16))(v4, v5, v6);
}

- (void)_handleEndSession:(id)a3 response:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_sessionActivity, &state);
  double v11 = [v8 sessionID];
  [v9 setSessionID:v11];

  uint64_t v12 = [(SYSession *)self queue];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __60__SYReceivingSession__handleEndSession_response_completion___block_invoke;
  v16[3] = &unk_264422CB8;
  id v17 = v8;
  id v18 = self;
  id v19 = v9;
  id v20 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(v12, v16);

  os_activity_scope_leave(&state);
}

void __60__SYReceivingSession__handleEndSession_response_completion___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  uint64_t v34 = 0;
  v35[0] = &v34;
  v35[1] = 0x3032000000;
  v35[2] = __Block_byref_object_copy__11;
  v35[3] = __Block_byref_object_dispose__11;
  id v36 = 0;
  if ([*(id *)(a1 + 32) hasRollback]
    && [*(id *)(a1 + 32) rollback])
  {
    if ([*(id *)(a1 + 40) canRollback])
    {
      id v2 = [*(id *)(a1 + 40) targetQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __60__SYReceivingSession__handleEndSession_response_completion___block_invoke_2;
      block[3] = &unk_264423BE0;
      id v3 = *(id *)(a1 + 48);
      uint64_t v4 = *(void *)(a1 + 40);
      id v31 = v3;
      uint64_t v32 = v4;
      id v33 = &v34;
      dispatch_sync(v2, block);

      uint64_t v5 = v31;
    }
    else
    {
      [*(id *)(a1 + 48) setDidRollback:0];
      uint64_t v13 = [objc_alloc(MEMORY[0x263F087E8]) initWithSYError:2008 userInfo:0];
      uint64_t v5 = *(void **)(v35[0] + 40);
      *(void *)(v35[0] + 40) = v13;
    }

    id v14 = [*(id *)(a1 + 48) error];
    BOOL v15 = v14 == 0;

    if (!v15)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      id v10 = qword_26AB04788;
      if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = *(void *)(v35[0] + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v38 = v16;
        uint64_t v12 = "Error rolling back at end session: %@";
        goto LABEL_16;
      }
    }
  }
  else if ([*(id *)(a1 + 32) hasError])
  {
    uint64_t v6 = (void *)MEMORY[0x263F087E8];
    int v7 = [*(id *)(a1 + 32) error];
    uint64_t v8 = [v6 errorFromSYErrorInfo:v7];
    id v9 = *(void **)(v35[0] + 40);
    *(void *)(v35[0] + 40) = v8;

    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v10 = qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(v35[0] + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v38 = v11;
      uint64_t v12 = "Ending session with error from Master: %@";
LABEL_16:
      _os_log_impl(&dword_21C7C9000, v10, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);
    }
  }
  if (!*(void *)(v35[0] + 40) && [*(id *)(a1 + 40) _isMissingSyncBatches])
  {
    uint64_t v17 = [objc_alloc(MEMORY[0x263F087E8]) initWithSYError:2012 userInfo:0];
    id v18 = *(void **)(v35[0] + 40);
    *(void *)(v35[0] + 40) = v17;

    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v19 = qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, (os_log_type_t)0x90u)) {
      __60__SYReceivingSession__handleEndSession_response_completion___block_invoke_cold_1((uint64_t)v35, v19);
    }
  }
  id v20 = *(void **)(v35[0] + 40);
  if (v20)
  {
    id v21 = [v20 domain];
    if ([v21 isEqualToString:@"SYErrorDomain"])
    {
      BOOL v22 = [*(id *)(v35[0] + 40) code] == -128;

      if (v22)
      {
        __int16 v23 = (id *)(a1 + 40);
        [*(id *)(a1 + 40) _setCancelled];
        uint64_t v24 = 3;
        goto LABEL_30;
      }
    }
    else
    {
    }
    __int16 v23 = (id *)(a1 + 40);
    [*(id *)(a1 + 40) setError:*(void *)(v35[0] + 40)];
    uint64_t v24 = 5;
  }
  else
  {
    __int16 v23 = (id *)(a1 + 40);
    uint64_t v24 = 9;
  }
LABEL_30:
  [*v23 setState:v24];
  if (*(void *)(v35[0] + 40))
  {
    uint64_t v25 = [SYErrorInfo alloc];
    uint64_t v26 = [(SYErrorInfo *)v25 initWithError:*(void *)(v35[0] + 40)];
    [*(id *)(a1 + 48) setError:v26];
  }
  uint64_t v28 = *(void *)(a1 + 48);
  uint64_t v27 = *(void *)(a1 + 56);
  id v29 = [*(id *)(a1 + 40) wrappedUserContext];
  (*(void (**)(uint64_t, uint64_t, void *))(v27 + 16))(v27, v28, v29);

  _Block_object_dispose(&v34, 8);
}

void __60__SYReceivingSession__handleEndSession_response_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  id v2 = qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C7C9000, v2, OS_LOG_TYPE_INFO, "Delegate: -syncSession:rollbackChangesWithError: (session end)", buf, 2u);
  }
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v4 = [*(id *)(a1 + 40) delegate];
  uint64_t v5 = *(void *)(a1 + 40);
  id v12 = 0;
  uint64_t v6 = [v4 syncSession:v5 rollbackChangesWithError:&v12];
  id v7 = v12;
  id v8 = v12;
  [*(id *)(a1 + 32) setDidRollback:v6];

  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  id v9 = (void *)qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_INFO))
  {
    id v10 = v9;
    CFAbsoluteTime v11 = CFAbsoluteTimeGetCurrent();
    *(_DWORD *)buf = 134217984;
    double v14 = v11 - Current;
    _os_log_impl(&dword_21C7C9000, v10, OS_LOG_TYPE_INFO, "Delegate callout complete after %.02f seconds: -syncSession:rollbackChangesWithError: (session end)", buf, 0xCu);
  }
  if (v8) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v7);
  }
}

- (BOOL)_handleStartSessionResponse:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)_handleSyncBatchResponse:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)_handleRestartSessionResponse:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)_handleEndSessionResponse:(id)a3 error:(id *)a4
{
  return 0;
}

- (void)_continue
{
  unsigned int v3 = [(SYReceivingSession *)self state];
  if (v3 > 0xC || ((1 << v3) & 0x1C20) == 0)
  {
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:2021 userInfo:0];
    [(SYSession *)self setError:v5];

    [(SYReceivingSession *)self setState:5];
  }
  v6.receiver = self;
  v6.super_class = (Class)SYReceivingSession;
  [(SYSession *)&v6 _continue];
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_weakBlockWaitingForReset);
  objc_storeStrong((id *)&self->_asyncResetGroupToWaitOn, 0);
  objc_storeStrong((id *)&self->_sessionActivity, 0);
  objc_storeStrong((id *)&self->_receivedBatchIndices, 0);
  objc_storeStrong((id *)&self->_sessionTimer, 0);
  objc_storeStrong((id *)&self->_stateUpdateSource, 0);
}

void __36__SYReceivingSession__installTimers__block_invoke_10_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21C7C9000, log, OS_LOG_TYPE_DEBUG, "Timeout while waiting for client to apply changes. Setting state to SYSessionStateErrorOccurredWhileWaitingForCompletion.", v1, 2u);
}

- (void)_postAsyncResetRequestReturningError:(uint8_t *)buf .cold.1(char a1, __CFString *a2, uint8_t *buf, os_log_t log)
{
  uint64_t v5 = "YES";
  if (!a1) {
    uint64_t v5 = "NO";
  }
  objc_super v6 = @"(nil)";
  if (a2) {
    objc_super v6 = a2;
  }
  *(_DWORD *)buf = 136315394;
  *(void *)(buf + 4) = v5;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = v6;
  _os_log_debug_impl(&dword_21C7C9000, log, OS_LOG_TYPE_DEBUG, "Sent async reset-data message to delegate. Will continue = %s, error = %{public}@", buf, 0x16u);
}

- (void)_handleSyncBatch:(uint8_t *)buf response:(int)a2 completion:(os_log_t)log .cold.1(uint8_t *buf, int a2, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = a2;
  _os_log_debug_impl(&dword_21C7C9000, log, OS_LOG_TYPE_DEBUG, "Batch incoming, state == %{companionsync:SYSessionState}d", buf, 8u);
}

- (void)_handleSyncBatch:(uint8_t *)buf response:(uint64_t)a2 completion:(os_log_t)log .cold.2(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134217984;
  *(void *)(buf + 4) = a2;
  _os_log_debug_impl(&dword_21C7C9000, log, OS_LOG_TYPE_DEBUG, "Received incoming batch %llu", buf, 0xCu);
}

void __59__SYReceivingSession__handleSyncBatch_response_completion___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = *(void **)(a1 + 32);
  unsigned int v3 = a2;
  int v4 = 134217984;
  uint64_t v5 = [v2 index];
  _os_log_debug_impl(&dword_21C7C9000, v3, OS_LOG_TYPE_DEBUG, "Processing incoming batch %llu", (uint8_t *)&v4, 0xCu);
}

void __60__SYReceivingSession__handleEndSession_response_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_21C7C9000, a2, (os_log_type_t)0x90u, "End session arrived and I have missing sync batches: %@", (uint8_t *)&v3, 0xCu);
}

@end