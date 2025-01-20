@interface ATStoreBookDownloadAssetsOperation
- (void)cancel;
- (void)dealloc;
- (void)downloadQueue:(id)a3 downloadStates:(id)a4 didCompleteWithError:(id)a5;
- (void)downloadQueue:(id)a3 downloadStatesDidChange:(id)a4;
- (void)execute;
- (void)finishWithError:(id)a3 operationResult:(id)a4;
@end

@implementation ATStoreBookDownloadAssetsOperation

- (void).cxx_destruct
{
}

- (void)downloadQueue:(id)a3 downloadStates:(id)a4 didCompleteWithError:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        if (self->_bookDownloadID)
        {
          v14 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "downloadID", (void)v17);
          int v15 = [v14 isEqualToString:self->_bookDownloadID];

          if (v15)
          {
            v16 = objc_msgSend(MEMORY[0x1E4F28C58], "at_ATErrorFromError:", v8);
            [(ATStoreBookDownloadAssetsOperation *)self finishWithError:v16 operationResult:0];

            goto LABEL_12;
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_12:
}

- (void)downloadQueue:(id)a3 downloadStatesDidChange:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = a4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        if (self->_bookDownloadID)
        {
          uint64_t v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          uint64_t v11 = objc_msgSend(v10, "downloadID", (void)v25);
          int v12 = [v11 isEqualToString:self->_bookDownloadID];

          if (v12)
          {
            if ([v10 downloadPhase] == 2)
            {
              v13 = [v10 transferBytesWritten];
              [v13 floatValue];
              float v15 = v14;

              v16 = [v10 transferBytesExpected];
              [v16 floatValue];
              float v18 = v17;

              long long v19 = _ATLogCategoryStoreDownloads();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                long long v20 = [(ATStoreDownloadOperation *)self asset];
                *(_DWORD *)buf = 138543874;
                v30 = self;
                __int16 v31 = 2114;
                v32 = v20;
                __int16 v33 = 2048;
                double v34 = (float)(v15 / v18);
                _os_log_impl(&dword_1D9A2D000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ : %.2f", buf, 0x20u);
              }
              v21 = [(ICRequestOperation *)self progress];
              uint64_t v22 = [v10 transferBytesExpected];
              objc_msgSend(v21, "setTotalUnitCount:", objc_msgSend(v22, "longLongValue"));

              v23 = [(ICRequestOperation *)self progress];
              v24 = [v10 transferBytesWritten];
              objc_msgSend(v23, "setCompletedUnitCount:", objc_msgSend(v24, "longLongValue"));
            }
            goto LABEL_15;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v35 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_15:
}

- (void)finishWithError:(id)a3 operationResult:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _ATLogCategoryStoreDownloads();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v11 = self;
    __int16 v12 = 2114;
    id v13 = v6;
    _os_log_impl(&dword_1D9A2D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ finished download with error %{public}@.", buf, 0x16u);
  }

  v9.receiver = self;
  v9.super_class = (Class)ATStoreBookDownloadAssetsOperation;
  [(ATStoreDownloadOperation *)&v9 finishWithError:v6 operationResult:v7];
}

- (void)cancel
{
  if (self->_bookDownloadID)
  {
    v3 = [getBLDownloadQueueNonUIClass() sharedInstance];
    bookDownloadID = self->_bookDownloadID;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __44__ATStoreBookDownloadAssetsOperation_cancel__block_invoke;
    v6[3] = &unk_1E6B88AF0;
    v6[4] = self;
    [v3 cancelDownloadWithID:bookDownloadID withCompletion:v6];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)ATStoreBookDownloadAssetsOperation;
    [(ATStoreBookDownloadAssetsOperation *)&v5 cancel];
  }
}

id __44__ATStoreBookDownloadAssetsOperation_cancel__block_invoke(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)ATStoreBookDownloadAssetsOperation;
  return objc_msgSendSuper2(&v2, sel_cancel);
}

- (void)execute
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if ([(ATStoreBookDownloadAssetsOperation *)self isCancelled])
  {
    id v26 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:2 userInfo:0];
    [(ATStoreBookDownloadAssetsOperation *)self finishWithError:v26 operationResult:0];
  }
  else
  {
    v3 = [(ATStoreDownloadOperation *)self asset];
    v4 = [v3 storeInfo];
    objc_super v5 = _ATLogCategoryStoreDownloads();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v3;
      _os_log_impl(&dword_1D9A2D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Starting download for asset %{public}@.", buf, 0x16u);
    }

    id v6 = [getBLDownloadQueueNonUIClass() sharedInstance];
    [v6 addObserver:self];
    if ([v3 isRestore])
    {
      id v7 = [v3 storeInfo];
      uint64_t v8 = [v7 downloadDictionary];
      objc_super v9 = (void *)[v8 mutableCopy];

      [v9 setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4FA85D0]];
      uint64_t v10 = [v3 assetType];
      int v11 = [v10 isEqualToString:@"Audiobook"];
      __int16 v12 = (void *)MEMORY[0x1E4FA8470];
      if (!v11) {
        __int16 v12 = (void *)MEMORY[0x1E4FA8480];
      }
      [v9 setObject:*v12 forKey:*MEMORY[0x1E4FA85E8]];

      uint64_t v29 = 0;
      v30 = &v29;
      uint64_t v31 = 0x2050000000;
      id v13 = (void *)getBLRestoreRequestItemClass_softClass;
      uint64_t v32 = getBLRestoreRequestItemClass_softClass;
      if (!getBLRestoreRequestItemClass_softClass)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getBLRestoreRequestItemClass_block_invoke;
        v35 = &unk_1E6B88D48;
        uint64_t v36 = &v29;
        __getBLRestoreRequestItemClass_block_invoke((uint64_t)buf);
        id v13 = (void *)v30[3];
      }
      uint64_t v14 = v13;
      _Block_object_dispose(&v29, 8);
      id v15 = [v14 alloc];
      v16 = [v3 storeInfo];
      float v17 = [v16 assetDictionary];
      float v18 = (void *)[v15 initWithDownloadDictionary:v9 assetDictionary:v17];

      __int16 v33 = v18;
      long long v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __45__ATStoreBookDownloadAssetsOperation_execute__block_invoke;
      v28[3] = &unk_1E6B880B0;
      v28[4] = self;
      [v6 addDownloadsWithRestoreContentRequestItems:v19 completion:v28];
    }
    else
    {
      uint64_t v29 = 0;
      v30 = &v29;
      uint64_t v31 = 0x2050000000;
      long long v20 = (void *)getBLPurchaseRequestClass_softClass;
      uint64_t v32 = getBLPurchaseRequestClass_softClass;
      if (!getBLPurchaseRequestClass_softClass)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getBLPurchaseRequestClass_block_invoke;
        v35 = &unk_1E6B88D48;
        uint64_t v36 = &v29;
        __getBLPurchaseRequestClass_block_invoke((uint64_t)buf);
        long long v20 = (void *)v30[3];
      }
      id v21 = v20;
      _Block_object_dispose(&v29, 8);
      uint64_t v22 = [v4 redownloadParams];
      v23 = [v4 adamID];
      objc_super v9 = [v21 requestWithBuyParameters:v22 storeIdentifier:v23];

      objc_msgSend(v9, "setRestore:", objc_msgSend(v3, "isRestore"));
      v24 = [v3 assetType];
      objc_msgSend(v9, "setAudiobook:", objc_msgSend(v24, "isEqualToString:", @"Audiobook"));

      long long v25 = [v4 DSID];
      [v9 setAccountIdentifier:v25];

      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __45__ATStoreBookDownloadAssetsOperation_execute__block_invoke_8;
      v27[3] = &unk_1E6B880D8;
      v27[4] = self;
      [v6 purchaseWithRequest:v9 completion:v27];
    }
  }
}

void __45__ATStoreBookDownloadAssetsOperation_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a3;
  id v6 = [a2 firstObject];
  uint64_t v7 = [v6 downloadID];

  uint64_t v8 = _ATLogCategoryStoreDownloads();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v15 = 138543874;
    uint64_t v16 = v9;
    __int16 v17 = 2114;
    uint64_t v18 = v5;
    __int16 v19 = 2114;
    uint64_t v20 = v7;
    _os_log_impl(&dword_1D9A2D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Finished adding restore download with err %{public}@. downloadID=%{public}@", (uint8_t *)&v15, 0x20u);
  }

  if (!(v5 | v7))
  {
    uint64_t v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:0 userInfo:0];
  }
  if (v5)
  {
    uint64_t v10 = objc_alloc_init(ATStoreDownloadOperationResult);
    [(ATStoreDownloadOperationResult *)v10 setCancelAllRemaining:AMSErrorIsEqual()];
    int v11 = *(void **)(a1 + 32);
    __int16 v12 = objc_msgSend(MEMORY[0x1E4F28C58], "at_ATErrorFromError:", v5);
    [v11 finishWithError:v12 operationResult:v10];
  }
  else
  {
    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = (id)v7;
    uint64_t v10 = *(ATStoreDownloadOperationResult **)(v13 + 328);
    *(void *)(v13 + 328) = v14;
  }
}

void __45__ATStoreBookDownloadAssetsOperation_execute__block_invoke_8(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  uint64_t v8 = _ATLogCategoryStoreDownloads();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v13 = 138543874;
    uint64_t v14 = v9;
    __int16 v15 = 2114;
    id v16 = v7;
    __int16 v17 = 2114;
    id v18 = v6;
    _os_log_impl(&dword_1D9A2D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Completed purchase with err %{public}@. downloadID=%{public}@", (uint8_t *)&v13, 0x20u);
  }

  uint64_t v10 = *(void **)(a1 + 32);
  if (v7)
  {
    int v11 = objc_msgSend(MEMORY[0x1E4F28C58], "at_ATErrorFromError:", v7);
    [v10 finishWithError:v11 operationResult:0];
  }
  else
  {
    id v12 = v6;
    int v11 = (void *)v10[41];
    v10[41] = v12;
  }
}

- (void)dealloc
{
  v3 = [getBLDownloadQueueNonUIClass() sharedInstance];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ATStoreBookDownloadAssetsOperation;
  [(ATStoreBookDownloadAssetsOperation *)&v4 dealloc];
}

@end