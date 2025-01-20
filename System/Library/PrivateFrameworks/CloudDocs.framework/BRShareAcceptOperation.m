@interface BRShareAcceptOperation
- (BRShareAcceptOperation)initWithShareLink:(id)a3;
- (id)shareAcceptCompletionBlock;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)main;
- (void)setShareAcceptCompletionBlock:(id)a3;
@end

@implementation BRShareAcceptOperation

- (BRShareAcceptOperation)initWithShareLink:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRShareAcceptOperation;
  v6 = [(BROperation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_shareLink, a3);
  }

  return v7;
}

- (void)main
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_8_0();
  uint64_t v3 = v0;
  OUTLINED_FUNCTION_3_0(&dword_19ED3F000, v1, (uint64_t)v1, "[DEBUG] Accepting share link '%@'%@", v2);
}

void __30__BRShareAcceptOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 url];
  [v4 completedWithResult:v6 error:v5];
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(BRShareAcceptOperation *)self shareAcceptCompletionBlock];
  objc_super v9 = (void *)v8;
  if (v8)
  {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v6, v7);
    [(BRShareAcceptOperation *)self setShareAcceptCompletionBlock:0];
  }

  v10.receiver = self;
  v10.super_class = (Class)BRShareAcceptOperation;
  [(BROperation *)&v10 finishWithResult:v6 error:v7];
}

- (id)shareAcceptCompletionBlock
{
  return objc_getProperty(self, a2, 304, 1);
}

- (void)setShareAcceptCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_shareAcceptCompletionBlock, 0);

  objc_storeStrong((id *)&self->_shareLink, 0);
}

@end