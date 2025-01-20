@interface BRShareCopyAccessTokenOperation
- (BRShareCopyAccessTokenOperation)initWithURL:(id)a3;
- (id)shareCopyAccessTokenCompletionBlock;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)main;
- (void)setShareCopyAccessTokenCompletionBlock:(id)a3;
@end

@implementation BRShareCopyAccessTokenOperation

- (BRShareCopyAccessTokenOperation)initWithURL:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BRShareCopyAccessTokenOperation;
  return [(BRShareOperation *)&v4 initWithURL:a3];
}

- (void)main
{
  OUTLINED_FUNCTION_4_0();
  v1 = [v0 url];
  v2 = [v1 path];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_19ED3F000, v3, v4, "[DEBUG] copying access token for '%@'%@", v5, v6, v7, v8, v9);
}

void __39__BRShareCopyAccessTokenOperation_main__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v12[2] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *(void **)(a1 + 32);
  if (a2 && a3)
  {
    v12[0] = a2;
    v12[1] = a3;
    uint64_t v7 = (void *)MEMORY[0x1E4F1C978];
    id v8 = a4;
    id v9 = a3;
    id v10 = a2;
    id v11 = [v7 arrayWithObjects:v12 count:2];
    [v6 completedWithResult:v11 error:v8];
  }
  else
  {
    id v9 = a4;
    id v10 = a3;
    id v11 = a2;
    [v6 completedWithResult:0 error:v9];
  }
}

void __39__BRShareCopyAccessTokenOperation_main__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  v12[2] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *(void **)(a1 + 32);
  if (a2 && a3)
  {
    v12[0] = a2;
    v12[1] = a3;
    uint64_t v7 = (void *)MEMORY[0x1E4F1C978];
    id v8 = a4;
    id v9 = a3;
    id v10 = a2;
    id v11 = [v7 arrayWithObjects:v12 count:2];
    [v6 completedWithResult:v11 error:v8];
  }
  else
  {
    id v9 = a4;
    id v10 = a3;
    id v11 = a2;
    [v6 completedWithResult:0 error:v9];
  }
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BRShareCopyAccessTokenOperation *)self shareCopyAccessTokenCompletionBlock];
  if (v8)
  {
    id v9 = [v6 objectAtIndexedSubscript:0];
    id v10 = [v6 objectAtIndexedSubscript:1];
    ((void (**)(void, void *, void *, id))v8)[2](v8, v9, v10, v7);

    [(BRShareCopyAccessTokenOperation *)self setShareCopyAccessTokenCompletionBlock:0];
  }

  v11.receiver = self;
  v11.super_class = (Class)BRShareCopyAccessTokenOperation;
  [(BROperation *)&v11 finishWithResult:v6 error:v7];
}

- (id)shareCopyAccessTokenCompletionBlock
{
  return objc_getProperty(self, a2, 344, 1);
}

- (void)setShareCopyAccessTokenCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end