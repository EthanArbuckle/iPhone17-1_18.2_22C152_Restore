@interface FPDDownloadManager
+ (id)acquireDownloadSlotForItem:(id)a3;
+ (id)sharedInstance;
+ (void)initialize;
+ (void)releaseDownloadSlot:(id)a3;
- (FPDDownloadManager)init;
- (void)_downloadItem:(id)a3 downloader:(id)a4 request:(id)a5 withCompletion:(id)a6;
- (void)_downloadItemAtLocator:(id)a3 downloader:(id)a4 request:(id)a5 completion:(id)a6;
- (void)_recursivelyDownloadItem:(id)a3 forceDiskIteration:(BOOL)a4 skipAlreadyDownloadedItems:(BOOL)a5 downloader:(id)a6 request:(id)a7 perItemCompletion:(id)a8 completion:(id)a9;
- (void)downloadItem:(id)a3 recursively:(unint64_t)a4 downloader:(id)a5 request:(id)a6 perItemCompletion:(id)a7 withCompletion:(id)a8;
- (void)downloadItems:(id)a3 recursively:(unint64_t)a4 downloader:(id)a5 request:(id)a6 perItemCompletion:(id)a7 withCompletion:(id)a8;
- (void)progressComputationPreflightForRecursiveRoot:(id)a3 downloader:(id)a4 itemProgressNeedsSetup:(id)a5 itemProgressSetup:(id)a6 completion:(id)a7;
- (void)retrieveFPItemForURL:(id)a3 domain:(id)a4 request:(id)a5 completion:(id)a6;
- (void)verifyIfSubtreeIsFullyMaterializedBelowItem:(id)a3 recursively:(unint64_t)a4 downloader:(id)a5 completion:(id)a6;
@end

@implementation FPDDownloadManager

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__FPDDownloadManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_once_0 != -1) {
    dispatch_once(&sharedInstance_once_0, block);
  }
  v2 = (void *)sharedInstance__instance;
  return v2;
}

uint64_t __36__FPDDownloadManager_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance__instance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x1F41817F8]();
}

+ (id)acquireDownloadSlotForItem:(id)a3
{
  id v3 = a3;
  v4 = [v3 providerID];
  id v5 = (id)_globalDownloadSlotsByProvider;
  objc_sync_enter(v5);
  v6 = [(id)_globalDownloadSlotsByProvider objectForKeyedSubscript:v4];
  if (!v6)
  {
    v6 = dispatch_semaphore_create(256);
    [(id)_globalDownloadSlotsByProvider setObject:v6 forKeyedSubscript:v4];
  }
  objc_sync_exit(v5);

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  return v4;
}

+ (void)releaseDownloadSlot:(id)a3
{
  id v7 = a3;
  id v3 = (id)_globalDownloadSlotsByProvider;
  objc_sync_enter(v3);
  v4 = [(id)_globalDownloadSlotsByProvider objectForKeyedSubscript:v7];
  objc_sync_exit(v3);

  if (!v4)
  {
    id v5 = [NSString stringWithFormat:@"[ASSERT] ‼️ semaphore should still exists"];
    v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_163_cold_1();
    }

    __assert_rtn("+[FPDDownloadManager releaseDownloadSlot:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/action operation engine/download/FPDDownloadManager.m", 84, (const char *)[v5 UTF8String]);
  }
  dispatch_semaphore_signal(v4);
}

+ (void)initialize
{
  if (initialize_once != -1) {
    dispatch_once(&initialize_once, &__block_literal_global_19);
  }
}

uint64_t __32__FPDDownloadManager_initialize__block_invoke()
{
  _globalDownloadSlotsByProvider = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (FPDDownloadManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)FPDDownloadManager;
  v2 = [(FPDDownloadManager *)&v10 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("FileProvider.download-manager", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("FileProvider.download-manager.preflight", v6);
    preflightQueue = v2->_preflightQueue;
    v2->_preflightQueue = (OS_dispatch_queue *)v7;
  }
  return v2;
}

- (void)downloadItems:(id)a3 recursively:(unint64_t)a4 downloader:(id)a5 request:(id)a6 perItemCompletion:(id)a7 withCompletion:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100__FPDDownloadManager_downloadItems_recursively_downloader_request_perItemCompletion_withCompletion___block_invoke;
  block[3] = &unk_1E6A75EF8;
  id v26 = v14;
  v27 = self;
  id v31 = v18;
  unint64_t v32 = a4;
  id v28 = v15;
  id v29 = v16;
  id v30 = v17;
  id v20 = v18;
  id v21 = v17;
  id v22 = v16;
  id v23 = v15;
  id v24 = v14;
  dispatch_async(queue, block);
}

void __100__FPDDownloadManager_downloadItems_recursively_downloader_request_perItemCompletion_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v2 = dispatch_group_create();
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__12;
  v26[4] = __Block_byref_object_dispose__12;
  id v27 = 0;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v3 = [obj countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v3)
  {
    uint64_t v14 = *(void *)v23;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v22 + 1) + 8 * v4);
        v6 = fp_current_or_default_log();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v29 = v5;
          _os_log_debug_impl(&dword_1D744C000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] download-manager: starting recursive download of item  %@", buf, 0xCu);
        }

        dispatch_group_enter(v2);
        uint64_t v7 = *(void *)(a1 + 80);
        v9 = *(void **)(a1 + 40);
        uint64_t v8 = *(void *)(a1 + 48);
        uint64_t v10 = *(void *)(a1 + 56);
        uint64_t v11 = *(void *)(a1 + 64);
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __100__FPDDownloadManager_downloadItems_recursively_downloader_request_perItemCompletion_withCompletion___block_invoke_6;
        v19[3] = &unk_1E6A75ED0;
        id v20 = v2;
        id v21 = v26;
        [v9 downloadItem:v5 recursively:v7 downloader:v8 request:v10 perItemCompletion:v11 withCompletion:v19];

        ++v4;
      }
      while (v3 != v4);
      uint64_t v3 = [obj countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v3);
  }

  v12 = *(NSObject **)(*(void *)(a1 + 40) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100__FPDDownloadManager_downloadItems_recursively_downloader_request_perItemCompletion_withCompletion___block_invoke_8;
  block[3] = &unk_1E6A748C0;
  id v16 = *(id *)(a1 + 32);
  id v17 = *(id *)(a1 + 72);
  id v18 = v26;
  dispatch_group_notify(v2, v12, block);

  _Block_object_dispose(v26, 8);
}

void __100__FPDDownloadManager_downloadItems_recursively_downloader_request_perItemCompletion_withCompletion___block_invoke_6(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = *(id *)(a1 + 32);
    objc_sync_enter(v5);
    v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __100__FPDDownloadManager_downloadItems_recursively_downloader_request_perItemCompletion_withCompletion___block_invoke_6_cold_1();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    objc_sync_exit(v5);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __100__FPDDownloadManager_downloadItems_recursively_downloader_request_perItemCompletion_withCompletion___block_invoke_8(uint64_t a1)
{
  v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __100__FPDDownloadManager_downloadItems_recursively_downloader_request_perItemCompletion_withCompletion___block_invoke_8_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  }
  return result;
}

- (void)downloadItem:(id)a3 recursively:(unint64_t)a4 downloader:(id)a5 request:(id)a6 perItemCompletion:(id)a7 withCompletion:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v19 = fp_current_or_default_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    -[FPDDownloadManager downloadItem:recursively:downloader:request:perItemCompletion:withCompletion:]();
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __99__FPDDownloadManager_downloadItem_recursively_downloader_request_perItemCompletion_withCompletion___block_invoke;
  block[3] = &unk_1E6A75EF8;
  id v32 = v18;
  unint64_t v33 = a4;
  id v27 = v14;
  id v28 = self;
  id v29 = v15;
  id v30 = v16;
  id v31 = v17;
  id v21 = v18;
  id v22 = v17;
  id v23 = v16;
  id v24 = v15;
  id v25 = v14;
  dispatch_async(queue, block);
}

void __99__FPDDownloadManager_downloadItem_recursively_downloader_request_perItemCompletion_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v3 = a1 + 32;
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    uint64_t v4 = *(void **)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    if (*(void *)(a1 + 80))
    {
      uint64_t v6 = [*(id *)(a1 + 48) domain];
      uint64_t v7 = [v6 isUsingFPFS];
      BOOL v8 = *(void *)(a1 + 80) == 1;
      uint64_t v9 = *(void *)(a1 + 48);
      uint64_t v10 = *(void *)(a1 + 56);
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __99__FPDDownloadManager_downloadItem_recursively_downloader_request_perItemCompletion_withCompletion___block_invoke_2;
      v25[3] = &unk_1E6A75F20;
      uint64_t v11 = *(void *)(a1 + 64);
      id v26 = *(id *)(a1 + 72);
      [v4 _recursivelyDownloadItem:v2 forceDiskIteration:v7 skipAlreadyDownloadedItems:v8 downloader:v9 request:v10 perItemCompletion:v11 completion:v25];

      v12 = v26;
    }
    else
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __99__FPDDownloadManager_downloadItem_recursively_downloader_request_perItemCompletion_withCompletion___block_invoke_3;
      v22[3] = &unk_1E6A75F48;
      uint64_t v21 = *(void *)(a1 + 56);
      id v23 = *(id *)(a1 + 64);
      id v24 = *(id *)(a1 + 72);
      [v4 _downloadItem:v2 downloader:v5 request:v21 withCompletion:v22];

      v12 = v23;
    }
  }
  else
  {
    if (!*(void *)(a1 + 72)) {
      return;
    }
    v13 = fp_current_or_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      __99__FPDDownloadManager_downloadItem_recursively_downloader_request_perItemCompletion_withCompletion___block_invoke_cold_1(v3, v13, v14, v15, v16, v17, v18, v19);
    }

    uint64_t v20 = *(void *)(a1 + 72);
    v12 = FPItemNotFoundError();
    (*(void (**)(uint64_t, void *))(v20 + 16))(v20, v12);
  }
}

uint64_t __99__FPDDownloadManager_downloadItem_recursively_downloader_request_perItemCompletion_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __99__FPDDownloadManager_downloadItem_recursively_downloader_request_perItemCompletion_withCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v12 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9)
  {
    uint64_t v10 = [v12 fileURL];
    (*(void (**)(uint64_t, id, void *, id))(v9 + 16))(v9, v12, v10, v8);
  }
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v8);
  }
}

- (void)verifyIfSubtreeIsFullyMaterializedBelowItem:(id)a3 recursively:(unint64_t)a4 downloader:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v13 = fp_current_or_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[FPDDownloadManager verifyIfSubtreeIsFullyMaterializedBelowItem:recursively:downloader:completion:]();
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100__FPDDownloadManager_verifyIfSubtreeIsFullyMaterializedBelowItem_recursively_downloader_completion___block_invoke;
  block[3] = &unk_1E6A75530;
  id v22 = v12;
  unint64_t v23 = a4;
  id v19 = v10;
  id v20 = v11;
  uint64_t v21 = self;
  id v15 = v11;
  id v16 = v12;
  id v17 = v10;
  dispatch_async(queue, block);
}

void __100__FPDDownloadManager_verifyIfSubtreeIsFullyMaterializedBelowItem_recursively_downloader_completion___block_invoke(uint64_t a1)
{
  id v2 = 0;
  uint64_t v3 = 0;
  uint64_t v22 = 0;
  unint64_t v23 = (id *)&v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__12;
  id v26 = __Block_byref_object_dispose__12;
  id v27 = 0;
  if (*(void *)(a1 + 64) == 2)
  {
    uint64_t v4 = [FPDSubtreeChangeDetector alloc];
    uint64_t v5 = [*(id *)(a1 + 32) fileURL];
    uint64_t v6 = [v5 path];
    id v7 = v23;
    id obj = v23[5];
    id v2 = [(FPDSubtreeChangeDetector *)v4 initAtPath:v6 error:&obj];
    objc_storeStrong(v7 + 5, obj);

    if (!v2)
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      goto LABEL_5;
    }
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __100__FPDDownloadManager_verifyIfSubtreeIsFullyMaterializedBelowItem_recursively_downloader_completion___block_invoke_2;
    v20[3] = &unk_1E6A75F98;
    v20[4] = &v22;
    uint64_t v3 = (void *)MEMORY[0x1D9471EC0](v20);
  }
  char v8 = [*(id *)(a1 + 40) isDryRun];
  [*(id *)(a1 + 40) setDryRun:1];
  uint64_t v9 = *(void **)(a1 + 40);
  id v10 = *(void **)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 32);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __100__FPDDownloadManager_verifyIfSubtreeIsFullyMaterializedBelowItem_recursively_downloader_completion___block_invoke_21;
  v13[3] = &unk_1E6A75FC0;
  id v14 = v9;
  char v19 = v8;
  id v12 = v2;
  id v15 = v12;
  id v17 = *(id *)(a1 + 56);
  uint64_t v18 = &v22;
  id v16 = *(id *)(a1 + 32);
  [v10 _recursivelyDownloadItem:v11 forceDiskIteration:1 skipAlreadyDownloadedItems:0 downloader:v14 request:0 perItemCompletion:v3 completion:v13];

LABEL_5:
  _Block_object_dispose(&v22, 8);
}

void __100__FPDDownloadManager_verifyIfSubtreeIsFullyMaterializedBelowItem_recursively_downloader_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v6 = a2;
  id v7 = a3;
  char v8 = v7;
  if (a4)
  {
    uint64_t v9 = fp_current_or_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __100__FPDDownloadManager_verifyIfSubtreeIsFullyMaterializedBelowItem_recursively_downloader_completion___block_invoke_2_cold_2();
    }
  }
  else
  {
    id v10 = v7;
    [v10 fileSystemRepresentation];
    id v12 = v10;
    id v13 = v6;
    if ((fpfs_openat() & 0x80000000) != 0 && *__error() != 22)
    {
      uint64_t v11 = fp_current_or_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __100__FPDDownloadManager_verifyIfSubtreeIsFullyMaterializedBelowItem_recursively_downloader_completion___block_invoke_2_cold_1();
      }
    }
    uint64_t v9 = v12;
  }
}

uint64_t __100__FPDDownloadManager_verifyIfSubtreeIsFullyMaterializedBelowItem_recursively_downloader_completion___block_invoke_18(uint64_t a1, int a2)
{
  if ((fpfs_unset_evictable() & 0x80000000) != 0)
  {
    char v8 = fp_current_or_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __100__FPDDownloadManager_verifyIfSubtreeIsFullyMaterializedBelowItem_recursively_downloader_completion___block_invoke_18_cold_1();
    }

    return 0xFFFFFFFFLL;
  }
  char v11 = 0;
  id v4 = [*(id *)(a1 + 40) providerDomainID];
  uint64_t v5 = [v4 UTF8String];

  if (v5) {
    fpfs_get_is_ignore_root();
  }
  memset(&v10, 0, sizeof(v10));
  if (fstat(a2, &v10) < 0)
  {
    id v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __100__FPDDownloadManager_verifyIfSubtreeIsFullyMaterializedBelowItem_recursively_downloader_completion___block_invoke_18_cold_2(a1, v6);
    }
    goto LABEL_17;
  }
  if ((v10.st_mode & 0xF000) == 0x4000 && (fpfs_fset_syncroot() & 0x80000000) != 0)
  {
    id v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __100__FPDDownloadManager_verifyIfSubtreeIsFullyMaterializedBelowItem_recursively_downloader_completion___block_invoke_18_cold_3();
    }
LABEL_17:
    uint64_t v7 = 0xFFFFFFFFLL;
    goto LABEL_18;
  }
  if (v11)
  {
    id v6 = [*(id *)(a1 + 40) providerDomainID];
    [v6 UTF8String];
    fpfs_set_is_ignore_root();
    uint64_t v7 = 0;
LABEL_18:

    return v7;
  }
  return 0;
}

void __100__FPDDownloadManager_verifyIfSubtreeIsFullyMaterializedBelowItem_recursively_downloader_completion___block_invoke_21(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  [*(id *)(a1 + 32) setDryRun:*(unsigned __int8 *)(a1 + 72)];
  if (v4 || (uint64_t v5 = *(void **)(a1 + 40)) == 0)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
    id obj = *(id *)(v6 + 40);
    uint64_t v7 = [v5 verifyTreeIdentityWithError:&obj];
    objc_storeStrong((id *)(v6 + 40), obj);
    if (v7)
    {
      char v8 = [*(id *)(a1 + 32) domain];
      uint64_t v9 = [*(id *)(a1 + 48) fileURL];
      [v8 setProvidedItemRecursiveGenerationCount:v7 forItemAtURL:v9];
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)retrieveFPItemForURL:(id)a3 domain:(id)a4 request:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = v12;
  if (a4)
  {
    id v14 = [a4 defaultBackend];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __69__FPDDownloadManager_retrieveFPItemForURL_domain_request_completion___block_invoke;
    v19[3] = &unk_1E6A73A50;
    void v19[4] = self;
    id v20 = v10;
    id v21 = v13;
    [v14 itemForURL:v20 request:v11 completionHandler:v19];

    id v15 = v20;
  }
  else
  {
    queue = self->_queue;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __69__FPDDownloadManager_retrieveFPItemForURL_domain_request_completion___block_invoke_23;
    v17[3] = &unk_1E6A75118;
    id v18 = v12;
    dispatch_async(queue, v17);
    id v15 = v18;
  }
}

void __69__FPDDownloadManager_retrieveFPItemForURL_domain_request_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__FPDDownloadManager_retrieveFPItemForURL_domain_request_completion___block_invoke_2;
  block[3] = &unk_1E6A73E38;
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  id v5 = v3;
  dispatch_async(v4, block);
}

void __69__FPDDownloadManager_retrieveFPItemForURL_domain_request_completion___block_invoke_2(uint64_t a1)
{
  id v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __69__FPDDownloadManager_retrieveFPItemForURL_domain_request_completion___block_invoke_2_cold_1(a1, v2);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  if (v3)
  {
    (*(void (**)(void, uint64_t, void))(v4 + 16))(*(void *)(a1 + 48), v3, 0);
  }
  else
  {
    id v5 = FPItemNotFoundErrorAtURL();
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v5);
  }
}

void __69__FPDDownloadManager_retrieveFPItemForURL_domain_request_completion___block_invoke_23(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  FPNotSupportedError();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)progressComputationPreflightForRecursiveRoot:(id)a3 downloader:(id)a4 itemProgressNeedsSetup:(id)a5 itemProgressSetup:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = (void (**)(void))a7;
  char v17 = [v12 isFolder];
  if ([v12 isPackage])
  {
    char v29 = 0;
    uint64_t v18 = [v12 fileURL];
    if (v18)
    {
      char v19 = (void *)v18;
      id v20 = [v12 fileURL];
      [v20 fileSystemRepresentation];
      int is_demoted_at = fpfs_pkg_is_demoted_at();

      if (!is_demoted_at) {
        goto LABEL_5;
      }
    }
  }
  if (v17)
  {
    preflightQueue = self->_preflightQueue;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __130__FPDDownloadManager_progressComputationPreflightForRecursiveRoot_downloader_itemProgressNeedsSetup_itemProgressSetup_completion___block_invoke;
    v23[3] = &unk_1E6A75FE8;
    id v24 = v13;
    id v25 = v12;
    id v26 = v15;
    id v27 = v14;
    id v28 = v16;
    dispatch_async(preflightQueue, v23);
  }
  else
  {
LABEL_5:
    if (v16) {
      v16[2](v16);
    }
  }
}

void __130__FPDDownloadManager_progressComputationPreflightForRecursiveRoot_downloader_itemProgressNeedsSetup_itemProgressSetup_completion___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __130__FPDDownloadManager_progressComputationPreflightForRecursiveRoot_downloader_itemProgressNeedsSetup_itemProgressSetup_completion___block_invoke_cold_2(v2);
  }

  uint64_t v3 = [*(id *)(a1 + 32) progress];
  [v3 setTotalUnitCount:0];
  [v3 setKind:*MEMORY[0x1E4F28898]];
  [v3 setFileCompletedCount:&unk_1F2EDBC40];
  uint64_t v4 = [NSNumber numberWithUnsignedInteger:0];
  [v3 setFileTotalCount:v4];

  id v5 = [*(id *)(a1 + 40) fileURL];
  [v3 setFileURL:v5];

  [v3 publish];
  if ([*(id *)(a1 + 40) isRecursivelyDownloaded])
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    LOBYTE(v8) = 1;
    goto LABEL_21;
  }
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = [*(id *)(a1 + 32) domain];
  id v11 = +[FPDIterator hybridIteratorForItem:v9 domain:v10 enforceFPItem:0];

  LOBYTE(v8) = 1;
  [v11 setShouldDecorateItems:1];
  if ([v11 done])
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    goto LABEL_20;
  }
  uint64_t v7 = 0;
  uint64_t v6 = 0;
  while (1)
  {
    id v12 = (void *)MEMORY[0x1D9471CC0]();
    id v24 = 0;
    id v13 = [v11 nextWithError:&v24];
    id v14 = v24;
    if (!v13) {
      break;
    }
    if (![v13 isProviderItem] || (objc_msgSend(v13, "isDownloaded") & 1) != 0) {
      goto LABEL_17;
    }
    if ([v13 isFolder]) {
      goto LABEL_16;
    }
    ++v6;
    v7 += [v13 size];
    id v15 = [v13 asFPItem];
    id v16 = [v15 fileURL];

    if (v16)
    {
      uint64_t v8 = *(void *)(a1 + 48);
LABEL_15:
      char v17 = [v13 asFPItem];
      (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v17);

LABEL_16:
      LOBYTE(v8) = 0;
      goto LABEL_17;
    }
    uint64_t v8 = *(void *)(a1 + 56);
    if (v8) {
      goto LABEL_15;
    }
LABEL_17:
    [v3 setTotalUnitCount:v7];
    uint64_t v18 = [NSNumber numberWithUnsignedInteger:v6];
    [v3 setFileTotalCount:v18];

    if ([v11 done]) {
      goto LABEL_20;
    }
  }

LABEL_20:

LABEL_21:
  char v19 = fp_current_or_default_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v22 = *(void *)(a1 + 40);
    unint64_t v23 = [NSNumber numberWithBool:v8 & 1];
    *(_DWORD *)buf = 138413058;
    uint64_t v26 = v22;
    __int16 v27 = 2048;
    uint64_t v28 = v6;
    __int16 v29 = 2048;
    uint64_t v30 = v7;
    __int16 v31 = 2112;
    id v32 = v23;
    _os_log_debug_impl(&dword_1D744C000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] download-manager: preflight for root: %@, numItems:%lu, undownloadedSize:%lu, fullyMaterialized:%@", buf, 0x2Au);
  }
  id v20 = fp_current_or_default_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    __130__FPDDownloadManager_progressComputationPreflightForRecursiveRoot_downloader_itemProgressNeedsSetup_itemProgressSetup_completion___block_invoke_cold_1(v3, v20);
  }

  uint64_t v21 = *(void *)(a1 + 64);
  if (v21) {
    (*(void (**)(void))(v21 + 16))();
  }
}

- (void)_recursivelyDownloadItem:(id)a3 forceDiskIteration:(BOOL)a4 skipAlreadyDownloadedItems:(BOOL)a5 downloader:(id)a6 request:(id)a7 perItemCompletion:(id)a8 completion:(id)a9
{
  BOOL v45 = a5;
  BOOL v43 = a4;
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  id v44 = a7;
  id v14 = (void (**)(id, NSObject *, void *, void))a8;
  id v47 = a9;
  id v15 = fp_current_or_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[FPDDownloadManager _recursivelyDownloadItem:forceDiskIteration:skipAlreadyDownloadedItems:downloader:request:perItemCompletion:completion:](v15);
  }

  v46 = [MEMORY[0x1E4F25CB8] locatorForItem:v12];
  if (([v12 isRecursivelyDownloaded] & v45) != 1)
  {
    char v17 = [v13 domain];
    uint64_t v18 = [v17 provider];
    id v16 = +[FPDIterator iteratorForLocator:v46 wantsDisk:v43 provider:v18];

    [v16 setShouldDecorateItems:1];
    [v16 setSkipMaterializedTreeTraversal:v45];
    group = dispatch_group_create();
    uint64_t v63 = 0;
    v64 = &v63;
    uint64_t v65 = 0x3032000000;
    v66 = __Block_byref_object_copy__12;
    v67 = __Block_byref_object_dispose__12;
    id v68 = 0;
    while (1)
    {
      if ([v16 done])
      {
LABEL_39:
        queue = self->_queue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __141__FPDDownloadManager__recursivelyDownloadItem_forceDiskIteration_skipAlreadyDownloadedItems_downloader_request_perItemCompletion_completion___block_invoke_32;
        block[3] = &unk_1E6A76088;
        id v49 = v46;
        v51 = &v63;
        id v50 = v47;
        dispatch_group_notify(group, queue, block);

        _Block_object_dispose(&v63, 8);
        goto LABEL_40;
      }
      char v19 = (void *)MEMORY[0x1D9471CC0]();
      id v62 = 0;
      id v20 = [v16 nextWithError:&v62];
      id v21 = v62;
      uint64_t v22 = [v13 cancellationProgress];
      int v23 = [v22 isCancelled];

      if (v23)
      {
        id v24 = fp_current_or_default_log();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          id v25 = objc_msgSend((id)v64[5], "fp_prettyDescription");
          *(_DWORD *)buf = 138412290;
          v72 = v25;
          _os_log_impl(&dword_1D744C000, v24, OS_LOG_TYPE_INFO, "[INFO] download-manager: recursive downloader had been canceled due to error %@", buf, 0xCu);
        }
        char v26 = 0;
      }
      else if (v20 || !v21)
      {
        char v31 = [v16 done];
        if (v20) {
          char v32 = v31;
        }
        else {
          char v32 = 1;
        }
        if (v32)
        {
          char v26 = 0;
          goto LABEL_17;
        }
        if ([v20 isDownloaded])
        {
          if (!v14)
          {
            char v26 = 1;
            goto LABEL_17;
          }
          if ([v20 isProviderItem]
            && ([v20 asFPItem], v33 = objc_claimAutoreleasedReturnValue(), (id v24 = v33) != 0))
          {
            v34 = [v33 fileURL];
          }
          else
          {
            v34 = [v20 asURL];
            id v24 = 0;
          }
          v39 = fp_current_or_default_log();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v72 = v20;
            _os_log_debug_impl(&dword_1D744C000, v39, OS_LOG_TYPE_DEBUG, "[DEBUG] download-manager: Already materialized item %@ so skipping", buf, 0xCu);
          }

          v14[2](v14, v24, v34, 0);
          char v26 = 1;
        }
        else if ([v13 isDryRun])
        {
          v35 = fp_current_or_default_log();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v72 = v20;
            _os_log_error_impl(&dword_1D744C000, v35, OS_LOG_TYPE_ERROR, "[ERROR] download-manager: found non-downloaded item %@", buf, 0xCu);
          }

          uint64_t v36 = FPSubtreeChangedError();
          char v26 = 0;
          id v24 = v64[5];
          v64[5] = v36;
        }
        else
        {
          dispatch_group_enter(group);
          v52[0] = MEMORY[0x1E4F143A8];
          v52[1] = 3221225472;
          v52[2] = __141__FPDDownloadManager__recursivelyDownloadItem_forceDiskIteration_skipAlreadyDownloadedItems_downloader_request_perItemCompletion_completion___block_invoke;
          v52[3] = &unk_1E6A76060;
          v59 = &v63;
          v37 = v13;
          v53 = v37;
          v58 = v14;
          id v38 = v20;
          id v54 = v38;
          v55 = group;
          v56 = self;
          BOOL v60 = v43;
          BOOL v61 = v45;
          id v57 = v44;
          [(FPDDownloadManager *)self _downloadItemAtLocator:v38 downloader:v37 request:v57 completion:v52];

          char v26 = 1;
          id v24 = v53;
        }
      }
      else
      {
        __int16 v27 = fp_current_or_default_log();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          uint64_t v28 = objc_msgSend(v21, "fp_prettyDescription");
          -[FPDDownloadManager _recursivelyDownloadItem:forceDiskIteration:skipAlreadyDownloadedItems:downloader:request:perItemCompletion:completion:](v28, v69, &v70, v27);
        }

        __int16 v29 = v64;
        id v30 = v21;
        char v26 = 0;
        id v24 = v29[5];
        v29[5] = (uint64_t)v30;
      }

LABEL_17:
      if ((v26 & 1) == 0) {
        goto LABEL_39;
      }
    }
  }
  id v16 = [v12 fileURL];
  (*((void (**)(id, void *, void))v47 + 2))(v47, v16, 0);
LABEL_40:
}

void __141__FPDDownloadManager__recursivelyDownloadItem_forceDiskIteration_skipAlreadyDownloadedItems_downloader_request_perItemCompletion_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = fp_current_or_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    __141__FPDDownloadManager__recursivelyDownloadItem_forceDiskIteration_skipAlreadyDownloadedItems_downloader_request_perItemCompletion_completion___block_invoke_cold_2((uint64_t)v7, v9);
  }

  if (v9)
  {
    uint64_t v11 = *(void *)(*(void *)(a1 + 80) + 8);
    uint64_t v13 = *(void *)(v11 + 40);
    id v12 = (id *)(v11 + 40);
    if (!v13)
    {
      objc_storeStrong(v12, a4);
      id v14 = [*(id *)(a1 + 32) cancellationProgress];
      char v15 = [v14 isCancelled];

      if ((v15 & 1) == 0) {
        [*(id *)(a1 + 32) cancel];
      }
    }
  }
  uint64_t v16 = *(void *)(a1 + 72);
  if (v16) {
    (*(void (**)(uint64_t, id, id, id))(v16 + 16))(v16, v7, v8, v9);
  }
  if ([*(id *)(a1 + 40) isExternalURL])
  {
    char v17 = [*(id *)(a1 + 32) domain];
    if ([v17 isUsingFPFS])
    {
      if ([v7 isFolder])
      {
      }
      else
      {
        int v18 = [v7 isPackage];

        if (!v18) {
          goto LABEL_18;
        }
      }
      char v19 = fp_current_or_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        __141__FPDDownloadManager__recursivelyDownloadItem_forceDiskIteration_skipAlreadyDownloadedItems_downloader_request_perItemCompletion_completion___block_invoke_cold_1();
      }

      dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
      uint64_t v20 = *(void *)(a1 + 56);
      id v21 = *(NSObject **)(v20 + 8);
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __141__FPDDownloadManager__recursivelyDownloadItem_forceDiskIteration_skipAlreadyDownloadedItems_downloader_request_perItemCompletion_completion___block_invoke_31;
      v24[3] = &unk_1E6A76038;
      v24[4] = v20;
      id v25 = v7;
      __int16 v31 = *(_WORD *)(a1 + 88);
      id v26 = *(id *)(a1 + 32);
      id v27 = *(id *)(a1 + 64);
      id v22 = *(id *)(a1 + 72);
      uint64_t v23 = *(void *)(a1 + 80);
      id v29 = v22;
      uint64_t v30 = v23;
      id v28 = *(id *)(a1 + 48);
      dispatch_async(v21, v24);
    }
    else
    {
    }
  }
LABEL_18:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __141__FPDDownloadManager__recursivelyDownloadItem_forceDiskIteration_skipAlreadyDownloadedItems_downloader_request_perItemCompletion_completion___block_invoke_31(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 88);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 89);
  uint64_t v6 = *(void **)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __141__FPDDownloadManager__recursivelyDownloadItem_forceDiskIteration_skipAlreadyDownloadedItems_downloader_request_perItemCompletion_completion___block_invoke_2;
  v9[3] = &unk_1E6A76010;
  uint64_t v8 = *(void *)(a1 + 72);
  uint64_t v12 = *(void *)(a1 + 80);
  id v10 = v6;
  id v11 = *(id *)(a1 + 64);
  [v2 _recursivelyDownloadItem:v3 forceDiskIteration:v4 skipAlreadyDownloadedItems:v5 downloader:v10 request:v7 perItemCompletion:v8 completion:v9];
}

void __141__FPDDownloadManager__recursivelyDownloadItem_forceDiskIteration_skipAlreadyDownloadedItems_downloader_request_perItemCompletion_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v8 = *(void *)(v6 + 40);
    uint64_t v7 = (id *)(v6 + 40);
    if (!v8)
    {
      objc_storeStrong(v7, a3);
      id v9 = [*(id *)(a1 + 32) cancellationProgress];
      char v10 = [v9 isCancelled];

      if ((v10 & 1) == 0) {
        [*(id *)(a1 + 32) cancel];
      }
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __141__FPDDownloadManager__recursivelyDownloadItem_forceDiskIteration_skipAlreadyDownloadedItems_downloader_request_perItemCompletion_completion___block_invoke_32(uint64_t a1)
{
  id v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __141__FPDDownloadManager__recursivelyDownloadItem_forceDiskIteration_skipAlreadyDownloadedItems_downloader_request_perItemCompletion_completion___block_invoke_32_cold_1(a1);
  }

  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [*(id *)(a1 + 32) asFPItem];
  id v5 = [v4 fileURL];
  (*(void (**)(uint64_t, void *, void))(v3 + 16))(v3, v5, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
}

- (void)_downloadItem:(id)a3 downloader:(id)a4 request:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  queue = self->_queue;
  id v13 = a5;
  id v14 = a4;
  dispatch_assert_queue_V2(queue);
  char v15 = [(id)objc_opt_class() acquireDownloadSlotForItem:v10];
  uint64_t v16 = fp_current_or_default_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    -[FPDDownloadManager _downloadItem:downloader:request:withCompletion:]();
  }

  char v17 = [v14 domain];
  int v18 = [v10 itemID];
  char v19 = [v14 cancellationProgress];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __70__FPDDownloadManager__downloadItem_downloader_request_withCompletion___block_invoke;
  v23[3] = &unk_1E6A760B0;
  id v24 = v10;
  id v25 = self;
  id v26 = v15;
  id v27 = v11;
  id v20 = v11;
  id v21 = v15;
  id v22 = v10;
  [v17 downloadItemWithItemID:v18 request:v13 progress:v19 completionHandler:v23];
}

void __70__FPDDownloadManager__downloadItem_downloader_request_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __70__FPDDownloadManager__downloadItem_downloader_request_withCompletion___block_invoke_cold_2(a1, v7);
  }

  [(id)objc_opt_class() releaseDownloadSlot:*(void *)(a1 + 48)];
  if (v6)
  {
    uint64_t v8 = fp_current_or_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __70__FPDDownloadManager__downloadItem_downloader_request_withCompletion___block_invoke_cold_1(a1, v6);
    }
  }
  id v9 = [*(id *)(a1 + 32) fileURL];

  if (!v9) {
    [*(id *)(a1 + 32) setFileURL:v5];
  }
  uint64_t v10 = *(void *)(a1 + 56);
  id v11 = *(void **)(a1 + 32);
  uint64_t v12 = [v11 fileURL];
  (*(void (**)(uint64_t, void *, void *, id))(v10 + 16))(v10, v11, v12, v6);
}

- (void)_downloadItemAtLocator:(id)a3 downloader:(id)a4 request:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v10 isProviderItem])
  {
    id v14 = [v10 asFPItem];
    [(FPDDownloadManager *)self _downloadItem:v14 downloader:v11 request:v12 withCompletion:v13];
  }
  else
  {
    char v15 = [v11 domain];
    uint64_t v16 = [v15 defaultBackend];
    char v17 = [v10 asURL];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __75__FPDDownloadManager__downloadItemAtLocator_downloader_request_completion___block_invoke;
    v18[3] = &unk_1E6A760D8;
    v18[4] = self;
    id v22 = v13;
    id v19 = v10;
    id v20 = v11;
    id v21 = v12;
    [v16 itemForURL:v17 request:v21 completionHandler:v18];
  }
}

void __75__FPDDownloadManager__downloadItemAtLocator_downloader_request_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__FPDDownloadManager__downloadItemAtLocator_downloader_request_completion___block_invoke_2;
  block[3] = &unk_1E6A75760;
  id v13 = v5;
  id v14 = v6;
  id v19 = *(id *)(a1 + 64);
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v15 = v8;
  uint64_t v16 = v9;
  id v17 = *(id *)(a1 + 48);
  id v18 = *(id *)(a1 + 56);
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

void __75__FPDDownloadManager__downloadItemAtLocator_downloader_request_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32))
  {
    if (v1)
    {
      uint64_t v2 = *(void *)(a1 + 80);
LABEL_5:
      uint64_t v3 = *(void (**)(uint64_t, void, void))(v2 + 16);
      v3(v2, 0, 0);
      return;
    }
    uint64_t v4 = *(void **)(a1 + 56);
    objc_msgSend(v4, "_downloadItem:downloader:request:withCompletion:");
  }
  else
  {
    uint64_t v2 = *(void *)(a1 + 80);
    if (v1) {
      goto LABEL_5;
    }
    id v6 = [*(id *)(a1 + 48) asURL];
    id v5 = FPItemNotFoundErrorAtURL();
    (*(void (**)(uint64_t, void, void, void *))(v2 + 16))(v2, 0, 0, v5);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preflightQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __100__FPDDownloadManager_downloadItems_recursively_downloader_request_perItemCompletion_withCompletion___block_invoke_6_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_1(&dword_1D744C000, v0, v1, "[DEBUG] download-manager: items downloaded recursively with error %@", v2, v3, v4, v5, v6);
}

void __100__FPDDownloadManager_downloadItems_recursively_downloader_request_perItemCompletion_withCompletion___block_invoke_8_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)downloadItem:recursively:downloader:request:perItemCompletion:withCompletion:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1D744C000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] download-manager: Request to download item %@, recursively %@", v1, 0x16u);
}

void __99__FPDDownloadManager_downloadItem_recursively_downloader_request_perItemCompletion_withCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)verifyIfSubtreeIsFullyMaterializedBelowItem:recursively:downloader:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_1(&dword_1D744C000, v0, v1, "[DEBUG] download-manager: looking for dataless faults in %@, recursively", v2, v3, v4, v5, v6);
}

void __100__FPDDownloadManager_verifyIfSubtreeIsFullyMaterializedBelowItem_recursively_downloader_completion___block_invoke_2_cold_1()
{
  os_log_t v0 = objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:", *__error());
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_2_0(&dword_1D744C000, v1, v2, "[ERROR] download-manager: removal of FileProvider Bits  failed on %@: %@", v3, v4, v5, v6, v7);
}

void __100__FPDDownloadManager_verifyIfSubtreeIsFullyMaterializedBelowItem_recursively_downloader_completion___block_invoke_2_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1D744C000, v0, OS_LOG_TYPE_ERROR, "[ERROR] download-manager: post-download traversal failed on %@: %@", v1, 0x16u);
}

void __100__FPDDownloadManager_verifyIfSubtreeIsFullyMaterializedBelowItem_recursively_downloader_completion___block_invoke_18_cold_1()
{
  os_log_t v0 = objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:", *__error());
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_2_0(&dword_1D744C000, v1, v2, "[ERROR] download-manager: removal of purgeability attributes failed on %@: %@", v3, v4, v5, v6, v7);
}

void __100__FPDDownloadManager_verifyIfSubtreeIsFullyMaterializedBelowItem_recursively_downloader_completion___block_invoke_18_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *__error();
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 1024;
  int v8 = v4;
  _os_log_error_impl(&dword_1D744C000, a2, OS_LOG_TYPE_ERROR, "[ERROR] download-manager: failed to stat on %@: %{errno}d", (uint8_t *)&v5, 0x12u);
}

void __100__FPDDownloadManager_verifyIfSubtreeIsFullyMaterializedBelowItem_recursively_downloader_completion___block_invoke_18_cold_3()
{
  os_log_t v0 = objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:", *__error());
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_2_0(&dword_1D744C000, v1, v2, "[ERROR] download-manager: removal of syncroot bit failed on %@: %@", v3, v4, v5, v6, v7);
}

void __69__FPDDownloadManager_retrieveFPItemForURL_domain_request_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 138412546;
  uint64_t v5 = v2;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_debug_impl(&dword_1D744C000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Received item %@ for url %@", (uint8_t *)&v4, 0x16u);
}

void __130__FPDDownloadManager_progressComputationPreflightForRecursiveRoot_downloader_itemProgressNeedsSetup_itemProgressSetup_completion___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v4 = [a1 fileTotalCount];
  uint64_t v5 = [a1 fileURL];
  int v6 = 138412802;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = v4;
  __int16 v10 = 2112;
  id v11 = v5;
  _os_log_debug_impl(&dword_1D744C000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] download-manager: Publishing download rootProgress %@ (%@ files) at url %@", (uint8_t *)&v6, 0x20u);
}

void __130__FPDDownloadManager_progressComputationPreflightForRecursiveRoot_downloader_itemProgressNeedsSetup_itemProgressSetup_completion___block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1D744C000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] download-manager: starting preflight", v1, 2u);
}

- (void)_recursivelyDownloadItem:(void *)a3 forceDiskIteration:(os_log_t)log skipAlreadyDownloadedItems:downloader:request:perItemCompletion:completion:.cold.1(void *a1, uint8_t *buf, void *a3, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a1;
  _os_log_error_impl(&dword_1D744C000, log, OS_LOG_TYPE_ERROR, "[ERROR] download-manager: encountered error during enumeration: %@", buf, 0xCu);
}

- (void)_recursivelyDownloadItem:(os_log_t)log forceDiskIteration:skipAlreadyDownloadedItems:downloader:request:perItemCompletion:completion:.cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1D744C000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] download-manager: recursive download has began", v1, 2u);
}

void __141__FPDDownloadManager__recursivelyDownloadItem_forceDiskIteration_skipAlreadyDownloadedItems_downloader_request_perItemCompletion_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_1(&dword_1D744C000, v0, v1, "[DEBUG] download-manager: recursive in item %@", v2, v3, v4, v5, v6);
}

void __141__FPDDownloadManager__recursivelyDownloadItem_forceDiskIteration_skipAlreadyDownloadedItems_downloader_request_perItemCompletion_completion___block_invoke_cold_2(uint64_t a1, void *a2)
{
  uint64_t v2 = objc_msgSend(a2, "fp_prettyDescription");
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_6(&dword_1D744C000, v3, v4, "[DEBUG] download-manager: Finished downloading item %@ - %@", v5, v6, v7, v8, v9);
}

void __141__FPDDownloadManager__recursivelyDownloadItem_forceDiskIteration_skipAlreadyDownloadedItems_downloader_request_perItemCompletion_completion___block_invoke_32_cold_1(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) asFPItem];
  uint64_t v3 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "fp_prettyDescription");
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_6(&dword_1D744C000, v4, v5, "[DEBUG] download-manager: Completed downloading items recursively from root %@: %@", v6, v7, v8, v9, v10);
}

- (void)_downloadItem:downloader:request:withCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_1(&dword_1D744C000, v0, v1, "[DEBUG] download-manager: requesting non recursive download of %@", v2, v3, v4, v5, v6);
}

void __70__FPDDownloadManager__downloadItem_downloader_request_withCompletion___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) itemID];
  uint64_t v4 = objc_msgSend(a2, "fp_prettyDescription");
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_2_0(&dword_1D744C000, v5, v6, "[ERROR] download-manager: couldn't provide item for itemID (%@): %@", v7, v8, v9, v10, v11);
}

void __70__FPDDownloadManager__downloadItem_downloader_request_withCompletion___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*(id *)(a1 + 32) itemID];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_1D744C000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] download-manager: Finished downloading %@", v4, 0xCu);
}

@end