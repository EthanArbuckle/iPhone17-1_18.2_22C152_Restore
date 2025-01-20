@interface BRCUploadAllFilesTrackerOperation
- (BOOL)shouldRetryForError:(id)a3;
- (BRCUploadAllFilesTrackerOperation)initWithSession:(id)a3 appLibraries:(id)a4;
- (NSString)description;
- (void)cancel;
- (void)clientZone:(id)a3 didFinishUploadingAllItemsWithError:(id)a4;
- (void)main;
@end

@implementation BRCUploadAllFilesTrackerOperation

- (BRCUploadAllFilesTrackerOperation)initWithSession:(id)a3 appLibraries:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 syncContextProvider];
  v10 = [v9 defaultSyncContext];
  v28.receiver = self;
  v28.super_class = (Class)BRCUploadAllFilesTrackerOperation;
  v11 = [(_BRCOperation *)&v28 initWithName:@"upload-tracker" syncContext:v10 sessionContext:v7];

  if (v11)
  {
    objc_storeStrong((id *)&v11->_session, a3);
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v13 = v8;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v25;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v25 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * v17), "defaultClientZone", (void)v24);
          [v12 addObject:v18];

          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v15);
    }

    v19 = [v12 allObjects];
    uint64_t v20 = [v19 mutableCopy];
    zonesStillUploading = v11->_zonesStillUploading;
    v11->_zonesStillUploading = (NSMutableArray *)v20;

    v22 = objc_msgSend(MEMORY[0x1E4F1A218], "br_logout");
    [(_BRCOperation *)v11 setGroup:v22];
  }
  return v11;
}

- (BOOL)shouldRetryForError:(id)a3
{
  return 0;
}

- (void)cancel
{
  v6.receiver = self;
  v6.super_class = (Class)BRCUploadAllFilesTrackerOperation;
  [(_BRCOperation *)&v6 cancel];
  v3 = [(BRCAccountSession *)self->_session clientDB];
  v4 = [v3 serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__BRCUploadAllFilesTrackerOperation_cancel__block_invoke;
  block[3] = &unk_1E6993698;
  block[4] = self;
  dispatch_async(v4, block);
}

void __43__BRCUploadAllFilesTrackerOperation_cancel__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) finishIfCancelled])
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v2 = *(id *)(*(void *)(a1 + 32) + 528);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v10;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(v2);
          }
          objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v6++), "unregisterAllItemsDidUploadTracker:", *(void *)(a1 + 32), (void)v9);
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v4);
    }

    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 528);
    *(void *)(v7 + 528) = 0;
  }
}

- (void)clientZone:(id)a3 didFinishUploadingAllItemsWithError:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (__CFString *)a4;
  id v8 = [(BRCAccountSession *)self->_session clientDB];
  [v8 assertOnQueue];

  long long v9 = brc_bread_crumbs();
  long long v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v20 = [v6 zoneName];
    v21 = (void *)v20;
    *(_DWORD *)buf = 138413058;
    v22 = @"success";
    long long v26 = self;
    if (v7) {
      v22 = v7;
    }
    __int16 v27 = 2112;
    uint64_t v28 = v20;
    __int16 v29 = 2112;
    uint64_t v30 = v22;
    __int16 v31 = 2112;
    v32 = v9;
    _os_log_debug_impl(&dword_1D353B000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: finished uploading all items in %@: %@%@", buf, 0x2Au);
  }
  [(NSMutableArray *)self->_zonesStillUploading removeObject:v6];
  if (v7)
  {
    perContainerIDError = self->_perContainerIDError;
    long long v12 = [v6 mangledID];
    id v13 = [v12 aliasTargetContainerString];
    [(NSMutableDictionary *)perContainerIDError setObject:v7 forKeyedSubscript:v13];
  }
  if (![(NSMutableArray *)self->_zonesStillUploading count] && self->_zonesStillUploading)
  {
    if ([(NSMutableDictionary *)self->_perContainerIDError count])
    {
      uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = *MEMORY[0x1E4F592A8];
      uint64_t v16 = (void *)[(NSMutableDictionary *)self->_perContainerIDError copy];
      long long v24 = v16;
      uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      uint64_t v18 = [v14 errorWithDomain:v15 code:21 userInfo:v17];

      uint64_t v7 = (__CFString *)v18;
    }
    [(_BRCOperation *)self completedWithResult:0 error:v7];
    zonesStillUploading = self->_zonesStillUploading;
    self->_zonesStillUploading = 0;
  }
}

- (void)main
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BRCAccountSession *)self->_session clientDB];
  uint64_t v4 = [v3 serialQueue];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __41__BRCUploadAllFilesTrackerOperation_main__block_invoke;
  v18[3] = &unk_1E6993698;
  v18[4] = self;
  uint64_t v5 = v4;
  id v6 = v18;
  long long v11 = (void *)MEMORY[0x1D9438760](v6, v7, v8, v9, v10);
  long long v19 = 0uLL;
  uint64_t v20 = 0;
  __brc_create_section(0, (uint64_t)"dispatch_async_with_logs", 262, &v19);
  long long v12 = brc_bread_crumbs();
  id v13 = brc_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = v19;
    label = dispatch_queue_get_label(v5);
    *(_DWORD *)block = 134218498;
    *(void *)&block[4] = v16;
    *(_WORD *)&block[12] = 2080;
    *(void *)&block[14] = label;
    *(_WORD *)&block[22] = 2112;
    v22 = v12;
    _os_log_debug_impl(&dword_1D353B000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx dispatching to %s%@", block, 0x20u);
  }

  long long v25 = v19;
  uint64_t v26 = v20;
  *(void *)block = MEMORY[0x1E4F143A8];
  *(void *)&block[8] = 3221225472;
  *(void *)&block[16] = __dispatch_async_with_logs_block_invoke_22;
  v22 = &unk_1E6993710;
  uint64_t v14 = v5;
  uint64_t v23 = v14;
  uint64_t v15 = v6;
  id v24 = v15;
  dispatch_async(v14, block);
}

void __41__BRCUploadAllFilesTrackerOperation_main__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) finishIfCancelled] & 1) == 0)
  {
    if ([*(id *)(*(void *)(a1 + 32) + 528) count])
    {
      long long v10 = 0u;
      long long v11 = 0u;
      long long v8 = 0u;
      long long v9 = 0u;
      id v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 528), "copy", 0);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3)
      {
        uint64_t v4 = v3;
        uint64_t v5 = *(void *)v9;
        do
        {
          for (uint64_t i = 0; i != v4; ++i)
          {
            if (*(void *)v9 != v5) {
              objc_enumerationMutation(v2);
            }
            [*(id *)(*((void *)&v8 + 1) + 8 * i) registerAllItemsDidUploadTracker:*(void *)(a1 + 32)];
          }
          uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
        }
        while (v4);
      }
    }
    else
    {
      uint64_t v7 = *(void **)(a1 + 32);
      [v7 completedWithResult:0 error:0];
    }
  }
}

- (NSString)description
{
  uint64_t v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)BRCUploadAllFilesTrackerOperation;
  uint64_t v4 = [(_BRCOperation *)&v7 description];
  uint64_t v5 = [v3 stringWithFormat:@"%@ - zones still uploading: %@", v4, self->_zonesStillUploading];

  return (NSString *)v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perContainerIDError, 0);
  objc_storeStrong((id *)&self->_hiddenZoneWithError, 0);
  objc_storeStrong((id *)&self->_zonesStillUploading, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end