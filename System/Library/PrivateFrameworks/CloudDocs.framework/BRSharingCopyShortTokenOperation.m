@interface BRSharingCopyShortTokenOperation
- (BRSharingCopyShortTokenOperation)initWithURL:(id)a3;
- (id)shortTokenCompletionBlock;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)main;
- (void)setShortTokenCompletionBlock:(id)a3;
@end

@implementation BRSharingCopyShortTokenOperation

- (BRSharingCopyShortTokenOperation)initWithURL:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BRSharingCopyShortTokenOperation;
  return [(BRShareOperation *)&v4 initWithURL:a3];
}

- (void)main
{
  if (BRIsFPFSEnabled(self, a2))
  {
    v3 = [(BRShareOperation *)self remoteFPFSObject];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __40__BRSharingCopyShortTokenOperation_main__block_invoke;
    v6[3] = &unk_1E59AD910;
    v6[4] = self;
    [v3 startOperation:self toCopyShortTokenWithReply:v6];
  }
  else
  {
    v3 = [(BRShareOperation *)self remoteLegacyObject];
    objc_super v4 = [(BRShareOperation *)self url];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __40__BRSharingCopyShortTokenOperation_main__block_invoke_2;
    v5[3] = &unk_1E59AD910;
    v5[4] = self;
    [v3 startOperation:self toCopyShortTokenAtURL:v4 reply:v5];
  }
}

uint64_t __40__BRSharingCopyShortTokenOperation_main__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) completedWithResult:a2 error:a3];
}

uint64_t __40__BRSharingCopyShortTokenOperation_main__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) completedWithResult:a2 error:a3];
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(BRSharingCopyShortTokenOperation *)self shortTokenCompletionBlock];
  v9 = (void *)v8;
  if (v8)
  {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v6, v7);
    [(BRSharingCopyShortTokenOperation *)self setShortTokenCompletionBlock:0];
  }

  v10.receiver = self;
  v10.super_class = (Class)BRSharingCopyShortTokenOperation;
  [(BROperation *)&v10 finishWithResult:v6 error:v7];
}

- (id)shortTokenCompletionBlock
{
  return objc_getProperty(self, a2, 344, 1);
}

- (void)setShortTokenCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end