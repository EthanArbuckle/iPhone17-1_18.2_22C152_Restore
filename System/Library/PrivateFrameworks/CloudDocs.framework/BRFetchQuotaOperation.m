@interface BRFetchQuotaOperation
- (id)fetchQuotaCompletionBlock;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)main;
- (void)setFetchQuotaCompletionBlock:(id)a3;
@end

@implementation BRFetchQuotaOperation

- (void)main
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_19ED3F000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] fetching available quota%@", (uint8_t *)&v2, 0xCu);
}

uint64_t __29__BRFetchQuotaOperation_main__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) completedWithResult:a2 error:a3];
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(BRFetchQuotaOperation *)self fetchQuotaCompletionBlock];
  v9 = (void *)v8;
  if (v8)
  {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v6, v7);
    [(BRFetchQuotaOperation *)self setFetchQuotaCompletionBlock:0];
  }

  v10.receiver = self;
  v10.super_class = (Class)BRFetchQuotaOperation;
  [(BROperation *)&v10 finishWithResult:v6 error:v7];
}

- (id)fetchQuotaCompletionBlock
{
  return objc_getProperty(self, a2, 296, 1);
}

- (void)setFetchQuotaCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end