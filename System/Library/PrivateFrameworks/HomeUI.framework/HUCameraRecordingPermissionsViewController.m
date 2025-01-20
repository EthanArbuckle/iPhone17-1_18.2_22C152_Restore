@interface HUCameraRecordingPermissionsViewController
- (Class)onboardingFlowClass;
- (HMHome)home;
- (HUCameraRecordingPermissionsViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 itemTableViewController:(id)a6 home:(id)a7;
- (HUConfigurationViewControllerDelegate)delegate;
- (OBTrayButton)setupButton;
- (id)hu_preloadContent;
- (void)_setupCameraRecording:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHome:(id)a3;
- (void)setSetupButton:(id)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HUCameraRecordingPermissionsViewController

- (HUCameraRecordingPermissionsViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 itemTableViewController:(id)a6 home:(id)a7
{
  id v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)HUCameraRecordingPermissionsViewController;
  v14 = [(HUItemTableOBWelcomeController *)&v17 initWithTitle:a3 detailText:a4 icon:a5 contentLayout:2 itemTableViewController:a6];
  v15 = v14;
  if (v14) {
    objc_storeStrong((id *)&v14->_home, a7);
  }

  return v15;
}

- (void)_setupCameraRecording:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    id v13 = self;
    __int16 v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);
  }
  v7 = [(HUCameraRecordingPermissionsViewController *)self home];
  objc_msgSend(v7, "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");

  v8 = [(HUCameraRecordingPermissionsViewController *)self delegate];
  v10 = @"HUCameraRecordingOnboardingKey_UserInput";
  v11 = &unk_1F19B4838;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  [v8 viewController:self didFinishWithConfigurationResults:v9];
}

- (id)hu_preloadContent
{
  return (id)[MEMORY[0x1E4F7A0D8] futureWithNoResult];
}

- (void)viewDidLoad
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)HUCameraRecordingPermissionsViewController;
  [(HUItemTableOBWelcomeController *)&v16 viewDidLoad];
  v4 = [(HUCameraRecordingPermissionsViewController *)self headerView];
  v5 = [v4 subviews];
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:v5 withIDDictionary:&unk_1F19B5D68];

  v6 = [MEMORY[0x1E4F83A80] boldButton];
  [(HUCameraRecordingPermissionsViewController *)self setSetupButton:v6];

  v7 = [(HUCameraRecordingPermissionsViewController *)self setupButton];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  v8 = [(HUCameraRecordingPermissionsViewController *)self setupButton];
  v9 = _HULocalizedStringWithDefaultValue(@"HUCameraRecordingIntro_ContinueButton", @"HUCameraRecordingIntro_ContinueButton", 1);
  [v8 setTitle:v9 forState:0];

  v10 = [(HUCameraRecordingPermissionsViewController *)self setupButton];
  [v10 setAccessibilityIdentifier:@"Home.OnboardingView.CameraRecording.Permissions.ContinueButton"];

  v11 = [(HUCameraRecordingPermissionsViewController *)self setupButton];
  [v11 addTarget:self action:sel__setupCameraRecording_ forControlEvents:64];

  v12 = [(HUCameraRecordingPermissionsViewController *)self buttonTray];
  id v13 = [(HUCameraRecordingPermissionsViewController *)self setupButton];
  [v12 addButton:v13];

  [(HUCameraRecordingPermissionsViewController *)self setModalInPresentation:1];
  __int16 v14 = HFLogForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v18 = self;
    __int16 v19 = 2112;
    v20 = v15;
    _os_log_impl(&dword_1BE345000, v14, OS_LOG_TYPE_DEFAULT, "%@:%@: presented: CRPVC", buf, 0x16u);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)HUCameraRecordingPermissionsViewController;
  [(HUCameraRecordingPermissionsViewController *)&v8 viewWillDisappear:a3];
  if ([(HUCameraRecordingPermissionsViewController *)self isMovingFromParentViewController])
  {
    v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v10 = self;
      __int16 v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped BACK button", buf, 0x16u);
    }
    v7 = [(HUCameraRecordingPermissionsViewController *)self delegate];
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupButton, 0);
  objc_storeStrong((id *)&self->_home, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end