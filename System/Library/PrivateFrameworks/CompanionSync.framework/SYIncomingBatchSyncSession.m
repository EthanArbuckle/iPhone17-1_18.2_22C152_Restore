@interface SYIncomingBatchSyncSession
- (BOOL)canRestart;
- (BOOL)canRollback;
- (SYIncomingBatchSyncSession)initWithService:(id)a3;
- (void)_continueProcessing;
- (void)_handleBatchChunk:(id)a3 completion:(id)a4;
- (void)_handleEndSync:(id)a3 completion:(id)a4;
- (void)_sendEndSessionResponse:(id)a3;
- (void)setCanRestart:(BOOL)a3;
- (void)setCanRollback:(BOOL)a3;
@end

@implementation SYIncomingBatchSyncSession

- (SYIncomingBatchSyncSession)initWithService:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SYIncomingBatchSyncSession;
  v3 = [(SYIncomingFullSyncSession *)&v10 initWithService:a3];
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    receivedBatchIndices = v3->_receivedBatchIndices;
    v3->_receivedBatchIndices = (NSMutableIndexSet *)v4;

    uint64_t v6 = objc_opt_new();
    incomingBatchQueue = v3->_incomingBatchQueue;
    v3->_incomingBatchQueue = (NSMutableArray *)v6;

    v3->_queueLock._os_unfair_lock_opaque = 0;
    v8 = v3;
  }

  return v3;
}

- (void)_sendEndSessionResponse:(id)a3
{
  completion = (void (**)(id, id, id))self->_completion;
  if (completion)
  {
    id v5 = a3;
    id v6 = [(SYSession *)self wrappedUserContext];
    completion[2](completion, v5, v6);
  }
}

- (void)_continueProcessing
{
  v3 = [(SYSession *)self queue];
  dispatch_assert_queue_V2(v3);

  os_unfair_lock_lock(&self->_queueLock);
  uint64_t v4 = [(NSMutableArray *)self->_incomingBatchQueue firstObject];
  if (v4)
  {
    [(NSMutableArray *)self->_incomingBatchQueue removeObjectAtIndex:0];
    os_unfair_lock_unlock(&self->_queueLock);
    id v5 = objc_opt_new();
    id v6 = [v4 batch];
    objc_msgSend(v5, "setChunkIndex:", objc_msgSend(v6, "chunkIndex"));

    v7 = [v4 batch];
    v8 = [v7 syncID];
    [v5 setSyncID:v8];

    unsigned int v9 = [(SYIncomingFullSyncSession *)self state];
    if (v9 == 5)
    {
      objc_super v10 = [SYErrorInfo alloc];
      uint64_t v11 = [(SYSession *)self error];
    }
    else
    {
      if (v9 != 3) {
        goto LABEL_9;
      }
      objc_super v10 = [SYErrorInfo alloc];
      uint64_t v11 = [objc_alloc(MEMORY[0x263F087E8]) initWithSYError:-128 userInfo:0];
    }
    v12 = (void *)v11;
    v13 = [(SYErrorInfo *)v10 initWithError:v11];
    [v5 setError:v13];

LABEL_9:
    v14 = [v5 error];

    if (v14)
    {
      v15 = [v4 completion];
      v16 = [(SYSession *)self wrappedUserContext];
      ((void (**)(void, void *, void *))v15)[2](v15, v5, v16);
    }
    id v17 = objc_alloc(MEMORY[0x263EFF980]);
    v18 = [v4 batch];
    v19 = [v18 objects];
    v20 = objc_msgSend(v17, "initWithCapacity:", objc_msgSend(v19, "count"));

    v21 = [v4 batch];
    v22 = [v21 objects];
    uint64_t v23 = [v22 count];

    if (v23 >= 1)
    {
      do
      {
        [v20 addObject:&unk_26CD33910];
        --v23;
      }
      while (v23);
    }
    v24 = [_SYLazyChangeArray alloc];
    v25 = [v4 batch];
    v26 = [v25 objects];
    v27 = [(SYSession *)self serializer];
    v28 = [(_SYLazyChangeArray *)v24 initWithSYObjectDataArray:v26 typeArray:v20 decoder:v27];

    if (v28)
    {
      [(SYIncomingFullSyncSession *)self setState:11];
      v29 = [(SYSession *)self targetQueue];
      uint64_t v40 = MEMORY[0x263EF8330];
      uint64_t v41 = 3221225472;
      v42 = __49__SYIncomingBatchSyncSession__continueProcessing__block_invoke;
      v43 = &unk_264423228;
      v44 = self;
      v45 = v28;
      id v46 = v5;
      id v47 = v4;
      dispatch_sync(v29, &v40);
    }
    else
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      v30 = (void *)qword_26AB04788;
      if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_ERROR)) {
        -[SYIncomingTransactionSession _sendChanges](v30);
      }
      v31 = [SYErrorInfo alloc];
      v32 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:2001 userInfo:0];
      v33 = [(SYErrorInfo *)v31 initWithError:v32];
      [v5 setError:v33];

      v34 = [(SYSession *)self service];
      v35 = (void *)[v34 _newMessageHeader];
      [v5 setHeader:v35];

      v36 = [v4 completion];
      v37 = [(SYSession *)self wrappedUserContext];
      ((void (**)(void, void *, void *))v36)[2](v36, v5, v37);
    }
    os_unfair_lock_lock(&self->_queueLock);
    uint64_t v38 = [(NSMutableArray *)self->_incomingBatchQueue count];
    os_unfair_lock_unlock(&self->_queueLock);
    if (v38)
    {
      uint64_t v39 = 1;
    }
    else
    {
      if (!self->_hasReceivedEndSync)
      {
LABEL_25:

        goto LABEL_26;
      }
      uint64_t v39 = 9;
    }
    -[SYIncomingFullSyncSession setState:](self, "setState:", v39, v40, v41, v42, v43, v44);
    goto LABEL_25;
  }
  os_unfair_lock_unlock(&self->_queueLock);
  if (self->_hasReceivedEndSync) {
    [(SYIncomingFullSyncSession *)self setState:9];
  }
LABEL_26:
}

void __49__SYIncomingBatchSyncSession__continueProcessing__block_invoke(uint64_t a1)
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
  uint64_t v5 = *(void *)(a1 + 40);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__SYIncomingBatchSyncSession__continueProcessing__block_invoke_24;
  v8[3] = &unk_264423E38;
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 32);
  id v9 = v6;
  uint64_t v10 = v7;
  id v11 = *(id *)(a1 + 56);
  [v3 syncSession:v4 applyChanges:v5 completion:v8];
}

void __49__SYIncomingBatchSyncSession__continueProcessing__block_invoke_24(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  id v6 = (void *)qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEBUG)) {
    __49__SYIncomingBatchSyncSession__continueProcessing__block_invoke_24_cold_1(a1, v6, a2);
  }
  uint64_t v7 = [*(id *)(a1 + 40) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__SYIncomingBatchSyncSession__continueProcessing__block_invoke_27;
  block[3] = &unk_264423E10;
  id v8 = *(id *)(a1 + 32);
  char v17 = a2;
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void **)(a1 + 48);
  id v13 = v8;
  uint64_t v14 = v9;
  id v15 = v5;
  id v16 = v10;
  id v11 = v5;
  dispatch_async(v7, block);
}

void __49__SYIncomingBatchSyncSession__continueProcessing__block_invoke_27(uint64_t a1)
{
  *(void *)&v26[5] = *MEMORY[0x263EF8340];
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  v2 = (void *)qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_INFO))
  {
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = v2;
    int v5 = [v3 chunkIndex];
    id v6 = "YES";
    if (!*(unsigned char *)(a1 + 64)) {
      id v6 = "NO";
    }
    int v25 = 67109378;
    v26[0] = v5;
    LOWORD(v26[1]) = 2080;
    *(void *)((char *)&v26[1] + 2) = v6;
    _os_log_impl(&dword_21C7C9000, v4, OS_LOG_TYPE_INFO, "Building response for processed changes, chunkIndex = %u, success = %s", (uint8_t *)&v25, 0x12u);
  }
  uint64_t v7 = [*(id *)(a1 + 40) service];
  id v8 = (void *)[v7 _newMessageHeader];
  [*(id *)(a1 + 32) setHeader:v8];

  if (*(unsigned char *)(a1 + 64))
  {
    if ([*(id *)(a1 + 40) state] == 12)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      uint64_t v9 = (void *)qword_26AB04788;
      if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void **)(a1 + 40);
        id v11 = v9;
        v12 = [v10 error];
        id v13 = _SYObfuscate(v12);
        int v25 = 138543362;
        *(void *)v26 = v13;
        _os_log_impl(&dword_21C7C9000, v11, OS_LOG_TYPE_DEFAULT, "Error occurred while waiting for v1 Sync Batch ingestion, returning error: %{public}@", (uint8_t *)&v25, 0xCu);
      }
      uint64_t v14 = [SYErrorInfo alloc];
      id v15 = [*(id *)(a1 + 40) error];
      id v16 = [(SYErrorInfo *)v14 initWithError:v15];
      [*(id *)(a1 + 32) setError:v16];

      [*(id *)(a1 + 40) setState:5];
    }
  }
  else
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    char v17 = (void *)qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
    {
      v18 = *(void **)(a1 + 32);
      v19 = v17;
      LODWORD(v18) = [v18 chunkIndex];
      v20 = _SYObfuscate(*(void **)(a1 + 48));
      int v25 = 67109378;
      v26[0] = v18;
      LOWORD(v26[1]) = 2114;
      *(void *)((char *)&v26[1] + 2) = v20;
      _os_log_impl(&dword_21C7C9000, v19, OS_LOG_TYPE_DEFAULT, "Client failed to process incoming BatchSyncChunk (%u), returning error: %{public}@", (uint8_t *)&v25, 0x12u);
    }
    v21 = [[SYErrorInfo alloc] initWithError:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) setError:v21];
  }
  v22 = [*(id *)(a1 + 56) completion];
  uint64_t v23 = *(void *)(a1 + 32);
  v24 = [*(id *)(a1 + 40) wrappedUserContext];
  ((void (**)(void, uint64_t, void *))v22)[2](v22, v23, v24);
}

- (void)_handleBatchChunk:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SYIncomingFullSyncSession *)self sessionActivity];
  os_activity_scope_enter(v8, &v10);

  uint64_t v9 = objc_opt_new();
  [v9 setBatch:v6];
  [v9 setCompletion:v7];
  os_unfair_lock_lock(&self->_queueLock);
  [(NSMutableArray *)self->_incomingBatchQueue addObject:v9];
  os_unfair_lock_unlock(&self->_queueLock);
  [(SYIncomingFullSyncSession *)self setState:1];

  os_activity_scope_leave(&v10);
}

- (void)_handleEndSync:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SYIncomingFullSyncSession *)self sessionActivity];
  os_activity_scope_enter(v8, &v11);

  uint64_t v9 = (void *)[v7 copy];
  id completion = self->_completion;
  self->_id completion = v9;

  self->_hasReceivedEndSync = 1;
  [(SYIncomingFullSyncSession *)self setState:1];
  os_activity_scope_leave(&v11);
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
  objc_storeStrong((id *)&self->_incomingBatchQueue, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_receivedBatchIndices, 0);
  objc_storeStrong((id *)&self->_sessionTimer, 0);
}

void __49__SYIncomingBatchSyncSession__continueProcessing__block_invoke_24_cold_1(uint64_t a1, void *a2, char a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void **)(a1 + 32);
  int v5 = a2;
  int v6 = [v4 chunkIndex];
  id v7 = "NO";
  if (a3) {
    id v7 = "YES";
  }
  v8[0] = 67109378;
  v8[1] = v6;
  __int16 v9 = 2080;
  os_activity_scope_state_s v10 = v7;
  _os_log_debug_impl(&dword_21C7C9000, v5, OS_LOG_TYPE_DEBUG, "Delegate callout complete: -syncSession:applyChanges:completion:, v1 chunkIndex = %u, success = %s", (uint8_t *)v8, 0x12u);
}

@end