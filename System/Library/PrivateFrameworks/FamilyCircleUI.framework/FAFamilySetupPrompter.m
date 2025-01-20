@interface FAFamilySetupPrompter
- (FAFamilySetupPrompter)init;
- (FAFamilySetupPrompter)initWithiTunesAccount:(id)a3;
- (FAFamilySetupPrompterDelegate)delegate;
- (void)_goToFamilySetup;
- (void)_goToInvitations;
- (void)_handleFamilyEligibilityResponse:(id)a3 isFirstRun:(BOOL)a4;
- (void)_showConfirmationForStartingFamilySetup;
- (void)_showConfirmationForStartingFamilySetupWithPendingInvite;
- (void)_showPendingInvitesDialog;
- (void)_showUnderageAlertWithEligibilityResponse:(id)a3;
- (void)_startFamilySetupFlowWithEligibilityResponse:(id)a3;
- (void)dealloc;
- (void)familySetupViewController:(id)a3 didCompleteWithSuccess:(BOOL)a4;
- (void)promptIfEligibleWithPresentingViewController:(id)a3 isFirstRun:(BOOL)a4;
- (void)setDelegate:(id)a3;
@end

@implementation FAFamilySetupPrompter

- (FAFamilySetupPrompter)init
{
  return [(FAFamilySetupPrompter *)self initWithiTunesAccount:0];
}

- (FAFamilySetupPrompter)initWithiTunesAccount:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FAFamilySetupPrompter;
  v6 = [(FAFamilySetupPrompter *)&v12 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x263EFB210] defaultStore];
    accountStore = v6->_accountStore;
    v6->_accountStore = (ACAccountStore *)v7;

    v9 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    networkingQueue = v6->_networkingQueue;
    v6->_networkingQueue = v9;

    objc_storeStrong((id *)&v6->_iTunesAccount, a3);
    v6->_isRequestInFlight = 0;
  }

  return v6;
}

- (void)dealloc
{
  [(NSOperationQueue *)self->_networkingQueue cancelAllOperations];
  v3.receiver = self;
  v3.super_class = (Class)FAFamilySetupPrompter;
  [(FAFamilySetupPrompter *)&v3 dealloc];
}

- (void)promptIfEligibleWithPresentingViewController:(id)a3 isFirstRun:(BOOL)a4
{
  if (self->_isRequestInFlight)
  {
    v4 = _AALogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2189F0000, v4, OS_LOG_TYPE_DEFAULT, "We already have a prompt request in progress.", buf, 2u);
    }
  }
  else
  {
    objc_storeWeak((id *)&self->_presentingViewController, a3);
    self->_isRequestInFlight = 1;
    uint64_t v7 = dispatch_get_global_queue(25, 0);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __81__FAFamilySetupPrompter_promptIfEligibleWithPresentingViewController_isFirstRun___block_invoke;
    v8[3] = &unk_264348E30;
    v8[4] = self;
    BOOL v9 = a4;
    dispatch_async(v7, v8);
  }
}

void __81__FAFamilySetupPrompter_promptIfEligibleWithPresentingViewController_isFirstRun___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 16))
  {
    uint64_t v3 = objc_msgSend(*(id *)(v2 + 8), "aa_primaryAppleAccount");
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v3;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  if (!*(void *)(v2 + 24))
  {
    uint64_t v6 = objc_msgSend(*(id *)(v2 + 8), "aa_grandSlamAccountForiCloudAccount:", *(void *)(v2 + 16));
    uint64_t v7 = *(void *)(a1 + 32);
    v8 = *(void **)(v7 + 24);
    *(void *)(v7 + 24) = v6;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  if (!*(void *)(v2 + 32))
  {
    BOOL v9 = objc_msgSend(MEMORY[0x263EFB210], "ams_sharedAccountStore");
    uint64_t v10 = objc_msgSend(v9, "ams_activeiTunesAccount");
    uint64_t v11 = *(void *)(a1 + 32);
    objc_super v12 = *(void **)(v11 + 32);
    *(void *)(v11 + 32) = v10;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  if (*(void *)(v2 + 16))
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __81__FAFamilySetupPrompter_promptIfEligibleWithPresentingViewController_isFirstRun___block_invoke_2;
    aBlock[3] = &unk_264348B20;
    aBlock[4] = v2;
    v13 = _Block_copy(aBlock);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __81__FAFamilySetupPrompter_promptIfEligibleWithPresentingViewController_isFirstRun___block_invoke_3;
    v23[3] = &unk_26434A0A0;
    v23[4] = *(void *)(a1 + 32);
    char v24 = *(unsigned char *)(a1 + 40);
    v14 = _Block_copy(v23);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __81__FAFamilySetupPrompter_promptIfEligibleWithPresentingViewController_isFirstRun___block_invoke_4;
    v20[3] = &unk_264349B98;
    v20[4] = *(void *)(a1 + 32);
    id v21 = v13;
    id v22 = v14;
    id v15 = v14;
    WeakRetained = v13;
    v17 = _Block_copy(v20);
    WeakRetained[2](WeakRetained, v17);
  }
  else
  {
    v18 = _AALogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_2189F0000, v18, OS_LOG_TYPE_DEFAULT, "No primary iCloud account found on device! Will not prompt for Family Setup.", v19, 2u);
    }

    WeakRetained = (void (**)(id, void *))objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
    [WeakRetained familySetupPrompterDidFinish:*(void *)(a1 + 32)];
  }
}

void __81__FAFamilySetupPrompter_promptIfEligibleWithPresentingViewController_isFirstRun___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = (objc_class *)MEMORY[0x263F25858];
  id v4 = a2;
  id v6 = (id)[[v3 alloc] initWithAppleAccount:*(void *)(*(void *)(a1 + 32) + 16) grandSlamAccount:*(void *)(*(void *)(a1 + 32) + 24) accountStore:*(void *)(*(void *)(a1 + 32) + 8)];
  [v6 setITunesAccount:*(void *)(*(void *)(a1 + 32) + 32)];
  id v5 = (void *)[objc_alloc(MEMORY[0x263F25938]) initWithRequest:v6 handler:v4];

  [*(id *)(*(void *)(a1 + 32) + 48) addOperation:v5];
}

uint64_t __81__FAFamilySetupPrompter_promptIfEligibleWithPresentingViewController_isFirstRun___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleFamilyEligibilityResponse:a2 isFirstRun:*(unsigned __int8 *)(a1 + 40)];
}

void __81__FAFamilySetupPrompter_promptIfEligibleWithPresentingViewController_isFirstRun___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 statusCode] == 401)
  {
    id v4 = _AALogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2189F0000, v4, OS_LOG_TYPE_DEFAULT, "Family eligibility check request returned 401. We need to re-auth...", buf, 2u);
    }

    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 8);
    uint64_t v7 = *(void *)(v5 + 16);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __81__FAFamilySetupPrompter_promptIfEligibleWithPresentingViewController_isFirstRun___block_invoke_11;
    v8[3] = &unk_264349B70;
    id v10 = *(id *)(a1 + 40);
    id v11 = *(id *)(a1 + 48);
    id v9 = v3;
    [v6 renewCredentialsForAccount:v7 force:1 reason:0 completion:v8];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __81__FAFamilySetupPrompter_promptIfEligibleWithPresentingViewController_isFirstRun___block_invoke_11(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _AALogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v11 = a2;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl(&dword_2189F0000, v6, OS_LOG_TYPE_DEFAULT, "Result of renewing credentials for family eligibility check request: %ld. Error: %@", buf, 0x16u);
  }

  if (a2)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __81__FAFamilySetupPrompter_promptIfEligibleWithPresentingViewController_isFirstRun___block_invoke_12;
    v7[3] = &unk_264348BC0;
    id v8 = *(id *)(a1 + 40);
    id v9 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x263EF83A0], v7);
  }
}

uint64_t __81__FAFamilySetupPrompter_promptIfEligibleWithPresentingViewController_isFirstRun___block_invoke_12(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)_handleFamilyEligibilityResponse:(id)a3 isFirstRun:(BOOL)a4
{
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__FAFamilySetupPrompter__handleFamilyEligibilityResponse_isFirstRun___block_invoke;
  block[3] = &unk_26434A0C8;
  block[4] = self;
  id v9 = v6;
  BOOL v10 = a4;
  id v7 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __69__FAFamilySetupPrompter__handleFamilyEligibilityResponse_isFirstRun___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 56) = 0;
  if (![*(id *)(a1 + 40) eligibilityStatus])
  {
    uint64_t v2 = _AALogSystem();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v3 = "The user is not eligible for family.";
      id v4 = buf;
      goto LABEL_8;
    }
LABEL_9:

    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
    [WeakRetained familySetupPrompterDidFinish:*(void *)(a1 + 32)];

    return;
  }
  if ([*(id *)(a1 + 40) eligibilityStatus] == 2)
  {
    if (*(unsigned char *)(a1 + 48))
    {
      uint64_t v2 = _AALogSystem();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v11 = 0;
        id v3 = "User is underage and we are in first-run. Not prompting.";
        id v4 = (uint8_t *)&v11;
LABEL_8:
        _os_log_impl(&dword_2189F0000, v2, OS_LOG_TYPE_DEFAULT, v3, v4, 2u);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    [v8 _showUnderageAlertWithEligibilityResponse:v9];
  }
  else
  {
    int v6 = [*(id *)(a1 + 40) hasPendingInvites];
    id v7 = *(void **)(a1 + 32);
    if (*(unsigned char *)(a1 + 48))
    {
      if (v6)
      {
        [v7 _showConfirmationForStartingFamilySetupWithPendingInvite];
      }
      else
      {
        [v7 _showConfirmationForStartingFamilySetup];
      }
    }
    else if (v6)
    {
      [v7 _showPendingInvitesDialog];
    }
    else
    {
      uint64_t v10 = *(void *)(a1 + 40);
      [v7 _startFamilySetupFlowWithEligibilityResponse:v10];
    }
  }
}

- (void)_showConfirmationForStartingFamilySetup
{
  id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"SETUP_FAMILY_SHARING_TITLE" value:&stru_26CA2C800 table:@"Localizable"];

  id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v6 = [v5 localizedStringForKey:@"SETUP_FAMILY_SHARING_MESSAGE" value:&stru_26CA2C800 table:@"Localizable"];

  id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"SETUP_FAMILY_NOT_NOW_BUTTON" value:&stru_26CA2C800 table:@"Localizable"];

  uint64_t v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v10 = [v9 localizedStringForKey:@"SETUP_FAMILY_YES_BUTTON" value:&stru_26CA2C800 table:@"Localizable"];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __64__FAFamilySetupPrompter__showConfirmationForStartingFamilySetup__block_invoke;
  v13[3] = &unk_264349A08;
  v13[4] = self;
  __int16 v11 = [MEMORY[0x263F82418] alertWithTitle:v4 message:v6 cancelButtonTitle:v8 defaultButtonTitle:v10 actionHandler:v13];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  [WeakRetained presentViewController:v11 animated:1 completion:0];
}

uint64_t __64__FAFamilySetupPrompter__showConfirmationForStartingFamilySetup__block_invoke(uint64_t result, char a2)
{
  if ((a2 & 1) == 0) {
    return [*(id *)(result + 32) _goToFamilySetup];
  }
  return result;
}

- (void)_showConfirmationForStartingFamilySetupWithPendingInvite
{
  id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"SETUP_FAMILY_SHARING_TITLE" value:&stru_26CA2C800 table:@"Localizable"];

  id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v6 = [v5 localizedStringForKey:@"SETUP_FAMILY_SHARING_MESSAGE" value:&stru_26CA2C800 table:@"Localizable"];

  id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"SETUP_FAMILY_NOT_NOW_BUTTON" value:&stru_26CA2C800 table:@"Localizable"];

  uint64_t v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v10 = [v9 localizedStringForKey:@"SETUP_FAMILY_YES_BUTTON" value:&stru_26CA2C800 table:@"Localizable"];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __81__FAFamilySetupPrompter__showConfirmationForStartingFamilySetupWithPendingInvite__block_invoke;
  v13[3] = &unk_264349A08;
  v13[4] = self;
  __int16 v11 = [MEMORY[0x263F82418] alertWithTitle:v4 message:v6 cancelButtonTitle:v8 defaultButtonTitle:v10 actionHandler:v13];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  [WeakRetained presentViewController:v11 animated:1 completion:0];
}

uint64_t __81__FAFamilySetupPrompter__showConfirmationForStartingFamilySetupWithPendingInvite__block_invoke(uint64_t result, char a2)
{
  if ((a2 & 1) == 0) {
    return [*(id *)(result + 32) _showPendingInvitesDialog];
  }
  return result;
}

- (void)_showPendingInvitesDialog
{
  id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"PENDING_INVITE_ALERT_TITLE" value:&stru_26CA2C800 table:@"Localizable"];

  id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v6 = [v5 localizedStringForKey:@"PENDING_INVITE_ALERT_MESSAGE" value:&stru_26CA2C800 table:@"Localizable"];

  id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"PENDING_INVITE_NOT_NOW_BUTTON" value:&stru_26CA2C800 table:@"Localizable"];

  uint64_t v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v10 = [v9 localizedStringForKey:@"PENDING_INVITE_RESPOND_BUTTON" value:&stru_26CA2C800 table:@"Localizable"];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __50__FAFamilySetupPrompter__showPendingInvitesDialog__block_invoke;
  v13[3] = &unk_264349A08;
  v13[4] = self;
  __int16 v11 = [MEMORY[0x263F82418] alertWithTitle:v4 message:v6 cancelButtonTitle:v8 defaultButtonTitle:v10 actionHandler:v13];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  [WeakRetained presentViewController:v11 animated:1 completion:0];
}

uint64_t __50__FAFamilySetupPrompter__showPendingInvitesDialog__block_invoke(uint64_t a1, int a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 _goToFamilySetup];
  }
  else {
    return [v2 _goToInvitations];
  }
}

- (void)_showUnderageAlertWithEligibilityResponse:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 underageEligibilityAlertTitle];
  uint64_t v6 = [v4 underageEligibilityAlertMessage];

  if (v5 | v6)
  {
    uint64_t v9 = (void *)MEMORY[0x263F82418];
    uint64_t v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    __int16 v11 = [v10 localizedStringForKey:@"OK" value:&stru_26CA2C800 table:@"Localizable"];
    id v8 = [v9 alertWithTitle:v5 message:v6 buttonTitle:v11];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
    [WeakRetained presentViewController:v8 animated:1 completion:0];
  }
  else
  {
    id v7 = _AALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl(&dword_2189F0000, v7, OS_LOG_TYPE_DEFAULT, "Server did not provide under alert title and message. Cannot show alert!", v13, 2u);
    }

    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    [v8 familySetupPrompterDidFinish:self];
  }
}

- (void)_goToInvitations
{
  id v3 = _AALogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2189F0000, v3, OS_LOG_TYPE_DEFAULT, "Taking user to settings...", buf, 2u);
  }

  uint64_t v7 = 0;
  id v4 = [MEMORY[0x263F3C010] urlDestinationTo:4 error:&v7];
  uint64_t v5 = [MEMORY[0x263F01880] defaultWorkspace];
  [v5 openSensitiveURL:v4 withOptions:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained familySetupPrompterDidFinish:self];
}

- (void)_goToFamilySetup
{
  id v3 = _AALogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2189F0000, v3, OS_LOG_TYPE_DEFAULT, "Taking user to settings...", buf, 2u);
  }

  uint64_t v7 = 0;
  id v4 = [MEMORY[0x263F3C010] urlDestinationTo:5 error:&v7];
  uint64_t v5 = [MEMORY[0x263F01880] defaultWorkspace];
  [v5 openSensitiveURL:v4 withOptions:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained familySetupPrompterDidFinish:self];
}

- (void)_startFamilySetupFlowWithEligibilityResponse:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F25878];
  id v5 = a3;
  id v6 = [v4 alloc];
  uint64_t v7 = (void *)[v6 initWithAccountStore:self->_accountStore grandSlamAccount:self->_grandSlamAccount appTokenID:*MEMORY[0x263F256D0]];
  id v8 = [[FAFamilySetupViewController alloc] initWithAccount:self->_appleAccount grandSlamSigner:v7 familyEligibilityResponse:v5];

  [(FAFamilySetupViewController *)v8 setDelegate:self];
  uint64_t v9 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v10 = [v9 userInterfaceIdiom];

  [(FAFamilySetupViewController *)v8 setModalPresentationStyle:2 * ((v10 & 0xFFFFFFFFFFFFFFFBLL) == 1)];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  if (WeakRetained)
  {
    id v12 = objc_loadWeakRetained((id *)&self->_presentingViewController);
    [v12 presentViewController:v8 animated:1 completion:0];
  }
  else
  {
    id v13 = _AALogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v15 = 0;
      _os_log_impl(&dword_2189F0000, v13, OS_LOG_TYPE_DEFAULT, "Cannot show Family Setup UI without a presenting view controller!", v15, 2u);
    }

    id v14 = objc_loadWeakRetained((id *)&self->_delegate);
    [v14 familySetupPrompterDidFinish:self];
  }
}

- (void)familySetupViewController:(id)a3 didCompleteWithSuccess:(BOOL)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  [WeakRetained dismissViewControllerAnimated:1 completion:0];

  id v6 = objc_loadWeakRetained((id *)&self->_delegate);
  [v6 familySetupPrompterDidFinish:self];
}

- (FAFamilySetupPrompterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (FAFamilySetupPrompterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_networkingQueue, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_iTunesAccount, 0);
  objc_storeStrong((id *)&self->_grandSlamAccount, 0);
  objc_storeStrong((id *)&self->_appleAccount, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
}

@end