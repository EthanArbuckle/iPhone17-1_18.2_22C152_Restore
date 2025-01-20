@interface FCCFitnessPlusPlanClient
- (FCCFitnessPlusPlanClient)init;
- (FCCFitnessPlusPlanClient)initWithQueue:(id)a3 xpcClient:(id)a4;
- (void)_hasPlanScheduledWorkoutsForTodayWithCompletion:(id)a3;
- (void)_postNotificationWithRequest:(id)a3 completion:(id)a4;
- (void)hasPlanScheduledWorkoutsForTodayWithCompletion:(id)a3;
- (void)postNotificationForType:(id)a3 force:(BOOL)a4 completion:(id)a5;
@end

@implementation FCCFitnessPlusPlanClient

- (FCCFitnessPlusPlanClient)init
{
  v3 = objc_alloc_init(FCCXPCClient);
  v4 = HKCreateSerialDispatchQueueWithQOSClass();
  v5 = [(FCCFitnessPlusPlanClient *)self initWithQueue:v4 xpcClient:v3];

  return v5;
}

- (FCCFitnessPlusPlanClient)initWithQueue:(id)a3 xpcClient:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCCFitnessPlusPlanClient;
  v9 = [(FCCFitnessPlusPlanClient *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dispatchQueue, a3);
    objc_storeStrong((id *)&v10->_xpcClient, a4);
  }

  return v10;
}

- (void)postNotificationForType:(id)a3 force:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  v10 = [[FCCFitnessPlusPlanPostNotificationRequest alloc] initWithType:v9 force:v5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__FCCFitnessPlusPlanClient_postNotificationForType_force_completion___block_invoke;
  block[3] = &unk_1E6105A68;
  block[4] = self;
  v15 = v10;
  id v16 = v8;
  id v12 = v8;
  v13 = v10;
  dispatch_async(dispatchQueue, block);
}

uint64_t __69__FCCFitnessPlusPlanClient_postNotificationForType_force_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postNotificationWithRequest:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)hasPlanScheduledWorkoutsForTodayWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__FCCFitnessPlusPlanClient_hasPlanScheduledWorkoutsForTodayWithCompletion___block_invoke;
  v7[3] = &unk_1E6105BB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __75__FCCFitnessPlusPlanClient_hasPlanScheduledWorkoutsForTodayWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _hasPlanScheduledWorkoutsForTodayWithCompletion:*(void *)(a1 + 40)];
}

- (void)_postNotificationWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a3 transportData];
  [(FCCXPCClient *)self->_xpcClient transportMessage:9 data:v7 completion:v6];
}

- (void)_hasPlanScheduledWorkoutsForTodayWithCompletion:(id)a3
{
  id v4 = a3;
  xpcClient = self->_xpcClient;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__FCCFitnessPlusPlanClient__hasPlanScheduledWorkoutsForTodayWithCompletion___block_invoke;
  v7[3] = &unk_1E6105BF8;
  id v8 = v4;
  id v6 = v4;
  [(FCCXPCClient *)xpcClient transportRequest:4 data:0 completion:v7];
}

void __76__FCCFitnessPlusPlanClient__hasPlanScheduledWorkoutsForTodayWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = [[FCCFitnessPlusPlanState alloc] initWithTransportData:v6];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcClient, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end