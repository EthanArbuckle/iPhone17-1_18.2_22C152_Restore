@interface HUTVViewingProfilesCustomizeViewController
- (Class)onboardingFlowClass;
- (HMHome)home;
- (HUConfigurationViewControllerDelegate)delegate;
- (HUTVViewingProfilesCustomizeViewController)initWithHome:(id)a3;
- (OBLinkTrayButton)customizeButton;
- (OBTrayButton)usePRButton;
- (id)hu_preloadContent;
- (void)_dontSetupTVViewingProfiles:(id)a3;
- (void)_setupTVViewingProfiles:(id)a3;
- (void)setCustomizeButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHome:(id)a3;
- (void)setUsePRButton:(id)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HUTVViewingProfilesCustomizeViewController

- (HUTVViewingProfilesCustomizeViewController)initWithHome:(id)a3
{
  id v5 = a3;
  id v6 = objc_alloc(MEMORY[0x1E4F69710]);
  v7 = [v5 currentUser];
  v8 = (void *)[v6 initWithHome:v5 user:v7 nameStyle:0];

  v9 = [[HUTVViewingProfilesEditorTableViewController alloc] initWithUserItem:v8];
  [(HUTVViewingProfilesEditorTableViewController *)v9 setHideHeadersAndFooters:1];
  v10 = _HULocalizedStringWithDefaultValue(@"HUTVViewingProfilesCustomize_Title", @"HUTVViewingProfilesCustomize_Title", 1);
  v11 = _HULocalizedStringWithDefaultValue(@"HUTVViewingProfilesSetup_Detail", @"HUTVViewingProfilesSetup_Detail", 1);
  v14.receiver = self;
  v14.super_class = (Class)HUTVViewingProfilesCustomizeViewController;
  v12 = [(HUItemTableOBWelcomeController *)&v14 initWithTitle:v10 detailText:v11 icon:0 contentLayout:2 itemTableViewController:v9];

  if (v12) {
    objc_storeStrong((id *)&v12->_home, a3);
  }

  return v12;
}

- (id)hu_preloadContent
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(a2);
    int v15 = 138412290;
    v16 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@: Turning on TV Viewing Profiles for all devices", (uint8_t *)&v15, 0xCu);
  }
  objc_opt_class();
  id v6 = [(HUItemTableOBWelcomeController *)self itemTableViewController];
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  objc_opt_class();
  v9 = [v8 itemManager];

  if (objc_opt_isKindOfClass()) {
    v10 = v9;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;

  v12 = [v11 tvpDevicesModule];

  [v12 turnOnTVViewingProfilesForAllDevices];
  v13 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];

  return v13;
}

- (void)_dontSetupTVViewingProfiles:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v21 = self;
    __int16 v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);
  }
  v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    id v8 = (HUTVViewingProfilesCustomizeViewController *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v21 = v8;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@: Turning off all TV Viewing Profiles devices", buf, 0xCu);
  }
  objc_opt_class();
  v9 = [(HUItemTableOBWelcomeController *)self itemTableViewController];
  if (objc_opt_isKindOfClass()) {
    v10 = v9;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;

  objc_opt_class();
  v12 = [v11 itemManager];

  if (objc_opt_isKindOfClass()) {
    v13 = v12;
  }
  else {
    v13 = 0;
  }
  id v14 = v13;

  int v15 = [v14 tvpDevicesModule];

  [v15 setViewingProfilesDevices:MEMORY[0x1E4F1CBF0]];
  v16 = [(HUTVViewingProfilesCustomizeViewController *)self delegate];
  v18 = @"HUTVViewingProfilesOnboardingKey_UserInput";
  v19 = &unk_1F19B54C8;
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  [v16 viewController:self didFinishWithConfigurationResults:v17];
}

- (void)_setupTVViewingProfiles:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v12 = self;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);
  }
  v7 = [(HUTVViewingProfilesCustomizeViewController *)self delegate];
  v9 = @"HUTVViewingProfilesOnboardingKey_UserInput";
  v10 = &unk_1F19B54E0;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  [v7 viewController:self didFinishWithConfigurationResults:v8];
}

- (void)viewDidLoad
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v29.receiver = self;
  v29.super_class = (Class)HUTVViewingProfilesCustomizeViewController;
  [(HUItemTableOBWelcomeController *)&v29 viewDidLoad];
  v4 = [(HUTVViewingProfilesCustomizeViewController *)self headerView];
  id v5 = [v4 subviews];
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:v5 withIDDictionary:&unk_1F19B5FC0];

  id v6 = [MEMORY[0x1E4F83A80] boldButton];
  [(HUTVViewingProfilesCustomizeViewController *)self setUsePRButton:v6];

  v7 = [(HUTVViewingProfilesCustomizeViewController *)self usePRButton];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v8 = [(HUTVViewingProfilesCustomizeViewController *)self usePRButton];
  v9 = _HULocalizedStringWithDefaultValue(@"HUTVViewingProfilesCustomize_ContinueButton", @"HUTVViewingProfilesCustomize_ContinueButton", 1);
  [v8 setTitle:v9 forState:0];

  v10 = [(HUTVViewingProfilesCustomizeViewController *)self usePRButton];
  [v10 setAccessibilityIdentifier:@"Home.Onboarding.TVViewing.CustomizeOrContinueButton"];

  id v11 = [(HUTVViewingProfilesCustomizeViewController *)self usePRButton];
  [v11 addTarget:self action:sel__setupTVViewingProfiles_ forControlEvents:64];

  v12 = [(HUTVViewingProfilesCustomizeViewController *)self buttonTray];
  __int16 v13 = [(HUTVViewingProfilesCustomizeViewController *)self usePRButton];
  [v12 addButton:v13];

  id v14 = [MEMORY[0x1E4F83AB8] linkButton];
  [(HUTVViewingProfilesCustomizeViewController *)self setCustomizeButton:v14];

  uint64_t v15 = [(HUTVViewingProfilesCustomizeViewController *)self customizeButton];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

  v16 = [(HUTVViewingProfilesCustomizeViewController *)self customizeButton];
  uint64_t v17 = _HULocalizedStringWithDefaultValue(@"HUTVViewingProfilesCustomize_DoNotUseButton", @"HUTVViewingProfilesCustomize_DoNotUseButton", 1);
  [v16 setTitle:v17 forState:0];

  v18 = [(HUTVViewingProfilesCustomizeViewController *)self customizeButton];
  [v18 setAccessibilityIdentifier:@"Home.Onboarding.TVViewing.CustomizeOrDoNotUseButton"];

  v19 = [(HUTVViewingProfilesCustomizeViewController *)self customizeButton];
  [v19 addTarget:self action:sel__dontSetupTVViewingProfiles_ forControlEvents:64];

  v20 = [(HUTVViewingProfilesCustomizeViewController *)self buttonTray];
  v21 = [(HUTVViewingProfilesCustomizeViewController *)self customizeButton];
  [v20 addButton:v21];

  __int16 v22 = [(HUTVViewingProfilesCustomizeViewController *)self buttonTray];
  v23 = HULocalizedModelString(@"HUTVViewingProfilesSetup_FinePrint");
  [v22 setCaptionText:v23];

  [(HUTVViewingProfilesCustomizeViewController *)self setModalInPresentation:1];
  uint64_t v24 = [(HUItemTableOBWelcomeController *)self itemTableViewController];
  v25 = [v24 itemManager];
  id v26 = (id)[v25 reloadAndUpdateAllItemsFromSenderSelector:a2];

  v27 = HFLogForCategory();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v31 = self;
    __int16 v32 = 2112;
    v33 = v28;
    _os_log_impl(&dword_1BE345000, v27, OS_LOG_TYPE_DEFAULT, "%@:%@: presented", buf, 0x16u);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)HUTVViewingProfilesCustomizeViewController;
  [(HUTVViewingProfilesCustomizeViewController *)&v8 viewWillDisappear:a3];
  if ([(HUTVViewingProfilesCustomizeViewController *)self isMovingFromParentViewController])
  {
    id v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v10 = self;
      __int16 v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped BACK button", buf, 0x16u);
    }
    v7 = [(HUTVViewingProfilesCustomizeViewController *)self delegate];
    [v7 viewControllerDidGoBack:self];
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

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (OBTrayButton)usePRButton
{
  return self->_usePRButton;
}

- (void)setUsePRButton:(id)a3
{
}

- (OBLinkTrayButton)customizeButton
{
  return self->_customizeButton;
}

- (void)setCustomizeButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customizeButton, 0);
  objc_storeStrong((id *)&self->_usePRButton, 0);
  objc_storeStrong((id *)&self->_home, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end