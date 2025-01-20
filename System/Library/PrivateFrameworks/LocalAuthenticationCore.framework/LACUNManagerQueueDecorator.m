@interface LACUNManagerQueueDecorator
- (LACUNManagerDelegate)delegate;
- (LACUNManagerQueueDecorator)initWithManager:(id)a3 replyQueue:(id)a4;
- (LACUNManagerQueueDecorator)initWithManager:(id)a3 workQueue:(id)a4 replyQueue:(id)a5;
- (void)cancelAllNotificationsWithCompletion:(id)a3;
- (void)cancelNotificationsWithIdentifiers:(id)a3 scheduledOnly:(BOOL)a4 completion:(id)a5;
- (void)notificationManager:(id)a3 didRespondToNotification:(id)a4 fromCategory:(id)a5 withAction:(id)a6 completionHandler:(id)a7;
- (void)postNotification:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation LACUNManagerQueueDecorator

- (LACUNManagerQueueDecorator)initWithManager:(id)a3 replyQueue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  v10 = +[LACConcurrencyUtilities createUserInitiatedSerialQueueWithIdentifier:v9];

  v11 = [(LACUNManagerQueueDecorator *)self initWithManager:v7 workQueue:v10 replyQueue:v6];
  return v11;
}

- (LACUNManagerQueueDecorator)initWithManager:(id)a3 workQueue:(id)a4 replyQueue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)LACUNManagerQueueDecorator;
  v12 = [(LACUNManagerQueueDecorator *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_manager, a3);
    [(LACUNManager *)v13->_manager setDelegate:v13];
    objc_storeStrong((id *)&v13->_replyQueue, a5);
    objc_storeStrong((id *)&v13->_workQueue, a4);
  }

  return v13;
}

- (void)postNotification:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __58__LACUNManagerQueueDecorator_postNotification_completion___block_invoke;
  v11[3] = &unk_2653B5C70;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __58__LACUNManagerQueueDecorator_postNotification_completion___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)*((void *)WeakRetained + 2);
    uint64_t v6 = *(void *)(a1 + 32);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __58__LACUNManagerQueueDecorator_postNotification_completion___block_invoke_2;
    v7[3] = &unk_2653B5FB0;
    objc_copyWeak(&v9, v2);
    id v8 = *(id *)(a1 + 40);
    [v5 postNotification:v6 completion:v7];

    objc_destroyWeak(&v9);
  }
}

void __58__LACUNManagerQueueDecorator_postNotification_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained[4];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __58__LACUNManagerQueueDecorator_postNotification_completion___block_invoke_3;
    v7[3] = &unk_2653B5EB8;
    id v9 = *(id *)(a1 + 32);
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

uint64_t __58__LACUNManagerQueueDecorator_postNotification_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)cancelNotificationsWithIdentifiers:(id)a3 scheduledOnly:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __90__LACUNManagerQueueDecorator_cancelNotificationsWithIdentifiers_scheduledOnly_completion___block_invoke;
  block[3] = &unk_2653B7050;
  objc_copyWeak(&v16, &location);
  BOOL v17 = a4;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(workQueue, block);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __90__LACUNManagerQueueDecorator_cancelNotificationsWithIdentifiers_scheduledOnly_completion___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)*((void *)WeakRetained + 2);
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(unsigned __int8 *)(a1 + 56);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __90__LACUNManagerQueueDecorator_cancelNotificationsWithIdentifiers_scheduledOnly_completion___block_invoke_2;
    v8[3] = &unk_2653B5FB0;
    objc_copyWeak(&v10, v2);
    id v9 = *(id *)(a1 + 40);
    [v5 cancelNotificationsWithIdentifiers:v6 scheduledOnly:v7 completion:v8];

    objc_destroyWeak(&v10);
  }
}

void __90__LACUNManagerQueueDecorator_cancelNotificationsWithIdentifiers_scheduledOnly_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained[4];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __90__LACUNManagerQueueDecorator_cancelNotificationsWithIdentifiers_scheduledOnly_completion___block_invoke_3;
    v7[3] = &unk_2653B5EB8;
    id v9 = *(id *)(a1 + 32);
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

uint64_t __90__LACUNManagerQueueDecorator_cancelNotificationsWithIdentifiers_scheduledOnly_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)cancelAllNotificationsWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__LACUNManagerQueueDecorator_cancelAllNotificationsWithCompletion___block_invoke;
  block[3] = &unk_2653B66E8;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __67__LACUNManagerQueueDecorator_cancelAllNotificationsWithCompletion___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)*((void *)WeakRetained + 2);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __67__LACUNManagerQueueDecorator_cancelAllNotificationsWithCompletion___block_invoke_2;
    v6[3] = &unk_2653B5FB0;
    objc_copyWeak(&v8, v2);
    id v7 = *(id *)(a1 + 32);
    [v5 cancelAllNotificationsWithCompletion:v6];

    objc_destroyWeak(&v8);
  }
}

void __67__LACUNManagerQueueDecorator_cancelAllNotificationsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained[4];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __67__LACUNManagerQueueDecorator_cancelAllNotificationsWithCompletion___block_invoke_3;
    v7[3] = &unk_2653B5EB8;
    id v9 = *(id *)(a1 + 32);
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

uint64_t __67__LACUNManagerQueueDecorator_cancelAllNotificationsWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (LACUNManagerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (void)notificationManager:(id)a3 didRespondToNotification:(id)a4 fromCategory:(id)a5 withAction:(id)a6 completionHandler:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  objc_initWeak(&location, self);
  replyQueue = self->_replyQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __117__LACUNManagerQueueDecorator_notificationManager_didRespondToNotification_fromCategory_withAction_completionHandler___block_invoke;
  block[3] = &unk_2653B7078;
  objc_copyWeak(&v25, &location);
  void block[4] = self;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v24 = v14;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  id v19 = v11;
  dispatch_async(replyQueue, block);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

uint64_t __117__LACUNManagerQueueDecorator_notificationManager_didRespondToNotification_fromCategory_withAction_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained) {
    [*(id *)(*(void *)(a1 + 32) + 8) notificationManager:WeakRetained didRespondToNotification:*(void *)(a1 + 40) fromCategory:*(void *)(a1 + 48) withAction:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 64)];
  }
  return MEMORY[0x270F9A758]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end