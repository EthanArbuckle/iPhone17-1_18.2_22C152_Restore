@interface AMSUIEngagementRemoteViewTask
- (AMSBagProtocol)bag;
- (AMSEngagementRequest)request;
- (AMSEngagementResult)result;
- (AMSProcessInfo)clientInfo;
- (AMSUIEngagementRemoteViewTask)initWithRequest:(id)a3 presentingViewController:(id)a4;
- (CGSize)preferredContentSize;
- (NSError)error;
- (NSXPCListener)remoteListener;
- (OS_dispatch_group)dispatchGroup;
- (UIViewController)presentedViewController;
- (UIViewController)viewController;
- (id)_snapshotBagDataPromise;
- (id)presentEngagement;
- (void)_presentViewController:(id)a3;
- (void)_unblock;
- (void)engagementTaskDidFinishWithResult:(id)a3 error:(id)a4 completion:(id)a5;
- (void)preferredContentSizeDidChange:(CGSize)a3;
- (void)setBag:(id)a3;
- (void)setClientInfo:(id)a3;
- (void)setDispatchGroup:(id)a3;
- (void)setError:(id)a3;
- (void)setPreferredContentSize:(CGSize)a3;
- (void)setPresentedViewController:(id)a3;
- (void)setRemoteListener:(id)a3;
- (void)setRequest:(id)a3;
- (void)setResult:(id)a3;
- (void)setViewController:(id)a3;
@end

@implementation AMSUIEngagementRemoteViewTask

- (AMSUIEngagementRemoteViewTask)initWithRequest:(id)a3 presentingViewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AMSUIEngagementRemoteViewTask;
  v9 = [(AMSTask *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    objc_storeStrong((id *)&v10->_viewController, a4);
    v10->_preferredContentSize = (CGSize)*MEMORY[0x263F001B0];
    dispatch_group_t v11 = dispatch_group_create();
    dispatchGroup = v10->_dispatchGroup;
    v10->_dispatchGroup = (OS_dispatch_group *)v11;
  }
  return v10;
}

- (id)presentEngagement
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__AMSUIEngagementRemoteViewTask_presentEngagement__block_invoke;
  v4[3] = &unk_2643E3968;
  v4[4] = self;
  v2 = [(AMSTask *)self performTaskWithBlock:v4];
  return v2;
}

id __50__AMSUIEngagementRemoteViewTask_presentEngagement__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  v4 = [MEMORY[0x263F27CB8] sharedConfig];
  if (!v4)
  {
    v4 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = [*(id *)(a1 + 32) request];
    id v8 = [v7 logKey];
    v9 = [*(id *)(a1 + 32) request];
    *(_DWORD *)buf = 138543874;
    uint64_t v45 = v6;
    __int16 v46 = 2114;
    v47 = v8;
    __int16 v48 = 2114;
    id v49 = v9;
    _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Presenting system engagement request. Request: %{public}@", buf, 0x20u);
  }
  v10 = [*(id *)(a1 + 32) bag];

  if (v10)
  {
    dispatch_group_t v11 = [*(id *)(a1 + 32) _snapshotBagDataPromise];
    id v43 = 0;
    v10 = [v11 resultWithError:&v43];
    id v12 = v43;

    if (v12)
    {
      v13 = [MEMORY[0x263F27CB8] sharedConfig];
      if (!v13)
      {
        v13 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      objc_super v14 = [v13 OSLogObject];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = objc_opt_class();
        v16 = [*(id *)(a1 + 32) request];
        v17 = [v16 logKey];
        *(_DWORD *)buf = 138543874;
        uint64_t v45 = v15;
        __int16 v46 = 2114;
        v47 = v17;
        __int16 v48 = 2114;
        id v49 = v12;
        _os_log_impl(&dword_21C134000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to snapshot bag. Error: %{public}@", buf, 0x20u);
      }
    }
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__AMSUIEngagementRemoteViewTask_presentEngagement__block_invoke_4;
  aBlock[3] = &unk_2643E3918;
  aBlock[4] = *(void *)(a1 + 32);
  id v18 = v10;
  id v42 = v18;
  v19 = _Block_copy(aBlock);
  id v40 = 0;
  v20 = [MEMORY[0x263F08800] extensionWithIdentifier:@"com.apple.AppleMediaServicesUI.EngagementViewExtension" error:&v40];
  id v21 = v40;
  if (v21)
  {
    [*(id *)(a1 + 32) setError:v21];
    [*(id *)(a1 + 32) _unblock];
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __50__AMSUIEngagementRemoteViewTask_presentEngagement__block_invoke_4;
    block[3] = &unk_2643E33B0;
    id v38 = v20;
    id v39 = v19;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  v22 = [*(id *)(a1 + 32) dispatchGroup];
  dispatch_group_enter(v22);

  v23 = [*(id *)(a1 + 32) dispatchGroup];
  dispatch_group_wait(v23, 0xFFFFFFFFFFFFFFFFLL);

  v24 = [MEMORY[0x263F27CB8] sharedConfig];
  if (!v24)
  {
    v24 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v25 = [v24 OSLogObject];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    id v26 = v18;
    v27 = a2;
    uint64_t v28 = objc_opt_class();
    v34 = [*(id *)(a1 + 32) request];
    v29 = [v34 logKey];
    [*(id *)(a1 + 32) result];
    v30 = v36 = v19;
    [*(id *)(a1 + 32) error];
    v31 = v35 = v20;
    *(_DWORD *)buf = 138544130;
    uint64_t v45 = v28;
    a2 = v27;
    id v18 = v26;
    __int16 v46 = 2114;
    v47 = v29;
    __int16 v48 = 2114;
    id v49 = v30;
    __int16 v50 = 2114;
    v51 = v31;
    _os_log_impl(&dword_21C134000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Engagement task finished. Result: %{public}@, error: %{public}@", buf, 0x2Au);

    v20 = v35;
    v19 = v36;
  }
  [*(id *)(a1 + 32) setDispatchGroup:0];
  if (a2)
  {
    *a2 = [*(id *)(a1 + 32) error];
  }
  v32 = [*(id *)(a1 + 32) result];

  return v32;
}

void __50__AMSUIEngagementRemoteViewTask_presentEngagement__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __50__AMSUIEngagementRemoteViewTask_presentEngagement__block_invoke_2;
  v14[3] = &unk_2643E38F0;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(a1 + 40);
  id v15 = v5;
  uint64_t v16 = v7;
  id v17 = v6;
  id v18 = v8;
  v9 = v14;
  id v10 = v6;
  id v11 = v5;
  id v12 = AMSLogKey();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __AMSDispatchAsync_block_invoke_2;
  block[3] = &unk_2643E33B0;
  id v20 = v12;
  id v21 = v9;
  id v13 = v12;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __50__AMSUIEngagementRemoteViewTask_presentEngagement__block_invoke_2(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  if (v3)
  {
    [v3 setDelegate:*(void *)(a1 + 40)];
    v4 = [v3 remoteProxy];
    id v5 = [*(id *)(a1 + 40) request];
    uint64_t v6 = *(void *)(a1 + 56);
    uint64_t v7 = [*(id *)(a1 + 40) clientInfo];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __50__AMSUIEngagementRemoteViewTask_presentEngagement__block_invoke_3;
    v12[3] = &unk_2643E3570;
    v12[4] = *(void *)(a1 + 40);
    [v4 presentEngagementRequest:v5 bagData:v6 clientInfo:v7 completion:v12];

    [*(id *)(a1 + 40) _presentViewController:v3];
  }
  else
  {
    if (*(void *)(a1 + 48))
    {
      v9 = *(void **)(a1 + 40);
      id v8 = (id *)(a1 + 40);
      objc_msgSend(v9, "setError:");
    }
    else
    {
      id v10 = AMSError();
      id v11 = *(void **)(a1 + 40);
      id v8 = (id *)(a1 + 40);
      [v11 setError:v10];
    }
    [*v8 _unblock];
  }
}

uint64_t __50__AMSUIEngagementRemoteViewTask_presentEngagement__block_invoke_3(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    [*(id *)(result + 32) setError:a2];
    id v3 = *(void **)(v2 + 32);
    return [v3 _unblock];
  }
  return result;
}

void __50__AMSUIEngagementRemoteViewTask_presentEngagement__block_invoke_4(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F83098];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__AMSUIEngagementRemoteViewTask_presentEngagement__block_invoke_5;
  v4[3] = &unk_2643E3940;
  uint64_t v2 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v3 = (id)[v1 instantiateWithExtension:v2 completion:v4];
}

uint64_t __50__AMSUIEngagementRemoteViewTask_presentEngagement__block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)engagementTaskDidFinishWithResult:(id)a3 error:(id)a4 completion:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)MEMORY[0x263F27CB8];
  id v11 = (void (**)(void))a5;
  id v12 = [v10 sharedConfig];
  if (!v12)
  {
    id v12 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v13 = [v12 OSLogObject];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = objc_opt_class();
    id v15 = [(AMSUIEngagementRemoteViewTask *)self request];
    uint64_t v16 = [v15 logKey];
    int v23 = 138544130;
    uint64_t v24 = v14;
    __int16 v25 = 2114;
    id v26 = v16;
    __int16 v27 = 2114;
    id v28 = v8;
    __int16 v29 = 2114;
    id v30 = v9;
    _os_log_impl(&dword_21C134000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] remote engagement task finished. Result: %{public}@, error: %{public}@", (uint8_t *)&v23, 0x2Au);
  }
  [(AMSUIEngagementRemoteViewTask *)self setResult:v8];
  [(AMSUIEngagementRemoteViewTask *)self setError:v9];
  id v17 = [(AMSUIEngagementRemoteViewTask *)self presentedViewController];
  [v17 dismissViewControllerAnimated:1 completion:0];

  id v18 = [MEMORY[0x263F27CB8] sharedConfig];
  if (!v18)
  {
    id v18 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v19 = [v18 OSLogObject];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = objc_opt_class();
    id v21 = [(AMSUIEngagementRemoteViewTask *)self request];
    v22 = [v21 logKey];
    int v23 = 138543618;
    uint64_t v24 = v20;
    __int16 v25 = 2114;
    id v26 = v22;
    _os_log_impl(&dword_21C134000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] remote engagement task finished. Cleaning up vc references", (uint8_t *)&v23, 0x16u);
  }
  [(AMSUIEngagementRemoteViewTask *)self setPresentedViewController:0];
  [(AMSUIEngagementRemoteViewTask *)self setViewController:0];
  v11[2](v11);

  [(AMSUIEngagementRemoteViewTask *)self _unblock];
}

- (void)preferredContentSizeDidChange:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v6 = [MEMORY[0x263F27CB8] sharedConfig];
  if (!v6)
  {
    uint64_t v6 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  uint64_t v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class();
    id v9 = [(AMSUIEngagementRemoteViewTask *)self request];
    id v10 = [v9 logKey];
    v20.double width = width;
    v20.double height = height;
    id v11 = AMSStringFromSize(v20);
    int v13 = 138543874;
    uint64_t v14 = v8;
    __int16 v15 = 2114;
    uint64_t v16 = v10;
    __int16 v17 = 2114;
    id v18 = v11;
    _os_log_impl(&dword_21C134000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Preferred content size did change. Size: %{public}@", (uint8_t *)&v13, 0x20u);
  }
  id v12 = [(AMSUIEngagementRemoteViewTask *)self presentedViewController];
  objc_msgSend(v12, "setPreferredContentSize:", width, height);
}

- (id)_snapshotBagDataPromise
{
  id v3 = [(AMSUIEngagementRemoteViewTask *)self bag];

  v4 = (void *)MEMORY[0x263F27E10];
  if (v3)
  {
    id v5 = objc_alloc_init(MEMORY[0x263F27E10]);
    uint64_t v6 = [(AMSUIEngagementRemoteViewTask *)self bag];
    uint64_t v7 = [v5 completionHandlerAdapter];
    [v6 createSnapshotWithCompletion:v7];

    [v5 thenWithBlock:&__block_literal_global_5];
  }
  else
  {
    AMSError();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [v4 promiseWithError:v5];
  uint64_t v8 = };

  return v8;
}

uint64_t __56__AMSUIEngagementRemoteViewTask__snapshotBagDataPromise__block_invoke(uint64_t a1, void *a2)
{
  return [a2 compile];
}

- (void)_unblock
{
  id v3 = [(AMSUIEngagementRemoteViewTask *)self dispatchGroup];

  if (v3)
  {
    v4 = [(AMSUIEngagementRemoteViewTask *)self dispatchGroup];
    dispatch_group_leave(v4);
  }
}

- (void)_presentViewController:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __56__AMSUIEngagementRemoteViewTask__presentViewController___block_invoke;
  v6[3] = &unk_2643E34D0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __56__AMSUIEngagementRemoteViewTask__presentViewController___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) viewController];
  id v3 = objc_msgSend(v2, "ams_frontmostController");

  if (v3)
  {
    [*(id *)(v1 + 32) setPresentedViewController:*(void *)(v1 + 40)];
    [*(id *)(v1 + 40) setModalPresentationStyle:5];
    [v3 presentViewController:*(void *)(v1 + 40) animated:0 completion:0];
  }
  else
  {
    id v4 = [MEMORY[0x263F27CB8] sharedConfig];
    if (!v4)
    {
      id v4 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v5 = [v4 OSLogObject];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = AMSLogKey();
      id v7 = NSString;
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = v8;
      if (v6)
      {
        uint64_t v1 = AMSLogKey();
        [v7 stringWithFormat:@"%@: [%@] ", v9, v1];
      }
      else
      {
        [v7 stringWithFormat:@"%@: ", v8];
      id v10 = };
      *(_DWORD *)buf = 138543362;
      id v12 = v10;
      _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Presenting view controller is nil!", buf, 0xCu);
      if (v6)
      {

        id v10 = (void *)v1;
      }
    }
  }
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
}

- (CGSize)preferredContentSize
{
  double width = self->_preferredContentSize.width;
  double height = self->_preferredContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPreferredContentSize:(CGSize)a3
{
  self->_preferredContentSize = a3;
}

- (OS_dispatch_group)dispatchGroup
{
  return self->_dispatchGroup;
}

- (void)setDispatchGroup:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (UIViewController)presentedViewController
{
  return self->_presentedViewController;
}

- (void)setPresentedViewController:(id)a3
{
}

- (NSXPCListener)remoteListener
{
  return self->_remoteListener;
}

- (void)setRemoteListener:(id)a3
{
}

- (AMSEngagementRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (AMSEngagementResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_remoteListener, 0);
  objc_storeStrong((id *)&self->_presentedViewController, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_dispatchGroup, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end