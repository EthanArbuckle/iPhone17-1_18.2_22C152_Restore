@interface ATStoreAssetLink
- (ATAssetLinkDelegate)delegate;
- (ATStoreAssetLink)init;
- (BOOL)canEnqueueAsset:(id)a3;
- (BOOL)isOpen;
- (BOOL)linkIsReady;
- (BOOL)open;
- (OS_dispatch_queue)callbackQueue;
- (id)_assetForDownload:(id)a3;
- (id)_assetTypeForStoreKind:(id)a3;
- (id)_dataClassForStoreKind:(id)a3;
- (id)_downloadForAsset:(id)a3 error:(id *)a4;
- (id)_storeKindForAsset:(id)a3;
- (id)downloadManager;
- (id)enqueueAssets:(id)a3 force:(BOOL)a4;
- (unint64_t)maximumBatchSize;
- (unint64_t)priority;
- (void)_enqueueAssets:(id)a3;
- (void)_finishAsset:(id)a3 error:(id)a4 retryable:(BOOL)a5;
- (void)_updateInstallProgress:(double)a3 forAsset:(id)a4;
- (void)cancelAssets:(id)a3;
- (void)close;
- (void)downloadManager:(id)a3 downloadStatesDidChange:(id)a4;
- (void)prioritizeAsset:(id)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation ATStoreAssetLink

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_downloadsByAsset, 0);
  objc_storeStrong((id *)&self->_assetsByStoreID, 0);

  objc_storeStrong((id *)&self->_downloadManager, 0);
}

- (void)setCallbackQueue:(id)a3
{
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
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

- (id)_assetForDownload:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F4A2B0]);
  [v5 setIsDownload:1];
  uint64_t v6 = *MEMORY[0x1E4FA85E8];
  v7 = [v4 valueForProperty:*MEMORY[0x1E4FA85E8]];
  v8 = [(ATStoreAssetLink *)self _dataClassForStoreKind:v7];
  [v5 setDataclass:v8];

  v9 = [v4 valueForProperty:v6];
  v10 = [(ATStoreAssetLink *)self _assetTypeForStoreKind:v9];
  [v5 setAssetType:v10];

  v11 = [v5 dataclass];
  LODWORD(v10) = [v11 isEqualToString:@"Book"];

  if (v10
    || ([v5 dataclass],
        v12 = objc_claimAutoreleasedReturnValue(),
        int v13 = [v12 isEqualToString:@"Media"],
        v12,
        v13))
  {
    v14 = [v4 valueForProperty:*MEMORY[0x1E4FA85F0]];
    [v5 setIdentifier:v14];
  }
  else
  {
    ATStoreAssetLinkRaiseWithSerialABCReport(@"Unknown kind for download", v4);
  }
  v15 = [v5 dataclass];
  int v16 = [v15 isEqualToString:@"Media"];

  if (v16) {
    [v5 setVariantOptions:&unk_1F33DCBA8];
  }
  v17 = [v4 valueForProperty:*MEMORY[0x1E4FA85D0]];
  objc_msgSend(v5, "setIsRestore:", objc_msgSend(v17, "BOOLValue"));

  v18 = [v4 valueForProperty:*MEMORY[0x1E4FA8658]];
  [v5 setPrettyName:v18];

  v19 = [v4 valueForProperty:*MEMORY[0x1E4FA8648]];
  [v5 setIcon:v19];

  objc_msgSend(v5, "setStorePID:", objc_msgSend(v4, "persistentIdentifier"));
  v20 = _ATLogCategoryStoreDownloads();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138543874;
    v23 = self;
    __int16 v24 = 2114;
    id v25 = v5;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_1D9A2D000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ Created download asset=%{public}@ for SSDownload=%{public}@", (uint8_t *)&v22, 0x20u);
  }

  return v5;
}

- (id)_downloadForAsset:(id)a3 error:(id *)a4
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 storePID])
  {
    id v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4FA8150]), "initWithPersistentIdentifier:", objc_msgSend(v6, "storePID"));
    goto LABEL_37;
  }
  id v91 = objc_alloc_init(MEMORY[0x1E4FA8160]);
  id v8 = objc_alloc_init(MEMORY[0x1E4FA8150]);
  v9 = [v6 storeInfo];
  v90 = [v6 storePlist];
  uint64_t v10 = [v6 infoPlist];
  v11 = (void *)v10;
  if (v9)
  {
    v12 = [v9 downloadDictionary];
    [v8 setValuesWithDictionary:v12];

    int v13 = [v9 assetDictionary];
    [v91 setValuesWithDictionary:v13];

    [v6 setStoreInfo:0];
  }
  else if (v90)
  {
    v14 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v90];
    if (v14)
    {
      v15 = [MEMORY[0x1E4F28F98] propertyListWithData:v14 options:0 format:0 error:0];
      int v16 = (void *)[objc_alloc(MEMORY[0x1E4FA8190]) initWithDictionary:v15];
      [v8 setValuesWithStoreDownloadMetadata:v16];
    }
    else
    {
      v15 = _ATLogCategoryStoreDownloads();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v97 = self;
        __int16 v98 = 2114;
        id v99 = v6;
        _os_log_impl(&dword_1D9A2D000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ Missing store plist file for %{public}@", buf, 0x16u);
      }
    }

    [v6 setStorePlist:0];
  }
  else if (v10)
  {
    v17 = self;
    v18 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v10];
    v19 = [MEMORY[0x1E4F28F98] propertyListWithData:v18 options:0 format:0 error:0];
    v20 = [v19 objectForKey:@"UIBackgroundModes"];
    v21 = v20;
    if (v20 && [v20 containsObject:@"newsstand-content"]) {
      [v8 setValue:*MEMORY[0x1E4FA8668] forProperty:*MEMORY[0x1E4FA8618]];
    }
    [v6 setInfoPlist:0];

    self = v17;
  }
  int v22 = [v6 dataclass];
  int v23 = [v22 isEqualToString:@"Media"];

  if (!v23)
  {
    v87 = a4;
    v35 = [v6 dataclass];
    int v36 = [v35 isEqualToString:@"Book"];

    if (!v36) {
      goto LABEL_23;
    }
    v86 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v84 = *MEMORY[0x1E4FA8480];
    uint64_t v82 = *MEMORY[0x1E4FA85E8];
    v89 = v11;
    v80 = [NSNumber numberWithBool:0];
    uint64_t v78 = *MEMORY[0x1E4FA8568];
    v37 = [v6 identifier];
    v38 = self;
    id v39 = v8;
    uint64_t v40 = *MEMORY[0x1E4FA85F0];
    v41 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "isRestore"));
    uint64_t v42 = *MEMORY[0x1E4FA85D0];
    [v6 prettyName];
    v44 = v43 = v9;
    uint64_t v72 = v40;
    id v8 = v39;
    self = v38;
    v45 = objc_msgSend(v86, "dictionaryWithObjectsAndKeys:", v84, v82, v80, v78, v37, v72, v41, v42, v44, *MEMORY[0x1E4FA8658], 0);
    [v8 setValuesWithDictionary:v45];

    v9 = v43;
    v11 = v89;

    v46 = [v6 icon];

    if (!v46)
    {
LABEL_23:
      [v8 setValue:*MEMORY[0x1E4F4A248] forProperty:*MEMORY[0x1E4FA8580]];
      [v8 addAsset:v91 forType:*MEMORY[0x1E4FA8440]];
      v49 = [v6 dataclass];
      if ([v49 isEqualToString:@"Book"])
      {
      }
      else
      {
        v50 = [v6 dataclass];
        int v51 = [v50 isEqualToString:@"Media"];

        if (!v51)
        {
LABEL_35:
          id v7 = v8;
          goto LABEL_36;
        }
      }
      v52 = +[ATRestoreManager sharedManager];
      int v53 = [v52 hasProperNetworkConditions];

      if (v53)
      {
        v54 = _ATLogCategoryStoreDownloads();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          v55 = [v6 shortDescription];
          *(_DWORD *)buf = 138543618;
          v97 = self;
          __int16 v98 = 2114;
          id v99 = v55;
          _os_log_impl(&dword_1D9A2D000, v54, OS_LOG_TYPE_DEFAULT, "%{public}@ removing network constraints for %{public}@", buf, 0x16u);
        }
        v56 = [v6 dataclass];
        if ([v56 isEqualToString:@"Book"])
        {
          id v57 = (id)*MEMORY[0x1E4FA8480];
        }
        else
        {
          id v57 = [(ATStoreAssetLink *)self _storeKindForAsset:v6];
        }
        v63 = v57;

        if (!v63)
        {
          uint64_t v92 = *MEMORY[0x1E4F28568];
          v67 = NSString;
          v68 = [v6 assetType];
          v69 = [v6 description];
          v70 = [v67 stringWithFormat:@"No valid download kind for asset type %@. asset=%@", v68, v69];
          v93 = v70;
          v71 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v93 forKeys:&v92 count:1];

          id *v87 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:21 userInfo:v71];

          id v7 = 0;
          goto LABEL_36;
        }
        v64 = (void *)[objc_alloc(MEMORY[0x1E4FA81A0]) initWithDownloadKind:v63 URLBagType:0];
        id v65 = objc_alloc_init(MEMORY[0x1E4FA81B8]);
        [v65 setCellularDataStates:0];
        [v64 setPolicyRule:v65];
        [v8 setDownloadPolicy:v64];
      }
      goto LABEL_35;
    }
    v47 = [v6 icon];
    v48 = [v47 absoluteString];
    [v8 setValue:v48 forProperty:*MEMORY[0x1E4FA8648]];

    id v25 = objc_alloc_init(MEMORY[0x1E4FA8160]);
    [v8 addAsset:v25 forType:*MEMORY[0x1E4FA8430]];
LABEL_22:

    goto LABEL_23;
  }
  v88 = v11;
  uint64_t v24 = [(ATStoreAssetLink *)self _storeKindForAsset:v6];
  if (v24)
  {
    id v25 = (id)v24;
    v85 = (void *)MEMORY[0x1E4F1C9E8];
    v87 = a4;
    uint64_t v81 = *MEMORY[0x1E4FA85E8];
    v79 = [NSNumber numberWithBool:0];
    uint64_t v77 = *MEMORY[0x1E4FA8558];
    v76 = [NSNumber numberWithBool:0];
    uint64_t v75 = *MEMORY[0x1E4FA8568];
    __int16 v26 = [NSNumber numberWithBool:0];
    uint64_t v27 = *MEMORY[0x1E4FA8578];
    uint64_t v28 = [v6 identifier];
    v29 = v8;
    uint64_t v30 = *MEMORY[0x1E4FA85F0];
    v31 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "isRestore"));
    v74 = self;
    uint64_t v32 = *MEMORY[0x1E4FA85D0];
    [v6 prettyName];
    v33 = v83 = v9;
    uint64_t v73 = v30;
    id v8 = v29;
    v34 = objc_msgSend(v85, "dictionaryWithObjectsAndKeys:", v25, v81, v79, v77, v76, v75, v26, v27, v28, v73, v31, v32, v33, *MEMORY[0x1E4FA8658], 0);
    [v29 setValuesWithDictionary:v34];

    v9 = v83;
    self = v74;

    v11 = v88;
    goto LABEL_22;
  }
  uint64_t v94 = *MEMORY[0x1E4F28568];
  v58 = NSString;
  v59 = [v6 assetType];
  v60 = [v6 description];
  v61 = [v58 stringWithFormat:@"No valid store kind for asset type %@. asset=%@", v59, v60];
  v95 = v61;
  v62 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v95 forKeys:&v94 count:1];

  *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:21 userInfo:v62];

  id v7 = 0;
  v11 = v88;
LABEL_36:

LABEL_37:

  return v7;
}

- (void)_enqueueAssets:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v32 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  [v4 count];
  ATReportEventAddIntToScalarKey();
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  obuint64_t j = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v41 objects:v54 count:16];
  if (v5)
  {
    uint64_t v7 = *(void *)v42;
    *(void *)&long long v6 = 138543874;
    long long v30 = v6;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v42 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        id v40 = 0;
        uint64_t v10 = -[ATStoreAssetLink _downloadForAsset:error:](self, "_downloadForAsset:error:", v9, &v40, v30);
        id v11 = v40;
        v12 = v11;
        if (v10)
        {
          [v32 addObject:v10];
          int v13 = _ATLogCategoryStoreDownloads();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v14 = [v9 shortDescription];
            *(_DWORD *)buf = v30;
            *(void *)&uint8_t buf[4] = self;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v10;
            *(_WORD *)&buf[22] = 2114;
            int v51 = v14;
            _os_log_impl(&dword_1D9A2D000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Created %{public}@ for %{public}@", buf, 0x20u);
          }
          assetsByStoreID = self->_assetsByStoreID;
          int v16 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v10, "persistentIdentifier"));
          [(NSMutableDictionary *)assetsByStoreID setObject:v9 forKey:v16];

          [(NSMapTable *)self->_downloadsByAsset setObject:v10 forKey:v9];
        }
        else
        {
          if (v11) {
            uint64_t v17 = ATIsRecoverableError();
          }
          else {
            uint64_t v17 = 1;
          }
          [(ATStoreAssetLink *)self _finishAsset:v9 error:v12 retryable:v17];
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v41 objects:v54 count:16];
    }
    while (v5);
  }

  if ([v32 count])
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    int v51 = __Block_byref_object_copy_;
    v52 = __Block_byref_object_dispose_;
    id v53 = 0;
    dispatch_semaphore_t v18 = dispatch_semaphore_create(0);
    downloadManager = self->_downloadManager;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __35__ATStoreAssetLink__enqueueAssets___block_invoke;
    v37[3] = &unk_1E6B879D0;
    id v39 = buf;
    v20 = v18;
    v38 = v20;
    [(SSDownloadManager *)downloadManager addDownloads:v32 completionBlock:v37];
    dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
    if (*(void *)(*(void *)&buf[8] + 40))
    {
      v21 = _ATLogCategoryStoreDownloads();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = *(void *)(*(void *)&buf[8] + 40);
        *(_DWORD *)v46 = 138543618;
        v47 = self;
        __int16 v48 = 2114;
        uint64_t v49 = v22;
        _os_log_impl(&dword_1D9A2D000, v21, OS_LOG_TYPE_ERROR, "%{public}@ Failed adding downloads to store queue - error:%{public}@", v46, 0x16u);
      }

      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v23 = v32;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v33 objects:v45 count:16];
      if (v24)
      {
        uint64_t v25 = *(void *)v34;
        do
        {
          for (uint64_t j = 0; j != v24; ++j)
          {
            if (*(void *)v34 != v25) {
              objc_enumerationMutation(v23);
            }
            uint64_t v27 = self->_assetsByStoreID;
            uint64_t v28 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * j), "persistentIdentifier"));
            v29 = [(NSMutableDictionary *)v27 objectForKey:v28];

            [(ATStoreAssetLink *)self _finishAsset:v29 error:*(void *)(*(void *)&buf[8] + 40) retryable:1];
          }
          uint64_t v24 = [v23 countByEnumeratingWithState:&v33 objects:v45 count:16];
        }
        while (v24);
      }
    }
    _Block_object_dispose(buf, 8);
  }
}

void __35__ATStoreAssetLink__enqueueAssets___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_dataClassForStoreKind:(id)a3
{
  id v3 = a3;
  if (_dataClassForStoreKind__onceToken != -1) {
    dispatch_once(&_dataClassForStoreKind__onceToken, &__block_literal_global_64);
  }
  id v4 = [(id)_dataClassForStoreKind__dataClassByKind objectForKeyedSubscript:v3];
  if (!v4) {
    ATStoreAssetLinkRaiseWithSerialABCReport(@"Unknown dataclass for kind %@", v3);
  }

  return v4;
}

uint64_t __43__ATStoreAssetLink__dataClassForStoreKind___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = (void *)_dataClassForStoreKind__dataClassByKind;
  _dataClassForStoreKind__dataClassByKind = (uint64_t)v0;

  [(id)_dataClassForStoreKind__dataClassByKind setObject:@"Application" forKeyedSubscript:*MEMORY[0x1E4FA84B8]];
  [(id)_dataClassForStoreKind__dataClassByKind setObject:@"Book" forKeyedSubscript:*MEMORY[0x1E4FA8480]];
  [(id)_dataClassForStoreKind__dataClassByKind setObject:@"Media" forKeyedSubscript:*MEMORY[0x1E4FA8470]];
  [(id)_dataClassForStoreKind__dataClassByKind setObject:@"Media" forKeyedSubscript:*MEMORY[0x1E4FA8488]];
  [(id)_dataClassForStoreKind__dataClassByKind setObject:@"Media" forKeyedSubscript:*MEMORY[0x1E4FA8498]];
  [(id)_dataClassForStoreKind__dataClassByKind setObject:@"Media" forKeyedSubscript:*MEMORY[0x1E4FA84A0]];
  [(id)_dataClassForStoreKind__dataClassByKind setObject:@"Media" forKeyedSubscript:*MEMORY[0x1E4FA84C8]];
  [(id)_dataClassForStoreKind__dataClassByKind setObject:@"Media" forKeyedSubscript:*MEMORY[0x1E4FA84D8]];
  v2 = (void *)_dataClassForStoreKind__dataClassByKind;
  uint64_t v3 = *MEMORY[0x1E4FA84A8];

  return [v2 setObject:@"Media" forKeyedSubscript:v3];
}

- (id)_assetTypeForStoreKind:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (_assetTypeForStoreKind__onceToken != -1) {
    dispatch_once(&_assetTypeForStoreKind__onceToken, &__block_literal_global_626);
  }
  id v4 = [(id)_assetTypeForStoreKind__assetTypeByStoreKind objectForKeyedSubscript:v3];
  if (!v4)
  {
    uint64_t v5 = _ATLogCategoryStoreDownloads();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543618;
      id v8 = v3;
      __int16 v9 = 2114;
      uint64_t v10 = @"Unknown";
      _os_log_impl(&dword_1D9A2D000, v5, OS_LOG_TYPE_DEFAULT, "Could not find matching assetType for storeKind=%{public}@, setting assetType=%{public}@", (uint8_t *)&v7, 0x16u);
    }

    id v4 = @"Unknown";
  }

  return v4;
}

uint64_t __43__ATStoreAssetLink__assetTypeForStoreKind___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = (void *)_assetTypeForStoreKind__assetTypeByStoreKind;
  _assetTypeForStoreKind__assetTypeByStoreKind = (uint64_t)v0;

  [(id)_assetTypeForStoreKind__assetTypeByStoreKind setObject:@"Audiobook" forKeyedSubscript:*MEMORY[0x1E4FA8470]];
  [(id)_assetTypeForStoreKind__assetTypeByStoreKind setObject:@"Movie" forKeyedSubscript:*MEMORY[0x1E4FA8488]];
  [(id)_assetTypeForStoreKind__assetTypeByStoreKind setObject:@"Music" forKeyedSubscript:*MEMORY[0x1E4FA8498]];
  [(id)_assetTypeForStoreKind__assetTypeByStoreKind setObject:@"MusicVideo" forKeyedSubscript:*MEMORY[0x1E4FA84A0]];
  uint64_t v2 = *MEMORY[0x1E4FA84A8];
  [(id)_assetTypeForStoreKind__assetTypeByStoreKind setObject:@"Podcast" forKeyedSubscript:*MEMORY[0x1E4FA84A8]];
  [(id)_assetTypeForStoreKind__assetTypeByStoreKind setObject:@"TVEpisode" forKeyedSubscript:*MEMORY[0x1E4FA84C8]];
  uint64_t v3 = *MEMORY[0x1E4FA84D8];
  [(id)_assetTypeForStoreKind__assetTypeByStoreKind setObject:@"VideoPodcast" forKeyedSubscript:*MEMORY[0x1E4FA84D8]];
  [(id)_assetTypeForStoreKind__assetTypeByStoreKind setObject:@"iTunesU" forKeyedSubscript:v2];
  [(id)_assetTypeForStoreKind__assetTypeByStoreKind setObject:@"iTunesUVideo" forKeyedSubscript:v3];
  id v4 = (void *)_assetTypeForStoreKind__assetTypeByStoreKind;
  uint64_t v5 = *MEMORY[0x1E4FA84B8];

  return [v4 setObject:@"Application" forKeyedSubscript:v5];
}

- (id)_storeKindForAsset:(id)a3
{
  uint64_t v3 = [a3 assetType];
  if ([v3 isEqualToString:@"Audiobook"])
  {
    id v4 = (id *)MEMORY[0x1E4FA8470];
LABEL_17:
    id v5 = *v4;
    goto LABEL_18;
  }
  if ([v3 isEqualToString:@"Movie"])
  {
    id v4 = (id *)MEMORY[0x1E4FA8488];
    goto LABEL_17;
  }
  if ([v3 isEqualToString:@"Music"])
  {
    id v4 = (id *)MEMORY[0x1E4FA8498];
    goto LABEL_17;
  }
  if ([v3 isEqualToString:@"MusicVideo"])
  {
    id v4 = (id *)MEMORY[0x1E4FA84A0];
    goto LABEL_17;
  }
  if ([v3 isEqualToString:@"Podcast"])
  {
LABEL_10:
    id v4 = (id *)MEMORY[0x1E4FA84A8];
    goto LABEL_17;
  }
  if ([v3 isEqualToString:@"TVEpisode"])
  {
    id v4 = (id *)MEMORY[0x1E4FA84C8];
    goto LABEL_17;
  }
  if ([v3 isEqualToString:@"VideoPodcast"]) {
    goto LABEL_16;
  }
  if ([v3 isEqualToString:@"iTunesU"]) {
    goto LABEL_10;
  }
  if ([v3 isEqualToString:@"iTunesUVideo"])
  {
LABEL_16:
    id v4 = (id *)MEMORY[0x1E4FA84D8];
    goto LABEL_17;
  }
  id v5 = 0;
LABEL_18:

  return v5;
}

- (void)_finishAsset:(id)a3 error:(id)a4 retryable:(BOOL)a5
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(NSMapTable *)self->_downloadsByAsset objectForKey:v8];
  uint64_t v11 = v10;
  if (v10)
  {
    assetsByStoreID = self->_assetsByStoreID;
    int v13 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v10, "persistentIdentifier"));
    [(NSMutableDictionary *)assetsByStoreID removeObjectForKey:v13];
  }
  [(NSMapTable *)self->_downloadsByAsset removeObjectForKey:v8];
  v14 = [v9 domain];
  if ([v14 isEqualToString:*MEMORY[0x1E4FA8920]])
  {
    uint64_t v15 = [v9 code];

    int v16 = v9;
    if (v15 == 2040)
    {
      uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v37 = *MEMORY[0x1E4F28A50];
      v38[0] = v9;
      dispatch_semaphore_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];
      int v16 = [v17 errorWithDomain:@"ATError" code:26 userInfo:v18];
    }
  }
  else
  {

    int v16 = v9;
  }
  v19 = [v9 domain];
  if ([v19 isEqualToString:*MEMORY[0x1E4FA8678]])
  {
    uint64_t v20 = [v9 code];

    if (v20 != 103) {
      goto LABEL_11;
    }
    v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v35 = *MEMORY[0x1E4F28A50];
    id v36 = v9;
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    uint64_t v22 = [v21 errorWithDomain:@"ATError" code:14 userInfo:v19];

    int v16 = (void *)v22;
  }

LABEL_11:
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__ATStoreAssetLink__finishAsset_error_retryable___block_invoke;
  block[3] = &unk_1E6B87C88;
  id v24 = v8;
  id v31 = v24;
  uint64_t v32 = self;
  id v25 = v16;
  id v33 = v25;
  BOOL v34 = a5;
  dispatch_async(callbackQueue, block);
  if (v9)
  {
    ATReportEventIncrementingScalarKey();
    __int16 v26 = [v25 domain];
    int v27 = [v26 isEqualToString:@"ATError"];

    if (v27)
    {
      uint64_t v28 = [v25 code];
      if (v28 == 8 || v28 == 4 || v28 == 2) {
        ATReportEventIncrementingScalarKey();
      }
    }
  }
  else
  {
    ATReportEventIncrementingScalarKey();
    [v24 transferStartTime];
    if (v29 != 0.0)
    {
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      [v24 transferStartTime];
      ATReportEventAddDoubleToScalarKey();
    }
  }
}

void __49__ATStoreAssetLink__finishAsset_error_retryable___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 56));
    [WeakRetained assetLink:*(void *)(a1 + 40) didFinishAsset:*(void *)(a1 + 32) error:*(void *)(a1 + 48) retryable:*(unsigned __int8 *)(a1 + 56)];
  }
}

- (void)_updateInstallProgress:(double)a3 forAsset:(id)a4
{
  id v6 = a4;
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__ATStoreAssetLink__updateInstallProgress_forAsset___block_invoke;
  block[3] = &unk_1E6B88728;
  id v10 = v6;
  uint64_t v11 = self;
  double v12 = a3;
  id v8 = v6;
  dispatch_async(callbackQueue, block);
}

void __52__ATStoreAssetLink__updateInstallProgress_forAsset___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 56));
    [WeakRetained assetLink:*(void *)(a1 + 40) didUpdateAsset:*(void *)(a1 + 32) progress:*(double *)(a1 + 48)];
  }
}

- (void)downloadManager:(id)a3 downloadStatesDidChange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__ATStoreAssetLink_downloadManager_downloadStatesDidChange___block_invoke;
  block[3] = &unk_1E6B88BB8;
  id v12 = v7;
  int v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

void __60__ATStoreAssetLink_downloadManager_downloadStatesDidChange___block_invoke(id *a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  double v29 = [MEMORY[0x1E4F1CA48] array];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obuint64_t j = a1[4];
  uint64_t v2 = [obj countByEnumeratingWithState:&v31 objects:v42 count:16];
  if (v2)
  {
    uint64_t v4 = v2;
    uint64_t v30 = *(void *)v32;
    uint64_t v5 = *MEMORY[0x1E4FA8508];
    uint64_t v27 = *MEMORY[0x1E4FA8500];
    uint64_t v26 = *MEMORY[0x1E4FA84E0];
    uint64_t v25 = *MEMORY[0x1E4FA8518];
    *(void *)&long long v3 = 134218498;
    long long v24 = v3;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v32 != v30) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        id v8 = objc_msgSend(v7, "downloadPhaseIdentifier", v24);
        uint64_t v9 = [v7 persistentIdentifier];
        id v10 = (void *)*((void *)a1[5] + 2);
        uint64_t v11 = [NSNumber numberWithLongLong:v9];
        id v12 = [v10 objectForKey:v11];

        int v13 = [v8 isEqualToString:v5];
        if (v12)
        {
          if (v13)
          {
            [v29 addObject:v7];
            id v14 = _ATLogCategoryStoreDownloads();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218242;
              uint64_t v37 = v9;
              __int16 v38 = 2114;
              id v39 = v12;
              _os_log_impl(&dword_1D9A2D000, v14, OS_LOG_TYPE_DEFAULT, "Got finished asset %lld, %{public}@", buf, 0x16u);
            }

            [a1[5] _finishAsset:v12 error:0 retryable:1];
          }
          else if ([v8 isEqualToString:v27])
          {
            [v29 addObject:v7];
            uint64_t v15 = [v7 failureError];
            if (!v15)
            {
              uint64_t v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:0 userInfo:0];
            }
            int v16 = _ATLogCategoryStoreDownloads();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v24;
              uint64_t v37 = v9;
              __int16 v38 = 2114;
              id v39 = v12;
              __int16 v40 = 2114;
              long long v41 = v15;
              _os_log_impl(&dword_1D9A2D000, v16, OS_LOG_TYPE_DEFAULT, "Got failed asset %lld, %{public}@ with download error %{public}@", buf, 0x20u);
            }

            [a1[5] _finishAsset:v12 error:v15 retryable:1];
          }
          else if ([v8 isEqualToString:v26])
          {
            [v29 addObject:v7];
            uint64_t v17 = _ATLogCategoryStoreDownloads();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218242;
              uint64_t v37 = v9;
              __int16 v38 = 2114;
              id v39 = v12;
              _os_log_impl(&dword_1D9A2D000, v17, OS_LOG_TYPE_DEFAULT, "Got canceled asset %lld, %{public}@", buf, 0x16u);
            }

            id v18 = a1[5];
            v19 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:2 userInfo:0];
            [v18 _finishAsset:v12 error:v19 retryable:1];
          }
          else if ([v8 isEqualToString:v25])
          {
            [v12 setInstallStarted:1];
            [v12 setInstalled:1];
            if ([v12 assetState] != 1)
            {
              [v12 setAssetState:1];
              id WeakRetained = objc_loadWeakRetained((id *)a1[5] + 7);
              id v21 = a1[5];
              uint64_t v35 = v12;
              uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
              [WeakRetained assetLink:v21 didTransitionAssetStates:v22];
            }
            id v23 = a1[5];
            [v7 percentComplete];
            objc_msgSend(v23, "_updateInstallProgress:forAsset:", v12);
          }
        }
        else if ((v13 & 1) != 0 {
               || ([v8 isEqualToString:v27] & 1) != 0
        }
               || [v8 isEqualToString:v26])
        {
          [v29 addObject:v7];
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v31 objects:v42 count:16];
    }
    while (v4);
  }

  [a1[6] finishDownloads:v29];
}

- (unint64_t)priority
{
  return 50;
}

- (BOOL)linkIsReady
{
  return 1;
}

- (unint64_t)maximumBatchSize
{
  return -1;
}

- (void)prioritizeAsset:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _ATLogCategoryStoreDownloads();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v11 = self;
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl(&dword_1D9A2D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Prioritize %{public}@", buf, 0x16u);
  }

  id v6 = [(NSMapTable *)self->_downloadsByAsset objectForKey:v4];
  if (v6)
  {
    [v4 setIsPrioritized:1];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __36__ATStoreAssetLink_prioritizeAsset___block_invoke;
    v8[3] = &unk_1E6B88BE0;
    v8[4] = self;
    id v9 = v6;
    [v9 prioritizeAboveDownload:0 completionBlock:v8];
  }
  else
  {
    id v7 = _ATLogCategoryStoreDownloads();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v11 = self;
      __int16 v12 = 2114;
      id v13 = v4;
      _os_log_impl(&dword_1D9A2D000, v7, OS_LOG_TYPE_INFO, "%{public}@ Could not find download to prioritize for %{public}@", buf, 0x16u);
    }
  }
}

void __36__ATStoreAssetLink_prioritizeAsset___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = _ATLogCategoryStoreDownloads();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      int v7 = 138543874;
      uint64_t v8 = v5;
      __int16 v9 = 2114;
      uint64_t v10 = v6;
      __int16 v11 = 2114;
      id v12 = v3;
      _os_log_impl(&dword_1D9A2D000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Could not prioritize %{public}@: %{public}@", (uint8_t *)&v7, 0x20u);
    }
  }
}

- (void)cancelAssets:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__ATStoreAssetLink_cancelAssets___block_invoke;
  v7[3] = &unk_1E6B88B68;
  id v8 = v4;
  __int16 v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __33__ATStoreAssetLink_cancelAssets___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [*(id *)(*(void *)(a1 + 40) + 24) objectForKey:*(void *)(*((void *)&v15 + 1) + 8 * v7)];
        if (v8) {
          [v2 addObject:v8];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v25 count:16];
    }
    while (v5);
  }

  if ([v2 count])
  {
    __int16 v9 = _ATLogCategoryStoreDownloads();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      int v11 = [v2 count];
      *(_DWORD *)buf = 138543874;
      uint64_t v20 = v10;
      __int16 v21 = 1024;
      int v22 = v11;
      __int16 v23 = 2114;
      long long v24 = v2;
      _os_log_impl(&dword_1D9A2D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Canceling %d downloads with store %{public}@", buf, 0x1Cu);
    }

    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = *(void **)(v12 + 8);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __33__ATStoreAssetLink_cancelAssets___block_invoke_37;
    v14[3] = &unk_1E6B88AF0;
    v14[4] = v12;
    [v13 cancelDownloads:v2 completionBlock:v14];
  }
}

void __33__ATStoreAssetLink_cancelAssets___block_invoke_37(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = _ATLogCategoryStoreDownloads();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138543618;
      uint64_t v7 = v5;
      __int16 v8 = 2114;
      id v9 = v3;
      _os_log_impl(&dword_1D9A2D000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Cancel failed with error: %{public}@", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (BOOL)canEnqueueAsset:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([v4 bypassStore] & 1) == 0)
  {
    if ([v4 isDownload])
    {
      uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"Application", @"Book", @"Media", 0);
      int v6 = [v4 dataclass];
      int v7 = [v5 containsObject:v6];

      if (v7)
      {
        __int16 v8 = [v4 dataclass];
        char v9 = [v8 isEqualToString:@"Application"];

        if ((v9 & 1) == 0)
        {
          if (!_os_feature_enabled_impl()) {
            goto LABEL_9;
          }
          uint64_t v10 = [v4 dataclass];
          char v11 = [v10 isEqualToString:@"Book"];

          if ((v11 & 1) == 0)
          {
            if (!_os_feature_enabled_impl()
              || ([v4 assetType],
                  uint64_t v12 = objc_claimAutoreleasedReturnValue(),
                  char v13 = [v12 isEqualToString:@"Audiobook"],
                  v12,
                  (v13 & 1) == 0))
            {
LABEL_9:
              uint64_t v14 = [v4 dataclass];
              int v15 = [v14 isEqualToString:@"Media"];

              if (!v15) {
                goto LABEL_20;
              }
              if ([v4 isRestore])
              {
                long long v16 = [v4 assetType];
                if ([v16 isEqualToString:@"Music"])
                {

                  goto LABEL_14;
                }
                long long v17 = [v4 assetType];
                int v18 = [v17 isEqualToString:@"MusicVideo"];

                if (v18)
                {
LABEL_14:
                  v19 = [v4 storeInfo];
                  uint64_t v20 = [v19 endpointType];
                  unint64_t v21 = [v20 integerValue];

                  if (v21 <= 1)
                  {
                    int v22 = [MEMORY[0x1E4FB87B8] activeAccount];
                    __int16 v23 = [MEMORY[0x1E4FB87C0] defaultIdentityStore];
                    id v35 = 0;
                    id v24 = [v23 DSIDForUserIdentity:v22 outError:&v35];
                    id v25 = v35;

                    uint64_t v26 = [v4 storeInfo];
                    uint64_t v27 = [v26 DSID];

                    id v28 = v27;
                    if (v24 == v28)
                    {
                    }
                    else
                    {
                      int v29 = [v24 isEqual:v28];

                      if (!v29)
                      {
                        BOOL v30 = 1;
LABEL_28:

                        goto LABEL_19;
                      }
                    }
                    long long v32 = _ATLogCategoryStoreDownloads();
                    long long v33 = v32;
                    if (v25)
                    {
                      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                      {
                        long long v34 = objc_msgSend(v25, "msv_description");
                        *(_DWORD *)buf = 138543874;
                        uint64_t v37 = self;
                        __int16 v38 = 2114;
                        id v39 = v4;
                        __int16 v40 = 2114;
                        long long v41 = v34;
                        _os_log_impl(&dword_1D9A2D000, v33, OS_LOG_TYPE_ERROR, "%{public}@ Could not get DSID for active account. (asset=%{public}@) error=%{public}@", buf, 0x20u);
                      }
                    }
                    else if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138543618;
                      uint64_t v37 = self;
                      __int16 v38 = 2114;
                      id v39 = v4;
                      _os_log_impl(&dword_1D9A2D000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@ Could not get DSID for active account. (asset=%{public}@)", buf, 0x16u);
                    }

                    BOOL v30 = 0;
                    goto LABEL_28;
                  }
                  goto LABEL_18;
                }
LABEL_20:
                BOOL v30 = 1;
                goto LABEL_19;
              }
            }
          }
        }
      }
    }
  }
LABEL_18:
  BOOL v30 = 0;
LABEL_19:

  return v30;
}

- (id)enqueueAssets:(id)a3 force:(BOOL)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  uint64_t v20 = __Block_byref_object_dispose_;
  id v21 = (id)objc_opt_new();
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40__ATStoreAssetLink_enqueueAssets_force___block_invoke;
  v11[3] = &unk_1E6B879A8;
  id v12 = v6;
  char v13 = self;
  uint64_t v14 = &v16;
  BOOL v15 = a4;
  id v8 = v6;
  dispatch_sync(queue, v11);
  id v9 = (id)v17[5];

  _Block_object_dispose(&v16, 8);

  return v9;
}

void __40__ATStoreAssetLink_enqueueAssets_force___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_opt_new();
  id v21 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v3 = [obj countByEnumeratingWithState:&v23 objects:v35 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v24 != v5) {
          objc_enumerationMutation(obj);
        }
        int v7 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v8 = [v7 dataclass];
        if ([v8 isEqualToString:@"Media"])
        {
          id v9 = [v7 assetType];
          int v10 = [v9 isEqualToString:@"Podcast"];
        }
        else
        {
          int v10 = 0;
        }

        char v11 = [*(id *)(*(void *)(a1 + 40) + 24) objectForKey:v7];
        if (v11)
        {
          id v12 = _ATLogCategoryStoreDownloads();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v13 = *(void *)(a1 + 40);
            uint64_t v14 = [v11 downloadPhaseIdentifier];
            *(_DWORD *)buf = 138544130;
            uint64_t v28 = v13;
            __int16 v29 = 2114;
            BOOL v30 = v11;
            __int16 v31 = 2114;
            long long v32 = v14;
            __int16 v33 = 2114;
            long long v34 = v7;
            _os_log_impl(&dword_1D9A2D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Matched enqueued download %{public}@ (%{public}@) for %{public}@", buf, 0x2Au);
          }
          [*(id *)(*(void *)(a1 + 40) + 24) removeObjectForKey:v7];
          [*(id *)(*(void *)(a1 + 40) + 24) setObject:v11 forKey:v7];
          BOOL v15 = *(void **)(*(void *)(a1 + 40) + 16);
          uint64_t v16 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v11, "persistentIdentifier"));
          [v15 setObject:v7 forKey:v16];

          [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v7];
          long long v17 = v2;
          uint64_t v18 = v11;
          goto LABEL_19;
        }
        if (v10) {
          unint64_t v19 = 100;
        }
        else {
          unint64_t v19 = 3;
        }
        uint64_t v20 = [*(id *)(*(void *)(a1 + 40) + 16) count];
        if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count] + v20 < v19
          || *(unsigned char *)(a1 + 56))
        {
          [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v7];
          long long v17 = v21;
          uint64_t v18 = v7;
LABEL_19:
          [v17 addObject:v18];
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v23 objects:v35 count:16];
    }
    while (v4);
  }

  if ([v2 count]) {
    [*(id *)(a1 + 40) downloadManager:*(void *)(*(void *)(a1 + 40) + 8) downloadStatesDidChange:v2];
  }
  [*(id *)(a1 + 40) _enqueueAssets:v21];
}

- (void)close
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__ATStoreAssetLink_close__block_invoke;
  block[3] = &unk_1E6B88B40;
  void block[4] = self;
  dispatch_sync(queue, block);
}

void __25__ATStoreAssetLink_close__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 48))
  {
    *(unsigned char *)(v1 + 48) = 0;
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "removeObserver:");
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(NSObject **)(v3 + 40);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __25__ATStoreAssetLink_close__block_invoke_2;
    block[3] = &unk_1E6B88B40;
    void block[4] = v3;
    dispatch_async(v4, block);
  }
}

void __25__ATStoreAssetLink_close__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 assetLink:*(void *)(a1 + 32) didCloseWithOutstandingAssets:0];
}

- (BOOL)open
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__ATStoreAssetLink_open__block_invoke;
  block[3] = &unk_1E6B88B40;
  void block[4] = self;
  dispatch_sync(queue, block);
  return 1;
}

void __24__ATStoreAssetLink_open__block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 48))
  {
    *(unsigned char *)(v1 + 48) = 1;
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "addObserver:");
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    obuint64_t j = [*(id *)(*(void *)(a1 + 32) + 8) downloads];
    uint64_t v4 = [obj countByEnumeratingWithState:&v29 objects:v40 count:16];
    if (!v4) {
      goto LABEL_20;
    }
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v30;
    uint64_t v25 = *MEMORY[0x1E4FA8508];
    uint64_t v24 = *MEMORY[0x1E4FA8500];
    uint64_t v23 = *MEMORY[0x1E4FA84E0];
    while (1)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v30 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v9 = _ATLogCategoryStoreDownloads();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = *(void *)(a1 + 32);
          char v11 = [v8 downloadPhaseIdentifier];
          *(_DWORD *)buf = 138543874;
          uint64_t v35 = v10;
          __int16 v36 = 2114;
          uint64_t v37 = v8;
          __int16 v38 = 2114;
          id v39 = v11;
          _os_log_impl(&dword_1D9A2D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Found existing download: %{public}@ (%{public}@)", buf, 0x20u);
        }
        id v12 = [*(id *)(a1 + 32) _assetForDownload:v8];
        uint64_t v13 = [v12 dataclass];
        if (![v13 isEqualToString:@"Media"])
        {

LABEL_17:
          [*(id *)(*(void *)(a1 + 32) + 24) setObject:v8 forKey:v12];
          uint64_t v18 = *(void **)(*(void *)(a1 + 32) + 16);
          unint64_t v19 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v8, "persistentIdentifier"));
          [v18 setObject:v12 forKey:v19];

          [v3 addObject:v12];
          goto LABEL_18;
        }
        char v14 = [v12 isRestore];

        if (v14) {
          goto LABEL_17;
        }
        BOOL v15 = [v8 downloadPhaseIdentifier];
        if (([v15 isEqualToString:v25] & 1) != 0
          || ([v15 isEqualToString:v24] & 1) != 0
          || [v15 isEqualToString:v23])
        {
          uint64_t v16 = *(void **)(*(void *)(a1 + 32) + 8);
          __int16 v33 = v8;
          long long v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
          [v16 finishDownloads:v17];
        }
LABEL_18:
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v29 objects:v40 count:16];
      if (!v5)
      {
LABEL_20:

        uint64_t v20 = *(void *)(a1 + 32);
        id v21 = *(NSObject **)(v20 + 40);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __24__ATStoreAssetLink_open__block_invoke_11;
        block[3] = &unk_1E6B88B68;
        void block[4] = v20;
        id v28 = v3;
        id v22 = v3;
        dispatch_async(v21, block);

        return;
      }
    }
  }
}

void __24__ATStoreAssetLink_open__block_invoke_11(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) allObjects];
  [v4 assetLink:v2 didOpenWithPendingAssets:v3];
}

- (id)downloadManager
{
  return self->_downloadManager;
}

- (ATStoreAssetLink)init
{
  v19.receiver = self;
  v19.super_class = (Class)ATStoreAssetLink;
  uint64_t v2 = [(ATStoreAssetLink *)&v19 init];
  if (v2)
  {
    id v3 = (objc_class *)objc_opt_class();
    Name = class_getName(v3);
    dispatch_queue_t v5 = dispatch_queue_create(Name, 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.atc.storelink.callback", MEMORY[0x1E4F14430]);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:100];
    assetsByStoreID = v2->_assetsByStoreID;
    v2->_assetsByStoreID = (NSMutableDictionary *)v9;

    uint64_t v11 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    downloadsByAsset = v2->_downloadsByAsset;
    v2->_downloadsByAsset = (NSMapTable *)v11;

    id v13 = objc_alloc_init(MEMORY[0x1E4FA8180]);
    char v14 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4FA8470], *MEMORY[0x1E4FA8480], *MEMORY[0x1E4FA8488], *MEMORY[0x1E4FA8498], *MEMORY[0x1E4FA84A0], *MEMORY[0x1E4FA84A8], *MEMORY[0x1E4FA84B0], *MEMORY[0x1E4FA84C8], *MEMORY[0x1E4FA84D0], *MEMORY[0x1E4FA84D8], 0);
    [v13 setDownloadKinds:v14];

    [v13 setShouldFilterExternalOriginatedDownloads:1];
    [v13 setPersistenceIdentifier:@"com.apple.atc"];
    BOOL v15 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4FA8550], *MEMORY[0x1E4FA85F0], *MEMORY[0x1E4FA8590], 0);
    [v13 setPrefetchedDownloadProperties:v15];

    uint64_t v16 = [objc_alloc(MEMORY[0x1E4FA8168]) initWithManagerOptions:v13];
    downloadManager = v2->_downloadManager;
    v2->_downloadManager = (SSDownloadManager *)v16;
  }
  return v2;
}

@end