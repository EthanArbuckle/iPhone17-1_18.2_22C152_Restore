@interface ATStoreDownloadService
+ (NSString)downloadDirectoryPath;
+ (id)sharedService;
- (ATStoreDownloadService)init;
- (id)_newAssetOperationForAsset:(id)a3 prepareOperationResult:(id)a4;
- (id)_newPrepareOperationForAsset:(id)a3;
- (id)_newProcessAssetOperationForasset:(id)a3 assetsOperationResult:(id)a4;
- (void)_finishAsset:(id)a3 withError:(id)a4 cancelPendingDownloads:(BOOL)a5;
- (void)_prepareDownloadDirectory;
- (void)_updateProgressForAsset:(id)a3 progress:(float)a4;
- (void)_updateStateForAsset:(id)a3 oldState:(int64_t)a4 newState:(int64_t)a5;
- (void)addDownloadObserver:(id)a3;
- (void)cancelAsset:(id)a3;
- (void)enqueueAsset:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)prioritizeAsset:(id)a3;
- (void)removeDownloadObserver:(id)a3;
@end

@implementation ATStoreDownloadService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_progressForAsset, 0);
  objc_storeStrong((id *)&self->_downloadOperations, 0);
  objc_storeStrong((id *)&self->_processAssetsOperationQueue, 0);
  objc_storeStrong((id *)&self->_downloadOperationQueue, 0);

  objc_storeStrong((id *)&self->_prepareOperationQueue, 0);
}

- (void)_finishAsset:(id)a3 withError:(id)a4 cancelPendingDownloads:(BOOL)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = _ATLogCategoryStoreDownloads();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v19 = self;
    __int16 v20 = 2114;
    id v21 = v8;
    _os_log_impl(&dword_1D9A2D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Finished asset %{public}@", buf, 0x16u);
  }

  lock = self->_lock;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __72__ATStoreDownloadService__finishAsset_withError_cancelPendingDownloads___block_invoke;
  v14[3] = &unk_1E6B87C88;
  v14[4] = self;
  id v15 = v8;
  BOOL v17 = a5;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  [(ICUnfairLock *)lock lockWithBlock:v14];
}

void __72__ATStoreDownloadService__finishAsset_withError_cancelPendingDownloads___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(*(void *)(a1 + 32) + 40);
  v3 = [*(id *)(a1 + 40) identifier];
  [v2 removeObjectForKey:v3];

  if (*(unsigned char *)(a1 + 56))
  {
    v4 = _ATLogCategoryStoreDownloads();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v27 = v5;
      __int16 v28 = 2114;
      uint64_t v29 = v6;
      _os_log_impl(&dword_1D9A2D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Cancelling remaining like assets for failed asset %{public}@", buf, 0x16u);
    }

    [*(id *)(*(void *)(a1 + 32) + 8) cancelAllOperations];
  }
  v7 = *(void **)(*(void *)(a1 + 32) + 32);
  id v8 = [*(id *)(a1 + 40) identifier];
  [v7 removeObjectForKey:v8];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = *(id *)(*(void *)(a1 + 32) + 48);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * v13);
        uint64_t v15 = *(void *)(a1 + 32);
        id v16 = *(NSObject **)(v15 + 64);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __72__ATStoreDownloadService__finishAsset_withError_cancelPendingDownloads___block_invoke_66;
        block[3] = &unk_1E6B87AB0;
        block[4] = v14;
        block[5] = v15;
        id v18 = *(id *)(a1 + 40);
        id v19 = *(id *)(a1 + 48);
        char v20 = *(unsigned char *)(a1 + 56);
        dispatch_async(v16, block);

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }
}

uint64_t __72__ATStoreDownloadService__finishAsset_withError_cancelPendingDownloads___block_invoke_66(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 56);
    uint64_t v7 = *(unsigned __int8 *)(a1 + 64);
    return [v3 ATStoreDownloadService:v4 didFinishAsset:v5 withError:v6 cancelPendingAssetsInBatch:v7];
  }
  return result;
}

- (void)_updateProgressForAsset:(id)a3 progress:(float)a4
{
  id v6 = a3;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__ATStoreDownloadService__updateProgressForAsset_progress___block_invoke;
  v9[3] = &unk_1E6B88A50;
  v9[4] = self;
  id v10 = v6;
  float v11 = a4;
  id v8 = v6;
  [(ICUnfairLock *)lock lockWithBlock:v9];
}

void __59__ATStoreDownloadService__updateProgressForAsset_progress___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(*(void *)(a1 + 32) + 32);
  v3 = [*(id *)(a1 + 40) identifier];
  uint64_t v4 = [v2 objectForKey:v3];

  if (v4 && ([v4 isCancelled] & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "setBytesRemaining:", objc_msgSend(*(id *)(a1 + 40), "totalBytes")- (unint64_t)(*(float *)(a1 + 48) * (double)(unint64_t)objc_msgSend(*(id *)(a1 + 40), "totalBytes")));
    uint64_t v5 = _ATLogCategoryStoreDownloads();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = [*(id *)(a1 + 40) shortDescription];
      id v8 = objc_opt_class();
      double v9 = *(float *)(a1 + 48);
      *(_DWORD *)buf = 138544130;
      uint64_t v28 = v6;
      __int16 v29 = 2114;
      uint64_t v30 = v7;
      __int16 v31 = 2114;
      v32 = v8;
      __int16 v33 = 2048;
      double v34 = v9;
      id v10 = v8;
      _os_log_impl(&dword_1D9A2D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ %{public}@ progress: %.2f", buf, 0x2Au);
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v11 = *(id *)(*(void *)(a1 + 32) + 48);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v23;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * v15);
          uint64_t v17 = *(void *)(a1 + 32);
          id v18 = *(NSObject **)(v17 + 64);
          v19[0] = MEMORY[0x1E4F143A8];
          v19[1] = 3221225472;
          v19[2] = __59__ATStoreDownloadService__updateProgressForAsset_progress___block_invoke_63;
          v19[3] = &unk_1E6B87B00;
          v19[4] = v16;
          v19[5] = v17;
          id v20 = *(id *)(a1 + 40);
          int v21 = *(_DWORD *)(a1 + 48);
          dispatch_async(v18, v19);

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v13);
    }
  }
}

uint64_t __59__ATStoreDownloadService__updateProgressForAsset_progress___block_invoke_63(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    LODWORD(v3) = *(_DWORD *)(a1 + 56);
    return [v4 ATStoreDownloadService:v5 didUpdateProgressForAsset:v6 progress:v3];
  }
  return result;
}

- (void)_updateStateForAsset:(id)a3 oldState:(int64_t)a4 newState:(int64_t)a5
{
  id v8 = a3;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__ATStoreDownloadService__updateStateForAsset_oldState_newState___block_invoke;
  v11[3] = &unk_1E6B87A88;
  v11[4] = self;
  id v12 = v8;
  int64_t v13 = a4;
  int64_t v14 = a5;
  id v10 = v8;
  [(ICUnfairLock *)lock lockWithBlock:v11];
}

void __65__ATStoreDownloadService__updateStateForAsset_oldState_newState___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 48);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v13 + 1) + 8 * v6);
        uint64_t v8 = *(void *)(a1 + 32);
        double v9 = *(NSObject **)(v8 + 64);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __65__ATStoreDownloadService__updateStateForAsset_oldState_newState___block_invoke_2;
        block[3] = &unk_1E6B87A60;
        block[4] = v7;
        block[5] = v8;
        id v11 = *(id *)(a1 + 40);
        long long v12 = *(_OWORD *)(a1 + 48);
        dispatch_async(v9, block);

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
}

uint64_t __65__ATStoreDownloadService__updateStateForAsset_oldState_newState___block_invoke_2(void *a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    uint64_t v6 = a1[7];
    uint64_t v7 = a1[8];
    return [v3 ATStoreDownloadService:v4 didChangeStateForAsset:v5 oldState:v6 newState:v7];
  }
  return result;
}

- (id)_newProcessAssetOperationForasset:(id)a3 assetsOperationResult:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 assetType];
  if (([v7 isEqualToString:@"Podcast"] & 1) != 0
    || ([v7 isEqualToString:@"VideoPodcast"] & 1) != 0)
  {
    uint64_t v8 = &off_1E6B87300;
  }
  else
  {
    id v11 = [v5 dataclass];
    if ([v11 isEqualToString:@"Book"])
    {

      uint64_t v8 = off_1E6B872B0;
    }
    else
    {
      int v12 = [v7 isEqualToString:@"Audiobook"];

      uint64_t v8 = off_1E6B872E0;
      if (v12) {
        uint64_t v8 = off_1E6B872B0;
      }
    }
  }
  double v9 = (void *)[objc_alloc(*v8) initWithAsset:v5 assetsOperationResult:v6];

  return v9;
}

- (id)_newAssetOperationForAsset:(id)a3 prepareOperationResult:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 assetType];
  if (([v7 isEqualToString:@"Podcast"] & 1) != 0
    || ([v7 isEqualToString:@"VideoPodcast"] & 1) != 0)
  {
    uint64_t v8 = off_1E6B872F0;
  }
  else
  {
    id v11 = [v5 dataclass];
    if ([v11 isEqualToString:@"Book"])
    {

      uint64_t v8 = off_1E6B872A0;
    }
    else
    {
      int v12 = [v7 isEqualToString:@"Audiobook"];

      uint64_t v8 = off_1E6B872D0;
      if (v12) {
        uint64_t v8 = off_1E6B872A0;
      }
    }
  }
  double v9 = (void *)[objc_alloc(*v8) initWithAsset:v5 prepareOperationResult:v6];

  return v9;
}

- (id)_newPrepareOperationForAsset:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 assetType];
  if (([v4 isEqualToString:@"Podcast"] & 1) != 0
    || ([v4 isEqualToString:@"VideoPodcast"] & 1) != 0)
  {
    id v5 = off_1E6B872F8;
    goto LABEL_11;
  }
  id v6 = [v3 dataclass];
  if ([v6 isEqualToString:@"Book"])
  {

LABEL_7:
    id v5 = off_1E6B872A8;
    goto LABEL_11;
  }
  char v7 = [v4 isEqualToString:@"Audiobook"];

  if (v7) {
    goto LABEL_7;
  }
  uint64_t v8 = [v3 storeInfo];
  double v9 = [v8 endpointType];
  unint64_t v10 = [v9 integerValue];

  if (([v3 isRestore] & (v10 < 2)) != 0) {
    id v5 = off_1E6B872E8;
  }
  else {
    id v5 = off_1E6B872D8;
  }
LABEL_11:
  id v11 = (void *)[objc_alloc(*v5) initWithAsset:v3];

  return v11;
}

- (void)_prepareDownloadDirectory
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v2 = +[ATStoreDownloadService downloadDirectoryPath];
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v25 = 0;
  [v3 createDirectoryAtPath:v2 withIntermediateDirectories:1 attributes:0 error:&v25];
  id v4 = v25;

  if (v4)
  {
    id v5 = _ATLogCategoryStoreDownloads();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      uint64_t v28 = self;
      __int16 v29 = 2114;
      uint64_t v30 = v2;
      __int16 v31 = 2114;
      id v32 = v4;
      _os_log_impl(&dword_1D9A2D000, v5, OS_LOG_TYPE_ERROR, "%{public}@ Encountered error creating directory %{public}@. error=%{public}@", buf, 0x20u);
    }
  }
  id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v7 = [v6 enumeratorAtPath:v2];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v22;
    *(void *)&long long v10 = 138543874;
    long long v18 = v10;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v8);
        }
        long long v14 = objc_msgSend(v2, "stringByAppendingPathComponent:", *(void *)(*((void *)&v21 + 1) + 8 * v13), v18);
        long long v15 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v20 = 0;
        [v15 removeItemAtPath:v14 error:&v20];
        id v16 = v20;

        if (v16)
        {
          uint64_t v17 = _ATLogCategoryStoreDownloads();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v18;
            uint64_t v28 = self;
            __int16 v29 = 2114;
            uint64_t v30 = v14;
            __int16 v31 = 2114;
            id v32 = v16;
            _os_log_impl(&dword_1D9A2D000, v17, OS_LOG_TYPE_ERROR, "%{public}@ Encountered error removing file in download directory. path=%{public}@ error=%{public}@", buf, 0x20u);
          }
        }
        [v8 skipDescendants];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v8 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v11);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v17 = a3;
  id v10 = a5;
  id v11 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0 && [v17 isEqualToString:@"fractionCompleted"])
  {
    uint64_t v13 = [v10 objectForKey:*MEMORY[0x1E4F284C8]];
    [v13 floatValue];
    int v15 = v14;

    LODWORD(v16) = v15;
    [(ATStoreDownloadService *)self _updateProgressForAsset:a6 progress:v16];
  }
}

- (void)removeDownloadObserver:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__ATStoreDownloadService_removeDownloadObserver___block_invoke;
  v7[3] = &unk_1E6B88B68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(ICUnfairLock *)lock lockWithBlock:v7];
}

uint64_t __49__ATStoreDownloadService_removeDownloadObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) removeObject:*(void *)(a1 + 40)];
}

- (void)addDownloadObserver:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__ATStoreDownloadService_addDownloadObserver___block_invoke;
  v7[3] = &unk_1E6B88B68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(ICUnfairLock *)lock lockWithBlock:v7];
}

uint64_t __46__ATStoreDownloadService_addDownloadObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) addObject:*(void *)(a1 + 40)];
}

- (void)prioritizeAsset:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _ATLogCategoryStoreDownloads();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v11 = self;
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl(&dword_1D9A2D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ prioritizing download %{public}@", buf, 0x16u);
  }

  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__ATStoreDownloadService_prioritizeAsset___block_invoke;
  v8[3] = &unk_1E6B88B68;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(ICUnfairLock *)lock lockWithBlock:v8];
}

void __42__ATStoreDownloadService_prioritizeAsset___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 32);
  id v2 = [*(id *)(a1 + 40) identifier];
  id v4 = [v1 objectForKey:v2];

  id v3 = v4;
  if (v4)
  {
    [v4 setQueuePriority:8];
    id v3 = v4;
  }
}

- (void)cancelAsset:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__ATStoreDownloadService_cancelAsset___block_invoke;
  v7[3] = &unk_1E6B88B68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(ICUnfairLock *)lock lockWithBlock:v7];
}

void __38__ATStoreDownloadService_cancelAsset___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [*(id *)(a1 + 40) identifier];
  id v4 = [v2 objectForKey:v3];

  id v5 = _ATLogCategoryStoreDownloads();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    int v8 = 138543874;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_1D9A2D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ canceling download %{public}@, downloadOperation=%@", (uint8_t *)&v8, 0x20u);
  }

  if (v4) {
    [v4 cancel];
  }
}

- (void)enqueueAsset:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = _ATLogCategoryStoreDownloads();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    v45 = self;
    __int16 v46 = 2114;
    id v47 = v5;
    __int16 v48 = 1024;
    int v49 = [v5 powerRequired];
    __int16 v50 = 1024;
    int v51 = [v5 canUseCellularData];
    _os_log_impl(&dword_1D9A2D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Enqueing download for asset %{public}@. requiresPower=%d, canUseCellularData=%d", buf, 0x22u);
  }

  id v7 = [(ATStoreDownloadService *)self _newPrepareOperationForAsset:v5];
  int v8 = v7;
  if (v7)
  {
    SEL v28 = a2;
    lock = self->_lock;
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __39__ATStoreDownloadService_enqueueAsset___block_invoke;
    v40[3] = &unk_1E6B88BB8;
    v40[4] = self;
    id v27 = v7;
    id v26 = v7;
    id v41 = v26;
    id v29 = v5;
    id v10 = v5;
    id v42 = v10;
    [(ICUnfairLock *)lock lockWithBlock:v40];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v37 = 0u;
    long long v36 = 0u;
    uint64_t v11 = self->_observers;
    uint64_t v12 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v36 objects:v43 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v37 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v36 + 1) + 8 * i);
          callbackQueue = self->_callbackQueue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __39__ATStoreDownloadService_enqueueAsset___block_invoke_2;
          block[3] = &unk_1E6B88BB8;
          block[4] = v16;
          block[5] = self;
          id v35 = v10;
          dispatch_async(callbackQueue, block);
        }
        uint64_t v13 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v36 objects:v43 count:16];
      }
      while (v13);
    }

    long long v18 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:100];
    id v19 = [v26 progress];
    [v18 addChild:v19 withPendingUnitCount:5];

    id v20 = NSStringFromSelector(sel_fractionCompleted);
    [v18 addObserver:self forKeyPath:v20 options:3 context:v10];

    progressForAsset = self->_progressForAsset;
    long long v22 = [v10 identifier];
    [(NSMutableDictionary *)progressForAsset setObject:v18 forKey:v22];

    [(ATStoreDownloadService *)self _updateStateForAsset:v10 oldState:0 newState:1];
    prepareOperationQueue = self->_prepareOperationQueue;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __39__ATStoreDownloadService_enqueueAsset___block_invoke_3;
    v30[3] = &unk_1E6B87A38;
    v30[4] = self;
    id v32 = v18;
    SEL v33 = v28;
    id v31 = v10;
    id v24 = v18;
    [v26 performOnOperationQueue:prepareOperationQueue completion:v30];

    id v5 = v29;
    int v8 = v27;
  }
  else
  {
    id v25 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:21 userInfo:0];
    [(ATStoreDownloadService *)self _finishAsset:v5 withError:v25 cancelPendingDownloads:0];
  }
}

void __39__ATStoreDownloadService_enqueueAsset___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [*(id *)(a1 + 48) identifier];
  [v2 setObject:v1 forKey:v3];
}

uint64_t __39__ATStoreDownloadService_enqueueAsset___block_invoke_2(void *a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    return [v3 ATStoreDownloadService:v4 didEnqueueAsset:v5];
  }
  return result;
}

void __39__ATStoreDownloadService_enqueueAsset___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _ATLogCategoryStoreDownloads();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138544130;
    uint64_t v30 = v8;
    __int16 v31 = 2114;
    uint64_t v32 = v9;
    __int16 v33 = 2114;
    id v34 = v5;
    __int16 v35 = 2114;
    id v36 = v6;
    _os_log_impl(&dword_1D9A2D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ completed prepare operation for %{public}@. err=%{public}@. result=%{public}@", buf, 0x2Au);
  }

  if (v5)
  {
    if ([v6 cancelAllRemaining]) {
      [*(id *)(*(void *)(a1 + 32) + 8) setMaxConcurrentOperationCount:1];
    }
    objc_msgSend(*(id *)(a1 + 32), "_finishAsset:withError:cancelPendingDownloads:", *(void *)(a1 + 40), v5, objc_msgSend(v6, "cancelAllRemaining"));
  }
  else
  {
    [*(id *)(*(void *)(a1 + 32) + 8) setMaxConcurrentOperationCount:3];
    id v10 = [v6 storeMediaResponseItem];
    uint64_t v11 = [*(id *)(a1 + 40) storeInfo];
    [v11 setStoreMediaResponseItem:v10];

    uint64_t v12 = (void *)[*(id *)(a1 + 32) _newAssetOperationForAsset:*(void *)(a1 + 40) prepareOperationResult:v6];
    if (!v12)
    {
      long long v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"ATStoreDownloadService.m", 126, @"Failed to create asset operation for asset %@", *(void *)(a1 + 40) object file lineNumber description];
    }
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = *(void **)(v13 + 72);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __39__ATStoreDownloadService_enqueueAsset___block_invoke_27;
    v26[3] = &unk_1E6B88BB8;
    v26[4] = v13;
    id v27 = v12;
    id v28 = *(id *)(a1 + 40);
    id v15 = v12;
    [v14 lockWithBlock:v26];
    uint64_t v16 = *(void **)(a1 + 48);
    id v17 = [v15 progress];
    [v16 addChild:v17 withPendingUnitCount:90];

    [*(id *)(a1 + 32) _updateStateForAsset:*(void *)(a1 + 40) oldState:1 newState:2];
    uint64_t v18 = *(void *)(a1 + 32);
    uint64_t v19 = *(void *)(v18 + 16);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __39__ATStoreDownloadService_enqueueAsset___block_invoke_2_28;
    v23[3] = &unk_1E6B87A38;
    v23[4] = v18;
    id v24 = *(id *)(a1 + 40);
    long long v22 = *(_OWORD *)(a1 + 48);
    id v20 = (id)v22;
    long long v25 = v22;
    [v15 performOnOperationQueue:v19 completion:v23];
  }
}

void __39__ATStoreDownloadService_enqueueAsset___block_invoke_27(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [*(id *)(a1 + 48) identifier];
  [v2 setObject:v1 forKey:v3];
}

void __39__ATStoreDownloadService_enqueueAsset___block_invoke_2_28(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _ATLogCategoryStoreDownloads();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138544130;
    uint64_t v27 = v8;
    __int16 v28 = 2114;
    uint64_t v29 = v9;
    __int16 v30 = 2114;
    id v31 = v5;
    __int16 v32 = 2114;
    id v33 = v6;
    _os_log_impl(&dword_1D9A2D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ completed assets download operation for %{public}@. err=%{public}@. result=%{public}@", buf, 0x2Au);
  }

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_finishAsset:withError:cancelPendingDownloads:", *(void *)(a1 + 40), v5, objc_msgSend(v6, "cancelAllRemaining"));
  }
  else
  {
    id v10 = (void *)[*(id *)(a1 + 32) _newProcessAssetOperationForasset:*(void *)(a1 + 40) assetsOperationResult:v6];
    if (!v10)
    {
      uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"ATStoreDownloadService.m", 142, @"Failed to create process assets operation for asset %@", *(void *)(a1 + 40) object file lineNumber description];
    }
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(void **)(v11 + 72);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __39__ATStoreDownloadService_enqueueAsset___block_invoke_32;
    v23[3] = &unk_1E6B88BB8;
    v23[4] = v11;
    id v24 = v10;
    id v25 = *(id *)(a1 + 40);
    id v13 = v10;
    [v12 lockWithBlock:v23];
    uint64_t v14 = *(void **)(a1 + 48);
    id v15 = [v13 progress];
    [v14 addChild:v15 withPendingUnitCount:5];

    [*(id *)(a1 + 32) _updateStateForAsset:*(void *)(a1 + 40) oldState:2 newState:3];
    uint64_t v16 = *(void *)(a1 + 32);
    uint64_t v17 = *(void *)(v16 + 24);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __39__ATStoreDownloadService_enqueueAsset___block_invoke_2_33;
    v19[3] = &unk_1E6B87A10;
    v19[4] = v16;
    id v20 = *(id *)(a1 + 40);
    id v21 = *(id *)(a1 + 48);
    id v22 = v6;
    [v13 performOnOperationQueue:v17 completion:v19];
  }
}

void __39__ATStoreDownloadService_enqueueAsset___block_invoke_32(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [*(id *)(a1 + 48) identifier];
  [v2 setObject:v1 forKey:v3];
}

void __39__ATStoreDownloadService_enqueueAsset___block_invoke_2_33(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _ATLogCategoryStoreDownloads();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    int v19 = 138544130;
    uint64_t v20 = v8;
    __int16 v21 = 2114;
    uint64_t v22 = v9;
    __int16 v23 = 2114;
    id v24 = v5;
    __int16 v25 = 2114;
    id v26 = v6;
    _os_log_impl(&dword_1D9A2D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ completed process assets operation for %{public}@. err=%{public}@. result=%{public}@", (uint8_t *)&v19, 0x2Au);
  }

  id v10 = *(void **)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = NSStringFromSelector(sel_fractionCompleted);
  [v10 removeObserver:v11 forKeyPath:v12];

  if (!v5)
  {
    id v13 = *(void **)(a1 + 40);
    uint64_t v14 = [v6 downloadFilePath];
    [v13 setPath:v14];
  }
  id v15 = [v6 assetClientParams];

  if (v15)
  {
    uint64_t v17 = *(void **)(a1 + 40);
    uint64_t v18 = [v6 assetClientParams];
    [v17 setClientParams:v18];
  }
  LODWORD(v16) = 1.0;
  [*(id *)(a1 + 32) _updateProgressForAsset:*(void *)(a1 + 40) progress:v16];
  objc_msgSend(*(id *)(a1 + 32), "_finishAsset:withError:cancelPendingDownloads:", *(void *)(a1 + 40), v5, objc_msgSend(*(id *)(a1 + 56), "cancelAllRemaining"));
}

- (ATStoreDownloadService)init
{
  v19.receiver = self;
  v19.super_class = (Class)ATStoreDownloadService;
  id v2 = [(ATStoreDownloadService *)&v19 init];
  if (v2)
  {
    id v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    prepareOperationQueue = v2->_prepareOperationQueue;
    v2->_prepareOperationQueue = v3;

    [(NSOperationQueue *)v2->_prepareOperationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v2->_prepareOperationQueue setQualityOfService:-1];
    id v5 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    downloadOperationQueue = v2->_downloadOperationQueue;
    v2->_downloadOperationQueue = v5;

    [(NSOperationQueue *)v2->_downloadOperationQueue setMaxConcurrentOperationCount:3];
    [(NSOperationQueue *)v2->_downloadOperationQueue setQualityOfService:-1];
    id v7 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    processAssetsOperationQueue = v2->_processAssetsOperationQueue;
    v2->_processAssetsOperationQueue = v7;

    [(NSOperationQueue *)v2->_processAssetsOperationQueue setMaxConcurrentOperationCount:3];
    [(NSOperationQueue *)v2->_processAssetsOperationQueue setQualityOfService:-1];
    uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
    downloadOperations = v2->_downloadOperations;
    v2->_downloadOperations = (NSMutableDictionary *)v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA80] set];
    observers = v2->_observers;
    v2->_observers = (NSMutableSet *)v11;

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.atc.ATStoreDownloadService.callback", MEMORY[0x1E4F14430]);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v13;

    id v15 = (ICUnfairLock *)objc_alloc_init(MEMORY[0x1E4FB87B0]);
    lock = v2->_lock;
    v2->_lock = v15;

    [(ATStoreDownloadService *)v2 _prepareDownloadDirectory];
    id v17 = (id)[MEMORY[0x1E4FB8598] defaultManager];
  }
  return v2;
}

+ (id)sharedService
{
  if (sharedService_onceToken != -1) {
    dispatch_once(&sharedService_onceToken, &__block_literal_global_843);
  }
  id v2 = (void *)sharedService___sharedInstance;

  return v2;
}

uint64_t __39__ATStoreDownloadService_sharedService__block_invoke()
{
  sharedService___sharedInstance = objc_alloc_init(ATStoreDownloadService);

  return MEMORY[0x1F41817F8]();
}

+ (NSString)downloadDirectoryPath
{
  id v2 = NSTemporaryDirectory();
  id v3 = [v2 stringByAppendingPathComponent:@"AirTraffic"];

  return (NSString *)v3;
}

@end