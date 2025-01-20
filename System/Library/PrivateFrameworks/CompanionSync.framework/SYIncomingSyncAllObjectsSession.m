@interface SYIncomingSyncAllObjectsSession
- (BOOL)canRestart;
- (BOOL)canRollback;
- (SYIncomingSyncAllObjectsSession)initWithService:(id)a3 message:(id)a4 completion:(id)a5;
- (void)_continueProcessing;
- (void)_sendEndSessionResponse:(id)a3;
- (void)setCanRestart:(BOOL)a3;
- (void)setCanRollback:(BOOL)a3;
@end

@implementation SYIncomingSyncAllObjectsSession

- (SYIncomingSyncAllObjectsSession)initWithService:(id)a3 message:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SYIncomingSyncAllObjectsSession;
  v10 = [(SYIncomingFullSyncSession *)&v19 initWithService:a3];
  if (v10)
  {
    uint64_t v11 = [v8 allObjects];
    allObjectsAsData = v10->_allObjectsAsData;
    v10->_allObjectsAsData = (NSMutableArray *)v11;

    uint64_t v13 = [v9 copy];
    id completion = v10->_completion;
    v10->_id completion = (id)v13;

    v15 = [v8 header];
    [v15 timestamp];
    -[SYSession setBirthDate:](v10, "setBirthDate:");

    v16 = [v8 syncID];
    [(SYSession *)v10 setIdentifier:v16];

    v17 = v10;
  }

  return v10;
}

- (void)_sendEndSessionResponse:(id)a3
{
  id completion = (void (**)(id, id, id))self->_completion;
  id v5 = a3;
  id v6 = [(SYSession *)self wrappedUserContext];
  completion[2](completion, v5, v6);
}

- (void)_continueProcessing
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_fault_impl(&dword_21C7C9000, log, OS_LOG_TYPE_FAULT, "Unable to create an _SYLazyChangeArray object for %{public}@", buf, 0xCu);
}

void __54__SYIncomingSyncAllObjectsSession__continueProcessing__block_invoke(uint64_t a1)
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
  v7 = __54__SYIncomingSyncAllObjectsSession__continueProcessing__block_invoke_3;
  id v8 = &unk_264422968;
  uint64_t v9 = v4;
  objc_msgSend(v3, "syncSession:applyChanges:completion:");
}

void __54__SYIncomingSyncAllObjectsSession__continueProcessing__block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  uint64_t v6 = [*(id *)(a1 + 32) sessionActivity];
  os_activity_scope_enter(v6, &state);

  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  v7 = qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEBUG)) {
    __54__SYIncomingSyncAllObjectsSession__continueProcessing__block_invoke_3_cold_1(a2, v7);
  }
  id v8 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__SYIncomingSyncAllObjectsSession__continueProcessing__block_invoke_6;
  block[3] = &unk_264422940;
  char v14 = a2;
  uint64_t v9 = *(void *)(a1 + 32);
  id v12 = v5;
  uint64_t v13 = v9;
  id v10 = v5;
  dispatch_async(v8, block);

  os_activity_scope_leave(&state);
}

uint64_t __54__SYIncomingSyncAllObjectsSession__continueProcessing__block_invoke_6(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (!*(unsigned char *)(a1 + 48))
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    uint64_t v13 = (void *)qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
    {
      char v14 = *(void **)(a1 + 32);
      v15 = v13;
      v16 = _SYObfuscate(v14);
      int v19 = 138543362;
      v20 = v16;
      _os_log_impl(&dword_21C7C9000, v15, OS_LOG_TYPE_DEFAULT, "Client failed to process incoming SyncAllObjects, returning error: %{public}@", (uint8_t *)&v19, 0xCu);
    }
    [*(id *)(a1 + 40) setError:*(void *)(a1 + 32)];
    goto LABEL_19;
  }
  if ([*(id *)(a1 + 40) state] == 12)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    v2 = (void *)qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(void **)(a1 + 40);
      uint64_t v4 = v2;
      id v5 = [v3 error];
      uint64_t v6 = _SYObfuscate(v5);
      int v19 = 138543362;
      v20 = v6;
      _os_log_impl(&dword_21C7C9000, v4, OS_LOG_TYPE_DEFAULT, "Error occurred while waiting for SyncAllObjects ingestion, will set error state: %{public}@", (uint8_t *)&v19, 0xCu);
    }
    v7 = [*(id *)(a1 + 40) error];
    id v8 = [v7 domain];
    if ([v8 isEqualToString:@"SYErrorDomain"])
    {
      uint64_t v9 = [*(id *)(a1 + 40) error];
      uint64_t v10 = [v9 code];

      if (v10 == -128)
      {
        uint64_t v11 = *(void **)(a1 + 40);
        uint64_t v12 = 3;
        return [v11 setState:v12];
      }
    }
    else
    {
    }
LABEL_19:
    uint64_t v11 = *(void **)(a1 + 40);
    uint64_t v12 = 5;
    return [v11 setState:v12];
  }
  v17 = *(void **)(a1 + 40);
  return [v17 setState:9];
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
  objc_storeStrong((id *)&self->_allObjectsAsData, 0);
}

void __54__SYIncomingSyncAllObjectsSession__continueProcessing__block_invoke_3_cold_1(char a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2 = "NO";
  if (a1) {
    v2 = "YES";
  }
  int v3 = 136315138;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_21C7C9000, a2, OS_LOG_TYPE_DEBUG, "Delegate callout complete: -syncSession:applyChanges:completion:, v1 allObjects, success = %s", (uint8_t *)&v3, 0xCu);
}

@end