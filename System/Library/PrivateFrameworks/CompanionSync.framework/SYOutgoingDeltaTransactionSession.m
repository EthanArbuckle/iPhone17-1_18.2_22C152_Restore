@interface SYOutgoingDeltaTransactionSession
- (BOOL)canRestart;
- (BOOL)canRollback;
- (BOOL)isResetSync;
- (BOOL)isSending;
- (BOOL)wasCancelled;
- (SYOutgoingDeltaTransactionSession)initWithService:(id)a3;
- (unint64_t)protocolVersion;
- (unsigned)state;
- (void)_fetchNextBatch;
- (void)_installStateListener;
- (void)_messageExpiredWithSeqno:(unint64_t)a3 identifier:(id)a4;
- (void)_notifySessionComplete;
- (void)_peerProcessedMessageWithIdentifier:(id)a3 userInfo:(id)a4;
- (void)_processNextState;
- (void)_sendSyncBatch:(id)a3 nextState:(unsigned int)a4;
- (void)_sentMessageWithIdentifier:(id)a3 userInfo:(id)a4;
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

@implementation SYOutgoingDeltaTransactionSession

- (SYOutgoingDeltaTransactionSession)initWithService:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)SYOutgoingDeltaTransactionSession;
  v5 = [(SYSession *)&v30 initWithService:v4];
  v6 = v5;
  if (v5)
  {
    v5->_state = 0;
    v7 = [v4 serviceActivity];
    os_activity_t v8 = _os_activity_create(&dword_21C7C9000, "SYSession (Outgoing v1 Delta)", v7, OS_ACTIVITY_FLAG_DEFAULT);

    sessionActivity = v6->_sessionActivity;
    v6->_sessionActivity = (OS_os_activity *)v8;

    objc_initWeak(&location, v6);
    v10 = [_SYMessageTimerTable alloc];
    v11 = [(SYSession *)v6 queue];
    uint64_t v24 = MEMORY[0x263EF8330];
    uint64_t v25 = 3221225472;
    v26 = __53__SYOutgoingDeltaTransactionSession_initWithService___block_invoke;
    v27 = &unk_264422D30;
    objc_copyWeak(&v28, &location);
    uint64_t v12 = [(_SYMessageTimerTable *)v10 initWithQueue:v11 timerCallback:&v24];
    timers = v6->_timers;
    v6->_timers = (_SYMessageTimerTable *)v12;

    v14 = objc_msgSend(v4, "name", v24, v25, v26, v27);
    v15 = [v14 lastPathComponent];
    v16 = [v15 stringByAppendingString:@" Change Enqueuer"];

    id v17 = v16;
    dispatch_queue_t v18 = dispatch_queue_create((const char *)[v17 UTF8String], 0);
    changeFetcherQueue = v6->_changeFetcherQueue;
    v6->_changeFetcherQueue = (OS_dispatch_queue *)v18;

    v20 = objc_opt_new();
    v21 = [v20 UUIDString];
    [(SYSession *)v6 setIdentifier:v21];

    v22 = v6;
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __53__SYOutgoingDeltaTransactionSession_initWithService___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _messageExpiredWithSeqno:a2 identifier:v7];
  }
}

- (unsigned)state
{
  return self->_state;
}

- (void)setState:(unsigned int)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_sessionActivity, &v10);
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  v5 = (id)qword_26AB04788;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 138543618;
    uint64_t v12 = v7;
    __int16 v13 = 1024;
    unsigned int v14 = a3;
    _os_log_impl(&dword_21C7C9000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Setting state to %{companionsync:SYSessionState}d", buf, 0x12u);
  }
  os_activity_t v8 = self;
  objc_sync_enter(v8);
  v8->_state = a3;
  objc_sync_exit(v8);

  stateUpdateSource = v8->_stateUpdateSource;
  if (stateUpdateSource && !dispatch_source_testcancel((dispatch_source_t)v8->_stateUpdateSource)) {
    dispatch_source_merge_data(stateUpdateSource, 1uLL);
  }
  os_activity_scope_leave(&v10);
}

- (void)_setStateQuietly:(unsigned int)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_sessionActivity, &v8);
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  v5 = (id)qword_26AB04788;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 138543618;
    os_activity_scope_state_s v10 = v7;
    __int16 v11 = 1024;
    unsigned int v12 = a3;
    _os_log_impl(&dword_21C7C9000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Setting state (quietly) to %{companionsync:SYSessionState}d", buf, 0x12u);
  }
  self->_state = a3;
  os_activity_scope_leave(&v8);
}

- (BOOL)isResetSync
{
  return 0;
}

- (BOOL)isSending
{
  return 1;
}

- (unint64_t)protocolVersion
{
  return 1;
}

- (void)_setupChangeConcurrency
{
  if ([(SYSession *)self maxConcurrentMessages]
    && ([(SYSession *)self maxConcurrentMessages] & 0x8000000000000000) == 0)
  {
    v3 = [[_SYCountedSemaphore alloc] initWithCount:[(SYSession *)self maxConcurrentMessages]];
    changeConcurrencySemaphore = self->_changeConcurrencySemaphore;
    self->_changeConcurrencySemaphore = v3;

    v5 = (OS_os_activity *)_os_activity_create(&dword_21C7C9000, "Change Concurrency Wait", (os_activity_t)self->_sessionActivity, OS_ACTIVITY_FLAG_DEFAULT);
    changeWaitActivity = self->_changeWaitActivity;
    self->_changeWaitActivity = v5;
    MEMORY[0x270F9A758](v5, changeWaitActivity);
  }
}

- (void)_waitForMessageWindow
{
  if (self->_changeConcurrencySemaphore)
  {
    changeFetcherQueue = self->_changeFetcherQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58__SYOutgoingDeltaTransactionSession__waitForMessageWindow__block_invoke;
    block[3] = &unk_264422AB0;
    block[4] = self;
    dispatch_async(changeFetcherQueue, block);
  }
  else
  {
    [(SYOutgoingDeltaTransactionSession *)self _fetchNextBatch];
  }
}

void __58__SYOutgoingDeltaTransactionSession__waitForMessageWindow__block_invoke(uint64_t a1)
{
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(void *)(a1 + 32) + 248), &state);
  [*(id *)(a1 + 32) perMessageTimeout];
  double v3 = v2;
  if (v2 == 0.0)
  {
    id v4 = [*(id *)(a1 + 32) service];
    [v4 defaultMessageTimeout];
    double v3 = v5;
  }
  if ([*(id *)(*(void *)(a1 + 32) + 240) waitWithTimeout:v3 + v3])
  {
    v8.opaque[0] = 0;
    v8.opaque[1] = 0;
    os_activity_scope_enter(*(os_activity_t *)(*(void *)(a1 + 32) + 216), &v8);
    v6 = [*(id *)(a1 + 32) queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58__SYOutgoingDeltaTransactionSession__waitForMessageWindow__block_invoke_2;
    block[3] = &unk_264422AB0;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(v6, block);

    os_activity_scope_leave(&v8);
  }
  os_activity_scope_leave(&state);
}

uint64_t __58__SYOutgoingDeltaTransactionSession__waitForMessageWindow__block_invoke_2(uint64_t a1)
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
  v24[2] = __52__SYOutgoingDeltaTransactionSession__fetchNextBatch__block_invoke;
  v24[3] = &unk_264422D58;
  v24[4] = self;
  v26 = v27;
  id v5 = v4;
  id v25 = v5;
  v6 = (void *)MEMORY[0x21D4B17C0](v24);
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__1;
  v22 = __Block_byref_object_dispose__1;
  id v23 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  int v17 = 1;
  id v7 = [(SYSession *)self targetQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__SYOutgoingDeltaTransactionSession__fetchNextBatch__block_invoke_8;
  block[3] = &unk_264422D80;
  unsigned int v12 = &v14;
  block[4] = self;
  id v8 = v6;
  id v11 = v8;
  uint64_t v13 = &v18;
  dispatch_sync(v7, block);

  uint64_t v9 = *((unsigned int *)v15 + 6);
  if ((v9 - 1) >= 2)
  {
    if (v9 == 5)
    {
      [(SYSession *)self setError:v19[5]];
      uint64_t v9 = *((unsigned int *)v15 + 6);
    }
    [(SYOutgoingDeltaTransactionSession *)self setState:v9];
  }
  else
  {
    -[SYOutgoingDeltaTransactionSession _sendSyncBatch:nextState:](self, "_sendSyncBatch:nextState:", v5);
  }

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(v27, 8);
}

uint64_t __52__SYOutgoingDeltaTransactionSession__fetchNextBatch__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(void *)(a1 + 32) + 216), &v9);
  id v4 = [*(id *)(a1 + 32) serializer];
  id v5 = +[SYChange changeWithChangeObject:v3 serializer:v4 encodeUsingVersion:1];

  v6 = [v5 data];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += [v6 length];

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) >= 0x200000uLL
    && [*(id *)(a1 + 40) count])
  {
    uint64_t v7 = 0;
  }
  else
  {
    [*(id *)(a1 + 40) addObject:v5];
    uint64_t v7 = 1;
  }

  os_activity_scope_leave(&v9);
  return v7;
}

void __52__SYOutgoingDeltaTransactionSession__fetchNextBatch__block_invoke_8(uint64_t a1)
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
    id v8 = [(SYSession *)self service];
    id v9 = objc_opt_new();
    os_activity_scope_state_s v10 = (void *)[v8 _newMessageHeader];
    [v9 setHeader:v10];

    [v9 setChanges:v6];
    [(SYOutgoingDeltaTransactionSession *)self setState:8];
    id v11 = [v9 header];
    uint64_t v12 = [v11 sequenceNumber];

    [(SYOutgoingDeltaTransactionSession *)self _setMessageTimerForSeqno:v12];
    uint64_t v13 = [v8 syncEngine];
    int64_t v14 = [(SYSession *)self priority];
    uint64_t v15 = [(SYSession *)self combinedEngineOptions:0];
    uint64_t v16 = [(SYSession *)self wrappedUserContext];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __62__SYOutgoingDeltaTransactionSession__sendSyncBatch_nextState___block_invoke;
    v17[3] = &unk_264422DA8;
    v17[4] = self;
    v17[5] = v12;
    int v18 = v4;
    [v13 enqueueSyncRequest:v9 withMessageID:6 priority:v14 options:v15 userContext:v16 callback:v17];
  }
  else
  {
    [(_SYCountedSemaphore *)self->_changeConcurrencySemaphore signal];
    [(SYOutgoingDeltaTransactionSession *)self setState:v4];
  }
}

void __62__SYOutgoingDeltaTransactionSession__sendSyncBatch_nextState___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(void *)(a1 + 32) + 216), &v10);
  id v9 = *(void **)(*(void *)(a1 + 32) + 256);
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
    [*(id *)(a1 + 32) setState:5];
    [*(id *)(*(void *)(a1 + 32) + 240) signal];
  }
  os_activity_scope_leave(&v10);
}

- (void)_notifySessionComplete
{
  id v3 = [(SYSession *)self queue];
  dispatch_assert_queue_V2(v3);

  [(_SYCountedSemaphore *)self->_changeConcurrencySemaphore invalidate];
  stateUpdateSource = self->_stateUpdateSource;
  if (stateUpdateSource) {
    dispatch_source_cancel(stateUpdateSource);
  }
  uint64_t v5 = [(SYSession *)self targetQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__SYOutgoingDeltaTransactionSession__notifySessionComplete__block_invoke;
  block[3] = &unk_264422AB0;
  block[4] = self;
  dispatch_sync(v5, block);

  id v6 = [(SYSession *)self service];
  id v7 = [(SYSession *)self error];
  [v6 sessionDidEnd:self withError:v7];

  [(SYSession *)self didCompleteSession];
}

void __59__SYOutgoingDeltaTransactionSession__notifySessionComplete__block_invoke(uint64_t a1)
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
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v4 error];
  [v3 syncSession:v4 didEndWithError:v5];
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

  [(SYOutgoingDeltaTransactionSession *)self setState:5];
}

- (void)_processNextState
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = [(SYSession *)self queue];
  dispatch_assert_queue_V2(v3);

  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_sessionActivity, &v8);
  uint64_t v4 = self;
  objc_sync_enter(v4);
  LODWORD(v3) = v4->_state;
  objc_sync_exit(v4);

  switch((int)v3)
  {
    case 1:
      [(SYOutgoingDeltaTransactionSession *)v4 _waitForMessageWindow];
      break;
    case 2:
      [(SYOutgoingDeltaTransactionSession *)v4 setState:9];
      break;
    case 4:
      uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:2008 userInfo:0];
      [(SYSession *)v4 setError:v5];

      break;
    case 5:
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      id v6 = (id)qword_26AB04788;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = [(SYSession *)v4 error];
        *(_DWORD *)buf = 138412290;
        os_activity_scope_state_s v10 = v7;
        _os_log_impl(&dword_21C7C9000, v6, OS_LOG_TYPE_DEFAULT, "SYSession entered error state. Error = %@", buf, 0xCu);
      }
      goto LABEL_10;
    case 9:
LABEL_10:
      [(SYOutgoingDeltaTransactionSession *)v4 _notifySessionComplete];
      break;
    default:
      break;
  }
  os_activity_scope_leave(&v8);
}

- (void)_setMessageTimerForSeqno:(unint64_t)a3
{
  [(SYSession *)self perMessageTimeout];
  if (v5 != 0.0)
  {
    timers = self->_timers;
    id v7 = (void *)MEMORY[0x263EFF910];
    [(SYSession *)self perMessageTimeout];
    objc_msgSend(v7, "dateWithTimeIntervalSinceNow:");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    [(_SYMessageTimerTable *)timers addTimerWithFireDate:v8 forSequenceNumber:a3];
  }
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
  v7[2] = __58__SYOutgoingDeltaTransactionSession__installStateListener__block_invoke;
  v7[3] = &unk_264422C90;
  objc_copyWeak(&v8, &location);
  dispatch_source_set_event_handler(v6, v7);
  dispatch_resume((dispatch_object_t)self->_stateUpdateSource);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __58__SYOutgoingDeltaTransactionSession__installStateListener__block_invoke(uint64_t a1)
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
  uint64_t v4 = (void (**)(id, void, id))a3;
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
        v21 = NSStringFromSelector(sel_encodeSYChangeForBackwardCompatibility_protocolVersion_);
        v38[0] = v21;
        v22 = NSStringFromSelector(sel_dataWithSYObject_);
        v38[1] = v22;
        id v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:2];
        v40[1] = v23;
        uint64_t v24 = [NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:2];
        id v25 = (void *)[v19 initWithSYError:2020 userInfo:v24];

        v26 = [(SYSession *)self queue];
        v30[0] = MEMORY[0x263EF8330];
        v30[1] = 3221225472;
        v30[2] = __43__SYOutgoingDeltaTransactionSession_start___block_invoke_2;
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
      uint64_t v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      int v17 = [(SYSession *)self identifier];
      *(_DWORD *)buf = 138543618;
      id v35 = v16;
      __int16 v36 = 2114;
      v37 = v17;
      _os_log_impl(&dword_21C7C9000, v14, OS_LOG_TYPE_DEFAULT, "Starting %{public}@ with identifier %{public}@", buf, 0x16u);
    }
    int v18 = [(SYSession *)self queue];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __43__SYOutgoingDeltaTransactionSession_start___block_invoke_82;
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

    os_activity_scope_state_s v10 = [(SYSession *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __43__SYOutgoingDeltaTransactionSession_start___block_invoke;
    block[3] = &unk_264422990;
    block[4] = self;
    id v33 = v9;
    id v11 = v9;
    dispatch_async(v10, block);

    v4[2](v4, 0, v11);
  }
LABEL_12:
}

void __43__SYOutgoingDeltaTransactionSession_start___block_invoke(uint64_t a1)
{
  v2.opaque[0] = 0;
  v2.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(void *)(a1 + 32) + 216), &v2);
  [*(id *)(a1 + 32) setError:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _notifySessionComplete];
  os_activity_scope_leave(&v2);
}

void __43__SYOutgoingDeltaTransactionSession_start___block_invoke_2(uint64_t a1)
{
  v2.opaque[0] = 0;
  v2.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(void *)(a1 + 32) + 216), &v2);
  [*(id *)(a1 + 32) setError:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _notifySessionComplete];
  os_activity_scope_leave(&v2);
}

uint64_t __43__SYOutgoingDeltaTransactionSession_start___block_invoke_82(uint64_t a1)
{
  [*(id *)(a1 + 32) didStartSession];
  [*(id *)(a1 + 32) _installStateListener];
  [*(id *)(a1 + 32) _setupChangeConcurrency];
  os_activity_scope_state_s v2 = *(void **)(a1 + 32);
  return [v2 setState:1];
}

- (void)cancelWithError:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [v7 domain];
  if ([v4 isEqualToString:@"SYErrorDomain"])
  {
    uint64_t v5 = [v7 code];

    if (v5 == -128)
    {
      self->_cancelled = 1;
      uint64_t v6 = 3;
      goto LABEL_6;
    }
  }
  else
  {
  }
  [(SYSession *)self setError:v7];
  uint64_t v6 = 5;
LABEL_6:
  [(SYOutgoingDeltaTransactionSession *)self setState:v6];
}

- (void)_sentMessageWithIdentifier:(id)a3 userInfo:(id)a4
{
  -[_SYMessageTimerTable cancelTimerForIdentifier:](self->_timers, "cancelTimerForIdentifier:", a3, a4);
  if (![(_SYMessageTimerTable *)self->_timers timerCount]
    && [(SYOutgoingDeltaTransactionSession *)self state] == 7)
  {
    [(SYOutgoingDeltaTransactionSession *)self setState:9];
  }
}

- (void)_peerProcessedMessageWithIdentifier:(id)a3 userInfo:(id)a4
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
  objc_storeStrong((id *)&self->_changeWaitActivity, 0);
  objc_storeStrong((id *)&self->_changeConcurrencySemaphore, 0);
  objc_storeStrong((id *)&self->_changeFetcherQueue, 0);
  objc_storeStrong((id *)&self->_sessionActivity, 0);
  objc_storeStrong((id *)&self->_stateUpdateSource, 0);
}

@end