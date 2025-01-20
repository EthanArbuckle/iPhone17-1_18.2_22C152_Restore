@interface ATDeviceSyncManager
+ (id)deviceSyncManager;
- (ATDeviceSyncManager)init;
- (id)_activeSessionsOnMessageLink:(id)a3;
- (id)_initiateSyncForDataClass:(id)a3 onMessageLink:(id)a4;
- (id)_sessionForMessageLink:(id)a3 dataClass:(id)a4;
- (id)_sessionTaskForRequest:(id)a3 onMessageLink:(id)a4;
- (id)_startSyncSessionForDataClass:(id)a3 messageLink:(id)a4 identifier:(id)a5;
- (id)initiateSyncForDataClass:(id)a3 onMessageLink:(id)a4;
- (void)_cancelSyncForDataClass:(id)a3 onMessageLink:(id)a4 setSyncPending:(BOOL)a5;
- (void)_handleBeginSyncSessionRequest:(id)a3 onMessageLink:(id)a4;
- (void)_handleEndSyncSessionRequest:(id)a3 onMessageLink:(id)a4;
- (void)_handleRequest:(id)a3 onMessageLink:(id)a4;
- (void)_removeSessionForMessageLink:(id)a3 dataClass:(id)a4;
- (void)_setSession:(id)a3 forMessageLink:(id)a4 dataClass:(id)a5;
- (void)cancelSyncForDataClass:(id)a3 onMessageLink:(id)a4;
- (void)cancelSyncOnMessageLink:(id)a3;
- (void)initiateSyncOnMessageLink:(id)a3;
- (void)messageLink:(id)a3 didReceiveRequest:(id)a4;
- (void)messageLinkWasClosed:(id)a3;
- (void)messageLinkWasInitialized:(id)a3;
- (void)messageLinkWasOpened:(id)a3;
- (void)session:(id)a3 didFinishSessionTask:(id)a4;
- (void)session:(id)a3 willBeginSessionTask:(id)a4;
- (void)sessionDidFinish:(id)a3;
- (void)sessionWillBegin:(id)a3;
@end

@implementation ATDeviceSyncManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_activeSessionsForLinkIDAndDataClass, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)_sessionTaskForRequest:(id)a3 onMessageLink:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 dataClass];
  v9 = [(ATDeviceSyncManager *)self _sessionForMessageLink:v7 dataClass:v8];

  if (v9 && ([v9 isCancelled] & 1) == 0 && (objc_msgSend(v9, "isFinished") & 1) == 0)
  {
    v12 = [v6 command];
    if ([v12 isEqualToString:@"Sync"])
    {
      v13 = &ATDeviceSyncSessionSyncTaskGroupingKey;
    }
    else
    {
      v14 = [v6 command];
      if ([v14 isEqualToString:@"SyncTaskFinished"])
      {
        v13 = &ATDeviceSyncSessionSyncTaskGroupingKey;
      }
      else
      {
        v17 = [v6 command];
        char v18 = [v17 isEqualToString:@"UpdateSyncSessionTask"];

        if (v18)
        {
          v13 = &ATDeviceSyncSessionSyncTaskGroupingKey;
          goto LABEL_14;
        }
        v12 = [v6 command];
        if ([v12 isEqualToString:@"BeginAssetTask"])
        {
          v13 = &ATDeviceSyncSessionAssetTaskGroupingKey;
          goto LABEL_13;
        }
        v14 = [v6 command];
        if (([v14 isEqualToString:@"EndAssetTask"] & 1) == 0)
        {
          v19 = [v6 command];
          if (([v19 isEqualToString:@"RequestAsset"] & 1) == 0)
          {
            v20 = [v6 command];
            if (([v20 isEqualToString:@"UpdateAssetSessionTask"] & 1) == 0)
            {
              v21 = [v6 command];
              if (([v21 isEqualToString:@"FileProgress"] & 1) == 0)
              {
                v22 = [v6 command];
                char v23 = [v22 isEqualToString:@"AssetMetrics"];

                if ((v23 & 1) == 0)
                {
                  v15 = 0;
                  goto LABEL_15;
                }
                v13 = &ATDeviceSyncSessionAssetTaskGroupingKey;
LABEL_14:
                v15 = *v13;
LABEL_15:
                v16 = [v9 sessionTasksWithGroupingKey:v15];
                if ([v16 count])
                {
                  v10 = [v16 objectAtIndex:0];
                }
                else
                {
                  v10 = 0;
                }

                goto LABEL_5;
              }
            }
          }
        }
        v13 = &ATDeviceSyncSessionAssetTaskGroupingKey;
      }
    }
LABEL_13:

    goto LABEL_14;
  }
  v10 = 0;
LABEL_5:

  return v10;
}

- (id)_startSyncSessionForDataClass:(id)a3 messageLink:(id)a4 identifier:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = _ATLogCategoryDeviceSync();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v20 = self;
    __int16 v21 = 2114;
    id v22 = v8;
    __int16 v23 = 2114;
    id v24 = v9;
    _os_log_impl(&dword_1D9A2D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Starting \"%{public}@\" sync session on %{public}@", buf, 0x20u);
  }

  ATReportEventIncrementingScalarKey();
  id v12 = objc_alloc(MEMORY[0x1E4F4A2E0]);
  v13 = (void *)[v12 initWithSessionIdentifier:v10 sessionTypeIdentifier:*MEMORY[0x1E4F4A280]];

  [v13 setDataClass:v8];
  [v13 setMessageLink:v9];
  v14 = [MEMORY[0x1E4F478D8] sharedSessionServer];
  [v14 addSession:v13];

  [v13 addObserver:self];
  v15 = [[ATDeviceSyncSessionSyncTask alloc] initWithDataClass:v8 onMessageLink:v9];
  char v18 = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  [v13 addSessionTasks:v16];

  [(ATDeviceSyncManager *)self _setSession:v13 forMessageLink:v9 dataClass:v8];
  [v13 start];

  return v13;
}

- (void)_removeSessionForMessageLink:(id)a3 dataClass:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  activeSessionsForLinkIDAndDataClass = self->_activeSessionsForLinkIDAndDataClass;
  id v8 = [v12 guid];
  id v9 = [(NSMutableDictionary *)activeSessionsForLinkIDAndDataClass objectForKey:v8];

  if (v9) {
    [v9 removeObjectForKey:v6];
  }
  if (![v9 count])
  {
    id v10 = self->_activeSessionsForLinkIDAndDataClass;
    v11 = [v12 guid];
    [(NSMutableDictionary *)v10 removeObjectForKey:v11];
  }
}

- (void)_setSession:(id)a3 forMessageLink:(id)a4 dataClass:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(ATDeviceSyncManager *)self _activeSessionsOnMessageLink:v8];
  if (!v10)
  {
    id v10 = [MEMORY[0x1E4F1CA60] dictionary];
    activeSessionsForLinkIDAndDataClass = self->_activeSessionsForLinkIDAndDataClass;
    id v12 = [v8 guid];
    [(NSMutableDictionary *)activeSessionsForLinkIDAndDataClass setObject:v10 forKey:v12];
  }
  [v10 setObject:v13 forKey:v9];
}

- (id)_sessionForMessageLink:(id)a3 dataClass:(id)a4
{
  id v6 = a4;
  activeSessionsForLinkIDAndDataClass = self->_activeSessionsForLinkIDAndDataClass;
  id v8 = [a3 guid];
  id v9 = [(NSMutableDictionary *)activeSessionsForLinkIDAndDataClass objectForKey:v8];

  if (v9)
  {
    id v10 = [v9 objectForKey:v6];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)_activeSessionsOnMessageLink:(id)a3
{
  activeSessionsForLinkIDAndDataClass = self->_activeSessionsForLinkIDAndDataClass;
  v4 = [a3 guid];
  v5 = [(NSMutableDictionary *)activeSessionsForLinkIDAndDataClass objectForKey:v4];

  return v5;
}

- (void)_handleRequest:(id)a3 onMessageLink:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ATDeviceSyncManager *)self _sessionTaskForRequest:v6 onMessageLink:v7];
  id v9 = v8;
  if (v8)
  {
    [v8 messageLink:v7 didReceiveRequest:v6];
  }
  else
  {
    id v10 = _ATLogCategoryDeviceSync();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = [v6 command];
      int v17 = 138543618;
      char v18 = self;
      __int16 v19 = 2114;
      v20 = v11;
      _os_log_impl(&dword_1D9A2D000, v10, OS_LOG_TYPE_ERROR, "%{public}@: No running task for request %{public}@.", (uint8_t *)&v17, 0x16u);
    }
    id v12 = [v6 command];
    int v13 = [v12 isEqualToString:@"RequestAsset"];

    if (v13) {
      uint64_t v14 = 27;
    }
    else {
      uint64_t v14 = 23;
    }
    v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:v14 userInfo:0];
    v16 = [v6 responseWithError:v15 parameters:0];
    [v7 sendResponse:v16 withCompletion:0];
  }
}

- (void)_handleEndSyncSessionRequest:(id)a3 onMessageLink:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 dataClass];
  id v9 = [(ATDeviceSyncManager *)self _sessionForMessageLink:v7 dataClass:v8];

  id v10 = [v6 parameterForKey:@"_SessionID"];
  if (v9)
  {
    v11 = [v9 sessionIdentifier];
    if ([v11 isEqualToString:v10] && objc_msgSend(v9, "isRunning"))
    {
      if (([v9 isFinished] & 1) == 0)
      {

LABEL_13:
        v16 = _ATLogCategoryDeviceSync();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          int v17 = 138543362;
          char v18 = self;
          _os_log_impl(&dword_1D9A2D000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: Canceling active session.", (uint8_t *)&v17, 0xCu);
        }

        [v9 cancel];
        goto LABEL_11;
      }
      char v12 = [v9 isCancelled];

      if ((v12 & 1) == 0) {
        goto LABEL_13;
      }
    }
    else
    {
    }
  }
  int v13 = _ATLogCategoryDeviceSync();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [v9 sessionIdentifier];
    int v17 = 138543874;
    char v18 = self;
    __int16 v19 = 2114;
    v20 = v14;
    __int16 v21 = 2114;
    id v22 = v10;
    _os_log_impl(&dword_1D9A2D000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Not cancelling active session with sessionId: %{public}@ - sessionId to cancel: %{public}@", (uint8_t *)&v17, 0x20u);
  }
LABEL_11:
  v15 = [v6 responseWithError:0 parameters:0];
  [v7 sendResponse:v15 withCompletion:0];
}

- (void)_handleBeginSyncSessionRequest:(id)a3 onMessageLink:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 dataClass];
  id v9 = +[ATClientController sharedInstance];
  id v10 = [v9 clientForDataclass:v8];

  if (v10
    && [v10 conformsToProtocol:&unk_1F33F0650]
    && ([v10 isEnabled] & 1) != 0)
  {
    v11 = +[ATDevicePairedSyncManager sharedPairedSyncManager];
    int v12 = [v11 hasRestriction];

    if (v12)
    {
      int v13 = _ATLogCategoryDeviceSync();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v43 = self;
        __int16 v44 = 2114;
        id v45 = v7;
        __int16 v46 = 2114;
        v47 = v8;
        uint64_t v14 = "%{public}@: sync is restricted on %{public}@ for dataclass %{public}@ - ignoring request to begin sync";
        v15 = v13;
        uint32_t v16 = 32;
LABEL_9:
        _os_log_impl(&dword_1D9A2D000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
        goto LABEL_10;
      }
      goto LABEL_10;
    }
    __int16 v21 = [v6 parameters];
    int v17 = [v21 objectForKey:@"_SessionID"];

    id v22 = [v6 dataClass];
    __int16 v19 = [(ATDeviceSyncManager *)self _sessionForMessageLink:v7 dataClass:v22];

    if (!v19 || ([v19 isFinished] & 1) != 0 || objc_msgSend(v19, "isCancelled"))
    {
      uint64_t v23 = [v6 dataClass];
      id v24 = [(ATDeviceSyncManager *)self _startSyncSessionForDataClass:v23 messageLink:v7 identifier:v17];

      v40 = @"_SessionID";
      uint64_t v25 = [v24 sessionIdentifier];
      v41 = v25;
      v26 = (void *)MEMORY[0x1E4F1C9E8];
      v27 = &v41;
      v28 = &v40;
    }
    else
    {
      v30 = _ATLogCategoryDeviceSync();
      BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
      if (!v17)
      {
        if (v31)
        {
          *(_DWORD *)buf = 138543362;
          v43 = self;
          _os_log_impl(&dword_1D9A2D000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring request to begin sync session.", buf, 0xCu);
        }

        uint64_t v25 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:16 userInfo:0];
        char v18 = [v6 responseWithError:v25 parameters:0];
        goto LABEL_17;
      }
      if (v31)
      {
        *(_DWORD *)buf = 138543362;
        v43 = self;
        _os_log_impl(&dword_1D9A2D000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@: Canceling active session and adopting remote session.", buf, 0xCu);
      }

      [v19 cancel];
      v32 = [v6 dataClass];
      [(ATDeviceSyncManager *)self _removeSessionForMessageLink:v7 dataClass:v32];

      v34 = [v6 dataClass];
      v35 = [v6 parameters];
      v33 = [v35 objectForKey:@"_SessionID"];
      id v24 = [(ATDeviceSyncManager *)self _startSyncSessionForDataClass:v34 messageLink:v7 identifier:v33];

      v38 = @"_SessionID";
      uint64_t v25 = [v24 sessionIdentifier];
      v39 = v25;
      v26 = (void *)MEMORY[0x1E4F1C9E8];
      v27 = &v39;
      v28 = &v38;
    }
    v29 = [v26 dictionaryWithObjects:v27 forKeys:v28 count:1];
    char v18 = [v6 responseWithError:0 parameters:v29];

    __int16 v19 = v24;
LABEL_17:

    goto LABEL_11;
  }
  int v13 = _ATLogCategoryDeviceSync();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v43 = self;
    __int16 v44 = 2114;
    id v45 = v8;
    uint64_t v14 = "%{public}@: sync disabled for data class '%{public}@'.";
    v15 = v13;
    uint32_t v16 = 22;
    goto LABEL_9;
  }
LABEL_10:

  int v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:9 userInfo:0];
  char v18 = [v6 responseWithError:v17 parameters:0];
  __int16 v19 = 0;
LABEL_11:

  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __68__ATDeviceSyncManager__handleBeginSyncSessionRequest_onMessageLink___block_invoke;
  v36[3] = &unk_1E6B88BE0;
  v36[4] = self;
  id v37 = v19;
  id v20 = v19;
  [v7 sendResponse:v18 withCompletion:v36];
}

void __68__ATDeviceSyncManager__handleBeginSyncSessionRequest_onMessageLink___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = _ATLogCategoryDeviceSync();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v7 = 138543362;
      uint64_t v8 = v5;
      _os_log_impl(&dword_1D9A2D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to send BeginSyncSession response", (uint8_t *)&v7, 0xCu);
    }

    id v6 = *(void **)(a1 + 40);
    if (v6) {
      [v6 cancel];
    }
  }
}

- (void)_cancelSyncForDataClass:(id)a3 onMessageLink:(id)a4 setSyncPending:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = [(ATDeviceSyncManager *)self _sessionForMessageLink:v9 dataClass:v8];
  v11 = v10;
  if (v10
    && [v10 isRunning]
    && (![v11 isFinished] || (objc_msgSend(v11, "isCancelled") & 1) == 0))
  {
    int v12 = _ATLogCategoryDeviceSync();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543874;
      uint64_t v14 = self;
      __int16 v15 = 2114;
      id v16 = v8;
      __int16 v17 = 2114;
      id v18 = v9;
      _os_log_impl(&dword_1D9A2D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Cancelling sync session for data class %{public}@ on %{public}@", (uint8_t *)&v13, 0x20u);
    }

    [v11 cancel];
  }
  [(ATDeviceSettings *)self->_settings setSyncPending:v5 forDataClass:v8];
}

- (id)_initiateSyncForDataClass:(id)a3 onMessageLink:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _ATLogCategoryDeviceSync();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v33 = self;
    __int16 v34 = 2114;
    id v35 = v6;
    __int16 v36 = 2048;
    id v37 = v7;
    _os_log_impl(&dword_1D9A2D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: trying to initiate sync for dataclass %{public}@ on link=%p", buf, 0x20u);
  }

  id v9 = +[ATDevicePairedSyncManager sharedPairedSyncManager];
  int v10 = [v9 hasRestriction];

  if (!v10)
  {
    int v13 = +[ATClientController sharedInstance];
    uint64_t v14 = [v13 clientForDataclass:v6];

    if ((objc_opt_respondsToSelector() & 1) != 0 && ([v14 isEnabled] & 1) == 0)
    {
      [(ATDeviceSettings *)self->_settings setSyncPending:0 forDataClass:v6];
      id v18 = _ATLogCategoryDeviceSync();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138544130;
        v33 = self;
        __int16 v34 = 2048;
        id v35 = v14;
        __int16 v36 = 2114;
        id v37 = v6;
        __int16 v38 = 2048;
        id v39 = v7;
        _os_log_impl(&dword_1D9A2D000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: Sync Client=%p is not enabled to sync dataclass %{public}@ on link=%p", buf, 0x2Au);
      }

      int v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:9 userInfo:0];
      goto LABEL_24;
    }
    [(ATDeviceSettings *)self->_settings setSyncPending:1 forDataClass:v6];
    if ([v7 isInitialized])
    {
      uint64_t v15 = [(ATDeviceSyncManager *)self _sessionForMessageLink:v7 dataClass:v6];
      if (v15)
      {
        id v16 = (void *)v15;
        __int16 v17 = _ATLogCategoryDeviceSync();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          v33 = self;
          __int16 v34 = 2114;
          id v35 = v6;
          __int16 v36 = 2114;
          id v37 = v16;
          _os_log_impl(&dword_1D9A2D000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: not starting sync for dataclass %{public}@ because we already have an active session %{public}@", buf, 0x20u);
        }

        int v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:0 userInfo:0];

        goto LABEL_24;
      }
      if ([v7 endpointType] == 1)
      {
        uint64_t v19 = [(ATDeviceSyncManager *)self _startSyncSessionForDataClass:v6 messageLink:v7 identifier:0];
        id v20 = v19;
        if (v19)
        {
          v30 = @"_SessionID";
          __int16 v21 = [v19 sessionIdentifier];
          BOOL v31 = v21;
          id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
        }
        else
        {
          id v22 = 0;
        }
      }
      else
      {
        id v22 = 0;
        id v20 = 0;
      }
      uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F4A2D0]) initWithCommand:@"BeginSyncSession" dataClass:v6 parameters:v22];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __63__ATDeviceSyncManager__initiateSyncForDataClass_onMessageLink___block_invoke;
      v26[3] = &unk_1E6B87B28;
      v26[4] = self;
      id v27 = v6;
      id v28 = v7;
      id v29 = v20;
      id v24 = v20;
      [v28 sendRequest:v23 withCompletion:v26];
    }
    int v12 = 0;
LABEL_24:

    goto LABEL_25;
  }
  v11 = _ATLogCategoryDeviceSync();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v33 = self;
    __int16 v34 = 2114;
    id v35 = v7;
    __int16 v36 = 2114;
    id v37 = v6;
    _os_log_impl(&dword_1D9A2D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: sync is restricted on %{public}@ for dataclass %{public}@ - ignoring request to begin sync", buf, 0x20u);
  }

  int v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:9 userInfo:0];
LABEL_25:

  return v12;
}

void __63__ATDeviceSyncManager__initiateSyncForDataClass_onMessageLink___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _ATLogCategoryDeviceSync();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v28 = v8;
      __int16 v29 = 2114;
      id v30 = v6;
      __int16 v31 = 2114;
      uint64_t v32 = v9;
      _os_log_impl(&dword_1D9A2D000, v7, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@ error sending begin sync session for dataclass %{public}@", buf, 0x20u);
    }

    uint64_t v10 = *(void *)(a1 + 32);
    v11 = *(NSObject **)(v10 + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__ATDeviceSyncManager__initiateSyncForDataClass_onMessageLink___block_invoke_80;
    block[3] = &unk_1E6B88BB8;
    block[4] = v10;
    id v25 = *(id *)(a1 + 40);
    id v26 = *(id *)(a1 + 48);
    dispatch_async(v11, block);

    int v12 = v25;
LABEL_5:

    goto LABEL_13;
  }
  int v13 = [v5 error];

  if (!v13)
  {
    if (*(void *)(a1 + 56)) {
      goto LABEL_13;
    }
    uint64_t v18 = *(void *)(a1 + 32);
    uint64_t v19 = *(NSObject **)(v18 + 8);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __63__ATDeviceSyncManager__initiateSyncForDataClass_onMessageLink___block_invoke_81;
    v20[3] = &unk_1E6B88308;
    v20[4] = v18;
    id v21 = *(id *)(a1 + 40);
    id v22 = *(id *)(a1 + 48);
    id v23 = v5;
    dispatch_async(v19, v20);

    int v12 = v21;
    goto LABEL_5;
  }
  uint64_t v14 = _ATLogCategoryDeviceSync();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    uint64_t v15 = *(void *)(a1 + 32);
    id v16 = [v5 error];
    uint64_t v17 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    uint64_t v28 = v15;
    __int16 v29 = 2114;
    id v30 = v16;
    __int16 v31 = 2114;
    uint64_t v32 = v17;
    _os_log_impl(&dword_1D9A2D000, v14, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@ error after sending begin sync session for dataclass %{public}@", buf, 0x20u);
  }
  if (*(void *)(a1 + 56)) {
    [*(id *)(a1 + 32) cancelSyncForDataClass:*(void *)(a1 + 40) onMessageLink:*(void *)(a1 + 48)];
  }
  [*(id *)(*(void *)(a1 + 32) + 24) setSyncPending:0 forDataClass:*(void *)(a1 + 40)];
LABEL_13:
}

uint64_t __63__ATDeviceSyncManager__initiateSyncForDataClass_onMessageLink___block_invoke_80(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelSyncForDataClass:*(void *)(a1 + 40) onMessageLink:*(void *)(a1 + 48) setSyncPending:1];
}

void __63__ATDeviceSyncManager__initiateSyncForDataClass_onMessageLink___block_invoke_81(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  id v6 = [*(id *)(a1 + 56) parameters];
  v4 = [v6 objectForKey:@"_SessionID"];
  id v5 = (id)[v1 _startSyncSessionForDataClass:v2 messageLink:v3 identifier:v4];
}

- (void)sessionDidFinish:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__ATDeviceSyncManager_sessionDidFinish___block_invoke;
  v7[3] = &unk_1E6B88B68;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __40__ATDeviceSyncManager_sessionDidFinish___block_invoke(uint64_t a1)
{
  v30[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _ATLogCategoryDeviceSync();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D9A2D000, v2, OS_LOG_TYPE_DEFAULT, "Sync session complete", buf, 2u);
  }

  uint64_t v3 = [*(id *)(a1 + 32) sessionIdentifier];
  id v4 = [*(id *)(a1 + 32) dataClass];
  id v5 = [*(id *)(a1 + 32) messageLink];
  [v5 removeTimeoutException];
  id v6 = [*(id *)(a1 + 40) _sessionForMessageLink:v5 dataClass:v4];
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 sessionIdentifier];
    uint64_t v9 = [*(id *)(a1 + 32) sessionIdentifier];
    int v10 = [v8 isEqualToString:v9];

    if (v10) {
      [*(id *)(a1 + 40) _removeSessionForMessageLink:v5 dataClass:v4];
    }
  }
  if ([*(id *)(a1 + 32) isCancelled])
  {
    __int16 v29 = @"_SessionID";
    v30[0] = v3;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
    int v12 = (void *)[objc_alloc(MEMORY[0x1E4F4A2D0]) initWithCommand:@"EndSyncSession" dataClass:v4 parameters:v11];
    [v5 sendRequest:v12 withCompletion:0];
LABEL_8:

    goto LABEL_10;
  }
  v11 = [*(id *)(a1 + 32) error];
  if (!v11)
  {
    if ([v5 endpointType] != 1) {
      goto LABEL_11;
    }
    int v13 = +[ATClientController sharedInstance];
    v11 = [v13 clientForDataclass:v4];

    if ([v11 conformsToProtocol:&unk_1F33F0650])
    {
      uint64_t v14 = *(void **)(*(void *)(a1 + 40) + 24);
      uint64_t v15 = [v5 identifier];
      int v12 = [v14 syncStateForLibrary:v15 dataClass:v4];

      uint64_t v16 = [v11 currentRevision];
      if (v16 != [v12 lastServerRevision])
      {
        uint64_t v17 = _ATLogCategoryDeviceSync();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v18 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138543618;
          uint64_t v26 = v18;
          __int16 v27 = 2114;
          uint64_t v28 = v4;
          _os_log_impl(&dword_1D9A2D000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: new changes available for '%{public}@' - syncing again", buf, 0x16u);
        }

        [*(id *)(*(void *)(a1 + 40) + 24) setSyncPending:1 forDataClass:v4];
        dispatch_time_t v19 = dispatch_time(0, 5000000000);
        uint64_t v20 = *(void *)(a1 + 40);
        id v21 = *(NSObject **)(v20 + 8);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __40__ATDeviceSyncManager_sessionDidFinish___block_invoke_77;
        block[3] = &unk_1E6B88BB8;
        block[4] = v20;
        id v23 = v4;
        id v24 = v5;
        dispatch_after(v19, v21, block);
      }
      goto LABEL_8;
    }
  }
LABEL_10:

LABEL_11:
}

id __40__ATDeviceSyncManager_sessionDidFinish___block_invoke_77(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) _initiateSyncForDataClass:*(void *)(a1 + 40) onMessageLink:*(void *)(a1 + 48)];
}

- (void)sessionWillBegin:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__ATDeviceSyncManager_sessionWillBegin___block_invoke;
  block[3] = &unk_1E6B88B40;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
}

void __40__ATDeviceSyncManager_sessionWillBegin___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) messageLink];
  [v1 addTimeoutException];
}

- (void)session:(id)a3 didFinishSessionTask:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__ATDeviceSyncManager_session_didFinishSessionTask___block_invoke;
  block[3] = &unk_1E6B88BB8;
  id v12 = v6;
  id v13 = v7;
  uint64_t v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __52__ATDeviceSyncManager_session_didFinishSessionTask___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) dataClass];
  uint64_t v3 = [*(id *)(a1 + 40) sessionGroupingKey];
  int v4 = [v3 isEqualToString:@"ATDeviceSyncSessionSyncTaskGroupingKey"];

  id v5 = *(void **)(a1 + 40);
  if (v4)
  {
    id v6 = [v5 error];
    if (v6)
    {
    }
    else if (([*(id *)(a1 + 40) isCancelled] & 1) == 0)
    {
LABEL_9:
      id v10 = [*(id *)(a1 + 32) messageLink];
      if ([v10 endpointType] == 1) {
        [v10 removeKeepAliveException];
      }

      goto LABEL_14;
    }
    ATReportEventIncrementingScalarKey();
    goto LABEL_9;
  }
  id v7 = [v5 sessionGroupingKey];
  int v8 = [v7 isEqualToString:@"ATDeviceSyncSessionAssetTaskGroupingKey"];

  if (v8)
  {
    id v9 = [*(id *)(a1 + 40) error];
    if (v9)
    {
    }
    else if (([*(id *)(a1 + 40) isCancelled] & 1) == 0)
    {
      v11 = _ATLogCategoryDeviceSync();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 48);
        int v15 = 138543618;
        uint64_t v16 = v12;
        __int16 v17 = 2114;
        uint64_t v18 = v2;
        _os_log_impl(&dword_1D9A2D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: session for data class %{public}@ completed successfully - clearing needs-sync flag", (uint8_t *)&v15, 0x16u);
      }

      id v13 = *(void **)(*(void *)(a1 + 48) + 24);
      uint64_t v14 = [*(id *)(a1 + 32) dataClass];
      [v13 setSyncPending:0 forDataClass:v14];
    }
    ATReportEventIncrementingScalarKey();
  }
LABEL_14:
}

- (void)session:(id)a3 willBeginSessionTask:(id)a4
{
  id v6 = a3;
  id v7 = [a4 sessionGroupingKey];
  int v8 = [v7 isEqualToString:@"ATDeviceSyncSessionSyncTaskGroupingKey"];

  if (v8)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__ATDeviceSyncManager_session_willBeginSessionTask___block_invoke;
    block[3] = &unk_1E6B88B40;
    void block[4] = self;
    dispatch_async(queue, block);
    id v10 = [v6 messageLink];
    if ([v10 endpointType] == 1) {
      [v10 addKeepAliveException];
    }
  }
}

uint64_t __52__ATDeviceSyncManager_session_willBeginSessionTask___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 24) pairingSyncCompletionTime];
  if (v3 != 0.0)
  {
    [*(id *)(*(void *)(a1 + 32) + 24) setPairingSyncCompletionTime:0.0];
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    return ATReportEventAddDoubleToScalarKey();
  }
  return result;
}

- (void)messageLink:(id)a3 didReceiveRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__ATDeviceSyncManager_messageLink_didReceiveRequest___block_invoke;
  block[3] = &unk_1E6B88BB8;
  id v12 = v7;
  id v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

uint64_t __53__ATDeviceSyncManager_messageLink_didReceiveRequest___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) command];
  int v3 = [v2 isEqualToString:@"BeginSyncSession"];

  if (v3)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v4 = *(void **)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    return [v4 _handleBeginSyncSessionRequest:v5 onMessageLink:v6];
  }
  else
  {
    int v8 = [*(id *)(a1 + 32) command];
    int v9 = [v8 isEqualToString:@"EndSyncSession"];

    uint64_t v11 = *(void *)(a1 + 32);
    id v10 = *(void **)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    if (v9)
    {
      return [v10 _handleEndSyncSessionRequest:v11 onMessageLink:v12];
    }
    else
    {
      return [v10 _handleRequest:v11 onMessageLink:v12];
    }
  }
}

- (void)messageLinkWasClosed:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__ATDeviceSyncManager_messageLinkWasClosed___block_invoke;
  v7[3] = &unk_1E6B88B68;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __44__ATDeviceSyncManager_messageLinkWasClosed___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _activeSessionsOnMessageLink:*(void *)(a1 + 40)];
  if (v2)
  {
    int v3 = _ATLogCategoryDeviceSync();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = v4;
      __int16 v19 = 2114;
      uint64_t v20 = v2;
      _os_log_impl(&dword_1D9A2D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: message link was closed - cancelling remaining sessions %{public}@", buf, 0x16u);
    }

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v5 = objc_msgSend(v2, "allValues", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
          uint64_t v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:8 userInfo:0];
          [v10 setError:v11];

          [v10 cancel];
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
}

- (void)messageLinkWasInitialized:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__ATDeviceSyncManager_messageLinkWasInitialized___block_invoke;
  v7[3] = &unk_1E6B88B68;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __49__ATDeviceSyncManager_messageLinkWasInitialized___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v2 = +[ATClientController sharedInstance];
  int v3 = [v2 allClients];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v8 conformsToProtocol:&unk_1F33F0650])
        {
          uint64_t v9 = [v8 syncDataClass];
          if (([*(id *)(*(void *)(a1 + 32) + 24) isSyncPendingForDataClass:v9] & 1) != 0
            || [*(id *)(a1 + 40) endpointType] == 1
            && (id v10 = *(void **)(*(void *)(a1 + 32) + 24),
                [*(id *)(a1 + 40) identifier],
                uint64_t v11 = objc_claimAutoreleasedReturnValue(),
                [v10 syncStateForLibrary:v11 dataClass:v9],
                long long v12 = objc_claimAutoreleasedReturnValue(),
                v12,
                v11,
                v12))
          {
            id v13 = (id)[*(id *)(a1 + 32) _initiateSyncForDataClass:v9 onMessageLink:*(void *)(a1 + 40)];
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
}

- (void)messageLinkWasOpened:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = +[ATClientController sharedInstance];
  uint64_t v6 = [v5 allClients];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v11 conformsToProtocol:&unk_1F33F0650])
        {
          long long v12 = [v11 syncDataClass];
          [v4 addRequestHandler:self forDataClass:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (void)cancelSyncOnMessageLink:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__ATDeviceSyncManager_cancelSyncOnMessageLink___block_invoke;
  v7[3] = &unk_1E6B88B68;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __47__ATDeviceSyncManager_cancelSyncOnMessageLink___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _activeSessionsOnMessageLink:*(void *)(a1 + 40)];
  int v3 = v2;
  if (v2)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v4 = objc_msgSend(v2, "allKeys", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(a1 + 32) _cancelSyncForDataClass:*(void *)(*((void *)&v9 + 1) + 8 * v8++) onMessageLink:*(void *)(a1 + 40) setSyncPending:0];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)initiateSyncOnMessageLink:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__ATDeviceSyncManager_initiateSyncOnMessageLink___block_invoke;
  v7[3] = &unk_1E6B88B68;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __49__ATDeviceSyncManager_initiateSyncOnMessageLink___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v2 = +[ATClientController sharedInstance];
  int v3 = [v2 allClients];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v8 conformsToProtocol:&unk_1F33F0650])
        {
          long long v9 = *(void **)(a1 + 32);
          long long v10 = [v8 syncDataClass];
          id v11 = (id)[v9 _initiateSyncForDataClass:v10 onMessageLink:*(void *)(a1 + 40)];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

- (void)cancelSyncForDataClass:(id)a3 onMessageLink:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__ATDeviceSyncManager_cancelSyncForDataClass_onMessageLink___block_invoke;
  block[3] = &unk_1E6B88BB8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __60__ATDeviceSyncManager_cancelSyncForDataClass_onMessageLink___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelSyncForDataClass:*(void *)(a1 + 40) onMessageLink:*(void *)(a1 + 48) setSyncPending:0];
}

- (id)initiateSyncForDataClass:(id)a3 onMessageLink:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__1117;
  uint64_t v21 = __Block_byref_object_dispose__1118;
  id v22 = 0;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__ATDeviceSyncManager_initiateSyncForDataClass_onMessageLink___block_invoke;
  v13[3] = &unk_1E6B88238;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  long long v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, v13);
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);

  return v11;
}

uint64_t __62__ATDeviceSyncManager_initiateSyncForDataClass_onMessageLink___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [*(id *)(a1 + 32) _initiateSyncForDataClass:*(void *)(a1 + 40) onMessageLink:*(void *)(a1 + 48)];

  return MEMORY[0x1F41817F8]();
}

- (ATDeviceSyncManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)ATDeviceSyncManager;
  uint64_t v2 = [(ATDeviceSyncManager *)&v12 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    activeSessionsForLinkIDAndDataClass = v2->_activeSessionsForLinkIDAndDataClass;
    v2->_activeSessionsForLinkIDAndDataClass = (NSMutableDictionary *)v3;

    uint64_t v5 = (objc_class *)objc_opt_class();
    Name = class_getName(v5);
    dispatch_queue_t v7 = dispatch_queue_create(Name, 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    uint64_t v9 = +[ATDeviceSettings sharedInstance];
    settings = v2->_settings;
    v2->_settings = (ATDeviceSettings *)v9;
  }
  return v2;
}

+ (id)deviceSyncManager
{
  uint64_t v2 = objc_alloc_init(ATDeviceSyncManager);

  return v2;
}

@end