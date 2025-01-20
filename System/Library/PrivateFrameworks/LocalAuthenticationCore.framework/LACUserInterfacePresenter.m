@interface LACUserInterfacePresenter
- (LACUserInterfacePresenter)initWithReplyQueue:(id)a3 uiController:(id)a4;
- (void)presentUIForIdentifier:(int64_t)a3 request:(id)a4 completion:(id)a5;
@end

@implementation LACUserInterfacePresenter

- (LACUserInterfacePresenter)initWithReplyQueue:(id)a3 uiController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)LACUserInterfacePresenter;
  v9 = [(LACUserInterfacePresenter *)&v15 init];
  if (v9)
  {
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    uint64_t v12 = +[LACConcurrencyUtilities createUserInitiatedSerialQueueWithIdentifier:v11];
    workQueue = v9->_workQueue;
    v9->_workQueue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v9->_replyQueue, a3);
    objc_storeStrong((id *)&v9->_uiController, a4);
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiController, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
}

- (void)presentUIForIdentifier:(int64_t)a3 request:(id)a4 completion:(id)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  if ((a3 & 0xFFFFFFFFFFFFFFFBLL) != 0)
  {
    v10 = [v8 options];
    v11 = [NSNumber numberWithInteger:1000];
    uint64_t v12 = [v10 objectForKey:v11];
    int v13 = [v12 BOOLValue];

    v14 = LACLogUI();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v15)
      {
        v16 = NSStringFromLACUserInterfaceRequestIdentifier(a3);
        v17 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v8, "identifier"));
        *(_DWORD *)buf = 138412546;
        v38 = v16;
        __int16 v39 = 2114;
        v40 = v17;
        _os_log_impl(&dword_254F14000, v14, OS_LOG_TYPE_DEFAULT, "Skipping UI for %@ rid: %{public}@, not interactive evaluation", buf, 0x16u);
      }
      replyQueue = self->_replyQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __71__LACUserInterfacePresenter_presentUIForIdentifier_request_completion___block_invoke_5;
      block[3] = &unk_2653B6380;
      id v33 = v9;
      dispatch_async(replyQueue, block);
    }
    else
    {
      if (v15)
      {
        v26 = NSStringFromLACUserInterfaceRequestIdentifier(a3);
        *(_DWORD *)buf = 138412290;
        v38 = v26;
        _os_log_impl(&dword_254F14000, v14, OS_LOG_TYPE_DEFAULT, "Will present UI for %@", buf, 0xCu);
      }
      objc_initWeak((id *)buf, self);
      workQueue = self->_workQueue;
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __71__LACUserInterfacePresenter_presentUIForIdentifier_request_completion___block_invoke_6;
      v28[3] = &unk_2653B5DF0;
      objc_copyWeak(v31, (id *)buf);
      id v29 = v8;
      v31[1] = (id)a3;
      id v30 = v9;
      dispatch_async(workQueue, v28);

      objc_destroyWeak(v31);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    v19 = LACLogUI();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[LACUserInterfacePresenter presentUIForIdentifier:request:completion:]((uint64_t)self, a3, v19);
    }

    v20 = NSString;
    v21 = [NSNumber numberWithInteger:a3];
    v22 = [v20 stringWithFormat:@"Unsupported user interface request: %@", v21];

    v23 = +[LACError errorWithCode:-1000 debugDescription:v22];
    v24 = self->_replyQueue;
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __71__LACUserInterfacePresenter_presentUIForIdentifier_request_completion___block_invoke;
    v34[3] = &unk_2653B5EB8;
    id v35 = v23;
    id v36 = v9;
    id v25 = v23;
    dispatch_async(v24, v34);
  }
}

uint64_t __71__LACUserInterfacePresenter_presentUIForIdentifier_request_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __71__LACUserInterfacePresenter_presentUIForIdentifier_request_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __71__LACUserInterfacePresenter_presentUIForIdentifier_request_completion___block_invoke_6(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)*((void *)WeakRetained + 3);
    v6 = [*(id *)(a1 + 32) contextID];
    id v7 = [v5 userInterfaceWithUUID:v6];

    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __71__LACUserInterfacePresenter_presentUIForIdentifier_request_completion___block_invoke_2;
    v14[3] = &unk_2653B63A8;
    uint64_t v16 = *(void *)(a1 + 56);
    id v15 = *(id *)(a1 + 32);
    id v8 = __71__LACUserInterfacePresenter_presentUIForIdentifier_request_completion___block_invoke_2((uint64_t)v14);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __71__LACUserInterfacePresenter_presentUIForIdentifier_request_completion___block_invoke_3;
    v10[3] = &unk_2653B63F8;
    v13[1] = *(id *)(a1 + 56);
    objc_copyWeak(v13, v2);
    id v12 = *(id *)(a1 + 40);
    id v9 = v7;
    id v11 = v9;
    [v9 processRequest:v8 completion:v10];

    objc_destroyWeak(v13);
  }
}

LACUserInterfaceRequest *__71__LACUserInterfacePresenter_presentUIForIdentifier_request_completion___block_invoke_2(uint64_t a1)
{
  v1 = [[LACUserInterfaceRequest alloc] initWithIdentifier:*(void *)(a1 + 40) evaluationRequest:*(void *)(a1 + 32)];
  return v1;
}

void __71__LACUserInterfacePresenter_presentUIForIdentifier_request_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = LACLogUI();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = NSStringFromLACUserInterfaceRequestIdentifier(*(void *)(a1 + 56));
    *(_DWORD *)buf = 138412546;
    v14 = v5;
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_impl(&dword_254F14000, v4, OS_LOG_TYPE_DEFAULT, "Did dismiss UI for %@ with error: %@", buf, 0x16u);
  }
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 48));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = WeakRetained[1];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __71__LACUserInterfacePresenter_presentUIForIdentifier_request_completion___block_invoke_9;
    block[3] = &unk_2653B63D0;
    id v12 = *(id *)(a1 + 40);
    id v10 = v3;
    id v11 = *(id *)(a1 + 32);
    dispatch_async(v8, block);
  }
}

uint64_t __71__LACUserInterfacePresenter_presentUIForIdentifier_request_completion___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)presentUIForIdentifier:(uint64_t)a1 request:(uint64_t)a2 completion:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v5 = NSStringFromLACUserInterfaceRequestIdentifier(a2);
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_error_impl(&dword_254F14000, a3, OS_LOG_TYPE_ERROR, "%@ cannot present UI for identifier: %@", (uint8_t *)&v6, 0x16u);
}

@end