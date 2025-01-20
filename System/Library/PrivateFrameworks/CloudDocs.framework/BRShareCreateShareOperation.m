@interface BRShareCreateShareOperation
- (BRShareCreateShareOperation)initWithItemID:(id)a3;
- (id)shareCreateCompletionBlock;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)main;
- (void)setShareCreateCompletionBlock:(id)a3;
@end

@implementation BRShareCreateShareOperation

- (BRShareCreateShareOperation)initWithItemID:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BRShareCreateShareOperation;
  return [(BRShareOperation *)&v4 initWithItemIdentifier:a3];
}

- (void)main
{
  OUTLINED_FUNCTION_4_0();
  v1 = [v0 url];
  v2 = [v1 path];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_19ED3F000, v3, v4, "[DEBUG] creating share for '%@'%@", v5, v6, v7, v8, v9);
}

uint64_t __35__BRShareCreateShareOperation_main__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) completedWithResult:a2 error:a3];
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(BRShareOperation *)self url];
  br_setShareAssociatedURL(v6, v8);

  uint64_t v9 = [(BRShareCreateShareOperation *)self shareCreateCompletionBlock];
  v10 = (void *)v9;
  if (v9)
  {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v6, v7);
    [(BRShareCreateShareOperation *)self setShareCreateCompletionBlock:0];
  }

  v11.receiver = self;
  v11.super_class = (Class)BRShareCreateShareOperation;
  [(BROperation *)&v11 finishWithResult:v6 error:v7];
}

- (id)shareCreateCompletionBlock
{
  return objc_getProperty(self, a2, 344, 1);
}

- (void)setShareCreateCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end