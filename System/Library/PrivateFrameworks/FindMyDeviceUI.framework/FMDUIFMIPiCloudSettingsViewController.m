@interface FMDUIFMIPiCloudSettingsViewController
- (ACAccount)account;
- (BOOL)FMWLANEnabled;
- (BOOL)_doesDeviceSupportOfflineFindingLowPowerMode;
- (BOOL)activityInProgress;
- (BOOL)firstTimeSetup;
- (BOOL)isDTOEnabledAndFindMyOn;
- (BOOL)isFMIPSwitchEnabled;
- (BOOL)isShowingActivityInProgressUI;
- (BOOL)offlineFindingDisabledDueToNotHSA2;
- (BOOL)offlineFindingEnabled;
- (BOOL)togglingFMIPSwitch;
- (FMDUIFMIPiCloudSettingsViewController)init;
- (PSSpecifier)fmipSpecifier;
- (PSSpecifier)sendLastLocationSpecifier;
- (SPSettingsConfigurating)spSession;
- (UIProgressHUD)hud;
- (id)_clientInfoHeader;
- (id)_fmipSwitchOnForSpecifier:(id)a3;
- (id)_groupSpecifierForFMIP;
- (id)_groupSpecifierForOfflineFinding;
- (id)_groupSpecifierForSendLastLocation;
- (id)_offlineFindingSwitchOnForSpecifier:(id)a3;
- (id)_sendLastLocationSwitchOnForSpecifier:(id)a3;
- (id)_specifierForFMIP;
- (id)_specifierForOfflineFinding;
- (id)_specifierForSendLastLocation;
- (id)_userAgentHeader;
- (id)specifiers;
- (void)_disableFMIP;
- (void)_enableFMIP;
- (void)_fmipSettingsCacheDidUpdate:(id)a3;
- (void)_loadSearchPartyConfiguration;
- (void)_reloadSpecifiersOnMainQueue;
- (void)_setFMIPSwitchOn:(id)a3 forSpecifier:(id)a4;
- (void)_setOfflineFindingSwitchOn:(id)a3 forSpecifier:(id)a4;
- (void)_setSendLastLocationSwitchOn:(id)a3 forSpecifier:(id)a4;
- (void)_showFMIPPrivacyPage;
- (void)_showOfflineFindingAlertWhenTurningOff;
- (void)addHyperLinkStyleToText:(id)a3 inString:(id)a4 action:(SEL)a5 forGroup:(id)a6;
- (void)hideActivityInProgressUI;
- (void)hideActivityInProgressUIWithDelay:(double)a3;
- (void)presentHSA2UpgradeForOfflineFinding;
- (void)setAccount:(id)a3;
- (void)setActivityInProgress:(BOOL)a3;
- (void)setFirstTimeSetup:(BOOL)a3;
- (void)setFmipSpecifier:(id)a3;
- (void)setHud:(id)a3;
- (void)setOfflineFindingDisabledDueToNotHSA2:(BOOL)a3;
- (void)setOfflineFindingEnabled:(BOOL)a3;
- (void)setSearchPartyConfigurationActive:(BOOL)a3;
- (void)setSendLastLocationSpecifier:(id)a3;
- (void)setSpSession:(id)a3;
- (void)setTogglingFMIPSwitch:(BOOL)a3;
- (void)showActivityInProgress;
- (void)showActivityInProgressUIWithMessage:(id)a3;
- (void)showHSA2UpgradeAlert;
- (void)showLearnMoreLinkInDTODisclosure:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation FMDUIFMIPiCloudSettingsViewController

- (FMDUIFMIPiCloudSettingsViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)FMDUIFMIPiCloudSettingsViewController;
  v2 = [(FMDUIFMIPiCloudSettingsViewController *)&v6 init];
  if (v2)
  {
    v3 = objc_opt_new();
    v4 = [v3 settingsConfiguration];
    [(FMDUIFMIPiCloudSettingsViewController *)v2 setSpSession:v4];
  }
  return v2;
}

- (void)_loadSearchPartyConfiguration
{
  v3 = [(FMDUIFMIPiCloudSettingsViewController *)self spSession];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __70__FMDUIFMIPiCloudSettingsViewController__loadSearchPartyConfiguration__block_invoke;
  v4[3] = &unk_264DB3E08;
  v4[4] = self;
  [v3 beginRefreshingServiceStateWithBlock:v4];
}

void __70__FMDUIFMIPiCloudSettingsViewController__loadSearchPartyConfiguration__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__FMDUIFMIPiCloudSettingsViewController__loadSearchPartyConfiguration__block_invoke_2;
  block[3] = &unk_264DB3DE0;
  id v10 = v5;
  id v11 = v6;
  uint64_t v12 = *(void *)(a1 + 32);
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __70__FMDUIFMIPiCloudSettingsViewController__loadSearchPartyConfiguration__block_invoke_2(id *a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = LogCategory_Unspecified();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = a1[4];
    id v4 = a1[5];
    int v7 = 138412546;
    id v8 = v3;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_239955000, v2, OS_LOG_TYPE_DEFAULT, "SP Session state changed: %@, disabled reason: %@", (uint8_t *)&v7, 0x16u);
  }

  objc_msgSend(a1[6], "setOfflineFindingEnabled:", objc_msgSend(a1[4], "isEqualToString:", *MEMORY[0x263F66228]));
  id v5 = [a1[5] allObjects];
  objc_msgSend(a1[6], "setOfflineFindingDisabledDueToNotHSA2:", objc_msgSend(v5, "containsObject:", *MEMORY[0x263F66208]));

  return [a1[6] reloadSpecifiers];
}

- (void)setSearchPartyConfigurationActive:(BOOL)a3
{
  id v4 = (id *)MEMORY[0x263F66228];
  if (!a3) {
    id v4 = (id *)MEMORY[0x263F66220];
  }
  id v5 = *v4;
  objc_initWeak(&location, self);
  id v6 = [(FMDUIFMIPiCloudSettingsViewController *)self spSession];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __75__FMDUIFMIPiCloudSettingsViewController_setSearchPartyConfigurationActive___block_invoke;
  v8[3] = &unk_264DB3E30;
  id v7 = v5;
  id v9 = v7;
  objc_copyWeak(&v10, &location);
  [v6 setServiceState:v7 completion:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __75__FMDUIFMIPiCloudSettingsViewController_setSearchPartyConfigurationActive___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = LogCategory_Unspecified();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_239955000, v4, OS_LOG_TYPE_DEFAULT, "Set SP Session state: %@, error: %@", (uint8_t *)&v7, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _reloadSpecifiersOnMainQueue];
}

- (BOOL)FMWLANEnabled
{
  return MEMORY[0x270F95FB8](@"wapi", a2);
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)FMDUIFMIPiCloudSettingsViewController;
  [(FMDUIFMIPiCloudSettingsViewController *)&v6 viewDidLoad];
  id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = [MEMORY[0x263F1C5C0] modelSpecificLocalizedStringKeyForKey:@"FMD_ICLOUD_SETTINGS_TITLE"];
  uint64_t v5 = [v3 localizedStringForKey:v4 value:&stru_26ED1CF50 table:0];
  [(FMDUIFMIPiCloudSettingsViewController *)self setTitle:v5];

  [(FMDUIFMIPiCloudSettingsViewController *)self _loadSearchPartyConfiguration];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 addObserver:self selector:sel__fmipSettingsCacheDidUpdate_ name:@"FMDUIFMIPSettingsCacheDidUpdateNotification" object:0];

  [(FMDUIFMIPiCloudSettingsViewController *)self _reloadSpecifiersOnMainQueue];
  v6.receiver = self;
  v6.super_class = (Class)FMDUIFMIPiCloudSettingsViewController;
  [(FMDUIFMIPiCloudSettingsViewController *)&v6 viewWillAppear:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = +[FMDUIFMIPSettingsCache sharedInstance];
  if (([v5 fmipStateAvailable] & 1) == 0) {
    goto LABEL_6;
  }
  objc_super v6 = +[FMDUIFMIPSettingsCache sharedInstance];
  if ([v6 fmipState] != 2)
  {

LABEL_6:
    goto LABEL_7;
  }
  BOOL v7 = [(FMDUIFMIPiCloudSettingsViewController *)self isShowingActivityInProgressUI];

  if (!v7) {
    [(FMDUIFMIPiCloudSettingsViewController *)self showActivityInProgress];
  }
LABEL_7:
  v8.receiver = self;
  v8.super_class = (Class)FMDUIFMIPiCloudSettingsViewController;
  [(FMDUIFMIPiCloudSettingsViewController *)&v8 viewDidAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self name:@"FMDUIFMIPSettingsCacheDidUpdateNotification" object:0];

  v6.receiver = self;
  v6.super_class = (Class)FMDUIFMIPiCloudSettingsViewController;
  [(FMDUIFMIPiCloudSettingsViewController *)&v6 viewWillDisappear:v3];
}

- (BOOL)isDTOEnabledAndFindMyOn
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F10488] sharedInstance];
  int v3 = [v2 isFeatureEnabled];

  id v4 = @"NO";
  if (v3)
  {
    uint64_t v5 = +[FMDUIFMIPSettingsCache sharedInstance];
    int v6 = [v5 fmipEnabled];

    if (v6) {
      id v4 = @"YES";
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  BOOL v7 = v4;
  objc_super v8 = LogCategory_Unspecified();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    uint64_t v11 = v7;
    _os_log_impl(&dword_239955000, v8, OS_LOG_TYPE_DEFAULT, "Should show DTO Disclaimer - %{public}@", (uint8_t *)&v10, 0xCu);
  }

  return v6;
}

- (BOOL)isFMIPSwitchEnabled
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int v3 = +[FMDUIFMIPSettingsCache sharedInstance];
  if ([v3 fmipStateAvailable])
  {
    id v4 = +[FMDUIFMIPSettingsCache sharedInstance];
    char v5 = [v4 fmipStateChangeInProgress];

    int v6 = @"NO";
    if (v5)
    {
      BOOL v7 = 0;
    }
    else
    {
      BOOL v8 = [(FMDUIFMIPiCloudSettingsViewController *)self isDTOEnabledAndFindMyOn];
      BOOL v7 = !v8;
      if (!v8) {
        int v6 = @"YES";
      }
    }
  }
  else
  {

    BOOL v7 = 0;
    int v6 = @"NO";
  }
  __int16 v9 = v6;
  int v10 = LogCategory_Unspecified();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    v13 = v9;
    _os_log_impl(&dword_239955000, v10, OS_LOG_TYPE_DEFAULT, "Should FMIP Button be enabled %@", (uint8_t *)&v12, 0xCu);
  }

  return v7;
}

- (id)specifiers
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = [(FMDUIFMIPiCloudSettingsViewController *)self _groupSpecifierForFMIP];
  char v5 = [(FMDUIFMIPiCloudSettingsViewController *)self _specifierForFMIP];
  [(FMDUIFMIPiCloudSettingsViewController *)self setFmipSpecifier:v5];

  [v3 addObject:v4];
  int v6 = [(FMDUIFMIPiCloudSettingsViewController *)self fmipSpecifier];
  [v3 addObject:v6];

  if ([(FMDUIFMIPiCloudSettingsViewController *)self firstTimeSetup]
    || ([(FMDUIFMIPiCloudSettingsViewController *)self _fmipSwitchOnForSpecifier:0],
        BOOL v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 BOOLValue],
        v7,
        !v8))
  {
    [(FMDUIFMIPiCloudSettingsViewController *)self setSendLastLocationSpecifier:0];
  }
  else
  {
    __int16 v9 = [(FMDUIFMIPiCloudSettingsViewController *)self _groupSpecifierForOfflineFinding];
    [v3 addObject:v9];

    int v10 = [(FMDUIFMIPiCloudSettingsViewController *)self _specifierForOfflineFinding];
    [v3 addObject:v10];

    uint64_t v11 = [(FMDUIFMIPiCloudSettingsViewController *)self _specifierForSendLastLocation];
    [(FMDUIFMIPiCloudSettingsViewController *)self setSendLastLocationSpecifier:v11];

    int v12 = [(FMDUIFMIPiCloudSettingsViewController *)self _groupSpecifierForSendLastLocation];
    [v3 addObject:v12];

    v13 = [(FMDUIFMIPiCloudSettingsViewController *)self sendLastLocationSpecifier];
    [v3 addObject:v13];
  }
  [(FMDUIFMIPiCloudSettingsViewController *)self setSpecifiers:v3];

  return v3;
}

- (id)_specifierForFMIP
{
  id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = [MEMORY[0x263F1C5C0] modelSpecificLocalizedStringKeyForKey:@"FMD_ICLOUD_SETTINGS_SWITCH_TITLE"];
  char v5 = [v3 localizedStringForKey:v4 value:&stru_26ED1CF50 table:0];

  int v6 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v5 target:self set:sel__setFMIPSwitchOn_forSpecifier_ get:sel__fmipSwitchOnForSpecifier_ detail:0 cell:6 edit:0];
  BOOL v7 = [(FMDUIFMIPiCloudSettingsViewController *)self isFMIPSwitchEnabled];
  int v8 = [NSNumber numberWithBool:v7];
  [v6 setProperty:v8 forKey:*MEMORY[0x263F600A8]];

  [v6 setProperty:@"FIND_MY_SPECIFIER_ID" forKey:*MEMORY[0x263F60138]];
  return v6;
}

- (id)_groupSpecifierForFMIP
{
  id v3 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"FMD_GROUP_SPECIFIER"];
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  char v5 = [v4 localizedStringForKey:@"FMD_ICLOUD_SETTINGS_FMIP_GROUP_FOOTER" value:&stru_26ED1CF50 table:0];

  int v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  BOOL v7 = [v6 localizedStringForKey:@"FMD_TOP_DTO_LEARN_MORE_LINK_TITLE" value:&stru_26ED1CF50 table:0];

  if (![MEMORY[0x263F00A60] locationServicesEnabled])
  {
    __int16 v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v11 = [MEMORY[0x263F1C5C0] modelSpecificLocalizedStringKeyForKey:@"FMD_ICLOUD_SETTINGS_LOCATION_SERVICES_NEEDED_FOOTER"];
    id v10 = [v9 localizedStringForKey:v11 value:&stru_26ED1CF50 table:0];

    goto LABEL_5;
  }
  if ([(FMDUIFMIPiCloudSettingsViewController *)self isDTOEnabledAndFindMyOn])
  {
    int v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    __int16 v9 = [v8 localizedStringForKey:@"FMD_ICLOUD_SETTINGS_FMIP_GROUP_FOOTER_TOP_DTO" value:&stru_26ED1CF50 table:0];

    id v10 = [NSString stringWithFormat:@"%@ %@%@%@", v9, v7, @"\n\n", v5];
LABEL_5:

    goto LABEL_7;
  }
  id v10 = v5;
LABEL_7:
  int v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v13 = [v12 localizedStringForKey:@"FMD_ABOUT_FMIP_PRIVACY_LINK_TITLE" value:&stru_26ED1CF50 table:0];

  uint64_t v14 = [NSString stringWithFormat:@"%@ %@", v10, v13];
  if ([(FMDUIFMIPiCloudSettingsViewController *)self isDTOEnabledAndFindMyOn])
  {
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    [v3 setProperty:v16 forKey:*MEMORY[0x263F600C0]];

    [v3 setProperty:v14 forKey:*MEMORY[0x263F600F8]];
    [(FMDUIFMIPiCloudSettingsViewController *)self addHyperLinkStyleToText:v7 inString:v14 action:sel_showLearnMoreLinkInDTODisclosure_ forGroup:v3];
  }
  else
  {
    v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    [v3 setProperty:v18 forKey:*MEMORY[0x263F600C0]];
  }
  [v3 setProperty:v14 forKey:*MEMORY[0x263F600E8]];
  v23.id location = [v14 rangeOfString:v13];
  v19 = NSStringFromRange(v23);
  [v3 setProperty:v19 forKey:*MEMORY[0x263F600D0]];

  v20 = [MEMORY[0x263F08D40] valueWithNonretainedObject:self];
  [v3 setProperty:v20 forKey:*MEMORY[0x263F600E0]];

  [v3 setProperty:@"_showFMIPPrivacyPage" forKey:*MEMORY[0x263F600C8]];
  return v3;
}

- (void)addHyperLinkStyleToText:(id)a3 inString:(id)a4 action:(SEL)a5 forGroup:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = [v12 propertyForKey:*MEMORY[0x263F600C0]];
  uint64_t v14 = (objc_class *)objc_opt_class();
  v15 = NSStringFromClass(v14);
  char v16 = [v13 isEqualToString:v15];

  if ((v16 & 1) == 0)
  {
    v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    v19 = LogCategory_Unspecified();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[FMDUIFMIPiCloudSettingsViewController addHyperLinkStyleToText:inString:action:forGroup:]((uint64_t)v18, v19);
    }
  }
  uint64_t v20 = [v11 rangeOfString:v10];
  if (v21) {
    objc_msgSend(v12, "addFooterHyperlinkWithRange:target:action:", v20, v21, self, a5);
  }
}

- (void)showLearnMoreLinkInDTODisclosure:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = [NSURL URLWithString:@"https://support.apple.com/kb/HT212510"];
  id v4 = [MEMORY[0x263F01880] defaultWorkspace];
  uint64_t v9 = 0;
  int v5 = [v4 openSensitiveURL:v3 withOptions:MEMORY[0x263EFFA78] error:&v9];
  uint64_t v6 = v9;

  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (!v7)
  {
    int v8 = LogCategory_Unspecified();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = @"https://support.apple.com/kb/HT212510";
      _os_log_impl(&dword_239955000, v8, OS_LOG_TYPE_ERROR, "Could not open %@ through FindMy", buf, 0xCu);
    }
  }
}

- (id)_specifierForOfflineFinding
{
  id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"FMD_ICLOUD_SETTINGS_OFFLINE_FINDING_SWITCH_TITLE" value:&stru_26ED1CF50 table:0];

  int v5 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v4 target:self set:sel__setOfflineFindingSwitchOn_forSpecifier_ get:sel__offlineFindingSwitchOnForSpecifier_ detail:0 cell:6 edit:0];
  [v5 setProperty:@"OFFLINE_FINDING_SPECIFIER_ID" forKey:*MEMORY[0x263F60138]];

  return v5;
}

- (id)_groupSpecifierForOfflineFinding
{
  id v3 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"OFFLINE_GROUP_SPECIFIER"];
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v5 = [MEMORY[0x263F1C5C0] modelSpecificLocalizedStringKeyForKey:@"FMD_ICLOUD_SETTINGS_OFFLINE_FINDING_FOOTER"];
  uint64_t v6 = [v4 localizedStringForKey:v5 value:&stru_26ED1CF50 table:0];

  if ([(FMDUIFMIPiCloudSettingsViewController *)self _doesDeviceSupportOfflineFindingLowPowerMode])
  {
    BOOL v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    int v8 = [MEMORY[0x263F1C5C0] modelSpecificLocalizedStringKeyForKey:@"FMD_ICLOUD_SETTINGS_OFFLINE_FINDING_FOOTER_LPEM"];
    uint64_t v9 = [v7 localizedStringForKey:v8 value:&stru_26ED1CF50 table:0];

    uint64_t v6 = (void *)v9;
  }
  [v3 setProperty:v6 forKey:*MEMORY[0x263F600F8]];
  id v10 = [MEMORY[0x263F08D40] valueWithNonretainedObject:self];
  [v3 setProperty:v10 forKey:*MEMORY[0x263F600E0]];

  [v3 setProperty:@"_showOfflineFindingLearnMorePage" forKey:*MEMORY[0x263F600C8]];
  return v3;
}

- (BOOL)_doesDeviceSupportOfflineFindingLowPowerMode
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = MGCopyAnswerWithError();
  id v3 = LogCategory_Unspecified();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v2;
    _os_log_impl(&dword_239955000, v3, OS_LOG_TYPE_DEFAULT, "deviceSupportsLPEM supportedTypes %@", (uint8_t *)&v9, 0xCu);
  }

  int v4 = [v2 containsObject:@"find-my"];
  int v5 = LogCategory_Unspecified();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      LOWORD(v9) = 0;
      BOOL v7 = "deviceSupportsLPEM YES";
LABEL_8:
      _os_log_impl(&dword_239955000, v5, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v9, 2u);
    }
  }
  else if (v6)
  {
    LOWORD(v9) = 0;
    BOOL v7 = " deviceSupportsLPEM NO";
    goto LABEL_8;
  }

  return v4;
}

- (void)showHSA2UpgradeAlert
{
  id v3 = (void *)MEMORY[0x263F1C3F8];
  int v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v5 = [v4 localizedStringForKey:@"FMD_OFFLINE_FINDING_ACCOUNT_UPGRADE_ALERT_TITLE" value:&stru_26ED1CF50 table:0];
  BOOL v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  BOOL v7 = [v6 localizedStringForKey:@"FMD_OFFLINE_FINDING_ACCOUNT_UPGRADE_ALERT_MESSAGE" value:&stru_26ED1CF50 table:0];
  int v8 = [v3 alertControllerWithTitle:v5 message:v7 preferredStyle:1];

  int v9 = (void *)MEMORY[0x263F1C3F0];
  id v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v11 = [v10 localizedStringForKey:@"FMD_OFFLINE_FINDING_ACCOUNT_UPGRADE_NOT_NOT_BUTTON" value:&stru_26ED1CF50 table:0];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __61__FMDUIFMIPiCloudSettingsViewController_showHSA2UpgradeAlert__block_invoke;
  v18[3] = &unk_264DB3E58;
  v18[4] = self;
  uint64_t v12 = [v9 actionWithTitle:v11 style:1 handler:v18];

  v13 = (void *)MEMORY[0x263F1C3F0];
  uint64_t v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v15 = [v14 localizedStringForKey:@"FMD_OFFLINE_FINDING_ACCOUNT_UPGRADE_CONTINUE_BUTTON" value:&stru_26ED1CF50 table:0];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __61__FMDUIFMIPiCloudSettingsViewController_showHSA2UpgradeAlert__block_invoke_2;
  v17[3] = &unk_264DB3E58;
  v17[4] = self;
  char v16 = [v13 actionWithTitle:v15 style:0 handler:v17];

  [v8 addAction:v16];
  [v8 addAction:v12];
  [v8 setPreferredAction:v16];
  [(FMDUIFMIPiCloudSettingsViewController *)self presentViewController:v8 animated:1 completion:0];
}

uint64_t __61__FMDUIFMIPiCloudSettingsViewController_showHSA2UpgradeAlert__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

uint64_t __61__FMDUIFMIPiCloudSettingsViewController_showHSA2UpgradeAlert__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentHSA2UpgradeForOfflineFinding];
}

- (void)presentHSA2UpgradeForOfflineFinding
{
  id v3 = objc_alloc_init(MEMORY[0x263F29110]);
  int v4 = [MEMORY[0x263F34328] sharedInstance];
  int v5 = [v4 primaryAccountAltDSID];
  [v3 setAltDSID:v5];

  BOOL v6 = (void *)[objc_alloc(MEMORY[0x263F25D70]) initWithNibName:0 bundle:0];
  BOOL v7 = (void *)[objc_alloc(MEMORY[0x263F1C7F8]) initWithRootViewController:v6];
  int v8 = (void *)[objc_alloc(MEMORY[0x263F34A20]) initWithPresentingViewController:v7];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __76__FMDUIFMIPiCloudSettingsViewController_presentHSA2UpgradeForOfflineFinding__block_invoke;
  v11[3] = &unk_264DB3DE0;
  id v12 = v8;
  id v13 = v3;
  uint64_t v14 = self;
  id v9 = v3;
  id v10 = v8;
  [(FMDUIFMIPiCloudSettingsViewController *)self presentViewController:v7 animated:1 completion:v11];
}

uint64_t __76__FMDUIFMIPiCloudSettingsViewController_presentHSA2UpgradeForOfflineFinding__block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v1 = a1[5];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __76__FMDUIFMIPiCloudSettingsViewController_presentHSA2UpgradeForOfflineFinding__block_invoke_2;
  v4[3] = &unk_264DB3EA8;
  v4[4] = a1[6];
  return [v2 performDeviceToDeviceEncryptionStateRepairForContext:v1 withCompletion:v4];
}

void __76__FMDUIFMIPiCloudSettingsViewController_presentHSA2UpgradeForOfflineFinding__block_invoke_2(uint64_t a1, char a2)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __76__FMDUIFMIPiCloudSettingsViewController_presentHSA2UpgradeForOfflineFinding__block_invoke_3;
  v2[3] = &unk_264DB3E80;
  char v3 = a2;
  v2[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], v2);
}

uint64_t __76__FMDUIFMIPiCloudSettingsViewController_presentHSA2UpgradeForOfflineFinding__block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    [*(id *)(a1 + 32) setSearchPartyConfigurationActive:1];
  }
  [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
  v2 = *(void **)(a1 + 32);
  return [v2 reloadSpecifiers];
}

- (id)_specifierForSendLastLocation
{
  char v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v4 = [v3 localizedStringForKey:@"FMD_ICLOUD_SETTINGS_SEND_LAST_LOCATION_SWITCH_TITLE" value:&stru_26ED1CF50 table:0];

  int v5 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v4 target:self set:sel__setSendLastLocationSwitchOn_forSpecifier_ get:sel__sendLastLocationSwitchOnForSpecifier_ detail:0 cell:6 edit:0];
  [v5 setProperty:@"SLL_SPECIFIER_ID" forKey:*MEMORY[0x263F60138]];

  return v5;
}

- (id)_groupSpecifierForSendLastLocation
{
  v2 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"SLL_GROUP_SPECIFIER"];
  char v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v4 = [MEMORY[0x263F1C5C0] modelSpecificLocalizedStringKeyForKey:@"FMD_ICLOUD_SETTINGS_SEND_LAST_LOCATION_FOOTER"];
  int v5 = [v3 localizedStringForKey:v4 value:&stru_26ED1CF50 table:0];

  [v2 setProperty:v5 forKey:*MEMORY[0x263F600F8]];
  return v2;
}

- (void)_showFMIPPrivacyPage
{
  id v3 = [MEMORY[0x263F5B8F8] presenterForPrivacySplashWithIdentifer:*MEMORY[0x263F5B920]];
  [v3 setPresentingViewController:self];
  [v3 present];
}

- (void)_setFMIPSwitchOn:(id)a3 forSpecifier:(id)a4
{
  id v5 = a3;
  if ([(FMDUIFMIPiCloudSettingsViewController *)self firstTimeSetup])
  {
    BOOL v6 = [MEMORY[0x263F25CB8] sharedInstance];
    objc_msgSend(v6, "setShouldEnable:", objc_msgSend(v5, "BOOLValue"));

    [(FMDUIFMIPiCloudSettingsViewController *)self _reloadSpecifiersOnMainQueue];
    BOOL v7 = [(FMDUIFMIPiCloudSettingsViewController *)self parentController];
    int v8 = [(FMDUIFMIPiCloudSettingsViewController *)self specifier];
    id v9 = [v8 identifier];
    [v7 reloadSpecifierID:v9 animated:0];
  }
  else
  {
    int v10 = [v5 BOOLValue];
    uint64_t v11 = +[FMDUIFMIPSettingsCache sharedInstance];
    int v12 = [v11 fmipEnabled];

    if (v10 != v12 && ![(FMDUIFMIPiCloudSettingsViewController *)self togglingFMIPSwitch])
    {
      [(FMDUIFMIPiCloudSettingsViewController *)self setTogglingFMIPSwitch:1];
      [(id)*MEMORY[0x263F1D020] beginIgnoringInteractionEvents];
      objc_initWeak(&location, self);
      dispatch_time_t v13 = dispatch_time(0, 100000000);
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __71__FMDUIFMIPiCloudSettingsViewController__setFMIPSwitchOn_forSpecifier___block_invoke;
      v14[3] = &unk_264DB3ED0;
      objc_copyWeak(&v17, &location);
      id v15 = v5;
      char v16 = self;
      dispatch_after(v13, MEMORY[0x263EF83A0], v14);

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
  }
}

void __71__FMDUIFMIPiCloudSettingsViewController__setFMIPSwitchOn_forSpecifier___block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  [(id)*MEMORY[0x263F1D020] endIgnoringInteractionEvents];
  if ([a1[4] BOOLValue]) {
    [WeakRetained _enableFMIP];
  }
  else {
    [WeakRetained _disableFMIP];
  }
  [a1[5] setTogglingFMIPSwitch:0];
}

- (id)_fmipSwitchOnForSpecifier:(id)a3
{
  if ([(FMDUIFMIPiCloudSettingsViewController *)self firstTimeSetup])
  {
    id v3 = [MEMORY[0x263F25CB8] sharedInstance];
    uint64_t v4 = [v3 shouldEnable];
  }
  else
  {
    id v3 = +[FMDUIFMIPSettingsCache sharedInstance];
    if ([v3 fmipStateAvailable])
    {
      id v5 = +[FMDUIFMIPSettingsCache sharedInstance];
      uint64_t v4 = [v5 fmipEnabled];
    }
    else
    {
      uint64_t v4 = 0;
    }
  }

  BOOL v6 = NSNumber;
  return (id)[v6 numberWithBool:v4];
}

- (id)_offlineFindingSwitchOnForSpecifier:(id)a3
{
  if ([(FMDUIFMIPiCloudSettingsViewController *)self firstTimeSetup])
  {
    uint64_t v4 = (void *)MEMORY[0x263EFFA80];
  }
  else
  {
    if ([(FMDUIFMIPiCloudSettingsViewController *)self offlineFindingEnabled]) {
      uint64_t v5 = [(FMDUIFMIPiCloudSettingsViewController *)self offlineFindingDisabledDueToNotHSA2] ^ 1;
    }
    else {
      uint64_t v5 = 0;
    }
    uint64_t v4 = [NSNumber numberWithBool:v5];
  }
  return v4;
}

- (void)_setOfflineFindingSwitchOn:(id)a3 forSpecifier:(id)a4
{
  id v5 = a3;
  if (![(FMDUIFMIPiCloudSettingsViewController *)self firstTimeSetup])
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __81__FMDUIFMIPiCloudSettingsViewController__setOfflineFindingSwitchOn_forSpecifier___block_invoke;
    v6[3] = &unk_264DB3EF8;
    id v7 = v5;
    int v8 = self;
    dispatch_async(MEMORY[0x263EF83A0], v6);
  }
}

uint64_t __81__FMDUIFMIPiCloudSettingsViewController__setOfflineFindingSwitchOn_forSpecifier___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) BOOLValue];
  id v3 = *(void **)(a1 + 40);
  if (v2)
  {
    int v4 = [v3 offlineFindingDisabledDueToNotHSA2];
    id v5 = *(void **)(a1 + 40);
    if (v4) {
      [v5 showHSA2UpgradeAlert];
    }
    else {
      [v5 setSearchPartyConfigurationActive:1];
    }
    id v7 = *(void **)(a1 + 40);
    return [v7 _reloadSpecifiersOnMainQueue];
  }
  else
  {
    return [v3 _showOfflineFindingAlertWhenTurningOff];
  }
}

- (void)_showOfflineFindingAlertWhenTurningOff
{
  id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v4 = [v3 localizedStringForKey:@"FMD_DISABLE_OFFLINE_FINDING_ALERT_TITLE" value:&stru_26ED1CF50 table:0];

  BOOL v5 = [(FMDUIFMIPiCloudSettingsViewController *)self FMWLANEnabled];
  BOOL v6 = [(FMDUIFMIPiCloudSettingsViewController *)self _doesDeviceSupportOfflineFindingLowPowerMode];
  id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v8 = v7;
  id v9 = @"FMD_DISABLE_OFFLINE_FINDING_ALERT_MESSAGE_WLAN";
  if (v6) {
    id v9 = @"FMD_DISABLE_OFFLINE_FINDING_ALERT_MESSAGE_WLAN_LPEM";
  }
  int v10 = @"FMD_DISABLE_OFFLINE_FINDING_ALERT_MESSAGE_WIFI_LPEM";
  if (!v6) {
    int v10 = @"FMD_DISABLE_OFFLINE_FINDING_ALERT_MESSAGE_WIFI";
  }
  if (v5) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = v10;
  }
  int v12 = [v7 localizedStringForKey:v11 value:&stru_26ED1CF50 table:0];

  dispatch_time_t v13 = (void *)MEMORY[0x263F1C3F0];
  uint64_t v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v15 = [v14 localizedStringForKey:@"FMD_DISABLE_OFFLINE_FINDING_ALERT_CANCEL_BUTTON" value:&stru_26ED1CF50 table:0];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __79__FMDUIFMIPiCloudSettingsViewController__showOfflineFindingAlertWhenTurningOff__block_invoke;
  v23[3] = &unk_264DB3E58;
  v23[4] = self;
  char v16 = [v13 actionWithTitle:v15 style:1 handler:v23];

  id v17 = (void *)MEMORY[0x263F1C3F0];
  v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v19 = [v18 localizedStringForKey:@"FMD_DISABLE_OFFLINE_FINDING_ALERT_DISABLE_BUTTON" value:&stru_26ED1CF50 table:0];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __79__FMDUIFMIPiCloudSettingsViewController__showOfflineFindingAlertWhenTurningOff__block_invoke_2;
  v22[3] = &unk_264DB3E58;
  v22[4] = self;
  uint64_t v20 = [v17 actionWithTitle:v19 style:2 handler:v22];

  uint64_t v21 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v4 message:v12 preferredStyle:1];
  [v21 addAction:v16];
  [v21 addAction:v20];
  [v21 setPreferredAction:v16];
  [(FMDUIFMIPiCloudSettingsViewController *)self presentViewController:v21 animated:1 completion:0];
}

uint64_t __79__FMDUIFMIPiCloudSettingsViewController__showOfflineFindingAlertWhenTurningOff__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

uint64_t __79__FMDUIFMIPiCloudSettingsViewController__showOfflineFindingAlertWhenTurningOff__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setOfflineFindingEnabled:0];
  char v2 = *(void **)(a1 + 32);
  return [v2 setSearchPartyConfigurationActive:0];
}

- (void)_setSendLastLocationSwitchOn:(id)a3 forSpecifier:(id)a4
{
  id v5 = a3;
  if (![(FMDUIFMIPiCloudSettingsViewController *)self firstTimeSetup])
  {
    objc_initWeak(&location, self);
    BOOL v6 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __83__FMDUIFMIPiCloudSettingsViewController__setSendLastLocationSwitchOn_forSpecifier___block_invoke;
    block[3] = &unk_264DB3F48;
    id v8 = v5;
    objc_copyWeak(&v9, &location);
    dispatch_async(v6, block);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __83__FMDUIFMIPiCloudSettingsViewController__setSendLastLocationSwitchOn_forSpecifier___block_invoke(uint64_t a1)
{
  char v2 = [MEMORY[0x263F3CC60] sharedInstance];
  uint64_t v3 = [*(id *)(a1 + 32) BOOLValue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __83__FMDUIFMIPiCloudSettingsViewController__setSendLastLocationSwitchOn_forSpecifier___block_invoke_2;
  v4[3] = &unk_264DB3F20;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  [v2 setLowBatteryLocateEnabled:v3 withCompletion:v4];

  objc_destroyWeak(&v5);
}

void __83__FMDUIFMIPiCloudSettingsViewController__setSendLastLocationSwitchOn_forSpecifier___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (a2)
  {
    id v4 = WeakRetained;
    [WeakRetained _reloadSpecifiersOnMainQueue];
    id WeakRetained = v4;
  }
}

- (id)_sendLastLocationSwitchOnForSpecifier:(id)a3
{
  if ([(FMDUIFMIPiCloudSettingsViewController *)self firstTimeSetup])
  {
    uint64_t v3 = (void *)MEMORY[0x263EFFA80];
  }
  else
  {
    id v4 = NSNumber;
    id v5 = +[FMDUIFMIPSettingsCache sharedInstance];
    uint64_t v3 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "lowBatteryLocateEnabled"));
  }
  return v3;
}

- (void)_reloadSpecifiersOnMainQueue
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__FMDUIFMIPiCloudSettingsViewController__reloadSpecifiersOnMainQueue__block_invoke;
  block[3] = &unk_264DB3F70;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __69__FMDUIFMIPiCloudSettingsViewController__reloadSpecifiersOnMainQueue__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (void)_enableFMIP
{
  objc_initWeak(&location, self);
  uint64_t v3 = (void *)MEMORY[0x263F25CA8];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __52__FMDUIFMIPiCloudSettingsViewController__enableFMIP__block_invoke;
  v4[3] = &unk_264DB3FE0;
  objc_copyWeak(&v5, &location);
  void v4[4] = self;
  [v3 showEnableAlertWithCompletion:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __52__FMDUIFMIPiCloudSettingsViewController__enableFMIP__block_invoke(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__FMDUIFMIPiCloudSettingsViewController__enableFMIP__block_invoke_2;
  block[3] = &unk_264DB3FB8;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  char v6 = a2;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v5);
}

void __52__FMDUIFMIPiCloudSettingsViewController__enableFMIP__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v19 = WeakRetained;
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v3 = [WeakRetained fmipSpecifier];
    [v19 reloadSpecifier:v3];
  }
  else
  {
    id v4 = [MEMORY[0x263F25CB8] sharedInstance];
    [v4 enableInContext:2];

    if ([MEMORY[0x263F00A60] locationServicesEnabled]) {
      goto LABEL_6;
    }
    id v5 = (void *)MEMORY[0x263F1C3F8];
    char v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v7 = [v6 localizedStringForKey:@"FMD_ICLOUD_SETTINGS_LOCATION_SERVICES_OFF_ALERT_TITLE" value:&stru_26ED1CF50 table:0];
    id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v9 = [MEMORY[0x263F1C5C0] modelSpecificLocalizedStringKeyForKey:@"FMD_ICLOUD_SETTINGS_LOCATION_SERVICES_OFF_ALERT_TEXT"];
    int v10 = [v8 localizedStringForKey:v9 value:&stru_26ED1CF50 table:0];
    uint64_t v3 = [v5 alertControllerWithTitle:v7 message:v10 preferredStyle:1];

    uint64_t v11 = (void *)MEMORY[0x263F1C3F0];
    int v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    dispatch_time_t v13 = [v12 localizedStringForKey:@"FMD_ICLOUD_SETTINGS_LOCATION_SERVICES_OFF_ALERT_CANCEL_BUTTON" value:&stru_26ED1CF50 table:0];
    uint64_t v14 = [v11 actionWithTitle:v13 style:0 handler:0];

    id v15 = (void *)MEMORY[0x263F1C3F0];
    char v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v17 = [v16 localizedStringForKey:@"FMD_ICLOUD_SETTINGS_LOCATION_SERVICES_OFF_ALERT_SETTINGS_BUTTON" value:&stru_26ED1CF50 table:0];
    v18 = [v15 actionWithTitle:v17 style:0 handler:&__block_literal_global];

    [v3 addAction:v18];
    [v3 addAction:v14];
    [v3 setPreferredAction:v14];
    [*(id *)(a1 + 32) presentViewController:v3 animated:1 completion:0];
  }
LABEL_6:
}

void __52__FMDUIFMIPiCloudSettingsViewController__enableFMIP__block_invoke_3()
{
  id v1 = [MEMORY[0x263F5FBD0] preferencesURL];
  v0 = [MEMORY[0x263F01880] defaultWorkspace];
  [v0 openSensitiveURL:v1 withOptions:0];
}

- (void)_disableFMIP
{
  objc_initWeak(&location, self);
  uint64_t v3 = (void *)MEMORY[0x263F25CA8];
  id v4 = [(FMDUIFMIPiCloudSettingsViewController *)self account];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __53__FMDUIFMIPiCloudSettingsViewController__disableFMIP__block_invoke;
  v5[3] = &unk_264DB4030;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  [v3 showDisableAlertForAccount:v4 presentingViewController:self withCompletion:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __53__FMDUIFMIPiCloudSettingsViewController__disableFMIP__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__FMDUIFMIPiCloudSettingsViewController__disableFMIP__block_invoke_2;
  v7[3] = &unk_264DB4008;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  char v10 = a2;
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v7);

  objc_destroyWeak(&v9);
}

void __53__FMDUIFMIPiCloudSettingsViewController__disableFMIP__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = WeakRetained;
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v3 = [WeakRetained fmipSpecifier];
    [v4 reloadSpecifier:v3];
  }
  else
  {
    [*(id *)(a1 + 32) showActivityInProgress];
    uint64_t v3 = [MEMORY[0x263F25CB8] sharedInstance];
    [v3 disableInContext:1 withWipeToken:*(void *)(a1 + 40)];
  }
}

- (void)_fmipSettingsCacheDidUpdate:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__FMDUIFMIPiCloudSettingsViewController__fmipSettingsCacheDidUpdate___block_invoke;
  block[3] = &unk_264DB3F70;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __69__FMDUIFMIPiCloudSettingsViewController__fmipSettingsCacheDidUpdate___block_invoke(uint64_t a1)
{
  char v2 = +[FMDUIFMIPSettingsCache sharedInstance];
  int v3 = [v2 fmipStateChangeInProgress];

  if (v3)
  {
    id v16 = +[FMDUIFMIPSettingsCache sharedInstance];
    if ([v16 fmipState] == 2)
    {
      char v4 = [*(id *)(a1 + 32) isShowingActivityInProgressUI];

      if ((v4 & 1) == 0)
      {
        id v15 = *(void **)(a1 + 32);
        [v15 showActivityInProgress];
      }
    }
    else
    {
    }
  }
  else
  {
    if ([*(id *)(a1 + 32) isShowingActivityInProgressUI]) {
      [*(id *)(a1 + 32) hideActivityInProgressUIWithDelay:0.5];
    }
    id v5 = +[FMDUIFMIPSettingsCache sharedInstance];
    uint64_t v6 = [v5 fmipStateAvailable];

    id v7 = [*(id *)(a1 + 32) fmipSpecifier];
    id v8 = [NSNumber numberWithBool:v6];
    uint64_t v9 = *MEMORY[0x263F600A8];
    [v7 setProperty:v8 forKey:*MEMORY[0x263F600A8]];

    char v10 = +[FMDUIFMIPSettingsCache sharedInstance];
    LODWORD(v8) = [v10 lowBatteryLocateStateAvailable];

    uint64_t v11 = [*(id *)(a1 + 32) sendLastLocationSpecifier];
    int v12 = v11;
    if (v8) {
      uint64_t v13 = MEMORY[0x263EFFA88];
    }
    else {
      uint64_t v13 = MEMORY[0x263EFFA80];
    }
    [v11 setProperty:v13 forKey:v9];

    uint64_t v14 = *(void **)(a1 + 32);
    [v14 reloadSpecifiers];
  }
}

- (id)_userAgentHeader
{
  id v2 = objc_alloc_init(MEMORY[0x263F25820]);
  int v3 = [v2 productVersion];
  char v4 = [v2 buildVersion];
  id v5 = [v2 deviceClass];
  uint64_t v6 = [NSString stringWithFormat:@"iOS %@ %@ %@ Find My iPhone Settings", v3, v4, v5];

  return v6;
}

- (id)_clientInfoHeader
{
  id v2 = objc_alloc_init(MEMORY[0x263F25820]);
  int v3 = NSString;
  char v4 = [v2 productType];
  NSRange v23 = [v3 stringWithFormat:@"%@", v4];

  id v5 = NSString;
  uint64_t v6 = [v2 osName];
  id v7 = [v2 osVersion];
  id v8 = [v2 buildVersion];
  uint64_t v9 = [v5 stringWithFormat:@"%@;%@;%@", v6, v7, v8];

  char v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v11 = [v10 infoDictionary];
  uint64_t v12 = *MEMORY[0x263EFFB70];
  uint64_t v13 = [v11 objectForKey:*MEMORY[0x263EFFB70]];

  uint64_t v14 = [MEMORY[0x263F086E0] mainBundle];
  id v15 = [v14 infoDictionary];
  id v16 = [v15 objectForKey:v12];

  id v17 = NSString;
  v18 = [v10 bundleIdentifier];
  id v19 = [v14 bundleIdentifier];
  uint64_t v20 = [v17 stringWithFormat:@"%@/%@ (%@/%@)", v18, v13, v19, v16];

  uint64_t v21 = [NSString stringWithFormat:@"<%@> <%@> <%@>", v23, v9, v20];

  return v21;
}

- (void)showActivityInProgress
{
  id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v3 = [MEMORY[0x263F1C5C0] modelSpecificLocalizedStringKeyForKey:@"FMD_TURN_OFF_FMIP_PROGRESS_MSG"];
  char v4 = [v5 localizedStringForKey:v3 value:&stru_26ED1CF50 table:0];
  [(FMDUIFMIPiCloudSettingsViewController *)self showActivityInProgressUIWithMessage:v4];
}

- (void)showActivityInProgressUIWithMessage:(id)a3
{
  id v11 = a3;
  self->_activityInProgress = 1;
  [(id)*MEMORY[0x263F1D020] beginIgnoringInteractionEvents];
  char v4 = (UIProgressHUD *)objc_alloc_init(MEMORY[0x263F1C8D8]);
  hud = self->_hud;
  self->_hud = v4;

  [(UIProgressHUD *)self->_hud setFontSize:16];
  [(UIProgressHUD *)self->_hud setText:v11];
  id v6 = *(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDD0]);
  uint64_t v7 = [v6 superview];
  if (v7)
  {
    id v8 = (void *)v7;
    id v9 = v6;
    do
    {
      id v10 = v9;

      id v9 = v8;
      id v8 = [v9 superview];

      id v6 = v10;
    }
    while (v8);
  }
  else
  {
    id v9 = v6;
    id v10 = v6;
  }
  [(UIProgressHUD *)self->_hud showInView:v10];
}

- (void)hideActivityInProgressUI
{
  [(id)*MEMORY[0x263F1D020] endIgnoringInteractionEvents];
  [(UIProgressHUD *)self->_hud removeFromSuperview];
  hud = self->_hud;
  self->_hud = 0;

  self->_activityInProgress = 0;
}

- (void)hideActivityInProgressUIWithDelay:(double)a3
{
  if (a3 <= 0.0)
  {
    [(FMDUIFMIPiCloudSettingsViewController *)self hideActivityInProgressUI];
  }
  else
  {
    [(UIProgressHUD *)self->_hud done];
    [(FMDUIFMIPiCloudSettingsViewController *)self performSelector:sel_hideActivityInProgressUI withObject:self afterDelay:a3];
  }
}

- (BOOL)isShowingActivityInProgressUI
{
  return self->_activityInProgress;
}

- (BOOL)firstTimeSetup
{
  return self->_firstTimeSetup;
}

- (void)setFirstTimeSetup:(BOOL)a3
{
  self->_firstTimeSetup = a3;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (PSSpecifier)fmipSpecifier
{
  return self->_fmipSpecifier;
}

- (void)setFmipSpecifier:(id)a3
{
}

- (BOOL)togglingFMIPSwitch
{
  return self->_togglingFMIPSwitch;
}

- (void)setTogglingFMIPSwitch:(BOOL)a3
{
  self->_togglingFMIPSwitch = a3;
}

- (PSSpecifier)sendLastLocationSpecifier
{
  return self->_sendLastLocationSpecifier;
}

- (void)setSendLastLocationSpecifier:(id)a3
{
}

- (UIProgressHUD)hud
{
  return self->_hud;
}

- (void)setHud:(id)a3
{
}

- (BOOL)activityInProgress
{
  return self->_activityInProgress;
}

- (void)setActivityInProgress:(BOOL)a3
{
  self->_activityInProgress = a3;
}

- (SPSettingsConfigurating)spSession
{
  return self->_spSession;
}

- (void)setSpSession:(id)a3
{
}

- (BOOL)offlineFindingEnabled
{
  return self->_offlineFindingEnabled;
}

- (void)setOfflineFindingEnabled:(BOOL)a3
{
  self->_offlineFindingEnabled = a3;
}

- (BOOL)offlineFindingDisabledDueToNotHSA2
{
  return self->_offlineFindingDisabledDueToNotHSA2;
}

- (void)setOfflineFindingDisabledDueToNotHSA2:(BOOL)a3
{
  self->_offlineFindingDisabledDueToNotHSA2 = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spSession, 0);
  objc_storeStrong((id *)&self->_hud, 0);
  objc_storeStrong((id *)&self->_sendLastLocationSpecifier, 0);
  objc_storeStrong((id *)&self->_fmipSpecifier, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

- (void)addHyperLinkStyleToText:(uint64_t)a1 inString:(NSObject *)a2 action:forGroup:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_239955000, a2, OS_LOG_TYPE_ERROR, "Group must use %@ as footer cell class", (uint8_t *)&v2, 0xCu);
}

@end