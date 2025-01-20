@interface BRCDownloadThumbnailsBatchOperation
- (BRCDownloadThumbnailsBatchOperation)initWithSyncContext:(id)a3;
- (id)actionPrettyName;
- (id)createActivity;
- (id)perDownloadCompletionBlock;
- (id)transferredObjectsPrettyName;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)mainWithTransfers:(id)a3;
- (void)sendTransferCompletionCallBack:(id)a3 error:(id)a4;
- (void)setPerDownloadCompletionBlock:(id)a3;
@end

@implementation BRCDownloadThumbnailsBatchOperation

- (BRCDownloadThumbnailsBatchOperation)initWithSyncContext:(id)a3
{
  id v4 = a3;
  v5 = [v4 session];
  v8.receiver = self;
  v8.super_class = (Class)BRCDownloadThumbnailsBatchOperation;
  v6 = [(BRCTransferBatchOperation *)&v8 initWithName:@"dl-thumbnail" syncContext:v4 sessionContext:v5];

  return v6;
}

- (id)createActivity
{
  os_activity_t v2 = _os_activity_create(&dword_1D353B000, "dl-thumbnail", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (void)sendTransferCompletionCallBack:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(BRCDownloadThumbnailsBatchOperation *)self perDownloadCompletionBlock];
  if (v8)
  {
    id v9 = v6;
    v10 = [(BRCSyncContext *)self->super.super._syncContext session];
    if (!v7)
    {
      v11 = [(BRCSyncContext *)self->super.super._syncContext session];
      id v19 = 0;
      [v9 _stageWithSession:v11 error:&v19];
      id v7 = v19;
    }
    v12 = [v10 clientDB];
    v13 = [v12 serialQueue];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __76__BRCDownloadThumbnailsBatchOperation_sendTransferCompletionCallBack_error___block_invoke;
    v15[3] = &unk_1E6996948;
    id v18 = v8;
    id v16 = v9;
    id v7 = v7;
    id v17 = v7;
    id v14 = v9;
    dispatch_sync(v13, v15);
  }
}

uint64_t __76__BRCDownloadThumbnailsBatchOperation_sendTransferCompletionCallBack_error___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)mainWithTransfers:(id)a3
{
  id v5 = [(BRCTransferBatchOperation *)self fetchOperationForTransfers:a3 traceCode:16];
  id v4 = [MEMORY[0x1E4F1A2D8] desiredKeysWithMask:16];
  [v5 setDesiredKeys:v4];

  [(_BRCOperation *)self addSubOperation:v5];
}

- (id)transferredObjectsPrettyName
{
  return @"thumbnails";
}

- (id)actionPrettyName
{
  return @"downloading";
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)BRCDownloadThumbnailsBatchOperation;
  [(BRCTransferBatchOperation *)&v5 finishWithResult:a3 error:a4];
  [(BRCDownloadThumbnailsBatchOperation *)self setPerDownloadCompletionBlock:0];
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