@interface ATStoreMediaAssetLink
- (ATAssetLinkDelegate)delegate;
- (ATStoreMediaAssetLink)init;
- (BOOL)_canEnqueueAssetUnderCurrentEnvironmentConditions:(id)a3 didUpdatePauseReason:(BOOL *)a4;
- (BOOL)canEnqueueAsset:(id)a3;
- (BOOL)isOpen;
- (BOOL)linkIsReady;
- (BOOL)open;
- (id)enqueueAssets:(id)a3 force:(BOOL)a4;
- (int64_t)_ATAssetStateForStoreDownloadState:(int64_t)a3;
- (unint64_t)maximumBatchSize;
- (unint64_t)priority;
- (void)ATStoreDownloadService:(id)a3 didChangeStateForAsset:(id)a4 oldState:(int64_t)a5 newState:(int64_t)a6;
- (void)ATStoreDownloadService:(id)a3 didFinishAsset:(id)a4 withError:(id)a5 cancelPendingAssetsInBatch:(BOOL)a6;
- (void)ATStoreDownloadService:(id)a3 didUpdateProgressForAsset:(id)a4 progress:(float)a5;
- (void)_finishAsset:(id)a3 error:(id)a4 cancelPendingAssetsInBatch:(BOOL)a5;
- (void)_setupActivityToResumeDownloads;
- (void)cancelAssets:(id)a3;
- (void)close;
- (void)environmentMonitorDidChangeNetworkReachability:(id)a3;
- (void)prioritizeAsset:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation ATStoreMediaAssetLink

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadService, 0);
  objc_storeStrong((id *)&self->_downloadsPendingEnqueue, 0);
  objc_storeStrong((id *)&self->_resumableAssets, 0);
  objc_storeStrong((id *)&self->_cancelledAssets, 0);
  objc_storeStrong((id *)&self->_enqueuedRestoreAssets, 0);
  objc_storeStrong((id *)&self->_enqueuedDownloadAssets, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_resumeQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (ATAssetLinkDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ATAssetLinkDelegate *)WeakRetained;
}

- (BOOL)isOpen
{
  return self->_open;
}

- (void)environmentMonitorDidChangeNetworkReachability:(id)a3
{
  if ([a3 isRemoteServerLikelyReachable])
  {
    [(ATStoreMediaAssetLink *)self _setupActivityToResumeDownloads];
  }
}

- (BOOL)_canEnqueueAssetUnderCurrentEnvironmentConditions:(id)a3 didUpdatePauseReason:(BOOL *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (![v6 isRestore])
  {
    v8 = [MEMORY[0x1E4FB8618] sharedMonitor];
    int v9 = [v8 isNetworkConstrained];

    if (!v9 || ([v6 allowDownloadOnConstrainedNetwork] & 1) != 0) {
      goto LABEL_11;
    }
    if (a4) {
      *a4 = ([v6 downloadPauseReason] & 2) == 0;
    }
    objc_msgSend(v6, "setDownloadPauseReason:", objc_msgSend(v6, "downloadPauseReason") | 2);
    v10 = _ATLogCategoryStoreDownloads();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543618;
      v16 = self;
      __int16 v17 = 2114;
      id v18 = v6;
      v11 = "%{public}@ disallowing download of %{public}@ as the network is constrained";
LABEL_16:
      _os_log_impl(&dword_1D9A2D000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v15, 0x16u);
    }
LABEL_17:

    BOOL v13 = 0;
    goto LABEL_18;
  }
  v7 = +[ATRestoreManager sharedManager];
  if (([v7 hasProperNetworkConditions] & 1) == 0)
  {
    char v12 = [v6 isPrioritized];

    if (v12) {
      goto LABEL_11;
    }
    if (a4) {
      *a4 = ([v6 downloadPauseReason] & 4) == 0;
    }
    objc_msgSend(v6, "setDownloadPauseReason:", objc_msgSend(v6, "downloadPauseReason") | 4);
    v10 = _ATLogCategoryStoreDownloads();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543618;
      v16 = self;
      __int16 v17 = 2114;
      id v18 = v6;
      v11 = "%{public}@ disallowing restore of %{public}@ due to current network conditions";
      goto LABEL_16;
    }
    goto LABEL_17;
  }

LABEL_11:
  BOOL v13 = 1;
LABEL_18:

  return v13;
}

- (void)_setupActivityToResumeDownloads
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__ATStoreMediaAssetLink__setupActivityToResumeDownloads__block_invoke;
  block[3] = &unk_1E6B88B40;
  block[4] = self;
  dispatch_async(queue, block);
}

void __56__ATStoreMediaAssetLink__setupActivityToResumeDownloads__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 96) && ![*(id *)(v1 + 48) count])
  {
    if ([*(id *)(*(void *)(a1 + 32) + 72) count])
    {
      *(unsigned char *)(*(void *)(a1 + 32) + 96) = 1;
      dispatch_time_t v3 = dispatch_time(0, 5000000000);
      uint64_t v4 = *(void *)(a1 + 32);
      v5 = *(NSObject **)(v4 + 32);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __56__ATStoreMediaAssetLink__setupActivityToResumeDownloads__block_invoke_2;
      block[3] = &unk_1E6B88B40;
      block[4] = v4;
      dispatch_after(v3, v5, block);
    }
  }
}

void __56__ATStoreMediaAssetLink__setupActivityToResumeDownloads__block_invoke_2(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  int v32 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  int v28 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__4553;
  v23 = __Block_byref_object_dispose__4554;
  id v24 = 0;
  v2 = [MEMORY[0x1E4FB8618] sharedMonitor];
  int v3 = [v2 isRemoteServerLikelyReachable];

  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__ATStoreMediaAssetLink__setupActivityToResumeDownloads__block_invoke_3;
  block[3] = &unk_1E6B88AA0;
  block[4] = v4;
  void block[5] = &v29;
  block[6] = &v25;
  block[7] = &v19;
  dispatch_sync(v5, block);
  if (!*((_DWORD *)v30 + 6))
  {
    int v6 = *((_DWORD *)v26 + 6) ? v3 : 0;
    if (v6 == 1)
    {
      v7 = _ATLogCategoryStoreDownloads_Oversize();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        uint64_t v9 = v20[5];
        *(_DWORD *)buf = 138543618;
        uint64_t v34 = v8;
        __int16 v35 = 2114;
        uint64_t v36 = v9;
        _os_log_impl(&dword_1D9A2D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Resuming downloads for %{public}@", buf, 0x16u);
      }

      v10 = *(void **)(a1 + 32);
      v11 = [(id)v20[5] allObjects];
      char v12 = [v10 enqueueAssets:v11 force:0];

      uint64_t v13 = *(void *)(a1 + 32);
      v14 = *(NSObject **)(v13 + 24);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __56__ATStoreMediaAssetLink__setupActivityToResumeDownloads__block_invoke_40;
      v16[3] = &unk_1E6B88B68;
      v16[4] = v13;
      id v17 = v12;
      id v15 = v12;
      dispatch_sync(v14, v16);
    }
  }
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
}

void __56__ATStoreMediaAssetLink__setupActivityToResumeDownloads__block_invoke_3(void *a1)
{
  *(unsigned char *)(a1[4] + 96) = 0;
  *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = [*(id *)(a1[4] + 48) count];
  *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = [*(id *)(a1[4] + 72) count];
  v2 = *(void **)(a1[4] + 72);
  int v3 = (id *)(*(void *)(a1[7] + 8) + 40);

  objc_storeStrong(v3, v2);
}

void __56__ATStoreMediaAssetLink__setupActivityToResumeDownloads__block_invoke_40(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(*(void *)(a1 + 32) + 72);
  int v3 = [MEMORY[0x1E4F1CAD0] setWithArray:*(void *)(a1 + 40)];
  [v2 minusSet:v3];

  uint64_t v4 = _ATLogCategoryStoreDownloads_Oversize();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(v5 + 72);
    int v7 = 138543618;
    uint64_t v8 = v5;
    __int16 v9 = 2114;
    uint64_t v10 = v6;
    _os_log_impl(&dword_1D9A2D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Remaining downloads to resume %{public}@", (uint8_t *)&v7, 0x16u);
  }
}

- (int64_t)_ATAssetStateForStoreDownloadState:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 4) {
    return 0;
  }
  else {
    return qword_1D9BA3040[a3 - 2];
  }
}

- (void)_finishAsset:(id)a3 error:(id)a4 cancelPendingAssetsInBatch:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  char v32 = 1;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__ATStoreMediaAssetLink__finishAsset_error_cancelPendingAssetsInBatch___block_invoke;
  block[3] = &unk_1E6B88A78;
  id v11 = v8;
  id v26 = v11;
  uint64_t v27 = self;
  id v12 = v9;
  id v28 = v12;
  uint64_t v29 = v31;
  BOOL v30 = a5;
  dispatch_sync(queue, block);
  callbackQueue = self->_callbackQueue;
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __71__ATStoreMediaAssetLink__finishAsset_error_cancelPendingAssetsInBatch___block_invoke_39;
  uint64_t v19 = &unk_1E6B88A78;
  v20 = self;
  v23 = v31;
  id v14 = v11;
  id v21 = v14;
  id v15 = v12;
  id v22 = v15;
  BOOL v24 = a5;
  dispatch_async(callbackQueue, &v16);
  [(ATStoreMediaAssetLink *)self _setupActivityToResumeDownloads];

  _Block_object_dispose(v31, 8);
}

void __71__ATStoreMediaAssetLink__finishAsset_error_cancelPendingAssetsInBatch___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) resumeData];

  unint64_t v3 = [*(id *)(*(void *)(a1 + 40) + 72) count];
  if (v2
    && ([*(id *)(*(void *)(a1 + 40) + 64) containsObject:*(void *)(a1 + 32)] & 1) == 0
    && v3 <= 4)
  {
    [*(id *)(*(void *)(a1 + 40) + 72) addObject:*(void *)(a1 + 32)];
    uint64_t v4 = _ATLogCategoryStoreDownloads();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      int v18 = 138543618;
      uint64_t v19 = v5;
      __int16 v20 = 2114;
      uint64_t v21 = v6;
      _os_log_impl(&dword_1D9A2D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Caching resumeData for %{public}@", (uint8_t *)&v18, 0x16u);
    }
  }
  [*(id *)(*(void *)(a1 + 40) + 48) removeObject:*(void *)(a1 + 32)];
  [*(id *)(*(void *)(a1 + 40) + 56) removeObject:*(void *)(a1 + 32)];
  [*(id *)(*(void *)(a1 + 40) + 64) removeObject:*(void *)(a1 + 32)];
  uint64_t v7 = *(void *)(a1 + 48);
  if (!v7)
  {
    [*(id *)(*(void *)(a1 + 40) + 72) removeObject:*(void *)(a1 + 32)];
    uint64_t v7 = *(void *)(a1 + 48);
  }
  if (v7) {
    BOOL v8 = v2 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  char v10 = v8 || v3 > 4;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v10;
  id v11 = _ATLogCategoryStoreDownloads();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v12 = v2 != 0;
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 40);
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
      id v15 = "finished";
    }
    else {
      id v15 = "resumable";
    }
    int v16 = [*(id *)(v13 + 72) count];
    int v17 = *(unsigned __int8 *)(a1 + 64);
    int v18 = 138544642;
    uint64_t v19 = v13;
    __int16 v20 = 2114;
    uint64_t v21 = v14;
    __int16 v22 = 2080;
    v23 = v15;
    __int16 v24 = 1024;
    BOOL v25 = v12;
    __int16 v26 = 1024;
    int v27 = v16;
    __int16 v28 = 1024;
    int v29 = v17;
    _os_log_impl(&dword_1D9A2D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ treating %{public}@ as %s - hasResumeData %d, pendingResumeAssetCount %d, cancelPendingAssetsInBatch=%d", (uint8_t *)&v18, 0x32u);
  }
}

void __71__ATStoreMediaAssetLink__finishAsset_error_cancelPendingAssetsInBatch___block_invoke_39(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = WeakRetained;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    [WeakRetained assetLink:v4 didFinishAsset:v5 error:v3 retryable:1 cancelPendingAssetsInBatch:*(unsigned __int8 *)(a1 + 64)];
  }
  else {
    [WeakRetained assetLink:v4 didPauseAsseDownload:v5 error:v3];
  }
}

- (void)ATStoreDownloadService:(id)a3 didFinishAsset:(id)a4 withError:(id)a5 cancelPendingAssetsInBatch:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a5;
  id v10 = a4;
  [(ATStoreMediaAssetLink *)self _finishAsset:v10 error:v9 cancelPendingAssetsInBatch:v6];
  id v11 = [MEMORY[0x1E4F47898] sharedInstance];
  [v11 logAssetLinkOfType:0 didFinishAsset:v10 withError:v9];
}

- (void)ATStoreDownloadService:(id)a3 didUpdateProgressForAsset:(id)a4 progress:(float)a5
{
  id v7 = a4;
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__ATStoreMediaAssetLink_ATStoreDownloadService_didUpdateProgressForAsset_progress___block_invoke;
  block[3] = &unk_1E6B88A50;
  void block[4] = self;
  id v11 = v7;
  float v12 = a5;
  id v9 = v7;
  dispatch_async(callbackQueue, block);
}

void __83__ATStoreMediaAssetLink_ATStoreDownloadService_didUpdateProgressForAsset_progress___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained assetLink:*(void *)(a1 + 32) didUpdateAsset:*(void *)(a1 + 40) progress:*(float *)(a1 + 48)];
}

- (void)ATStoreDownloadService:(id)a3 didChangeStateForAsset:(id)a4 oldState:(int64_t)a5 newState:(int64_t)a6
{
  id v8 = a4;
  objc_msgSend(v8, "setAssetState:", -[ATStoreMediaAssetLink _ATAssetStateForStoreDownloadState:](self, "_ATAssetStateForStoreDownloadState:", a6));
  if (a6 == 2)
  {
    id v9 = [MEMORY[0x1E4F47898] sharedInstance];
    [v9 logAssetLinkOfType:0 didBeginDownloadingAsset:v8];
  }
  callbackQueue = self->_callbackQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __89__ATStoreMediaAssetLink_ATStoreDownloadService_didChangeStateForAsset_oldState_newState___block_invoke;
  v12[3] = &unk_1E6B88B68;
  v12[4] = self;
  id v13 = v8;
  id v11 = v8;
  dispatch_async(callbackQueue, v12);
}

void __89__ATStoreMediaAssetLink_ATStoreDownloadService_didChangeStateForAsset_oldState_newState___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  uint64_t v3 = *(void *)(a1 + 32);
  v5[0] = *(void *)(a1 + 40);
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [WeakRetained assetLink:v3 didTransitionAssetStates:v4];
}

- (BOOL)linkIsReady
{
  return 1;
}

- (unint64_t)maximumBatchSize
{
  return 20;
}

- (unint64_t)priority
{
  return 50;
}

- (void)prioritizeAsset:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__ATStoreMediaAssetLink_prioritizeAsset___block_invoke;
  v7[3] = &unk_1E6B88B68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __41__ATStoreMediaAssetLink_prioritizeAsset___block_invoke(uint64_t a1)
{
  if (([*(id *)(*(void *)(a1 + 32) + 48) containsObject:*(void *)(a1 + 40)] & 1) != 0
    || (uint64_t result = [*(id *)(*(void *)(a1 + 32) + 56) containsObject:*(void *)(a1 + 40)],
        result))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = *(void **)(*(void *)(a1 + 32) + 88);
    return [v4 prioritizeAsset:v3];
  }
  return result;
}

- (void)cancelAssets:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v19 = 0;
  __int16 v20 = &v19;
  uint64_t v21 = 0x3032000000;
  __int16 v22 = __Block_byref_object_copy__4553;
  v23 = __Block_byref_object_dispose__4554;
  id v24 = [MEMORY[0x1E4F1CA48] array];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__ATStoreMediaAssetLink_cancelAssets___block_invoke;
  block[3] = &unk_1E6B88B90;
  id v6 = v4;
  id v16 = v6;
  int v17 = self;
  int v18 = &v19;
  dispatch_sync(queue, block);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v7 = (id)v20[5];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v7);
        }
        -[ATStoreDownloadService cancelAsset:](self->_downloadService, "cancelAsset:", *(void *)(*((void *)&v11 + 1) + 8 * v10++), (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v25 count:16];
    }
    while (v8);
  }

  _Block_object_dispose(&v19, 8);
}

void __38__ATStoreMediaAssetLink_cancelAssets___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        int v8 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 48), "containsObject:", v7, (void)v11);
        uint64_t v9 = *(id **)(a1 + 40);
        if (v8 || (v10 = [v9[7] containsObject:v7], uint64_t v9 = *(id **)(a1 + 40), v10))
        {
          [v9[8] addObject:v7];
          [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v7];
        }
        else
        {
          [v9[9] removeObject:v7];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

- (BOOL)canEnqueueAsset:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[ATDeviceSettings sharedInstance];
  int v6 = [v5 useNewDownloadService];

  if (!v6) {
    goto LABEL_36;
  }
  uint64_t v7 = [v4 variantOptions];
  int v8 = [v7 objectForKey:@"AssetParts"];
  uint64_t v9 = [v8 unsignedIntegerValue];

  if (v9)
  {
    if ((v9 & 1) == 0) {
      goto LABEL_36;
    }
  }
  if ([v4 bypassStore]) {
    goto LABEL_36;
  }
  int v10 = [v4 dataclass];
  if ([v10 isEqualToString:@"Media"]) {
    goto LABEL_8;
  }
  long long v11 = [v4 dataclass];
  if ([v11 isEqualToString:@"Book"])
  {

LABEL_8:
    goto LABEL_9;
  }
  if (!_os_feature_enabled_impl())
  {

    goto LABEL_36;
  }
  uint64_t v31 = [v4 dataclass];
  char v32 = [v31 isEqualToString:@"Podcasts"];

  if ((v32 & 1) == 0) {
    goto LABEL_36;
  }
LABEL_9:
  long long v12 = [v4 storeInfo];

  if (!v12) {
    goto LABEL_36;
  }
  long long v13 = [v4 assetType];
  if ([v13 isEqualToString:@"Music"])
  {
    int v14 = 1;
  }
  else
  {
    id v15 = [v4 assetType];
    int v14 = [v15 isEqualToString:@"MusicVideo"];
  }
  uint64_t v16 = [v4 assetType];
  int v17 = [v16 isEqualToString:@"Audiobook"];

  int v18 = [v4 storeInfo];
  uint64_t v19 = [v18 redownloadParams];
  uint64_t v20 = [v19 length];

  uint64_t v21 = [v4 storeInfo];
  __int16 v22 = [v21 endpointType];
  unint64_t v23 = [v22 integerValue];

  if (!v14)
  {
    if (v17) {
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  if (![v4 isRestore]) {
    goto LABEL_27;
  }
  if (v23 == 2 && !v20) {
    goto LABEL_36;
  }
  if (v23 > 1)
  {
LABEL_27:
    int v33 = [v4 isRestore];
    if (v23 - 3 < 0xFFFFFFFFFFFFFFFELL) {
      int v34 = 1;
    }
    else {
      int v34 = v33;
    }
    if ((v34 & (v17 ^ 1) & 1) == 0)
    {
LABEL_31:
      if (!v20) {
        goto LABEL_36;
      }
    }
LABEL_32:
    if (_os_feature_enabled_impl())
    {
LABEL_33:
      char v30 = 1;
      goto LABEL_37;
    }
    __int16 v35 = [v4 dataclass];
    char v36 = [v35 isEqualToString:@"Book"];

    if ((v36 & 1) == 0)
    {
      if (!_os_feature_enabled_impl()) {
        goto LABEL_33;
      }
      v38 = [MEMORY[0x1E4FB8608] currentDeviceInfo];
      if ([v38 isWatch])
      {

        goto LABEL_33;
      }
      v39 = [v4 assetType];
      char v40 = [v39 isEqualToString:@"Audiobook"];

      if ((v40 & 1) == 0) {
        goto LABEL_33;
      }
    }
LABEL_36:
    char v30 = 0;
    goto LABEL_37;
  }
  id v24 = [MEMORY[0x1E4FB87B8] activeAccount];
  BOOL v25 = [MEMORY[0x1E4FB87C0] defaultIdentityStore];
  id v41 = 0;
  uint64_t v26 = [v25 DSIDForUserIdentity:v24 outError:&v41];
  id v27 = v41;

  if (!v26 || v27)
  {
    int v29 = _ATLogCategoryStoreDownloads();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v43 = self;
      __int16 v44 = 2114;
      id v45 = v4;
      __int16 v46 = 2114;
      id v47 = v27;
      _os_log_impl(&dword_1D9A2D000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ Could not get DSID for active account. (asset=%{public}@, error=%{public}@)", buf, 0x20u);
    }
    char v30 = 0;
  }
  else
  {
    __int16 v28 = [v4 storeInfo];
    int v29 = [v28 DSID];

    if (v26 == v29)
    {
      char v30 = 1;
      int v29 = v26;
    }
    else
    {
      char v30 = [v26 isEqual:v29];
    }
  }

LABEL_37:
  return v30;
}

- (id)enqueueAssets:(id)a3 force:(BOOL)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v44 = 0;
  id v45 = &v44;
  uint64_t v46 = 0x3032000000;
  id v47 = __Block_byref_object_copy__4553;
  uint64_t v48 = __Block_byref_object_dispose__4554;
  id v49 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  id v41 = __Block_byref_object_copy__4553;
  v42 = __Block_byref_object_dispose__4554;
  id v43 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v32 = 0;
  int v33 = &v32;
  uint64_t v34 = 0x3032000000;
  __int16 v35 = __Block_byref_object_copy__4553;
  char v36 = __Block_byref_object_dispose__4554;
  id v37 = [MEMORY[0x1E4F1CA48] array];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__ATStoreMediaAssetLink_enqueueAssets_force___block_invoke;
  block[3] = &unk_1E6B88A28;
  id v8 = v6;
  id v26 = v8;
  id v27 = self;
  BOOL v31 = a4;
  __int16 v28 = &v44;
  int v29 = &v32;
  char v30 = &v38;
  dispatch_sync(queue, block);
  if ([(id)v33[5] count])
  {
    uint64_t v9 = _ATLogCategoryStoreDownloads_Oversize();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = (void *)v33[5];
      *(_DWORD *)buf = 138543618;
      v52 = self;
      __int16 v53 = 2114;
      v54 = v10;
      _os_log_impl(&dword_1D9A2D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Download paused reason changed for %{public}@", buf, 0x16u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained assetLink:self didUpdateDownloadPauseReasonForAssets:v33[5]];
  }
  if ([(id)v39[5] count])
  {
    long long v12 = _ATLogCategoryStoreDownloads_Oversize();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      long long v13 = (void *)v39[5];
      uint64_t v14 = [v13 count];
      *(_DWORD *)buf = 138543874;
      v52 = self;
      __int16 v53 = 2114;
      v54 = v13;
      __int16 v55 = 2048;
      uint64_t v56 = v14;
      _os_log_impl(&dword_1D9A2D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Enqueuing %{public}@ (count=%lu) new assets", buf, 0x20u);
    }

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v15 = (id)v39[5];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v50 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v15);
          }
          -[ATStoreDownloadService enqueueAsset:](self->_downloadService, "enqueueAsset:", *(void *)(*((void *)&v21 + 1) + 8 * i), (void)v21);
        }
        uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v50 count:16];
      }
      while (v16);
    }
  }
  id v19 = (id)v45[5];

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);

  return v19;
}

void __45__ATStoreMediaAssetLink_enqueueAssets_force___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (!v3) {
    goto LABEL_26;
  }
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)v18;
  while (2)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v18 != v5) {
        objc_enumerationMutation(v2);
      }
      uint64_t v7 = *(void **)(*((void *)&v17 + 1) + 8 * i);
      if (objc_msgSend(v7, "isRestore", (void)v17)
        && [*(id *)(*(void *)(a1 + 40) + 56) containsObject:v7]
        || [*(id *)(*(void *)(a1 + 40) + 48) containsObject:v7])
      {
        id v8 = (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
LABEL_19:
        [*v8 addObject:v7];
        continue;
      }
      uint64_t v9 = [*(id *)(*(void *)(a1 + 40) + 48) count];
      unint64_t v10 = [*(id *)(*(void *)(a1 + 40) + 56) count] + v9;
      if (v10 >= [*(id *)(a1 + 40) maximumBatchSize])
      {
        id v15 = _ATLogCategoryStoreDownloads();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v16 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138543618;
          uint64_t v22 = v16;
          __int16 v23 = 2114;
          long long v24 = v7;
          _os_log_impl(&dword_1D9A2D000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ not enqueuing %{public}@ as the link is at full capacity", buf, 0x16u);
        }

        goto LABEL_26;
      }
      if (([v7 isPrioritized] & 1) != 0 || *(unsigned char *)(a1 + 72)) {
        goto LABEL_17;
      }
      buf[0] = 0;
      int v11 = [*(id *)(a1 + 40) _canEnqueueAssetUnderCurrentEnvironmentConditions:v7 didUpdatePauseReason:buf];
      if ((v11 & 1) == 0 && buf[0]) {
        [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v7];
      }
      if (v11)
      {
LABEL_17:
        [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObject:v7];
        [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v7];
        [v7 setDownloadPauseReason:0];
        int v12 = [v7 isRestore];
        uint64_t v13 = *(void *)(a1 + 40);
        uint64_t v14 = (id *)(v13 + 48);
        id v8 = (id *)(v13 + 56);
        if (!v12) {
          id v8 = v14;
        }
        goto LABEL_19;
      }
    }
    uint64_t v4 = [v2 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v4) {
      continue;
    }
    break;
  }
LABEL_26:
}

- (void)close
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__ATStoreMediaAssetLink_close__block_invoke;
  block[3] = &unk_1E6B88B40;
  void block[4] = self;
  dispatch_sync(queue, block);
}

void __30__ATStoreMediaAssetLink_close__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 8))
  {
    *(unsigned char *)(v1 + 8) = 0;
    uint64_t v3 = (void *)[*(id *)(*(void *)(a1 + 32) + 48) copy];
    [v3 unionSet:*(void *)(*(void *)(a1 + 32) + 72)];
    [v3 unionSet:*(void *)(*(void *)(a1 + 32) + 56)];
    [*(id *)(*(void *)(a1 + 32) + 72) removeAllObjects];
    [*(id *)(*(void *)(a1 + 32) + 56) removeAllObjects];
    [*(id *)(*(void *)(a1 + 32) + 64) removeAllObjects];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 88), "removeDownloadObserver:");
    uint64_t v4 = [MEMORY[0x1E4FB8618] sharedMonitor];
    [v4 unregisterObserver:*(void *)(a1 + 32)];

    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(NSObject **)(v5 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __30__ATStoreMediaAssetLink_close__block_invoke_2;
    v8[3] = &unk_1E6B88B68;
    v8[4] = v5;
    id v9 = v3;
    id v7 = v3;
    dispatch_async(v6, v8);
  }
}

void __30__ATStoreMediaAssetLink_close__block_invoke_2(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) array];
  [v4 assetLink:v2 didCloseWithOutstandingAssets:v3];
}

- (BOOL)open
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__ATStoreMediaAssetLink_open__block_invoke;
  block[3] = &unk_1E6B88B40;
  void block[4] = self;
  dispatch_sync(queue, block);
  return 1;
}

void __29__ATStoreMediaAssetLink_open__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 8))
  {
    *(unsigned char *)(v1 + 8) = 1;
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 88), "addDownloadObserver:");
    uint64_t v3 = [MEMORY[0x1E4FB8618] sharedMonitor];
    [v3 registerObserver:*(void *)(a1 + 32)];

    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(NSObject **)(v4 + 40);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __29__ATStoreMediaAssetLink_open__block_invoke_2;
    block[3] = &unk_1E6B88B40;
    void block[4] = v4;
    dispatch_async(v5, block);
  }
}

void __29__ATStoreMediaAssetLink_open__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 assetLink:*(void *)(a1 + 32) didOpenWithPendingAssets:0];
}

- (ATStoreMediaAssetLink)init
{
  v21.receiver = self;
  v21.super_class = (Class)ATStoreMediaAssetLink;
  id v2 = [(ATStoreMediaAssetLink *)&v21 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_resumeAssetDownloadsActivity = 0;
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.amp.AirTraffic.ATStoreMediaAssetLink.queue", 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.amp.AirTraffic.ATStoreMediaAssetLink.resumeQueue", 0);
    resumeQueue = v3->_resumeQueue;
    v3->_resumeQueue = (OS_dispatch_queue *)v6;

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.amp.AirTraffic.ATStoreMediaAssetLink.callback", MEMORY[0x1E4F14430]);
    callbackQueue = v3->_callbackQueue;
    v3->_callbackQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA80] set];
    enqueuedDownloadAssets = v3->_enqueuedDownloadAssets;
    v3->_enqueuedDownloadAssets = (NSMutableSet *)v10;

    uint64_t v12 = [MEMORY[0x1E4F1CA80] set];
    resumableAssets = v3->_resumableAssets;
    v3->_resumableAssets = (NSMutableSet *)v12;

    uint64_t v14 = [MEMORY[0x1E4F1CA80] set];
    cancelledAssets = v3->_cancelledAssets;
    v3->_cancelledAssets = (NSMutableSet *)v14;

    uint64_t v16 = [MEMORY[0x1E4F1CA80] set];
    enqueuedRestoreAssets = v3->_enqueuedRestoreAssets;
    v3->_enqueuedRestoreAssets = (NSMutableSet *)v16;

    uint64_t v18 = +[ATStoreDownloadService sharedService];
    downloadService = v3->_downloadService;
    v3->_downloadService = (ATStoreDownloadService *)v18;
  }
  return v3;
}

@end