@interface CSRemoteContentSessionManager
- (CSRemoteContentSessionHostDelegate)forwardingHostDelegate;
- (CSRemoteContentSessionManager)initWithAuthenticationStatusProvider:(id)a3;
- (SBFAuthenticationStatusProvider)authenticationStatusProvider;
- (id)_queue_createSessionWithDefinition:(id)a3;
- (id)_queue_existingSessions;
- (id)_queue_existingSessionsWithDefinition:(id)a3;
- (id)createSessionWithDefinition:(id)a3;
- (id)existingSessions;
- (id)existingSessionsWithDefinition:(id)a3;
- (id)preferencesForRemoteContentSession:(id)a3;
- (void)didInvalidateSessionWithSessionID:(id)a3;
- (void)remoteContentSession:(id)a3 didUpdateWithPreferences:(id)a4;
- (void)setForwardingHostDelegate:(id)a3;
@end

@implementation CSRemoteContentSessionManager

- (CSRemoteContentSessionManager)initWithAuthenticationStatusProvider:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CSRemoteContentSessionManager;
  v6 = [(CSRemoteContentSessionManager *)&v11 init];
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.SpringBoard.CSRemoteContentSessionManager.accessSerialQueue", v7);
    accessSerialQueue = v6->_accessSerialQueue;
    v6->_accessSerialQueue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v6->_authenticationStatusProvider, a3);
  }

  return v6;
}

- (id)existingSessions
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__3;
  v10 = __Block_byref_object_dispose__3;
  id v11 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__CSRemoteContentSessionManager_existingSessions__block_invoke;
  v5[3] = &unk_1E6ADA9F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessSerialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __49__CSRemoteContentSessionManager_existingSessions__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_existingSessions");
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)existingSessionsWithDefinition:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  id v17 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__CSRemoteContentSessionManager_existingSessionsWithDefinition___block_invoke;
  block[3] = &unk_1E6ADAA18;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(accessSerialQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __64__CSRemoteContentSessionManager_existingSessionsWithDefinition___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_existingSessionsWithDefinition:", *(void *)(a1 + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)createSessionWithDefinition:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  id v17 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__CSRemoteContentSessionManager_createSessionWithDefinition___block_invoke;
  block[3] = &unk_1E6ADAA18;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(accessSerialQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __61__CSRemoteContentSessionManager_createSessionWithDefinition___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_createSessionWithDefinition:", *(void *)(a1 + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)didInvalidateSessionWithSessionID:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SBLogDashBoard();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v4;
    _os_log_impl(&dword_1D839D000, v5, OS_LOG_TYPE_DEFAULT, "[RemoteContent] Remove session %{public}@", buf, 0xCu);
  }

  accessSerialQueue = self->_accessSerialQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__CSRemoteContentSessionManager_didInvalidateSessionWithSessionID___block_invoke;
  v8[3] = &unk_1E6AD88C0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(accessSerialQueue, v8);
}

uint64_t __67__CSRemoteContentSessionManager_didInvalidateSessionWithSessionID___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:*(void *)(a1 + 40)];
}

- (id)_queue_createSessionWithDefinition:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessSerialQueue);
  id v5 = [[CSRemoteContentSession alloc] initWithDefinition:v4 authenticationStatusProvider:self->_authenticationStatusProvider];
  id v6 = [(CSRemoteContentSession *)v5 sessionID];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_forwardingHostDelegate);
  [(CSRemoteContentSession *)v5 setHostDelegate:WeakRetained];

  [(CSRemoteContentSession *)v5 setPreferencesProvider:self];
  if (self->_sessionIDToSession)
  {
    v24 = v6;
    v25 = v5;
    id v8 = v4;
    id v9 = [(CSRemoteContentSessionManager *)self _queue_existingSessionsWithDefinition:v4];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          v15 = SBLogDashBoard();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            v16 = [v14 sessionID];
            *(_DWORD *)buf = 138543618;
            v31 = v16;
            __int16 v32 = 2114;
            id v33 = v8;
            _os_log_impl(&dword_1D839D000, v15, OS_LOG_TYPE_DEFAULT, "[RemoteContent] Removing stale session %{public}@ that matches incoming definition: %{public}@", buf, 0x16u);
          }
          sessionIDToSession = self->_sessionIDToSession;
          v18 = [v14 sessionID];
          [(NSMutableDictionary *)sessionIDToSession removeObjectForKey:v18];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v11);
    }

    id v4 = v8;
    id v6 = v24;
    id v5 = v25;
  }
  else
  {
    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v20 = self->_sessionIDToSession;
    self->_sessionIDToSession = v19;
  }
  [(NSMutableDictionary *)self->_sessionIDToSession setObject:v5 forKey:v6];
  v21 = SBLogDashBoard();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = [(CSRemoteContentSession *)v5 sessionID];
    *(_DWORD *)buf = 138543618;
    v31 = v22;
    __int16 v32 = 2114;
    id v33 = v4;
    _os_log_impl(&dword_1D839D000, v21, OS_LOG_TYPE_DEFAULT, "[RemoteContent] Created session %{public}@ for definition: %{public}@", buf, 0x16u);
  }

  return v5;
}

- (id)_queue_existingSessions
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessSerialQueue);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [(NSMutableDictionary *)self->_sessionIDToSession objectEnumerator];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        if (!v6) {
          id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
        }
        [v6 addObject:v9];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_queue_existingSessionsWithDefinition:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessSerialQueue);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = [(NSMutableDictionary *)self->_sessionIDToSession objectEnumerator];
  uint64_t v4 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v10 = [v9 definition];
        id v11 = v21;
        long long v12 = [v10 serviceName];
        long long v13 = [v11 serviceName];
        int v14 = [v12 isEqualToString:v13];

        v15 = [v10 viewControllerClassName];
        uint64_t v16 = [v11 viewControllerClassName];

        int v17 = [v15 isEqualToString:v16];
        if (v14) {
          BOOL v18 = v17 == 0;
        }
        else {
          BOOL v18 = 1;
        }
        if (!v18)
        {
          if (!v6) {
            id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
          }
          [v6 addObject:v9];
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)preferencesForRemoteContentSession:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__3;
  uint64_t v16 = __Block_byref_object_dispose__3;
  id v17 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__CSRemoteContentSessionManager_preferencesForRemoteContentSession___block_invoke;
  block[3] = &unk_1E6ADAA18;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(accessSerialQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __68__CSRemoteContentSessionManager_preferencesForRemoteContentSession___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  id v7 = [*(id *)(a1 + 40) definition];
  uint64_t v3 = [v7 serviceName];
  uint64_t v4 = [v2 objectForKey:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)remoteContentSession:(id)a3 didUpdateWithPreferences:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  accessSerialQueue = self->_accessSerialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__CSRemoteContentSessionManager_remoteContentSession_didUpdateWithPreferences___block_invoke;
  block[3] = &unk_1E6AD8848;
  id v12 = v7;
  long long v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(accessSerialQueue, block);
}

void __79__CSRemoteContentSessionManager_remoteContentSession_didUpdateWithPreferences___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    uint64_t v3 = *(void **)(*(void *)(a1 + 40) + 24);
    if (!v3)
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v5 = *(void *)(a1 + 40);
      id v6 = *(void **)(v5 + 24);
      *(void *)(v5 + 24) = v4;

      uint64_t v1 = *(void *)(a1 + 32);
      uint64_t v3 = *(void **)(*(void *)(a1 + 40) + 24);
    }
    id v8 = [*(id *)(a1 + 48) definition];
    id v7 = [v8 serviceName];
    [v3 setObject:v1 forKey:v7];
  }
}

- (CSRemoteContentSessionHostDelegate)forwardingHostDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_forwardingHostDelegate);

  return (CSRemoteContentSessionHostDelegate *)WeakRetained;
}

- (void)setForwardingHostDelegate:(id)a3
{
}

- (SBFAuthenticationStatusProvider)authenticationStatusProvider
{
  return self->_authenticationStatusProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationStatusProvider, 0);
  objc_destroyWeak((id *)&self->_forwardingHostDelegate);
  objc_storeStrong((id *)&self->_serviceNameToPreferences, 0);
  objc_storeStrong((id *)&self->_sessionIDToSession, 0);

  objc_storeStrong((id *)&self->_accessSerialQueue, 0);
}

@end