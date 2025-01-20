@interface ATStoreDownloadOperation
- (ATAsset)asset;
- (ATStoreDownloadOperation)initWithAsset:(id)a3;
- (ATStoreDownloadOperationResult)_operationResult;
- (id)description;
- (void)finishWithError:(id)a3 operationResult:(id)a4;
- (void)performOnOperationQueue:(id)a3 completion:(id)a4;
- (void)set_operationResult:(id)a3;
@end

@implementation ATStoreDownloadOperation

- (void).cxx_destruct
{
}

- (void)set_operationResult:(id)a3
{
  self->__operationResult = (ATStoreDownloadOperationResult *)a3;
}

- (ATStoreDownloadOperationResult)_operationResult
{
  return self->__operationResult;
}

- (ATAsset)asset
{
  return self->_asset;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)ATStoreDownloadOperation;
  v4 = [(ATStoreDownloadOperation *)&v11 description];
  v5 = [(ATStoreDownloadOperation *)self asset];
  v6 = [v5 identifier];
  v7 = [(ATStoreDownloadOperation *)self asset];
  v8 = [v7 prettyName];
  v9 = [v3 stringWithFormat:@"%@ (%@ : %@)", v4, v6, v8];

  return v9;
}

- (void)finishWithError:(id)a3 operationResult:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = objc_msgSend(MEMORY[0x1E4F28C58], "at_ATErrorFromError:", v6);
  v9 = _ATLogCategoryStoreDownloads();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v14 = self;
    __int16 v15 = 2114;
    id v16 = v6;
    __int16 v17 = 2114;
    id v18 = v7;
    _os_log_impl(&dword_1D9A2D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ finished. err=%{public}@, result=%{public}@", buf, 0x20u);
  }

  [(ATStoreDownloadOperation *)self set_operationResult:v7];
  if (!v8)
  {
    v10 = [(ICRequestOperation *)self progress];
    objc_super v11 = [(ICRequestOperation *)self progress];
    objc_msgSend(v10, "setCompletedUnitCount:", objc_msgSend(v11, "totalUnitCount"));
  }
  v12.receiver = self;
  v12.super_class = (Class)ATStoreDownloadOperation;
  [(ICRequestOperation *)&v12 finishWithError:v8];
}

- (void)performOnOperationQueue:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__ATStoreDownloadOperation_performOnOperationQueue_completion___block_invoke;
  v8[3] = &unk_1E6B88CF8;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(ICRequestOperation *)self performRequestOnOperationQueue:a3 withCompletionHandler:v8];
}

void __63__ATStoreDownloadOperation_performOnOperationQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 _operationResult];
  (*(void (**)(uint64_t, id, id))(v2 + 16))(v2, v4, v5);
}

- (ATStoreDownloadOperation)initWithAsset:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATStoreDownloadOperation;
  id v6 = [(ICRequestOperation *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_asset, a3);
    if ([v5 isPrioritized]) {
      [(ATStoreDownloadOperation *)v7 setQueuePriority:8];
    }
  }

  return v7;
}

@end