@interface AAUIFamilySetupViewController
- (AAUIFamilySetupViewController)initWithAccount:(id)a3 grandSlamSigner:(id)a4 familyEligibilityResponse:(id)a5;
- (AAUIFamilySetupViewController)initWithAccount:(id)a3 store:(id)a4;
- (BOOL)_isRunningInSettings;
- (BOOL)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5;
- (BOOL)shouldAutorotate;
- (id)_createCloseButton;
- (id)_initWithAccount:(id)a3 grandSlamSigner:(id)a4 rootViewController:(id)a5;
- (id)_urlForLaunchingSettings;
- (id)initTrimmedFlowWithAccount:(id)a3 grandSlamSigner:(id)a4;
- (void)_closeButtonWasTapped:(id)a3;
- (void)_hideActivitySpinnerInNavigationBar;
- (void)_loadRemoteUIPages;
- (void)_remoteUIDidCancel;
- (void)_sendUserToiTunesSettings;
- (void)_showActivitySpinnerInNavigationBar;
- (void)dealloc;
- (void)familySetupPage:(id)a3 didCompleteWithSuccess:(BOOL)a4;
- (void)remoteUIController:(id)a3 didReceiveHTTPResponse:(id)a4;
- (void)remoteUIController:(id)a3 willPresentObjectModel:(id)a4 modally:(BOOL)a5;
- (void)remoteUIControllerDidDismiss:(id)a3;
- (void)viewDidLoad;
@end

@implementation AAUIFamilySetupViewController

- (AAUIFamilySetupViewController)initWithAccount:(id)a3 store:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_msgSend(v6, "aa_grandSlamAccountForiCloudAccount:", v7);
  id v9 = objc_alloc(MEMORY[0x263F25878]);
  v10 = (void *)[v9 initWithAccountStore:v6 grandSlamAccount:v8 appTokenID:*MEMORY[0x263F256D0]];

  v11 = [(AAUIFamilySetupViewController *)self initWithAccount:v7 grandSlamSigner:v10 familyEligibilityResponse:0];
  return v11;
}

- (AAUIFamilySetupViewController)initWithAccount:(id)a3 grandSlamSigner:(id)a4 familyEligibilityResponse:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc((Class)getFAFamilySetupGetStartedViewControllerClass());
  v12 = [v9 accountStore];
  v13 = (void *)[v11 initWithAccount:v10 store:v12 familyEligibilityResponse:v8];

  v14 = [(AAUIFamilySetupViewController *)self _initWithAccount:v10 grandSlamSigner:v9 rootViewController:v13];
  return v14;
}

- (id)initTrimmedFlowWithAccount:(id)a3 grandSlamSigner:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)getFAFamilySetupOrganizerViewControllerClass());
  id v9 = [v6 accountStore];
  id v10 = (void *)[v8 initWithAccount:v7 store:v9];

  id v11 = [(AAUIFamilySetupViewController *)self _initWithAccount:v7 grandSlamSigner:v6 rootViewController:v10];
  return v11;
}

- (id)_initWithAccount:(id)a3 grandSlamSigner:(id)a4 rootViewController:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)AAUIFamilySetupViewController;
  v12 = [(AAUIFamilySetupViewController *)&v18 initWithRootViewController:v11];
  if (v12)
  {
    [v11 setDelegate:v12];
    v13 = [v11 navigationItem];
    v14 = [(AAUIFamilySetupViewController *)v12 _createCloseButton];
    [v13 setRightBarButtonItem:v14];

    objc_storeStrong((id *)&v12->_account, a3);
    uint64_t v15 = [v10 accountStore];
    accountStore = v12->_accountStore;
    v12->_accountStore = (ACAccountStore *)v15;

    objc_storeStrong((id *)&v12->_grandSlamSigner, a4);
  }

  return v12;
}

- (void)dealloc
{
  remoteUIController = self->_remoteUIController;
  if (remoteUIController) {
    [(RemoteUIController *)remoteUIController setDelegate:0];
  }
  v4.receiver = self;
  v4.super_class = (Class)AAUIFamilySetupViewController;
  [(AAUIFamilySetupViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)AAUIFamilySetupViewController;
  [(AAUIBleachedNavigationController *)&v5 viewDidLoad];
  v3 = [(AAUIFamilySetupViewController *)self navigationBar];
  objc_super v4 = [MEMORY[0x263F825C8] systemBlueColor];
  [v3 setTintColor:v4];
}

- (BOOL)shouldAutorotate
{
  return 0;
}

- (void)familySetupPage:(id)a3 didCompleteWithSuccess:(BOOL)a4
{
  id v9 = a3;
  if (!a4)
  {
    id v6 = [(AAUIFamilySetupViewController *)self delegate];
    [v6 familySetupViewController:self didCompleteWithSuccess:0];
LABEL_9:

    goto LABEL_10;
  }
  getFAFamilySetupGetStartedViewControllerClass();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([(AAUIFamilySetupViewController *)self _isRunningInSettings])
    {
      id v6 = (void *)[objc_alloc((Class)getFAFamilySetupOrganizerViewControllerClass()) initWithAccount:self->_account store:self->_accountStore];
      [v6 setDelegate:self];
      [(AAUIFamilySetupViewController *)self pushViewController:v6 animated:1];
    }
    else
    {
      id v7 = [(AAUIFamilySetupViewController *)self delegate];
      [v7 familySetupViewController:self didCompleteWithSuccess:1];

      id v6 = [MEMORY[0x263F01880] defaultWorkspace];
      id v8 = [(AAUIFamilySetupViewController *)self _urlForLaunchingSettings];
      [v6 openSensitiveURL:v8 withOptions:0];
    }
    goto LABEL_9;
  }
  getFAFamilySetupOrganizerViewControllerClass();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(AAUIFamilySetupViewController *)self _loadRemoteUIPages];
  }
LABEL_10:
}

- (BOOL)_isRunningInSettings
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  v3 = [v2 bundleIdentifier];
  char v4 = [v3 isEqualToString:@"com.apple.Preferences"];

  return v4;
}

- (id)_urlForLaunchingSettings
{
  v2 = [NSString stringWithFormat:@"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE&%@=%@", @"aaaction", @"setupFamily"];
  v3 = [NSURL URLWithString:v2];

  return v3;
}

- (id)_createCloseButton
{
  id v3 = objc_alloc(MEMORY[0x263F824A8]);
  char v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v5 = [v4 localizedStringForKey:@"CLOSE_BUTTON_TITLE" value:&stru_26BD39CD8 table:@"Localizable"];
  id v6 = (void *)[v3 initWithTitle:v5 style:0 target:self action:sel__closeButtonWasTapped_];

  return v6;
}

- (void)_closeButtonWasTapped:(id)a3
{
  id v4 = [(AAUIFamilySetupViewController *)self topViewController];
  [(AAUIFamilySetupViewController *)self familySetupPage:v4 didCompleteWithSuccess:0];
}

- (void)_showActivitySpinnerInNavigationBar
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (!self->_spinnerView)
  {
    id v3 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
    spinnerView = self->_spinnerView;
    self->_spinnerView = v3;

    [(UIActivityIndicatorView *)self->_spinnerView setHidesWhenStopped:1];
  }
  if (self->_isShowingSpinner)
  {
    navigationItemShowingSpinner = self->_navigationItemShowingSpinner;
    id v6 = [(AAUIFamilySetupViewController *)self topViewController];
    id v7 = [v6 navigationItem];

    if (navigationItemShowingSpinner != v7)
    {
      id v8 = _AAUILogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v16 = objc_opt_class();
        _os_log_impl(&dword_209754000, v8, OS_LOG_TYPE_DEFAULT, "%@ changed navigation item for spinner!", buf, 0xCu);
      }
    }
  }
  else
  {
    [(UIActivityIndicatorView *)self->_spinnerView startAnimating];
    id v14 = (id)[objc_alloc(MEMORY[0x263F824A8]) initWithCustomView:self->_spinnerView];
    id v9 = [(AAUIFamilySetupViewController *)self topViewController];
    id v10 = [v9 navigationItem];
    id v11 = self->_navigationItemShowingSpinner;
    self->_navigationItemShowingSpinner = v10;

    v12 = [(UINavigationItem *)self->_navigationItemShowingSpinner rightBarButtonItems];
    originalRightBarButtonItems = self->_originalRightBarButtonItems;
    self->_originalRightBarButtonItems = v12;

    [(UINavigationItem *)self->_navigationItemShowingSpinner setRightBarButtonItem:v14];
    self->_isShowingSpinner = 1;
  }
}

- (void)_hideActivitySpinnerInNavigationBar
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (self->_isShowingSpinner)
  {
    [(UIActivityIndicatorView *)self->_spinnerView stopAnimating];
    if (self->_originalRightBarButtonItems) {
      -[UINavigationItem setRightBarButtonItems:](self->_navigationItemShowingSpinner, "setRightBarButtonItems:");
    }
    self->_isShowingSpinner = 0;
    originalRightBarButtonItems = self->_originalRightBarButtonItems;
    self->_originalRightBarButtonItems = 0;

    navigationItemShowingSpinner = self->_navigationItemShowingSpinner;
    self->_navigationItemShowingSpinner = 0;
  }
  else
  {
    id v6 = _AAUILogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      Name = sel_getName(a2);
      _os_log_impl(&dword_209754000, v6, OS_LOG_TYPE_DEFAULT, "%s when there was no spinner", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)_loadRemoteUIPages
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  [(AAUIFamilySetupViewController *)self _showActivitySpinnerInNavigationBar];
  id v3 = objc_msgSend(MEMORY[0x263EFB210], "ams_sharedAccountStore");
  id v4 = objc_msgSend(v3, "ams_activeiTunesAccount");

  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2050000000;
  objc_super v5 = (void *)getFAFamilySetupBuddyMLRequestClass_softClass;
  uint64_t v18 = getFAFamilySetupBuddyMLRequestClass_softClass;
  if (!getFAFamilySetupBuddyMLRequestClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    v20 = __getFAFamilySetupBuddyMLRequestClass_block_invoke;
    v21 = &unk_263F92608;
    v22 = &v15;
    __getFAFamilySetupBuddyMLRequestClass_block_invoke((uint64_t)&buf);
    objc_super v5 = (void *)v16[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v15, 8);
  id v7 = [v6 alloc];
  id v8 = objc_msgSend(v7, "initWithGrandSlamSigner:", self->_grandSlamSigner, v15);
  [v8 setiTunesAccount:v4];
  uint64_t v9 = [v8 urlRequest];
  id v10 = (NSMutableURLRequest *)[v9 mutableCopy];
  startRemoteUIRequest = self->_startRemoteUIRequest;
  self->_startRemoteUIRequest = v10;

  v12 = _AAUILogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_209754000, v12, OS_LOG_TYPE_DEFAULT, "Will load Family Setup remote UI using request: %@", (uint8_t *)&buf, 0xCu);
  }

  v13 = (RemoteUIController *)objc_alloc_init(MEMORY[0x263F637E8]);
  remoteUIController = self->_remoteUIController;
  self->_remoteUIController = v13;

  [(RemoteUIController *)self->_remoteUIController setDelegate:self];
  [(RemoteUIController *)self->_remoteUIController setNavigationController:self];
  [(RemoteUIController *)self->_remoteUIController loadRequest:self->_startRemoteUIRequest completion:&__block_literal_global_5];
}

void __51__AAUIFamilySetupViewController__loadRemoteUIPages__block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    objc_super v5 = _AAUILogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_209754000, v5, OS_LOG_TYPE_DEFAULT, "Failed to load Family Setup remote UI: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)remoteUIController:(id)a3 willPresentObjectModel:(id)a4 modally:(BOOL)a5
{
  objc_super v5 = (void *)MEMORY[0x263F637D0];
  id v6 = a4;
  id v7 = [v5 setupAssistantModalStyle];
  [v7 applyToObjectModel:v6];
}

- (BOOL)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5
{
  id v7 = (NSMutableURLRequest *)a4;
  objc_storeStrong((id *)&self->_currentRemoteUIRequest, a4);
  if (self->_startRemoteUIRequest == v7) {
    goto LABEL_8;
  }
  uint64_t v8 = [(NSMutableURLRequest *)v7 URL];
  uint64_t v9 = [v8 absoluteString];
  int v10 = [v9 containsString:@"prefs:itunes"];

  if (!v10)
  {
    id v11 = [(NSMutableURLRequest *)v7 URL];
    v12 = [v11 absoluteString];
    int v13 = [v12 containsString:@"prefs:icloud"];

    if (v13)
    {
      [(AAUIFamilySetupViewController *)self _remoteUIDidCancel];
      goto LABEL_6;
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __87__AAUIFamilySetupViewController_remoteUIController_shouldLoadRequest_redirectResponse___block_invoke;
    block[3] = &unk_263F92168;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
    [(NSMutableURLRequest *)v7 aa_addBasicAuthorizationHeaderWithAccount:self->_account preferUsingPassword:0];
    [(NSMutableURLRequest *)v7 aa_addLoggedInAppleIDHeaderWithAccount:self->_account];
    uint64_t v15 = [MEMORY[0x263F25820] clientInfoHeader];
    [(NSMutableURLRequest *)v7 setValue:v15 forHTTPHeaderField:@"X-MMe-Client-Info"];

    uint64_t v16 = [MEMORY[0x263EFF960] currentLocale];
    uint64_t v17 = [v16 objectForKey:*MEMORY[0x263EFF4D0]];
    uint64_t v18 = [v17 uppercaseString];
    [(NSMutableURLRequest *)v7 setValue:v18 forHTTPHeaderField:@"X-MMe-Country"];

    [(NSMutableURLRequest *)v7 aa_addDeviceInternalDevHeaderIfEnabled];
    [(NSMutableURLRequest *)v7 aa_addDeviceIDHeader];
    [(NSMutableURLRequest *)v7 aa_addLocationSharingAllowedHeader];
    [(AAGrandSlamSigner *)self->_grandSlamSigner signURLRequest:v7 isUserInitiated:1];
LABEL_8:
    [(NSMutableURLRequest *)v7 setValue:@"true" forHTTPHeaderField:@"X-MMe-Family-Setup"];
    BOOL v14 = 1;
    goto LABEL_9;
  }
  [(AAUIFamilySetupViewController *)self _sendUserToiTunesSettings];
LABEL_6:
  BOOL v14 = 0;
LABEL_9:

  return v14;
}

uint64_t __87__AAUIFamilySetupViewController_remoteUIController_shouldLoadRequest_redirectResponse___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showActivitySpinnerInNavigationBar];
}

- (void)remoteUIController:(id)a3 didReceiveHTTPResponse:(id)a4
{
  id v5 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__AAUIFamilySetupViewController_remoteUIController_didReceiveHTTPResponse___block_invoke;
  block[3] = &unk_263F92168;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
  if ([v5 statusCode] == 401)
  {
    id v6 = _AAUILogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_209754000, v6, OS_LOG_TYPE_DEFAULT, "BML request returned 401. We need to re-auth...", v8, 2u);
    }

    [(ACAccountStore *)self->_accountStore renewCredentialsForAccount:self->_account force:1 reason:0 completion:&__block_literal_global_93];
  }
  else if ([(NSMutableURLRequest *)self->_currentRemoteUIRequest aa_addDeviceProvisioningInfoHeadersWithDSIDFromReponse:v5])
  {
    id v7 = _AAUILogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_209754000, v7, OS_LOG_TYPE_DEFAULT, "Device is provisioned... Reissuing request...", v8, 2u);
    }

    [(RemoteUIController *)self->_remoteUIController loadRequest:self->_currentRemoteUIRequest completion:&__block_literal_global_96];
  }
}

uint64_t __75__AAUIFamilySetupViewController_remoteUIController_didReceiveHTTPResponse___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _hideActivitySpinnerInNavigationBar];
}

void __75__AAUIFamilySetupViewController_remoteUIController_didReceiveHTTPResponse___block_invoke_90(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134218242;
    uint64_t v7 = a2;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_209754000, v5, OS_LOG_TYPE_DEFAULT, "Result of renewing credentials to continue BML flow: %ld. Error: %@", (uint8_t *)&v6, 0x16u);
  }
}

void __75__AAUIFamilySetupViewController_remoteUIController_didReceiveHTTPResponse___block_invoke_94(uint64_t a1, char a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    id v5 = _AAUILogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_209754000, v5, OS_LOG_TYPE_DEFAULT, "Failed to load Family Setup remote UI: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)remoteUIControllerDidDismiss:(id)a3
{
  id v4 = [(AAUIFamilySetupViewController *)self delegate];
  [v4 familySetupViewController:self didCompleteWithSuccess:1];
}

- (void)_remoteUIDidCancel
{
  id v3 = [(AAUIFamilySetupViewController *)self delegate];
  [v3 familySetupViewController:self didCompleteWithSuccess:0];
}

- (void)_sendUserToiTunesSettings
{
  id v3 = [(AAUIFamilySetupViewController *)self delegate];
  [v3 familySetupViewController:self didCompleteWithSuccess:0];

  dispatch_time_t v4 = dispatch_time(0, 500000000);
  id v5 = MEMORY[0x263EF83A0];
  dispatch_after(v4, v5, &__block_literal_global_98);
}

void __58__AAUIFamilySetupViewController__sendUserToiTunesSettings__block_invoke()
{
  id v1 = [MEMORY[0x263F01880] defaultWorkspace];
  v0 = [NSURL URLWithString:@"prefs:root=STORE"];
  [v1 openSensitiveURL:v0 withOptions:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationItemShowingSpinner, 0);
  objc_storeStrong((id *)&self->_originalRightBarButtonItems, 0);
  objc_storeStrong((id *)&self->_spinnerView, 0);
  objc_storeStrong((id *)&self->_currentRemoteUIRequest, 0);
  objc_storeStrong((id *)&self->_startRemoteUIRequest, 0);
  objc_storeStrong((id *)&self->_remoteUIController, 0);
  objc_storeStrong((id *)&self->_grandSlamSigner, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end