@interface FCCNotificationRequestClient
- (FCCNotificationRequestClient)init;
- (FCCNotificationRequestClient)initWithQueue:(id)a3 xpcClient:(id)a4;
- (void)_postSampleNotificationWithCompletion:(id)a3;
- (void)postSampleNotificationWithCompletion:(id)a3;
@end

@implementation FCCNotificationRequestClient

- (FCCNotificationRequestClient)init
{
  v3 = objc_alloc_init(FCCXPCClient);
  v4 = HKCreateSerialDispatchQueueWithQOSClass();
  v5 = [(FCCNotificationRequestClient *)self initWithQueue:v4 xpcClient:v3];

  return v5;
}

- (FCCNotificationRequestClient)initWithQueue:(id)a3 xpcClient:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCCNotificationRequestClient;
  v9 = [(FCCNotificationRequestClient *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dispatchQueue, a3);
    objc_storeStrong((id *)&v10->_xpcClient, a4);
  }

  return v10;
}

- (void)postSampleNotificationWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__FCCNotificationRequestClient_postSampleNotificationWithCompletion___block_invoke;
  v7[3] = &unk_1E6105BB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __69__FCCNotificationRequestClient_postSampleNotificationWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postSampleNotificationWithCompletion:*(void *)(a1 + 40)];
}

- (void)_postSampleNotificationWithCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcClient, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end