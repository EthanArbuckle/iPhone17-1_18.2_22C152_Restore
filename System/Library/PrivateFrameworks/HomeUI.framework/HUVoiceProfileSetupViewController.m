@interface HUVoiceProfileSetupViewController
- (Class)onboardingFlowClass;
- (HMHome)home;
- (HUConfigurationViewControllerDelegate)delegate;
- (HUPersonalRequestsEditorItemManager)prEditorItemManager;
- (HUVoiceProfileSetupViewController)initWithHome:(id)a3;
- (NSString)buttonOneText;
- (OBLinkTrayButton)notNowButton;
- (OBTrayButton)setupButton;
- (VTUIEnrollTrainingViewController)voiceProfileVC;
- (id)hu_preloadContent;
- (void)_dontSetupVoiceProfile;
- (void)_dontSetupVoiceProfileWithWarning:(id)a3;
- (void)_resetVoiceProfileSetup;
- (void)_setupPersonalRequestsItemInfrastructure;
- (void)_setupVoiceProfile:(id)a3;
- (void)_turnOffPersonalRequests;
- (void)_turnOffVoiceRecognition;
- (void)continueSetup;
- (void)dismissSetup;
- (void)setButtonOneText:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHome:(id)a3;
- (void)setNotNowButton:(id)a3;
- (void)setPrEditorItemManager:(id)a3;
- (void)setSetupButton:(id)a3;
- (void)setVoiceProfileVC:(id)a3;
- (void)skipSetup;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HUVoiceProfileSetupViewController

- (HUVoiceProfileSetupViewController)initWithHome:(id)a3
{
  id v5 = a3;
  v6 = HULocalizedSiriTriggerPhrase(v5);
  v7 = [MEMORY[0x1E4F4E538] sharedPreferences];
  int v8 = [v7 assistantIsEnabled];

  if (v8)
  {
    v9 = _HULocalizedStringWithDefaultValue(@"HUVoiceProfileSetup_Title", @"HUVoiceProfileSetup_Title", 1);
    v16 = HULocalizedStringWithFormat(@"HUVoiceProfileSetup_Detail", @"%@", v10, v11, v12, v13, v14, v15, (uint64_t)v6);
    v17 = HULocalizedSiriTriggerPhrase(v5);
    HULocalizedStringWithFormat(@"HUVoiceProfileSetup_SetupButton", @"%@", v18, v19, v20, v21, v22, v23, (uint64_t)v17);
    v24 = (NSString *)objc_claimAutoreleasedReturnValue();
    buttonOneText = self->_buttonOneText;
    self->_buttonOneText = v24;
  }
  else
  {
    v9 = _HULocalizedStringWithDefaultValue(@"HUSiriSetup_Title", @"HUSiriSetup_Title", 1);
    v26 = HULocalizedModelString(@"HUSiriSetup_Detail");
    id v35 = 0;
    v16 = [NSString stringWithValidatedFormat:v26, @"%@", &v35, v6 validFormatSpecifiers error];
    id v27 = v35;
    v28 = v27;
    if (!v16) {
      NSLog(&cfstr_CouldnTLocaliz.isa, v26, v27);
    }
    _HULocalizedStringWithDefaultValue(@"HUSiriSetup_SetupButton", @"HUSiriSetup_SetupButton", 1);
    v29 = (NSString *)objc_claimAutoreleasedReturnValue();
    v30 = self->_buttonOneText;
    self->_buttonOneText = v29;
  }
  v31 = HUImageNamed(@"Onboarding-Siri");
  v34.receiver = self;
  v34.super_class = (Class)HUVoiceProfileSetupViewController;
  v32 = [(HUImageOBWelcomeController *)&v34 initWithTitle:v9 detailText:v16 icon:0 contentImage:v31];

  if (v32) {
    objc_storeStrong((id *)&v32->_home, a3);
  }

  return v32;
}

- (void)_setupPersonalRequestsItemInfrastructure
{
  id v4 = objc_alloc(MEMORY[0x1E4F69710]);
  id v5 = [(HUVoiceProfileSetupViewController *)self home];
  v6 = [(HUVoiceProfileSetupViewController *)self home];
  v7 = [v6 currentUser];
  id v11 = (id)[v4 initWithHome:v5 user:v7 nameStyle:0];

  int v8 = [[HUPersonalRequestsEditorItemManager alloc] initWithDelegate:0 userItem:v11 onlyShowDeviceSwitches:1];
  [(HUVoiceProfileSetupViewController *)self setPrEditorItemManager:v8];

  v9 = [(HUVoiceProfileSetupViewController *)self prEditorItemManager];
  id v10 = (id)[v9 reloadAndUpdateAllItemsFromSenderSelector:a2];
}

- (void)_dontSetupVoiceProfileWithWarning:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    int v16 = 138412546;
    v17 = self;
    __int16 v18 = 2112;
    uint64_t v19 = v6;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", (uint8_t *)&v16, 0x16u);
  }
  v7 = [(HUVoiceProfileSetupViewController *)self prEditorItemManager];
  int v8 = [v7 prDevicesModule];
  v9 = [v8 personalRequestsDevices];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    id v11 = [(HUVoiceProfileSetupViewController *)self home];
    if (objc_msgSend(v11, "hf_currentUserIsAdministrator"))
    {

LABEL_7:
      int v14 = 0;
      int v15 = 1;
      goto LABEL_9;
    }
    uint64_t v12 = [(HUVoiceProfileSetupViewController *)self home];
    int v13 = objc_msgSend(v12, "hf_currentUserIsOwner");

    if (v13) {
      goto LABEL_7;
    }
  }
  int v15 = 0;
  int v14 = 1;
LABEL_9:
  if (([MEMORY[0x1E4F69758] isAMac] & 1) != 0
    || ([MEMORY[0x1E4F69758] isAVisionPro] & 1) != 0)
  {
    goto LABEL_15;
  }
  if (v14)
  {
    +[HUHomeFeatureOnboardingUtilities presentAlertConfirmingTurningOfVoiceRecognitionFrom:self];
    return;
  }
  if (!v15) {
LABEL_15:
  }
    [(HUVoiceProfileSetupViewController *)self _dontSetupVoiceProfile];
  else {
    +[HUHomeFeatureOnboardingUtilities presentAlertConfirmingTurningOffPersonalRequestsFrom:self];
  }
}

- (void)_dontSetupVoiceProfile
{
  v6[1] = *MEMORY[0x1E4F143B8];
  [(HUVoiceProfileSetupViewController *)self _turnOffVoiceRecognition];
  [(HUVoiceProfileSetupViewController *)self _turnOffPersonalRequests];
  v3 = [(HUVoiceProfileSetupViewController *)self delegate];
  id v5 = @"HUVoiceProfileOnboardingKey_UserInput";
  v6[0] = &unk_1F19B5468;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  [v3 viewController:self didFinishWithConfigurationResults:v4];
}

- (void)_setupVoiceProfile:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    int v18 = 138412546;
    uint64_t v19 = self;
    __int16 v20 = 2112;
    uint64_t v21 = v6;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", (uint8_t *)&v18, 0x16u);
  }
  v7 = (void *)[objc_alloc(MEMORY[0x1E4FB5020]) init:2];
  [(HUVoiceProfileSetupViewController *)self setVoiceProfileVC:v7];

  int v8 = [(HUVoiceProfileSetupViewController *)self voiceProfileVC];
  [v8 setDelegate:self];

  v9 = [(HUVoiceProfileSetupViewController *)self navigationController];
  [v9 setNavigationBarHidden:0 animated:1];

  uint64_t v10 = [(HUVoiceProfileSetupViewController *)self navigationController];
  id v11 = [v10 navigationBar];
  id v12 = objc_alloc_init(MEMORY[0x1E4F42A80]);
  [v11 setBackgroundImage:v12 forBarPosition:0 barMetrics:0];

  int v13 = [(HUVoiceProfileSetupViewController *)self navigationController];
  int v14 = [v13 navigationBar];
  id v15 = objc_alloc_init(MEMORY[0x1E4F42A80]);
  [v14 setShadowImage:v15];

  int v16 = [(HUVoiceProfileSetupViewController *)self navigationController];
  v17 = [(HUVoiceProfileSetupViewController *)self voiceProfileVC];
  [v16 pushViewController:v17 animated:1];
}

- (void)_resetVoiceProfileSetup
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(a2);
    int v14 = 138412546;
    id v15 = self;
    __int16 v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", (uint8_t *)&v14, 0x16u);
  }
  v6 = [(HUVoiceProfileSetupViewController *)self voiceProfileVC];
  [v6 setDelegate:0];

  v7 = (void *)[objc_alloc(MEMORY[0x1E4FB5020]) init:2];
  [(HUVoiceProfileSetupViewController *)self setVoiceProfileVC:v7];

  int v8 = [(HUVoiceProfileSetupViewController *)self voiceProfileVC];
  [v8 setDelegate:self];

  v9 = [(HUVoiceProfileSetupViewController *)self navigationController];
  uint64_t v10 = [v9 viewControllers];
  id v11 = (void *)[v10 mutableCopy];

  [v11 removeLastObject];
  id v12 = [(HUVoiceProfileSetupViewController *)self voiceProfileVC];
  [v11 addObject:v12];

  int v13 = [(HUVoiceProfileSetupViewController *)self navigationController];
  [v13 setViewControllers:v11 animated:0];
}

- (void)_turnOffVoiceRecognition
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(a2);
    int v12 = 138412546;
    int v13 = self;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@: Turning off Recognize My Voice", (uint8_t *)&v12, 0x16u);
  }
  id v6 = objc_alloc(MEMORY[0x1E4F69710]);
  v7 = [(HUVoiceProfileSetupViewController *)self home];
  int v8 = [(HUVoiceProfileSetupViewController *)self home];
  v9 = [v8 currentUser];
  uint64_t v10 = (void *)[v6 initWithHome:v7 user:v9 nameStyle:0];

  id v11 = (id)[v10 setEnableIdentifyVoice:0];
}

- (void)_turnOffPersonalRequests
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(a2);
    int v8 = 138412546;
    v9 = self;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@: Turning off all Personal Requests devices", (uint8_t *)&v8, 0x16u);
  }
  id v6 = [(HUVoiceProfileSetupViewController *)self prEditorItemManager];
  v7 = [v6 prDevicesModule];
  [v7 setPersonalRequestsDevices:MEMORY[0x1E4F1CBF0]];
}

- (id)hu_preloadContent
{
  return (id)[MEMORY[0x1E4F7A0D8] futureWithNoResult];
}

- (void)skipSetup
{
}

- (void)continueSetup
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v3 = [(HUVoiceProfileSetupViewController *)self navigationController];
  [v3 setNavigationBarHidden:1 animated:1];

  id v4 = [(HUVoiceProfileSetupViewController *)self delegate];
  id v6 = @"HUVoiceProfileOnboardingKey_UserInput";
  v7[0] = &unk_1F19B5480;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v4 viewController:self didFinishWithConfigurationResults:v5];
}

- (void)dismissSetup
{
}

- (void)viewDidLoad
{
  v31[1] = *MEMORY[0x1E4F143B8];
  v26.receiver = self;
  v26.super_class = (Class)HUVoiceProfileSetupViewController;
  [(HUImageOBWelcomeController *)&v26 viewDidLoad];
  id v4 = [(HUVoiceProfileSetupViewController *)self headerView];
  id v5 = [v4 subviews];
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:v5 withIDDictionary:&unk_1F19B5F98];

  id v6 = [MEMORY[0x1E4F83A80] boldButton];
  [(HUVoiceProfileSetupViewController *)self setSetupButton:v6];

  v7 = [(HUVoiceProfileSetupViewController *)self setupButton];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  int v8 = [(HUVoiceProfileSetupViewController *)self setupButton];
  v9 = [(HUVoiceProfileSetupViewController *)self buttonOneText];
  [v8 setTitle:v9 forState:0];

  __int16 v10 = [(HUVoiceProfileSetupViewController *)self setupButton];
  [v10 setAccessibilityIdentifier:@"Home.Onboarding.Voice.SetupButton"];

  id v11 = [(HUVoiceProfileSetupViewController *)self setupButton];
  [v11 addTarget:self action:sel__setupVoiceProfile_ forControlEvents:64];

  uint64_t v12 = [(HUVoiceProfileSetupViewController *)self buttonTray];
  int v13 = [(HUVoiceProfileSetupViewController *)self setupButton];
  [v12 addButton:v13];

  __int16 v14 = [MEMORY[0x1E4F83AB8] linkButton];
  [(HUVoiceProfileSetupViewController *)self setNotNowButton:v14];

  id v15 = [(HUVoiceProfileSetupViewController *)self notNowButton];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

  uint64_t v16 = [(HUVoiceProfileSetupViewController *)self notNowButton];
  v17 = _HULocalizedStringWithDefaultValue(@"HUVoiceProfileSetup_NotNowButton", @"HUVoiceProfileSetup_NotNowButton", 1);
  [v16 setTitle:v17 forState:0];

  uint64_t v18 = [(HUVoiceProfileSetupViewController *)self notNowButton];
  [v18 setAccessibilityIdentifier:@"Home.Onboarding.Voice.NotNowButton"];

  uint64_t v19 = [(HUVoiceProfileSetupViewController *)self notNowButton];
  [v19 addTarget:self action:sel__dontSetupVoiceProfileWithWarning_ forControlEvents:64];

  __int16 v20 = [(HUVoiceProfileSetupViewController *)self buttonTray];
  uint64_t v21 = [(HUVoiceProfileSetupViewController *)self notNowButton];
  [v20 addButton:v21];

  uint64_t v22 = [(HUVoiceProfileSetupViewController *)self buttonTray];
  v31[0] = *MEMORY[0x1E4F83B18];
  uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
  [v22 setPrivacyLinkForBundles:v23];

  [(HUVoiceProfileSetupViewController *)self setModalInPresentation:1];
  [(HUVoiceProfileSetupViewController *)self _setupPersonalRequestsItemInfrastructure];
  v24 = HFLogForCategory();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v28 = self;
    __int16 v29 = 2112;
    v30 = v25;
    _os_log_impl(&dword_1BE345000, v24, OS_LOG_TYPE_DEFAULT, "%@:%@: presented: VPSVC", buf, 0x16u);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)HUVoiceProfileSetupViewController;
  [(HUVoiceProfileSetupViewController *)&v8 viewWillDisappear:a3];
  if ([(HUVoiceProfileSetupViewController *)self isMovingFromParentViewController])
  {
    id v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      __int16 v10 = self;
      __int16 v11 = 2112;
      uint64_t v12 = v6;
      _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped BACK button", buf, 0x16u);
    }
    v7 = [(HUVoiceProfileSetupViewController *)self delegate];
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

- (OBTrayButton)setupButton
{
  return self->_setupButton;
}

- (void)setSetupButton:(id)a3
{
}

- (OBLinkTrayButton)notNowButton
{
  return self->_notNowButton;
}

- (void)setNotNowButton:(id)a3
{
}

- (HUPersonalRequestsEditorItemManager)prEditorItemManager
{
  return self->_prEditorItemManager;
}

- (void)setPrEditorItemManager:(id)a3
{
}

- (NSString)buttonOneText
{
  return self->_buttonOneText;
}

- (void)setButtonOneText:(id)a3
{
}

- (VTUIEnrollTrainingViewController)voiceProfileVC
{
  return self->_voiceProfileVC;
}

- (void)setVoiceProfileVC:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceProfileVC, 0);
  objc_storeStrong((id *)&self->_buttonOneText, 0);
  objc_storeStrong((id *)&self->_prEditorItemManager, 0);
  objc_storeStrong((id *)&self->_notNowButton, 0);
  objc_storeStrong((id *)&self->_setupButton, 0);
  objc_storeStrong((id *)&self->_home, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end