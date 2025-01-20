@interface ATStoreMusicDownloadPrepareOperation
- (void)cancel;
- (void)execute;
- (void)finishWithError:(id)a3 operationResult:(id)a4;
@end

@implementation ATStoreMusicDownloadPrepareOperation

- (void).cxx_destruct
{
}

- (void)finishWithError:(id)a3 operationResult:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)ATStoreMusicDownloadPrepareOperation;
  [(ATStoreDownloadOperation *)&v6 finishWithError:a3 operationResult:a4];
  redownloadRequest = self->_redownloadRequest;
  self->_redownloadRequest = 0;
}

- (void)cancel
{
  v3.receiver = self;
  v3.super_class = (Class)ATStoreMusicDownloadPrepareOperation;
  [(ATStoreMusicDownloadPrepareOperation *)&v3 cancel];
  [(ICMediaRedownloadRequest *)self->_redownloadRequest cancel];
}

- (void)execute
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  objc_super v3 = _ATLogCategoryStoreDownloads();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(ATStoreDownloadOperation *)self asset];
    *(_DWORD *)buf = 138543618;
    v55 = self;
    __int16 v56 = 2114;
    *(void *)v57 = v4;
    _os_log_impl(&dword_1D9A2D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ starting prepare phase for asset %{public}@", buf, 0x16u);
  }
  id v5 = objc_alloc(MEMORY[0x1E4FB8758]);
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __47__ATStoreMusicDownloadPrepareOperation_execute__block_invoke;
  v53[3] = &unk_1E6B88840;
  v53[4] = self;
  objc_super v6 = (void *)[v5 initWithBlock:v53];
  v7 = [(ATStoreDownloadOperation *)self asset];
  v8 = [v7 storeInfo];

  v9 = [v8 endpointType];
  uint64_t v10 = [v9 integerValue];

  switch(v10)
  {
    case 0:
      v11 = [v8 sagaID];
      if ([v11 unsignedLongLongValue])
      {
        v12 = [v8 redownloadParams];
        uint64_t v13 = [v12 length];

        if (v13) {
          goto LABEL_6;
        }
      }
      else
      {
      }
      v17 = [v8 adamID];
      if (![v17 unsignedLongLongValue])
      {
        uint64_t v10 = 0;
        goto LABEL_19;
      }
      v25 = [v8 redownloadParams];
      uint64_t v26 = [v25 length];

      if (v26) {
        goto LABEL_15;
      }
      uint64_t v10 = 0;
      break;
    case 1:
LABEL_15:
      v27 = _ATLogCategoryStoreDownloads();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = [v8 redownloadParams];
        *(_DWORD *)buf = 138543618;
        v55 = self;
        __int16 v56 = 2114;
        *(void *)v57 = v28;
        _os_log_impl(&dword_1D9A2D000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ performing purchase redownload. redownloadParams=%{public}@", buf, 0x16u);
      }
      id v29 = objc_alloc(MEMORY[0x1E4FB86F0]);
      v17 = [v8 redownloadParams];
      v30 = (ICMediaRedownloadRequest *)[v29 initWithRequestContext:v6 redownloadParametersString:v17];
      redownloadRequest = self->_redownloadRequest;
      self->_redownloadRequest = v30;
      uint64_t v10 = 1;
      goto LABEL_18;
    case 2:
LABEL_6:
      v14 = _ATLogCategoryStoreDownloads();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = [v8 redownloadParams];
        *(_DWORD *)buf = 138543618;
        v55 = self;
        __int16 v56 = 2114;
        *(void *)v57 = v15;
        _os_log_impl(&dword_1D9A2D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ performing match redownload. redownloadParams=%{public}@", buf, 0x16u);
      }
      id v16 = objc_alloc(MEMORY[0x1E4FB8638]);
      v17 = [v8 redownloadParams];
      v18 = (ICMediaRedownloadRequest *)[v16 initWithRequestContext:v6 redownloadParametersString:v17];
      redownloadRequest = self->_redownloadRequest;
      self->_redownloadRequest = v18;
      uint64_t v10 = 2;
      goto LABEL_18;
    case 3:
      v20 = _ATLogCategoryStoreDownloads();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = [v8 adamID];
        uint64_t v22 = [v21 unsignedLongLongValue];
        *(_DWORD *)buf = 138543618;
        v55 = self;
        __int16 v56 = 2048;
        *(void *)v57 = v22;
        _os_log_impl(&dword_1D9A2D000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ performing subscription redownload. subscriptionItemID=%lld", buf, 0x16u);
      }
      id v23 = objc_alloc(MEMORY[0x1E4FB8778]);
      v17 = [v8 adamID];
      v24 = (ICMediaRedownloadRequest *)objc_msgSend(v23, "initWithRequestContext:subscriptionItemID:", v6, objc_msgSend(v17, "unsignedLongLongValue"));
      redownloadRequest = self->_redownloadRequest;
      self->_redownloadRequest = v24;
      uint64_t v10 = 3;
LABEL_18:

LABEL_19:
      break;
    default:
      break;
  }
  if (!self->_redownloadRequest)
  {
    v33 = _ATLogCategoryStoreDownloads();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v55 = self;
      __int16 v56 = 2048;
      *(void *)v57 = v10;
      _os_log_impl(&dword_1D9A2D000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@ unsupported endpoint type %ld", buf, 0x16u);
    }

    v31 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v32 = 21;
    goto LABEL_26;
  }
  if ([(ATStoreMusicDownloadPrepareOperation *)self isCancelled])
  {
    v31 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v32 = 2;
LABEL_26:
    v34 = [v31 errorWithDomain:@"ATError" code:v32 userInfo:0];
    [(ATStoreMusicDownloadPrepareOperation *)self finishWithError:v34 operationResult:0];
    goto LABEL_34;
  }
  v34 = [MEMORY[0x1E4F28E78] stringWithString:@"com.apple.AirTraffic.ATStoreMusicDownloadPrepareOperation"];
  v35 = [(ATStoreDownloadOperation *)self asset];
  char v36 = [v35 canUseCellularData];

  if ((v36 & 1) == 0) {
    [v34 appendString:@".wifi"];
  }
  v37 = [(ATStoreDownloadOperation *)self asset];
  char v38 = [v37 canProxyUseCellularData];

  if ((v38 & 1) == 0) {
    [v34 appendString:@".proxywifi"];
  }
  v39 = _ATLogCategoryStoreDownloads();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    v40 = [(ATStoreDownloadOperation *)self asset];
    int v41 = [v40 canUseCellularData];
    v42 = [(ATStoreDownloadOperation *)self asset];
    int v43 = [v42 canProxyUseCellularData];
    *(_DWORD *)buf = 138543874;
    v55 = self;
    __int16 v56 = 1024;
    *(_DWORD *)v57 = v41;
    *(_WORD *)&v57[4] = 1024;
    *(_DWORD *)&v57[6] = v43;
    _os_log_impl(&dword_1D9A2D000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@ creating url session with constraints: canUseCellularData:%{BOOL}u, canProxyUseCellularData:%{BOOL}u, ", buf, 0x18u);
  }
  v44 = [MEMORY[0x1E4FB87A8] sharedSessionManager];
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __47__ATStoreMusicDownloadPrepareOperation_execute__block_invoke_27;
  v52[3] = &unk_1E6B88868;
  v52[4] = self;
  v45 = [v44 sessionWithIdentifier:v34 creationBlock:v52];

  [(ICMediaRedownloadRequest *)self->_redownloadRequest setUrlSession:v45];
  v46 = [(ICRequestOperation *)self progress];
  v47 = [(ICMediaRedownloadRequest *)self->_redownloadRequest progress];
  [v46 addChild:v47 withPendingUnitCount:100];

  v48 = self->_redownloadRequest;
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __47__ATStoreMusicDownloadPrepareOperation_execute__block_invoke_2;
  v49[3] = &unk_1E6B88890;
  v49[4] = self;
  uint64_t v51 = v10;
  id v50 = v6;
  [(ICMediaRedownloadRequest *)v48 performRequestWithResponseHandler:v49];

LABEL_34:
}

void __47__ATStoreMusicDownloadPrepareOperation_execute__block_invoke(uint64_t a1, void *a2)
{
  id v15 = a2;
  objc_super v3 = [MEMORY[0x1E4FB87B8] activeAccount];
  [v15 setIdentity:v3];

  v4 = [MEMORY[0x1E4FB87C0] defaultIdentityStore];
  [v15 setIdentityStore:v4];

  id v5 = ICBundleIdentifierForSystemApplicationType();
  objc_super v6 = [MEMORY[0x1E4FB85B0] defaultInfo];
  v7 = (void *)[v6 mutableCopy];

  [v7 setRequestingBundleIdentifier:v5];
  [v15 setClientInfo:v7];
  v8 = [*(id *)(a1 + 32) asset];
  if ([v8 isForeground])
  {
    uint64_t v9 = 2;
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4FB8608] currentDeviceInfo];
    if ([v10 isWatch]) {
      uint64_t v9 = 5;
    }
    else {
      uint64_t v9 = 1;
    }
  }
  v11 = (void *)[objc_alloc(MEMORY[0x1E4FB8768]) initWithUserInteractionLevel:v9];
  [v15 setAuthenticationProvider:v11];
  id v12 = objc_alloc_init(MEMORY[0x1E4FB8738]);
  uint64_t v13 = [*(id *)(a1 + 32) asset];
  objc_msgSend(v12, "setAllowsHandlingNonAuthenticationDialogs:", objc_msgSend(v13, "isForeground"));

  v14 = (void *)[objc_alloc(MEMORY[0x1E4FB8730]) initWithConfiguration:v12];
  [v15 setStoreDialogResponseHandler:v14];
}

id __47__ATStoreMusicDownloadPrepareOperation_execute__block_invoke_27(uint64_t a1)
{
  v2 = objc_msgSend(MEMORY[0x1E4F290F0], "ic_defaultSessionConfiguration");
  objc_super v3 = [MEMORY[0x1E4FB8608] currentDeviceInfo];
  if (![v3 isWatch]) {
    goto LABEL_4;
  }
  v4 = [*(id *)(a1 + 32) asset];
  if ([v4 canUseCellularData])
  {

LABEL_4:
LABEL_5:
    id v5 = [*(id *)(a1 + 32) asset];
    objc_msgSend(v2, "setAllowsCellularAccess:", objc_msgSend(v5, "canUseCellularData"));

    goto LABEL_6;
  }
  v8 = [*(id *)(a1 + 32) asset];
  int v9 = [v8 canProxyUseCellularData];

  if (!v9) {
    goto LABEL_5;
  }
  objc_msgSend(v2, "set_allowsWCA:", 0);
LABEL_6:
  objc_super v6 = (void *)[objc_alloc(MEMORY[0x1E4FB87A0]) initWithConfiguration:v2];

  return v6;
}

void __47__ATStoreMusicDownloadPrepareOperation_execute__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9
    || [*(id *)(a1 + 32) isCancelled]
    && ([MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:2 userInfo:0],
        (id v9 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v10 = v9;
    int v11 = 0;
  }
  else
  {
    if (*(void *)(a1 + 48) == 3)
    {
      id v12 = [MEMORY[0x1E4FB8600] standardDefaults];
      int v13 = [v12 shouldForceStreamingOnlyKeysForPlayback];

      if (v13)
      {
        v14 = _ATLogCategoryStoreDownloads();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = *(void *)(a1 + 32);
          int v23 = 138543362;
          uint64_t v24 = v15;
          _os_log_impl(&dword_1D9A2D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Resetting default to force streaming-only playback keys now that we have completed a redownload request successfully", (uint8_t *)&v23, 0xCu);
        }

        id v16 = [MEMORY[0x1E4FB8600] standardDefaults];
        [v16 setShouldForceStreamingOnlyKeysForPlayback:0];
      }
    }
    uint64_t v10 = 0;
    int v11 = 1;
  }
  v17 = [v7 items];
  v18 = [v17 firstObject];

  if (v11)
  {
    v19 = objc_alloc_init(ATStoreDownloadOperationResult);
LABEL_18:
    uint64_t v22 = [v7 shouldCancelPurchaseBatch];
    goto LABEL_19;
  }
  v20 = [v10 domain];
  if ([v20 isEqualToString:*MEMORY[0x1E4FB8410]]) {
    BOOL v21 = [v10 code] == -7403;
  }
  else {
    BOOL v21 = 0;
  }

  v19 = objc_alloc_init(ATStoreDownloadOperationResult);
  if (!v21) {
    goto LABEL_18;
  }
  uint64_t v22 = 1;
LABEL_19:
  [(ATStoreDownloadOperationResult *)v19 setCancelAllRemaining:v22];
  [(ATStoreDownloadOperationResult *)v19 setStoreMediaResponseItem:v18];
  [(ATStoreDownloadOperationResult *)v19 setRequestContext:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) finishWithError:v10 operationResult:v19];
}

@end