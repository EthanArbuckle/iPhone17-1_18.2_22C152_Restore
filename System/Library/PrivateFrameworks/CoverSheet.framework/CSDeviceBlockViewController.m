@interface CSDeviceBlockViewController
+ (Class)viewClass;
- (BOOL)_isFindMyChangingState;
- (BOOL)_isFindMyEnabled;
- (BOOL)_shouldShowUnblockDeviceButton;
- (CSDeviceBlockViewController)initWithDeviceBlockStatusProvider:(id)a3;
- (OS_dispatch_queue)networkMonitorQueue;
- (OS_nw_path_monitor)networkPathMonitor;
- (id)_obfuscateUsername:(id)a3;
- (id)_unblockPolicy;
- (id)view;
- (id)viewIfLoaded;
- (int64_t)presentationPriority;
- (void)_attemptErase;
- (void)_attemptRecovery;
- (void)_attemptToDisableFindMyWithAccount:(id)a3 completion:(id)a4;
- (void)_cancelPendingActionAfterDelay:(double)a3;
- (void)_disableFindMyInContext:(unint64_t)a3 withWipeToken:(id)a4 completion:(id)a5;
- (void)_eraseDeviceWithCompletion:(id)a3;
- (void)_getUserAccountWithCompletion:(id)a3;
- (void)_handleDeviceLocatorStateDidChange:(id)a3;
- (void)_performFMIPAuthenticationForContext:(id)a3 account:(id)a4 completion:(id)a5;
- (void)_presentAuthenticationViewController;
- (void)_presentUnblockDeviceViewController;
- (void)_setNetworkMonitorUpdateHandlerWithPath:(id)a3 completion:(id)a4;
- (void)_setUpNetworkPathMonitor;
- (void)_updateText;
- (void)aggregateAppearance:(id)a3;
- (void)aggregateBehavior:(id)a3;
- (void)authViewController:(id)a3 didConfirmEraseAfterAuthenticationWithResults:(id)a4 shouldEraseDataPlan:(BOOL)a5;
- (void)authViewControllerDidCancelToEraseDeviceAfterAuthentication:(id)a3;
- (void)cancelButtonTapped;
- (void)dealloc;
- (void)deviceUnblockViewModelHandleDidRequestCancel;
- (void)handleEmergencyButtonAction;
- (void)handleSecondaryActionForView:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation CSDeviceBlockViewController

- (CSDeviceBlockViewController)initWithDeviceBlockStatusProvider:(id)a3
{
  id v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CSDeviceBlockViewController;
  v6 = [(CSDeviceBlockViewController *)&v24 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_blockStatusProvider, a3);
    v8 = (ACAccountStore *)objc_alloc_init(MEMORY[0x1E4F179C8]);
    accountStore = v7->_accountStore;
    v7->_accountStore = v8;

    uint64_t v10 = +[CSLockScreenDomain rootSettings];
    lockScreenSettings = v7->_lockScreenSettings;
    v7->_lockScreenSettings = (CSLockScreenSettings *)v10;

    v12 = objc_alloc_init(CSDevicePasscodeRecoveryService);
    passcodeRecovery = v7->_passcodeRecovery;
    v7->_passcodeRecovery = v12;

    nw_path_monitor_t v14 = nw_path_monitor_create();
    networkPathMonitor = v7->_networkPathMonitor;
    v7->_networkPathMonitor = (OS_nw_path_monitor *)v14;

    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.CoverSheet.deviceBlock", v16);
    networkMonitorQueue = v7->_networkMonitorQueue;
    v7->_networkMonitorQueue = (OS_dispatch_queue *)v17;

    v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x2020000000;
    v20 = (void *)getAAUIDeviceLocatorStateDidChangeNotificationSymbolLoc_ptr;
    uint64_t v33 = getAAUIDeviceLocatorStateDidChangeNotificationSymbolLoc_ptr;
    if (!getAAUIDeviceLocatorStateDidChangeNotificationSymbolLoc_ptr)
    {
      uint64_t v25 = MEMORY[0x1E4F143A8];
      uint64_t v26 = 3221225472;
      v27 = __getAAUIDeviceLocatorStateDidChangeNotificationSymbolLoc_block_invoke;
      v28 = &unk_1E6AD94F0;
      v29 = &v30;
      v21 = (void *)AppleAccountUILibrary();
      v22 = dlsym(v21, "AAUIDeviceLocatorStateDidChangeNotification");
      *(void *)(v29[1] + 24) = v22;
      getAAUIDeviceLocatorStateDidChangeNotificationSymbolLoc_ptr = *(void *)(v29[1] + 24);
      v20 = (void *)v31[3];
    }
    _Block_object_dispose(&v30, 8);
    if (!v20) {
      -[CSDeviceBlockViewController initWithDeviceBlockStatusProvider:]();
    }
    [v19 addObserver:v7 selector:sel__handleDeviceLocatorStateDidChange_ name:*v20 object:0];

    [(CSDeviceBlockViewController *)v7 _setUpNetworkPathMonitor];
  }

  return v7;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(SBFDeviceBlockTimer *)self->_blockTimer invalidate];
  v4.receiver = self;
  v4.super_class = (Class)CSDeviceBlockViewController;
  [(CSCoverSheetViewControllerBase *)&v4 dealloc];
}

+ (Class)viewClass
{
  return (Class)objc_opt_class();
}

- (id)view
{
  v4.receiver = self;
  v4.super_class = (Class)CSDeviceBlockViewController;
  v2 = [(CSModalViewControllerBase *)&v4 view];

  return v2;
}

- (id)viewIfLoaded
{
  v4.receiver = self;
  v4.super_class = (Class)CSDeviceBlockViewController;
  v2 = [(CSModalViewControllerBase *)&v4 viewIfLoaded];

  return v2;
}

- (void)viewDidLoad
{
  v3 = (SBFDeviceBlockTimer *)[objc_alloc(MEMORY[0x1E4FA5EF0]) initWithDeviceBlockStatusProvider:self->_blockStatusProvider];
  blockTimer = self->_blockTimer;
  self->_blockTimer = v3;

  objc_initWeak(&location, self);
  id v5 = self->_blockTimer;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __42__CSDeviceBlockViewController_viewDidLoad__block_invoke;
  v19[3] = &unk_1E6AD92C8;
  objc_copyWeak(&v20, &location);
  [(SBFDeviceBlockTimer *)v5 setHandler:v19];
  v6 = [(CSDeviceBlockViewController *)self view];
  [v6 setDeviceBlockDelegate:self];
  v7 = [(SBFDeviceBlockTimer *)self->_blockTimer titleText];
  [v6 setTitleText:v7];

  v8 = [(SBFDeviceBlockTimer *)self->_blockTimer subtitleText];
  [v6 setSubtitleText:v8];

  v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v10 = [v9 localizedStringForKey:@"DASHBOARD_BLOCK_ERASE_LINK" value:&stru_1F3020248 table:@"CoverSheet"];
  [v6 setSecondarySubtitleText:v10];

  v11 = [MEMORY[0x1E4F4F8B8] preferredFontProvider];
  v12 = [v11 preferredFontForTextStyle:*MEMORY[0x1E4F43870] hiFontStyle:1];
  [v6 setOverrideSecondarySubtitleFont:v12];

  v13 = [MEMORY[0x1E4F428B8] grayColor];
  [v6 setOverrideSecondarySubtitleTextColor:v13];

  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() == 2) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  nw_path_monitor_t v14 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v15 = [v14 userInterfaceIdiom];

  if (v15 != 1)
  {
LABEL_5:
    v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    dispatch_queue_t v17 = [v16 localizedStringForKey:@"DASHBOARD_BLOCK_EMERGENCY_BUTTON" value:&stru_1F3020248 table:@"CoverSheet"];
    [v6 setSecondaryActionButtonText:v17];
  }
LABEL_6:
  v18.receiver = self;
  v18.super_class = (Class)CSDeviceBlockViewController;
  [(CSModalViewControllerBase *)&v18 viewDidLoad];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __42__CSDeviceBlockViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _updateText];
    v2 = [v3 view];
    [v2 updateViewForUnblockDeviceView];

    id WeakRetained = v3;
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CSDeviceBlockViewController;
  [(CSCoverSheetViewControllerBase *)&v4 viewDidDisappear:a3];
  [(SBFDeviceBlockTimer *)self->_blockTimer invalidate];
}

- (void)aggregateAppearance:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CSDeviceBlockViewController;
  id v4 = a3;
  [(CSModalViewControllerBase *)&v16 aggregateAppearance:v4];
  id v5 = +[CSComponent homeAffordance];
  v6 = [v5 priority:80];
  v7 = [(CSCoverSheetViewControllerBase *)self appearanceIdentifier];
  v8 = [v6 identifier:v7];
  v9 = [v8 hidden:1];
  [v4 addComponent:v9];

  uint64_t v10 = +[CSComponent proudLock];
  v11 = [v10 priority:80];
  v12 = [v11 hidden:1];
  [v4 addComponent:v12];

  v13 = +[CSComponent whitePoint];
  nw_path_monitor_t v14 = [v13 priority:80];
  uint64_t v15 = [v14 hidden:1];
  [v4 addComponent:v15];
}

- (void)aggregateBehavior:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDeviceBlockViewController *)self viewIfLoaded];
  if ([v5 isShowingAuthenticationView])
  {
    uint64_t v6 = 9;
  }
  else
  {
    v7 = [(CSDeviceBlockViewController *)self viewIfLoaded];
    if (([v7 isShowingUnblockDeviceView] & 1) != 0 || self->_attemptingErase)
    {
      uint64_t v6 = 9;
    }
    else if (self->_attemptingRecovery)
    {
      uint64_t v6 = 9;
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)CSDeviceBlockViewController;
  [(CSModalViewControllerBase *)&v8 aggregateBehavior:v4];
  [v4 addRestrictedCapabilities:1048632];
  [v4 setIdleTimerDuration:v6];
}

- (int64_t)presentationPriority
{
  return 570;
}

- (void)handleSecondaryActionForView:(id)a3
{
  if (![(CSDeviceBlockViewController *)self _shouldShowUnblockDeviceButton])
  {
    id v4 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v5 = [v4 userInterfaceIdiom];

    if ((v5 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
      id v6 = +[CSAction actionWithType:2];
      [(CSCoverSheetViewControllerBase *)self sendAction:v6];
    }
  }
}

- (void)handleEmergencyButtonAction
{
  id v3 = +[CSAction actionWithType:2];
  [(CSCoverSheetViewControllerBase *)self sendAction:v3];
}

- (void)authViewController:(id)a3 didConfirmEraseAfterAuthenticationWithResults:(id)a4 shouldEraseDataPlan:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = (CSEraseDeviceAuthViewController *)a3;
  uint64_t v10 = SBLogDashBoard();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = @"NO";
    if (v5) {
      v11 = @"YES";
    }
    int v14 = 138412290;
    uint64_t v15 = v11;
    _os_log_impl(&dword_1D839D000, v10, OS_LOG_TYPE_DEFAULT, "Device erase attempt confirmed after authentication, will erase data plan: %@", (uint8_t *)&v14, 0xCu);
  }

  authenticationViewController = self->_authenticationViewController;
  if (authenticationViewController == v9)
  {
    self->_shouldEraseDataPlan = v5;
    v13 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F4EDE8]];
    [(ACAccount *)self->_findMyAccount aa_setPassword:v13];
    [(CSDeviceBlockViewController *)self _attemptErase];
  }
}

- (void)authViewControllerDidCancelToEraseDeviceAfterAuthentication:(id)a3
{
  if (self->_authenticationViewController == a3)
  {
    id v3 = SBLogDashBoard();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1D839D000, v3, OS_LOG_TYPE_DEFAULT, "Device erase attempt canceled after authentication", v4, 2u);
    }
  }
}

- (void)cancelButtonTapped
{
  id v3 = [(CSDeviceBlockViewController *)self view];
  id v4 = v3;
  authenticationViewController = self->_authenticationViewController;
  if (authenticationViewController)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __49__CSDeviceBlockViewController_cancelButtonTapped__block_invoke;
    v10[3] = &unk_1E6AD8AF8;
    id v11 = v3;
    v12 = self;
    [(CSDeviceBlockViewController *)self bs_removeChildViewController:authenticationViewController animated:0 transitionBlock:v10];
  }
  deviceUnblockViewController = self->_deviceUnblockViewController;
  if (deviceUnblockViewController)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __49__CSDeviceBlockViewController_cancelButtonTapped__block_invoke_2;
    v7[3] = &unk_1E6AD8AF8;
    id v8 = v4;
    v9 = self;
    [(CSDeviceBlockViewController *)self bs_removeChildViewController:deviceUnblockViewController animated:0 transitionBlock:v7];
  }
}

void __49__CSDeviceBlockViewController_cancelButtonTapped__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v6 = a2;
  [v3 setAuthenticationView:0];
  uint64_t v4 = *(void *)(a1 + 40);
  BOOL v5 = *(void **)(v4 + 1056);
  *(void *)(v4 + 1056) = 0;

  v6[2]();
}

void __49__CSDeviceBlockViewController_cancelButtonTapped__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v6 = a2;
  [v3 setUnblockDeviceView:0];
  uint64_t v4 = *(void *)(a1 + 40);
  BOOL v5 = *(void **)(v4 + 1064);
  *(void *)(v4 + 1064) = 0;

  v6[2]();
}

- (void)deviceUnblockViewModelHandleDidRequestCancel
{
  id v3 = [(CSDeviceBlockViewController *)self view];
  uint64_t v4 = v3;
  deviceUnblockViewController = self->_deviceUnblockViewController;
  if (deviceUnblockViewController)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __75__CSDeviceBlockViewController_deviceUnblockViewModelHandleDidRequestCancel__block_invoke;
    v6[3] = &unk_1E6AD8AF8;
    v6[4] = self;
    id v7 = v3;
    [(CSDeviceBlockViewController *)self bs_removeChildViewController:deviceUnblockViewController animated:0 transitionBlock:v6];
  }
}

void __75__CSDeviceBlockViewController_deviceUnblockViewModelHandleDidRequestCancel__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v6 = a2;
  [v3 _updateText];
  [*(id *)(a1 + 40) setUnblockDeviceView:0];
  uint64_t v4 = *(void *)(a1 + 32);
  BOOL v5 = *(void **)(v4 + 1064);
  *(void *)(v4 + 1064) = 0;

  [*(id *)(a1 + 32) rebuildBehavior];
  v6[2]();
}

- (void)_presentUnblockDeviceViewController
{
  if (_presentUnblockDeviceViewController_onceToken != -1) {
    dispatch_once(&_presentUnblockDeviceViewController_onceToken, &__block_literal_global_19);
  }
  dispatch_async((dispatch_queue_t)_presentUnblockDeviceViewController_forgotPasscodeEventQueue, &__block_literal_global_76);
  id v3 = [(CSDeviceBlockViewController *)self view];
  uint64_t v4 = [(CSDeviceBlockViewController *)self _unblockPolicy];
  int v5 = [v4 canUnblockDeviceUsingRecovery];
  id v6 = off_1E6AD78A8;
  if (!v5) {
    id v6 = off_1E6AD7848;
  }
  id v7 = (void *)[objc_alloc(*v6) initWithUnblockPolicy:v4 blockViewController:self];
  id v8 = [[CSDeviceUnblockViewController alloc] initWithViewModel:v7];
  deviceUnblockViewController = self->_deviceUnblockViewController;
  self->_deviceUnblockViewController = v8;

  uint64_t v10 = self->_deviceUnblockViewController;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  int v14 = __66__CSDeviceBlockViewController__presentUnblockDeviceViewController__block_invoke_3;
  uint64_t v15 = &unk_1E6AD8AF8;
  id v16 = v3;
  dispatch_queue_t v17 = self;
  id v11 = v3;
  [(CSDeviceBlockViewController *)self bs_addChildViewController:v10 animated:0 transitionBlock:&v12];
  [(CSCoverSheetViewControllerBase *)self rebuildAppearance];
  [v11 setNeedsLayout];
}

void __66__CSDeviceBlockViewController__presentUnblockDeviceViewController__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.springboard.mobilekeybag.forgotPasscodeEvent", v2);
  v1 = (void *)_presentUnblockDeviceViewController_forgotPasscodeEventQueue;
  _presentUnblockDeviceViewController_forgotPasscodeEventQueue = (uint64_t)v0;
}

uint64_t __66__CSDeviceBlockViewController__presentUnblockDeviceViewController__block_invoke_2()
{
  return MEMORY[0x1F412F970](0);
}

void __66__CSDeviceBlockViewController__presentUnblockDeviceViewController__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void **)(*(void *)(a1 + 40) + 1064);
  v9 = a2;
  int v5 = [v4 view];
  [v3 setUnblockDeviceView:v5];

  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = *(void **)(v6 + 1064);
  id v8 = [*(id *)(v6 + 1080) timeoutText];
  [v7 setTimeoutString:v8];

  [*(id *)(a1 + 40) rebuildBehavior];
  v9[2]();
}

- (void)_presentAuthenticationViewController
{
  id v3 = [(CSDeviceBlockViewController *)self view];
  if (!self->_authenticationViewController)
  {
    uint64_t v4 = objc_alloc_init(CSEraseDeviceAuthViewController);
    authenticationViewController = self->_authenticationViewController;
    self->_authenticationViewController = v4;

    [(CSEraseDeviceAuthViewController *)self->_authenticationViewController setDelegate:self];
    objc_initWeak(&location, self);
    uint64_t v6 = self->_authenticationViewController;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __67__CSDeviceBlockViewController__presentAuthenticationViewController__block_invoke;
    v7[3] = &unk_1E6ADA548;
    objc_copyWeak(&v10, &location);
    id v8 = v3;
    v9 = self;
    [(CSDeviceBlockViewController *)self bs_addChildViewController:v6 animated:0 transitionBlock:v7];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __67__CSDeviceBlockViewController__presentAuthenticationViewController__block_invoke(uint64_t a1, void *a2)
{
  v22 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    int v5 = [*(id *)(*(void *)(a1 + 40) + 1056) view];
    [v4 setAuthenticationView:v5];

    uint64_t v6 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v7 = [v6 userInterfaceIdiom];

    unint64_t v8 = v7 & 0xFFFFFFFFFFFFFFFBLL;
    v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v10 = v9;
    if (v8 == 1) {
      id v11 = @"DASHBOARD_BLOCK_ERASE_AUTH_MESSAGE_PAD";
    }
    else {
      id v11 = @"DASHBOARD_BLOCK_ERASE_AUTH_MESSAGE_PHONE";
    }
    uint64_t v12 = [v9 localizedStringForKey:v11 value:&stru_1F3020248 table:@"CoverSheet"];

    uint64_t v13 = NSString;
    int v14 = *(id **)(a1 + 40);
    uint64_t v15 = objc_msgSend(v14[140], "aa_primaryEmail");
    id v16 = [v14 _obfuscateUsername:v15];
    dispatch_queue_t v17 = objc_msgSend(v13, "stringWithFormat:", v12, v16);

    [*(id *)(*(void *)(a1 + 40) + 1056) setSubtitleLabelText:v17];
    id v18 = objc_alloc_init(MEMORY[0x1E4F4F100]);
    v19 = [*(id *)(*(void *)(a1 + 40) + 1120) username];
    [v18 setUsername:v19];

    id v20 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 1120), "aa_altDSID");
    [v18 setAltDSID:v20];

    [v18 setAuthenticationType:2];
    [v18 setShouldPromptForPasswordOnly:1];
    [v18 setIsEphemeral:1];
    [v18 setIsUsernameEditable:0];
    [v18 setMaximumLoginAttempts:2];
    SEL v21 = NSSelectorFromString(&cfstr_Setallowauthen.isa);
    if (objc_opt_respondsToSelector()) {
      ((void (*)(id, SEL, uint64_t))[v18 methodForSelector:v21])(v18, v21, 1);
    }
    [*(id *)(*(void *)(a1 + 40) + 1056) setAuthContext:v18];
    [WeakRetained rebuildBehavior];
    v22[2]();
  }
}

- (void)_updateText
{
  id v3 = [(CSDeviceBlockViewController *)self viewIfLoaded];
  uint64_t v4 = [(SBFDeviceBlockTimer *)self->_blockTimer subtitleText];
  [v3 setSubtitleText:v4];

  if (_os_feature_enabled_impl())
  {
    BOOL v5 = [(CSDeviceBlockViewController *)self _shouldShowUnblockDeviceButton];
    uint64_t v6 = [(CSDeviceBlockViewController *)self viewIfLoaded];
    id v7 = v6;
    if (v5) {
      [v6 addDeviceUnblockButtons];
    }
    else {
      [v6 removeDeviceUnblockButtons];
    }
  }
}

- (void)_handleDeviceLocatorStateDidChange:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__CSDeviceBlockViewController__handleDeviceLocatorStateDidChange___block_invoke;
  block[3] = &unk_1E6AD87F8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __66__CSDeviceBlockViewController__handleDeviceLocatorStateDidChange___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) _isFindMyChangingState] & 1) == 0)
  {
    uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 1096);
    if (v2)
    {
      (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, 1);
      uint64_t v3 = *(void *)(a1 + 32);
      uint64_t v4 = *(void **)(v3 + 1096);
      *(void *)(v3 + 1096) = 0;
    }
  }
}

- (void)_attemptErase
{
  if (_os_feature_enabled_impl())
  {
    self->_attemptingErase = 1;
    [(CSCoverSheetViewControllerBase *)self rebuildBehavior];
    objc_initWeak(&location, self);
    findMyAccount = self->_findMyAccount;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __44__CSDeviceBlockViewController__attemptErase__block_invoke;
    v4[3] = &unk_1E6ADA570;
    objc_copyWeak(&v5, &location);
    [(CSDeviceBlockViewController *)self _attemptToDisableFindMyWithAccount:findMyAccount completion:v4];
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __44__CSDeviceBlockViewController__attemptErase__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = SBLogDashBoard();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __44__CSDeviceBlockViewController__attemptErase__block_invoke_cold_1(v3);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained[1128] = 0;
    [WeakRetained rebuildBehavior];
  }
}

- (void)_attemptRecovery
{
  self->_attemptingRecovery = 1;
  [(CSCoverSheetViewControllerBase *)self rebuildBehavior];
  objc_initWeak(&location, self);
  passcodeRecovery = self->_passcodeRecovery;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__CSDeviceBlockViewController__attemptRecovery__block_invoke;
  v4[3] = &unk_1E6ADA570;
  objc_copyWeak(&v5, &location);
  [(CSDevicePasscodeRecoveryService *)passcodeRecovery startRecoveryInParentVC:self completion:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __47__CSDeviceBlockViewController__attemptRecovery__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained[1129] = 0;
    [WeakRetained rebuildBehavior];
    if (!v3) {
      goto LABEL_6;
    }
    uint64_t v6 = SBLogDashBoard();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __47__CSDeviceBlockViewController__attemptRecovery__block_invoke_cold_1();
    }

    id v7 = [v5 _unblockPolicy];
    char v8 = [v7 canUnblockDeviceUsingRecovery];

    if ((v8 & 1) == 0) {
LABEL_6:
    }
      [v5 deviceUnblockViewModelHandleDidRequestCancel];
  }
}

- (BOOL)_isFindMyEnabled
{
  uint64_t v2 = [getAAUIDeviceLocatorServiceClass() sharedInstance];
  char v3 = [v2 isEnabled];

  return v3;
}

- (BOOL)_isFindMyChangingState
{
  uint64_t v2 = [getAAUIDeviceLocatorServiceClass() sharedInstance];
  char v3 = [v2 isChangingState];

  return v3;
}

- (void)_setUpNetworkPathMonitor
{
  objc_initWeak(&location, self);
  networkPathMonitor = self->_networkPathMonitor;
  update_handler[0] = MEMORY[0x1E4F143A8];
  update_handler[1] = 3221225472;
  update_handler[2] = __55__CSDeviceBlockViewController__setUpNetworkPathMonitor__block_invoke;
  update_handler[3] = &unk_1E6ADA598;
  objc_copyWeak(&v6, &location);
  update_handler[4] = self;
  nw_path_monitor_set_update_handler(networkPathMonitor, update_handler);
  nw_path_monitor_set_queue((nw_path_monitor_t)self->_networkPathMonitor, (dispatch_queue_t)self->_networkMonitorQueue);
  uint64_t v4 = [(CSDeviceBlockViewController *)self networkPathMonitor];
  nw_path_monitor_start(v4);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __55__CSDeviceBlockViewController__setUpNetworkPathMonitor__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_initWeak(&location, WeakRetained);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __55__CSDeviceBlockViewController__setUpNetworkPathMonitor__block_invoke_2;
    v5[3] = &unk_1E6AD9390;
    objc_copyWeak(&v6, &location);
    v5[4] = *(void *)(a1 + 32);
    [WeakRetained _setNetworkMonitorUpdateHandlerWithPath:v3 completion:v5];
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __55__CSDeviceBlockViewController__setUpNetworkPathMonitor__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55__CSDeviceBlockViewController__setUpNetworkPathMonitor__block_invoke_3;
  v3[3] = &unk_1E6AD87F8;
  v3[4] = *(void *)(a1 + 32);
  [WeakRetained _getUserAccountWithCompletion:v3];
}

void __55__CSDeviceBlockViewController__setUpNetworkPathMonitor__block_invoke_3(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__CSDeviceBlockViewController__setUpNetworkPathMonitor__block_invoke_4;
  block[3] = &unk_1E6AD87F8;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __55__CSDeviceBlockViewController__setUpNetworkPathMonitor__block_invoke_4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1080) start];
}

- (void)_setNetworkMonitorUpdateHandlerWithPath:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__CSDeviceBlockViewController__setNetworkMonitorUpdateHandlerWithPath_completion___block_invoke;
  block[3] = &unk_1E6AD9050;
  id v11 = v6;
  uint64_t v12 = self;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __82__CSDeviceBlockViewController__setNetworkMonitorUpdateHandlerWithPath_completion___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 40) + 1130) = nw_path_get_status(*(nw_path_t *)(a1 + 32)) == nw_path_status_satisfied;
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_getUserAccountWithCompletion:(id)a3
{
  id v4 = a3;
  accountStore = self->_accountStore;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__CSDeviceBlockViewController__getUserAccountWithCompletion___block_invoke;
  v7[3] = &unk_1E6ADA5C0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(ACAccountStore *)accountStore aa_primaryAppleAccountWithCompletion:v7];
}

void __61__CSDeviceBlockViewController__getUserAccountWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = SBLogDashBoard();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __61__CSDeviceBlockViewController__getUserAccountWithCompletion___block_invoke_cold_1(v6);
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 1120);
  *(void *)(v8 + 1120) = v5;
  id v10 = v5;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_attemptToDisableFindMyWithAccount:(id)a3 completion:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = SBLogDashBoard();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    [(CSDeviceBlockViewController *)self _isFindMyEnabled];
    id v9 = NSStringFromBOOL();
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v9;
    _os_log_impl(&dword_1D839D000, v8, OS_LOG_TYPE_DEFAULT, "Attempting to disable FindMy with FindMy enabled: %@", (uint8_t *)&buf, 0xCu);
  }
  if ([(CSDeviceBlockViewController *)self _isFindMyChangingState])
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __77__CSDeviceBlockViewController__attemptToDisableFindMyWithAccount_completion___block_invoke;
    v18[3] = &unk_1E6ADA5E8;
    id v20 = v7;
    v18[4] = self;
    id v19 = v6;
    id v10 = self;
    uint64_t v11 = MEMORY[0x1D9487300](v18);
    id pendingAction = v10->_pendingAction;
    v10->_id pendingAction = (id)v11;

    [(CSDeviceBlockViewController *)v10 _cancelPendingActionAfterDelay:10.0];
  }
  else if ([(CSDeviceBlockViewController *)self _isFindMyEnabled])
  {
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x2050000000;
    id v13 = (void *)getAAUIDeviceLocatorConfirmationUtilitiesContextClass_softClass;
    uint64_t v24 = getAAUIDeviceLocatorConfirmationUtilitiesContextClass_softClass;
    if (!getAAUIDeviceLocatorConfirmationUtilitiesContextClass_softClass)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      uint64_t v26 = __getAAUIDeviceLocatorConfirmationUtilitiesContextClass_block_invoke;
      v27 = &unk_1E6AD94F0;
      v28 = &v21;
      __getAAUIDeviceLocatorConfirmationUtilitiesContextClass_block_invoke((uint64_t)&buf);
      id v13 = (void *)v22[3];
    }
    int v14 = v13;
    _Block_object_dispose(&v21, 8);
    id v10 = (CSDeviceBlockViewController *)objc_alloc_init(v14);
    [(CSDeviceBlockViewController *)v10 setAccount:v6];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __77__CSDeviceBlockViewController__attemptToDisableFindMyWithAccount_completion___block_invoke_2;
    v16[3] = &unk_1E6ADA610;
    v16[4] = self;
    id v17 = v7;
    uint64_t v15 = self;
    [(CSDeviceBlockViewController *)v15 _performFMIPAuthenticationForContext:v10 account:v6 completion:v16];
  }
  else
  {
    id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CSDeviceBlockEraseErrorDomain" code:3 userInfo:0];
    (*((void (**)(id, CSDeviceBlockViewController *))v7 + 2))(v7, v10);
  }
}

void __77__CSDeviceBlockViewController__attemptToDisableFindMyWithAccount_completion___block_invoke(void *a1, int a2)
{
  if (a2)
  {
    uint64_t v2 = a1[6];
    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CSDeviceBlockEraseErrorDomain" code:1 userInfo:0];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v6);
  }
  else
  {
    uint64_t v3 = a1[5];
    uint64_t v4 = a1[6];
    id v5 = (void *)a1[4];
    [v5 _attemptToDisableFindMyWithAccount:v3 completion:v4];
  }
}

void __77__CSDeviceBlockViewController__attemptToDisableFindMyWithAccount_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3)
  {
    uint64_t v4 = [a3 fmipWipeToken];
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = (id)v4;
  [*(id *)(a1 + 32) _disableFindMyInContext:4 withWipeToken:v4 completion:*(void *)(a1 + 40)];
}

- (void)_performFMIPAuthenticationForContext:(id)a3 account:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2050000000;
  id v10 = (void *)getAAFMIPAuthenticateRequestClass_softClass;
  uint64_t v21 = getAAFMIPAuthenticateRequestClass_softClass;
  if (!getAAFMIPAuthenticateRequestClass_softClass)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __getAAFMIPAuthenticateRequestClass_block_invoke;
    v17[3] = &unk_1E6AD94F0;
    v17[4] = &v18;
    __getAAFMIPAuthenticateRequestClass_block_invoke((uint64_t)v17);
    id v10 = (void *)v19[3];
  }
  uint64_t v11 = v10;
  _Block_object_dispose(&v18, 8);
  uint64_t v12 = (void *)[[v11 alloc] initWithAccount:v8];
  id v13 = [v7 customRequestHeaders];
  [v12 setCustomHeaders:v13];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __87__CSDeviceBlockViewController__performFMIPAuthenticationForContext_account_completion___block_invoke;
  v15[3] = &unk_1E6ADA638;
  id v16 = v9;
  id v14 = v9;
  [v12 performRequestWithHandler:v15];
}

void __87__CSDeviceBlockViewController__performFMIPAuthenticationForContext_account_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = SBLogDashBoard();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __87__CSDeviceBlockViewController__performFMIPAuthenticationForContext_account_completion___block_invoke_cold_1(v7);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_disableFindMyInContext:(unint64_t)a3 withWipeToken:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [getAAUIDeviceLocatorServiceClass() sharedInstance];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __80__CSDeviceBlockViewController__disableFindMyInContext_withWipeToken_completion___block_invoke;
  v12[3] = &unk_1E6AD9000;
  v12[4] = self;
  id v13 = v8;
  id v11 = v8;
  [v10 disableInContext:a3 withWipeToken:v9 completion:v12];
}

void __80__CSDeviceBlockViewController__disableFindMyInContext_withWipeToken_completion___block_invoke(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__CSDeviceBlockViewController__disableFindMyInContext_withWipeToken_completion___block_invoke_2;
  block[3] = &unk_1E6AD8E80;
  char v5 = a2;
  uint64_t v2 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v4 = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __80__CSDeviceBlockViewController__disableFindMyInContext_withWipeToken_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    id v11 = __80__CSDeviceBlockViewController__disableFindMyInContext_withWipeToken_completion___block_invoke_3;
    uint64_t v12 = &unk_1E6AD9000;
    id v13 = v2;
    id v14 = *(id *)(a1 + 40);
    id v3 = v2;
    uint64_t v4 = MEMORY[0x1D9487300](&v9);
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 1096);
    *(void *)(v5 + 1096) = v4;

    objc_msgSend(*(id *)(a1 + 32), "_cancelPendingActionAfterDelay:", 10.0, v9, v10, v11, v12, v13);
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = *(void **)(a1 + 32);
    [v8 _eraseDeviceWithCompletion:v7];
  }
}

void __80__CSDeviceBlockViewController__disableFindMyInContext_withWipeToken_completion___block_invoke_3(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v2 = *(void *)(a1 + 40);
    id v3 = *(void **)(a1 + 32);
    [v3 _eraseDeviceWithCompletion:v2];
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CSDeviceBlockEraseErrorDomain" code:1 userInfo:0];
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
  }
}

- (void)_eraseDeviceWithCompletion:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x1E4F61040];
  id v5 = a3;
  id v8 = objc_alloc_init(v4);
  [v8 setHideProgress:0];
  [v8 setEraseDataPlan:self->_shouldEraseDataPlan];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F61048]) initWithMode:4 options:v8 reason:@"BlockedDeviceUserErase"];
  uint64_t v7 = [MEMORY[0x1E4F61050] sharedInstance];
  [v7 resetWithRequest:v6 completion:v5];
}

- (void)_cancelPendingActionAfterDelay:(double)a3
{
  dispatch_time_t v4 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__CSDeviceBlockViewController__cancelPendingActionAfterDelay___block_invoke;
  block[3] = &unk_1E6AD87F8;
  void block[4] = self;
  dispatch_after(v4, MEMORY[0x1E4F14428], block);
}

void __62__CSDeviceBlockViewController__cancelPendingActionAfterDelay___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 1096);
  if (v2)
  {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0);
    uint64_t v3 = *(void *)(a1 + 32);
    dispatch_time_t v4 = *(void **)(v3 + 1096);
    *(void *)(v3 + 1096) = 0;
  }
}

- (id)_obfuscateUsername:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 rangeOfString:@"@"] - 1;
  id v5 = [&stru_1F3020248 stringByPaddingToLength:4 withString:@"*" startingAtIndex:0];
  id v6 = objc_msgSend(v3, "stringByReplacingCharactersInRange:withString:", 1, v4, v5);

  return v6;
}

- (BOOL)_shouldShowUnblockDeviceButton
{
  uint64_t v2 = [(CSDeviceBlockViewController *)self _unblockPolicy];
  char v3 = [v2 canUnblockDevice];

  return v3;
}

- (id)_unblockPolicy
{
  char v3 = [CSDeviceUnblockPolicy alloc];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__CSDeviceBlockViewController__unblockPolicy__block_invoke;
  v7[3] = &unk_1E6ADA660;
  void v7[4] = self;
  uint64_t v4 = __45__CSDeviceBlockViewController__unblockPolicy__block_invoke((uint64_t)v7);
  id v5 = [(CSDeviceUnblockPolicy *)v3 initWithEnvironment:v4];

  return v5;
}

CSDeviceUnblockPolicyEnvironment *__45__CSDeviceBlockViewController__unblockPolicy__block_invoke(uint64_t a1)
{
  uint64_t v2 = [CSDeviceUnblockPolicyEnvironment alloc];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__CSDeviceBlockViewController__unblockPolicy__block_invoke_2;
  v5[3] = &unk_1E6AD8718;
  v5[4] = *(void *)(a1 + 32);
  char v3 = [(CSDeviceUnblockPolicyEnvironment *)v2 initWithBuilder:v5];

  return v3;
}

void __45__CSDeviceBlockViewController__unblockPolicy__block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setIsDeviceInternetConnectionActive:*(unsigned __int8 *)(*(void *)(a1 + 32) + 1130)];
  [v4 setIsUserFindMyAccountPresent:*(void *)(*(void *)(a1 + 32) + 1120) != 0];
  if ([*(id *)(*(void *)(a1 + 32) + 1080) isUserRequestedEraseEnabled]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 1088) alwaysEnableUserRequestedErase];
  }
  [v4 setIsUserRequestedEraseEnabled:v3];
  objc_msgSend(v4, "setIsPasscodeGracePeriodUsable:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1072), "canStartRecovery"));
}

- (OS_nw_path_monitor)networkPathMonitor
{
  return self->_networkPathMonitor;
}

- (OS_dispatch_queue)networkMonitorQueue
{
  return self->_networkMonitorQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkMonitorQueue, 0);
  objc_storeStrong((id *)&self->_networkPathMonitor, 0);
  objc_storeStrong((id *)&self->_findMyAccount, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_accountAccessQueue, 0);
  objc_storeStrong(&self->_pendingAction, 0);
  objc_storeStrong((id *)&self->_lockScreenSettings, 0);
  objc_storeStrong((id *)&self->_blockTimer, 0);
  objc_storeStrong((id *)&self->_passcodeRecovery, 0);
  objc_storeStrong((id *)&self->_deviceUnblockViewController, 0);
  objc_storeStrong((id *)&self->_authenticationViewController, 0);

  objc_storeStrong((id *)&self->_blockStatusProvider, 0);
}

- (void)initWithDeviceBlockStatusProvider:.cold.1()
{
  dispatch_queue_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getAAUIDeviceLocatorStateDidChangeNotification(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CSDeviceBlockViewController.m", 41, @"%s", dlerror());

  __break(1u);
}

void __44__CSDeviceBlockViewController__attemptErase__block_invoke_cold_1(void *a1)
{
  v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_6(&dword_1D839D000, v2, v3, "Failed attempt to disable FindMy with error: %@", v4, v5, v6, v7, v8);
}

void __47__CSDeviceBlockViewController__attemptRecovery__block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_1D839D000, v0, OS_LOG_TYPE_ERROR, "Failed to recover passcode with error: %@", v1, 0xCu);
}

void __61__CSDeviceBlockViewController__getUserAccountWithCompletion___block_invoke_cold_1(void *a1)
{
  v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_6(&dword_1D839D000, v2, v3, "Error while getting primary Apple account: %@", v4, v5, v6, v7, v8);
}

void __87__CSDeviceBlockViewController__performFMIPAuthenticationForContext_account_completion___block_invoke_cold_1(void *a1)
{
  v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_6(&dword_1D839D000, v2, v3, "Request to authenticate FindMy IP failed with error: %@", v4, v5, v6, v7, v8);
}

@end