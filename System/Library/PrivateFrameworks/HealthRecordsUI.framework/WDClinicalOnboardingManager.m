@interface WDClinicalOnboardingManager
- (HKNavigationController)inFlightClinicalSharingLoginViewController;
- (HKNavigationController)onboardingTileNavigationController;
- (HRProfile)profile;
- (WDClinicalGatewayProxy)pendingOnboardingGateway;
- (WDClinicalOnboardingManager)init;
- (WDClinicalOnboardingManager)initWithProfile:(id)a3;
- (WDClinicalOnboardingOAuthNavigationViewController)inFlightLoginViewController;
- (id)_deepLinkOnboardingViewControllerWithOptions:(unint64_t)a3 sourceIdentifier:(id)a4;
- (id)gatewayProxyWithActivity:(id)a3;
- (id)getPendingOnboardingGatewayAndClear;
- (void)_didDismissLoginViewController:(id)a3;
- (void)_dismissInFlightLoginViewControllerIfExistsWithCompletion:(id)a3;
- (void)_onboardWithActivity:(id)a3 gatewayProxy:(id)a4 hasGatewayBackedAccounts:(BOOL)a5 presentingViewController:(id)a6;
- (void)_presentAccount:(id)a3 presentingViewController:(id)a4 sourceIdentifier:(id)a5;
- (void)_startLoginWithLoginViewController:(id)a3 presentingViewController:(id)a4;
- (void)_startOrReplaceLoginWithLoginViewController:(id)a3 presentingViewController:(id)a4;
- (void)dealloc;
- (void)onboardWithActivity:(id)a3 presentingViewController:(id)a4;
- (void)registerInflightOnboardingViewController:(id)a3 completion:(id)a4;
- (void)setInFlightClinicalSharingLoginViewController:(id)a3;
- (void)setInFlightLoginViewController:(id)a3;
- (void)setOnboardingTileNavigationController:(id)a3;
- (void)setPendingOnboardingGateway:(id)a3;
- (void)setProfile:(id)a3;
@end

@implementation WDClinicalOnboardingManager

- (WDClinicalOnboardingManager)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (WDClinicalOnboardingManager)initWithProfile:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WDClinicalOnboardingManager;
  v5 = [(WDClinicalOnboardingManager *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_profile, v4);
  }

  return v6;
}

- (void)dealloc
{
  v3 = [(WDClinicalOnboardingManager *)self inFlightLoginViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];

  v4.receiver = self;
  v4.super_class = (Class)WDClinicalOnboardingManager;
  [(WDClinicalOnboardingManager *)&v4 dealloc];
}

- (void)onboardWithActivity:(id)a3 presentingViewController:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  _HKInitializeLogging();
  objc_super v8 = (void *)*MEMORY[0x1E4F29F38];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v10 = [(WDClinicalOnboardingManager *)self logPrefix];
    v11 = HKSensitiveLogItem();
    *(_DWORD *)buf = 138543618;
    v27 = v10;
    __int16 v28 = 2114;
    v29 = v11;
    _os_log_impl(&dword_1C21A1000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ is onboarding with activity %{public}@", buf, 0x16u);
  }
  v12 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F676C0]];
  objc_opt_class();
  v13 = HKSafeObject();

  v14 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F676E0]];
  objc_opt_class();
  v15 = HKSafeObject();

  v16 = [(WDClinicalOnboardingManager *)self gatewayProxyWithActivity:v6];
  if (v16)
  {
    v17 = [(WDClinicalOnboardingManager *)self profile];
    v18 = [v17 clinicalAccountStore];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __76__WDClinicalOnboardingManager_onboardWithActivity_presentingViewController___block_invoke;
    v20[3] = &unk_1E644AF10;
    id v21 = v16;
    v22 = self;
    id v23 = v7;
    id v24 = v15;
    id v25 = v6;
    [v18 fetchAllAccountsWithCompletion:v20];

    v19 = v21;
  }
  else
  {
    v19 = [(WDClinicalOnboardingManager *)self _deepLinkOnboardingViewControllerWithOptions:0 sourceIdentifier:v15];
    [v19 setShowProviderNotFound:1];
    [(WDClinicalOnboardingManager *)self _startOrReplaceLoginWithLoginViewController:v19 presentingViewController:v7];
  }
}

void __76__WDClinicalOnboardingManager_onboardWithActivity_presentingViewController___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__WDClinicalOnboardingManager_onboardWithActivity_presentingViewController___block_invoke_2;
  v8[3] = &unk_1E644AEE8;
  id v9 = v3;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void **)(a1 + 48);
  id v10 = v4;
  uint64_t v11 = v5;
  id v12 = v6;
  id v13 = *(id *)(a1 + 56);
  id v14 = *(id *)(a1 + 64);
  id v7 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

void __76__WDClinicalOnboardingManager_onboardWithActivity_presentingViewController___block_invoke_2(uint64_t a1)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __76__WDClinicalOnboardingManager_onboardWithActivity_presentingViewController___block_invoke_3;
  v6[3] = &unk_1E644AEC0;
  v2 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v3 = objc_msgSend(v2, "hk_firstObjectPassingTest:", v6);
  if (v3)
  {
    [*(id *)(a1 + 48) _presentAccount:v3 presentingViewController:*(void *)(a1 + 56) sourceIdentifier:*(void *)(a1 + 64)];
  }
  else
  {
    id v4 = objc_msgSend(*(id *)(a1 + 32), "hk_filter:", &__block_literal_global_3);
    uint64_t v5 = [v4 count];

    [*(id *)(a1 + 48) _onboardWithActivity:*(void *)(a1 + 72) gatewayProxy:*(void *)(a1 + 40) hasGatewayBackedAccounts:v5 != 0 presentingViewController:*(void *)(a1 + 56)];
  }
}

uint64_t __76__WDClinicalOnboardingManager_onboardWithActivity_presentingViewController___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 gateway];
  id v4 = [v3 externalID];
  uint64_t v5 = [*(id *)(a1 + 32) gatewayID];
  uint64_t v6 = [v4 isEqualToString:v5];

  return v6;
}

BOOL __76__WDClinicalOnboardingManager_onboardWithActivity_presentingViewController___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 gateway];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_onboardWithActivity:(id)a3 gatewayProxy:(id)a4 hasGatewayBackedAccounts:(BOOL)a5 presentingViewController:(id)a6
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t v13 = *MEMORY[0x1E4F676C0];
  id v14 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F676C0]];
  objc_opt_class();
  v39[6] = 0;
  v15 = HKSafeObject();
  id v16 = 0;

  if (v15)
  {
    id v38 = v12;
    id v17 = v11;
    uint64_t v18 = *MEMORY[0x1E4F676D8];
    v19 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F676D8]];
    objc_opt_class();
    v39[5] = v16;
    v20 = HKSafeObject();
    id v21 = v16;

    if (!v20)
    {
      _HKInitializeLogging();
      v26 = (void *)*MEMORY[0x1E4F29F38];
      id v11 = v17;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_ERROR))
      {
        v27 = v26;
        __int16 v28 = [(WDClinicalOnboardingManager *)self logPrefix];
        v29 = [v15 objectForKeyedSubscript:v18];
        objc_opt_class();
        uint64_t v30 = HKSensitiveLogItem();
        v31 = HKSensitiveLogItem();
        *(_DWORD *)buf = 138543874;
        v41 = v28;
        __int16 v42 = 2114;
        v43 = v30;
        __int16 v44 = 2114;
        v45 = v31;
        _os_log_error_impl(&dword_1C21A1000, v27, OS_LOG_TYPE_ERROR, "%{public}@ was not able to parse onboarding options of type %{public}@ with error %{public}@", buf, 0x20u);

        id v11 = v17;
      }
      goto LABEL_15;
    }
    v22 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F676E0]];
    objc_opt_class();
    id v23 = HKSafeObject();

    if ([v20 integerValue])
    {
      [(WDClinicalOnboardingManager *)self setPendingOnboardingGateway:v17];
      id v24 = [(WDClinicalOnboardingManager *)self _deepLinkOnboardingViewControllerWithOptions:1 sourceIdentifier:v23];
      [v24 setNavigationBarHidden:0];
    }
    else
    {
      if (!a5)
      {
        [(WDClinicalOnboardingManager *)self setPendingOnboardingGateway:v17];
        id v24 = +[HRViewControllerFactory shared];
        v32 = [(WDClinicalOnboardingManager *)self profile];
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __115__WDClinicalOnboardingManager__onboardWithActivity_gatewayProxy_hasGatewayBackedAccounts_presentingViewController___block_invoke;
        v39[3] = &unk_1E644AF38;
        v39[4] = self;
        [v24 makeAndPresentOnboardingTileViewControllerFor:v32 from:v38 sourceIdentifier:v23 animated:1 completion:v39];

        goto LABEL_14;
      }
      id v24 = [(WDClinicalOnboardingManager *)self _deepLinkOnboardingViewControllerWithOptions:0 sourceIdentifier:v23];
      [v24 setGatewayProxyToTry:v17];
    }
    [(WDClinicalOnboardingManager *)self _startOrReplaceLoginWithLoginViewController:v24 presentingViewController:v38];
LABEL_14:

    id v11 = v17;
LABEL_15:

    id v12 = v38;
    goto LABEL_16;
  }
  _HKInitializeLogging();
  id v25 = (void *)*MEMORY[0x1E4F29F38];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_ERROR))
  {
    v33 = v25;
    v34 = [(WDClinicalOnboardingManager *)self logPrefix];
    v35 = [v10 objectForKeyedSubscript:v13];
    objc_opt_class();
    v36 = HKSensitiveLogItem();
    v37 = HKSensitiveLogItem();
    *(_DWORD *)buf = 138543874;
    v41 = v34;
    __int16 v42 = 2114;
    v43 = v36;
    __int16 v44 = 2114;
    v45 = v37;
    _os_log_error_impl(&dword_1C21A1000, v33, OS_LOG_TYPE_ERROR, "%{public}@ was not able to parse onboarding activity dictionary of type %{public}@ with error %{public}@", buf, 0x20u);
  }
  id v21 = v16;
LABEL_16:
}

uint64_t __115__WDClinicalOnboardingManager__onboardWithActivity_gatewayProxy_hasGatewayBackedAccounts_presentingViewController___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setOnboardingTileNavigationController:a2];
}

- (id)_deepLinkOnboardingViewControllerWithOptions:(unint64_t)a3 sourceIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = [WDClinicalOnboardingOAuthNavigationViewController alloc];
  objc_super v8 = [(WDClinicalOnboardingManager *)self profile];
  id v9 = [(WDClinicalOnboardingOAuthNavigationViewController *)v7 initWithContext:5 onboardingOptions:a3 sourceIdentifier:v6 profile:v8 existingAccount:0];

  return v9;
}

- (id)gatewayProxyWithActivity:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x1E4F676C0];
  id v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F676C0]];
  objc_opt_class();
  id v7 = HKSafeObject();
  id v8 = 0;

  if (v7)
  {

    id v9 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F676D0]];
    objc_opt_class();
    id v10 = HKSafeObject();
    id v11 = 0;

    if (!v10)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_ERROR)) {
        -[WDClinicalOnboardingManager gatewayProxyWithActivity:]();
      }
    }

    id v12 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F676C8]];
    objc_opt_class();
    uint64_t v13 = HKSafeObject();
    id v8 = 0;

    if (v13)
    {
      if (v10)
      {
        id v14 = [[WDClinicalGatewayProxy alloc] initWithGatewayID:v10 batchID:v13];
LABEL_14:

        goto LABEL_15;
      }
    }
    else
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_ERROR)) {
        -[WDClinicalOnboardingManager gatewayProxyWithActivity:]();
      }
    }
    id v14 = 0;
    goto LABEL_14;
  }
  _HKInitializeLogging();
  v15 = (void *)*MEMORY[0x1E4F29F38];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_ERROR))
  {
    id v17 = v15;
    uint64_t v18 = [(WDClinicalOnboardingManager *)self logPrefix];
    v19 = [v4 objectForKeyedSubscript:v5];
    objc_opt_class();
    v20 = HKSensitiveLogItem();
    id v21 = HKSensitiveLogItem();
    *(_DWORD *)buf = 138543874;
    id v23 = v18;
    __int16 v24 = 2114;
    id v25 = v20;
    __int16 v26 = 2114;
    v27 = v21;
    _os_log_error_impl(&dword_1C21A1000, v17, OS_LOG_TYPE_ERROR, "%{public}@ was not able to fetch onboarding activity dictionary of type %{public}@ with error %{public}@", buf, 0x20u);
  }
  id v14 = 0;
LABEL_15:

  return v14;
}

- (void)_presentAccount:(id)a3 presentingViewController:(id)a4 sourceIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v11 = +[HRViewControllerFactory shared];
  id v12 = [(WDClinicalOnboardingManager *)self profile];
  id v16 = [v11 makeAccountDetailViewControllerForAccount:v10 profile:v12 sourceIdentifier:v8];

  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:v16 action:sel_dismissAnimated_];
  id v14 = [v16 navigationItem];
  [v14 setRightBarButtonItem:v13];

  v15 = (void *)[objc_alloc(MEMORY[0x1E4F67B78]) initWithRootViewController:v16];
  [v9 presentViewController:v15 animated:1 completion:0];
}

- (void)registerInflightOnboardingViewController:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __83__WDClinicalOnboardingManager_registerInflightOnboardingViewController_completion___block_invoke;
  v10[3] = &unk_1E644AF60;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(WDClinicalOnboardingManager *)self _dismissInFlightLoginViewControllerIfExistsWithCompletion:v10];
}

void __83__WDClinicalOnboardingManager_registerInflightOnboardingViewController_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = (void *)*MEMORY[0x1E4F29F38];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_DEBUG)) {
    __83__WDClinicalOnboardingManager_registerInflightOnboardingViewController_completion___block_invoke_cold_1(a1, v4);
  }
  [*(id *)(a1 + 32) setInFlightLoginViewController:*(void *)(a1 + 40)];
  uint64_t v5 = [*(id *)(a1 + 32) onboardingTileNavigationController];
  id v6 = [*(id *)(a1 + 32) inFlightLoginViewController];
  [v6 setOnboardingTileNavigationViewController:v5];

  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

- (void)_startOrReplaceLoginWithLoginViewController:(id)a3 presentingViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __100__WDClinicalOnboardingManager__startOrReplaceLoginWithLoginViewController_presentingViewController___block_invoke;
  v10[3] = &unk_1E644AF88;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(WDClinicalOnboardingManager *)self _dismissInFlightLoginViewControllerIfExistsWithCompletion:v10];
}

uint64_t __100__WDClinicalOnboardingManager__startOrReplaceLoginWithLoginViewController_presentingViewController___block_invoke(void *a1, uint64_t a2)
{
  id v3 = (void *)a1[4];
  if (!a2) {
    a2 = a1[6];
  }
  return [v3 _startLoginWithLoginViewController:a1[5] presentingViewController:a2];
}

- (void)_startLoginWithLoginViewController:(id)a3 presentingViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_DEBUG)) {
    -[WDClinicalOnboardingManager _startLoginWithLoginViewController:presentingViewController:]();
  }
  [(WDClinicalOnboardingManager *)self setInFlightLoginViewController:v6];
  [v7 presentViewController:v6 animated:1 completion:0];
}

- (void)_dismissInFlightLoginViewControllerIfExistsWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WDClinicalOnboardingManager *)self inFlightLoginViewController];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 presentingViewController];
    if (v7)
    {
      id v8 = (void *)v7;
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_DEBUG)) {
        -[WDClinicalOnboardingManager _dismissInFlightLoginViewControllerIfExistsWithCompletion:]();
      }
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __89__WDClinicalOnboardingManager__dismissInFlightLoginViewControllerIfExistsWithCompletion___block_invoke;
      v10[3] = &unk_1E644AFB0;
      v10[4] = self;
      id v11 = v6;
      id v12 = v8;
      id v13 = v4;
      id v9 = v8;
      [v9 dismissViewControllerAnimated:1 completion:v10];

      goto LABEL_9;
    }
    [(WDClinicalOnboardingManager *)self setInFlightLoginViewController:0];
  }
  if (v4) {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
LABEL_9:
}

uint64_t __89__WDClinicalOnboardingManager__dismissInFlightLoginViewControllerIfExistsWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _didDismissLoginViewController:*(void *)(a1 + 40)];
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_didDismissLoginViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(WDClinicalOnboardingManager *)self inFlightLoginViewController];

  if (v5 == v4)
  {
    [(WDClinicalOnboardingManager *)self setInFlightLoginViewController:0];
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_DEBUG)) {
      -[WDClinicalOnboardingManager _didDismissLoginViewController:]();
    }
  }
}

- (id)getPendingOnboardingGatewayAndClear
{
  id v3 = self->_pendingOnboardingGateway;
  pendingOnboardingGateway = self->_pendingOnboardingGateway;
  self->_pendingOnboardingGateway = 0;

  return v3;
}

- (HRProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  return (HRProfile *)WeakRetained;
}

- (void)setProfile:(id)a3
{
}

- (WDClinicalGatewayProxy)pendingOnboardingGateway
{
  return self->_pendingOnboardingGateway;
}

- (void)setPendingOnboardingGateway:(id)a3
{
}

- (WDClinicalOnboardingOAuthNavigationViewController)inFlightLoginViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inFlightLoginViewController);
  return (WDClinicalOnboardingOAuthNavigationViewController *)WeakRetained;
}

- (void)setInFlightLoginViewController:(id)a3
{
}

- (HKNavigationController)inFlightClinicalSharingLoginViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inFlightClinicalSharingLoginViewController);
  return (HKNavigationController *)WeakRetained;
}

- (void)setInFlightClinicalSharingLoginViewController:(id)a3
{
}

- (HKNavigationController)onboardingTileNavigationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_onboardingTileNavigationController);
  return (HKNavigationController *)WeakRetained;
}

- (void)setOnboardingTileNavigationController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_onboardingTileNavigationController);
  objc_destroyWeak((id *)&self->_inFlightClinicalSharingLoginViewController);
  objc_destroyWeak((id *)&self->_inFlightLoginViewController);
  objc_storeStrong((id *)&self->_pendingOnboardingGateway, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)gatewayProxyWithActivity:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  id v2 = v1;
  id v3 = [(id)OUTLINED_FUNCTION_1_0() logPrefix];
  id v4 = HKSensitiveLogItem();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1C21A1000, v5, v6, "%{public}@ tried to onboard using a deep link with no batch ID and found error: %{public}@", v7, v8, v9, v10, v11);
}

- (void)gatewayProxyWithActivity:.cold.2()
{
  OUTLINED_FUNCTION_4_0();
  id v2 = v1;
  id v3 = [(id)OUTLINED_FUNCTION_1_0() logPrefix];
  id v4 = HKSensitiveLogItem();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1C21A1000, v5, v6, "%{public}@ tried to onboard using a deep link with no gateway ID and found error: %{public}@", v7, v8, v9, v10, v11);
}

void __83__WDClinicalOnboardingManager_registerInflightOnboardingViewController_completion___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [(id)OUTLINED_FUNCTION_1_0() logPrefix];
  OUTLINED_FUNCTION_0_0(&dword_1C21A1000, v5, v6, "%{public}@ registering in-flight login view controller %{public}@", v7, v8, v9, v10, 2u);
}

- (void)_startLoginWithLoginViewController:presentingViewController:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  id v2 = v1;
  id v3 = [(id)OUTLINED_FUNCTION_1_0() logPrefix];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_1C21A1000, v4, v5, "%{public}@ starting login with login view controller %{public}@", v6, v7, v8, v9, v10);
}

- (void)_dismissInFlightLoginViewControllerIfExistsWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  id v2 = v1;
  id v3 = [(id)OUTLINED_FUNCTION_1_0() logPrefix];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_1C21A1000, v4, v5, "%{public}@ dismissing in-flight login view controller %{public}@", v6, v7, v8, v9, v10);
}

- (void)_didDismissLoginViewController:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = v3;
  uint64_t v5 = [(id)OUTLINED_FUNCTION_1_0() logPrefix];
  uint64_t v6 = [v1 inFlightLoginViewController];
  int v7 = 138543874;
  uint64_t v8 = v5;
  __int16 v9 = 2114;
  uint64_t v10 = v0;
  __int16 v11 = 2114;
  id v12 = v6;
  _os_log_debug_impl(&dword_1C21A1000, v2, OS_LOG_TYPE_DEBUG, "%{public}@ did dismiss login view controller %{public}@ different from in-flight login view controller %{public}@", (uint8_t *)&v7, 0x20u);
}

@end