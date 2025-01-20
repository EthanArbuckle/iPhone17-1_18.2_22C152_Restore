@interface BRShareUnshareOperation
- (BRShareUnshareOperation)initWithShare:(id)a3;
- (BRShareUnshareOperation)initWithShare:(id)a3 fileURL:(id)a4;
- (CKShare)share;
- (id)unshareCompletionBlock;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)main;
- (void)setShare:(id)a3;
- (void)setUnshareCompletionBlock:(id)a3;
@end

@implementation BRShareUnshareOperation

- (BRShareUnshareOperation)initWithShare:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BRShareUnshareOperation;
  v5 = [(BRShareOperation *)&v8 initWithShare:v4];
  v6 = v5;
  if (v5) {
    [(BRShareUnshareOperation *)v5 setShare:v4];
  }

  return v6;
}

- (BRShareUnshareOperation)initWithShare:(id)a3 fileURL:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BRShareUnshareOperation;
  v7 = [(BRShareOperation *)&v10 initWithURL:a4];
  objc_super v8 = v7;
  if (v7) {
    [(BRShareUnshareOperation *)v7 setShare:v6];
  }

  return v8;
}

- (void)main
{
  v3 = [(BRShareOperation *)self remoteObject];
  id v4 = (void *)[(CKShare *)self->_share copy];
  br_setShareAssociatedURL(v4, 0);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__BRShareUnshareOperation_main__block_invoke;
  v5[3] = &unk_1E59AD448;
  v5[4] = self;
  [v3 startOperation:self toUnshareShare:v4 forceDelete:0 reply:v5];
}

uint64_t __31__BRShareUnshareOperation_main__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) completedWithResult:0 error:a2];
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(BRShareUnshareOperation *)self unshareCompletionBlock];
  v9 = (void *)v8;
  if (v8)
  {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v6);
    [(BRShareUnshareOperation *)self setUnshareCompletionBlock:0];
  }

  v10.receiver = self;
  v10.super_class = (Class)BRShareUnshareOperation;
  [(BROperation *)&v10 finishWithResult:v7 error:v6];
}

- (CKShare)share
{
  return self->_share;
}

- (void)setShare:(id)a3
{
}

- (id)unshareCompletionBlock
{
  return objc_getProperty(self, a2, 352, 1);
}

- (void)setUnshareCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unshareCompletionBlock, 0);

  objc_storeStrong((id *)&self->_share, 0);
}

@end