@interface HUTVViewingProfilesSetupViewController
- (Class)onboardingFlowClass;
- (HMHome)home;
- (HUConfigurationViewControllerDelegate)delegate;
- (HUTVViewingProfilesEditorItemManager)tvVPEditorItemManager;
- (HUTVViewingProfilesSetupViewController)initWithHome:(id)a3;
- (OBLinkTrayButton)customizeButton;
- (OBTrayButton)useTVVPButton;
- (id)hu_preloadContent;
- (id)moduleController:(id)a3 dismissViewControllerForRequest:(id)a4;
- (id)moduleController:(id)a3 presentViewControllerForRequest:(id)a4;
- (id)moduleController:(id)a3 textFieldForVisibleItem:(id)a4;
- (void)_customizeOrOffButton:(id)a3;
- (void)_setupTVViewingProfilesItemInfrastructure;
- (void)_turnOnAllTVViewingProfiles:(id)a3;
- (void)setCustomizeButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHome:(id)a3;
- (void)setTvVPEditorItemManager:(id)a3;
- (void)setUseTVVPButton:(id)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HUTVViewingProfilesSetupViewController

- (HUTVViewingProfilesSetupViewController)initWithHome:(id)a3
{
  id v5 = a3;
  v6 = _HULocalizedStringWithDefaultValue(@"HUTVViewingProfilesSetup_Title", @"HUTVViewingProfilesSetup_Title", 1);
  v7 = _HULocalizedStringWithDefaultValue(@"HUTVViewingProfilesSetup_Detail", @"HUTVViewingProfilesSetup_Detail", 1);
  v8 = HUImageNamed(@"Onboarding-TVViewingProfiles");
  v11.receiver = self;
  v11.super_class = (Class)HUTVViewingProfilesSetupViewController;
  v9 = [(HUImageOBWelcomeController *)&v11 initWithTitle:v6 detailText:v7 icon:0 contentImage:v8];

  if (v9) {
    objc_storeStrong((id *)&v9->_home, a3);
  }

  return v9;
}

- (void)_setupTVViewingProfilesItemInfrastructure
{
  id v4 = objc_alloc(MEMORY[0x1E4F69710]);
  id v5 = [(HUTVViewingProfilesSetupViewController *)self home];
  v6 = [(HUTVViewingProfilesSetupViewController *)self home];
  v7 = [v6 currentUser];
  id v11 = (id)[v4 initWithHome:v5 user:v7 nameStyle:0];

  v8 = [[HUTVViewingProfilesEditorItemManager alloc] initWithDelegate:self userItem:v11];
  [(HUTVViewingProfilesSetupViewController *)self setTvVPEditorItemManager:v8];

  v9 = [(HUTVViewingProfilesSetupViewController *)self tvVPEditorItemManager];
  id v10 = (id)[v9 reloadAndUpdateAllItemsFromSenderSelector:a2];
}

- (void)_customizeOrOffButton:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    int v13 = 138412546;
    v14 = self;
    __int16 v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", (uint8_t *)&v13, 0x16u);
  }
  v7 = [MEMORY[0x1E4F1CA60] dictionary];
  v8 = [(HUTVViewingProfilesSetupViewController *)self home];
  v9 = objc_msgSend(v8, "hf_appleTVs");
  unint64_t v10 = [v9 count];

  if (v10 <= 1) {
    id v11 = &unk_1F19B4298;
  }
  else {
    id v11 = &unk_1F19B42B0;
  }
  [v7 setObject:v11 forKeyedSubscript:@"HUTVViewingProfilesOnboardingKey_UserInput"];
  [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"HUMultiUserKey_SetIsEnabled"];
  v12 = [(HUTVViewingProfilesSetupViewController *)self delegate];
  [v12 viewController:self didFinishWithConfigurationResults:v7];
}

- (void)_turnOnAllTVViewingProfiles:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v18 = self;
    __int16 v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);
  }
  v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = (HUTVViewingProfilesSetupViewController *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v18 = v8;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@: Turning on TV Viewing Profiles for all devices", buf, 0xCu);
  }
  v9 = [(HUTVViewingProfilesSetupViewController *)self tvVPEditorItemManager];
  unint64_t v10 = [v9 tvpDevicesModule];
  [v10 turnOnTVViewingProfilesForAllDevices];

  id v11 = (void *)MEMORY[0x1E4F1CA60];
  __int16 v15 = @"HUTVViewingProfilesOnboardingKey_UserInput";
  v16 = &unk_1F19B42C8;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  int v13 = [v11 dictionaryWithDictionary:v12];

  [v13 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"HUMultiUserKey_SetIsEnabled"];
  v14 = [(HUTVViewingProfilesSetupViewController *)self delegate];
  [v14 viewController:self didFinishWithConfigurationResults:v13];
}

- (id)hu_preloadContent
{
  return (id)[MEMORY[0x1E4F7A0D8] futureWithNoResult];
}

- (id)moduleController:(id)a3 presentViewControllerForRequest:(id)a4
{
  return [(UIViewController *)self hu_performPresentationRequest:a4];
}

- (id)moduleController:(id)a3 dismissViewControllerForRequest:(id)a4
{
  return [(UIViewController *)self hu_performDismissalRequest:a4];
}

- (id)moduleController:(id)a3 textFieldForVisibleItem:(id)a4
{
  return 0;
}

- (void)viewDidLoad
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v31.receiver = self;
  v31.super_class = (Class)HUTVViewingProfilesSetupViewController;
  [(HUImageOBWelcomeController *)&v31 viewDidLoad];
  id v4 = [(HUTVViewingProfilesSetupViewController *)self headerView];
  id v5 = [v4 subviews];
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:v5 withIDDictionary:&unk_1F19B5C50];

  v6 = [(HUTVViewingProfilesSetupViewController *)self home];
  v7 = objc_msgSend(v6, "hf_appleTVs");
  uint64_t v8 = [v7 count];

  v9 = [MEMORY[0x1E4F83A80] boldButton];
  [(HUTVViewingProfilesSetupViewController *)self setUseTVVPButton:v9];

  unint64_t v10 = [(HUTVViewingProfilesSetupViewController *)self useTVVPButton];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v11 = [(HUTVViewingProfilesSetupViewController *)self useTVVPButton];
  if (v8 == 1) {
    v12 = @"HUTVViewingProfilesSetup_UseTVViewingProfilesButton_Single";
  }
  else {
    v12 = @"HUTVViewingProfilesSetup_UseTVViewingProfilesButton_Multiple";
  }
  if (v8 == 1) {
    int v13 = @"HUTVViewingProfilesSetup_CustomizeButton_Single";
  }
  else {
    int v13 = @"HUTVViewingProfilesSetup_CustomizeButton_Multiple";
  }
  v14 = _HULocalizedStringWithDefaultValue(v12, v12, 1);
  [v11 setTitle:v14 forState:0];

  __int16 v15 = [(HUTVViewingProfilesSetupViewController *)self useTVVPButton];
  [v15 setAccessibilityIdentifier:@"Home.OnboardingView.TVViewing.SetUp.SingleOrMultipleButton"];

  v16 = [(HUTVViewingProfilesSetupViewController *)self useTVVPButton];
  [v16 addTarget:self action:sel__turnOnAllTVViewingProfiles_ forControlEvents:64];

  uint64_t v17 = [(HUTVViewingProfilesSetupViewController *)self buttonTray];
  v18 = [(HUTVViewingProfilesSetupViewController *)self useTVVPButton];
  [v17 addButton:v18];

  __int16 v19 = [MEMORY[0x1E4F83AB8] linkButton];
  [(HUTVViewingProfilesSetupViewController *)self setCustomizeButton:v19];

  v20 = [(HUTVViewingProfilesSetupViewController *)self customizeButton];
  [v20 setTranslatesAutoresizingMaskIntoConstraints:0];

  uint64_t v21 = [(HUTVViewingProfilesSetupViewController *)self customizeButton];
  v22 = _HULocalizedStringWithDefaultValue(v13, v13, 1);
  [v21 setTitle:v22 forState:0];

  v23 = [(HUTVViewingProfilesSetupViewController *)self customizeButton];
  [v23 setAccessibilityIdentifier:@"Home.OnboardingView.TVViewing.SetUp.SingleOrMultipleCustomizeButton"];

  v24 = [(HUTVViewingProfilesSetupViewController *)self customizeButton];
  [v24 addTarget:self action:sel__customizeOrOffButton_ forControlEvents:64];

  v25 = [(HUTVViewingProfilesSetupViewController *)self buttonTray];
  v26 = [(HUTVViewingProfilesSetupViewController *)self customizeButton];
  [v25 addButton:v26];

  v27 = [(HUTVViewingProfilesSetupViewController *)self buttonTray];
  v28 = HULocalizedModelString(@"HUTVViewingProfilesSetup_FinePrint");
  [v27 addCaptionText:v28];

  [(HUTVViewingProfilesSetupViewController *)self setModalInPresentation:1];
  [(HUTVViewingProfilesSetupViewController *)self _setupTVViewingProfilesItemInfrastructure];
  v29 = HFLogForCategory();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v30 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v33 = self;
    __int16 v34 = 2112;
    v35 = v30;
    _os_log_impl(&dword_1BE345000, v29, OS_LOG_TYPE_DEFAULT, "%@:%@: presented: TVVPSVC", buf, 0x16u);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)HUTVViewingProfilesSetupViewController;
  [(HUTVViewingProfilesSetupViewController *)&v8 viewWillDisappear:a3];
  if ([(HUTVViewingProfilesSetupViewController *)self isMovingFromParentViewController])
  {
    id v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      unint64_t v10 = self;
      __int16 v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped BACK button", buf, 0x16u);
    }
    v7 = [(HUTVViewingProfilesSetupViewController *)self delegate];
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

- (OBTrayButton)useTVVPButton
{
  return self->_useTVVPButton;
}

- (void)setUseTVVPButton:(id)a3
{
}

- (OBLinkTrayButton)customizeButton
{
  return self->_customizeButton;
}

- (void)setCustomizeButton:(id)a3
{
}

- (HUTVViewingProfilesEditorItemManager)tvVPEditorItemManager
{
  return self->_tvVPEditorItemManager;
}

- (void)setTvVPEditorItemManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tvVPEditorItemManager, 0);
  objc_storeStrong((id *)&self->_customizeButton, 0);
  objc_storeStrong((id *)&self->_useTVVPButton, 0);
  objc_storeStrong((id *)&self->_home, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end