@interface CPLEngineForceSyncTask
- (BOOL)allowsLocalConflictResolutionWhenOverQuota;
- (BOOL)bypassForceSyncLimitations;
- (BOOL)forBackup;
- (BOOL)forDownload;
- (BOOL)forcingProcessedStagedScopes;
- (BOOL)isComputeStateTaskUploadEnabled;
- (CPLBackgroundActivity)taskActivity;
- (CPLEngineForceSyncTask)initWithScopeIdentifiers:(id)a3 engineLibrary:(id)a4 filter:(id)a5 delegate:(id)a6;
- (CPLEngineForceSyncTaskDelegate)delegate;
- (CPLEngineLibrary)engineLibrary;
- (CPLEngineStoreUserIdentifier)transportUserIdentifier;
- (CPLScopeFilter)filter;
- (NSDate)creationDate;
- (NSString)description;
- (id)_currentTask;
- (id)_phaseDescription;
- (id)taskDidFinishWithErrorBlock;
- (int64_t)maximumComputeStatesToUploadPerBatch;
- (void)_dispatchNextSyncTask;
- (void)_dispatchSyncTask:(id)a3;
- (void)_dropCurrentTask;
- (void)_finishWithError:(id)a3;
- (void)cancelTask;
- (void)dealloc;
- (void)launchTask;
- (void)reallyCancel;
- (void)reallyLaunch;
- (void)setBypassForceSyncLimitations:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setEngineLibrary:(id)a3;
- (void)setFilter:(id)a3;
- (void)setTaskActivity:(id)a3;
- (void)setTaskDidFinishWithErrorBlock:(id)a3;
- (void)setTransportUserIdentifier:(id)a3;
- (void)task:(id)a3 didFinishWithError:(id)a4;
@end

@implementation CPLEngineForceSyncTask

- (void).cxx_destruct
{
  objc_storeStrong(&self->_taskDidFinishWithErrorBlock, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_engineLibrary, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_transportUserIdentifier, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_syncTaskEnumerator, 0);
  objc_storeStrong((id *)&self->_fakeSession, 0);
  objc_storeStrong((id *)&self->_currentTask, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setBypassForceSyncLimitations:(BOOL)a3
{
  self->_bypassForceSyncLimitations = a3;
}

- (BOOL)bypassForceSyncLimitations
{
  return self->_bypassForceSyncLimitations;
}

- (void)setTaskDidFinishWithErrorBlock:(id)a3
{
}

- (id)taskDidFinishWithErrorBlock
{
  return self->_taskDidFinishWithErrorBlock;
}

- (void)setDelegate:(id)a3
{
}

- (CPLEngineForceSyncTaskDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CPLEngineForceSyncTaskDelegate *)WeakRetained;
}

- (void)setEngineLibrary:(id)a3
{
}

- (CPLEngineLibrary)engineLibrary
{
  return self->_engineLibrary;
}

- (void)setFilter:(id)a3
{
}

- (CPLScopeFilter)filter
{
  return self->_filter;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setTransportUserIdentifier:(id)a3
{
}

- (CPLEngineStoreUserIdentifier)transportUserIdentifier
{
  return self->_transportUserIdentifier;
}

- (BOOL)isComputeStateTaskUploadEnabled
{
  return [(CPLSyncSessionConfiguration *)self->_configuration isComputeStateTaskUploadEnabled];
}

- (int64_t)maximumComputeStatesToUploadPerBatch
{
  return [(CPLSyncSessionConfiguration *)self->_configuration maximumComputeStatesToUploadPerBatch];
}

- (BOOL)allowsLocalConflictResolutionWhenOverQuota
{
  return [(CPLSyncSessionConfiguration *)self->_configuration allowsLocalConflictResolutionWhenOverQuota];
}

- (NSString)description
{
  v3 = [(CPLEngineForceSyncTask *)self _phaseDescription];
  id v4 = [NSString alloc];
  uint64_t v5 = objc_opt_class();
  v6 = [(CPLForceSyncTask *)self taskIdentifier];
  v7 = [(CPLForceSyncTask *)self scopeIdentifiers];
  uint64_t v8 = [v7 componentsJoinedByString:@", "];
  v9 = (void *)v8;
  if (v3) {
    uint64_t v10 = [v4 initWithFormat:@"<%@ %@ (%@) (%@)>", v5, v6, v8, v3];
  }
  else {
    uint64_t v10 = [v4 initWithFormat:@"<%@ %@ (%@)>", v5, v6, v8, v13];
  }
  v11 = (void *)v10;

  return (NSString *)v11;
}

- (id)_phaseDescription
{
  p_currentTaskLock = &self->_currentTaskLock;
  os_unfair_lock_lock(&self->_currentTaskLock);
  id v4 = [(CPLEngineSyncTask *)self->_currentTask phaseDescription];
  if (v4)
  {
    uint64_t v5 = [[NSString alloc] initWithFormat:@"%@ %@", objc_opt_class(), v4];
  }
  else
  {
    uint64_t v5 = [(id)objc_opt_class() description];
  }
  v6 = (void *)v5;
  os_unfair_lock_unlock(p_currentTaskLock);

  return v6;
}

- (void)task:(id)a3 didFinishWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __50__CPLEngineForceSyncTask_task_didFinishWithError___block_invoke;
  v14[3] = &unk_1E60A6660;
  v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  v9 = v14;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_17731;
  block[3] = &unk_1E60A6978;
  id v18 = v9;
  uint64_t v10 = queue;
  id v11 = v7;
  id v12 = v6;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v13);
}

void __50__CPLEngineForceSyncTask_task_didFinishWithError___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) _currentTask];
  if (v2 == *(void **)(a1 + 40))
  {
    [*(id *)(a1 + 32) _dropCurrentTask];
    uint64_t v3 = *(void *)(a1 + 48);
    if (v3)
    {
      if (!_CPLSilentLogging)
      {
        id v4 = __CPLForceSyncOSLogDomain();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        {
          uint64_t v5 = *(void *)(a1 + 32);
          uint64_t v6 = *(void *)(a1 + 40);
          uint64_t v7 = *(void *)(a1 + 48);
          int v13 = 138543874;
          uint64_t v14 = v5;
          __int16 v15 = 2114;
          uint64_t v16 = v6;
          __int16 v17 = 2112;
          uint64_t v18 = v7;
          _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_ERROR, "%{public}@ failed during %{public}@: %@", (uint8_t *)&v13, 0x20u);
        }

        uint64_t v3 = *(void *)(a1 + 48);
      }
      [*(id *)(a1 + 32) _finishWithError:v3];
    }
    else
    {
      uint64_t v8 = *(unsigned char **)(a1 + 32);
      if (v8[45])
      {
        if (!_CPLSilentLogging)
        {
          v9 = __CPLForceSyncOSLogDomain();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v10 = *(void *)(a1 + 32);
            uint64_t v11 = *(void *)(a1 + 40);
            int v13 = 138543618;
            uint64_t v14 = v10;
            __int16 v15 = 2114;
            uint64_t v16 = v11;
            _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ has been cancelled during %{public}@", (uint8_t *)&v13, 0x16u);
          }

          uint64_t v8 = *(unsigned char **)(a1 + 32);
        }
        id v12 = +[CPLErrors operationCancelledError];
        [v8 _finishWithError:v12];
      }
      else
      {
        [*(id *)(a1 + 32) _dispatchNextSyncTask];
      }
    }
  }
}

- (void)reallyCancel
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__CPLEngineForceSyncTask_reallyCancel__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  v6[4] = self;
  uint64_t v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_17731;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  id v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

void __38__CPLEngineForceSyncTask_reallyCancel__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 45) = 1;
  v2 = *(unsigned char **)(a1 + 32);
  if (v2[44])
  {
    uint64_t v3 = [v2 _currentTask];
    id v6 = v3;
    if (v3)
    {
      [v3 cancel];
    }
    else
    {
      id v4 = *(void **)(a1 + 32);
      dispatch_block_t v5 = +[CPLErrors operationCancelledError];
      [v4 _finishWithError:v5];
    }
  }
}

- (void)reallyLaunch
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__CPLEngineForceSyncTask_reallyLaunch__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  v6[4] = self;
  uint64_t v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_17731;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  id v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

void __38__CPLEngineForceSyncTask_reallyLaunch__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 56) scheduler];
  [v2 willRunEngineElement:CPLEngineElementStartForceSync];

  *(unsigned char *)(*(void *)(a1 + 32) + 44) = 1;
  +[CPLTransaction beginTransactionWithIdentifier:@"cpl.forcesync" description:@"executing forced sync" keepPower:0];
  [*(id *)(*(void *)(a1 + 32) + 56) sessionWillStart];
  uint64_t v3 = *(unsigned char **)(a1 + 32);
  if (v3[45])
  {
    id v16 = +[CPLErrors operationCancelledError];
    [v3 _finishWithError:v16];
  }
  else
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v4 = [(CPLEngineSyncTask *)[CPLCleanupTask alloc] initWithEngineLibrary:*(void *)(*(void *)(a1 + 32) + 112) session:*(void *)(*(void *)(a1 + 32) + 56)];
    [v16 addObject:v4];

    dispatch_block_t v5 = [(CPLEngineMultiscopeSyncTask *)[CPLTransportUpdateTask alloc] initWithEngineLibrary:*(void *)(*(void *)(a1 + 32) + 112) session:*(void *)(*(void *)(a1 + 32) + 56)];
    [v16 addObject:v5];

    id v6 = [[CPLPullScopesTask alloc] initWithEngineLibrary:*(void *)(*(void *)(a1 + 32) + 112) session:*(void *)(*(void *)(a1 + 32) + 56)];
    [v16 addObject:v6];

    uint64_t v7 = [(CPLEngineMultiscopeSyncTask *)[CPLScopeUpdateTask alloc] initWithEngineLibrary:*(void *)(*(void *)(a1 + 32) + 112) session:*(void *)(*(void *)(a1 + 32) + 56)];
    [v16 addObject:v7];

    id v8 = [(CPLEngineMultiscopeSyncTask *)[CPLProcessStagedScopesTask alloc] initWithEngineLibrary:*(void *)(*(void *)(a1 + 32) + 112) session:*(void *)(*(void *)(a1 + 32) + 56)];
    [v16 addObject:v8];

    if (([*(id *)(a1 + 32) forcingProcessedStagedScopes] & 1) == 0)
    {
      if (([*(id *)(a1 + 32) forDownload] & 1) == 0)
      {
        v9 = [(CPLEngineMultiscopeSyncTask *)[CPLPushToTransportTask alloc] initWithEngineLibrary:*(void *)(*(void *)(a1 + 32) + 112) session:*(void *)(*(void *)(a1 + 32) + 56)];
        [v16 addObject:v9];
        [(CPLPushToTransportTask *)v9 setHighPriority:1];

        uint64_t v10 = [(CPLEngineMultiscopeSyncTask *)[CPLPushToTransportTask alloc] initWithEngineLibrary:*(void *)(*(void *)(a1 + 32) + 112) session:*(void *)(*(void *)(a1 + 32) + 56)];
        [v16 addObject:v10];
      }
      if (([*(id *)(a1 + 32) forBackup] & 1) == 0)
      {
        uint64_t v11 = [(CPLEngineMultiscopeSyncTask *)[CPLPullFromTransportTask alloc] initWithEngineLibrary:*(void *)(*(void *)(a1 + 32) + 112) session:*(void *)(*(void *)(a1 + 32) + 56)];
        [v16 addObject:v11];

        id v12 = [(CPLEngineMultiscopeSyncTask *)[CPLMingleChangesTask alloc] initWithEngineLibrary:*(void *)(*(void *)(a1 + 32) + 112) session:*(void *)(*(void *)(a1 + 32) + 56)];
        [v16 addObject:v12];
      }
    }
    uint64_t v13 = [v16 objectEnumerator];
    uint64_t v14 = *(void *)(a1 + 32);
    __int16 v15 = *(void **)(v14 + 64);
    *(void *)(v14 + 64) = v13;

    [*(id *)(a1 + 32) _dispatchNextSyncTask];
  }
}

- (void)launchTask
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained forceSyncTaskHasBeenLaunched:self];
}

- (void)_finishWithError:(id)a3
{
  id v4 = a3;
  dispatch_block_t v5 = [(CPLEngineForceSyncTask *)self taskDidFinishWithErrorBlock];
  ((void (**)(void, CPLEngineForceSyncTask *, id))v5)[2](v5, self, v4);

  self->_reallyLaunched = 0;
  [(CPLSyncSession *)self->_fakeSession sessionIsDone];
  fakeSession = self->_fakeSession;
  self->_fakeSession = 0;

  +[CPLTransaction endTransactionWithIdentifier:@"cpl.forcesync"];
}

- (void)_dispatchNextSyncTask
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NSEnumerator *)self->_syncTaskEnumerator nextObject];
  if (v3)
  {
    if (!_CPLSilentLogging)
    {
      id v4 = __CPLForceSyncOSLogDomain();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        dispatch_block_t v5 = [v3 taskIdentifier];
        int v6 = 138543618;
        uint64_t v7 = self;
        __int16 v8 = 2114;
        v9 = v5;
        _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: launching %{public}@", (uint8_t *)&v6, 0x16u);
      }
    }
    [(CPLEngineForceSyncTask *)self _dispatchSyncTask:v3];
  }
  else
  {
    [(CPLEngineForceSyncTask *)self _finishWithError:0];
  }
}

- (void)_dropCurrentTask
{
  p_currentTaskLock = &self->_currentTaskLock;
  os_unfair_lock_lock(&self->_currentTaskLock);
  currentTask = self->_currentTask;
  self->_currentTask = 0;

  os_unfair_lock_unlock(p_currentTaskLock);
}

- (id)_currentTask
{
  p_currentTaskLock = &self->_currentTaskLock;
  os_unfair_lock_lock(&self->_currentTaskLock);
  id v4 = self->_currentTask;
  os_unfair_lock_unlock(p_currentTaskLock);
  return v4;
}

- (void)_dispatchSyncTask:(id)a3
{
  id v4 = (CPLEngineSyncTask *)a3;
  os_unfair_lock_lock(&self->_currentTaskLock);
  currentTask = self->_currentTask;
  self->_currentTask = v4;
  int v6 = v4;

  [(CPLEngineSyncTask *)v6 setTransportUserIdentifier:self->_transportUserIdentifier];
  [(CPLEngineSyncTask *)v6 setForceSync:1];
  [(CPLEngineSyncTask *)v6 setForeground:1];
  [(CPLEngineSyncTask *)v6 setDelegate:self];
  [(CPLEngineSyncTask *)v6 launch];

  os_unfair_lock_unlock(&self->_currentTaskLock);
}

- (void)cancelTask
{
  v4.receiver = self;
  v4.super_class = (Class)CPLEngineForceSyncTask;
  [(CPLForceSyncTask *)&v4 cancelTask];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained forceSyncTaskHasBeenCancelled:self];
}

- (void)setTaskActivity:(id)a3
{
}

- (CPLBackgroundActivity)taskActivity
{
  return [(CPLSyncSession *)self->_fakeSession detachedActivity];
}

- (BOOL)forcingProcessedStagedScopes
{
  return 0;
}

- (BOOL)forDownload
{
  return 0;
}

- (BOOL)forBackup
{
  return 0;
}

- (void)dealloc
{
  fakeSession = self->_fakeSession;
  if (fakeSession) {
    [(CPLSyncSession *)fakeSession sessionWontHappen];
  }
  v4.receiver = self;
  v4.super_class = (Class)CPLEngineForceSyncTask;
  [(CPLEngineForceSyncTask *)&v4 dealloc];
}

- (CPLEngineForceSyncTask)initWithScopeIdentifiers:(id)a3 engineLibrary:(id)a4 filter:(id)a5 delegate:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)CPLEngineForceSyncTask;
  uint64_t v14 = [(CPLForceSyncTask *)&v26 initWithScopeIdentifiers:a3];
  __int16 v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_engineLibrary, a4);
    objc_storeStrong((id *)&v15->_filter, a5);
    objc_storeWeak((id *)&v15->_delegate, v13);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.cpl.forcesync", 0);
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v16;

    v15->_currentTaskLock._os_unfair_lock_opaque = 0;
    uint64_t v18 = [v11 configuration];
    configuration = v15->_configuration;
    v15->_configuration = (CPLSyncSessionConfiguration *)v18;

    v20 = [(CPLEngineLibrary *)v15->_engineLibrary scheduler];
    uint64_t v21 = +[CPLSyncSession detachedSyncSessionWithScheduler:v20 configuration:v15 scopeFilter:v12];
    fakeSession = v15->_fakeSession;
    v15->_fakeSession = (CPLSyncSession *)v21;

    uint64_t v23 = [MEMORY[0x1E4F1C9C8] date];
    creationDate = v15->_creationDate;
    v15->_creationDate = (NSDate *)v23;
  }
  return v15;
}

@end