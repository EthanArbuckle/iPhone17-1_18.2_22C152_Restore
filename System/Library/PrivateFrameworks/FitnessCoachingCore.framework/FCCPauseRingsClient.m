@interface FCCPauseRingsClient
- (FCCPauseRingsClient)init;
- (FCCPauseRingsClient)initWithQueue:(id)a3 xpcClient:(id)a4;
- (void)_postNotificationWithRequest:(id)a3 completion:(id)a4;
- (void)postNotificationWithForce:(BOOL)a3 completion:(id)a4;
@end

@implementation FCCPauseRingsClient

- (FCCPauseRingsClient)init
{
  v3 = objc_alloc_init(FCCXPCClient);
  v4 = HKCreateSerialDispatchQueueWithQOSClass();
  v5 = [(FCCPauseRingsClient *)self initWithQueue:v4 xpcClient:v3];

  return v5;
}

- (FCCPauseRingsClient)initWithQueue:(id)a3 xpcClient:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCCPauseRingsClient;
  v9 = [(FCCPauseRingsClient *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dispatchQueue, a3);
    objc_storeStrong((id *)&v10->_xpcClient, a4);
  }

  return v10;
}

- (void)postNotificationWithForce:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [[FCCPauseRingsPostNotificationRequest alloc] initWithForce:v4];
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__FCCPauseRingsClient_postNotificationWithForce_completion___block_invoke;
  block[3] = &unk_1E6105A68;
  block[4] = self;
  objc_super v12 = v7;
  id v13 = v6;
  id v9 = v6;
  v10 = v7;
  dispatch_async(dispatchQueue, block);
}

uint64_t __60__FCCPauseRingsClient_postNotificationWithForce_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postNotificationWithRequest:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)_postNotificationWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a3 transportData];
  [(FCCXPCClient *)self->_xpcClient transportMessage:10 data:v7 completion:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcClient, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end