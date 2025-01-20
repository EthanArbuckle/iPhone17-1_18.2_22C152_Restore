@interface CPLEngineMultiscopeSyncTask
- (BOOL)shouldContinueAfterError:(id)a3 fromTask:(id)a4;
- (BOOL)shouldProcessScope:(id)a3 inTransaction:(id)a4;
- (BOOL)shouldSkipScopesWithMissingTransportScope;
- (BOOL)shouldStartTaskInTransaction:(id)a3;
- (CPLEngineMultiscopeSyncTask)initWithEngineLibrary:(id)a3 session:(id)a4;
- (CPLEngineScopeStorage)scopes;
- (id)_currentScope;
- (id)_currentTask;
- (id)enumerateScopesForTaskInTransaction:(id)a3;
- (id)newScopedTaskWithScope:(id)a3 session:(id)a4 transportScope:(id)a5 clientCacheIdentifier:(id)a6;
- (id)phaseDescription;
- (id)phaseDescriptionLastChangeDate:(id *)a3;
- (id)scopeFilterInTransaction:(id)a3;
- (void)_launchTaskForNextScope;
- (void)_setCurrentTask:(id)a3;
- (void)cancel;
- (void)dispatchAsyncWithCurrentSubtask:(id)a3;
- (void)launch;
- (void)setForceSync:(BOOL)a3;
- (void)setForeground:(BOOL)a3;
- (void)task:(id)a3 didFinishWithError:(id)a4;
@end

@implementation CPLEngineMultiscopeSyncTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scopes, 0);
  objc_storeStrong((id *)&self->_additionalScopeFilter, 0);
  objc_storeStrong((id *)&self->_baseScopeFilter, 0);
  objc_storeStrong((id *)&self->_clientCacheIdentifier, 0);
  objc_storeStrong((id *)&self->_transportScopes, 0);
  objc_storeStrong((id *)&self->_excludedScopes, 0);
  objc_storeStrong((id *)&self->_coveredScopes, 0);
  objc_storeStrong((id *)&self->_currentTask, 0);
  objc_storeStrong((id *)&self->_currentTaskQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (CPLEngineScopeStorage)scopes
{
  return self->_scopes;
}

- (id)phaseDescription
{
  v3 = [(CPLEngineMultiscopeSyncTask *)self _currentTask];
  v4 = [v3 scope];
  v5 = [v4 scopeIdentifier];

  v6 = [v3 phaseDescription];
  v7 = v6;
  if (v5 && v6)
  {
    [NSString stringWithFormat:@"for %@ [%@]", v5, v6];
LABEL_6:
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (v5)
  {
    [NSString stringWithFormat:@"for %@", v5, v11];
    goto LABEL_6;
  }
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)CPLEngineMultiscopeSyncTask;
    id v8 = [(CPLEngineSyncTask *)&v12 phaseDescription];
  }
LABEL_7:
  v9 = v8;

  return v9;
}

- (id)phaseDescriptionLastChangeDate:(id *)a3
{
  v5 = [(CPLEngineMultiscopeSyncTask *)self _currentTask];
  v6 = [v5 scope];
  v7 = [v6 scopeIdentifier];

  id v8 = [v5 phaseDescriptionLastChangeDate:a3];
  v9 = v8;
  if (v7 && v8)
  {
    [NSString stringWithFormat:@"for %@ [%@]", v7, v8];
LABEL_6:
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (v7)
  {
    [NSString stringWithFormat:@"for %@", v7, v13];
    goto LABEL_6;
  }
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)CPLEngineMultiscopeSyncTask;
    id v10 = [(CPLEngineSyncTask *)&v14 phaseDescriptionLastChangeDate:a3];
  }
LABEL_7:
  uint64_t v11 = v10;

  return v11;
}

- (void)task:(id)a3 didFinishWithError:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __55__CPLEngineMultiscopeSyncTask_task_didFinishWithError___block_invoke;
  v34[3] = &unk_1E60A67C8;
  v34[4] = self;
  id v9 = v7;
  id v35 = v9;
  SEL v37 = a2;
  id v10 = v8;
  id v36 = v10;
  uint64_t v11 = (void (**)(void))MEMORY[0x1BA994060](v34);
  objc_super v12 = [v10 domain];
  int v13 = [v12 isEqualToString:@"CloudPhotoLibraryErrorDomain"];

  if (!v13) {
    goto LABEL_17;
  }
  unint64_t v14 = [v10 code];
  unint64_t v15 = v14;
  if (v14 > 0x21 || ((1 << v14) & 0x300840000) == 0)
  {
    if (v14 != 1002)
    {
LABEL_17:
      v11[2](v11);
      goto LABEL_18;
    }
    if (!_CPLSilentLogging)
    {
      v25 = __CPLTaskOSLogDomain_14840();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = [(CPLEngineMultiscopeSyncTask *)self _currentScope];
        v27 = [v26 scopeIdentifier];
        *(_DWORD *)buf = 138412290;
        v39 = v27;
        _os_log_impl(&dword_1B4CAC000, v25, OS_LOG_TYPE_DEFAULT, "Detected some feature has been disabled while processing %@ - will update disabled features", buf, 0xCu);
      }
    }
    v28 = [(CPLEngineSyncTask *)self engineLibrary];
    v17 = [v28 scheduler];

    [v17 noteStoreNeedsToUpdateDisabledFeatures];
LABEL_16:

    goto LABEL_17;
  }
  v16 = [(CPLEngineSyncTask *)self engineLibrary];
  v17 = [v16 store];

  v18 = [v9 scopesForTask];
  uint64_t v19 = [v18 count];
  v20 = [(CPLEngineSyncTask *)self session];
  v21 = v20;
  if (!v19)
  {
    [v20 requestSyncStateAtEndOfSyncSession:4 reschedule:0];

    goto LABEL_16;
  }
  if (v15 == 23) {
    uint64_t v22 = 4;
  }
  else {
    uint64_t v22 = 5;
  }
  [v20 requestSyncStateAtEndOfSyncSession:v22 reschedule:0];

  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __55__CPLEngineMultiscopeSyncTask_task_didFinishWithError___block_invoke_111;
  v31[3] = &unk_1E60AB550;
  id v32 = v18;
  v33 = self;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __55__CPLEngineMultiscopeSyncTask_task_didFinishWithError___block_invoke_114;
  v29[3] = &unk_1E60AB550;
  v29[4] = self;
  id v30 = v10;
  id v23 = v18;
  id v24 = (id)[v17 performWriteTransactionWithBlock:v31 completionHandler:v29];

LABEL_18:
}

void __55__CPLEngineMultiscopeSyncTask_task_didFinishWithError___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 72);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__CPLEngineMultiscopeSyncTask_task_didFinishWithError___block_invoke_2;
  v10[3] = &unk_1E60A67C8;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v11 = v3;
  uint64_t v12 = v4;
  long long v9 = *(_OWORD *)(a1 + 48);
  id v5 = (id)v9;
  long long v13 = v9;
  v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_14931;
  block[3] = &unk_1E60A6978;
  id v15 = v6;
  id v7 = v2;
  dispatch_block_t v8 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v8);
}

void __55__CPLEngineMultiscopeSyncTask_task_didFinishWithError___block_invoke_111(uint64_t a1, void *a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__CPLEngineMultiscopeSyncTask_task_didFinishWithError___block_invoke_2_112;
  v6[3] = &unk_1E60AB750;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  [a2 do:v6];
}

void __55__CPLEngineMultiscopeSyncTask_task_didFinishWithError___block_invoke_114(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 error];

  if (v4)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v5 = __CPLTaskOSLogDomain_14840();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6 = [v3 error];
        int v9 = 138412290;
        id v10 = v6;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_ERROR, "Failed to mark scopes as needing update: %@", (uint8_t *)&v9, 0xCu);
      }
    }
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = [v3 error];
    [v7 taskDidFinishWithError:v8];
  }
  else
  {
    [*(id *)(a1 + 32) taskDidFinishWithError:*(void *)(a1 + 40)];
  }
}

uint64_t __55__CPLEngineMultiscopeSyncTask_task_didFinishWithError___block_invoke_2_112(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v19;
    while (2)
    {
      uint64_t v9 = 0;
      id v10 = v7;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * v9);
        if (!_CPLSilentLogging)
        {
          uint64_t v12 = __CPLTaskOSLogDomain_14840();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v23 = v11;
            _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_DEFAULT, "%@ will need to be updated from the transport", buf, 0xCu);
          }
        }
        long long v13 = *(void **)(*(void *)(a1 + 40) + 144);
        id v17 = v10;
        int v14 = [v13 setScopeNeedsUpdateFromTransport:v11 error:&v17];
        id v7 = v17;

        if (!v14)
        {

          if (a2)
          {
            id v7 = v7;
            uint64_t v15 = 0;
            *a2 = v7;
          }
          else
          {
            uint64_t v15 = 0;
          }
          goto LABEL_19;
        }
        ++v9;
        id v10 = v7;
      }
      while (v6 != v9);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v24 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v7 = 0;
  }

  uint64_t v15 = 1;
LABEL_19:

  return v15;
}

uint64_t __55__CPLEngineMultiscopeSyncTask_task_didFinishWithError___block_invoke_2(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) _currentTask];

  if (v2 != v3)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v9 = __CPLTaskOSLogDomain_14840();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        uint64_t v11 = *(void *)(a1 + 40);
        uint64_t v12 = NSStringFromSelector(*(SEL *)(a1 + 56));
        *(_DWORD *)buf = 138412802;
        uint64_t v21 = v10;
        __int16 v22 = 2112;
        uint64_t v23 = v11;
        __int16 v24 = 2112;
        uint64_t v25 = v12;
        _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_ERROR, "Unknown %@ called -[%@ %@]", buf, 0x20u);
      }
    }
    long long v13 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v14 = *(void *)(a1 + 56);
    uint64_t v15 = *(void *)(a1 + 40);
    v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineSyncTask.m"];
    uint64_t v17 = *(void *)(a1 + 32);
    uint64_t v18 = *(void *)(a1 + 40);
    long long v19 = NSStringFromSelector(*(SEL *)(a1 + 56));
    [v13 handleFailureInMethod:v14, v15, v16, 364, @"Unknown %@ called -[%@ %@]", v17, v18, v19 object file lineNumber description];

    abort();
  }
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4 && ([*(id *)(a1 + 40) shouldContinueAfterError:v4 fromTask:*(void *)(a1 + 32)] & 1) == 0)
  {
    id v7 = *(void **)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    return [v7 taskDidFinishWithError:v8];
  }
  else
  {
    uint64_t v5 = *(void **)(a1 + 40);
    return [v5 _launchTaskForNextScope];
  }
}

- (void)cancel
{
  v8.receiver = self;
  v8.super_class = (Class)CPLEngineMultiscopeSyncTask;
  [(CPLEngineSyncTask *)&v8 cancel];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__CPLEngineMultiscopeSyncTask_cancel__block_invoke;
  v7[3] = &unk_1E60A5DD8;
  v7[4] = self;
  uint64_t v4 = v7;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_14931;
  block[3] = &unk_1E60A6978;
  id v10 = v4;
  uint64_t v5 = queue;
  dispatch_block_t v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);
}

void __37__CPLEngineMultiscopeSyncTask_cancel__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) _currentTask];
  if (v1)
  {
    id v2 = v1;
    [v1 cancel];
    v1 = v2;
  }
}

- (void)setForeground:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__CPLEngineMultiscopeSyncTask_setForeground___block_invoke;
  v4[3] = &unk_1E60AA7B8;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_sync(queue, v4);
}

void __45__CPLEngineMultiscopeSyncTask_setForeground___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 40);
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)CPLEngineMultiscopeSyncTask;
  objc_msgSendSuper2(&v4, sel_setForeground_, v2);
  id v3 = [*(id *)(a1 + 32) _currentTask];
  [v3 setForeground:*(unsigned __int8 *)(a1 + 40)];
}

- (void)setForceSync:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__CPLEngineMultiscopeSyncTask_setForceSync___block_invoke;
  v4[3] = &unk_1E60AA7B8;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_sync(queue, v4);
}

void __44__CPLEngineMultiscopeSyncTask_setForceSync___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 40);
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)CPLEngineMultiscopeSyncTask;
  objc_msgSendSuper2(&v4, sel_setForceSync_, v2);
  id v3 = [*(id *)(a1 + 32) _currentTask];
  [v3 setForceSync:*(unsigned __int8 *)(a1 + 40)];
}

- (void)launch
{
  v9.receiver = self;
  v9.super_class = (Class)CPLEngineMultiscopeSyncTask;
  [(CPLEngineSyncTask *)&v9 launch];
  id v3 = [(CPLEngineSyncTask *)self engineLibrary];
  objc_super v4 = [v3 store];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__CPLEngineMultiscopeSyncTask_launch__block_invoke;
  v7[3] = &unk_1E60AB550;
  v7[4] = self;
  id v8 = v4;
  id v5 = v4;
  id v6 = (id)[v5 performReadTransactionWithBlock:v7];
}

void __37__CPLEngineMultiscopeSyncTask_launch__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_super v4 = [v3 error];

  id v5 = *(void **)(a1 + 32);
  if (v4)
  {
    id v6 = [v3 error];
    [v5 taskDidFinishWithError:v6];
LABEL_36:

    goto LABEL_37;
  }
  if ([*(id *)(a1 + 32) shouldStartTaskInTransaction:v3])
  {
    uint64_t v7 = [*(id *)(a1 + 40) clientCacheIdentifier];
    uint64_t v8 = *(void *)(a1 + 32);
    objc_super v9 = *(void **)(v8 + 120);
    *(void *)(v8 + 120) = v7;

    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(void **)(v11 + 96);
    *(void *)(v11 + 96) = v10;

    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v15 = *(void **)(v14 + 112);
    *(void *)(v14 + 112) = v13;

    v16 = [*(id *)(a1 + 32) session];
    uint64_t v17 = [v16 scopeFilter];
    uint64_t v18 = *(void *)(a1 + 32);
    long long v19 = *(void **)(v18 + 128);
    *(void *)(v18 + 128) = v17;

    uint64_t v20 = [*(id *)(a1 + 32) scopeFilterInTransaction:v3];
    uint64_t v21 = *(void *)(a1 + 32);
    __int16 v22 = *(void **)(v21 + 136);
    *(void *)(v21 + 136) = v20;

    char v55 = [*(id *)(a1 + 32) shouldSkipScopesWithMissingTransportScope];
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    uint64_t v23 = [*(id *)(a1 + 32) enumerateScopesForTaskInTransaction:v3];
    uint64_t v24 = [v23 countByEnumeratingWithState:&v59 objects:v63 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v60;
LABEL_6:
      uint64_t v27 = 0;
      while (1)
      {
        if (*(void *)v60 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = *(void **)(*((void *)&v59 + 1) + 8 * v27);
        if ([*(id *)(a1 + 32) isCancelled]) {
          goto LABEL_20;
        }
        v29 = [v28 scopeIdentifier];
        char v30 = [*(id *)(a1 + 32) shouldProcessScope:v28 inTransaction:v3];
        uint64_t v31 = *(void *)(a1 + 32);
        if ((v30 & 1) == 0)
        {
          if (!*(void *)(v31 + 104)) {
            [0 addObject:v28];
          }
          goto LABEL_18;
        }
        id v32 = [*(id *)(v31 + 144) transportScopeForScope:v28];
        if (v32) {
          break;
        }
        if ((v55 & 1) == 0) {
          goto LABEL_16;
        }
LABEL_17:

LABEL_18:
        if (v25 == ++v27)
        {
          uint64_t v25 = [v23 countByEnumeratingWithState:&v59 objects:v63 count:16];
          if (v25) {
            goto LABEL_6;
          }
          goto LABEL_20;
        }
      }
      [*(id *)(*(void *)(a1 + 32) + 112) setObject:v32 forKeyedSubscript:v29];
LABEL_16:
      [*(id *)(*(void *)(a1 + 32) + 96) addObject:v28];
      goto LABEL_17;
    }
LABEL_20:

    int v33 = [*(id *)(a1 + 32) isCancelled];
    uint64_t v34 = *(void *)(a1 + 32);
    if (v33)
    {
      id v35 = *(void **)(v34 + 72);
      id v36 = v58;
      v58[0] = MEMORY[0x1E4F143A8];
      v58[1] = 3221225472;
      v58[2] = __37__CPLEngineMultiscopeSyncTask_launch__block_invoke_2;
      v58[3] = &unk_1E60A5DD8;
      v58[4] = v34;
LABEL_35:
      v53 = v36;
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __cpl_dispatch_async_block_invoke_14931;
      v65 = &unk_1E60A6978;
      id v66 = v53;
      id v6 = v35;
      dispatch_block_t v54 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
      dispatch_async(v6, v54);

      goto LABEL_36;
    }
    uint64_t v39 = [*(id *)(v34 + 96) count];
    uint64_t v40 = *(void *)(a1 + 32);
    if (!v39)
    {
      id v35 = *(void **)(v40 + 72);
      id v36 = v56;
      v56[0] = MEMORY[0x1E4F143A8];
      v56[1] = 3221225472;
      v56[2] = __37__CPLEngineMultiscopeSyncTask_launch__block_invoke_2_103;
      v56[3] = &unk_1E60A5DD8;
      v56[4] = v40;
      goto LABEL_35;
    }
    if (*(void *)(v40 + 104))
    {
      if (!_CPLSilentLogging)
      {
        v41 = __CPLTaskOSLogDomain_14840();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          v42 = objc_opt_class();
          v43 = *(void **)(*(void *)(a1 + 32) + 96);
          id v44 = v42;
          uint64_t v45 = [v43 count];
          uint64_t v46 = [*(id *)(*(void *)(a1 + 32) + 104) count];
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v42;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v45;
          *(_WORD *)&buf[22] = 2048;
          v65 = (void *)v46;
          v47 = "Launching %@ for %ld scopes (ignored %ld)";
          v48 = v41;
          uint32_t v49 = 32;
LABEL_32:
          _os_log_impl(&dword_1B4CAC000, v48, OS_LOG_TYPE_DEFAULT, v47, buf, v49);

          goto LABEL_33;
        }
        goto LABEL_33;
      }
    }
    else if (!_CPLSilentLogging)
    {
      v41 = __CPLTaskOSLogDomain_14840();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        v50 = objc_opt_class();
        v51 = *(void **)(*(void *)(a1 + 32) + 96);
        id v44 = v50;
        uint64_t v52 = [v51 count];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v50;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v52;
        v47 = "Launching %@ for %ld scopes";
        v48 = v41;
        uint32_t v49 = 22;
        goto LABEL_32;
      }
LABEL_33:

      uint64_t v40 = *(void *)(a1 + 32);
    }
    id v35 = *(void **)(v40 + 72);
    id v36 = v57;
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __37__CPLEngineMultiscopeSyncTask_launch__block_invoke_102;
    v57[3] = &unk_1E60A5DD8;
    v57[4] = v40;
    goto LABEL_35;
  }
  SEL v37 = *(void **)(a1 + 32);
  v38 = +[CPLErrors operationCancelledError];
  [v37 taskDidFinishWithError:v38];

LABEL_37:
}

void __37__CPLEngineMultiscopeSyncTask_launch__block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = +[CPLErrors operationCancelledError];
  [v1 taskDidFinishWithError:v2];
}

uint64_t __37__CPLEngineMultiscopeSyncTask_launch__block_invoke_102(uint64_t a1)
{
  return [*(id *)(a1 + 32) _launchTaskForNextScope];
}

uint64_t __37__CPLEngineMultiscopeSyncTask_launch__block_invoke_2_103(uint64_t a1)
{
  return [*(id *)(a1 + 32) taskDidFinishWithError:0];
}

- (void)_launchTaskForNextScope
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = [(CPLEngineSyncTask *)self session];
  int v4 = [v3 shouldDefer];

  if (v4)
  {
    if (!_CPLSilentLogging)
    {
      id v5 = __CPLTaskOSLogDomain_14840();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = (id)objc_opt_class();
        id v6 = v18;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEFAULT, "Session for %@ has been deferred", buf, 0xCu);
      }
    }
    [(CPLEngineMultiscopeSyncTask *)self _setCurrentTask:0];
    uint64_t v7 = +[CPLErrors sessionHasBeenDeferredError];
    [(CPLEngineSyncTask *)self taskDidFinishWithError:v7];

    return;
  }
  if ([(CPLEngineSyncTask *)self isCancelled])
  {
    [(CPLEngineMultiscopeSyncTask *)self _setCurrentTask:0];
    uint64_t v8 = +[CPLErrors operationCancelledError];
    objc_super v9 = self;
    id v16 = (id)v8;
LABEL_12:
    [(CPLEngineSyncTask *)v9 taskDidFinishWithError:v8];
    goto LABEL_13;
  }
  id v10 = [(NSMutableArray *)self->_coveredScopes firstObject];
  id v16 = v10;
  if (!v10)
  {
    [(CPLEngineMultiscopeSyncTask *)self _setCurrentTask:0];
    objc_super v9 = self;
    uint64_t v8 = 0;
    goto LABEL_12;
  }
  uint64_t v11 = [v10 scopeIdentifier];
  uint64_t v12 = [(NSMutableDictionary *)self->_transportScopes objectForKeyedSubscript:v11];
  [(NSMutableArray *)self->_coveredScopes removeObjectAtIndex:0];
  [(NSMutableDictionary *)self->_transportScopes removeObjectForKey:v11];
  id v13 = [(CPLEngineSyncTask *)self session];
  id v14 = [(CPLEngineMultiscopeSyncTask *)self newScopedTaskWithScope:v16 session:v13 transportScope:v12 clientCacheIdentifier:self->_clientCacheIdentifier];

  objc_msgSend(v14, "setForeground:", -[CPLEngineSyncTask foreground](self, "foreground"));
  objc_msgSend(v14, "setForceSync:", -[CPLEngineSyncTask forceSync](self, "forceSync"));
  uint64_t v15 = [(CPLEngineSyncTask *)self transportUserIdentifier];
  [v14 setTransportUserIdentifier:v15];

  [(CPLEngineMultiscopeSyncTask *)self _setCurrentTask:v14];
  [v14 setDelegate:self];
  [v14 launch];

LABEL_13:
}

- (BOOL)shouldSkipScopesWithMissingTransportScope
{
  return 1;
}

- (BOOL)shouldContinueAfterError:(id)a3 fromTask:(id)a4
{
  return 0;
}

- (BOOL)shouldProcessScope:(id)a3 inTransaction:(id)a4
{
  id v5 = [a3 scopeIdentifier];
  baseScopeFilter = self->_baseScopeFilter;
  if (baseScopeFilter && ![(CPLScopeFilter *)baseScopeFilter filterOnScopeIdentifier:v5])
  {
    char v8 = 0;
  }
  else
  {
    additionalScopeFilter = self->_additionalScopeFilter;
    if (additionalScopeFilter) {
      char v8 = [(CPLScopeFilter *)additionalScopeFilter filterOnScopeIdentifier:v5];
    }
    else {
      char v8 = 1;
    }
  }

  return v8;
}

- (id)scopeFilterInTransaction:(id)a3
{
  return 0;
}

- (id)enumerateScopesForTaskInTransaction:(id)a3
{
  return [(CPLEngineScopeStorage *)self->_scopes enumeratorForScopesIncludeInactive:0];
}

- (id)newScopedTaskWithScope:(id)a3 session:(id)a4 transportScope:(id)a5 clientCacheIdentifier:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
  id v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineSyncTask.m"];
  uint64_t v17 = NSStringFromSelector(a2);
  [v15 handleFailureInMethod:a2, self, v16, 213, @"%@ should be overridden by %@", v17, objc_opt_class() object file lineNumber description];

  abort();
}

- (BOOL)shouldStartTaskInTransaction:(id)a3
{
  id v3 = [(CPLEngineSyncTask *)self engineLibrary];
  int v4 = [v3 store];
  char v5 = [v4 isClientInSyncWithClientCache];

  return v5;
}

- (void)dispatchAsyncWithCurrentSubtask:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__CPLEngineMultiscopeSyncTask_dispatchAsyncWithCurrentSubtask___block_invoke;
  v10[3] = &unk_1E60A9C70;
  void v10[4] = self;
  id v11 = v4;
  id v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_14931;
  block[3] = &unk_1E60A6978;
  id v13 = v6;
  uint64_t v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

void __63__CPLEngineMultiscopeSyncTask_dispatchAsyncWithCurrentSubtask___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _currentTask];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (id)_currentScope
{
  id v2 = [(CPLEngineMultiscopeSyncTask *)self _currentTask];
  id v3 = [v2 scope];

  return v3;
}

- (void)_setCurrentTask:(id)a3
{
  id v4 = a3;
  currentTaskQueue = self->_currentTaskQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__CPLEngineMultiscopeSyncTask__setCurrentTask___block_invoke;
  v7[3] = &unk_1E60A6728;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(currentTaskQueue, v7);
}

void __47__CPLEngineMultiscopeSyncTask__setCurrentTask___block_invoke(uint64_t a1)
{
}

- (id)_currentTask
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  dispatch_block_t v9 = __Block_byref_object_copy__14943;
  id v10 = __Block_byref_object_dispose__14944;
  id v11 = 0;
  currentTaskQueue = self->_currentTaskQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__CPLEngineMultiscopeSyncTask__currentTask__block_invoke;
  v5[3] = &unk_1E60A5CE8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(currentTaskQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __43__CPLEngineMultiscopeSyncTask__currentTask__block_invoke(uint64_t a1)
{
}

- (CPLEngineMultiscopeSyncTask)initWithEngineLibrary:(id)a3 session:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)CPLEngineMultiscopeSyncTask;
  id v4 = [(CPLEngineSyncTask *)&v16 initWithEngineLibrary:a3 session:a4];
  if (v4)
  {
    char v5 = CPLCopyDefaultSerialQueueAttributes();
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.cpl.multiscopetask", v5);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v6;

    uint64_t v8 = CPLCopyDefaultSerialQueueAttributes();
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.cpl.multiscopetask.currenttask", v8);
    currentTaskQueue = v4->_currentTaskQueue;
    v4->_currentTaskQueue = (OS_dispatch_queue *)v9;

    id v11 = [(CPLEngineSyncTask *)v4 engineLibrary];
    id v12 = [v11 store];
    uint64_t v13 = [v12 scopes];
    scopes = v4->_scopes;
    v4->_scopes = (CPLEngineScopeStorage *)v13;
  }
  return v4;
}

@end