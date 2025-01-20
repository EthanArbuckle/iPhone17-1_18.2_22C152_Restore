@interface SKEngagementRemoteViewTask
- (NSData)requestData;
- (NSData)resultData;
- (NSDictionary)result;
- (NSError)error;
- (NSString)clientBundleID;
- (OS_dispatch_group)dispatchGroup;
- (OS_dispatch_queue)workQueue;
- (SKEngagementRemoteViewTask)initWithRequestData:(id)a3 presentingViewController:(id)a4 windowScene:(id)a5;
- (SKRemoteEngagementPresentationWindow)presentationWindow;
- (SKRemoteEngagementPresenterViewController)remoteViewController;
- (UIViewController)viewController;
- (UIWindowScene)scene;
- (id)completion;
- (void)_presentViewController:(id)a3;
- (void)_unblock;
- (void)engagementTaskDidFinishWithResult:(id)a3 resultData:(id)a4 error:(id)a5 completion:(id)a6;
- (void)preferredContentSizeDidChange:(CGSize)a3;
- (void)presentEngagement;
- (void)setClientBundleID:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setDispatchGroup:(id)a3;
- (void)setError:(id)a3;
- (void)setPresentationWindow:(id)a3;
- (void)setRemoteViewController:(id)a3;
- (void)setRequestData:(id)a3;
- (void)setResult:(id)a3;
- (void)setResultData:(id)a3;
- (void)setScene:(id)a3;
- (void)setViewController:(id)a3;
@end

@implementation SKEngagementRemoteViewTask

- (SKEngagementRemoteViewTask)initWithRequestData:(id)a3 presentingViewController:(id)a4 windowScene:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)SKEngagementRemoteViewTask;
  v12 = [(SKEngagementRemoteViewTask *)&v20 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_requestData, a3);
    objc_storeStrong((id *)&v13->_viewController, a4);
    objc_storeStrong((id *)&v13->_scene, a5);
    presentationWindow = v13->_presentationWindow;
    v13->_presentationWindow = 0;

    dispatch_group_t v15 = dispatch_group_create();
    dispatchGroup = v13->_dispatchGroup;
    v13->_dispatchGroup = (OS_dispatch_group *)v15;

    dispatch_queue_t v17 = dispatch_queue_create("com.StoreKit.AMSUIEngagementRemoteViewTask", 0);
    workQueue = v13->_workQueue;
    v13->_workQueue = (OS_dispatch_queue *)v17;
  }
  return v13;
}

- (void)presentEngagement
{
  v3 = [(SKEngagementRemoteViewTask *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__SKEngagementRemoteViewTask_presentEngagement__block_invoke;
  block[3] = &unk_1E5FA9A08;
  block[4] = self;
  dispatch_async(v3, block);
}

void __47__SKEngagementRemoteViewTask_presentEngagement__block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v2 = objc_opt_class();
    v3 = [*(id *)(a1 + 32) requestData];
    *(_DWORD *)buf = 138543618;
    uint64_t v16 = v2;
    __int16 v17 = 2114;
    v18 = v3;
    _os_log_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Presenting system engagement request. Request: %{public}@", buf, 0x16u);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__SKEngagementRemoteViewTask_presentEngagement__block_invoke_1;
  block[3] = &unk_1E5FA9A08;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
  v4 = [*(id *)(a1 + 32) dispatchGroup];
  dispatch_group_enter(v4);

  v5 = [*(id *)(a1 + 32) dispatchGroup];
  dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = objc_opt_class();
    v7 = [*(id *)(a1 + 32) result];
    v8 = [*(id *)(a1 + 32) error];
    *(_DWORD *)buf = 138543874;
    uint64_t v16 = v6;
    __int16 v17 = 2114;
    v18 = v7;
    __int16 v19 = 2114;
    objc_super v20 = v8;
    _os_log_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Engagement task finished. Result: %{public}@, error: %{public}@", buf, 0x20u);
  }
  [*(id *)(a1 + 32) setDispatchGroup:0];
  id v9 = [*(id *)(a1 + 32) completion];

  if (v9)
  {
    id v10 = [*(id *)(a1 + 32) completion];
    id v11 = [*(id *)(a1 + 32) result];
    v12 = [*(id *)(a1 + 32) resultData];
    v13 = [*(id *)(a1 + 32) error];
    ((void (**)(void, void *, void *, void *))v10)[2](v10, v11, v12, v13);
  }
}

void __47__SKEngagementRemoteViewTask_presentEngagement__block_invoke_1(uint64_t a1)
{
  uint64_t v2 = objc_alloc_init(SKRemoteEngagementPresenterViewController);
  [*(id *)(a1 + 32) setRemoteViewController:v2];

  v3 = *(void **)(a1 + 32);
  v4 = [v3 remoteViewController];
  [v4 setDelegate:v3];

  v5 = [*(id *)(a1 + 32) remoteViewController];
  uint64_t v6 = [*(id *)(a1 + 32) requestData];
  v7 = [*(id *)(a1 + 32) clientBundleID];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__SKEngagementRemoteViewTask_presentEngagement__block_invoke_2;
  v10[3] = &unk_1E5FA9938;
  v10[4] = *(void *)(a1 + 32);
  [v5 presentEngagementRequestData:v6 clientBundleID:v7 completion:v10];

  v8 = *(void **)(a1 + 32);
  id v9 = [v8 remoteViewController];
  [v8 _presentViewController:v9];
}

uint64_t __47__SKEngagementRemoteViewTask_presentEngagement__block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    [*(id *)(result + 32) setError:a2];
    v3 = *(void **)(v2 + 32);
    return [v3 _unblock];
  }
  return result;
}

- (void)engagementTaskDidFinishWithResult:(id)a3 resultData:(id)a4 error:(id)a5 completion:(id)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(void))a6;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v16 = 138543874;
    uint64_t v17 = objc_opt_class();
    __int16 v18 = 2114;
    id v19 = v10;
    __int16 v20 = 2114;
    id v21 = v12;
    _os_log_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: remote engagement task finished. Result: %{public}@, error: %{public}@", (uint8_t *)&v16, 0x20u);
  }
  [(SKEngagementRemoteViewTask *)self setResult:v10];
  [(SKEngagementRemoteViewTask *)self setResultData:v11];
  [(SKEngagementRemoteViewTask *)self setError:v12];
  v14 = [(SKEngagementRemoteViewTask *)self remoteViewController];
  [v14 dismissViewControllerAnimated:1 completion:0];

  dispatch_group_t v15 = [(SKEngagementRemoteViewTask *)self viewController];
  [v15 dismissViewControllerAnimated:1 completion:0];

  [(SKEngagementRemoteViewTask *)self setPresentationWindow:0];
  v13[2](v13);
  [(SKEngagementRemoteViewTask *)self _unblock];
}

- (void)preferredContentSizeDidChange:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v7 = 138543362;
    uint64_t v8 = objc_opt_class();
    _os_log_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Preferred content size did change", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v6 = [(SKEngagementRemoteViewTask *)self remoteViewController];
  objc_msgSend(v6, "setPreferredContentSize:", width, height);
}

- (void)_unblock
{
  v3 = [(SKEngagementRemoteViewTask *)self dispatchGroup];

  if (v3)
  {
    v4 = [(SKEngagementRemoteViewTask *)self dispatchGroup];
    dispatch_group_leave(v4);
  }
}

- (void)_presentViewController:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__SKEngagementRemoteViewTask__presentViewController___block_invoke;
  v6[3] = &unk_1E5FAA6D8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __53__SKEngagementRemoteViewTask__presentViewController___block_invoke(uint64_t a1)
{
  uint64_t v2 = (uint64_t *)(a1 + 32);
  v3 = [*(id *)(a1 + 32) viewController];
  id v4 = [v3 presentedViewController];

  if (v4)
  {
    do
    {
      id v5 = [v3 presentedViewController];

      uint64_t v6 = [v5 presentedViewController];

      v3 = v5;
    }
    while (v6);
    if (v5) {
      goto LABEL_4;
    }
  }
  else
  {
    id v5 = v3;
    if (v3)
    {
LABEL_4:
      id v7 = [SKRemoteEngagementPresentationWindow alloc];
      uint64_t v8 = [*(id *)(a1 + 32) scene];
      uint64_t v9 = [(UIApplicationRotationFollowingWindow *)v7 initWithWindowScene:v8];

      [*(id *)(a1 + 32) setPresentationWindow:v9];
      [(SKRemoteEngagementPresentationWindow *)v9 setHidden:0];
      [(SKRemoteEngagementPresentationWindow *)v9 presentViewController:v5 animated:0 completion:&__block_literal_global_7];
      [*(id *)(a1 + 40) setModalPresentationStyle:5];
      [v5 presentViewController:*(void *)(a1 + 40) animated:0 completion:0];

      goto LABEL_8;
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __53__SKEngagementRemoteViewTask__presentViewController___block_invoke_cold_1(v2);
  }
LABEL_8:
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (void)setClientBundleID:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
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

- (SKRemoteEngagementPresenterViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (void)setRemoteViewController:(id)a3
{
}

- (SKRemoteEngagementPresentationWindow)presentationWindow
{
  return self->_presentationWindow;
}

- (void)setPresentationWindow:(id)a3
{
}

- (NSData)requestData
{
  return self->_requestData;
}

- (void)setRequestData:(id)a3
{
}

- (NSData)resultData
{
  return self->_resultData;
}

- (void)setResultData:(id)a3
{
}

- (NSDictionary)result
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

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (UIWindowScene)scene
{
  return self->_scene;
}

- (void)setScene:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_resultData, 0);
  objc_storeStrong((id *)&self->_requestData, 0);
  objc_storeStrong((id *)&self->_presentationWindow, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_dispatchGroup, 0);
  objc_storeStrong(&self->_completion, 0);

  objc_storeStrong((id *)&self->_clientBundleID, 0);
}

void __53__SKEngagementRemoteViewTask__presentViewController___block_invoke_cold_1(uint64_t *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *a1;
  int v2 = 138543362;
  uint64_t v3 = v1;
  _os_log_error_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Presenting view controller is nil", (uint8_t *)&v2, 0xCu);
}

@end