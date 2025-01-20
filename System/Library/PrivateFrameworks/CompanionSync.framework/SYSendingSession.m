@interface SYSendingSession
- (BOOL)_handleEndSessionResponse:(id)a3 error:(id *)a4;
- (BOOL)_handleRestartSessionResponse:(id)a3 error:(id *)a4;
- (BOOL)_handleStartSessionResponse:(id)a3 error:(id *)a4;
- (BOOL)_handleSyncBatchResponse:(id)a3 error:(id *)a4;
- (BOOL)_hasSentEnd;
- (BOOL)_localErrorOccurred;
- (BOOL)canRestart;
- (BOOL)canRollback;
- (BOOL)isResetSync;
- (BOOL)isSending;
- (BOOL)wasCancelled;
- (SYSendingSession)initWithService:(id)a3 isReset:(BOOL)a4;
- (double)remainingSessionTime;
- (id)_newMessageHeader;
- (unsigned)state;
- (void)_confirmedEnd;
- (void)_confirmedStart;
- (void)_continue;
- (void)_fetchNextBatch;
- (void)_installStateListener;
- (void)_installTimers;
- (void)_notifyErrorAndShutdown;
- (void)_peerProcessedMessageWithIdentifier:(id)a3 userInfo:(id)a4;
- (void)_processNextState;
- (void)_resolvedIdentifierForRequest:(id)a3;
- (void)_sendEndSessionAndError:(id)a3;
- (void)_sendSyncBatch:(id)a3 nextState:(unsigned int)a4;
- (void)_sendSyncCancelled;
- (void)_sendSyncCompleteAndRunBlock:(id)a3;
- (void)_sendSyncRestart;
- (void)_sentEnd;
- (void)_sentMessageWithIdentifier:(id)a3 userInfo:(id)a4;
- (void)_sentStart;
- (void)_sessionFinished;
- (void)_setCancelled;
- (void)_setComplete;
- (void)_setLocalErrorOccurred;
- (void)_setMessageTimer;
- (void)_setStateQuietly:(unsigned int)a3;
- (void)_setupChangeConcurrency;
- (void)_startFailedForStateChangeWithError:(id)a3;
- (void)_tweakMessageHeader:(id)a3;
- (void)_waitForMessageWindow;
- (void)cancelWithError:(id)a3;
- (void)setCanRestart:(BOOL)a3;
- (void)setCanRollback:(BOOL)a3;
- (void)setState:(unsigned int)a3;
- (void)start:(id)a3;
@end

@implementation SYSendingSession

- (SYSendingSession)initWithService:(id)a3 isReset:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v28.receiver = self;
  v28.super_class = (Class)SYSendingSession;
  v7 = [(SYSession *)&v28 initWithService:v6];
  v8 = v7;
  if (v7)
  {
    v7->_flagsLock._os_unfair_lock_opaque = 0;
    v9 = [v6 serviceActivity];
    os_activity_t v10 = _os_activity_create(&dword_21C7C9000, "SYSession (Outgoing)", v9, OS_ACTIVITY_FLAG_DEFAULT);

    sessionActivity = v8->_sessionActivity;
    v8->_sessionActivity = (OS_os_activity *)v10;

    if (v4) {
      __int16 v12 = 64;
    }
    else {
      __int16 v12 = 0;
    }
    *(_WORD *)&v8->_flags = *(_WORD *)&v8->_flags & 0xFF80 | v12;
    v13 = _SessionIdentifierDateFormatter();
    v14 = objc_opt_new();
    v15 = [v13 stringFromDate:v14];

    [(SYSession *)v8 setIdentifier:v15];
    uint64_t v16 = objc_opt_new();
    ackedBatchIndices = v8->_ackedBatchIndices;
    v8->_ackedBatchIndices = (NSMutableIndexSet *)v16;

    uint64_t v18 = objc_opt_new();
    batchMessageIDs = v8->_batchMessageIDs;
    v8->_batchMessageIDs = (NSMutableArray *)v18;

    v20 = [v6 name];
    v21 = [v20 lastPathComponent];
    v22 = [v21 stringByAppendingString:@" Change Enqueuer"];

    id v23 = v22;
    dispatch_queue_t v24 = dispatch_queue_create((const char *)[v23 UTF8String], 0);
    changeFetcherQueue = v8->_changeFetcherQueue;
    v8->_changeFetcherQueue = (OS_dispatch_queue *)v24;

    v26 = v8;
  }

  return v8;
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
  id v6 = qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = *(_WORD *)&self->_flags & 0xF;
    *(_DWORD *)buf = 138543874;
    __int16 v12 = self;
    __int16 v13 = 1024;
    int v14 = v7;
    __int16 v15 = 1024;
    unsigned int v16 = a3;
    _os_log_impl(&dword_21C7C9000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Setting state from %{companionsync:SYSessionState}d to %{companionsync:SYSessionState}d", buf, 0x18u);
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
    v9 = qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C7C9000, v9, OS_LOG_TYPE_DEFAULT, "State change notification source is nil!", buf, 2u);
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
  v5 = qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = *(_WORD *)&self->_flags & 0xF;
    *(_DWORD *)buf = 138543874;
    v9 = self;
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
  return 1;
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

- (void)_sentStart
{
  [(SYSession *)self didStartSession];
  [(SYSendingSession *)self _setupChangeConcurrency];
  os_unfair_lock_lock(&self->_flagsLock);
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_flagsLock);
}

- (void)_confirmedStart
{
  p_flagsLock = &self->_flagsLock;
  os_unfair_lock_lock(&self->_flagsLock);
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(p_flagsLock);
}

- (void)_sentEnd
{
  p_flagsLock = &self->_flagsLock;
  os_unfair_lock_lock(&self->_flagsLock);
  *(_WORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(p_flagsLock);
}

- (BOOL)_hasSentEnd
{
  v2 = self;
  p_flagsLock = &self->_flagsLock;
  os_unfair_lock_lock(&self->_flagsLock);
  LODWORD(v2) = (*(_WORD *)&v2->_flags >> 12) & 1;
  os_unfair_lock_unlock(p_flagsLock);
  return (char)v2;
}

- (void)_confirmedEnd
{
  p_flagsLock = &self->_flagsLock;
  os_unfair_lock_lock(&self->_flagsLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(p_flagsLock);
}

- (void)_setCancelled
{
  p_flagsLock = &self->_flagsLock;
  os_unfair_lock_lock(&self->_flagsLock);
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_flagsLock);
}

- (void)_setComplete
{
  p_flagsLock = &self->_flagsLock;
  os_unfair_lock_lock(&self->_flagsLock);
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(p_flagsLock);
}

- (void)_setLocalErrorOccurred
{
  p_flagsLock = &self->_flagsLock;
  os_unfair_lock_lock(&self->_flagsLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(p_flagsLock);
}

- (BOOL)_localErrorOccurred
{
  v2 = self;
  p_flagsLock = &self->_flagsLock;
  os_unfair_lock_lock(&self->_flagsLock);
  LODWORD(v2) = (*(_WORD *)&v2->_flags >> 14) & 1;
  os_unfair_lock_unlock(p_flagsLock);
  return (char)v2;
}

- (id)_newMessageHeader
{
  double v3 = [(SYSession *)self service];
  BOOL v4 = (void *)[v3 _newMessageHeader];

  [(SYSendingSession *)self _tweakMessageHeader:v4];
  return v4;
}

- (void)_tweakMessageHeader:(id)a3
{
  id v9 = a3;
  [(SYSession *)self perMessageTimeout];
  if (v4 == 0.0)
  {
    v5 = [MEMORY[0x263EFF910] distantFuture];
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

- (void)_setupChangeConcurrency
{
  if ([(SYSession *)self maxConcurrentMessages])
  {
    if (([(SYSession *)self maxConcurrentMessages] & 0x8000000000000000) == 0)
    {
      double v3 = [(SYSession *)self service];
      double v4 = [v3 syncEngine];
      char v5 = [v4 buffersSessions];

      if ((v5 & 1) == 0)
      {
        __int16 v6 = [[_SYCountedSemaphore alloc] initWithCount:[(SYSession *)self maxConcurrentMessages]];
        changeConcurrencySemaphore = self->_changeConcurrencySemaphore;
        self->_changeConcurrencySemaphore = v6;

        double v8 = (OS_os_activity *)_os_activity_create(&dword_21C7C9000, "Change Concurrency Wait", (os_activity_t)self->_sessionActivity, OS_ACTIVITY_FLAG_DEFAULT);
        changeWaitActivity = self->_changeWaitActivity;
        self->_changeWaitActivity = v8;
        MEMORY[0x270F9A758](v8, changeWaitActivity);
      }
    }
  }
}

- (void)_waitForMessageWindow
{
  if (self->_changeConcurrencySemaphore)
  {
    changeFetcherQueue = self->_changeFetcherQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __41__SYSendingSession__waitForMessageWindow__block_invoke;
    block[3] = &unk_264422AB0;
    block[4] = self;
    dispatch_async(changeFetcherQueue, block);
  }
  else
  {
    [(SYSendingSession *)self _fetchNextBatch];
  }
}

void __41__SYSendingSession__waitForMessageWindow__block_invoke(uint64_t a1)
{
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(void *)(a1 + 32) + 248), &state);
  [*(id *)(a1 + 32) perMessageTimeout];
  if (v2 == 0.0)
  {
    double v3 = [*(id *)(a1 + 32) service];
    [v3 defaultMessageTimeout];
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  double v4 = qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEBUG)) {
    __41__SYSendingSession__waitForMessageWindow__block_invoke_cold_2(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  __int16 v12 = *(void **)(a1 + 32);
  unsigned int v13 = (void *)v12[30];
  [v12 perMessageTimeout];
  if ([v13 waitWithTimeout:v14 + v14])
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    __int16 v15 = qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEBUG)) {
      __41__SYSendingSession__waitForMessageWindow__block_invoke_cold_1(v15, v16, v17, v18, v19, v20, v21, v22);
    }
    v26.opaque[0] = 0;
    v26.opaque[1] = 0;
    os_activity_scope_enter(*(os_activity_t *)(*(void *)(a1 + 32) + 272), &v26);
    id v23 = [*(id *)(a1 + 32) queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __41__SYSendingSession__waitForMessageWindow__block_invoke_4;
    block[3] = &unk_264422AB0;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(v23, block);

    os_activity_scope_leave(&v26);
  }
  else
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    dispatch_queue_t v24 = qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26.opaque[0]) = 0;
      _os_log_impl(&dword_21C7C9000, v24, OS_LOG_TYPE_DEFAULT, "Wait for change slot ended, semaphore cancelled or wait timed out", (uint8_t *)&v26, 2u);
    }
  }
  os_activity_scope_leave(&state);
}

uint64_t __41__SYSendingSession__waitForMessageWindow__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchNextBatch];
}

- (void)_fetchNextBatch
{
  double v3 = [(SYSession *)self queue];
  dispatch_assert_queue_V2(v3);

  if (![(SYSendingSession *)self _hasSentEnd])
  {
    double v4 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:10];
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263EFF9C0]) initWithCapacity:10];
    v42[0] = 0;
    v42[1] = v42;
    v42[2] = 0x2020000000;
    v42[3] = 0;
    uint64_t v6 = [(SYSession *)self service];
    uint64_t v7 = [v6 sendingBufferCap];

    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __35__SYSendingSession__fetchNextBatch__block_invoke;
    v37[3] = &unk_264423A70;
    v37[4] = self;
    v40 = v42;
    uint64_t v41 = v7;
    id v8 = v4;
    id v38 = v8;
    id v9 = v5;
    id v39 = v9;
    uint64_t v10 = (void *)MEMORY[0x21D4B17C0](v37);
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__8;
    v35 = __Block_byref_object_dispose__8;
    id v36 = 0;
    uint64_t v27 = 0;
    objc_super v28 = &v27;
    uint64_t v29 = 0x2020000000;
    int v30 = 1;
    uint64_t v11 = [(SYSession *)self targetQueue];
    uint64_t v18 = MEMORY[0x263EF8330];
    uint64_t v19 = 3221225472;
    uint64_t v20 = __35__SYSendingSession__fetchNextBatch__block_invoke_9;
    uint64_t v21 = &unk_264423A98;
    v25 = &v27;
    uint64_t v22 = self;
    id v12 = v10;
    id v24 = v12;
    id v13 = v8;
    id v23 = v13;
    os_activity_scope_state_s v26 = &v31;
    dispatch_sync(v11, &v18);

    uint64_t v14 = *((unsigned int *)v28 + 6);
    if ((v14 - 1) >= 2)
    {
      if (v14 == 5)
      {
        -[SYSession setError:](self, "setError:", v32[5], v18, v19, v20, v21, v22);
        [(SYSendingSession *)self _setLocalErrorOccurred];
        [(_SYCountedSemaphore *)self->_changeConcurrencySemaphore signal];
        uint64_t v14 = *((unsigned int *)v28 + 6);
      }
      -[SYSendingSession setState:](self, "setState:", v14, v18, v19, v20, v21, v22);
    }
    else
    {
      __int16 v15 = objc_msgSend(v9, "copy", v18, v19, v20, v21, v22);
      batchObjectIDsByBatchIndex = self->_batchObjectIDsByBatchIndex;
      uint64_t v17 = [NSNumber numberWithUnsignedLongLong:self->_batchIndex];
      [(NSMutableDictionary *)batchObjectIDsByBatchIndex setObject:v15 forKeyedSubscript:v17];

      [(SYSendingSession *)self _sendSyncBatch:v13 nextState:*((unsigned int *)v28 + 6)];
    }

    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&v31, 8);

    _Block_object_dispose(v42, 8);
  }
}

uint64_t __35__SYSendingSession__fetchNextBatch__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(void *)(a1 + 32) + 272), &v10);
  double v4 = +[SYChange changeWithChangeObject:v3 serializer:*(void *)(a1 + 32)];
  uint64_t v5 = [v4 data];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += [v5 length];

  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) >= *(void *)(a1 + 64)
    && [*(id *)(a1 + 40) count])
  {
    uint64_t v6 = 0;
  }
  else
  {
    [*(id *)(a1 + 40) addObject:v4];
    uint64_t v7 = *(void **)(a1 + 48);
    id v8 = [v3 objectIdentifier];
    [v7 addObject:v8];

    uint64_t v6 = 1;
  }

  os_activity_scope_leave(&v10);
  return v6;
}

void __35__SYSendingSession__fetchNextBatch__block_invoke_9(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  double v2 = qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C7C9000, v2, OS_LOG_TYPE_INFO, "Delegate: -syncSession:enqueueChanges:error:", buf, 2u);
  }
  double Current = CFAbsoluteTimeGetCurrent();
  double v4 = [*(id *)(a1 + 32) delegate];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);
  id v15 = 0;
  int v7 = [v4 syncSession:v5 enqueueChanges:v6 error:&v15];
  id v8 = v15;
  id v9 = v15;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v7;

  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  os_activity_scope_state_s v10 = (void *)qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = v10;
    CFAbsoluteTime v12 = CFAbsoluteTimeGetCurrent() - Current;
    int v13 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    uint64_t v14 = [*(id *)(a1 + 40) count];
    *(_DWORD *)buf = 134218496;
    CFAbsoluteTime v17 = v12;
    __int16 v18 = 1024;
    int v19 = v13;
    __int16 v20 = 2048;
    uint64_t v21 = v14;
    _os_log_impl(&dword_21C7C9000, v11, OS_LOG_TYPE_INFO, "Delegate callout complete after %.02f seconds: -syncSession:enqueueChanges:error:, os_activity_scope_state_s state = %{companionsync:SYSessionState}d, %lu changes", buf, 0x1Cu);
  }
  if (v9) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v8);
  }
}

- (void)_sendSyncBatch:(id)a3 nextState:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = [(SYSession *)self queue];
  dispatch_assert_queue_V2(v7);

  if ([(SYSendingSession *)self _hasSentEnd])
  {
LABEL_9:
    [(_SYCountedSemaphore *)self->_changeConcurrencySemaphore signal];
    goto LABEL_10;
  }
  if (![v6 count])
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    CFAbsoluteTime v17 = qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v22 = v4;
      _os_log_impl(&dword_21C7C9000, v17, OS_LOG_TYPE_INFO, "No changes to send, setting next state %{companionsync:SYSessionState}d", buf, 8u);
    }
    [(SYSendingSession *)self setState:v4];
    goto LABEL_9;
  }
  id v8 = objc_opt_new();
  id v9 = [(SYSendingSession *)self _newMessageHeader];
  [v8 setHeader:v9];

  os_activity_scope_state_s v10 = [(SYSession *)self identifier];
  [v8 setSessionID:v10];

  ++self->_batchIndex;
  objc_msgSend(v8, "setIndex:");
  [v8 setChanges:v6];
  [(SYSendingSession *)self setState:8];
  uint64_t v11 = [(SYSession *)self service];
  CFAbsoluteTime v12 = [v11 syncEngine];
  int64_t v13 = [(SYSession *)self priority];
  uint64_t v14 = [(SYSession *)self combinedEngineOptions:0];
  id v15 = [(SYSession *)self wrappedUserContext];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __45__SYSendingSession__sendSyncBatch_nextState___block_invoke;
  v18[3] = &unk_264423AC0;
  v18[4] = self;
  id v19 = v8;
  int v20 = v4;
  id v16 = v8;
  [v12 enqueueSyncRequest:v16 withMessageID:103 priority:v13 options:v14 userContext:v15 callback:v18];

LABEL_10:
}

void __45__SYSendingSession__sendSyncBatch_nextState___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(void *)(a1 + 32) + 272), &state);
  id v9 = *(id **)(a1 + 32);
  if (a2)
  {
    id v16 = v8;
    id v10 = v9[39];
    objc_sync_enter(v10);
    if ([*(id *)(a1 + 40) index])
    {
      while (1)
      {
        unint64_t v11 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 312), "count", v16);
        if (v11 > [*(id *)(a1 + 40) index]) {
          break;
        }
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        CFAbsoluteTime v12 = qword_26AB04788;
        if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21C7C9000, v12, OS_LOG_TYPE_DEFAULT, "Filling in the batch message IDs array for some reason...", buf, 2u);
        }
        int64_t v13 = *(void **)(*(void *)(a1 + 32) + 312);
        id v14 = [[SYMessageStatusRecord alloc] initFiller];
        [v13 addObject:v14];
      }
    }
    id v15 = [[SYMessageStatusRecord alloc] initWithMessageID:v7];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 312), "setObject:atIndexedSubscript:", v15, objc_msgSend(*(id *)(a1 + 40), "index"));

    objc_sync_exit(v10);
    id v8 = v16;
    if ([*(id *)(a1 + 32) state] == 8) {
      [*(id *)(a1 + 32) setState:*(unsigned int *)(a1 + 48)];
    }
  }
  else
  {
    [v9 setError:v8];
    [*(id *)(a1 + 32) setState:5];
    [*(id *)(a1 + 32) _setLocalErrorOccurred];
    [*(id *)(*(void *)(a1 + 32) + 240) signal];
  }
  os_activity_scope_leave(&state);
}

- (void)_sendSyncCompleteAndRunBlock:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(SYSession *)self queue];
  dispatch_assert_queue_V2(v5);

  if (![(SYSendingSession *)self _hasSentEnd])
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v6 = qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEBUG)) {
      -[SYSendingSession _sendSyncCompleteAndRunBlock:](v6, v7, v8, v9, v10, v11, v12, v13);
    }
    id v14 = objc_opt_new();
    id v15 = [(SYSendingSession *)self _newMessageHeader];
    [v14 setHeader:v15];

    id v16 = [v14 header];
    if (v16)
    {
    }
    else
    {
      if (_RunningInXCTest_onceToken != -1) {
        dispatch_once(&_RunningInXCTest_onceToken, &__block_literal_global_6);
      }
      if (_RunningInXCTest___value)
      {
        v34 = [v14 header];

        if (!v34)
        {
          do
          {
            [MEMORY[0x263F08B88] sleepForTimeInterval:0.01];
            id v35 = [(SYSendingSession *)self _newMessageHeader];
            [v14 setHeader:v35];

            id v36 = [v14 header];
          }
          while (!v36);
        }
      }
    }
    CFAbsoluteTime v17 = [(SYSession *)self identifier];
    [v14 setSessionID:v17];

    uint64_t v18 = [(SYSession *)self error];
    if (v18)
    {
      id v19 = (void *)v18;
      BOOL v20 = [(SYSendingSession *)self _localErrorOccurred];

      if (v20)
      {
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        uint64_t v21 = (void *)qword_26AB04788;
        if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
        {
          int v22 = v21;
          uint64_t v23 = [(SYSession *)self error];
          *(_DWORD *)buf = 138412290;
          uint64_t v41 = v23;
          _os_log_impl(&dword_21C7C9000, v22, OS_LOG_TYPE_DEFAULT, "Attaching error to end-session: %@", buf, 0xCu);
        }
        id v24 = [SYErrorInfo alloc];
        v25 = [(SYSession *)self error];
        os_activity_scope_state_s v26 = [(SYErrorInfo *)v24 initWithError:v25];
        [v14 setError:v26];

        if ([(SYSendingSession *)self canRollback]) {
          [v14 setRollback:1];
        }
      }
    }
    uint64_t v27 = (void *)[v4 copy];

    unsigned int v28 = [(SYSendingSession *)self state];
    uint64_t v29 = [(SYSession *)self service];
    int v30 = [v29 syncEngine];
    int64_t v31 = [(SYSession *)self priority];
    v32 = [(SYSession *)self combinedEngineOptions:0];
    uint64_t v33 = [(SYSession *)self wrappedUserContext];
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __49__SYSendingSession__sendSyncCompleteAndRunBlock___block_invoke;
    v37[3] = &unk_264423AE8;
    v37[4] = self;
    unsigned int v39 = v28;
    id v4 = v27;
    id v38 = v4;
    [v30 enqueueSyncRequest:v14 withMessageID:105 priority:v31 options:v32 userContext:v33 callback:v37];

    [(SYSendingSession *)self _sentEnd];
  }
}

void __49__SYSendingSession__sendSyncCompleteAndRunBlock___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  v15.opaque[0] = 0;
  v15.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(void *)(a1 + 32) + 272), &v15);
  if (a2
    && (v9 = -[SYMessageStatusRecord initWithMessageID:]([SYMessageStatusRecord alloc], "initWithMessageID:", v7), uint64_t v10 = *(void *)(a1 + 32), v11 = *(void **)(v10 + 304), *(void *)(v10 + 304) = v9, v11, [*(id *)(a1 + 32) state] == *(_DWORD *)(a1 + 48)))
  {
    uint64_t v12 = 7;
  }
  else
  {
    if ([*(id *)(a1 + 32) state] != 2 || *(_DWORD *)(a1 + 48) != 2) {
      goto LABEL_11;
    }
    [*(id *)(a1 + 32) setError:v8];
    uint64_t v12 = 5;
  }
  [*(id *)(a1 + 32) setState:v12];
LABEL_11:
  if (*(void *)(a1 + 40))
  {
    id v14 = [*(id *)(a1 + 32) queue];
    dispatch_async(v14, *(dispatch_block_t *)(a1 + 40));
  }
  os_activity_scope_leave(&v15);
}

- (void)_sendSyncCancelled
{
  id v3 = [(SYSession *)self queue];
  dispatch_assert_queue_V2(v3);

  if (![(SYSendingSession *)self _hasSentEnd])
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:-128 userInfo:0];
    [(SYSession *)self setError:v4];
    uint64_t v5 = objc_opt_new();
    id v6 = [(SYSendingSession *)self _newMessageHeader];
    [v5 setHeader:v6];

    id v7 = [(SYSession *)self identifier];
    [v5 setSessionID:v7];

    id v8 = [[SYErrorInfo alloc] initWithError:v4];
    [v5 setError:v8];

    if ([(SYSendingSession *)self canRollback]) {
      [v5 setRollback:1];
    }
    uint64_t v9 = [(SYSession *)self service];
    uint64_t v10 = [v9 syncEngine];
    int64_t v11 = [(SYSession *)self priority];
    uint64_t v12 = [(SYSession *)self combinedEngineOptions:0];
    uint64_t v13 = [(SYSession *)self wrappedUserContext];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __38__SYSendingSession__sendSyncCancelled__block_invoke;
    v14[3] = &unk_264422E20;
    v14[4] = self;
    [v10 enqueueSyncRequest:v5 withMessageID:105 priority:v11 options:v12 userContext:v13 callback:v14];

    [(SYSendingSession *)self _sentEnd];
  }
}

void __38__SYSendingSession__sendSyncCancelled__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(void *)(a1 + 32) + 272), &state);
  id v8 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__SYSendingSession__sendSyncCancelled__block_invoke_2;
  block[3] = &unk_264422AB0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v8, block);

  os_activity_scope_leave(&state);
}

uint64_t __38__SYSendingSession__sendSyncCancelled__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sessionFinished];
}

- (void)_sendSyncRestart
{
  v17[1] = *MEMORY[0x263EF8340];
  id v3 = [(SYSession *)self queue];
  dispatch_assert_queue_V2(v3);

  if ([(SYSendingSession *)self canRestart])
  {
    id v4 = objc_opt_new();
    id v5 = [(SYSendingSession *)self _newMessageHeader];
    [v4 setHeader:v5];

    id v6 = [(SYSession *)self identifier];
    [v4 setSessionID:v6];

    id v7 = [(SYSession *)self service];
    id v8 = [v7 syncEngine];
    int64_t v9 = [(SYSession *)self priority];
    uint64_t v10 = [(SYSession *)self combinedEngineOptions:0];
    int64_t v11 = [(SYSession *)self wrappedUserContext];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __36__SYSendingSession__sendSyncRestart__block_invoke;
    v15[3] = &unk_264422E20;
    v15[4] = self;
    [v8 enqueueSyncRequest:v4 withMessageID:104 priority:v9 options:v10 userContext:v11 callback:v15];
  }
  else
  {
    id v12 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v16 = *MEMORY[0x263F08320];
    v17[0] = @"This session does not support being restarted.";
    uint64_t v13 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
    id v14 = (void *)[v12 initWithSYError:2008 userInfo:v13];
    [(SYSession *)self setError:v14];

    [(SYSendingSession *)self setState:5];
    [(SYSendingSession *)self _setLocalErrorOccurred];
  }
}

void __36__SYSendingSession__sendSyncRestart__block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  v16.opaque[0] = 0;
  v16.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(void *)(a1 + 32) + 272), &v16);
  if (a2
    && (v9 = -[SYMessageStatusRecord initWithMessageID:]([SYMessageStatusRecord alloc], "initWithMessageID:", v7), uint64_t v10 = *(void *)(a1 + 32), v11 = *(void **)(v10 + 296), *(void *)(v10 + 296) = v9, v11, [*(id *)(a1 + 32) state] == 4))
  {
    *(void *)(*(void *)(a1 + 32) + 256) = 0;
    id v12 = [*(id *)(a1 + 32) service];
    uint64_t v13 = [v12 syncEngine];
    int v14 = [v13 buffersSessions];

    if (v14) {
      uint64_t v15 = 1;
    }
    else {
      uint64_t v15 = 6;
    }
  }
  else
  {
    [*(id *)(a1 + 32) setError:v8];
    uint64_t v15 = 5;
  }
  [*(id *)(a1 + 32) setState:v15];
  os_activity_scope_leave(&v16);
}

- (void)_sendEndSessionAndError:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(SYSession *)self queue];
  dispatch_assert_queue_V2(v5);

  [(_SYCountedSemaphore *)self->_changeConcurrencySemaphore invalidate];
  if (self->_sessionTimer)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v6 = (void *)qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v6;
      id v8 = _SYObfuscate(self);
      *(_DWORD *)buf = 138543362;
      BOOL v20 = v8;
      _os_log_impl(&dword_21C7C9000, v7, OS_LOG_TYPE_DEFAULT, "Cancelling session timer for %{public}@", buf, 0xCu);
    }
    dispatch_source_cancel((dispatch_source_t)self->_sessionTimer);
    sessionTimer = self->_sessionTimer;
    self->_sessionTimer = 0;
  }
  [(SYSendingSession *)self _setComplete];
  uint64_t v10 = [(SYSession *)self targetQueue];
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __44__SYSendingSession__sendEndSessionAndError___block_invoke;
  os_activity_scope_state_s v16 = &unk_264422990;
  CFAbsoluteTime v17 = self;
  id v18 = v4;
  id v11 = v4;
  dispatch_sync(v10, &v13);

  id v12 = [(SYSession *)self service];
  [v12 sessionDidEnd:self withError:v11];

  [(SYSession *)self didCompleteSession];
}

void __44__SYSendingSession__sendEndSessionAndError___block_invoke(uint64_t a1)
{
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  double v2 = qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21C7C9000, v2, OS_LOG_TYPE_INFO, "Delegate: -syncSession:didEndWithError:", v4, 2u);
  }
  id v3 = [*(id *)(a1 + 32) delegate];
  [v3 syncSession:*(void *)(a1 + 32) didEndWithError:*(void *)(a1 + 40)];
}

- (void)_notifyErrorAndShutdown
{
  [(_SYCountedSemaphore *)self->_changeConcurrencySemaphore invalidate];
  stateUpdateSource = self->_stateUpdateSource;
  if (stateUpdateSource) {
    dispatch_source_cancel(stateUpdateSource);
  }
  if ([(SYSendingSession *)self _localErrorOccurred]
    && ![(SYSendingSession *)self _hasSentEnd])
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __43__SYSendingSession__notifyErrorAndShutdown__block_invoke;
    v5[3] = &unk_264422AB0;
    v5[4] = self;
    [(SYSendingSession *)self _sendSyncCompleteAndRunBlock:v5];
  }
  else
  {
    id v4 = [(SYSession *)self error];
    [(SYSendingSession *)self _sendEndSessionAndError:v4];
  }
}

void __43__SYSendingSession__notifyErrorAndShutdown__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setStateQuietly:5];
  double v2 = *(void **)(a1 + 32);
  id v3 = [v2 error];
  [v2 _sendEndSessionAndError:v3];
}

- (void)_sessionFinished
{
  [(_SYCountedSemaphore *)self->_changeConcurrencySemaphore invalidate];
  stateUpdateSource = self->_stateUpdateSource;
  if (stateUpdateSource) {
    dispatch_source_cancel(stateUpdateSource);
  }
  if ([(SYSendingSession *)self wasCancelled]) {
    uint64_t v4 = [objc_alloc(MEMORY[0x263F087E8]) initWithSYError:-128 userInfo:0];
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = (id)v4;
  [(SYSendingSession *)self _sendEndSessionAndError:v4];
}

- (void)_processNextState
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = [(SYSession *)self queue];
  dispatch_assert_queue_V2(v3);

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_sessionActivity, &state);
  uint64_t v4 = [(SYSendingSession *)self state];
  switch((int)v4)
  {
    case 1:
      [(SYSendingSession *)self _waitForMessageWindow];
      break;
    case 2:
      [(SYSendingSession *)self _sendSyncCompleteAndRunBlock:0];
      break;
    case 3:
      [(SYSendingSession *)self _sendSyncCancelled];
      break;
    case 4:
      [(SYSendingSession *)self _sendSyncRestart];
      break;
    case 5:
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      id v5 = (id)qword_26AB04788;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = [(SYSession *)self error];
        *(_DWORD *)buf = 138543618;
        uint64_t v21 = self;
        __int16 v22 = 2112;
        uint64_t v23 = v6;
        _os_log_impl(&dword_21C7C9000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ entered error state. Error = %@", buf, 0x16u);
      }
      [(SYSendingSession *)self _notifyErrorAndShutdown];
      break;
    case 9:
      [(SYSendingSession *)self _sessionFinished];
      break;
    default:
      break;
  }
  id v7 = [(SYSession *)self stateResponders];
  id v8 = [NSNumber numberWithUnsignedInt:v4];
  int64_t v9 = [v7 objectForKeyedSubscript:v8];

  if ([v9 count])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v10);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v14 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v14 + 1) + 8 * i));
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v11);
    }

    objc_msgSend(v10, "removeAllObjects", (void)v14);
  }

  os_activity_scope_leave(&state);
}

- (void)_installTimers
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = [(SYSession *)self identifier];
  uint64_t v4 = (void *)[v3 copy];

  objc_initWeak(&location, self);
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __34__SYSendingSession__installTimers__block_invoke;
  v26[3] = &unk_2644232A0;
  objc_copyWeak(&v28, &location);
  id v5 = v4;
  id v27 = v5;
  id v6 = (void *)MEMORY[0x21D4B17C0](v26);
  self->_double sessionStartTime = CFAbsoluteTimeGetCurrent();
  [(SYSession *)self fullSessionTimeout];
  if (v7 != 0.0)
  {
    id v8 = [(SYSession *)self queue];
    int64_t v9 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v8);
    sessionTimer = self->_sessionTimer;
    self->_sessionTimer = v9;

    dispatch_source_set_event_handler((dispatch_source_t)self->_sessionTimer, v6);
    uint64_t v11 = self->_sessionTimer;
    [(SYSession *)self fullSessionTimeout];
    dispatch_time_t v13 = dispatch_walltime(0, (uint64_t)(v12 * 1000000000.0));
    dispatch_source_set_timer(v11, v13, 0xFFFFFFFFFFFFFFFFLL, 0x37E11D600uLL);
    dispatch_resume((dispatch_object_t)self->_sessionTimer);
    long long v14 = (void *)MEMORY[0x263EFF910];
    [(SYSession *)self fullSessionTimeout];
    long long v15 = objc_msgSend(v14, "dateWithTimeIntervalSinceNow:");
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    long long v16 = (id)qword_26AB04788;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      [(SYSession *)self fullSessionTimeout];
      *(_DWORD *)buf = 134218242;
      uint64_t v31 = v17;
      __int16 v32 = 2114;
      uint64_t v33 = v15;
      _os_log_impl(&dword_21C7C9000, v16, OS_LOG_TYPE_DEFAULT, "Session timeout is %.02f seconds. Timer will fire at %{public}@", buf, 0x16u);
    }
  }
  [(SYSession *)self perMessageTimeout];
  if (v18 != 0.0)
  {
    id v19 = [(SYSession *)self queue];
    BOOL v20 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v19);
    messageTimer = self->_messageTimer;
    self->_messageTimer = v20;

    dispatch_source_set_event_handler((dispatch_source_t)self->_messageTimer, v6);
    __int16 v22 = self->_messageTimer;
    dispatch_time_t v23 = dispatch_walltime(0, 0x7FFFFFFFFFFFFFFFLL);
    dispatch_source_set_timer(v22, v23, 0xFFFFFFFFFFFFFFFFLL, 0x37E11D600uLL);
    dispatch_resume((dispatch_object_t)self->_messageTimer);
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    uint64_t v24 = (id)qword_26AB04788;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      [(SYSession *)self perMessageTimeout];
      *(_DWORD *)buf = 134217984;
      uint64_t v31 = v25;
      _os_log_impl(&dword_21C7C9000, v24, OS_LOG_TYPE_DEFAULT, "Message timeout is set to %.02f", buf, 0xCu);
    }
  }
  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

void __34__SYSendingSession__installTimers__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
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
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __34__SYSendingSession__installTimers__block_invoke_23;
    block[3] = &unk_264422AB0;
    block[4] = WeakRetained;
    dispatch_async(v4, block);
  }
LABEL_6:
}

void __34__SYSendingSession__installTimers__block_invoke_23(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(void *)(a1 + 32) + 272), &state);
  double v2 = (void *)MEMORY[0x263EFF910];
  id v3 = *(double **)(a1 + 32);
  double v4 = v3[35];
  [v3 fullSessionTimeout];
  id v6 = [v2 dateWithTimeIntervalSinceReferenceDate:v4 + v5];
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  double v7 = (id)qword_26AB04788;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    [v6 timeIntervalSinceNow];
    *(_DWORD *)buf = 138543618;
    uint64_t v34 = v6;
    __int16 v35 = 2048;
    uint64_t v36 = v8;
    _os_log_impl(&dword_21C7C9000, v7, OS_LOG_TYPE_DEFAULT, "Session timeout timer fired. Expected to fire at %{public}@, delta is %.02f", buf, 0x16u);
  }

  int64_t v9 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:16];
  id v10 = v9;
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(void *)(v11 + 296);
  if (v12)
  {
    [v9 setObject:v12 forKeyedSubscript:@"StartRequest"];
    uint64_t v11 = *(void *)(a1 + 32);
  }
  uint64_t v13 = *(void *)(v11 + 304);
  if (v13)
  {
    [v10 setObject:v13 forKeyedSubscript:@"EndRequest"];
    uint64_t v11 = *(void *)(a1 + 32);
  }
  id v14 = *(id *)(v11 + 312);
  objc_sync_enter(v14);
  long long v15 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:5];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v16 = *(id *)(*(void *)(a1 + 32) + 312);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v32 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(v16);
        }
        BOOL v20 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if ((objc_msgSend(v20, "isComplete", (void)v25) & 1) == 0) {
          [v15 addObject:v20];
        }
      }
      uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v32 count:16];
    }
    while (v17);
  }

  uint64_t v21 = (void *)[v15 copy];
  [v10 setObject:v21 forKeyedSubscript:@"Batches"];

  objc_sync_exit(v14);
  id v22 = objc_alloc(MEMORY[0x263F087E8]);
  int v30 = @"SYSessionMessageStatus";
  uint64_t v31 = v10;
  dispatch_time_t v23 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
  uint64_t v24 = (void *)[v22 initWithSYError:2007 userInfo:v23];
  [*(id *)(a1 + 32) setError:v24];

  [*(id *)(a1 + 32) setState:5];
  os_activity_scope_leave(&state);
}

- (void)_setMessageTimer
{
  messageTimer = self->_messageTimer;
  if (messageTimer)
  {
    [(SYSession *)self perMessageTimeout];
    dispatch_time_t v4 = dispatch_walltime(0, (uint64_t)(v3 * 1000000000.0));
    dispatch_source_set_timer(messageTimer, v4, 0xFFFFFFFFFFFFFFFFLL, 0x37E11D600uLL);
  }
}

- (void)_installStateListener
{
  double v3 = [(SYSession *)self queue];
  dispatch_time_t v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF83B8], 0, 0, v3);
  stateUpdateSource = self->_stateUpdateSource;
  self->_stateUpdateSource = v4;

  objc_initWeak(&location, self);
  id v6 = self->_stateUpdateSource;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__SYSendingSession__installStateListener__block_invoke;
  v7[3] = &unk_264422C90;
  objc_copyWeak(&v8, &location);
  dispatch_source_set_event_handler(v6, v7);
  dispatch_resume((dispatch_object_t)self->_stateUpdateSource);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __41__SYSendingSession__installStateListener__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _processNextState];
    id WeakRetained = v2;
  }
}

- (void)_startFailedForStateChangeWithError:(id)a3
{
  unsigned int v4 = [(SYSendingSession *)self state];
  if (v4 > 9 || ((1 << v4) & 0x228) == 0)
  {
    id v6 = [(SYSession *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __56__SYSendingSession__startFailedForStateChangeWithError___block_invoke;
    block[3] = &unk_264422AB0;
    block[4] = self;
    dispatch_async(v6, block);
  }
}

uint64_t __56__SYSendingSession__startFailedForStateChangeWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sessionFinished];
}

- (void)start:(id)a3
{
  v26[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_sessionActivity, &state);
  double v5 = [(SYSession *)self delegate];
  if (v5)
  {
    if (objc_opt_respondsToSelector())
    {
      id v6 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:10];
      batchObjectIDsByBatchIndex = self->_batchObjectIDsByBatchIndex;
      self->_batchObjectIDsByBatchIndex = v6;
    }
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v8 = (id)qword_26AB04788;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v9 = [(SYSession *)self identifier];
      *(_DWORD *)buf = 138543618;
      id v22 = self;
      __int16 v23 = 2114;
      uint64_t v24 = v9;
      _os_log_impl(&dword_21C7C9000, v8, OS_LOG_TYPE_DEFAULT, "Starting %{public}@ with identifier %{public}@", buf, 0x16u);
    }
    [(SYSendingSession *)self _installStateListener];
    [(SYSendingSession *)self _installTimers];
    id v10 = [(SYSession *)self queue];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __26__SYSendingSession_start___block_invoke_42;
    v16[3] = &unk_264422E88;
    v16[4] = self;
    id v17 = v4;
    dispatch_async(v10, v16);
  }
  else
  {
    id v11 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v25 = *MEMORY[0x263F08320];
    v26[0] = @"You cannot start an SYSession without a delegate.";
    uint64_t v12 = [NSDictionary dictionaryWithObjects:v26 forKeys:&v25 count:1];
    uint64_t v13 = (void *)[v11 initWithSYError:2001 userInfo:v12];

    id v14 = [(SYSession *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __26__SYSendingSession_start___block_invoke;
    block[3] = &unk_264422990;
    block[4] = self;
    id v15 = v13;
    id v19 = v15;
    dispatch_async(v14, block);

    (*((void (**)(id, void, id))v4 + 2))(v4, 0, v15);
  }

  os_activity_scope_leave(&state);
}

uint64_t __26__SYSendingSession_start___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendEndSessionAndError:*(void *)(a1 + 40)];
}

void __26__SYSendingSession_start___block_invoke_42(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  os_activity_t v2 = _os_activity_create(&dword_21C7C9000, "SYSession (Outgoing)", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DETACHED);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 272);
  *(void *)(v3 + 272) = v2;

  int v5 = [*(id *)(a1 + 32) state];
  if (v5)
  {
    if (v5 == 3)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      long long v27 = qword_26AB04788;
      if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21C7C9000, v27, OS_LOG_TYPE_DEFAULT, "Sending session canceled during initialization", buf, 2u);
      }
      uint64_t v28 = *(void *)(a1 + 40);
      id v29 = objc_alloc(MEMORY[0x263F087E8]);
      uint64_t v30 = -128;
    }
    else
    {
      if (v5 == 5)
      {
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        id v6 = qword_26AB04788;
        if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21C7C9000, v6, OS_LOG_TYPE_DEFAULT, "Sending session entered error state during initialization.", buf, 2u);
        }
        uint64_t v7 = *(void *)(a1 + 40);
        id v8 = [*(id *)(a1 + 32) error];
        (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);
        goto LABEL_23;
      }
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      uint64_t v31 = (void *)qword_26AB04788;
      if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v32 = *(void **)(a1 + 32);
        uint64_t v33 = v31;
        *(_DWORD *)buf = 67109120;
        int v39 = [v32 state];
        _os_log_impl(&dword_21C7C9000, v33, OS_LOG_TYPE_DEFAULT, "Unexpected state during initialization: %{companionsync:SYSessionState}d", buf, 8u);
      }
      uint64_t v28 = *(void *)(a1 + 40);
      id v29 = objc_alloc(MEMORY[0x263F087E8]);
      uint64_t v30 = 2011;
    }
    id v8 = (void *)[v29 initWithSYError:v30 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v28 + 16))(v28, 0, v8);
    goto LABEL_23;
  }
  id v8 = objc_opt_new();
  int64_t v9 = (void *)[*(id *)(a1 + 32) _newMessageHeader];
  [v8 setHeader:v9];

  objc_msgSend(v8, "setIsResetSync:", objc_msgSend(*(id *)(a1 + 32), "isResetSync"));
  id v10 = [*(id *)(a1 + 32) identifier];
  [v8 setSessionID:v10];

  objc_msgSend(v8, "setExpectsRollbackSupport:", objc_msgSend(*(id *)(a1 + 32), "canRollback"));
  objc_msgSend(v8, "setExpectsRestartSupport:", objc_msgSend(*(id *)(a1 + 32), "canRestart"));
  double Current = CFAbsoluteTimeGetCurrent();
  [*(id *)(a1 + 32) fullSessionTimeout];
  [v8 setSessionTimeout:Current + v12];
  uint64_t v13 = [*(id *)(a1 + 32) reason];
  [v8 setReason:v13];

  id v14 = [*(id *)(a1 + 32) sessionMetadata];
  uint64_t v15 = [v14 count];

  if (v15)
  {
    id v16 = (void *)MEMORY[0x263F08910];
    id v17 = [*(id *)(a1 + 32) sessionMetadata];
    uint64_t v18 = [v16 archivedDataWithRootObject:v17 requiringSecureCoding:1 error:0];
    [v8 setMetadata:v18];
  }
  id v19 = [*(id *)(a1 + 32) service];
  BOOL v20 = [v19 syncEngine];
  uint64_t v21 = [*(id *)(a1 + 32) priority];
  id v22 = *(void **)(a1 + 32);
  uint64_t v36 = 0x26CD1DCC0;
  uint64_t v37 = MEMORY[0x263EFFA88];
  __int16 v23 = [NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
  uint64_t v24 = [v22 combinedEngineOptions:v23];
  uint64_t v25 = [*(id *)(a1 + 32) wrappedUserContext];
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __26__SYSendingSession_start___block_invoke_45;
  v34[3] = &unk_264423B10;
  long long v26 = *(void **)(a1 + 40);
  v34[4] = *(void *)(a1 + 32);
  id v35 = v26;
  [v20 enqueueSyncRequest:v8 withMessageID:102 priority:v21 options:v24 userContext:v25 callback:v34];

LABEL_23:
}

void __26__SYSendingSession_start___block_invoke_45(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(void *)(a1 + 32) + 272), &state);
  if (!a2)
  {
    [*(id *)(a1 + 32) setError:v8];
    [*(id *)(a1 + 32) _setLocalErrorOccurred];
    [*(id *)(a1 + 32) setState:5];
LABEL_20:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_21;
  }
  int64_t v9 = [[SYMessageStatusRecord alloc] initWithMessageID:v7];
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = *(void **)(v10 + 296);
  *(void *)(v10 + 296) = v9;

  if (![*(id *)(a1 + 32) state])
  {
    [*(id *)(a1 + 32) _sentStart];
    id v16 = [*(id *)(a1 + 32) service];
    id v17 = [v16 syncEngine];
    if ([v17 buffersSessions])
    {
      uint64_t v18 = +[SYDevice targetableDevice];
      int v19 = [v18 supportsFileTransferMessageSend];

      if (v19) {
        uint64_t v20 = 6;
      }
      else {
        uint64_t v20 = 1;
      }
    }
    else
    {

      uint64_t v20 = 6;
    }
    [*(id *)(a1 + 32) setState:v20];
    goto LABEL_20;
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  double v12 = (id)qword_26AB04788;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    __26__SYSendingSession_start___block_invoke_45_cold_1(buf, [*(id *)(a1 + 32) state], v12);
  }

  int v13 = [*(id *)(a1 + 32) state];
  if (v13 == 3)
  {
    uint64_t v21 = *(void *)(a1 + 40);
    uint64_t v15 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:-128 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v21 + 16))(v21, 0, v15);
  }
  else if (v13 == 5)
  {
    uint64_t v14 = *(void *)(a1 + 40);
    uint64_t v15 = [*(id *)(a1 + 32) error];
    (*(void (**)(uint64_t, void, void *))(v14 + 16))(v14, 0, v15);
  }
  else
  {
    id v22 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v26 = *MEMORY[0x263F08320];
    __int16 v23 = (void *)[[NSString alloc] initWithFormat:@"Start session message enqueued, but session is in unexpected state %d", objc_msgSend(*(id *)(a1 + 32), "state")];
    long long v27 = v23;
    uint64_t v24 = [NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    uint64_t v15 = (void *)[v22 initWithSYError:2011 userInfo:v24];

    [*(id *)(a1 + 32) _startFailedForStateChangeWithError:v15];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }

LABEL_21:
  os_activity_scope_leave(&state);
}

- (void)cancelWithError:(id)a3
{
  id v9 = a3;
  [(SYSendingSession *)self _setCancelled];
  id v4 = [(SYSession *)self _cancelPendingMessagesReturningFailures];
  if ([v4 count])
  {
    int v5 = [(SYSession *)self service];
    [v5 sessionFailedToCancelMessageUUIDs:v4];
  }
  id v6 = [v9 domain];
  if (![v6 isEqualToString:@"SYErrorDomain"])
  {

    goto LABEL_8;
  }
  uint64_t v7 = [v9 code];

  if (v7 != -128)
  {
LABEL_8:
    uint64_t v8 = 5;
    goto LABEL_9;
  }
  if ([(SYSendingSession *)self state] == 7)
  {
    uint64_t v8 = 9;
LABEL_9:
    [(SYSession *)self setError:v9];
    [(SYSendingSession *)self _setLocalErrorOccurred];
    goto LABEL_10;
  }
  uint64_t v8 = 3;
LABEL_10:
  [(SYSendingSession *)self setState:v8];
}

- (BOOL)_handleStartSessionResponse:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v25.opaque[0] = 0;
  v25.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_sessionActivity, &v25);
  [(SYMessageStatusRecord *)self->_startMessageID setResponseReceived:1];
  uint64_t v7 = [(SYSession *)self service];
  uint64_t v8 = [v7 syncEngine];
  if ([v8 buffersSessions])
  {

    goto LABEL_4;
  }
  BOOL v9 = [(SYSendingSession *)self state] == 6;

  if (v9)
  {
LABEL_4:
    if ([v6 accepted])
    {
      os_unfair_lock_lock(&self->_flagsLock);
      __int16 flags = (__int16)self->_flags;
      if ((flags & 0x10) != 0)
      {
        if ([v6 supportsRestart]) {
          __int16 v11 = 16;
        }
        else {
          __int16 v11 = 0;
        }
        __int16 flags = (__int16)self->_flags;
      }
      else
      {
        __int16 v11 = 0;
      }
      __int16 v17 = flags & 0xFFEF | v11;
      *(_WORD *)&self->___int16 flags = v17;
      if ((flags & 0x20) != 0)
      {
        if ([v6 supportsRollback]) {
          __int16 v18 = 32;
        }
        else {
          __int16 v18 = 0;
        }
        __int16 v17 = (__int16)self->_flags;
      }
      else
      {
        __int16 v18 = 0;
      }
      *(_WORD *)&self->___int16 flags = v17 & 0xFFDF | v18;
      os_unfair_lock_unlock(&self->_flagsLock);
      if ([v6 hasMetadata])
      {
        int v19 = objc_opt_class();
        uint64_t v20 = [v6 metadata];
        uint64_t v21 = [v19 unarchiveMetadata:v20];

        if (v21) {
          [(SYSession *)self setSessionMetadata:v21];
        }
      }
      if ([(SYSendingSession *)self state] == 6)
      {
        [(SYSendingSession *)self setState:1];
LABEL_37:
        [(SYSendingSession *)self _confirmedStart];
        BOOL v16 = 1;
        goto LABEL_38;
      }
      if ([(SYSendingSession *)self state] == 7) {
        goto LABEL_37;
      }
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      uint64_t v14 = (id)qword_26AB04788;
      if (os_log_type_enabled(v14, (os_log_type_t)0x90u)) {
        -[SYSendingSession _handleStartSessionResponse:error:](buf, [(SYSendingSession *)self state], v14);
      }
    }
    else
    {
      double v12 = (void *)MEMORY[0x263F087E8];
      int v13 = [v6 error];
      uint64_t v14 = [v12 errorFromSYErrorInfo:v13];

      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      uint64_t v15 = qword_26AB04788;
      if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        long long v27 = v14;
        _os_log_impl(&dword_21C7C9000, v15, OS_LOG_TYPE_DEFAULT, "Received an error SYStartSyncSessionResponse: %@", buf, 0xCu);
      }
      if ([(SYSendingSession *)self state] == 6)
      {
        [(SYSession *)self setError:v14];
        [(SYSendingSession *)self setState:5];
      }
      else
      {
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        id v22 = (id)qword_26AB04788;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v23 = [(SYSendingSession *)self state];
          *(_DWORD *)buf = 67109120;
          LODWORD(v27) = v23;
          _os_log_impl(&dword_21C7C9000, v22, OS_LOG_TYPE_DEFAULT, "We are not waiting for this start-session response (current state is %{companionsync:SYSessionState}d, so I'm not setting error state here.", buf, 8u);
        }
      }
    }

    goto LABEL_37;
  }
  BOOL v16 = 0;
  if (a4) {
    *a4 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:2011 userInfo:0];
  }
LABEL_38:
  os_activity_scope_leave(&v25);

  return v16;
}

- (BOOL)_handleSyncBatchResponse:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_sessionActivity, &state);
  id v6 = self->_batchMessageIDs;
  objc_sync_enter(v6);
  unint64_t v7 = [v5 index];
  if (v7 < [(NSMutableArray *)self->_batchMessageIDs count])
  {
    uint64_t v8 = -[NSMutableArray objectAtIndexedSubscript:](self->_batchMessageIDs, "objectAtIndexedSubscript:", [v5 index]);
    [v8 setResponseReceived:1];
LABEL_3:

    goto LABEL_7;
  }
  if (_RunningInXCTest_onceToken != -1) {
    dispatch_once(&_RunningInXCTest_onceToken, &__block_literal_global_6);
  }
  if (!_RunningInXCTest___value)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    uint64_t v8 = (id)qword_26AB04788;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SYSendingSession _handleSyncBatchResponse:error:](v27, [v5 index], -[NSMutableArray count](self->_batchMessageIDs, "count"), v8);
    }
    goto LABEL_3;
  }
LABEL_7:
  objc_sync_exit(v6);

  -[NSMutableIndexSet addIndex:](self->_ackedBatchIndices, "addIndex:", [v5 index]);
  [(_SYCountedSemaphore *)self->_changeConcurrencySemaphore signal];
  if ([v5 hasError])
  {
    BOOL v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = [v5 error];
    __int16 v11 = [v9 errorFromSYErrorInfo:v10];

    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    double v12 = qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = v11;
      _os_log_impl(&dword_21C7C9000, v12, OS_LOG_TYPE_DEFAULT, "Received an error SYSyncBatchResponse: %@", buf, 0xCu);
    }
    [(SYSession *)self setError:v11];
    [(SYSendingSession *)self setState:5];
  }
  int v13 = [(SYSession *)self delegate];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    batchObjectIDsByBatchIndex = self->_batchObjectIDsByBatchIndex;
    BOOL v16 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v5, "index"));
    __int16 v17 = [(NSMutableDictionary *)batchObjectIDsByBatchIndex objectForKeyedSubscript:v16];

    if (v17)
    {
      __int16 v18 = self->_batchObjectIDsByBatchIndex;
      int v19 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v5, "index"));
      [(NSMutableDictionary *)v18 removeObjectForKey:v19];

      uint64_t v20 = [(SYSession *)self targetQueue];
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __51__SYSendingSession__handleSyncBatchResponse_error___block_invoke;
      v22[3] = &unk_264422990;
      v22[4] = self;
      id v23 = v17;
      dispatch_async(v20, v22);
    }
  }
  os_activity_scope_leave(&state);

  return 1;
}

void __51__SYSendingSession__handleSyncBatchResponse_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 syncSession:*(void *)(a1 + 32) successfullySynced:*(void *)(a1 + 40)];
}

- (BOOL)_handleRestartSessionResponse:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v17.opaque[0] = 0;
  v17.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_sessionActivity, &v17);
  [(SYMessageStatusRecord *)self->_startMessageID setResponseReceived:1];
  unint64_t v7 = [(SYSession *)self service];
  uint64_t v8 = [v7 syncEngine];
  if ([v8 buffersSessions])
  {

LABEL_4:
    if ([v6 hasError])
    {
      uint64_t v10 = (void *)MEMORY[0x263F087E8];
      __int16 v11 = [v6 error];
      double v12 = [v10 errorFromSYErrorInfo:v11];

      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      int v13 = qword_26AB04788;
      if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        int v19 = v12;
        _os_log_impl(&dword_21C7C9000, v13, OS_LOG_TYPE_DEFAULT, "Received an error SYSyncSessionRestartResponse: %@", buf, 0xCu);
      }
      [(SYSession *)self setError:v12];
      [(SYSendingSession *)self setState:5];
    }
    else if ([v6 accepted])
    {
      [(NSMutableIndexSet *)self->_ackedBatchIndices removeAllIndexes];
      [(SYSendingSession *)self setState:1];
    }
    else
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      uint64_t v15 = qword_26AB04788;
      if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21C7C9000, v15, OS_LOG_TYPE_DEFAULT, "Restart was rejected by slave, cancelling session now.", buf, 2u);
      }
      [(SYSession *)self cancel];
    }
    [(SYSendingSession *)self _confirmedStart];
    BOOL v14 = 1;
    goto LABEL_20;
  }
  BOOL v9 = [(SYSendingSession *)self state] == 6;

  if (v9) {
    goto LABEL_4;
  }
  BOOL v14 = 0;
  if (a4) {
    *a4 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:2011 userInfo:0];
  }
LABEL_20:
  os_activity_scope_leave(&v17);

  return v14;
}

- (BOOL)_handleEndSessionResponse:(id)a3 error:(id *)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v18.opaque[0] = 0;
  v18.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_sessionActivity, &v18);
  [(SYMessageStatusRecord *)self->_endMessageID setResponseReceived:1];
  unsigned int v7 = [(SYSendingSession *)self state];
  if (v7 == 7)
  {
    if ([v6 hasError])
    {
      uint64_t v8 = (void *)MEMORY[0x263F087E8];
      BOOL v9 = [v6 error];
      uint64_t v10 = [v8 errorFromSYErrorInfo:v9];

      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      __int16 v11 = qword_26AB04788;
      if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v20 = v10;
        _os_log_impl(&dword_21C7C9000, v11, OS_LOG_TYPE_DEFAULT, "Received an error SYEndSyncSessionResponse: %@", buf, 0xCu);
      }
      [(SYSession *)self setError:v10];
      [(SYSendingSession *)self setState:5];

      goto LABEL_25;
    }
    if ([v6 hasDidRollback] && (objc_msgSend(v6, "didRollback") & 1) == 0)
    {
      uint64_t v15 = [MEMORY[0x263F087E8] errorWithSYError:2008 userInfo:0];
      [(SYSession *)self setError:v15];

      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      BOOL v14 = (id)qword_26AB04788;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v16 = [(SYSession *)self error];
        *(_DWORD *)buf = 138412290;
        uint64_t v20 = v16;
        _os_log_impl(&dword_21C7C9000, v14, OS_LOG_TYPE_DEFAULT, "End session with rollback was rejected by slave: %@", buf, 0xCu);
      }
    }
    else
    {
      if (-[NSMutableIndexSet countOfIndexesInRange:](self->_ackedBatchIndices, "countOfIndexesInRange:", 0, self->_batchIndex) == self->_batchIndex)
      {
        uint64_t v12 = 9;
LABEL_24:
        [(SYSendingSession *)self setState:v12];
LABEL_25:
        [(SYSendingSession *)self _confirmedEnd];
        goto LABEL_26;
      }
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      int v13 = qword_26AB04788;
      if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_ERROR)) {
        -[SYOutgoingBatchSyncSession _handleBatchSyncEndResponse:error:]((uint64_t *)&self->_batchIndex, (uint64_t *)&self->_ackedBatchIndices, v13);
      }
      BOOL v14 = [MEMORY[0x263F087E8] errorWithSYError:2012 userInfo:0];
      [(SYSession *)self setError:v14];
    }

    uint64_t v12 = 5;
    goto LABEL_24;
  }
  if (a4) {
    *a4 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:2011 userInfo:0];
  }
LABEL_26:
  os_activity_scope_leave(&v18);

  return v7 == 7;
}

- (void)_resolvedIdentifierForRequest:(id)a3
{
  id v4 = [a3 idsIdentifier];
  [(SYSession *)self _recordOutgoingMessageUUID:v4];
}

- (void)_sentMessageWithIdentifier:(id)a3 userInfo:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = 296;
  BOOL v9 = [(SYMessageStatusRecord *)self->_startMessageID messageID];
  int v10 = [v9 isEqualToString:v6];

  if (v10
    || (uint64_t v8 = 304,
        [(SYMessageStatusRecord *)self->_endMessageID messageID],
        __int16 v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v11 isEqualToString:v6],
        v11,
        v12))
  {
    [*(id *)((char *)&self->super.super.isa + v8) setDeviceACKReceived:1];
  }
  else
  {
    int v13 = self->_batchMessageIDs;
    objc_sync_enter(v13);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    BOOL v14 = self->_batchMessageIDs;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(v14);
          }
          os_activity_scope_state_s v18 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          int v19 = objc_msgSend(v18, "messageID", (void)v21);
          int v20 = [v19 isEqualToString:v6];

          if (v20)
          {
            [v18 setDeviceACKReceived:1];
            goto LABEL_14;
          }
        }
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }
LABEL_14:

    objc_sync_exit(v13);
  }
}

- (void)_peerProcessedMessageWithIdentifier:(id)a3 userInfo:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [(SYSession *)self _clearOutgoingMessageUUID:v6];
  uint64_t v8 = 296;
  BOOL v9 = [(SYMessageStatusRecord *)self->_startMessageID messageID];
  int v10 = [v9 isEqualToString:v6];

  if (v10
    || (uint64_t v8 = 304,
        [(SYMessageStatusRecord *)self->_endMessageID messageID],
        __int16 v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v11 isEqualToString:v6],
        v11,
        v12))
  {
    [*(id *)((char *)&self->super.super.isa + v8) setApplicationACKReceived:1];
  }
  else
  {
    int v13 = self->_batchMessageIDs;
    objc_sync_enter(v13);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    BOOL v14 = self->_batchMessageIDs;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(v14);
          }
          os_activity_scope_state_s v18 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          int v19 = objc_msgSend(v18, "messageID", (void)v21);
          int v20 = [v19 isEqualToString:v6];

          if (v20)
          {
            [v18 setApplicationACKReceived:1];
            goto LABEL_14;
          }
        }
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }
LABEL_14:

    objc_sync_exit(v13);
  }
}

- (void)_continue
{
  if ([(SYSendingSession *)self state])
  {
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:2021 userInfo:0];
    [(SYSession *)self setError:v3];

    [(SYSendingSession *)self setState:5];
    os_unfair_lock_lock(&self->_flagsLock);
    *(_WORD *)&self->_flags &= ~0x4000u;
    os_unfair_lock_unlock(&self->_flagsLock);
  }
  v4.receiver = self;
  v4.super_class = (Class)SYSendingSession;
  [(SYSession *)&v4 _continue];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batchMessageIDs, 0);
  objc_storeStrong((id *)&self->_endMessageID, 0);
  objc_storeStrong((id *)&self->_startMessageID, 0);
  objc_storeStrong((id *)&self->_batchObjectIDsByBatchIndex, 0);
  objc_storeStrong((id *)&self->_sessionActivity, 0);
  objc_storeStrong((id *)&self->_ackedBatchIndices, 0);
  objc_storeStrong((id *)&self->_changeWaitActivity, 0);
  objc_storeStrong((id *)&self->_changeConcurrencySemaphore, 0);
  objc_storeStrong((id *)&self->_changeFetcherQueue, 0);
  objc_storeStrong((id *)&self->_messageTimer, 0);
  objc_storeStrong((id *)&self->_sessionTimer, 0);
  objc_storeStrong((id *)&self->_stateUpdateSource, 0);
}

void __41__SYSendingSession__waitForMessageWindow__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __41__SYSendingSession__waitForMessageWindow__block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_sendSyncCompleteAndRunBlock:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __34__SYSendingSession__installTimers__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2048;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_21C7C9000, log, (os_log_type_t)0x90u, "Session timeout timer fired. Session ID is %{public}@, weak session reference is %p", (uint8_t *)&v4, 0x16u);
}

void __26__SYSendingSession_start___block_invoke_45_cold_1(uint8_t *buf, int a2, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = a2;
  _os_log_error_impl(&dword_21C7C9000, log, OS_LOG_TYPE_ERROR, "Start session message enqueued, but session has changed to state %{companionsync:SYSessionState}d", buf, 8u);
}

- (void)_handleStartSessionResponse:(os_log_t)log error:.cold.1(uint8_t *buf, int a2, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = a2;
  _os_log_error_impl(&dword_21C7C9000, log, (os_log_type_t)0x90u, "Received an accepted start-session response while in unexpected state %{companionsync:SYSessionState}d", buf, 8u);
}

- (void)_handleSyncBatchResponse:(uint64_t)a3 error:(os_log_t)log .cold.1(uint8_t *buf, uint64_t a2, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 134218240;
  *(void *)(buf + 4) = a2;
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = a3;
  _os_log_error_impl(&dword_21C7C9000, log, OS_LOG_TYPE_ERROR, "Batch %lu response doesn't have a corresponding entry in list of message IDs (which goes up to %lu)", buf, 0x16u);
}

@end