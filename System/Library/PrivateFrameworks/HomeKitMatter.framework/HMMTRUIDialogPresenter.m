@interface HMMTRUIDialogPresenter
- (HMMTRUIDialogPresenter)initWithQueue:(id)a3 context:(id)a4;
- (OS_dispatch_queue)clientQueue;
- (id)context;
- (id)dialogDelegate;
- (void)requestUserPermissionForBridgeAccessory:(id)a3 completionHandler:(id)a4;
- (void)requestUserPermissionForUnauthenticatedAccessory:(id)a3 completionHandler:(id)a4;
- (void)setClientQueue:(id)a3;
- (void)setDialogDelegate:(id)a3;
@end

@implementation HMMTRUIDialogPresenter

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_dialogDelegate);
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
}

- (id)dialogDelegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_dialogDelegate);
  return WeakRetained;
}

- (id)context
{
  return self->_context;
}

- (void)setClientQueue:(id)a3
{
}

- (OS_dispatch_queue)clientQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)requestUserPermissionForBridgeAccessory:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMMTRUIDialogPresenter *)self clientQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __84__HMMTRUIDialogPresenter_requestUserPermissionForBridgeAccessory_completionHandler___block_invoke;
  block[3] = &unk_265378900;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __84__HMMTRUIDialogPresenter_requestUserPermissionForBridgeAccessory_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) dialogDelegate];

  if (v2)
  {
    v3 = [*(id *)(a1 + 32) dialogDelegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v4 = *(void *)(a1 + 40);
      v5 = [*(id *)(a1 + 32) context];
      id v6 = [*(id *)(a1 + 32) clientQueue];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __84__HMMTRUIDialogPresenter_requestUserPermissionForBridgeAccessory_completionHandler___block_invoke_2;
      v17[3] = &unk_265375E18;
      id v18 = *(id *)(a1 + 48);
      [v3 requestUserPermissionForBridgeAccessory:v4 withContext:v5 queue:v6 completionHandler:v17];

      id v7 = v18;
    }
    else
    {
      id v12 = (void *)MEMORY[0x2533B64D0]();
      id v13 = *(id *)(a1 + 32);
      v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v20 = v15;
        _os_log_impl(&dword_252495000, v14, OS_LOG_TYPE_ERROR, "%{public}@Delegate does not respond to selector", buf, 0xCu);
      }
      uint64_t v16 = *(void *)(a1 + 48);
      id v7 = [MEMORY[0x263F087E8] hmfUnspecifiedError];
      (*(void (**)(uint64_t, uint64_t, void *))(v16 + 16))(v16, 1, v7);
    }
  }
  else
  {
    v8 = (void *)MEMORY[0x2533B64D0]();
    id v9 = *(id *)(a1 + 32);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v20 = v11;
      _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_ERROR, "%{public}@Dialog delegate is not set", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __84__HMMTRUIDialogPresenter_requestUserPermissionForBridgeAccessory_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestUserPermissionForUnauthenticatedAccessory:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMMTRUIDialogPresenter *)self clientQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __93__HMMTRUIDialogPresenter_requestUserPermissionForUnauthenticatedAccessory_completionHandler___block_invoke;
  block[3] = &unk_265378900;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __93__HMMTRUIDialogPresenter_requestUserPermissionForUnauthenticatedAccessory_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) dialogDelegate];

  if (v2)
  {
    v3 = [*(id *)(a1 + 32) dialogDelegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v4 = *(void *)(a1 + 40);
      v5 = [*(id *)(a1 + 32) context];
      id v6 = [*(id *)(a1 + 32) clientQueue];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __93__HMMTRUIDialogPresenter_requestUserPermissionForUnauthenticatedAccessory_completionHandler___block_invoke_2;
      v17[3] = &unk_265375E18;
      id v18 = *(id *)(a1 + 48);
      [v3 requestUserPermissionForUnauthenticatedAccessory:v4 withContext:v5 queue:v6 completionHandler:v17];

      id v7 = v18;
    }
    else
    {
      id v12 = (void *)MEMORY[0x2533B64D0]();
      id v13 = *(id *)(a1 + 32);
      v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v20 = v15;
        _os_log_impl(&dword_252495000, v14, OS_LOG_TYPE_ERROR, "%{public}@Delegate does not respond to selector", buf, 0xCu);
      }
      uint64_t v16 = *(void *)(a1 + 48);
      id v7 = [MEMORY[0x263F087E8] hmfUnspecifiedError];
      (*(void (**)(uint64_t, uint64_t, void *))(v16 + 16))(v16, 1, v7);
    }
  }
  else
  {
    v8 = (void *)MEMORY[0x2533B64D0]();
    id v9 = *(id *)(a1 + 32);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v20 = v11;
      _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_ERROR, "%{public}@Dialog delegate is not set", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __93__HMMTRUIDialogPresenter_requestUserPermissionForUnauthenticatedAccessory_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setDialogDelegate:(id)a3
{
}

- (HMMTRUIDialogPresenter)initWithQueue:(id)a3 context:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMMTRUIDialogPresenter;
  id v9 = [(HMMTRUIDialogPresenter *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clientQueue, a3);
    objc_storeStrong(&v10->_context, a4);
  }

  return v10;
}

@end