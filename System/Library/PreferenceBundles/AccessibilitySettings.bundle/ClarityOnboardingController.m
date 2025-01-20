@interface ClarityOnboardingController
- (void)_cancelOnboarding;
- (void)_cancelOnboardingWithCompletion:(id)a3;
- (void)_clearOnboarding;
- (void)_showAdminPasscodeSetupController;
- (void)_showAdminSettingsOnboardingController;
- (void)_showAppSelectionController;
- (void)_showAppleIDControllerWithAppleID:(id)a3;
- (void)_showFinishedController;
- (void)_showLayoutSetupController;
- (void)_showParentalControlsSetupController;
- (void)_showPasscodeAlert;
- (void)_showSecurityConfirmationSetupController;
- (void)_showThingsToKnowController;
- (void)_startOnboardingFlow;
- (void)presentationControllerDidAttemptToDismiss:(id)a3;
- (void)viewDidLoad;
@end

@implementation ClarityOnboardingController

- (void)viewDidLoad
{
  id v3 = objc_alloc((Class)OBWelcomeController);
  v4 = settingsLocString(@"CLARITY_UI_TITLE", @"ClarityUISettings");
  v5 = AXLocStringKeyForModel();
  v6 = settingsLocString(v5, @"ClarityUISettings");
  id v7 = [v3 initWithTitle:v4 detailText:v6 icon:0 contentLayout:4];

  v8 = [v7 contentView];
  v9 = +[UIColor clearColor];
  [v8 setBackgroundColor:v9];

  v10 = [ClarityOnboardingPreviewView alloc];
  v11 = [(ClarityOnboardingPreviewView *)v10 initWithListLayout:CLFListLayoutStack];
  [(ClarityOnboardingPreviewView *)v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v8 addSubview:v11];
  v12 = objc_opt_new();
  v13 = _NSDictionaryOfVariableBindings(@"previewView", v11, 0);
  v14 = +[NSLayoutConstraint constraintsWithVisualFormat:@"|[previewView]|" options:0 metrics:0 views:v13];
  [v12 addObjectsFromArray:v14];

  v15 = _NSDictionaryOfVariableBindings(@"previewView", v11, 0);
  v16 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[previewView]|" options:0 metrics:0 views:v15];
  [v12 addObjectsFromArray:v16];

  +[NSLayoutConstraint activateConstraints:v12];
  v17 = +[OBBoldTrayButton boldButton];
  v18 = settingsLocString(@"GET_STARTED", @"ClarityUISettings");
  [v17 setTitle:v18 forState:0];

  [v17 addTarget:self action:"_didTapGetStartedButton:" forControlEvents:0x2000];
  v19 = [v7 buttonTray];
  [v19 addButton:v17];

  [(ClarityOnboardingNavigationWrapperController *)self setController:v7];
  v23.receiver = self;
  v23.super_class = (Class)ClarityOnboardingController;
  [(ClarityOnboardingController *)&v23 viewDidLoad];
  v20 = [(ClarityOnboardingNavigationWrapperController *)self setUpNavigationController];
  v21 = [v20 presentationController];
  [v21 setDelegate:self];

  v22 = +[NSNotificationCenter defaultCenter];
  [v22 addObserver:self selector:"applicationWillTerminate:" name:UIApplicationWillTerminateNotification object:0];
}

- (void)_clearOnboarding
{
  id v3 = AXLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Clarity Onboarding was interrupted. Changes to CLFSettings should not persist", v4, 2u);
  }

  [(ClarityOnboardingController *)self resetAllSettings];
}

- (void)_startOnboardingFlow
{
  id v3 = +[ADCoreSettings sharedInstance];
  v4 = [v3 iCloudAccount];

  v5 = AXLogCommon();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Clarity Onboarding was started with a signed in Apple ID.", buf, 2u);
    }

    [(ClarityOnboardingController *)self _showAppleIDControllerWithAppleID:v4];
  }
  else
  {
    if (v6)
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Clarity Onboarding was started with no Apple ID.", v7, 2u);
    }

    [(ClarityOnboardingController *)self _showLayoutSetupController];
  }
}

- (void)_showAppleIDControllerWithAppleID:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [ClarityUIAppleIDController alloc];
  v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  v10 = __65__ClarityOnboardingController__showAppleIDControllerWithAppleID___block_invoke;
  v11 = &unk_208F28;
  objc_copyWeak(&v12, &location);
  BOOL v6 = [(ClarityUIAppleIDController *)v5 initWithAppleID:v4 delegate:self andCompletion:&v8];
  id v7 = [(ClarityOnboardingNavigationWrapperController *)self setUpNavigationController];
  [v7 pushViewController:v6 animated:1];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __65__ClarityOnboardingController__showAppleIDControllerWithAppleID___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _showLayoutSetupController];
  }
  else
  {
    id v3 = AXLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __65__ClarityOnboardingController__showAppleIDControllerWithAppleID___block_invoke_cold_1();
    }

    id v4 = objc_loadWeakRetained((id *)(a1 + 32));
    [v4 _cancelOnboarding];
  }
}

- (void)_showLayoutSetupController
{
  int v13 = 0;
  id v3 = +[MCProfileConnection sharedConnection];
  unsigned int v4 = [v3 unlockScreenTypeWithOutSimplePasscodeType:&v13];

  objc_initWeak(&location, self);
  v5 = [ClarityUILayoutSetupController alloc];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __57__ClarityOnboardingController__showLayoutSetupController__block_invoke;
  v10[3] = &unk_208F28;
  objc_copyWeak(&v11, &location);
  BOOL v6 = [(ClarityUILayoutSetupController *)v5 initWithCompletion:v10];
  id v7 = +[MCProfileConnection sharedConnection];
  if (![v7 isPasscodeSet])
  {

LABEL_6:
    uint64_t v9 = [(ClarityOnboardingNavigationWrapperController *)self setUpNavigationController];
    [v9 pushViewController:v6 animated:1];

    goto LABEL_7;
  }
  int v8 = v13;

  if (!v4 && v8 != -1) {
    goto LABEL_6;
  }
  [(ClarityOnboardingController *)self _showPasscodeAlert];
LABEL_7:

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __57__ClarityOnboardingController__showLayoutSetupController__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _showAppSelectionController];
  }
  else
  {
    v2 = AXLogCommon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __57__ClarityOnboardingController__showLayoutSetupController__block_invoke_cold_1();
    }
  }
}

- (void)_showAppSelectionController
{
  objc_initWeak(&location, self);
  id v3 = [ClarityUIAppSelectionWelcomeController alloc];
  BOOL v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  int v8 = __58__ClarityOnboardingController__showAppSelectionController__block_invoke;
  uint64_t v9 = &unk_208F28;
  objc_copyWeak(&v10, &location);
  unsigned int v4 = [(ClarityUIAppSelectionWelcomeController *)v3 initWithCompletion:&v6];
  v5 = [(ClarityOnboardingNavigationWrapperController *)self setUpNavigationController];
  [v5 pushViewController:v4 animated:1];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __58__ClarityOnboardingController__showAppSelectionController__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _showThingsToKnowController];
  }
  else
  {
    v2 = AXLogCommon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __65__ClarityOnboardingController__showAppleIDControllerWithAppleID___block_invoke_cold_1();
    }
  }
}

- (void)_showThingsToKnowController
{
  objc_initWeak(&location, self);
  id v3 = [ClarityUIThingsToKnowOnboardingController alloc];
  BOOL v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  int v8 = __58__ClarityOnboardingController__showThingsToKnowController__block_invoke;
  uint64_t v9 = &unk_208F28;
  objc_copyWeak(&v10, &location);
  unsigned int v4 = [(ClarityUIThingsToKnowOnboardingController *)v3 initWithCompletion:&v6];
  v5 = [(ClarityOnboardingNavigationWrapperController *)self setUpNavigationController];
  [v5 pushViewController:v4 animated:1];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __58__ClarityOnboardingController__showThingsToKnowController__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _showSecurityConfirmationSetupController];
  }
  else
  {
    id v3 = AXLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Cancelled onboarding in Things to Know", buf, 2u);
    }

    id v4 = objc_loadWeakRetained((id *)(a1 + 32));
    [v4 _cancelOnboarding];
  }
}

- (void)_showSecurityConfirmationSetupController
{
  id v3 = +[ADCoreSettings sharedInstance];
  id v4 = [v3 iCloudAccount];

  v5 = objc_msgSend(v4, "clarityUI_shortName");
  objc_initWeak(&location, self);
  BOOL v6 = [ClarityUISecurityConfirmationSetupController alloc];
  uint64_t v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  id v11 = __71__ClarityOnboardingController__showSecurityConfirmationSetupController__block_invoke;
  id v12 = &unk_208F28;
  objc_copyWeak(&v13, &location);
  uint64_t v7 = [(ClarityUISecurityConfirmationSetupController *)v6 initWithShortName:v5 delegate:self andCompletion:&v9];
  int v8 = [(ClarityOnboardingNavigationWrapperController *)self setUpNavigationController];
  [v8 pushViewController:v7 animated:1];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __71__ClarityOnboardingController__showSecurityConfirmationSetupController__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    unsigned int v3 = +[SFRestrictionsPasscodeController settingEnabled];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v6 = WeakRetained;
    if (v3) {
      [WeakRetained _showParentalControlsSetupController];
    }
    else {
      [WeakRetained _showAdminPasscodeSetupController];
    }
  }
  else
  {
    v5 = AXLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __71__ClarityOnboardingController__showSecurityConfirmationSetupController__block_invoke_cold_1();
    }
  }
}

- (void)_showParentalControlsSetupController
{
  objc_initWeak(&location, self);
  unsigned int v3 = [ClarityUIParentalControlsSetupController alloc];
  id v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  int v8 = __67__ClarityOnboardingController__showParentalControlsSetupController__block_invoke;
  uint64_t v9 = &unk_208F28;
  objc_copyWeak(&v10, &location);
  id v4 = [(ClarityUIParentalControlsSetupController *)v3 initWithCompletion:&v6];
  v5 = [(ClarityOnboardingNavigationWrapperController *)self setUpNavigationController];
  [v5 pushViewController:v4 animated:1];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __67__ClarityOnboardingController__showParentalControlsSetupController__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _showAdminSettingsOnboardingController];
  }
  else
  {
    unsigned int v3 = AXLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __67__ClarityOnboardingController__showParentalControlsSetupController__block_invoke_cold_1();
    }

    id v4 = objc_loadWeakRetained((id *)(a1 + 32));
    [v4 _showAdminPasscodeSetupController];
  }
}

- (void)_showAdminPasscodeSetupController
{
  objc_initWeak(&location, self);
  unsigned int v3 = [ClarityUIAdminPasscodeSetupController alloc];
  id v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  int v8 = __64__ClarityOnboardingController__showAdminPasscodeSetupController__block_invoke;
  uint64_t v9 = &unk_208F28;
  objc_copyWeak(&v10, &location);
  id v4 = [(ClarityUIAdminPasscodeSetupController *)v3 initWithCompletion:&v6];
  v5 = [(ClarityOnboardingNavigationWrapperController *)self setUpNavigationController];
  [v5 pushViewController:v4 animated:1];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __64__ClarityOnboardingController__showAdminPasscodeSetupController__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _showAdminSettingsOnboardingController];
  }
  else
  {
    v2 = AXLogCommon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __64__ClarityOnboardingController__showAdminPasscodeSetupController__block_invoke_cold_1();
    }
  }
}

- (void)_showAdminSettingsOnboardingController
{
  objc_initWeak(&location, self);
  unsigned int v3 = [ClarityUIAdminSettingsOnboardingController alloc];
  id v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  int v8 = __69__ClarityOnboardingController__showAdminSettingsOnboardingController__block_invoke;
  uint64_t v9 = &unk_208F28;
  objc_copyWeak(&v10, &location);
  id v4 = [(ClarityUIAdminSettingsOnboardingController *)v3 initWithCompletion:&v6];
  v5 = [(ClarityOnboardingNavigationWrapperController *)self setUpNavigationController];
  [v5 pushViewController:v4 animated:1];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __69__ClarityOnboardingController__showAdminSettingsOnboardingController__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (a2) {
    [WeakRetained _showFinishedController];
  }
  else {
    [WeakRetained _cancelOnboarding];
  }
}

- (void)_showFinishedController
{
  objc_initWeak(&location, self);
  unsigned int v3 = [ClarityUIFinishedController alloc];
  id v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  int v8 = __54__ClarityOnboardingController__showFinishedController__block_invoke;
  uint64_t v9 = &unk_208F28;
  objc_copyWeak(&v10, &location);
  id v4 = [(ClarityUIFinishedController *)v3 initWithCompletion:&v6];
  v5 = [(ClarityOnboardingNavigationWrapperController *)self setUpNavigationController];
  [v5 pushViewController:v4 animated:1];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __54__ClarityOnboardingController__showFinishedController__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    v2 = (id *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v4 = [WeakRetained setUpNavigationController];
    [v4 dismissViewControllerAnimated:1 completion:0];

    id v6 = objc_loadWeakRetained(v2);
    [v6 dismissViewControllerAnimated:1 completion:0];
  }
  else
  {
    v5 = AXLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __54__ClarityOnboardingController__showFinishedController__block_invoke_cold_1();
    }
  }
}

- (void)_showPasscodeAlert
{
  unsigned int v3 = settingsLocString(@"CLARITY_PASSCODE_ALERT_TITLE", @"ClarityUISettings");
  id v4 = settingsLocString(@"CLARITY_PASSCODE_ALERT_MESSAGE", @"ClarityUISettings");
  v5 = +[UIAlertController alertControllerWithTitle:v3 message:v4 preferredStyle:1];

  objc_initWeak(&location, self);
  id v6 = settingsLocString(@"CANCEL", @"ClarityUISettings");
  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  id v13 = __49__ClarityOnboardingController__showPasscodeAlert__block_invoke;
  v14 = &unk_208F50;
  objc_copyWeak(&v15, &location);
  uint64_t v7 = +[UIAlertAction actionWithTitle:v6 style:1 handler:&v11];

  objc_msgSend(v5, "addAction:", v7, v11, v12, v13, v14);
  int v8 = settingsLocString(@"CLARITY_PASSCODE_ALERT_ACTION", @"ClarityUISettings");
  uint64_t v9 = +[UIAlertAction actionWithTitle:v8 style:0 handler:&__block_literal_global_3];

  [v5 addAction:v9];
  id v10 = [(ClarityOnboardingNavigationWrapperController *)self setUpNavigationController];
  [v10 presentViewController:v5 animated:1 completion:0];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __49__ClarityOnboardingController__showPasscodeAlert__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned int v3 = [WeakRetained setUpNavigationController];
  [v3 dismissViewControllerAnimated:1 completion:0];

  id v4 = objc_loadWeakRetained(v1);
  [v4 dismissViewControllerAnimated:1 completion:0];
}

void __49__ClarityOnboardingController__showPasscodeAlert__block_invoke_2(id a1, UIAlertAction *a2)
{
  +[NSURL URLWithString:@"prefs:root=PASSCODE"];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = +[LSApplicationWorkspace defaultWorkspace];
  [v2 openSensitiveURL:v3 withOptions:0];
}

- (void)_cancelOnboarding
{
}

- (void)_cancelOnboardingWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = settingsLocString(@"CLARITY_UI_CANCEL_ONBOARDING_TITLE", @"ClarityUISettings");
  id v6 = settingsLocString(@"CLARITY_UI_CANCEL_ONBOARDING_MESSAGE", @"ClarityUISettings");
  uint64_t v7 = +[UIAlertController alertControllerWithTitle:v5 message:v6 preferredStyle:1];

  objc_initWeak(&location, self);
  int v8 = settingsLocString(@"CLARITY_UI_CANCEL_ONBOARDING_LEAVE", @"ClarityUISettings");
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __63__ClarityOnboardingController__cancelOnboardingWithCompletion___block_invoke;
  v14[3] = &unk_208FB8;
  objc_copyWeak(&v16, &location);
  id v9 = v4;
  id v15 = v9;
  id v10 = +[UIAlertAction actionWithTitle:v8 style:2 handler:v14];
  [v7 addAction:v10];

  id v11 = settingsLocString(@"CLARITY_UI_CANCEL_ONBOARDING_STAY", @"ClarityUISettings");
  uint64_t v12 = +[UIAlertAction actionWithTitle:v11 style:0 handler:&__block_literal_global_345];
  [v7 addAction:v12];

  id v13 = [(ClarityOnboardingNavigationWrapperController *)self setUpNavigationController];
  [v13 presentViewController:v7 animated:1 completion:0];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __63__ClarityOnboardingController__cancelOnboardingWithCompletion___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained setUpNavigationController];
  [v4 dismissViewControllerAnimated:1 completion:*(void *)(a1 + 32)];

  id v5 = objc_loadWeakRetained(v2);
  [v5 dismissViewControllerAnimated:1 completion:0];
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  id v4 = [(ClarityOnboardingNavigationWrapperController *)self setUpNavigationController];
  id v6 = [v4 topViewController];

  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v5 = [(ClarityOnboardingNavigationWrapperController *)self setUpNavigationController];
    [v5 dismissViewControllerAnimated:1 completion:0];

    [(ClarityOnboardingController *)self dismissViewControllerAnimated:1 completion:0];
  }
  else
  {
    [(ClarityOnboardingController *)self _cancelOnboarding];
  }
}

void __65__ClarityOnboardingController__showAppleIDControllerWithAppleID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_0, v0, v1, "Failed to handle completion for ClarityUIAppSelectionWelcomeController", v2, v3, v4, v5, v6);
}

void __57__ClarityOnboardingController__showLayoutSetupController__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_0, v0, v1, "Failed to handle completion for ClarityUILayoutSetupController", v2, v3, v4, v5, v6);
}

void __71__ClarityOnboardingController__showSecurityConfirmationSetupController__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_0, v0, v1, "Failed to handle completion for ClarityUISecurityConfirmationSetupController", v2, v3, v4, v5, v6);
}

void __67__ClarityOnboardingController__showParentalControlsSetupController__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_0, v0, v1, "Failed to handle completion for ClarityUIParentalControlsSetupController, showing admin passcode setup view", v2, v3, v4, v5, v6);
}

void __64__ClarityOnboardingController__showAdminPasscodeSetupController__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_0, v0, v1, "Failed to handle completion for ClarityUIAdminPasscodeSetupController", v2, v3, v4, v5, v6);
}

void __54__ClarityOnboardingController__showFinishedController__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_0, v0, v1, "Failed to handle completion for ClarityUIFinishedController", v2, v3, v4, v5, v6);
}

@end