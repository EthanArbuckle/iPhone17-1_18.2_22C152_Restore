@interface FPUpdateIgnoreStateOperation
- (FPUpdateIgnoreStateOperation)initWithItems:(id)a3 ignoreState:(BOOL)a4 action:(id)a5;
- (id)replicateForItems:(id)a3;
- (void)actionMain;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)presendNotifications;
@end

@implementation FPUpdateIgnoreStateOperation

- (id)replicateForItems:(id)a3
{
  id v4 = a3;
  v5 = [FPUpdateIgnoreStateOperation alloc];
  BOOL ignoreState = self->_ignoreState;
  v7 = [(FPActionOperation *)self action];
  v8 = [(FPUpdateIgnoreStateOperation *)v5 initWithItems:v4 ignoreState:ignoreState action:v7];

  return v8;
}

- (FPUpdateIgnoreStateOperation)initWithItems:(id)a3 ignoreState:(BOOL)a4 action:(id)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FPUpdateIgnoreStateOperation;
  v10 = [(FPActionOperation *)&v13 initWithItemsOfDifferentProviders:v9 action:a5];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_items, a3);
    v11->_BOOL ignoreState = a4;
    [(FPActionOperation *)v11 setSetupRemoteOperationService:1];
  }

  return v11;
}

- (void)presendNotifications
{
  v3 = [(FPActionOperation *)self stitcher];
  [v3 start];

  id v4 = [(FPActionOperation *)self stitcher];
  items = self->_items;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__FPUpdateIgnoreStateOperation_presendNotifications__block_invoke;
  v7[3] = &unk_1E5AF3FE0;
  v7[4] = self;
  [v4 transformItems:items handler:v7];

  v6 = [(FPActionOperation *)self stitcher];
  [v6 flush];
}

uint64_t __52__FPUpdateIgnoreStateOperation_presendNotifications__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setExcludedFromSync:*(unsigned __int8 *)(*(void *)(a1 + 32) + 456)];
}

- (void)actionMain
{
  v3 = [(NSArray *)self->_items fp_map:&__block_literal_global_525];
  id v4 = [(FPActionOperation *)self remoteServiceProxy];
  BOOL ignoreState = self->_ignoreState;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__FPUpdateIgnoreStateOperation_actionMain__block_invoke_2;
  v6[3] = &unk_1E5AF3990;
  v6[4] = self;
  [v4 updateIgnoreStateOfItemWithIdentifiers:v3 ignoreState:ignoreState completionHandler:v6];
}

uint64_t __42__FPUpdateIgnoreStateOperation_actionMain__block_invoke(uint64_t a1, void *a2)
{
  return [a2 itemIdentifier];
}

void __42__FPUpdateIgnoreStateOperation_actionMain__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    v10 = fp_current_or_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
LABEL_6:
    }
      __42__FPUpdateIgnoreStateOperation_actionMain__block_invoke_2_cold_1();
  }
  else
  {
    if (![v8 count]) {
      goto LABEL_8;
    }
    v10 = fp_current_or_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
  }

LABEL_8:
  v11 = *(void **)(a1 + 32);
  v12 = [v7 allValues];
  if (v9)
  {
    [v11 completedWithResult:v12 error:v9];
  }
  else
  {
    objc_super v13 = [v8 allValues];
    v14 = [v13 firstObject];
    [v11 completedWithResult:v12 error:v14];
  }
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FPActionOperation *)self stitcher];
  [v8 finishWithItems:v7 error:v6];

  v9.receiver = self;
  v9.super_class = (Class)FPUpdateIgnoreStateOperation;
  [(FPActionOperation *)&v9 finishWithResult:v7 error:v6];
}

- (void).cxx_destruct
{
}

void __42__FPUpdateIgnoreStateOperation_actionMain__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_2_4(&dword_1A33AE000, v0, v1, "[ERROR] couldn't %signore items: %@");
}

@end