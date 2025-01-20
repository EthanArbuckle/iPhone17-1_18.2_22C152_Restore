@interface CXCallController
- (CXCallController)init;
- (CXCallController)initWithQueue:(dispatch_queue_t)queue;
- (CXCallObserver)callObserver;
- (OS_dispatch_queue)completionQueue;
- (void)_requestTransaction:(id)a3 completion:(id)a4;
- (void)requestTransaction:(CXTransaction *)transaction completion:(void *)completion;
- (void)requestTransactionWithAction:(CXAction *)action completion:(void *)completion;
- (void)requestTransactionWithActions:(NSArray *)actions completion:(void *)completion;
- (void)setCallObserver:(id)a3;
@end

@implementation CXCallController

- (CXCallController)init
{
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.callkit.callcontroller.completion", 0);
  v4 = [(CXCallController *)self initWithQueue:v3];

  return v4;
}

- (CXCallController)initWithQueue:(dispatch_queue_t)queue
{
  v5 = queue;
  v10.receiver = self;
  v10.super_class = (Class)CXCallController;
  v6 = [(CXCallController *)&v10 init];
  if (v6)
  {
    if (!v5) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXCallController initWithQueue:]", @"queue" format];
    }
    objc_storeStrong((id *)&v6->_completionQueue, queue);
    v7 = objc_alloc_init(CXCallObserver);
    callObserver = v6->_callObserver;
    v6->_callObserver = v7;
  }
  return v6;
}

- (void)requestTransaction:(CXTransaction *)transaction completion:(void *)completion
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v6 = transaction;
  v7 = completion;
  v8 = CXDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v6;
    _os_log_impl(&dword_1A6E3A000, v8, OS_LOG_TYPE_DEFAULT, "transaction: %@", buf, 0xCu);
  }

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__CXCallController_requestTransaction_completion___block_invoke;
  v10[3] = &unk_1E5CAE458;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  [(CXCallController *)self _requestTransaction:v6 completion:v10];
}

void __50__CXCallController_requestTransaction_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) completionQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__CXCallController_requestTransaction_completion___block_invoke_2;
  v7[3] = &unk_1E5CAE430;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __50__CXCallController_requestTransaction_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)requestTransactionWithActions:(NSArray *)actions completion:(void *)completion
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = actions;
  v7 = completion;
  id v8 = CXDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl(&dword_1A6E3A000, v8, OS_LOG_TYPE_DEFAULT, "actions: %@", (uint8_t *)&v10, 0xCu);
  }

  id v9 = [[CXTransaction alloc] initWithActions:v6];
  [(CXCallController *)self requestTransaction:v9 completion:v7];
}

- (void)requestTransactionWithAction:(CXAction *)action completion:(void *)completion
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v10 = action;
  id v6 = (void *)MEMORY[0x1E4F1C978];
  v7 = completion;
  id v8 = action;
  id v9 = [v6 arrayWithObjects:&v10 count:1];

  -[CXCallController requestTransactionWithActions:completion:](self, "requestTransactionWithActions:completion:", v9, v7, v10, v11);
}

- (void)_requestTransaction:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CXCallController *)self callObserver];
  id v9 = [v8 concurrentQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__CXCallController__requestTransaction_completion___block_invoke;
  block[3] = &unk_1E5CADDA0;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_barrier_async(v9, block);
}

void __51__CXCallController__requestTransaction_completion___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) callObserver];
  v2 = [v3 dataSource];
  [v2 requestTransaction:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (CXCallObserver)callObserver
{
  return self->_callObserver;
}

- (void)setCallObserver:(id)a3
{
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionQueue, 0);

  objc_storeStrong((id *)&self->_callObserver, 0);
}

@end