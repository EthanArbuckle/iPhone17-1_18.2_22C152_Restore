@interface BRDownloadAndUploadAllFilesForLogOutOperation
- (BRDownloadAndUploadAllFilesForLogOutOperation)init;
- (BRGlobalProgressProxy)progress;
- (id)downloadAllFilesCompletionBlock;
- (void)cancel;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)main;
- (void)setDownloadAllFilesCompletionBlock:(id)a3;
- (void)setProgress:(id)a3;
@end

@implementation BRDownloadAndUploadAllFilesForLogOutOperation

- (BRDownloadAndUploadAllFilesForLogOutOperation)init
{
  v10.receiver = self;
  v10.super_class = (Class)BRDownloadAndUploadAllFilesForLogOutOperation;
  v2 = [(BROperation *)&v10 init];
  if (v2)
  {
    v3 = [[BRGlobalProgressProxy alloc] initWithGlobalProgressKind:0];
    progress = v2->_progress;
    v2->_progress = v3;

    v5 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = v5;

    [(NSOperationQueue *)v2->_internalQueue setMaxConcurrentOperationCount:1];
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    fileCoordinators = v2->_fileCoordinators;
    v2->_fileCoordinators = v7;
  }
  return v2;
}

- (void)cancel
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)BRDownloadAndUploadAllFilesForLogOutOperation;
  [(BROperation *)&v16 cancel];
  v3 = self;
  objc_sync_enter(v3);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  p_isa = (id *)&v3->super.super.super.isa;
  v4 = v3->_fileCoordinators;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v12 + 1) + 8 * v7);
        v9 = brc_bread_crumbs((uint64_t)"-[BRDownloadAndUploadAllFilesForLogOutOperation cancel]", 49);
        objc_super v10 = brc_default_log(1);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v18 = v8;
          __int16 v19 = 2112;
          v20 = v9;
          _os_log_debug_impl(&dword_19ED3F000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] Cancelling %@%@", buf, 0x16u);
        }

        [v8 cancel];
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v21 count:16];
    }
    while (v5);
  }

  [p_isa[41] cancel];
  objc_sync_exit(p_isa);
}

- (void)main
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  [(BRProgressProxy *)self->_progress start];
  v3 = brc_bread_crumbs((uint64_t)"-[BRDownloadAndUploadAllFilesForLogOutOperation main]", 65);
  v4 = brc_default_log(1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_19ED3F000, v4, OS_LOG_TYPE_DEFAULT, "[NOTICE] downloading and uploading all files because we're logging out%@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__10;
  v33 = __Block_byref_object_dispose__10;
  id v34 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__10;
  v24[4] = __Block_byref_object_dispose__10;
  id v25 = 0;
  uint64_t v5 = dispatch_group_create();
  uint64_t v6 = self;
  objc_sync_enter(v6);
  uint64_t v7 = objc_alloc_init(BRUploadAllFilesForLogOutOperation);
  uploadOp = v6->_uploadOp;
  v6->_uploadOp = v7;

  [(BRUploadAllFilesForLogOutOperation *)v6->_uploadOp setShouldKeepDataLocal:1];
  if ([(BROperation *)v6 finishIfCancelled])
  {
    objc_sync_exit(v6);
  }
  else
  {
    dispatch_group_enter(v5);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __53__BRDownloadAndUploadAllFilesForLogOutOperation_main__block_invoke;
    v21[3] = &unk_1E59AE9E8;
    p_long long buf = &buf;
    v9 = v5;
    uint64_t v22 = v9;
    [(BRUploadAllFilesForLogOutOperation *)v6->_uploadOp setUploadAllFilesCompletionBlock:v21];
    [(NSOperationQueue *)v6->_internalQueue addOperation:v6->_uploadOp];

    objc_sync_exit(v6);
    dispatch_group_enter(v9);
    objc_super v10 = +[BRContainer documentContainers];
    v11 = brc_bread_crumbs((uint64_t)"-[BRDownloadAndUploadAllFilesForLogOutOperation main]", 93);
    long long v12 = brc_default_log(1);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v26 = 138412546;
      v27 = v10;
      __int16 v28 = 2112;
      v29 = v11;
      _os_log_impl(&dword_19ED3F000, v12, OS_LOG_TYPE_DEFAULT, "[NOTICE] forcing a sync down on containers: %@%@", v26, 0x16u);
    }

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __53__BRDownloadAndUploadAllFilesForLogOutOperation_main__block_invoke_8;
    v17[3] = &unk_1E59AF600;
    v17[4] = v6;
    long long v13 = v9;
    v18 = v13;
    long long v14 = v10;
    __int16 v19 = v14;
    v20 = v24;
    +[BRContainer forceRefreshContainers:v14 completion:v17];
    long long v15 = [(BROperation *)v6 callbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__BRDownloadAndUploadAllFilesForLogOutOperation_main__block_invoke_15;
    block[3] = &unk_1E59AF628;
    block[4] = v6;
    block[5] = &buf;
    block[6] = v24;
    dispatch_group_notify(v13, v15, block);

    uint64_t v6 = v14;
  }

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&buf, 8);
}

void __53__BRDownloadAndUploadAllFilesForLogOutOperation_main__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  uint64_t v5 = brc_bread_crumbs((uint64_t)"-[BRDownloadAndUploadAllFilesForLogOutOperation main]_block_invoke", 82);
  uint64_t v6 = brc_default_log(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = @"success";
    if (v4) {
      uint64_t v7 = v4;
    }
    int v8 = 138412546;
    v9 = v7;
    __int16 v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_19ED3F000, v6, OS_LOG_TYPE_DEFAULT, "[NOTICE] done uploading\n status: %@%@", (uint8_t *)&v8, 0x16u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __53__BRDownloadAndUploadAllFilesForLogOutOperation_main__block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v23 = a2;
  v3 = brc_bread_crumbs((uint64_t)"-[BRDownloadAndUploadAllFilesForLogOutOperation main]_block_invoke", 95);
  v4 = brc_default_log(1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __53__BRDownloadAndUploadAllFilesForLogOutOperation_main__block_invoke_8_cold_1((uint64_t)v23, (uint64_t)v3, v4);
  }

  if (([*(id *)(a1 + 32) finishIfCancelled] & 1) == 0)
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v37 = 0u;
    long long v36 = 0u;
    id obj = *(id *)(a1 + 48);
    uint64_t v5 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
    if (v5)
    {
      uint64_t v25 = *(void *)v37;
      *(void *)&long long v6 = 134218754;
      long long v22 = v6;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v37 != v25) {
            objc_enumerationMutation(obj);
          }
          int v8 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          v9 = objc_msgSend(v8, "documentsURL", v22);
          if (v9 && [v8 isDocumentScopePublic])
          {
            id v10 = objc_alloc_init(MEMORY[0x1E4F28CA0]);
            [v8 registerCurrentProcessAsPriorityHintWithError:0];
            v11 = [MEMORY[0x1E4F28C98] readingIntentWithURL:v9 options:131073];
            id v12 = *(id *)(a1 + 32);
            objc_sync_enter(v12);
            [*(id *)(*(void *)(a1 + 32) + 304) addObject:v10];
            if ([*(id *)(a1 + 32) isCancelled])
            {
              [v10 cancel];
              objc_sync_exit(v12);

              goto LABEL_19;
            }
            objc_sync_exit(v12);

            long long v13 = [v8 identifier];
            long long v34 = 0uLL;
            uint64_t v35 = 0;
            __brc_create_section(0, (uint64_t)"-[BRDownloadAndUploadAllFilesForLogOutOperation main]_block_invoke", 123, &v34);
            long long v14 = brc_bread_crumbs((uint64_t)"-[BRDownloadAndUploadAllFilesForLogOutOperation main]_block_invoke", 123);
            long long v15 = brc_default_log(1);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)long long buf = v22;
              *(void *)&uint8_t buf[4] = v34;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v13;
              *(_WORD *)&buf[22] = 2112;
              id v42 = v10;
              __int16 v43 = 2112;
              v44 = v14;
              _os_log_debug_impl(&dword_19ED3F000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx taking a coordinated read recursive on %@ using %@%@", buf, 0x2Au);
            }

            *(_OWORD *)long long buf = v34;
            *(void *)&buf[16] = v35;
            dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
            v40 = v11;
            objc_super v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
            uint64_t v17 = *(void *)(a1 + 32);
            uint64_t v18 = *(void *)(v17 + 320);
            v26[0] = MEMORY[0x1E4F143A8];
            v26[1] = 3221225472;
            v26[2] = __53__BRDownloadAndUploadAllFilesForLogOutOperation_main__block_invoke_12;
            v26[3] = &unk_1E59AF5D8;
            long long v32 = *(_OWORD *)buf;
            uint64_t v33 = *(void *)&buf[16];
            uint64_t v19 = *(void *)(a1 + 56);
            id v27 = v13;
            uint64_t v28 = v17;
            uint64_t v31 = v19;
            id v29 = v10;
            id v30 = *(id *)(a1 + 40);
            id v20 = v10;
            id v21 = v13;
            [v20 coordinateAccessWithIntents:v16 queue:v18 byAccessor:v26];
          }
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_19:
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __53__BRDownloadAndUploadAllFilesForLogOutOperation_main__block_invoke_12(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  long long v16 = *(_OWORD *)(a1 + 72);
  uint64_t v17 = *(void *)(a1 + 88);
  v4 = brc_bread_crumbs((uint64_t)"-[BRDownloadAndUploadAllFilesForLogOutOperation main]_block_invoke", 128);
  uint64_t v5 = brc_default_log(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    long long v15 = @"success";
    if (v3) {
      long long v15 = v3;
    }
    *(_DWORD *)long long buf = 134218754;
    uint64_t v21 = v16;
    __int16 v22 = 2112;
    uint64_t v23 = v14;
    __int16 v24 = 2112;
    uint64_t v25 = v15;
    __int16 v26 = 2112;
    id v27 = v4;
    _os_log_debug_impl(&dword_19ED3F000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx obtained a coordinated read on %@: %@%@", buf, 0x2Au);
  }

  if (v3)
  {
    long long v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F28A50];
    uint64_t v19 = v3;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    uint64_t v8 = [v6 errorWithDomain:@"BRCloudDocsErrorDomain" code:1001 userInfo:v7];
    uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  id v11 = *(id *)(a1 + 40);
  objc_sync_enter(v11);
  [*(id *)(*(void *)(a1 + 40) + 304) removeObject:*(void *)(a1 + 48)];
  id v12 = brc_bread_crumbs((uint64_t)"-[BRDownloadAndUploadAllFilesForLogOutOperation main]_block_invoke", 135);
  long long v13 = brc_default_log(1);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    __53__BRDownloadAndUploadAllFilesForLogOutOperation_main__block_invoke_12_cold_1((uint64_t)v12, buf, [*(id *)(*(void *)(a1 + 40) + 304) count], v13);
  }

  objc_sync_exit(v11);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
  __brc_leave_section((uint64_t)&v16);
}

void __53__BRDownloadAndUploadAllFilesForLogOutOperation_main__block_invoke_15(uint64_t a1)
{
  v2 = brc_bread_crumbs((uint64_t)"-[BRDownloadAndUploadAllFilesForLogOutOperation main]_block_invoke", 148);
  v3 = brc_default_log(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __53__BRDownloadAndUploadAllFilesForLogOutOperation_main__block_invoke_15_cold_1((uint64_t)v2, v3);
  }

  if (([*(id *)(a1 + 32) finishIfCancelled] & 1) == 0)
  {
    v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (!v4) {
      v4 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    }
    id v5 = v4;
    [*(id *)(a1 + 32) completedWithResult:0 error:v5];
  }
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v6 = (__CFString *)a4;
  id v7 = a3;
  uint64_t v8 = brc_bread_crumbs((uint64_t)"-[BRDownloadAndUploadAllFilesForLogOutOperation finishWithResult:error:]", 166);
  uint64_t v9 = brc_default_log(1);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = @"success";
    if (v6) {
      id v10 = v6;
    }
    *(_DWORD *)long long buf = 138412546;
    long long v15 = v10;
    __int16 v16 = 2112;
    uint64_t v17 = v8;
    _os_log_impl(&dword_19ED3F000, v9, OS_LOG_TYPE_DEFAULT, "[NOTICE] uploading and downloading all files for logout finished\n status: %@%@", buf, 0x16u);
  }

  uint64_t v11 = [(BRDownloadAndUploadAllFilesForLogOutOperation *)self downloadAllFilesCompletionBlock];
  id v12 = (void *)v11;
  if (v11)
  {
    (*(void (**)(uint64_t, __CFString *))(v11 + 16))(v11, v6);
    [(BRDownloadAndUploadAllFilesForLogOutOperation *)self setDownloadAllFilesCompletionBlock:0];
  }

  [(BRProgressProxy *)self->_progress stop];
  +[BRContainer unregisterCurrentProcessAsPriorityHint];
  v13.receiver = self;
  v13.super_class = (Class)BRDownloadAndUploadAllFilesForLogOutOperation;
  [(BROperation *)&v13 finishWithResult:v7 error:v6];
}

- (id)downloadAllFilesCompletionBlock
{
  return objc_getProperty(self, a2, 312, 1);
}

- (void)setDownloadAllFilesCompletionBlock:(id)a3
{
}

- (BRGlobalProgressProxy)progress
{
  return (BRGlobalProgressProxy *)objc_getProperty(self, a2, 296, 1);
}

- (void)setProgress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploadOp, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong(&self->_downloadAllFilesCompletionBlock, 0);
  objc_storeStrong((id *)&self->_fileCoordinators, 0);

  objc_storeStrong((id *)&self->_progress, 0);
}

void __53__BRDownloadAndUploadAllFilesForLogOutOperation_main__block_invoke_8_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_19ED3F000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] done forcing sync down: %@%@", (uint8_t *)&v3, 0x16u);
}

void __53__BRDownloadAndUploadAllFilesForLogOutOperation_main__block_invoke_12_cold_1(uint64_t a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)long long buf = 134218242;
  *(void *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a1;
  _os_log_debug_impl(&dword_19ED3F000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] still waiting for %ld container(s) to download%@", buf, 0x16u);
}

void __53__BRDownloadAndUploadAllFilesForLogOutOperation_main__block_invoke_15_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_19ED3F000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] completed download and upload%@", (uint8_t *)&v2, 0xCu);
}

@end