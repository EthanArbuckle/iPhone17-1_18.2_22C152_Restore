@interface BRSharingCopyEtagOperation
- (BRSharingCopyEtagOperation)initWithURL:(id)a3;
- (id)sharingEtagCompletionBlock;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)main;
- (void)setSharingEtagCompletionBlock:(id)a3;
@end

@implementation BRSharingCopyEtagOperation

- (BRSharingCopyEtagOperation)initWithURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRSharingCopyEtagOperation;
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
  v5[2] = __34__BRSharingCopyEtagOperation_main__block_invoke;
  v5[3] = &unk_1E59AD910;
  v5[4] = self;
  [v3 startOperation:self toCopyEtagAtURL:fileURL reply:v5];
}

uint64_t __34__BRSharingCopyEtagOperation_main__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) completedWithResult:a2 error:a3];
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(BRSharingCopyEtagOperation *)self sharingEtagCompletionBlock];
  objc_super v9 = (void *)v8;
  if (v8)
  {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v6, v7);
    [(BRSharingCopyEtagOperation *)self setSharingEtagCompletionBlock:0];
  }

  v10.receiver = self;
  v10.super_class = (Class)BRSharingCopyEtagOperation;
  [(BROperation *)&v10 finishWithResult:v6 error:v7];
}

- (id)sharingEtagCompletionBlock
{
  return objc_getProperty(self, a2, 304, 1);
}

- (void)setSharingEtagCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sharingEtagCompletionBlock, 0);

  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end