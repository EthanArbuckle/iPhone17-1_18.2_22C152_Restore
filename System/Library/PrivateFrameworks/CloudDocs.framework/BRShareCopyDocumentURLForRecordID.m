@interface BRShareCopyDocumentURLForRecordID
- (BRShareCopyDocumentURLForRecordID)initWithRecordID:(id)a3 fileURL:(id)a4 withServerLookup:(BOOL)a5;
- (BRShareCopyDocumentURLForRecordID)initWithRecordID:(id)a3 withServerLookup:(BOOL)a4;
- (id)copyDocumentURLCompletionBlock;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)main;
- (void)setCopyDocumentURLCompletionBlock:(id)a3;
@end

@implementation BRShareCopyDocumentURLForRecordID

- (BRShareCopyDocumentURLForRecordID)initWithRecordID:(id)a3 withServerLookup:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BRShareCopyDocumentURLForRecordID;
  v8 = [(BRShareOperation *)&v11 initWithDirectConnection];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_recordID, a3);
    v9->_withServerLookup = a4;
  }

  return v9;
}

- (BRShareCopyDocumentURLForRecordID)initWithRecordID:(id)a3 fileURL:(id)a4 withServerLookup:(BOOL)a5
{
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BRShareCopyDocumentURLForRecordID;
  v9 = [(BRShareOperation *)&v12 initWithDirectConnection];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_recordID, a3);
    v10->_withServerLookup = a5;
  }

  return v10;
}

- (void)main
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 344);
  int v4 = *(unsigned __int8 *)(a1 + 352);
  int v6 = 138412802;
  if (v4) {
    v5 = "Yes";
  }
  else {
    v5 = "No";
  }
  uint64_t v7 = v3;
  __int16 v8 = 2080;
  v9 = v5;
  __int16 v10 = 2112;
  uint64_t v11 = a2;
  _os_log_debug_impl(&dword_19ED3F000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] copying document url for '%@' server lookup:%s%@", (uint8_t *)&v6, 0x20u);
}

void __41__BRShareCopyDocumentURLForRecordID_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  int v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 url];
  [v4 completedWithResult:v6 error:v5];
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(BRShareCopyDocumentURLForRecordID *)self copyDocumentURLCompletionBlock];
  v9 = (void *)v8;
  if (v8)
  {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v6, v7);
    [(BRShareCopyDocumentURLForRecordID *)self setCopyDocumentURLCompletionBlock:0];
  }

  v10.receiver = self;
  v10.super_class = (Class)BRShareCopyDocumentURLForRecordID;
  [(BROperation *)&v10 finishWithResult:v6 error:v7];
}

- (id)copyDocumentURLCompletionBlock
{
  return objc_getProperty(self, a2, 360, 1);
}

- (void)setCopyDocumentURLCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_copyDocumentURLCompletionBlock, 0);

  objc_storeStrong((id *)&self->_recordID, 0);
}

@end