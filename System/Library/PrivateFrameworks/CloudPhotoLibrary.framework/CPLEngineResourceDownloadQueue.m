@interface CPLEngineResourceDownloadQueue
+ (BOOL)shouldRetryDownloadOnError:(id)a3;
- (BOOL)_canScheduleBackgroundDownloads;
- (BOOL)_launchTransportTaskForQueue:(id)a3;
- (BOOL)_shouldTryLowPriorityDownloadWithError:(id *)a3;
- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6;
- (BOOL)enqueueBackgroundDownloadTaskForResource:(id)a3 intent:(unint64_t)a4 downloading:(BOOL)a5 error:(id *)a6;
- (BOOL)hasActiveOrQueuedBackgroundDownloadOperations;
- (BOOL)markBackgroundDownloadTaskForResourceAsSuceeded:(id)a3 error:(id *)a4;
- (BOOL)reenqueueBackgroundDownloadTaskForResource:(id)a3 bumpRetryCount:(BOOL)a4 didDiscard:(BOOL *)a5 error:(id *)a6;
- (BOOL)removeAllBackgroundDownloadTasksForItemWithScopedIdentifier:(id)a3 error:(id *)a4;
- (BOOL)removeBackgroundDownloadTaskForResource:(id)a3 error:(id *)a4;
- (BOOL)resetDequeuedBackgroundDownloadTasksWithError:(id *)a3;
- (CPLEngineResourceDownloadQueue)initWithEngineStore:(id)a3 name:(id)a4;
- (id)_activeQueueForTransferTask:(id)a3;
- (id)_bestQueueWithCancellableTransportTasks;
- (id)_downloadTaskForLocalResource:(id)a3 clientBundleID:(id)a4 options:(id)a5 proposedTaskIdentifier:(id)a6 didStartHandler:(id)a7 progressHandler:(id)a8 completionHandler:(id)a9;
- (id)_failedTaskWithCompletionHandler:(id)a3 error:(id)a4 resource:(id)a5 taskIdentifier:(id)a6 options:(id)a7;
- (id)_queuesStatus;
- (id)_realDownloadTaskForLocalResource:(id)a3 taskIdentifier:(id)a4 cloudResource:(id)a5 ofRecord:(id)a6 target:(id)a7 didStartHandler:(id)a8 progressHandler:(id)a9 completionHandler:(id)a10;
- (id)_resourceStorageCopyTaskForResource:(id)a3 taskIdentifier:(id)a4 cloudResource:(id)a5 ofRecord:(id)a6 target:(id)a7 didStartHandler:(id)a8 progressHandler:(id)a9 completionHandler:(id)a10;
- (id)cloudResourceForLocalResource:(id *)a3 cloudRecord:(id *)a4 target:(id *)a5 shouldNotTrustCaches:(BOOL *)a6 allowUnsafeClientCache:(BOOL)a7 transportScopeMapping:(id)a8 error:(id *)a9;
- (id)createGroupForBackgroundDownloadsOfResourceType:(unint64_t)a3 transferIntent:(unint64_t)a4 transport:(id)a5;
- (id)dequeueNextBackgroundDownloadTasksForResourceType:(unint64_t)a3 andIntent:(unint64_t)a4 maximumSize:(unint64_t)a5 maximumCount:(unint64_t)a6 error:(id *)a7;
- (id)downloadTaskForLocalResource:(id)a3 clientBundleID:(id)a4 options:(id)a5 proposedTaskIdentifier:(id)a6 didStartHandler:(id)a7 progressHandler:(id)a8 completionHandler:(id)a9;
- (id)enumeratorForDownloadedResources;
- (id)status;
- (unint64_t)_transportTaskCount;
- (unint64_t)countOfQueuedDownloadTasks;
- (unint64_t)scopeType;
- (void)_dequeueTransferTaskInActiveQueue:(id)a3;
- (void)_dispatchTransportTasksIfNecessary;
- (void)_enqueueTransferTaskInActiveQueue:(id)a3;
- (void)_requestBackgroundDownloads;
- (void)_scheduleBackgroundDownloadsIfNecessary;
- (void)_unscheduleBackgroundDownloads;
- (void)barrier;
@end

@implementation CPLEngineResourceDownloadQueue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastTransferTaskBurstDate, 0);
  objc_storeStrong(&self->_lowPriorityQueuePerResourceTypeAndTransferIntent, 0);
  objc_storeStrong(&self->_highPriorityQueuePerResourceTypeAndTransferIntent, 0);
  objc_storeStrong((id *)&self->_bestCancellableLowPriorityQueues, 0);
  objc_storeStrong((id *)&self->_bestCancellableHighPriorityQueues, 0);
  objc_storeStrong((id *)&self->_allLowPriorityQueues, 0);
  objc_storeStrong((id *)&self->_allHighPriorityQueues, 0);
  objc_storeStrong((id *)&self->_allQueues, 0);
  objc_storeStrong((id *)&self->_downloadLock, 0);
}

- (void)barrier
{
}

- (id)status
{
  v12.receiver = self;
  v12.super_class = (Class)CPLEngineResourceDownloadQueue;
  v3 = [(CPLEngineStorage *)&v12 status];
  v4 = (void *)[v3 mutableCopy];

  downloadLock = self->_downloadLock;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __40__CPLEngineResourceDownloadQueue_status__block_invoke;
  v10[3] = &unk_1E60A6728;
  v10[4] = self;
  id v6 = v4;
  id v11 = v6;
  dispatch_sync(downloadLock, v10);
  v7 = v11;
  id v8 = v6;

  return v8;
}

void __40__CPLEngineResourceDownloadQueue_status__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _queuesStatus];
  id v9 = (id)v2;
  if (v2) {
    [*(id *)(a1 + 40) appendFormat:@"\n%@", v2];
  }
  v3 = *(void **)(a1 + 32);
  if (v3[13])
  {
    objc_msgSend(*(id *)(a1 + 40), "appendFormat:", @"\nInflight transfer tasks: %lu", v3[13]);
    v3 = *(void **)(a1 + 32);
  }
  if (v3[14])
  {
    objc_msgSend(*(id *)(a1 + 40), "appendFormat:", @"\nLast requests: %lu resources just now", v3[14]);
  }
  else
  {
    uint64_t v4 = v3[15];
    if (v4)
    {
      v5 = *(void **)(a1 + 40);
      uint64_t v6 = v3[16];
      v7 = [MEMORY[0x1E4F1C9C8] date];
      id v8 = +[CPLDateFormatter stringFromDateAgo:v6 now:v7];
      [v5 appendFormat:@"\nLast requests: %lu resources, %@", v4, v8];
    }
  }
  if (*(unsigned char *)(*(void *)(a1 + 32) + 136)) {
    [*(id *)(a1 + 40) appendString:@"\nSome resources need to be downloaded in background"];
  }
}

- (id)_queuesStatus
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v2 = self->_allQueues;
  v3 = (void *)[(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (!v3) {
    goto LABEL_14;
  }
  uint64_t v4 = 0;
  uint64_t v5 = *(void *)v10;
  do
  {
    for (i = 0; i != v3; i = (char *)i + 1)
    {
      if (*(void *)v10 != v5) {
        objc_enumerationMutation(v2);
      }
      v7 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "status", (void)v9);
      if (v7)
      {
        if (!v4) {
          uint64_t v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        }
        [(NSArray *)v4 addObject:v7];
      }
    }
    v3 = (void *)[(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  }
  while (v3);

  if (v4)
  {
    v3 = [(NSArray *)v4 componentsJoinedByString:@"\n"];
    uint64_t v2 = v4;
LABEL_14:

    goto LABEL_16;
  }
  v3 = 0;
LABEL_16:
  return v3;
}

- (BOOL)hasActiveOrQueuedBackgroundDownloadOperations
{
  uint64_t v2 = [(CPLEngineStorage *)self platformObject];
  char v3 = [v2 hasActiveOrQueuedBackgroundDownloadOperations];

  return v3;
}

- (unint64_t)countOfQueuedDownloadTasks
{
  uint64_t v2 = [(CPLEngineStorage *)self platformObject];
  unint64_t v3 = [v2 countOfQueuedDownloadTasks];

  return v3;
}

- (id)enumeratorForDownloadedResources
{
  uint64_t v2 = [(CPLEngineStorage *)self platformObject];
  unint64_t v3 = [v2 enumeratorForDownloadedResources];

  return v3;
}

- (BOOL)removeAllBackgroundDownloadTasksForItemWithScopedIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(CPLEngineStorage *)self platformObject];
  id v12 = 0;
  char v8 = [v7 removeAllBackgroundDownloadTasksForItemWithScopedIdentifier:v6 error:&v12];
  id v9 = v12;

  if ((v8 & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      long long v10 = __CPLStorageOSLogDomain_7302();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v14 = v6;
        __int16 v15 = 2112;
        id v16 = v9;
        _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_ERROR, "Unable to remove all background tasks for %@: %@", buf, 0x16u);
      }
    }
    if (a4) {
      *a4 = v9;
    }
  }

  return v8;
}

- (BOOL)resetDequeuedBackgroundDownloadTasksWithError:(id *)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(CPLEngineStorage *)self platformObject];
  id v9 = 0;
  char v5 = [v4 resetDequeuedBackgroundDownloadTasksWithError:&v9];
  id v6 = v9;

  if ((v5 & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      v7 = __CPLStorageOSLogDomain_7302();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v11 = v6;
        _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "Unable to reset dequeued background tasks: %@", buf, 0xCu);
      }
    }
    if (a3) {
      *a3 = v6;
    }
  }

  return v5;
}

- (id)dequeueNextBackgroundDownloadTasksForResourceType:(unint64_t)a3 andIntent:(unint64_t)a4 maximumSize:(unint64_t)a5 maximumCount:(unint64_t)a6 error:(id *)a7
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = [(CPLEngineStorage *)self platformObject];
  id v17 = 0;
  v13 = [v12 dequeueNextBackgroundDownloadTasksForResourceType:a3 andIntent:a4 maximumSize:a5 maximumCount:a6 error:&v17];
  id v14 = v17;

  if (!v13)
  {
    if (!_CPLSilentLogging)
    {
      __int16 v15 = __CPLStorageOSLogDomain_7302();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v14;
        _os_log_impl(&dword_1B4CAC000, v15, OS_LOG_TYPE_ERROR, "Unable to dequeue next background tasks: %@", buf, 0xCu);
      }
    }
    if (a7) {
      *a7 = v14;
    }
  }

  return v13;
}

- (BOOL)markBackgroundDownloadTaskForResourceAsSuceeded:(id)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(CPLEngineStorage *)self platformObject];
  id v12 = 0;
  char v8 = objc_msgSend(v7, "markBackgroundDownloadTaskForResourceAsSuceeded:taskIdentifier:error:", v6, objc_msgSend(v6, "_backgroundDownloadTaskIdentifier"), &v12);
  id v9 = v12;

  if ((v8 & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      long long v10 = __CPLStorageOSLogDomain_7302();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v14 = v6;
        __int16 v15 = 2112;
        id v16 = v9;
        _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_ERROR, "Unable to mark background task for %@ as succeeded: %@", buf, 0x16u);
      }
    }
    if (a4) {
      *a4 = v9;
    }
  }

  return v8;
}

- (BOOL)removeBackgroundDownloadTaskForResource:(id)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(CPLEngineStorage *)self platformObject];
  id v12 = 0;
  char v8 = objc_msgSend(v7, "removeBackgroundDownloadTaskForResource:taskIdentifier:error:", v6, objc_msgSend(v6, "_backgroundDownloadTaskIdentifier"), &v12);
  id v9 = v12;

  if ((v8 & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      long long v10 = __CPLStorageOSLogDomain_7302();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v14 = v6;
        __int16 v15 = 2112;
        id v16 = v9;
        _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_ERROR, "Unable to remove background task for %@: %@", buf, 0x16u);
      }
    }
    if (a4) {
      *a4 = v9;
    }
  }

  return v8;
}

- (BOOL)reenqueueBackgroundDownloadTaskForResource:(id)a3 bumpRetryCount:(BOOL)a4 didDiscard:(BOOL *)a5 error:(id *)a6
{
  BOOL v8 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = [(CPLEngineStorage *)self platformObject];
  id v16 = 0;
  char v12 = objc_msgSend(v11, "reenqueueBackgroundDownloadTaskForResource:taskIdentifier:bumpRetryCount:didDiscard:error:", v10, objc_msgSend(v10, "_backgroundDownloadTaskIdentifier"), v8, a5, &v16);
  id v13 = v16;

  if (v12)
  {
    if (!*a5) {
      [(CPLEngineResourceDownloadQueue *)self _requestBackgroundDownloads];
    }
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v14 = __CPLStorageOSLogDomain_7302();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v18 = v10;
        __int16 v19 = 2112;
        id v20 = v13;
        _os_log_impl(&dword_1B4CAC000, v14, OS_LOG_TYPE_ERROR, "Unable to reenqueue background task for %@: %@", buf, 0x16u);
      }
    }
    if (a6) {
      *a6 = v13;
    }
  }

  return v12;
}

- (BOOL)enqueueBackgroundDownloadTaskForResource:(id)a3 intent:(unint64_t)a4 downloading:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if (!_CPLSilentLogging)
  {
    id v11 = __CPLStorageOSLogDomain_7302();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v10;
      _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_DEBUG, "Enqueuing background download task: %@", buf, 0xCu);
    }
  }
  char v12 = [(CPLEngineStorage *)self platformObject];
  id v17 = 0;
  char v13 = [v12 enqueueBackgroundDownloadTaskForResource:v10 intent:a4 downloading:v7 error:&v17];
  id v14 = v17;

  if (v13)
  {
    if (!v7) {
      [(CPLEngineResourceDownloadQueue *)self _requestBackgroundDownloads];
    }
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __int16 v15 = __CPLStorageOSLogDomain_7302();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v19 = v10;
        __int16 v20 = 2112;
        id v21 = v14;
        _os_log_impl(&dword_1B4CAC000, v15, OS_LOG_TYPE_ERROR, "Unable to enqueue background task for %@: %@", buf, 0x16u);
      }
    }
    if (a6) {
      *a6 = v14;
    }
  }

  return v13;
}

- (void)_unscheduleBackgroundDownloads
{
  downloadLock = self->_downloadLock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__CPLEngineResourceDownloadQueue__unscheduleBackgroundDownloads__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  v6[4] = self;
  unint64_t v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_7316;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  uint64_t v4 = downloadLock;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

uint64_t __64__CPLEngineResourceDownloadQueue__unscheduleBackgroundDownloads__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 136) = 0;
  return result;
}

- (void)_requestBackgroundDownloads
{
  downloadLock = self->_downloadLock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__CPLEngineResourceDownloadQueue__requestBackgroundDownloads__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  v6[4] = self;
  unint64_t v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_7316;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  uint64_t v4 = downloadLock;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

uint64_t __61__CPLEngineResourceDownloadQueue__requestBackgroundDownloads__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 136))
  {
    uint64_t v2 = result;
    if (!_CPLSilentLogging)
    {
      unint64_t v3 = __CPLStorageOSLogDomain_7302();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v4 = 0;
        _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEFAULT, "Will need to download some resources in background", v4, 2u);
      }

      uint64_t v1 = *(void *)(v2 + 32);
    }
    *(unsigned char *)(v1 + 136) = 1;
    return [*(id *)(v2 + 32) _scheduleBackgroundDownloadsIfNecessary];
  }
  return result;
}

- (void)_scheduleBackgroundDownloadsIfNecessary
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_downloadLock);
  if (self->_shouldRequestABackgroundDownloadSyncPhase)
  {
    if ([(CPLEngineResourceDownloadQueue *)self _canScheduleBackgroundDownloads])
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __73__CPLEngineResourceDownloadQueue__scheduleBackgroundDownloadsIfNecessary__block_invoke;
      v9[3] = &unk_1E60A5DD8;
      v9[4] = self;
      uint64_t v3 = MEMORY[0x1BA994060](v9);
      uint64_t v4 = (void *)v3;
      if (__CPLEngineResourceDownloadQueueRequestBackgroundDownloadQueueImmediately)
      {
        (*(void (**)(uint64_t))(v3 + 16))(v3);
      }
      else
      {
        dispatch_time_t v7 = dispatch_time(0, 2000000000);
        dispatch_after(v7, (dispatch_queue_t)self->_downloadLock, v4);
      }
    }
    else if (self->_shouldRequestABackgroundDownloadSyncPhase && _CPLSilentLogging == 0)
    {
      id v6 = __CPLStorageOSLogDomain_7302();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v8 = 0;
        _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_DEFAULT, "Engine needs to download resources in background but there still are active download tasks", v8, 2u);
      }
    }
  }
}

void __73__CPLEngineResourceDownloadQueue__scheduleBackgroundDownloadsIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (v2[136])
  {
    if ([v2 _canScheduleBackgroundDownloads])
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v3 = __CPLStorageOSLogDomain_7302();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEBUG, "We have some background downloads in the queue. Telling the scheduler.", buf, 2u);
        }
      }
      uint64_t v4 = [*(id *)(a1 + 32) engineStore];
      dispatch_block_t v5 = [v4 engineLibrary];
      id v6 = [v5 scheduler];
      [v6 noteResourceDownloadQueueIsFull];

      *(unsigned char *)(*(void *)(a1 + 32) + 136) = 0;
    }
    else
    {
      if (*(unsigned char *)(*(void *)(a1 + 32) + 136)) {
        BOOL v7 = _CPLSilentLogging == 0;
      }
      else {
        BOOL v7 = 0;
      }
      if (v7)
      {
        id v8 = __CPLStorageOSLogDomain_7302();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v9 = 0;
          _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_DEFAULT, "Engine needs to download resources in background but there still are active download tasks", v9, 2u);
        }
      }
    }
  }
}

- (void)_dequeueTransferTaskInActiveQueue:(id)a3
{
  downloadLock = self->_downloadLock;
  id v5 = a3;
  dispatch_assert_queue_V2(downloadLock);
  id v6 = [(CPLEngineResourceDownloadQueue *)self _activeQueueForTransferTask:v5];
  [v6 removeTransferTask:v5];

  [(CPLEngineResourceDownloadQueue *)self _scheduleBackgroundDownloadsIfNecessary];
}

- (void)_enqueueTransferTaskInActiveQueue:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_downloadLock);
  if ([v4 willGenerateReport])
  {
    id v5 = [(CPLEngineResourceDownloadQueue *)self _queuesStatus];
    [v4 noteActiveQueuesStatusAtEnqueingTime:v5];
  }
  id v6 = [(CPLEngineResourceDownloadQueue *)self _activeQueueForTransferTask:v4];
  [v6 addTransferTask:v4];
  int64_t v7 = [v6 coalescingInterval];
  if (v7 < 1)
  {
    [(CPLEngineResourceDownloadQueue *)self _launchTransportTaskForQueue:v6];
  }
  else
  {
    if (__CPLEngineResourceDownloadQueueRequestBackgroundDownloadQueueImmediately)
    {
      downloadLock = self->_downloadLock;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __68__CPLEngineResourceDownloadQueue__enqueueTransferTaskInActiveQueue___block_invoke;
      v17[3] = &unk_1E60A6728;
      v17[4] = self;
      id v18 = v6;
      id v9 = v17;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __cpl_dispatch_async_block_invoke_7316;
      block[3] = &unk_1E60A6978;
      id v20 = v9;
      id v10 = downloadLock;
      dispatch_block_t v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
      dispatch_async(v10, v11);

      char v12 = v18;
    }
    else
    {
      dispatch_time_t v13 = dispatch_time(0, v7);
      id v14 = self->_downloadLock;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __68__CPLEngineResourceDownloadQueue__enqueueTransferTaskInActiveQueue___block_invoke_2;
      v15[3] = &unk_1E60A6728;
      v15[4] = self;
      id v16 = v6;
      dispatch_after(v13, v14, v15);
      char v12 = v16;
    }
  }
}

uint64_t __68__CPLEngineResourceDownloadQueue__enqueueTransferTaskInActiveQueue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _launchTransportTaskForQueue:*(void *)(a1 + 40)];
}

uint64_t __68__CPLEngineResourceDownloadQueue__enqueueTransferTaskInActiveQueue___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _launchTransportTaskForQueue:*(void *)(a1 + 40)];
}

- (id)createGroupForBackgroundDownloadsOfResourceType:(unint64_t)a3 transferIntent:(unint64_t)a4 transport:(id)a5
{
  id v7 = a5;
  id v8 = [[CPLResourceTransferTaskOptions alloc] initWithIntent:a4 priority:2];
  id v9 = (*((void (**)(void))self->_lowPriorityQueuePerResourceTypeAndTransferIntent + 2))();
  id v10 = [v9 groupConstructor];
  dispatch_block_t v11 = ((void (**)(void, id))v10)[2](v10, v7);

  return v11;
}

- (id)_activeQueueForTransferTask:(id)a3
{
  id v4 = a3;
  id v5 = [v4 resource];
  uint64_t v6 = [v5 resourceType];

  id v7 = [v4 options];
  int v8 = [v7 isHighPriority];

  if (v8) {
    uint64_t v9 = 88;
  }
  else {
    uint64_t v9 = 96;
  }
  uint64_t v10 = *(uint64_t *)((char *)&self->super.super.isa + v9);
  dispatch_block_t v11 = [v4 options];

  char v12 = (*(void (**)(uint64_t, uint64_t, void *))(v10 + 16))(v10, v6, v11);

  return v12;
}

- (void)_dispatchTransportTasksIfNecessary
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_downloadLock);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v3 = self->_allHighPriorityQueues;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v19 + 1) + 8 * v7);
        while ([(CPLEngineResourceDownloadQueue *)self _launchTransportTaskForQueue:v8]);
        ++v7;
      }
      while (v7 != v5);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v5);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v9 = self->_allLowPriorityQueues;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v15 + 1) + 8 * v13);
        while (-[CPLEngineResourceDownloadQueue _launchTransportTaskForQueue:](self, "_launchTransportTaskForQueue:", v14, (void)v15));
        ++v13;
      }
      while (v13 != v11);
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v11);
  }

  if ([(CPLEngineResourceDownloadQueue *)self _canScheduleBackgroundDownloads]) {
    [(CPLEngineResourceDownloadQueue *)self _scheduleBackgroundDownloadsIfNecessary];
  }
}

- (BOOL)_launchTransportTaskForQueue:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 countOfTransferTasks])
  {
    int v5 = [v4 isHighPriority];
    if ((v5 & 1) == 0)
    {
      id v57 = 0;
      BOOL v6 = [(CPLEngineResourceDownloadQueue *)self _shouldTryLowPriorityDownloadWithError:&v57];
      id v7 = v57;
      uint64_t v8 = v7;
      if (!v6)
      {
        if (!_CPLSilentLogging)
        {
          v30 = __CPLStorageOSLogDomain_7302();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v31 = [v4 countOfTransferTasks];
            *(_DWORD *)buf = 134217984;
            *(void *)&uint8_t buf[4] = v31;
            _os_log_impl(&dword_1B4CAC000, v30, OS_LOG_TYPE_DEFAULT, "Enqueuing %lu background downloads", buf, 0xCu);
          }
        }
        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        v32 = [v4 allTransferTasks];
        uint64_t v33 = [v32 countByEnumeratingWithState:&v53 objects:v60 count:16];
        if (v33)
        {
          uint64_t v34 = v33;
          uint64_t v35 = *(void *)v54;
          do
          {
            for (uint64_t i = 0; i != v34; ++i)
            {
              if (*(void *)v54 != v35) {
                objc_enumerationMutation(v32);
              }
              v37 = *(void **)(*((void *)&v53 + 1) + 8 * i);
              v38 = [v37 completionHandler];
              ((void (**)(void, void *, void *))v38)[2](v38, v37, v8);
            }
            uint64_t v34 = [v32 countByEnumeratingWithState:&v53 objects:v60 count:16];
          }
          while (v34);
        }

        [v4 removeAllTransferTasks];
        [(CPLEngineResourceDownloadQueue *)self _scheduleBackgroundDownloadsIfNecessary];

        goto LABEL_42;
      }
    }
    unint64_t v9 = [v4 maximumConcurrentTransportTasks];
    if ([v4 countOfTransportTasks] < v9)
    {
      if ([(CPLEngineResourceDownloadQueue *)self _transportTaskCount] >= 8)
      {
        if (!v5) {
          goto LABEL_42;
        }
        uint64_t v10 = [(CPLEngineResourceDownloadQueue *)self _bestQueueWithCancellableTransportTasks];
        if (!v10) {
          goto LABEL_42;
        }
        uint64_t v11 = v10;
        uint64_t v12 = [v10 dequeueLastTransportTask];
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        uint64_t v13 = [v12 downloadTasks];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v49 objects:v59 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v50;
          do
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v50 != v16) {
                objc_enumerationMutation(v13);
              }
              [*(id *)(*((void *)&v49 + 1) + 8 * j) setCancelledByEngine:1];
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v49 objects:v59 count:16];
          }
          while (v15);
        }

        [v12 cancel];
      }
      *(void *)buf = 0;
      long long v18 = [v4 dequeueBatchOfTransferTasksDequeuedSize:buf];
      if ([v18 count])
      {
        long long v19 = [(CPLEngineStorage *)self engineStore];
        long long v20 = [v19 engineLibrary];
        long long v21 = [v20 transport];

        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = __63__CPLEngineResourceDownloadQueue__launchTransportTaskForQueue___block_invoke;
        v47[3] = &unk_1E60A7B68;
        v47[4] = self;
        id v22 = v4;
        id v48 = v22;
        v23 = [v21 resourcesDownloadTaskWithCompletionHandler:v47];
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        id v24 = v18;
        uint64_t v25 = [v24 countByEnumeratingWithState:&v43 objects:v58 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = *(void *)v44;
          do
          {
            for (uint64_t k = 0; k != v26; ++k)
            {
              if (*(void *)v44 != v27) {
                objc_enumerationMutation(v24);
              }
              objc_msgSend(*(id *)(*((void *)&v43 + 1) + 8 * k), "setTransportTask:", v23, (void)v43);
            }
            uint64_t v26 = [v24 countByEnumeratingWithState:&v43 objects:v58 count:16];
          }
          while (v26);
        }

        [v23 setDownloadTasks:v24];
        uint64_t v29 = [v22 type];
        if (v29 != 2)
        {
          if (v29 != 1)
          {
            if (!v29) {
              [v23 setBackgroundTask:1];
            }
            goto LABEL_46;
          }
          [v23 setForcedTask:1];
        }
        objc_msgSend(v23, "setForeground:", 1, (void)v43);
LABEL_46:
        objc_msgSend(v22, "groupConstructor", (void)v43);
        v41 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
        v42 = ((void (**)(void, void *))v41)[2](v41, v21);

        objc_msgSend(v42, "setRoughCPLRecordCount:", objc_msgSend(v24, "count"));
        [v42 setRoughCPLDownloadEstimatedSize:*(void *)buf];
        [v23 setTransportGroup:v42];
        [v22 addTransportTask:v23];
        [v23 runWithNoSyncSession];

        BOOL v39 = 1;
        goto LABEL_43;
      }
    }
  }
LABEL_42:
  BOOL v39 = 0;
LABEL_43:

  return v39;
}

void __63__CPLEngineResourceDownloadQueue__launchTransportTaskForQueue___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__CPLEngineResourceDownloadQueue__launchTransportTaskForQueue___block_invoke_2;
  v9[3] = &unk_1E60A6660;
  id v10 = *(id *)(a1 + 40);
  id v11 = v3;
  uint64_t v12 = *(void *)(a1 + 32);
  int v5 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_7316;
  block[3] = &unk_1E60A6978;
  id v14 = v5;
  BOOL v6 = v4;
  id v7 = v3;
  dispatch_block_t v8 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v6, v8);
}

uint64_t __63__CPLEngineResourceDownloadQueue__launchTransportTaskForQueue___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removeTransportTask:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 48);
  return [v2 _dispatchTransportTasksIfNecessary];
}

- (BOOL)_canScheduleBackgroundDownloads
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(CPLEngineResourceDownloadQueue *)self _transportTaskCount]) {
    return 0;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = self->_allQueues;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "countOfTransferTasks", (void)v10))
        {
          BOOL v3 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v3 = 1;
LABEL_13:

  return v3;
}

- (id)_bestQueueWithCancellableTransportTasks
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  BOOL v3 = self->_bestCancellableLowPriorityQueues;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v18 != v6) {
        objc_enumerationMutation(v3);
      }
      dispatch_block_t v8 = *(void **)(*((void *)&v17 + 1) + 8 * v7);
      if ([v8 countOfTransportTasks]) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    BOOL v3 = self->_bestCancellableHighPriorityQueues;
    id v9 = (id)[(NSArray *)v3 countByEnumeratingWithState:&v13 objects:v21 count:16];
    if (!v9) {
      goto LABEL_19;
    }
    uint64_t v10 = *(void *)v14;
LABEL_11:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v14 != v10) {
        objc_enumerationMutation(v3);
      }
      dispatch_block_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
      if (objc_msgSend(v8, "countOfTransportTasks", (void)v13)) {
        break;
      }
      if (v9 == (id)++v11)
      {
        id v9 = (id)[(NSArray *)v3 countByEnumeratingWithState:&v13 objects:v21 count:16];
        if (v9) {
          goto LABEL_11;
        }
        goto LABEL_19;
      }
    }
  }
  id v9 = v8;
LABEL_19:

  return v9;
}

- (unint64_t)_transportTaskCount
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_downloadLock);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v3 = self->_allQueues;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 += objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "countOfTransportTasks", (void)v10);
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)_shouldTryLowPriorityDownloadWithError:(id *)a3
{
  uint64_t v5 = [(CPLEngineStorage *)self engineStore];
  unint64_t v6 = [v5 engineLibrary];
  uint64_t v7 = [v6 scheduler];

  if (([v7 isClientInForeground] & 1) == 0)
  {
    if (a3)
    {
      id v10 = +[CPLErrors cplErrorWithCode:10 description:@"Client is in background. Will download resource in background"];
      id v9 = 0;
      goto LABEL_7;
    }
    id v9 = 0;
LABEL_13:
    BOOL v11 = 0;
    goto LABEL_24;
  }
  id v17 = 0;
  int v8 = [v7 isSynchronizationDisabledWithReasonError:&v17];
  id v9 = v17;
  if (!v8)
  {
    long long v12 = [(CPLEngineStorage *)self engineStore];
    long long v13 = [v12 engineLibrary];
    long long v14 = [v13 systemMonitor];

    if ([v14 isOnCellularOrUnknown]
      && [v14 isDataBudgetOverriden])
    {
      if (a3)
      {
        uint64_t v15 = @"On cellular with Data override. Will download resource in background";
LABEL_20:
        +[CPLErrors cplErrorWithCode:10 description:v15];
        BOOL v11 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_23:

        goto LABEL_24;
      }
    }
    else if ([v14 isNetworkConstrained])
    {
      if (a3)
      {
        uint64_t v15 = @"On constrained network. Will download resource in background";
        goto LABEL_20;
      }
    }
    else
    {
      if (![v14 diskPressureState])
      {
        BOOL v11 = 1;
        goto LABEL_23;
      }
      if (a3)
      {
        uint64_t v15 = @"Low disk space. Will download resource in background";
        goto LABEL_20;
      }
    }
    BOOL v11 = 0;
    goto LABEL_23;
  }
  if (!a3) {
    goto LABEL_13;
  }
  id v10 = +[CPLErrors cplErrorWithCode:10 underlyingError:v9 description:@"Synchronization is disabled. Will download resource in background"];
LABEL_7:
  BOOL v11 = 0;
  *a3 = v10;
LABEL_24:

  return v11;
}

- (id)_realDownloadTaskForLocalResource:(id)a3 taskIdentifier:(id)a4 cloudResource:(id)a5 ofRecord:(id)a6 target:(id)a7 didStartHandler:(id)a8 progressHandler:(id)a9 completionHandler:(id)a10
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v34 = a4;
  id v33 = a5;
  id v32 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  if (!_CPLSilentLogging)
  {
    long long v21 = __CPLStorageOSLogDomain_7302();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v47 = v16;
      _os_log_impl(&dword_1B4CAC000, v21, OS_LOG_TYPE_DEBUG, "Enqueuing download for cloud resource %@", buf, 0xCu);
    }
  }
  id v22 = [(CPLEngineStorage *)self engineStore];
  uint64_t v23 = [v22 engineLibrary];
  id v24 = [v23 scheduler];

  uint64_t v25 = [CPLEngineResourceDownloadTask alloc];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __163__CPLEngineResourceDownloadQueue__realDownloadTaskForLocalResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke;
  v44[3] = &unk_1E60A7AC8;
  v44[4] = self;
  id v45 = v16;
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __163__CPLEngineResourceDownloadQueue__realDownloadTaskForLocalResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_197;
  v41[3] = &unk_1E60A7AF0;
  v41[4] = self;
  id v42 = v45;
  id v43 = v20;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __163__CPLEngineResourceDownloadQueue__realDownloadTaskForLocalResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_199;
  v38[3] = &unk_1E60A7B18;
  id v39 = v24;
  id v40 = v18;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __163__CPLEngineResourceDownloadQueue__realDownloadTaskForLocalResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_2_200;
  v35[3] = &unk_1E60A7B40;
  v35[4] = self;
  id v36 = v42;
  id v37 = v43;
  id v26 = v43;
  id v27 = v42;
  id v28 = v18;
  id v29 = v24;
  v30 = [(CPLEngineResourceDownloadTask *)v25 initWithResource:v27 taskIdentifier:v34 target:v17 launchHandler:v44 cancelHandler:v41 didStartHandler:v38 progressHandler:v19 completionHandler:v35];
  [(CPLEngineResourceDownloadTask *)v30 associateCloudResource:v33 ofRecord:v32];

  return v30;
}

void __163__CPLEngineResourceDownloadQueue__realDownloadTaskForLocalResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 isHighPriority];
  uint64_t v4 = [v3 resource];
  [v4 resourceType];
  [v3 hash];
  kdebug_trace();

  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __163__CPLEngineResourceDownloadQueue__realDownloadTaskForLocalResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_2;
  v12[3] = &unk_1E60A6660;
  id v13 = v3;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 32);
  id v14 = v6;
  uint64_t v15 = v7;
  int v8 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_7316;
  block[3] = &unk_1E60A6978;
  id v17 = v8;
  id v9 = v5;
  id v10 = v3;
  dispatch_block_t v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v9, v11);
}

void __163__CPLEngineResourceDownloadQueue__realDownloadTaskForLocalResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_197(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 40);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __163__CPLEngineResourceDownloadQueue__realDownloadTaskForLocalResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_2_198;
  v11[3] = &unk_1E60A64B0;
  id v12 = v3;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v13 = v5;
  uint64_t v14 = v6;
  id v15 = *(id *)(a1 + 48);
  uint64_t v7 = v11;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_7316;
  block[3] = &unk_1E60A6978;
  id v17 = v7;
  int v8 = v4;
  id v9 = v3;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);
}

void __163__CPLEngineResourceDownloadQueue__realDownloadTaskForLocalResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_199(uint64_t a1, void *a2)
{
  id v6 = a2;
  [v6 isHighPriority];
  id v3 = [v6 resource];
  [v3 resourceType];
  [v6 hash];
  kdebug_trace();

  [v6 isHighPriority];
  uint64_t v4 = [v6 resource];
  [v4 resourceType];
  [v6 hash];
  kdebug_trace();

  [*(id *)(a1 + 32) willRunEngineElement:CPLEngineElementDownloadResource];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
  }
}

void __163__CPLEngineResourceDownloadQueue__realDownloadTaskForLocalResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_2_200(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 40);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __163__CPLEngineResourceDownloadQueue__realDownloadTaskForLocalResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_3;
  v13[3] = &unk_1E60A64B0;
  id v14 = v5;
  id v15 = *(id *)(a1 + 40);
  id v16 = v6;
  id v17 = *(id *)(a1 + 48);
  int v8 = v13;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_7316;
  block[3] = &unk_1E60A6978;
  id v19 = v8;
  id v9 = v7;
  id v10 = v6;
  id v11 = v5;
  dispatch_block_t v12 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v9, v12);
}

uint64_t __163__CPLEngineResourceDownloadQueue__realDownloadTaskForLocalResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    uint64_t v2 = __CPLStorageOSLogDomain_7302();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v5 = *(void *)(a1 + 48);
      int v8 = 138412802;
      uint64_t v9 = v3;
      __int16 v10 = 2112;
      uint64_t v11 = v4;
      __int16 v12 = 2112;
      uint64_t v13 = v5;
      _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "%@ for %@ did finish with error %@", (uint8_t *)&v8, 0x20u);
    }
  }
  [*(id *)(a1 + 32) isHighPriority];
  id v6 = [*(id *)(a1 + 32) resource];
  [v6 resourceType];
  [*(id *)(a1 + 32) hash];
  kdebug_trace();

  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __163__CPLEngineResourceDownloadQueue__realDownloadTaskForLocalResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_2_198(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    uint64_t v2 = __CPLStorageOSLogDomain_7302();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      int v11 = 138412546;
      uint64_t v12 = v3;
      __int16 v13 = 2112;
      uint64_t v14 = v4;
      _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "Cancelling %@ for %@", (uint8_t *)&v11, 0x16u);
    }
  }
  uint64_t v5 = [*(id *)(a1 + 32) transportTask];
  id v6 = v5;
  if (v5)
  {
    [v5 cancelDownloadTask:*(void *)(a1 + 32)];
  }
  else
  {
    [*(id *)(a1 + 48) _dequeueTransferTaskInActiveQueue:*(void *)(a1 + 32)];
    [*(id *)(a1 + 32) isHighPriority];
    uint64_t v7 = [*(id *)(a1 + 32) resource];
    [v7 resourceType];
    [*(id *)(a1 + 32) hash];
    kdebug_trace();

    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v9 = *(void *)(a1 + 32);
    __int16 v10 = +[CPLErrors operationCancelledError];
    (*(void (**)(uint64_t, uint64_t, void *))(v8 + 16))(v8, v9, v10);
  }
}

uint64_t __163__CPLEngineResourceDownloadQueue__realDownloadTaskForLocalResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    uint64_t v2 = __CPLStorageOSLogDomain_7302();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      int v6 = 138412546;
      uint64_t v7 = v3;
      __int16 v8 = 2112;
      uint64_t v9 = v4;
      _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "Enqueuing %@ for %@", (uint8_t *)&v6, 0x16u);
    }
  }
  return [*(id *)(a1 + 48) _enqueueTransferTaskInActiveQueue:*(void *)(a1 + 32)];
}

- (id)_resourceStorageCopyTaskForResource:(id)a3 taskIdentifier:(id)a4 cloudResource:(id)a5 ofRecord:(id)a6 target:(id)a7 didStartHandler:(id)a8 progressHandler:(id)a9 completionHandler:(id)a10
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v41 = a3;
  id v17 = a4;
  id v36 = a5;
  id v37 = a6;
  id v38 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  uint64_t v65 = 0;
  v66 = (id *)&v65;
  uint64_t v67 = 0x3032000000;
  v68 = __Block_byref_object_copy__7346;
  v69 = __Block_byref_object_dispose__7347;
  id v70 = 0;
  id v40 = [(CPLEngineStorage *)self engineStore];
  long long v21 = [v40 resourceStorage];
  id v22 = v66;
  id v64 = v66[5];
  id v39 = v21;
  uint64_t v23 = v41;
  id v42 = [v21 retainFileURLForResource:v41 error:&v64];
  objc_storeStrong(v22 + 5, v64);
  if (v42)
  {
    id v24 = [v41 identity];
    uint64_t v25 = [v24 fileURL];

    if (!v25)
    {
      if (!_CPLSilentLogging)
      {
        id v32 = __CPLStorageOSLogDomain_7302();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v41;
          _os_log_impl(&dword_1B4CAC000, v32, OS_LOG_TYPE_ERROR, "Resource %@ should have a destination URL by now", buf, 0xCu);
        }
      }
      id v33 = [MEMORY[0x1E4F28B00] currentHandler];
      id v34 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineResourceDownloadQueue.m"];
      [v33 handleFailureInMethod:a2, self, v34, 875, @"Resource %@ should have a destination URL by now", v41 object file lineNumber description];

      abort();
    }
    if (!_CPLSilentLogging)
    {
      id v26 = __CPLStorageOSLogDomain_7302();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v41;
        _os_log_impl(&dword_1B4CAC000, v26, OS_LOG_TYPE_DEBUG, "Will link resource %@ from resource storage", buf, 0xCu);
      }
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000;
    char v72 = 0;
    uint64_t v35 = [CPLEngineResourceDownloadTask alloc];
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __165__CPLEngineResourceDownloadQueue__resourceStorageCopyTaskForResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke;
    v53[3] = &unk_1E60A7A50;
    id v54 = v40;
    id v55 = v41;
    id v27 = v25;
    long long v56 = v27;
    id v57 = self;
    id v58 = v42;
    id v59 = v39;
    uint64_t v62 = &v65;
    id v28 = v36;
    id v60 = v28;
    id v61 = v20;
    v63 = buf;
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __165__CPLEngineResourceDownloadQueue__resourceStorageCopyTaskForResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_193;
    v49[3] = &unk_1E60A7A78;
    v49[4] = self;
    long long v52 = buf;
    id v50 = v55;
    id v51 = v61;
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __165__CPLEngineResourceDownloadQueue__resourceStorageCopyTaskForResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_195;
    v47[3] = &unk_1E60A7F08;
    id v48 = v18;
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __165__CPLEngineResourceDownloadQueue__resourceStorageCopyTaskForResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_2_196;
    v43[3] = &unk_1E60A7AA0;
    v43[4] = self;
    long long v46 = buf;
    uint64_t v23 = v41;
    id v44 = v50;
    id v45 = v51;
    id v29 = [(CPLEngineResourceDownloadTask *)v35 initWithResource:v44 taskIdentifier:v17 target:v38 launchHandler:v53 cancelHandler:v49 didStartHandler:v47 progressHandler:v19 completionHandler:v43];
    [(CPLEngineResourceDownloadTask *)v29 associateCloudResource:v28 ofRecord:v37];

    _Block_object_dispose(buf, 8);
LABEL_12:

    goto LABEL_13;
  }
  if (!_CPLSilentLogging)
  {
    id v27 = __CPLStorageOSLogDomain_7302();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      id v30 = v66[5];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v41;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v30;
      _os_log_impl(&dword_1B4CAC000, v27, OS_LOG_TYPE_DEBUG, "Can't access file in cache for %@: %@", buf, 0x16u);
    }
    id v29 = 0;
    goto LABEL_12;
  }
  id v29 = 0;
LABEL_13:

  _Block_object_dispose(&v65, 8);
  return v29;
}

void __165__CPLEngineResourceDownloadQueue__resourceStorageCopyTaskForResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 isHighPriority];
  uint64_t v4 = [v3 resource];
  [v4 resourceType];
  [v3 hash];
  kdebug_trace();

  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  char v35 = 1;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __165__CPLEngineResourceDownloadQueue__resourceStorageCopyTaskForResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_2;
  v25[3] = &unk_1E60A7A00;
  uint64_t v5 = *(void **)(a1 + 32);
  id v26 = *(id *)(a1 + 40);
  id v27 = v3;
  id v32 = v34;
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  __int16 v8 = *(void **)(a1 + 64);
  id v28 = v6;
  uint64_t v29 = v7;
  id v30 = v8;
  id v9 = *(id *)(a1 + 72);
  uint64_t v10 = *(void *)(a1 + 96);
  id v31 = v9;
  uint64_t v33 = v10;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __165__CPLEngineResourceDownloadQueue__resourceStorageCopyTaskForResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_189;
  v17[3] = &unk_1E60A7A28;
  id v18 = *(id *)(a1 + 80);
  id v11 = *(id *)(a1 + 48);
  uint64_t v23 = v34;
  uint64_t v12 = *(void *)(a1 + 56);
  id v19 = v11;
  uint64_t v20 = v12;
  id v13 = v27;
  id v21 = v13;
  id v14 = *(id *)(a1 + 88);
  uint64_t v15 = *(void *)(a1 + 104);
  id v22 = v14;
  uint64_t v24 = v15;
  id v16 = (id)[v5 performWriteTransactionWithBlock:v25 completionHandler:v17];

  _Block_object_dispose(v34, 8);
}

void __165__CPLEngineResourceDownloadQueue__resourceStorageCopyTaskForResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_193(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 40);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __165__CPLEngineResourceDownloadQueue__resourceStorageCopyTaskForResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_2_194;
  v11[3] = &unk_1E60A9DD8;
  uint64_t v16 = *(void *)(a1 + 56);
  id v12 = v3;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v13 = v5;
  uint64_t v14 = v6;
  id v15 = *(id *)(a1 + 48);
  uint64_t v7 = v11;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_7316;
  block[3] = &unk_1E60A6978;
  id v18 = v7;
  __int16 v8 = v4;
  id v9 = v3;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);
}

void __165__CPLEngineResourceDownloadQueue__resourceStorageCopyTaskForResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_195(uint64_t a1, void *a2)
{
  id v6 = a2;
  [v6 isHighPriority];
  id v3 = [v6 resource];
  [v3 resourceType];
  [v6 hash];
  kdebug_trace();

  [v6 isHighPriority];
  uint64_t v4 = [v6 resource];
  [v4 resourceType];
  [v6 hash];
  kdebug_trace();

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
  }
}

void __165__CPLEngineResourceDownloadQueue__resourceStorageCopyTaskForResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_2_196(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 40);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __165__CPLEngineResourceDownloadQueue__resourceStorageCopyTaskForResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_3;
  v13[3] = &unk_1E60A9DD8;
  uint64_t v18 = *(void *)(a1 + 56);
  id v14 = v5;
  id v15 = *(id *)(a1 + 40);
  id v16 = v6;
  id v17 = *(id *)(a1 + 48);
  __int16 v8 = v13;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_7316;
  block[3] = &unk_1E60A6978;
  id v20 = v8;
  id v9 = v7;
  id v10 = v6;
  id v11 = v5;
  dispatch_block_t v12 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v9, v12);
}

uint64_t __165__CPLEngineResourceDownloadQueue__resourceStorageCopyTaskForResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_3(uint64_t result)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(*(void *)(*(void *)(result + 64) + 8) + 24))
  {
    uint64_t v1 = result;
    if (!_CPLSilentLogging)
    {
      uint64_t v2 = __CPLStorageOSLogDomain_7302();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v3 = *(void *)(v1 + 32);
        uint64_t v4 = *(void *)(v1 + 40);
        uint64_t v5 = *(void *)(v1 + 48);
        int v7 = 138412802;
        uint64_t v8 = v3;
        __int16 v9 = 2112;
        uint64_t v10 = v4;
        __int16 v11 = 2112;
        uint64_t v12 = v5;
        _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "%@ for %@ did finish with error %@", (uint8_t *)&v7, 0x20u);
      }
    }
    [*(id *)(v1 + 32) isHighPriority];
    id v6 = [*(id *)(v1 + 32) resource];
    [v6 resourceType];
    [*(id *)(v1 + 32) hash];
    kdebug_trace();

    return (*(uint64_t (**)(void))(*(void *)(v1 + 56) + 16))();
  }
  return result;
}

void __165__CPLEngineResourceDownloadQueue__resourceStorageCopyTaskForResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_2_194(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v2 = __CPLStorageOSLogDomain_7302();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v3 = *(void *)(a1 + 32);
        uint64_t v4 = *(void *)(a1 + 40);
        int v11 = 138412546;
        uint64_t v12 = v3;
        __int16 v13 = 2112;
        uint64_t v14 = v4;
        _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "Cancelling %@ for %@", (uint8_t *)&v11, 0x16u);
      }
    }
    uint64_t v5 = [*(id *)(a1 + 32) transportTask];
    id v6 = v5;
    if (v5)
    {
      [v5 cancelDownloadTask:*(void *)(a1 + 32)];
    }
    else
    {
      [*(id *)(a1 + 48) _dequeueTransferTaskInActiveQueue:*(void *)(a1 + 32)];
      [*(id *)(a1 + 32) isHighPriority];
      int v7 = [*(id *)(a1 + 32) resource];
      [v7 resourceType];
      [*(id *)(a1 + 32) hash];
      kdebug_trace();

      uint64_t v8 = *(void *)(a1 + 56);
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = +[CPLErrors operationCancelledError];
      (*(void (**)(uint64_t, uint64_t, void *))(v8 + 16))(v8, v9, v10);
    }
  }
}

void __165__CPLEngineResourceDownloadQueue__resourceStorageCopyTaskForResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!_CPLSilentLogging)
  {
    uint64_t v4 = __CPLStorageOSLogDomain_7302();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      id v26 = v5;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEBUG, "Linking %@ from resource storage", buf, 0xCu);
    }
  }
  if ([*(id *)(a1 + 40) isCancelled])
  {
    id v6 = +[CPLErrors operationCancelledError];
    [v3 setError:v6];
  }
  int v7 = [v3 error];

  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
  }
  else
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __165__CPLEngineResourceDownloadQueue__resourceStorageCopyTaskForResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_187;
    v20[3] = &unk_1E60AB778;
    id v21 = *(id *)(a1 + 48);
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = *(void **)(a1 + 64);
    id v22 = v8;
    uint64_t v23 = v9;
    id v24 = v10;
    [v3 do:v20];
  }
  uint64_t v12 = *(void *)(a1 + 64);
  int v11 = *(void **)(a1 + 72);
  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v14 = *(void *)(*(void *)(a1 + 88) + 8);
  obuint64_t j = *(id *)(v14 + 40);
  char v15 = [v11 releaseFileURL:v12 forResource:v13 error:&obj];
  objc_storeStrong((id *)(v14 + 40), obj);
  if ((v15 & 1) == 0 && !_CPLSilentLogging)
  {
    id v16 = __CPLStorageOSLogDomain_7302();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      id v17 = [*(id *)(a1 + 64) path];
      uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
      *(_DWORD *)buf = 138412546;
      id v26 = v17;
      __int16 v27 = 2112;
      uint64_t v28 = v18;
      _os_log_impl(&dword_1B4CAC000, v16, OS_LOG_TYPE_DEBUG, "Failed to release cached URL %@: %@", buf, 0x16u);
    }
  }
}

void __165__CPLEngineResourceDownloadQueue__resourceStorageCopyTaskForResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_189(uint64_t a1, void *a2)
{
  void v34[3] = *(id *)MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 error];

  if (v4)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v5 = __CPLStorageOSLogDomain_7302();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(a1 + 32);
        int v7 = [*(id *)(a1 + 40) path];
        uint64_t v8 = [v3 error];
        uint64_t v9 = (void *)v8;
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)) {
          uint64_t v10 = " - will fallback on transport";
        }
        else {
          uint64_t v10 = "";
        }
        *(_DWORD *)buf = 138413058;
        *(void *)&uint8_t buf[4] = v6;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v7;
        *(_WORD *)&buf[22] = 2112;
        uint64_t v33 = (void *)v8;
        LOWORD(v34[0]) = 2080;
        *(id *)((char *)v34 + 2) = (id)v10;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEFAULT, "Failed to link cached resource %@ to %@. Error: %@%s", buf, 0x2Au);
      }
    }
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
    {
      int v11 = *(void **)(*(void *)(a1 + 48) + 40);
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __165__CPLEngineResourceDownloadQueue__resourceStorageCopyTaskForResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_192;
      v26[3] = &unk_1E60A9DD8;
      id v27 = *(id *)(a1 + 56);
      id v28 = *(id *)(a1 + 32);
      id v12 = *(id *)(a1 + 64);
      uint64_t v13 = *(void *)(a1 + 80);
      id v30 = v12;
      uint64_t v31 = v13;
      uint64_t v29 = *(void *)(a1 + 48);
      uint64_t v14 = v26;
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&uint8_t buf[16] = __cpl_dispatch_async_block_invoke_7316;
      uint64_t v33 = &unk_1E60A6978;
      v34[0] = v14;
      char v15 = v11;
      dispatch_block_t v16 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
      dispatch_async(v15, v16);
    }
    else
    {
      [*(id *)(a1 + 56) isHighPriority];
      id v21 = [*(id *)(a1 + 56) resource];
      [v21 resourceType];
      [*(id *)(a1 + 56) hash];
      kdebug_trace();

      uint64_t v24 = a1 + 56;
      uint64_t v22 = *(void *)(a1 + 56);
      uint64_t v23 = *(void *)(v24 + 8);
      uint64_t v25 = [v3 error];
      (*(void (**)(uint64_t, uint64_t, void *))(v23 + 16))(v23, v22, v25);
    }
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v17 = __CPLStorageOSLogDomain_7302();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v18 = *(void *)(a1 + 32);
        id v19 = [*(id *)(a1 + 40) path];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v18;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v19;
        _os_log_impl(&dword_1B4CAC000, v17, OS_LOG_TYPE_DEBUG, "Linked cached resource %@ to %@", buf, 0x16u);
      }
    }
    [*(id *)(a1 + 56) isHighPriority];
    id v20 = [*(id *)(a1 + 56) resource];
    [v20 resourceType];
    [*(id *)(a1 + 56) hash];
    kdebug_trace();

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

void __165__CPLEngineResourceDownloadQueue__resourceStorageCopyTaskForResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_192(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isCancelled])
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v2 = __CPLStorageOSLogDomain_7302();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v3 = *(void *)(a1 + 32);
        uint64_t v4 = *(void *)(a1 + 40);
        int v11 = 138412546;
        uint64_t v12 = v3;
        __int16 v13 = 2112;
        uint64_t v14 = v4;
        _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "%@ for %@ was cancelled before it had a chance to be enqueued", (uint8_t *)&v11, 0x16u);
      }
    }
    uint64_t v5 = *(void *)(a1 + 56);
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = +[CPLErrors operationCancelledError];
    (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, v6, v7);
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v8 = __CPLStorageOSLogDomain_7302();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v9 = *(void *)(a1 + 32);
        uint64_t v10 = *(void *)(a1 + 40);
        int v11 = 138412546;
        uint64_t v12 = v9;
        __int16 v13 = 2112;
        uint64_t v14 = v10;
        _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_DEBUG, "Enqueuing %@ for %@", (uint8_t *)&v11, 0x16u);
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    [*(id *)(a1 + 48) _enqueueTransferTaskInActiveQueue:*(void *)(a1 + 32)];
  }
}

uint64_t __165__CPLEngineResourceDownloadQueue__resourceStorageCopyTaskForResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_187(void **a1, uint64_t a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  if ([v4 cplFileExistsAtURL:a1[4]])
  {
    uint64_t v5 = [a1[5] identity];
    id v6 = [v5 fingerPrint];

    int v7 = v6;
    if (v6)
    {
      uint64_t v22 = a2;
      uint64_t v8 = [a1[6] engineStore];
      uint64_t v9 = [v8 engineLibrary];
      uint64_t v10 = [v9 transport];
      int v11 = [v10 fingerprintContext];
      [v11 fingerprintSchemeForFingerprint:v6];
      v13 = uint64_t v12 = v6;
      uint64_t v14 = a1[4];
      id v23 = 0;
      uint64_t v15 = [v13 fingerPrintForFileAtURL:v14 error:&v23];
      id v6 = v23;

      if (v15)
      {
        int v7 = v12;
        if ([v15 isEqual:v12])
        {
          if (!_CPLSilentLogging)
          {
            dispatch_block_t v16 = __CPLStorageOSLogDomain_7302();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              id v17 = a1[5];
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v17;
              _os_log_impl(&dword_1B4CAC000, v16, OS_LOG_TYPE_DEFAULT, "Asked to download cloud resource %@ while file is already present on disk", buf, 0xCu);
            }
          }
          goto LABEL_21;
        }
      }
      else
      {
        int v7 = v12;
      }
      a2 = v22;
    }
    if (!_CPLSilentLogging)
    {
      uint64_t v18 = __CPLStorageOSLogDomain_7302();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        id v19 = a1[5];
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v19;
        _os_log_impl(&dword_1B4CAC000, v18, OS_LOG_TYPE_DEFAULT, "Asked to overwrite already present cloud resource %@", buf, 0xCu);
      }
    }
  }
  if (![v4 cplCopyItemAtURL:a1[7] toURL:a1[4] error:a2])
  {
    uint64_t v20 = 0;
    goto LABEL_23;
  }
  *(void *)buf = 0;
  if (CPLGetDynamicVersionForDownloadResource(a1[7], buf, 0)) {
    CPLMarkDownloadedResourceWithDynamicVersion(a1[4], *(uint64_t *)buf, 0);
  }
LABEL_21:
  uint64_t v20 = 1;
LABEL_23:

  return v20;
}

- (id)_failedTaskWithCompletionHandler:(id)a3 error:(id)a4 resource:(id)a5 taskIdentifier:(id)a6 options:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  dispatch_block_t v16 = [CPLRecordTarget alloc];
  id v17 = [v15 itemScopedIdentifier];
  uint64_t v18 = [(CPLRecordTarget *)v16 initWithScopedIdentifier:v17];

  id v19 = [CPLEngineResourceDownloadTask alloc];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __105__CPLEngineResourceDownloadQueue__failedTaskWithCompletionHandler_error_resource_taskIdentifier_options___block_invoke;
  v26[3] = &unk_1E60A79D8;
  id v27 = v12;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __105__CPLEngineResourceDownloadQueue__failedTaskWithCompletionHandler_error_resource_taskIdentifier_options___block_invoke_3;
  v24[3] = &unk_1E60A7F58;
  id v25 = v11;
  id v20 = v11;
  id v21 = v12;
  uint64_t v22 = [(CPLEngineResourceDownloadTask *)v19 initWithResource:v15 taskIdentifier:v14 target:v18 launchHandler:v26 cancelHandler:&__block_literal_global_183 didStartHandler:0 progressHandler:0 completionHandler:v24];

  [(CPLResourceTransferTask *)v22 setOptions:v13];
  return v22;
}

void __105__CPLEngineResourceDownloadQueue__failedTaskWithCompletionHandler_error_resource_taskIdentifier_options___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 completionHandler];
  v4[2](v4, v3, *(void *)(a1 + 32));
}

uint64_t __105__CPLEngineResourceDownloadQueue__failedTaskWithCompletionHandler_error_resource_taskIdentifier_options___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)_downloadTaskForLocalResource:(id)a3 clientBundleID:(id)a4 options:(id)a5 proposedTaskIdentifier:(id)a6 didStartHandler:(id)a7 progressHandler:(id)a8 completionHandler:(id)a9
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v38 = a4;
  id v16 = a5;
  id v42 = a6;
  id v39 = a7;
  id v40 = a8;
  id v41 = a9;
  char v62 = 0;
  id v17 = v15;
  uint64_t v18 = [(CPLEngineStorage *)self engineStore];
  id v19 = [v18 transactionTransportScopeMapping];

  id v60 = 0;
  id v61 = v17;
  id v59 = 0;
  id v58 = 0;
  id v20 = -[CPLEngineResourceDownloadQueue cloudResourceForLocalResource:cloudRecord:target:shouldNotTrustCaches:allowUnsafeClientCache:transportScopeMapping:error:](self, "cloudResourceForLocalResource:cloudRecord:target:shouldNotTrustCaches:allowUnsafeClientCache:transportScopeMapping:error:", &v61, &v60, &v59, &v62, [v16 isHighPriority], v19, &v58);
  id v21 = v61;

  id v22 = v60;
  id v23 = v59;
  id v24 = v58;
  id v37 = v24;
  if (!v20)
  {
    id v27 = [(CPLEngineResourceDownloadQueue *)self _failedTaskWithCompletionHandler:v41 error:v24 resource:v17 taskIdentifier:v42 options:v16];
    goto LABEL_24;
  }
  id v36 = [(CPLEngineStorage *)self engineStore];
  v56[0] = 0;
  v56[1] = v56;
  v56[2] = 0x2020000000;
  char v57 = 0;
  if ([v16 isHighPriority])
  {
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __160__CPLEngineResourceDownloadQueue__downloadTaskForLocalResource_clientBundleID_options_proposedTaskIdentifier_didStartHandler_progressHandler_completionHandler___block_invoke;
    v52[3] = &unk_1E60A7988;
    id v55 = v56;
    id v53 = v20;
    id v54 = v41;
    id v25 = (void *)[v52 copy];

    id v26 = v53;
  }
  else
  {
    if ([v16 hasValidTimeRange])
    {
      id v25 = +[CPLErrors incorrectParametersErrorForParameter:@"timeRange"];
      if (!_CPLSilentLogging)
      {
        id v28 = __CPLStorageOSLogDomain_7302();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v64 = v42;
          __int16 v65 = 2112;
          id v66 = v16;
          _os_log_impl(&dword_1B4CAC000, v28, OS_LOG_TYPE_ERROR, "Cannot download resource for task %@ with options: %@: a timeRange cannot be specified for this task", buf, 0x16u);
        }
      }
      id v27 = [(CPLEngineResourceDownloadQueue *)self _failedTaskWithCompletionHandler:v41 error:v25 resource:v17 taskIdentifier:v42 options:v16];
      goto LABEL_23;
    }
    uint64_t v29 = [(CPLEngineStorage *)self platformObject];
    objc_msgSend(v21, "_setBackgroundDownloadTaskIdentifier:", objc_msgSend(v29, "newTaskIdentifier"));

    objc_msgSend(v20, "_setBackgroundDownloadTaskIdentifier:", objc_msgSend(v21, "_backgroundDownloadTaskIdentifier"));
    id v51 = 0;
    BOOL v30 = -[CPLEngineResourceDownloadQueue enqueueBackgroundDownloadTaskForResource:intent:downloading:error:](self, "enqueueBackgroundDownloadTaskForResource:intent:downloading:error:", v21, [v16 intent], 1, &v51);
    id v31 = v51;
    if (_CPLSilentLogging) {
      char v32 = 1;
    }
    else {
      char v32 = v30;
    }
    if ((v32 & 1) == 0)
    {
      id v35 = v31;
      uint64_t v33 = __CPLStorageOSLogDomain_7302();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v64 = v21;
        _os_log_impl(&dword_1B4CAC000, v33, OS_LOG_TYPE_ERROR, "Failed to enqueue low priority request for %@", buf, 0xCu);
      }

      id v31 = v35;
    }
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __160__CPLEngineResourceDownloadQueue__downloadTaskForLocalResource_clientBundleID_options_proposedTaskIdentifier_didStartHandler_progressHandler_completionHandler___block_invoke_166;
    v43[3] = &unk_1E60A79B0;
    long long v49 = v56;
    BOOL v50 = v30;
    id v26 = v31;
    id v44 = v26;
    id v45 = v21;
    id v46 = v36;
    id v47 = self;
    id v48 = v41;
    id v25 = (void *)[v43 copy];
  }
  if (([v16 hasValidTimeRange] & 1) != 0
    || ([(CPLEngineResourceDownloadQueue *)self _resourceStorageCopyTaskForResource:v21 taskIdentifier:v42 cloudResource:v20 ofRecord:v22 target:v23 didStartHandler:v39 progressHandler:v40 completionHandler:v25], (id v27 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v27 = [(CPLEngineResourceDownloadQueue *)self _realDownloadTaskForLocalResource:v21 taskIdentifier:v42 cloudResource:v20 ofRecord:v22 target:v23 didStartHandler:v39 progressHandler:v40 completionHandler:v25];
  }
  [v27 setClientBundleID:v38];
  [v27 associateCloudResource:v20 ofRecord:v22];
  [v27 setTransportScopeMapping:v19];
  [v27 setOptions:v16];
LABEL_23:

  _Block_object_dispose(v56, 8);
LABEL_24:

  return v27;
}

void __160__CPLEngineResourceDownloadQueue__downloadTaskForLocalResource_clientBundleID_options_proposedTaskIdentifier_didStartHandler_progressHandler_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = v6;
  uint64_t v8 = *(void *)(a1[6] + 8);
  if (*(unsigned char *)(v8 + 24))
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v9 = __CPLStorageOSLogDomain_7302();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412290;
        id v15 = v5;
        _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_DEFAULT, "Completion handler for %@ has been called twice", (uint8_t *)&v14, 0xCu);
      }
    }
  }
  else
  {
    *(unsigned char *)(v8 + 24) = 1;
    if (v6 && ([v6 isCPLOperationCancelledError] & 1) == 0 && !_CPLSilentLogging)
    {
      uint64_t v10 = __CPLStorageOSLogDomain_7302();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v11 = [v5 taskIdentifier];
        uint64_t v12 = a1[4];
        int v14 = 138412802;
        id v15 = v11;
        __int16 v16 = 2112;
        uint64_t v17 = v12;
        __int16 v18 = 2112;
        id v19 = v7;
        _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_ERROR, "Failed to download high priority task %@ for cloud resource %@: %@", (uint8_t *)&v14, 0x20u);
      }
    }
    uint64_t v13 = a1[5];
    if (v13) {
      (*(void (**)(uint64_t, id, void *))(v13 + 16))(v13, v5, v7);
    }
  }
}

void __160__CPLEngineResourceDownloadQueue__downloadTaskForLocalResource_clientBundleID_options_proposedTaskIdentifier_didStartHandler_progressHandler_completionHandler___block_invoke_166(uint64_t a1, void *a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  uint64_t v8 = *(void *)(*(void *)(a1 + 72) + 8);
  if (*(unsigned char *)(v8 + 24))
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v9 = __CPLStorageOSLogDomain_7302();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v31 = v5;
        _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_DEFAULT, "Completion handler for %@ has been called twice", buf, 0xCu);
      }
    }
  }
  else
  {
    *(unsigned char *)(v8 + 24) = 1;
    if (v6)
    {
      if (!*(unsigned char *)(a1 + 80))
      {
        if ([v6 isCPLErrorWithCode:10])
        {
          uint64_t v10 = *(void **)(a1 + 32);
          if (v10)
          {
            id v11 = v10;

            id v7 = v11;
          }
        }
      }
    }
    if (!_CPLSilentLogging)
    {
      uint64_t v12 = __CPLStorageOSLogDomain_7302();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        if (*(unsigned char *)(a1 + 80)) {
          uint64_t v13 = @"enqueued ";
        }
        else {
          uint64_t v13 = &stru_1F0D5F858;
        }
        int v14 = +[CPLResource descriptionForResourceType:](CPLResource, "descriptionForResourceType:", [*(id *)(a1 + 40) resourceType]);
        id v15 = [*(id *)(a1 + 40) itemScopedIdentifier];
        uint64_t v16 = [*(id *)(a1 + 40) _backgroundDownloadTaskIdentifier];
        *(_DWORD *)buf = 138413314;
        id v31 = v13;
        __int16 v32 = 2112;
        uint64_t v33 = v14;
        __int16 v34 = 2112;
        id v35 = v15;
        __int16 v36 = 2048;
        uint64_t v37 = v16;
        __int16 v38 = 2112;
        id v39 = v7;
        _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_DEBUG, "Low priority %@download for %@ %@ (%lu) has finished with error %@", buf, 0x34u);
      }
    }
    if (*(unsigned char *)(a1 + 80))
    {
      uint64_t v17 = *(void **)(a1 + 48);
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __160__CPLEngineResourceDownloadQueue__downloadTaskForLocalResource_clientBundleID_options_proposedTaskIdentifier_didStartHandler_progressHandler_completionHandler___block_invoke_173;
      v25[3] = &unk_1E60AA170;
      id v26 = v7;
      __int16 v18 = v5;
      uint64_t v19 = *(void *)(a1 + 56);
      id v27 = v18;
      uint64_t v28 = v19;
      id v29 = *(id *)(a1 + 40);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __160__CPLEngineResourceDownloadQueue__downloadTaskForLocalResource_clientBundleID_options_proposedTaskIdentifier_didStartHandler_progressHandler_completionHandler___block_invoke_178;
      v21[3] = &unk_1E60AA9A0;
      id v24 = *(id *)(a1 + 64);
      id v22 = v18;
      id v7 = v26;
      id v23 = v7;
      [v17 performBatchedWriteTransactionWithBlock:v25 completionHandler:v21];
    }
    else
    {
      uint64_t v20 = *(void *)(a1 + 64);
      if (v20) {
        (*(void (**)(uint64_t, __CFString *, id))(v20 + 16))(v20, v5, v7);
      }
    }
  }
}

void __160__CPLEngineResourceDownloadQueue__downloadTaskForLocalResource_clientBundleID_options_proposedTaskIdentifier_didStartHandler_progressHandler_completionHandler___block_invoke_173(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  if (!v4)
  {
    id v6 = v7;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __160__CPLEngineResourceDownloadQueue__downloadTaskForLocalResource_clientBundleID_options_proposedTaskIdentifier_didStartHandler_progressHandler_completionHandler___block_invoke_176;
    v7[3] = &unk_1E60AB750;
    v7[4] = *(id *)(a1 + 56);
    goto LABEL_8;
  }
  if ([v4 isCPLOperationCancelledError]
    && ![*(id *)(a1 + 40) isCancelledByEngine]
    || (id v5 = (void *)(a1 + 48),
        ![(id)objc_opt_class() shouldRetryDownloadOnError:*(void *)(a1 + 32)]))
  {
    id v6 = v8;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __160__CPLEngineResourceDownloadQueue__downloadTaskForLocalResource_clientBundleID_options_proposedTaskIdentifier_didStartHandler_progressHandler_completionHandler___block_invoke_175;
    v8[3] = &unk_1E60AB750;
    v8[4] = *(id *)(a1 + 56);
LABEL_8:
    id v5 = (void *)(a1 + 48);
    goto LABEL_9;
  }
  id v6 = v9;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __160__CPLEngineResourceDownloadQueue__downloadTaskForLocalResource_clientBundleID_options_proposedTaskIdentifier_didStartHandler_progressHandler_completionHandler___block_invoke_2;
  v9[3] = &unk_1E60AB750;
  void v9[4] = *(id *)(a1 + 56);
LABEL_9:
  void v6[5] = *v5;
  [v3 do:v6];
}

void __160__CPLEngineResourceDownloadQueue__downloadTaskForLocalResource_clientBundleID_options_proposedTaskIdentifier_didStartHandler_progressHandler_completionHandler___block_invoke_178(void *a1, void *a2)
{
  uint64_t v2 = a1[6];
  if (v2)
  {
    uint64_t v4 = a1[4];
    uint64_t v5 = [a2 error];
    id v6 = (id)v5;
    if (!v5) {
      uint64_t v5 = a1[5];
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v2, v4, v5);
  }
}

uint64_t __160__CPLEngineResourceDownloadQueue__downloadTaskForLocalResource_clientBundleID_options_proposedTaskIdentifier_didStartHandler_progressHandler_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  char v9 = 0;
  if (!_CPLSilentLogging)
  {
    uint64_t v4 = __CPLStorageOSLogDomain_7302();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = +[CPLResource descriptionForResourceType:](CPLResource, "descriptionForResourceType:", [*(id *)(a1 + 32) resourceType]);
      id v6 = [*(id *)(a1 + 32) itemScopedIdentifier];
      uint64_t v7 = [*(id *)(a1 + 32) _backgroundDownloadTaskIdentifier];
      *(_DWORD *)buf = 138412802;
      id v11 = v5;
      __int16 v12 = 2112;
      uint64_t v13 = v6;
      __int16 v14 = 2048;
      uint64_t v15 = v7;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEBUG, "Will retry background download for %@ %@ (%lu)", buf, 0x20u);
    }
  }
  return [*(id *)(a1 + 40) reenqueueBackgroundDownloadTaskForResource:*(void *)(a1 + 32) bumpRetryCount:0 didDiscard:&v9 error:a2];
}

uint64_t __160__CPLEngineResourceDownloadQueue__downloadTaskForLocalResource_clientBundleID_options_proposedTaskIdentifier_didStartHandler_progressHandler_completionHandler___block_invoke_175(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    uint64_t v4 = __CPLStorageOSLogDomain_7302();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = +[CPLResource descriptionForResourceType:](CPLResource, "descriptionForResourceType:", [*(id *)(a1 + 32) resourceType]);
      id v6 = [*(id *)(a1 + 32) itemScopedIdentifier];
      uint64_t v7 = [*(id *)(a1 + 32) _backgroundDownloadTaskIdentifier];
      int v9 = 138412802;
      uint64_t v10 = v5;
      __int16 v11 = 2112;
      __int16 v12 = v6;
      __int16 v13 = 2048;
      uint64_t v14 = v7;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEBUG, "Removing background download for %@ %@ (%lu) - no retry", (uint8_t *)&v9, 0x20u);
    }
  }
  return [*(id *)(a1 + 40) removeBackgroundDownloadTaskForResource:*(void *)(a1 + 32) error:a2];
}

uint64_t __160__CPLEngineResourceDownloadQueue__downloadTaskForLocalResource_clientBundleID_options_proposedTaskIdentifier_didStartHandler_progressHandler_completionHandler___block_invoke_176(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    uint64_t v4 = __CPLStorageOSLogDomain_7302();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = +[CPLResource descriptionForResourceType:](CPLResource, "descriptionForResourceType:", [*(id *)(a1 + 32) resourceType]);
      id v6 = [*(id *)(a1 + 32) itemScopedIdentifier];
      uint64_t v7 = [*(id *)(a1 + 32) _backgroundDownloadTaskIdentifier];
      int v9 = 138412802;
      uint64_t v10 = v5;
      __int16 v11 = 2112;
      __int16 v12 = v6;
      __int16 v13 = 2048;
      uint64_t v14 = v7;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEBUG, "Removing background download for %@ %@ (%lu) - success", (uint8_t *)&v9, 0x20u);
    }
  }
  return [*(id *)(a1 + 40) removeBackgroundDownloadTaskForResource:*(void *)(a1 + 32) error:a2];
}

- (id)downloadTaskForLocalResource:(id)a3 clientBundleID:(id)a4 options:(id)a5 proposedTaskIdentifier:(id)a6 didStartHandler:(id)a7 progressHandler:(id)a8 completionHandler:(id)a9
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v42 = a7;
  id v41 = a8;
  id v19 = a9;
  if (v17)
  {
    if (v18) {
      goto LABEL_3;
    }
  }
  else
  {
    id v17 = +[CPLResourceTransferTaskOptions defaultOptions];
    if (v18) {
      goto LABEL_3;
    }
  }
  id v31 = [MEMORY[0x1E4F29128] UUID];
  id v18 = [v31 UUIDString];

LABEL_3:
  downloadLocuint64_t k = self->_downloadLock;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __159__CPLEngineResourceDownloadQueue_downloadTaskForLocalResource_clientBundleID_options_proposedTaskIdentifier_didStartHandler_progressHandler_completionHandler___block_invoke;
  block[3] = &unk_1E60A5DD8;
  void block[4] = self;
  dispatch_async(downloadLock, block);
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __159__CPLEngineResourceDownloadQueue_downloadTaskForLocalResource_clientBundleID_options_proposedTaskIdentifier_didStartHandler_progressHandler_completionHandler___block_invoke_3;
  v43[3] = &unk_1E60A7960;
  void v43[4] = self;
  id v21 = v19;
  id v44 = v21;
  id v22 = (void *)MEMORY[0x1BA994060](v43);
  id v23 = [v15 identity];
  id v24 = [v23 fileURL];

  if (v24)
  {
    id v40 = v16;
    id v25 = [(CPLEngineStorage *)self engineStore];
    id v26 = [v25 engineLibrary];
    id v27 = [v26 systemMonitor];
    uint64_t v28 = [v27 diskPressureState];

    if (v28 == 2)
    {
      id v29 = +[CPLErrors cplErrorWithCode:1005 description:@"Disk space is very low"];
      BOOL v30 = [(CPLEngineResourceDownloadQueue *)self _failedTaskWithCompletionHandler:v22 error:v29 resource:v15 taskIdentifier:v18 options:v17];
      id v16 = v40;
      goto LABEL_23;
    }
    uint64_t v33 = [v15 itemScopedIdentifier];
    id v29 = [v33 scopeIdentifier];

    if (!v29)
    {
      id v35 = +[CPLErrors incorrectParametersErrorForParameter:@"itemScopedIdentifier"];
      BOOL v30 = [(CPLEngineResourceDownloadQueue *)self _failedTaskWithCompletionHandler:v22 error:v35 resource:v15 taskIdentifier:v18 options:v17];
      id v16 = v40;
LABEL_22:

      goto LABEL_23;
    }
    __int16 v34 = [(CPLEngineStorage *)self engineStore];
    id v35 = [v34 scopes];

    __int16 v36 = [v35 scopeWithIdentifier:v29];
    id v16 = v40;
    if (v36)
    {
      if (![v35 valueForFlag:0x40000 forScope:v36])
      {
        BOOL v30 = [(CPLEngineResourceDownloadQueue *)self _downloadTaskForLocalResource:v15 clientBundleID:v40 options:v17 proposedTaskIdentifier:v18 didStartHandler:v42 progressHandler:v41 completionHandler:v22];
        goto LABEL_21;
      }
      uint64_t v37 = +[CPLErrors cplErrorWithCode:1002, @"Feature for %@ is disabled", v29 description];
    }
    else
    {
      uint64_t v37 = +[CPLErrors invalidScopeErrorWithScopeIdentifier:v29];
    }
    __int16 v38 = (void *)v37;
    BOOL v30 = [(CPLEngineResourceDownloadQueue *)self _failedTaskWithCompletionHandler:v22 error:v37 resource:v15 taskIdentifier:v18 options:v17];

    id v16 = v40;
LABEL_21:

    goto LABEL_22;
  }
  if (!_CPLSilentLogging)
  {
    __int16 v32 = __CPLStorageOSLogDomain_7302();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v47 = v15;
      _os_log_impl(&dword_1B4CAC000, v32, OS_LOG_TYPE_ERROR, "Client asked to download %@ without specifying a destination URL", buf, 0xCu);
    }
  }
  id v29 = +[CPLErrors incorrectParametersErrorForParameter:@"identity.fileURL"];
  BOOL v30 = [(CPLEngineResourceDownloadQueue *)self _failedTaskWithCompletionHandler:v22 error:v29 resource:v15 taskIdentifier:v18 options:v17];
LABEL_23:

  return v30;
}

void __159__CPLEngineResourceDownloadQueue_downloadTaskForLocalResource_clientBundleID_options_proposedTaskIdentifier_didStartHandler_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  ++*(void *)(*(void *)(a1 + 32) + 104);
  uint64_t v2 = ++*(void *)(*(void *)(a1 + 32) + 112);
  dispatch_time_t v3 = dispatch_time(0, 5000000000);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __159__CPLEngineResourceDownloadQueue_downloadTaskForLocalResource_clientBundleID_options_proposedTaskIdentifier_didStartHandler_progressHandler_completionHandler___block_invoke_2;
  v6[3] = &unk_1E60A6598;
  v6[4] = v4;
  void v6[5] = v2;
  dispatch_after(v3, v5, v6);
}

void __159__CPLEngineResourceDownloadQueue_downloadTaskForLocalResource_clientBundleID_options_proposedTaskIdentifier_didStartHandler_progressHandler_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(NSObject **)(v7 + 40);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __159__CPLEngineResourceDownloadQueue_downloadTaskForLocalResource_clientBundleID_options_proposedTaskIdentifier_didStartHandler_progressHandler_completionHandler___block_invoke_4;
  block[3] = &unk_1E60A5DD8;
  void block[4] = v7;
  dispatch_async(v8, block);
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);
  }
}

uint64_t __159__CPLEngineResourceDownloadQueue_downloadTaskForLocalResource_clientBundleID_options_proposedTaskIdentifier_didStartHandler_progressHandler_completionHandler___block_invoke_4(uint64_t result)
{
  return result;
}

void __159__CPLEngineResourceDownloadQueue_downloadTaskForLocalResource_clientBundleID_options_proposedTaskIdentifier_didStartHandler_progressHandler_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1 == *(void *)(v2 + 112))
  {
    *(void *)(v2 + 120) = v1;
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 128);
    *(void *)(v5 + 128) = v4;

    *(void *)(*(void *)(a1 + 32) + 112) = 0;
  }
}

- (id)cloudResourceForLocalResource:(id *)a3 cloudRecord:(id *)a4 target:(id *)a5 shouldNotTrustCaches:(BOOL *)a6 allowUnsafeClientCache:(BOOL)a7 transportScopeMapping:(id)a8 error:(id *)a9
{
  BOOL v98 = a7;
  uint64_t v111 = *MEMORY[0x1E4F143B8];
  id v13 = a8;
  *a6 = 0;
  uint64_t v14 = [(CPLEngineStorage *)self engineStore];
  id v15 = [v14 scopes];

  id v16 = [*a3 identity];
  id v17 = [*a3 itemScopedIdentifier];
  id v18 = (void *)[v17 copy];

  if (!v18)
  {
    if (!_CPLSilentLogging)
    {
      id v19 = __CPLStorageOSLogDomain_7302();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        id v20 = *a3;
        *(_DWORD *)buf = 138412290;
        id v110 = v20;
        _os_log_impl(&dword_1B4CAC000, v19, OS_LOG_TYPE_ERROR, "Client is asking to download %@ but did not provide an item identifier", buf, 0xCu);
      }
    }
    if (a9)
    {
      *a9 = +[CPLErrors incorrectParametersErrorForParameter:@"itemScopedIdentifier"];
    }
  }
  uint64_t v21 = [v18 scopeIdentifier];
  v102 = (void *)v21;
  SEL v94 = a2;
  if (!v21)
  {
    if (!_CPLSilentLogging)
    {
      id v24 = __CPLStorageOSLogDomain_7302();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        id v25 = *a3;
        *(_DWORD *)buf = 138412290;
        id v110 = v25;
        _os_log_impl(&dword_1B4CAC000, v24, OS_LOG_TYPE_ERROR, "Client is asking to download %@ with an invalid scope identifier", buf, 0xCu);
      }
    }
    if (a9)
    {
      id v26 = +[CPLErrors incorrectParametersErrorForParameter:@"itemScopedIdentifier"];
LABEL_24:
      v103 = 0;
      int v23 = 0;
      *a9 = v26;
LABEL_26:
      uint64_t v97 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_27;
    }
LABEL_25:
    v103 = 0;
    int v23 = 0;
    goto LABEL_26;
  }
  if (!v18) {
    goto LABEL_25;
  }
  id v22 = [v15 scopeWithIdentifier:v21];
  if (!v22)
  {
    if (!_CPLSilentLogging)
    {
      id v27 = __CPLStorageOSLogDomain_7302();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        id v28 = *a3;
        *(_DWORD *)buf = 138412290;
        id v110 = v28;
        _os_log_impl(&dword_1B4CAC000, v27, OS_LOG_TYPE_ERROR, "Client is asking to download %@ but scope is unknown", buf, 0xCu);
      }
    }
    if (a9)
    {
      id v26 = +[CPLErrors invalidScopeErrorWithScopedIdentifier:v18];
      goto LABEL_24;
    }
    goto LABEL_25;
  }
  v103 = v22;
  uint64_t v97 = [v22 localIndex];
  int v23 = 1;
LABEL_27:
  uint64_t v29 = [v16 fingerPrint];
  uint64_t v30 = v29;
  if (v23 && !v29)
  {
    if (!_CPLSilentLogging)
    {
      id v31 = __CPLStorageOSLogDomain_7302();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        id v32 = *a3;
        *(_DWORD *)buf = 138412290;
        id v110 = v32;
        _os_log_impl(&dword_1B4CAC000, v31, OS_LOG_TYPE_ERROR, "Client asked to download %@ without specifying a finger print", buf, 0xCu);
      }
    }
    if (a9)
    {
      *a9 = +[CPLErrors incorrectParametersErrorForParameter:@"identity.fingerPrint"];
    }
    uint64_t v33 = [v16 fileURL];
    goto LABEL_44;
  }
  uint64_t v33 = [v16 fileURL];
  if (!v23)
  {
LABEL_44:
    id v39 = 0;
    id v40 = 0;
    id v41 = 0;
    id v42 = v102;
    goto LABEL_113;
  }
  id v90 = v33;
  v84 = self;
  __int16 v34 = [(CPLEngineStorage *)self engineStore];
  v91 = [v34 idMapping];
  v89 = v34;
  id v35 = [v34 transactionClientCacheView];
  uint64_t v36 = [*a3 resourceType];
  if (a4) {
    uint64_t v37 = &v108;
  }
  else {
    uint64_t v37 = 0;
  }
  if (a4) {
    id v108 = 0;
  }
  id v107 = 0;
  __int16 v38 = [v35 resourceOfType:v36 forRecordWithScopedIdentifier:v18 record:v37 error:&v107];
  v92 = v15;
  if (a4) {
    id v88 = v108;
  }
  else {
    id v88 = 0;
  }
  id v93 = v107;
  id v43 = (id)[v38 copy];

  BOOL v44 = 0;
  uint64_t v45 = 0;
  if (!v43 && v98)
  {
    if (![v93 isCPLErrorWithCode:25])
    {
      BOOL v44 = 0;
      uint64_t v45 = 0;
      goto LABEL_61;
    }
    buf[0] = 0;
    uint64_t v45 = [v91 cloudScopedIdentifierForLocalScopedIdentifier:v18 isFinal:buf];
    BOOL v44 = v45 == 0;
    if (v45 || ([v92 hasFinishedInitialSyncForScope:v103] & 1) == 0)
    {
      id v43 = (id)[*a3 copy];
      *a6 = 1;
    }
    else
    {
      BOOL v44 = 0;
      id v43 = 0;
    }
  }
  if (v43)
  {
    v99 = (void *)v45;
    BOOL v87 = v44;
    id v83 = v13;
    id v85 = (id)v30;
    id v46 = [v43 identity];
    uint64_t v47 = [v46 fingerPrint];

    if (v30 && v47)
    {
      char v48 = [v85 isEqual:v47];

      if ((v48 & 1) == 0)
      {
LABEL_58:
        if (a9)
        {
          id v49 = *a3;
          BOOL v50 = [v43 identity];
          id v51 = [v50 fingerPrint];
          *a9 = +[CPLErrors cplErrorWithCode:27, @"%@ is stale (client cache fingerprint is %@)", v49, v51 description];
        }
        id v39 = 0;
        int v52 = 0;
        id v40 = 0;
        id v13 = v83;
        goto LABEL_95;
      }
    }
    else
    {

      if (v30 | v47) {
        goto LABEL_58;
      }
    }
    objc_msgSend(v43, "_setBackgroundDownloadTaskIdentifier:", objc_msgSend(*a3, "_backgroundDownloadTaskIdentifier"));
    id v43 = v43;
    *a3 = v43;
    id v53 = [v43 identity];
    [v53 setFileURL:v90];

    uint64_t v54 = (uint64_t)v99;
    if (!v99)
    {
      buf[0] = 0;
      uint64_t v54 = [v91 cloudScopedIdentifierForLocalScopedIdentifier:v18 isFinal:buf];
      if (!v54)
      {
        uint64_t v54 = [v18 copy];
        *a6 = 1;
      }
    }
    id v55 = [v89 cloudCache];
    uint64_t v56 = [*a3 resourceType];
    if (a4) {
      char v57 = &v106;
    }
    else {
      char v57 = 0;
    }
    if (a4) {
      id v106 = 0;
    }
    id v105 = 0;
    v99 = (void *)v54;
    id v40 = [v55 resourceOfType:v56 forRecordWithScopedIdentifier:v54 record:v57 target:a5 error:&v105];
    if (a4) {
      id v39 = v106;
    }
    else {
      id v39 = 0;
    }
    id v58 = v105;

    v96 = v58;
    if (!v40)
    {
      if (![v58 isCPLErrorWithCode:25]
        || (id v40 = (void *)[*a3 copy], objc_msgSend(v40, "setItemScopedIdentifier:", v99), !v40))
      {
        if (a9)
        {
          id v40 = 0;
          int v52 = 0;
          *a9 = v58;
          goto LABEL_93;
        }
        id v40 = 0;
LABEL_92:
        int v52 = 0;
        goto LABEL_93;
      }
    }
    id v86 = v85;
    id v59 = [v40 identity];
    uint64_t v60 = [v59 fingerPrint];

    if (v30 && v60)
    {
      char v81 = [v86 isEqual:v60];

      if ((v81 & 1) == 0) {
        goto LABEL_80;
      }
    }
    else
    {

      if (v30 | v60)
      {
LABEL_80:
        if (a9)
        {
          id v82 = *a3;
          id v61 = [v40 identity];
          char v62 = [v61 fingerPrint];
          *a9 = +[CPLErrors cplErrorWithCode:27, @"%@ is stale (cloud cache fingerprint is %@)", v82, v62 description];
        }
        goto LABEL_92;
      }
    }
    v63 = [v40 identity];
    [v63 setFileURL:v90];

    int v52 = 1;
    if (a4)
    {
      id v13 = v83;
      if (!v39 && v88)
      {
        id v39 = [v88 translateToCloudRecordUsingIDMapping:v91];
      }
      goto LABEL_94;
    }
LABEL_93:
    id v13 = v83;
LABEL_94:

    goto LABEL_95;
  }
LABEL_61:
  v99 = (void *)v45;
  BOOL v87 = v44;
  id v43 = 0;
  id v39 = 0;
  int v52 = 0;
  id v40 = 0;
  if (a9) {
    *a9 = v93;
  }
LABEL_95:

  if (v52 && !v40)
  {
    if (!_CPLSilentLogging)
    {
      v71 = __CPLStorageOSLogDomain_7302();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B4CAC000, v71, OS_LOG_TYPE_ERROR, "We should have a cloud resource here", buf, 2u);
      }
    }
    char v72 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v73 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineResourceDownloadQueue.m"];
    v74 = @"We should have a cloud resource here";
    v75 = v72;
    SEL v76 = v94;
    v77 = v84;
    v78 = v73;
    uint64_t v79 = 585;
    goto LABEL_121;
  }
  if (v52)
  {
    if (v103)
    {
      uint64_t v64 = [v103 cloudIndex];
      __int16 v65 = [*a3 itemScopedIdentifier];
      [v65 setScopeIndex:v97];

      id v66 = [v40 itemScopedIdentifier];
      [v66 setScopeIndex:v64];

      uint64_t v67 = [v40 itemScopedIdentifier];
      v100 = [v67 scopeIdentifier];

      id v104 = 0;
      LODWORD(v67) = [v13 addTransportScopeForScope:v103 scopes:v92 allowsTentativeTransportScope:v87 useStagingScopeIfNecessary:1 error:&v104];
      id v68 = v104;
      if (v67)
      {
        objc_msgSend(v40, "_setBackgroundDownloadTaskIdentifier:", objc_msgSend(*a3, "_backgroundDownloadTaskIdentifier"));
        id v42 = v102;
        if (a4) {
          *a4 = v39;
        }
        id v41 = v40;
      }
      else
      {
        if (!_CPLSilentLogging)
        {
          v69 = __CPLStorageOSLogDomain_7302();
          if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v110 = v100;
            _os_log_impl(&dword_1B4CAC000, v69, OS_LOG_TYPE_ERROR, "Can't find a transport scope for %@", buf, 0xCu);
          }
        }
        id v41 = 0;
        if (a9) {
          *a9 = v68;
        }
        id v42 = v102;
      }

      id v15 = v92;
      goto LABEL_112;
    }
    if (!_CPLSilentLogging)
    {
      v80 = __CPLStorageOSLogDomain_7302();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B4CAC000, v80, OS_LOG_TYPE_ERROR, "We should have a scope here", buf, 2u);
      }
    }
    char v72 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v73 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineResourceDownloadQueue.m"];
    v74 = @"We should have a scope here";
    v75 = v72;
    SEL v76 = v94;
    v77 = v84;
    v78 = v73;
    uint64_t v79 = 588;
LABEL_121:
    [v75 handleFailureInMethod:v76 object:v77 file:v78 lineNumber:v79 description:v74];

    abort();
  }
  id v41 = 0;
  id v15 = v92;
  id v42 = v102;
LABEL_112:
  uint64_t v33 = v90;
LABEL_113:

  return v41;
}

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6
{
  uint64_t v10 = [(CPLEngineStorage *)self platformObject];
  LOBYTE(a6) = [v10 deleteRecordsForScopeIndex:a3 maxCount:a4 deletedCount:a5 error:a6];

  return (char)a6;
}

- (unint64_t)scopeType
{
  return 1;
}

- (CPLEngineResourceDownloadQueue)initWithEngineStore:(id)a3 name:(id)a4
{
  v114[17] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v110.receiver = self;
  v110.super_class = (Class)CPLEngineResourceDownloadQueue;
  id v82 = [(CPLEngineStorage *)&v110 initWithEngineStore:v7 name:v8];
  if (v82)
  {
    SEL v58 = a2;
    id v59 = v8;
    id v60 = v7;
    uint64_t v9 = CPLCopyDefaultSerialQueueAttributes();
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.cpl.resourceDownloadQueue", v9);
    downloadLocuint64_t k = v82->_downloadLock;
    v82->_downloadLocuint64_t k = (OS_dispatch_queue *)v10;

    uint64_t v73 = [[CPLActiveDownloadQueue alloc] initWithName:@"High Priority" type:1 FIFOQueue:0 maximumBatchSize:10485760 maximumConcurrentTransportTasks:4 coalescingInterval:0 groupConstructor:&__block_literal_global_7422];
    v78 = [[CPLActiveDownloadQueue alloc] initWithName:@"Widget High Priority" type:2 FIFOQueue:0 maximumBatchSize:10485760 maximumConcurrentTransportTasks:4 coalescingInterval:0 groupConstructor:&__block_literal_global_7];
    char v81 = [[CPLActiveDownloadQueue alloc] initWithName:@"Thumbnails" type:1 FIFOQueue:0 maximumBatchSize:10485760 maximumConcurrentTransportTasks:2 coalescingInterval:500000000 groupConstructor:&__block_literal_global_12_7425];
    char v72 = [[CPLActiveDownloadQueue alloc] initWithName:@"Grid High Priority" type:1 FIFOQueue:0 maximumBatchSize:10485760 maximumConcurrentTransportTasks:4 coalescingInterval:0 groupConstructor:&__block_literal_global_17];
    v80 = [[CPLActiveDownloadQueue alloc] initWithName:@"1-Up High Priority" type:1 FIFOQueue:0 maximumBatchSize:10485760 maximumConcurrentTransportTasks:4 coalescingInterval:0 groupConstructor:&__block_literal_global_22];
    v77 = [[CPLActiveDownloadQueue alloc] initWithName:@"Wallpaper Shuffle High Priority" type:1 FIFOQueue:0 maximumBatchSize:10485760 maximumConcurrentTransportTasks:4 coalescingInterval:0 groupConstructor:&__block_literal_global_27];
    uint64_t v79 = [[CPLActiveDownloadQueue alloc] initWithName:@"Edit High Priority" type:1 FIFOQueue:0 maximumBatchSize:10485760 maximumConcurrentTransportTasks:4 coalescingInterval:0 groupConstructor:&__block_literal_global_32];
    id v61 = [[CPLActiveDownloadQueue alloc] initWithName:@"Memory Playback High Priority" type:1 FIFOQueue:0 maximumBatchSize:10485760 maximumConcurrentTransportTasks:4 coalescingInterval:0 groupConstructor:&__block_literal_global_37_7431];
    char v62 = [[CPLActiveDownloadQueue alloc] initWithName:@"Memory Preload High Priority" type:1 FIFOQueue:0 maximumBatchSize:10485760 maximumConcurrentTransportTasks:4 coalescingInterval:0 groupConstructor:&__block_literal_global_42];
    v75 = [[CPLActiveDownloadQueue alloc] initWithName:@"Memory Prefetch High Priority" type:2 FIFOQueue:1 maximumBatchSize:10485760 maximumConcurrentTransportTasks:1 coalescingInterval:1000000000 groupConstructor:&__block_literal_global_47_7434];
    uint64_t v64 = [[CPLActiveDownloadQueue alloc] initWithName:@"Memory Inline Playback High Priority" type:2 FIFOQueue:0 maximumBatchSize:10485760 maximumConcurrentTransportTasks:4 coalescingInterval:0 groupConstructor:&__block_literal_global_52];
    __int16 v12 = [[CPLActiveDownloadQueue alloc] initWithName:@"Memory Inline Preload High Priority" type:2 FIFOQueue:0 maximumBatchSize:10485760 maximumConcurrentTransportTasks:4 coalescingInterval:0 groupConstructor:&__block_literal_global_57_7437];
    id v13 = [[CPLActiveDownloadQueue alloc] initWithName:@"Analysis Download High Priority" type:2 FIFOQueue:1 maximumBatchSize:10485760 maximumConcurrentTransportTasks:4 coalescingInterval:1000000000 groupConstructor:&__block_literal_global_62];
    uint64_t v14 = [[CPLActiveDownloadQueue alloc] initWithName:@"Watch Sync Download High Priority" type:2 FIFOQueue:1 maximumBatchSize:10485760 maximumConcurrentTransportTasks:1 coalescingInterval:1000000000 groupConstructor:&__block_literal_global_67];
    id v15 = [[CPLActiveDownloadQueue alloc] initWithName:@"Wallpaper Suggestion High Priority" type:2 FIFOQueue:1 maximumBatchSize:10485760 maximumConcurrentTransportTasks:1 coalescingInterval:1000000000 groupConstructor:&__block_literal_global_72];
    id v16 = [[CPLActiveDownloadQueue alloc] initWithName:@"Wallpaper Live Photo High Priority" type:2 FIFOQueue:1 maximumBatchSize:10485760 maximumConcurrentTransportTasks:1 coalescingInterval:1000000000 groupConstructor:&__block_literal_global_77];
    id v17 = [[CPLActiveDownloadQueue alloc] initWithName:@"Background Edit Suggestion High Priority" type:2 FIFOQueue:1 maximumBatchSize:10485760 maximumConcurrentTransportTasks:1 coalescingInterval:1000000000 groupConstructor:&__block_literal_global_82];
    v114[0] = v73;
    v114[1] = v81;
    v114[2] = v72;
    v114[3] = v80;
    v114[4] = v79;
    v114[5] = v61;
    v114[6] = v62;
    v114[7] = v64;
    v114[8] = v12;
    v114[9] = v78;
    v114[10] = v75;
    v114[11] = v13;
    v114[12] = v14;
    v114[13] = v15;
    v114[14] = v77;
    v114[15] = v16;
    v114[16] = v17;
    uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v114 count:17];
    allHighPriorityQueues = v82->_allHighPriorityQueues;
    v82->_allHighPriorityQueues = (NSArray *)v18;

    v113[0] = v75;
    v113[1] = v78;
    v113[2] = v13;
    v113[3] = v14;
    v113[4] = v15;
    v113[5] = v16;
    v113[6] = v17;
    v113[7] = v77;
    v113[8] = v12;
    v113[9] = v64;
    uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v113 count:10];
    bestCancellableHighPriorityQueues = v82->_bestCancellableHighPriorityQueues;
    v82->_bestCancellableHighPriorityQueues = (NSArray *)v20;

    v92[0] = MEMORY[0x1E4F143A8];
    v92[1] = 3221225472;
    v92[2] = __59__CPLEngineResourceDownloadQueue_initWithEngineStore_name___block_invoke_18;
    v92[3] = &unk_1E60A7910;
    id v93 = v78;
    SEL v94 = v81;
    v95 = v72;
    v96 = v80;
    uint64_t v97 = v79;
    BOOL v98 = v77;
    v99 = v61;
    v100 = v62;
    v101 = v75;
    v102 = v64;
    v103 = v12;
    id v104 = v13;
    id v105 = v15;
    id v106 = v16;
    id v107 = v14;
    id v108 = v17;
    v109 = v73;
    v74 = v73;
    v71 = v17;
    id v70 = v14;
    v69 = v16;
    id v68 = v15;
    uint64_t v67 = v13;
    id v66 = v12;
    __int16 v65 = v64;
    SEL v76 = v75;
    v63 = v62;
    id v22 = v61;
    int v23 = v77;
    id v24 = v79;
    id v25 = v80;
    id v26 = v72;
    id v27 = v81;
    id v28 = v78;
    uint64_t v29 = MEMORY[0x1BA994060](v92);
    id highPriorityQueuePerResourceTypeAndTransferIntent = v82->_highPriorityQueuePerResourceTypeAndTransferIntent;
    v82->_id highPriorityQueuePerResourceTypeAndTransferIntent = (id)v29;

    id v31 = [[CPLActiveDownloadQueue alloc] initWithName:@"Derivatives Low Priority" type:0 FIFOQueue:1 maximumBatchSize:104857600 maximumConcurrentTransportTasks:3 coalescingInterval:1000000000 groupConstructor:&__block_literal_global_90_7445];
    id v32 = [[CPLActiveDownloadQueue alloc] initWithName:@"Thumbmails Low Priority" type:0 FIFOQueue:1 maximumBatchSize:104857600 maximumConcurrentTransportTasks:3 coalescingInterval:1000000000 groupConstructor:&__block_literal_global_95];
    uint64_t v33 = [[CPLActiveDownloadQueue alloc] initWithName:@"Non-Derivatives Low Priority" type:0 FIFOQueue:1 maximumBatchSize:104857600 maximumConcurrentTransportTasks:3 coalescingInterval:1000000000 groupConstructor:&__block_literal_global_100];
    __int16 v34 = [[CPLActiveDownloadQueue alloc] initWithName:@"Keep-Originals Low Priority" type:0 FIFOQueue:1 maximumBatchSize:104857600 maximumConcurrentTransportTasks:3 coalescingInterval:1000000000 groupConstructor:&__block_literal_global_105];
    id v35 = [[CPLActiveDownloadQueue alloc] initWithName:@"Optimize-Originals Low Priority" type:0 FIFOQueue:1 maximumBatchSize:104857600 maximumConcurrentTransportTasks:3 coalescingInterval:1000000000 groupConstructor:&__block_literal_global_110];
    uint64_t v36 = [[CPLActiveDownloadQueue alloc] initWithName:@"Widget Low Priority" type:0 FIFOQueue:1 maximumBatchSize:104857600 maximumConcurrentTransportTasks:3 coalescingInterval:1000000000 groupConstructor:&__block_literal_global_115];
    uint64_t v37 = [[CPLActiveDownloadQueue alloc] initWithName:@"Recovery Low Priority" type:0 FIFOQueue:1 maximumBatchSize:104857600 maximumConcurrentTransportTasks:3 coalescingInterval:1000000000 groupConstructor:&__block_literal_global_120];
    v112[0] = v32;
    v112[1] = v34;
    v112[2] = v35;
    v112[3] = v36;
    v112[4] = v33;
    v112[5] = v37;
    v112[6] = v31;
    uint64_t v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v112 count:7];
    allLowPriorityQueues = v82->_allLowPriorityQueues;
    v82->_allLowPriorityQueues = (NSArray *)v38;

    v111[0] = v32;
    v111[1] = v31;
    v111[2] = v37;
    v111[3] = v33;
    v111[4] = v36;
    v111[5] = v35;
    v111[6] = v34;
    uint64_t v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v111 count:7];
    bestCancellableLowPriorityQueues = v82->_bestCancellableLowPriorityQueues;
    v82->_bestCancellableLowPriorityQueues = (NSArray *)v40;

    uint64_t v42 = [(NSArray *)v82->_bestCancellableLowPriorityQueues count];
    if (v42 != [(NSArray *)v82->_allLowPriorityQueues count])
    {
      if (!_CPLSilentLogging)
      {
        id v55 = __CPLStorageOSLogDomain_7302();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B4CAC000, v55, OS_LOG_TYPE_ERROR, "Incorrect array of active download queues", buf, 2u);
        }
      }
      uint64_t v56 = [MEMORY[0x1E4F28B00] currentHandler];
      char v57 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineResourceDownloadQueue.m"];
      [v56 handleFailureInMethod:v58 object:v82 file:v57 lineNumber:410 description:@"Incorrect array of active download queues"];

      abort();
    }
    v83[0] = MEMORY[0x1E4F143A8];
    v83[1] = 3221225472;
    v83[2] = __59__CPLEngineResourceDownloadQueue_initWithEngineStore_name___block_invoke_127;
    v83[3] = &unk_1E60A7938;
    v84 = v36;
    id v85 = v37;
    id v86 = v32;
    BOOL v87 = v34;
    id v88 = v35;
    v89 = v33;
    id v90 = v31;
    id v43 = v31;
    BOOL v44 = v33;
    uint64_t v45 = v35;
    id v46 = v34;
    uint64_t v47 = v32;
    char v48 = v37;
    id v49 = v36;
    uint64_t v50 = MEMORY[0x1BA994060](v83);
    id lowPriorityQueuePerResourceTypeAndTransferIntent = v82->_lowPriorityQueuePerResourceTypeAndTransferIntent;
    v82->_id lowPriorityQueuePerResourceTypeAndTransferIntent = (id)v50;

    uint64_t v52 = [(NSArray *)v82->_allHighPriorityQueues arrayByAddingObjectsFromArray:v82->_allLowPriorityQueues];
    allQueues = v82->_allQueues;
    v82->_allQueues = (NSArray *)v52;

    id v8 = v59;
    id v7 = v60;
  }

  return v82;
}

id *__59__CPLEngineResourceDownloadQueue_initWithEngineStore_name___block_invoke_18(id *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  switch([v5 intent])
  {
    case 0:
    case 1:
    case 2:
    case 4:
    case 5:
      id v6 = a1 + 20;
      if (a2 == 5) {
        id v6 = a1 + 5;
      }
      goto LABEL_25;
    case 3:
      uint64_t v7 = [v5 priority];
      if (v7 == 2)
      {
        id v6 = a1 + 12;
      }
      else if (v7 == 1)
      {
        id v6 = a1 + 11;
      }
      else if (v7)
      {
LABEL_9:
        uint64_t v8 = [v5 priority];
        if ((unint64_t)(v8 - 1) >= 2)
        {
          if (v8) {
LABEL_24:
          }
            id v6 = a1 + 15;
          else {
            id v6 = a1 + 13;
          }
        }
        else
        {
          id v6 = a1 + 14;
        }
      }
      else
      {
        id v6 = a1 + 10;
      }
LABEL_25:
      a1 = (id *)*v6;
LABEL_26:

      return a1;
    case 6:
      id v6 = a1 + 4;
      goto LABEL_25;
    case 7:
      id v6 = a1 + 5;
      if (a2 != 5) {
        id v6 = a1 + 6;
      }
      goto LABEL_25;
    case 8:
      id v6 = a1 + 7;
      goto LABEL_25;
    case 9:
      id v6 = a1 + 8;
      goto LABEL_25;
    case 10:
      goto LABEL_24;
    case 11:
      id v6 = a1 + 18;
      goto LABEL_25;
    case 12:
      id v6 = a1 + 16;
      goto LABEL_25;
    case 13:
      id v6 = a1 + 9;
      goto LABEL_25;
    case 14:
      id v6 = a1 + 17;
      goto LABEL_25;
    case 15:
      id v6 = a1 + 19;
      goto LABEL_25;
    case 16:
      goto LABEL_9;
    default:
      goto LABEL_26;
  }
}

id __59__CPLEngineResourceDownloadQueue_initWithEngineStore_name___block_invoke_127(id *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [v5 intent];
  if (v6 == 4)
  {
    uint64_t v7 = a1 + 5;
  }
  else if (v6 == 6)
  {
    uint64_t v7 = a1 + 4;
  }
  else if (a2 == 5)
  {
    uint64_t v7 = a1 + 6;
  }
  else if (+[CPLResource isNonDerivativeResourceType:a2])
  {
    if ([v5 intent] == 2)
    {
      uint64_t v7 = a1 + 7;
    }
    else
    {
      uint64_t v8 = [v5 intent];
      uint64_t v7 = a1 + 9;
      if (v8 == 5) {
        uint64_t v7 = a1 + 8;
      }
    }
  }
  else
  {
    uint64_t v7 = a1 + 10;
  }
  id v9 = *v7;

  return v9;
}

uint64_t __59__CPLEngineResourceDownloadQueue_initWithEngineStore_name___block_invoke_25(uint64_t a1, void *a2)
{
  return [a2 createGroupForDownloadWithIntent:4 priority:2];
}

uint64_t __59__CPLEngineResourceDownloadQueue_initWithEngineStore_name___block_invoke_24(uint64_t a1, void *a2)
{
  return [a2 createGroupForDownloadWithIntent:6 priority:2];
}

uint64_t __59__CPLEngineResourceDownloadQueue_initWithEngineStore_name___block_invoke_23(uint64_t a1, void *a2)
{
  return [a2 createGroupForDownloadWithIntent:5 priority:2];
}

uint64_t __59__CPLEngineResourceDownloadQueue_initWithEngineStore_name___block_invoke_22(uint64_t a1, void *a2)
{
  return [a2 createGroupForDownloadWithIntent:2 priority:2];
}

uint64_t __59__CPLEngineResourceDownloadQueue_initWithEngineStore_name___block_invoke_21(uint64_t a1, void *a2)
{
  return [a2 createGroupForDownloadWithIntent:1 priority:2];
}

uint64_t __59__CPLEngineResourceDownloadQueue_initWithEngineStore_name___block_invoke_20(uint64_t a1, void *a2)
{
  return [a2 createGroupForThumbnailPrefetch];
}

uint64_t __59__CPLEngineResourceDownloadQueue_initWithEngineStore_name___block_invoke_19(uint64_t a1, void *a2)
{
  return [a2 createGroupForDownloadWithIntent:0 priority:2];
}

uint64_t __59__CPLEngineResourceDownloadQueue_initWithEngineStore_name___block_invoke_17(uint64_t a1, void *a2)
{
  return [a2 createGroupForDownloadWithIntent:15 priority:0];
}

uint64_t __59__CPLEngineResourceDownloadQueue_initWithEngineStore_name___block_invoke_16(uint64_t a1, void *a2)
{
  return [a2 createGroupForDownloadWithIntent:14 priority:0];
}

uint64_t __59__CPLEngineResourceDownloadQueue_initWithEngineStore_name___block_invoke_15(uint64_t a1, void *a2)
{
  return [a2 createGroupForDownloadWithIntent:12 priority:0];
}

uint64_t __59__CPLEngineResourceDownloadQueue_initWithEngineStore_name___block_invoke_14(uint64_t a1, void *a2)
{
  return [a2 createGroupForDownloadWithIntent:11 priority:0];
}

uint64_t __59__CPLEngineResourceDownloadQueue_initWithEngineStore_name___block_invoke_13(uint64_t a1, void *a2)
{
  return [a2 createGroupForDownloadWithIntent:10 priority:0];
}

uint64_t __59__CPLEngineResourceDownloadQueue_initWithEngineStore_name___block_invoke_12(uint64_t a1, void *a2)
{
  return [a2 createGroupForDownloadWithIntent:16 priority:1];
}

uint64_t __59__CPLEngineResourceDownloadQueue_initWithEngineStore_name___block_invoke_11(uint64_t a1, void *a2)
{
  return [a2 createGroupForDownloadWithIntent:16 priority:0];
}

uint64_t __59__CPLEngineResourceDownloadQueue_initWithEngineStore_name___block_invoke_10(uint64_t a1, void *a2)
{
  return [a2 createGroupForDownloadWithIntent:3 priority:2];
}

uint64_t __59__CPLEngineResourceDownloadQueue_initWithEngineStore_name___block_invoke_9(uint64_t a1, void *a2)
{
  return [a2 createGroupForDownloadWithIntent:3 priority:1];
}

uint64_t __59__CPLEngineResourceDownloadQueue_initWithEngineStore_name___block_invoke_8(uint64_t a1, void *a2)
{
  return [a2 createGroupForDownloadWithIntent:3 priority:0];
}

uint64_t __59__CPLEngineResourceDownloadQueue_initWithEngineStore_name___block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 createGroupForDownloadWithIntent:9 priority:0];
}

uint64_t __59__CPLEngineResourceDownloadQueue_initWithEngineStore_name___block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 createGroupForDownloadWithIntent:13 priority:0];
}

uint64_t __59__CPLEngineResourceDownloadQueue_initWithEngineStore_name___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 createGroupForDownloadWithIntent:8 priority:0];
}

uint64_t __59__CPLEngineResourceDownloadQueue_initWithEngineStore_name___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 createGroupForDownloadWithIntent:7 priority:0];
}

uint64_t __59__CPLEngineResourceDownloadQueue_initWithEngineStore_name___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 createGroupForThumbnailsDownload];
}

uint64_t __59__CPLEngineResourceDownloadQueue_initWithEngineStore_name___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 createGroupForDownloadWithIntent:6 priority:0];
}

uint64_t __59__CPLEngineResourceDownloadQueue_initWithEngineStore_name___block_invoke(uint64_t a1, void *a2)
{
  return [a2 createGroupForDownloadWithIntent:0 priority:0];
}

+ (BOOL)shouldRetryDownloadOnError:(id)a3
{
  id v3 = a3;
  if (([v3 isCPLErrorWithCode:25] & 1) != 0
    || ([v3 isCPLErrorWithCode:26] & 1) != 0
    || ([v3 isCPLErrorWithCode:27] & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    int v4 = [v3 isCPLErrorWithCode:51] ^ 1;
  }

  return v4;
}

@end