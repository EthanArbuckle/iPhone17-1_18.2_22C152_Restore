@interface MMCSEngine
+ (id)logStringForGetItemState:(int)a3;
+ (id)logStringForPutItemState:(int)a3;
- (BOOL)_getFileDescriptorAndContentTypeFromItemID:(unint64_t)a3 outFD:(int *)a4 outItemType:(id *)a5 outError:(id *)a6;
- (BOOL)autoGenerateItemID;
- (BOOL)hasOutstandingActivity;
- (BOOL)isActive;
- (BOOL)isDone;
- (BOOL)isMetricsGatheringEnabled;
- (MMCSEngine)initWithWorkPath:(id)a3 appIDHeader:(id)a4 dataClass:(id)a5 options:(id)a6;
- (MMCSEngine)initWithWorkPath:(id)a3 appIDHeader:(id)a4 dataClass:(id)a5 options:(id)a6 modes:(id)a7;
- (MMCSEngineDelegate)delegate;
- (NSThread)workThread;
- (NSTimer)threadKeepAliveTimer;
- (id)_assetWithItemID:(unint64_t)a3;
- (unint64_t)_nextItemID;
- (void)_getItemDoneItemID:(unint64_t)a3 path:(id)a4 requestorContext:(id)a5 error:(id)a6;
- (void)_getItemProgressItemID:(unint64_t)a3 state:(int)a4 progress:(double)a5 requestorContext:(id)a6 error:(id)a7;
- (void)_initItemIDPersistence;
- (void)_putItemDoneItemID:(unint64_t)a3 requestorContext:(id)a4 putReceipt:(id)a5 error:(id)a6;
- (void)_putItemProgressItemID:(unint64_t)a3 state:(int)a4 progress:(double)a5 requestorContext:(id)a6 error:(id)a7;
- (void)_registerAsset:(id)a3;
- (void)_registerRequestorContext:(id)a3;
- (void)_removeAssetForItemID:(unint64_t)a3;
- (void)_removeRequestorContext:(id)a3;
- (void)_requestCompletedRequestorContext:(id)a3;
- (void)cancelAllOperations;
- (void)cancelOperationsWithContext:(id)a3;
- (void)getAssets:(id)a3 requestURL:(id)a4 DSID:(id)a5 options:(id)a6;
- (void)performBlock:(id)a3;
- (void)performBlockOnWorkThread:(id)a3;
- (void)performBlockOnWorkThread:(id)a3 waitUntilDone:(BOOL)a4;
- (void)putAssets:(id)a3 requestURL:(id)a4 DSID:(id)a5 options:(id)a6;
- (void)registerAssetForUpload:(id)a3 completionBlock:(id)a4;
- (void)registerAssets:(id)a3 forDownloadCompletionBlock:(id)a4;
- (void)reregisterAssetForDownload:(id)a3;
- (void)reregisterAssetForUpload:(id)a3;
- (void)setAutoGenerateItemID:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setIsDone:(BOOL)a3;
- (void)setIsMetricsGatheringEnabled:(BOOL)a3;
- (void)setThreadKeepAliveTimer:(id)a3;
- (void)setWorkThread:(id)a3;
- (void)shutDownCompletionBlock:(id)a3;
- (void)threadMain:(id)a3;
- (void)unregisterAsset:(id)a3;
- (void)unregisterAssets:(id)a3;
@end

@implementation MMCSEngine

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadKeepAliveTimer, 0);
  objc_storeStrong((id *)&self->_workThread, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_autoItemIDDictionaryQueue, 0);
  objc_storeStrong((id *)&self->_autoItemIDPersistenceURL, 0);
  objc_storeStrong((id *)&self->_autoItemIDDictionary, 0);
  objc_storeStrong((id *)&self->_reqestorContextQueue, 0);
  objc_storeStrong((id *)&self->_requestorContexts, 0);
  objc_storeStrong((id *)&self->_itemIDToAssetMapQueue, 0);
  objc_storeStrong((id *)&self->_itemIDToAssetMap, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_dataClass, 0);
  objc_storeStrong((id *)&self->_appIDHeader, 0);
  objc_storeStrong((id *)&self->_workPathURL, 0);
}

- (void)setIsDone:(BOOL)a3
{
  self->_isDone = a3;
}

- (BOOL)isDone
{
  return self->_isDone;
}

- (void)setThreadKeepAliveTimer:(id)a3
{
}

- (NSTimer)threadKeepAliveTimer
{
  return self->_threadKeepAliveTimer;
}

- (void)setWorkThread:(id)a3
{
}

- (NSThread)workThread
{
  return self->_workThread;
}

- (BOOL)isMetricsGatheringEnabled
{
  return self->_isMetricsGatheringEnabled;
}

- (void)setAutoGenerateItemID:(BOOL)a3
{
  self->_autoGenerateItemID = a3;
}

- (BOOL)autoGenerateItemID
{
  return self->_autoGenerateItemID;
}

- (void)setDelegate:(id)a3
{
}

- (MMCSEngineDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MMCSEngineDelegate *)WeakRetained;
}

- (unint64_t)_nextItemID
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  autoItemIDDictionaryQueue = self->_autoItemIDDictionaryQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __25__MMCSEngine__nextItemID__block_invoke;
  v5[3] = &unk_1E6C3DA60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(autoItemIDDictionaryQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __25__MMCSEngine__nextItemID__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _initItemIDPersistence];
  v2 = [*(id *)(*(void *)(a1 + 32) + 144) objectForKey:@"nextItemID"];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 unsignedLongLongValue];

  unint64_t v3 = *(void **)(*(void *)(a1 + 32) + 144);
  v4 = [NSNumber numberWithUnsignedLongLong:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) + 1];
  [v3 setObject:v4 forKey:@"nextItemID"];

  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 144);
  uint64_t v7 = *(void *)(v5 + 152);
  return [v6 writeToURL:v7 atomically:1];
}

- (void)_initItemIDPersistence
{
  if (!self->_autoItemIDPersistenceURL)
  {
    unint64_t v3 = [(NSURL *)self->_workPathURL URLByAppendingPathComponent:@"nextItemID.plist"];
    autoItemIDPersistenceURL = self->_autoItemIDPersistenceURL;
    self->_autoItemIDPersistenceURL = v3;

    self->_autoItemIDDictionary = [MEMORY[0x1E4F1CA60] dictionaryWithContentsOfURL:self->_autoItemIDPersistenceURL];
    MEMORY[0x1F41817F8]();
  }
}

- (void)_removeRequestorContext:(id)a3
{
  id v4 = a3;
  reqestorContextQueue = self->_reqestorContextQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__MMCSEngine__removeRequestorContext___block_invoke;
  v7[3] = &unk_1E6C3DB28;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(reqestorContextQueue, v7);
}

uint64_t __38__MMCSEngine__removeRequestorContext___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 128) removeObject:*(void *)(a1 + 40)];
}

- (void)_registerRequestorContext:(id)a3
{
  id v4 = a3;
  reqestorContextQueue = self->_reqestorContextQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__MMCSEngine__registerRequestorContext___block_invoke;
  v7[3] = &unk_1E6C3DB28;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(reqestorContextQueue, v7);
}

uint64_t __40__MMCSEngine__registerRequestorContext___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 128) addObject:*(void *)(a1 + 40)];
}

- (void)_removeAssetForItemID:(unint64_t)a3
{
  itemIDToAssetMapQueue = self->_itemIDToAssetMapQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__MMCSEngine__removeAssetForItemID___block_invoke;
  v4[3] = &unk_1E6C3DAB0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(itemIDToAssetMapQueue, v4);
}

void __36__MMCSEngine__removeAssetForItemID___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 112);
  id v2 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
  [v1 removeObjectForKey:v2];
}

- (id)_assetWithItemID:(unint64_t)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__5529;
  v11 = __Block_byref_object_dispose__5530;
  id v12 = 0;
  itemIDToAssetMapQueue = self->_itemIDToAssetMapQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__MMCSEngine__assetWithItemID___block_invoke;
  block[3] = &unk_1E6C3CC90;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(itemIDToAssetMapQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __31__MMCSEngine__assetWithItemID___block_invoke(void *a1)
{
  id v2 = *(void **)(a1[4] + 112);
  id v6 = [NSNumber numberWithUnsignedLongLong:a1[6]];
  uint64_t v3 = [v2 objectForKey:v6];
  uint64_t v4 = *(void *)(a1[5] + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)_registerAsset:(id)a3
{
  id v4 = a3;
  itemIDToAssetMapQueue = self->_itemIDToAssetMapQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __29__MMCSEngine__registerAsset___block_invoke;
  v7[3] = &unk_1E6C3DB28;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_sync(itemIDToAssetMapQueue, v7);
}

void __29__MMCSEngine__registerAsset___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(a1 + 32), "MMCSItemID"));
  uint64_t v3 = [*(id *)(*(void *)(a1 + 40) + 112) objectForKey:v2];
  id v4 = v3;
  if (v3
    && ([v3 MMCSHash],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        [*(id *)(a1 + 32) MMCSHash],
        id v6 = objc_claimAutoreleasedReturnValue(),
        BOOL v7 = MSObjectsAreEquivalent(v5, v6),
        v6,
        v5,
        !v7))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      int v13 = 138543618;
      uint64_t v14 = v12;
      __int16 v15 = 2114;
      v16 = v4;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Attempting to register two different assets under the same MMCS ID. Rejecting.\nNew asset: %{public}@\nOld asset: %{public}@", (uint8_t *)&v13, 0x16u);
    }
  }
  else
  {
    uint64_t v9 = a1 + 32;
    id v8 = *(void **)(a1 + 32);
    v10 = *(void **)(*(void *)(v9 + 8) + 112);
    v11 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v8, "MMCSItemID"));
    [v10 setObject:v8 forKey:v11];
  }
}

- (void)putAssets:(id)a3 requestURL:(id)a4 DSID:(id)a5 options:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __48__MMCSEngine_putAssets_requestURL_DSID_options___block_invoke;
  v18[3] = &unk_1E6C3D9E8;
  id v19 = v10;
  v20 = self;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v14 = v13;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  [(MMCSEngine *)self performBlockOnWorkThread:v18];
}

void __48__MMCSEngine_putAssets_requestURL_DSID_options___block_invoke(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) count];
  BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v3)
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v40 = v2;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Begin putting %lu assets.", buf, 0xCu);
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v27 = *(void *)(a1 + 32);
      uint64_t v28 = *(void *)(a1 + 48);
      uint64_t v29 = *(void *)(a1 + 56);
      uint64_t v30 = *(void *)(a1 + 64);
      *(_DWORD *)buf = 138544130;
      uint64_t v40 = v27;
      __int16 v41 = 2114;
      uint64_t v42 = v28;
      __int16 v43 = 2112;
      uint64_t v44 = v29;
      __int16 v45 = 2114;
      uint64_t v46 = v30;
      _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Assets: %{public}@\nURL: %{public}@\nDSID: %@\nOptions: %{public}@\n", buf, 0x2Au);
    }
    v32 = +[MMCSRequestorContext contextWithEngine:*(void *)(a1 + 40) type:1];
    id v4 = malloc_type_malloc(8 * v2, 0x100004000313F17uLL);
    uint64_t v5 = malloc_type_malloc(4 * v2, 0x100004052888210uLL);
    id v6 = malloc_type_malloc(8 * v2, 0x10040436913F5uLL);
    BOOL v7 = malloc_type_malloc(8 * v2, 0x10040436913F5uLL);
    for (uint64_t i = 0; i != v2; ++i)
    {
      uint64_t v9 = [*(id *)(a1 + 32) objectAtIndex:i];
      v4[i] = [v9 MMCSItemID];
      v5[i] = [v9 MMCSItemFlags];
      id v10 = [v9 MMCSHash];
      v6[i] = [v10 bytes];

      id v11 = [v9 MMCSAccessHeader];
      id v12 = (const char *)[v11 cStringUsingEncoding:4];

      if (v12)
      {
        size_t v13 = strlen(v12);
        id v14 = (char *)malloc_type_malloc(v13 + 1, 0x17A50F74uLL);
        v7[i] = v14;
        strcpy(v14, v12);
      }
      else
      {
        v7[i] = 0;
      }
    }
    id v15 = v32;
    [v32 setCount:v2];
    [v32 setItemIDs:v4];
    [v32 setItemFlags:v5];
    [v32 setSignatures:v6];
    [v32 setAuthTokens:v7];
    [*(id *)(a1 + 40) _registerRequestorContext:v32];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 176));
    [WeakRetained MMCSEngine:*(void *)(a1 + 40) didCreateRequestorContext:v32 forAssets:*(void *)(a1 + 32)];

    v37 = 0;
    [v32 itemIDs];
    [v32 signatures];
    uint64_t v17 = [v32 authTokens];
    uint64_t v31 = [v32 itemFlags];
    if (!MMCSPutItems())
    {
      v18 = v37;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v40 = (uint64_t)v37;
        _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Put items failed with error: %{public}@", buf, 0xCu);
      }
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v19 = *(id *)(a1 + 32);
      uint64_t v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v38, 16, v17, v31, &v37);
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v34;
        do
        {
          for (uint64_t j = 0; j != v21; ++j)
          {
            if (*(void *)v34 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = *(void *)(*((void *)&v33 + 1) + 8 * j);
            id v25 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 176));
            [v25 MMCSEngine:*(void *)(a1 + 40) didFinishPuttingAsset:v24 putReceipt:0 error:v18];
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v33 objects:v38 count:16];
        }
        while (v21);
      }

      id v26 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 176));
      [v26 didFinishPuttingAllAssets];

      id v15 = v32;
    }
  }
  else
  {
    if (v3)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Put assets called with zero assets.", buf, 2u);
    }
    id v15 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 176));
    [v15 didFinishPuttingAllAssets];
  }
}

- (void)getAssets:(id)a3 requestURL:(id)a4 DSID:(id)a5 options:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __48__MMCSEngine_getAssets_requestURL_DSID_options___block_invoke;
  v18[3] = &unk_1E6C3D9E8;
  id v19 = v10;
  uint64_t v20 = self;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v14 = v13;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  [(MMCSEngine *)self performBlockOnWorkThread:v18];
}

void __48__MMCSEngine_getAssets_requestURL_DSID_options___block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) count])
  {
    uint64_t v2 = [*(id *)(a1 + 32) count];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v35 = v2;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Begin getting %lu assets.", buf, 0xCu);
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v23 = *(void *)(a1 + 32);
      uint64_t v24 = *(void *)(a1 + 48);
      uint64_t v25 = *(void *)(a1 + 56);
      uint64_t v26 = *(void *)(a1 + 64);
      *(_DWORD *)buf = 138544130;
      uint64_t v35 = v23;
      __int16 v36 = 2114;
      uint64_t v37 = v24;
      __int16 v38 = 2112;
      uint64_t v39 = v25;
      __int16 v40 = 2114;
      uint64_t v41 = v26;
      _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Assets: %{public}@\nURL: %{public}@\nDSID: %@\nOptions:%{public}@", buf, 0x2Au);
    }
    BOOL v3 = +[MMCSRequestorContext contextWithEngine:*(void *)(a1 + 40) type:0];
    id v4 = malloc_type_malloc(8 * v2, 0x100004000313F17uLL);
    uint64_t v5 = malloc_type_malloc(8 * v2, 0x10040436913F5uLL);
    id v6 = malloc_type_malloc(8 * v2, 0x10040436913F5uLL);
    if (v2)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        id v8 = [*(id *)(a1 + 32) objectAtIndex:i];
        v4[i] = [v8 MMCSItemID];
        id v9 = [v8 MMCSHash];
        v5[i] = [v9 bytes];

        id v10 = [v8 MMCSAccessHeader];
        id v11 = (const char *)[v10 cStringUsingEncoding:4];

        if (v11)
        {
          size_t v12 = strlen(v11);
          id v13 = (char *)malloc_type_malloc(v12 + 1, 0xA4839243uLL);
          v6[i] = v13;
          strcpy(v13, v11);
        }
        else
        {
          v6[i] = 0;
        }
      }
    }
    [v3 setCount:v2];
    [v3 setItemIDs:v4];
    [v3 setSignatures:v5];
    [v3 setAuthTokens:v6];
    [*(id *)(a1 + 40) _registerRequestorContext:v3];
    v32 = 0;
    [v3 itemIDs];
    [v3 signatures];
    uint64_t v27 = [v3 authTokens];
    if (!MMCSGetItems())
    {
      id v14 = v32;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v35 = (uint64_t)v32;
        _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Get Items failed with error: %{public}@", buf, 0xCu);
      }
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v15 = *(id *)(a1 + 32);
      uint64_t v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v33, 16, v27, &v32);
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v29;
        do
        {
          for (uint64_t j = 0; j != v17; ++j)
          {
            if (*(void *)v29 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void *)(*((void *)&v28 + 1) + 8 * j);
            id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 176));
            [WeakRetained MMCSEngine:*(void *)(a1 + 40) didFinishGettingAsset:v20 path:0 error:v14];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v28 objects:v33 count:16];
        }
        while (v17);
      }

      id v22 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 176));
      [v22 didFinishGettingAllAssets];
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Get assets called with zero assets.", buf, 2u);
    }
    BOOL v3 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 176));
    [v3 didFinishGettingAllAssets];
  }
}

- (void)unregisterAssets:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __31__MMCSEngine_unregisterAssets___block_invoke;
  v6[3] = &unk_1E6C3DB28;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [(MMCSEngine *)self performBlockOnWorkThread:v6];
}

void __31__MMCSEngine_unregisterAssets___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = malloc_type_malloc(8 * [*(id *)(a1 + 32) count], 0x100004000313F17uLL);
  if ([*(id *)(a1 + 32) count])
  {
    unint64_t v3 = 0;
    do
    {
      id v4 = [*(id *)(a1 + 32) objectAtIndex:v3];
      v2[v3] = [v4 MMCSItemID];

      ++v3;
    }
    while (v3 < [*(id *)(a1 + 32) count]);
  }
  if ((unint64_t)[*(id *)(a1 + 32) count] >> 32) {
    __assert_rtn("-[MMCSEngine unregisterAssets:]_block_invoke", "MMCSEngine.m", 563, "count <= UINT32_MAX");
  }
  size_t v12 = v2;
  MMCSUnregisterFiles();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    id v9 = MEMORY[0x1E4F14500];
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v13 + 1) + 8 * v10);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v18 = v11;
          _os_log_debug_impl(&dword_1DC434000, v9, OS_LOG_TYPE_DEBUG, "Unregistered asset: %{public}@", buf, 0xCu);
        }
        objc_msgSend(*(id *)(a1 + 40), "_removeAssetForItemID:", objc_msgSend(v11, "MMCSItemID"));
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v7);
  }

  free(v12);
}

- (void)unregisterAsset:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __30__MMCSEngine_unregisterAsset___block_invoke;
  v6[3] = &unk_1E6C3DB28;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  [(MMCSEngine *)self performBlockOnWorkThread:v6];
}

uint64_t __30__MMCSEngine_unregisterAsset___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Unregistered asset: %{public}@", (uint8_t *)&v4, 0xCu);
  }
  [*(id *)(a1 + 32) MMCSItemID];
  MMCSUnregisterFile();
  return objc_msgSend(*(id *)(a1 + 40), "_removeAssetForItemID:", objc_msgSend(*(id *)(a1 + 32), "MMCSItemID"));
}

- (void)registerAssets:(id)a3 forDownloadCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__MMCSEngine_registerAssets_forDownloadCompletionBlock___block_invoke;
  v10[3] = &unk_1E6C3D198;
  id v11 = v6;
  size_t v12 = self;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  [(MMCSEngine *)self performBlockOnWorkThread:v10];
}

uint64_t __56__MMCSEngine_registerAssets_forDownloadCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v14;
    id v7 = MEMORY[0x1E4F14500];
    *(void *)&long long v4 = 138543362;
    long long v12 = v4;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v2);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * v8);
        uint64_t v10 = *(unsigned char **)(a1 + 40);
        if (v10[168])
        {
          objc_msgSend(v9, "setMMCSItemID:", objc_msgSend(v10, "_nextItemID"));
          uint64_t v10 = *(unsigned char **)(a1 + 40);
        }
        objc_msgSend(v10, "_registerAsset:", v9, v12, (void)v13);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v12;
          uint64_t v18 = v9;
          _os_log_debug_impl(&dword_1DC434000, v7, OS_LOG_TYPE_DEBUG, "Registered asset for download: %{public}@ ", buf, 0xCu);
        }
        ++v8;
      }
      while (v5 != v8);
      uint64_t v5 = [v2 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v5);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)reregisterAssetForDownload:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__MMCSEngine_reregisterAssetForDownload___block_invoke;
  v6[3] = &unk_1E6C3DB28;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(MMCSEngine *)self performBlockOnWorkThread:v6];
}

uint64_t __41__MMCSEngine_reregisterAssetForDownload___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _registerAsset:*(void *)(a1 + 40)];
}

- (void)reregisterAssetForUpload:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__MMCSEngine_reregisterAssetForUpload___block_invoke;
  v6[3] = &unk_1E6C3DB28;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(MMCSEngine *)self performBlockOnWorkThread:v6];
}

uint64_t __39__MMCSEngine_reregisterAssetForUpload___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _registerAsset:*(void *)(a1 + 40)];
}

- (void)registerAssetForUpload:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__MMCSEngine_registerAssetForUpload_completionBlock___block_invoke;
  v10[3] = &unk_1E6C3D198;
  void v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(MMCSEngine *)self performBlockOnWorkThread:v10];
}

void __53__MMCSEngine_registerAssetForUpload_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = *(unsigned char **)(a1 + 32);
  if (v2[168])
  {
    objc_msgSend(*(id *)(a1 + 40), "setMMCSItemID:", objc_msgSend(v2, "_nextItemID"));
    id v2 = *(unsigned char **)(a1 + 32);
  }
  [v2 _registerAsset:*(void *)(a1 + 40)];
  [*(id *)(a1 + 40) MMCSItemID];
  MMCSRegisterFile();
  objc_msgSend(*(id *)(a1 + 32), "_removeAssetForItemID:", objc_msgSend(*(id *)(a1 + 40), "MMCSItemID"));
  uint64_t v3 = [MEMORY[0x1E4F28C58] MMCSErrorWithDomain:@"kMMCSKitErrorDomain" code:2 description:@"ERROR_CANNOT_REGISTER_FILE"];
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v7 = v5;
      __int16 v8 = 2114;
      id v9 = v3;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not register asset: %{public}@\nError: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      uint64_t v7 = v4;
      _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Registered asset for upload: %{public}@", buf, 0xCu);
    }
    uint64_t v3 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (BOOL)isActive
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __22__MMCSEngine_isActive__block_invoke;
  v4[3] = &unk_1E6C3DA60;
  v4[4] = self;
  v4[5] = &v5;
  [(MMCSEngine *)self performBlockOnWorkThread:v4 waitUntilDone:1];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __22__MMCSEngine_isActive__block_invoke(uint64_t a1)
{
  uint64_t result = MMCSEngineIsActive();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

- (void)shutDownCompletionBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__MMCSEngine_shutDownCompletionBlock___block_invoke;
  v6[3] = &unk_1E6C3DB00;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(MMCSEngine *)self performBlockOnWorkThread:v6];
}

uint64_t __38__MMCSEngine_shutDownCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 40))
  {
    MMCSEngineCancelRequests();
    MMCSEngineDestroy();
    *(void *)(*(void *)(a1 + 32) + 40) = 0;
    uint64_t v2 = *(void *)(a1 + 32);
  }
  uint64_t v3 = *(NSObject **)(v2 + 160);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__MMCSEngine_shutDownCompletionBlock___block_invoke_2;
  block[3] = &unk_1E6C3DA38;
  block[4] = v2;
  dispatch_sync(v3, block);
  id v4 = [*(id *)(a1 + 32) threadKeepAliveTimer];
  [v4 invalidate];

  [*(id *)(a1 + 32) setThreadKeepAliveTimer:0];
  [*(id *)(a1 + 32) setIsDone:1];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __38__MMCSEngine_shutDownCompletionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 152);
  *(void *)(v2 + 152) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 144);
  *(void *)(v4 + 144) = 0;
}

- (void)cancelAllOperations
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __33__MMCSEngine_cancelAllOperations__block_invoke;
  v2[3] = &unk_1E6C3DA38;
  v2[4] = self;
  [(MMCSEngine *)self performBlockOnWorkThread:v2 waitUntilDone:1];
}

uint64_t __33__MMCSEngine_cancelAllOperations__block_invoke()
{
  return MMCSEngineCancelRequests();
}

- (void)cancelOperationsWithContext:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__MMCSEngine_cancelOperationsWithContext___block_invoke;
  v6[3] = &unk_1E6C3DB28;
  id v7 = v4;
  char v8 = self;
  id v5 = v4;
  [(MMCSEngine *)self performBlockOnWorkThread:v6 waitUntilDone:1];
}

void __42__MMCSEngine_cancelOperationsWithContext___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    MMCSEngineCancelRequests();
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Cancel operations: Could not find context. Ignoring", v1, 2u);
  }
}

- (void)_requestCompletedRequestorContext:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    LOWORD(v12[0]) = 0;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Request completed.", (uint8_t *)v12, 2u);
  }
  if ([(MMCSEngine *)self isMetricsGatheringEnabled])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      uint64_t RequestMetrics = MMCSEngineGetRequestMetrics();
      char v8 = (void *)MEMORY[0x1E019DFC0](RequestMetrics);
      id v9 = objc_loadWeakRetained((id *)&self->_delegate);
      [v9 MMCSEngine:self logPerformanceMetrics:v8];
    }
  }
  if (![v4 type])
  {
    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    [v10 didFinishGettingAllAssets];
    goto LABEL_10;
  }
  if ([v4 type] == 1)
  {
    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    [v10 didFinishPuttingAllAssets];
LABEL_10:

    goto LABEL_13;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v11 = [v4 type];
    v12[0] = 67109120;
    v12[1] = v11;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unknown requestor context type %d found at request completion. Ignoring.", (uint8_t *)v12, 8u);
  }
LABEL_13:
  [(MMCSEngine *)self _removeRequestorContext:v4];
}

- (void)_putItemDoneItemID:(unint64_t)a3 requestorContext:(id)a4 putReceipt:(id)a5 error:(id)a6
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a6;
  int v11 = [(MMCSEngine *)self _assetWithItemID:a3];
  if (v11)
  {
    if (v10)
    {
      if (([v10 MMCSIsAuthorizationError] & 1) == 0
        && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        int v13 = 138543618;
        unint64_t v14 = (unint64_t)v10;
        __int16 v15 = 2114;
        long long v16 = v11;
        _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Put item failed. Error: %{public}@\nAsset: %{public}@", (uint8_t *)&v13, 0x16u);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      int v13 = 138543362;
      unint64_t v14 = (unint64_t)v11;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Put item completed. Asset: %{public}@", (uint8_t *)&v13, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained MMCSEngine:self didFinishPuttingAsset:v11 putReceipt:v9 error:v10];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v13 = 134217984;
    unint64_t v14 = a3;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Put item done: Could not get asset for item ID %lld.", (uint8_t *)&v13, 0xCu);
  }
}

- (void)_putItemProgressItemID:(unint64_t)a3 state:(int)a4 progress:(double)a5 requestorContext:(id)a6 error:(id)a7
{
  uint64_t v8 = *(void *)&a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  int v11 = -[MMCSEngine _assetWithItemID:](self, "_assetWithItemID:", a3, *(void *)&a4, a6, a7);
  if (v11)
  {
    BOOL v12 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
    if (a5 == -1.0)
    {
      if (v12)
      {
        int v13 = +[MMCSEngine logStringForPutItemState:v8];
        int v19 = 138543618;
        double v20 = *(double *)&v13;
        __int16 v21 = 2048;
        id v22 = v11;
        unint64_t v14 = MEMORY[0x1E4F14500];
        __int16 v15 = "Put item progress state: %{public}@ asset: %p";
        uint32_t v16 = 22;
        goto LABEL_11;
      }
    }
    else if (v12)
    {
      int v13 = +[MMCSEngine logStringForPutItemState:v8];
      int v19 = 134218498;
      double v20 = a5;
      __int16 v21 = 2114;
      id v22 = v13;
      __int16 v23 = 2048;
      uint64_t v24 = v11;
      unint64_t v14 = MEMORY[0x1E4F14500];
      __int16 v15 = "Put item progress: %f state: %{public}@ asset: %p";
      uint32_t v16 = 32;
LABEL_11:
      _os_log_debug_impl(&dword_1DC434000, v14, OS_LOG_TYPE_DEBUG, v15, (uint8_t *)&v19, v16);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    *(float *)&double v18 = a5;
    [WeakRetained MMCSEngine:self didMakePutProgress:v8 state:v11 onAsset:v18];

    goto LABEL_9;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v19 = 134217984;
    double v20 = *(double *)&a3;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Put item progress: Could not get asset for item ID %lld. Ignoring.", (uint8_t *)&v19, 0xCu);
  }
LABEL_9:
}

- (void)_getItemDoneItemID:(unint64_t)a3 path:(id)a4 requestorContext:(id)a5 error:(id)a6
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a6;
  int v11 = [(MMCSEngine *)self _assetWithItemID:a3];
  if (v11)
  {
    if (v10)
    {
      if (([v10 MMCSIsAuthorizationError] & 1) == 0
        && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        int v13 = 138543618;
        unint64_t v14 = (unint64_t)v10;
        __int16 v15 = 2114;
        id v16 = v11;
        _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Get item failed. Error: %{public}@\nAsset: %{public}@", (uint8_t *)&v13, 0x16u);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      int v13 = 138543618;
      unint64_t v14 = (unint64_t)v11;
      __int16 v15 = 2112;
      id v16 = v9;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Get item completed. Asset: %{public}@. Path: %@", (uint8_t *)&v13, 0x16u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained MMCSEngine:self didFinishGettingAsset:v11 path:v9 error:v10];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v13 = 134217984;
    unint64_t v14 = a3;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Get item done: Could not get asset for item ID %lld.", (uint8_t *)&v13, 0xCu);
  }
}

- (void)_getItemProgressItemID:(unint64_t)a3 state:(int)a4 progress:(double)a5 requestorContext:(id)a6 error:(id)a7
{
  uint64_t v8 = *(void *)&a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  int v11 = -[MMCSEngine _assetWithItemID:](self, "_assetWithItemID:", a3, *(void *)&a4, a6, a7);
  if (v11)
  {
    BOOL v12 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
    if (a5 == -1.0)
    {
      if (v12)
      {
        int v13 = +[MMCSEngine logStringForGetItemState:v8];
        int v19 = 138543618;
        double v20 = *(double *)&v13;
        __int16 v21 = 2048;
        id v22 = v11;
        unint64_t v14 = MEMORY[0x1E4F14500];
        __int16 v15 = "Get item progress state: %{public}@ asset: %p";
        uint32_t v16 = 22;
        goto LABEL_11;
      }
    }
    else if (v12)
    {
      int v13 = +[MMCSEngine logStringForGetItemState:v8];
      int v19 = 134218498;
      double v20 = a5;
      __int16 v21 = 2114;
      id v22 = v13;
      __int16 v23 = 2048;
      uint64_t v24 = v11;
      unint64_t v14 = MEMORY[0x1E4F14500];
      __int16 v15 = "Get item progress: %f state: %{public}@ asset: %p";
      uint32_t v16 = 32;
LABEL_11:
      _os_log_debug_impl(&dword_1DC434000, v14, OS_LOG_TYPE_DEBUG, v15, (uint8_t *)&v19, v16);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    *(float *)&double v18 = a5;
    [WeakRetained MMCSEngine:self didMakeGetProgress:v8 state:v11 onAsset:v18];

    goto LABEL_9;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v19 = 134217984;
    double v20 = *(double *)&a3;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Get item progress: Could not get asset for item ID %lld. Ignoring.", (uint8_t *)&v19, 0xCu);
  }
LABEL_9:
}

- (BOOL)_getFileDescriptorAndContentTypeFromItemID:(unint64_t)a3 outFD:(int *)a4 outItemType:(id *)a5 outError:(id *)a6
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)int v19 = a3;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Getting file descriptor for itemID %lld", buf, 0xCu);
  }
  int v11 = [(MMCSEngine *)self _assetWithItemID:a3];
  BOOL v12 = v11;
  if (v11)
  {
    int v13 = [v11 MMCSOpenNewFileDescriptor];
    if (v13 != -1)
    {
      int v14 = v13;
      id v15 = [v12 MMCSItemType];
      goto LABEL_13;
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "MMCSErrorWithDomain:code:description:", @"kMMCSKitErrorDomain", 1, @"ERROR_CANNOT_GET_FD_P_ASSET", v12);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "MMCSErrorWithDomain:code:description:", @"kMMCSKitErrorDomain", 0, @"ERROR_CANNOT_FIND_ASSET_P_ITEMID", a3);
  }
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      *(void *)int v19 = a3;
      *(_WORD *)&v19[8] = 2114;
      *(void *)&v19[10] = v16;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not get file descriptor for itemID %lld. Error: %{public}@", buf, 0x16u);
      if (a6) {
        goto LABEL_11;
      }
    }
    else if (a6)
    {
LABEL_11:
      id v16 = v16;
      id v15 = 0;
      *a6 = v16;
      goto LABEL_23;
    }
    id v15 = 0;
LABEL_23:
    int v14 = -1;
    if (!a4) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  id v15 = 0;
  int v14 = -1;
LABEL_13:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)int v19 = v14;
    *(_WORD *)&v19[4] = 2048;
    *(void *)&v19[6] = a3;
    *(_WORD *)&v19[14] = 2114;
    *(void *)&v19[16] = v15;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Got file descriptor %d for itemID %lld. UTI: %{public}@", buf, 0x1Cu);
  }
  id v16 = 0;
  if (a5 && v15)
  {
    id v15 = v15;
    id v16 = 0;
    *a5 = v15;
  }
  if (a4) {
LABEL_19:
  }
    *a4 = v14;
LABEL_20:

  return v14 != -1;
}

- (void)setIsMetricsGatheringEnabled:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __43__MMCSEngine_setIsMetricsGatheringEnabled___block_invoke;
  v3[3] = &unk_1E6C3CC68;
  BOOL v4 = a3;
  v3[4] = self;
  [(MMCSEngine *)self performBlockOnWorkThread:v3];
}

void __43__MMCSEngine_setIsMetricsGatheringEnabled___block_invoke(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 40) != *(unsigned __int8 *)(*(void *)(a1 + 32) + 169))
  {
    MMCSEngineSetMetricsEnabled();
    *(unsigned char *)(*(void *)(a1 + 32) + 169) = *(unsigned char *)(a1 + 40);
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 176));
    char v3 = objc_opt_respondsToSelector();

    if (v3)
    {
      id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 176));
      id v6 = v4;
      if (*(unsigned char *)(a1 + 40)) {
        id v5 = @"Performance logging enabled.";
      }
      else {
        id v5 = @"Performance logging disabled.";
      }
      [v4 MMCSEngine:*(void *)(a1 + 32) logPerformanceMetrics:v5];
    }
  }
}

- (void)threadMain:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E019E3B0]();
  id v6 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
  [v6 getCFRunLoop];
  [v4 objectForKey:@"modes"];
  [v4 objectForKey:@"workPathURL"];
  [v4 objectForKey:@"appIDHeader"];
  [v4 objectForKey:@"dataClass"];
  [v4 objectForKey:@"options"];
  self->_engine = (_mmcs_engine *)MMCSEngineCreate();

  if (self->_engine)
  {
    id v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    itemIDToAssetMap = self->_itemIDToAssetMap;
    self->_itemIDToAssetMap = v7;

    id v9 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.MMCSKit.itemIDToAssetMapQueue", 0);
    itemIDToAssetMapQueue = self->_itemIDToAssetMapQueue;
    self->_itemIDToAssetMapQueue = v9;

    int v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    requestorContexts = self->_requestorContexts;
    self->_requestorContexts = v11;

    int v13 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.MMCSKit.requestorContextQueue", 0);
    reqestorContextQueue = self->_reqestorContextQueue;
    self->_reqestorContextQueue = v13;

    id v15 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.MMCSKit.autoItemIDDictionaryQueue", 0);
    autoItemIDDictionaryQueue = self->_autoItemIDDictionaryQueue;
    self->_autoItemIDDictionaryQueue = v15;

    uint64_t v17 = [MEMORY[0x1E4F1CB00] timerWithTimeInterval:self target:sel__doNothingTimerHandler_ selector:0 userInfo:1 repeats:10000000.0];
    threadKeepAliveTimer = self->_threadKeepAliveTimer;
    self->_threadKeepAliveTimer = v17;

    int v19 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    [v19 addTimer:self->_threadKeepAliveTimer forMode:*MEMORY[0x1E4F1C4B0]];

    if (![(MMCSEngine *)self isDone])
    {
      uint64_t v20 = *MEMORY[0x1E4F1C3A0];
      do
      {
        __int16 v21 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
        id v22 = [MEMORY[0x1E4F1C9C8] distantFuture];
        char v23 = [v21 runMode:v20 beforeDate:v22];

        if ((v23 & 1) == 0) {
          [(MMCSEngine *)self setIsDone:1];
        }
      }
      while (![(MMCSEngine *)self isDone]);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v24 = 0;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not create MMCS Engine!", v24, 2u);
  }
}

- (void)performBlockOnWorkThread:(id)a3
{
}

- (void)performBlockOnWorkThread:(id)a3 waitUntilDone:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (void *)MEMORY[0x1E4F29060];
  int v11 = (void (**)(void))a3;
  id v7 = [v6 currentThread];
  int v8 = [v7 isEqual:self->_workThread];

  if (v8)
  {
    v11[2]();
  }
  else
  {
    workThread = self->_workThread;
    uint64_t v10 = [v11 copy];

    [(MMCSEngine *)self performSelector:sel_performBlock_ onThread:workThread withObject:v10 waitUntilDone:v4];
    int v11 = (void (**)(void))v10;
  }
}

- (void)performBlock:(id)a3
{
}

- (MMCSEngine)initWithWorkPath:(id)a3 appIDHeader:(id)a4 dataClass:(id)a5 options:(id)a6
{
  uint64_t v10 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v11 = *MEMORY[0x1E4F1C3A0];
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [v10 arrayWithObject:v11];
  uint64_t v17 = [(MMCSEngine *)self initWithWorkPath:v15 appIDHeader:v14 dataClass:v13 options:v12 modes:v16];

  return v17;
}

- (MMCSEngine)initWithWorkPath:(id)a3 appIDHeader:(id)a4 dataClass:(id)a5 options:(id)a6 modes:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v25.receiver = self;
  v25.super_class = (Class)MMCSEngine;
  double v18 = [(MMCSEngine *)&v25 init];
  int v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_workPathURL, a3);
    v19->_engineClientContext.version = 2;
    v19->_engineClientContext.context = v19;
    v19->_engineClientContext.getFileDescriptorAndContentTypeFromItemCallback = _getFileDescriptorAndContentTypeFromItemCallback;
    v19->_engineClientContext.getItemProgressCallback = _getItemProgressCallback_5611;
    v19->_engineClientContext.getItemDoneCallback = _getItemDoneCallback_5610;
    v19->_engineClientContext.putItemProgressCallback = _putItemProgressCallback_5609;
    v19->_engineClientContext.putItemDoneCallback = _putItemDoneCallback_5608;
    v19->_engineClientContext.requestCompletedCallback = _requestCompletedCallback_5607;
    uint64_t v20 = [MEMORY[0x1E4F1CA60] dictionary];
    __int16 v21 = v20;
    if (v13) {
      [v20 setObject:v13 forKey:@"workPathURL"];
    }
    if (v14) {
      [v21 setObject:v14 forKey:@"appIDHeader"];
    }
    if (v15) {
      [v21 setObject:v15 forKey:@"dataClass"];
    }
    if (v16) {
      [v21 setObject:v16 forKey:@"options"];
    }
    if (v17) {
      [v21 setObject:v17 forKey:@"modes"];
    }
    uint64_t v22 = [objc_alloc(MEMORY[0x1E4F29060]) initWithTarget:v19 selector:sel_threadMain_ object:v21];
    workThread = v19->_workThread;
    v19->_workThread = (NSThread *)v22;

    [(NSThread *)v19->_workThread start];
  }

  return v19;
}

- (BOOL)hasOutstandingActivity
{
  return 0;
}

+ (id)logStringForPutItemState:(int)a3
{
  if (a3 > 7) {
    return @"Unknown";
  }
  else {
    return off_1E6C3CCE0[a3];
  }
}

+ (id)logStringForGetItemState:(int)a3
{
  if (a3 > 5) {
    return @"Unknown";
  }
  else {
    return off_1E6C3CCB0[a3];
  }
}

@end