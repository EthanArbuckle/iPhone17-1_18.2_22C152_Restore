@interface FPFetchPublishingURLOperation
- (FPFetchPublishingURLOperation)initWithItem:(id)a3;
- (NSOperationQueue)presentedItemOperationQueue;
- (NSSet)observedPresentedItemUbiquityAttributes;
- (NSURL)presentedItemURL;
- (id)_t_filePresenterStarted;
- (id)fetchCompletionBlock;
- (void)_setupFilePresenterAndWaitForUpload;
- (void)_tryFetchingSharingURL;
- (void)accommodatePresentedItemDeletionWithCompletionHandler:(id)a3;
- (void)cancel;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)presentedItemDidChangeUbiquityAttributes:(id)a3;
- (void)presentedItemDidMoveToURL:(id)a3;
- (void)setFetchCompletionBlock:(id)a3;
- (void)set_t_filePresenterStarted:(id)a3;
@end

@implementation FPFetchPublishingURLOperation

- (FPFetchPublishingURLOperation)initWithItem:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v14[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  v13.receiver = self;
  v13.super_class = (Class)FPFetchPublishingURLOperation;
  v7 = [(FPActionOperation *)&v13 initWithItemsOfDifferentProviders:v6 action:0];

  if (v7)
  {
    objc_storeStrong((id *)&v7->_item, a3);
    v8 = objc_opt_new();
    [(FPActionOperation *)v7 setProgress:v8];

    uint64_t v9 = objc_opt_new();
    operationQueue = v7->_operationQueue;
    v7->_operationQueue = (NSOperationQueue *)v9;

    v11 = [(FPOperation *)v7 callbackQueue];
    [(NSOperationQueue *)v7->_operationQueue setUnderlyingQueue:v11];

    [(FPActionOperation *)v7 setSetupRemoteOperationService:1];
  }

  return v7;
}

- (NSURL)presentedItemURL
{
  return self->_itemURL;
}

- (NSOperationQueue)presentedItemOperationQueue
{
  return self->_operationQueue;
}

- (void)presentedItemDidChangeUbiquityAttributes:(id)a3
{
  if (([(FPFetchPublishingURLOperation *)self isCancelled] & 1) == 0)
  {
    v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[FPFetchPublishingURLOperation presentedItemDidChangeUbiquityAttributes:]((uint64_t)self, v4, v5, v6, v7, v8, v9, v10);
    }

    v11 = [(FPActionOperation *)self itemManager];
    itemURL = self->_itemURL;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __74__FPFetchPublishingURLOperation_presentedItemDidChangeUbiquityAttributes___block_invoke;
    v13[3] = &unk_1E5AF2828;
    v13[4] = self;
    [v11 fetchItemForURL:itemURL completionHandler:v13];
  }
}

void __74__FPFetchPublishingURLOperation_presentedItemDidChangeUbiquityAttributes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__FPFetchPublishingURLOperation_presentedItemDidChangeUbiquityAttributes___block_invoke_2;
  block[3] = &unk_1E5AF17D0;
  uint64_t v8 = *(void *)(a1 + 32);
  id v12 = v5;
  uint64_t v13 = v8;
  id v14 = v6;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

void __74__FPFetchPublishingURLOperation_presentedItemDidChangeUbiquityAttributes___block_invoke_2(uint64_t a1)
{
  v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __74__FPFetchPublishingURLOperation_presentedItemDidChangeUbiquityAttributes___block_invoke_2_cold_5(a1, v2, v3, v4, v5, v6, v7, v8);
  }

  id v9 = (id *)(a1 + 40);
  if (([*(id *)(a1 + 40) isCancelled] & 1) == 0)
  {
    id v10 = (id *)(a1 + 48);
    if (*(void *)(a1 + 48))
    {
      v11 = fp_current_or_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __74__FPFetchPublishingURLOperation_presentedItemDidChangeUbiquityAttributes___block_invoke_2_cold_4((uint64_t)v9, v10, v11);
      }

      [*v9 completedWithResult:0 error:*v10];
      return;
    }
    uint64_t v13 = *(void **)(a1 + 32);
    id v12 = (uint64_t *)(a1 + 32);
    if ([v13 isUploaded])
    {
      id v14 = fp_current_or_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        __74__FPFetchPublishingURLOperation_presentedItemDidChangeUbiquityAttributes___block_invoke_2_cold_1((uint64_t)v12, v14, v15, v16, v17, v18, v19, v20);
      }

      [*v9 _tryFetchingSharingURL];
      return;
    }
    if (([(id)*v12 isUploading] & 1) == 0)
    {
      v21 = fp_current_or_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        __74__FPFetchPublishingURLOperation_presentedItemDidChangeUbiquityAttributes___block_invoke_2_cold_3(v12, v21);
      }
    }
    v22 = [(id)*v12 uploadingError];

    if (v22)
    {
      v23 = fp_current_or_default_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        __74__FPFetchPublishingURLOperation_presentedItemDidChangeUbiquityAttributes___block_invoke_2_cold_2((id *)v12, v23);
      }

      id v24 = *v9;
      v25 = [(id)*v12 uploadingError];
      [v24 completedWithResult:0 error:v25];

      return;
    }
    if (*((void *)*v9 + 61)) {
      return;
    }
    id v26 = *v9;
    objc_sync_enter(v26);
    v27 = (void *)*((void *)*v9 + 60);
    id v28 = v27;
    objc_sync_exit(v26);

    v29 = [(id)*v12 uploadingProgress];
    if (v28 && ([v28 isIndeterminate] & 1) == 0)
    {
      objc_storeStrong((id *)*v9 + 61, v27);
      v30 = [*v9 progress];
      v31 = v30;
      id v32 = v28;
    }
    else
    {
      if (!v29)
      {
LABEL_27:
        if (*((void *)*v9 + 61))
        {
          v33 = [*v9 progress];
          [v33 startReportingProgress];
        }
        return;
      }
      objc_storeStrong((id *)*v9 + 61, v29);
      v30 = [*v9 progress];
      v31 = v30;
      id v32 = v29;
    }
    [v30 addChild:v32];

    goto LABEL_27;
  }
}

- (NSSet)observedPresentedItemUbiquityAttributes
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F1C790], *MEMORY[0x1E4F1C7A0], 0);
}

- (void)presentedItemDidMoveToURL:(id)a3
{
}

- (void)accommodatePresentedItemDeletionWithCompletionHandler:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v5 = *MEMORY[0x1E4F281F8];
  uint64_t v7 = (void (**)(id, void))a3;
  uint64_t v6 = [v4 errorWithDomain:v5 code:260 userInfo:0];
  [(FPOperation *)self completedWithResult:0 error:v6];

  v7[2](v7, 0);
}

- (void)_setupFilePresenterAndWaitForUpload
{
  uint64_t v4 = [(FPOperation *)self callbackQueue];
  dispatch_assert_queue_V2(v4);

  if (([(FPFetchPublishingURLOperation *)self isCancelled] & 1) == 0)
  {
    if (self->_isFilePresenter)
    {
      uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 handleFailureInMethod:a2 object:self file:@"FPFetchPublishingURLOperation.m" lineNumber:168 description:@"already a file presenter"];
    }
    uint64_t v6 = [(FPActionOperation *)self itemManager];
    item = self->_item;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __68__FPFetchPublishingURLOperation__setupFilePresenterAndWaitForUpload__block_invoke;
    v8[3] = &unk_1E5AF3190;
    v8[4] = self;
    [v6 fetchURLForItem:item completionHandler:v8];

    self->_isFilePresenter = 1;
  }
}

void __68__FPFetchPublishingURLOperation__setupFilePresenterAndWaitForUpload__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__FPFetchPublishingURLOperation__setupFilePresenterAndWaitForUpload__block_invoke_2;
  block[3] = &unk_1E5AF17D0;
  void block[4] = *(void *)(a1 + 32);
  id v11 = v6;
  id v12 = v5;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, block);
}

void __68__FPFetchPublishingURLOperation__setupFilePresenterAndWaitForUpload__block_invoke_2(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    if (*(void *)(a1 + 40) || (uint64_t v3 = *(void **)(a1 + 48)) == 0)
    {
      v2 = *(void **)(a1 + 32);
      objc_msgSend(v2, "completedWithResult:error:", 0);
    }
    else
    {
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 472), v3);
      [MEMORY[0x1E4F28CA0] addFilePresenter:*(void *)(a1 + 32)];
      uint64_t v4 = *(void **)(a1 + 32);
      id v5 = [MEMORY[0x1E4F1CAD0] set];
      [v4 presentedItemDidChangeUbiquityAttributes:v5];

      objc_msgSend(*(id *)(a1 + 32), "_t_filePresenterStarted");
      id v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        uint64_t v7 = v6;
        v6[2]();
        objc_msgSend(*(id *)(a1 + 32), "set_t_filePresenterStarted:", 0);
        id v6 = v7;
      }
    }
  }
}

- (void)_tryFetchingSharingURL
{
  uint64_t v3 = [(FPOperation *)self callbackQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(FPActionOperation *)self remoteServiceProxy];
  id v5 = [(FPItem *)self->_item itemID];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__FPFetchPublishingURLOperation__tryFetchingSharingURL__block_invoke;
  v8[3] = &unk_1E5AF3190;
  v8[4] = self;
  id v6 = [v4 fetchPublishingURLForItemID:v5 completionHandler:v8];

  uint64_t v7 = self;
  objc_sync_enter(v7);
  objc_storeStrong((id *)&v7->_remoteCancellableProgress, v6);
  if ([(FPFetchPublishingURLOperation *)v7 isCancelled]) {
    [(NSProgress *)v7->_remoteCancellableProgress cancel];
  }
  objc_sync_exit(v7);
}

void __55__FPFetchPublishingURLOperation__tryFetchingSharingURL__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__FPFetchPublishingURLOperation__tryFetchingSharingURL__block_invoke_2;
  block[3] = &unk_1E5AF17D0;
  uint64_t v8 = *(void *)(a1 + 32);
  id v12 = v6;
  uint64_t v13 = v8;
  id v14 = v5;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v7, block);
}

uint64_t __55__FPFetchPublishingURLOperation__tryFetchingSharingURL__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) domain];
  if ([v2 isEqualToString:@"NSFileProviderErrorDomain"]
    && [*(id *)(a1 + 32) code] == -5006)
  {
    int v3 = *(unsigned __int8 *)(*(void *)(a1 + 40) + 456);

    if (!v3)
    {
      uint64_t v4 = *(void **)(a1 + 40);
      return [v4 _setupFilePresenterAndWaitForUpload];
    }
  }
  else
  {
  }
  id v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 32);

  return [v6 completedWithResult:v7 error:v8];
}

- (void)cancel
{
  v5.receiver = self;
  v5.super_class = (Class)FPFetchPublishingURLOperation;
  [(FPOperation *)&v5 cancel];
  int v3 = self;
  objc_sync_enter(v3);
  [(NSProgress *)v3->_remoteCancellableProgress cancel];
  remoteCancellableProgress = v3->_remoteCancellableProgress;
  v3->_remoteCancellableProgress = 0;

  objc_sync_exit(v3);
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [MEMORY[0x1E4F28CA0] removeFilePresenter:self];
  uint64_t v8 = [(FPFetchPublishingURLOperation *)self fetchCompletionBlock];
  id v9 = (void *)v8;
  if (v8)
  {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v6, v7);
    [(FPFetchPublishingURLOperation *)self setFetchCompletionBlock:0];
  }

  v10.receiver = self;
  v10.super_class = (Class)FPFetchPublishingURLOperation;
  [(FPActionOperation *)&v10 finishWithResult:v6 error:v7];
}

- (id)fetchCompletionBlock
{
  return self->_fetchCompletionBlock;
}

- (void)setFetchCompletionBlock:(id)a3
{
}

- (id)_t_filePresenterStarted
{
  return self->__t_filePresenterStarted;
}

- (void)set_t_filePresenterStarted:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__t_filePresenterStarted, 0);
  objc_storeStrong(&self->_fetchCompletionBlock, 0);
  objc_storeStrong((id *)&self->_itemUploadProgress, 0);
  objc_storeStrong((id *)&self->_remoteCancellableProgress, 0);
  objc_storeStrong((id *)&self->_itemURL, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);

  objc_storeStrong((id *)&self->_item, 0);
}

- (void)presentedItemDidChangeUbiquityAttributes:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __74__FPFetchPublishingURLOperation_presentedItemDidChangeUbiquityAttributes___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __74__FPFetchPublishingURLOperation_presentedItemDidChangeUbiquityAttributes___block_invoke_2_cold_2(id *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = [*a1 uploadingError];
  uint64_t v4 = objc_msgSend(v3, "fp_prettyDescription");
  int v5 = 138412290;
  id v6 = v4;
  _os_log_error_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_ERROR, "[ERROR] item failed to upload: %@", (uint8_t *)&v5, 0xCu);
}

void __74__FPFetchPublishingURLOperation_presentedItemDidChangeUbiquityAttributes___block_invoke_2_cold_3(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_ERROR, "[ERROR] we're waiting on upload but the item is not uploading: %@", (uint8_t *)&v3, 0xCu);
}

void __74__FPFetchPublishingURLOperation_presentedItemDidChangeUbiquityAttributes___block_invoke_2_cold_4(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(*(void *)a1 + 472);
  uint64_t v5 = objc_msgSend(*a2, "fp_prettyDescription");
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_error_impl(&dword_1A33AE000, a3, OS_LOG_TYPE_ERROR, "[ERROR] couldn't get updated item for url %@; %@",
    (uint8_t *)&v6,
    0x16u);
}

void __74__FPFetchPublishingURLOperation_presentedItemDidChangeUbiquityAttributes___block_invoke_2_cold_5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end