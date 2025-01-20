@interface HKObjectPickerPresentationController
- (BOOL)didPresent;
- (HKHealthPrivacyHostObjectPickerViewController)hostViewController;
- (UIViewController)viewControllerPresenter;
- (_UIAsyncInvocation)requestCancellationInvocation;
- (void)_dismissViewControllerAnimated:(BOOL)a3;
- (void)_makeRemoteViewControllerVisible:(id)a3;
- (void)_presentWithPromptSession:(id)a3 completion:(id)a4;
- (void)_requestAndConfigureHostViewController:(id)a3 completion:(id)a4;
- (void)cancelPresentation;
- (void)dealloc;
- (void)healthPrivacyHostObjectPickerViewController:(id)a3 didFinishWithError:(id)a4;
- (void)presentWithSession:(id)a3 authorizationViewControllerPresenter:(id)a4 completion:(id)a5;
- (void)setDidPresent:(BOOL)a3;
- (void)setHostViewController:(id)a3;
- (void)setRequestCancellationInvocation:(id)a3;
- (void)setViewControllerPresenter:(id)a3;
@end

@implementation HKObjectPickerPresentationController

- (void)dealloc
{
  id v3 = (id)[(_UIAsyncInvocation *)self->_requestCancellationInvocation invoke];
  [(HKHealthPrivacyHostObjectPickerViewController *)self->_hostViewController setDelegate:0];
  v4.receiver = self;
  v4.super_class = (Class)HKObjectPickerPresentationController;
  [(HKObjectPickerPresentationController *)&v4 dealloc];
}

- (void)presentWithSession:(id)a3 authorizationViewControllerPresenter:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2, self, @"HKObjectPickerPresentationController.m", 39, @"Invalid parameter not satisfying: %@", @"[authorizationViewControllerPresenter isKindOfClass:[UIViewController class]]" object file lineNumber description];
    }
    objc_storeWeak((id *)&self->_viewControllerPresenter, v10);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __107__HKObjectPickerPresentationController_presentWithSession_authorizationViewControllerPresenter_completion___block_invoke;
  block[3] = &unk_1E6D51340;
  block[4] = self;
  id v16 = v9;
  id v17 = v11;
  id v12 = v11;
  id v13 = v9;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __107__HKObjectPickerPresentationController_presentWithSession_authorizationViewControllerPresenter_completion___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __107__HKObjectPickerPresentationController_presentWithSession_authorizationViewControllerPresenter_completion___block_invoke_2;
  v3[3] = &unk_1E6D51FA0;
  id v4 = *(id *)(a1 + 48);
  [v1 _presentWithPromptSession:v2 completion:v3];
}

uint64_t __107__HKObjectPickerPresentationController_presentWithSession_authorizationViewControllerPresenter_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)cancelPresentation
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__HKObjectPickerPresentationController_cancelPresentation__block_invoke;
  block[3] = &unk_1E6D50ED8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __58__HKObjectPickerPresentationController_cancelPresentation__block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(*(void *)(a1 + 32) + 16) invoke];
  id v3 = *(void **)(a1 + 32);
  return [v3 _dismissViewControllerAnimated:1];
}

- (void)_requestAndConfigureHostViewController:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(void, void, void))v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"HKObjectPickerPresentationController.m", 63, @"Invalid parameter not satisfying: %@", @"configurationHandler != nil" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"HKObjectPickerPresentationController.m", 64, @"Invalid parameter not satisfying: %@", @"completionHandler != nil" object file lineNumber description];

LABEL_3:
  if (self->_didPresent)
  {
    id v10 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 3, @"Already presenting remote view controller");
    ((void (**)(void, void, void *))v9)[2](v9, 0, v10);
  }
  else
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __90__HKObjectPickerPresentationController__requestAndConfigureHostViewController_completion___block_invoke;
    aBlock[3] = &unk_1E6D51FC8;
    aBlock[4] = self;
    id v17 = v7;
    v18 = v9;
    id v11 = _Block_copy(aBlock);
    self->_didPresent = 1;
    id v12 = +[HKHealthPrivacyHostObjectPickerViewController requestRemoteViewControllerWithConnectionHandler:v11];
    requestCancellationInvocation = self->_requestCancellationInvocation;
    self->_requestCancellationInvocation = v12;
  }
}

void __90__HKObjectPickerPresentationController__requestAndConfigureHostViewController_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 16);
  *(void *)(v8 + 16) = 0;

  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), a2);
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "setDelegate:");
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    [*(id *)(a1 + 32) _makeRemoteViewControllerVisible:v6];
    id v10 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    _HKInitializeLogging();
    id v11 = *MEMORY[0x1E4F29EF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR)) {
      __90__HKObjectPickerPresentationController__requestAndConfigureHostViewController_completion___block_invoke_cold_1((uint64_t)v7, v11);
    }
    id v10 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v10();
}

- (void)_presentWithPromptSession:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"HKObjectPickerPresentationController.m", 95, @"Invalid parameter not satisfying: %@", @"session != nil" object file lineNumber description];
  }
  id v9 = [v7 sessionIdentifier];

  if (!v9)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HKObjectPickerPresentationController.m", 96, @"Invalid parameter not satisfying: %@", @"session.sessionIdentifier != nil" object file lineNumber description];
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__HKObjectPickerPresentationController__presentWithPromptSession_completion___block_invoke;
  v13[3] = &unk_1E6D51FF0;
  id v14 = v7;
  id v10 = v7;
  [(HKObjectPickerPresentationController *)self _requestAndConfigureHostViewController:v13 completion:v8];
}

uint64_t __77__HKObjectPickerPresentationController__presentWithPromptSession_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPromptSession:*(void *)(a1 + 32)];
}

- (void)_makeRemoteViewControllerVisible:(id)a3
{
  id v4 = a3;
  if (_UIApplicationIsExtension())
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E4F29EF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_FAULT)) {
      -[HKObjectPickerPresentationController _makeRemoteViewControllerVisible:](v5);
    }
  }
  else
  {
    id v6 = [MEMORY[0x1E4F2B860] sharedBehavior];
    int v7 = [v6 isiPad];

    if (v7)
    {
      [v4 setModalPresentationStyle:2];
      objc_msgSend(v4, "setPreferredContentSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
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
        id v12 = [v10 presentedViewController];

        id v13 = [v12 presentedViewController];

        id v10 = v12;
      }
      while (v13);
    }
    else
    {
      id v12 = v10;
    }
    [v12 presentViewController:v4 animated:1 completion:0];
  }
}

- (void)_dismissViewControllerAnimated:(BOOL)a3
{
  if (self->_didPresent)
  {
    BOOL v3 = a3;
    v5 = self->_hostViewController;
    [(HKHealthPrivacyHostObjectPickerViewController *)v5 setDelegate:0];
    hostViewController = self->_hostViewController;
    self->_hostViewController = 0;

    int v7 = [(HKHealthPrivacyHostObjectPickerViewController *)v5 presentingViewController];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __71__HKObjectPickerPresentationController__dismissViewControllerAnimated___block_invoke;
    v8[3] = &unk_1E6D50ED8;
    v8[4] = self;
    [v7 dismissViewControllerAnimated:v3 completion:v8];
  }
}

uint64_t __71__HKObjectPickerPresentationController__dismissViewControllerAnimated___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 8) = 0;
  return result;
}

- (void)healthPrivacyHostObjectPickerViewController:(id)a3 didFinishWithError:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    _HKInitializeLogging();
    id v6 = *MEMORY[0x1E4F29EF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR)) {
      -[HKObjectPickerPresentationController healthPrivacyHostObjectPickerViewController:didFinishWithError:]((uint64_t)v5, v6);
    }
  }
  [(HKObjectPickerPresentationController *)self _dismissViewControllerAnimated:1];
}

- (_UIAsyncInvocation)requestCancellationInvocation
{
  return self->_requestCancellationInvocation;
}

- (void)setRequestCancellationInvocation:(id)a3
{
}

- (HKHealthPrivacyHostObjectPickerViewController)hostViewController
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

void __90__HKObjectPickerPresentationController__requestAndConfigureHostViewController_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E0B26000, a2, OS_LOG_TYPE_ERROR, "Failed to get remote view controller: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_makeRemoteViewControllerVisible:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1E0B26000, log, OS_LOG_TYPE_FAULT, "presenting a remote view controller from an extension is not supported", v1, 2u);
}

- (void)healthPrivacyHostObjectPickerViewController:(uint64_t)a1 didFinishWithError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E0B26000, a2, OS_LOG_TYPE_ERROR, "Privacy host view controller finished with error: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end