@interface CPLPullScopesTask
- (BOOL)_checkShouldHandleBatchInTransaction:(id)a3;
- (CPLPullScopesTask)initWithEngineLibrary:(id)a3 session:(id)a4;
- (id)taskIdentifier;
- (void)_handleChangedOrNewScopes:(id)a3 deletedScopeIdentifiers:(id)a4 newScopeListSyncAnchor:(id)a5;
- (void)_handleFinalScopeListSyncAnchor:(id)a3 error:(id)a4;
- (void)cancel;
- (void)launch;
@end

@implementation CPLPullScopesTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badError, 0);
  objc_storeStrong((id *)&self->_fetchChangesTask, 0);
  objc_storeStrong((id *)&self->_clientCacheIdentifier, 0);
  objc_storeStrong((id *)&self->_scopes, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

- (void)cancel
{
  v6.receiver = self;
  v6.super_class = (Class)CPLPullScopesTask;
  [(CPLEngineSyncTask *)&v6 cancel];
  store = self->_store;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__CPLPullScopesTask_cancel__block_invoke;
  v5[3] = &unk_1E60AB578;
  v5[4] = self;
  id v4 = [(CPLEngineStore *)store performReadTransactionWithBlock:v5];
}

uint64_t __27__CPLPullScopesTask_cancel__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 72) = 1;
  return [*(id *)(*(void *)(a1 + 32) + 104) cancel];
}

- (void)launch
{
  v6.receiver = self;
  v6.super_class = (Class)CPLPullScopesTask;
  [(CPLEngineSyncTask *)&v6 launch];
  store = self->_store;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__CPLPullScopesTask_launch__block_invoke;
  v5[3] = &unk_1E60AB578;
  v5[4] = self;
  id v4 = [(CPLEngineStore *)store performReadTransactionWithBlock:v5];
}

void __27__CPLPullScopesTask_launch__block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) isCancelled];
  v3 = *(id **)(a1 + 32);
  if (v2)
  {
    id v18 = +[CPLErrors operationCancelledError];
    objc_msgSend(v3, "taskDidFinishWithError:");
  }
  else
  {
    char v4 = [v3[10] shouldSyncScopeList];
    v5 = *(id **)(a1 + 32);
    if (v4)
    {
      uint64_t v6 = [v5[10] clientCacheIdentifier];
      uint64_t v7 = *(void *)(a1 + 32);
      v8 = *(void **)(v7 + 96);
      *(void *)(v7 + 96) = v6;

      v9 = [*(id *)(*(void *)(a1 + 32) + 88) scopeListSyncAnchor];
      v10 = [*(id *)(a1 + 32) engineLibrary];
      v11 = [v10 transport];

      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __27__CPLPullScopesTask_launch__block_invoke_2;
      v20[3] = &unk_1E60A72B0;
      uint64_t v21 = *(void *)(a1 + 32);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __27__CPLPullScopesTask_launch__block_invoke_3;
      v19[3] = &unk_1E60A72D8;
      v19[4] = v21;
      uint64_t v12 = [v11 fetchScopeListChangesForScopeListSyncAnchor:v9 progressHandler:v20 completionHandler:v19];
      uint64_t v13 = *(void *)(a1 + 32);
      v14 = *(void **)(v13 + 104);
      *(void *)(v13 + 104) = v12;

      v15 = [v11 createGroupForFetchScopeListChanges];
      if (!_CPLSilentLogging)
      {
        v16 = __CPLTaskOSLogDomain_2551();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 104);
          *(_DWORD *)buf = 138412290;
          uint64_t v23 = v17;
          _os_log_impl(&dword_1B4CAC000, v16, OS_LOG_TYPE_DEFAULT, "Launching %@", buf, 0xCu);
        }
      }
      [*(id *)(a1 + 32) launchTransportTask:*(void *)(*(void *)(a1 + 32) + 104) withTransportGroup:v15];
    }
    else
    {
      [v5 taskDidFinishWithError:0];
    }
  }
}

uint64_t __27__CPLPullScopesTask_launch__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) _handleChangedOrNewScopes:a2 deletedScopeIdentifiers:a3 newScopeListSyncAnchor:a4];
}

uint64_t __27__CPLPullScopesTask_launch__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleFinalScopeListSyncAnchor:a2 error:a3];
}

- (void)_handleFinalScopeListSyncAnchor:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  store = self->_store;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __59__CPLPullScopesTask__handleFinalScopeListSyncAnchor_error___block_invoke;
  v14[3] = &unk_1E60AB068;
  v14[4] = self;
  id v15 = v7;
  id v16 = v6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__CPLPullScopesTask__handleFinalScopeListSyncAnchor_error___block_invoke_3;
  v12[3] = &unk_1E60AB550;
  v12[4] = self;
  id v13 = v15;
  id v9 = v15;
  id v10 = v6;
  id v11 = [(CPLEngineStore *)store performWriteTransactionWithBlock:v14 completionHandler:v12];
}

void __59__CPLPullScopesTask__handleFinalScopeListSyncAnchor_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) _checkShouldHandleBatchInTransaction:v3]
    && !*(void *)(a1 + 40))
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __59__CPLPullScopesTask__handleFinalScopeListSyncAnchor_error___block_invoke_2;
    v4[3] = &unk_1E60AB750;
    v4[4] = *(void *)(a1 + 32);
    id v5 = *(id *)(a1 + 48);
    [v3 do:v4];
  }
}

void __59__CPLPullScopesTask__handleFinalScopeListSyncAnchor_error___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = [v3 error];

  id v5 = *(void **)(a1 + 32);
  if (!v4)
  {
    if (v5[14] || *(void *)(a1 + 40))
    {
      v8 = *(void **)(a1 + 32);
    }
    else
    {
      int v11 = [*(id *)(a1 + 32) isCancelled];
      id v5 = *(void **)(a1 + 32);
      if (v11)
      {
        uint64_t v6 = +[CPLErrors operationCancelledError];
        goto LABEL_3;
      }
      if (v5[16] + v5[15] + v5[17]) {
        BOOL v12 = _CPLSilentLogging == 0;
      }
      else {
        BOOL v12 = 0;
      }
      if (v12)
      {
        id v13 = __CPLTaskOSLogDomain_2551();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = *(void **)(a1 + 32);
          uint64_t v15 = v14[16];
          uint64_t v16 = v14[15];
          uint64_t v17 = v14[17];
          int v18 = 134218496;
          uint64_t v19 = v15;
          __int16 v20 = 2048;
          uint64_t v21 = v16;
          __int16 v22 = 2048;
          uint64_t v23 = v17;
          _os_log_impl(&dword_1B4CAC000, v13, OS_LOG_TYPE_DEFAULT, "Finishing updating scope list with %lu new scopes, %lu deletes scopes and %lu modified scopes", (uint8_t *)&v18, 0x20u);
        }

        id v5 = *(void **)(a1 + 32);
      }
      v8 = v5;
    }
    objc_msgSend(v8, "taskDidFinishWithError:");
    goto LABEL_8;
  }
  uint64_t v6 = [v3 error];
LABEL_3:
  id v7 = (void *)v6;
  [v5 taskDidFinishWithError:v6];

LABEL_8:
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(v9 + 104);
  *(void *)(v9 + 104) = 0;
}

uint64_t __59__CPLPullScopesTask__handleFinalScopeListSyncAnchor_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 88) storeScopeListSyncAnchor:*(void *)(a1 + 40) error:a2];
}

- (void)_handleChangedOrNewScopes:(id)a3 deletedScopeIdentifiers:(id)a4 newScopeListSyncAnchor:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  store = self->_store;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __94__CPLPullScopesTask__handleChangedOrNewScopes_deletedScopeIdentifiers_newScopeListSyncAnchor___block_invoke;
  v14[3] = &unk_1E60AB068;
  v14[4] = self;
  id v15 = v8;
  id v16 = v7;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __94__CPLPullScopesTask__handleChangedOrNewScopes_deletedScopeIdentifiers_newScopeListSyncAnchor___block_invoke_5;
  v13[3] = &unk_1E60AB578;
  v13[4] = self;
  id v10 = v7;
  id v11 = v8;
  id v12 = [(CPLEngineStore *)store performWriteTransactionWithBlock:v14 completionHandler:v13];
}

void __94__CPLPullScopesTask__handleChangedOrNewScopes_deletedScopeIdentifiers_newScopeListSyncAnchor___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  if ([a1[4] _checkShouldHandleBatchInTransaction:v3])
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __94__CPLPullScopesTask__handleChangedOrNewScopes_deletedScopeIdentifiers_newScopeListSyncAnchor___block_invoke_2;
    v6[3] = &unk_1E60AAF20;
    id v4 = a1[5];
    id v5 = a1[4];
    id v7 = v4;
    id v8 = v5;
    id v9 = a1[6];
    [v3 do:v6];
  }
}

void __94__CPLPullScopesTask__handleChangedOrNewScopes_deletedScopeIdentifiers_newScopeListSyncAnchor___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 error];

  if (v4)
  {
    uint64_t v5 = [v3 error];
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 112);
    *(void *)(v6 + 112) = v5;

    if (!_CPLSilentLogging)
    {
      id v8 = __CPLTaskOSLogDomain_2551();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v9 = [v3 error];
        int v10 = 138412290;
        id v11 = v9;
        _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_ERROR, "Failed to handle scope list changes: %@", (uint8_t *)&v10, 0xCu);
      }
    }
    [*(id *)(*(void *)(a1 + 32) + 104) cancel];
    *(unsigned char *)(*(void *)(a1 + 32) + 72) = 1;
  }
}

BOOL __94__CPLPullScopesTask__handleChangedOrNewScopes_deletedScopeIdentifiers_newScopeListSyncAnchor___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 1;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v31 count:16];
  if (v4)
  {
    uint64_t v6 = *(void *)v19;
    *(void *)&long long v5 = 138412290;
    long long v15 = v5;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v9 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 88), "scopeWithIdentifier:", v8, v15);
        if (v9)
        {
          if (!_CPLSilentLogging)
          {
            int v10 = __CPLTaskOSLogDomain_2551();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(buf) = v15;
              *(void *)((char *)&buf + 4) = v8;
              _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_DEFAULT, "Scope %@ has been deleted according to server - we will need to check that", (uint8_t *)&buf, 0xCu);
            }
          }
          int v11 = [*(id *)(*(void *)(a1 + 40) + 88) setScopeNeedsUpdateFromTransport:v9 error:a2];
          *((unsigned char *)v23 + 24) = v11;
          if (!v11)
          {

            goto LABEL_17;
          }
          ++*(void *)(*(void *)(a1 + 40) + 120);
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v31 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  if (*((unsigned char *)v23 + 24))
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__2565;
    v29 = __Block_byref_object_dispose__2566;
    id v30 = 0;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __94__CPLPullScopesTask__handleChangedOrNewScopes_deletedScopeIdentifiers_newScopeListSyncAnchor___block_invoke_1;
    v17[3] = &unk_1E60A7288;
    uint64_t v12 = *(void **)(a1 + 48);
    v17[4] = *(void *)(a1 + 40);
    v17[5] = &v22;
    v17[6] = &buf;
    [v12 enumerateKeysAndObjectsUsingBlock:v17];
    if (a2 && !*((unsigned char *)v23 + 24)) {
      *a2 = *(id *)(*((void *)&buf + 1) + 40);
    }
    _Block_object_dispose(&buf, 8);

    BOOL v13 = *((unsigned char *)v23 + 24) != 0;
  }
  else
  {
    BOOL v13 = 0;
  }
  _Block_object_dispose(&v22, 8);
  return v13;
}

void __94__CPLPullScopesTask__handleChangedOrNewScopes_deletedScopeIdentifiers_newScopeListSyncAnchor___block_invoke_1(void *a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = [*(id *)(a1[4] + 88) scopeWithIdentifier:v7];
  if (v9)
  {
    if (!_CPLSilentLogging)
    {
      int v10 = __CPLTaskOSLogDomain_2551();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v36 = v7;
        _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_DEFAULT, "Scope %@ has changes to pull from the server", buf, 0xCu);
      }
    }
    ++*(void *)(a1[4] + 136);
    int v11 = *(void **)(a1[4] + 88);
    uint64_t v12 = *(void *)(a1[6] + 8);
    id obj = *(id *)(v12 + 40);
    char v13 = [v11 setScopeHasChangesToPullFromTransport:v9 error:&obj];
    objc_storeStrong((id *)(v12 + 40), obj);
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v13;
    if (!*(unsigned char *)(*(void *)(a1[5] + 8) + 24)) {
      goto LABEL_23;
    }
    v14 = *(void **)(a1[4] + 88);
    long long v15 = [v8 updatedTransportScope];
    uint64_t v16 = *(void *)(a1[6] + 8);
    id v33 = *(id *)(v16 + 40);
    LOBYTE(v14) = [v14 setTransportScope:v15 forScope:v9 error:&v33];
    objc_storeStrong((id *)(v16 + 40), v33);
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = (_BYTE)v14;

    if (!*(unsigned char *)(*(void *)(a1[5] + 8) + 24)) {
      goto LABEL_23;
    }
    uint64_t v17 = [*(id *)(a1[4] + 88) scopeChangeForScope:v9];
    if ([v8 updateScopeChange:v17])
    {
      if (!_CPLSilentLogging)
      {
        long long v18 = __CPLTaskOSLogDomain_2551();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412546;
          id v36 = v9;
          __int16 v37 = 2112;
          v38 = v17;
          _os_log_impl(&dword_1B4CAC000, v18, OS_LOG_TYPE_DEFAULT, "Updating scope change for %@ to %@", buf, 0x16u);
        }
      }
      long long v19 = *(void **)(a1[4] + 88);
      uint64_t v20 = *(void *)(a1[6] + 8);
      id v32 = *(id *)(v20 + 40);
      char v21 = [v19 storeScopeChange:v17 forScope:v9 error:&v32];
      objc_storeStrong((id *)(v20 + 40), v32);
      *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v21;
    }
  }
  else
  {
    ++*(void *)(a1[4] + 128);
    uint64_t v22 = *(void **)(a1[4] + 88);
    uint64_t v23 = [v8 updatedTransportScope];
    uint64_t v24 = *(void *)(a1[6] + 8);
    id v31 = *(id *)(v24 + 40);
    uint64_t v17 = [v22 createScopeWithIdentifier:v7 scopeType:0 flags:16 transportScope:v23 error:&v31];
    objc_storeStrong((id *)(v24 + 40), v31);

    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v17 != 0;
    if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
    {
      char v25 = [*(id *)(a1[4] + 88) scopeChangeForScope:v17];
      if ([v8 updateScopeChange:v25])
      {
        v26 = *(void **)(a1[4] + 88);
        uint64_t v27 = *(void *)(a1[6] + 8);
        id v30 = *(id *)(v27 + 40);
        char v28 = [v26 storeScopeChange:v25 forScope:v17 error:&v30];
        objc_storeStrong((id *)(v27 + 40), v30);
        *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v28;
      }
      if (!_CPLSilentLogging)
      {
        v29 = __CPLTaskOSLogDomain_2551();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412546;
          id v36 = v7;
          __int16 v37 = 2112;
          v38 = v25;
          _os_log_impl(&dword_1B4CAC000, v29, OS_LOG_TYPE_DEFAULT, "Scope %@ is new - will try to identify it. Initial scope change is %@", buf, 0x16u);
        }
      }
    }
  }

  if (!*(unsigned char *)(*(void *)(a1[5] + 8) + 24)) {
LABEL_23:
  }
    *a4 = 1;
}

- (BOOL)_checkShouldHandleBatchInTransaction:(id)a3
{
  if ([(CPLEngineSyncTask *)self isCancelled] || self->_ignoreNewChanges || self->_badError) {
    return 0;
  }
  unint64_t v4 = self->_clientCacheIdentifier;
  long long v5 = [(CPLEngineStore *)self->_store clientCacheIdentifier];
  unint64_t v6 = (unint64_t)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    char v9 = [(id)v4 isEqual:v5];

    if (v9) {
      return 1;
    }
    goto LABEL_10;
  }

  if (v4 | v6)
  {
LABEL_10:
    [(CPLPullScopesTask *)self cancel];
    return 0;
  }
  return 1;
}

- (id)taskIdentifier
{
  return @"engine.sync.pullscopes";
}

- (CPLPullScopesTask)initWithEngineLibrary:(id)a3 session:(id)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CPLPullScopesTask;
  BOOL v7 = [(CPLEngineSyncTask *)&v13 initWithEngineLibrary:v6 session:a4];
  if (v7)
  {
    uint64_t v8 = [v6 store];
    store = v7->_store;
    v7->_store = (CPLEngineStore *)v8;

    uint64_t v10 = [(CPLEngineStore *)v7->_store scopes];
    scopes = v7->_scopes;
    v7->_scopes = (CPLEngineScopeStorage *)v10;
  }
  return v7;
}

@end