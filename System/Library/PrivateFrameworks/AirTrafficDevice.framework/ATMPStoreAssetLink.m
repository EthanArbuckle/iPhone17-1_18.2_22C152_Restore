@interface ATMPStoreAssetLink
- (ATAssetLinkDelegate)delegate;
- (ATMPStoreAssetLink)init;
- (BOOL)canEnqueueAsset:(id)a3;
- (BOOL)isOpen;
- (BOOL)linkIsReady;
- (BOOL)open;
- (id)_assetTypeForStoreKind:(id)a3;
- (id)_dataClassForStoreKind:(id)a3;
- (id)_errorForFinishedDownload:(id)a3;
- (id)enqueueAssets:(id)a3 force:(BOOL)a4;
- (unint64_t)maximumBatchSize;
- (unint64_t)priority;
- (void)_enqueueAssets:(id)a3;
- (void)_finishAsset:(id)a3 error:(id)a4 retryable:(BOOL)a5;
- (void)cancelAssets:(id)a3;
- (void)close;
- (void)downloadManager:(id)a3 didAddActiveDownloads:(id)a4 removeActiveDownloads:(id)a5;
- (void)downloadManager:(id)a3 downloadDidFinish:(id)a4;
- (void)downloadManager:(id)a3 downloadDidProgress:(id)a4;
- (void)prioritizeAsset:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation ATMPStoreAssetLink

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadsMap, 0);
  objc_storeStrong((id *)&self->_assetMap, 0);
  objc_storeStrong((id *)&self->_downloadManager, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
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

- (id)_errorForFinishedDownload:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 failureError];
  if ([v4 isCanceled])
  {
    v6 = (void *)MEMORY[0x1E4F28C58];
    v7 = [v4 failureError];
    if (v7)
    {
      uint64_t v16 = *MEMORY[0x1E4F28A50];
      v3 = [v4 failureError];
      v17[0] = v3;
      v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    }
    else
    {
      v8 = 0;
    }
    v10 = v6;
    uint64_t v11 = 2;
  }
  else
  {
    if ([v5 code] != 103) {
      goto LABEL_14;
    }
    v9 = (void *)MEMORY[0x1E4F28C58];
    v7 = [v4 failureError];
    if (v7)
    {
      uint64_t v14 = *MEMORY[0x1E4F28A50];
      v3 = [v4 failureError];
      v15 = v3;
      v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    }
    else
    {
      v8 = 0;
    }
    v10 = v9;
    uint64_t v11 = 14;
  }
  uint64_t v12 = [v10 errorWithDomain:@"ATError" code:v11 userInfo:v8];

  if (v7)
  {
  }
  v5 = (void *)v12;
LABEL_14:

  return v5;
}

- (void)_finishAsset:(id)a3 error:(id)a4 retryable:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [v8 identifier];
  uint64_t v11 = [v10 longLongValue];

  assetMap = self->_assetMap;
  v13 = [NSNumber numberWithUnsignedLongLong:v11];
  [(NSMutableDictionary *)assetMap removeObjectForKey:v13];

  downloadsMap = self->_downloadsMap;
  v15 = [NSNumber numberWithUnsignedLongLong:v11];
  [(NSMutableDictionary *)downloadsMap removeObjectForKey:v15];

  callbackQueue = self->_callbackQueue;
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  v25 = __51__ATMPStoreAssetLink__finishAsset_error_retryable___block_invoke;
  v26 = &unk_1E6B87C88;
  id v17 = v8;
  id v27 = v17;
  v28 = self;
  id v18 = v9;
  id v29 = v18;
  BOOL v30 = a5;
  dispatch_async(callbackQueue, &v23);
  if (v18)
  {
    ATReportEventIncrementingScalarKey();
    v19 = objc_msgSend(v18, "domain", v23, v24, v25, v26, v27, v28);
    int v20 = [v19 isEqualToString:@"ATError"];

    if (v20)
    {
      uint64_t v21 = [v18 code];
      if (v21 == 8 || v21 == 4 || v21 == 2) {
        ATReportEventIncrementingScalarKey();
      }
    }
  }
  else
  {
    ATReportEventIncrementingScalarKey();
    objc_msgSend(v17, "transferStartTime", v23, v24, v25, v26, v27, v28);
    if (v22 != 0.0)
    {
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      [v17 transferStartTime];
      ATReportEventAddDoubleToScalarKey();
    }
  }
}

void __51__ATMPStoreAssetLink__finishAsset_error_retryable___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16));
    [WeakRetained assetLink:*(void *)(a1 + 40) didFinishAsset:*(void *)(a1 + 32) error:*(void *)(a1 + 48) retryable:*(unsigned __int8 *)(a1 + 56)];
  }
}

- (void)_enqueueAssets:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  [v3 count];
  ATReportEventAddIntToScalarKey();
  v28 = [MEMORY[0x1E4F1CA48] array];
  id v29 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v35 objects:v45 count:16];
  if (v4)
  {
    uint64_t v30 = *(void *)v36;
    *(void *)&long long v5 = 138543362;
    long long v25 = v5;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v36 != v30) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        id v8 = objc_msgSend(v7, "identifier", v25);
        uint64_t v9 = [v8 longLongValue];

        v10 = [getMPMediaLibraryClass() defaultMediaLibrary];
        uint64_t v11 = [v10 itemWithPersistentID:v9 verifyExistence:0];

        if ([v7 downloadOnly]) {
          uint64_t v12 = 2;
        }
        else {
          uint64_t v12 = 0;
        }
        v43[0] = @"MPStoreDownloadAttributeBackgroundRequest";
        v13 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v7, "isForeground") ^ 1);
        v44[0] = v13;
        v44[1] = MEMORY[0x1E4F1CC38];
        v43[1] = @"MPStoreDownloadAttributeShouldRespectMusicCellularDataRestriction";
        v43[2] = @"MPStoreDownloadAttributeShouldRespectStoreCellularDataRestriction";
        v44[2] = MEMORY[0x1E4F1CC28];
        v44[3] = @"com.apple.Music";
        v43[3] = @"MPStoreDownloadAttributeClientBundleIdentifier";
        v43[4] = @"MPStoreDownloadAttributeSkipInstall";
        uint64_t v14 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "downloadOnly"));
        v44[4] = v14;
        v43[5] = @"MPStoreDownloadAttributeReason";
        v15 = [NSNumber numberWithInteger:v12];
        v44[5] = v15;
        uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:6];

        uint64_t v39 = 0;
        v40 = &v39;
        uint64_t v41 = 0x2050000000;
        id v17 = (void *)getMPStoreDownloadClass_softClass;
        uint64_t v42 = getMPStoreDownloadClass_softClass;
        if (!getMPStoreDownloadClass_softClass)
        {
          *(void *)&long long buf = MEMORY[0x1E4F143A8];
          *((void *)&buf + 1) = 3221225472;
          v47 = __getMPStoreDownloadClass_block_invoke;
          v48 = &unk_1E6B88D48;
          v49 = &v39;
          __getMPStoreDownloadClass_block_invoke((uint64_t)&buf);
          id v17 = (void *)v40[3];
        }
        id v18 = v17;
        _Block_object_dispose(&v39, 8);
        v19 = [v18 storeDownloadForMediaItem:v11 type:1 attributes:v16];
        if (v19)
        {
          int v20 = [NSNumber numberWithLongLong:v9];
          [v29 setObject:v7 forKey:v20];

          [v28 addObject:v19];
        }
        else
        {
          uint64_t v21 = _ATLogCategoryStoreDownloads();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = v25;
            *(void *)((char *)&buf + 4) = v7;
            _os_log_impl(&dword_1D9A2D000, v21, OS_LOG_TYPE_ERROR, "failed to create download for asset %{public}@ cancelling the asset download ", (uint8_t *)&buf, 0xCu);
          }

          double v22 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:2 userInfo:0];
          [(ATMPStoreAssetLink *)self _finishAsset:v7 error:v22 retryable:1];
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v35 objects:v45 count:16];
    }
    while (v4);
  }

  if ([v28 count])
  {
    uint64_t v23 = [(MPStoreDownloadManager *)self->_downloadManager addDownloads:v28];
    uint64_t v24 = _ATLogCategoryStoreDownloads_Oversize();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v23;
      _os_log_impl(&dword_1D9A2D000, v24, OS_LOG_TYPE_DEFAULT, "StoreDownloadManager returned %{public}@ added downloads", (uint8_t *)&buf, 0xCu);
    }

    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __37__ATMPStoreAssetLink__enqueueAssets___block_invoke;
    v32[3] = &unk_1E6B87C38;
    id v33 = v29;
    v34 = self;
    [v23 enumerateObjectsUsingBlock:v32];
  }
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __37__ATMPStoreAssetLink__enqueueAssets___block_invoke_2;
  v31[3] = &unk_1E6B87C60;
  v31[4] = self;
  [v29 enumerateKeysAndObjectsUsingBlock:v31];
}

void __37__ATMPStoreAssetLink__enqueueAssets___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 libraryItemIdentifier];
  uint64_t v4 = [NSNumber numberWithLongLong:v3];
  long long v5 = [*(id *)(a1 + 32) objectForKey:v4];
  if (v5)
  {
    [*(id *)(*(void *)(a1 + 40) + 48) setObject:v5 forKey:v4];
    [*(id *)(*(void *)(a1 + 40) + 56) setObject:v6 forKey:v4];
    [*(id *)(a1 + 32) removeObjectForKey:v4];
  }
}

void __37__ATMPStoreAssetLink__enqueueAssets___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v5 = _ATLogCategoryStoreDownloads();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1D9A2D000, v5, OS_LOG_TYPE_ERROR, "failed to enqueue asset %{public}@ for download", (uint8_t *)&v6, 0xCu);
  }

  [*(id *)(a1 + 32) _finishAsset:v4 error:0 retryable:1];
}

- (id)_dataClassForStoreKind:(id)a3
{
  id v5 = a3;
  if (_dataClassForStoreKind__onceToken_1472 != -1) {
    dispatch_once(&_dataClassForStoreKind__onceToken_1472, &__block_literal_global_47);
  }
  int v6 = [(id)_dataClassForStoreKind__dataClassByKind_1473 objectForKeyedSubscript:v5];
  if (!v6)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"ATMPStoreAssetLink.m", 324, @"Unknown dataclass for kind %@", v5 object file lineNumber description];
  }

  return v6;
}

uint64_t __45__ATMPStoreAssetLink__dataClassForStoreKind___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = (void *)_dataClassForStoreKind__dataClassByKind_1473;
  _dataClassForStoreKind__dataClassByKind_1473 = (uint64_t)v0;

  [(id)_dataClassForStoreKind__dataClassByKind_1473 setObject:@"Application" forKeyedSubscript:*MEMORY[0x1E4FA84B8]];
  [(id)_dataClassForStoreKind__dataClassByKind_1473 setObject:@"Book" forKeyedSubscript:*MEMORY[0x1E4FA8480]];
  [(id)_dataClassForStoreKind__dataClassByKind_1473 setObject:@"Media" forKeyedSubscript:*MEMORY[0x1E4FA8470]];
  [(id)_dataClassForStoreKind__dataClassByKind_1473 setObject:@"Media" forKeyedSubscript:*MEMORY[0x1E4FA8488]];
  [(id)_dataClassForStoreKind__dataClassByKind_1473 setObject:@"Media" forKeyedSubscript:*MEMORY[0x1E4FA8498]];
  [(id)_dataClassForStoreKind__dataClassByKind_1473 setObject:@"Media" forKeyedSubscript:*MEMORY[0x1E4FA84A0]];
  [(id)_dataClassForStoreKind__dataClassByKind_1473 setObject:@"Media" forKeyedSubscript:*MEMORY[0x1E4FA84C8]];
  [(id)_dataClassForStoreKind__dataClassByKind_1473 setObject:@"Media" forKeyedSubscript:*MEMORY[0x1E4FA84D8]];
  v2 = (void *)_dataClassForStoreKind__dataClassByKind_1473;
  uint64_t v3 = *MEMORY[0x1E4FA84A8];

  return [v2 setObject:@"Media" forKeyedSubscript:v3];
}

- (id)_assetTypeForStoreKind:(id)a3
{
  uint64_t v3 = _assetTypeForStoreKind__onceToken_1486;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_assetTypeForStoreKind__onceToken_1486, &__block_literal_global_1487);
  }
  id v5 = [(id)_assetTypeForStoreKind__assetTypeByStoreKind_1488 objectForKeyedSubscript:v4];

  return v5;
}

uint64_t __45__ATMPStoreAssetLink__assetTypeForStoreKind___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = (void *)_assetTypeForStoreKind__assetTypeByStoreKind_1488;
  _assetTypeForStoreKind__assetTypeByStoreKind_1488 = (uint64_t)v0;

  [(id)_assetTypeForStoreKind__assetTypeByStoreKind_1488 setObject:@"Audiobook" forKeyedSubscript:*MEMORY[0x1E4FA8470]];
  [(id)_assetTypeForStoreKind__assetTypeByStoreKind_1488 setObject:@"Movie" forKeyedSubscript:*MEMORY[0x1E4FA8488]];
  [(id)_assetTypeForStoreKind__assetTypeByStoreKind_1488 setObject:@"Music" forKeyedSubscript:*MEMORY[0x1E4FA8498]];
  [(id)_assetTypeForStoreKind__assetTypeByStoreKind_1488 setObject:@"MusicVideo" forKeyedSubscript:*MEMORY[0x1E4FA84A0]];
  uint64_t v2 = *MEMORY[0x1E4FA84A8];
  [(id)_assetTypeForStoreKind__assetTypeByStoreKind_1488 setObject:@"Podcast" forKeyedSubscript:*MEMORY[0x1E4FA84A8]];
  [(id)_assetTypeForStoreKind__assetTypeByStoreKind_1488 setObject:@"TVEpisode" forKeyedSubscript:*MEMORY[0x1E4FA84C8]];
  uint64_t v3 = *MEMORY[0x1E4FA84D8];
  [(id)_assetTypeForStoreKind__assetTypeByStoreKind_1488 setObject:@"VideoPodcast" forKeyedSubscript:*MEMORY[0x1E4FA84D8]];
  [(id)_assetTypeForStoreKind__assetTypeByStoreKind_1488 setObject:@"iTunesU" forKeyedSubscript:v2];
  id v4 = (void *)_assetTypeForStoreKind__assetTypeByStoreKind_1488;

  return [v4 setObject:@"iTunesUVideo" forKeyedSubscript:v3];
}

- (void)downloadManager:(id)a3 didAddActiveDownloads:(id)a4 removeActiveDownloads:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__ATMPStoreAssetLink_downloadManager_didAddActiveDownloads_removeActiveDownloads___block_invoke;
  block[3] = &unk_1E6B88BB8;
  id v13 = v7;
  uint64_t v14 = self;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_sync(queue, block);
}

void __82__ATMPStoreAssetLink_downloadManager_didAddActiveDownloads_removeActiveDownloads___block_invoke(void *a1)
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__1512;
  id v11 = __Block_byref_object_dispose__1513;
  id v12 = [MEMORY[0x1E4F1CA48] array];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __82__ATMPStoreAssetLink_downloadManager_didAddActiveDownloads_removeActiveDownloads___block_invoke_2;
  v6[3] = &unk_1E6B87C10;
  uint64_t v2 = (void *)a1[4];
  v6[4] = a1[5];
  v6[5] = &v7;
  [v2 enumerateObjectsUsingBlock:v6];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __82__ATMPStoreAssetLink_downloadManager_didAddActiveDownloads_removeActiveDownloads___block_invoke_3;
  v5[3] = &unk_1E6B87C10;
  uint64_t v3 = (void *)a1[6];
  v5[4] = a1[5];
  v5[5] = &v7;
  [v3 enumerateObjectsUsingBlock:v5];
  id WeakRetained = objc_loadWeakRetained((id *)(a1[5] + 16));
  [WeakRetained assetLink:a1[5] didTransitionAssetStates:v8[5]];

  _Block_object_dispose(&v7, 8);
}

void __82__ATMPStoreAssetLink_downloadManager_didAddActiveDownloads_removeActiveDownloads___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 libraryItemIdentifier];
  id v4 = *(void **)(*(void *)(a1 + 32) + 48);
  id v5 = [NSNumber numberWithLongLong:v3];
  id v6 = [v4 objectForKey:v5];

  if (v6)
  {
    [v6 setAssetState:1];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v6];
  }
}

void __82__ATMPStoreAssetLink_downloadManager_didAddActiveDownloads_removeActiveDownloads___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 libraryItemIdentifier];
  id v4 = *(void **)(*(void *)(a1 + 32) + 48);
  id v5 = [NSNumber numberWithLongLong:v3];
  id v6 = [v4 objectForKey:v5];

  if (v6)
  {
    [v6 setAssetState:0];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v6];
  }
}

- (void)downloadManager:(id)a3 downloadDidProgress:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__ATMPStoreAssetLink_downloadManager_downloadDidProgress___block_invoke;
  v8[3] = &unk_1E6B88B68;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_sync(queue, v8);
}

void __58__ATMPStoreAssetLink_downloadManager_downloadDidProgress___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) libraryItemIdentifier];
  uint64_t v3 = *(void **)(*(void *)(a1 + 40) + 48);
  id v4 = [NSNumber numberWithLongLong:v2];
  id v7 = [v3 objectForKey:v4];

  if (v7)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16));
    uint64_t v6 = *(void *)(a1 + 40);
    [*(id *)(a1 + 32) percentComplete];
    objc_msgSend(WeakRetained, "assetLink:didUpdateAsset:progress:", v6, v7);
  }
}

- (void)downloadManager:(id)a3 downloadDidFinish:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = _ATLogCategoryStoreDownloads();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    id v13 = self;
    __int16 v14 = 2114;
    id v15 = v5;
    _os_log_impl(&dword_1D9A2D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ download finished: %{public}@", buf, 0x16u);
  }

  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__ATMPStoreAssetLink_downloadManager_downloadDidFinish___block_invoke;
  v9[3] = &unk_1E6B88B68;
  id v10 = v5;
  id v11 = self;
  id v8 = v5;
  dispatch_sync(queue, v9);
}

void __56__ATMPStoreAssetLink_downloadManager_downloadDidFinish___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) libraryItemIdentifier];
  uint64_t v3 = *(void **)(*(void *)(a1 + 40) + 48);
  id v4 = [NSNumber numberWithLongLong:v2];
  id v5 = [v3 objectForKey:v4];

  if (v5)
  {
    uint64_t v6 = [*(id *)(a1 + 40) _errorForFinishedDownload:*(void *)(a1 + 32)];
    uint64_t v7 = [*(id *)(a1 + 32) _getDownloadFilePath];
    id v8 = (void *)v7;
    if (!v6 && v7)
    {
      id v9 = [MEMORY[0x1E4F4A2A8] sharedInstance];
      id v10 = [v5 dataclass];
      v28 = v10;
      id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
      [v9 createAirlockForDataclasses:v11];

      id v12 = [v5 dataclass];
      id v13 = [v9 pathForDataclass:v12];
      uint64_t v14 = [v8 lastPathComponent];
      id v15 = [v13 stringByAppendingPathComponent:v14];

      uint64_t v16 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v26 = 0;
      LOBYTE(v14) = [v16 moveItemAtPath:v8 toPath:v15 error:&v26];
      uint64_t v6 = v26;

      if (v14)
      {
        [v5 setPath:v15];
      }
      else
      {
        id v18 = _ATLogCategoryStoreDownloads();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138543362;
          uint64_t v30 = v6;
          _os_log_impl(&dword_1D9A2D000, v18, OS_LOG_TYPE_ERROR, "failed to move download file to airlock. error=%{public}@", buf, 0xCu);
        }
      }
    }
    v19 = *(void **)(*(void *)(a1 + 40) + 56);
    int v20 = [NSNumber numberWithLongLong:v2];
    [v19 removeObjectForKey:v20];

    uint64_t v21 = *(void **)(*(void *)(a1 + 40) + 48);
    double v22 = [NSNumber numberWithLongLong:v2];
    [v21 removeObjectForKey:v22];

    uint64_t v23 = *(void *)(a1 + 40);
    uint64_t v24 = *(void **)(v23 + 40);
    uint64_t v27 = *(void *)(a1 + 32);
    long long v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
    [v24 removeObserver:v23 forDownloads:v25];

    [*(id *)(a1 + 40) _finishAsset:v5 error:v6 retryable:1];
  }
  else
  {
    uint64_t v6 = _ATLogCategoryStoreDownloads();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = *(NSObject **)(a1 + 32);
      *(_DWORD *)long long buf = 138543362;
      uint64_t v30 = v17;
      _os_log_impl(&dword_1D9A2D000, v6, OS_LOG_TYPE_DEFAULT, "no pending asset found for download. download=%{public}@", buf, 0xCu);
    }
  }
}

- (BOOL)linkIsReady
{
  return 1;
}

- (unint64_t)maximumBatchSize
{
  return 3;
}

- (unint64_t)priority
{
  return 50;
}

- (void)prioritizeAsset:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _ATLogCategoryStoreDownloads();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    id v12 = self;
    __int16 v13 = 2114;
    id v14 = v4;
    _os_log_impl(&dword_1D9A2D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Prioritize %{public}@", buf, 0x16u);
  }

  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__ATMPStoreAssetLink_prioritizeAsset___block_invoke;
  v8[3] = &unk_1E6B88B68;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_sync(queue, v8);
}

void __38__ATMPStoreAssetLink_prioritizeAsset___block_invoke(uint64_t a1)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) identifier];
  uint64_t v3 = [v2 longLongValue];

  id v4 = *(void **)(*(void *)(a1 + 40) + 56);
  id v5 = [NSNumber numberWithUnsignedLongLong:v3];
  uint64_t v6 = [v4 objectForKey:v5];

  if (v6)
  {
    v14[0] = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    [*(id *)(*(void *)(a1 + 40) + 40) resumeDownloads:v7];
    [*(id *)(*(void *)(a1 + 40) + 40) prioritizeDownloads:v7];
    [*(id *)(a1 + 32) setIsPrioritized:1];
  }
  else
  {
    id v7 = _ATLogCategoryStoreDownloads();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      int v10 = 138543618;
      uint64_t v11 = v8;
      __int16 v12 = 2114;
      uint64_t v13 = v9;
      _os_log_impl(&dword_1D9A2D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ can't prioritize asset because no download was found. asset=%{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)cancelAssets:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__ATMPStoreAssetLink_cancelAssets___block_invoke;
  v7[3] = &unk_1E6B88B68;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __35__ATMPStoreAssetLink_cancelAssets___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v18 objects:v27 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v19;
    *(void *)&long long v4 = 138543618;
    long long v17 = v4;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(v8, "identifier", v17, (void)v18);
        uint64_t v10 = [v9 longLongValue];

        uint64_t v11 = *(void **)(*(void *)(a1 + 40) + 56);
        __int16 v12 = [NSNumber numberWithUnsignedLongLong:v10];
        uint64_t v13 = [v11 objectForKey:v12];

        if (v13)
        {
          id v14 = *(void **)(*(void *)(a1 + 40) + 40);
          id v26 = v13;
          uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
          [v14 cancelDownloads:v15];
        }
        else
        {
          uint64_t v15 = _ATLogCategoryStoreDownloads();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v16 = *(void *)(a1 + 40);
            *(_DWORD *)long long buf = v17;
            uint64_t v23 = v16;
            __int16 v24 = 2114;
            long long v25 = v8;
            _os_log_impl(&dword_1D9A2D000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ can't cancel asset because no download was found. asset=%{public}@", buf, 0x16u);
          }
        }
      }
      uint64_t v5 = [v2 countByEnumeratingWithState:&v18 objects:v27 count:16];
    }
    while (v5);
  }
}

- (BOOL)canEnqueueAsset:(id)a3
{
  id v3 = a3;
  long long v4 = +[ATDeviceSettings sharedInstance];
  char v5 = [v4 useNewDownloadService];

  if ((v5 & 1) != 0
    || ([v3 variantOptions],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        [v6 objectForKey:@"AssetParts"],
        id v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 unsignedIntegerValue],
        v7,
        v6,
        ([v3 bypassStore] & 1) != 0))
  {
    BOOL v9 = 0;
  }
  else
  {
    uint64_t v10 = [v3 dataclass];
    if ([v10 isEqualToString:@"Media"])
    {
      if ([v3 isRestore]) {
        BOOL v9 = 0;
      }
      else {
        BOOL v9 = v8 & 1;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  return v9;
}

- (id)enqueueAssets:(id)a3 force:(BOOL)a4
{
  id v6 = a3;
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x3032000000;
  long long v21 = __Block_byref_object_copy__1512;
  double v22 = __Block_byref_object_dispose__1513;
  id v23 = [MEMORY[0x1E4F1CA48] array];
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__1512;
  v16[4] = __Block_byref_object_dispose__1513;
  id v17 = [MEMORY[0x1E4F1CA48] array];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__ATMPStoreAssetLink_enqueueAssets_force___block_invoke;
  block[3] = &unk_1E6B87BE8;
  void block[4] = self;
  id v12 = v6;
  BOOL v15 = a4;
  uint64_t v13 = &v18;
  id v14 = v16;
  id v8 = v6;
  dispatch_sync(queue, block);
  id v9 = (id)v19[5];

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(&v18, 8);

  return v9;
}

uint64_t __42__ATMPStoreAssetLink_enqueueAssets_force___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 48) count];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = *(id *)(a1 + 40);
  uint64_t v25 = [obj countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v25)
  {
    uint64_t v4 = *(void *)v27;
    *(void *)&long long v3 = 138544130;
    long long v23 = v3;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v27 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v7 = objc_msgSend(v6, "identifier", v23);
        uint64_t v8 = [v7 longLongValue];

        id v9 = *(void **)(*(void *)(a1 + 32) + 56);
        uint64_t v10 = [NSNumber numberWithUnsignedLongLong:v8];
        uint64_t v11 = [v9 objectForKey:v10];

        if (v11)
        {
          id v12 = _ATLogCategoryStoreDownloads();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v13 = v4;
            unint64_t v14 = v2;
            uint64_t v15 = *(void *)(a1 + 32);
            uint64_t v16 = [v11 phaseIdentifier];
            *(_DWORD *)long long buf = v23;
            uint64_t v31 = v15;
            unint64_t v2 = v14;
            uint64_t v4 = v13;
            __int16 v32 = 2114;
            id v33 = v11;
            __int16 v34 = 2114;
            long long v35 = v16;
            __int16 v36 = 2114;
            long long v37 = v6;
            _os_log_impl(&dword_1D9A2D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Matched enqueued download %{public}@ (%{public}@) for %{public}@", buf, 0x2Au);
          }
          id v17 = *(void **)(*(void *)(a1 + 32) + 48);
          uint64_t v18 = [NSNumber numberWithUnsignedLongLong:v8];
          [v17 setObject:v6 forKey:v18];

          [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v6];
        }
        else if (*(unsigned char *)(a1 + 64) || v2 <= 2)
        {
          [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v6];
          [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v6];
          ++v2;
        }
      }
      uint64_t v25 = [obj countByEnumeratingWithState:&v26 objects:v38 count:16];
    }
    while (v25);
  }

  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count];
  if (result)
  {
    uint64_t v20 = _ATLogCategoryStoreDownloads_Oversize();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = *(void *)(a1 + 32);
      double v22 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      *(_DWORD *)long long buf = 138543618;
      uint64_t v31 = v21;
      __int16 v32 = 2114;
      id v33 = v22;
      _os_log_impl(&dword_1D9A2D000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ Enqueuing %{public}@ new assets to download", buf, 0x16u);
    }

    return [*(id *)(a1 + 32) _enqueueAssets:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  }
  return result;
}

- (void)close
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__ATMPStoreAssetLink_close__block_invoke;
  block[3] = &unk_1E6B88B40;
  void block[4] = self;
  dispatch_sync(queue, block);
}

void __27__ATMPStoreAssetLink_close__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 8))
  {
    *(unsigned char *)(v1 + 8) = 0;
    long long v3 = [*(id *)(*(void *)(a1 + 32) + 56) allValues];
    if ([v3 count]) {
      [*(id *)(*(void *)(a1 + 32) + 40) removeObserver:*(void *)(a1 + 32) forDownloads:v3];
    }
    uint64_t v4 = *(void *)(a1 + 32);
    char v5 = *(NSObject **)(v4 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __27__ATMPStoreAssetLink_close__block_invoke_2;
    block[3] = &unk_1E6B88B40;
    void block[4] = v4;
    dispatch_async(v5, block);
  }
}

void __27__ATMPStoreAssetLink_close__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 assetLink:*(void *)(a1 + 32) didCloseWithOutstandingAssets:0];
}

- (BOOL)open
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__ATMPStoreAssetLink_open__block_invoke;
  block[3] = &unk_1E6B88B40;
  void block[4] = self;
  dispatch_sync(queue, block);
  return 1;
}

void __26__ATMPStoreAssetLink_open__block_invoke(uint64_t a1)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 8))
  {
    *(unsigned char *)(v1 + 8) = 1;
    id v37 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id obj = [*(id *)(*(void *)(a1 + 32) + 40) downloads];
    uint64_t v3 = [obj countByEnumeratingWithState:&v43 objects:v53 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v44;
      uint64_t v6 = *MEMORY[0x1E4FA85E8];
      uint64_t v40 = *MEMORY[0x1E4FA85D0];
      uint64_t v35 = *MEMORY[0x1E4FA85F0];
      uint64_t v34 = *MEMORY[0x1E4FA8658];
      uint64_t v33 = *MEMORY[0x1E4FA8648];
      uint64_t v36 = *MEMORY[0x1E4FA85E8];
      do
      {
        uint64_t v7 = 0;
        uint64_t v38 = v4;
        do
        {
          if (*(void *)v44 != v5) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void **)(*((void *)&v43 + 1) + 8 * v7);
          id v9 = _ATLogCategoryStoreDownloads();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v10 = *(void **)(a1 + 32);
            *(_DWORD *)long long buf = 138543618;
            v48 = v10;
            __int16 v49 = 2114;
            uint64_t v50 = v8;
            _os_log_impl(&dword_1D9A2D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Found active download: %{public}@", buf, 0x16u);
          }

          uint64_t v11 = [v8 _SSDownload];
          id v12 = *(void **)(a1 + 32);
          uint64_t v13 = [v11 valueForProperty:v6];
          unint64_t v14 = [v12 _dataClassForStoreKind:v13];

          uint64_t v15 = [v11 valueForProperty:v40];
          int v16 = [v15 BOOLValue];

          if ([v14 isEqualToString:@"Media"]) {
            BOOL v17 = v16 == 0;
          }
          else {
            BOOL v17 = 0;
          }
          if (v17)
          {
            uint64_t v18 = objc_alloc_init(MEMORY[0x1E4F4A2B0]);
            long long v19 = [v11 valueForProperty:v35];
            [v18 setIdentifier:v19];

            [v18 setDataclass:v14];
            [v18 setIsDownload:1];
            uint64_t v20 = *(void **)(a1 + 32);
            [v11 valueForProperty:v6];
            v22 = uint64_t v21 = v5;
            long long v23 = [v20 _assetTypeForStoreKind:v22];
            [v18 setAssetType:v23];

            [v18 setVariantOptions:&unk_1F33DCBD0];
            [v18 setIsRestore:0];
            __int16 v24 = [v11 valueForProperty:v34];
            [v18 setPrettyName:v24];

            uint64_t v25 = [v11 valueForProperty:v33];
            [v18 setIcon:v25];

            -[NSObject setStorePID:](v18, "setStorePID:", [v11 persistentIdentifier]);
            long long v26 = *(void **)(*(void *)(a1 + 32) + 48);
            long long v27 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v8, "libraryItemIdentifier"));
            [v26 setObject:v18 forKey:v27];

            long long v28 = *(void **)(*(void *)(a1 + 32) + 56);
            long long v29 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v8, "libraryItemIdentifier"));
            [v28 setObject:v8 forKey:v29];

            uint64_t v5 = v21;
            uint64_t v4 = v38;
            uint64_t v6 = v36;
            [v37 addObject:v18];
          }
          else
          {
            uint64_t v18 = _ATLogCategoryStoreDownloads();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)long long buf = 138543874;
              v48 = v8;
              __int16 v49 = 2114;
              uint64_t v50 = v14;
              __int16 v51 = 1024;
              int v52 = v16;
              _os_log_impl(&dword_1D9A2D000, v18, OS_LOG_TYPE_INFO, "ignoring active download:%{public}@. dataClass:%{public}@, isRestore%d", buf, 0x1Cu);
            }
          }

          ++v7;
        }
        while (v4 != v7);
        uint64_t v4 = [obj countByEnumeratingWithState:&v43 objects:v53 count:16];
      }
      while (v4);
    }

    uint64_t v30 = *(void *)(a1 + 32);
    uint64_t v31 = *(NSObject **)(v30 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __26__ATMPStoreAssetLink_open__block_invoke_11;
    block[3] = &unk_1E6B88B68;
    void block[4] = v30;
    id v42 = v37;
    id v32 = v37;
    dispatch_async(v31, block);
  }
}

void __26__ATMPStoreAssetLink_open__block_invoke_11(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) allObjects];
  [v4 assetLink:v2 didOpenWithPendingAssets:v3];
}

- (ATMPStoreAssetLink)init
{
  v19.receiver = self;
  v19.super_class = (Class)ATMPStoreAssetLink;
  uint64_t v2 = [(ATMPStoreAssetLink *)&v19 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("ATMPStoreAssetLink", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("ATMPStoreAssetLink - callback", 0);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v5;

    uint64_t v25 = 0;
    long long v26 = &v25;
    uint64_t v27 = 0x2050000000;
    uint64_t v7 = (void *)getMPMediaQueryClass_softClass;
    uint64_t v28 = getMPMediaQueryClass_softClass;
    if (!getMPMediaQueryClass_softClass)
    {
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      double v22 = __getMPMediaQueryClass_block_invoke;
      long long v23 = &unk_1E6B88D48;
      __int16 v24 = &v25;
      __getMPMediaQueryClass_block_invoke((uint64_t)&v20);
      uint64_t v7 = (void *)v26[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v25, 8);
    [v8 setFilteringDisabled:1];
    id v9 = [getMPMediaLibraryClass() defaultMediaLibrary];
    [v9 setCloudFilteringType:1];

    uint64_t v25 = 0;
    long long v26 = &v25;
    uint64_t v27 = 0x2050000000;
    uint64_t v10 = (void *)getMPStoreDownloadManagerClass_softClass;
    uint64_t v28 = getMPStoreDownloadManagerClass_softClass;
    if (!getMPStoreDownloadManagerClass_softClass)
    {
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      double v22 = __getMPStoreDownloadManagerClass_block_invoke;
      long long v23 = &unk_1E6B88D48;
      __int16 v24 = &v25;
      __getMPStoreDownloadManagerClass_block_invoke((uint64_t)&v20);
      uint64_t v10 = (void *)v26[3];
    }
    id v11 = v10;
    _Block_object_dispose(&v25, 8);
    uint64_t v12 = [v11 sharedManager];
    downloadManager = v2->_downloadManager;
    v2->_downloadManager = (MPStoreDownloadManager *)v12;

    [(MPStoreDownloadManager *)v2->_downloadManager addObserver:v2 forDownloads:0];
    uint64_t v14 = objc_opt_new();
    assetMap = v2->_assetMap;
    v2->_assetMap = (NSMutableDictionary *)v14;

    uint64_t v16 = objc_opt_new();
    downloadsMap = v2->_downloadsMap;
    v2->_downloadsMap = (NSMutableDictionary *)v16;
  }
  return v2;
}

@end