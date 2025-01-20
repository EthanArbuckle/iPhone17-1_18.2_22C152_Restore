@interface HUCameraRecordingSetupViewController
- (Class)onboardingFlowClass;
- (HMHome)home;
- (HUCameraRecordingSetupViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 itemTableViewController:(id)a6 home:(id)a7;
- (HUConfigurationViewControllerDelegate)delegate;
- (OBTrayButton)learnMoreButton;
- (OBTrayButton)setupButton;
- (id)hu_preloadContent;
- (void)_setupCameraRecording:(id)a3;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHome:(id)a3;
- (void)setLearnMoreButton:(id)a3;
- (void)setSetupButton:(id)a3;
- (void)showCameraRecordingLearnMore;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HUCameraRecordingSetupViewController

- (HUCameraRecordingSetupViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 itemTableViewController:(id)a6 home:(id)a7
{
  id v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)HUCameraRecordingSetupViewController;
  v14 = [(HUItemTableOBWelcomeController *)&v17 initWithTitle:a3 detailText:a4 icon:a5 contentLayout:2 itemTableViewController:a6];
  v15 = v14;
  if (v14) {
    objc_storeStrong((id *)&v14->_home, a7);
  }

  return v15;
}

- (void)_setupCameraRecording:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v18 = self;
    __int16 v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);
  }
  v7 = [(HUCameraRecordingSetupViewController *)self home];
  v8 = objc_msgSend(v7, "hf_allNonAdminUsers");
  if ([v8 count])
  {
    v9 = [(HUCameraRecordingSetupViewController *)self home];
    if (objc_msgSend(v9, "hf_hasCameraRecordingResident")) {
      uint64_t v10 = 2;
    }
    else {
      uint64_t v10 = 1;
    }
  }
  else
  {
    uint64_t v10 = 1;
  }

  v11 = [(HUCameraRecordingSetupViewController *)self home];
  objc_msgSend(v11, "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");

  v12 = [(HUCameraRecordingSetupViewController *)self delegate];
  id v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v10, @"HUCameraRecordingOnboardingKey_UserInput");
  v16 = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  [v12 viewController:self didFinishWithConfigurationResults:v14];
}

- (void)showCameraRecordingLearnMore
{
  uint64_t v3 = [(HUCameraRecordingSetupViewController *)self navigationController];
  v4 = (void *)v3;
  if (v3) {
    v5 = (HUCameraRecordingSetupViewController *)v3;
  }
  else {
    v5 = self;
  }
  v6 = v5;

  v7 = objc_alloc_init(HUCameraRecordingLearnMoreViewController);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__HUCameraRecordingSetupViewController_showCameraRecordingLearnMore__block_invoke;
  v10[3] = &unk_1E63850E0;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

uint64_t __68__HUCameraRecordingSetupViewController_showCameraRecordingLearnMore__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUCameraRecordingSetupViewController;
  [(HUCameraRecordingSetupViewController *)&v4 preferredContentSizeDidChangeForChildContentContainer:a3];
  [(HUItemTableOBWelcomeController *)self updateViewConstraints];
}

- (id)hu_preloadContent
{
  return (id)[MEMORY[0x1E4F7A0D8] futureWithNoResult];
}

- (void)viewDidLoad
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)HUCameraRecordingSetupViewController;
  [(HUItemTableOBWelcomeController *)&v24 viewDidLoad];
  objc_super v4 = [(HUCameraRecordingSetupViewController *)self headerView];
  v5 = [v4 subviews];
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:v5 withIDDictionary:&unk_1F19B5C00];

  v6 = [MEMORY[0x1E4F83A80] boldButton];
  [(HUCameraRecordingSetupViewController *)self setSetupButton:v6];

  v7 = [(HUCameraRecordingSetupViewController *)self setupButton];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  v8 = [(HUCameraRecordingSetupViewController *)self setupButton];
  v9 = _HULocalizedStringWithDefaultValue(@"HUCameraRecordingIntro_ContinueButton", @"HUCameraRecordingIntro_ContinueButton", 1);
  [v8 setTitle:v9 forState:0];

  uint64_t v10 = [(HUCameraRecordingSetupViewController *)self setupButton];
  [v10 setAccessibilityIdentifier:@"Home.OnboardingView.SetUp.ContinueButton"];

  v11 = [(HUCameraRecordingSetupViewController *)self setupButton];
  [v11 addTarget:self action:sel__setupCameraRecording_ forControlEvents:64];

  v12 = [(HUCameraRecordingSetupViewController *)self buttonTray];
  id v13 = [(HUCameraRecordingSetupViewController *)self setupButton];
  [v12 addButton:v13];

  v14 = [MEMORY[0x1E4F83AB8] linkButton];
  [(HUCameraRecordingSetupViewController *)self setLearnMoreButton:v14];

  uint64_t v15 = [(HUCameraRecordingSetupViewController *)self learnMoreButton];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

  v16 = [(HUCameraRecordingSetupViewController *)self learnMoreButton];
  objc_super v17 = HFLocalizedString();
  [v16 setTitle:v17 forState:0];

  v18 = [(HUCameraRecordingSetupViewController *)self setupButton];
  [v18 setAccessibilityIdentifier:@"Home.OnboardingView.SetUp.Footer.LearnMoreButton"];

  __int16 v19 = [(HUCameraRecordingSetupViewController *)self learnMoreButton];
  [v19 addTarget:self action:sel_showCameraRecordingLearnMore forControlEvents:64];

  v20 = [(HUCameraRecordingSetupViewController *)self buttonTray];
  uint64_t v21 = [(HUCameraRecordingSetupViewController *)self learnMoreButton];
  [v20 addButton:v21];

  [(HUCameraRecordingSetupViewController *)self setModalInPresentation:1];
  v22 = HFLogForCategory();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v26 = self;
    __int16 v27 = 2112;
    v28 = v23;
    _os_log_impl(&dword_1BE345000, v22, OS_LOG_TYPE_DEFAULT, "%@:%@: presented: CRSVC", buf, 0x16u);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)HUCameraRecordingSetupViewController;
  [(HUCameraRecordingSetupViewController *)&v8 viewWillDisappear:a3];
  if ([(HUCameraRecordingSetupViewController *)self isMovingFromParentViewController])
  {
    v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      uint64_t v10 = self;
      __int16 v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped BACK button", buf, 0x16u);
    }
    v7 = [(HUCameraRecordingSetupViewController *)self delegate];
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

- (OBTrayButton)learnMoreButton
{
  return self->_learnMoreButton;
}

- (void)setLearnMoreButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_learnMoreButton, 0);
  objc_storeStrong((id *)&self->_setupButton, 0);
  objc_storeStrong((id *)&self->_home, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end