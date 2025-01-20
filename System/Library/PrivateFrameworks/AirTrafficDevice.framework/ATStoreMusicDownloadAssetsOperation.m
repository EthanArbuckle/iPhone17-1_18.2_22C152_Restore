@interface ATStoreMusicDownloadAssetsOperation
- (unint64_t)_maximumSampleRateForResolutionPreference:(int64_t)a3;
- (unint64_t)_minimumBitrateForResolutionPreference:(int64_t)a3;
- (void)_getStorageSpaceAvailableForMediaResponseItem:(id)a3 completion:(id)a4;
- (void)cancel;
- (void)execute;
- (void)finishWithError:(id)a3 operationResult:(id)a4;
@end

@implementation ATStoreMusicDownloadAssetsOperation

- (void).cxx_destruct
{
}

- (unint64_t)_maximumSampleRateForResolutionPreference:(int64_t)a3
{
  if (a3 == 48000) {
    unint64_t v3 = 48000;
  }
  else {
    unint64_t v3 = 0;
  }
  if (a3 == 192000) {
    return 192000;
  }
  else {
    return v3;
  }
}

- (unint64_t)_minimumBitrateForResolutionPreference:(int64_t)a3
{
  unint64_t result = a3;
  if (a3 <= 255)
  {
    if (a3 && a3 != 64) {
      return 256;
    }
  }
  else if (a3 != 256)
  {
    if (a3 != 192000) {
      return 256;
    }
    return 512;
  }
  return result;
}

- (void)_getStorageSpaceAvailableForMediaResponseItem:(id)a3 completion:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, uint64_t))a4;
  v7 = [MEMORY[0x1E4FB8608] currentDeviceInfo];
  int v8 = [v7 isWatch];

  if (v8)
  {
    v9 = [MEMORY[0x1E4FB8720] sharedManager];
    v6[2](v6, [v9 storageSpaceAvailable]);
  }
  else
  {
    v9 = [v5 downloadableAsset];
    uint64_t v10 = [v9 fileSize];
    v11 = [MEMORY[0x1E4FB8720] sharedManager];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __96__ATStoreMusicDownloadAssetsOperation__getStorageSpaceAvailableForMediaResponseItem_completion___block_invoke;
    v12[3] = &unk_1E6B88CA8;
    v13 = v6;
    [v11 ensureStorageIsAvailable:v10 withCompletionHandler:v12];
  }
}

uint64_t __96__ATStoreMusicDownloadAssetsOperation__getStorageSpaceAvailableForMediaResponseItem_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)finishWithError:(id)a3 operationResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  v9 = v8;
  if (!v8)
  {
    if ([(ATStoreMusicDownloadAssetsOperation *)self isCancelled])
    {
      v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:2 userInfo:0];
    }
    else
    {
      v9 = 0;
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)ATStoreMusicDownloadAssetsOperation;
  [(ATStoreDownloadOperation *)&v11 finishWithError:v9 operationResult:v7];
  assetDownloadRequest = self->_assetDownloadRequest;
  self->_assetDownloadRequest = 0;
}

- (void)cancel
{
  v3.receiver = self;
  v3.super_class = (Class)ATStoreMusicDownloadAssetsOperation;
  [(ATStoreMusicDownloadAssetsOperation *)&v3 cancel];
  [(ICMediaAssetDownloadRequest *)self->_assetDownloadRequest cancel];
}

- (void)execute
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ([(ATStoreMusicDownloadAssetsOperation *)self isCancelled])
  {
    id v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:2 userInfo:0];
    -[ATStoreMusicDownloadAssetsOperation finishWithError:operationResult:](self, "finishWithError:operationResult:");
  }
  else
  {
    objc_super v3 = [(ATStoreDownloadOperation *)self asset];
    v4 = _ATLogCategoryStoreDownloads();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v26 = self;
      __int16 v27 = 2114;
      uint64_t v28 = (uint64_t)v3;
      _os_log_impl(&dword_1D9A2D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ starting download phase for asset %{public}@", buf, 0x16u);
    }

    id v5 = [(ATStoreDownloadAssetsOperation *)self prepareOperationResult];
    id v6 = [v5 requestContext];

    id v7 = [(ATStoreDownloadAssetsOperation *)self prepareOperationResult];
    id v8 = [v7 storeMediaResponseItem];

    v9 = [v8 downloadableAsset];
    uint64_t v10 = [v8 hlsAsset];
    objc_super v11 = v10;
    if (v9
      || ([v10 playlistURL], v12 = objc_claimAutoreleasedReturnValue(), v12, v12))
    {
      uint64_t v13 = [v9 fileSize];
      v14 = _ATLogCategoryStoreDownloads();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v26 = self;
        __int16 v27 = 2048;
        uint64_t v28 = v13;
        _os_log_impl(&dword_1D9A2D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ downloadable asset size=%lld", buf, 0x16u);
      }

      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __46__ATStoreMusicDownloadAssetsOperation_execute__block_invoke;
      v18[3] = &unk_1E6B88908;
      uint64_t v24 = v13;
      v18[4] = self;
      id v19 = v6;
      id v20 = v8;
      id v21 = v3;
      id v22 = v11;
      id v23 = v9;
      [(ATStoreMusicDownloadAssetsOperation *)self _getStorageSpaceAvailableForMediaResponseItem:v20 completion:v18];
    }
    else
    {
      v15 = _ATLogCategoryStoreDownloads();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v26 = self;
        _os_log_impl(&dword_1D9A2D000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ no asset found in prepare response - stopping", buf, 0xCu);
      }

      v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:26 userInfo:0];
      [(ATStoreMusicDownloadAssetsOperation *)self finishWithError:v16 operationResult:0];
    }
  }
}

void __46__ATStoreMusicDownloadAssetsOperation_execute__block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 80) > a2)
  {
    v4 = _ATLogCategoryStoreDownloads();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 80);
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v5;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = a2;
      *(_WORD *)&buf[22] = 2048;
      *(void *)&buf[24] = v6;
      _os_log_impl(&dword_1D9A2D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ not enough free space available for download. available=%lld, needed=%lld", buf, 0x20u);
    }

    id v7 = *(void **)(a1 + 32);
    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:14 userInfo:0];
    [v7 finishWithError:v8 operationResult:0];

    return;
  }
  uint64_t v9 = [objc_alloc(MEMORY[0x1E4FB8640]) initWithRequestContext:*(void *)(a1 + 40) storeMediaResponseItem:*(void *)(a1 + 48) resumeData:0];
  uint64_t v10 = *(void *)(a1 + 32);
  objc_super v11 = *(void **)(v10 + 328);
  *(void *)(v10 + 328) = v9;

  [*(id *)(*(void *)(a1 + 32) + 328) setAllowsCellularFallback:*(void *)(a1 + 80) >> 21 < 0x19uLL];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 328), "setAllowsCellularData:", objc_msgSend(*(id *)(a1 + 56), "canUseCellularData"));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 328), "setAllowsProxyCellularData:", objc_msgSend(*(id *)(a1 + 56), "canProxyUseCellularData"));
  v12 = *(void **)(a1 + 32);
  uint64_t v13 = (void *)v12[41];
  v14 = [v12 asset];
  if ([v14 isForeground]) {
    uint64_t v15 = 25;
  }
  else {
    uint64_t v15 = -1;
  }
  [v13 setQualityOfService:v15];

  v16 = [MEMORY[0x1E4FB8608] currentDeviceInfo];
  if (![v16 isWatch])
  {
    id v17 = [*(id *)(a1 + 56) assetType];
    int v18 = [v17 isEqualToString:@"Music"];

    if (!v18) {
      goto LABEL_15;
    }
    id v19 = [*(id *)(a1 + 64) playlistURL];
    if (v19)
    {
      id v20 = [*(id *)(a1 + 64) keyServerURL];
      if (v20)
      {
        id v21 = [*(id *)(a1 + 64) keyCertificateURL];
        if (v21)
        {
          id v22 = [*(id *)(a1 + 64) keyServerProtocolType];
          int v23 = [v22 isEqualToString:*MEMORY[0x1E4FB84A0]];
        }
        else
        {
          int v23 = 0;
        }
      }
      else
      {
        int v23 = 0;
      }
    }
    else
    {
      int v23 = 0;
    }

    v25 = [*(id *)(a1 + 64) audioTraits];
    int v88 = [v25 containsObject:*MEMORY[0x1E4FB84D8]];
    int v87 = [v25 containsObject:*MEMORY[0x1E4FB84D0]];
    if (([v25 containsObject:*MEMORY[0x1E4FB84C8]] & 1) != 0
      || ([v25 containsObject:*MEMORY[0x1E4FB84E0]] & 1) != 0)
    {
      int v26 = 1;
    }
    else
    {
      int v26 = [v25 containsObject:*MEMORY[0x1E4FB84E8]];
    }
    __int16 v27 = [*(id *)(a1 + 56) assetType];
    int v28 = [v27 isEqualToString:@"MusicVideo"];

    *(void *)v98 = 0;
    *(void *)&v98[8] = v98;
    *(void *)&v98[16] = 0x2050000000;
    uint64_t v29 = (void *)getMPPlaybackUserDefaultsClass_softClass;
    uint64_t v99 = getMPPlaybackUserDefaultsClass_softClass;
    if (!getMPPlaybackUserDefaultsClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getMPPlaybackUserDefaultsClass_block_invoke;
      *(void *)&buf[24] = &unk_1E6B88D48;
      *(void *)&buf[32] = v98;
      __getMPPlaybackUserDefaultsClass_block_invoke((uint64_t)buf);
      uint64_t v29 = *(void **)(*(void *)&v98[8] + 24);
    }
    id v30 = v29;
    _Block_object_dispose(v98, 8);
    v31 = [v30 standardUserDefaults];
    uint64_t v32 = [v31 preferredMusicDownloadResolution];
    uint64_t v33 = v32;
    if (((v23 ^ 1 | v28) & 1) == 0)
    {
      int v23 = v32 > 47999 ? v88 | v87 : 0;
      if ((v23 & 1) == 0 && ((v26 ^ 1) & 1) == 0) {
        int v23 = [v31 prefersSpatialDownloads];
      }
    }
    v34 = _ATLogCategoryStoreDownloads();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v35 = *(void *)(a1 + 32);
      int v36 = [v31 prefersSpatialDownloads];
      *(_DWORD *)buf = 138544386;
      *(void *)&uint8_t buf[4] = v35;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v23;
      *(_WORD *)&buf[18] = 2114;
      *(void *)&buf[20] = v25;
      *(_WORD *)&buf[28] = 2048;
      *(void *)&buf[30] = v33;
      *(_WORD *)&buf[38] = 1024;
      *(_DWORD *)&buf[40] = v36;
      _os_log_impl(&dword_1D9A2D000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ isHLSDownload=%{BOOL}u [traits=%{public}@, preferredDownloadResolution=%ld, prefersSpatialDownloads=%{BOOL}u]", buf, 0x2Cu);
    }

    if (!v23)
    {
      uint64_t v24 = 0;
LABEL_81:

      goto LABEL_82;
    }
    unsigned int v37 = [v31 prefersSpatialDownloads];
    uint64_t v38 = v26 & v37;
    int v39 = (v88 | v87) & ~v38;
    if (v33 <= 47999) {
      int v39 = 0;
    }
    unsigned int v86 = v39;
    v40 = _ATLogCategoryStoreDownloads();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v41 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = v41;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v25;
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = v37;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = v33 > 47999;
      _os_log_impl(&dword_1D9A2D000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@ HLS Download input: traits=%{public}@, prefersSpatialAudio=%{BOOL}u, prefersLossless=%{BOOL}u", buf, 0x22u);
    }

    v42 = *(void **)(a1 + 32);
    if (v86)
    {
      uint64_t v85 = [v42 _maximumSampleRateForResolutionPreference:v33];
      v43 = *(void **)(*(void *)(a1 + 32) + 328);
      if (v85)
      {
        v44 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
        [v43 setMaximumSampleRate:v44];

LABEL_47:
        [*(id *)(*(void *)(a1 + 32) + 328) setPrefersLossless:v86];
        [*(id *)(*(void *)(a1 + 32) + 328) setPrefersMultichannel:v38];
        [*(id *)(*(void *)(a1 + 32) + 328) setPrefersHLSAsset:1];
        v45 = _ATLogCategoryStoreDownloads();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v46 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138544130;
          *(void *)&uint8_t buf[4] = v46;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v86;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = v38;
          *(_WORD *)&buf[24] = 2048;
          *(void *)&buf[26] = v85;
          _os_log_impl(&dword_1D9A2D000, v45, OS_LOG_TYPE_DEFAULT, "%{public}@ HLS Download setup: shouldUseLosslessAsset=%{BOOL}u, shouldUseSpatialAsset=%{BOOL}u, sample rate=%lu", buf, 0x22u);
        }

        if (v38)
        {
          if ([v25 containsObject:*MEMORY[0x1E4FB84C8]]) {
            uint64_t v47 = 9;
          }
          else {
            uint64_t v47 = 8;
          }
          if ([v25 containsObject:*MEMORY[0x1E4FB84E0]]) {
            v47 |= 0x20uLL;
          }
          if ([v25 containsObject:*MEMORY[0x1E4FB84E8]]) {
            uint64_t v24 = v47 | 2;
          }
          else {
            uint64_t v24 = v47;
          }
        }
        else
        {
          uint64_t v48 = 8;
          if ((v88 & (v33 > 47999)) != 0) {
            uint64_t v48 = 4;
          }
          if ((v87 & (v33 == 192000)) != 0) {
            uint64_t v24 = 16;
          }
          else {
            uint64_t v24 = v48;
          }
        }
        v49 = _ATLogCategoryStoreDownloads();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v89 = *(void *)(a1 + 32);
          v50 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:6];
          if ((v24 & 8) != 0)
          {
            v51 = [NSString stringWithFormat:@"lossy stereo"];
            [v50 addObject:v51];
          }
          if ((v24 & 4) != 0)
          {
            v52 = [NSString stringWithFormat:@"lossless"];
            [v50 addObject:v52];
          }
          if ((v24 & 0x10) != 0)
          {
            v53 = [NSString stringWithFormat:@"high-res lossless"];
            [v50 addObject:v53];
          }
          if ((v24 & 0x20) != 0)
          {
            v54 = [NSString stringWithFormat:@"spatial"];
            [v50 addObject:v54];
          }
          if (v24)
          {
            v55 = [NSString stringWithFormat:@"atmos"];
            [v50 addObject:v55];
          }
          if ((v24 & 2) != 0)
          {
            v56 = [NSString stringWithFormat:@"surround"];
            [v50 addObject:v56];
          }
          if ([v50 count])
          {
            v57 = [v50 componentsJoinedByString:@", "];
          }
          else
          {
            v57 = @"None";
          }

          *(_DWORD *)buf = 138544386;
          *(void *)&uint8_t buf[4] = v89;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v57;
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = v38;
          *(_WORD *)&buf[28] = 1024;
          *(_DWORD *)&buf[30] = v86;
          *(_WORD *)&buf[34] = 2048;
          *(void *)&buf[36] = v85;
          _os_log_impl(&dword_1D9A2D000, v49, OS_LOG_TYPE_DEFAULT, "%{public}@ HLS Download outcome: traits=[%{public}@], spatial=%{BOOL}u, lossless=%{BOOL}u, sample rate=%lu", buf, 0x2Cu);
        }
        goto LABEL_81;
      }
    }
    else
    {
      v43 = (void *)v42[41];
    }
    [v43 setMaximumSampleRate:0];
    uint64_t v85 = 0;
    goto LABEL_47;
  }

LABEL_15:
  uint64_t v24 = 0;
  LOBYTE(v23) = 0;
LABEL_82:
  v58 = [MEMORY[0x1E4FB8608] currentDeviceInfo];
  char v59 = [v58 isWatch];

  if ((v59 & 1) == 0) {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 328), "setRequiresPower:", objc_msgSend(*(id *)(a1 + 56), "powerRequired"));
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&buf[24] = __Block_byref_object_copy__4258;
  *(void *)&buf[32] = __Block_byref_object_dispose__4259;
  *(void *)&buf[40] = 0;
  if (v23)
  {
    v60 = @"movpkg";
  }
  else
  {
    v60 = [*(id *)(a1 + 72) fileExtension];
  }
  v61 = NSString;
  v62 = [*(id *)(a1 + 56) identifier];
  v63 = [MEMORY[0x1E4F29128] UUID];
  v64 = [v63 UUIDString];
  v65 = [v61 stringWithFormat:@"%@_%@", v62, v64];
  v66 = [v65 stringByAppendingPathExtension:v60];

  v67 = +[ATStoreDownloadService downloadDirectoryPath];
  uint64_t v68 = [v67 stringByAppendingPathComponent:v66];
  v69 = *(void **)(*(void *)&buf[8] + 40);
  *(void *)(*(void *)&buf[8] + 40) = v68;

  v70 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v70 createDirectoryAtPath:v67 withIntermediateDirectories:1 attributes:0 error:0];

  v71 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v71 removeItemAtPath:*(void *)(*(void *)&buf[8] + 40) error:0];

  v72 = _ATLogCategoryStoreDownloads();
  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v73 = *(void *)(a1 + 32);
    uint64_t v74 = *(void *)(*(void *)&buf[8] + 40);
    *(_DWORD *)v98 = 138543618;
    *(void *)&v98[4] = v73;
    *(_WORD *)&v98[12] = 2114;
    *(void *)&v98[14] = v74;
    _os_log_impl(&dword_1D9A2D000, v72, OS_LOG_TYPE_DEFAULT, "%{public}@ downloading to temporary file %{public}@", v98, 0x16u);
  }

  v75 = *(void **)(*(void *)(a1 + 32) + 328);
  v76 = [MEMORY[0x1E4F1CB10] fileURLWithPath:*(void *)(*(void *)&buf[8] + 40)];
  [v75 setDestinationURL:v76];

  v77 = [*(id *)(a1 + 32) progress];
  v78 = [*(id *)(*(void *)(a1 + 32) + 328) progress];
  [v77 addChild:v78 withPendingUnitCount:100];

  v79 = _ATLogCategoryStoreDownloads();
  if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v80 = *(void *)(a1 + 32);
    uint64_t v81 = *(void *)(v80 + 328);
    *(_DWORD *)v98 = 138543618;
    *(void *)&v98[4] = v80;
    *(_WORD *)&v98[12] = 2114;
    *(void *)&v98[14] = v81;
    _os_log_impl(&dword_1D9A2D000, v79, OS_LOG_TYPE_DEFAULT, "%{public}@ Initiating download using request %{public}@", v98, 0x16u);
  }

  uint64_t v82 = *(void *)(a1 + 32);
  v83 = *(void **)(v82 + 328);
  v90[0] = MEMORY[0x1E4F143A8];
  v90[1] = 3221225472;
  v90[2] = __46__ATStoreMusicDownloadAssetsOperation_execute__block_invoke_90;
  v90[3] = &unk_1E6B888E0;
  v90[4] = v82;
  id v91 = *(id *)(a1 + 48);
  id v84 = *(id *)(a1 + 40);
  char v96 = v23;
  id v92 = v84;
  uint64_t v95 = v24;
  id v93 = *(id *)(a1 + 64);
  v94 = buf;
  [v83 performRequestWithResponseHandler:v90];

  _Block_object_dispose(buf, 8);
}

void __46__ATStoreMusicDownloadAssetsOperation_execute__block_invoke_90(uint64_t a1, void *a2, void *a3)
{
  v39[4] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v6)
  {
    if (([*(id *)(a1 + 32) isCancelled] & 1) != 0
      || [*(id *)(*(void *)(a1 + 32) + 328) isCancelled])
    {
      id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:2 userInfo:0];
    }
    else
    {
      id v7 = 0;
    }
  }
  id v8 = objc_alloc_init(ATStoreDownloadOperationResult);
  [(ATStoreDownloadOperationResult *)v8 setStoreMediaResponseItem:*(void *)(a1 + 40)];
  [(ATStoreDownloadOperationResult *)v8 setRequestContext:*(void *)(a1 + 48)];
  [(ATStoreDownloadOperationResult *)v8 setIsHLSDownload:*(unsigned __int8 *)(a1 + 80)];
  if (*(unsigned char *)(a1 + 80))
  {
    v38[0] = *MEMORY[0x1E4F79610];
    uint64_t v29 = [NSNumber numberWithInteger:*(void *)(a1 + 72)];
    v39[0] = v29;
    v38[1] = *MEMORY[0x1E4F79628];
    uint64_t v9 = [*(id *)(a1 + 56) keyCertificateURL];
    uint64_t v10 = [v9 absoluteString];
    v39[1] = v10;
    v38[2] = *MEMORY[0x1E4F79638];
    [*(id *)(a1 + 56) keyServerURL];
    id v30 = v6;
    v12 = id v11 = v5;
    [v12 absoluteString];
    v14 = uint64_t v13 = v7;
    v39[2] = v14;
    v38[3] = *MEMORY[0x1E4F79630];
    uint64_t v15 = [*(id *)(a1 + 56) keyServerProtocolType];
    v16 = (void *)v15;
    uint64_t v17 = *MEMORY[0x1E4FB84A8];
    if (v15) {
      uint64_t v17 = v15;
    }
    v39[3] = v17;
    int v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:4];

    id v7 = v13;
    id v5 = v11;
    id v6 = v30;

    [(ATStoreDownloadOperationResult *)v8 setAssetClientParams:v18];
  }
  if (v7)
  {
    id v19 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    id v31 = 0;
    [v19 removeItemAtPath:v20 error:&v31];
    id v21 = v31;

    id v22 = _ATLogCategoryStoreDownloads();
    int v23 = v22;
    if (v21)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = *(void *)(a1 + 32);
        uint64_t v25 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        int v26 = objc_msgSend(v21, "msv_description");
        *(_DWORD *)buf = 138543874;
        uint64_t v33 = v24;
        __int16 v34 = 2114;
        uint64_t v35 = v25;
        __int16 v36 = 2114;
        unsigned int v37 = v26;
        _os_log_impl(&dword_1D9A2D000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ Performed cleanup for download at path %{public}@ error=%{public}@", buf, 0x20u);
      }
    }
    else if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = *(void *)(a1 + 32);
      uint64_t v28 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v33 = v27;
      __int16 v34 = 2114;
      uint64_t v35 = v28;
      _os_log_impl(&dword_1D9A2D000, v23, OS_LOG_TYPE_ERROR, "%{public}@ Performed cleanup for download at path %{public}@", buf, 0x16u);
    }
  }
  else
  {
    [(ATStoreDownloadOperationResult *)v8 setDownloadFilePath:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  }
  [*(id *)(a1 + 32) finishWithError:v7 operationResult:v8];
}

@end