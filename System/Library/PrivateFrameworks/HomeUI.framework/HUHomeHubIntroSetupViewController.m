@interface HUHomeHubIntroSetupViewController
- (BOOL)_limitToNonScrollingContentHeight;
- (BOOL)isFinalStep;
- (BOOL)isViewVisible;
- (BOOL)moreThanOneHome;
- (BOOL)needsToPresentUpgradeFailedAlert;
- (Class)onboardingFlowClass;
- (HFHomeKitDispatcher)homeKitDispatcher;
- (HUConfigurationViewControllerDelegate)delegate;
- (HUHomeHubIntroSetupViewController)initWithHomes:(id)a3;
- (OBBoldTrayButton)commitButton;
- (OBLinkTrayButton)cancelButton;
- (id)_commitOrContinueButtonTitle;
- (void)_cancelFlow;
- (void)_commitOrContinue;
- (void)_presentUpgradeFailedAlert:(id)a3 message:(id)a4 retryTitle:(id)a5 retryBlock:(id)a6 cancelBlock:(id)a7;
- (void)setCancelButton:(id)a3;
- (void)setCommitButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHomeKitDispatcher:(id)a3;
- (void)setIsFinalStep:(BOOL)a3;
- (void)setIsViewVisible:(BOOL)a3;
- (void)setMoreThanOneHome:(BOOL)a3;
- (void)setNeedsToPresentUpgradeFailedAlert:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HUHomeHubIntroSetupViewController

- (HUHomeHubIntroSetupViewController)initWithHomes:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 count];
  BOOL v6 = v5 > 1;
  if (v5 > 1)
  {
    v15 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateMigrationUpgradeHomesTitle", @"HUSoftwareUpdateMigrationUpgradeHomesTitle", 1);
    v16 = @"HUSoftwareUpdateMigrationUpgradeHomesDescription";
  }
  else
  {
    v7 = [v4 firstObject];
    v8 = objc_msgSend(v7, "hf_displayName");
    v15 = HULocalizedStringWithFormat(@"HUSoftwareUpdateMigrationUpgradeSpecificHomeTitle", @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v8);

    v16 = @"HUSoftwareUpdateMigrationUpgradeHomeDescription";
  }
  v17 = _HULocalizedStringWithDefaultValue(v16, v16, 1);
  v18 = (void *)MEMORY[0x1E4F42A98];
  v19 = objc_msgSend(MEMORY[0x1E4F428B8], "hf_keyColor");
  v20 = [v18 configurationWithHierarchicalColor:v19];

  v21 = [MEMORY[0x1E4F42A98] configurationWithPointSize:100.0];
  v22 = [v21 configurationByApplyingConfiguration:v20];
  v23 = [MEMORY[0x1E4F42A80] systemImageNamed:@"homekit"];
  v24 = [v23 imageWithConfiguration:v22];

  v30.receiver = self;
  v30.super_class = (Class)HUHomeHubIntroSetupViewController;
  v25 = [(HUImageOBWelcomeController *)&v30 initWithTitle:v15 detailText:v17 icon:0 contentImage:v24];
  v26 = v25;
  if (v25)
  {
    v25->_moreThanOneHome = v6;
    uint64_t v27 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    homeKitDispatcher = v26->_homeKitDispatcher;
    v26->_homeKitDispatcher = (HFHomeKitDispatcher *)v27;
  }
  return v26;
}

- (void)viewDidLoad
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)HUHomeHubIntroSetupViewController;
  [(HUImageOBWelcomeController *)&v24 viewDidLoad];
  id v4 = [(HUHomeHubIntroSetupViewController *)self headerView];
  unint64_t v5 = [v4 subviews];
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:v5 withIDDictionary:&unk_1F19B5EF8];

  BOOL v6 = [MEMORY[0x1E4F83A80] boldButton];
  [(HUHomeHubIntroSetupViewController *)self setCommitButton:v6];

  v7 = [(HUHomeHubIntroSetupViewController *)self commitButton];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  v8 = [(HUHomeHubIntroSetupViewController *)self commitButton];
  uint64_t v9 = [(HUHomeHubIntroSetupViewController *)self _commitOrContinueButtonTitle];
  [v8 setTitle:v9 forState:0];

  uint64_t v10 = [(HUHomeHubIntroSetupViewController *)self commitButton];
  [v10 setAccessibilityIdentifier:@"Home.OnboardingView.HomeHubMigration.IntroSetUp.CommitOrContinueButton"];

  uint64_t v11 = [(HUHomeHubIntroSetupViewController *)self commitButton];
  [v11 addTarget:self action:sel__commitOrContinue forControlEvents:64];

  uint64_t v12 = [(HUHomeHubIntroSetupViewController *)self buttonTray];
  uint64_t v13 = [(HUHomeHubIntroSetupViewController *)self commitButton];
  [v12 addButton:v13];

  uint64_t v14 = [MEMORY[0x1E4F83AB8] linkButton];
  [(HUHomeHubIntroSetupViewController *)self setCancelButton:v14];

  v15 = [(HUHomeHubIntroSetupViewController *)self cancelButton];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

  v16 = [(HUHomeHubIntroSetupViewController *)self cancelButton];
  v17 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateMigrationUpgradeLaterTitle", @"HUSoftwareUpdateMigrationUpgradeLaterTitle", 1);
  [v16 setTitle:v17 forState:0];

  v18 = [(HUHomeHubIntroSetupViewController *)self cancelButton];
  [v18 setAccessibilityIdentifier:@"Home.OnboardingView.HomeHubMigration.IntroSetUp.UpgradeLater"];

  v19 = [(HUHomeHubIntroSetupViewController *)self cancelButton];
  [v19 addTarget:self action:sel__cancelFlow forControlEvents:64];

  v20 = [(HUHomeHubIntroSetupViewController *)self buttonTray];
  v21 = [(HUHomeHubIntroSetupViewController *)self cancelButton];
  [v20 addButton:v21];

  [(HUHomeHubIntroSetupViewController *)self setModalInPresentation:1];
  v22 = HFLogForCategory();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v26 = self;
    __int16 v27 = 2112;
    v28 = v23;
    _os_log_impl(&dword_1BE345000, v22, OS_LOG_TYPE_DEFAULT, "%@:%@: presented: HUHomeHubSharedUserWarningViewController", buf, 0x16u);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(HUHomeHubIntroSetupViewController *)self setIsViewVisible:1];
  if ([(HUHomeHubIntroSetupViewController *)self needsToPresentUpgradeFailedAlert])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __52__HUHomeHubIntroSetupViewController_viewWillAppear___block_invoke;
    aBlock[3] = &unk_1E6386018;
    aBlock[4] = self;
    unint64_t v5 = _Block_copy(aBlock);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __52__HUHomeHubIntroSetupViewController_viewWillAppear___block_invoke_2;
    v10[3] = &unk_1E6386018;
    v10[4] = self;
    BOOL v6 = _Block_copy(v10);
    v7 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateMigrationFailedAlertTitle", @"HUSoftwareUpdateMigrationFailedAlertTitle", 1);
    v8 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateMigrationFailedAlertMessage", @"HUSoftwareUpdateMigrationFailedAlertMessage", 1);
    [(HUHomeHubIntroSetupViewController *)self _presentUpgradeFailedAlert:v7 message:v8 retryTitle:0 retryBlock:v5 cancelBlock:v6];
  }
  v9.receiver = self;
  v9.super_class = (Class)HUHomeHubIntroSetupViewController;
  [(HUHomeHubIntroSetupViewController *)&v9 viewWillAppear:v3];
}

uint64_t __52__HUHomeHubIntroSetupViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _commitOrContinue];
}

uint64_t __52__HUHomeHubIntroSetupViewController_viewWillAppear___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelFlow];
}

- (BOOL)_limitToNonScrollingContentHeight
{
  return 1;
}

- (id)_commitOrContinueButtonTitle
{
  if ([(HUHomeHubIntroSetupViewController *)self moreThanOneHome]) {
    BOOL v3 = @"HUSoftwareUpdateMigrationUpgradeHomesTitle";
  }
  else {
    BOOL v3 = @"HUSoftwareUpdateMigrationUpgradeHomeTitle";
  }
  id v4 = _HULocalizedStringWithDefaultValue(v3, v3, 1);
  if ([(HUHomeHubIntroSetupViewController *)self isFinalStep])
  {
    id v5 = v4;
  }
  else
  {
    _HULocalizedStringWithDefaultValue(@"HUContinueTitle", @"HUContinueTitle", 1);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  BOOL v6 = v5;

  return v6;
}

- (void)_commitOrContinue
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(a2);
    BOOL v6 = [(HUHomeHubIntroSetupViewController *)self _commitOrContinueButtonTitle];
    *(_DWORD *)buf = 138412802;
    *(void *)objc_super v30 = self;
    *(_WORD *)&v30[8] = 2112;
    v31 = v5;
    __int16 v32 = 2112;
    v33 = v6;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button '%@'", buf, 0x20u);
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__HUHomeHubIntroSetupViewController__commitOrContinue__block_invoke;
  aBlock[3] = &unk_1E6386018;
  aBlock[4] = self;
  v7 = _Block_copy(aBlock);
  v8 = [MEMORY[0x1E4F28F80] processInfo];
  int v9 = [v8 isLowPowerModeEnabled];

  int v10 = [MEMORY[0x1E4F69758] isMonitoredInterfaceWifiOrEthernet];
  int v11 = [MEMORY[0x1E4F69758] isUsingiCloud];
  int v12 = [MEMORY[0x1E4F69758] isCurrentAccount2FAEnabled];
  uint64_t v13 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateMigrationFailedAlertTitle", @"HUSoftwareUpdateMigrationFailedAlertTitle", 1);
  uint64_t v14 = HFLogForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)objc_super v30 = v10;
    *(_WORD *)&v30[4] = 1024;
    *(_DWORD *)&v30[6] = v9;
    LOWORD(v31) = 1024;
    *(_DWORD *)((char *)&v31 + 2) = v11;
    _os_log_impl(&dword_1BE345000, v14, OS_LOG_TYPE_DEFAULT, "HH2 migration can only start if: User is connected to WiFi or Ethernet, and low power mode is not enabled, and logged into iCloud. isWifiOrEthernetReachable = %{BOOL}d, isLowPowerModeEnabled = %{BOOL}d, isLoggedIntoiCloud = %{BOOL}d", buf, 0x14u);
  }

  if (v9 | v10 ^ 1 | v11 & v12 ^ 1)
  {
    if (v9)
    {
      if ([MEMORY[0x1E4F69758] useWLANInsteadOfWiFi]) {
        v15 = @"HUSoftwareUpdateMigrationFailedDueToLowPowerModeAlertMessageWLAN";
      }
      else {
        v15 = @"HUSoftwareUpdateMigrationFailedDueToLowPowerModeAlertMessageWiFi";
      }
    }
    else
    {
      if (v10)
      {
        if ((v11 & 1) == 0)
        {
          uint64_t v23 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateMigrationFailedsignIniCloudTitle", @"HUSoftwareUpdateMigrationFailedsignIniCloudTitle", 1);

          v22 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateMigrationFailedSigninButtonTitle", @"HUSoftwareUpdateMigrationFailedSigninButtonTitle", 1);
          v17 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateMigrationFailedsignIniCloudMessage", @"HUSoftwareUpdateMigrationFailedsignIniCloudMessage", 1);
          v21 = &__block_literal_global_226;
          uint64_t v13 = (void *)v23;
LABEL_24:
          [(HUHomeHubIntroSetupViewController *)self _presentUpgradeFailedAlert:v13 message:v17 retryTitle:v22 retryBlock:v21 cancelBlock:v7];
          goto LABEL_25;
        }
        if ((v12 & 1) == 0)
        {
          v17 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateMigrationFailed2FAMessage", @"HUSoftwareUpdateMigrationFailed2FAMessage", 1);
          v22 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateMigrationFailedSigninButtonTitle", @"HUSoftwareUpdateMigrationFailedSigninButtonTitle", 1);
          v21 = &__block_literal_global_95_1;
          goto LABEL_24;
        }
        v21 = 0;
        v17 = 0;
LABEL_23:
        v22 = 0;
        goto LABEL_24;
      }
      if ([MEMORY[0x1E4F69758] useWLANInsteadOfWiFi]) {
        v15 = @"HUSoftwareUpdateMigrationFailedDueToNoWLANAlertMessageWLAN";
      }
      else {
        v15 = @"HUSoftwareUpdateMigrationFailedDueToNoWiFiAlertMessageWiFi";
      }
    }
    v17 = HULocalizedModelString(v15);
    v21 = 0;
    goto LABEL_23;
  }
  BOOL v16 = [(HUHomeHubIntroSetupViewController *)self isFinalStep];
  v17 = [(HUHomeHubIntroSetupViewController *)self delegate];
  if (v16)
  {
    __int16 v27 = @"HUHomeHub2OnboardingKey_UserInput";
    v28 = &unk_1F19B4D00;
    v18 = (void *)MEMORY[0x1E4F1C9E8];
    v19 = &v28;
    v20 = &v27;
  }
  else
  {
    v25 = @"HUHomeHub2OnboardingKey_UserInput";
    v26 = &unk_1F19B4D18;
    v18 = (void *)MEMORY[0x1E4F1C9E8];
    v19 = &v26;
    v20 = &v25;
  }
  v22 = [v18 dictionaryWithObjects:v19 forKeys:v20 count:1];
  [v17 viewController:self didFinishWithConfigurationResults:v22];
LABEL_25:
}

uint64_t __54__HUHomeHubIntroSetupViewController__commitOrContinue__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelFlow];
}

void __54__HUHomeHubIntroSetupViewController__commitOrContinue__block_invoke_88()
{
  id v2 = [MEMORY[0x1E4F69378] sharedInstance];
  v0 = objc_msgSend(MEMORY[0x1E4F1CB10], "hf_openiCloudPreferencesURL");
  id v1 = (id)[v2 openURL:v0];
}

void __54__HUHomeHubIntroSetupViewController__commitOrContinue__block_invoke_2()
{
  id v2 = [MEMORY[0x1E4F69378] sharedInstance];
  v0 = objc_msgSend(MEMORY[0x1E4F1CB10], "hf_openiCloudPasswordAndSecurityURL");
  id v1 = (id)[v2 openURL:v0];
}

- (void)_cancelFlow
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    int v11 = self;
    __int16 v12 = 2112;
    uint64_t v13 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);
  }
  BOOL v6 = [(HUHomeHubIntroSetupViewController *)self delegate];
  v8 = @"HUHomeHub2OnboardingKey_UserInput";
  int v9 = &unk_1F19B4D30;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  [v6 viewController:self didFinishWithConfigurationResults:v7];
}

- (void)_presentUpgradeFailedAlert:(id)a3 message:(id)a4 retryTitle:(id)a5 retryBlock:(id)a6 cancelBlock:(id)a7
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v18 = HFLogForCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v41 = self;
    __int16 v42 = 2080;
    v43 = "-[HUHomeHubIntroSetupViewController _presentUpgradeFailedAlert:message:retryTitle:retryBlock:cancelBlock:]";
    __int16 v44 = 2112;
    id v45 = v13;
    __int16 v46 = 2112;
    id v47 = v14;
    _os_log_impl(&dword_1BE345000, v18, OS_LOG_TYPE_DEFAULT, "%@:%s presenting alert card: title %@ message %@", buf, 0x2Au);
  }

  if ([(HUHomeHubIntroSetupViewController *)self isViewVisible])
  {
    uint64_t v29 = v17;
    [(HUHomeHubIntroSetupViewController *)self setNeedsToPresentUpgradeFailedAlert:0];
    v19 = [MEMORY[0x1E4F42728] alertControllerWithTitle:v13 message:v14 preferredStyle:1];
    uint64_t v20 = [v15 length];
    if (v16 && v20)
    {
      v21 = (void *)MEMORY[0x1E4F42720];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __106__HUHomeHubIntroSetupViewController__presentUpgradeFailedAlert_message_retryTitle_retryBlock_cancelBlock___block_invoke;
      v35[3] = &unk_1E638FA08;
      id v38 = v16;
      SEL v39 = a2;
      v35[4] = self;
      SEL v22 = a2;
      id v36 = v15;
      id v37 = v13;
      uint64_t v23 = [v21 actionWithTitle:v36 style:0 handler:v35];
      [v19 addAction:v23];

      objc_super v24 = _HULocalizedStringWithDefaultValue(@"HUCancelTitle", @"HUCancelTitle", 1);
    }
    else
    {
      objc_super v24 = _HULocalizedStringWithDefaultValue(@"HUOkTitle", @"HUOkTitle", 1);
      SEL v22 = a2;
    }
    v26 = (void *)MEMORY[0x1E4F42720];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __106__HUHomeHubIntroSetupViewController__presentUpgradeFailedAlert_message_retryTitle_retryBlock_cancelBlock___block_invoke_111;
    v30[3] = &unk_1E638FA08;
    id v33 = v29;
    SEL v34 = v22;
    id v17 = v29;
    v30[4] = self;
    id v31 = v24;
    id v32 = v13;
    id v27 = v24;
    v28 = [v26 actionWithTitle:v27 style:1 handler:v30];
    [v19 addAction:v28];

    [(HUHomeHubIntroSetupViewController *)self presentViewController:v19 animated:1 completion:0];
  }
  else
  {
    [(HUHomeHubIntroSetupViewController *)self setNeedsToPresentUpgradeFailedAlert:1];
    v19 = HFLogForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v25 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v41 = self;
      __int16 v42 = 2112;
      v43 = v25;
      _os_log_impl(&dword_1BE345000, v19, OS_LOG_TYPE_DEFAULT, "%@:%@: Deferring alert presentation since view isn't shown yet", buf, 0x16u);
    }
  }
}

void __106__HUHomeHubIntroSetupViewController__presentUpgradeFailedAlert_message_retryTitle_retryBlock_cancelBlock___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  id v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    int v7 = 138413058;
    uint64_t v8 = v3;
    __int16 v9 = 2112;
    int v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped retry button %@ for alert view with title %@", (uint8_t *)&v7, 0x2Au);
  }
}

void __106__HUHomeHubIntroSetupViewController__presentUpgradeFailedAlert_message_retryTitle_retryBlock_cancelBlock___block_invoke_111(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  id v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    int v7 = 138413058;
    uint64_t v8 = v3;
    __int16 v9 = 2112;
    int v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped cancel button %@ for alert view with title %@", (uint8_t *)&v7, 0x2Au);
  }
}

- (Class)onboardingFlowClass
{
  return (Class)objc_opt_class();
}

- (HUConfigurationViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUConfigurationViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isFinalStep
{
  return self->_isFinalStep;
}

- (void)setIsFinalStep:(BOOL)a3
{
  self->_isFinalStep = a3;
}

- (OBBoldTrayButton)commitButton
{
  return self->_commitButton;
}

- (void)setCommitButton:(id)a3
{
}

- (OBLinkTrayButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
}

- (BOOL)moreThanOneHome
{
  return self->_moreThanOneHome;
}

- (void)setMoreThanOneHome:(BOOL)a3
{
  self->_moreThanOneHome = a3;
}

- (BOOL)needsToPresentUpgradeFailedAlert
{
  return self->_needsToPresentUpgradeFailedAlert;
}

- (void)setNeedsToPresentUpgradeFailedAlert:(BOOL)a3
{
  self->_needsToPresentUpgradeFailedAlert = a3;
}

- (BOOL)isViewVisible
{
  return self->_isViewVisible;
}

- (void)setIsViewVisible:(BOOL)a3
{
  self->_isViewVisible = a3;
}

- (HFHomeKitDispatcher)homeKitDispatcher
{
  return self->_homeKitDispatcher;
}

- (void)setHomeKitDispatcher:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeKitDispatcher, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_commitButton, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end