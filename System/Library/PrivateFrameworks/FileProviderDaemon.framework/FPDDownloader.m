@interface FPDDownloader
- (BOOL)isDryRun;
- (FPDDomain)domain;
- (FPDDownloader)initWithDomain:(id)a3 callbackQueue:(id)a4;
- (NSProgress)cancellationProgress;
- (NSProgress)progress;
- (void)_cleanup;
- (void)_createChildItem:(id)a3;
- (void)_didDownloadItem:(id)a3 withError:(id)a4;
- (void)_downloadItem:(id)a3 recursively:(unint64_t)a4 retryCount:(int)a5 request:(id)a6 withCompletion:(id)a7;
- (void)_logRootProgress;
- (void)_nonRecursiveDownloadOfItem:(id)a3 request:(id)a4 perItemCompletion:(id)a5 withCompletion:(id)a6;
- (void)_progressComputationPreflightForRecursiveRoot:(id)a3 completion:(id)a4;
- (void)_recursiveDownloadOfItem:(id)a3 request:(id)a4 recursively:(unint64_t)a5 perItemCompletion:(id)a6 withCompletion:(id)a7;
- (void)_stopTrackingFileURLs;
- (void)cancel;
- (void)dealloc;
- (void)downloadItem:(id)a3 recursively:(unint64_t)a4 request:(id)a5 withCompletion:(id)a6;
- (void)downloadURL:(id)a3 recursively:(unint64_t)a4 request:(id)a5 withCompletion:(id)a6;
- (void)setDryRun:(BOOL)a3;
@end

@implementation FPDDownloader

- (void)dealloc
{
  [(FPDDownloader *)self _cleanup];
  v3.receiver = self;
  v3.super_class = (Class)FPDDownloader;
  [(FPDDownloader *)&v3 dealloc];
}

- (void)cancel
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] Downloader has been cancelled, cancelling all ongoing materializations.", v2, v3, v4, v5, v6);
}

- (FPDDownloader)initWithDomain:(id)a3 callbackQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(FPDDownloader *)self init];
  if (v8)
  {
    v9 = fp_current_or_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[FPDDownloader initWithDomain:callbackQueue:]();
    }

    objc_storeWeak((id *)&v8->_domain, v6);
    objc_storeStrong((id *)&v8->_callbackQueue, a4);
    uint64_t v10 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:1];
    cancellationProgress = v8->_cancellationProgress;
    v8->_cancellationProgress = (NSProgress *)v10;

    [(NSProgress *)v8->_cancellationProgress setCancellable:1];
    uint64_t v12 = objc_opt_new();
    parentToChildMap = v8->_parentToChildMap;
    v8->_parentToChildMap = (NSMutableDictionary *)v12;

    uint64_t v14 = objc_opt_new();
    childProxies = v8->_childProxies;
    v8->_childProxies = (NSMutableDictionary *)v14;
  }
  return v8;
}

- (void)_cleanup
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] downloader: Untracking childProxies and unpublishing root progress", v2, v3, v4, v5, v6);
}

- (void)_progressComputationPreflightForRecursiveRoot:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id location = 0;
  objc_initWeak(&location, self);
  [(NSProgress *)self->_progress setCancellationHandler:&__block_literal_global];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __74__FPDDownloader__progressComputationPreflightForRecursiveRoot_completion___block_invoke_2;
  v14[3] = &unk_1E6A733A0;
  v14[4] = self;
  objc_copyWeak(&v15, &location);
  v8 = (void *)MEMORY[0x1D9471EC0](v14);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__FPDDownloader__progressComputationPreflightForRecursiveRoot_completion___block_invoke_4;
  v12[3] = &unk_1E6A733A0;
  v12[4] = self;
  objc_copyWeak(&v13, &location);
  v9 = (void *)MEMORY[0x1D9471EC0](v12);
  uint64_t v10 = +[FPDDownloadManager sharedInstance];
  id v11 = objc_loadWeakRetained(&location);
  [v10 progressComputationPreflightForRecursiveRoot:v6 downloader:v11 itemProgressNeedsSetup:v9 itemProgressSetup:v8 completion:v7];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __74__FPDDownloader__progressComputationPreflightForRecursiveRoot_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74__FPDDownloader__progressComputationPreflightForRecursiveRoot_completion___block_invoke_3;
  v6[3] = &unk_1E6A73378;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);

  objc_destroyWeak(&v8);
}

void __74__FPDDownloader__progressComputationPreflightForRecursiveRoot_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _createChildItem:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

void __74__FPDDownloader__progressComputationPreflightForRecursiveRoot_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74__FPDDownloader__progressComputationPreflightForRecursiveRoot_completion___block_invoke_5;
  v6[3] = &unk_1E6A73378;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);

  objc_destroyWeak(&v8);
}

void __74__FPDDownloader__progressComputationPreflightForRecursiveRoot_completion___block_invoke_5(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v3 = WeakRetained[2];
    objc_sync_enter(v3);
    uint64_t v4 = [*(id *)(a1 + 32) parentItemID];
    id v5 = [v6[2] objectForKeyedSubscript:v4];
    if (!v5) {
      id v5 = objc_opt_new();
    }
    [v5 addObject:*(void *)(a1 + 32)];
    [v6[2] setObject:v5 forKeyedSubscript:v4];

    objc_sync_exit(v3);
    id WeakRetained = v6;
  }
}

- (void)_stopTrackingFileURLs
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 progress];
  uint64_t v4 = [v3 fileURL];
  int v5 = 138412290;
  id v6 = v4;
  _os_log_debug_impl(&dword_1D744C000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] downloader: Will stop tracking all urls for root URL %@", (uint8_t *)&v5, 0xCu);
}

- (void)_createChildItem:(id)a3
{
  id v4 = a3;
  int v5 = objc_opt_new();
  id v6 = [v4 fileURL];
  [v5 setFileURL:v6];

  uint64_t v7 = [(FPDDownloader *)self progress];
  id v8 = [v4 documentSize];
  objc_msgSend(v7, "addChild:withPendingUnitCount:", v5, objc_msgSend(v8, "integerValue"));

  v9 = [v4 fileURL];
  [v5 startTrackingFileURL:v9 kind:*MEMORY[0x1E4F28858] allowReadPausedProgressFromDisk:0];

  childProxies = self->_childProxies;
  id v11 = [v4 itemID];

  [(NSMutableDictionary *)childProxies setObject:v5 forKey:v11];
  uint64_t v12 = fp_current_or_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[FPDDownloader _createChildItem:](self);
  }
}

- (void)_logRootProgress
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] downloader: logging root progress", v2, v3, v4, v5, v6);
}

void __33__FPDDownloader__logRootProgress__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = [WeakRetained progress];
    uint64_t v5 = [v4 fileCompletedCount];
    uint64_t v6 = [v5 unsignedIntegerValue];
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);

    if (v6 != v7)
    {
      id v8 = [v3 progress];
      v9 = [v8 fileCompletedCount];
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v9 unsignedIntegerValue];

      uint64_t v10 = fp_current_or_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        __33__FPDDownloader__logRootProgress__block_invoke_cold_1(v3);
      }
    }
  }
}

- (void)downloadURL:(id)a3 recursively:(unint64_t)a4 request:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = +[FPDDownloadManager sharedInstance];
  uint64_t v14 = [(FPDDownloader *)self domain];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __64__FPDDownloader_downloadURL_recursively_request_withCompletion___block_invoke;
  v18[3] = &unk_1E6A733F0;
  id v19 = v10;
  v20 = self;
  id v22 = v12;
  unint64_t v23 = a4;
  id v21 = v11;
  id v15 = v11;
  id v16 = v12;
  id v17 = v10;
  [v13 retrieveFPItemForURL:v17 domain:v14 request:v15 completion:v18];
}

void __64__FPDDownloader_downloadURL_recursively_request_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __64__FPDDownloader_downloadURL_recursively_request_withCompletion___block_invoke_cold_2();
    }

    [*(id *)(a1 + 40) _cleanup];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v8 = [v5 fileURL];

    if (!v8) {
      [v5 setFileURL:*(void *)(a1 + 32)];
    }
    v9 = fp_current_or_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __64__FPDDownloader_downloadURL_recursively_request_withCompletion___block_invoke_cold_1();
    }

    [*(id *)(a1 + 40) downloadItem:v5 recursively:*(void *)(a1 + 64) request:*(void *)(a1 + 48) withCompletion:*(void *)(a1 + 56)];
  }
}

- (void)downloadItem:(id)a3 recursively:(unint64_t)a4 request:(id)a5 withCompletion:(id)a6
{
}

- (void)_downloadItem:(id)a3 recursively:(unint64_t)a4 retryCount:(int)a5 request:(id)a6 withCompletion:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __77__FPDDownloader__downloadItem_recursively_retryCount_request_withCompletion___block_invoke;
  v26[3] = &unk_1E6A73440;
  v26[4] = self;
  id v15 = (void *)MEMORY[0x1D9471EC0](v26);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __77__FPDDownloader__downloadItem_recursively_retryCount_request_withCompletion___block_invoke_3;
  v20[3] = &unk_1E6A73490;
  v20[4] = self;
  id v16 = v12;
  id v21 = v16;
  unint64_t v24 = a4;
  int v25 = a5;
  id v17 = v13;
  id v22 = v17;
  id v23 = v14;
  id v18 = v14;
  id v19 = (void *)MEMORY[0x1D9471EC0](v20);
  if (a4 && (([v16 isFolder] & 1) != 0 || objc_msgSend(v16, "isPackage"))) {
    [(FPDDownloader *)self _recursiveDownloadOfItem:v16 request:v17 recursively:a4 perItemCompletion:v15 withCompletion:v19];
  }
  else {
    [(FPDDownloader *)self _nonRecursiveDownloadOfItem:v16 request:v17 perItemCompletion:v15 withCompletion:v19];
  }
}

void __77__FPDDownloader__downloadItem_recursively_retryCount_request_withCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  uint64_t v8 = *(void *)(a1 + 32);
  v9 = *(NSObject **)(v8 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__FPDDownloader__downloadItem_recursively_retryCount_request_withCompletion___block_invoke_2;
  block[3] = &unk_1E6A73418;
  block[4] = v8;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

uint64_t __77__FPDDownloader__downloadItem_recursively_retryCount_request_withCompletion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didDownloadItem:*(void *)(a1 + 40) withError:*(void *)(a1 + 48)];
}

void __77__FPDDownloader__downloadItem_recursively_retryCount_request_withCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__FPDDownloader__downloadItem_recursively_retryCount_request_withCompletion___block_invoke_4;
  block[3] = &unk_1E6A73468;
  id v9 = v3;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v5;
  uint64_t v11 = v6;
  uint64_t v14 = *(void *)(a1 + 64);
  int v15 = *(_DWORD *)(a1 + 72);
  id v12 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  id v7 = v3;
  dispatch_async(v4, block);
}

void __77__FPDDownloader__downloadItem_recursively_retryCount_request_withCompletion___block_invoke_4(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id v3 = fp_current_or_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __77__FPDDownloader__downloadItem_recursively_retryCount_request_withCompletion___block_invoke_4_cold_4(a1, v2);
  }

  if (!v2)
  {
    uint64_t v4 = [*(id *)(a1 + 48) progress];
    id v5 = [v4 fileTotalCount];

    if (v5)
    {
      uint64_t v6 = [*(id *)(a1 + 48) progress];
      id v7 = [v6 fileTotalCount];
      uint64_t v8 = [*(id *)(a1 + 48) progress];
      [v8 setFileCompletedCount:v7];
    }
  }
  id v9 = fp_current_or_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __77__FPDDownloader__downloadItem_recursively_retryCount_request_withCompletion___block_invoke_4_cold_3(a1);
  }

  [*(id *)(a1 + 48) _cleanup];
  id v10 = [v2 domain];
  if (![v10 isEqual:*MEMORY[0x1E4F25C50]]) {
    goto LABEL_21;
  }
  uint64_t v11 = [v2 code];

  if (v11 != 14)
  {
LABEL_22:
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    goto LABEL_23;
  }
  uint64_t v12 = *(void *)(a1 + 72);
  if (!v12)
  {
LABEL_19:
    id v10 = fp_current_or_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __77__FPDDownloader__downloadItem_recursively_retryCount_request_withCompletion___block_invoke_4_cold_1(a1, v10);
    }
LABEL_21:

    goto LABEL_22;
  }
  if (*(int *)(a1 + 80) > 49)
  {
    if (v12 == 1)
    {
      uint64_t v14 = fp_current_or_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v15 = 0;
        _os_log_impl(&dword_1D744C000, v14, OS_LOG_TYPE_DEFAULT, "[NOTICE] downloader: tree changes too much when downloading its content, lying about download", v15, 2u);
      }

      id v2 = 0;
    }
    goto LABEL_19;
  }
  id v13 = fp_current_or_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    __77__FPDDownloader__downloadItem_recursively_retryCount_request_withCompletion___block_invoke_4_cold_2();
  }

  [*(id *)(a1 + 48) _downloadItem:*(void *)(a1 + 40) recursively:*(void *)(a1 + 72) retryCount:(*(_DWORD *)(a1 + 80) + 1) request:*(void *)(a1 + 56) withCompletion:*(void *)(a1 + 64)];
LABEL_23:
}

- (void)_nonRecursiveDownloadOfItem:(id)a3 request:(id)a4 perItemCompletion:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id location = 0;
  objc_initWeak(&location, self);
  uint64_t v14 = +[FPDDownloadManager sharedInstance];
  id v15 = objc_loadWeakRetained(&location);
  [v14 downloadItem:v10 recursively:0 downloader:v15 request:v11 perItemCompletion:v12 withCompletion:v13];

  objc_destroyWeak(&location);
}

- (void)_recursiveDownloadOfItem:(id)a3 request:(id)a4 recursively:(unint64_t)a5 perItemCompletion:(id)a6 withCompletion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id location = 0;
  objc_initWeak(&location, self);
  id v16 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:-1];
  progress = self->_progress;
  self->_progress = v16;

  [(NSProgress *)self->_progress fp_setFileOperationKind:*MEMORY[0x1E4F28858]];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __95__FPDDownloader__recursiveDownloadOfItem_request_recursively_perItemCompletion_withCompletion___block_invoke;
  v22[3] = &unk_1E6A734E0;
  v22[4] = self;
  id v18 = v12;
  id v23 = v18;
  v27[1] = (id)a5;
  objc_copyWeak(v27, &location);
  id v19 = v13;
  id v24 = v19;
  id v20 = v14;
  id v25 = v20;
  id v21 = v15;
  id v26 = v21;
  [(FPDDownloader *)self _progressComputationPreflightForRecursiveRoot:v18 completion:v22];

  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
}

void __95__FPDDownloader__recursiveDownloadOfItem_request_recursively_perItemCompletion_withCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _logRootProgress];
  id v2 = +[FPDDownloadManager sharedInstance];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 80);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __95__FPDDownloader__recursiveDownloadOfItem_request_recursively_perItemCompletion_withCompletion___block_invoke_2;
  v10[3] = &unk_1E6A734B8;
  id v12 = *(id *)(a1 + 64);
  id v8 = *(id *)(a1 + 40);
  id v9 = *(void **)(a1 + 80);
  id v11 = v8;
  v13[1] = v9;
  objc_copyWeak(v13, (id *)(a1 + 72));
  [v2 downloadItem:v3 recursively:v4 downloader:WeakRetained request:v6 perItemCompletion:v7 withCompletion:v10];
  objc_destroyWeak(v13);
}

void __95__FPDDownloader__recursiveDownloadOfItem_request_recursively_perItemCompletion_withCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
  else
  {
    id v7 = +[FPDDownloadManager sharedInstance];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 56);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [v7 verifyIfSubtreeIsFullyMaterializedBelowItem:v4 recursively:v5 downloader:WeakRetained completion:*(void *)(a1 + 40)];
  }
}

- (void)_didDownloadItem:(id)a3 withError:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v43 = a3;
  id v42 = a4;
  if (v42)
  {
    uint64_t v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[FPDDownloader _didDownloadItem:withError:](v43, v42, v5);
    }
  }
  if ([v43 isFolder])
  {
    uint64_t v6 = self->_parentToChildMap;
    objc_sync_enter(v6);
    id v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v39 = [v43 itemID];
      v40 = [v39 identifier];
      v41 = [v43 fileURL];
      *(_DWORD *)buf = 138412546;
      v51 = v40;
      __int16 v52 = 2112;
      v53 = v41;
      _os_log_debug_impl(&dword_1D744C000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] downloader: Finished downloading folder (%@) %@.", buf, 0x16u);
    }
    parentToChildMap = self->_parentToChildMap;
    id v9 = [v43 itemID];
    id v10 = [(NSMutableDictionary *)parentToChildMap objectForKeyedSubscript:v9];

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v45 objects:v49 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v46 != v13) {
            objc_enumerationMutation(v11);
          }
          id v15 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          id v16 = [v15 fileURL];
          BOOL v17 = v16 == 0;

          if (v17)
          {
            id v18 = [v43 fileURL];
            id v19 = [v15 filename];
            id v20 = objc_msgSend(v18, "URLByAppendingPathComponent:isDirectory:", v19, objc_msgSend(v15, "isFolder"));

            id v21 = fp_current_or_default_log();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              id v23 = v6;
              id v24 = [v43 fileURL];
              id v25 = [v15 filename];
              *(_DWORD *)buf = 138412546;
              v51 = v24;
              __int16 v52 = 2112;
              v53 = v25;
              _os_log_error_impl(&dword_1D744C000, v21, OS_LOG_TYPE_ERROR, "[ERROR] downloader: folder %@ child filename %@.", buf, 0x16u);

              uint64_t v6 = v23;
            }

            [v15 setFileURL:v20];
          }
          id v22 = [v15 fileURL];

          if (v22) {
            [(FPDDownloader *)self _createChildItem:v15];
          }
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v45 objects:v49 count:16];
      }
      while (v12);
    }

    id v26 = self->_parentToChildMap;
    v27 = [v43 itemID];
    [(NSMutableDictionary *)v26 removeObjectForKey:v27];

    objc_sync_exit(v6);
  }
  else
  {
    childProxies = self->_childProxies;
    v29 = [v43 itemID];
    uint64_t v6 = [(NSMutableDictionary *)childProxies objectForKeyedSubscript:v29];

    if (v6) {
      BOOL v30 = v42 == 0;
    }
    else {
      BOOL v30 = 0;
    }
    if (v30)
    {
      [(NSMutableDictionary *)v6 stopTrackingIfStarted];
      v31 = self->_childProxies;
      v32 = [v43 itemID];
      [(NSMutableDictionary *)v31 removeObjectForKey:v32];

      v33 = NSNumber;
      v34 = [(FPDDownloader *)self progress];
      v35 = [v34 fileCompletedCount];
      v36 = objc_msgSend(v33, "numberWithInt:", objc_msgSend(v35, "intValue") + 1);
      v37 = [(FPDDownloader *)self progress];
      [v37 setFileCompletedCount:v36];

      v38 = fp_current_or_default_log();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
        -[FPDDownloader _didDownloadItem:withError:](v43, v6, v38);
      }
    }
  }
}

- (FPDDomain)domain
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_domain);
  return (FPDDomain *)WeakRetained;
}

- (NSProgress)cancellationProgress
{
  return self->_cancellationProgress;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (BOOL)isDryRun
{
  return self->_dryRun;
}

- (void)setDryRun:(BOOL)a3
{
  self->_dryRun = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_cancellationProgress, 0);
  objc_destroyWeak((id *)&self->_domain);
  objc_storeStrong((id *)&self->_observation, 0);
  objc_storeStrong((id *)&self->_childProxies, 0);
  objc_storeStrong((id *)&self->_parentToChildMap, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

- (void)initWithDomain:callbackQueue:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] downloader: initiated", v2, v3, v4, v5, v6);
}

- (void)_createChildItem:(void *)a1 .cold.1(void *a1)
{
  uint64_t v2 = [a1 progress];
  uint64_t v3 = [v2 fileURL];
  uint64_t v4 = [a1 progress];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_1D744C000, v5, v6, "[DEBUG] downloader: Added child %@\n %@@", v7, v8, v9, v10, 2u);
}

void __33__FPDDownloader__logRootProgress__block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [a1 progress];
  uint64_t v3 = [v2 fileURL];
  uint64_t v4 = [a1 progress];
  uint64_t v5 = [v4 fileCompletedCount];
  uint64_t v6 = [a1 progress];
  uint64_t v7 = [v6 fileTotalCount];
  uint64_t v8 = [a1 progress];
  uint64_t v9 = [v8 localizedAdditionalDescription];
  uint64_t v10 = [a1 progress];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5(&dword_1D744C000, v11, v12, "[DEBUG] downloader: %@\n %@ / %@ files: %@\n%@", v13, v14, v15, v16, v17);
}

void __64__FPDDownloader_downloadURL_recursively_request_withCompletion___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1D744C000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] downloader: Retrieved item %@ for URL %@", v1, 0x16u);
}

void __64__FPDDownloader_downloadURL_recursively_request_withCompletion___block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1D744C000, v0, OS_LOG_TYPE_ERROR, "[ERROR] downloader: Error %@ trying to retrieve item for URL %@", v1, 0x16u);
}

void __77__FPDDownloader__downloadItem_recursively_retryCount_request_withCompletion___block_invoke_4_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = *(_DWORD *)(a1 + 80);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_1D744C000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] downloader: tree changed during download, failing since we're at our %dth retry", (uint8_t *)v3, 8u);
}

void __77__FPDDownloader__downloadItem_recursively_retryCount_request_withCompletion___block_invoke_4_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] downloader: tree changed during download, try again in case there are some dataless files in it", v2, v3, v4, v5, v6);
}

void __77__FPDDownloader__downloadItem_recursively_retryCount_request_withCompletion___block_invoke_4_cold_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 48) progress];
  uint64_t v3 = [v2 fileURL];
  uint64_t v4 = [*(id *)(a1 + 48) progress];
  uint64_t v5 = [v4 fileCompletedCount];
  uint8_t v6 = [*(id *)(a1 + 48) progress];
  uint64_t v7 = [v6 fileTotalCount];
  uint64_t v8 = [*(id *)(a1 + 48) progress];
  uint64_t v9 = [v8 localizedAdditionalDescription];
  uint64_t v10 = [*(id *)(a1 + 48) progress];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5(&dword_1D744C000, v11, v12, "[DEBUG] downloader final progress: %@\n %@ / %@ files: %@\n%@", v13, v14, v15, v16, v17);
}

void __77__FPDDownloader__downloadItem_recursively_retryCount_request_withCompletion___block_invoke_4_cold_4(uint64_t a1, void *a2)
{
  uint64_t v2 = objc_msgSend(a2, "fp_prettyDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_1D744C000, v3, v4, "[DEBUG] downloader: finished full download of root %@ (error: %@)", v5, v6, v7, v8, 2u);
}

- (void)_didDownloadItem:(NSObject *)a3 withError:.cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 fileURL];
  uint64_t v6 = [a2 localizedAdditionalDescription];
  int v8 = 138412802;
  uint64_t v9 = v5;
  OUTLINED_FUNCTION_2();
  __int16 v10 = v7;
  uint64_t v11 = a2;
  _os_log_debug_impl(&dword_1D744C000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] downloader: per item final progress: %@\n%@\n%@", (uint8_t *)&v8, 0x20u);
}

- (void)_didDownloadItem:(NSObject *)a3 withError:.cold.2(void *a1, void *a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 itemID];
  uint64_t v6 = objc_msgSend(a2, "fp_prettyDescription");
  int v7 = 138412546;
  int v8 = v5;
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1D744C000, a3, OS_LOG_TYPE_ERROR, "[ERROR] downloader: failed to download item %@ : %@", (uint8_t *)&v7, 0x16u);
}

@end