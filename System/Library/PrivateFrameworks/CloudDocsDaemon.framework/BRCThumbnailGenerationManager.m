@interface BRCThumbnailGenerationManager
+ (id)defaultManager;
- (BOOL)canScheduleMoreJobs;
- (BRCThumbnailGenerationManager)init;
- (id)_generateThumbnailOperationAtURL:(id)a3 targetURL:(id)a4 timeout:(id)a5 sessionContext:(id)a6;
- (id)description;
- (id)hasThumbnailAvailableSlot;
- (id)operationForThumbnailID:(id)a3;
- (id)reachedThumbnailMaximumCapacity;
- (unint64_t)_thumbnailOperationsMax;
- (void)_addThumbnailGenerationJobAtURL:(id)a3 targetURL:(id)a4 thumbnailID:(id)a5 timeout:(id)a6 syncContext:(id)a7 completionHandler:(id)a8;
- (void)_addThumbnailOperation:(id)a3 thumbnailID:(id)a4;
- (void)_removeThumbnailOperationForThumbnailID:(id)a3;
- (void)addOutOfBandThumbnailGenerationJobAtURL:(id)a3 targetURL:(id)a4 syncContext:(id)a5 completionHandler:(id)a6;
- (void)addOutOfBandThumbnailGenerationJobAtURL:(id)a3 targetURL:(id)a4 timeout:(double)a5 syncContext:(id)a6 completionHandler:(id)a7;
- (void)addThumbnailGenerationJobAtURL:(id)a3 targetURL:(id)a4 thumbnailID:(id)a5 syncContext:(id)a6 completionHandler:(id)a7;
- (void)cancel;
- (void)setHasThumbnailAvailableSlot:(id)a3;
- (void)setReachedThumbnailMaximumCapacity:(id)a3;
@end

@implementation BRCThumbnailGenerationManager

- (BRCThumbnailGenerationManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)BRCThumbnailGenerationManager;
  v2 = [(BRCThumbnailGenerationManager *)&v14 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    thumbnailsOperations = v2->_thumbnailsOperations;
    v2->_thumbnailsOperations = v3;

    v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(v5, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.bird.thumbnails", v6);

    thumbnailQueue = v2->_thumbnailQueue;
    v2->_thumbnailQueue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(v9, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.bird.thumbnails.private", v10);

    thumbnailPrivateQueue = v2->_thumbnailPrivateQueue;
    v2->_thumbnailPrivateQueue = (OS_dispatch_queue *)v11;
  }
  return v2;
}

+ (id)defaultManager
{
  if (defaultManager_onceToken != -1) {
    dispatch_once(&defaultManager_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)defaultManager_defaultManager;
  return v2;
}

void __47__BRCThumbnailGenerationManager_defaultManager__block_invoke()
{
  v0 = objc_alloc_init(BRCThumbnailGenerationManager);
  v1 = (void *)defaultManager_defaultManager;
  defaultManager_defaultManager = (uint64_t)v0;
}

- (unint64_t)_thumbnailOperationsMax
{
  v2 = +[BRCUserDefaults defaultsForMangledID:0];
  unint64_t v3 = [v2 thumbnailTransferQueueWidth];

  return v3;
}

- (BOOL)canScheduleMoreJobs
{
  return !self->_prepareReachedMax;
}

- (void)_addThumbnailOperation:(id)a3 thumbnailID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v7)
  {
    thumbnailPrivateQueue = self->_thumbnailPrivateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__BRCThumbnailGenerationManager__addThumbnailOperation_thumbnailID___block_invoke;
    block[3] = &unk_1E6993600;
    block[4] = self;
    id v11 = v7;
    id v12 = v6;
    dispatch_sync(thumbnailPrivateQueue, block);
  }
}

unint64_t __68__BRCThumbnailGenerationManager__addThumbnailOperation_thumbnailID___block_invoke(void *a1)
{
  v1 = (id *)(a1 + 4);
  [*(id *)(a1[4] + 32) setObject:a1[6] forKeyedSubscript:a1[5]];
  unint64_t v2 = [*((id *)*v1 + 4) count];
  unint64_t result = [*v1 _thumbnailOperationsMax];
  if (v2 >= result)
  {
    v4 = brc_bread_crumbs();
    v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __68__BRCThumbnailGenerationManager__addThumbnailOperation_thumbnailID___block_invoke_cold_1((uint64_t)v1);
    }

    *((unsigned char *)*v1 + 24) = 1;
    unint64_t result = *((void *)*v1 + 5);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  return result;
}

- (void)_removeThumbnailOperationForThumbnailID:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    thumbnailPrivateQueue = self->_thumbnailPrivateQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __73__BRCThumbnailGenerationManager__removeThumbnailOperationForThumbnailID___block_invoke;
    v7[3] = &unk_1E6993628;
    v7[4] = self;
    id v8 = v4;
    dispatch_sync(thumbnailPrivateQueue, v7);
  }
}

unint64_t __73__BRCThumbnailGenerationManager__removeThumbnailOperationForThumbnailID___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  unint64_t result = [*(id *)(*(void *)(a1 + 32) + 32) removeObjectForKey:*(void *)(a1 + 40)];
  if (*((unsigned char *)*v1 + 24))
  {
    unint64_t v3 = [*((id *)*v1 + 4) count];
    unint64_t result = [*v1 _thumbnailOperationsMax];
    if (v3 < result)
    {
      id v4 = brc_bread_crumbs();
      v5 = brc_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        __73__BRCThumbnailGenerationManager__removeThumbnailOperationForThumbnailID___block_invoke_cold_1((uint64_t)v1);
      }

      *((unsigned char *)*v1 + 24) = 0;
      unint64_t result = *((void *)*v1 + 6);
      if (result) {
        return (*(uint64_t (**)(void))(result + 16))();
      }
    }
  }
  return result;
}

- (id)_generateThumbnailOperationAtURL:(id)a3 targetURL:(id)a4 timeout:(id)a5 sessionContext:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [[BRCThumbnailGenerateOperation alloc] initWithDocumentAtURL:v12 targetURL:v11 timeout:v10 sessionContext:v9];

  return v13;
}

- (void)_addThumbnailGenerationJobAtURL:(id)a3 targetURL:(id)a4 thumbnailID:(id)a5 timeout:(id)a6 syncContext:(id)a7 completionHandler:(id)a8
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v39 = a6;
  id v17 = a7;
  id v18 = a8;
  v19 = [v17 sessionContext];
  v20 = [(BRCThumbnailGenerationManager *)self _generateThumbnailOperationAtURL:v14 targetURL:v15 timeout:v39 sessionContext:v19];

  [(BRCThumbnailGenerationManager *)self _addThumbnailOperation:v20 thumbnailID:v16];
  v21 = brc_bread_crumbs();
  v22 = brc_default_log();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)block = 138412802;
    *(void *)&block[4] = v16;
    *(_WORD *)&block[12] = 2112;
    *(void *)&block[14] = v20;
    *(_WORD *)&block[22] = 2112;
    v54 = v21;
    _os_log_debug_impl(&dword_1D353B000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] Generating thumbnail for ID %@ (shouldTransferThumbnail:yes) %@%@", block, 0x20u);
  }

  objc_initWeak(&location, v20);
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __125__BRCThumbnailGenerationManager__addThumbnailGenerationJobAtURL_targetURL_thumbnailID_timeout_syncContext_completionHandler___block_invoke;
  v43[3] = &unk_1E6993650;
  id v38 = v15;
  id v44 = v38;
  id v37 = v14;
  id v45 = v37;
  objc_copyWeak(&v49, &location);
  id v23 = v18;
  id v48 = v23;
  v46 = self;
  id v24 = v16;
  id v47 = v24;
  [v20 setSaveThumbnailCompletionBlock:v43];
  thumbnailQueue = self->_thumbnailQueue;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __125__BRCThumbnailGenerationManager__addThumbnailGenerationJobAtURL_targetURL_thumbnailID_timeout_syncContext_completionHandler___block_invoke_7;
  v40[3] = &unk_1E6993628;
  id v26 = v17;
  id v41 = v26;
  id v27 = v20;
  id v42 = v27;
  v28 = thumbnailQueue;
  v29 = v40;
  v30 = (void *)MEMORY[0x1D9438760]();
  long long v51 = 0uLL;
  uint64_t v52 = 0;
  __brc_create_section(0, (uint64_t)"dispatch_async_with_logs", 262, &v51);
  v31 = brc_bread_crumbs();
  v32 = brc_default_log();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v36 = v51;
    label = dispatch_queue_get_label(v28);
    *(_DWORD *)block = 134218498;
    *(void *)&block[4] = v36;
    *(_WORD *)&block[12] = 2080;
    *(void *)&block[14] = label;
    *(_WORD *)&block[22] = 2112;
    v54 = v31;
    _os_log_debug_impl(&dword_1D353B000, v32, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx dispatching to %s%@", block, 0x20u);
  }

  long long v57 = v51;
  uint64_t v58 = v52;
  *(void *)block = MEMORY[0x1E4F143A8];
  *(void *)&block[8] = 3221225472;
  *(void *)&block[16] = __dispatch_async_with_logs_block_invoke;
  v54 = &unk_1E6993710;
  v33 = v28;
  v55 = v33;
  v34 = v29;
  id v56 = v34;
  dispatch_async(v33, block);

  objc_destroyWeak(&v49);

  objc_destroyWeak(&location);
}

void __125__BRCThumbnailGenerationManager__addThumbnailGenerationJobAtURL_targetURL_thumbnailID_timeout_syncContext_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  if (v3)
  {
    v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, (os_log_type_t)0x90u))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 138412802;
      uint64_t v10 = v8;
      __int16 v11 = 2112;
      id v12 = v3;
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_error_impl(&dword_1D353B000, v6, (os_log_type_t)0x90u, "[ERROR] Thumbnail creation of %@ failed with error: %@%@", (uint8_t *)&v9, 0x20u);
    }

    id v4 = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  [*(id *)(a1 + 48) _removeThumbnailOperationForThumbnailID:*(void *)(a1 + 56)];
  [WeakRetained hash];
  kdebug_trace();
}

uint64_t __125__BRCThumbnailGenerationManager__addThumbnailGenerationJobAtURL_targetURL_thumbnailID_timeout_syncContext_completionHandler___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) addOperation:*(void *)(a1 + 40)];
}

- (void)addThumbnailGenerationJobAtURL:(id)a3 targetURL:(id)a4 thumbnailID:(id)a5 syncContext:(id)a6 completionHandler:(id)a7
{
  if (a5)
  {
    id v15 = a7;
    -[BRCThumbnailGenerationManager _addThumbnailGenerationJobAtURL:targetURL:thumbnailID:timeout:syncContext:completionHandler:](self, "_addThumbnailGenerationJobAtURL:targetURL:thumbnailID:timeout:syncContext:completionHandler:", a3, a4, a5, 0, a6);
  }
  else
  {
    __int16 v13 = (void *)MEMORY[0x1E4F28C58];
    id v14 = a7;
    objc_msgSend(v13, "brc_errorInvalidParameter:value:", @"thumbnailID", 0);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void))a7 + 2))(v14, 0);
  }
}

- (void)addOutOfBandThumbnailGenerationJobAtURL:(id)a3 targetURL:(id)a4 syncContext:(id)a5 completionHandler:(id)a6
{
}

- (void)addOutOfBandThumbnailGenerationJobAtURL:(id)a3 targetURL:(id)a4 timeout:(double)a5 syncContext:(id)a6 completionHandler:(id)a7
{
  id v12 = NSNumber;
  id v13 = a7;
  id v14 = a6;
  id v15 = a4;
  id v16 = a3;
  id v17 = [v12 numberWithDouble:a5];
  [(BRCThumbnailGenerationManager *)self _addThumbnailGenerationJobAtURL:v16 targetURL:v15 thumbnailID:0 timeout:v17 syncContext:v14 completionHandler:v13];
}

- (void)cancel
{
  thumbnailPrivateQueue = self->_thumbnailPrivateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__BRCThumbnailGenerationManager_cancel__block_invoke;
  block[3] = &unk_1E6993698;
  block[4] = self;
  dispatch_sync(thumbnailPrivateQueue, block);
}

uint64_t __39__BRCThumbnailGenerationManager_cancel__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) enumerateKeysAndObjectsUsingBlock:&__block_literal_global_13];
}

uint64_t __39__BRCThumbnailGenerationManager_cancel__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 cancel];
}

- (id)operationForThumbnailID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__0;
  id v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  thumbnailPrivateQueue = self->_thumbnailPrivateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__BRCThumbnailGenerationManager_operationForThumbnailID___block_invoke;
  block[3] = &unk_1E69936C0;
  id v10 = v4;
  __int16 v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(thumbnailPrivateQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __57__BRCThumbnailGenerationManager_operationForThumbnailID___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 32) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)description
{
  thumbnailsOperations = self->_thumbnailsOperations;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__BRCThumbnailGenerationManager_description__block_invoke;
  v4[3] = &unk_1E69936E8;
  id v5 = 0;
  [(NSMutableDictionary *)thumbnailsOperations enumerateKeysAndObjectsUsingBlock:v4];

  return 0;
}

uint64_t __44__BRCThumbnailGenerationManager_description__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) appendFormat:@"[r:%@]: %@", a2, a3];
}

- (id)reachedThumbnailMaximumCapacity
{
  return self->_reachedThumbnailMaximumCapacity;
}

- (void)setReachedThumbnailMaximumCapacity:(id)a3
{
}

- (id)hasThumbnailAvailableSlot
{
  return self->_hasThumbnailAvailableSlot;
}

- (void)setHasThumbnailAvailableSlot:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_hasThumbnailAvailableSlot, 0);
  objc_storeStrong(&self->_reachedThumbnailMaximumCapacity, 0);
  objc_storeStrong((id *)&self->_thumbnailsOperations, 0);
  objc_storeStrong((id *)&self->_thumbnailPrivateQueue, 0);
  objc_storeStrong((id *)&self->_thumbnailQueue, 0);
}

void __68__BRCThumbnailGenerationManager__addThumbnailOperation_thumbnailID___block_invoke_cold_1(uint64_t a1)
{
  [*(id *)(*(void *)a1 + 32) count];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D353B000, v1, v2, "[DEBUG] Thumbnail manager: reached maximum allowed number of thumbnails retrieval (%ld)%@", v3, v4, v5, v6, v7);
}

void __73__BRCThumbnailGenerationManager__removeThumbnailOperationForThumbnailID___block_invoke_cold_1(uint64_t a1)
{
  [*(id *)(*(void *)a1 + 32) count];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D353B000, v1, v2, "[DEBUG] Thumbnail manager: below maximum allowed number of thumbnails retrieval (%ld)%@", v3, v4, v5, v6, v7);
}

@end