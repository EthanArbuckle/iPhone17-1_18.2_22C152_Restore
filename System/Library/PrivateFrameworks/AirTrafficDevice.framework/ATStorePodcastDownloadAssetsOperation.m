@interface ATStorePodcastDownloadAssetsOperation
- (id)_downloadConfigurationWithSessionIdentifier:(id)a3 isHLS:(BOOL)a4;
- (id)_icavUrlSession;
- (id)_urlSession;
- (id)secureDownloadRenewalManager;
- (void)_deleteHLSKey;
- (void)_getContentKeyForAssetWithCompletionHandler:(id)a3;
- (void)_moveAssetToPurchasesDirectoryFromTmpPath:(id)a3 downloadError:(id)a4 isHLSAsset:(BOOL)a5;
- (void)cancel;
- (void)execute;
- (void)finishWithError:(id)a3 operationResult:(id)a4;
@end

@implementation ATStorePodcastDownloadAssetsOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renewalManager, 0);
  objc_storeStrong((id *)&self->_hlsAsset, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_hlsSession, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

- (void)_moveAssetToPurchasesDirectoryFromTmpPath:(id)a3 downloadError:(id)a4 isHLSAsset:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [(ATStoreDownloadOperation *)self asset];
  [v10 setProtectionType:1];

  v11 = [(ATStoreDownloadOperation *)self asset];
  v12 = [v11 identifier];

  if (v5)
  {
    v13 = @"movpkg";
  }
  else
  {
    v13 = [v8 pathExtension];
    if (!v13) {
      goto LABEL_5;
    }
  }
  uint64_t v14 = [v12 stringByAppendingPathExtension:v13];

  v12 = (void *)v14;
LABEL_5:
  v15 = [MEMORY[0x1E4F79AF8] pathForBaseLocationPath:400];
  v16 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v16 createDirectoryAtPath:v15 withIntermediateDirectories:1 attributes:0 error:0];

  v17 = [v15 stringByAppendingPathComponent:v12];
  v18 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v18 removeItemAtPath:v17 error:0];

  BOOL v28 = v5;
  if (v5)
  {
    uint64_t v19 = [v8 stringByAppendingPathExtension:v13];

    id v8 = (id)v19;
  }
  v20 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v29 = v9;
  char v21 = [v20 moveItemAtPath:v8 toPath:v17 error:&v29];
  id v22 = v29;

  if ((v21 & 1) == 0)
  {
    v23 = _ATLogCategoryStoreDownloads();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = &stru_1F33D2380;
      *(_DWORD *)buf = 138544386;
      v31 = self;
      __int16 v32 = 2114;
      if (v28) {
        v24 = @"HLS";
      }
      v33 = v24;
      __int16 v34 = 2114;
      id v35 = v8;
      __int16 v36 = 2114;
      v37 = v17;
      __int16 v38 = 2114;
      id v39 = v22;
      _os_log_impl(&dword_1D9A2D000, v23, OS_LOG_TYPE_ERROR, "%{public}@ failed to rename %{public}@ downloaded file from %{public}@ --> %{public}@. err=%{public}@", buf, 0x34u);
    }
  }
  v25 = objc_alloc_init(ATStoreDownloadOperationResult);
  v26 = v25;
  if (v22) {
    v27 = 0;
  }
  else {
    v27 = v17;
  }
  [(ATStoreDownloadOperationResult *)v25 setDownloadFilePath:v27];
  [(ATStorePodcastDownloadAssetsOperation *)self finishWithError:v22 operationResult:v26];
}

- (id)_downloadConfigurationWithSessionIdentifier:(id)a3 isHLS:(BOOL)a4
{
  id v6 = a3;
  if (a4) {
    [MEMORY[0x1E4F290F0] backgroundSessionConfigurationWithIdentifier:v6];
  }
  else {
  v7 = [MEMORY[0x1E4F290F0] defaultSessionConfiguration];
  }
  id v8 = [(ATStoreDownloadOperation *)self asset];
  objc_msgSend(v7, "setAllowsCellularAccess:", objc_msgSend(v8, "canUseCellularData"));

  [v7 setHTTPShouldUsePipelining:1];
  [v7 setHTTPShouldSetCookies:0];
  [v7 setHTTPCookieAcceptPolicy:1];
  id v9 = [MEMORY[0x1E4FB8608] currentDeviceInfo];
  int v10 = [v9 isWatch];

  if (v10)
  {
    objc_msgSend(v7, "set_prefersInfraWiFi:", 1);
    objc_msgSend(v7, "set_companionProxyPreference:", 2);
  }

  return v7;
}

- (void)_getContentKeyForAssetWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2050000000;
  BOOL v5 = (void *)getIMAVSecureKeyLoaderClass_softClass;
  uint64_t v26 = getIMAVSecureKeyLoaderClass_softClass;
  if (!getIMAVSecureKeyLoaderClass_softClass)
  {
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    v20 = __getIMAVSecureKeyLoaderClass_block_invoke;
    char v21 = &unk_1E6B88D48;
    id v22 = &v23;
    __getIMAVSecureKeyLoaderClass_block_invoke((uint64_t)&v18);
    BOOL v5 = (void *)v24[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v23, 8);
  v7 = (void *)[[v6 alloc] initWithRecipient:self->_hlsAsset useCase:1 account:0 urlProtocolDelegate:0];
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2050000000;
  id v8 = (void *)getPFMediaItemMetadataLoaderClass_softClass;
  uint64_t v26 = getPFMediaItemMetadataLoaderClass_softClass;
  if (!getPFMediaItemMetadataLoaderClass_softClass)
  {
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    v20 = __getPFMediaItemMetadataLoaderClass_block_invoke;
    char v21 = &unk_1E6B88D48;
    id v22 = &v23;
    __getPFMediaItemMetadataLoaderClass_block_invoke((uint64_t)&v18);
    id v8 = (void *)v24[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v23, 8);
  id v10 = objc_alloc_init(v9);
  hlsAsset = self->_hlsAsset;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __85__ATStorePodcastDownloadAssetsOperation__getContentKeyForAssetWithCompletionHandler___block_invoke;
  v14[3] = &unk_1E6B88D20;
  v16 = self;
  id v17 = v4;
  id v15 = v7;
  id v12 = v7;
  id v13 = v4;
  [v10 keyIdentifiersFromAsset:hlsAsset completion:v14];
}

void __85__ATStorePodcastDownloadAssetsOperation__getContentKeyForAssetWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count])
  {
    if ((unint64_t)[v3 count] >= 2)
    {
      id v4 = _ATLogCategoryStoreDownloads();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D9A2D000, v4, OS_LOG_TYPE_DEFAULT, "Unexpected number of keyUris found in asset metadata. Continuing with first keyUri", buf, 2u);
      }
    }
    BOOL v5 = *(void **)(a1 + 32);
    id v6 = [v3 firstObject];
    v7 = NSString;
    id v8 = [*(id *)(a1 + 40) asset];
    id v9 = [v8 storeInfo];
    id v10 = [v9 adamID];
    v11 = [v7 stringWithFormat:@"%@", v10];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __85__ATStorePodcastDownloadAssetsOperation__getContentKeyForAssetWithCompletionHandler___block_invoke_51;
    v15[3] = &unk_1E6B88CF8;
    id v12 = *(void **)(a1 + 48);
    v15[4] = *(void *)(a1 + 40);
    id v16 = v12;
    [v5 startKeyLoadingProcessWithKeyIdentifier:v6 contentAdamId:v11 isRenewal:0 completion:v15];
  }
  else
  {
    id v13 = _ATLogCategoryStoreDownloads();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D9A2D000, v13, OS_LOG_TYPE_ERROR, "Downloading unprotected HLS content with an adamId is not supported", buf, 2u);
    }

    uint64_t v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:26 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __85__ATStorePodcastDownloadAssetsOperation__getContentKeyForAssetWithCompletionHandler___block_invoke_51(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _ATLogCategoryStoreDownloads();
  BOOL v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v6 = [*(id *)(a1 + 32) asset];
      v7 = [v6 storeInfo];
      id v8 = [v7 adamID];
      int v14 = 138412546;
      id v15 = v8;
      __int16 v16 = 2114;
      id v17 = v3;
      _os_log_impl(&dword_1D9A2D000, v5, OS_LOG_TYPE_ERROR, "Attempt to load key for episode asset with adam id: %@ failed with err=%{public}@", (uint8_t *)&v14, 0x16u);
    }
    uint64_t v9 = *(void *)(a1 + 40);
    id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:25 userInfo:0];
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [*(id *)(a1 + 32) asset];
      id v12 = [v11 storeInfo];
      id v13 = [v12 adamID];
      int v14 = 138412290;
      id v15 = v13;
      _os_log_impl(&dword_1D9A2D000, v5, OS_LOG_TYPE_DEFAULT, "Attempt to load key for episode asset with adam id: %@ succeeded", (uint8_t *)&v14, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)_urlSession
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithString:@"com.apple.airtraffic.ATPodcastEpisodeDownloadOperation"];
  id v4 = [(ATStoreDownloadOperation *)self asset];
  int v5 = [v4 powerRequired];

  if (v5) {
    [v3 appendString:@".power"];
  }
  id v6 = [(ATStoreDownloadOperation *)self asset];
  char v7 = [v6 canUseCellularData];

  if ((v7 & 1) == 0) {
    [v3 appendString:@".wifi"];
  }
  id v8 = [MEMORY[0x1E4FB87A8] sharedSessionManager];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52__ATStorePodcastDownloadAssetsOperation__urlSession__block_invoke;
  v12[3] = &unk_1E6B88CD0;
  v12[4] = self;
  id v13 = v3;
  id v9 = v3;
  id v10 = [v8 sessionWithIdentifier:v9 creationBlock:v12];

  return v10;
}

id __52__ATStorePodcastDownloadAssetsOperation__urlSession__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4FB87A0]);
  id v3 = [*(id *)(a1 + 32) _downloadConfigurationWithSessionIdentifier:*(void *)(a1 + 40) isHLS:0];
  id v4 = (void *)[v2 initWithConfiguration:v3];

  return v4;
}

- (id)_icavUrlSession
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithString:@"com.apple.airtraffic.ATPodcastEpisodeDownloadOperation.HLS"];
  id v4 = [(ATStoreDownloadOperation *)self asset];
  int v5 = [v4 powerRequired];

  if (v5) {
    [v3 appendString:@".power"];
  }
  id v6 = [(ATStoreDownloadOperation *)self asset];
  char v7 = [v6 canUseCellularData];

  if ((v7 & 1) == 0) {
    [v3 appendString:@".wifi"];
  }
  id v8 = [MEMORY[0x1E4FB87A8] sharedSessionManager];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56__ATStorePodcastDownloadAssetsOperation__icavUrlSession__block_invoke;
  v12[3] = &unk_1E6B88CD0;
  v12[4] = self;
  id v13 = v3;
  id v9 = v3;
  id v10 = [v8 sessionWithIdentifier:v9 creationBlock:v12];

  return v10;
}

id __56__ATStorePodcastDownloadAssetsOperation__icavUrlSession__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4FB8588]);
  id v3 = [*(id *)(a1 + 32) _downloadConfigurationWithSessionIdentifier:*(void *)(a1 + 40) isHLS:1];
  id v4 = (void *)[v2 initWithConfiguration:v3];

  return v4;
}

- (void)_deleteHLSKey
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = [(ATStoreDownloadOperation *)self asset];
  id v4 = [v3 storeInfo];
  int v5 = [v4 adamID];

  if ([getMTStoreIdentifierClass() isNotEmptyNumber:v5])
  {
    id v6 = [getMTDBExtensionAccessClass() sharedInstance];
    char v7 = [v6 isReady];

    id v8 = _ATLogCategoryStoreDownloads();
    id v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412290;
        id v12 = v5;
        _os_log_impl(&dword_1D9A2D000, v9, OS_LOG_TYPE_DEFAULT, "Deleting HLS secure key for asset with adam ID %@", (uint8_t *)&v11, 0xCu);
      }

      id v10 = [(ATStorePodcastDownloadAssetsOperation *)self secureDownloadRenewalManager];
      objc_msgSend(v10, "requestSecureDeletionOfEpisodeWithAdamID:", -[ATStorePodcastDownloadAssetsOperation longLongValue](v5, "longLongValue"));
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v11 = 138543362;
        id v12 = self;
        _os_log_impl(&dword_1D9A2D000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Cannot open Podcasts DB. Will not enqueue assets to sync.", (uint8_t *)&v11, 0xCu);
      }

      id v10 = [getMTDBExtensionAccessClass() sharedInstance];
      [v10 attemptToFix];
    }
  }
}

- (void)finishWithError:(id)a3 operationResult:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)ATStorePodcastDownloadAssetsOperation;
  [(ATStoreDownloadOperation *)&v8 finishWithError:a3 operationResult:a4];
  request = self->_request;
  self->_request = 0;

  hlsSession = self->_hlsSession;
  self->_hlsSession = 0;

  session = self->_session;
  self->_session = 0;
}

- (void)cancel
{
  v13.receiver = self;
  v13.super_class = (Class)ATStorePodcastDownloadAssetsOperation;
  [(ATStorePodcastDownloadAssetsOperation *)&v13 cancel];
  [(ATStorePodcastDownloadAssetsOperation *)self _deleteHLSKey];
  if (self->_request)
  {
    id v3 = (void *)MEMORY[0x1E4F1CB10];
    id v4 = [(ATStoreDownloadOperation *)self asset];
    int v5 = [v4 storeInfo];
    id v6 = [v5 redownloadParams];
    char v7 = [v3 URLWithString:v6];
    int v8 = objc_msgSend(v7, "pf_isHLSPlaylistObjC");

    id v9 = _ATLogCategoryStoreDownloads();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        *(_WORD *)id v12 = 0;
        _os_log_impl(&dword_1D9A2D000, v9, OS_LOG_TYPE_DEFAULT, "Cancelling HLS download", v12, 2u);
      }
      int v11 = &OBJC_IVAR___ATStorePodcastDownloadAssetsOperation__hlsSession;
    }
    else
    {
      if (v10)
      {
        *(_WORD *)id v12 = 0;
        _os_log_impl(&dword_1D9A2D000, v9, OS_LOG_TYPE_DEFAULT, "Cancelling regular, non-HLS download", v12, 2u);
      }
      int v11 = &OBJC_IVAR___ATStorePodcastDownloadAssetsOperation__session;
    }

    [*(id *)((char *)&self->super.super.super.super.super.super.isa + *v11) cancelRequest:self->_request];
  }
}

- (void)execute
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = _ATLogCategoryStoreDownloads();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(ATStoreDownloadOperation *)self asset];
    int v5 = [(ATStoreDownloadOperation *)self asset];
    int v6 = [v5 powerRequired];
    char v7 = [(ATStoreDownloadOperation *)self asset];
    int v8 = [v7 canUseCellularData];
    id v9 = [(ATStoreDownloadOperation *)self asset];
    BOOL v10 = [v9 resumeData];
    *(_DWORD *)buf = 138544386;
    id v29 = self;
    __int16 v30 = 2114;
    v31 = v4;
    __int16 v32 = 1024;
    int v33 = v6;
    __int16 v34 = 1024;
    int v35 = v8;
    __int16 v36 = 1024;
    BOOL v37 = v10 != 0;
    _os_log_impl(&dword_1D9A2D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ starting download for asset %{public}@. requiresPower=%d, canUseCellularData=%d, hasResumeData=%d", buf, 0x28u);
  }
  int v11 = [(ATStoreDownloadOperation *)self asset];
  id v12 = [v11 storeInfo];
  objc_super v13 = [v12 redownloadParams];

  int v14 = _ATLogCategoryStoreDownloads();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v29 = v13;
    _os_log_impl(&dword_1D9A2D000, v14, OS_LOG_TYPE_DEFAULT, "Downloading from remote url: %@", buf, 0xCu);
  }

  id v15 = [MEMORY[0x1E4F1CB10] URLWithString:v13];
  if (v13)
  {
    if (![(ATStorePodcastDownloadAssetsOperation *)self isCancelled])
    {
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __48__ATStorePodcastDownloadAssetsOperation_execute__block_invoke;
      v26[3] = &unk_1E6B88C80;
      v26[4] = self;
      id v27 = v15;
      uint64_t v19 = (void *)MEMORY[0x1E016B9C0](v26);
      v20 = [MEMORY[0x1E4FB8720] sharedManager];
      char v21 = [(ATStoreDownloadOperation *)self asset];
      uint64_t v22 = [v21 totalBytes];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __48__ATStorePodcastDownloadAssetsOperation_execute__block_invoke_25;
      v24[3] = &unk_1E6B88CA8;
      id v25 = v19;
      id v23 = v19;
      [v20 ensureStorageIsAvailable:v22 withCompletionHandler:v24];

      goto LABEL_11;
    }
    __int16 v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = 2;
  }
  else
  {
    __int16 v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = 26;
  }
  uint64_t v18 = [v16 errorWithDomain:@"ATError" code:v17 userInfo:0];
  [(ATStorePodcastDownloadAssetsOperation *)self finishWithError:v18 operationResult:0];

LABEL_11:
}

void __48__ATStorePodcastDownloadAssetsOperation_execute__block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v4 = [*(id *)(a1 + 32) asset];
  unint64_t v5 = [v4 totalBytes];

  if (v5 > a2)
  {
    int v6 = _ATLogCategoryStoreDownloads();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      char v7 = *(void **)(a1 + 32);
      int v8 = [v7 asset];
      *(_DWORD *)buf = 138543874;
      v82 = v7;
      __int16 v83 = 2048;
      unint64_t v84 = a2;
      __int16 v85 = 2048;
      uint64_t v86 = [v8 totalBytes];
      _os_log_impl(&dword_1D9A2D000, v6, OS_LOG_TYPE_ERROR, "%{public}@ not enough free space available for download. available=%lld, needed=%lld", buf, 0x20u);
    }
    id v9 = *(void **)(a1 + 32);
    BOOL v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:14 userInfo:0];
    [v9 finishWithError:v10 operationResult:0];

    return;
  }
  if (![*(id *)(a1 + 32) isCancelled])
  {
    id v12 = ICBundleIdentifierForSystemApplicationType();
    objc_super v13 = [MEMORY[0x1E4FB85B0] defaultInfo];
    int v14 = (void *)[v13 mutableCopy];

    [v14 setRequestingBundleIdentifier:v12];
    id v15 = [*(id *)(a1 + 32) asset];
    if ([v15 canUseCellularData])
    {
      __int16 v16 = [*(id *)(a1 + 32) asset];
      BOOL v17 = (unint64_t)[v16 totalBytes] >> 21 < 0x19;
    }
    else
    {
      BOOL v17 = 0;
    }

    id v18 = objc_alloc(MEMORY[0x1E4FB8700]);
    v75[0] = MEMORY[0x1E4F143A8];
    v75[1] = 3221225472;
    v75[2] = __48__ATStorePodcastDownloadAssetsOperation_execute__block_invoke_8;
    v75[3] = &unk_1E6B88C08;
    id v19 = v12;
    id v76 = v19;
    BOOL v78 = v17;
    id v20 = v14;
    id v77 = v20;
    uint64_t v21 = [v18 initWithBlock:v75];
    uint64_t v22 = [objc_alloc(MEMORY[0x1E4FB8790]) initWithURL:*(void *)(a1 + 40) requestContext:v21 resumeData:0];
    uint64_t v23 = *(void *)(a1 + 32);
    v24 = *(void **)(v23 + 344);
    *(void *)(v23 + 344) = v22;

    id v25 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v26 = [v25 UUIDString];

    uint64_t v27 = [*(id *)(a1 + 40) pathExtension];
    int v28 = objc_msgSend(*(id *)(a1 + 40), "pf_isHLSPlaylistObjC");
    int v29 = v28;
    v66 = v20;
    id v68 = v19;
    v64 = (void *)v27;
    v65 = (void *)v21;
    if (v27 && (v28 & 1) == 0)
    {
      uint64_t v30 = [v26 stringByAppendingPathExtension:v27];

      uint64_t v26 = (void *)v30;
    }
    v31 = +[ATStoreDownloadService downloadDirectoryPath];
    __int16 v32 = [v31 stringByAppendingPathComponent:v26];
    int v33 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v33 createDirectoryAtPath:v31 withIntermediateDirectories:1 attributes:0 error:0];

    __int16 v34 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v34 removeItemAtPath:v32 error:0];

    int v35 = _ATLogCategoryStoreDownloads();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v36 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v82 = v36;
      __int16 v83 = 2114;
      unint64_t v84 = (unint64_t)v32;
      _os_log_impl(&dword_1D9A2D000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@ downloading to temporary file path '%{public}@'", buf, 0x16u);
    }

    BOOL v37 = [*(id *)(a1 + 32) progress];
    uint64_t v38 = [*(id *)(*(void *)(a1 + 32) + 344) progress];
    [v37 addChild:v38 withPendingUnitCount:100];

    if (v29)
    {
      BOOL v39 = v17;
      id MTStoreIdentifierClass = getMTStoreIdentifierClass();
      v41 = [*(id *)(a1 + 32) asset];
      v42 = [v41 storeInfo];
      v43 = [v42 adamID];
      LODWORD(MTStoreIdentifierClass) = [MTStoreIdentifierClass isEmptyNumber:v43];

      if (MTStoreIdentifierClass)
      {
        v44 = _ATLogCategoryStoreDownloads();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D9A2D000, v44, OS_LOG_TYPE_ERROR, "Can't download HLS content for episode without an adam id", buf, 2u);
        }

        v45 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:26 userInfo:0];
        [*(id *)(a1 + 32) finishWithError:v45 operationResult:0];

        goto LABEL_27;
      }
      id v56 = objc_alloc(MEMORY[0x1E4F166C8]);
      uint64_t v57 = *(void *)(a1 + 40);
      uint64_t v79 = *MEMORY[0x1E4F160F0];
      v58 = [NSNumber numberWithBool:v39];
      v80 = v58;
      v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v80 forKeys:&v79 count:1];
      uint64_t v60 = [v56 initWithURL:v57 options:v59];
      uint64_t v61 = *(void *)(a1 + 32);
      v62 = *(void **)(v61 + 352);
      *(void *)(v61 + 352) = v60;

      v63 = *(void **)(a1 + 32);
      v72[0] = MEMORY[0x1E4F143A8];
      v72[1] = 3221225472;
      v72[2] = __48__ATStorePodcastDownloadAssetsOperation_execute__block_invoke_18;
      v72[3] = &unk_1E6B88C58;
      v72[4] = v63;
      id v73 = v32;
      char v74 = v29;
      [v63 _getContentKeyForAssetWithCompletionHandler:v72];
      v55 = v73;
    }
    else
    {
      v46 = _ATLogCategoryStoreDownloads();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        v47 = [*(id *)(a1 + 32) asset];
        *(_DWORD *)buf = 138412290;
        v82 = v47;
        _os_log_impl(&dword_1D9A2D000, v46, OS_LOG_TYPE_DEFAULT, "Downloading regular URL asset: %@", buf, 0xCu);
      }
      uint64_t v48 = [*(id *)(a1 + 32) _urlSession];
      uint64_t v49 = *(void *)(a1 + 32);
      v50 = *(void **)(v49 + 328);
      *(void *)(v49 + 328) = v48;

      uint64_t v51 = *(void *)(a1 + 32);
      v52 = *(void **)(v51 + 328);
      uint64_t v53 = *(void *)(v51 + 344);
      v54 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v32 isDirectory:0];
      v69[0] = MEMORY[0x1E4F143A8];
      v69[1] = 3221225472;
      v69[2] = __48__ATStorePodcastDownloadAssetsOperation_execute__block_invoke_22;
      v69[3] = &unk_1E6B88C30;
      v69[4] = *(void *)(a1 + 32);
      id v70 = v32;
      char v71 = 0;
      [v52 enqueueDownloadRequest:v53 toDestination:v54 withCompletionHandler:v69];

      v55 = v70;
    }

LABEL_27:
    return;
  }
  int v11 = *(void **)(a1 + 32);
  id v67 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:2 userInfo:0];
  objc_msgSend(v11, "finishWithError:operationResult:");
}

uint64_t __48__ATStorePodcastDownloadAssetsOperation_execute__block_invoke_25(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __48__ATStorePodcastDownloadAssetsOperation_execute__block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4FB86C8];
  id v4 = a2;
  id v5 = (id)[[v3 alloc] initWithBundleIdentifier:*(void *)(a1 + 32)];
  [v5 setShouldAllowDataForCellularNetworkTypes:*(unsigned __int8 *)(a1 + 48)];
  [v4 setNetworkConstraints:v5];
  [v4 setClientInfo:*(void *)(a1 + 40)];
}

void __48__ATStorePodcastDownloadAssetsOperation_execute__block_invoke_18(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _ATLogCategoryStoreDownloads();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = v3;
      _os_log_impl(&dword_1D9A2D000, v5, OS_LOG_TYPE_ERROR, "Content key could not be acquired, returning early due to error: %{public}@", buf, 0xCu);
    }

    [*(id *)(a1 + 32) _deleteHLSKey];
    [*(id *)(a1 + 32) finishWithError:v3 operationResult:0];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D9A2D000, v5, OS_LOG_TYPE_DEFAULT, "Content key successfully acquired, proceeding with HLS download", buf, 2u);
    }

    uint64_t v6 = [*(id *)(a1 + 32) _icavUrlSession];
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = *(void **)(v7 + 336);
    *(void *)(v7 + 336) = v6;

    uint64_t v9 = *(void *)(a1 + 32);
    BOOL v10 = *(void **)(v9 + 336);
    uint64_t v11 = *(void *)(v9 + 344);
    id v12 = [MEMORY[0x1E4F1CB10] fileURLWithPath:*(void *)(a1 + 40) isDirectory:1];
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = *(void *)(v13 + 352);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __48__ATStorePodcastDownloadAssetsOperation_execute__block_invoke_19;
    v15[3] = &unk_1E6B88C30;
    v15[4] = v13;
    id v16 = *(id *)(a1 + 40);
    char v17 = *(unsigned char *)(a1 + 48);
    [v10 enqueueAggregateAssetDownloadRequest:v11 toDestination:v12 withAVURLAsset:v14 options:0 completionHandler:v15];
  }
}

void __48__ATStorePodcastDownloadAssetsOperation_execute__block_invoke_22(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _ATLogCategoryStoreDownloads();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v8 = 138543618;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    id v11 = v4;
    _os_log_impl(&dword_1D9A2D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ download complete. err=%{public}@", (uint8_t *)&v8, 0x16u);
  }

  uint64_t v7 = *(void **)(a1 + 32);
  if (v4)
  {
    [v7 finishWithError:v4 operationResult:0];
  }
  else if ([v7 isCancelled])
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:2 userInfo:0];
  }
  else
  {
    [*(id *)(a1 + 32) _moveAssetToPurchasesDirectoryFromTmpPath:*(void *)(a1 + 40) downloadError:0 isHLSAsset:*(unsigned __int8 *)(a1 + 48)];
  }
}

void __48__ATStorePodcastDownloadAssetsOperation_execute__block_invoke_19(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _ATLogCategoryStoreDownloads();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v8 = 138543618;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    id v11 = v4;
    _os_log_impl(&dword_1D9A2D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ download complete. err=%{public}@", (uint8_t *)&v8, 0x16u);
  }

  uint64_t v7 = *(void **)(a1 + 32);
  if (v4)
  {
    [v7 _deleteHLSKey];
    [*(id *)(a1 + 32) finishWithError:v4 operationResult:0];
  }
  else
  {
    if (![v7 isCancelled])
    {
      [*(id *)(a1 + 32) _moveAssetToPurchasesDirectoryFromTmpPath:*(void *)(a1 + 40) downloadError:0 isHLSAsset:*(unsigned __int8 *)(a1 + 48)];
      return;
    }
    id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:2 userInfo:0];
    [*(id *)(a1 + 32) _deleteHLSKey];
  }
}

- (id)secureDownloadRenewalManager
{
  renewalManager = self->_renewalManager;
  if (!renewalManager)
  {
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x2050000000;
    id v4 = (void *)getPFSecureDownloadRenewalManagerClass_softClass;
    uint64_t v13 = getPFSecureDownloadRenewalManagerClass_softClass;
    if (!getPFSecureDownloadRenewalManagerClass_softClass)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __getPFSecureDownloadRenewalManagerClass_block_invoke;
      v9[3] = &unk_1E6B88D48;
      v9[4] = &v10;
      __getPFSecureDownloadRenewalManagerClass_block_invoke((uint64_t)v9);
      id v4 = (void *)v11[3];
    }
    id v5 = v4;
    _Block_object_dispose(&v10, 8);
    uint64_t v6 = (PFSecureDownloadRenewalManager *)objc_alloc_init(v5);
    uint64_t v7 = self->_renewalManager;
    self->_renewalManager = v6;

    renewalManager = self->_renewalManager;
  }

  return renewalManager;
}

@end