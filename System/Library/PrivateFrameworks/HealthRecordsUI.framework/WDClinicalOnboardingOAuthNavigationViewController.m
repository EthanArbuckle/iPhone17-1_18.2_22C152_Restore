@interface WDClinicalOnboardingOAuthNavigationViewController
- (BOOL)onboardingSourceIsDeepLink;
- (BOOL)showProviderNotFound;
- (ClinicalSharingOnboardingDelegate)onboardingDelegate;
- (HKClinicalAccount)onboardingAccount;
- (HKClinicalProvider)providerToPresent;
- (HKNavigationController)onboardingTileNavigationViewController;
- (HRProfile)profile;
- (WDClinicalAccountOnboardingSession)onboardingSession;
- (WDClinicalGatewayProxy)gatewayProxyToTry;
- (WDClinicalOnboardingOAuthNavigationViewController)init;
- (WDClinicalOnboardingOAuthNavigationViewController)initWithContext:(int64_t)a3 onboardingOptions:(unint64_t)a4 sourceIdentifier:(id)a5 profile:(id)a6 existingAccount:(id)a7;
- (WDClinicalOnboardingOAuthNavigationViewController)initWithSession:(id)a3 existingAccount:(id)a4;
- (id)_createInitialRootViewController;
- (id)keyCommands;
- (unint64_t)supportedInterfaceOrientations;
- (void)_clearLoginBusyIndicator;
- (void)_dismissViewController;
- (void)_mainQueue_completionNotificationHandler:(id)a3;
- (void)beginListeningToNotification;
- (void)completionNotificationHandler:(id)a3;
- (void)createRootViewController;
- (void)didCompleteOnboardingFor:(id)a3;
- (void)didLoginToAccount:(id)a3;
- (void)dismissWithAccount:(id)a3 error:(id)a4 animated:(BOOL)a5;
- (void)setGatewayProxyToTry:(id)a3;
- (void)setOnboardingDelegate:(id)a3;
- (void)setOnboardingSourceIsDeepLink:(BOOL)a3;
- (void)setOnboardingTileNavigationViewController:(id)a3;
- (void)setProviderToPresent:(id)a3;
- (void)setShowProviderNotFound:(BOOL)a3;
- (void)stopListeningToNotification;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation WDClinicalOnboardingOAuthNavigationViewController

- (WDClinicalOnboardingOAuthNavigationViewController)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (WDClinicalOnboardingOAuthNavigationViewController)initWithContext:(int64_t)a3 onboardingOptions:(unint64_t)a4 sourceIdentifier:(id)a5 profile:(id)a6 existingAccount:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  v15 = [WDClinicalAccountOnboardingSession alloc];
  v16 = +[CHRAnalyticsManager shared];
  v17 = [(WDClinicalAccountOnboardingSession *)v15 initWithContext:a3 options:a4 sourceIdentifier:v14 profile:v13 analyticsManager:v16];

  v18 = [(WDClinicalOnboardingOAuthNavigationViewController *)self initWithSession:v17 existingAccount:v12];
  return v18;
}

- (WDClinicalOnboardingOAuthNavigationViewController)initWithSession:(id)a3 existingAccount:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WDClinicalOnboardingOAuthNavigationViewController;
  v9 = [(WDClinicalOnboardingOAuthNavigationViewController *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_onboardingSession, a3);
    uint64_t v11 = [v8 copy];
    onboardingAccount = v10->_onboardingAccount;
    v10->_onboardingAccount = (HKClinicalAccount *)v11;

    [(WDClinicalOnboardingOAuthNavigationViewController *)v10 setModalPresentationStyle:2];
  }

  return v10;
}

- (HRProfile)profile
{
  return [(WDClinicalAccountOnboardingSession *)self->_onboardingSession profile];
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)WDClinicalOnboardingOAuthNavigationViewController;
  [(HKNavigationController *)&v7 viewDidLoad];
  v3 = +[HRProfileManager sharedInstance];
  uint64_t v4 = [(WDClinicalOnboardingOAuthNavigationViewController *)self profile];
  v5 = [v4 healthStore];
  v6 = [v5 profileIdentifier];
  [v3 switchCurrentProfileWithIdentifier:v6];

  [(WDClinicalOnboardingOAuthNavigationViewController *)self createRootViewController];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WDClinicalOnboardingOAuthNavigationViewController;
  [(HKNavigationController *)&v4 viewDidAppear:a3];
  [(WDClinicalOnboardingOAuthNavigationViewController *)self beginListeningToNotification];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)WDClinicalOnboardingOAuthNavigationViewController;
  -[WDClinicalOnboardingOAuthNavigationViewController viewWillDisappear:](&v5, sel_viewWillDisappear_);
  if (([(WDClinicalOnboardingOAuthNavigationViewController *)self isMovingFromParentViewController] & 1) != 0|| [(WDClinicalOnboardingOAuthNavigationViewController *)self isBeingDismissed])
  {
    [(WDClinicalAccountOnboardingSession *)self->_onboardingSession onboardingWillDisappearWith:self->_onboardingTileNavigationViewController animated:v3];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(WDClinicalOnboardingOAuthNavigationViewController *)self stopListeningToNotification];
  v5.receiver = self;
  v5.super_class = (Class)WDClinicalOnboardingOAuthNavigationViewController;
  [(HKNavigationController *)&v5 viewDidDisappear:v3];
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (id)keyCommands
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:*MEMORY[0x1E4FB2B08] modifierFlags:0 action:sel__dismissViewController];
  v5[0] = v2;
  BOOL v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (void)beginListeningToNotification
{
  [(WDClinicalOnboardingOAuthNavigationViewController *)self stopListeningToNotification];
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  BOOL v3 = [MEMORY[0x1E4F28EA0] OAuthCompletionNotification];
  [v4 addObserver:self selector:sel_completionNotificationHandler_ name:v3 object:0];
}

- (void)stopListeningToNotification
{
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  BOOL v3 = [MEMORY[0x1E4F28EA0] OAuthCompletionNotification];
  [v4 removeObserver:self name:v3 object:0];
}

- (void)completionNotificationHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __83__WDClinicalOnboardingOAuthNavigationViewController_completionNotificationHandler___block_invoke;
  v6[3] = &unk_1E644ADD8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __83__WDClinicalOnboardingOAuthNavigationViewController_completionNotificationHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mainQueue_completionNotificationHandler:", *(void *)(a1 + 40));
}

- (void)_mainQueue_completionNotificationHandler:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  _HKInitializeLogging();
  id v5 = (NSObject **)MEMORY[0x1E4F29F38];
  v6 = *MEMORY[0x1E4F29F38];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138543362;
    v18 = self;
    _os_log_impl(&dword_1C21A1000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: got notified by OAuthCompletionNotification", (uint8_t *)&v17, 0xCu);
  }
  id v7 = [v4 userInfo];
  id v8 = +[OAuthCompletionNotificationUserInfoKeys account];
  v9 = [v7 objectForKeyedSubscript:v8];

  v10 = [v4 userInfo];

  uint64_t v11 = +[OAuthCompletionNotificationUserInfoKeys error];
  id v12 = [v10 objectForKeyedSubscript:v11];

  if (v9)
  {
    [(WDClinicalOnboardingOAuthNavigationViewController *)self didLoginToAccount:v9];
  }
  else
  {
    [(WDClinicalOnboardingOAuthNavigationViewController *)self _clearLoginBusyIndicator];
    _HKInitializeLogging();
    id v13 = *v5;
    objc_super v14 = *v5;
    if (v12)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[WDClinicalOnboardingOAuthNavigationViewController _mainQueue_completionNotificationHandler:]((uint64_t)self, v13);
      }
      v15 = +[HRViewControllerFactory shared];
      v16 = [v15 makeFailedToOnboardAccountAlertControllerToGateway:0 error:v12];

      [(WDClinicalOnboardingOAuthNavigationViewController *)self presentViewController:v16 animated:1 completion:0];
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138543362;
      v18 = self;
      _os_log_impl(&dword_1C21A1000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: user aborted login (neither account nor error in the notification)", (uint8_t *)&v17, 0xCu);
    }
  }
}

- (void)createRootViewController
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(WDClinicalOnboardingOAuthNavigationViewController *)self _createInitialRootViewController];
  _HKInitializeLogging();
  id v4 = *MEMORY[0x1E4F29F38];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v8 = self;
    __int16 v9 = 2114;
    v10 = v3;
    _os_log_impl(&dword_1C21A1000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: created initial root view controller %{public}@", buf, 0x16u);
  }
  v6 = v3;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v6 count:1];
  [(WDClinicalOnboardingOAuthNavigationViewController *)self setViewControllers:v5];
}

- (id)_createInitialRootViewController
{
  if (self->_providerToPresent)
  {
    BOOL v3 = [WDClinicalProviderDetailsViewController alloc];
    id v4 = [(WDClinicalOnboardingOAuthNavigationViewController *)self profile];
    id v5 = [(WDClinicalOnboardingOAuthNavigationViewController *)self providerToPresent];
    v6 = [(WDClinicalProviderDetailsViewController *)v3 initWithProfile:v4 provider:v5];

    id v7 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel__dismissViewController];
    id v8 = [(OBBaseWelcomeController *)v6 navigationItem];
    [v8 setLeftBarButtonItem:v7];
  }
  else
  {
    if ([(WDClinicalAccountOnboardingSession *)self->_onboardingSession shouldLaunchClinicalSharing])
    {
      onboardingAccount = self->_onboardingAccount;
      if (onboardingAccount)
      {
        if ([(HKClinicalAccount *)onboardingAccount needsLoginToEnableClinicalSharing])
        {
          uint64_t v10 = 1;
        }
        else
        {
          uint64_t v10 = 2;
        }
      }
      else
      {
        uint64_t v10 = 0;
      }
      v6 = [[HRClinicalSharingOnboardingInformationalViewController alloc] initWithOnboardingSession:self->_onboardingSession flowType:v10 selectedAccount:self->_onboardingAccount delegate:self];
      goto LABEL_15;
    }
    uint64_t v11 = [(WDClinicalOnboardingOAuthNavigationViewController *)self gatewayProxyToTry];

    id v12 = [WDClinicalOnboardingViewController alloc];
    id v13 = [(WDClinicalOnboardingOAuthNavigationViewController *)self profile];
    if (v11)
    {
      objc_super v14 = [(WDClinicalOnboardingOAuthNavigationViewController *)self gatewayProxyToTry];
      v6 = [(WDClinicalOnboardingViewController *)v12 initWithProfile:v13 gatewayProxy:v14];

      [(WDClinicalOnboardingOAuthNavigationViewController *)self setGatewayProxyToTry:0];
    }
    else
    {
      v6 = [(WDClinicalOnboardingViewController *)v12 initWithProfile:v13];

      [(HRClinicalSharingOnboardingInformationalViewController *)v6 setShowProviderNotFound:[(WDClinicalOnboardingOAuthNavigationViewController *)self showProviderNotFound]];
    }
    id v7 = [(OBBaseWelcomeController *)v6 navigationItem];
    [v7 setLargeTitleDisplayMode:2];
  }

LABEL_15:
  return v6;
}

- (void)_clearLoginBusyIndicator
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(WDClinicalOnboardingOAuthNavigationViewController *)self topViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  _HKInitializeLogging();
  id v5 = *MEMORY[0x1E4F29F38];
  BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_INFO);
  if (isKindOfClass)
  {
    if (v6)
    {
      int v7 = 138543618;
      id v8 = self;
      __int16 v9 = 2114;
      uint64_t v10 = v3;
      _os_log_impl(&dword_1C21A1000, v5, OS_LOG_TYPE_INFO, "%{public}@: finished login, clearing busy indicator from %{public}@", (uint8_t *)&v7, 0x16u);
    }
    [v3 clearLoginBusyIndicator];
  }
  else if (v6)
  {
    int v7 = 138543618;
    id v8 = self;
    __int16 v9 = 2114;
    uint64_t v10 = v3;
    _os_log_impl(&dword_1C21A1000, v5, OS_LOG_TYPE_INFO, "%{public}@: finished login but top view controller is %{public}@, not , unable to clear busy indicator", (uint8_t *)&v7, 0x16u);
  }
}

- (void)didLoginToAccount:(id)a3
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!-[WDClinicalAccountOnboardingSession shouldLaunchClinicalSharing](self->_onboardingSession, "shouldLaunchClinicalSharing")|| ([v4 gateway], id v5 = objc_claimAutoreleasedReturnValue(), v6 = objc_msgSend(v5, "canEnableSharingToProvider"), v5, !v6))
  {
    uint64_t v10 = [[WDClinicalAccountAddedViewController alloc] initWithOnboardingSession:self->_onboardingSession account:v4];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __71__WDClinicalOnboardingOAuthNavigationViewController_didLoginToAccount___block_invoke;
    v35[3] = &unk_1E644ADD8;
    v35[4] = self;
    id v11 = v4;
    id v36 = v11;
    [(WDClinicalAccountAddedViewController *)v10 setDismissHandler:v35];
    if ([v11 canEnableSharingToProvider])
    {
      int v12 = [v11 hasClinicalSharingScopes];
      _HKInitializeLogging();
      id v13 = *MEMORY[0x1E4F29F38];
      BOOL v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_DEFAULT);
      if (v12)
      {
        if (v14)
        {
          *(_DWORD *)buf = 138543362;
          v39 = self;
          _os_log_impl(&dword_1C21A1000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: did log in but may proceed to clinical sharing, not storing account just yet", buf, 0xCu);
        }
        v42 = v10;
        v15 = (void *)MEMORY[0x1E4F1C978];
        v16 = &v42;
        goto LABEL_22;
      }
      if (v14)
      {
        *(_DWORD *)buf = 138543362;
        v39 = self;
        _os_log_impl(&dword_1C21A1000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: did log in to a gateway supporting clinical sharing, but don't have the necessary scopes, proceeding as if logging in to a non-clinical-sharing gateway", buf, 0xCu);
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      _HKInitializeLogging();
      int v17 = (void *)*MEMORY[0x1E4F29F38];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_DEFAULT))
      {
        onboardingSession = self->_onboardingSession;
        uint64_t v19 = v17;
        v20 = [(WDClinicalAccountOnboardingSession *)onboardingSession profile];
        v21 = [v20 clinicalAccountStore];
        *(_DWORD *)buf = 138543618;
        v39 = self;
        __int16 v40 = 2114;
        v41 = v21;
        _os_log_impl(&dword_1C21A1000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: did log in, persisting account and kicking off ingestion on %{public}@", buf, 0x16u);
      }
      v22 = self->_onboardingSession;
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __71__WDClinicalOnboardingOAuthNavigationViewController_didLoginToAccount___block_invoke_308;
      v33[3] = &unk_1E644B540;
      v33[4] = self;
      v34 = v10;
      [(WDClinicalAccountOnboardingSession *)v22 persistEphemeralAccount:v11 fromSharing:0 completion:v33];

      goto LABEL_26;
    }
    v23 = [v11 gateway];
    v24 = [v23 baseURL];
    v25 = [v24 absoluteString];
    int v26 = [v25 isEqualToString:@"https://localhost:9090/resource"];

    _HKInitializeLogging();
    v27 = *MEMORY[0x1E4F29F38];
    BOOL v28 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_DEFAULT);
    if (!v26)
    {
      if (v28)
      {
        *(_DWORD *)buf = 138543362;
        v39 = self;
        _os_log_impl(&dword_1C21A1000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: account re-logged in. How did you get here? File a Radar to CHR Ingest & Extract if you see me!", buf, 0xCu);
      }
      [(WDClinicalOnboardingOAuthNavigationViewController *)self dismissWithAccount:v11 error:0 animated:1];
      goto LABEL_26;
    }
    if (v28)
    {
      *(_DWORD *)buf = 138543362;
      v39 = self;
      _os_log_impl(&dword_1C21A1000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: static sample account added", buf, 0xCu);
    }
    v29 = self->_onboardingSession;
    v30 = [v11 identifier];
    [(WDClinicalAccountOnboardingSession *)v29 didAddStaticSampleAccount:v30];

    v37 = v10;
    v15 = (void *)MEMORY[0x1E4F1C978];
    v16 = &v37;
LABEL_22:
    v31 = [v15 arrayWithObjects:v16 count:1];
    [(WDClinicalOnboardingOAuthNavigationViewController *)self setViewControllers:v31 animated:1];

LABEL_26:
    goto LABEL_31;
  }
  char v7 = [v4 hasClinicalSharingScopes];
  _HKInitializeLogging();
  id v8 = *MEMORY[0x1E4F29F38];
  __int16 v9 = *MEMORY[0x1E4F29F38];
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v39 = self;
      _os_log_impl(&dword_1C21A1000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: did log in but onboarding for clinical sharing, not storing account just yet", buf, 0xCu);
    }
    uint64_t v10 = [(WDClinicalAccountOnboardingSession *)self->_onboardingSession makeDataTypeSelectionViewControllerForAccount:v4];
    [(WDClinicalAccountOnboardingSession *)self->_onboardingSession submitClinicalSharingOnboardingStepAnalytic:2];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[WDClinicalOnboardingOAuthNavigationViewController didLoginToAccount:]((uint64_t)self, v8);
    }
    uint64_t v10 = [(WDClinicalAccountOnboardingSession *)self->_onboardingSession makeNecessaryScopesNotPresentViewControllerForAccount:v4];
  }
  v43[0] = v10;
  v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:1];
  [(WDClinicalOnboardingOAuthNavigationViewController *)self setViewControllers:v32 animated:1];

LABEL_31:
}

uint64_t __71__WDClinicalOnboardingOAuthNavigationViewController_didLoginToAccount___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissWithAccount:*(void *)(a1 + 40) error:0 animated:1];
}

void __71__WDClinicalOnboardingOAuthNavigationViewController_didLoginToAccount___block_invoke_308(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__WDClinicalOnboardingOAuthNavigationViewController_didLoginToAccount___block_invoke_2;
  v11[3] = &unk_1E644A710;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(a1 + 40);
  id v12 = v5;
  uint64_t v13 = v7;
  id v14 = v8;
  id v15 = v6;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v11);
}

void __71__WDClinicalOnboardingOAuthNavigationViewController_didLoginToAccount___block_invoke_2(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    v2 = *(void **)(a1 + 40);
    v8[0] = *(void *)(a1 + 48);
    BOOL v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    [v2 setViewControllers:v3 animated:1];
  }
  else
  {
    _HKInitializeLogging();
    id v4 = (void *)*MEMORY[0x1E4F29F38];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_ERROR)) {
      __71__WDClinicalOnboardingOAuthNavigationViewController_didLoginToAccount___block_invoke_2_cold_1(a1, v4);
    }
    id v5 = +[HRViewControllerFactory shared];
    id v6 = v5;
    if (*(void *)(a1 + 56))
    {
      BOOL v3 = objc_msgSend(v5, "makeFailedToOnboardAccountAlertControllerToGateway:error:", 0);
    }
    else
    {
      uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:userInfo:", 0);
      BOOL v3 = [v6 makeFailedToOnboardAccountAlertControllerToGateway:0 error:v7];
    }
    [*(id *)(a1 + 40) presentViewController:v3 animated:1 completion:0];
  }
}

- (void)dismissWithAccount:(id)a3 error:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  v23[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    id v10 = +[ClinicalAccountOnboardingCompletionNotificationUserInfoKeys error];
    v22 = v10;
    v23[0] = v9;
    id v11 = (void *)MEMORY[0x1E4F1C9E8];
    id v12 = (id *)v23;
    uint64_t v13 = &v22;
  }
  else
  {
    if (!v8)
    {
      id v14 = 0;
      goto LABEL_6;
    }
    id v10 = +[ClinicalAccountOnboardingCompletionNotificationUserInfoKeys account];
    v20 = v10;
    id v21 = v8;
    id v11 = (void *)MEMORY[0x1E4F1C9E8];
    id v12 = &v21;
    uint64_t v13 = &v20;
  }
  id v14 = [v11 dictionaryWithObjects:v12 forKeys:v13 count:1];

LABEL_6:
  id v15 = (void *)MEMORY[0x1E4F28EA0];
  v16 = [MEMORY[0x1E4F28EA0] ClinicalAccountOnboardingCompletionNotification];
  int v17 = [v15 notificationWithName:v16 object:self userInfo:v14];

  v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v18 postNotification:v17];

  [(WDClinicalAccountOnboardingSession *)self->_onboardingSession markShouldDismissOnboardingTileViewController];
  uint64_t v19 = [(WDClinicalOnboardingOAuthNavigationViewController *)self presentingViewController];
  [v19 dismissViewControllerAnimated:v5 completion:0];
}

- (void)_dismissViewController
{
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 7, @"User Cancelled");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(WDClinicalOnboardingOAuthNavigationViewController *)self dismissWithAccount:0 error:v3 animated:1];
}

- (void)didCompleteOnboardingFor:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  BOOL v5 = (void *)*MEMORY[0x1E4F29F38];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_onboardingDelegate);
    int v9 = 138543874;
    id v10 = self;
    __int16 v11 = 2112;
    id v12 = v4;
    __int16 v13 = 2112;
    id v14 = WeakRetained;
    _os_log_impl(&dword_1C21A1000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: didCompleteOnboardingFor %@ _onboardingDelegate %@", (uint8_t *)&v9, 0x20u);
  }
  id v8 = objc_loadWeakRetained((id *)&self->_onboardingDelegate);
  [v8 didAddAccount:v4];
}

- (ClinicalSharingOnboardingDelegate)onboardingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_onboardingDelegate);
  return (ClinicalSharingOnboardingDelegate *)WeakRetained;
}

- (void)setOnboardingDelegate:(id)a3
{
}

- (HKClinicalProvider)providerToPresent
{
  return self->_providerToPresent;
}

- (void)setProviderToPresent:(id)a3
{
}

- (WDClinicalGatewayProxy)gatewayProxyToTry
{
  return self->_gatewayProxyToTry;
}

- (void)setGatewayProxyToTry:(id)a3
{
}

- (BOOL)showProviderNotFound
{
  return self->_showProviderNotFound;
}

- (void)setShowProviderNotFound:(BOOL)a3
{
  self->_showProviderNotFound = a3;
}

- (BOOL)onboardingSourceIsDeepLink
{
  return self->_onboardingSourceIsDeepLink;
}

- (void)setOnboardingSourceIsDeepLink:(BOOL)a3
{
  self->_onboardingSourceIsDeepLink = a3;
}

- (HKNavigationController)onboardingTileNavigationViewController
{
  return self->_onboardingTileNavigationViewController;
}

- (void)setOnboardingTileNavigationViewController:(id)a3
{
  self->_onboardingTileNavigationViewController = (HKNavigationController *)a3;
}

- (WDClinicalAccountOnboardingSession)onboardingSession
{
  return self->_onboardingSession;
}

- (HKClinicalAccount)onboardingAccount
{
  return self->_onboardingAccount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onboardingAccount, 0);
  objc_storeStrong((id *)&self->_onboardingSession, 0);
  objc_storeStrong((id *)&self->_gatewayProxyToTry, 0);
  objc_storeStrong((id *)&self->_providerToPresent, 0);
  objc_destroyWeak((id *)&self->_onboardingDelegate);
}

- (void)_mainQueue_completionNotificationHandler:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HKSensitiveLogItem();
  int v5 = 138543618;
  uint64_t v6 = a1;
  __int16 v7 = 2114;
  id v8 = v4;
  _os_log_error_impl(&dword_1C21A1000, v3, OS_LOG_TYPE_ERROR, "%{public}@: login failed with error: %{public}@", (uint8_t *)&v5, 0x16u);
}

- (void)didLoginToAccount:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C21A1000, a2, OS_LOG_TYPE_ERROR, "%{public}@: did log in for clinical sharing but do not have the necessary scopes", (uint8_t *)&v2, 0xCu);
}

void __71__WDClinicalOnboardingOAuthNavigationViewController_didLoginToAccount___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = a2;
  uint64_t v4 = HKSensitiveLogItem();
  int v5 = 138543618;
  uint64_t v6 = v2;
  __int16 v7 = 2114;
  id v8 = v4;
  _os_log_error_impl(&dword_1C21A1000, v3, OS_LOG_TYPE_ERROR, "%{public}@: persisting account failed with error: %{public}@", (uint8_t *)&v5, 0x16u);
}

@end