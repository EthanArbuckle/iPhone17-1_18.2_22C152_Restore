@interface MSASAssetUploader
- (BOOL)didEncounterNetworkConditionError;
- (NSMutableArray)finishedAssetCollections;
- (NSMutableArray)itemsInFlight;
- (NSMutableDictionary)assetCollectionGUIDToRequestorContext;
- (NSMutableDictionary)assetCollectionsToItemInFlightMap;
- (NSMutableDictionary)assetToAssetCollectionMap;
- (NSMutableSet)assetCollectionsWithAuthorizationError;
- (id)_orphanedAssetCollectionError;
- (id)_pathForPersonID:(id)a3;
- (int)state;
- (void)MMCSEngine:(id)a3 didCreateRequestorContext:(id)a4 forAssets:(id)a5;
- (void)MMCSEngine:(id)a3 didFinishGettingAsset:(id)a4 path:(id)a5 error:(id)a6;
- (void)MMCSEngine:(id)a3 didFinishPuttingAsset:(id)a4 putReceipt:(id)a5 error:(id)a6;
- (void)MMCSEngine:(id)a3 didMakeGetProgress:(float)a4 state:(int)a5 onAsset:(id)a6;
- (void)MMCSEngine:(id)a3 didMakePutProgress:(float)a4 state:(int)a5 onAsset:(id)a6;
- (void)_workQueueStop;
- (void)cancelAssetCollections:(id)a3;
- (void)didFinishGettingAllAssets;
- (void)didFinishPuttingAllAssets;
- (void)registerAssetCollections:(id)a3 completionBlock:(id)a4;
- (void)setAssetCollectionGUIDToRequestorContext:(id)a3;
- (void)setAssetCollectionsToItemInFlightMap:(id)a3;
- (void)setAssetCollectionsWithAuthorizationError:(id)a3;
- (void)setAssetToAssetCollectionMap:(id)a3;
- (void)setDidEncounterNetworkConditionError:(BOOL)a3;
- (void)setFinishedAssetCollections:(id)a3;
- (void)setItemsInFlight:(id)a3;
- (void)setState:(int)a3;
- (void)unregisterAssetCollections:(id)a3;
- (void)unregisterAssetCollections:(id)a3 completionBlock:(id)a4;
- (void)workQueueCancel;
- (void)workQueueCancelAssetCollections:(id)a3;
- (void)workQueueDidFinishWithItem:(id)a3 error:(id)a4;
- (void)workQueueGoIdle;
- (void)workQueueRegisterAssetCollections:(id)a3 index:(unint64_t)a4 results:(id)a5 completionBlock:(id)a6;
- (void)workQueueRegisterAssets:(id)a3 index:(unint64_t)a4 completionBlock:(id)a5;
- (void)workQueueRetryOutstandingActivities;
- (void)workQueueShutDownCompletionBlock:(id)a3;
- (void)workQueueStop;
- (void)workQueueStopTrackingItem:(id)a3;
- (void)workQueueUploadNextBatch;
@end

@implementation MSASAssetUploader

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetCollectionGUIDToRequestorContext, 0);
  objc_storeStrong((id *)&self->_assetCollectionsWithAuthorizationError, 0);
  objc_storeStrong((id *)&self->_finishedAssetCollections, 0);
  objc_storeStrong((id *)&self->_assetToAssetCollectionMap, 0);
  objc_storeStrong((id *)&self->_assetCollectionsToItemInFlightMap, 0);
  objc_storeStrong((id *)&self->_itemsInFlight, 0);
}

- (void)setAssetCollectionGUIDToRequestorContext:(id)a3
{
}

- (NSMutableDictionary)assetCollectionGUIDToRequestorContext
{
  return self->_assetCollectionGUIDToRequestorContext;
}

- (void)setAssetCollectionsWithAuthorizationError:(id)a3
{
}

- (NSMutableSet)assetCollectionsWithAuthorizationError
{
  return self->_assetCollectionsWithAuthorizationError;
}

- (void)setDidEncounterNetworkConditionError:(BOOL)a3
{
  self->_didEncounterNetworkConditionError = a3;
}

- (BOOL)didEncounterNetworkConditionError
{
  return self->_didEncounterNetworkConditionError;
}

- (void)setFinishedAssetCollections:(id)a3
{
}

- (NSMutableArray)finishedAssetCollections
{
  return self->_finishedAssetCollections;
}

- (void)setAssetToAssetCollectionMap:(id)a3
{
}

- (NSMutableDictionary)assetToAssetCollectionMap
{
  return self->_assetToAssetCollectionMap;
}

- (void)setAssetCollectionsToItemInFlightMap:(id)a3
{
}

- (NSMutableDictionary)assetCollectionsToItemInFlightMap
{
  return self->_assetCollectionsToItemInFlightMap;
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
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v3 = 138543362;
    v4 = self;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Unexpected callback - MMCSEngine:didFinishGettingAllAssetsContext:", (uint8_t *)&v3, 0xCu);
  }
}

- (void)MMCSEngine:(id)a3 didMakeGetProgress:(float)a4 state:(int)a5 onAsset:(id)a6
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v7 = 138543362;
    v8 = self;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Unexpected callback - MMCSEngine:didMakeGetProgress:state:onAsset:context:", (uint8_t *)&v7, 0xCu);
  }
}

- (void)MMCSEngine:(id)a3 didFinishGettingAsset:(id)a4 path:(id)a5 error:(id)a6
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v7 = 138543362;
    v8 = self;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Unexpected callback - MMCSEngine:didFinishGettingAsset:context:error:", (uint8_t *)&v7, 0xCu);
  }
}

- (void)didFinishPuttingAllAssets
{
  int v3 = [(MSASAssetTransferer *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__MSASAssetUploader_didFinishPuttingAllAssets__block_invoke;
  block[3] = &unk_1E6C3DA38;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __46__MSASAssetUploader_didFinishPuttingAllAssets__block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = [*(id *)(v2 + 144) count];
    *(_DWORD *)buf = 138543618;
    uint64_t v38 = v2;
    __int16 v39 = 2048;
    uint64_t v40 = v3;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Finished uploading %ld asset collections.", buf, 0x16u);
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v4 = *(id *)(*(void *)(a1 + 32) + 152);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v32;
    uint64_t v8 = *MEMORY[0x1E4F73818];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v32 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        v11 = *(void **)(a1 + 32);
        v12 = [MEMORY[0x1E4F28C58] errorWithDomain:v8 code:14 userInfo:0];
        [v11 workQueueDidFinishWithItem:v10 error:v12];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v6);
  }

  [*(id *)(*(void *)(a1 + 32) + 152) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 160) removeAllObjects];
  if ([*(id *)(*(void *)(a1 + 32) + 136) count]
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v23 = *(void *)(a1 + 32);
    uint64_t v24 = [*(id *)(v23 + 136) count];
    *(_DWORD *)buf = 138543618;
    uint64_t v38 = v23;
    __int16 v39 = 2048;
    uint64_t v40 = v24;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Found %ld orphaned assets. Ignoring.", buf, 0x16u);
  }
  if ([*(id *)(*(void *)(a1 + 32) + 120) count])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = *(void *)(a1 + 32);
      uint64_t v26 = [*(id *)(v25 + 120) count];
      *(_DWORD *)buf = 138543618;
      uint64_t v38 = v25;
      __int16 v39 = 2048;
      uint64_t v40 = v26;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Found %ld orphaned asset collections.", buf, 0x16u);
    }
    v13 = (void *)[*(id *)(*(void *)(a1 + 32) + 120) copy];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v14 = v13;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v28 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 8 * j);
          v20 = *(void **)(a1 + 32);
          v21 = [v20 _orphanedAssetCollectionError];
          [v20 workQueueDidFinishWithItem:v19 error:v21];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v16);
    }
  }
  [*(id *)(a1 + 32) workQueueGoIdle];
  uint64_t result = [*(id *)(a1 + 32) didEncounterNetworkConditionError];
  if ((result & 1) == 0) {
    return [*(id *)(a1 + 32) workQueueRetryOutstandingActivities];
  }
  return result;
}

- (void)MMCSEngine:(id)a3 didMakePutProgress:(float)a4 state:(int)a5 onAsset:(id)a6
{
  id v9 = a6;
  uint64_t v10 = [(MSASAssetTransferer *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__MSASAssetUploader_MMCSEngine_didMakePutProgress_state_onAsset___block_invoke;
  block[3] = &unk_1E6C3CE28;
  float v14 = a4;
  int v15 = a5;
  block[4] = self;
  id v13 = v9;
  id v11 = v9;
  dispatch_async(v10, block);
}

void __65__MSASAssetUploader_MMCSEngine_didMakePutProgress_state_onAsset___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = MSASPlatform();
  int v3 = [v2 shouldLogAtLevel:7];

  if (v3)
  {
    float v4 = *(float *)(a1 + 48);
    BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
    if (v4 == -1.0)
    {
      if (v5)
      {
        uint64_t v12 = *(void *)(a1 + 32);
        uint64_t v7 = +[MMCSEngine logStringForPutItemState:*(unsigned int *)(a1 + 52)];
        id v13 = *(void **)(a1 + 40);
        int v14 = 138543874;
        uint64_t v15 = v12;
        __int16 v16 = 2114;
        double v17 = *(double *)&v7;
        __int16 v18 = 2048;
        uint64_t v19 = v13;
        id v9 = MEMORY[0x1E4F14500];
        uint64_t v10 = "%{public}@: Upload progress state: %{public}@, on asset: %p";
        uint32_t v11 = 32;
        goto LABEL_8;
      }
    }
    else if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = +[MMCSEngine logStringForPutItemState:*(unsigned int *)(a1 + 52)];
      uint64_t v8 = *(void *)(a1 + 40);
      int v14 = 138544130;
      uint64_t v15 = v6;
      __int16 v16 = 2048;
      double v17 = v4;
      __int16 v18 = 2114;
      uint64_t v19 = v7;
      __int16 v20 = 2048;
      uint64_t v21 = v8;
      id v9 = MEMORY[0x1E4F14500];
      uint64_t v10 = "%{public}@: Upload progress: %.2f, state: %{public}@, on asset: %p";
      uint32_t v11 = 42;
LABEL_8:
      _os_log_debug_impl(&dword_1DC434000, v9, OS_LOG_TYPE_DEBUG, v10, (uint8_t *)&v14, v11);
    }
  }
}

- (void)MMCSEngine:(id)a3 didCreateRequestorContext:(id)a4 forAssets:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(MSASAssetTransferer *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__MSASAssetUploader_MMCSEngine_didCreateRequestorContext_forAssets___block_invoke;
  block[3] = &unk_1E6C3D998;
  id v13 = v8;
  int v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, block);
}

void __68__MSASAssetUploader_MMCSEngine_didCreateRequestorContext_forAssets___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) count])
  {
    uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v3 = *(id *)(a1 + 32);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v19;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v19 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = [*(id *)(*((void *)&v18 + 1) + 8 * v7) assetCollectionGUID];
          [v2 addObject:v8];

          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v5);
    }

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v9 = v2;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend(*(id *)(*(void *)(a1 + 40) + 160), "setObject:forKey:", *(void *)(a1 + 48), *(void *)(*((void *)&v14 + 1) + 8 * v13++), (void)v14);
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
      }
      while (v11);
    }
  }
}

- (void)MMCSEngine:(id)a3 didFinishPuttingAsset:(id)a4 putReceipt:(id)a5 error:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = [(MSASAssetTransferer *)self workQueue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __71__MSASAssetUploader_MMCSEngine_didFinishPuttingAsset_putReceipt_error___block_invoke;
  v16[3] = &unk_1E6C3D9C0;
  id v17 = v11;
  long long v18 = self;
  id v19 = v9;
  id v20 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v11;
  dispatch_async(v12, v16);
}

void __71__MSASAssetUploader_MMCSEngine_didFinishPuttingAsset_putReceipt_error___block_invoke(uint64_t a1)
{
  v1 = (id *)a1;
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(id **)(a1 + 40);
  if (v3)
  {
    uint64_t v4 = [v2[17] objectForKey:v1[6]];
    if (v4)
    {
      uint64_t v5 = [*((id *)v1[5] + 16) objectForKey:v4];
      if (v5)
      {
        uint64_t v6 = [v1[4] MMCSRetryAfterDate];
        if (v6)
        {
          uint64_t v7 = [v1[5] eventQueue];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __71__MSASAssetUploader_MMCSEngine_didFinishPuttingAsset_putReceipt_error___block_invoke_2;
          block[3] = &unk_1E6C3DB28;
          void block[4] = v1[5];
          id v65 = v6;
          dispatch_async(v7, block);
        }
        if ([v1[4] MMCSIsCancelError])
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            id v8 = v1[5];
            *(_DWORD *)buf = 138543362;
            id v68 = v8;
            _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Asset upload was canceled. Ignoring.", buf, 0xCu);
          }
          [v1[5] workQueueStopTrackingItem:v5];
        }
        else if ([v1[4] MMCSIsNetworkConditionsError])
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            id v26 = v1[5];
            *(_DWORD *)buf = 138543362;
            id v68 = v26;
            _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Encountered temporary network error while uploading asset. Will retry later.", buf, 0xCu);
          }
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            id v27 = v1[5];
            long long v28 = [v1[4] MSVerboseDescription];
            *(_DWORD *)buf = 138543618;
            id v68 = v27;
            __int16 v69 = 2114;
            v70 = v28;
            _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Error: %{public}@", buf, 0x16u);
          }
          [v1[5] workQueueStopTrackingItem:v5];
          [v1[5] setDidEncounterNetworkConditionError:1];
        }
        else if (([v1[4] MMCSIsFatalError] & 1) != 0 {
               || (int v32 = [v5 errorCount] + 1, v32 >= (int)objc_msgSend(v1[5], "maxRetryCount")))
        }
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            id v46 = v1[5];
            v47 = [v1[4] MSVerboseDescription];
            *(_DWORD *)buf = 138543874;
            id v68 = v46;
            __int16 v69 = 2114;
            v70 = v4;
            __int16 v71 = 2114;
            v72 = v47;
            _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Failed to upload asset collection: %{public}@. Error: %{public}@. Giving up.", buf, 0x20u);
          }
          [v1[5] workQueueDidFinishWithItem:v5 error:v1[4]];
        }
        else
        {
          long long v33 = [v1[5] model];
          objc_msgSend(v33, "setErrorCount:forAssetCollectionInUploadQueue:", objc_msgSend(v5, "errorCount") + 1, v4);

          if ([v1[4] MMCSIsAuthorizationError])
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
            {
              id v34 = v1[5];
              v35 = [v1[4] MSVerboseDescription];
              *(_DWORD *)buf = 138543618;
              id v68 = v34;
              __int16 v69 = 2114;
              v70 = v35;
              _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Encountered MMCS auth error. Will reauthorize. Error: %{public}@", buf, 0x16u);
            }
            obja = v1;
            long long v62 = 0u;
            long long v63 = 0u;
            long long v60 = 0u;
            long long v61 = 0u;
            id v51 = [v4 assets];
            uint64_t v36 = [v51 countByEnumeratingWithState:&v60 objects:v73 count:16];
            if (v36)
            {
              uint64_t v37 = v36;
              uint64_t v38 = *(void *)v61;
              while (2)
              {
                for (uint64_t i = 0; i != v37; ++i)
                {
                  if (*(void *)v61 != v38) {
                    objc_enumerationMutation(v51);
                  }
                  uint64_t v40 = *(void **)(*((void *)&v60 + 1) + 8 * i);
                  uint64_t v41 = [v40 GUID];
                  v42 = [obja[6] GUID];
                  int v43 = [v41 isEqualToString:v42];

                  if (v43)
                  {
                    [v40 setMMCSAccessHeader:0];
                    goto LABEL_65;
                  }
                }
                uint64_t v37 = [v51 countByEnumeratingWithState:&v60 objects:v73 count:16];
                if (v37) {
                  continue;
                }
                break;
              }
            }
LABEL_65:

            [*((id *)obja[5] + 19) addObject:v5];
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              id v48 = v1[5];
              v49 = [v1[4] MSVerboseDescription];
              *(_DWORD *)buf = 138543874;
              id v68 = v48;
              __int16 v69 = 2114;
              v70 = v4;
              __int16 v71 = 2114;
              v72 = v49;
              _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Failed to upload asset collection %{public}@. Error: %{public}@. Will retry later.", buf, 0x20u);
            }
            [v1[5] workQueueStopTrackingItem:v5];
            v44 = [v1[5] eventQueue];
            v59[0] = MEMORY[0x1E4F143A8];
            v59[1] = 3221225472;
            v59[2] = __71__MSASAssetUploader_MMCSEngine_didFinishPuttingAsset_putReceipt_error___block_invoke_19;
            v59[3] = &unk_1E6C3DA38;
            v59[4] = v1[5];
            dispatch_async(v44, v59);
          }
        }
      }
      else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        id v22 = v1[5];
        id v23 = v1[6];
        *(_DWORD *)buf = 138543618;
        id v68 = v22;
        __int16 v69 = 2114;
        v70 = v23;
        _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Already reported error on asset %{public}@. Ignoring.", buf, 0x16u);
      }
      goto LABEL_59;
    }
  }
  else
  {
    id v9 = [v2 eventQueue];
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __71__MSASAssetUploader_MMCSEngine_didFinishPuttingAsset_putReceipt_error___block_invoke_20;
    v58[3] = &unk_1E6C3DA38;
    v58[4] = v1[5];
    dispatch_async(v9, v58);

    uint64_t v4 = [*((id *)v1[5] + 17) objectForKey:v1[6]];
    if (v4)
    {
      [*((id *)v1[5] + 17) removeObjectForKey:v1[6]];
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id v10 = [v4 assets];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v54 objects:v66 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        id v50 = v4;
        obuint64_t j = v10;
        uint64_t v13 = *(void *)v55;
        char v14 = 1;
        do
        {
          for (uint64_t j = 0; j != v12; ++j)
          {
            if (*(void *)v55 != v13) {
              objc_enumerationMutation(obj);
            }
            long long v16 = *(void **)(*((void *)&v54 + 1) + 8 * j);
            id v17 = objc_msgSend(v16, "GUID", v50);
            [v1[6] GUID];
            id v19 = v18 = v1;
            int v20 = [v17 isEqualToString:v19];

            v1 = v18;
            if (v20) {
              [v16 setMMCSReceipt:v18[7]];
            }
            long long v21 = [*((id *)v18[5] + 17) objectForKey:v16];

            v14 &= v21 == 0;
          }
          uint64_t v12 = [obj countByEnumeratingWithState:&v54 objects:v66 count:16];
        }
        while (v12);

        uint64_t v4 = v50;
        if ((v14 & 1) == 0) {
          goto LABEL_60;
        }
      }
      else
      {
      }
      uint64_t v5 = [*((id *)v1[5] + 16) objectForKey:v4];
      if (v5)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          id v29 = v1[5];
          *(_DWORD *)buf = 138543618;
          id v68 = v29;
          __int16 v69 = 2114;
          v70 = v4;
          _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Successfully uploaded asset collection: %{public}@", buf, 0x16u);
        }
        [v1[5] workQueueDidFinishWithItem:v5 error:0];
        long long v30 = (void *)*((void *)v1[5] + 20);
        long long v31 = [v4 GUID];
        [v30 removeObjectForKey:v31];
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          id v45 = v1[5];
          *(_DWORD *)buf = 138543362;
          id v68 = v45;
          _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Could not find upload item that matches the completed asset collection.", buf, 0xCu);
        }
        long long v31 = MSPlatform();
        [v31 didDetectUnrecoverableCondition];
      }

LABEL_59:
      goto LABEL_60;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v24 = v1[5];
      id v25 = v1[6];
      *(_DWORD *)buf = 138543618;
      id v68 = v24;
      __int16 v69 = 2114;
      v70 = v25;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Successfully uploaded asset %{public}@, but can't find matching asset collection. Ignoring.", buf, 0x16u);
    }
  }
LABEL_60:
}

void __71__MSASAssetUploader_MMCSEngine_didFinishPuttingAsset_putReceipt_error___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) backoffManager];
  [v2 didReceiveRetryAfterDate:*(void *)(a1 + 40)];
}

void __71__MSASAssetUploader_MMCSEngine_didFinishPuttingAsset_putReceipt_error___block_invoke_19(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) backoffManager];
  [v1 backoff];
}

void __71__MSASAssetUploader_MMCSEngine_didFinishPuttingAsset_putReceipt_error___block_invoke_20(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) backoffManager];
  [v2 reset];

  id v4 = [*(id *)(a1 + 32) daemon];
  uint64_t v3 = [*(id *)(a1 + 32) personID];
  [v4 didReceiveAuthSuccessForPersonID:v3];
}

- (void)workQueueDidFinishWithItem:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(MSASAssetUploader *)self workQueueStopTrackingItem:v7];
  id v8 = [v7 object];
  id v9 = [(MSASAssetTransferer *)self model];
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObject:v8];
  [v9 removeAssetCollectionsFromUploadQueue:v10];

  [(NSMutableArray *)self->_finishedAssetCollections addObject:v8];
  uint64_t v11 = [v7 album];

  uint64_t v12 = [(MSASAssetTransferer *)self eventQueue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __54__MSASAssetUploader_workQueueDidFinishWithItem_error___block_invoke;
  v16[3] = &unk_1E6C3D9C0;
  void v16[4] = self;
  id v17 = v8;
  id v18 = v11;
  id v19 = v6;
  id v13 = v6;
  id v14 = v11;
  id v15 = v8;
  dispatch_async(v12, v16);
}

void __54__MSASAssetUploader_workQueueDidFinishWithItem_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 MSASAssetUploader:*(void *)(a1 + 32) didFinishUploadingAssetCollection:*(void *)(a1 + 40) intoAlbum:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

- (void)workQueueStopTrackingItem:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 object];
  [(NSMutableArray *)self->_itemsInFlight removeObject:v4];
  [(NSMutableDictionary *)self->_assetCollectionsToItemInFlightMap removeObjectForKey:v5];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = objc_msgSend(v5, "assets", 0);
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
        [(NSMutableDictionary *)self->_assetToAssetCollectionMap removeObjectForKey:*(void *)(*((void *)&v11 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)cancelAssetCollections:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MSASAssetTransferer *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__MSASAssetUploader_cancelAssetCollections___block_invoke;
  v7[3] = &unk_1E6C3DB28;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __44__MSASAssetUploader_cancelAssetCollections___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) workQueueCancelAssetCollections:*(void *)(a1 + 40)];
}

- (void)unregisterAssetCollections:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (void *)[a3 copy];
  id v8 = [(MSASAssetTransferer *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__MSASAssetUploader_unregisterAssetCollections_completionBlock___block_invoke;
  block[3] = &unk_1E6C3D198;
  id v12 = v7;
  long long v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

uint64_t __64__MSASAssetUploader_unregisterAssetCollections_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v21;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v21 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v20 + 1) + 8 * v5);
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        uint64_t v7 = [v6 assets];
        uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v24 count:16];
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
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * v11);
              long long v13 = [*(id *)(a1 + 40) engine];
              [v13 unregisterAsset:v12];

              ++v11;
            }
            while (v9 != v11);
            uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v24 count:16];
          }
          while (v9);
        }

        ++v5;
      }
      while (v5 != v3);
      uint64_t v3 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v3);
  }

  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)unregisterAssetCollections:(id)a3
{
}

- (void)registerAssetCollections:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(MSASAssetTransferer *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__MSASAssetUploader_registerAssetCollections_completionBlock___block_invoke;
  block[3] = &unk_1E6C3D198;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __62__MSASAssetUploader_registerAssetCollections_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__MSASAssetUploader_registerAssetCollections_completionBlock___block_invoke_2;
  v5[3] = &unk_1E6C3CDD8;
  v5[4] = *(void *)(a1 + 32);
  id v6 = *(id *)(a1 + 48);
  [v2 workQueueRegisterAssetCollections:v3 index:0 results:v4 completionBlock:v5];
}

void __62__MSASAssetUploader_registerAssetCollections_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) eventQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__MSASAssetUploader_registerAssetCollections_completionBlock___block_invoke_3;
  v7[3] = &unk_1E6C3DB00;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __62__MSASAssetUploader_registerAssetCollections_completionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)workQueueRegisterAssetCollections:(id)a3 index:(unint64_t)a4 results:(id)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = (void (**)(id, id))a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "count"));
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  if ([v10 count] <= a4)
  {
    v12[2](v12, v11);
  }
  else
  {
    id v13 = [v10 objectAtIndex:a4];
    id v14 = [v13 assets];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __85__MSASAssetUploader_workQueueRegisterAssetCollections_index_results_completionBlock___block_invoke;
    v15[3] = &unk_1E6C3CDB0;
    id v16 = v11;
    long long v17 = self;
    id v18 = v10;
    unint64_t v20 = a4;
    long long v19 = v12;
    [(MSASAssetUploader *)self workQueueRegisterAssets:v14 index:0 completionBlock:v15];
  }
}

void __85__MSASAssetUploader_workQueueRegisterAssetCollections_index_results_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  if (a2)
  {
    [*(id *)(a1 + 32) addObject:a2];
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA98] null];
    [v3 addObject:v4];
  }
  id v5 = [*(id *)(a1 + 40) workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__MSASAssetUploader_workQueueRegisterAssetCollections_index_results_completionBlock___block_invoke_2;
  block[3] = &unk_1E6C3CD88;
  id v6 = *(void **)(a1 + 48);
  void block[4] = *(void *)(a1 + 40);
  id v7 = v6;
  uint64_t v8 = *(void *)(a1 + 64);
  id v10 = v7;
  uint64_t v13 = v8;
  id v11 = *(id *)(a1 + 32);
  id v12 = *(id *)(a1 + 56);
  dispatch_async(v5, block);
}

uint64_t __85__MSASAssetUploader_workQueueRegisterAssetCollections_index_results_completionBlock___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) workQueueRegisterAssetCollections:*(void *)(a1 + 40) index:*(void *)(a1 + 64) + 1 results:*(void *)(a1 + 48) completionBlock:*(void *)(a1 + 56)];
}

- (void)workQueueRegisterAssets:(id)a3 index:(unint64_t)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, void))a5;
  if ([v8 count] <= a4)
  {
    v9[2](v9, 0);
  }
  else
  {
    id v10 = [v8 objectAtIndex:a4];
    objc_msgSend(v10, "setMMCSItemID:", -[MSASAssetTransferer workQueueNextItemID](self, "workQueueNextItemID"));
    id v11 = [(MSASAssetTransferer *)self engine];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __67__MSASAssetUploader_workQueueRegisterAssets_index_completionBlock___block_invoke;
    v12[3] = &unk_1E6C3CD60;
    id v14 = v9;
    v12[4] = self;
    id v13 = v8;
    unint64_t v15 = a4;
    [v11 registerAssetForUpload:v10 completionBlock:v12];
  }
}

void __67__MSASAssetUploader_workQueueRegisterAssets_index_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v3();
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 32) workQueue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __67__MSASAssetUploader_workQueueRegisterAssets_index_completionBlock___block_invoke_2;
    v9[3] = &unk_1E6C3D078;
    id v5 = *(void **)(a1 + 40);
    v9[4] = *(void *)(a1 + 32);
    id v6 = v5;
    id v8 = *(void **)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 56);
    id v10 = v6;
    uint64_t v12 = v7;
    id v11 = v8;
    dispatch_async(v4, v9);
  }
}

uint64_t __67__MSASAssetUploader_workQueueRegisterAssets_index_completionBlock___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) workQueueRegisterAssets:*(void *)(a1 + 40) index:*(void *)(a1 + 56) + 1 completionBlock:*(void *)(a1 + 48)];
}

- (void)workQueueCancelAssetCollections:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSMutableDictionary *)self->_assetCollectionGUIDToRequestorContext count] == 1)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v16 = v4;
    obuint64_t j = v4;
    uint64_t v5 = [obj countByEnumeratingWithState:&v18 objects:v28 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = MEMORY[0x1E4F14500];
      uint64_t v8 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          assetCollectionGUIDToRequestorContext = self->_assetCollectionGUIDToRequestorContext;
          uint64_t v12 = [v10 GUID];
          id v13 = [(NSMutableDictionary *)assetCollectionGUIDToRequestorContext objectForKey:v12];

          BOOL v14 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
          if (v13)
          {
            if (v14)
            {
              *(_DWORD *)buf = 138543874;
              long long v23 = self;
              __int16 v24 = 2114;
              id v25 = v10;
              __int16 v26 = 2114;
              id v27 = v13;
              _os_log_impl(&dword_1DC434000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Cancelling in-progress upload for asset collection %{public}@ with context %{public}@", buf, 0x20u);
            }
            unint64_t v15 = [(MSASAssetTransferer *)self engine];
            [v15 cancelOperationsWithContext:v13];
          }
          else if (v14)
          {
            *(_DWORD *)buf = 138543618;
            long long v23 = self;
            __int16 v24 = 2114;
            id v25 = v10;
            _os_log_impl(&dword_1DC434000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Cannot cancel upload for assetCollection %{public}@ which is not in progress", buf, 0x16u);
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v28 count:16];
      }
      while (v6);
    }

    id v4 = v16;
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    long long v23 = self;
    __int16 v24 = 2114;
    id v25 = v4;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Cannot cancel upload for assetCollections %{public}@ which is either not in progress, or has more than one items in an upload batch", buf, 0x16u);
  }
}

- (void)workQueueUploadNextBatch
{
  uint64_t v149 = *MEMORY[0x1E4F143B8];
  if (![(MSASAssetTransferer *)self hasShutDown])
  {
    [(MSASAssetUploader *)self setDidEncounterNetworkConditionError:0];
    id v4 = [(MSASAssetTransferer *)self model];
    uint64_t v5 = [(MSASAssetTransferer *)self focusAlbumGUID];
    uint64_t v6 = objc_msgSend(v4, "nextItemsForUploadAlbumGUID:maxPriority:maxCount:", v5, 0, -[MSASAssetTransferer maxBatchCount](self, "maxBatchCount"));
    uint64_t v7 = (void *)[v6 mutableCopy];

    if (![v7 count])
    {
      uint64_t v8 = [(MSASAssetTransferer *)self model];
      id v9 = [(MSASAssetTransferer *)self focusAlbumGUID];
      id v10 = [v8 nextItemsForUploadAlbumGUID:v9 maxPriority:10 maxCount:1];
      uint64_t v11 = [v10 mutableCopy];
      uint64_t v12 = v7;
      uint64_t v7 = (void *)v11;
    }
    if (![v7 count])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v139 = self;
        _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Nothing to upload.", buf, 0xCu);
      }
      [(MSASAssetUploader *)self workQueueGoIdle];
      goto LABEL_100;
    }
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    id v13 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    itemsInFlight = self->_itemsInFlight;
    self->_itemsInFlight = v13;

    objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
    unint64_t v15 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    assetCollectionsToItemInFlightMap = self->_assetCollectionsToItemInFlightMap;
    self->_assetCollectionsToItemInFlightMap = v15;

    objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v7, "count"));
    long long v17 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    assetCollectionsWithAuthorizationError = self->_assetCollectionsWithAuthorizationError;
    self->_assetCollectionsWithAuthorizationError = v17;

    objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
    long long v19 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    assetCollectionGUIDToRequestorContext = self->_assetCollectionGUIDToRequestorContext;
    self->_assetCollectionGUIDToRequestorContext = v19;

    assetToAssetCollectionMap = self->_assetToAssetCollectionMap;
    self->_assetToAssetCollectionMap = 0;

    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    long long v22 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    finishedAssetCollections = self->_finishedAssetCollections;
    self->_finishedAssetCollections = v22;

    [MEMORY[0x1E4F1CA60] dictionary];
    v92 = v91 = v7;
    long long v129 = 0u;
    long long v130 = 0u;
    long long v131 = 0u;
    long long v132 = 0u;
    obuint64_t j = v7;
    uint64_t v96 = [obj countByEnumeratingWithState:&v129 objects:v148 count:16];
    if (v96)
    {
      v101 = 0;
      uint64_t v94 = *(void *)v130;
      do
      {
        for (uint64_t i = 0; i != v96; ++i)
        {
          if (*(void *)v130 != v94) {
            objc_enumerationMutation(obj);
          }
          id v25 = *(void **)(*((void *)&v129 + 1) + 8 * i);
          __int16 v26 = [v25 object];
          long long v125 = 0u;
          long long v126 = 0u;
          long long v127 = 0u;
          long long v128 = 0u;
          v98 = v26;
          id v27 = [v26 assets];
          uint64_t v28 = [v27 countByEnumeratingWithState:&v125 objects:v147 count:16];
          if (v28)
          {
            uint64_t v29 = v28;
            uint64_t v30 = *(void *)v126;
            while (2)
            {
              for (uint64_t j = 0; j != v29; ++j)
              {
                if (*(void *)v126 != v30) {
                  objc_enumerationMutation(v27);
                }
                int v32 = *(void **)(*((void *)&v125 + 1) + 8 * j);
                long long v33 = [v32 MMCSURL];

                if (!v33)
                {
                  uint64_t v36 = (void *)MEMORY[0x1E4F1C9E8];
                  uint64_t v37 = [(MSASAssetTransferer *)self _missingURLError];
                  uint64_t v38 = [v25 album];
                  __int16 v39 = objc_msgSend(v36, "dictionaryWithObjectsAndKeys:", v37, @"error", v38, @"album", 0);

                  [v92 setObject:v39 forKey:v98];
LABEL_27:

                  goto LABEL_28;
                }
                id v34 = [v32 MMCSURL];
                if (v101)
                {
                  int v35 = [v101 isEqual:v34];

                  if (!v35) {
                    goto LABEL_27;
                  }
                }
                else
                {
                  v101 = v34;
                }
              }
              uint64_t v29 = [v27 countByEnumeratingWithState:&v125 objects:v147 count:16];
              if (v29) {
                continue;
              }
              break;
            }
          }

          [(NSMutableArray *)self->_itemsInFlight addObject:v25];
LABEL_28:
        }
        uint64_t v96 = [obj countByEnumeratingWithState:&v129 objects:v148 count:16];
      }
      while (v96);
    }
    else
    {
      v101 = 0;
    }

    if ([v92 count])
    {
      long long v123 = 0u;
      long long v124 = 0u;
      long long v121 = 0u;
      long long v122 = 0u;
      id v40 = v92;
      uint64_t v41 = [v40 countByEnumeratingWithState:&v121 objects:v146 count:16];
      if (v41)
      {
        uint64_t v42 = v41;
        uint64_t v99 = *(void *)v122;
        do
        {
          for (uint64_t k = 0; k != v42; ++k)
          {
            if (*(void *)v122 != v99) {
              objc_enumerationMutation(v40);
            }
            v44 = *(void **)(*((void *)&v121 + 1) + 8 * k);
            id v45 = [v40 objectForKey:v44];
            id v46 = [v45 objectForKey:@"error"];
            v47 = [v45 objectForKey:@"album"];
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138544130;
              v139 = self;
              __int16 v140 = 2114;
              uint64_t v141 = (uint64_t)v44;
              __int16 v142 = 2114;
              uint64_t v143 = (uint64_t)v47;
              __int16 v144 = 2114;
              v145 = v46;
              _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Rejecting asset collection %{public}@ from album %{public}@. Error: %{public}@", buf, 0x2Au);
            }
            id v48 = [(MSASAssetTransferer *)self eventQueue];
            v118[0] = MEMORY[0x1E4F143A8];
            v118[1] = 3221225472;
            v118[2] = __45__MSASAssetUploader_workQueueUploadNextBatch__block_invoke_12;
            v118[3] = &unk_1E6C3D9C0;
            v118[4] = self;
            v118[5] = v44;
            id v119 = v47;
            id v120 = v46;
            id v49 = v46;
            id v50 = v47;
            dispatch_async(v48, v118);
          }
          uint64_t v42 = [v40 countByEnumeratingWithState:&v121 objects:v146 count:16];
        }
        while (v42);
      }

      id v51 = [(MSASAssetTransferer *)self model];
      v52 = [v40 allKeys];
      [v51 removeAssetCollectionsFromUploadQueue:v52];
    }
    if (![(NSMutableArray *)self->_itemsInFlight count])
    {
      uint64_t v7 = v91;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v139 = self;
        _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: No assets to upload.", buf, 0xCu);
      }
      [(MSASAssetUploader *)self workQueueGoIdle];
      goto LABEL_99;
    }
    objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", 2 * -[NSMutableArray count](self->_itemsInFlight, "count"));
    v53 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    long long v54 = self->_assetToAssetCollectionMap;
    self->_assetToAssetCollectionMap = v53;

    long long v116 = 0u;
    long long v117 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    v95 = self->_itemsInFlight;
    uint64_t v100 = [(NSMutableArray *)v95 countByEnumeratingWithState:&v114 objects:v137 count:16];
    if (v100)
    {
      uint64_t v97 = *(void *)v115;
      do
      {
        for (uint64_t m = 0; m != v100; ++m)
        {
          if (*(void *)v115 != v97) {
            objc_enumerationMutation(v95);
          }
          long long v56 = *(void **)(*((void *)&v114 + 1) + 8 * m);
          long long v57 = [v56 object];
          if (v57)
          {
            [(NSMutableDictionary *)self->_assetCollectionsToItemInFlightMap setObject:v56 forKey:v57];
            long long v112 = 0u;
            long long v113 = 0u;
            long long v110 = 0u;
            long long v111 = 0u;
            v58 = [v57 assets];
            uint64_t v59 = [v58 countByEnumeratingWithState:&v110 objects:v136 count:16];
            if (v59)
            {
              uint64_t v60 = v59;
              uint64_t v61 = *(void *)v111;
              do
              {
                for (uint64_t n = 0; n != v60; ++n)
                {
                  if (*(void *)v111 != v61) {
                    objc_enumerationMutation(v58);
                  }
                  long long v63 = *(void **)(*((void *)&v110 + 1) + 8 * n);
                  v64 = [v63 MMCSReceipt];

                  if (!v64) {
                    [(NSMutableDictionary *)self->_assetToAssetCollectionMap setObject:v57 forKey:v63];
                  }
                }
                uint64_t v60 = [v58 countByEnumeratingWithState:&v110 objects:v136 count:16];
              }
              while (v60);
            }
          }
          else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v139 = self;
            __int16 v140 = 2114;
            uint64_t v141 = (uint64_t)v56;
            _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Missing expected asset collection in person model item %{public}@.", buf, 0x16u);
          }
        }
        uint64_t v100 = [(NSMutableArray *)v95 countByEnumeratingWithState:&v114 objects:v137 count:16];
      }
      while (v100);
    }

    if ([(NSMutableDictionary *)self->_assetToAssetCollectionMap count])
    {
      long long v108 = 0u;
      long long v109 = 0u;
      long long v106 = 0u;
      long long v107 = 0u;
      id v65 = self->_assetToAssetCollectionMap;
      uint64_t v66 = [(NSMutableDictionary *)v65 countByEnumeratingWithState:&v106 objects:v135 count:16];
      if (v66)
      {
        uint64_t v67 = v66;
        uint64_t v68 = *(void *)v107;
        do
        {
          for (iuint64_t i = 0; ii != v67; ++ii)
          {
            if (*(void *)v107 != v68) {
              objc_enumerationMutation(v65);
            }
            uint64_t v70 = *(void *)(*((void *)&v106 + 1) + 8 * ii);
            __int16 v71 = [(MSASAssetTransferer *)self engine];
            [v71 reregisterAssetForUpload:v70];
          }
          uint64_t v67 = [(NSMutableDictionary *)v65 countByEnumeratingWithState:&v106 objects:v135 count:16];
        }
        while (v67);
      }

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v72 = [(NSMutableDictionary *)self->_assetToAssetCollectionMap count];
        uint64_t v73 = [(NSMutableArray *)self->_itemsInFlight count];
        *(_DWORD *)buf = 138543874;
        v139 = self;
        __int16 v140 = 2048;
        uint64_t v141 = v72;
        __int16 v142 = 2048;
        uint64_t v143 = v73;
        _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Uploading %ld assets for %ld asset collections.", buf, 0x20u);
      }
      uint64_t v74 = MSASPlatform();
      char v75 = objc_opt_respondsToSelector();

      if (v75)
      {
        v76 = MSASPlatform();
        v77 = [(MSASAssetTransferer *)self personID];
        v78 = [v76 MMCSUploadSocketOptionsForPersonID:v77];

        if (v78)
        {
          v79 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v78 forKey:*MEMORY[0x1E4F739B8]];
        }
        else
        {
          v79 = 0;
        }
      }
      else
      {
        v79 = 0;
      }
      v87 = [(MSASAssetTransferer *)self engine];
      v88 = [(NSMutableDictionary *)self->_assetToAssetCollectionMap allKeys];
      v89 = [(MSASAssetTransferer *)self personID];
      [v87 putAssets:v88 requestURL:v101 DSID:v89 options:v79];
    }
    else
    {
      uint64_t v7 = v91;
      if (![(NSMutableArray *)self->_itemsInFlight count])
      {
LABEL_99:

LABEL_100:
        return;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        uint64_t v90 = [(NSMutableArray *)self->_itemsInFlight count];
        *(_DWORD *)buf = 138543618;
        v139 = self;
        __int16 v140 = 2048;
        uint64_t v141 = v90;
        _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: No assets to upload, but detected %ld orphaned asset collections.", buf, 0x16u);
      }
      long long v104 = 0u;
      long long v105 = 0u;
      long long v102 = 0u;
      long long v103 = 0u;
      v80 = self->_itemsInFlight;
      uint64_t v81 = [(NSMutableArray *)v80 countByEnumeratingWithState:&v102 objects:v134 count:16];
      if (v81)
      {
        uint64_t v82 = v81;
        uint64_t v83 = *(void *)v103;
        do
        {
          for (juint64_t j = 0; jj != v82; ++jj)
          {
            if (*(void *)v103 != v83) {
              objc_enumerationMutation(v80);
            }
            uint64_t v85 = *(void *)(*((void *)&v102 + 1) + 8 * jj);
            v86 = [(MSASAssetUploader *)self _orphanedAssetCollectionError];
            [(MSASAssetUploader *)self workQueueDidFinishWithItem:v85 error:v86];
          }
          uint64_t v82 = [(NSMutableArray *)v80 countByEnumeratingWithState:&v102 objects:v134 count:16];
        }
        while (v82);
      }

      [(MSASAssetUploader *)self workQueueGoIdle];
    }
    uint64_t v7 = v91;
    goto LABEL_99;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v139 = self;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Not uploading because we're shutting down.", buf, 0xCu);
  }
  id v3 = [(MSASAssetTransferer *)self eventQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__MSASAssetUploader_workQueueUploadNextBatch__block_invoke;
  block[3] = &unk_1E6C3DA38;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __45__MSASAssetUploader_workQueueUploadNextBatch__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) daemon];
  [v1 releaseBusy];
}

void __45__MSASAssetUploader_workQueueUploadNextBatch__block_invoke_12(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 MSASAssetUploader:*(void *)(a1 + 32) didFinishUploadingAssetCollection:*(void *)(a1 + 40) intoAlbum:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

- (id)_orphanedAssetCollectionError
{
  if (_orphanedAssetCollectionError_onceToken != -1) {
    dispatch_once(&_orphanedAssetCollectionError_onceToken, &__block_literal_global_5810);
  }
  id v2 = (void *)_orphanedAssetCollectionError_error;
  return v2;
}

void __50__MSASAssetUploader__orphanedAssetCollectionError__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F28C58];
  id v3 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_ASSET_UPLOADER_ORPHANED");
  uint64_t v1 = [v0 MSErrorWithDomain:@"MSASAssetUploaderErrorDomain" code:0 description:v3];
  id v2 = (void *)_orphanedAssetCollectionError_error;
  _orphanedAssetCollectionError_error = v1;
}

- (void)workQueueCancel
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (self->_state == 1)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      __int16 v26 = self;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Canceling all uploads.", buf, 0xCu);
    }
    [(MSASAssetUploader *)self _workQueueStop];
  }
  id v3 = [(MSASAssetTransferer *)self model];
  id v4 = [v3 nextItemsForUploadMaxCount:10];

  id v16 = v4;
  if ([v4 count])
  {
    do
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v5 = v16;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v21 != v8) {
              objc_enumerationMutation(v5);
            }
            id v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            uint64_t v11 = [v10 object];
            uint64_t v12 = [v10 album];
            id v13 = [(MSASAssetTransferer *)self eventQueue];
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __36__MSASAssetUploader_workQueueCancel__block_invoke;
            block[3] = &unk_1E6C3D998;
            void block[4] = self;
            id v18 = v11;
            id v19 = v12;
            id v14 = v12;
            id v15 = v11;
            dispatch_async(v13, block);
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v7);
      }
    }
    while ([v5 count]);
  }
}

void __36__MSASAssetUploader_workQueueCancel__block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) delegate];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = [v2 _canceledError];
  [v6 MSASAssetUploader:v2 didFinishUploadingAssetCollection:v3 intoAlbum:v4 error:v5];
}

- (void)workQueueShutDownCompletionBlock:(id)a3
{
  id v4 = a3;
  [(MSASAssetUploader *)self workQueueStop];
  v5.receiver = self;
  v5.super_class = (Class)MSASAssetUploader;
  [(MSASAssetTransferer *)&v5 workQueueShutDownCompletionBlock:v4];
}

- (void)workQueueStop
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (self->_state == 1)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 138543362;
      id v4 = self;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Stopping all uploads.", (uint8_t *)&v3, 0xCu);
    }
    [(MSASAssetUploader *)self _workQueueStop];
  }
}

- (void)_workQueueStop
{
  if (self->_state == 1)
  {
    int v3 = [(MSASAssetTransferer *)self engine];
    [v3 cancelAllOperations];

    [(MSASAssetUploader *)self workQueueGoIdle];
  }
}

- (void)workQueueGoIdle
{
  if ([(MSASAssetUploader *)self state])
  {
    assetToAssetCollectionMap = self->_assetToAssetCollectionMap;
    self->_assetToAssetCollectionMap = 0;

    itemsInFlight = self->_itemsInFlight;
    self->_itemsInFlight = 0;

    uint64_t v5 = self->_assetToAssetCollectionMap;
    self->_assetToAssetCollectionMap = 0;

    finishedAssetCollections = self->_finishedAssetCollections;
    self->_finishedAssetCollections = 0;

    assetCollectionsWithAuthorizationError = self->_assetCollectionsWithAuthorizationError;
    self->_assetCollectionsWithAuthorizationError = 0;

    assetCollectionGUIDToRequestorContext = self->_assetCollectionGUIDToRequestorContext;
    self->_assetCollectionGUIDToRequestorContext = 0;

    self->_state = 0;
    [(MSASAssetTransferer *)self _sendDidIdleNotification];
    id v9 = [(MSASAssetTransferer *)self eventQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __36__MSASAssetUploader_workQueueGoIdle__block_invoke;
    block[3] = &unk_1E6C3DA38;
    void block[4] = self;
    dispatch_async(v9, block);
  }
}

void __36__MSASAssetUploader_workQueueGoIdle__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) daemon];
  [v1 releaseBusy];
}

- (void)workQueueRetryOutstandingActivities
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int state = self->_state;
  if (state != 1)
  {
    if (state)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v10 = self;
        __int16 v11 = 1024;
        int v12 = state;
        _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Unknown state: %d", buf, 0x12u);
      }
      uint64_t v7 = MSPlatform();
      [v7 didDetectUnrecoverableCondition];
    }
    else
    {
      id v4 = MSASPlatform();
      int v5 = [v4 MSASIsAllowedToUploadAssets];

      if (v5)
      {
        self->_int state = 1;
        id v6 = [(MSASAssetTransferer *)self eventQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __56__MSASAssetUploader_workQueueRetryOutstandingActivities__block_invoke;
        block[3] = &unk_1E6C3DA38;
        void block[4] = self;
        dispatch_async(v6, block);

        [(MSASAssetUploader *)self workQueueUploadNextBatch];
      }
    }
  }
}

void __56__MSASAssetUploader_workQueueRetryOutstandingActivities__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) daemon];
  [v1 retainBusy];
}

- (id)_pathForPersonID:(id)a3
{
  return MSPathAlbumSharingPublishMMCSLibraryForPersonID(a3);
}

@end