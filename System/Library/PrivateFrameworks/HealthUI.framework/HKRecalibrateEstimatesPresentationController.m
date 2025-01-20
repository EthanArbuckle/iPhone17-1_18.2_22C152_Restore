@interface HKRecalibrateEstimatesPresentationController
- (BOOL)didPresent;
- (HKHealthPrivacyHostRecalibrateEstimatesViewController)hostViewController;
- (UIViewController)viewControllerPresenter;
- (_UIAsyncInvocation)requestCancellationInvocation;
- (void)_dismissViewControllerAnimated:(BOOL)a3;
- (void)_makeRemoteViewControllerVisible:(id)a3;
- (void)_requestAndConfigureHostViewController:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)healthPrivacyHostRecalibrateEstimatesControllerDidFinishWithError:(id)a3;
- (void)presentWithRequestRecord:(id)a3 authorizationViewControllerPresenter:(id)a4 completion:(id)a5;
- (void)setDidPresent:(BOOL)a3;
- (void)setHostViewController:(id)a3;
- (void)setRequestCancellationInvocation:(id)a3;
- (void)setViewControllerPresenter:(id)a3;
@end

@implementation HKRecalibrateEstimatesPresentationController

- (void)dealloc
{
  v3 = [(HKRecalibrateEstimatesPresentationController *)self requestCancellationInvocation];
  id v4 = (id)[v3 invoke];

  v5.receiver = self;
  v5.super_class = (Class)HKRecalibrateEstimatesPresentationController;
  [(HKRecalibrateEstimatesPresentationController *)&v5 dealloc];
}

- (void)presentWithRequestRecord:(id)a3 authorizationViewControllerPresenter:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if (v9)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"HKRecalibrateEstimatesPresentationController.m", 37, @"Invalid parameter not satisfying: %@", @"requestRecord != nil" object file lineNumber description];

    if (v12)
    {
LABEL_3:
      if (!v10) {
        goto LABEL_7;
      }
      goto LABEL_4;
    }
  }
  v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"HKRecalibrateEstimatesPresentationController.m", 38, @"Invalid parameter not satisfying: %@", @"completion != nil" object file lineNumber description];

  if (!v10) {
    goto LABEL_7;
  }
LABEL_4:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"HKRecalibrateEstimatesPresentationController.m", 41, @"Invalid parameter not satisfying: %@", @"[authorizationViewControllerPresenter isKindOfClass:[UIViewController class]]" object file lineNumber description];
  }
  objc_storeWeak((id *)&self->_viewControllerPresenter, v10);
LABEL_7:
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __121__HKRecalibrateEstimatesPresentationController_presentWithRequestRecord_authorizationViewControllerPresenter_completion___block_invoke;
  block[3] = &unk_1E6D51340;
  block[4] = self;
  id v19 = v9;
  id v20 = v12;
  id v13 = v12;
  id v14 = v9;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __121__HKRecalibrateEstimatesPresentationController_presentWithRequestRecord_authorizationViewControllerPresenter_completion___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __121__HKRecalibrateEstimatesPresentationController_presentWithRequestRecord_authorizationViewControllerPresenter_completion___block_invoke_2;
  v3[3] = &unk_1E6D547B8;
  v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 _requestAndConfigureHostViewController:v3 completion:*(void *)(a1 + 48)];
}

uint64_t __121__HKRecalibrateEstimatesPresentationController_presentWithRequestRecord_authorizationViewControllerPresenter_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setRequestRecord:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)_requestAndConfigureHostViewController:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  if ([(HKRecalibrateEstimatesPresentationController *)self didPresent])
  {
    v8 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 3, @"Already presenting recalibrate estimates remote view controller.");
    v7[2](v7, 0, v8);
  }
  else
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __98__HKRecalibrateEstimatesPresentationController__requestAndConfigureHostViewController_completion___block_invoke;
    aBlock[3] = &unk_1E6D51FC8;
    aBlock[4] = self;
    id v18 = v6;
    id v9 = v7;
    id v19 = v9;
    id v10 = _Block_copy(aBlock);
    [(HKRecalibrateEstimatesPresentationController *)self setDidPresent:1];
    id v11 = +[HKHealthPrivacyHostRecalibrateEstimatesViewController requestRemoteViewControllerWithConnectionHandler:v10];
    [(HKRecalibrateEstimatesPresentationController *)self setRequestCancellationInvocation:v11];

    objc_initWeak(&location, self);
    dispatch_time_t v12 = dispatch_time(0, 10000000000);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __98__HKRecalibrateEstimatesPresentationController__requestAndConfigureHostViewController_completion___block_invoke_301;
    v13[3] = &unk_1E6D547E0;
    objc_copyWeak(&v15, &location);
    id v14 = v9;
    dispatch_after(v12, MEMORY[0x1E4F14428], v13);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __98__HKRecalibrateEstimatesPresentationController__requestAndConfigureHostViewController_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [*(id *)(a1 + 32) requestCancellationInvocation];

  if (v7)
  {
    [*(id *)(a1 + 32) setRequestCancellationInvocation:0];
    if (v5)
    {
      v8 = *(void **)(a1 + 32);
      id v9 = v5;
      [v8 setHostViewController:v9];
      [v9 setDelegate:*(void *)(a1 + 32)];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      [*(id *)(a1 + 32) _makeRemoteViewControllerVisible:v9];

      id v10 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    }
    else
    {
      _HKInitializeLogging();
      id v11 = *MEMORY[0x1E4F29EF8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR)) {
        __98__HKRecalibrateEstimatesPresentationController__requestAndConfigureHostViewController_completion___block_invoke_cold_1((uint64_t)v6, v11);
      }
      id v10 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    }
    v10();
  }
}

void __98__HKRecalibrateEstimatesPresentationController__requestAndConfigureHostViewController_completion___block_invoke_301(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained requestCancellationInvocation];

  if (v4)
  {
    id v5 = objc_loadWeakRetained(v2);
    id v6 = [v5 requestCancellationInvocation];
    id v7 = (id)[v6 invoke];

    id v8 = objc_loadWeakRetained(v2);
    [v8 setRequestCancellationInvocation:0];

    uint64_t v9 = *(void *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 103, @"Timed out connecting to recalibrate estimates remote view service.");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0, v10);
  }
}

- (void)_makeRemoteViewControllerVisible:(id)a3
{
  id v4 = a3;
  if (_UIApplicationIsExtension())
  {
    _HKInitializeLogging();
    id v5 = *MEMORY[0x1E4F29EF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_FAULT)) {
      -[HKObjectPickerPresentationController _makeRemoteViewControllerVisible:](v5);
    }
  }
  else
  {
    id v6 = [MEMORY[0x1E4F2B860] sharedBehavior];
    int v7 = [v6 isiPad];

    if (v7) {
      [v4 setModalPresentationStyle:5];
    }
    [v4 setModalInPresentation:1];
    id v8 = objc_alloc_init(HKAuthorizationViewPresenterProvider);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_viewControllerPresenter);
    id v10 = [(HKAuthorizationViewPresenterProvider *)v8 hkAuthorizationViewControllerPresenter:WeakRetained];

    id v11 = [v10 presentedViewController];

    if (v11)
    {
      do
      {
        dispatch_time_t v12 = [v10 presentedViewController];

        id v13 = [v12 presentedViewController];

        id v10 = v12;
      }
      while (v13);
    }
    else
    {
      dispatch_time_t v12 = v10;
    }
    [v12 presentViewController:v4 animated:1 completion:0];
  }
}

- (void)_dismissViewControllerAnimated:(BOOL)a3
{
  if (self->_didPresent)
  {
    BOOL v3 = a3;
    id v5 = self->_hostViewController;
    [(HKHealthPrivacyHostRecalibrateEstimatesViewController *)v5 setDelegate:0];
    hostViewController = self->_hostViewController;
    self->_hostViewController = 0;

    int v7 = [(HKHealthPrivacyHostRecalibrateEstimatesViewController *)v5 presentingViewController];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __79__HKRecalibrateEstimatesPresentationController__dismissViewControllerAnimated___block_invoke;
    v8[3] = &unk_1E6D50ED8;
    v8[4] = self;
    [v7 dismissViewControllerAnimated:v3 completion:v8];
  }
}

uint64_t __79__HKRecalibrateEstimatesPresentationController__dismissViewControllerAnimated___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 8) = 0;
  return result;
}

- (void)healthPrivacyHostRecalibrateEstimatesControllerDidFinishWithError:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    _HKInitializeLogging();
    id v5 = *MEMORY[0x1E4F29EF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR)) {
      -[HKRecalibrateEstimatesPresentationController healthPrivacyHostRecalibrateEstimatesControllerDidFinishWithError:]((uint64_t)v4, v5);
    }
  }
  [(HKRecalibrateEstimatesPresentationController *)self _dismissViewControllerAnimated:1];
}

- (_UIAsyncInvocation)requestCancellationInvocation
{
  return self->_requestCancellationInvocation;
}

- (void)setRequestCancellationInvocation:(id)a3
{
}

- (HKHealthPrivacyHostRecalibrateEstimatesViewController)hostViewController
{
  return self->_hostViewController;
}

- (void)setHostViewController:(id)a3
{
}

- (BOOL)didPresent
{
  return self->_didPresent;
}

- (void)setDidPresent:(BOOL)a3
{
  self->_didPresent = a3;
}

- (UIViewController)viewControllerPresenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewControllerPresenter);
  return (UIViewController *)WeakRetained;
}

- (void)setViewControllerPresenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewControllerPresenter);
  objc_storeStrong((id *)&self->_hostViewController, 0);
  objc_storeStrong((id *)&self->_requestCancellationInvocation, 0);
}

void __98__HKRecalibrateEstimatesPresentationController__requestAndConfigureHostViewController_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E0B26000, a2, OS_LOG_TYPE_ERROR, "Failed to get recalibrate estimates remote view controller: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)healthPrivacyHostRecalibrateEstimatesControllerDidFinishWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E0B26000, a2, OS_LOG_TYPE_ERROR, "Privacy host recalibrate estimates controller finished with error: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end