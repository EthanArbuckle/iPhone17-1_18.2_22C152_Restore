@interface CHCallInteractionManager
- (CHCallInteractionDataSource)dataSource;
- (CHCallInteractionManager)init;
- (CHCallInteractionManager)initWithDataSource:(id)a3;
- (CHDelegateController)delegateController;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)callInteractionsDidChangeForDataSource:(id)a3;
- (void)removeDelegate:(id)a3;
@end

@implementation CHCallInteractionManager

- (CHCallInteractionManager)init
{
  v3 = objc_alloc_init(CHCallInteractionInProcessDataSource);
  v4 = [(CHCallInteractionManager *)self initWithDataSource:v3];

  return v4;
}

- (CHCallInteractionManager)initWithDataSource:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CHCallInteractionManager;
  v6 = [(CHCallInteractionManager *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSource, a3);
    [(CHCallInteractionDataSource *)v7->_dataSource setDelegate:v7];
    v8 = objc_alloc_init(CHDelegateController);
    delegateController = v7->_delegateController;
    v7->_delegateController = v8;
  }
  return v7;
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CHCallInteractionManager *)self delegateController];
  [v8 addDelegate:v7 queue:v6];
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(CHCallInteractionManager *)self delegateController];
  [v5 removeDelegate:v4];
}

- (void)callInteractionsDidChangeForDataSource:(id)a3
{
  id v4 = [(CHCallInteractionManager *)self delegateController];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__CHCallInteractionManager_callInteractionsDidChangeForDataSource___block_invoke;
  v5[3] = &unk_1E61C7C18;
  v5[4] = self;
  [v4 enumerateDelegatesUsingBlock:v5];
}

void __67__CHCallInteractionManager_callInteractionsDidChangeForDataSource___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (objc_opt_respondsToSelector())
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __67__CHCallInteractionManager_callInteractionsDidChangeForDataSource___block_invoke_2;
    v9[3] = &unk_1E61C7568;
    id v7 = v5;
    uint64_t v8 = *(void *)(a1 + 32);
    id v10 = v7;
    uint64_t v11 = v8;
    dispatch_async(v6, v9);
  }
}

uint64_t __67__CHCallInteractionManager_callInteractionsDidChangeForDataSource___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) callInteractionsDidChangeForManager:*(void *)(a1 + 40)];
}

- (CHCallInteractionDataSource)dataSource
{
  return self->_dataSource;
}

- (CHDelegateController)delegateController
{
  return self->_delegateController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateController, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end