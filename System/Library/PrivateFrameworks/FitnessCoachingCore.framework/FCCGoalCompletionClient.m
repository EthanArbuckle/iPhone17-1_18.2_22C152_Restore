@interface FCCGoalCompletionClient
- (FCCGoalCompletionClient)init;
- (FCCGoalCompletionClient)initWithQueue:(id)a3 xpcClient:(id)a4;
- (void)_postGoalCompletionNotification:(id)a3 completion:(id)a4;
- (void)postGoalCompletionNotification:(id)a3 completion:(id)a4;
@end

@implementation FCCGoalCompletionClient

- (FCCGoalCompletionClient)init
{
  v3 = objc_alloc_init(FCCXPCClient);
  v4 = HKCreateSerialDispatchQueueWithQOSClass();
  v5 = [(FCCGoalCompletionClient *)self initWithQueue:v4 xpcClient:v3];

  return v5;
}

- (FCCGoalCompletionClient)initWithQueue:(id)a3 xpcClient:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCCGoalCompletionClient;
  v9 = [(FCCGoalCompletionClient *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dispatchQueue, a3);
    objc_storeStrong((id *)&v10->_xpcClient, a4);
  }

  return v10;
}

- (void)postGoalCompletionNotification:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__FCCGoalCompletionClient_postGoalCompletionNotification_completion___block_invoke;
  block[3] = &unk_1E6105A68;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

uint64_t __69__FCCGoalCompletionClient_postGoalCompletionNotification_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postGoalCompletionNotification:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)_postGoalCompletionNotification:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a3 transportData];
  [(FCCXPCClient *)self->_xpcClient transportMessage:3 data:v7 completion:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcClient, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end