@interface DBWorkspace
- (DBWorkspace)init;
- (DBWorkspace)initWithOwner:(id)a3;
- (DBWorkspaceState)state;
- (id)_createStateChangeSession;
- (void)_invalidateSession:(id)a3;
- (void)_setState:(id)a3;
- (void)addObserver:(id)a3;
- (void)invalidate;
- (void)removeObserver:(id)a3;
- (void)requestStateChange:(id)a3;
@end

@implementation DBWorkspace

- (DBWorkspace)init
{
  return 0;
}

- (DBWorkspace)initWithOwner:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DBWorkspace;
  v6 = [(DBWorkspace *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_owner, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    pendingRequests = v7->_pendingRequests;
    v7->_pendingRequests = v8;

    v13 = v7;
    uint64_t v10 = BSLogAddStateCaptureBlockWithTitle();
    pendingRequestsStateCaptureBlock = v13->_pendingRequestsStateCaptureBlock;
    v13->_pendingRequestsStateCaptureBlock = (BSInvalidatable *)v10;
  }
  return v7;
}

uint64_t __29__DBWorkspace_initWithOwner___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) description];
}

- (void)invalidate
{
  self->_invalidated = 1;
  pendingRequests = self->_pendingRequests;
  self->_pendingRequests = 0;

  observers = self->_observers;
  self->_observers = 0;

  [(BSInvalidatable *)self->_pendingRequestsStateCaptureBlock invalidate];
  pendingRequestsStateCaptureBlock = self->_pendingRequestsStateCaptureBlock;
  self->_pendingRequestsStateCaptureBlock = 0;
}

- (void)_setState:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = (DBWorkspaceState *)a3;
  state = self->_state;
  if (state != v5)
  {
    v7 = state;
    objc_storeStrong((id *)&self->_state, a3);
    v8 = DBLogForCategory(6uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v5;
      _os_log_impl(&dword_22D6F0000, v8, OS_LOG_TYPE_DEFAULT, "State changed: %@", buf, 0xCu);
    }

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v9 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * v13++) workspace:self stateDidChangeFromState:v7 toState:self->_state];
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
}

- (void)requestStateChange:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v4 = (_DBWorkspaceStateChangeSession *)a3;
  currentSession = self->_currentSession;
  if (currentSession)
  {
    uint64_t v6 = [(DBWorkspaceOwner *)self->_owner session:currentSession policyForRequest:v4];
    if (v6 != 1)
    {
      if (!v6)
      {
        v7 = DBLogForCategory(6uLL);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 138412290;
          uint64_t v13 = v4;
          _os_log_impl(&dword_22D6F0000, v7, OS_LOG_TYPE_DEFAULT, "Pending request: %@", (uint8_t *)&v12, 0xCu);
        }

        [(NSMutableArray *)self->_pendingRequests addObject:v4];
      }
      goto LABEL_11;
    }
  }
  else
  {
    v8 = [(DBWorkspace *)self _createStateChangeSession];
    v9 = self->_currentSession;
    self->_currentSession = v8;

    [(_DBWorkspaceStateChangeSession *)self->_currentSession setOwner:self->_owner];
    [(DBWorkspaceOwner *)self->_owner workspace:self didBeginStateChangeSession:self->_currentSession];
  }
  uint64_t v10 = DBLogForCategory(6uLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = self->_currentSession;
    int v12 = 134218242;
    uint64_t v13 = v11;
    __int16 v14 = 2112;
    long long v15 = v4;
    _os_log_impl(&dword_22D6F0000, v10, OS_LOG_TYPE_DEFAULT, "Handling request in current session (%p): %@", (uint8_t *)&v12, 0x16u);
  }

  [(_DBWorkspaceStateChangeSession *)self->_currentSession _startWatchdogTimer];
  [(DBWorkspaceOwner *)self->_owner session:self->_currentSession handleStateChangeRequest:v4];
LABEL_11:
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && !self->_invalidated)
  {
    observers = self->_observers;
    id v9 = v5;
    if (!observers)
    {
      v7 = [MEMORY[0x263F088B0] hashTableWithWeakObjects];
      v8 = self->_observers;
      self->_observers = v7;

      observers = self->_observers;
    }
    id v4 = (id)[(NSHashTable *)observers addObject:v9];
    id v5 = v9;
  }
  MEMORY[0x270F9A758](v4, v5);
}

- (void)removeObserver:(id)a3
{
  if (a3) {
    -[NSHashTable removeObject:](self->_observers, "removeObject:");
  }
}

- (id)_createStateChangeSession
{
  v3 = [_DBWorkspaceStateChangeSession alloc];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__DBWorkspace__createStateChangeSession__block_invoke;
  v7[3] = &unk_2649B4F68;
  v7[4] = self;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__DBWorkspace__createStateChangeSession__block_invoke_2;
  v6[3] = &unk_2649B4F90;
  v6[4] = self;
  id v4 = [(_DBWorkspaceStateChangeSession *)v3 initWithStateChangeBlock:v7 invalidationBlock:v6];
  return v4;
}

uint64_t __40__DBWorkspace__createStateChangeSession__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _setState:a2];
}

uint64_t __40__DBWorkspace__createStateChangeSession__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _invalidateSession:a2];
}

- (void)_invalidateSession:(id)a3
{
  currentSession = self->_currentSession;
  self->_currentSession = 0;
  id v5 = a3;

  [(DBWorkspaceOwner *)self->_owner workspace:self didEndStateChangeSession:v5];
  if ([(NSMutableArray *)self->_pendingRequests count])
  {
    id v6 = [(NSMutableArray *)self->_pendingRequests firstObject];
    [(NSMutableArray *)self->_pendingRequests removeObjectAtIndex:0];
    [(DBWorkspace *)self requestStateChange:v6];
  }
}

- (DBWorkspaceState)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingRequestsStateCaptureBlock, 0);
  objc_storeStrong((id *)&self->_currentSession, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_owner, 0);
}

@end