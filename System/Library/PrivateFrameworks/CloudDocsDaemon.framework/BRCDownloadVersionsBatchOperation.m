@interface BRCDownloadVersionsBatchOperation
- (BRCDownloadVersionsBatchOperation)initWithSyncContext:(id)a3 forNonLocalVersion:(BOOL)a4;
- (id)actionPrettyName;
- (id)createActivity;
- (id)perDownloadCompletionBlock;
- (id)transferredObjectsPrettyName;
- (void)addDownload:(id)a3;
- (void)addReaderID:(id)a3 completionHandler:(id)a4;
- (void)cancelReaderID:(id)a3;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)mainWithTransfers:(id)a3;
- (void)sendTransferCompletionCallBack:(id)a3 error:(id)a4;
- (void)setPerDownloadCompletionBlock:(id)a3;
@end

@implementation BRCDownloadVersionsBatchOperation

- (BRCDownloadVersionsBatchOperation)initWithSyncContext:(id)a3 forNonLocalVersion:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 session];
  v13.receiver = self;
  v13.super_class = (Class)BRCDownloadVersionsBatchOperation;
  v8 = [(BRCTransferBatchOperation *)&v13 initWithName:@"dl-version" syncContext:v6 sessionContext:v7];

  if (v8) {
    BOOL v9 = !v4;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    readers = v8->_readers;
    v8->_readers = v10;

    [(_BRCOperation *)v8 setNonDiscretionary:1];
  }
  return v8;
}

- (id)createActivity
{
  os_activity_t v2 = _os_activity_create(&dword_1D353B000, "dl-version", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (void)addDownload:(id)a3
{
  id v4 = a3;
  [(BRCTransferBatchOperation *)self addTransfer:v4];
  v5 = [(BRCSyncContext *)self->super.super._syncContext session];
  id v6 = [v5 analyticsReporter];
  v7 = [v4 fileObjectID];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__BRCDownloadVersionsBatchOperation_addDownload___block_invoke;
  v8[3] = &unk_1E6998898;
  v8[4] = self;
  [v6 lookupUserDownloadEventByFileObjectID:v7 accessor:v8];
}

uint64_t __49__BRCDownloadVersionsBatchOperation_addDownload___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) associateCKOperationsToEventMetric:a2];
}

- (void)sendTransferCompletionCallBack:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(BRCDownloadVersionsBatchOperation *)self perDownloadCompletionBlock];
  if (v8)
  {
    id v9 = v6;
    v10 = [(BRCSyncContext *)self->super.super._syncContext session];
    v11 = v10;
    if (v7)
    {
      v12 = [v10 clientDB];
      objc_super v13 = [v12 serialQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __74__BRCDownloadVersionsBatchOperation_sendTransferCompletionCallBack_error___block_invoke;
      block[3] = &unk_1E6996948;
      id v44 = v8;
      id v42 = v9;
      id v43 = v7;
      dispatch_sync(v13, block);

      v14 = v44;
    }
    else
    {
      id v40 = 0;
      id v39 = 0;
      v14 = [v9 _stageWithSession:v10 creationInfo:&v40 error:&v39];
      id v15 = v39;
      if (v14)
      {
        v16 = [(BRCTransferBatchOperation *)self pendingGroup];
        dispatch_group_enter(v16);

        v17 = [v9 storage];
        id v25 = v40;
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __74__BRCDownloadVersionsBatchOperation_sendTransferCompletionCallBack_error___block_invoke_136;
        v33[3] = &unk_1E69988C0;
        v28 = &v34;
        id v26 = v15;
        id v18 = v14;
        id v34 = v18;
        v19 = (id *)v35;
        v35[0] = v40;
        v35[1] = self;
        id v36 = v11;
        id v38 = v8;
        id v37 = v9;
        v20 = v26;
        [v17 createAdditionStagedAtURL:v18 creationInfo:v25 completionHandler:v33];

        v21 = v36;
      }
      else
      {
        v22 = brc_bread_crumbs();
        v23 = brc_default_log();
        if (os_log_type_enabled(v23, (os_log_type_t)0x90u)) {
          -[BRCDownloadVersionsBatchOperation sendTransferCompletionCallBack:error:]((uint64_t)v15);
        }

        v27 = [v11 clientDB];
        v24 = [v27 serialQueue];
        v20 = v15;
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __74__BRCDownloadVersionsBatchOperation_sendTransferCompletionCallBack_error___block_invoke_2;
        v29[3] = &unk_1E6996948;
        v28 = &v32;
        id v32 = v8;
        v19 = &v30;
        id v30 = v9;
        id v31 = v15;
        dispatch_sync(v24, v29);

        v21 = v31;
      }
    }
  }
}

uint64_t __74__BRCDownloadVersionsBatchOperation_sendTransferCompletionCallBack_error___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __74__BRCDownloadVersionsBatchOperation_sendTransferCompletionCallBack_error___block_invoke_136(id *a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    id v7 = brc_bread_crumbs();
    v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __74__BRCDownloadVersionsBatchOperation_sendTransferCompletionCallBack_error___block_invoke_136_cold_1((uint64_t)a1, (uint64_t)v7, v8);
    }
  }
  id v9 = [a1[6] pendingGroup];
  v10 = [a1[7] clientDB];
  v11 = [v10 serialQueue];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __74__BRCDownloadVersionsBatchOperation_sendTransferCompletionCallBack_error___block_invoke_137;
  v24[3] = &unk_1E6996948;
  id v27 = a1[9];
  id v25 = a1[8];
  id v12 = v6;
  id v26 = v12;
  objc_super v13 = v9;
  v14 = v11;
  id v15 = v24;
  v16 = (void *)MEMORY[0x1D9438760]();
  long long v28 = 0uLL;
  uint64_t v29 = 0;
  __brc_create_section(0, (uint64_t)"dispatch_group_async_with_logs", 293, &v28);
  v17 = brc_bread_crumbs();
  id v18 = brc_default_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v23 = v28;
    label = dispatch_queue_get_label(v14);
    *(_DWORD *)block = 134218498;
    *(void *)&void block[4] = v23;
    *(_WORD *)&block[12] = 2080;
    *(void *)&block[14] = label;
    *(_WORD *)&block[22] = 2112;
    id v31 = v17;
    _os_log_debug_impl(&dword_1D353B000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx dispatching to %s%@", block, 0x20u);
  }

  long long v34 = v28;
  uint64_t v35 = v29;
  *(void *)block = MEMORY[0x1E4F143A8];
  *(void *)&block[8] = 3221225472;
  *(void *)&block[16] = __dispatch_group_async_with_logs_block_invoke_0;
  id v31 = &unk_1E6993710;
  v19 = v14;
  id v32 = v19;
  v20 = v15;
  id v33 = v20;
  dispatch_group_async(v13, v19, block);

  v21 = [a1[6] pendingGroup];
  dispatch_group_leave(v21);
}

uint64_t __74__BRCDownloadVersionsBatchOperation_sendTransferCompletionCallBack_error___block_invoke_137(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __74__BRCDownloadVersionsBatchOperation_sendTransferCompletionCallBack_error___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)mainWithTransfers:(id)a3
{
  id v5 = [(BRCTransferBatchOperation *)self fetchOperationForTransfers:a3 traceCode:20];
  id v4 = [MEMORY[0x1E4F1A2D8] desiredKeysWithMask:53];
  [v5 setDesiredKeys:v4];

  [(_BRCOperation *)self addSubOperation:v5];
}

- (void)addReaderID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(_BRCOperation *)self callbackQueue];
  dispatch_activate(v8);

  id v9 = [(_BRCOperation *)self callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__BRCDownloadVersionsBatchOperation_addReaderID_completionHandler___block_invoke;
  block[3] = &unk_1E69977B8;
  id v13 = v6;
  id v14 = v7;
  void block[4] = self;
  id v10 = v6;
  id v11 = v7;
  dispatch_sync(v9, block);
}

void __67__BRCDownloadVersionsBatchOperation_addReaderID_completionHandler___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) isFinished];
  uint64_t v3 = *(void *)(a1 + 48);
  if (v2)
  {
    id v5 = [*(id *)(a1 + 32) error];
    id v4 = objc_msgSend(v5, "brc_wrappedError");
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  }
  else
  {
    id v5 = (id)MEMORY[0x1D94389C0](*(void *)(a1 + 48));
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 576), "setObject:forKeyedSubscript:");
  }
}

- (void)cancelReaderID:(id)a3
{
  id v4 = a3;
  id v5 = [(_BRCOperation *)self callbackQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__BRCDownloadVersionsBatchOperation_cancelReaderID___block_invoke;
  v7[3] = &unk_1E6993628;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __52__BRCDownloadVersionsBatchOperation_cancelReaderID___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(*(void *)(a1 + 32) + 576) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (v2)
  {
    id v6 = v2;
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 576) count];
    id v4 = *(id **)(a1 + 32);
    if (v3 == 1)
    {
      [v4 cancel];
    }
    else
    {
      [v4[72] removeObjectForKey:*(void *)(a1 + 40)];
      id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
      v6[2](v6, v5);
    }
    int v2 = v6;
  }
}

- (id)transferredObjectsPrettyName
{
  return @"previous documents versions";
}

- (id)actionPrettyName
{
  return @"downloading";
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = [(NSMutableDictionary *)self->_readers objectEnumerator];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * v12);
        id v14 = objc_msgSend(v7, "brc_wrappedError");
        (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  [(NSMutableDictionary *)self->_readers removeAllObjects];
  v15.receiver = self;
  v15.super_class = (Class)BRCDownloadVersionsBatchOperation;
  [(BRCTransferBatchOperation *)&v15 finishWithResult:v6 error:v7];
  [(BRCDownloadVersionsBatchOperation *)self setPerDownloadCompletionBlock:0];
}

- (id)perDownloadCompletionBlock
{
  return objc_getProperty(self, a2, 584, 1);
}

- (void)setPerDownloadCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_perDownloadCompletionBlock, 0);
  objc_storeStrong((id *)&self->_readers, 0);
}

- (void)sendTransferCompletionCallBack:(uint64_t)a1 error:.cold.1(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412546;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_3_1();
  _os_log_error_impl(&dword_1D353B000, v1, (os_log_type_t)0x90u, "[ERROR] Unable to stage item in Genstore: %@%@", (uint8_t *)&v2, 0x16u);
}

void __74__BRCDownloadVersionsBatchOperation_sendTransferCompletionCallBack_error___block_invoke_136_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = 138412802;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_debug_impl(&dword_1D353B000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Created addition staged at URL: %@, creation info: %@%@", (uint8_t *)&v5, 0x20u);
}

@end