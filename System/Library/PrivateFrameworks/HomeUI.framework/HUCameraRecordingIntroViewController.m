@interface HUCameraRecordingIntroViewController
- (Class)onboardingFlowClass;
- (HMHome)home;
- (HUCameraRecordingIntroViewController)init;
- (HUCameraRecordingIntroViewController)initWithIntroVariant:(unint64_t)a3 home:(id)a4;
- (HUCameraRecordingIntroViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentImage:(id)a6;
- (HUConfigurationViewControllerDelegate)delegate;
- (NSString)captionText;
- (NSString)continueButtonText;
- (NSString)notNowButtonText;
- (OBLinkTrayButton)notNowButton;
- (OBTrayButton)setupButton;
- (id)hu_preloadContent;
- (unint64_t)variant;
- (void)_buttonOne:(id)a3;
- (void)_buttonTwo:(id)a3;
- (void)setCaptionText:(id)a3;
- (void)setContinueButtonText:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHome:(id)a3;
- (void)setNotNowButton:(id)a3;
- (void)setNotNowButtonText:(id)a3;
- (void)setSetupButton:(id)a3;
- (void)setVariant:(unint64_t)a3;
- (void)showCameraRecordingLearnMore;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HUCameraRecordingIntroViewController

- (HUCameraRecordingIntroViewController)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = NSStringFromSelector(sel_initWithIntroVariant_home_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUCameraRecordingIntroViewController.m", 34, @"%s is unavailable; use %@ instead",
    "-[HUCameraRecordingIntroViewController init]",
    v5);

  return 0;
}

- (HUCameraRecordingIntroViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentImage:(id)a6
{
  v8 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5, a6);
  v9 = NSStringFromSelector(sel_initWithIntroVariant_home_);
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUCameraRecordingIntroViewController.m", 39, @"%s is unavailable; use %@ instead",
    "-[HUCameraRecordingIntroViewController initWithTitle:detailText:icon:contentImage:]",
    v9);

  return 0;
}

- (HUCameraRecordingIntroViewController)initWithIntroVariant:(unint64_t)a3 home:(id)a4
{
  id v7 = a4;
  v8 = HUImageNamed(@"Onboarding-Camera");
  switch(a3)
  {
    case 0uLL:
      uint64_t v9 = 1;
      v10 = _HULocalizedStringWithDefaultValue(@"HUCameraRecordingIntro_Title", @"HUCameraRecordingIntro_Title", 1);
      v11 = _HULocalizedStringWithDefaultValue(@"HUCameraRecordingIntro_Detail", @"HUCameraRecordingIntro_Detail", 1);
      _HULocalizedStringWithDefaultValue(@"HUCameraRecordingIntro_ContinueButton", @"HUCameraRecordingIntro_ContinueButton", 1);
      v12 = (NSString *)objc_claimAutoreleasedReturnValue();
      continueButtonText = self->_continueButtonText;
      self->_continueButtonText = v12;

      _HULocalizedStringWithDefaultValue(@"HUCameraRecordingIntro_Footer", @"HUCameraRecordingIntro_Footer", 1);
      v14 = (objc_class *)objc_claimAutoreleasedReturnValue();
      uint64_t v15 = 1408;
      goto LABEL_5;
    case 1uLL:
      uint64_t v9 = 1;
      v10 = _HULocalizedStringWithDefaultValue(@"HUCameraRecordingUnsupportedIntro_Title", @"HUCameraRecordingUnsupportedIntro_Title", 1);
      v11 = _HULocalizedStringWithDefaultValue(@"HUCameraRecordingUnsupportedIntro_Detail", @"HUCameraRecordingUnsupportedIntro_Detail", 1);
      _HULocalizedStringWithDefaultValue(@"HUCameraRecordingIntro_ContinueButton", @"HUCameraRecordingIntro_ContinueButton", 1);
      v14 = (objc_class *)objc_claimAutoreleasedReturnValue();
      uint64_t v15 = 1392;
LABEL_5:
      v16 = *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v15);
      *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v15) = v14;

      notNowButtonText = self->_notNowButtonText;
      self->_notNowButtonText = 0;
      goto LABEL_14;
    case 2uLL:
      uint64_t v9 = 1;
      v10 = _HULocalizedStringWithDefaultValue(@"HUCameraRecordingIntro_Title", @"HUCameraRecordingIntro_Title", 1);
      v11 = _HULocalizedStringWithDefaultValue(@"HUCameraRecordingIntro_Detail", @"HUCameraRecordingIntro_Detail", 1);
      _HULocalizedStringWithDefaultValue(@"HUCameraRecordingIntro_ContinueButton", @"HUCameraRecordingIntro_ContinueButton", 1);
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      v19 = self->_continueButtonText;
      self->_continueButtonText = v18;

      v20 = @"HUCameraRecordingIntro_NotNowButton";
      goto LABEL_8;
    case 3uLL:
      uint64_t v9 = 1;
      v10 = _HULocalizedStringWithDefaultValue(@"HUCameraRecordingIntro_NeedsHub_Title", @"HUCameraRecordingIntro_NeedsHub_Title", 1);
      v11 = _HULocalizedStringWithDefaultValue(@"HUCameraRecordingIntro_NeedsHub_Detail", @"HUCameraRecordingIntro_NeedsHub_Detail", 1);
      _HULocalizedStringWithDefaultValue(@"HUCameraRecordingIntro_ContinueButton", @"HUCameraRecordingIntro_ContinueButton", 1);
      v21 = (NSString *)objc_claimAutoreleasedReturnValue();
      v22 = self->_continueButtonText;
      self->_continueButtonText = v21;

      v20 = @"HUCameraRecordingIntro_NeedsHub_LearnMoreButton";
LABEL_8:
      _HULocalizedStringWithDefaultValue(v20, v20, 1);
      v23 = (objc_class *)objc_claimAutoreleasedReturnValue();
      uint64_t v24 = 1400;
      goto LABEL_13;
    case 4uLL:
      v10 = _HULocalizedStringWithDefaultValue(@"HUUpgradeMultiUserDevices_Title", @"HUUpgradeMultiUserDevices_Title", 1);
      v11 = _HULocalizedStringWithDefaultValue(@"HUUpgradeMultiUserDevices_Generic_Detail", @"HUUpgradeMultiUserDevices_Generic_Detail", 1);
      _HULocalizedStringWithDefaultValue(@"HUCameraRecordingIntro_ContinueButton", @"HUCameraRecordingIntro_ContinueButton", 1);
      v25 = (NSString *)objc_claimAutoreleasedReturnValue();
      v26 = self->_continueButtonText;
      self->_continueButtonText = v25;

      uint64_t v27 = HUImageNamed(@"Onboarding-UpdateSoftware");

      uint64_t v9 = 0;
      notNowButtonText = self->_notNowButtonText;
      self->_notNowButtonText = 0;
      v8 = (void *)v27;
      goto LABEL_14;
    case 5uLL:
      uint64_t v9 = 1;
      v10 = _HULocalizedStringWithDefaultValue(@"HUCameraRecordingIntro_AlreadySetup_Title", @"HUCameraRecordingIntro_AlreadySetup_Title", 1);
      v11 = _HULocalizedStringWithDefaultValue(@"HUCameraRecordingIntro_AlreadySetup_Detail", @"HUCameraRecordingIntro_AlreadySetup_Detail", 1);
      _HULocalizedStringWithDefaultValue(@"HUCameraRecordingIntro_ContinueButton", @"HUCameraRecordingIntro_ContinueButton", 1);
      v28 = (NSString *)objc_claimAutoreleasedReturnValue();
      v29 = self->_continueButtonText;
      self->_continueButtonText = v28;

      _HULocalizedStringWithDefaultValue(@"HUCameraRecordingIntro_AlreadySetup_ReviewButton", @"HUCameraRecordingIntro_AlreadySetup_ReviewButton", 1);
      v30 = (objc_class *)objc_claimAutoreleasedReturnValue();
      uint64_t v31 = 1400;
      goto LABEL_12;
    case 6uLL:
      uint64_t v9 = 1;
      v10 = _HULocalizedStringWithDefaultValue(@"HUCameraRecordingIntro_AlreadySetup_Title", @"HUCameraRecordingIntro_AlreadySetup_Title", 1);
      v11 = _HULocalizedStringWithDefaultValue(@"HUCameraRecordingIntro_AlreadySetup_Detail", @"HUCameraRecordingIntro_AlreadySetup_Detail", 1);
      _HULocalizedStringWithDefaultValue(@"HUCameraRecordingIntro_ContinueButton", @"HUCameraRecordingIntro_ContinueButton", 1);
      v30 = (objc_class *)objc_claimAutoreleasedReturnValue();
      uint64_t v31 = 1392;
LABEL_12:
      v32 = *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v31);
      *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v31) = v30;

      _HULocalizedStringWithDefaultValue(@"HUCameraRecordingIntro_Footer", @"HUCameraRecordingIntro_Footer", 1);
      v23 = (objc_class *)objc_claimAutoreleasedReturnValue();
      uint64_t v24 = 1408;
LABEL_13:
      notNowButtonText = *(NSString **)((char *)&self->super.super.super.super.super.super.super.super.isa + v24);
      *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v24) = v23;
LABEL_14:

      break;
    default:
      v10 = 0;
      v11 = 0;
      uint64_t v9 = 1;
      break;
  }
  v36.receiver = self;
  v36.super_class = (Class)HUCameraRecordingIntroViewController;
  v33 = [(HUImageOBWelcomeController *)&v36 initWithTitle:v10 detailText:v11 icon:0 contentImage:v8];
  v34 = v33;
  if (v33)
  {
    v33->_variant = a3;
    objc_storeStrong((id *)&v33->_home, a4);
    [(HUCenterFillOBWelcomeController *)v34 setContentMode:v9];
  }

  return v34;
}

- (void)_buttonOne:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    v19 = self;
    __int16 v20 = 2112;
    v21 = v6;
    __int16 v22 = 2048;
    unint64_t v23 = [(HUCameraRecordingIntroViewController *)self variant];
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button: variant %lu", buf, 0x20u);
  }
  unint64_t v7 = [(HUCameraRecordingIntroViewController *)self variant];
  if (v7 <= 6)
  {
    if (v7 == 2)
    {
      uint64_t v9 = [(HUCameraRecordingIntroViewController *)self delegate];
      v14 = @"HUCameraRecordingOnboardingKey_UserInput";
      uint64_t v15 = &unk_1F19B5540;
      v10 = (void *)MEMORY[0x1E4F1C9E8];
      v11 = &v15;
      v12 = &v14;
    }
    else
    {
      v8 = [(HUCameraRecordingIntroViewController *)self home];
      objc_msgSend(v8, "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");

      uint64_t v9 = [(HUCameraRecordingIntroViewController *)self delegate];
      v16 = @"HUCameraRecordingOnboardingKey_UserInput";
      v17 = &unk_1F19B5528;
      v10 = (void *)MEMORY[0x1E4F1C9E8];
      v11 = &v17;
      v12 = &v16;
    }
    v13 = objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, 1, v14, v15, v16, v17);
    [v9 viewController:self didFinishWithConfigurationResults:v13];
  }
}

- (void)_buttonTwo:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    v18 = self;
    __int16 v19 = 2112;
    __int16 v20 = v6;
    __int16 v21 = 2048;
    unint64_t v22 = [(HUCameraRecordingIntroViewController *)self variant];
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button: variant %lu", buf, 0x20u);
  }
  switch([(HUCameraRecordingIntroViewController *)self variant])
  {
    case 0uLL:
    case 1uLL:
    case 4uLL:
    case 6uLL:
      NSLog(&cfstr_TheseViewsShou.isa);
      break;
    case 2uLL:
      unint64_t v7 = [(HUCameraRecordingIntroViewController *)self home];
      objc_msgSend(v7, "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");

      v8 = [(HUCameraRecordingIntroViewController *)self delegate];
      uint64_t v15 = @"HUCameraRecordingOnboardingKey_UserInput";
      v16 = &unk_1F19B5528;
      uint64_t v9 = (void *)MEMORY[0x1E4F1C9E8];
      v10 = &v16;
      v11 = &v15;
      goto LABEL_8;
    case 3uLL:
      [(HUCameraRecordingIntroViewController *)self showCameraRecordingLearnMore];
      break;
    case 5uLL:
      v8 = [(HUCameraRecordingIntroViewController *)self delegate];
      v13 = @"HUCameraRecordingOnboardingKey_UserInput";
      v14 = &unk_1F19B5540;
      uint64_t v9 = (void *)MEMORY[0x1E4F1C9E8];
      v10 = &v14;
      v11 = &v13;
LABEL_8:
      v12 = objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v10, v11, 1, v13, v14, v15, v16);
      [v8 viewController:self didFinishWithConfigurationResults:v12];

      break;
    default:
      return;
  }
}

- (void)showCameraRecordingLearnMore
{
  uint64_t v3 = [(HUCameraRecordingIntroViewController *)self navigationController];
  v4 = (void *)v3;
  if (v3) {
    v5 = (HUCameraRecordingIntroViewController *)v3;
  }
  else {
    v5 = self;
  }
  v6 = v5;

  unint64_t v7 = objc_alloc_init(HUCameraRecordingLearnMoreViewController);
  [(HUCameraRecordingIntroViewController *)v6 presentViewController:v7 animated:1 completion:0];
}

- (id)hu_preloadContent
{
  return (id)[MEMORY[0x1E4F7A0D8] futureWithNoResult];
}

- (void)viewDidLoad
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v28.receiver = self;
  v28.super_class = (Class)HUCameraRecordingIntroViewController;
  [(HUImageOBWelcomeController *)&v28 viewDidLoad];
  v4 = [(HUCameraRecordingIntroViewController *)self headerView];
  v5 = [v4 subviews];
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:v5 withIDDictionary:&unk_1F19B6010];

  v6 = [MEMORY[0x1E4F83A80] boldButton];
  [(HUCameraRecordingIntroViewController *)self setSetupButton:v6];

  unint64_t v7 = [(HUCameraRecordingIntroViewController *)self setupButton];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  v8 = [(HUCameraRecordingIntroViewController *)self setupButton];
  uint64_t v9 = [(HUCameraRecordingIntroViewController *)self continueButtonText];
  [v8 setTitle:v9 forState:0];

  v10 = [(HUCameraRecordingIntroViewController *)self setupButton];
  [v10 setAccessibilityIdentifier:@"Home.OnboardingView.CameraRecording.Intro.ContinueButton"];

  v11 = [(HUCameraRecordingIntroViewController *)self setupButton];
  [v11 addTarget:self action:sel__buttonOne_ forControlEvents:64];

  v12 = [(HUCameraRecordingIntroViewController *)self buttonTray];
  v13 = [(HUCameraRecordingIntroViewController *)self setupButton];
  [v12 addButton:v13];

  v14 = [(HUCameraRecordingIntroViewController *)self notNowButtonText];

  if (v14)
  {
    uint64_t v15 = [MEMORY[0x1E4F83AB8] linkButton];
    [(HUCameraRecordingIntroViewController *)self setNotNowButton:v15];

    v16 = [(HUCameraRecordingIntroViewController *)self notNowButton];
    [v16 setTranslatesAutoresizingMaskIntoConstraints:0];

    v17 = [(HUCameraRecordingIntroViewController *)self notNowButton];
    v18 = [(HUCameraRecordingIntroViewController *)self notNowButtonText];
    [v17 setTitle:v18 forState:0];

    __int16 v19 = [(HUCameraRecordingIntroViewController *)self notNowButton];
    [v19 setAccessibilityIdentifier:@"Home.OnboardingView.CameraRecording.Intro.NotNowButton"];

    __int16 v20 = [(HUCameraRecordingIntroViewController *)self notNowButton];
    [v20 addTarget:self action:sel__buttonTwo_ forControlEvents:64];

    __int16 v21 = [(HUCameraRecordingIntroViewController *)self buttonTray];
    unint64_t v22 = [(HUCameraRecordingIntroViewController *)self notNowButton];
    [v21 addButton:v22];
  }
  uint64_t v23 = [(HUCameraRecordingIntroViewController *)self captionText];

  if (v23)
  {
    uint64_t v24 = [(HUCameraRecordingIntroViewController *)self buttonTray];
    v25 = [(HUCameraRecordingIntroViewController *)self captionText];
    [v24 setCaptionText:v25];
  }
  [(HUCameraRecordingIntroViewController *)self setModalInPresentation:1];
  v26 = HFLogForCategory();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v27 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v30 = self;
    __int16 v31 = 2112;
    v32 = v27;
    _os_log_impl(&dword_1BE345000, v26, OS_LOG_TYPE_DEFAULT, "%@:%@: presented: CRIVC", buf, 0x16u);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)HUCameraRecordingIntroViewController;
  [(HUCameraRecordingIntroViewController *)&v8 viewWillDisappear:a3];
  if ([(HUCameraRecordingIntroViewController *)self isMovingFromParentViewController])
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
    unint64_t v7 = [(HUCameraRecordingIntroViewController *)self delegate];
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

- (unint64_t)variant
{
  return self->_variant;
}

- (void)setVariant:(unint64_t)a3
{
  self->_variant = a3;
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

- (NSString)continueButtonText
{
  return self->_continueButtonText;
}

- (void)setContinueButtonText:(id)a3
{
}

- (NSString)notNowButtonText
{
  return self->_notNowButtonText;
}

- (void)setNotNowButtonText:(id)a3
{
}

- (NSString)captionText
{
  return self->_captionText;
}

- (void)setCaptionText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captionText, 0);
  objc_storeStrong((id *)&self->_notNowButtonText, 0);
  objc_storeStrong((id *)&self->_continueButtonText, 0);
  objc_storeStrong((id *)&self->_notNowButton, 0);
  objc_storeStrong((id *)&self->_setupButton, 0);
  objc_storeStrong((id *)&self->_home, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end