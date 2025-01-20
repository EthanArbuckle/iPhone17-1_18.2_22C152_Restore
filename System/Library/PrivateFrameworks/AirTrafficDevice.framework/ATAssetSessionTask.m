@interface ATAssetSessionTask
- (ATAssetLinkController)assetLinkController;
- (ATAssetSessionTask)init;
- (ATAssetSessionTask)initWithAssets:(id)a3;
- (ATAssetSessionTask)initWithDataClass:(id)a3;
- (BOOL)retryUntilFinished;
- (NSPredicate)filterPredicate;
- (NSString)debugDescription;
- (id)_initWithDataClass:(id)a3 assets:(id)a4;
- (id)remainingAssets;
- (id)sessionGroupingKey;
- (id)shouldRetryAssetBlock;
- (unint64_t)failedAssetsCount;
- (void)_finishAsset:(id)a3 withError:(id)a4;
- (void)assetLinkController:(id)a3 didFinishAsset:(id)a4;
- (void)cancel;
- (void)cancelAllAssets;
- (void)resume;
- (void)setAssetLinkController:(id)a3;
- (void)setFilterPredicate:(id)a3;
- (void)setRetryUntilFinished:(BOOL)a3;
- (void)setShouldRetryAssetBlock:(id)a3;
- (void)start;
- (void)suspend;
@end

@implementation ATAssetSessionTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetLinkController, 0);
  objc_storeStrong(&self->_shouldRetryAssetBlock, 0);
  objc_storeStrong((id *)&self->_filterPredicate, 0);
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_currentAssets, 0);
  objc_storeStrong((id *)&self->_failedAssets, 0);

  objc_storeStrong((id *)&self->_remainingAssets, 0);
}

- (unint64_t)failedAssetsCount
{
  return self->_failedAssetsCount;
}

- (void)setRetryUntilFinished:(BOOL)a3
{
  self->_retryUntilFinished = a3;
}

- (BOOL)retryUntilFinished
{
  return self->_retryUntilFinished;
}

- (void)setAssetLinkController:(id)a3
{
}

- (ATAssetLinkController)assetLinkController
{
  return self->_assetLinkController;
}

- (void)setShouldRetryAssetBlock:(id)a3
{
}

- (id)shouldRetryAssetBlock
{
  return self->_shouldRetryAssetBlock;
}

- (void)setFilterPredicate:(id)a3
{
}

- (NSPredicate)filterPredicate
{
  return self->_filterPredicate;
}

- (void)_finishAsset:(id)a3 withError:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  remainingAssets = self->_remainingAssets;
  id v8 = a4;
  [(NSMutableOrderedSet *)remainingAssets removeObject:v6];
  if (!v8)
  {
    v13 = [(ATSessionTask *)self totalBytesTransferred];
    uint64_t v14 = [v13 unsignedLongLongValue];
    uint64_t v15 = [v6 totalBytes] + v14;

    v11 = [NSNumber numberWithUnsignedLongLong:v15];
    [(ATSessionTask *)self setTotalBytesTransferred:v11];
LABEL_7:

    goto LABEL_8;
  }
  uint64_t v9 = [(NSMutableSet *)self->_failedAssets count];
  [(NSMutableSet *)self->_failedAssets addObject:v6];
  if (v9 != [(NSMutableSet *)self->_failedAssets count])
  {
    v10 = [(ATSessionTask *)self recentlyFailedAssets];
    v11 = (void *)[v10 mutableCopy];

    unint64_t recentFailedArrayIndex = self->_recentFailedArrayIndex;
    if (recentFailedArrayIndex >= 5)
    {
      unint64_t recentFailedArrayIndex = 0;
      self->_unint64_t recentFailedArrayIndex = 0;
    }
    [v11 setObject:v6 atIndexedSubscript:recentFailedArrayIndex];
    ++self->_recentFailedArrayIndex;
    [(ATSessionTask *)self setRecentlyFailedAssets:v11];
    goto LABEL_7;
  }
LABEL_8:
  [v6 setError:v8];
  v16 = +[ATClientController sharedInstance];
  v17 = [v6 dataclass];
  v18 = [v16 clientForDataclass:v17];

  v19 = [v8 userInfo];

  v20 = [v19 objectForKey:@"ATLegacyAssetLinkErrorIsVisibleKey"];

  if (v20 && [v20 BOOLValue]) {
    ++self->_failedAssetsCount;
  }
  [(ATSessionTask *)self setCompletedItemCount:[(ATSessionTask *)self totalItemCount]- ([(NSMutableOrderedSet *)self->_remainingAssets count]+ [(NSMutableSet *)self->_failedAssets count])];
  [(ATSessionTask *)self setProgress:(float)((float)[(ATSessionTask *)self completedItemCount]/ (float)[(ATSessionTask *)self totalItemCount])];
  v21 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v22 = [(ATSessionTask *)self completedItemCount];
    unint64_t v23 = [(ATSessionTask *)self totalItemCount];
    unint64_t failedAssetsCount = self->_failedAssetsCount;
    [(ATSessionTask *)self totalBytesTransferred];
    id v46 = v6;
    v25 = v20;
    v27 = v26 = v18;
    v28 = [(ATSessionTask *)self totalBytesToTransfer];
    *(_DWORD *)buf = 138544642;
    v50 = self;
    __int16 v51 = 2048;
    *(void *)v52 = v22;
    *(_WORD *)&v52[8] = 2048;
    *(void *)&v52[10] = v23;
    __int16 v53 = 2048;
    unint64_t v54 = failedAssetsCount;
    __int16 v55 = 2112;
    v56 = v27;
    __int16 v57 = 2112;
    v58 = v28;
    _os_log_impl(&dword_1D9A2D000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ Completed %lu/%lu assets (%lu failed, %@/%@ bytes transferred)", buf, 0x3Eu);

    v18 = v26;
    v20 = v25;
    id v6 = v46;
  }

  if ([(NSMutableOrderedSet *)self->_remainingAssets count])
  {
    unint64_t v29 = [(NSMutableOrderedSet *)self->_remainingAssets count];
    v30 = _ATLogCategoryFramework();
    BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
    if (v29 > 5)
    {
      if (v31)
      {
        int v44 = [(NSMutableOrderedSet *)self->_remainingAssets count];
        *(_DWORD *)buf = 138543618;
        v50 = self;
        __int16 v51 = 1024;
        *(_DWORD *)v52 = v44;
        v34 = "%{public}@ %d assets remaining.";
        v35 = v30;
        uint32_t v36 = 18;
        goto LABEL_25;
      }
    }
    else if (v31)
    {
      int v32 = [(NSMutableOrderedSet *)self->_remainingAssets count];
      v33 = self->_remainingAssets;
      *(_DWORD *)buf = 138543874;
      v50 = self;
      __int16 v51 = 1024;
      *(_DWORD *)v52 = v32;
      *(_WORD *)&v52[4] = 2114;
      *(void *)&v52[6] = v33;
      v34 = "%{public}@ %d assets remaining: %{public}@";
      v35 = v30;
      uint32_t v36 = 28;
LABEL_25:
      _os_log_impl(&dword_1D9A2D000, v35, OS_LOG_TYPE_DEFAULT, v34, buf, v36);
    }

    goto LABEL_27;
  }
  if (objc_opt_respondsToSelector())
  {
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __45__ATAssetSessionTask__finishAsset_withError___block_invoke;
    v47[3] = &unk_1E6B88B40;
    id v48 = v18;
    dispatch_client_async(v48, v47);
  }
  v37 = +[ATClientController sharedInstance];
  v38 = [v37 queueForClient:v18];
  dispatch_barrier_sync(v38, &__block_literal_global_2958);

  if (self->_retryUntilFinished)
  {
    v39 = _ATLogCategoryFramework_Oversize();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      int retryInterval = (int)self->_retryInterval;
      v41 = [(ATSessionTask *)self recentlyFailedAssets];
      *(_DWORD *)buf = 138543874;
      v50 = self;
      __int16 v51 = 1024;
      *(_DWORD *)v52 = retryInterval;
      *(_WORD *)&v52[4] = 2114;
      *(void *)&v52[6] = v41;
      _os_log_impl(&dword_1D9A2D000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@ Re-querying client bundle for more assets in %d seconds. recentlyFailedAssets=%{public}@", buf, 0x1Cu);
    }
    self->_waitingForRetry = 1;
    retryTimer = self->_retryTimer;
    dispatch_time_t v43 = dispatch_time(0, (uint64_t)(self->_retryInterval * 1000000000.0));
    dispatch_source_set_timer(retryTimer, v43, 0xFFFFFFFFFFFFFFFFLL, 0x2540BE400uLL);
  }
  else
  {
    v45 = [(ATAssetSessionTask *)self assetLinkController];
    [v45 removeObserver:self];

    [(ATSessionTask *)self setFinished:1];
  }
LABEL_27:
}

uint64_t __45__ATAssetSessionTask__finishAsset_withError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) assetTransferEndedWithSuccess:1];
}

- (void)assetLinkController:(id)a3 didFinishAsset:(id)a4
{
  id v5 = a4;
  if (![(ATSessionTask *)self isCancelled])
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __57__ATAssetSessionTask_assetLinkController_didFinishAsset___block_invoke;
    v7[3] = &unk_1E6B88B68;
    v7[4] = self;
    id v8 = v5;
    dispatch_async(queue, v7);
  }
}

void __57__ATAssetSessionTask_assetLinkController_didFinishAsset___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 152) containsObject:*(void *)(a1 + 40)])
  {
    uint64_t v2 = [*(id *)(a1 + 32) shouldRetryAssetBlock];
    if (v2
      && (v3 = (void *)v2,
          [*(id *)(a1 + 32) shouldRetryAssetBlock],
          v4 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue(),
          int v5 = v4[2](v4, *(void *)(a1 + 40)),
          v4,
          v3,
          v5))
    {
      id v6 = _ATLogCategoryFramework();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        uint64_t v8 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        uint64_t v16 = v7;
        __int16 v17 = 2114;
        uint64_t v18 = v8;
        _os_log_impl(&dword_1D9A2D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Retrying %{public}@ because of a recoverable error.", buf, 0x16u);
      }

      uint64_t v9 = [*(id *)(a1 + 32) assetLinkController];
      uint64_t v14 = *(void *)(a1 + 40);
      v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
      [v9 enqueueAssets:v10];
    }
    else
    {
      v12 = *(void **)(a1 + 32);
      v11 = *(void **)(a1 + 40);
      id v13 = [v11 error];
      objc_msgSend(v12, "_finishAsset:withError:", v11);
    }
  }
}

- (NSString)debugDescription
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATAssetSessionTask;
  v4 = [(ATSessionTask *)&v8 description];
  int v5 = [(ATAssetSessionTask *)self remainingAssets];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)remainingAssets
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__2973;
  v10 = __Block_byref_object_dispose__2974;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__ATAssetSessionTask_remainingAssets__block_invoke;
  v5[3] = &unk_1E6B88210;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __37__ATAssetSessionTask_remainingAssets__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 152) array];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)sessionGroupingKey
{
  return @"ATAssetSessionTaskGroupingKey";
}

- (void)cancelAllAssets
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__ATAssetSessionTask_cancelAllAssets__block_invoke;
  block[3] = &unk_1E6B88B40;
  block[4] = self;
  dispatch_async(queue, block);
}

void __37__ATAssetSessionTask_cancelAllAssets__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = [*(id *)(v3 + 152) count];
    int v8 = 138543618;
    uint64_t v9 = v3;
    __int16 v10 = 1024;
    int v11 = v4;
    _os_log_impl(&dword_1D9A2D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Cancelling %d assets.", (uint8_t *)&v8, 0x12u);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 192) = 1;
  id v5 = [*(id *)(a1 + 32) assetLinkController];
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 152) array];
  uint64_t v7 = (void *)[v6 copy];
  [v5 cancelAssets:v7 withCompletion:0];
}

- (void)cancel
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__ATAssetSessionTask_cancel__block_invoke;
  block[3] = &unk_1E6B88B40;
  block[4] = self;
  dispatch_async(queue, block);
}

void __28__ATAssetSessionTask_cancel__block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) isFinished] & 1) == 0)
  {
    uint64_t v2 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      int v4 = [*(id *)(v3 + 152) count];
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = v3;
      __int16 v19 = 1024;
      int v20 = v4;
      _os_log_impl(&dword_1D9A2D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Cancelling task with %d assets remaining.", buf, 0x12u);
    }

    [*(id *)(a1 + 32) setCancelled:1];
    id v5 = [*(id *)(a1 + 32) assetLinkController];
    uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 152) array];
    uint64_t v7 = (void *)[v6 copy];
    [v5 cancelAssets:v7 withCompletion:0];

    [*(id *)(*(void *)(a1 + 32) + 152) removeAllObjects];
    int v8 = [*(id *)(a1 + 32) assetLinkController];
    [v8 removeObserver:*(void *)(a1 + 32)];

    uint64_t v9 = +[ATClientController sharedInstance];
    __int16 v10 = [*(id *)(a1 + 32) dataClass];
    int v11 = [v9 clientForDataclass:v10];

    if (objc_opt_respondsToSelector())
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __28__ATAssetSessionTask_cancel__block_invoke_34;
      v14[3] = &unk_1E6B88B68;
      id v12 = v11;
      uint64_t v13 = *(void *)(a1 + 32);
      id v15 = v12;
      uint64_t v16 = v13;
      dispatch_client_async(v12, v14);
    }
    else
    {
      [*(id *)(a1 + 32) setFinished:1];
    }
  }
}

uint64_t __28__ATAssetSessionTask_cancel__block_invoke_34(uint64_t a1)
{
  [*(id *)(a1 + 32) assetTransferEndedWithSuccess:0];
  uint64_t v2 = *(void **)(a1 + 40);

  return [v2 setFinished:1];
}

- (void)start
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(ATSessionTask *)self dataClass];

  if (v2)
  {
    uint64_t v3 = +[ATClientController sharedInstance];
    int v4 = [(ATSessionTask *)self dataClass];
    id v5 = [v3 clientForDataclass:v4];

    if (v5)
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      *(void *)&buf[24] = __Block_byref_object_copy__2973;
      *(void *)&buf[32] = __Block_byref_object_dispose__2974;
      id v47 = 0;
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __27__ATAssetSessionTask_start__block_invoke;
      v41[3] = &unk_1E6B88210;
      id v42 = v5;
      dispatch_time_t v43 = buf;
      dispatch_client_sync(v42, v41);
      if (self->_filterPredicate)
      {
        uint64_t v6 = objc_msgSend(*(id *)(*(void *)&buf[8] + 40), "filteredArrayUsingPredicate:");
        uint64_t v7 = *(void **)(*(void *)&buf[8] + 40);
        *(void *)(*(void *)&buf[8] + 40) = v6;
      }
      [(NSMutableOrderedSet *)self->_remainingAssets addObjectsFromArray:*(void *)(*(void *)&buf[8] + 40)];

      _Block_object_dispose(buf, 8);
    }
    else
    {
      int v8 = _ATLogCategoryFramework();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = [(ATSessionTask *)self dataClass];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v9;
        _os_log_impl(&dword_1D9A2D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ No ATClient for asset dataClass %{public}@", buf, 0x16u);
      }
    }
  }
  if ([(ATSessionTask *)self totalItemCount])
  {
    [(ATSessionTask *)self setCompletedItemCount:[(ATSessionTask *)self totalItemCount]- [(NSMutableOrderedSet *)self->_remainingAssets count]];
    [(ATSessionTask *)self setProgress:(float)((float)[(ATSessionTask *)self completedItemCount]/ (float)[(ATSessionTask *)self totalItemCount])];
  }
  else
  {
    [(ATSessionTask *)self setTotalItemCount:[(NSMutableOrderedSet *)self->_remainingAssets count]];
    [(ATSessionTask *)self setCompletedItemCount:0];
    __int16 v10 = [MEMORY[0x1E4F1C978] array];
    [(ATSessionTask *)self setRecentlyFailedAssets:v10];

    [(ATSessionTask *)self setTotalBytesTransferred:&unk_1F33DCAE8];
    [(ATSessionTask *)self setTotalBytesToTransfer:&unk_1F33DCAE8];
  }
  int v11 = [(ATSessionTask *)self totalBytesTransferred];
  uint64_t v12 = [v11 unsignedLongLongValue];

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v13 = self->_remainingAssets;
  uint64_t v14 = 0;
  uint64_t v15 = [(NSMutableOrderedSet *)v13 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v38 != v16) {
          objc_enumerationMutation(v13);
        }
        v14 += [*(id *)(*((void *)&v37 + 1) + 8 * i) totalBytes];
      }
      uint64_t v15 = [(NSMutableOrderedSet *)v13 countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v15);
  }

  uint64_t v18 = v14 + v12;
  __int16 v19 = [NSNumber numberWithUnsignedLongLong:v18];
  [(ATSessionTask *)self setTotalBytesToTransfer:v19];

  int v20 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = [(NSMutableOrderedSet *)self->_remainingAssets count];
    *(_DWORD *)buf = 138544130;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v21;
    *(_WORD *)&buf[18] = 2048;
    *(void *)&buf[20] = v14;
    *(_WORD *)&buf[28] = 2048;
    *(void *)&buf[30] = v18;
    _os_log_impl(&dword_1D9A2D000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ Preparing to transfer %d assets (%llu/%llu total bytes)", buf, 0x26u);
  }

  [(NSMutableSet *)self->_failedAssets removeAllObjects];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v34 = 0u;
  long long v33 = 0u;
  obuint64_t j = self->_remainingAssets;
  uint64_t v22 = [(NSMutableOrderedSet *)obj countByEnumeratingWithState:&v33 objects:v44 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v34;
    uint64_t v24 = MEMORY[0x1E4F143A8];
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v34 != v23) {
          objc_enumerationMutation(obj);
        }
        v26 = *(void **)(*((void *)&v33 + 1) + 8 * j);
        [v26 setEnqueueSource:1];
        v32[0] = v24;
        v32[1] = 3221225472;
        v32[2] = __27__ATAssetSessionTask_start__block_invoke_12;
        v32[3] = &unk_1E6B88140;
        v32[4] = self;
        [v26 setCompletionBlock:v32];
        v31[0] = v24;
        v31[1] = 3221225472;
        v31[2] = __27__ATAssetSessionTask_start__block_invoke_4;
        v31[3] = &unk_1E6B88168;
        v31[4] = self;
        [v26 setProgressBlock:v31];
      }
      uint64_t v22 = [(NSMutableOrderedSet *)obj countByEnumeratingWithState:&v33 objects:v44 count:16];
    }
    while (v22);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__ATAssetSessionTask_start__block_invoke_7;
  block[3] = &unk_1E6B88B40;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __27__ATAssetSessionTask_start__block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v2 = [*(id *)(a1 + 32) outstandingAssetTransfersWithDownloadManager:0];
  }
  else
  {
    uint64_t result = objc_opt_respondsToSelector();
    if ((result & 1) == 0) {
      return result;
    }
    uint64_t v2 = [*(id *)(a1 + 32) outstandingAssetTransfers];
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v2;

  return MEMORY[0x1F41817F8]();
}

void __27__ATAssetSessionTask_start__block_invoke_12(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [v3 error];
  int v5 = ATIsPendingDownloadError();

  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(NSObject **)(v6 + 184);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__ATAssetSessionTask_start__block_invoke_2;
  block[3] = &unk_1E6B88688;
  char v35 = v5;
  block[4] = v6;
  id v8 = v3;
  id v34 = v8;
  dispatch_async(v7, block);
  if (!v5)
  {
    uint64_t v11 = [v8 error];
    if (!v11) {
      goto LABEL_11;
    }
    uint64_t v12 = (void *)v11;
    uint64_t v13 = [v8 error];
    uint64_t v14 = [v13 domain];
    if ([v14 isEqualToString:@"ATError"])
    {
      uint64_t v15 = [v8 error];
      uint64_t v16 = [v15 code];

      if (v16 != 2) {
        goto LABEL_11;
      }
      uint64_t v12 = [*(id *)(a1 + 32) error];
      if (v12)
      {
        [v8 setError:v12];
      }
      else
      {
        v27 = [*(id *)(a1 + 32) session];
        v28 = [v27 error];
        if (v28)
        {
          [v8 setError:v28];
        }
        else
        {
          unint64_t v29 = [v8 error];
          [v8 setError:v29];
        }
      }
    }
    else
    {
    }
LABEL_11:
    __int16 v17 = +[ATClientController sharedInstance];
    uint64_t v18 = [v8 dataclass];
    uint64_t v9 = [v17 clientForDataclass:v18];

    if ([v8 isInstalled])
    {
      __int16 v19 = [v8 error];

      if (v19)
      {
        if ((objc_opt_respondsToSelector() & 1) == 0) {
          goto LABEL_20;
        }
        int v20 = v32;
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        int v21 = __27__ATAssetSessionTask_start__block_invoke_18;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) == 0) {
          goto LABEL_20;
        }
        int v20 = v31;
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        int v21 = __27__ATAssetSessionTask_start__block_invoke_2_21;
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_20;
      }
      int v20 = v30;
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      int v21 = __27__ATAssetSessionTask_start__block_invoke_3;
    }
    v20[2] = v21;
    v20[3] = &unk_1E6B88B68;
    uint64_t v22 = v9;
    v20[4] = v22;
    v20[5] = v8;
    dispatch_client_async(v22, v20);

LABEL_20:
    uint64_t v23 = [v8 dataclass];
    if ([v23 isEqualToString:@"Application"])
    {
      uint64_t v24 = [v8 error];
      v25 = [v24 domain];
      int v26 = [v25 isEqualToString:*MEMORY[0x1E4F78058]];

      if (!v26) {
        goto LABEL_24;
      }
      uint64_t v23 = [v8 prettyName];
      ATDisplayErrorForAppInstall(v23, [v8 isRestore]);
    }

    goto LABEL_24;
  }
  uint64_t v9 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v37 = v10;
    __int16 v38 = 2114;
    id v39 = v8;
    _os_log_impl(&dword_1D9A2D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Not hooking up %{public}@ as it's begin downloading by another source", buf, 0x16u);
  }
LABEL_24:
}

void __27__ATAssetSessionTask_start__block_invoke_4(uint64_t a1, void *a2, float a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(NSObject **)(v6 + 184);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__ATAssetSessionTask_start__block_invoke_5;
  block[3] = &unk_1E6B88A50;
  block[4] = v6;
  id v8 = v5;
  id v16 = v8;
  float v17 = a3;
  dispatch_async(v7, block);
  uint64_t v9 = +[ATClientController sharedInstance];
  uint64_t v10 = [v8 dataclass];
  uint64_t v11 = [v9 clientForDataclass:v10];

  if (objc_opt_respondsToSelector())
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __27__ATAssetSessionTask_start__block_invoke_6;
    v12[3] = &unk_1E6B88B68;
    id v13 = v11;
    id v14 = v8;
    dispatch_client_async(v13, v12);
  }
}

void __27__ATAssetSessionTask_start__block_invoke_7(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 152) count];
  uint64_t v3 = *(void *)(a1 + 32);
  if (v2 && *(unsigned char *)(v3 + 192))
  {
    *(unsigned char *)(v3 + 217) = 0;
    int v4 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = [*(id *)(v5 + 152) count];
      *(_DWORD *)buf = 138543618;
      uint64_t v31 = v5;
      __int16 v32 = 1024;
      int v33 = v6;
      _os_log_impl(&dword_1D9A2D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Preemptively cancelling %d assets at start.", buf, 0x12u);
    }

    uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 152) array];
    id v8 = (void *)[v7 copy];

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          uint64_t v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:2 userInfo:0];
          [v14 setError:v15];

          id v16 = [v14 completionBlock];
          ((void (**)(void, void *))v16)[2](v16, v14);

          float v17 = *(void **)(a1 + 32);
          uint64_t v18 = [v14 error];
          [v17 _finishAsset:v14 withError:v18];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v11);
    }
  }
  else
  {
    uint64_t v19 = [*(id *)(v3 + 152) count];
    int v20 = *(void **)(a1 + 32);
    if (v19)
    {
      int v21 = [v20 assetLinkController];
      [v21 addObserver:*(void *)(a1 + 32)];

      id v24 = [*(id *)(a1 + 32) assetLinkController];
      uint64_t v22 = [*(id *)(*(void *)(a1 + 32) + 152) array];
      uint64_t v23 = (void *)[v22 copy];
      [v24 enqueueAssets:v23];
    }
    else
    {
      [v20 setFinished:1];
    }
  }
}

uint64_t __27__ATAssetSessionTask_start__block_invoke_5(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 176) addObject:*(void *)(a1 + 40)];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 176) allObjects];
  [*(id *)(a1 + 32) setCurrentItems:v2];

  float v3 = *(float *)(a1 + 48) * (float)(1.0 / (float)(unint64_t)[*(id *)(a1 + 32) totalItemCount]);
  float v4 = (float)(unint64_t)[*(id *)(a1 + 32) completedItemCount];
  double v5 = (float)(v3 + (float)(v4 / (float)(unint64_t)[*(id *)(a1 + 32) totalItemCount]));
  int v6 = *(void **)(a1 + 32);

  return [v6 setProgress:v5];
}

uint64_t __27__ATAssetSessionTask_start__block_invoke_6(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  [v2 downloadProgress];
  double v4 = v3;

  return [v1 assetTransfer:v2 updatedProgress:v4];
}

void __27__ATAssetSessionTask_start__block_invoke_2(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 48))
  {
    [*(id *)(*(void *)(a1 + 32) + 176) removeObject:*(void *)(a1 + 40)];
    id v2 = [*(id *)(*(void *)(a1 + 32) + 176) allObjects];
    [*(id *)(a1 + 32) setCurrentItems:v2];
  }
}

void __27__ATAssetSessionTask_start__block_invoke_18(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  float v3 = *(void **)(a1 + 40);
  double v4 = [v3 error];
  [v2 assetInstallFailed:v3 withError:v4];

  double v5 = [MEMORY[0x1E4F47890] sharedInstance];
  v7[0] = *(void *)(a1 + 40);
  int v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [v5 installCompleteForAssets:v6];
}

void __27__ATAssetSessionTask_start__block_invoke_2_21(uint64_t a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) assetInstallSucceeded:*(void *)(a1 + 40)];
  id v2 = [MEMORY[0x1E4F47890] sharedInstance];
  v4[0] = *(void *)(a1 + 40);
  float v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  [v2 installCompleteForAssets:v3];
}

void __27__ATAssetSessionTask_start__block_invoke_3(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  float v3 = *(void **)(a1 + 40);
  double v4 = [v3 error];
  double v5 = [*(id *)(a1 + 40) error];
  [v2 assetTransfer:v3 succeeded:v4 == 0 withError:v5];

  int v6 = [MEMORY[0x1E4F47890] sharedInstance];
  v8[0] = *(void *)(a1 + 40);
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [v6 installCompleteForAssets:v7];
}

- (void)resume
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__ATAssetSessionTask_resume__block_invoke;
  block[3] = &unk_1E6B88B40;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __28__ATAssetSessionTask_resume__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setSuspended:0];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 216))
  {
    float v3 = *(NSObject **)(v2 + 208);
    dispatch_source_set_timer(v3, 0, 0xFFFFFFFFFFFFFFFFLL, 0x2540BE400uLL);
  }
}

- (void)suspend
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__ATAssetSessionTask_suspend__block_invoke;
  block[3] = &unk_1E6B88B40;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __29__ATAssetSessionTask_suspend__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setSuspended:1];
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 208);

  dispatch_source_set_timer(v2, 0xFFFFFFFFFFFFFFFFLL, 0, 0);
}

- (id)_initWithDataClass:(id)a3 assets:(id)a4
{
  id v6 = a4;
  v27.receiver = self;
  v27.super_class = (Class)ATAssetSessionTask;
  uint64_t v7 = [(ATSessionTask *)&v27 initWithDataClass:a3];
  id v8 = v7;
  if (v7)
  {
    if (v6) {
      [(NSMutableOrderedSet *)v7->_remainingAssets addObjectsFromArray:v6];
    }
    v8->_unint64_t recentFailedArrayIndex = 0;
    id v9 = (objc_class *)objc_opt_class();
    Name = class_getName(v9);
    dispatch_queue_t v11 = dispatch_queue_create(Name, 0);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v11;

    id v13 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    remainingAssets = v8->_remainingAssets;
    v8->_remainingAssets = v13;

    uint64_t v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    failedAssets = v8->_failedAssets;
    v8->_failedAssets = v15;

    float v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    currentAssets = v8->_currentAssets;
    v8->_currentAssets = v17;

    uint64_t v19 = [MEMORY[0x1E4F47890] sharedInstance];
    assetLinkController = v8->_assetLinkController;
    v8->_assetLinkController = (ATAssetLinkController *)v19;

    v8->_int retryInterval = 10.0;
    dispatch_source_t v21 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)v8->_queue);
    retryTimer = v8->_retryTimer;
    v8->_retryTimer = (OS_dispatch_source *)v21;

    dispatch_source_set_timer((dispatch_source_t)v8->_retryTimer, 0xFFFFFFFFFFFFFFFFLL, 0, 0);
    uint64_t v23 = v8->_retryTimer;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __48__ATAssetSessionTask__initWithDataClass_assets___block_invoke;
    handler[3] = &unk_1E6B88B40;
    long long v26 = v8;
    dispatch_source_set_event_handler(v23, handler);
    dispatch_resume((dispatch_object_t)v8->_retryTimer);
  }
  return v8;
}

uint64_t __48__ATAssetSessionTask__initWithDataClass_assets___block_invoke(uint64_t a1)
{
  *(double *)(*(void *)(a1 + 32) + 200) = *(double *)(*(void *)(a1 + 32) + 200) + 10.0;
  *(unsigned char *)(*(void *)(a1 + 32) + 216) = 0;
  return [*(id *)(a1 + 32) start];
}

- (ATAssetSessionTask)initWithAssets:(id)a3
{
  return (ATAssetSessionTask *)[(ATAssetSessionTask *)self _initWithDataClass:0 assets:a3];
}

- (ATAssetSessionTask)initWithDataClass:(id)a3
{
  return (ATAssetSessionTask *)[(ATAssetSessionTask *)self _initWithDataClass:a3 assets:0];
}

- (ATAssetSessionTask)init
{
  return (ATAssetSessionTask *)[(ATAssetSessionTask *)self _initWithDataClass:0 assets:0];
}

@end