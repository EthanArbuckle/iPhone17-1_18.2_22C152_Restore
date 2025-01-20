@interface FCCNotificationSuppressionClient
- (BOOL)notificationsSuppressed;
- (FCCNotificationSuppressionClient)init;
- (FCCNotificationSuppressionClient)initWithQueue:(id)a3 store:(id)a4 xpcClient:(id)a5;
- (void)_addNotificationSuppressionRequest:(id)a3 completion:(id)a4;
- (void)_removeNotificationSuppressionRequest:(id)a3 completion:(id)a4;
- (void)addNotificationSuppressionRequest:(id)a3 completion:(id)a4;
- (void)removeNotificationSuppressionRequest:(id)a3 completion:(id)a4;
@end

@implementation FCCNotificationSuppressionClient

- (BOOL)notificationsSuppressed
{
  return [(FCCNotificationSuppressionStore *)self->_store notificationsSuppressed];
}

- (FCCNotificationSuppressionClient)init
{
  v3 = objc_alloc_init(FCCNotificationSuppressionStore);
  v4 = objc_alloc_init(FCCXPCClient);
  v5 = HKCreateSerialDispatchQueueWithQOSClass();
  v6 = [(FCCNotificationSuppressionClient *)self initWithQueue:v5 store:v3 xpcClient:v4];

  return v6;
}

- (FCCNotificationSuppressionClient)initWithQueue:(id)a3 store:(id)a4 xpcClient:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)FCCNotificationSuppressionClient;
  v12 = [(FCCNotificationSuppressionClient *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_dispatchQueue, a3);
    objc_storeStrong((id *)&v13->_store, a4);
    objc_storeStrong((id *)&v13->_xpcClient, a5);
  }

  return v13;
}

- (void)addNotificationSuppressionRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__FCCNotificationSuppressionClient_addNotificationSuppressionRequest_completion___block_invoke;
  block[3] = &unk_1E6105A68;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

uint64_t __81__FCCNotificationSuppressionClient_addNotificationSuppressionRequest_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addNotificationSuppressionRequest:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)_addNotificationSuppressionRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a3 transportData];
  [(FCCXPCClient *)self->_xpcClient transportMessage:7 data:v7 completion:v6];
}

- (void)removeNotificationSuppressionRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__FCCNotificationSuppressionClient_removeNotificationSuppressionRequest_completion___block_invoke;
  block[3] = &unk_1E6105A68;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

uint64_t __84__FCCNotificationSuppressionClient_removeNotificationSuppressionRequest_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeNotificationSuppressionRequest:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)_removeNotificationSuppressionRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a3 transportData];
  [(FCCXPCClient *)self->_xpcClient transportMessage:8 data:v7 completion:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcClient, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end