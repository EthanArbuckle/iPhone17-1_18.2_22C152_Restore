@interface BRShareCopyOperation
- (BRShareCopyOperation)initWithItemID:(id)a3;
- (BRShareCopyOperation)initWithURL:(id)a3;
- (id)rootShareCopyCompletionBlock;
- (id)shareCopyCompletionBlock;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)main;
- (void)setRootShareCopyCompletionBlock:(id)a3;
- (void)setShareCopyCompletionBlock:(id)a3;
@end

@implementation BRShareCopyOperation

- (BRShareCopyOperation)initWithURL:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BRShareCopyOperation;
  return [(BRShareOperation *)&v4 initWithURL:a3];
}

- (BRShareCopyOperation)initWithItemID:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BRShareCopyOperation;
  return [(BRShareOperation *)&v4 initWithItemIdentifier:a3];
}

- (void)main
{
  OUTLINED_FUNCTION_4_0();
  v1 = [v0 url];
  v2 = [v1 path];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_19ED3F000, v3, v4, "[DEBUG] copying share for '%@'%@", v5, v6, v7, v8, v9);
}

void __28__BRShareCopyOperation_main__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  id v7 = a3;
  id v8 = a4;
  uint8_t v9 = objc_opt_new();
  if (v10) {
    [v9 setObject:v10 forKeyedSubscript:@"share"];
  }
  if (v7) {
    [v9 setObject:v7 forKeyedSubscript:@"rootURL"];
  }
  [*(id *)(a1 + 32) completedWithResult:v9 error:v8];
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 objectForKeyedSubscript:@"share"];
  uint8_t v9 = [(BRShareOperation *)self url];
  br_setShareAssociatedURL(v8, v9);

  id v10 = [v6 objectForKeyedSubscript:@"rootURL"];
  uint64_t v11 = [(BRShareCopyOperation *)self shareCopyCompletionBlock];
  v12 = (void *)v11;
  if (v11)
  {
    (*(void (**)(uint64_t, void *, id))(v11 + 16))(v11, v8, v7);
    [(BRShareCopyOperation *)self setShareCopyCompletionBlock:0];
  }

  uint64_t v13 = [(BRShareCopyOperation *)self rootShareCopyCompletionBlock];
  v14 = (void *)v13;
  if (v13)
  {
    (*(void (**)(uint64_t, void *, void *, id))(v13 + 16))(v13, v8, v10, v7);
    [(BRShareCopyOperation *)self setRootShareCopyCompletionBlock:0];
  }

  v15.receiver = self;
  v15.super_class = (Class)BRShareCopyOperation;
  [(BROperation *)&v15 finishWithResult:v6 error:v7];
}

- (id)shareCopyCompletionBlock
{
  return objc_getProperty(self, a2, 344, 1);
}

- (void)setShareCopyCompletionBlock:(id)a3
{
}

- (id)rootShareCopyCompletionBlock
{
  return objc_getProperty(self, a2, 352, 1);
}

- (void)setRootShareCopyCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_rootShareCopyCompletionBlock, 0);

  objc_storeStrong(&self->_shareCopyCompletionBlock, 0);
}

@end