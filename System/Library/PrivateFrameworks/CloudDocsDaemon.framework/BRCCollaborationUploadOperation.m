@interface BRCCollaborationUploadOperation
- (BOOL)shouldRetryForError:(id)a3;
- (BRCCollaborationUploadOperation)initWithRecord:(id)a3 progress:(id)a4 syncContext:(id)a5 sessionContext:(id)a6;
- (id)uploadCompletionBlock;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)main;
- (void)setUploadCompletionBlock:(id)a3;
@end

@implementation BRCCollaborationUploadOperation

- (BRCCollaborationUploadOperation)initWithRecord:(id)a3 progress:(id)a4 syncContext:(id)a5 sessionContext:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a5;
  v15 = [v11 recordID];
  v16 = [v15 recordName];
  v17 = [@"upload-" stringByAppendingString:v16];

  v21.receiver = self;
  v21.super_class = (Class)BRCCollaborationUploadOperation;
  v18 = [(_BRCOperation *)&v21 initWithName:v17 syncContext:v14 sessionContext:v13];

  if (v18)
  {
    objc_storeStrong((id *)&v18->_record, a3);
    objc_storeStrong((id *)&v18->_progress, a4);
    [(_BRCOperation *)v18 setNonDiscretionary:1];
    v19 = objc_msgSend(MEMORY[0x1E4F1A218], "br_collaborationUpload");
    [(_BRCOperation *)v18 setGroup:v19];
  }
  return v18;
}

- (void)main
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D353B000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Starting the upload operation%@", (uint8_t *)&v2, 0xCu);
}

void __39__BRCCollaborationUploadOperation_main__block_invoke(uint64_t a1, void *a2, double a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a3 < 0.0)
  {
    v6 = brc_bread_crumbs();
    v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134218242;
      double v10 = a3;
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_impl(&dword_1D353B000, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] Upload: Received negative progress from CK. progress [%f]%@", (uint8_t *)&v9, 0x16u);
    }
  }
  uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 512) totalUnitCount] * (uint64_t)(a3 * 1000.0) / 1000;
  if ([*(id *)(*(void *)(a1 + 32) + 512) completedUnitCount] <= v8) {
    [*(id *)(*(void *)(a1 + 32) + 512) setCompletedUnitCount:v8];
  }
}

void __39__BRCCollaborationUploadOperation_main__block_invoke_143(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v8 = a2;
  id v6 = a4;
  if (v6 || [v8 count] != 1)
  {
    v7 = 0;
  }
  else
  {
    v7 = [v8 objectAtIndexedSubscript:0];
  }
  [*(id *)(a1 + 32) completedWithResult:v7 error:v6];
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uploadCompletionBlock = (void (**)(id, id, id))self->_uploadCompletionBlock;
  if (uploadCompletionBlock) {
    uploadCompletionBlock[2](uploadCompletionBlock, v6, v7);
  }
  v9.receiver = self;
  v9.super_class = (Class)BRCCollaborationUploadOperation;
  [(_BRCOperation *)&v9 finishWithResult:v6 error:v7];
}

- (BOOL)shouldRetryForError:(id)a3
{
  return 0;
}

- (id)uploadCompletionBlock
{
  return objc_getProperty(self, a2, 520, 1);
}

- (void)setUploadCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_uploadCompletionBlock, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_record, 0);
}

@end