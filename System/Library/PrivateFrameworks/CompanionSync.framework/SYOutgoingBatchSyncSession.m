@interface SYOutgoingBatchSyncSession
- (BOOL)_handleBatchAck:(id)a3 error:(id *)a4;
- (BOOL)_handleBatchSyncEndResponse:(id)a3 error:(id *)a4;
- (BOOL)canRestart;
- (BOOL)canRollback;
- (BOOL)isResetSync;
- (BOOL)isSending;
- (BOOL)wasCancelled;
- (SYOutgoingBatchSyncSession)initWithService:(id)a3;
- (double)remainingSessionTime;
- (unint64_t)protocolVersion;
- (unsigned)state;
- (void)_fetchNextBatch;
- (void)_installStateListener;
- (void)_installTimers;
- (void)_messageExpiredWithSeqno:(unint64_t)a3 identifier:(id)a4;
- (void)_notifySessionComplete;
- (void)_processNextState;
- (void)_sendSyncBatch:(id)a3 nextState:(unsigned int)a4;
- (void)_sendSyncCancelled;
- (void)_sendSyncCompleteAndRunBlock:(id)a3;
- (void)_sendSyncRestart;
- (void)_sendSyncStart;
- (void)_sentMessageWithIdentifier:(id)a3 userInfo:(id)a4;
- (void)_sessionComplete;
- (void)_setMessageTimerForSeqno:(unint64_t)a3;
- (void)_setStateQuietly:(unsigned int)a3;
- (void)_setupChangeConcurrency;
- (void)_waitForMessageWindow;
- (void)cancelWithError:(id)a3;
- (void)setCanRestart:(BOOL)a3;
- (void)setCanRollback:(BOOL)a3;
- (void)setState:(unsigned int)a3;
- (void)start:(id)a3;
@end

@implementation SYOutgoingBatchSyncSession

- (SYOutgoingBatchSyncSession)initWithService:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)SYOutgoingBatchSyncSession;
  v5 = [(SYSession *)&v32 initWithService:v4];
  v6 = v5;
  if (v5)
  {
    v5->_state = 0;
    uint64_t v7 = objc_opt_new();
    ackedBatchIndices = v6->_ackedBatchIndices;
    v6->_ackedBatchIndices = (NSMutableIndexSet *)v7;

    v9 = [v4 serviceActivity];
    os_activity_t v10 = _os_activity_create(&dword_21C7C9000, "SYSession (v1 Outgoing Batched)", v9, OS_ACTIVITY_FLAG_DEFAULT);

    sessionActivity = v6->_sessionActivity;
    v6->_sessionActivity = (OS_os_activity *)v10;

    objc_initWeak(&location, v6);
    v12 = [_SYMessageTimerTable alloc];
    v13 = [(SYSession *)v6 queue];
    uint64_t v26 = MEMORY[0x263EF8330];
    uint64_t v27 = 3221225472;
    v28 = __46__SYOutgoingBatchSyncSession_initWithService___block_invoke;
    v29 = &unk_264422D30;
    objc_copyWeak(&v30, &location);
    uint64_t v14 = [(_SYMessageTimerTable *)v12 initWithQueue:v13 timerCallback:&v26];
    timers = v6->_timers;
    v6->_timers = (_SYMessageTimerTable *)v14;

    v16 = objc_msgSend(v4, "name", v26, v27, v28, v29);
    v17 = [v16 lastPathComponent];
    v18 = [v17 stringByAppendingString:@" Change Enqueuer"];

    id v19 = v18;
    dispatch_queue_t v20 = dispatch_queue_create((const char *)[v19 UTF8String], 0);
    changeFetcherQueue = v6->_changeFetcherQueue;
    v6->_changeFetcherQueue = (OS_dispatch_queue *)v20;

    v22 = objc_opt_new();
    v23 = [v22 UUIDString];
    [(SYSession *)v6 setIdentifier:v23];

    v24 = v6;
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __46__SYOutgoingBatchSyncSession_initWithService___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  WeakRetained = (os_activity_t *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v7 = WeakRetained;
  if (WeakRetained)
  {
    v8.opaque[0] = 0;
    v8.opaque[1] = 0;
    os_activity_scope_enter(WeakRetained[33], &v8);
    [(os_activity_t *)v7 _messageExpiredWithSeqno:a2 identifier:v5];
    os_activity_scope_leave(&v8);
  }
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
  id v5 = (id)qword_26AB04788;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
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
  id v5 = (id)qword_26AB04788;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
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

- (void)_setupChangeConcurrency
{
  double v3 = [(SYSession *)self queue];
  dispatch_assert_queue_V2(v3);

  if ([(SYSession *)self maxConcurrentMessages]
    && ([(SYSession *)self maxConcurrentMessages] & 0x8000000000000000) == 0)
  {
    id v4 = [[_SYCountedSemaphore alloc] initWithCount:[(SYSession *)self maxConcurrentMessages]];
    changeConcurrencySemaphore = self->_changeConcurrencySemaphore;
    self->_changeConcurrencySemaphore = v4;

    v6 = (OS_os_activity *)_os_activity_create(&dword_21C7C9000, "Change Concurrency Wait", (os_activity_t)self->_sessionActivity, OS_ACTIVITY_FLAG_DEFAULT);
    changeWaitActivity = self->_changeWaitActivity;
    self->_changeWaitActivity = v6;
    MEMORY[0x270F9A758](v6, changeWaitActivity);
  }
}

- (void)_waitForMessageWindow
{
  double v3 = [(SYSession *)self queue];
  dispatch_assert_queue_V2(v3);

  if (self->_changeConcurrencySemaphore)
  {
    changeFetcherQueue = self->_changeFetcherQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__SYOutgoingBatchSyncSession__waitForMessageWindow__block_invoke;
    block[3] = &unk_264422AB0;
    block[4] = self;
    dispatch_async(changeFetcherQueue, block);
  }
  else
  {
    [(SYOutgoingBatchSyncSession *)self _fetchNextBatch];
  }
}

void __51__SYOutgoingBatchSyncSession__waitForMessageWindow__block_invoke(uint64_t a1)
{
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(void *)(a1 + 32) + 256), &state);
  [*(id *)(a1 + 32) perMessageTimeout];
  double v3 = v2;
  if (v2 == 0.0)
  {
    id v4 = [*(id *)(a1 + 32) service];
    [v4 defaultMessageTimeout];
    double v3 = v5;
  }
  if ([*(id *)(*(void *)(a1 + 32) + 248) waitWithTimeout:v3 + v3])
  {
    v8.opaque[0] = 0;
    v8.opaque[1] = 0;
    os_activity_scope_enter(*(os_activity_t *)(*(void *)(a1 + 32) + 264), &v8);
    v6 = [*(id *)(a1 + 32) queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__SYOutgoingBatchSyncSession__waitForMessageWindow__block_invoke_2;
    block[3] = &unk_264422AB0;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(v6, block);

    os_activity_scope_leave(&v8);
  }
  os_activity_scope_leave(&state);
}

uint64_t __51__SYOutgoingBatchSyncSession__waitForMessageWindow__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchNextBatch];
}

- (void)_fetchNextBatch
{
  double v3 = [(SYSession *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:10];
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v27[3] = 0;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __45__SYOutgoingBatchSyncSession__fetchNextBatch__block_invoke;
  v24[3] = &unk_264422D58;
  v24[4] = self;
  uint64_t v26 = v27;
  id v5 = v4;
  id v25 = v5;
  v6 = (void *)MEMORY[0x21D4B17C0](v24);
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__0;
  v22 = __Block_byref_object_dispose__0;
  id v23 = 0;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  int v17 = 1;
  uint64_t v7 = [(SYSession *)self targetQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__SYOutgoingBatchSyncSession__fetchNextBatch__block_invoke_75;
  block[3] = &unk_264422D80;
  uint64_t v12 = &v14;
  block[4] = self;
  id v8 = v6;
  id v11 = v8;
  v13 = &v18;
  dispatch_sync(v7, block);

  uint64_t v9 = *((unsigned int *)v15 + 6);
  if ((v9 - 1) >= 2)
  {
    if (v9 == 5)
    {
      [(SYSession *)self setError:v19[5]];
      self->_errorIsLocal = 1;
      uint64_t v9 = *((unsigned int *)v15 + 6);
    }
    [(SYOutgoingBatchSyncSession *)self setState:v9];
  }
  else
  {
    -[SYOutgoingBatchSyncSession _sendSyncBatch:nextState:](self, "_sendSyncBatch:nextState:", v5);
  }

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(v27, 8);
}

uint64_t __45__SYOutgoingBatchSyncSession__fetchNextBatch__block_invoke(uint64_t a1, void *a2)
{
  v24[2] = *MEMORY[0x263EF8340];
  id v3 = a2;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(void *)(a1 + 32) + 264), &state);
  id v4 = [*(id *)(a1 + 32) serializer];
  char v5 = objc_opt_respondsToSelector();

  v6 = *(void **)(a1 + 32);
  if (v5)
  {
    uint64_t v7 = [v6 serializer];
    uint64_t v8 = objc_msgSend(v7, "encodeSYChangeForBackwardCompatibility:protocolVersion:", v3, objc_msgSend(*(id *)(a1 + 32), "protocolVersion"));
  }
  else
  {
    uint64_t v9 = [v6 serializer];
    char v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) == 0)
    {
      id v13 = objc_alloc(MEMORY[0x263F087E8]);
      v23[0] = @"SYDelegateProtocolName";
      uint64_t v14 = NSStringFromProtocol((Protocol *)&unk_26CD34ED8);
      v23[1] = @"SYDelegateMethodNames";
      v24[0] = v14;
      v15 = NSStringFromSelector(sel_encodeSYChangeForBackwardCompatibility_protocolVersion_);
      v22[0] = v15;
      uint64_t v16 = NSStringFromSelector(sel_dataWithSYObject_);
      v22[1] = v16;
      int v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
      v24[1] = v17;
      uint64_t v18 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
      id v19 = (void *)[v13 initWithSYError:2020 userInfo:v18];
      [*(id *)(a1 + 32) setError:v19];

      [*(id *)(a1 + 32) setState:5];
      id v11 = 0;
LABEL_9:
      uint64_t v12 = 0;
      goto LABEL_10;
    }
    uint64_t v7 = [*(id *)(a1 + 32) serializer];
    uint64_t v8 = [v7 dataWithSYObject:v3];
  }
  id v11 = (void *)v8;

  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += [v11 length];
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) >= 0x200000uLL
    && [*(id *)(a1 + 40) count])
  {
    goto LABEL_9;
  }
  [*(id *)(a1 + 40) addObject:v11];
  uint64_t v12 = 1;
LABEL_10:

  os_activity_scope_leave(&state);
  return v12;
}

void __45__SYOutgoingBatchSyncSession__fetchNextBatch__block_invoke_75(uint64_t a1)
{
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  double v2 = qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C7C9000, v2, OS_LOG_TYPE_INFO, "Delegate: -syncSession:enqueueChanges:error:", buf, 2u);
  }
  id v3 = [*(id *)(a1 + 32) delegate];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v9 = 0;
  int v6 = [v3 syncSession:v4 enqueueChanges:v5 error:&v9];
  id v7 = v9;
  id v8 = v9;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v6;

  if (v8) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v7);
  }
}

- (void)_sendSyncBatch:(id)a3 nextState:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = [(SYSession *)self queue];
  dispatch_assert_queue_V2(v7);

  if ([v6 count])
  {
    id v8 = objc_opt_new();
    id v9 = [(SYSession *)self service];
    char v10 = (void *)[v9 _newMessageHeader];
    [v8 setHeader:v10];

    id v11 = [(SYSession *)self identifier];
    [v8 setSyncID:v11];

    ++self->_batchIndex;
    objc_msgSend(v8, "setChunkIndex:");
    [v8 setObjects:v6];
    [(SYOutgoingBatchSyncSession *)self setState:8];
    uint64_t v12 = [v8 header];
    uint64_t v13 = [v12 sequenceNumber];

    [(SYOutgoingBatchSyncSession *)self _setMessageTimerForSeqno:v13];
    uint64_t v14 = [v9 syncEngine];
    int64_t v15 = [(SYSession *)self priority];
    uint64_t v16 = [(SYSession *)self combinedEngineOptions:0];
    int v17 = [(SYSession *)self wrappedUserContext];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __55__SYOutgoingBatchSyncSession__sendSyncBatch_nextState___block_invoke;
    v18[3] = &unk_264422DA8;
    v18[4] = self;
    v18[5] = v13;
    int v19 = v4;
    [v14 enqueueSyncRequest:v8 withMessageID:4 priority:v15 options:v16 userContext:v17 callback:v18];
  }
  else
  {
    [(SYOutgoingBatchSyncSession *)self setState:v4];
    [(_SYCountedSemaphore *)self->_changeConcurrencySemaphore signal];
  }
}

void __55__SYOutgoingBatchSyncSession__sendSyncBatch_nextState___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(void *)(a1 + 32) + 264), &v10);
  id v9 = *(void **)(*(void *)(a1 + 32) + 280);
  if (a2)
  {
    [v9 setIdentifier:v7 forSequenceNumber:*(void *)(a1 + 40)];
    if ([*(id *)(a1 + 32) state] == 8) {
      [*(id *)(a1 + 32) setState:*(unsigned int *)(a1 + 48)];
    }
  }
  else
  {
    [v9 cancelTimerForSequenceNumber:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) setError:v8];
    *(unsigned char *)(*(void *)(a1 + 32) + 276) = 1;
    [*(id *)(a1 + 32) setState:5];
    [*(id *)(*(void *)(a1 + 32) + 248) signal];
  }
  os_activity_scope_leave(&v10);
}

- (void)_sendSyncCompleteAndRunBlock:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(SYSession *)self queue];
  dispatch_assert_queue_V2(v5);

  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  id v6 = qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C7C9000, v6, OS_LOG_TYPE_INFO, "Sending end-session message", buf, 2u);
  }
  id v7 = objc_opt_new();
  id v8 = [(SYSession *)self service];
  id v9 = (void *)[v8 _newMessageHeader];
  [v7 setHeader:v9];

  os_activity_scope_state_s v10 = [(SYSession *)self identifier];
  [v7 setSyncID:v10];

  id v11 = [(SYSession *)self error];
  if (v11)
  {
    BOOL errorIsLocal = self->_errorIsLocal;

    if (errorIsLocal)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      uint64_t v13 = (void *)qword_26AB04788;
      if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = v13;
        int64_t v15 = [(SYSession *)self error];
        *(_DWORD *)buf = 138412290;
        v31 = v15;
        _os_log_impl(&dword_21C7C9000, v14, OS_LOG_TYPE_DEFAULT, "Attaching error to end-session: %@", buf, 0xCu);
      }
      uint64_t v16 = [SYErrorInfo alloc];
      int v17 = [(SYSession *)self error];
      uint64_t v18 = [(SYErrorInfo *)v16 initWithError:v17];
      [v7 setError:v18];
    }
  }
  int v19 = (void *)[v4 copy];

  uint64_t v20 = [v7 header];
  uint64_t v21 = [v20 sequenceNumber];

  [(SYOutgoingBatchSyncSession *)self _setMessageTimerForSeqno:v21];
  v22 = [v8 syncEngine];
  int64_t v23 = [(SYSession *)self priority];
  v24 = [(SYSession *)self combinedEngineOptions:0];
  id v25 = [(SYSession *)self wrappedUserContext];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __59__SYOutgoingBatchSyncSession__sendSyncCompleteAndRunBlock___block_invoke;
  v27[3] = &unk_264422DD0;
  id v28 = v19;
  uint64_t v29 = v21;
  void v27[4] = self;
  id v26 = v19;
  [v22 enqueueSyncRequest:v7 withMessageID:5 priority:v23 options:v24 userContext:v25 callback:v27];

  self->_hasSentEnd = 1;
}

void __59__SYOutgoingBatchSyncSession__sendSyncCompleteAndRunBlock___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(void *)(a1 + 32) + 264), &v11);
  id v9 = *(void **)(a1 + 32);
  if (a2)
  {
    [v9 setState:7];
    [*(id *)(*(void *)(a1 + 32) + 280) setIdentifier:v7 forSequenceNumber:*(void *)(a1 + 48)];
  }
  else
  {
    [v9 setError:v8];
    [*(id *)(a1 + 32) setState:5];
    [*(id *)(*(void *)(a1 + 32) + 280) cancelTimerForSequenceNumber:*(void *)(a1 + 48)];
    [*(id *)(*(void *)(a1 + 32) + 248) signal];
  }
  if (*(void *)(a1 + 40))
  {
    os_activity_scope_state_s v10 = [*(id *)(a1 + 32) queue];
    dispatch_async(v10, *(dispatch_block_t *)(a1 + 40));
  }
  os_activity_scope_leave(&v11);
}

- (void)_sendSyncCancelled
{
  id v3 = [(SYSession *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = objc_opt_new();
  uint64_t v5 = [(SYSession *)self service];
  id v6 = (void *)[v5 _newMessageHeader];
  [v4 setHeader:v6];

  id v7 = [(SYSession *)self identifier];
  [v4 setSyncID:v7];

  id v8 = [SYErrorInfo alloc];
  id v9 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:-128 userInfo:0];
  os_activity_scope_state_s v10 = [(SYErrorInfo *)v8 initWithError:v9];
  [v4 setError:v10];

  os_activity_scope_state_s v11 = [v4 header];
  uint64_t v12 = [v11 sequenceNumber];

  [(SYOutgoingBatchSyncSession *)self _setMessageTimerForSeqno:v12];
  uint64_t v13 = [v5 syncEngine];
  int64_t v14 = [(SYSession *)self priority];
  int64_t v15 = [(SYSession *)self combinedEngineOptions:0];
  uint64_t v16 = [(SYSession *)self wrappedUserContext];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __48__SYOutgoingBatchSyncSession__sendSyncCancelled__block_invoke;
  v17[3] = &unk_264422DF8;
  v17[4] = self;
  v17[5] = v12;
  [v13 enqueueSyncRequest:v4 withMessageID:5 priority:v14 options:v15 userContext:v16 callback:v17];

  self->_hasSentEnd = 1;
}

void __48__SYOutgoingBatchSyncSession__sendSyncCancelled__block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(void *)(a1 + 32) + 264), &state);
  [*(id *)(*(void *)(a1 + 32) + 280) cancelTimerForSequenceNumber:*(void *)(a1 + 40)];
  if (a2)
  {
    id v9 = [*(id *)(a1 + 32) queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__SYOutgoingBatchSyncSession__sendSyncCancelled__block_invoke_2;
    block[3] = &unk_264422AB0;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(v9, block);
  }
  else
  {
    [*(id *)(a1 + 32) setError:v8];
    [*(id *)(a1 + 32) setState:5];
  }
  os_activity_scope_leave(&state);
}

uint64_t __48__SYOutgoingBatchSyncSession__sendSyncCancelled__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifySessionComplete];
}

- (void)_sendSyncRestart
{
  v8[1] = *MEMORY[0x263EF8340];
  id v3 = [(SYSession *)self queue];
  dispatch_assert_queue_V2(v3);

  if ([(SYOutgoingBatchSyncSession *)self canRestart])
  {
    [(NSMutableIndexSet *)self->_ackedBatchIndices removeAllIndexes];
    self->_batchIndex = 0;
    [(SYOutgoingBatchSyncSession *)self _sendSyncStart];
  }
  else
  {
    id v4 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v7 = *MEMORY[0x263F08320];
    v8[0] = @"This session does not support being restarted.";
    uint64_t v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
    id v6 = (void *)[v4 initWithSYError:2008 userInfo:v5];
    [(SYSession *)self setError:v6];

    self->_BOOL errorIsLocal = 1;
    [(SYOutgoingBatchSyncSession *)self setState:5];
  }
}

- (void)_sendSyncStart
{
  id v3 = [(SYSession *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(SYSession *)self service];
  uint64_t v5 = objc_opt_new();
  id v6 = (void *)[v4 _newMessageHeader];
  [v5 setHeader:v6];

  uint64_t v7 = [(SYSession *)self identifier];
  [v5 setSyncID:v7];

  id v8 = [v4 syncEngine];
  int64_t v9 = [(SYSession *)self priority];
  os_activity_scope_state_s v10 = [(SYSession *)self combinedEngineOptions:0];
  os_activity_scope_state_s v11 = [(SYSession *)self wrappedUserContext];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __44__SYOutgoingBatchSyncSession__sendSyncStart__block_invoke;
  v12[3] = &unk_264422E20;
  v12[4] = self;
  [v8 enqueueSyncRequest:v5 withMessageID:3 priority:v9 options:v10 userContext:v11 callback:v12];
}

void __44__SYOutgoingBatchSyncSession__sendSyncStart__block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(void *)(a1 + 32) + 264), &v11);
  int64_t v9 = *(void **)(a1 + 32);
  if (a2)
  {
    v9[28] = 0;
    uint64_t v10 = 1;
  }
  else
  {
    [v9 setError:v8];
    uint64_t v10 = 5;
  }
  [*(id *)(a1 + 32) setState:v10];
  os_activity_scope_leave(&v11);
}

- (void)_notifySessionComplete
{
  id v3 = [(SYSession *)self queue];
  dispatch_assert_queue_V2(v3);

  [(_SYCountedSemaphore *)self->_changeConcurrencySemaphore invalidate];
  id v4 = [(SYSession *)self targetQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__SYOutgoingBatchSyncSession__notifySessionComplete__block_invoke;
  block[3] = &unk_264422AB0;
  block[4] = self;
  dispatch_sync(v4, block);

  uint64_t v5 = [(SYSession *)self service];
  id v6 = [(SYSession *)self error];
  [v5 sessionDidEnd:self withError:v6];

  [(SYSession *)self didCompleteSession];
}

void __52__SYOutgoingBatchSyncSession__notifySessionComplete__block_invoke(uint64_t a1)
{
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  double v2 = qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_21C7C9000, v2, OS_LOG_TYPE_INFO, "Delegate: -syncSession:didEndWithError:", v6, 2u);
  }
  id v3 = [*(id *)(a1 + 32) delegate];
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v4 error];
  [v3 syncSession:v4 didEndWithError:v5];
}

- (void)_sessionComplete
{
  [(_SYCountedSemaphore *)self->_changeConcurrencySemaphore invalidate];
  sessionTimer = self->_sessionTimer;
  if (sessionTimer)
  {
    dispatch_source_cancel(sessionTimer);
    id v4 = self->_sessionTimer;
    self->_sessionTimer = 0;
  }
  if (self->_errorIsLocal && !self->_hasSentEnd)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __46__SYOutgoingBatchSyncSession__sessionComplete__block_invoke;
    v5[3] = &unk_264422AB0;
    v5[4] = self;
    [(SYOutgoingBatchSyncSession *)self _sendSyncCompleteAndRunBlock:v5];
  }
  else
  {
    [(SYOutgoingBatchSyncSession *)self _notifySessionComplete];
  }
}

uint64_t __46__SYOutgoingBatchSyncSession__sessionComplete__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setStateQuietly:5];
  double v2 = *(void **)(a1 + 32);
  return [v2 _notifySessionComplete];
}

- (void)_messageExpiredWithSeqno:(unint64_t)a3 identifier:(id)a4
{
  id v6 = a4;
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  id v7 = qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_ERROR)) {
    -[SYOutgoingBatchSyncSession _messageExpiredWithSeqno:identifier:]((uint64_t)v6, a3, v7);
  }
  id v8 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:2007 userInfo:0];
  [(SYSession *)self setError:v8];

  [(SYOutgoingBatchSyncSession *)self setState:5];
}

- (void)_processNextState
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = [(SYSession *)self queue];
  dispatch_assert_queue_V2(v3);

  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_sessionActivity, &v8);
  switch([(SYOutgoingBatchSyncSession *)self state])
  {
    case 1u:
      [(SYOutgoingBatchSyncSession *)self _waitForMessageWindow];
      break;
    case 2u:
      [(SYOutgoingBatchSyncSession *)self _sendSyncCompleteAndRunBlock:0];
      break;
    case 3u:
      self->_cancelled = 1;
      [(SYOutgoingBatchSyncSession *)self _sendSyncCancelled];
      break;
    case 4u:
      [(SYOutgoingBatchSyncSession *)self _sendSyncRestart];
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
      goto LABEL_11;
    case 9u:
LABEL_11:
      [(SYOutgoingBatchSyncSession *)self _sessionComplete];
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
  uint64_t v13 = __44__SYOutgoingBatchSyncSession__installTimers__block_invoke;
  int64_t v14 = &unk_264422C90;
  objc_copyWeak(&v15, &location);
  id v3 = (void *)MEMORY[0x21D4B17C0](&v11);
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

void __44__SYOutgoingBatchSyncSession__installTimers__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  WeakRetained = (os_activity_t *)objc_loadWeakRetained((id *)(a1 + 32));
  double v2 = WeakRetained;
  if (WeakRetained)
  {
    v7.opaque[0] = 0;
    v7.opaque[1] = 0;
    os_activity_scope_enter(WeakRetained[33], &v7);
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v3 = (id)qword_26AB04788;
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

- (void)_setMessageTimerForSeqno:(unint64_t)a3
{
  [(SYSession *)self perMessageTimeout];
  if (v5 != 0.0)
  {
    timers = self->_timers;
    os_activity_scope_state_s v7 = (void *)MEMORY[0x263EFF910];
    [(SYSession *)self perMessageTimeout];
    objc_msgSend(v7, "dateWithTimeIntervalSinceNow:");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    [(_SYMessageTimerTable *)timers addTimerWithFireDate:v8 forSequenceNumber:a3];
  }
}

- (void)_installStateListener
{
  id v3 = [(SYSession *)self queue];
  dispatch_assert_queue_V2(v3);

  double v4 = [(SYSession *)self queue];
  double v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF83B8], 0, 0, v4);
  stateUpdateSource = self->_stateUpdateSource;
  self->_stateUpdateSource = v5;

  objc_initWeak(&location, self);
  os_activity_scope_state_s v7 = self->_stateUpdateSource;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  void v8[2] = __51__SYOutgoingBatchSyncSession__installStateListener__block_invoke;
  v8[3] = &unk_264422C90;
  objc_copyWeak(&v9, &location);
  dispatch_source_set_event_handler(v7, v8);
  dispatch_resume((dispatch_object_t)self->_stateUpdateSource);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __51__SYOutgoingBatchSyncSession__installStateListener__block_invoke(uint64_t a1)
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
  double v5 = [(SYSession *)self delegate];

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
        uint64_t v20 = NSStringFromProtocol((Protocol *)&unk_26CD34ED8);
        v39[1] = @"SYDelegateMethodNames";
        v40[0] = v20;
        uint64_t v21 = NSStringFromSelector(sel_encodeSYChangeForBackwardCompatibility_protocolVersion_);
        v38[0] = v21;
        v22 = NSStringFromSelector(sel_dataWithSYObject_);
        v38[1] = v22;
        int64_t v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:2];
        v40[1] = v23;
        v24 = [NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:2];
        id v25 = (void *)[v19 initWithSYError:2020 userInfo:v24];

        id v26 = [(SYSession *)self queue];
        v30[0] = MEMORY[0x263EF8330];
        v30[1] = 3221225472;
        v30[2] = __36__SYOutgoingBatchSyncSession_start___block_invoke_2;
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
    int64_t v14 = (id)qword_26AB04788;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      int v17 = [(SYSession *)self identifier];
      *(_DWORD *)buf = 138543618;
      id v35 = v16;
      __int16 v36 = 2114;
      v37 = v17;
      _os_log_impl(&dword_21C7C9000, v14, OS_LOG_TYPE_DEFAULT, "Starting %{public}@ with identifier %{public}@", buf, 0x16u);
    }
    uint64_t v18 = [(SYSession *)self queue];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __36__SYOutgoingBatchSyncSession_start___block_invoke_88;
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
    id v9 = (void *)[v7 initWithSYError:2001 userInfo:v8];

    dispatch_time_t v10 = [(SYSession *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __36__SYOutgoingBatchSyncSession_start___block_invoke;
    block[3] = &unk_264422990;
    block[4] = self;
    id v33 = v9;
    id v11 = v9;
    dispatch_async(v10, block);

    v4[2](v4, 0, v11);
  }
LABEL_12:
}

void __36__SYOutgoingBatchSyncSession_start___block_invoke(uint64_t a1)
{
  v2.opaque[0] = 0;
  v2.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(void *)(a1 + 32) + 264), &v2);
  [*(id *)(a1 + 32) setError:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _notifySessionComplete];
  os_activity_scope_leave(&v2);
}

void __36__SYOutgoingBatchSyncSession_start___block_invoke_2(uint64_t a1)
{
  v2.opaque[0] = 0;
  v2.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(void *)(a1 + 32) + 264), &v2);
  [*(id *)(a1 + 32) setError:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _notifySessionComplete];
  os_activity_scope_leave(&v2);
}

uint64_t __36__SYOutgoingBatchSyncSession_start___block_invoke_88(uint64_t a1)
{
  os_activity_t v2 = _os_activity_create(&dword_21C7C9000, "SYSession (Outgoing)", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DETACHED);
  uint64_t v3 = *(void *)(a1 + 32);
  double v4 = *(void **)(v3 + 264);
  *(void *)(v3 + 264) = v2;

  [*(id *)(a1 + 32) didStartSession];
  [*(id *)(a1 + 32) _installStateListener];
  [*(id *)(a1 + 32) _installTimers];
  [*(id *)(a1 + 32) _setupChangeConcurrency];
  double v5 = *(void **)(a1 + 32);
  return [v5 _sendSyncStart];
}

- (void)cancelWithError:(id)a3
{
  id v4 = a3;
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_sessionActivity, &v8);
  double v5 = [v4 domain];
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
  [(SYOutgoingBatchSyncSession *)self setState:v7];
  os_activity_scope_leave(&v8);
}

- (BOOL)_handleBatchAck:(id)a3 error:(id *)a4
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
    -[NSMutableIndexSet addIndex:](self->_ackedBatchIndices, "addIndex:", [v6 chunkIndex]);
    [(_SYCountedSemaphore *)self->_changeConcurrencySemaphore signal];
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
        int v17 = v12;
        _os_log_impl(&dword_21C7C9000, v13, OS_LOG_TYPE_DEFAULT, "Received an error SYBatchChunkAck: %@", buf, 0xCu);
      }
      [(SYSession *)self setError:v12];
      [(SYOutgoingBatchSyncSession *)self setState:5];
    }
  }
  else if (a4)
  {
    *a4 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:2006 userInfo:0];
  }
  os_activity_scope_leave(&v15);

  return v9;
}

- (BOOL)_handleBatchSyncEndResponse:(id)a3 error:(id *)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v18.opaque[0] = 0;
  v18.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_sessionActivity, &v18);
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
        uint64_t v20 = v12;
        _os_log_impl(&dword_21C7C9000, v13, OS_LOG_TYPE_DEFAULT, "Received an error SYSyncEndResponse: %@", buf, 0xCu);
      }
      [(SYSession *)self setError:v12];
      [(SYOutgoingBatchSyncSession *)self setState:5];
    }
    else
    {
      if (-[NSMutableIndexSet countOfIndexesInRange:](self->_ackedBatchIndices, "countOfIndexesInRange:", 0, self->_batchIndex) == self->_batchIndex)
      {
        uint64_t v14 = 9;
      }
      else
      {
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        os_activity_scope_state_s v15 = qword_26AB04788;
        if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_ERROR)) {
          -[SYOutgoingBatchSyncSession _handleBatchSyncEndResponse:error:]((uint64_t *)&self->_batchIndex, (uint64_t *)&self->_ackedBatchIndices, v15);
        }
        id v16 = [MEMORY[0x263F087E8] errorWithSYError:2012 userInfo:0];
        [(SYSession *)self setError:v16];

        uint64_t v14 = 5;
      }
      [(SYOutgoingBatchSyncSession *)self setState:v14];
    }
  }
  else if (a4)
  {
    *a4 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:2006 userInfo:0];
  }
  os_activity_scope_leave(&v18);

  return v9;
}

- (void)_sentMessageWithIdentifier:(id)a3 userInfo:(id)a4
{
}

- (BOOL)canRestart
{
  return self->_canRestart;
}

- (void)setCanRestart:(BOOL)a3
{
  self->_canRestart = a3;
}

- (BOOL)canRollback
{
  return self->_canRollback;
}

- (void)setCanRollback:(BOOL)a3
{
  self->_canRollback = a3;
}

- (BOOL)wasCancelled
{
  return self->_cancelled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timers, 0);
  objc_storeStrong((id *)&self->_sessionActivity, 0);
  objc_storeStrong((id *)&self->_changeWaitActivity, 0);
  objc_storeStrong((id *)&self->_changeConcurrencySemaphore, 0);
  objc_storeStrong((id *)&self->_changeFetcherQueue, 0);
  objc_storeStrong((id *)&self->_ackedBatchIndices, 0);
  objc_storeStrong((id *)&self->_sessionTimer, 0);
  objc_storeStrong((id *)&self->_stateUpdateSource, 0);
}

- (void)_messageExpiredWithSeqno:(os_log_t)log identifier:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2114;
  uint64_t v6 = a1;
  _os_log_error_impl(&dword_21C7C9000, log, OS_LOG_TYPE_ERROR, "Send timed out for message with sequence number %llu, identifier %{public}@", (uint8_t *)&v3, 0x16u);
}

void __44__SYOutgoingBatchSyncSession__installTimers__block_invoke_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_21C7C9000, log, OS_LOG_TYPE_ERROR, "%{public}@ session timeout expired", buf, 0xCu);
}

- (void)_handleBatchSyncEndResponse:(os_log_t)log error:.cold.1(uint64_t *a1, uint64_t *a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  v5[0] = 67109378;
  v5[1] = v3;
  __int16 v6 = 2114;
  uint64_t v7 = v4;
  _os_log_error_impl(&dword_21C7C9000, log, OS_LOG_TYPE_ERROR, "Some sync batches were not acked. We sent {0-%u}, acked %{public}@", (uint8_t *)v5, 0x12u);
}

@end