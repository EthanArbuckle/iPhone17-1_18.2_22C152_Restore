@interface ATLegacyAssetLink
- (ATAssetLinkDelegate)delegate;
- (ATLegacyAssetLink)initWithMessageLink:(id)a3 hostVersion:(id)a4;
- (ATLegacyAssetLinkProgressDelegate)progressDelegate;
- (BOOL)canEnqueueAsset:(id)a3;
- (BOOL)isOpen;
- (BOOL)linkIsReady;
- (BOOL)open;
- (NSArray)readyDataClasses;
- (NSArray)supportedDataClasses;
- (id)_assetManifestForDataclasses:(id)a3;
- (id)_assetsForDataClass:(id)a3 identifier:(id)a4;
- (id)_manifestEntryForATAsset:(id)a3;
- (id)enqueueAssets:(id)a3 force:(BOOL)a4;
- (unint64_t)maximumBatchSize;
- (unint64_t)priority;
- (void)_enqueueAndRequestAssets;
- (void)_finishAsset:(id)a3 withError:(id)a4;
- (void)_handleFileCompleteMessage:(id)a3;
- (void)_handleFileErrorMessage:(id)a3;
- (void)_handleFileProgressMessage:(id)a3;
- (void)cancelAssets:(id)a3;
- (void)close;
- (void)prioritizeAsset:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setProgressDelegate:(id)a3;
- (void)setReadyDataClasses:(id)a3;
- (void)setSupportedDataClasses:(id)a3;
@end

@implementation ATLegacyAssetLink

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_progressDelegate);
  objc_storeStrong((id *)&self->_supportedDataClasses, 0);
  objc_storeStrong((id *)&self->_hostVersion, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_readyDataClasses, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_syncIDToItemPidMap, 0);
  objc_storeStrong((id *)&self->_messageLink, 0);
  objc_storeStrong((id *)&self->_enqueuedAssetsByDataClass, 0);

  objc_storeStrong((id *)&self->_unqueuedAssets, 0);
}

- (void)setProgressDelegate:(id)a3
{
}

- (ATLegacyAssetLinkProgressDelegate)progressDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_progressDelegate);

  return (ATLegacyAssetLinkProgressDelegate *)WeakRetained;
}

- (void)setSupportedDataClasses:(id)a3
{
}

- (NSArray)supportedDataClasses
{
  return self->_supportedDataClasses;
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

- (id)_manifestEntryForATAsset:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  v6 = [v4 storeInfo];
  v7 = [v6 syncID];
  uint64_t v8 = [v7 longLongValue];

  if (v8)
  {
    v9 = [v4 storeInfo];
    v10 = [v9 syncID];
    [v5 setObject:v10 forKey:@"AssetID"];
  }
  else
  {
    v9 = [v4 identifier];
    [v5 setObject:v9 forKey:@"AssetID"];
  }

  v11 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "isDownload"));
  [v5 setObject:v11 forKey:@"IsDownload"];

  v12 = [v4 variantOptions];

  if (v12)
  {
    id v13 = objc_alloc(MEMORY[0x1E4F1CA60]);
    v14 = [v4 variantOptions];
    v15 = (void *)[v13 initWithDictionary:v14];

    if ([(NSString *)self->_hostVersion compare:@"12.6.0.43" options:64] == NSOrderedAscending)
    {
      [v4 setLyricsEmbeddedInAsset:1];
      uint64_t v16 = [v4 assetParts];
      [v15 removeObjectForKey:@"AssetParts"];
      v17 = [NSNumber numberWithUnsignedInteger:v16 & 6 | 1];
      [v15 setObject:v17 forKey:@"AssetParts"];

      v18 = _ATLogCategoryiTunesSync();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v26 = 134218498;
        uint64_t v27 = v16;
        __int16 v28 = 2048;
        uint64_t v29 = v16 & 6 | 1;
        __int16 v30 = 2114;
        id v31 = v4;
        _os_log_impl(&dword_1D9A2D000, v18, OS_LOG_TYPE_DEFAULT, "updating parts from %lu to %lu for asset %{public}@", (uint8_t *)&v26, 0x20u);
      }
    }
    v19 = [v4 dataclass];
    int v20 = [v19 isEqualToString:@"Application"];

    if (v20) {
      [v15 removeObjectForKey:@"AssetParts"];
    }
    [v5 setObject:v15 forKey:@"Variant"];
  }
  v21 = [v4 path];

  if (v21)
  {
    v22 = [v4 path];
    [v5 setObject:v22 forKey:@"AssetPath"];
  }
  v23 = [v4 assetType];

  if (v23)
  {
    v24 = [v4 assetType];
    [v5 setObject:v24 forKey:@"AssetType"];
  }

  return v5;
}

- (void)_enqueueAndRequestAssets
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = [(NSMutableDictionary *)self->_enqueuedAssetsByDataClass allKeys];
  v5 = [v3 setWithArray:v4];

  id v37 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v36 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v6 = self;
  v7 = self->_unqueuedAssets;
  uint64_t v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v40;
    v35 = v5;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v40 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        id v13 = objc_msgSend(v12, "dataclass", v35);
        if (([v5 containsObject:v13] & 1) == 0)
        {
          readyDataClasses = v6->_readyDataClasses;
          v15 = [v12 dataclass];
          LODWORD(readyDataClasses) = [(NSMutableArray *)readyDataClasses containsObject:v15];

          if (!readyDataClasses) {
            continue;
          }
          uint64_t v16 = v7;
          enqueuedAssetsByDataClass = v6->_enqueuedAssetsByDataClass;
          v18 = [v12 dataclass];
          id v13 = [(NSMutableDictionary *)enqueuedAssetsByDataClass objectForKey:v18];

          if (!v13)
          {
            id v13 = objc_opt_new();
            v19 = v6->_enqueuedAssetsByDataClass;
            int v20 = [v12 dataclass];
            [(NSMutableDictionary *)v19 setObject:v13 forKey:v20];
          }
          [v12 setAssetState:1];
          [v13 addObject:v12];
          [v37 addObject:v12];
          v21 = [v12 dataclass];
          [v36 addObject:v21];

          v22 = [v12 storeInfo];
          v23 = [v22 syncID];
          uint64_t v24 = [v23 longLongValue];

          if (v24)
          {
            syncIDToItemPidMap = v6->_syncIDToItemPidMap;
            int v26 = [v12 identifier];
            uint64_t v27 = [v12 storeInfo];
            __int16 v28 = [v27 syncID];
            [(NSMutableDictionary *)syncIDToItemPidMap setObject:v26 forKey:v28];
          }
          v7 = v16;
          v5 = v35;
        }
      }
      uint64_t v9 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v39 objects:v45 count:16];
    }
    while (v9);
  }

  [(NSMutableSet *)v6->_unqueuedAssets minusSet:v37];
  uint64_t v29 = [v36 allObjects];
  __int16 v30 = [(ATLegacyAssetLink *)v6 _assetManifestForDataclasses:v29];

  if (v30 && [v30 count])
  {
    messageLink = v6->_messageLink;
    uint64_t v32 = (void *)MEMORY[0x1E4F4A2C0];
    v43 = @"AssetManifest";
    v44 = v30;
    v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
    v34 = [v32 messageWithName:@"AssetManifest" parameters:v33];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __45__ATLegacyAssetLink__enqueueAndRequestAssets__block_invoke;
    v38[3] = &unk_1E6B88AF0;
    v38[4] = v6;
    [(ATLegacyMessageLink *)messageLink sendMessage:v34 withCompletion:v38];
  }
}

uint64_t __45__ATLegacyAssetLink__enqueueAndRequestAssets__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) close];
  }
  return result;
}

- (id)_assetManifestForDataclasses:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v23 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = [(NSMutableDictionary *)self->_enqueuedAssetsByDataClass allKeys];
  uint64_t v5 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v31;
    uint64_t v22 = *(void *)v31;
    do
    {
      uint64_t v8 = 0;
      uint64_t v24 = v6;
      do
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v30 + 1) + 8 * v8);
        if (objc_msgSend(v4, "containsObject:", v9, v22))
        {
          id v10 = v4;
          v11 = (void *)MEMORY[0x1E4F1CA48];
          v12 = [(NSMutableDictionary *)self->_enqueuedAssetsByDataClass objectForKey:v9];
          id v13 = objc_msgSend(v11, "arrayWithCapacity:", objc_msgSend(v12, "count"));

          long long v28 = 0u;
          long long v29 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          v14 = [(NSMutableDictionary *)self->_enqueuedAssetsByDataClass objectForKey:v9];
          uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v27;
            do
            {
              for (uint64_t i = 0; i != v16; ++i)
              {
                if (*(void *)v27 != v17) {
                  objc_enumerationMutation(v14);
                }
                v19 = *(void **)(*((void *)&v26 + 1) + 8 * i);
                if (([v19 readyForStore] & 1) == 0)
                {
                  int v20 = [(ATLegacyAssetLink *)self _manifestEntryForATAsset:v19];
                  [v13 addObject:v20];
                }
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
            }
            while (v16);
          }

          [v23 setObject:v13 forKey:v9];
          id v4 = v10;
          uint64_t v7 = v22;
          uint64_t v6 = v24;
        }
        ++v8;
      }
      while (v8 != v6);
      uint64_t v6 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v6);
  }

  return v23;
}

- (id)_assetsForDataClass:(id)a3 identifier:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [(NSMutableDictionary *)self->_enqueuedAssetsByDataClass objectForKey:a3];
  uint64_t v8 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v15 = objc_msgSend(v14, "identifier", (void)v20);
        int v16 = [v15 isEqualToString:v6];

        if (v16) {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }

  if ([v8 count]) {
    uint64_t v17 = v8;
  }
  else {
    uint64_t v17 = 0;
  }
  id v18 = v17;

  return v18;
}

- (void)_finishAsset:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  enqueuedAssetsByDataClass = self->_enqueuedAssetsByDataClass;
  id v9 = [v6 dataclass];
  uint64_t v10 = [(NSMutableDictionary *)enqueuedAssetsByDataClass objectForKey:v9];

  [v10 removeObject:v6];
  if (![v10 count])
  {
    uint64_t v11 = self->_enqueuedAssetsByDataClass;
    uint64_t v12 = [v6 dataclass];
    [(NSMutableDictionary *)v11 removeObjectForKey:v12];
  }
  id v13 = [v6 storeInfo];
  v14 = [v13 syncID];

  if (v14)
  {
    syncIDToItemPidMap = self->_syncIDToItemPidMap;
    int v16 = [v6 storeInfo];
    uint64_t v17 = [v16 syncID];
    [(NSMutableDictionary *)syncIDToItemPidMap removeObjectForKey:v17];
  }
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__ATLegacyAssetLink__finishAsset_withError___block_invoke;
  block[3] = &unk_1E6B88BB8;
  block[4] = self;
  id v22 = v6;
  id v23 = v7;
  id v19 = v7;
  id v20 = v6;
  dispatch_async(callbackQueue, block);
}

void __44__ATLegacyAssetLink__finishAsset_withError___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(void **)(a1 + 48);
  BOOL v5 = [v4 code] != 3 && objc_msgSend(*(id *)(a1 + 48), "code") != 16;
  [v6 assetLink:v2 didFinishAsset:v3 error:v4 retryable:v5];
}

- (void)_handleFileProgressMessage:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__ATLegacyAssetLink__handleFileProgressMessage___block_invoke;
  v7[3] = &unk_1E6B88B68;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __48__ATLegacyAssetLink__handleFileProgressMessage___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) parameterForKey:@"Dataclass"];
  uint64_t v3 = [*(id *)(a1 + 32) parameterForKey:@"AssetProgress"];
  [v3 doubleValue];
  double v5 = v4;

  id v6 = [*(id *)(a1 + 32) parameterForKey:@"AssetID"];
  uint64_t v7 = [*(id *)(*(void *)(a1 + 40) + 32) objectForKey:v6];
  id v8 = (void *)v7;
  if (v7) {
    id v9 = (void *)v7;
  }
  else {
    id v9 = v6;
  }
  id v10 = v9;

  long long v26 = v10;
  uint64_t v11 = [*(id *)(a1 + 40) _assetsForDataClass:v2 identifier:v10];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v12)
  {
    uint64_t v14 = v12;
    uint64_t v15 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v31 != v15) {
          objc_enumerationMutation(v11);
        }
        id v18 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        float v16 = v5;
        *(float *)&double v13 = v16;
        [v18 setDownloadProgress:v13];
        uint64_t v19 = *(void *)(a1 + 40);
        id v20 = *(NSObject **)(v19 + 64);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __48__ATLegacyAssetLink__handleFileProgressMessage___block_invoke_2;
        block[3] = &unk_1E6B88728;
        block[4] = v19;
        void block[5] = v18;
        *(double *)&block[6] = v5;
        dispatch_async(v20, block);
      }
      uint64_t v14 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v14);
  }
  long long v21 = [*(id *)(a1 + 32) parameterForKey:@"OverallProgress"];
  if (v21)
  {
    id v22 = [*(id *)(a1 + 40) progressDelegate];
    char v23 = objc_opt_respondsToSelector();

    if (v23)
    {
      uint64_t v24 = *(void *)(a1 + 40);
      uint64_t v25 = *(NSObject **)(v24 + 64);
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __48__ATLegacyAssetLink__handleFileProgressMessage___block_invoke_3;
      v27[3] = &unk_1E6B88B68;
      v27[4] = v24;
      id v28 = v21;
      dispatch_async(v25, v27);
    }
  }
}

void __48__ATLegacyAssetLink__handleFileProgressMessage___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 assetLink:*(void *)(a1 + 32) didUpdateAsset:*(void *)(a1 + 40) progress:*(double *)(a1 + 48)];
}

void __48__ATLegacyAssetLink__handleFileProgressMessage___block_invoke_3(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) progressDelegate];
  uint64_t v2 = *(void *)(a1 + 32);
  [*(id *)(a1 + 40) doubleValue];
  objc_msgSend(v3, "assetLink:didUpdateOverallProgress:", v2);
}

- (void)_handleFileErrorMessage:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__ATLegacyAssetLink__handleFileErrorMessage___block_invoke;
  v7[3] = &unk_1E6B88B68;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __45__ATLegacyAssetLink__handleFileErrorMessage___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) parameterForKey:@"Dataclass"];
  id v3 = [*(id *)(a1 + 32) parameterForKey:@"ErrorIsVisible"];
  id v4 = [*(id *)(a1 + 32) parameterForKey:@"ErrorCode"];
  double v5 = [*(id *)(a1 + 32) parameterForKey:@"AssetID"];
  uint64_t v6 = [*(id *)(*(void *)(a1 + 40) + 32) objectForKey:v5];
  uint64_t v7 = (void *)v6;
  if (v6) {
    id v8 = (void *)v6;
  }
  else {
    id v8 = v5;
  }
  id v9 = v8;

  id v10 = objc_opt_new();
  uint64_t v11 = v10;
  if (v3) {
    [v10 setObject:v3 forKeyedSubscript:@"ATLegacyAssetLinkErrorIsVisibleKey"];
  }
  uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"ATError", (int)objc_msgSend(v4, "intValue", v4), v11);
  uint64_t v19 = (void *)v2;
  double v13 = [*(id *)(a1 + 40) _assetsForDataClass:v2 identifier:v9];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        [*(id *)(a1 + 40) _finishAsset:*(void *)(*((void *)&v20 + 1) + 8 * i) withError:v12];
        [*(id *)(a1 + 40) _enqueueAndRequestAssets];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v15);
  }
}

- (void)_handleFileCompleteMessage:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__ATLegacyAssetLink__handleFileCompleteMessage___block_invoke;
  v7[3] = &unk_1E6B88B68;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __48__ATLegacyAssetLink__handleFileCompleteMessage___block_invoke(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) parameterForKey:@"Dataclass"];
  id v3 = [*(id *)(a1 + 32) parameterForKey:@"AssetID"];
  long long v32 = [*(id *)(a1 + 32) parameterForKey:@"AssetPath"];
  uint64_t v4 = [*(id *)(*(void *)(a1 + 40) + 32) objectForKey:v3];
  double v5 = (void *)v4;
  if (v4) {
    id v6 = (void *)v4;
  }
  else {
    id v6 = v3;
  }
  id v7 = v6;

  v34 = (void *)v2;
  id v8 = [*(id *)(a1 + 40) _assetsForDataClass:v2 identifier:v7];
  uint64_t v9 = [v8 count];
  log = _ATLogCategoryiTunesSync();
  BOOL v10 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v10)
    {
      uint64_t v11 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      id v41 = v11;
      __int16 v42 = 1024;
      int v43 = [v8 count];
      __int16 v44 = 2114;
      v45 = v8;
      _os_log_impl(&dword_1D9A2D000, log, OS_LOG_TYPE_DEFAULT, "%{public}@ Matched %d assets: %{public}@", buf, 0x1Cu);
    }

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    log = v8;
    uint64_t v12 = [log countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      long long v29 = v8;
      id v30 = v7;
      long long v31 = v3;
      uint64_t v14 = *(void *)v36;
      while (1)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v36 != v14) {
            objc_enumerationMutation(log);
          }
          uint64_t v16 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          if (objc_msgSend(v16, "isDownload", v29, v30, v31)) {
            [v16 setPath:v32];
          }
          [v16 setBypassStore:1];
          uint64_t v17 = [v16 dataclass];
          int v18 = [v17 isEqualToString:@"Application"];

          if (v18) {
            [v16 setCompletedAssetParts:1];
          }
          uint64_t v19 = [v16 dataclass];
          if ([v19 isEqualToString:@"Application"]) {
            goto LABEL_19;
          }
          long long v20 = [v16 dataclass];
          char v21 = [v20 isEqualToString:@"Media"];

          if ((v21 & 1) == 0)
          {
            uint64_t v19 = [MEMORY[0x1E4F4A2A8] sharedInstance];
            [v19 processCompletedAsset:v16];
LABEL_19:
          }
          [*(id *)(a1 + 40) _finishAsset:v16 withError:0];
          long long v22 = +[ATClientController sharedInstance];
          long long v23 = [v22 clientForDataclass:v34];

          uint64_t v24 = [*(id *)(a1 + 32) parameterForKey:@"Metadata"];
          if (v24)
          {
            uint64_t v25 = (void *)v24;
            char v26 = objc_opt_respondsToSelector();

            if (v26)
            {
              long long v27 = [*(id *)(a1 + 32) parameterForKey:@"Metadata"];
              id v28 = [*(id *)(a1 + 32) parameterForKey:@"Anchor"];
              [v23 metadataUpdate:v27 forAsset:v16 withNewAnchor:v28];
            }
          }
          [*(id *)(a1 + 40) _enqueueAndRequestAssets];
        }
        uint64_t v13 = [log countByEnumeratingWithState:&v35 objects:v39 count:16];
        if (!v13)
        {
          id v7 = v30;
          id v3 = v31;
          id v8 = v29;
          break;
        }
      }
    }
  }
  else if (v10)
  {
    *(_DWORD *)buf = 138543362;
    id v41 = v7;
    _os_log_impl(&dword_1D9A2D000, log, OS_LOG_TYPE_DEFAULT, "ignoring transfer completion for unknown asset %{public}@", buf, 0xCu);
  }
}

- (NSArray)readyDataClasses
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__2209;
  BOOL v10 = __Block_byref_object_dispose__2210;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__ATLegacyAssetLink_readyDataClasses__block_invoke;
  v5[3] = &unk_1E6B88210;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

uint64_t __37__ATLegacyAssetLink_readyDataClasses__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 56) copy];

  return MEMORY[0x1F41817F8]();
}

- (void)setReadyDataClasses:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__ATLegacyAssetLink_setReadyDataClasses___block_invoke;
  v7[3] = &unk_1E6B88B68;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __41__ATLegacyAssetLink_setReadyDataClasses___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) mutableCopy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 56);
  *(void *)(v3 + 56) = v2;

  double v5 = *(void **)(a1 + 32);

  return [v5 _enqueueAndRequestAssets];
}

- (unint64_t)priority
{
  return 100;
}

- (BOOL)linkIsReady
{
  return self->_open;
}

- (unint64_t)maximumBatchSize
{
  return -1;
}

- (void)prioritizeAsset:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = _ATLogCategoryiTunesSync();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v4;
    _os_log_impl(&dword_1D9A2D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Prioritize %{public}@", buf, 0x16u);
  }

  if ([(NSMutableSet *)self->_unqueuedAssets containsObject:v4])
  {
    [(NSMutableSet *)self->_unqueuedAssets removeObject:v4];
    [(NSMutableSet *)self->_unqueuedAssets addObject:v4];
  }
  else
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    uint64_t v25 = __Block_byref_object_copy__2209;
    char v26 = __Block_byref_object_dispose__2210;
    id v27 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__ATLegacyAssetLink_prioritizeAsset___block_invoke;
    block[3] = &unk_1E6B88B90;
    int v18 = buf;
    block[4] = self;
    id v7 = v4;
    id v17 = v7;
    dispatch_sync(queue, block);
    if ([*(id *)(*(void *)&buf[8] + 40) count])
    {
      [v7 setIsPrioritized:1];
      long long v22 = @"AssetManifest";
      id v8 = [v7 dataclass];
      long long v20 = v8;
      uint64_t v9 = [(ATLegacyAssetLink *)self _manifestEntryForATAsset:v7];
      uint64_t v19 = v9;
      BOOL v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
      char v21 = v10;
      id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
      long long v23 = v11;
      uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];

      messageLink = self->_messageLink;
      uint64_t v14 = [MEMORY[0x1E4F4A2C0] messageWithName:@"PrioritizeAsset" parameters:v12];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __37__ATLegacyAssetLink_prioritizeAsset___block_invoke_2;
      v15[3] = &unk_1E6B88AF0;
      v15[4] = self;
      [(ATLegacyMessageLink *)messageLink sendMessage:v14 withCompletion:v15];
    }
    _Block_object_dispose(buf, 8);
  }
}

void __37__ATLegacyAssetLink_prioritizeAsset___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) dataclass];
  uint64_t v3 = [*(id *)(a1 + 40) identifier];
  uint64_t v4 = [v2 _assetsForDataClass:v7 identifier:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __37__ATLegacyAssetLink_prioritizeAsset___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 72);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__ATLegacyAssetLink_prioritizeAsset___block_invoke_3;
  v7[3] = &unk_1E6B88B68;
  id v8 = v3;
  uint64_t v9 = v4;
  id v6 = v3;
  dispatch_async(v5, v7);
}

void __37__ATLegacyAssetLink_prioritizeAsset___block_invoke_3(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = _ATLogCategoryiTunesSync();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v8 = v3;
      _os_log_impl(&dword_1D9A2D000, v2, OS_LOG_TYPE_ERROR, "failed to send asset cancelled message. err=%{public}@", buf, 0xCu);
    }

    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(NSObject **)(v4 + 72);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__ATLegacyAssetLink_prioritizeAsset___block_invoke_50;
    block[3] = &unk_1E6B88B40;
    block[4] = v4;
    dispatch_async(v5, block);
  }
}

uint64_t __37__ATLegacyAssetLink_prioritizeAsset___block_invoke_50(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) close];
}

- (void)cancelAssets:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__ATLegacyAssetLink_cancelAssets___block_invoke;
  v7[3] = &unk_1E6B88B68;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __34__ATLegacyAssetLink_cancelAssets___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v27;
    unint64_t v5 = 0x1E4F28000uLL;
    do
    {
      uint64_t v6 = 0;
      uint64_t v23 = v3;
      do
      {
        if (*(void *)v27 != v4) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v26 + 1) + 8 * v6);
        int v8 = [*(id *)(*(void *)(a1 + 40) + 8) containsObject:v7];
        uint64_t v9 = *(void *)(a1 + 40);
        if (v8)
        {
          [*(id *)(v9 + 8) removeObject:v7];
          BOOL v10 = *(void **)(a1 + 40);
          id v11 = [*(id *)(v5 + 3160) errorWithDomain:@"ATError" code:2 userInfo:0];
          [v10 _finishAsset:v7 withError:v11];
        }
        else
        {
          uint64_t v12 = *(void **)(v9 + 16);
          uint64_t v13 = [v7 dataclass];
          id v11 = [v12 objectForKey:v13];

          if ([v11 containsObject:v7])
          {
            uint64_t v14 = (void *)MEMORY[0x1E4F1C9E8];
            uint64_t v15 = [v7 identifier];
            uint64_t v16 = [v7 dataclass];
            [NSNumber numberWithInt:2];
            v18 = uint64_t v17 = v4;
            uint64_t v19 = objc_msgSend(v14, "dictionaryWithObjectsAndKeys:", v15, @"AssetID", v16, @"Dataclass", v18, @"ErrorCode", 0);

            long long v20 = *(void **)(*(void *)(a1 + 40) + 24);
            char v21 = [MEMORY[0x1E4F4A2C0] messageWithName:@"FileError" parameters:v19];
            v25[0] = MEMORY[0x1E4F143A8];
            v25[1] = 3221225472;
            v25[2] = __34__ATLegacyAssetLink_cancelAssets___block_invoke_2;
            v25[3] = &unk_1E6B88BE0;
            v25[4] = *(void *)(a1 + 40);
            v25[5] = v7;
            long long v22 = v20;
            uint64_t v4 = v17;
            uint64_t v3 = v23;
            [v22 sendMessage:v21 withCompletion:v25];

            unint64_t v5 = 0x1E4F28000;
          }
        }

        ++v6;
      }
      while (v3 != v6);
      uint64_t v3 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v3);
  }
}

void __34__ATLegacyAssetLink_cancelAssets___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 72);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__ATLegacyAssetLink_cancelAssets___block_invoke_3;
  block[3] = &unk_1E6B88BB8;
  id v7 = v3;
  long long v8 = *(_OWORD *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v4, block);
}

void __34__ATLegacyAssetLink_cancelAssets___block_invoke_3(void *a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a1[4])
  {
    uint64_t v2 = _ATLogCategoryiTunesSync();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v3 = a1[4];
      int v7 = 138543362;
      uint64_t v8 = v3;
      _os_log_impl(&dword_1D9A2D000, v2, OS_LOG_TYPE_ERROR, "failed to send asset cancelled message. err=%{public}@", (uint8_t *)&v7, 0xCu);
    }

    [*(id *)(a1[5] + 24) close];
  }
  id v5 = (void *)a1[5];
  uint64_t v4 = a1[6];
  uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:2 userInfo:0];
  [v5 _finishAsset:v4 withError:v6];
}

- (BOOL)canEnqueueAsset:(id)a3
{
  id v4 = a3;
  if ([v4 installOnly]) {
    goto LABEL_5;
  }
  id v5 = [(ATLegacyAssetLink *)self supportedDataClasses];
  uint64_t v6 = [v4 dataclass];
  int v7 = [v5 containsObject:v6];

  if (!v7) {
    goto LABEL_5;
  }
  uint64_t v8 = [v4 dataclass];
  if ([v8 isEqualToString:@"Application"])
  {
    char v9 = [v4 isRestore];

    if (v9)
    {
LABEL_5:
      BOOL v10 = 0;
      goto LABEL_6;
    }
  }
  else
  {
  }
  if ([v4 isLegacy])
  {
    BOOL v10 = 1;
  }
  else
  {
    uint64_t v12 = [v4 storeInfo];
    uint64_t v13 = [v12 syncID];
    BOOL v10 = v13 != 0;
  }
LABEL_6:

  return v10;
}

- (id)enqueueAssets:(id)a3 force:(BOOL)a4
{
  id v5 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__2209;
  uint64_t v17 = __Block_byref_object_dispose__2210;
  id v18 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__ATLegacyAssetLink_enqueueAssets_force___block_invoke;
  block[3] = &unk_1E6B88B90;
  void block[4] = self;
  id v11 = v5;
  uint64_t v12 = &v13;
  id v7 = v5;
  dispatch_sync(queue, block);
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v8;
}

void __41__ATLegacyAssetLink_enqueueAssets_force___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 40) && *(void *)(v1 + 24))
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v3 = *(id *)(a1 + 40);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v17 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          char v9 = *(void **)(*(void *)(a1 + 32) + 16);
          BOOL v10 = objc_msgSend(v8, "dataclass", (void)v16);
          id v11 = [v9 objectForKey:v10];
          char v12 = [v11 containsObject:v8];

          if ((v12 & 1) == 0)
          {
            if (([v8 isDownload] & 1) == 0)
            {
              uint64_t v13 = [v8 dataclass];
              char v14 = [v13 isEqualToString:@"Application"];

              if ((v14 & 1) == 0)
              {
                uint64_t v15 = [MEMORY[0x1E4F4A2A8] sharedInstance];
                [v15 copyAssetToAirlock:v8];
              }
            }
            [*(id *)(*(void *)(a1 + 32) + 8) addObject:v8];
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v5);
    }

    [*(id *)(a1 + 32) _enqueueAndRequestAssets];
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(a1 + 40));
  }
}

- (void)close
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__ATLegacyAssetLink_close__block_invoke;
  block[3] = &unk_1E6B88B40;
  void block[4] = self;
  dispatch_sync(queue, block);
}

void __26__ATLegacyAssetLink_close__block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(*(void *)(a1 + 32) + 40))
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v3 = [*(id *)(*(void *)(a1 + 32) + 8) allObjects];
    [v2 addObjectsFromArray:v3];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v4 = *(id *)(*(void *)(a1 + 32) + 16);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v18;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v4);
          }
          char v9 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:*(void *)(*((void *)&v17 + 1) + 8 * v8)];
          [v2 addObjectsFromArray:v9];

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v6);
    }

    [*(id *)(*(void *)(a1 + 32) + 8) removeAllObjects];
    [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
    [*(id *)(*(void *)(a1 + 32) + 32) removeAllObjects];
    *(unsigned char *)(*(void *)(a1 + 32) + 40) = 0;
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "removeObserver:");
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = *(void **)(v10 + 24);
    *(void *)(v10 + 24) = 0;

    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = *(NSObject **)(v12 + 64);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __26__ATLegacyAssetLink_close__block_invoke_2;
    v15[3] = &unk_1E6B88B68;
    v15[4] = v12;
    id v16 = v2;
    id v14 = v2;
    dispatch_async(v13, v15);
  }
}

void __26__ATLegacyAssetLink_close__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 assetLink:*(void *)(a1 + 32) didCloseWithOutstandingAssets:*(void *)(a1 + 40)];
  }
}

- (BOOL)open
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__ATLegacyAssetLink_open__block_invoke;
  block[3] = &unk_1E6B88B40;
  void block[4] = self;
  dispatch_sync(queue, block);
  return self->_open;
}

void __25__ATLegacyAssetLink_open__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 40))
  {
    *(unsigned char *)(v1 + 40) = 1;
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "addObserver:");
    objc_initWeak(&location, *(id *)(a1 + 32));
    id v3 = *(void **)(*(void *)(a1 + 32) + 24);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __25__ATLegacyAssetLink_open__block_invoke_2;
    v13[3] = &unk_1E6B88B18;
    objc_copyWeak(&v14, &location);
    [v3 setHandlerForMessage:@"FileComplete" handler:v13];
    id v4 = *(void **)(*(void *)(a1 + 32) + 24);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __25__ATLegacyAssetLink_open__block_invoke_3;
    v11[3] = &unk_1E6B88B18;
    objc_copyWeak(&v12, &location);
    [v4 setHandlerForMessage:@"FileError" handler:v11];
    uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 24);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __25__ATLegacyAssetLink_open__block_invoke_4;
    v9[3] = &unk_1E6B88B18;
    objc_copyWeak(&v10, &location);
    [v5 setHandlerForMessage:@"FileProgress" handler:v9];
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(NSObject **)(v6 + 64);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __25__ATLegacyAssetLink_open__block_invoke_5;
    block[3] = &unk_1E6B88B40;
    void block[4] = v6;
    dispatch_async(v7, block);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __25__ATLegacyAssetLink_open__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _handleFileCompleteMessage:v4];
}

void __25__ATLegacyAssetLink_open__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _handleFileErrorMessage:v4];
}

void __25__ATLegacyAssetLink_open__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _handleFileProgressMessage:v4];
}

void __25__ATLegacyAssetLink_open__block_invoke_5(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 assetLink:*(void *)(a1 + 32) didOpenWithPendingAssets:0];
  }
}

- (ATLegacyAssetLink)initWithMessageLink:(id)a3 hostVersion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v29.receiver = self;
  v29.super_class = (Class)ATLegacyAssetLink;
  char v9 = [(ATLegacyAssetLink *)&v29 init];
  if (v9)
  {
    id v10 = (objc_class *)objc_opt_class();
    Name = class_getName(v10);
    dispatch_queue_t v12 = dispatch_queue_create(Name, 0);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v12;

    dispatch_queue_t v14 = dispatch_queue_create("com.apple.atc.legacyassetlink.callback", 0);
    callbackQueue = v9->_callbackQueue;
    v9->_callbackQueue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v9->_messageLink, a3);
    id v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    unqueuedAssets = v9->_unqueuedAssets;
    v9->_unqueuedAssets = v16;

    long long v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    enqueuedAssetsByDataClass = v9->_enqueuedAssetsByDataClass;
    v9->_enqueuedAssetsByDataClass = v18;

    long long v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    syncIDToItemPidMap = v9->_syncIDToItemPidMap;
    v9->_syncIDToItemPidMap = v20;

    uint64_t v22 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    supportedDataClasses = v9->_supportedDataClasses;
    v9->_supportedDataClasses = v22;

    uint64_t v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    readyDataClasses = v9->_readyDataClasses;
    v9->_readyDataClasses = v24;

    uint64_t v26 = [v8 copy];
    hostVersion = v9->_hostVersion;
    v9->_hostVersion = (NSString *)v26;
  }
  return v9;
}

@end