@interface MPCModelGenericAVItemLocalFileLoadOperation
- (BOOL)requirePreferredAssetQuality;
- (MPCAssetLoadPropertiesLocalFileEvaluation)fileAssetEvaluation;
- (MPCModelGenericAVItemAssetLoadProperties)assetLoadProperties;
- (MPCModelGenericAVItemLocalFileLoadOperation)initWithEvaluation:(id)a3 properties:(id)a4;
- (id)responseHandler;
- (void)execute;
- (void)setRequirePreferredAssetQuality:(BOOL)a3;
- (void)setResponseHandler:(id)a3;
@end

@implementation MPCModelGenericAVItemLocalFileLoadOperation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_fileAssetEvaluation, 0);

  objc_storeStrong((id *)&self->_assetLoadProperties, 0);
}

- (void)setResponseHandler:(id)a3
{
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setRequirePreferredAssetQuality:(BOOL)a3
{
  self->_requirePreferredAssetQuality = a3;
}

- (BOOL)requirePreferredAssetQuality
{
  return self->_requirePreferredAssetQuality;
}

- (MPCAssetLoadPropertiesLocalFileEvaluation)fileAssetEvaluation
{
  return self->_fileAssetEvaluation;
}

- (MPCModelGenericAVItemAssetLoadProperties)assetLoadProperties
{
  return self->_assetLoadProperties;
}

- (void)execute
{
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__MPCModelGenericAVItemLocalFileLoadOperation_execute__block_invoke;
  aBlock[3] = &unk_2643C54E0;
  aBlock[4] = self;
  v3 = (void (**)(void *, void, id))_Block_copy(aBlock);
  v4 = [(MPCModelGenericAVItemLocalFileLoadOperation *)self assetLoadProperties];
  v5 = [(MPCModelGenericAVItemLocalFileLoadOperation *)self fileAssetEvaluation];
  if ([v5 fileIsValid])
  {
LABEL_2:
    v6 = [v5 fileAsset];
    if (([v5 fileMatchesRequiredQuality] & 1) == 0
      && (([v5 fileMatchesRequiredQuality] & 1) != 0 || self->_requirePreferredAssetQuality))
    {
      id v10 = [MEMORY[0x263F087E8] errorWithDomain:@"MPCError" code:21 userInfo:0];
      v3[2](v3, 0, v10);
    }
    else
    {
      v7 = [v6 filePath];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __54__MPCModelGenericAVItemLocalFileLoadOperation_execute__block_invoke_2;
      v17[3] = &unk_2643BFC90;
      id v18 = v7;
      id v19 = v5;
      id v8 = v6;
      id v20 = v8;
      v21 = self;
      id v9 = v4;
      id v22 = v9;
      v23 = v3;
      id v10 = v7;
      v11 = _Block_copy(v17);
      v12 = [v9 itemIdentifiers];
      v13 = (void *)[objc_alloc(MEMORY[0x263F120A8]) initWithFileAsset:v8 sourceItemIdentifiers:v12];
      [v13 setFileAsset:v8];
      [v13 setSourceItemIdentifiers:v12];
      [v13 performWithResponseHandler:v11];
    }
  }
  else
  {
    switch([v5 status])
    {
      case 0:
      case 2:
      case 5:
      case 6:
        v14 = (void *)MEMORY[0x263F087E8];
        uint64_t v15 = 24;
        break;
      case 3:
        v14 = (void *)MEMORY[0x263F087E8];
        uint64_t v15 = 20;
        break;
      case 4:
        v14 = (void *)MEMORY[0x263F087E8];
        uint64_t v15 = 22;
        break;
      case 7:
        if (self->_requirePreferredAssetQuality)
        {
          v16 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 24, @"File asset not usable for vocal attenuation [HLS file]");
          v3[2](v3, 0, v16);
        }
        goto LABEL_2;
      default:
        goto LABEL_2;
    }
    v6 = [v14 errorWithDomain:@"MPCError" code:v15 userInfo:0];
    v3[2](v3, 0, v6);
  }
}

void __54__MPCModelGenericAVItemLocalFileLoadOperation_execute__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v6 = *(void **)(a1 + 32);
  uint64_t v7 = v6[37];
  id v10 = v5;
  if (v7)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(v8 + 296);
    *(void *)(v8 + 296) = 0;

    id v5 = v10;
    v6 = *(void **)(a1 + 32);
  }
  [v6 finishWithError:v5];
}

void __54__MPCModelGenericAVItemLocalFileLoadOperation_execute__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v5 = a3;
  int v6 = 0;
  char v47 = 0;
  if (a2)
  {
    uint64_t v7 = [MEMORY[0x263F08850] defaultManager];
    if ([v7 fileExistsAtPath:*(void *)(a1 + 32) isDirectory:&v47])
    {
      if (v47) {
        int v6 = [*(id *)(a1 + 40) fileIsHLS];
      }
      else {
        int v6 = 1;
      }
    }
    else
    {
      int v6 = 0;
    }
  }
  uint64_t v8 = [*(id *)(a1 + 48) purchaseBundleFilePath];
  id v9 = (void *)v8;
  if (!v6 || !v8)
  {
    v16 = 0;
    if (v6) {
      goto LABEL_30;
    }
LABEL_17:
    v17 = [*(id *)(a1 + 64) assetCacheProvider];
    uint64_t v18 = [*(id *)(a1 + 64) genericObject];
    id v19 = (MPCModelGenericAVItemAssetLoadResult *)v18;
    if (v17 && v18)
    {
      v45[0] = MEMORY[0x263EF8330];
      v45[1] = 3221225472;
      v45[2] = __54__MPCModelGenericAVItemLocalFileLoadOperation_execute__block_invoke_8;
      v45[3] = &unk_2643C5830;
      id v46 = *(id *)(a1 + 72);
      [v17 clearPlaybackAssetCacheFileAssetForGenericObject:v19 withCompletionHandler:v45];
      id v20 = v46;
    }
    else
    {
      uint64_t v21 = *(void *)(a1 + 72);
      id v20 = [MEMORY[0x263F087E8] errorWithDomain:@"MPCError" code:22 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v21 + 16))(v21, 0, v20);
    }
    goto LABEL_42;
  }
  id v10 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithContentsOfFile:v8];
  if ([v10 length])
  {
    v11 = [MEMORY[0x263F08AC0] propertyListWithData:v10 options:0 format:0 error:0];
    if (!_NSIsNSDictionary()
      || ([v11 objectForKeyedSubscript:@"isPlaceholder"],
          v12 = objc_claimAutoreleasedReturnValue(),
          char v13 = [v12 BOOLValue],
          v12,
          (v13 & 1) != 0))
    {
      v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = *(void *)(a1 + 56);
        *(_DWORD *)buf = 138543618;
        uint64_t v49 = v15;
        __int16 v50 = 2114;
        v51 = v9;
        _os_log_impl(&dword_21BB87000, v14, OS_LOG_TYPE_ERROR, "[AL] - %{public}@: Skipping local asset [invalid purchase bundle] purchaseBundlePath=%{public}@", buf, 0x16u);
      }

      v16 = 0;
      goto LABEL_17;
    }
    v24 = v11;
    v16 = v24;
  }
  else
  {
    if ([*(id *)(a1 + 40) fileIsCached])
    {
      if (([*(id *)(a1 + 40) fileIsHLS] & 1) == 0)
      {
        id v22 = [*(id *)(a1 + 64) fileAsset];
        uint64_t v23 = [v22 protectionType];

        if (v23) {
          int v6 = 0;
        }
      }
    }
    v24 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138543874;
      uint64_t v49 = v25;
      __int16 v50 = 2114;
      v51 = v9;
      __int16 v52 = 1024;
      int v53 = v6;
      _os_log_impl(&dword_21BB87000, v24, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: Skipping purchase bundle [data at path has length zero] purchaseBundlePath=%{public}@ isValidAsset=%{BOOL}u", buf, 0x1Cu);
    }
    v16 = 0;
  }

  if (!v6) {
    goto LABEL_17;
  }
LABEL_30:
  v17 = [NSURL fileURLWithPath:*(void *)(a1 + 32) isDirectory:0];
  id v19 = objc_alloc_init(MPCModelGenericAVItemAssetLoadResult);
  [(MPCModelGenericAVItemAssetLoadResult *)v19 setAssetURL:v17];
  v26 = [v17 pathExtension];
  [(MPCModelGenericAVItemAssetLoadResult *)v19 setAssetPathExtension:v26];

  -[MPCModelGenericAVItemAssetLoadResult setAssetQualityType:](v19, "setAssetQualityType:", [*(id *)(a1 + 48) qualityType]);
  [(MPCModelGenericAVItemAssetLoadResult *)v19 setPurchaseBundleDictionary:v16];
  -[MPCModelGenericAVItemAssetLoadResult setIsHLSAsset:](v19, "setIsHLSAsset:", [*(id *)(a1 + 40) fileIsHLS]);
  v27 = NSURL;
  v28 = [*(id *)(a1 + 48) hlsKeyServerURL];
  v29 = [v27 URLWithString:v28];
  [(MPCModelGenericAVItemAssetLoadResult *)v19 setStreamingKeyServerURL:v29];

  v30 = NSURL;
  v31 = [*(id *)(a1 + 48) hlsKeyCertificateURL];
  v32 = [v30 URLWithString:v31];
  [(MPCModelGenericAVItemAssetLoadResult *)v19 setStreamingKeyCertificateURL:v32];

  v33 = [*(id *)(a1 + 48) hlsKeyServerProtocol];
  [(MPCModelGenericAVItemAssetLoadResult *)v19 setKeyServerProtocolType:v33];

  -[MPCModelGenericAVItemAssetLoadResult setAudioAssetType:](v19, "setAudioAssetType:", [*(id *)(a1 + 40) fileAssetType]);
  -[MPCModelGenericAVItemAssetLoadResult setDownloadedAsset:](v19, "setDownloadedAsset:", [*(id *)(a1 + 40) fileIsDownloaded]);
  [(MPCModelGenericAVItemAssetLoadResult *)v19 setSource:1];
  int v34 = [*(id *)(a1 + 40) fileIsHLS];
  v35 = *(void **)(a1 + 48);
  if (v34)
  {
    v36 = [v35 hlsKeyServerProtocol];
    if ([v36 isEqualToString:*MEMORY[0x263F11C90]]) {
      uint64_t v37 = 2;
    }
    else {
      uint64_t v37 = [*(id *)(a1 + 48) protectionType];
    }
  }
  else
  {
    uint64_t v37 = [v35 protectionType];
  }
  [(MPCModelGenericAVItemAssetLoadResult *)v19 setAssetProtectionType:v37];
  v38 = [*(id *)(a1 + 64) genericObject];
  id v20 = [v38 identifiers];

  v39 = [v20 universalStore];
  uint64_t v40 = [v39 assetAdamID];

  if (v40) {
    goto LABEL_40;
  }
  v41 = [v20 universalStore];
  uint64_t v40 = [v41 subscriptionAdamID];

  if (v40) {
    goto LABEL_40;
  }
  v42 = [v20 universalStore];
  uint64_t v40 = [v42 adamID];

  if (v40
    || ([v20 universalStore],
        v43 = objc_claimAutoreleasedReturnValue(),
        uint64_t v40 = [v43 reportingAdamID],
        v43,
        v40))
  {
LABEL_40:
    v44 = [NSNumber numberWithLongLong:v40];
    [(MPCModelGenericAVItemAssetLoadResult *)v19 setStreamingKeyAdamID:v44];
  }
  (*(void (**)(void, MPCModelGenericAVItemAssetLoadResult *, void))(*(void *)(a1 + 72) + 16))(*(void *)(a1 + 72), v19, 0);
LABEL_42:
}

void __54__MPCModelGenericAVItemLocalFileLoadOperation_execute__block_invoke_8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:@"MPCError" code:22 userInfo:0];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (MPCModelGenericAVItemLocalFileLoadOperation)initWithEvaluation:(id)a3 properties:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MPCModelGenericAVItemLocalFileLoadOperation;
  id v9 = [(MPAsyncOperation *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fileAssetEvaluation, a3);
    objc_storeStrong((id *)&v10->_assetLoadProperties, a4);
  }

  return v10;
}

@end