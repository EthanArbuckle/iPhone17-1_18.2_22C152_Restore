@interface BRSharingCopyShareInfoOperation
- (BRSharingCopyShareInfoOperation)initWithURL:(id)a3;
- (id)copyShareInfoCompletionBlock;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)main;
- (void)setCopyShareInfoCompletionBlock:(id)a3;
@end

@implementation BRSharingCopyShareInfoOperation

- (BRSharingCopyShareInfoOperation)initWithURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRSharingCopyShareInfoOperation;
  v6 = [(BROperation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_fileURL, a3);
  }

  return v7;
}

- (void)main
{
  v3 = [(BROperation *)self remoteLegacyObject];
  fileURL = self->_fileURL;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__BRSharingCopyShareInfoOperation_main__block_invoke;
  v5[3] = &unk_1E59AD8E8;
  v5[4] = self;
  [v3 startOperation:self toCopyShareInfoAtURL:fileURL reply:v5];
}

void __39__BRSharingCopyShareInfoOperation_main__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v6 = *(void **)(a1 + 32);
  v12[0] = a2;
  v12[1] = a3;
  v7 = (void *)MEMORY[0x1E4F1C978];
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  v11 = [v7 arrayWithObjects:v12 count:2];
  [v6 completedWithResult:v11 error:v8];
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v8 = a3;
  id v5 = [(BRSharingCopyShareInfoOperation *)self copyShareInfoCompletionBlock];
  if (v5)
  {
    v6 = [v8 objectAtIndexedSubscript:0];
    v7 = [v8 objectAtIndexedSubscript:1];
    ((void (**)(void, void *, void *, void))v5)[2](v5, v6, v7, 0);

    [(BRSharingCopyShareInfoOperation *)self setCopyShareInfoCompletionBlock:0];
  }
}

- (id)copyShareInfoCompletionBlock
{
  return objc_getProperty(self, a2, 304, 1);
}

- (void)setCopyShareInfoCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_copyShareInfoCompletionBlock, 0);

  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end