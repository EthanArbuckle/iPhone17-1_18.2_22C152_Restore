@interface ATAssetLinkController
+ (id)sharedInstance;
- (ATAssetLinkController)init;
- (BOOL)_assetIsEnqueued:(id)a3;
- (BOOL)_canEnqueueAsset:(id)a3;
- (BOOL)_canEnqueueAsset:(id)a3 onLink:(id)a4;
- (BOOL)_shouldReleaseKeepAliveTransaction;
- (BOOL)assetIsEnqueued:(id)a3;
- (id)allAssetLinks;
- (id)allAssets;
- (id)filteredAssetsToDownloadForAssets:(id)a3;
- (unint64_t)_getMaxThermalPressureThreshold;
- (void)_addFailedLink:(id)a3 forAsset:(id)a4;
- (void)_assetsDidChange;
- (void)_cancelAssets:(id)a3 withError:(id)a4 completion:(id)a5;
- (void)_finishAsset:(id)a3 withError:(id)a4;
- (void)_handleEnqueue:(id)a3 onLink:(id)a4 withPriority:(BOOL)a5;
- (void)_performSelectorOnObservers:(SEL)a3 object:(id)a4 object:(id)a5;
- (void)_prioritizeAsset:(id)a3 onLinkClass:(Class)a4;
- (void)_updateCountsForFinishedTrackAssetTypes:(id)a3;
- (void)addAssetLink:(id)a3;
- (void)addObserver:(id)a3;
- (void)assetLink:(id)a3 didCloseWithOutstandingAssets:(id)a4;
- (void)assetLink:(id)a3 didFinishAsset:(id)a4 error:(id)a5 retryable:(BOOL)a6;
- (void)assetLink:(id)a3 didFinishAsset:(id)a4 error:(id)a5 retryable:(BOOL)a6 cancelPendingAssetsInBatch:(BOOL)a7;
- (void)assetLink:(id)a3 didOpenWithPendingAssets:(id)a4;
- (void)assetLink:(id)a3 didPauseAsseDownload:(id)a4 error:(id)a5;
- (void)assetLink:(id)a3 didUpdateAsset:(id)a4 progress:(double)a5;
- (void)assetLink:(id)a3 didUpdateDownloadPauseReasonForAssets:(id)a4;
- (void)assetLinkDidChange:(id)a3;
- (void)cancelAllAssetsMatchingPredicate:(id)a3 excludeActiveDownloads:(BOOL)a4 withError:(id)a5 completion:(id)a6;
- (void)cancelAssets:(id)a3 withCompletion:(id)a4;
- (void)cancelAssets:(id)a3 withError:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)dispatchBlockOnControllerQueue:(id)a3;
- (void)enqueueAssetForStoreDownload:(int64_t)a3 withCompletion:(id)a4;
- (void)enqueueAssets:(id)a3;
- (void)enqueueAssets:(id)a3 progress:(id)a4 completion:(id)a5;
- (void)environmentMonitorDidChangeNetworkReachability:(id)a3;
- (void)environmentMonitorDidChangeNetworkType:(id)a3;
- (void)environmentMonitorDidChangeThermalLevel:(id)a3;
- (void)installCompleteForAssets:(id)a3;
- (void)prioritizeAsset:(id)a3;
- (void)prioritizeAssetWithStoreForLibraryIdentifier:(int64_t)a3 withCompletion:(id)a4;
- (void)removeAssetLink:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setPendingAssets:(id)a3;
@end

@implementation ATAssetLinkController

uint64_t __34__ATAssetLinkController_allAssets__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 16) copy];

  return MEMORY[0x1F41817F8]();
}

- (id)allAssets
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__743;
  v10 = __Block_byref_object_dispose__744;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__ATAssetLinkController_allAssets__block_invoke;
  v5[3] = &unk_1E6B8C490;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_766 != -1) {
    dispatch_once(&sharedInstance_onceToken_766, &__block_literal_global_767);
  }
  v2 = (void *)__sharedInstance;

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeDownLoadsKeepAliveTransaction, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_progressBlocksForAssetsInFlight, 0);
  objc_storeStrong((id *)&self->_nonTrackAssetsPendingInstallByAssetType, 0);
  objc_storeStrong((id *)&self->_trackAssetsPendingInstallByAssetType, 0);
  objc_storeStrong((id *)&self->_activeTrackAssetsByAssetType, 0);
  objc_storeStrong((id *)&self->_assetsToFailedLinks, 0);
  objc_storeStrong((id *)&self->_assetsToLinks, 0);
  objc_storeStrong((id *)&self->_assetQueue, 0);

  objc_storeStrong((id *)&self->_assetLinks, 0);
}

- (void)_updateCountsForFinishedTrackAssetTypes:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    id v23 = v4;
    v5 = [MEMORY[0x1E4F1CA80] set];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v40 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v32 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          id v11 = [(NSMutableDictionary *)self->_trackAssetsPendingInstallByAssetType objectForKey:v10];
          uint64_t v12 = [v11 count];

          v13 = [(NSMutableDictionary *)self->_activeTrackAssetsByAssetType objectForKey:v10];
          uint64_t v14 = [v13 count];

          if (!(v12 | v14)) {
            [v5 addObject:v10];
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v40 count:16];
      }
      while (v7);
    }

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    obuint64_t j = v5;
    uint64_t v15 = [obj countByEnumeratingWithState:&v27 objects:v39 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v28 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void *)(*((void *)&v27 + 1) + 8 * j);
          v19 = _ATLogCategoryFramework();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            *(void *)&buf[4] = self;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v18;
            _os_log_impl(&dword_1D9BC7000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ Finished processing all track assets of assetType %{public}@.", buf, 0x16u);
          }

          [(ATAssetLinkController *)self _performSelectorOnObservers:sel_assetLinkController_didProcessAllTrackAssetsWithAssetType_ object:self object:v18];
        }
        uint64_t v15 = [obj countByEnumeratingWithState:&v27 objects:v39 count:16];
      }
      while (v15);
    }

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    uint64_t v38 = 0;
    activeTrackAssetsByAssetType = self->_activeTrackAssetsByAssetType;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __65__ATAssetLinkController__updateCountsForFinishedTrackAssetTypes___block_invoke;
    v26[3] = &unk_1E6B8C018;
    v26[4] = buf;
    [(NSMutableDictionary *)activeTrackAssetsByAssetType enumerateKeysAndObjectsUsingBlock:v26];
    trackAssetsPendingInstallByAssetType = self->_trackAssetsPendingInstallByAssetType;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __65__ATAssetLinkController__updateCountsForFinishedTrackAssetTypes___block_invoke_2;
    v25[3] = &unk_1E6B8C018;
    v25[4] = buf;
    [(NSMutableDictionary *)trackAssetsPendingInstallByAssetType enumerateKeysAndObjectsUsingBlock:v25];
    if (!*(void *)(*(void *)&buf[8] + 24))
    {
      v22 = _ATLogCategoryFramework();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v35 = 138543362;
        v36 = self;
        _os_log_impl(&dword_1D9BC7000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ Finished processing all track assets.", v35, 0xCu);
      }

      [(ATAssetLinkController *)self _performSelectorOnObservers:sel_assetLinkControllerDidProcessAllTrackAssets_ object:self object:0];
    }
    _Block_object_dispose(buf, 8);

    id v4 = v23;
  }
}

uint64_t __65__ATAssetLinkController__updateCountsForFinishedTrackAssetTypes___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 count];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t __65__ATAssetLinkController__updateCountsForFinishedTrackAssetTypes___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 count];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (BOOL)_assetIsEnqueued:(id)a3
{
  id v4 = a3;
  if (([(NSMutableOrderedSet *)self->_assetQueue containsObject:v4] & 1) != 0
    || ([(NSMapTable *)self->_assetsToLinks objectForKey:v4],
        v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v17 = 0;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    trackAssetsPendingInstallByAssetType = self->_trackAssetsPendingInstallByAssetType;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __42__ATAssetLinkController__assetIsEnqueued___block_invoke;
    v14[3] = &unk_1E6B8BFF0;
    id v9 = v4;
    id v15 = v9;
    uint64_t v16 = &v17;
    [(NSMutableDictionary *)trackAssetsPendingInstallByAssetType enumerateKeysAndObjectsUsingBlock:v14];
    if (*((unsigned char *)v18 + 24))
    {
      BOOL v6 = 1;
    }
    else
    {
      nonTrackAssetsPendingInstallByAssetType = self->_nonTrackAssetsPendingInstallByAssetType;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __42__ATAssetLinkController__assetIsEnqueued___block_invoke_2;
      v11[3] = &unk_1E6B8BFF0;
      id v12 = v9;
      v13 = &v17;
      [(NSMutableDictionary *)nonTrackAssetsPendingInstallByAssetType enumerateKeysAndObjectsUsingBlock:v11];

      BOOL v6 = *((unsigned char *)v18 + 24) != 0;
    }

    _Block_object_dispose(&v17, 8);
  }

  return v6;
}

uint64_t __42__ATAssetLinkController__assetIsEnqueued___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t result = [a3 containsObject:*(void *)(a1 + 32)];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

uint64_t __42__ATAssetLinkController__assetIsEnqueued___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t result = [a3 containsObject:*(void *)(a1 + 32)];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (BOOL)_shouldReleaseKeepAliveTransaction
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableOrderedSet *)self->_assetQueue count] || [(NSMapTable *)self->_assetsToLinks count])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    int v3 = [(MSVXPCTransaction *)self->_activeDownLoadsKeepAliveTransaction isActive];
    if (v3)
    {
      id v4 = _ATLogCategoryFramework();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 138543362;
        uint64_t v7 = self;
        _os_log_impl(&dword_1D9BC7000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Done with all downloads - release keep alive transaction.", (uint8_t *)&v6, 0xCu);
      }

      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (void)dispatchBlockOnControllerQueue:(id)a3
{
}

- (void)_prioritizeAsset:(id)a3 onLinkClass:(Class)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(NSMapTable *)self->_assetsToLinks objectForKey:v6];
  if (v7 && ![(NSMutableOrderedSet *)self->_assetQueue containsObject:v6]) {
    goto LABEL_28;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v8 = self->_assetLinks;
  uint64_t v9 = [(NSMutableOrderedSet *)v8 countByEnumeratingWithState:&v21 objects:v34 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    char v20 = v7;
    uint64_t v11 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (a4 && (objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v14 = _ATLogCategoryFramework();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            id v15 = [(objc_class *)a4 description];
            *(_DWORD *)buf = 138544130;
            v26 = self;
            __int16 v27 = 2114;
            id v28 = v6;
            __int16 v29 = 2114;
            id v30 = v13;
            __int16 v31 = 2114;
            long long v32 = v15;
            _os_log_impl(&dword_1D9BC7000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Not prioritizing %{public}@ on %{public}@ - required link type:%{public}@", buf, 0x2Au);
          }
        }
        else if ([(ATAssetLinkController *)self _canEnqueueAsset:v6 onLink:v13])
        {
          id v33 = v6;
          uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
          uint64_t v17 = [v13 enqueueAssets:v16 force:1];

          if (v17 && [v17 count])
          {
            uint64_t v18 = _ATLogCategoryFramework();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543874;
              v26 = self;
              __int16 v27 = 2114;
              id v28 = v13;
              __int16 v29 = 2114;
              id v30 = v6;
              _os_log_impl(&dword_1D9BC7000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ Enqueued asset due to prioritization on %{public}@: %{public}@", buf, 0x20u);
            }

            id v7 = v13;
            [(NSMutableOrderedSet *)self->_assetQueue removeObject:v6];
            [(NSMapTable *)self->_assetsToLinks setObject:v7 forKey:v6];
          }
          else
          {
            uint64_t v19 = _ATLogCategoryFramework();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v26 = self;
              __int16 v27 = 2114;
              id v28 = v13;
              _os_log_impl(&dword_1D9BC7000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ couldn't enqueue prioritized asset on %{public}@ - move to top of the queue", buf, 0x16u);
            }

            [(NSMutableOrderedSet *)self->_assetQueue removeObject:v6];
            [(NSMutableOrderedSet *)self->_assetQueue insertObject:v6 atIndex:0];
            id v7 = v20;
          }

          goto LABEL_27;
        }
      }
      uint64_t v10 = [(NSMutableOrderedSet *)v8 countByEnumeratingWithState:&v21 objects:v34 count:16];
      if (v10) {
        continue;
      }
      break;
    }
    id v7 = v20;
  }
LABEL_27:

  if (v7)
  {
LABEL_28:
    [v7 prioritizeAsset:v6];
  }
}

- (unint64_t)_getMaxThermalPressureThreshold
{
  v2 = [MEMORY[0x1E4FB8608] currentDeviceInfo];
  if ([v2 isWatch])
  {
    int v3 = [MEMORY[0x1E4FB8618] sharedMonitor];
    [v3 currentBatteryLevel];
    if (v4 <= 0.8) {
      unint64_t v5 = 20;
    }
    else {
      unint64_t v5 = 30;
    }
  }
  else
  {
    unint64_t v5 = 30;
  }

  return v5;
}

- (void)_assetsDidChange
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v28 = (void *)[(NSMutableOrderedSet *)self->_assetQueue copy];
  if ([(NSMutableOrderedSet *)self->_assetQueue count])
  {
    int v3 = [MEMORY[0x1E4F1CA48] array];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    obuint64_t j = self->_assetLinks;
    uint64_t v4 = [(NSMutableOrderedSet *)obj countByEnumeratingWithState:&v38 objects:v47 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v39;
      uint64_t v27 = *(void *)v39;
      do
      {
        uint64_t v7 = 0;
        uint64_t v29 = v5;
        do
        {
          if (*(void *)v39 != v6) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void **)(*((void *)&v38 + 1) + 8 * v7);
          if ([v8 linkIsReady])
          {
            uint64_t v31 = v7;
            id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            long long v34 = 0u;
            long long v35 = 0u;
            long long v36 = 0u;
            long long v37 = 0u;
            id v10 = v28;
            uint64_t v11 = [v10 countByEnumeratingWithState:&v34 objects:v46 count:16];
            if (!v11) {
              goto LABEL_32;
            }
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v35;
            id v32 = v9;
            while (1)
            {
              uint64_t v14 = 0;
              do
              {
                if (*(void *)v35 != v13) {
                  objc_enumerationMutation(v10);
                }
                id v15 = *(void **)(*((void *)&v34 + 1) + 8 * v14);
                if ([(ATAssetLinkController *)self _canEnqueueAsset:v15 onLink:v8])
                {
                  uint64_t v16 = [(NSMapTable *)self->_assetsToLinks objectForKey:v15];
                  uint64_t v17 = (void *)v16;
                  if (v16) {
                    BOOL v18 = v16 == (void)v8;
                  }
                  else {
                    BOOL v18 = 1;
                  }
                  if (v18)
                  {
                    [(NSMapTable *)self->_assetsToLinks setObject:v8 forKey:v15];
                    char v19 = [v15 isPrioritized];
                    char v20 = v9;
                    if ((v19 & 1) == 0)
                    {
                      if (self->_cachedThermalLevel >= [(ATAssetLinkController *)self _getMaxThermalPressureThreshold])
                      {
                        long long v22 = v3;
                        long long v23 = _ATLogCategoryFramework();
                        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
                        {
                          *(_DWORD *)buf = 138543618;
                          v43 = self;
                          __int16 v44 = 2114;
                          v45 = v15;
                          _os_log_impl(&dword_1D9BC7000, v23, OS_LOG_TYPE_DEBUG, "%{public}@ Not enqueuing %{public}@ due to thermal pressure.", buf, 0x16u);
                        }

                        int v3 = v22;
                        id v9 = v32;
                        if ([v15 downloadPauseReason]) {
                          goto LABEL_21;
                        }
                        objc_msgSend(v15, "setDownloadPauseReason:", objc_msgSend(v15, "downloadPauseReason") | 1);
                        char v20 = v3;
                      }
                      else
                      {
                        char v21 = [v15 downloadPauseReason];
                        char v20 = v33;
                        if (v21)
                        {
                          objc_msgSend(v15, "setDownloadPauseReason:", objc_msgSend(v15, "downloadPauseReason") & 0xFFFFFFFFFFFFFFFELL);
                          [v3 addObject:v15];
                          char v20 = v33;
                        }
                      }
                    }
                    [v20 addObject:v15];
                  }
LABEL_21:
                }
                ++v14;
              }
              while (v12 != v14);
              uint64_t v24 = [v10 countByEnumeratingWithState:&v34 objects:v46 count:16];
              uint64_t v12 = v24;
              if (!v24)
              {
LABEL_32:

                [(ATAssetLinkController *)self _handleEnqueue:v9 onLink:v8 withPriority:1];
                [(ATAssetLinkController *)self _handleEnqueue:v33 onLink:v8 withPriority:0];

                uint64_t v6 = v27;
                uint64_t v5 = v29;
                uint64_t v7 = v31;
                break;
              }
            }
          }
          ++v7;
        }
        while (v7 != v5);
        uint64_t v5 = [(NSMutableOrderedSet *)obj countByEnumeratingWithState:&v38 objects:v47 count:16];
      }
      while (v5);
    }

    if ([v3 count])
    {
      v25 = _ATLogCategoryFramework_Oversize();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v43 = self;
        __int16 v44 = 2114;
        v45 = v3;
        _os_log_impl(&dword_1D9BC7000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ Download paused reason changed for %{public}@", buf, 0x16u);
      }

      [(ATAssetLinkController *)self _performSelectorOnObservers:sel_assetLinkController_didChangeDownloadStateForAssets_ object:self object:v3];
    }
  }
  else
  {
    v26 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D9BC7000, v26, OS_LOG_TYPE_DEFAULT, "No active downloads - posting ATAssetLinkControllerDidFinishAllAssets notification.", buf, 2u);
    }

    int v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 postNotificationName:@"ATAssetLinkControllerDidFinishAllAssets" object:self];
  }
}

- (void)_handleEnqueue:(id)a3 onLink:(id)a4 withPriority:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([v8 count])
  {
    id v10 = [v9 enqueueAssets:v8 force:0];
    uint64_t v11 = v10;
    if (v10 && [v10 count])
    {
      uint64_t v12 = _ATLogCategoryFramework();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = [v11 count];
        uint64_t v14 = [v11 count];
        id v15 = @"assets";
        *(_DWORD *)buf = 138544130;
        __int16 v43 = 1024;
        v42 = self;
        if (v14 == 1) {
          id v15 = @"asset";
        }
        int v44 = v13;
        __int16 v45 = 2114;
        v46 = v15;
        __int16 v47 = 2114;
        id v48 = v9;
        _os_log_impl(&dword_1D9BC7000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Enqueued %d %{public}@ on %{public}@:", buf, 0x26u);
      }
      id v28 = self;
      id v30 = v8;

      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      uint64_t v29 = v11;
      id v16 = v11;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v36 != v19) {
              objc_enumerationMutation(v16);
            }
            char v21 = *(ATAssetLinkController **)(*((void *)&v35 + 1) + 8 * i);
            long long v22 = _ATLogCategoryFramework();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v42 = v21;
              _os_log_impl(&dword_1D9BC7000, v22, OS_LOG_TYPE_DEFAULT, "    %{public}@", buf, 0xCu);
            }

            [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
            -[ATAssetLinkController setTransferStartTime:](v21, "setTransferStartTime:");
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v35 objects:v40 count:16];
        }
        while (v18);
      }

      [(NSMutableOrderedSet *)v28->_assetQueue removeObjectsInArray:v16];
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v23 = v16;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v31 objects:v39 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v32;
        do
        {
          for (uint64_t j = 0; j != v25; ++j)
          {
            if (*(void *)v32 != v26) {
              objc_enumerationMutation(v23);
            }
            if (v5) {
              [v9 prioritizeAsset:*(void *)(*((void *)&v31 + 1) + 8 * j)];
            }
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v31 objects:v39 count:16];
        }
        while (v25);
      }

      id v8 = v30;
      uint64_t v11 = v29;
    }
  }
}

- (BOOL)_canEnqueueAsset:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v5 = self->_assetLinks;
  uint64_t v6 = [(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (-[ATAssetLinkController _canEnqueueAsset:onLink:](self, "_canEnqueueAsset:onLink:", v4, *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12))
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)_canEnqueueAsset:(id)a3 onLink:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 canEnqueueAsset:v6] && objc_msgSend(v7, "isOpen"))
  {
    uint64_t v8 = [(NSMapTable *)self->_assetsToFailedLinks objectForKey:v6];
    id v9 = v8;
    BOOL v10 = !v8 || ([v8 containsObject:v7] & 1) == 0;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)_addFailedLink:(id)a3 forAsset:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(NSMapTable *)self->_assetsToFailedLinks objectForKey:v6];
  if (!v7)
  {
    id v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    [(NSMapTable *)self->_assetsToFailedLinks setObject:v7 forKey:v6];
  }
  [v7 addObject:v8];
}

- (void)_finishAsset:(id)a3 withError:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!ATIsPendingDownloadError(v7))
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v14 = v13;
    [v6 queueStartTime];
    [v6 setQueueDuration:v14 - v15];
    [v6 transferStartTime];
    if (v16 != 0.0)
    {
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      double v18 = v17;
      [v6 transferStartTime];
      [v6 setTransferDuration:v18 - v19];
    }
    [(NSMapTable *)self->_assetsToFailedLinks removeObjectForKey:v6];
    char v20 = [v6 assetType];
    if ([v6 assetParts])
    {
      uint64_t v24 = [(NSMutableDictionary *)self->_trackAssetsPendingInstallByAssetType objectForKey:v20];
      if (v24)
      {
        id v23 = v24;
        [v24 addObject:v6];
      }
      else
      {
        id v23 = [MEMORY[0x1E4F1CA80] setWithObject:v6];
        [(NSMutableDictionary *)self->_trackAssetsPendingInstallByAssetType setObject:v23 forKey:v20];
      }
      long long v32 = [(NSMutableDictionary *)self->_activeTrackAssetsByAssetType objectForKey:v20];
      [v32 removeObject:v6];
    }
    else
    {
      nonTrackAssetsPendingInstallByAssetType = self->_nonTrackAssetsPendingInstallByAssetType;
      long long v22 = [v6 assetType];
      id v23 = [(NSMutableDictionary *)nonTrackAssetsPendingInstallByAssetType objectForKey:v22];

      if (v23)
      {
        [v23 addObject:v6];
      }
      else
      {
        id v23 = [MEMORY[0x1E4F1CA80] setWithObject:v6];
        id v30 = self->_nonTrackAssetsPendingInstallByAssetType;
        long long v31 = [v6 assetType];
        [(NSMutableDictionary *)v30 setObject:v23 forKey:v31];
      }
    }

    [(NSMutableDictionary *)self->_progressBlocksForAssetsInFlight removeObjectForKey:v6];
    [v6 setError:v7];
    [v6 setAssetState:2];
    long long v33 = [v6 completionBlock];

    if (v33)
    {
      long long v34 = [v6 completionBlock];
      ((void (**)(void, id))v34)[2](v34, v6);
    }
    [(ATAssetLinkController *)self _performSelectorOnObservers:sel_assetLinkController_didFinishAsset_ object:self object:v6];
    long long v35 = +[ATStatusMonitor sharedMonitor];
    id v38 = v6;
    long long v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
    [v35 updateAssets:v36];

    if (v7)
    {
      long long v37 = [v7 domain];
      if ([v37 isEqualToString:@"ATError"]) {
        [v7 code];
      }
    }
    ATReportEventIncrementingScalarKey();
    goto LABEL_30;
  }
  [v6 setAssetState:1];
  id v8 = [v6 progressBlock];

  if (v8)
  {
    uint64_t v9 = [(NSMutableDictionary *)self->_progressBlocksForAssetsInFlight objectForKey:v6];
    if (v9)
    {
      BOOL v10 = (void *)v9;
      uint64_t v11 = [v6 progressBlock];
      long long v12 = (void *)[v11 copy];
      [v10 addObject:v12];
    }
    else
    {
      uint64_t v25 = (void *)MEMORY[0x1E4F1CA48];
      uint64_t v26 = [v6 progressBlock];
      uint64_t v27 = (void *)[v26 copy];
      BOOL v10 = [v25 arrayWithObject:v27];

      [(NSMutableDictionary *)self->_progressBlocksForAssetsInFlight setObject:v10 forKey:v6];
    }
    id v28 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      long long v40 = self;
      __int16 v41 = 2114;
      id v42 = v6;
      _os_log_impl(&dword_1D9BC7000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ Added progress callback for pending asset %{public}@", buf, 0x16u);
    }
  }
  [v6 setError:v7];
  uint64_t v29 = [v6 completionBlock];

  if (v29)
  {
    char v20 = [v6 completionBlock];
    ((void (**)(void, id))v20)[2](v20, v6);
LABEL_30:
  }
}

- (void)_cancelAssets:(id)a3 withError:(id)a4 completion:(id)a5
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v64 = self;
    __int16 v65 = 2048;
    uint64_t v66 = [v8 count];
    _os_log_impl(&dword_1D9BC7000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ cancelling %lu assets", buf, 0x16u);
  }

  if ([v8 count])
  {
    id v46 = v10;
    id v48 = v9;
    long long v12 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v49 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v47 = v8;
    id v13 = v8;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v58 objects:v73 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v59;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v59 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v58 + 1) + 8 * i);
          char v19 = [(NSMutableOrderedSet *)self->_assetQueue containsObject:v18];
          uint64_t v20 = [(NSMapTable *)self->_assetsToLinks objectForKey:v18];
          char v21 = (void *)v20;
          if ((v19 & 1) != 0 || v20)
          {
            if (v20)
            {
              id v23 = [v49 objectForKey:v20];
              if (v23)
              {
                uint64_t v24 = v23;
                [v23 addObject:v18];
              }
              else
              {
                uint64_t v24 = [MEMORY[0x1E4F1CA48] arrayWithObject:v18];
                [v49 setObject:v24 forKey:v21];
              }
            }
            [v12 addObject:v18];
          }
          else
          {
            long long v22 = _ATLogCategoryFramework();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v64 = self;
              __int16 v65 = 2114;
              uint64_t v66 = v18;
              _os_log_impl(&dword_1D9BC7000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ is not enqueued and will not be cancelled", buf, 0x16u);
            }
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v58 objects:v73 count:16];
      }
      while (v15);
    }

    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __60__ATAssetLinkController__cancelAssets_withError_completion___block_invoke;
    v56[3] = &unk_1E6B8BFC8;
    id v25 = v48;
    id v57 = v25;
    uint64_t v26 = (void (**)(void, void, void))MEMORY[0x1E016C2E0](v56);
    assetQueue = self->_assetQueue;
    id v28 = [v12 allObjects];
    [(NSMutableOrderedSet *)assetQueue removeObjectsInArray:v28];

    uint64_t v29 = _ATLogCategoryFramework_Oversize();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      id v30 = self->_assetQueue;
      *(_DWORD *)buf = 138544386;
      v64 = self;
      __int16 v65 = 2114;
      uint64_t v66 = (uint64_t)v13;
      __int16 v67 = 2114;
      id v68 = v25;
      __int16 v69 = 2114;
      v70 = v12;
      __int16 v71 = 2114;
      v72 = v30;
      _os_log_impl(&dword_1D9BC7000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ Request to cancel %{public}@ with error %{public}@ - will cancel %{public}@, pending assets %{public}@", buf, 0x34u);
    }

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v31 = v12;
    uint64_t v32 = [v31 countByEnumeratingWithState:&v52 objects:v62 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v53;
      do
      {
        for (uint64_t j = 0; j != v33; ++j)
        {
          if (*(void *)v53 != v34) {
            objc_enumerationMutation(v31);
          }
          uint64_t v36 = *(void *)(*((void *)&v52 + 1) + 8 * j);
          [(NSMapTable *)self->_assetsToFailedLinks removeObjectForKey:v36];
          [(NSMapTable *)self->_assetsToLinks removeObjectForKey:v36];
          long long v37 = ((void (**)(void, uint64_t, id))v26)[2](v26, v36, v25);
          [(ATAssetLinkController *)self _finishAsset:v36 withError:v37];
        }
        uint64_t v33 = [v31 countByEnumeratingWithState:&v52 objects:v62 count:16];
      }
      while (v33);
    }

    id v38 = v49;
    long long v39 = [v49 keyEnumerator];
    uint64_t v40 = [v39 nextObject];
    id v8 = v47;
    if (v40)
    {
      __int16 v41 = (void *)v40;
      do
      {
        id v42 = [v38 objectForKey:v41];
        uint64_t v43 = _ATLogCategoryFramework_Oversize();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          v64 = self;
          __int16 v65 = 2114;
          uint64_t v66 = (uint64_t)v42;
          __int16 v67 = 2114;
          id v68 = v41;
          _os_log_impl(&dword_1D9BC7000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@ Cancelling %{public}@ on link %{public}@", buf, 0x20u);
        }

        [v41 cancelAssets:v42];
        uint64_t v44 = [v39 nextObject];

        __int16 v41 = (void *)v44;
        id v38 = v49;
      }
      while (v44);
    }
    [(ATAssetLinkController *)self _assetsDidChange];

    id v9 = v48;
    id v10 = v46;
  }
  if (v10)
  {
    callbackQueue = self->_callbackQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__ATAssetLinkController__cancelAssets_withError_completion___block_invoke_58;
    block[3] = &unk_1E6B8C158;
    id v51 = v10;
    dispatch_async(callbackQueue, block);
  }
}

id __60__ATAssetLinkController__cancelAssets_withError_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 assetType];

  if (!v4) {
    [v3 setAssetType:@"Unknown"];
  }
  BOOL v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    id v7 = [v3 error];

    if (v7) {
      [v3 error];
    }
    else {
    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:2 userInfo:0];
    }
  }
  id v8 = v6;

  return v8;
}

uint64_t __60__ATAssetLinkController__cancelAssets_withError_completion___block_invoke_58(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_performSelectorOnObservers:(SEL)a3 object:(id)a4 object:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)[(NSHashTable *)self->_observers copy];
  callbackQueue = self->_callbackQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67__ATAssetLinkController__performSelectorOnObservers_object_object___block_invoke;
  v15[3] = &unk_1E6B8BFA0;
  id v16 = v10;
  id v17 = v8;
  id v18 = v9;
  SEL v19 = a3;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(callbackQueue, v15);
}

void __67__ATAssetLinkController__performSelectorOnObservers_object_object___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "performSelector:withObject:withObject:", *(void *)(a1 + 56), *(void *)(a1 + 40), *(void *)(a1 + 48), (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)environmentMonitorDidChangeNetworkReachability:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__ATAssetLinkController_environmentMonitorDidChangeNetworkReachability___block_invoke;
  v7[3] = &unk_1E6B8C5A0;
  id v8 = v4;
  long long v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __72__ATAssetLinkController_environmentMonitorDidChangeNetworkReachability___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) isNetworkConstrained];
  if (*(unsigned __int8 *)(*(void *)(a1 + 40) + 104) != result)
  {
    int v3 = result;
    id v4 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = *(unsigned __int8 *)(v5 + 104);
      int v7 = 138543874;
      uint64_t v8 = v5;
      __int16 v9 = 1024;
      int v10 = v6;
      __int16 v11 = 1024;
      int v12 = v3;
      _os_log_impl(&dword_1D9BC7000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Network constraint changed old=%d, new=%d - resuming downloads", (uint8_t *)&v7, 0x18u);
    }

    *(unsigned char *)(*(void *)(a1 + 40) + 104) = v3;
    return [*(id *)(a1 + 40) _assetsDidChange];
  }
  return result;
}

- (void)environmentMonitorDidChangeNetworkType:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__ATAssetLinkController_environmentMonitorDidChangeNetworkType___block_invoke;
  v7[3] = &unk_1E6B8C5A0;
  id v8 = v4;
  __int16 v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __64__ATAssetLinkController_environmentMonitorDidChangeNetworkType___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) networkType];
  uint64_t result = ICEnvironmentNetworkTypeIsCellular();
  uint64_t v4 = *(void *)(a1 + 40);
  if (*(unsigned __int8 *)(v4 + 105) != result)
  {
    *(unsigned char *)(v4 + 105) = result;
    if (!*(unsigned char *)(*(void *)(a1 + 40) + 105))
    {
      uint64_t v5 = _ATLogCategoryFramework();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(a1 + 40);
        int v7 = 138543618;
        uint64_t v8 = v6;
        __int16 v9 = 1024;
        int v10 = v2;
        _os_log_impl(&dword_1D9BC7000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Network type=%d is not a cellular network - resuming downloads", (uint8_t *)&v7, 0x12u);
      }

      return [*(id *)(a1 + 40) _assetsDidChange];
    }
  }
  return result;
}

- (void)environmentMonitorDidChangeThermalLevel:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__ATAssetLinkController_environmentMonitorDidChangeThermalLevel___block_invoke;
  v7[3] = &unk_1E6B8C5A0;
  id v8 = v4;
  __int16 v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

unint64_t __65__ATAssetLinkController_environmentMonitorDidChangeThermalLevel___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [*(id *)(a1 + 32) currentThermalLevel];
  unint64_t result = [*(id *)(a1 + 40) _getMaxThermalPressureThreshold];
  uint64_t v4 = *(void *)(a1 + 40);
  unint64_t v5 = *(void *)(v4 + 96);
  if (v5 >= result && v2 < result)
  {
    id v8 = _ATLogCategoryFramework();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    uint64_t v10 = *(void *)(a1 + 40);
    int v13 = 138543362;
    uint64_t v14 = v10;
    uint64_t v11 = "%{public}@ Thermal levels changed - resuming downloads";
    goto LABEL_15;
  }
  if (v5 >= result || v2 < result)
  {
    *(void *)(v4 + 96) = v2;
    return result;
  }
  id v8 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void *)(a1 + 40);
    int v13 = 138543362;
    uint64_t v14 = v12;
    uint64_t v11 = "%{public}@ Thermal levels changed - updating download paused reason for thermal reasons";
LABEL_15:
    _os_log_impl(&dword_1D9BC7000, v8, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v13, 0xCu);
  }
LABEL_16:

  *(void *)(*(void *)(a1 + 40) + 96) = v2;
  return [*(id *)(a1 + 40) _assetsDidChange];
}

- (void)assetLink:(id)a3 didUpdateDownloadPauseReasonForAssets:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__ATAssetLinkController_assetLink_didUpdateDownloadPauseReasonForAssets___block_invoke;
  v8[3] = &unk_1E6B8C5A0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

uint64_t __73__ATAssetLinkController_assetLink_didUpdateDownloadPauseReasonForAssets___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performSelectorOnObservers:sel_assetLinkController_didChangeDownloadStateForAssets_ object:*(void *)(a1 + 32) object:*(void *)(a1 + 40)];
}

- (void)assetLinkDidChange:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__ATAssetLinkController_assetLinkDidChange___block_invoke;
  block[3] = &unk_1E6B8C468;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __44__ATAssetLinkController_assetLinkDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _assetsDidChange];
}

- (void)assetLink:(id)a3 didUpdateAsset:(id)a4 progress:(double)a5
{
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__ATAssetLinkController_assetLink_didUpdateAsset_progress___block_invoke;
  block[3] = &unk_1E6B8BF78;
  double v13 = a5;
  id v11 = v7;
  uint64_t v12 = self;
  id v9 = v7;
  dispatch_async(queue, block);
}

void __59__ATAssetLinkController_assetLink_didUpdateAsset_progress___block_invoke(uint64_t a1)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  double v2 = *(double *)(a1 + 48);
  *(float *)&double v2 = v2;
  [*(id *)(a1 + 32) setDownloadProgress:v2];
  int v3 = [*(id *)(a1 + 32) progressBlock];

  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) progressBlock];
    id v5 = *(void **)(a1 + 32);
    [v5 downloadProgress];
    ((void (**)(void, void *))v4)[2](v4, v5);
  }
  id v6 = [*(id *)(*(void *)(a1 + 40) + 64) objectForKey:*(void *)(a1 + 32)];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__ATAssetLinkController_assetLink_didUpdateAsset_progress___block_invoke_2;
  v11[3] = &unk_1E6B8BF50;
  int8x16_t v10 = *(int8x16_t *)(a1 + 32);
  id v7 = (id)v10.i64[0];
  int8x16_t v12 = vextq_s8(v10, v10, 8uLL);
  [v6 enumerateObjectsUsingBlock:v11];
  [*(id *)(a1 + 40) _performSelectorOnObservers:sel_assetLinkController_didUpdateAsset_ object:*(void *)(a1 + 40) object:*(void *)(a1 + 32)];
  id v8 = +[ATStatusMonitor sharedMonitor];
  v13[0] = *(void *)(a1 + 32);
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  [v8 updateAssets:v9];
}

void __59__ATAssetLinkController_assetLink_didUpdateAsset_progress___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 88);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__ATAssetLinkController_assetLink_didUpdateAsset_progress___block_invoke_3;
  v6[3] = &unk_1E6B8C1A8;
  id v8 = v3;
  id v7 = *(id *)(a1 + 40);
  id v5 = v3;
  dispatch_async(v4, v6);
}

id __59__ATAssetLinkController_assetLink_didUpdateAsset_progress___block_invoke_3(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  [v2 downloadProgress];
  return (id)(*(uint64_t (**)(uint64_t, void *))(v1 + 16))(v1, v2);
}

- (void)assetLink:(id)a3 didPauseAsseDownload:(id)a4 error:(id)a5
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__ATAssetLinkController_assetLink_didPauseAsseDownload_error___block_invoke;
  block[3] = &unk_1E6B8C468;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __62__ATAssetLinkController_assetLink_didPauseAsseDownload_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _assetsDidChange];
}

- (void)assetLink:(id)a3 didFinishAsset:(id)a4 error:(id)a5 retryable:(BOOL)a6 cancelPendingAssetsInBatch:(BOOL)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__ATAssetLinkController_assetLink_didFinishAsset_error_retryable_cancelPendingAssetsInBatch___block_invoke;
  block[3] = &unk_1E6B8BF28;
  void block[4] = self;
  id v19 = v12;
  BOOL v22 = a7;
  id v20 = v13;
  id v21 = v11;
  id v15 = v11;
  id v16 = v13;
  id v17 = v12;
  dispatch_async(queue, block);
}

void __93__ATAssetLinkController_assetLink_didFinishAsset_error_retryable_cancelPendingAssetsInBatch___block_invoke(uint64_t a1)
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  double v2 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:*(void *)(a1 + 40)];

  if (v2)
  {
    id v3 = _ATLogCategoryFramework_Oversize();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = *(void *)(a1 + 48);
      int v7 = *(unsigned __int8 *)(a1 + 64);
      *(_DWORD *)buf = 138544130;
      uint64_t v64 = v4;
      __int16 v65 = 2114;
      uint64_t v66 = v5;
      __int16 v67 = 2114;
      uint64_t v68 = v6;
      __int16 v69 = 1024;
      LODWORD(v70) = v7;
      _os_log_impl(&dword_1D9BC7000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Completed %{public}@ with error: %{public}@, cancelPendingDownloadsInBatch=%{BOOL}u", buf, 0x26u);
    }

    [*(id *)(*(void *)(a1 + 32) + 24) removeObjectForKey:*(void *)(a1 + 40)];
    [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
    if (*(void *)(a1 + 48))
    {
      [*(id *)(a1 + 32) _addFailedLink:*(void *)(a1 + 56) forAsset:*(void *)(a1 + 40)];
      if (!*(unsigned char *)(a1 + 64))
      {
        id v8 = [*(id *)(a1 + 40) dataclass];
        if ([v8 isEqualToString:@"Media"])
        {
          id v9 = [*(id *)(a1 + 48) domain];
          if ([v9 isEqualToString:@"ATError"]) {
            BOOL v10 = [*(id *)(a1 + 48) code] == 2;
          }
          else {
            BOOL v10 = 0;
          }

          if (*(void *)(a1 + 48)
            && !v10
            && [*(id *)(a1 + 32) _canEnqueueAsset:*(void *)(a1 + 40)])
          {
            id v31 = _ATLogCategoryFramework();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v32 = *(void *)(a1 + 32);
              uint64_t v33 = [*(id *)(a1 + 40) shortDescription];
              *(_DWORD *)buf = 138543618;
              uint64_t v64 = v32;
              __int16 v65 = 2114;
              uint64_t v66 = (uint64_t)v33;
              _os_log_impl(&dword_1D9BC7000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@ Failing over to a different link for asset %{public}@", buf, 0x16u);
            }
            [*(id *)(*(void *)(a1 + 32) + 16) insertObject:*(void *)(a1 + 40) atIndex:0];
LABEL_13:
            if (!*(unsigned char *)(a1 + 64)) {
              goto LABEL_52;
            }
            uint64_t v14 = [MEMORY[0x1E4F1CA80] set];
            id v15 = [*(id *)(a1 + 40) assetType];
            id v16 = [*(id *)(a1 + 40) dataclass];
            id v17 = [*(id *)(a1 + 40) storeInfo];
            id v18 = [v17 endpointType];
            unint64_t v19 = [v18 integerValue];

            if (v15 && v16)
            {
              if ([*(id *)(a1 + 40) isRestore])
              {
                id v20 = [*(id *)(a1 + 40) storeInfo];
                id v21 = [v20 appleID];

                if (v21)
                {
                  id v57 = (void *)MEMORY[0x1E4F28F60];
                  uint64_t v56 = [*(id *)(a1 + 40) assetParts];
                  unsigned int v22 = [*(id *)(a1 + 40) isRestore];
                  id v23 = [*(id *)(a1 + 40) storeInfo];
                  uint64_t v24 = [v23 appleID];
                  id v25 = [NSNumber numberWithInteger:v19];
                  uint64_t v26 = [v57 predicateWithFormat:@"variantOptions.AssetParts=%d and assetType=%@ and dataclass=%@ and isRestore=%d and storeInfo.appleID=%@ and storeInfo.endpointType=%@", v56, v15, v16, v22, v24, v25];
                }
                else if (v19 > 1)
                {
                  uint64_t v36 = (void *)MEMORY[0x1E4F28F60];
                  uint64_t v37 = [*(id *)(a1 + 40) assetParts];
                  unsigned int v38 = [*(id *)(a1 + 40) isRestore];
                  id v23 = [NSNumber numberWithInteger:v19];
                  uint64_t v26 = [v36 predicateWithFormat:@"variantOptions.AssetParts=%d and assetType=%@ and dataclass=%@ and isRestore=%d and storeInfo.endpointType=%@", v37, v15, v16, v38, v23];
                }
                else
                {
                  id v23 = _ATLogCategoryFramework();
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                  {
                    uint64_t v34 = *(void *)(a1 + 32);
                    uint64_t v35 = *(void *)(a1 + 40);
                    *(_DWORD *)buf = 138543618;
                    uint64_t v64 = v34;
                    __int16 v65 = 2114;
                    uint64_t v66 = v35;
                    _os_log_impl(&dword_1D9BC7000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ is missing appleID - will not cancel pending restore purchases", buf, 0x16u);
                  }
                  uint64_t v26 = 0;
                }
              }
              else
              {
                uint64_t v29 = (void *)MEMORY[0x1E4F28F60];
                uint64_t v30 = [*(id *)(a1 + 40) assetParts];
                id v21 = [NSNumber numberWithInteger:v19];
                uint64_t v26 = [v29 predicateWithFormat:@"variantOptions.AssetParts=%d and assetType=%@ and dataclass=%@ and storeInfo.endpointType=%@", v30, v15, v16, v21];
              }

              if (!v26) {
                goto LABEL_51;
              }
              long long v58 = v16;
              long long v39 = [*(id *)(*(void *)(a1 + 32) + 16) array];
              uint64_t v40 = [v39 filteredArrayUsingPredicate:v26];

              long long v61 = 0u;
              long long v62 = 0u;
              long long v59 = 0u;
              long long v60 = 0u;
              id v41 = v40;
              uint64_t v42 = [v41 countByEnumeratingWithState:&v59 objects:v71 count:16];
              if (v42)
              {
                uint64_t v43 = v42;
                uint64_t v44 = *(void *)v60;
                do
                {
                  for (uint64_t i = 0; i != v43; ++i)
                  {
                    if (*(void *)v60 != v44) {
                      objc_enumerationMutation(v41);
                    }
                    uint64_t v46 = *(void *)(*((void *)&v59 + 1) + 8 * i);
                    id v47 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:v46];
                    if (v47 == *(void **)(a1 + 56)) {
                      [v14 addObject:v46];
                    }
                  }
                  uint64_t v43 = [v41 countByEnumeratingWithState:&v59 objects:v71 count:16];
                }
                while (v43);
              }

              if ([v14 count])
              {
                id v48 = _ATLogCategoryFramework();
                if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v49 = *(void *)(a1 + 32);
                  uint64_t v50 = [v14 count];
                  uint64_t v51 = *(void *)(a1 + 56);
                  uint64_t v52 = [v41 count];
                  *(_DWORD *)buf = 138413058;
                  uint64_t v64 = v49;
                  __int16 v65 = 2048;
                  uint64_t v66 = v50;
                  __int16 v67 = 2114;
                  uint64_t v68 = v51;
                  __int16 v69 = 2048;
                  uint64_t v70 = v52;
                  _os_log_impl(&dword_1D9BC7000, v48, OS_LOG_TYPE_DEFAULT, "%@ Cancel %ld pending downloads on link=%{public}@, assetsMatchingCancelPredicate count=%ld", buf, 0x2Au);
                }

                long long v53 = *(void **)(a1 + 32);
                long long v54 = [v14 allObjects];
                long long v55 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:2 userInfo:0];
                [v53 _cancelAssets:v54 withError:v55 completion:0];
              }
              id v16 = v58;
            }
            else
            {
              uint64_t v26 = _ATLogCategoryFramework();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v27 = *(void *)(a1 + 32);
                uint64_t v28 = *(void *)(a1 + 40);
                *(_DWORD *)buf = 138412546;
                uint64_t v64 = v27;
                __int16 v65 = 2114;
                uint64_t v66 = v28;
                _os_log_impl(&dword_1D9BC7000, v26, OS_LOG_TYPE_DEFAULT, "%@ Ignoring cancelPendingDownloadsInBatch flag. Assset=%{public}@ has invalid assetType/dataClass", buf, 0x16u);
              }
            }

LABEL_51:
LABEL_52:
            [*(id *)(a1 + 32) _assetsDidChange];
            if ([*(id *)(a1 + 32) _shouldReleaseKeepAliveTransaction]) {
              [*(id *)(*(void *)(a1 + 32) + 112) endTransaction];
            }
            return;
          }
        }
        else
        {
        }
      }
    }
    id v11 = *(void **)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    if (*(unsigned char *)(a1 + 64))
    {
      id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:2 userInfo:0];
      [v11 _finishAsset:v12 withError:v13];
    }
    else
    {
      [*(id *)(a1 + 32) _finishAsset:*(void *)(a1 + 40) withError:*(void *)(a1 + 48)];
    }
    goto LABEL_13;
  }
}

- (void)assetLink:(id)a3 didFinishAsset:(id)a4 error:(id)a5 retryable:(BOOL)a6
{
}

- (void)assetLink:(id)a3 didCloseWithOutstandingAssets:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v17 = self;
    __int16 v18 = 2114;
    id v19 = v6;
    __int16 v20 = 2114;
    id v21 = v7;
    _os_log_impl(&dword_1D9BC7000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Asset link %{public}@ did close with outstanding assets %{public}@", buf, 0x20u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__ATAssetLinkController_assetLink_didCloseWithOutstandingAssets___block_invoke;
  block[3] = &unk_1E6B8C500;
  id v13 = v6;
  uint64_t v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(queue, block);
}

void __65__ATAssetLinkController_assetLink_didCloseWithOutstandingAssets___block_invoke(id *a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  [a1[4] setDelegate:0];
  [*((id *)a1[5] + 1) removeObject:a1[4]];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v2 = a1[6];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v34 objects:v44 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v35 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        id v8 = [*((id *)a1[5] + 3) objectForKey:v7];

        if (v8)
        {
          [*((id *)a1[5] + 3) removeObjectForKey:v7];
          [*((id *)a1[5] + 2) addObject:v7];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v34 objects:v44 count:16];
    }
    while (v4);
  }

  id v9 = objc_opt_new();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v10 = *((id *)a1[5] + 2);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v43 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v31 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v30 + 1) + 8 * j);
        if (([a1[5] _canEnqueueAsset:v15] & 1) == 0) {
          [v9 addObject:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v30 objects:v43 count:16];
    }
    while (v12);
  }

  id v16 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = a1[5];
    *(_DWORD *)buf = 138543618;
    id v40 = v17;
    __int16 v41 = 2114;
    uint64_t v42 = v9;
    _os_log_impl(&dword_1D9BC7000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Failing %{public}@ assets we no longer have a link for", buf, 0x16u);
  }

  [*((id *)a1[5] + 2) removeObjectsInArray:v9];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v18 = v9;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v27;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v26 + 1) + 8 * k);
        id v24 = a1[5];
        id v25 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"ATError", 8, 0, (void)v26);
        [v24 _finishAsset:v23 withError:v25];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v26 objects:v38 count:16];
    }
    while (v20);
  }

  [a1[5] _assetsDidChange];
}

- (void)assetLink:(id)a3 didOpenWithPendingAssets:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v17 = self;
    __int16 v18 = 2114;
    id v19 = v6;
    __int16 v20 = 2114;
    id v21 = v7;
    _os_log_impl(&dword_1D9BC7000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Asset link %{public}@ did open with pending assets %{public}@", buf, 0x20u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__ATAssetLinkController_assetLink_didOpenWithPendingAssets___block_invoke;
  block[3] = &unk_1E6B8C500;
  id v13 = v7;
  uint64_t v14 = self;
  id v15 = v6;
  id v10 = v6;
  id v11 = v7;
  dispatch_async(queue, block);
}

uint64_t __60__ATAssetLinkController_assetLink_didOpenWithPendingAssets___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*(void *)(a1 + 40) + 24), "setObject:forKey:", *(void *)(a1 + 48), *(void *)(*((void *)&v8 + 1) + 8 * v6++), (void)v8);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  return [*(id *)(a1 + 40) _assetsDidChange];
}

- (void)installCompleteForAssets:(id)a3
{
  id v4 = a3;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__743;
  void v14[4] = __Block_byref_object_dispose__744;
  id v15 = [MEMORY[0x1E4F1CA80] set];
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__743;
  v12[4] = __Block_byref_object_dispose__744;
  id v13 = [MEMORY[0x1E4F1CA80] set];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__ATAssetLinkController_installCompleteForAssets___block_invoke;
  v7[3] = &unk_1E6B8BF00;
  id v8 = v4;
  long long v9 = self;
  long long v10 = v14;
  long long v11 = v12;
  id v6 = v4;
  dispatch_async(queue, v7);

  _Block_object_dispose(v12, 8);
  _Block_object_dispose(v14, 8);
}

uint64_t __50__ATAssetLinkController_installCompleteForAssets___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v28 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        char v8 = [v7 assetParts];
        uint64_t v9 = *(void *)(a1 + 40);
        if (v8)
        {
          id v13 = *(void **)(v9 + 48);
          uint64_t v14 = [v7 assetType];
          uint64_t v12 = [v13 objectForKey:v14];

          if (![v12 containsObject:v7]) {
            goto LABEL_12;
          }
          [v12 removeObject:v7];
          id v15 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          id v16 = [v7 assetType];
          [v15 addObject:v16];
        }
        else
        {
          long long v10 = *(void **)(v9 + 56);
          long long v11 = [v7 assetType];
          uint64_t v12 = [v10 objectForKey:v11];

          if (![v12 containsObject:v7]) {
            goto LABEL_12;
          }
          [v12 removeObject:v7];
        }
        [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v7];
LABEL_12:
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v4);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v17 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v24 != v20) {
          objc_enumerationMutation(v17);
        }
        objc_msgSend(*(id *)(a1 + 40), "_performSelectorOnObservers:object:object:", sel_assetLinkController_didProcessFinishedAsset_, *(void *)(a1 + 40), *(void *)(*((void *)&v23 + 1) + 8 * j), (void)v23);
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v19);
  }

  return [*(id *)(a1 + 40) _updateCountsForFinishedTrackAssetTypes:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__ATAssetLinkController_removeObserver___block_invoke;
  v7[3] = &unk_1E6B8C5A0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __40__ATAssetLinkController_removeObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 72) removeObject:*(void *)(a1 + 40)];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__ATAssetLinkController_addObserver___block_invoke;
  v7[3] = &unk_1E6B8C5A0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __37__ATAssetLinkController_addObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 72) addObject:*(void *)(a1 + 40)];
}

- (void)setPendingAssets:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__ATAssetLinkController_setPendingAssets___block_invoke;
  v7[3] = &unk_1E6B8C5A0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __42__ATAssetLinkController_setPendingAssets___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performSelectorOnObservers:sel_assetLinkController_didChangeDownloadStateForAssets_ object:*(void *)(a1 + 32) object:*(void *)(a1 + 40)];
}

- (id)filteredAssetsToDownloadForAssets:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__743;
  id v17 = __Block_byref_object_dispose__744;
  id v18 = [MEMORY[0x1E4F1CA48] array];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__ATAssetLinkController_filteredAssetsToDownloadForAssets___block_invoke;
  block[3] = &unk_1E6B8C528;
  id v10 = v4;
  long long v11 = self;
  uint64_t v12 = &v13;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v7;
}

void __59__ATAssetLinkController_filteredAssetsToDownloadForAssets___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v8 + 1) + 8 * i);
        if ((objc_msgSend(*(id *)(a1 + 40), "_assetIsEnqueued:", v7, (void)v8) & 1) == 0) {
          [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v7];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (BOOL)assetIsEnqueued:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__ATAssetLinkController_assetIsEnqueued___block_invoke;
  block[3] = &unk_1E6B8C528;
  id v9 = v4;
  long long v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

uint64_t __41__ATAssetLinkController_assetIsEnqueued___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _assetIsEnqueued:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)cancelAllAssetsMatchingPredicate:(id)a3 excludeActiveDownloads:(BOOL)a4 withError:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __102__ATAssetLinkController_cancelAllAssetsMatchingPredicate_excludeActiveDownloads_withError_completion___block_invoke;
  block[3] = &unk_1E6B8BED8;
  void block[4] = self;
  id v18 = v10;
  BOOL v21 = a4;
  id v19 = v11;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(queue, block);
}

void __102__ATAssetLinkController_cancelAllAssetsMatchingPredicate_excludeActiveDownloads_withError_completion___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v2 = _ATLogCategoryFramework_Oversize();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = *(unsigned __int8 *)(a1 + 64);
    *(_DWORD *)buf = 138543874;
    uint64_t v20 = v3;
    __int16 v21 = 2114;
    uint64_t v22 = v4;
    __int16 v23 = 1024;
    int v24 = v5;
    _os_log_impl(&dword_1D9BC7000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ cancelling assets matching predicate %{public}@. excludeActiveDownloads=%{BOOL}u", buf, 0x1Cu);
  }

  id v6 = objc_opt_new();
  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 16) array];
  long long v8 = [v7 filteredArrayUsingPredicate:*(void *)(a1 + 40)];
  [v6 addObjectsFromArray:v8];

  if (!*(unsigned char *)(a1 + 64))
  {
    id v9 = [*(id *)(*(void *)(a1 + 32) + 24) keyEnumerator];
    id v10 = [v9 allObjects];
    id v11 = [v10 filteredArrayUsingPredicate:*(void *)(a1 + 40)];
    [v6 addObjectsFromArray:v11];
  }
  id v12 = *(void **)(a1 + 32);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __102__ATAssetLinkController_cancelAllAssetsMatchingPredicate_excludeActiveDownloads_withError_completion___block_invoke_35;
  v16[3] = &unk_1E6B8C640;
  uint64_t v13 = *(void *)(a1 + 48);
  id v14 = *(id *)(a1 + 56);
  id v17 = v6;
  id v18 = v14;
  v16[4] = *(void *)(a1 + 32);
  id v15 = v6;
  [v12 _cancelAssets:v15 withError:v13 completion:v16];
}

void __102__ATAssetLinkController_cancelAllAssetsMatchingPredicate_excludeActiveDownloads_withError_completion___block_invoke_35(uint64_t a1)
{
  if (*(void *)(a1 + 48))
  {
    id v2 = *(NSObject **)(*(void *)(a1 + 32) + 88);
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __102__ATAssetLinkController_cancelAllAssetsMatchingPredicate_excludeActiveDownloads_withError_completion___block_invoke_2;
    v3[3] = &unk_1E6B8C1A8;
    id v4 = *(id *)(a1 + 40);
    id v5 = *(id *)(a1 + 48);
    dispatch_async(v2, v3);
  }
}

void __102__ATAssetLinkController_cancelAllAssetsMatchingPredicate_excludeActiveDownloads_withError_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) count])
  {
    id v2 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  else
  {
    id v2 = 0;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = *(id *)(a1 + 32);
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
        long long v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v9 = objc_msgSend(v8, "assetType", (void)v12);
        if (v9)
        {
          id v10 = [v2 objectForKey:v9];
          if (v10)
          {
            id v11 = v10;
            [v10 addObject:v8];
          }
          else
          {
            id v11 = [MEMORY[0x1E4F1CA80] setWithObject:v8];
            [v2 setObject:v11 forKey:v9];
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)cancelAssets:(id)a3 withError:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __59__ATAssetLinkController_cancelAssets_withError_completion___block_invoke;
  v15[3] = &unk_1E6B8BEB0;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

uint64_t __59__ATAssetLinkController_cancelAssets_withError_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelAssets:*(void *)(a1 + 40) withError:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

- (void)cancelAssets:(id)a3 withCompletion:(id)a4
{
}

- (void)prioritizeAssetWithStoreForLibraryIdentifier:(int64_t)a3 withCompletion:(id)a4
{
  id v6 = a4;
  v13[0] = 0;
  v13[1] = v13;
  void v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__743;
  v13[4] = __Block_byref_object_dispose__744;
  id v14 = 0;
  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __85__ATAssetLinkController_prioritizeAssetWithStoreForLibraryIdentifier_withCompletion___block_invoke;
  v9[3] = &unk_1E6B8BE88;
  id v11 = v13;
  int64_t v12 = a3;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, v9);

  _Block_object_dispose(v13, 8);
}

void __85__ATAssetLinkController_prioritizeAssetWithStoreForLibraryIdentifier_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v20;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v20 != v5) {
        objc_enumerationMutation(v2);
      }
      uint64_t v7 = *(void **)(*((void *)&v19 + 1) + 8 * v6);
      id v8 = objc_msgSend(v7, "identifier", (void)v19);
      uint64_t v9 = [v8 longLongValue];
      uint64_t v10 = *(void *)(a1 + 56);

      if (v9 == v10) {
        break;
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v11 = v7;

    if (!v11) {
      goto LABEL_13;
    }
    [*(id *)(a1 + 32) _prioritizeAsset:v11 onLinkClass:getATStoreMediaAssetLinkClass()];
    if (([v11 isPrioritized] & 1) == 0)
    {
      uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:0 userInfo:0];
      goto LABEL_16;
    }
  }
  else
  {
LABEL_9:

LABEL_13:
    id v13 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138543618;
      uint64_t v24 = v14;
      __int16 v25 = 2048;
      uint64_t v26 = v15;
      _os_log_impl(&dword_1D9BC7000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ asset with libraryIdentifier:%lld is not enqueued and cannot be prioritized", buf, 0x16u);
    }

    uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:23 userInfo:0];
    id v11 = 0;
LABEL_16:
    uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
    id v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v12;
  }
  uint64_t v18 = *(void *)(a1 + 40);
  if (v18) {
    (*(void (**)(uint64_t, void))(v18 + 16))(v18, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  }
}

- (void)prioritizeAsset:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__ATAssetLinkController_prioritizeAsset___block_invoke;
  v7[3] = &unk_1E6B8C5A0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __41__ATAssetLinkController_prioritizeAsset___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 16) set];
  uint64_t v3 = [v2 member:*(void *)(a1 + 40)];

  if (v3)
  {
LABEL_2:
    [v3 setIsPrioritized:1];
    [*(id *)(a1 + 32) _prioritizeAsset:v3 onLinkClass:0];
    goto LABEL_3;
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obuint64_t j = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v4 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (!v4)
  {
LABEL_15:

    goto LABEL_19;
  }
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)v32;
LABEL_6:
  uint64_t v7 = 0;
  while (1)
  {
    if (*(void *)v32 != v6) {
      objc_enumerationMutation(obj);
    }
    id v8 = *(void **)(*((void *)&v31 + 1) + 8 * v7);
    uint64_t v9 = [v8 dataclass];
    uint64_t v10 = [*(id *)(a1 + 40) dataclass];
    if (([v9 isEqualToString:v10] & 1) == 0)
    {

      goto LABEL_13;
    }
    id v11 = [v8 identifier];
    uint64_t v12 = [*(id *)(a1 + 40) identifier];
    int v13 = [v11 isEqualToString:v12];

    if (v13) {
      break;
    }
LABEL_13:
    if (v5 == ++v7)
    {
      uint64_t v5 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
      if (v5) {
        goto LABEL_6;
      }
      goto LABEL_15;
    }
  }
  uint64_t v3 = v8;
  uint64_t v14 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = *(void *)(a1 + 32);
    uint64_t v17 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v36 = v16;
    __int16 v37 = 2114;
    uint64_t v38 = v17;
    _os_log_impl(&dword_1D9BC7000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Found unenqueued asset %{public}@", buf, 0x16u);
  }

  if (v3) {
    goto LABEL_2;
  }
LABEL_19:
  uint64_t v18 = (void *)MEMORY[0x1E4F28F60];
  long long v19 = [*(id *)(a1 + 40) dataclass];
  long long v20 = [*(id *)(a1 + 40) identifier];
  long long v21 = [v18 predicateWithFormat:@"dataclass=%@ and identifier=%@", v19, v20];

  long long v22 = [*(id *)(*(void *)(a1 + 32) + 24) keyEnumerator];
  __int16 v23 = [v22 allObjects];
  uint64_t v24 = [v23 filteredArrayUsingPredicate:v21];

  if (![v24 count])
  {

    goto LABEL_25;
  }
  uint64_t v3 = [v24 objectAtIndex:0];
  __int16 v25 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v26 = *(void *)(a1 + 32);
    uint64_t v27 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v36 = v26;
    __int16 v37 = 2114;
    uint64_t v38 = v27;
    _os_log_impl(&dword_1D9BC7000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ Found asset %{public}@ enqueued on a link", buf, 0x16u);
  }

  if (v3) {
    goto LABEL_2;
  }
LABEL_25:
  uint64_t v3 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v28 = *(void *)(a1 + 32);
    uint64_t v29 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v36 = v28;
    __int16 v37 = 2114;
    uint64_t v38 = v29;
    _os_log_impl(&dword_1D9BC7000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ asset %{public}@ is not enqueued and cannot be prioritized", buf, 0x16u);
  }
LABEL_3:
}

- (void)enqueueAssetForStoreDownload:(int64_t)a3 withCompletion:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__ATAssetLinkController_enqueueAssetForStoreDownload_withCompletion___block_invoke;
  block[3] = &unk_1E6B8BE60;
  id v10 = v6;
  int64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __69__ATAssetLinkController_enqueueAssetForStoreDownload_withCompletion___block_invoke(void *a1)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v2 = *(id *)(a1[4] + 16);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v39 objects:v53 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v40;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v40 != v5) {
        objc_enumerationMutation(v2);
      }
      uint64_t v7 = *(void **)(*((void *)&v39 + 1) + 8 * v6);
      id v8 = [v7 identifier];
      uint64_t v9 = [v8 longLongValue];
      uint64_t v10 = a1[6];

      if (v9 == v10) {
        break;
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v39 objects:v53 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v11 = v7;

    if (!v11) {
      goto LABEL_20;
    }
    getATStoreMediaAssetLinkClass();
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v12 = *(id *)(a1[4] + 8);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v35 objects:v52 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v36;
LABEL_13:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v36 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v35 + 1) + 8 * v16);
        if (objc_opt_isKindOfClass()) {
          break;
        }
        if (v14 == ++v16)
        {
          uint64_t v14 = [v12 countByEnumeratingWithState:&v35 objects:v52 count:16];
          if (v14) {
            goto LABEL_13;
          }
          goto LABEL_23;
        }
      }
      int v22 = objc_msgSend(v17, "linkIsReady", (void)v35);
      int v23 = [v17 canEnqueueAsset:v11];
      if (v22) {
        BOOL v24 = v23 == 0;
      }
      else {
        BOOL v24 = 1;
      }
      if (!v24)
      {
        id v51 = v11;
        uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
        id v30 = (id)[v17 enqueueAssets:v29 force:1];

        long long v31 = _ATLogCategoryFramework();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v33 = a1[4];
          uint64_t v34 = a1[6];
          *(_DWORD *)buf = 138543618;
          uint64_t v44 = v33;
          __int16 v45 = 2048;
          uint64_t v46 = v34;
          _os_log_impl(&dword_1D9BC7000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@ asset with libraryIdentifier:%lld enqueued on the store link", buf, 0x16u);
        }

        long long v20 = 0;
        goto LABEL_24;
      }
      int v25 = v23;
      uint64_t v26 = _ATLogCategoryFramework();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v27 = a1[4];
        uint64_t v28 = a1[6];
        *(_DWORD *)buf = 138544130;
        uint64_t v44 = v27;
        __int16 v45 = 2048;
        uint64_t v46 = v28;
        __int16 v47 = 1024;
        int v48 = v22;
        __int16 v49 = 1024;
        int v50 = v25;
        _os_log_impl(&dword_1D9BC7000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ Cannot enqueue asset with libraryIdentifier:%lld on the store link - ready:%d, canEnqueue:%d", buf, 0x22u);
      }
    }
  }
  else
  {
LABEL_9:

LABEL_20:
    uint64_t v12 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = a1[4];
      uint64_t v19 = a1[6];
      *(_DWORD *)buf = 138543618;
      uint64_t v44 = v18;
      __int16 v45 = 2048;
      uint64_t v46 = v19;
      _os_log_impl(&dword_1D9BC7000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ asset with libraryIdentifier:%lld is not enqueued for download with ATC", buf, 0x16u);
    }
    id v11 = 0;
  }
LABEL_23:

  long long v20 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:0 userInfo:0];
LABEL_24:
  uint64_t v21 = a1[5];
  if (v21) {
    (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v20);
  }
}

- (void)enqueueAssets:(id)a3 progress:(id)a4 completion:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v11 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v8);
        }
        uint64_t v15 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        [v15 setProgressBlock:v9];
        [v15 setCompletionBlock:v10];
      }
      uint64_t v12 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }
  [(ATAssetLinkController *)self enqueueAssets:v8];
}

- (void)enqueueAssets:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4FB8618] sharedMonitor];
  uint64_t v6 = [v5 isCharging];

  uint64_t v7 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = [v4 count];
    _os_log_impl(&dword_1D9BC7000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Enqueuing %lu assets:", buf, 0x16u);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v24;
    *(void *)&long long v10 = 138543362;
    long long v18 = v10;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        objc_msgSend(v14, "setDeviceWasChargingWhenEnqueued:", v6, v18);
        uint64_t v15 = _ATLogCategoryFramework();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v18;
          *(void *)&uint8_t buf[4] = v14;
          _os_log_impl(&dword_1D9BC7000, v15, OS_LOG_TYPE_DEFAULT, "    %{public}@", buf, 0xCu);
        }
      }
      uint64_t v11 = [v8 countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v11);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v28 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__ATAssetLinkController_enqueueAssets___block_invoke;
  block[3] = &unk_1E6B8C528;
  id v20 = v8;
  uint64_t v21 = self;
  int v22 = buf;
  id v17 = v8;
  dispatch_async(queue, block);

  _Block_object_dispose(buf, 8);
}

uint64_t __39__ATAssetLinkController_enqueueAssets___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v32;
    *(void *)&long long v4 = 138543362;
    long long v30 = v4;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v32 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v9 = (void *)MEMORY[0x1E016C0E0]();
        if ([*(id *)(a1 + 40) _assetIsEnqueued:v8])
        {
          if (([v8 isRestore] & 1) == 0)
          {
            long long v10 = _ATLogCategoryFramework();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v30;
              long long v36 = v8;
              _os_log_impl(&dword_1D9BC7000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ is already enqueued and is not marked for restore - ignoring for now", buf, 0xCu);
            }

            uint64_t v11 = *(void **)(a1 + 40);
            uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:32 userInfo:0];
            [v11 _finishAsset:v8 withError:v12];

            goto LABEL_30;
          }
        }
        else
        {
          ATReportEventIncrementingScalarKey();
          [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
          objc_msgSend(v8, "setQueueStartTime:");
        }
        uint64_t v13 = objc_msgSend(v8, "assetType", v30);

        if (!v13) {
          [v8 setAssetType:@"Unknown"];
        }
        if ([*(id *)(a1 + 40) _canEnqueueAsset:v8])
        {
          [*(id *)(*(void *)(a1 + 40) + 16) addObject:v8];
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
          if ([v8 assetParts])
          {
            uint64_t v14 = *(void **)(*(void *)(a1 + 40) + 40);
            uint64_t v15 = [v8 assetType];
            long long v16 = [v14 objectForKey:v15];

            if (v16)
            {
              [v16 addObject:v8];
            }
            else
            {
              long long v16 = [MEMORY[0x1E4F1CA80] setWithObject:v8];
              long long v25 = *(void **)(*(void *)(a1 + 40) + 40);
              long long v26 = [v8 assetType];
              [v25 setObject:v16 forKey:v26];
            }
          }
          [*(id *)(a1 + 40) _performSelectorOnObservers:sel_assetLinkController_didEnqueueAsset_ object:*(void *)(a1 + 40) object:v8];
        }
        else
        {
          if ([v8 isRestore] && objc_msgSend(v8, "isDownload"))
          {
            id v17 = _ATLogCategoryFramework();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              long long v18 = *(void **)(a1 + 40);
              *(_DWORD *)buf = 138543618;
              long long v36 = v18;
              __int16 v37 = 2114;
              long long v38 = v8;
              _os_log_impl(&dword_1D9BC7000, v17, OS_LOG_TYPE_ERROR, "%{public}@ No asset links to handle %{public}@ - treating asset restore as unrecoverable", buf, 0x16u);
            }

            long long v19 = *(void **)(a1 + 40);
            id v20 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v21 = 26;
          }
          else
          {
            int v22 = _ATLogCategoryFramework();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              long long v23 = *(void **)(a1 + 40);
              *(_DWORD *)buf = 138543618;
              long long v36 = v23;
              __int16 v37 = 2114;
              long long v38 = v8;
              _os_log_impl(&dword_1D9BC7000, v22, OS_LOG_TYPE_ERROR, "%{public}@ No asset links to handle %{public}@ - treating as connection failure", buf, 0x16u);
            }

            long long v19 = *(void **)(a1 + 40);
            id v20 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v21 = 8;
          }
          long long v24 = [v20 errorWithDomain:@"ATError" code:v21 userInfo:0];
          [v19 _finishAsset:v8 withError:v24];
        }
LABEL_30:
      }
      uint64_t v5 = [v2 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v5);
  }

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
    && ([*(id *)(*(void *)(a1 + 40) + 112) isActive] & 1) == 0)
  {
    uint64_t v27 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      char v28 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      long long v36 = v28;
      _os_log_impl(&dword_1D9BC7000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ Beginning transaction to keep atc alive for active downloads", buf, 0xCu);
    }

    [*(id *)(*(void *)(a1 + 40) + 112) beginTransaction];
  }
  return objc_msgSend(*(id *)(a1 + 40), "_assetsDidChange", v30);
}

- (id)allAssetLinks
{
  return (id)[(NSMutableOrderedSet *)self->_assetLinks set];
}

- (void)removeAssetLink:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__ATAssetLinkController_removeAssetLink___block_invoke;
  v7[3] = &unk_1E6B8C5A0;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __41__ATAssetLinkController_removeAssetLink___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setDelegate:0];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(*(void *)(a1 + 40) + 8);

  return [v3 removeObject:v2];
}

- (void)addAssetLink:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__ATAssetLinkController_addAssetLink___block_invoke;
  v7[3] = &unk_1E6B8C5A0;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __38__ATAssetLinkController_addAssetLink___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 40) + 8) addObject:*(void *)(a1 + 32)];
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 8);

  return [v2 sortUsingComparator:&__block_literal_global_17];
}

uint64_t __38__ATAssetLinkController_addAssetLink___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = [a2 priority];
  unint64_t v6 = [v4 priority];

  if (v5 <= v6) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = -1;
  }
  if (v5 < v6) {
    return 1;
  }
  else {
    return v7;
  }
}

- (void)dealloc
{
  if ([(MSVXPCTransaction *)self->_activeDownLoadsKeepAliveTransaction isActive]) {
    [(MSVXPCTransaction *)self->_activeDownLoadsKeepAliveTransaction endTransaction];
  }
  uint64_t v3 = [MEMORY[0x1E4FB8618] sharedMonitor];
  [v3 unregisterObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ATAssetLinkController;
  [(ATAssetLinkController *)&v4 dealloc];
}

- (ATAssetLinkController)init
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v35.receiver = self;
  v35.super_class = (Class)ATAssetLinkController;
  uint64_t v2 = [(ATAssetLinkController *)&v35 init];
  if (v2)
  {
    uint64_t v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.amp.ATFoundation.ATAssetLinkController.queue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    unint64_t v6 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E4F14430], QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.amp.ATFoundation.ATAssetLinkController.callbackQueue", v6);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v9;

    uint64_t v11 = objc_opt_new();
    assetLinks = v2->_assetLinks;
    v2->_assetLinks = (NSMutableOrderedSet *)v11;

    uint64_t v13 = objc_opt_new();
    assetQueue = v2->_assetQueue;
    v2->_assetQueue = (NSMutableOrderedSet *)v13;

    uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionary];
    activeTrackAssetsByAssetType = v2->_activeTrackAssetsByAssetType;
    v2->_activeTrackAssetsByAssetType = (NSMutableDictionary *)v15;

    uint64_t v17 = [MEMORY[0x1E4F1CA60] dictionary];
    trackAssetsPendingInstallByAssetType = v2->_trackAssetsPendingInstallByAssetType;
    v2->_trackAssetsPendingInstallByAssetType = (NSMutableDictionary *)v17;

    uint64_t v19 = [MEMORY[0x1E4F1CA60] dictionary];
    nonTrackAssetsPendingInstallByAssetType = v2->_nonTrackAssetsPendingInstallByAssetType;
    v2->_nonTrackAssetsPendingInstallByAssetType = (NSMutableDictionary *)v19;

    uint64_t v21 = [MEMORY[0x1E4F1CA60] dictionary];
    progressBlocksForAssetsInFlight = v2->_progressBlocksForAssetsInFlight;
    v2->_progressBlocksForAssetsInFlight = (NSMutableDictionary *)v21;

    uint64_t v23 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    assetsToLinks = v2->_assetsToLinks;
    v2->_assetsToLinks = (NSMapTable *)v23;

    uint64_t v25 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    assetsToFailedLinks = v2->_assetsToFailedLinks;
    v2->_assetsToFailedLinks = (NSMapTable *)v25;

    uint64_t v27 = [MEMORY[0x1E4FB8618] sharedMonitor];
    [v27 registerObserver:v2];
    v2->_unint64_t cachedThermalLevel = [v27 currentThermalLevel];
    [v27 networkType];
    v2->_BOOL currentNetworkIsCellularType = ICEnvironmentNetworkTypeIsCellular();
    v2->_BOOL isNetworkConstrained = [v27 isNetworkConstrained];
    char v28 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t cachedThermalLevel = v2->_cachedThermalLevel;
      BOOL currentNetworkIsCellularType = v2->_currentNetworkIsCellularType;
      BOOL isNetworkConstrained = v2->_isNetworkConstrained;
      *(_DWORD *)buf = 138544130;
      __int16 v37 = v2;
      __int16 v38 = 2048;
      unint64_t v39 = cachedThermalLevel;
      __int16 v40 = 1024;
      BOOL v41 = currentNetworkIsCellularType;
      __int16 v42 = 1024;
      BOOL v43 = isNetworkConstrained;
      _os_log_impl(&dword_1D9BC7000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ current thermal level=%llu, isCurrentNetworkCellularType=%d, _isNetworkConstrained=%d", buf, 0x22u);
    }

    uint64_t v32 = [objc_alloc(MEMORY[0x1E4F77A50]) initWithName:@"com.apple.amp.AirTraffic.ActiveDownloadsKeepAlive"];
    activeDownLoadsKeepAliveTransaction = v2->_activeDownLoadsKeepAliveTransaction;
    v2->_activeDownLoadsKeepAliveTransaction = (MSVXPCTransaction *)v32;
  }
  return v2;
}

uint64_t __39__ATAssetLinkController_sharedInstance__block_invoke()
{
  __sharedInstance = objc_alloc_init(ATAssetLinkController);

  return MEMORY[0x1F41817F8]();
}

@end