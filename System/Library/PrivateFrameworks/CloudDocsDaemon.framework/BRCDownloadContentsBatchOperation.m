@interface BRCDownloadContentsBatchOperation
- (BRCDownloadContentsBatchOperation)initWithSyncContext:(id)a3 sessionContext:(id)a4;
- (id)actionPrettyName;
- (id)createActivity;
- (id)perDownloadCompletionBlock;
- (id)transferredObjectsPrettyName;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)mainWithTransfers:(id)a3;
- (void)sendTransferCompletionCallBack:(id)a3 error:(id)a4;
- (void)setPerDownloadCompletionBlock:(id)a3;
@end

@implementation BRCDownloadContentsBatchOperation

- (BRCDownloadContentsBatchOperation)initWithSyncContext:(id)a3 sessionContext:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)BRCDownloadContentsBatchOperation;
  return [(BRCTransferBatchOperation *)&v5 initWithName:@"dl-content" syncContext:a3 sessionContext:a4];
}

- (id)createActivity
{
  os_activity_t v2 = _os_activity_create(&dword_1D353B000, "dl-content", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (void)sendTransferCompletionCallBack:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(BRCDownloadContentsBatchOperation *)self perDownloadCompletionBlock];
  if (v8)
  {
    id v9 = v6;
    v10 = [(BRCSyncContext *)self->super.super._syncContext session];
    v11 = [v10 clientDB];
    v12 = [v11 serialQueue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __74__BRCDownloadContentsBatchOperation_sendTransferCompletionCallBack_error___block_invoke;
    v14[3] = &unk_1E6993D18;
    id v15 = v7;
    id v16 = v9;
    v17 = self;
    id v18 = v8;
    id v13 = v9;
    dispatch_sync(v12, v14);
  }
}

void __74__BRCDownloadContentsBatchOperation_sendTransferCompletionCallBack_error___block_invoke(uint64_t a1)
{
  id v4 = *(id *)(a1 + 32);
  if (!v4)
  {
    os_activity_t v2 = *(void **)(a1 + 40);
    v3 = [*(id *)(*(void *)(a1 + 48) + 248) session];
    [v2 _stageWithSession:v3 error:&v4];
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)mainWithTransfers:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = [a3 allObjects];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v11 = [v10 desiredIndices];
        v12 = (void *)v11;
        if (v11)
        {
          v23 = @"pkgContent";
          uint64_t v24 = v11;
          id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
          v14 = [v10 recordID];
          [v4 setObject:v13 forKeyedSubscript:v14];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v7);
  }

  id v15 = [v5 objectEnumerator];
  id v16 = [(BRCTransferBatchOperation *)self fetchOperationForTransfers:v15 traceCode:18];

  v17 = [MEMORY[0x1E4F1A2D8] desiredKeysWithMask:4];
  [v16 setDesiredKeys:v17];

  if ([v4 count]) {
    [v16 setDesiredPackageFileIndices:v4];
  }
  [(_BRCOperation *)self addSubOperation:v16];
}

- (id)transferredObjectsPrettyName
{
  return @"documents";
}

- (id)actionPrettyName
{
  return @"downloading";
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)BRCDownloadContentsBatchOperation;
  [(BRCTransferBatchOperation *)&v5 finishWithResult:a3 error:a4];
  [(BRCDownloadContentsBatchOperation *)self setPerDownloadCompletionBlock:0];
}

- (id)perDownloadCompletionBlock
{
  return objc_getProperty(self, a2, 576, 1);
}

- (void)setPerDownloadCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end