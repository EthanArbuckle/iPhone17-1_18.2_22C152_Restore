@interface HMUserListViewController
- (BOOL)shouldPresentWhenLoaded;
- (HMHome)home;
- (HMUserListRemoteViewController)remoteViewController;
- (HMUserListViewController)initWithHome:(id)a3 loadHandler:(id)a4;
- (_UIAsyncInvocation)cancelServiceInvocation;
- (id)completionHandler;
- (id)loadHandler;
- (unint64_t)supportedInterfaceOrientations;
- (void)_configureAndAddRemoteViewController;
- (void)_finishSetupWithError:(id)a3;
- (void)_presentAsTopmostViewController;
- (void)_requestRemoteViewController;
- (void)presentWhenLoaded;
- (void)setCancelServiceInvocation:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setHome:(id)a3;
- (void)setLoadHandler:(id)a3;
- (void)setRemoteViewController:(id)a3;
- (void)setShouldPresentWhenLoaded:(BOOL)a3;
- (void)userManagementDidFinishWithError:(id)a3;
- (void)userManagementDidLoad;
- (void)viewDidLoad;
@end

@implementation HMUserListViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_cancelServiceInvocation, 0);
  objc_storeStrong(&self->_loadHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);

  objc_storeStrong((id *)&self->_home, 0);
}

- (void)setRemoteViewController:(id)a3
{
}

- (HMUserListRemoteViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (void)setCancelServiceInvocation:(id)a3
{
}

- (_UIAsyncInvocation)cancelServiceInvocation
{
  return self->_cancelServiceInvocation;
}

- (void)setLoadHandler:(id)a3
{
}

- (id)loadHandler
{
  return self->_loadHandler;
}

- (void)setShouldPresentWhenLoaded:(BOOL)a3
{
  self->_shouldPresentWhenLoaded = a3;
}

- (BOOL)shouldPresentWhenLoaded
{
  return self->_shouldPresentWhenLoaded;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setHome:(id)a3
{
}

- (HMHome)home
{
  return self->_home;
}

- (void)_presentAsTopmostViewController
{
  v3 = [MEMORY[0x1E4F42738] sharedApplication];
  v4 = [v3 keyWindow];
  v5 = [v4 rootViewController];

  v6 = [v5 presentedViewController];

  if (v6)
  {
    do
    {
      id v14 = [v5 presentedViewController];

      v7 = [v14 presentedViewController];

      v8 = v14;
      v5 = v14;
    }
    while (v7);
  }
  else
  {
    v8 = v5;
  }
  id v15 = v8;
  v9 = [v8 traitCollection];
  if ([v9 horizontalSizeClass] == 2)
  {
    v10 = [v15 traitCollection];
    if ([v10 userInterfaceIdiom] == 1)
    {

LABEL_10:
      uint64_t v13 = 2;
      goto LABEL_12;
    }
    v11 = [v15 traitCollection];
    uint64_t v12 = [v11 userInterfaceIdiom];

    if (v12 == 5) {
      goto LABEL_10;
    }
  }
  else
  {
  }
  uint64_t v13 = 5;
LABEL_12:
  [(HMUserListViewController *)self setModalPresentationStyle:v13];
  [v15 presentViewController:self animated:1 completion:0];
}

- (void)userManagementDidFinishWithError:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__HMUserListViewController_userManagementDidFinishWithError___block_invoke;
  v6[3] = &unk_1E5945628;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __61__HMUserListViewController_userManagementDidFinishWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishSetupWithError:*(void *)(a1 + 40)];
}

- (void)userManagementDidLoad
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__HMUserListViewController_userManagementDidLoad__block_invoke;
  block[3] = &unk_1E59452E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __49__HMUserListViewController_userManagementDidLoad__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) loadHandler];

  if (v2)
  {
    v3 = [*(id *)(a1 + 32) loadHandler];
    v3[2](v3, 0);

    [*(id *)(a1 + 32) setLoadHandler:0];
  }
  id v4 = *(void **)(a1 + 32);

  return [v4 _endDelayingPresentation];
}

- (void)_finishSetupWithError:(id)a3
{
  id v9 = a3;
  id v4 = [(HMUserListViewController *)self presentingViewController];
  [v4 dismissViewControllerAnimated:1 completion:0];

  [(HMUserListViewController *)self _endDelayingPresentation];
  id v5 = [(HMUserListViewController *)self loadHandler];

  if (v5)
  {
    v6 = [(HMUserListViewController *)self loadHandler];
    ((void (**)(void, id))v6)[2](v6, v9);

    [(HMUserListViewController *)self setLoadHandler:0];
  }
  id v7 = [(HMUserListViewController *)self completionHandler];

  if (v7)
  {
    v8 = [(HMUserListViewController *)self completionHandler];
    ((void (**)(void, id))v8)[2](v8, v9);

    [(HMUserListViewController *)self setCompletionHandler:0];
  }
}

- (void)_configureAndAddRemoteViewController
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HMUserListViewController *)self remoteViewController];
  if (v3)
  {
    id v4 = (void *)v3;
    id v5 = [(HMUserListViewController *)self remoteViewController];
    v6 = [v5 parentViewController];

    if (!v6)
    {
      id v7 = [(HMUserListViewController *)self remoteViewController];
      [v7 setDelegate:self];

      v8 = [(HMUserListViewController *)self remoteViewController];
      [(HMUserListViewController *)self addChildViewController:v8];

      id v9 = [(HMUserListViewController *)self remoteViewController];
      v10 = [v9 view];

      v11 = [(HMUserListViewController *)self view];
      [v11 addSubview:v10];

      uint64_t v12 = [(HMUserListViewController *)self view];
      [v12 frame];
      objc_msgSend(v10, "setFrame:");

      uint64_t v13 = [(HMUserListViewController *)self remoteViewController];
      [v13 didMoveToParentViewController:self];

      id v14 = [(HMUserListViewController *)self remoteViewController];
      id v15 = [v14 serviceViewControllerProxy];

      v16 = (void *)MEMORY[0x19F3A64A0]();
      v17 = self;
      v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = HMFGetLogIdentifier();
        int v22 = 138543618;
        v23 = v19;
        __int16 v24 = 2112;
        v25 = v15;
        _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@serviceViewControllerProxy: %@", (uint8_t *)&v22, 0x16u);
      }
      v20 = [(HMUserListViewController *)v17 home];
      v21 = [v20 uuid];
      [v15 setHomeUUID:v21];

      if ([(HMUserListViewController *)v17 shouldPresentWhenLoaded]) {
        [(HMUserListViewController *)v17 _presentAsTopmostViewController];
      }
    }
  }
}

- (void)_requestRemoteViewController
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__HMUserListViewController__requestRemoteViewController__block_invoke;
  v5[3] = &unk_1E59451C8;
  v5[4] = self;
  [(HMUserListViewController *)self _beginDelayingPresentation:v5 cancellationHandler:15.0];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__HMUserListViewController__requestRemoteViewController__block_invoke_2;
  v4[3] = &unk_1E59451F0;
  v4[4] = self;
  uint64_t v3 = +[HMUserListRemoteViewController requestViewControllerWithConnectionHandler:v4];
  [(HMUserListViewController *)self setCancelServiceInvocation:v3];
}

uint64_t __56__HMUserListViewController__requestRemoteViewController__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:8 userInfo:0];
    [*(id *)(a1 + 32) _finishSetupWithError:v3];
  }
  return 0;
}

void __56__HMUserListViewController__requestRemoteViewController__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [*(id *)(a1 + 32) setRemoteViewController:v5];
    [*(id *)(a1 + 32) _configureAndAddRemoteViewController];
  }
  else
  {
    id v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F28A50];
    v11[0] = v6;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    id v9 = [v7 errorWithDomain:@"HMErrorDomain" code:1005 userInfo:v8];

    [*(id *)(a1 + 32) _finishSetupWithError:v9];
  }
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)HMUserListViewController;
  [(HMUserListViewController *)&v5 viewDidLoad];
  uint64_t v3 = [MEMORY[0x1E4F428B8] clearColor];
  id v4 = [(HMUserListViewController *)self view];
  [v4 setBackgroundColor:v3];
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (void)presentWhenLoaded
{
}

- (HMUserListViewController)initWithHome:(id)a3 loadHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMUserListViewController;
  v8 = [(HMUserListViewController *)&v11 init];
  id v9 = v8;
  if (v8)
  {
    [(HMUserListViewController *)v8 setHome:v6];
    [(HMUserListViewController *)v9 setLoadHandler:v7];
    [(HMUserListViewController *)v9 _requestRemoteViewController];
  }

  return v9;
}

@end