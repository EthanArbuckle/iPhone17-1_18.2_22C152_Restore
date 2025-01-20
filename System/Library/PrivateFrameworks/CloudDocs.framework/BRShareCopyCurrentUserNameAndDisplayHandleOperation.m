@interface BRShareCopyCurrentUserNameAndDisplayHandleOperation
- (id)shareUserNameCompletionBlock;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)main;
- (void)setShareUserNameCompletionBlock:(id)a3;
@end

@implementation BRShareCopyCurrentUserNameAndDisplayHandleOperation

- (void)main
{
  OUTLINED_FUNCTION_4_0();
  v1 = [v0 url];
  v2 = [v1 path];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_19ED3F000, v3, v4, "[DEBUG] copying account name for '%@'%@", v5, v6, v7, v8, v9);
}

void __59__BRShareCopyCurrentUserNameAndDisplayHandleOperation_main__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v17 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = objc_opt_new();
  v16 = v15;
  if (v17) {
    [v15 setObject:v17 forKeyedSubscript:@"nameComponents"];
  }
  if (v11) {
    [v16 setObject:v11 forKeyedSubscript:@"displayHandle"];
  }
  if (v12) {
    [v16 setObject:v12 forKeyedSubscript:@"primaryEmailAddress"];
  }
  if (v13) {
    [v16 setObject:v13 forKeyedSubscript:@"personaIdentifier"];
  }
  [*(id *)(a1 + 32) completedWithResult:v16 error:v14];
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 objectForKeyedSubscript:@"nameComponents"];
  uint8_t v9 = [v6 objectForKeyedSubscript:@"displayHandle"];
  v10 = [v6 objectForKeyedSubscript:@"primaryEmailAddress"];
  id v11 = [v6 objectForKeyedSubscript:@"personaIdentifier"];
  uint64_t v12 = [(BRShareCopyCurrentUserNameAndDisplayHandleOperation *)self shareUserNameCompletionBlock];
  id v13 = (void *)v12;
  if (v12)
  {
    (*(void (**)(uint64_t, void *, void *, void *, void *, id))(v12 + 16))(v12, v8, v9, v10, v11, v7);
    [(BRShareCopyCurrentUserNameAndDisplayHandleOperation *)self setShareUserNameCompletionBlock:0];
  }

  v14.receiver = self;
  v14.super_class = (Class)BRShareCopyCurrentUserNameAndDisplayHandleOperation;
  [(BROperation *)&v14 finishWithResult:v6 error:v7];
}

- (id)shareUserNameCompletionBlock
{
  return objc_getProperty(self, a2, 344, 1);
}

- (void)setShareUserNameCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end