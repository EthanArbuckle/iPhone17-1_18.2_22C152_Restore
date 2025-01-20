@interface HKAuthorizationPresentationController
- (BOOL)didPresent;
- (HKHealthPrivacyHostAuthorizationViewController)hostViewController;
- (HKNanoHostAuthorizationController)nanoAuthorizationController;
- (UIViewController)viewControllerPresenter;
- (_UIAsyncInvocation)requestCancellationInvocation;
- (void)_dismissViewControllerAnimated:(BOOL)a3;
- (void)_mainQueue_presentWithPresentationRequests:(id)a3 authorizationRequestRecord:(id)a4 completion:(id)a5;
- (void)_makeRemoteViewControllerVisible:(id)a3;
- (void)_requestAndConfigureCarouselAlert:(id)a3 completion:(id)a4;
- (void)_requestAndConfigureHostViewController:(id)a3 completion:(id)a4;
- (void)cancelPresentation;
- (void)dealloc;
- (void)healthPrivacyHostAuthorizationControllerDidFinishWithError:(id)a3;
- (void)presentWithPresentationRequests:(id)a3 authorizationRequestRecord:(id)a4 authorizationViewControllerPresenter:(id)a5 completion:(id)a6;
- (void)setDidPresent:(BOOL)a3;
- (void)setHostViewController:(id)a3;
- (void)setNanoAuthorizationController:(id)a3;
- (void)setRequestCancellationInvocation:(id)a3;
- (void)setViewControllerPresenter:(id)a3;
@end

@implementation HKAuthorizationPresentationController

- (void)dealloc
{
  v3 = [(HKAuthorizationPresentationController *)self requestCancellationInvocation];
  id v4 = (id)[v3 invoke];

  v5.receiver = self;
  v5.super_class = (Class)HKAuthorizationPresentationController;
  [(HKAuthorizationPresentationController *)&v5 dealloc];
}

- (void)presentWithPresentationRequests:(id)a3 authorizationRequestRecord:(id)a4 authorizationViewControllerPresenter:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"HKAuthorizationPresentationController.m", 43, @"Invalid parameter not satisfying: %@", @"presentationRequests != nil" object file lineNumber description];
  }
  if ([v11 count])
  {
    if (v14) {
      goto LABEL_5;
    }
  }
  else
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"HKAuthorizationPresentationController.m", 44, @"Invalid parameter not satisfying: %@", @"presentationRequests.count > 0" object file lineNumber description];

    if (v14)
    {
LABEL_5:
      if (!v13) {
        goto LABEL_9;
      }
      goto LABEL_6;
    }
  }
  v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"HKAuthorizationPresentationController.m", 45, @"Invalid parameter not satisfying: %@", @"completion != nil" object file lineNumber description];

  if (!v13) {
    goto LABEL_9;
  }
LABEL_6:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"HKAuthorizationPresentationController.m", 48, @"Invalid parameter not satisfying: %@", @"[authorizationViewControllerPresenter isKindOfClass:[UIViewController class]]" object file lineNumber description];
  }
  objc_storeWeak((id *)&self->_viewControllerPresenter, v13);
LABEL_9:
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __148__HKAuthorizationPresentationController_presentWithPresentationRequests_authorizationRequestRecord_authorizationViewControllerPresenter_completion___block_invoke;
  block[3] = &unk_1E6D518B0;
  block[4] = self;
  id v23 = v11;
  id v24 = v12;
  id v25 = v14;
  id v15 = v14;
  id v16 = v12;
  id v17 = v11;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __148__HKAuthorizationPresentationController_presentWithPresentationRequests_authorizationRequestRecord_authorizationViewControllerPresenter_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mainQueue_presentWithPresentationRequests:authorizationRequestRecord:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

- (void)cancelPresentation
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__HKAuthorizationPresentationController_cancelPresentation__block_invoke;
  block[3] = &unk_1E6D50ED8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __59__HKAuthorizationPresentationController_cancelPresentation__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) requestCancellationInvocation];
  id v3 = (id)[v2 invoke];

  id v4 = *(void **)(a1 + 32);
  return [v4 _dismissViewControllerAnimated:1];
}

- (void)_requestAndConfigureCarouselAlert:(id)a3 completion:(id)a4
{
  v8 = (void (**)(id, HKNanoHostAuthorizationController *))a3;
  v6 = (void (**)(id, void, HKNanoHostAuthorizationController *))a4;
  if ([(HKAuthorizationPresentationController *)self didPresent])
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 3, @"Already presenting Carousel alert");
    v7 = (HKNanoHostAuthorizationController *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v7);
  }
  else
  {
    v7 = objc_alloc_init(HKNanoHostAuthorizationController);
    [(HKAuthorizationPresentationController *)self setNanoAuthorizationController:v7];
    [(HKNanoHostAuthorizationController *)v7 setDelegate:self];
    v8[2](v8, v7);
    [(HKNanoHostAuthorizationController *)v7 show];
    [(HKAuthorizationPresentationController *)self setDidPresent:1];
    v6[2](v6, 1, 0);
  }
}

- (void)_requestAndConfigureHostViewController:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  if ([(HKAuthorizationPresentationController *)self didPresent])
  {
    v8 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 3, @"Already presenting remote view controller");
    v7[2](v7, 0, v8);
  }
  else
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __91__HKAuthorizationPresentationController__requestAndConfigureHostViewController_completion___block_invoke;
    aBlock[3] = &unk_1E6D51FC8;
    aBlock[4] = self;
    id v12 = v6;
    id v13 = v7;
    v9 = _Block_copy(aBlock);
    [(HKAuthorizationPresentationController *)self setDidPresent:1];
    v10 = +[HKHealthPrivacyHostAuthorizationViewController requestRemoteViewControllerWithConnectionHandler:v9];
    [(HKAuthorizationPresentationController *)self setRequestCancellationInvocation:v10];
  }
}

void __91__HKAuthorizationPresentationController__requestAndConfigureHostViewController_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) setRequestCancellationInvocation:0];
  if (v5)
  {
    v7 = *(void **)(a1 + 32);
    id v8 = v5;
    [v7 setHostViewController:v8];
    [v8 setDelegate:*(void *)(a1 + 32)];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    [*(id *)(a1 + 32) _makeRemoteViewControllerVisible:v8];
    [v8 show];

    v9 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    _HKInitializeLogging();
    v10 = *MEMORY[0x1E4F29EF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR)) {
      __90__HKObjectPickerPresentationController__requestAndConfigureHostViewController_completion___block_invoke_cold_1((uint64_t)v6, v10);
    }
    v9 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v9();
}

- (void)_mainQueue_presentWithPresentationRequests:(id)a3 authorizationRequestRecord:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v11 = [MEMORY[0x1E4F2B860] sharedBehavior];
  int v12 = [v11 isAppleWatch];

  if (v12)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __122__HKAuthorizationPresentationController__mainQueue_presentWithPresentationRequests_authorizationRequestRecord_completion___block_invoke;
    v22[3] = &unk_1E6D52D40;
    id v13 = &v23;
    id v14 = &v24;
    id v23 = v9;
    id v24 = v8;
    id v15 = v8;
    id v16 = v9;
    [(HKAuthorizationPresentationController *)self _requestAndConfigureCarouselAlert:v22 completion:v10];
  }
  else
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __122__HKAuthorizationPresentationController__mainQueue_presentWithPresentationRequests_authorizationRequestRecord_completion___block_invoke_2;
    v19[3] = &unk_1E6D52D68;
    id v13 = &v20;
    id v14 = &v21;
    id v20 = v9;
    id v21 = v8;
    id v17 = v8;
    id v18 = v9;
    [(HKAuthorizationPresentationController *)self _requestAndConfigureHostViewController:v19 completion:v10];
  }
}

uint64_t __122__HKAuthorizationPresentationController__mainQueue_presentWithPresentationRequests_authorizationRequestRecord_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setRequestRecord:*(void *)(a1 + 32) presentationRequests:*(void *)(a1 + 40)];
}

uint64_t __122__HKAuthorizationPresentationController__mainQueue_presentWithPresentationRequests_authorizationRequestRecord_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setRequestRecord:*(void *)(a1 + 32) presentationRequests:*(void *)(a1 + 40)];
}

- (void)_makeRemoteViewControllerVisible:(id)a3
{
  id v4 = a3;
  if (_UIApplicationIsExtension()
    && ([MEMORY[0x1E4F2B860] sharedBehavior],
        id v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 isAppleWatch],
        v5,
        (v6 & 1) == 0))
  {
    _HKInitializeLogging();
    id v15 = *MEMORY[0x1E4F29EF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_FAULT)) {
      -[HKObjectPickerPresentationController _makeRemoteViewControllerVisible:](v15);
    }
  }
  else
  {
    v7 = [MEMORY[0x1E4F2B860] sharedBehavior];
    int v8 = [v7 isiPad];

    if (v8)
    {
      [v4 setModalPresentationStyle:2];
      objc_msgSend(v4, "setPreferredContentSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    }
    [v4 setModalInPresentation:1];
    id v9 = objc_alloc_init(HKAuthorizationViewPresenterProvider);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_viewControllerPresenter);
    id v11 = [(HKAuthorizationViewPresenterProvider *)v9 hkAuthorizationViewControllerPresenter:WeakRetained];

    int v12 = [v11 presentedViewController];

    if (v12)
    {
      do
      {
        id v13 = [v11 presentedViewController];

        id v14 = [v13 presentedViewController];

        id v11 = v13;
      }
      while (v14);
    }
    else
    {
      id v13 = v11;
    }
    [v13 presentViewController:v4 animated:1 completion:0];
  }
}

- (void)_dismissViewControllerAnimated:(BOOL)a3
{
  if (self->_didPresent)
  {
    BOOL v3 = a3;
    id v5 = [MEMORY[0x1E4F2B860] sharedBehavior];
    int v6 = [v5 isAppleWatch];

    if (v6)
    {
      [(HKNanoHostAuthorizationController *)self->_nanoAuthorizationController invalidate];
      [(HKNanoHostAuthorizationController *)self->_nanoAuthorizationController setDelegate:0];
      nanoAuthorizationController = self->_nanoAuthorizationController;
      self->_nanoAuthorizationController = 0;

      self->_didPresent = 0;
    }
    else
    {
      int v8 = self->_hostViewController;
      [(HKHealthPrivacyHostAuthorizationViewController *)v8 setDelegate:0];
      hostViewController = self->_hostViewController;
      self->_hostViewController = 0;

      id v10 = [(HKHealthPrivacyHostAuthorizationViewController *)v8 presentingViewController];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __72__HKAuthorizationPresentationController__dismissViewControllerAnimated___block_invoke;
      v11[3] = &unk_1E6D50ED8;
      v11[4] = self;
      [v10 dismissViewControllerAnimated:v3 completion:v11];
    }
  }
}

uint64_t __72__HKAuthorizationPresentationController__dismissViewControllerAnimated___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 8) = 0;
  return result;
}

- (void)healthPrivacyHostAuthorizationControllerDidFinishWithError:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    _HKInitializeLogging();
    id v5 = *MEMORY[0x1E4F29EF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR)) {
      -[HKAuthorizationPresentationController healthPrivacyHostAuthorizationControllerDidFinishWithError:]((uint64_t)v4, v5);
    }
  }
  [(HKAuthorizationPresentationController *)self _dismissViewControllerAnimated:1];
}

- (_UIAsyncInvocation)requestCancellationInvocation
{
  return self->_requestCancellationInvocation;
}

- (void)setRequestCancellationInvocation:(id)a3
{
}

- (HKHealthPrivacyHostAuthorizationViewController)hostViewController
{
  return self->_hostViewController;
}

- (void)setHostViewController:(id)a3
{
}

- (HKNanoHostAuthorizationController)nanoAuthorizationController
{
  return self->_nanoAuthorizationController;
}

- (void)setNanoAuthorizationController:(id)a3
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
  objc_storeStrong((id *)&self->_nanoAuthorizationController, 0);
  objc_storeStrong((id *)&self->_hostViewController, 0);
  objc_storeStrong((id *)&self->_requestCancellationInvocation, 0);
}

- (void)healthPrivacyHostAuthorizationControllerDidFinishWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E0B26000, a2, OS_LOG_TYPE_ERROR, "Privacy host controller finished with error: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end