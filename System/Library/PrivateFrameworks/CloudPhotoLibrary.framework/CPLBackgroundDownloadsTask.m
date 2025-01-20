@interface CPLBackgroundDownloadsTask
- (BOOL)_isErrorCountingForARetry:(id)a3;
- (CPLBackgroundDownloadsTask)initWithEngineLibrary:(id)a3 session:(id)a4;
- (id)description;
- (id)taskIdentifier;
- (unint64_t)_activeTransferTaskCount;
- (unint64_t)_transportTaskCount;
- (void)_completeBackgroundDownloadForResource:(id)a3 error:(id)a4 withTransaction:(id)a5;
- (void)_downloadTask:(id)a3 didFinishWithErrorLocked:(id)a4;
- (void)_enqueueTasksLocked;
- (void)_finishTaskLocked;
- (void)_getResourceTypesToDownload:(const unint64_t *)a3;
- (void)_launchNecessaryDownloadTasksWithTransaction:(id)a3;
- (void)_transportTaskDidFinish:(id)a3;
- (void)_updateActiveDownloadTaskCount;
- (void)cancel;
- (void)launch;
- (void)taskDidFinishWithError:(id)a3;
@end

@implementation CPLBackgroundDownloadsTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentsToDownload, 0);
  objc_storeStrong((id *)&self->_stopError, 0);
  objc_storeStrong((id *)&self->_badError, 0);
  objc_storeStrong((id *)&self->_transportTasks, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CPLBackgroundDownloadsTask *)self taskIdentifier];
  v6 = [v3 stringWithFormat:@"<%@ %@ [%lu resources using %lu tasks]>", v4, v5, -[CPLBackgroundDownloadsTask _activeTransferTaskCount](self, "_activeTransferTaskCount"), -[CPLBackgroundDownloadsTask _transportTaskCount](self, "_transportTaskCount")];

  return v6;
}

- (id)taskIdentifier
{
  return @"engine.sync.backgrounddownloads";
}

- (void)cancel
{
  v8.receiver = self;
  v8.super_class = (Class)CPLBackgroundDownloadsTask;
  [(CPLEngineSyncTask *)&v8 cancel];
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__CPLBackgroundDownloadsTask_cancel__block_invoke;
  v7[3] = &unk_1E60A5DD8;
  v7[4] = self;
  uint64_t v4 = v7;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_13800;
  block[3] = &unk_1E60A6978;
  id v10 = v4;
  v5 = lock;
  dispatch_block_t v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);
}

void __36__CPLBackgroundDownloadsTask_cancel__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 104))
  {
    uint64_t v3 = +[CPLErrors operationCancelledError];
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 104);
    *(void *)(v4 + 104) = v3;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *(id *)(v2 + 80);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "cancel", (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 88) = 1;
}

- (void)taskDidFinishWithError:(id)a3
{
  id v4 = a3;
  [(CPLBackgroundDownloadsTask *)self hash];
  kdebug_trace();
  v5.receiver = self;
  v5.super_class = (Class)CPLBackgroundDownloadsTask;
  [(CPLEngineSyncTask *)&v5 taskDidFinishWithError:v4];
}

- (void)launch
{
  [(CPLBackgroundDownloadsTask *)self hash];
  kdebug_trace();
  v8.receiver = self;
  v8.super_class = (Class)CPLBackgroundDownloadsTask;
  [(CPLEngineSyncTask *)&v8 launch];
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__CPLBackgroundDownloadsTask_launch__block_invoke;
  v7[3] = &unk_1E60A5DD8;
  v7[4] = self;
  id v4 = v7;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_13800;
  block[3] = &unk_1E60A6978;
  id v10 = v4;
  objc_super v5 = lock;
  dispatch_block_t v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);
}

uint64_t __36__CPLBackgroundDownloadsTask_launch__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enqueueTasksLocked];
}

- (void)_transportTaskDidFinish:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!_CPLSilentLogging)
  {
    objc_super v5 = __CPLTaskOSLogDomain_13804();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEBUG, "Transport task %@ did finish", (uint8_t *)&buf, 0xCu);
    }
  }
  lock = self->_lock;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__CPLBackgroundDownloadsTask__transportTaskDidFinish___block_invoke;
  v11[3] = &unk_1E60A6728;
  v11[4] = self;
  id v12 = v4;
  uint64_t v7 = v11;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  long long v14 = __cpl_dispatch_async_block_invoke_13800;
  v15 = &unk_1E60A6978;
  id v16 = v7;
  objc_super v8 = lock;
  id v9 = v4;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &buf);
  dispatch_async(v8, v10);
}

void __54__CPLBackgroundDownloadsTask__transportTaskDidFinish___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) engineLibrary];
  uint64_t v3 = [v2 store];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__CPLBackgroundDownloadsTask__transportTaskDidFinish___block_invoke_2;
  v5[3] = &unk_1E60A6728;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v3 performBatchedWriteTransactionBarrierWithCompletionBlock:v5];
}

void __54__CPLBackgroundDownloadsTask__transportTaskDidFinish___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 72);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__CPLBackgroundDownloadsTask__transportTaskDidFinish___block_invoke_3;
  v6[3] = &unk_1E60A6728;
  v6[4] = v1;
  id v7 = *(id *)(a1 + 40);
  uint64_t v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_13800;
  block[3] = &unk_1E60A6978;
  id v9 = v3;
  id v4 = v2;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

unint64_t __54__CPLBackgroundDownloadsTask__transportTaskDidFinish___block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 80) removeObject:*(void *)(a1 + 40)];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 80) count];
  uint64_t v3 = *(void *)(a1 + 32);
  if (!v2
    && ((v5 = [(id)v3 isCancelled], uint64_t v3 = *(void *)(a1 + 32), (v5 & 1) != 0) || *(unsigned char *)(v3 + 88)))
  {
    return [(id)v3 _finishTaskLocked];
  }
  else
  {
    unint64_t result = [*(id *)(v3 + 80) count];
    if (result <= 2)
    {
      unint64_t result = [*(id *)(a1 + 32) isCancelled];
      if ((result & 1) == 0)
      {
        unint64_t result = *(void *)(a1 + 32);
        if (!*(unsigned char *)(result + 88))
        {
          return [(id)result _enqueueTasksLocked];
        }
      }
    }
  }
  return result;
}

- (void)_downloadTask:(id)a3 didFinishWithErrorLocked:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = v7;
  BOOL shouldStop = self->_shouldStop;
  if (v7)
  {
    if ([v7 isCPLOperationCancelledError])
    {
      if (!self->_stopError)
      {
        dispatch_block_t v10 = +[CPLErrors operationCancelledError];
        stopError = self->_stopError;
        self->_stopError = v10;
      }
      goto LABEL_18;
    }
    if ([v8 isCPLOperationDeferredError])
    {
      p_stopError = &self->_stopError;
      if (!self->_stopError)
      {
LABEL_17:
        objc_storeStrong((id *)p_stopError, a4);
        goto LABEL_18;
      }
      goto LABEL_18;
    }
    int v14 = [v8 isCPLErrorWithCode:1000];
    badError = self->_badError;
    if (v14)
    {
      if (!badError)
      {
        if (!_CPLSilentLogging)
        {
          id v16 = __CPLTaskOSLogDomain_13804();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            uint64_t v17 = [v6 resource];
            int v24 = 138412290;
            uint64_t v25 = (uint64_t)v17;
            _os_log_impl(&dword_1B4CAC000, v16, OS_LOG_TYPE_ERROR, "Downloading %@ in background failed because server is unavailable", (uint8_t *)&v24, 0xCu);
          }
        }
        p_stopError = &self->_badError;
        goto LABEL_17;
      }
LABEL_18:
      self->_BOOL shouldStop = 1;
      goto LABEL_19;
    }
    if (!badError)
    {
      if (!_CPLSilentLogging)
      {
        v21 = __CPLTaskOSLogDomain_13804();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v22 = [v6 resource];
          int v24 = 138412546;
          uint64_t v25 = (uint64_t)v22;
          __int16 v26 = 2112;
          unint64_t v27 = (unint64_t)v8;
          _os_log_impl(&dword_1B4CAC000, v21, OS_LOG_TYPE_ERROR, "Downloading %@ in background failed with error: %@", (uint8_t *)&v24, 0x16u);
        }
      }
      objc_storeStrong((id *)&self->_badError, a4);
    }
    if ([v8 isCPLThrottlingError] && !self->_prioritizeNonDerivatives)
    {
      if (!_CPLSilentLogging)
      {
        v23 = __CPLTaskOSLogDomain_13804();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v24) = 0;
          _os_log_impl(&dword_1B4CAC000, v23, OS_LOG_TYPE_DEFAULT, "Downloads have been throttled, prioritizing non-derivatives", (uint8_t *)&v24, 2u);
        }
      }
      self->_prioritizeNonDerivatives = 1;
    }
    uint64_t v12 = 128;
  }
  else
  {
    uint64_t v12 = 120;
  }
  ++*(Class *)((char *)&self->super.super.isa + v12);
LABEL_19:
  [(CPLBackgroundDownloadsTask *)self _updateActiveDownloadTaskCount];
  if (!shouldStop && self->_shouldStop)
  {
    if (!_CPLSilentLogging)
    {
      v18 = __CPLTaskOSLogDomain_13804();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = [(NSMutableArray *)self->_transportTasks count];
        unint64_t v20 = [(CPLBackgroundDownloadsTask *)self _activeTransferTaskCount];
        int v24 = 134218240;
        uint64_t v25 = v19;
        __int16 v26 = 2048;
        unint64_t v27 = v20;
        _os_log_impl(&dword_1B4CAC000, v18, OS_LOG_TYPE_DEFAULT, "Background downloads have been interrupted, waiting for %lu transport task groups to finish (%lu tasks total)", (uint8_t *)&v24, 0x16u);
      }
    }
    [(NSMutableArray *)self->_transportTasks makeObjectsPerformSelector:sel_cancel];
  }
}

- (unint64_t)_transportTaskCount
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  p_taskCountLock = &self->_taskCountLock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  id v7 = __49__CPLBackgroundDownloadsTask__transportTaskCount__block_invoke;
  objc_super v8 = &unk_1E60A5CE8;
  id v9 = self;
  dispatch_block_t v10 = &v11;
  uint64_t v3 = v6;
  os_unfair_lock_lock(p_taskCountLock);
  v7((uint64_t)v3);
  os_unfair_lock_unlock(p_taskCountLock);

  unint64_t v4 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v4;
}

uint64_t __49__CPLBackgroundDownloadsTask__transportTaskCount__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 152);
  return result;
}

- (unint64_t)_activeTransferTaskCount
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  p_taskCountLock = &self->_taskCountLock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  id v7 = __54__CPLBackgroundDownloadsTask__activeTransferTaskCount__block_invoke;
  objc_super v8 = &unk_1E60A5CE8;
  id v9 = self;
  dispatch_block_t v10 = &v11;
  uint64_t v3 = v6;
  os_unfair_lock_lock(p_taskCountLock);
  v7((uint64_t)v3);
  os_unfair_lock_unlock(p_taskCountLock);

  unint64_t v4 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v4;
}

uint64_t __54__CPLBackgroundDownloadsTask__activeTransferTaskCount__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 144);
  return result;
}

- (void)_updateActiveDownloadTaskCount
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v3 = self->_transportTasks;
  uint64_t v4 = 0;
  uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v18;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_super v8 = [*(id *)(*((void *)&v17 + 1) + 8 * v7) downloadTasks];
        uint64_t v9 = [v8 count];

        v4 += v9;
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }

  p_taskCountLock = &self->_taskCountLock;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  uint64_t v13 = __60__CPLBackgroundDownloadsTask__updateActiveDownloadTaskCount__block_invoke;
  uint64_t v14 = &unk_1E60A6598;
  v15 = self;
  uint64_t v16 = v4;
  uint64_t v11 = v12;
  os_unfair_lock_lock(p_taskCountLock);
  v13((uint64_t)v11);
  os_unfair_lock_unlock(p_taskCountLock);
}

uint64_t __60__CPLBackgroundDownloadsTask__updateActiveDownloadTaskCount__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 144) = *(void *)(a1 + 40);
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 80) count];
  *(void *)(*(void *)(a1 + 32) + 152) = result;
  return result;
}

- (void)_enqueueTasksLocked
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_lock);
  if ([(CPLEngineSyncTask *)self diskPressureState])
  {
    self->_BOOL shouldStop = 1;
    if (!_CPLSilentLogging)
    {
      uint64_t v3 = __CPLTaskOSLogDomain_13804();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v12 = self;
        _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEFAULT, "System had not enough disk space to continue %@", buf, 0xCu);
      }
    }
    if (![(NSMutableArray *)self->_transportTasks count]) {
      [(CPLBackgroundDownloadsTask *)self _finishTaskLocked];
    }
  }
  else
  {
    dispatch_suspend((dispatch_object_t)self->_lock);
    uint64_t v4 = [(CPLEngineSyncTask *)self engineLibrary];
    uint64_t v5 = [v4 store];

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __49__CPLBackgroundDownloadsTask__enqueueTasksLocked__block_invoke;
    v9[3] = &unk_1E60AB550;
    v9[4] = self;
    id v10 = v5;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __49__CPLBackgroundDownloadsTask__enqueueTasksLocked__block_invoke_31;
    v8[3] = &unk_1E60AB578;
    v8[4] = self;
    id v6 = v5;
    id v7 = (id)[v6 performWriteTransactionWithBlock:v9 completionHandler:v8];
  }
}

void __49__CPLBackgroundDownloadsTask__enqueueTasksLocked__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  objc_super v8 = __49__CPLBackgroundDownloadsTask__enqueueTasksLocked__block_invoke_2;
  uint64_t v9 = &unk_1E60AB750;
  uint64_t v4 = *(void **)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = v4;
  id v5 = a2;
  [v5 do:&v6];
  objc_msgSend(*(id *)(a1 + 32), "_launchNecessaryDownloadTasksWithTransaction:", v5, v6, v7, v8, v9, v10);
}

void __49__CPLBackgroundDownloadsTask__enqueueTasksLocked__block_invoke_31(uint64_t a1)
{
  if (![*(id *)(*(void *)(a1 + 32) + 80) count])
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v2 = __CPLTaskOSLogDomain_13804();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)uint64_t v3 = 0;
        _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "No more available background downloads", v3, 2u);
      }
    }
    [*(id *)(a1 + 32) _finishTaskLocked];
  }
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 72));
}

uint64_t __49__CPLBackgroundDownloadsTask__enqueueTasksLocked__block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 113)) {
    return 1;
  }
  if (!_CPLSilentLogging)
  {
    id v5 = __CPLTaskOSLogDomain_13804();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)objc_super v8 = 0;
      _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEBUG, "Resetting all dequeued tasks", v8, 2u);
    }
  }
  uint64_t v6 = [*(id *)(a1 + 40) downloadQueue];
  uint64_t v2 = [v6 resetDequeuedBackgroundDownloadTasksWithError:a2];

  *(unsigned char *)(*(void *)(a1 + 32) + 113) = 1;
  return v2;
}

- (void)_completeBackgroundDownloadForResource:(id)a3 error:(id)a4 withTransaction:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(CPLEngineSyncTask *)self engineLibrary];
  uint64_t v12 = [v11 store];
  uint64_t v13 = [v12 downloadQueue];
  if (v9)
  {
    if (+[CPLEngineResourceDownloadQueue shouldRetryDownloadOnError:v9])
    {
      BOOL v14 = [(CPLBackgroundDownloadsTask *)self _isErrorCountingForARetry:v9];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __91__CPLBackgroundDownloadsTask__completeBackgroundDownloadForResource_error_withTransaction___block_invoke;
      v30[3] = &unk_1E60A9030;
      id v31 = v13;
      id v32 = v8;
      BOOL v35 = v14;
      id v33 = v9;
      id v34 = v11;
      [v10 do:v30];

      id v15 = v31;
    }
    else
    {
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __91__CPLBackgroundDownloadsTask__completeBackgroundDownloadForResource_error_withTransaction___block_invoke_30;
      v26[3] = &unk_1E60AAF20;
      id v27 = v13;
      id v28 = v8;
      id v29 = v11;
      [v10 do:v26];

      id v15 = v27;
    }
  }
  else
  {
    uint64_t v16 = [v12 resourceStorage];
    long long v17 = [v8 identity];
    long long v18 = [v17 fileURL];

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __91__CPLBackgroundDownloadsTask__completeBackgroundDownloadForResource_error_withTransaction___block_invoke_2;
    v20[3] = &unk_1E60AAFC8;
    id v21 = v13;
    id v22 = v8;
    id v23 = v16;
    id v24 = v18;
    id v25 = v11;
    id v19 = v18;
    id v15 = v16;
    [v10 do:v20];
  }
}

uint64_t __91__CPLBackgroundDownloadsTask__completeBackgroundDownloadForResource_error_withTransaction___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  char v10 = 0;
  uint64_t v3 = [*(id *)(a1 + 32) reenqueueBackgroundDownloadTaskForResource:*(void *)(a1 + 40) bumpRetryCount:*(unsigned __int8 *)(a1 + 64) didDiscard:&v10 error:a2];
  if (v3)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v4 = __CPLTaskOSLogDomain_13804();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        if (v10)
        {
          id v5 = @"Discarded";
        }
        else if (*(unsigned char *)(a1 + 64))
        {
          id v5 = @"Bumped retry count";
        }
        else
        {
          id v5 = @"Reenqueued";
        }
        uint64_t v6 = *(void *)(a1 + 40);
        uint64_t v7 = *(void *)(a1 + 48);
        *(_DWORD *)long long buf = 138412802;
        uint64_t v12 = v5;
        __int16 v13 = 2112;
        uint64_t v14 = v6;
        __int16 v15 = 2112;
        uint64_t v16 = v7;
        _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEBUG, "%@ %@ for background download (error: %@)", buf, 0x20u);
      }
    }
    if (v10)
    {
      id v8 = [*(id *)(a1 + 40) identity];
      [v8 setFileURL:0];

      [*(id *)(a1 + 56) notifyAttachedObjectsResourceDidFailBackgroundDownloadOfResource:*(void *)(a1 + 40)];
    }
  }
  return v3;
}

uint64_t __91__CPLBackgroundDownloadsTask__completeBackgroundDownloadForResource_error_withTransaction___block_invoke_30(id *a1, uint64_t a2)
{
  uint64_t v3 = [a1[4] removeBackgroundDownloadTaskForResource:a1[5] error:a2];
  if (v3)
  {
    uint64_t v4 = [a1[5] identity];
    [v4 setFileURL:0];

    [a1[6] notifyAttachedObjectsResourceDidFailBackgroundDownloadOfResource:a1[5]];
  }
  return v3;
}

uint64_t __91__CPLBackgroundDownloadsTask__completeBackgroundDownloadForResource_error_withTransaction___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) markBackgroundDownloadTaskForResourceAsSuceeded:*(void *)(a1 + 40) error:a2];
  if (result)
  {
    uint64_t result = [*(id *)(a1 + 48) storeDownloadedResource:*(void *)(a1 + 40) atURL:*(void *)(a1 + 56) error:a2];
    if (result)
    {
      id v5 = [*(id *)(a1 + 40) identity];
      [v5 setFileURL:0];

      [*(id *)(a1 + 64) notifyAttachedObjectsResourceDidDownloadInBackground:*(void *)(a1 + 40)];
      return 1;
    }
  }
  return result;
}

- (BOOL)_isErrorCountingForARetry:(id)a3
{
  id v3 = a3;
  if (([v3 isCPLOperationCancelledError] & 1) != 0
    || ([v3 isCPLErrorWithCode:81] & 1) != 0
    || ([v3 isCPLOperationDeferredError] & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    int v4 = [v3 isCPLThrottlingError] ^ 1;
  }

  return v4;
}

- (void)_launchNecessaryDownloadTasksWithTransaction:(id)a3
{
  id v4 = a3;
  if (![(CPLEngineSyncTask *)self isCancelled] && !self->_shouldStop)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __75__CPLBackgroundDownloadsTask__launchNecessaryDownloadTasksWithTransaction___block_invoke;
    v5[3] = &unk_1E60AB410;
    v5[4] = self;
    [v4 do:v5];
    [(CPLBackgroundDownloadsTask *)self _updateActiveDownloadTaskCount];
  }
}

uint64_t __75__CPLBackgroundDownloadsTask__launchNecessaryDownloadTasksWithTransaction___block_invoke(uint64_t a1, void **a2)
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(a1 + 32);
  v50 = [*(id *)(a1 + 32) engineLibrary];
  v55 = [v50 store];
  v60 = [v55 downloadQueue];
  v48 = [v50 transport];
  v61 = [v55 resourceStorage];
  v54 = [v50 scheduler];
  v53 = [MEMORY[0x1E4F28CB8] defaultManager];
  v90 = 0;
  [*v2 _getResourceTypesToDownload:&v90];
  v88[0] = 0;
  v88[1] = v88;
  v88[2] = 0x2020000000;
  char v89 = 0;
  v62 = [v55 transactionTransportScopeMapping];
  v46 = 0;
  v47 = 0;
  while ((unint64_t)[*(id *)(*(void *)(a1 + 32) + 80) count] <= 2)
  {
    unint64_t v49 = +[CPLEngineResourceDownloadTask maximumResourceDownloadSizeForResourceType:*v90];
    v52 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E60]), "initWithIndexesInRange:", 0, objc_msgSend(*(id *)(*(void *)(a1 + 32) + 168), "count"));
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 176);
    while ([v52 count]
         && (unint64_t)[*(id *)(*(void *)(a1 + 32) + 80) count] <= 2)
    {
      id v4 = [*(id *)(*(void *)(a1 + 32) + 168) objectAtIndexedSubscript:v3];
      uint64_t v57 = [v4 unsignedIntegerValue];

      id v5 = [v60 dequeueNextBackgroundDownloadTasksForResourceType:*v90 andIntent:v57 maximumSize:v49 maximumCount:200 error:a2];
      uint64_t v6 = v5;
      if (!v5)
      {
        if (!_CPLSilentLogging)
        {
          v39 = __CPLTaskOSLogDomain_13804();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            v40 = +[CPLResource shortDescriptionForResourceType:*v90];
            v41 = *a2;
            *(_DWORD *)long long buf = 138412546;
            uint64_t v93 = (uint64_t)v40;
            __int16 v94 = 2112;
            v95 = v41;
            _os_log_impl(&dword_1B4CAC000, v39, OS_LOG_TYPE_ERROR, "Failed to dequeue resources to download in background for %@: %@", buf, 0x16u);
          }
        }
        id obj = 0;
        goto LABEL_61;
      }
      if (![v5 count])
      {
        uint64_t v34 = [v52 indexGreaterThanIndex:v3];
        [v52 removeIndex:v3];
        uint64_t v3 = v34;
        goto LABEL_41;
      }
      if (!_CPLSilentLogging)
      {
        uint64_t v7 = __CPLTaskOSLogDomain_13804();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v8 = [v6 count];
          id v9 = +[CPLResource shortDescriptionForResourceType:*v90];
          *(_DWORD *)long long buf = 134218242;
          uint64_t v93 = v8;
          __int16 v94 = 2112;
          v95 = v9;
          _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEBUG, "Dequeued %lu resources (%@) to download in background", buf, 0x16u);
        }
      }
      v87[0] = MEMORY[0x1E4F143A8];
      v87[1] = 3221225472;
      v87[2] = __75__CPLBackgroundDownloadsTask__launchNecessaryDownloadTasksWithTransaction___block_invoke_8;
      v87[3] = &unk_1E60A8F48;
      v87[4] = *(void *)(a1 + 32);
      v51 = [v48 resourcesDownloadTaskWithCompletionHandler:v87];
      id v56 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v85 = 0u;
      long long v86 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      id obj = v6;
      uint64_t v10 = 0;
      uint64_t v11 = [obj countByEnumeratingWithState:&v83 objects:v91 count:16];
      if (!v11) {
        goto LABEL_34;
      }
      uint64_t v63 = *(void *)v84;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v84 != v63) {
            objc_enumerationMutation(obj);
          }
          __int16 v13 = *(void **)(*((void *)&v83 + 1) + 8 * v12);
          char v82 = 0;
          id v14 = v13;
          __int16 v15 = [v61 createTempDestinationURLForResource:v14 error:a2];
          if (v15)
          {
            uint64_t v16 = [v14 identity];
            [v16 setFileURL:v15];

            id v80 = 0;
            id v81 = v14;
            id v78 = 0;
            id v79 = 0;
            v69 = [v60 cloudResourceForLocalResource:&v81 cloudRecord:&v80 target:&v79 shouldNotTrustCaches:&v82 allowUnsafeClientCache:0 transportScopeMapping:v62 error:&v78];
            id v67 = v81;

            uint64_t v17 = v80;
            id v66 = v79;
            id v68 = v78;
            v65 = v17;
            if (v69)
            {
              long long v18 = [CPLEngineResourceDownloadTask alloc];
              id v19 = [MEMORY[0x1E4F29128] UUID];
              long long v20 = [v19 UUIDString];
              v75[0] = MEMORY[0x1E4F143A8];
              v75[1] = 3221225472;
              v75[2] = __75__CPLBackgroundDownloadsTask__launchNecessaryDownloadTasksWithTransaction___block_invoke_3;
              v75[3] = &unk_1E60A8F90;
              v77 = v88;
              id v76 = v54;
              v70[0] = MEMORY[0x1E4F143A8];
              v70[1] = 3221225472;
              v70[2] = __75__CPLBackgroundDownloadsTask__launchNecessaryDownloadTasksWithTransaction___block_invoke_4;
              v70[3] = &unk_1E60A9008;
              v70[4] = *(void *)(a1 + 32);
              id v71 = v55;
              id v21 = v67;
              id v72 = v21;
              id v73 = v53;
              id v74 = v15;
              id v22 = [(CPLEngineResourceDownloadTask *)v18 initWithResource:v21 taskIdentifier:v20 target:v66 launchHandler:&__block_literal_global_13839 cancelHandler:&__block_literal_global_14_13840 didStartHandler:v75 progressHandler:0 completionHandler:v70];

              [(CPLEngineResourceDownloadTask *)v22 associateCloudResource:v69 ofRecord:v65];
              [(CPLEngineResourceDownloadTask *)v22 setTransportScopeMapping:v62];
              id v23 = [[CPLResourceTransferTaskOptions alloc] initWithIntent:v57 priority:2];
              [(CPLResourceTransferTask *)v22 setOptions:v23];
              id v24 = [v21 identity];
              uint64_t v25 = [v24 fileSize];

              [v56 addObject:v22];
              int v26 = 0;
              v10 += v25;
            }
            else
            {
              id v29 = [v67 identity];
              [v29 setFileURL:0];

              if ([v60 removeBackgroundDownloadTaskForResource:v14 error:a2])
              {
                [v50 notifyAttachedObjectsResourceDidFailBackgroundDownloadOfResource:v14];
                int v26 = 0;
              }
              else
              {
                int v26 = 1;
              }
            }

            id v14 = v67;
            id v27 = v65;
LABEL_28:

            goto LABEL_29;
          }
          if (!_CPLSilentLogging)
          {
            id v27 = __CPLTaskOSLogDomain_13804();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              id v28 = *a2;
              *(_DWORD *)long long buf = 138412546;
              uint64_t v93 = (uint64_t)v14;
              __int16 v94 = 2112;
              v95 = v28;
              _os_log_impl(&dword_1B4CAC000, v27, OS_LOG_TYPE_ERROR, "Unable to create a temporary URL for background download for %@: %@", buf, 0x16u);
            }
            id v68 = 0;
            int v26 = 1;
            goto LABEL_28;
          }
          id v68 = 0;
          int v26 = 1;
LABEL_29:

          if (v26)
          {

            char v33 = 0;
            goto LABEL_38;
          }
          ++v12;
        }
        while (v11 != v12);
        uint64_t v30 = [obj countByEnumeratingWithState:&v83 objects:v91 count:16];
        uint64_t v11 = v30;
      }
      while (v30);
LABEL_34:

      if ([v56 count])
      {
        uint64_t v31 = [v56 count];
        [v51 setDownloadTasks:v56];
        id v32 = [v60 createGroupForBackgroundDownloadsOfResourceType:*v90 transferIntent:v57 transport:v48];
        objc_msgSend(v32, "setRoughCPLRecordCount:", objc_msgSend(v56, "count"));
        [v32 setRoughCPLDownloadEstimatedSize:v10];
        [*(id *)(*(void *)(a1 + 32) + 80) addObject:v51];
        [*(id *)(a1 + 32) launchTransportTask:v51 withTransportGroup:v32];

        v46 += v31;
        ++v47;
      }
      uint64_t v3 = [v52 indexGreaterThanIndex:v3];
      char v33 = 1;
LABEL_38:

      if ((v33 & 1) == 0)
      {
LABEL_61:

        uint64_t v42 = 0;
        goto LABEL_62;
      }
LABEL_41:
      if (v3 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v3 = [v52 firstIndex];
      }
    }
    if ([v52 count])
    {
      *(void *)(*(void *)(a1 + 32) + 176) = v3;
      goto LABEL_54;
    }
    if (*v90 == -1)
    {
      if (!_CPLSilentLogging)
      {
        v44 = __CPLTaskOSLogDomain_13804();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1B4CAC000, v44, OS_LOG_TYPE_DEBUG, "No more resources to download in background", buf, 2u);
        }
      }
      *(void *)(*(void *)(a1 + 32) + 176) = 0;

      break;
    }
    if (_CPLSilentLogging)
    {
      ++v90;
    }
    else
    {
      BOOL v35 = __CPLTaskOSLogDomain_13804();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        v36 = +[CPLResource shortDescriptionForResourceType:*v90];
        *(_DWORD *)long long buf = 138412290;
        uint64_t v93 = (uint64_t)v36;
        _os_log_impl(&dword_1B4CAC000, v35, OS_LOG_TYPE_DEBUG, "No resources of type '%@' to download in background", buf, 0xCu);
      }
      ++v90;
      if (!_CPLSilentLogging)
      {
        v37 = __CPLTaskOSLogDomain_13804();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          v38 = +[CPLResource shortDescriptionForResourceType:*v90];
          *(_DWORD *)long long buf = 138412290;
          uint64_t v93 = (uint64_t)v38;
          _os_log_impl(&dword_1B4CAC000, v37, OS_LOG_TYPE_DEBUG, "Will look for resources of type '%@'", buf, 0xCu);
        }
      }
    }
LABEL_54:
  }
  uint64_t v42 = 1;
  if (v47 && !_CPLSilentLogging)
  {
    v45 = __CPLTaskOSLogDomain_13804();
    v52 = v45;
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218240;
      uint64_t v93 = (uint64_t)v47;
      __int16 v94 = 2048;
      v95 = v46;
      _os_log_impl(&dword_1B4CAC000, v45, OS_LOG_TYPE_DEFAULT, "Launched %lu background download tasks (%lu resources)", buf, 0x16u);
    }
    uint64_t v42 = 1;
LABEL_62:
  }
  _Block_object_dispose(v88, 8);

  return v42;
}

uint64_t __75__CPLBackgroundDownloadsTask__launchNecessaryDownloadTasksWithTransaction___block_invoke_8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _transportTaskDidFinish:a2];
}

uint64_t __75__CPLBackgroundDownloadsTask__launchNecessaryDownloadTasksWithTransaction___block_invoke_3(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 40) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    return [*(id *)(result + 32) willRunEngineElement:CPLEngineElementDownloadResourcesInBackground];
  }
  return result;
}

void __75__CPLBackgroundDownloadsTask__launchNecessaryDownloadTasksWithTransaction___block_invoke_4(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v6)
  {
    if ([a1[4] isCancelled])
    {
      uint64_t v7 = +[CPLErrors operationCancelledError];
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  uint64_t v8 = (void *)*((void *)a1[4] + 9);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __75__CPLBackgroundDownloadsTask__launchNecessaryDownloadTasksWithTransaction___block_invoke_5;
  v16[3] = &unk_1E60A8FE0;
  id v9 = a1[5];
  id v10 = a1[4];
  id v17 = v9;
  id v18 = v10;
  id v19 = a1[6];
  id v20 = v7;
  id v21 = v5;
  id v22 = a1[7];
  id v23 = a1[8];
  uint64_t v11 = v16;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_13800;
  block[3] = &unk_1E60A6978;
  id v25 = v11;
  uint64_t v12 = v8;
  id v13 = v5;
  id v14 = v7;
  dispatch_block_t v15 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v12, v15);
}

void __75__CPLBackgroundDownloadsTask__launchNecessaryDownloadTasksWithTransaction___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 transportTask];
  [v3 cancelDownloadTask:v2];
}

void __75__CPLBackgroundDownloadsTask__launchNecessaryDownloadTasksWithTransaction___block_invoke_5(uint64_t a1)
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __75__CPLBackgroundDownloadsTask__launchNecessaryDownloadTasksWithTransaction___block_invoke_6;
  v9[3] = &unk_1E60AB068;
  id v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 48);
  v9[4] = *(void *)(a1 + 40);
  id v10 = v3;
  id v11 = *(id *)(a1 + 56);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __75__CPLBackgroundDownloadsTask__launchNecessaryDownloadTasksWithTransaction___block_invoke_7;
  v4[3] = &unk_1E60A8FB8;
  v4[4] = *(void *)(a1 + 40);
  id v5 = *(id *)(a1 + 64);
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 72);
  id v8 = *(id *)(a1 + 80);
  [v2 performBatchedWriteTransactionWithBlock:v9 completionHandler:v4];
}

uint64_t __75__CPLBackgroundDownloadsTask__launchNecessaryDownloadTasksWithTransaction___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _completeBackgroundDownloadForResource:*(void *)(a1 + 40) error:*(void *)(a1 + 48) withTransaction:a2];
}

void __75__CPLBackgroundDownloadsTask__launchNecessaryDownloadTasksWithTransaction___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 72);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__CPLBackgroundDownloadsTask__launchNecessaryDownloadTasksWithTransaction___block_invoke_8;
  v10[3] = &unk_1E60A6750;
  v10[4] = v4;
  id v11 = *(id *)(a1 + 40);
  id v12 = v3;
  id v13 = *(id *)(a1 + 48);
  id v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_13800;
  block[3] = &unk_1E60A6978;
  id v15 = v6;
  id v7 = v5;
  id v8 = v3;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);

  [*(id *)(a1 + 56) removeItemAtURL:*(void *)(a1 + 64) error:0];
}

void __75__CPLBackgroundDownloadsTask__launchNecessaryDownloadTasksWithTransaction___block_invoke_8(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [*(id *)(a1 + 48) error];
  id v5 = (id)v4;
  if (!v4) {
    uint64_t v4 = *(void *)(a1 + 56);
  }
  [v2 _downloadTask:v3 didFinishWithErrorLocked:v4];
}

- (void)_getResourceTypesToDownload:(const unint64_t *)a3
{
  if (self->_prioritizeNonDerivatives) {
    +[CPLResource getAllResourceTypesToDownloadPrioritizeNonDerivatives:a3];
  }
  else {
    +[CPLResource getAllResourceTypesToDownload:a3];
  }
}

- (void)_finishTaskLocked
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_successfullyDownloadedResourcesCount)
  {
    if (_CPLSilentLogging) {
      goto LABEL_12;
    }
  }
  else
  {
    if (self->_failedDownloadedResourcesCount) {
      BOOL v3 = _CPLSilentLogging == 0;
    }
    else {
      BOOL v3 = 0;
    }
    if (!v3) {
      goto LABEL_12;
    }
  }
  uint64_t v4 = __CPLTaskOSLogDomain_13804();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t successfullyDownloadedResourcesCount = self->_successfullyDownloadedResourcesCount;
    unint64_t failedDownloadedResourcesCount = self->_failedDownloadedResourcesCount;
    int v9 = 134218240;
    unint64_t v10 = successfullyDownloadedResourcesCount;
    __int16 v11 = 2048;
    unint64_t v12 = failedDownloadedResourcesCount;
    _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEFAULT, "Successfully downloaded %lu resources in background (%lu failed)", (uint8_t *)&v9, 0x16u);
  }

LABEL_12:
  [(NSMutableArray *)self->_transportTasks removeAllObjects];
  badError = self->_badError;
  if (badError || self->_stopError)
  {
    if (!_CPLSilentLogging)
    {
      id v8 = __CPLTaskOSLogDomain_13804();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_DEBUG, "Some background downloads failed, we will need another pass on background downloads", (uint8_t *)&v9, 2u);
      }

      badError = self->_badError;
    }
    if (!badError) {
      badError = self->_stopError;
    }
  }
  else
  {
    badError = 0;
  }
  [(CPLBackgroundDownloadsTask *)self taskDidFinishWithError:badError];
}

- (CPLBackgroundDownloadsTask)initWithEngineLibrary:(id)a3 session:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)CPLBackgroundDownloadsTask;
  uint64_t v4 = [(CPLEngineSyncTask *)&v14 initWithEngineLibrary:a3 session:a4];
  if (v4)
  {
    id v5 = CPLCopyDefaultSerialQueueAttributes();
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.cpl.backgrounddownloads.lock", v5);
    lock = v4->_lock;
    v4->_lock = (OS_dispatch_queue *)v6;

    id v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    transportTasks = v4->_transportTasks;
    v4->_transportTasks = v8;

    unint64_t v10 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v4->_prioritizeNonDerivatives = [v10 BOOLForKey:@"CPLPrioritizeNonDerivativesDownloads"];

    uint64_t v11 = +[CPLResourceTransferTaskOptions intentsToBackgroundDownload];
    intentsToDownload = v4->_intentsToDownload;
    v4->_intentsToDownload = (NSArray *)v11;

    v4->_taskCountLock._os_unfair_lock_opaque = 0;
  }
  return v4;
}

@end