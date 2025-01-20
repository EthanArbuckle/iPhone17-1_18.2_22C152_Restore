@interface MSASAssetDownloader
- (BOOL)didEncounterNetworkConditionError;
- (BOOL)isDownloadingThumbnails;
- (BOOL)isWaitingForFirstDownloadEvent;
- (NSMutableArray)finishedAssets;
- (NSMutableArray)itemsInFlight;
- (NSMutableDictionary)assetToItemInFlightMap;
- (NSString)currentFocusAlbumGUID;
- (NSString)currentFocusAssetCollectionGUID;
- (NSString)downloadBatchPerfGUID;
- (NSString)objectGUID;
- (id)_orphanedAssetError;
- (id)_pathForPersonID:(id)a3;
- (id)workQueueObjectGUID;
- (int)state;
- (void)MMCSEngine:(id)a3 didCreateRequestorContext:(id)a4 forAssets:(id)a5;
- (void)MMCSEngine:(id)a3 didFinishGettingAsset:(id)a4 path:(id)a5 error:(id)a6;
- (void)MMCSEngine:(id)a3 didFinishPuttingAsset:(id)a4 error:(id)a5;
- (void)MMCSEngine:(id)a3 didMakeGetProgress:(float)a4 state:(int)a5 onAsset:(id)a6;
- (void)MMCSEngine:(id)a3 didMakePutProgress:(float)a4 state:(int)a5 onAsset:(id)a6;
- (void)_workQueueDidFinishWithItem:(id)a3 error:(id)a4;
- (void)_workQueueGoIdle;
- (void)_workQueueStopTrackingItem:(id)a3;
- (void)didFinishGettingAllAssets;
- (void)didFinishPuttingAllAssets;
- (void)registerAssets:(id)a3 completionBlock:(id)a4;
- (void)setAssetToItemInFlightMap:(id)a3;
- (void)setCurrentFocusAlbumGUID:(id)a3;
- (void)setCurrentFocusAssetCollectionGUID:(id)a3;
- (void)setDidEncounterNetworkConditionError:(BOOL)a3;
- (void)setDownloadBatchPerfGUID:(id)a3;
- (void)setFinishedAssets:(id)a3;
- (void)setIsDownloadingThumbnails:(BOOL)a3;
- (void)setIsWaitingForFirstDownloadEvent:(BOOL)a3;
- (void)setItemsInFlight:(id)a3;
- (void)setObjectGUID:(id)a3;
- (void)setState:(int)a3;
- (void)unregisterAssets:(id)a3;
- (void)workQueueCancel;
- (void)workQueueDownloadNextBatch;
- (void)workQueueRegisterAssets:(id)a3 completionBlock:(id)a4;
- (void)workQueueRetryOutstandingActivities;
- (void)workQueueShutDownCompletionBlock:(id)a3;
- (void)workQueueStop;
- (void)workQueueUnregisterAssets:(id)a3;
@end

@implementation MSASAssetDownloader

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadBatchPerfGUID, 0);
  objc_storeStrong((id *)&self->_objectGUID, 0);
  objc_storeStrong((id *)&self->_currentFocusAssetCollectionGUID, 0);
  objc_storeStrong((id *)&self->_currentFocusAlbumGUID, 0);
  objc_storeStrong((id *)&self->_finishedAssets, 0);
  objc_storeStrong((id *)&self->_assetToItemInFlightMap, 0);
  objc_storeStrong((id *)&self->_itemsInFlight, 0);
}

- (void)setDownloadBatchPerfGUID:(id)a3
{
}

- (NSString)downloadBatchPerfGUID
{
  return self->_downloadBatchPerfGUID;
}

- (void)setObjectGUID:(id)a3
{
}

- (NSString)objectGUID
{
  return self->_objectGUID;
}

- (void)setIsWaitingForFirstDownloadEvent:(BOOL)a3
{
  self->_isWaitingForFirstDownloadEvent = a3;
}

- (BOOL)isWaitingForFirstDownloadEvent
{
  return self->_isWaitingForFirstDownloadEvent;
}

- (void)setCurrentFocusAssetCollectionGUID:(id)a3
{
}

- (NSString)currentFocusAssetCollectionGUID
{
  return self->_currentFocusAssetCollectionGUID;
}

- (void)setCurrentFocusAlbumGUID:(id)a3
{
}

- (NSString)currentFocusAlbumGUID
{
  return self->_currentFocusAlbumGUID;
}

- (void)setIsDownloadingThumbnails:(BOOL)a3
{
  self->_isDownloadingThumbnails = a3;
}

- (BOOL)isDownloadingThumbnails
{
  return self->_isDownloadingThumbnails;
}

- (void)setDidEncounterNetworkConditionError:(BOOL)a3
{
  self->_didEncounterNetworkConditionError = a3;
}

- (BOOL)didEncounterNetworkConditionError
{
  return self->_didEncounterNetworkConditionError;
}

- (void)setFinishedAssets:(id)a3
{
}

- (NSMutableArray)finishedAssets
{
  return self->_finishedAssets;
}

- (void)setAssetToItemInFlightMap:(id)a3
{
}

- (NSMutableDictionary)assetToItemInFlightMap
{
  return self->_assetToItemInFlightMap;
}

- (void)setItemsInFlight:(id)a3
{
}

- (NSMutableArray)itemsInFlight
{
  return self->_itemsInFlight;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (int)state
{
  return self->_state;
}

- (void)didFinishGettingAllAssets
{
  v3 = [(MSASAssetTransferer *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__MSASAssetDownloader_didFinishGettingAllAssets__block_invoke;
  block[3] = &unk_1E6C3DA38;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __48__MSASAssetDownloader_didFinishGettingAllAssets__block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (![*(id *)(*(void *)(a1 + 32) + 120) count])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v2 = *(void *)(a1 + 32);
      uint64_t v3 = [*(id *)(v2 + 136) count];
      *(_DWORD *)buf = 138543618;
      uint64_t v29 = v2;
      __int16 v30 = 2048;
      uint64_t v31 = v3;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Finished downloading %ld assets.", buf, 0x16u);
    }
    v4 = MSPlatform();
    v5 = &off_1DC4FD000;
    if (objc_opt_respondsToSelector())
    {
      v6 = MSPlatform();
      int v7 = [v6 isPerformanceLoggingEnabled];

      if (v7)
      {
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v8 = *(id *)(*(void *)(a1 + 32) + 136);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = 0;
          uint64_t v12 = *(void *)v24;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v24 != v12) {
                objc_enumerationMutation(v8);
              }
              v14 = [*(id *)(*((void *)&v23 + 1) + 8 * i) metadata];
              v15 = [v14 objectForKey:@"MSAssetMetadataFileSize"];
              v11 += [v15 longLongValue];
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
          }
          while (v10);
        }
        else
        {
          uint64_t v11 = 0;
        }

        uint64_t v16 = [*(id *)(*(void *)(a1 + 32) + 136) count];
        v17 = +[MSPerformanceLogger sharedLogger];
        v18 = [*(id *)(a1 + 32) downloadBatchPerfGUID];
        v22[0] = MEMORY[0x1E4F143A8];
        v5 = &off_1DC4FD000;
        v22[1] = 3221225472;
        v22[2] = __48__MSASAssetDownloader_didFinishGettingAllAssets__block_invoke_36;
        v22[3] = &unk_1E6C3CE50;
        v22[4] = *(void *)(a1 + 32);
        v22[5] = v16;
        v22[6] = v11;
        [v17 summarizeOperation:@"MSASAssetDownloader.downloadRate" itemGUID:v18 formatBlock:v22];
      }
    }
    else
    {
    }
    [*(id *)(*(void *)(a1 + 32) + 136) removeAllObjects];
    v19 = [*(id *)(a1 + 32) eventQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = *((void *)v5 + 207);
    block[2] = __48__MSASAssetDownloader_didFinishGettingAllAssets__block_invoke_37;
    block[3] = &unk_1E6C3DA38;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(v19, block);
  }
  [*(id *)(a1 + 32) _workQueueGoIdle];
  uint64_t result = [*(id *)(a1 + 32) didEncounterNetworkConditionError];
  if ((result & 1) == 0) {
    return [*(id *)(a1 + 32) workQueueRetryOutstandingActivities];
  }
  return result;
}

void __48__MSASAssetDownloader_didFinishGettingAllAssets__block_invoke_36(void *a1, double a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = a1[4];
    uint64_t v5 = a1[5];
    uint64_t v6 = a1[6];
    int v7 = 138544386;
    uint64_t v8 = v4;
    __int16 v9 = 2048;
    uint64_t v10 = v5;
    __int16 v11 = 2048;
    uint64_t v12 = v6;
    __int16 v13 = 2048;
    double v14 = a2;
    __int16 v15 = 2048;
    double v16 = (double)v6 * 8.0 / a2 / 1000.0;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Finished downloading batch of %lu files, for a total of %lld bytes, in %0.3f seconds. Effective download rate: %0.3f kbps.", (uint8_t *)&v7, 0x34u);
  }
}

void __48__MSASAssetDownloader_didFinishGettingAllAssets__block_invoke_37(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 MSASAssetDownloaderDidFinishBatch:*(void *)(a1 + 32)];
}

- (void)MMCSEngine:(id)a3 didMakeGetProgress:(float)a4 state:(int)a5 onAsset:(id)a6
{
  id v9 = a6;
  uint64_t v10 = [(MSASAssetTransferer *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__MSASAssetDownloader_MMCSEngine_didMakeGetProgress_state_onAsset___block_invoke;
  block[3] = &unk_1E6C3CE28;
  int v14 = a5;
  float v15 = a4;
  block[4] = self;
  id v13 = v9;
  id v11 = v9;
  dispatch_async(v10, block);
}

void __67__MSASAssetDownloader_MMCSEngine_didMakeGetProgress_state_onAsset___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = MSPlatform();
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_6;
  }
  uint64_t v3 = MSPlatform();
  int v4 = [v3 isPerformanceLoggingEnabled];

  if (v4 && *(_DWORD *)(a1 + 48) == 3 && [*(id *)(a1 + 32) isWaitingForFirstDownloadEvent])
  {
    [*(id *)(a1 + 32) setIsWaitingForFirstDownloadEvent:0];
    id v2 = +[MSPerformanceLogger sharedLogger];
    uint64_t v5 = [*(id *)(a1 + 32) workQueueObjectGUID];
    [v2 summarizeOperation:@"MSASAssetDownloader.downloadLatency" itemGUID:v5 formatBlock:&__block_literal_global_34];

LABEL_6:
  }
  uint64_t v6 = MSASPlatform();
  int v7 = [v6 shouldLogAtLevel:7];

  if (v7)
  {
    float v8 = *(float *)(a1 + 52);
    BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
    if (v8 == -1.0)
    {
      if (v9)
      {
        uint64_t v16 = *(void *)(a1 + 32);
        id v11 = +[MMCSEngine logStringForGetItemState:*(unsigned int *)(a1 + 48)];
        uint64_t v17 = *(void **)(a1 + 40);
        int v18 = 138543874;
        uint64_t v19 = v16;
        __int16 v20 = 2114;
        double v21 = *(double *)&v11;
        __int16 v22 = 2048;
        long long v23 = v17;
        id v13 = MEMORY[0x1E4F14500];
        int v14 = "%{public}@: Download progress state: %{public}@, on asset: %p";
        uint32_t v15 = 32;
        goto LABEL_14;
      }
    }
    else if (v9)
    {
      uint64_t v10 = *(void *)(a1 + 32);
      id v11 = +[MMCSEngine logStringForGetItemState:*(unsigned int *)(a1 + 48)];
      uint64_t v12 = *(void *)(a1 + 40);
      int v18 = 138544130;
      uint64_t v19 = v10;
      __int16 v20 = 2048;
      double v21 = v8;
      __int16 v22 = 2114;
      long long v23 = v11;
      __int16 v24 = 2048;
      uint64_t v25 = v12;
      id v13 = MEMORY[0x1E4F14500];
      int v14 = "%{public}@: Download progress: %.2f, state: %{public}@, on asset: %p";
      uint32_t v15 = 42;
LABEL_14:
      _os_log_debug_impl(&dword_1DC434000, v13, OS_LOG_TYPE_DEBUG, v14, (uint8_t *)&v18, v15);
    }
  }
}

void __67__MSASAssetDownloader_MMCSEngine_didMakeGetProgress_state_onAsset___block_invoke_2(double a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    int v2 = 134217984;
    double v3 = a1;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Download Latency: %0.3f seconds.", (uint8_t *)&v2, 0xCu);
  }
}

- (id)_orphanedAssetError
{
  if (_orphanedAssetError_onceToken != -1) {
    dispatch_once(&_orphanedAssetError_onceToken, &__block_literal_global_5936);
  }
  int v2 = (void *)_orphanedAssetError_error;
  return v2;
}

void __42__MSASAssetDownloader__orphanedAssetError__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F28C58];
  double v3 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_ASSET_DOWNLOADER_ORPHANED");
  uint64_t v1 = [v0 MSErrorWithDomain:@"MSASAssetDownloaderErrorDomain" code:0 description:v3];
  int v2 = (void *)_orphanedAssetError_error;
  _orphanedAssetError_error = v1;
}

- (void)MMCSEngine:(id)a3 didFinishGettingAsset:(id)a4 path:(id)a5 error:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = [(MSASAssetTransferer *)self workQueue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __67__MSASAssetDownloader_MMCSEngine_didFinishGettingAsset_path_error___block_invoke;
  v16[3] = &unk_1E6C3D9C0;
  v16[4] = self;
  id v17 = v9;
  id v18 = v11;
  id v19 = v10;
  id v13 = v10;
  id v14 = v11;
  id v15 = v9;
  dispatch_async(v12, v16);
}

void __67__MSASAssetDownloader_MMCSEngine_didFinishGettingAsset_path_error___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(*(void *)(a1 + 32) + 128) objectForKey:*(void *)(a1 + 40)];
  double v3 = *(void **)(a1 + 48);
  if (v3)
  {
    if (v2)
    {
      uint64_t v4 = [v3 MMCSRetryAfterDate];
      if (v4)
      {
        uint64_t v5 = [*(id *)(a1 + 32) eventQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __67__MSASAssetDownloader_MMCSEngine_didFinishGettingAsset_path_error___block_invoke_2;
        block[3] = &unk_1E6C3DB28;
        block[4] = *(void *)(a1 + 32);
        id v34 = v4;
        dispatch_async(v5, block);
      }
      if ([*(id *)(a1 + 48) MMCSIsCancelError])
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          uint64_t v6 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138543362;
          uint64_t v36 = v6;
          _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Asset download was canceled. Ignoring.", buf, 0xCu);
        }
        [*(id *)(a1 + 32) _workQueueStopTrackingItem:v2];
        goto LABEL_32;
      }
      if ([*(id *)(a1 + 48) MMCSIsNetworkConditionsError])
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v14 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138543362;
          uint64_t v36 = v14;
          _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Encountered temporary network error while downloading asset. Will retry later.", buf, 0xCu);
        }
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          uint64_t v15 = *(void *)(a1 + 32);
          uint64_t v16 = [*(id *)(a1 + 48) MSVerboseDescription];
          *(_DWORD *)buf = 138543618;
          uint64_t v36 = v15;
          __int16 v37 = 2114;
          v38 = v16;
          _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Error: %{public}@", buf, 0x16u);
        }
        [*(id *)(a1 + 32) _workQueueStopTrackingItem:v2];
        [*(id *)(a1 + 32) setDidEncounterNetworkConditionError:1];
        goto LABEL_32;
      }
      if (([*(id *)(a1 + 48) MMCSIsFatalError] & 1) != 0
        || (int v19 = [v2 errorCount] + 1, v19 >= (int)objc_msgSend(*(id *)(a1 + 32), "maxRetryCount")))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          uint64_t v25 = *(void *)(a1 + 32);
          uint64_t v26 = *(void **)(a1 + 40);
          v27 = *(void **)(a1 + 48);
          *(_DWORD *)buf = 138543874;
          uint64_t v36 = v25;
          __int16 v37 = 2114;
          v38 = v26;
          __int16 v39 = 2114;
          v40 = v27;
          _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Failed to download asset: %{public}@. Error: %{public}@. Giving up.", buf, 0x20u);
        }
      }
      else
      {
        __int16 v20 = [*(id *)(a1 + 32) model];
        objc_msgSend(v20, "setErrorCount:forAssetInDownloadQueue:", objc_msgSend(v2, "errorCount") + 1, *(void *)(a1 + 40));

        if (![*(id *)(a1 + 48) MMCSIsAuthorizationError])
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            uint64_t v28 = *(void *)(a1 + 32);
            uint64_t v29 = *(void **)(a1 + 40);
            __int16 v30 = [*(id *)(a1 + 48) MSVerboseDescription];
            *(_DWORD *)buf = 138543874;
            uint64_t v36 = v28;
            __int16 v37 = 2114;
            v38 = v29;
            __int16 v39 = 2114;
            v40 = v30;
            _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Failed to download asset: %{public}@. Error: %{public}@. Will retry later.", buf, 0x20u);
          }
          [*(id *)(a1 + 32) _workQueueStopTrackingItem:v2];
          __int16 v24 = [*(id *)(a1 + 32) eventQueue];
          v32[0] = MEMORY[0x1E4F143A8];
          v32[1] = 3221225472;
          v32[2] = __67__MSASAssetDownloader_MMCSEngine_didFinishGettingAsset_path_error___block_invoke_26;
          v32[3] = &unk_1E6C3DA38;
          v32[4] = *(void *)(a1 + 32);
          dispatch_async(v24, v32);

          goto LABEL_32;
        }
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v21 = *(void *)(a1 + 32);
          __int16 v22 = *(void **)(a1 + 40);
          long long v23 = [*(id *)(a1 + 48) MSVerboseDescription];
          *(_DWORD *)buf = 138543874;
          uint64_t v36 = v21;
          __int16 v37 = 2114;
          v38 = v22;
          __int16 v39 = 2114;
          v40 = v23;
          _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Failed to download asset: %{public}@ due to MMCS auth error: %{public}@. Will reauthorize now.", buf, 0x20u);
        }
      }
      id v9 = *(void **)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 48);
      id v10 = v2;
LABEL_31:
      [v9 _workQueueDidFinishWithItem:v10 error:v11];
LABEL_32:

      goto LABEL_33;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      id v13 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v36 = v12;
      __int16 v37 = 2114;
      v38 = v13;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Already reported on asset %{public}@. Ignoring.", buf, 0x16u);
    }
  }
  else
  {
    if (v2)
    {
      uint64_t v4 = [v2 object];
      [v4 setPath:*(void *)(a1 + 56)];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        uint64_t v36 = v7;
        __int16 v37 = 2114;
        v38 = v4;
        _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Successfully downloaded asset %{public}@.", buf, 0x16u);
      }
      float v8 = [*(id *)(a1 + 32) eventQueue];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __67__MSASAssetDownloader_MMCSEngine_didFinishGettingAsset_path_error___block_invoke_27;
      v31[3] = &unk_1E6C3DA38;
      v31[4] = *(void *)(a1 + 32);
      dispatch_async(v8, v31);

      [*(id *)(*(void *)(a1 + 32) + 136) addObject:v4];
      id v9 = *(void **)(a1 + 32);
      id v10 = v2;
      uint64_t v11 = 0;
      goto LABEL_31;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      id v18 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v36 = v17;
      __int16 v37 = 2114;
      v38 = v18;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: We aren't expecting an event for asset %{public}@. Ignoring.", buf, 0x16u);
    }
  }
LABEL_33:
}

void __67__MSASAssetDownloader_MMCSEngine_didFinishGettingAsset_path_error___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) backoffManager];
  [v2 didReceiveRetryAfterDate:*(void *)(a1 + 40)];
}

void __67__MSASAssetDownloader_MMCSEngine_didFinishGettingAsset_path_error___block_invoke_26(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) backoffManager];
  [v1 backoff];
}

void __67__MSASAssetDownloader_MMCSEngine_didFinishGettingAsset_path_error___block_invoke_27(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) backoffManager];
  [v2 reset];

  id v4 = [*(id *)(a1 + 32) daemon];
  double v3 = [*(id *)(a1 + 32) personID];
  [v4 didReceiveAuthSuccessForPersonID:v3];
}

- (void)didFinishPuttingAllAssets
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v3 = 138543362;
    id v4 = self;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Unexpected callback: MMCSEngine:didFinishPuttingAllAssetsContext:", (uint8_t *)&v3, 0xCu);
  }
}

- (void)MMCSEngine:(id)a3 didMakePutProgress:(float)a4 state:(int)a5 onAsset:(id)a6
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v7 = 138543362;
    float v8 = self;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Unexpected callback: MMCSEngine:didMakePutProgress:state:context:", (uint8_t *)&v7, 0xCu);
  }
}

- (void)MMCSEngine:(id)a3 didCreateRequestorContext:(id)a4 forAssets:(id)a5
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543362;
    int v7 = self;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Unexpected callback: MMCSEngine:didCreateRequestorContext:context:error:", (uint8_t *)&v6, 0xCu);
  }
}

- (void)MMCSEngine:(id)a3 didFinishPuttingAsset:(id)a4 error:(id)a5
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543362;
    int v7 = self;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Unexpected callback: MMCSEngine:didFinishPuttingAsset:context:error:", (uint8_t *)&v6, 0xCu);
  }
}

- (void)_workQueueDidFinishWithItem:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(MSASAssetDownloader *)self _workQueueStopTrackingItem:v7];
  uint64_t v8 = [v7 object];
  uint64_t v9 = [v7 albumGUID];

  id v10 = [(MSASAssetTransferer *)self model];
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObject:v8];
  [v10 removeAssetsFromDownloadQueue:v11];

  uint64_t v12 = [(MSASAssetTransferer *)self eventQueue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __57__MSASAssetDownloader__workQueueDidFinishWithItem_error___block_invoke;
  v16[3] = &unk_1E6C3D9C0;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v6;
  id v13 = v6;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(v12, v16);
}

void __57__MSASAssetDownloader__workQueueDidFinishWithItem_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 MSASAssetDownloader:*(void *)(a1 + 32) didFinishDownloadingAsset:*(void *)(a1 + 40) inAlbumGUID:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

- (void)_workQueueStopTrackingItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 object];
  [(NSMutableArray *)self->_itemsInFlight removeObject:v4];

  [(NSMutableDictionary *)self->_assetToItemInFlightMap removeObjectForKey:v5];
}

- (void)workQueueUnregisterAssets:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * v8);
        id v10 = [(MSASAssetTransferer *)self engine];
        [v10 unregisterAsset:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)unregisterAssets:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MSASAssetTransferer *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__MSASAssetDownloader_unregisterAssets___block_invoke;
  v7[3] = &unk_1E6C3DB28;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __40__MSASAssetDownloader_unregisterAssets___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) workQueueUnregisterAssets:*(void *)(a1 + 40)];
}

- (void)workQueueRegisterAssets:(id)a3 completionBlock:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v11++), "setMMCSItemID:", -[MSASAssetTransferer workQueueNextItemID](self, "workQueueNextItemID"));
      }
      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
  long long v12 = [(MSASAssetTransferer *)self engine];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __63__MSASAssetDownloader_workQueueRegisterAssets_completionBlock___block_invoke;
  v14[3] = &unk_1E6C3DB00;
  v14[4] = self;
  id v15 = v7;
  id v13 = v7;
  [v12 registerAssets:v6 forDownloadCompletionBlock:v14];
}

void __63__MSASAssetDownloader_workQueueRegisterAssets_completionBlock___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    id v2 = [*(id *)(a1 + 32) workQueue];
    dispatch_async(v2, *(dispatch_block_t *)(a1 + 40));
  }
}

- (void)registerAssets:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(MSASAssetTransferer *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__MSASAssetDownloader_registerAssets_completionBlock___block_invoke;
  block[3] = &unk_1E6C3D198;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __54__MSASAssetDownloader_registerAssets_completionBlock___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__MSASAssetDownloader_registerAssets_completionBlock___block_invoke_2;
  v5[3] = &unk_1E6C3DB00;
  id v4 = *(id *)(a1 + 48);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v2 workQueueRegisterAssets:v3 completionBlock:v5];
}

void __54__MSASAssetDownloader_registerAssets_completionBlock___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    id v2 = [*(id *)(a1 + 32) eventQueue];
    dispatch_async(v2, *(dispatch_block_t *)(a1 + 40));
  }
}

- (void)workQueueDownloadNextBatch
{
  uint64_t v216 = *MEMORY[0x1E4F143B8];
  if ([(MSASAssetTransferer *)self hasShutDown])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v206 = self;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Not downloading any more assets because we're shutting down.", buf, 0xCu);
    }
    return;
  }
  [(MSASAssetDownloader *)self setDidEncounterNetworkConditionError:0];
  [(MSASAssetDownloader *)self setCurrentFocusAssetCollectionGUID:0];
  [(MSASAssetDownloader *)self setCurrentFocusAlbumGUID:0];
  [(MSASAssetDownloader *)self setIsDownloadingThumbnails:0];
  uint64_t v3 = [(MSASAssetTransferer *)self eventQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__MSASAssetDownloader_workQueueDownloadNextBatch__block_invoke;
  block[3] = &unk_1E6C3DA38;
  block[4] = self;
  dispatch_async(v3, block);

  id v4 = [(MSASAssetTransferer *)self focusAssetCollectionGUID];

  if (v4)
  {
    uint64_t v5 = [(MSASAssetTransferer *)self model];
    id v6 = [(MSASAssetTransferer *)self focusAssetCollectionGUID];
    id v7 = [v5 nextItemsForDownloadFocusAlbumGUID:0 focusAssetCollectionGUID:v6 thumbnails:1 maxCount:100 isInflight:0];

    uint64_t v8 = [v7 count];
    if (v8)
    {
      id v9 = v7;
LABEL_9:
      [(MSASAssetDownloader *)self setIsDownloadingThumbnails:v8 != 0];
      id v12 = [(MSASAssetTransferer *)self focusAssetCollectionGUID];
      [(MSASAssetDownloader *)self setCurrentFocusAssetCollectionGUID:v12];

      goto LABEL_10;
    }
    id v10 = [(MSASAssetTransferer *)self model];
    uint64_t v11 = [(MSASAssetTransferer *)self focusAssetCollectionGUID];
    id v9 = [v10 nextItemsForDownloadFocusAlbumGUID:0 focusAssetCollectionGUID:v11 thumbnails:0 maxCount:100 isInflight:0];

    if ([v9 count]) {
      goto LABEL_9;
    }
  }
  else
  {
    id v9 = 0;
  }
LABEL_10:
  if (![v9 count])
  {
    id v13 = [(MSASAssetTransferer *)self focusAlbumGUID];

    if (v13)
    {
      long long v14 = [(MSASAssetTransferer *)self model];
      id v15 = [(MSASAssetTransferer *)self focusAlbumGUID];
      long long v16 = [v14 nextItemsForDownloadFocusAlbumGUID:v15 focusAssetCollectionGUID:0 thumbnails:1 maxCount:100 isInflight:0];

      uint64_t v17 = [v16 count];
      if (v17)
      {
        id v9 = v16;
      }
      else
      {
        long long v18 = [(MSASAssetTransferer *)self model];
        long long v19 = [(MSASAssetTransferer *)self focusAlbumGUID];
        id v9 = [v18 nextItemsForDownloadFocusAlbumGUID:v19 focusAssetCollectionGUID:0 thumbnails:0 maxCount:100 isInflight:0];

        if (![v9 count]) {
          goto LABEL_16;
        }
      }
      [(MSASAssetDownloader *)self setIsDownloadingThumbnails:v17 != 0];
      __int16 v20 = [(MSASAssetTransferer *)self focusAlbumGUID];
      [(MSASAssetDownloader *)self setCurrentFocusAlbumGUID:v20];
    }
  }
LABEL_16:
  if ([v9 count]) {
    goto LABEL_21;
  }
  uint64_t v21 = [(MSASAssetTransferer *)self model];
  __int16 v22 = [v21 nextItemsForDownloadFocusAlbumGUID:0 focusAssetCollectionGUID:0 thumbnails:1 maxCount:100 isInflight:0];

  uint64_t v23 = [v22 count];
  if (v23)
  {
    id v9 = v22;
  }
  else
  {
    __int16 v24 = [(MSASAssetTransferer *)self model];
    id v9 = [v24 nextItemsForDownloadFocusAlbumGUID:0 focusAssetCollectionGUID:0 thumbnails:0 maxCount:100 isInflight:0];

    if (![v9 count]) {
      goto LABEL_21;
    }
  }
  [(MSASAssetDownloader *)self setIsDownloadingThumbnails:v23 != 0];
LABEL_21:
  v163 = self;
  if (![v9 count])
  {
    itemsInFlight = self->_itemsInFlight;
    if (!itemsInFlight || ![(NSMutableArray *)itemsInFlight count])
    {
      uint64_t v26 = [(MSASAssetTransferer *)self model];
      v27 = [v26 nextItemsForDownloadFocusAlbumGUID:0 focusAssetCollectionGUID:0 thumbnails:1 maxCount:100 isInflight:1];

      uint64_t v28 = [v27 count];
      if (v28)
      {
        id v9 = v27;
      }
      else
      {
        uint64_t v29 = [(MSASAssetTransferer *)self model];
        id v9 = [v29 nextItemsForDownloadFocusAlbumGUID:0 focusAssetCollectionGUID:0 thumbnails:0 maxCount:100 isInflight:1];

        if (![v9 count]) {
          goto LABEL_28;
        }
      }
      [(MSASAssetDownloader *)self setIsDownloadingThumbnails:v28 != 0];
    }
LABEL_28:
    if (![v9 count])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v206 = self;
        _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Nothing to download.", buf, 0xCu);
      }
      [(MSASAssetDownloader *)self _workQueueGoIdle];
      goto LABEL_126;
    }
  }
  self->_state = 1;
  v156 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  if (!self->_itemsInFlight)
  {
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    __int16 v30 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    uint64_t v31 = self->_itemsInFlight;
    self->_itemsInFlight = v30;
  }
  if (!self->_assetToItemInFlightMap)
  {
    objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
    uint64_t v32 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    assetToItemInFlightMap = self->_assetToItemInFlightMap;
    self->_assetToItemInFlightMap = v32;
  }
  if (!self->_finishedAssets)
  {
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    id v34 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    finishedAssets = self->_finishedAssets;
    self->_finishedAssets = v34;
  }
  v158 = [MEMORY[0x1E4F1CA60] dictionary];
  v155 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v36 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  long long v197 = 0u;
  long long v198 = 0u;
  long long v199 = 0u;
  long long v200 = 0u;
  id v37 = v9;
  uint64_t v38 = [v37 countByEnumeratingWithState:&v197 objects:v215 count:16];
  if (!v38)
  {
    v162 = 0;
    goto LABEL_51;
  }
  uint64_t v39 = v38;
  v162 = 0;
  uint64_t v40 = *(void *)v198;
  do
  {
    for (uint64_t i = 0; i != v39; ++i)
    {
      if (*(void *)v198 != v40) {
        objc_enumerationMutation(v37);
      }
      v42 = *(void **)(*((void *)&v197 + 1) + 8 * i);
      v43 = [v42 object];
      v44 = [v43 MMCSURL];

      if (!v44)
      {
        v47 = (void *)MEMORY[0x1E4F1C9E8];
        v48 = [(MSASAssetTransferer *)v163 _missingURLError];
        v49 = [v42 albumGUID];
        v50 = objc_msgSend(v47, "dictionaryWithObjectsAndKeys:", v48, @"error", v49, @"albumGUID", 0);

        [v158 setObject:v50 forKey:v43];
        goto LABEL_47;
      }
      v45 = [v43 MMCSURL];
      if (!v162)
      {
        v162 = v45;
LABEL_46:
        [v36 addObject:v42];
        goto LABEL_47;
      }
      int v46 = [v162 isEqual:v45];

      if (v46) {
        goto LABEL_46;
      }
LABEL_47:
    }
    uint64_t v39 = [v37 countByEnumeratingWithState:&v197 objects:v215 count:16];
  }
  while (v39);
LABEL_51:
  id v154 = v37;

  long long v195 = 0u;
  long long v196 = 0u;
  long long v193 = 0u;
  long long v194 = 0u;
  obuint64_t j = v36;
  uint64_t v51 = [obj countByEnumeratingWithState:&v193 objects:v214 count:16];
  if (!v51) {
    goto LABEL_65;
  }
  uint64_t v52 = v51;
  uint64_t v53 = *(void *)v194;
  while (2)
  {
    uint64_t v54 = 0;
    while (2)
    {
      if (*(void *)v194 != v53) {
        objc_enumerationMutation(obj);
      }
      v55 = *(void **)(*((void *)&v193 + 1) + 8 * v54);
      v56 = [v55 object];
      v57 = [v56 MMCSAccessHeader];

      if (v57)
      {
        uint64_t v58 = [v56 MMCSAccessHeaderTimeStamp];
        if (v58)
        {
          v59 = (void *)v58;
          v60 = [MEMORY[0x1E4F1C9C8] date];
          v61 = [v56 MMCSAccessHeaderTimeStamp];
          [v60 timeIntervalSinceDate:v61];
          double v63 = v62;
          [(MSASAssetTransferer *)v163 workQueueMaxMMCSTokenValidityTimeInterval];
          double v65 = v64;

          if (v63 > v65)
          {
            v66 = (void *)MEMORY[0x1E4F1C9E8];
            v67 = [(MSASAssetTransferer *)v163 _MMCSTokenTooOldError];
            v68 = [v55 albumGUID];
            v69 = objc_msgSend(v66, "dictionaryWithObjectsAndKeys:", v67, @"error", v68, @"albumGUID", 0);

            v70 = v158;
            goto LABEL_62;
          }
        }
        [v156 addObject:v55];
      }
      else
      {
        v71 = (void *)MEMORY[0x1E4F1C9E8];
        v72 = [(MSASAssetTransferer *)v163 _missingMMCSTokenError];
        v73 = [v55 albumGUID];
        v69 = objc_msgSend(v71, "dictionaryWithObjectsAndKeys:", v72, @"error", v73, @"albumGUID", 0);

        v70 = v155;
LABEL_62:
        [v70 setObject:v69 forKey:v56];
      }
      if (v52 != ++v54) {
        continue;
      }
      break;
    }
    uint64_t v52 = [obj countByEnumeratingWithState:&v193 objects:v214 count:16];
    if (v52) {
      continue;
    }
    break;
  }
LABEL_65:

  uint64_t v74 = [v158 count];
  uint64_t v75 = [v155 count] + v74;
  if (v75)
  {
    v76 = [(MSASAssetTransferer *)v163 eventQueue];
    v192[0] = MEMORY[0x1E4F143A8];
    v192[1] = 3221225472;
    v192[2] = __49__MSASAssetDownloader_workQueueDownloadNextBatch__block_invoke_18;
    v192[3] = &unk_1E6C3DAB0;
    v192[4] = v163;
    v192[5] = v75;
    dispatch_async(v76, v192);

    long long v190 = 0u;
    long long v191 = 0u;
    long long v188 = 0u;
    long long v189 = 0u;
    id v161 = v158;
    uint64_t v77 = [v161 countByEnumeratingWithState:&v188 objects:v213 count:16];
    if (v77)
    {
      uint64_t v78 = v77;
      uint64_t v159 = *(void *)v189;
      v79 = MEMORY[0x1E4F14500];
      do
      {
        for (uint64_t j = 0; j != v78; ++j)
        {
          if (*(void *)v189 != v159) {
            objc_enumerationMutation(v161);
          }
          uint64_t v81 = *(void *)(*((void *)&v188 + 1) + 8 * j);
          v82 = [v161 objectForKey:v81];
          v83 = [v82 objectForKey:@"error"];
          v84 = [v82 objectForKey:@"albumGUID"];
          v85 = v79;
          if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138544130;
            v206 = v163;
            __int16 v207 = 2114;
            uint64_t v208 = v81;
            __int16 v209 = 2114;
            v210 = v84;
            __int16 v211 = 2114;
            v212 = v83;
            _os_log_error_impl(&dword_1DC434000, v79, OS_LOG_TYPE_ERROR, "%{public}@: Rejecting asset %{public}@ from albumGUID %{public}@. Error: %{public}@", buf, 0x2Au);
          }

          v86 = [(MSASAssetTransferer *)v163 eventQueue];
          v185[0] = MEMORY[0x1E4F143A8];
          v185[1] = 3221225472;
          v185[2] = __49__MSASAssetDownloader_workQueueDownloadNextBatch__block_invoke_19;
          v185[3] = &unk_1E6C3D9C0;
          v185[4] = v163;
          v185[5] = v81;
          id v87 = v84;
          id v186 = v87;
          id v88 = v83;
          id v187 = v88;
          dispatch_async(v86, v185);
        }
        uint64_t v78 = [v161 countByEnumeratingWithState:&v188 objects:v213 count:16];
      }
      while (v78);
    }

    v89 = v163;
    if ([v155 count])
    {
      v90 = MEMORY[0x1E4F14500];
      id v91 = MEMORY[0x1E4F14500];
      if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v92 = [v155 count];
        *(_DWORD *)buf = 138543618;
        v206 = v163;
        __int16 v207 = 2048;
        uint64_t v208 = v92;
        _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Needing to get auth token for %lu assets", buf, 0x16u);
      }

      long long v183 = 0u;
      long long v184 = 0u;
      long long v181 = 0u;
      long long v182 = 0u;
      id v93 = v155;
      uint64_t v94 = [v93 countByEnumeratingWithState:&v181 objects:v204 count:16];
      if (v94)
      {
        uint64_t v95 = v94;
        uint64_t v160 = *(void *)v182;
        do
        {
          for (uint64_t k = 0; k != v95; ++k)
          {
            if (*(void *)v182 != v160) {
              objc_enumerationMutation(v93);
            }
            uint64_t v97 = *(void *)(*((void *)&v181 + 1) + 8 * k);
            v98 = [v93 objectForKey:v97];
            v99 = [v98 objectForKey:@"error"];
            v100 = [v98 objectForKey:@"albumGUID"];
            v101 = [(MSASAssetTransferer *)v163 eventQueue];
            v178[0] = MEMORY[0x1E4F143A8];
            v178[1] = 3221225472;
            v178[2] = __49__MSASAssetDownloader_workQueueDownloadNextBatch__block_invoke_20;
            v178[3] = &unk_1E6C3D9C0;
            v178[4] = v163;
            v178[5] = v97;
            id v102 = v100;
            id v179 = v102;
            id v103 = v99;
            id v180 = v103;
            dispatch_async(v101, v178);
          }
          uint64_t v95 = [v93 countByEnumeratingWithState:&v181 objects:v204 count:16];
        }
        while (v95);
      }

      v89 = v163;
    }
    v104 = [(MSASAssetTransferer *)v89 model];
    v105 = [v161 allKeys];
    [v104 removeAssetsFromDownloadQueue:v105];

    v106 = [(MSASAssetTransferer *)v89 model];
    v107 = [v155 allKeys];
    [v106 removeAssetsFromDownloadQueue:v107];

    v108 = [(MSASAssetTransferer *)v89 eventQueue];
    v177[0] = MEMORY[0x1E4F143A8];
    v177[1] = 3221225472;
    v177[2] = __49__MSASAssetDownloader_workQueueDownloadNextBatch__block_invoke_2;
    v177[3] = &unk_1E6C3DA38;
    v177[4] = v89;
    dispatch_async(v108, v177);
  }
  v109 = v156;
  if ([v156 count])
  {
    v110 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v156, "count"));
    long long v173 = 0u;
    long long v174 = 0u;
    long long v175 = 0u;
    long long v176 = 0u;
    id v111 = v156;
    uint64_t v112 = [v111 countByEnumeratingWithState:&v173 objects:v203 count:16];
    if (v112)
    {
      uint64_t v113 = v112;
      uint64_t v114 = *(void *)v174;
      do
      {
        for (uint64_t m = 0; m != v113; ++m)
        {
          if (*(void *)v174 != v114) {
            objc_enumerationMutation(v111);
          }
          v116 = *(void **)(*((void *)&v173 + 1) + 8 * m);
          v117 = [v116 object];
          [v110 addObject:v117];
          [(NSMutableArray *)v163->_itemsInFlight addObject:v116];
          [(NSMutableDictionary *)v163->_assetToItemInFlightMap setObject:v116 forKey:v117];
          v118 = [(MSASAssetTransferer *)v163 engine];
          [v118 reregisterAssetForDownload:v117];
        }
        uint64_t v113 = [v111 countByEnumeratingWithState:&v173 objects:v203 count:16];
      }
      while (v113);
    }

    v119 = MEMORY[0x1E4F14500];
    id v120 = MEMORY[0x1E4F14500];
    v121 = v163;
    if (os_log_type_enabled(v119, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v153 = [v110 count];
      *(_DWORD *)buf = 138543618;
      v206 = v163;
      __int16 v207 = 2048;
      uint64_t v208 = v153;
      _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Downloading %ld assets.", buf, 0x16u);
    }

    v122 = [(MSASAssetTransferer *)v163 eventQueue];
    v171[0] = MEMORY[0x1E4F143A8];
    v171[1] = 3221225472;
    v171[2] = __49__MSASAssetDownloader_workQueueDownloadNextBatch__block_invoke_21;
    v171[3] = &unk_1E6C3DB28;
    v171[4] = v163;
    id v123 = v110;
    id v172 = v123;
    dispatch_async(v122, v171);

    v124 = MSPlatform();
    if (objc_opt_respondsToSelector())
    {
      v125 = MSPlatform();
      int v126 = [v125 isPerformanceLoggingEnabled];

      if (v126)
      {
        [(MSASAssetDownloader *)v163 setIsWaitingForFirstDownloadEvent:1];
        v127 = +[MSPerformanceLogger sharedLogger];
        v128 = [(MSASAssetDownloader *)v163 workQueueObjectGUID];
        [v127 startOperation:@"MSASAssetDownloader.downloadLatency" itemGUID:v128];

        v129 = [NSString MSMakeUUID];
        [(MSASAssetDownloader *)v163 setDownloadBatchPerfGUID:v129];

        v121 = v163;
        v124 = +[MSPerformanceLogger sharedLogger];
        v130 = [(MSASAssetDownloader *)v163 downloadBatchPerfGUID];
        [v124 startOperation:@"MSASAssetDownloader.downloadRate" itemGUID:v130];

        goto LABEL_100;
      }
    }
    else
    {
LABEL_100:
    }
    v131 = MSASPlatform();
    char v132 = objc_opt_respondsToSelector();

    if (v132)
    {
      v133 = MSASPlatform();
      v134 = [(MSASAssetTransferer *)v121 personID];
      v135 = [v133 MMCSDownloadSocketOptionsForPersonID:v134];

      if (v135)
      {
        v136 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v135 forKey:*MEMORY[0x1E4F739B8]];
      }
      else
      {
        v136 = 0;
      }
    }
    else
    {
      v136 = 0;
    }
    v137 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:6];
    long long v167 = 0u;
    long long v168 = 0u;
    long long v169 = 0u;
    long long v170 = 0u;
    id v138 = v123;
    uint64_t v139 = [v138 countByEnumeratingWithState:&v167 objects:v202 count:16];
    if (v139)
    {
      uint64_t v140 = v139;
      int v141 = 0;
      uint64_t v142 = *(void *)v168;
      do
      {
        for (uint64_t n = 0; n != v140; ++n)
        {
          if (*(void *)v168 != v142) {
            objc_enumerationMutation(v138);
          }
          [v137 addObject:*(void *)(*((void *)&v167 + 1) + 8 * n)];
          if (++v141 == [(MSASAssetTransferer *)v163 maxBatchCount])
          {
            v144 = [(MSASAssetTransferer *)v163 eventQueue];
            v166[0] = MEMORY[0x1E4F143A8];
            v166[1] = 3221225472;
            v166[2] = __49__MSASAssetDownloader_workQueueDownloadNextBatch__block_invoke_2_24;
            v166[3] = &unk_1E6C3DA38;
            v166[4] = v163;
            dispatch_async(v144, v166);

            v145 = [(MSASAssetTransferer *)v163 engine];
            v146 = (void *)[v137 copy];
            v147 = [(MSASAssetTransferer *)v163 personID];
            [v145 getAssets:v146 requestURL:v162 DSID:v147 options:v136];

            [v137 removeAllObjects];
            int v141 = 0;
          }
        }
        uint64_t v140 = [v138 countByEnumeratingWithState:&v167 objects:v202 count:16];
      }
      while (v140);
    }

    if ([v137 count])
    {
      v148 = [(MSASAssetTransferer *)v163 eventQueue];
      v165[0] = MEMORY[0x1E4F143A8];
      v165[1] = 3221225472;
      v165[2] = __49__MSASAssetDownloader_workQueueDownloadNextBatch__block_invoke_3;
      v165[3] = &unk_1E6C3DA38;
      v165[4] = v163;
      dispatch_async(v148, v165);

      v149 = [(MSASAssetTransferer *)v163 engine];
      v150 = [(MSASAssetTransferer *)v163 personID];
      [v149 getAssets:v137 requestURL:v162 DSID:v150 options:v136];
    }
    v151 = [(MSASAssetTransferer *)v163 model];
    [v151 setInFlightAssets:v138];

    v152 = [(MSASAssetTransferer *)v163 eventQueue];
    v164[0] = MEMORY[0x1E4F143A8];
    v164[1] = 3221225472;
    v164[2] = __49__MSASAssetDownloader_workQueueDownloadNextBatch__block_invoke_4;
    v164[3] = &unk_1E6C3DA38;
    v164[4] = v163;
    dispatch_async(v152, v164);

    id v9 = v154;
    v109 = v156;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v206 = v163;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: No assets to download.", buf, 0xCu);
    }
    [(MSASAssetDownloader *)v163 _workQueueGoIdle];
    id v9 = v154;
  }

LABEL_126:
}

void __49__MSASAssetDownloader_workQueueDownloadNextBatch__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) daemon];
  [v1 retainBusy];
}

void __49__MSASAssetDownloader_workQueueDownloadNextBatch__block_invoke_18(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 MSASAssetDownloader:*(void *)(a1 + 32) willBeginBatchCount:*(void *)(a1 + 40)];
}

void __49__MSASAssetDownloader_workQueueDownloadNextBatch__block_invoke_19(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 MSASAssetDownloader:*(void *)(a1 + 32) didFinishDownloadingAsset:*(void *)(a1 + 40) inAlbumGUID:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

void __49__MSASAssetDownloader_workQueueDownloadNextBatch__block_invoke_20(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 MSASAssetDownloader:*(void *)(a1 + 32) didFinishDownloadingAsset:*(void *)(a1 + 40) inAlbumGUID:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

void __49__MSASAssetDownloader_workQueueDownloadNextBatch__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 MSASAssetDownloaderDidFinishBatch:*(void *)(a1 + 32)];
}

void __49__MSASAssetDownloader_workQueueDownloadNextBatch__block_invoke_21(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  objc_msgSend(v2, "MSASAssetDownloader:willBeginBatchCount:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "count"));
}

void __49__MSASAssetDownloader_workQueueDownloadNextBatch__block_invoke_2_24(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) daemon];
  [v1 retainBusy];
}

void __49__MSASAssetDownloader_workQueueDownloadNextBatch__block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) daemon];
  [v1 retainBusy];
}

void __49__MSASAssetDownloader_workQueueDownloadNextBatch__block_invoke_4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) daemon];
  [v1 releaseBusy];
}

- (void)_workQueueGoIdle
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    id v9 = self;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Work queue go idle.", buf, 0xCu);
  }
  uint64_t v3 = [(MSASAssetTransferer *)self eventQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__MSASAssetDownloader__workQueueGoIdle__block_invoke;
  block[3] = &unk_1E6C3DA38;
  block[4] = self;
  dispatch_async(v3, block);

  if ([(MSASAssetDownloader *)self state] && ![(NSMutableArray *)self->_itemsInFlight count])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      id v9 = self;
      _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Setting idle state.", buf, 0xCu);
    }
    itemsInFlight = self->_itemsInFlight;
    self->_itemsInFlight = 0;

    assetToItemInFlightMap = self->_assetToItemInFlightMap;
    self->_assetToItemInFlightMap = 0;

    finishedAssets = self->_finishedAssets;
    self->_finishedAssets = 0;

    self->_state = 0;
    [(MSASAssetTransferer *)self _sendDidIdleNotification];
  }
}

void __39__MSASAssetDownloader__workQueueGoIdle__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) daemon];
  [v1 releaseBusy];
}

- (void)workQueueCancel
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (self->_state == 1)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v34 = self;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Canceling all downloads.", buf, 0xCu);
    }
    uint64_t v3 = [(MSASAssetTransferer *)self engine];
    [v3 cancelAllOperations];

    id v4 = MSPlatform();
    if (objc_opt_respondsToSelector())
    {
      uint64_t v5 = MSPlatform();
      int v6 = [v5 isPerformanceLoggingEnabled];

      if (!v6) {
        goto LABEL_8;
      }
      [(MSASAssetDownloader *)self setIsWaitingForFirstDownloadEvent:0];
      id v7 = +[MSPerformanceLogger sharedLogger];
      uint64_t v8 = [(MSASAssetDownloader *)self workQueueObjectGUID];
      [v7 discardOperation:@"MSASAssetDownloader.downloadLatency" itemGUID:v8];

      id v4 = +[MSPerformanceLogger sharedLogger];
      id v9 = [(MSASAssetDownloader *)self downloadBatchPerfGUID];
      [v4 discardOperation:@"MSASAssetDownloader.downloadRate" itemGUID:v9];
    }
  }
LABEL_8:
  uint64_t v10 = [(MSASAssetTransferer *)self model];
  uint64_t v11 = [v10 nextItemsForDownloadFocusAlbumGUID:0 focusAssetCollectionGUID:0 maxCount:10];

  while ([v11 count])
  {
    context = (void *)MEMORY[0x1E019E3B0]();
    id v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v11, "count"));
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v29 != v16) {
            objc_enumerationMutation(v13);
          }
          long long v18 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          long long v19 = [v18 object];
          __int16 v20 = [(MSASAssetTransferer *)self eventQueue];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __38__MSASAssetDownloader_workQueueCancel__block_invoke;
          block[3] = &unk_1E6C3D998;
          block[4] = self;
          id v26 = v19;
          v27 = v18;
          id v21 = v19;
          dispatch_async(v20, block);

          [v12 addObject:v21];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v15);
    }

    __int16 v22 = [(MSASAssetTransferer *)self model];
    [v22 removeAssetsFromDownloadQueue:v12];

    uint64_t v23 = [(MSASAssetTransferer *)self model];
    uint64_t v11 = [v23 nextItemsForDownloadFocusAlbumGUID:0 focusAssetCollectionGUID:0 maxCount:10];
  }
}

void __38__MSASAssetDownloader_workQueueCancel__block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 48) albumGUID];
  uint64_t v5 = [*(id *)(a1 + 32) _canceledError];
  [v6 MSASAssetDownloader:v2 didFinishDownloadingAsset:v3 inAlbumGUID:v4 error:v5];
}

- (void)workQueueShutDownCompletionBlock:(id)a3
{
  id v4 = a3;
  [(MSASAssetDownloader *)self workQueueStop];
  v5.receiver = self;
  v5.super_class = (Class)MSASAssetDownloader;
  [(MSASAssetTransferer *)&v5 workQueueShutDownCompletionBlock:v4];
}

- (void)workQueueStop
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_state == 1)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      uint64_t v11 = self;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Stopping all downloads.", (uint8_t *)&v10, 0xCu);
    }
    uint64_t v3 = [(MSASAssetTransferer *)self engine];
    [v3 cancelAllOperations];

    [(MSASAssetDownloader *)self _workQueueGoIdle];
    id v4 = MSPlatform();
    if (objc_opt_respondsToSelector())
    {
      objc_super v5 = MSPlatform();
      int v6 = [v5 isPerformanceLoggingEnabled];

      if (!v6) {
        return;
      }
      [(MSASAssetDownloader *)self setIsWaitingForFirstDownloadEvent:0];
      id v7 = +[MSPerformanceLogger sharedLogger];
      uint64_t v8 = [(MSASAssetDownloader *)self workQueueObjectGUID];
      [v7 stopOperation:@"MSASAssetDownloader.downloadLatency" itemGUID:v8];

      id v4 = +[MSPerformanceLogger sharedLogger];
      id v9 = [(MSASAssetDownloader *)self downloadBatchPerfGUID];
      [v4 stopOperation:@"MSASAssetDownloader.downloadRate" itemGUID:v9];
    }
  }
}

- (id)workQueueObjectGUID
{
  objectGUID = self->_objectGUID;
  if (!objectGUID)
  {
    id v4 = [NSString MSMakeUUID];
    objc_super v5 = self->_objectGUID;
    self->_objectGUID = v4;

    objectGUID = self->_objectGUID;
  }
  return objectGUID;
}

- (void)workQueueRetryOutstandingActivities
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  unsigned int state = self->_state;
  if (state > 1)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v8 = 138543618;
      id v9 = self;
      __int16 v10 = 1024;
      unsigned int v11 = state;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Unknown state: %d", (uint8_t *)&v8, 0x12u);
    }
    id v7 = MSPlatform();
    [v7 didDetectUnrecoverableCondition];
  }
  else
  {
    id v4 = MSASPlatform();
    objc_super v5 = [(MSASAssetTransferer *)self personID];
    int v6 = [v4 MSASPersonIDIsAllowedToDownloadAssets:v5];

    if (v6)
    {
      [(MSASAssetDownloader *)self workQueueDownloadNextBatch];
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      id v9 = self;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Not allowed to download assets at this time.", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (id)_pathForPersonID:(id)a3
{
  return MSPathAlbumSharingSubscribeMMCSLibraryForPersonID(a3);
}

@end