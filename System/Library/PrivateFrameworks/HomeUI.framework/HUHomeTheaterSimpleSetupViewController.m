@interface HUHomeTheaterSimpleSetupViewController
- (Class)onboardingFlowClass;
- (HMAccessory)accessory;
- (HMHome)home;
- (HMMediaDestination)destination;
- (HUConfigurationViewControllerDelegate)delegate;
- (HUHomeTheaterSimpleSetupViewController)initWithAppleTVAccessory:(id)a3 destination:(id)a4 inHome:(id)a5;
- (HUHomeTheaterSimpleSetupViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentImage:(id)a6;
- (OBLinkTrayButton)skipButton;
- (OBTrayButton)confirmButton;
- (void)_confirm:(id)a3;
- (void)_skip:(id)a3;
- (void)setAccessory:(id)a3;
- (void)setConfirmButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDestination:(id)a3;
- (void)setHome:(id)a3;
- (void)setSkipButton:(id)a3;
- (void)viewDidLoad;
@end

@implementation HUHomeTheaterSimpleSetupViewController

- (HUHomeTheaterSimpleSetupViewController)initWithAppleTVAccessory:(id)a3 destination:(id)a4 inHome:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = objc_msgSend(v9, "hf_displayName");
  v19 = HULocalizedStringWithFormat(@"HUHomeTheaterSetup_Title", @"%@", v13, v14, v15, v16, v17, v18, (uint64_t)v12);

  v20 = _HULocalizedStringWithDefaultValue(@"HUHomeTheaterSetup_Detail", @"HUHomeTheaterSetup_Detail", 1);
  v21 = HUImageNamed(@"Onboarding-HomeTheater");
  v24.receiver = self;
  v24.super_class = (Class)HUHomeTheaterSimpleSetupViewController;
  v22 = [(HUImageOBWelcomeController *)&v24 initWithTitle:v19 detailText:v20 icon:0 contentImage:v21];

  if (v22)
  {
    objc_storeStrong((id *)&v22->_accessory, a3);
    objc_storeStrong((id *)&v22->_home, a5);
    objc_storeStrong((id *)&v22->_destination, a4);
  }

  return v22;
}

- (HUHomeTheaterSimpleSetupViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentImage:(id)a6
{
  v8 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5, a6);
  id v9 = NSStringFromSelector(sel_initWithAppleTVAccessory_destination_inHome_);
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUHomeTheaterSimpleSetupViewController.m", 49, @"%s is unavailable; use %@ instead",
    "-[HUHomeTheaterSimpleSetupViewController initWithTitle:detailText:icon:contentImage:]",
    v9);

  return 0;
}

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)HUHomeTheaterSimpleSetupViewController;
  [(HUImageOBWelcomeController *)&v15 viewDidLoad];
  v3 = [(HUHomeTheaterSimpleSetupViewController *)self headerView];
  v4 = [v3 subviews];
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:v4 withIDDictionary:&unk_1F19B5FE8];

  v5 = [MEMORY[0x1E4F83A80] boldButton];
  confirmButton = self->_confirmButton;
  self->_confirmButton = v5;

  [(OBTrayButton *)self->_confirmButton setTranslatesAutoresizingMaskIntoConstraints:0];
  v7 = self->_confirmButton;
  v8 = _HULocalizedStringWithDefaultValue(@"HUHomeTheaterSetup_UseHomeTheaterButton", @"HUHomeTheaterSetup_UseHomeTheaterButton", 1);
  [(OBTrayButton *)v7 setTitle:v8 forState:0];

  [(OBTrayButton *)self->_confirmButton setAccessibilityIdentifier:@"Home.OnboardingView.HomeTheater.UseHomeTheaterButton"];
  [(OBTrayButton *)self->_confirmButton addTarget:self action:sel__confirm_ forControlEvents:64];
  id v9 = [(HUHomeTheaterSimpleSetupViewController *)self buttonTray];
  [v9 addButton:self->_confirmButton];

  id v10 = [MEMORY[0x1E4F83AB8] linkButton];
  skipButton = self->_skipButton;
  self->_skipButton = v10;

  [(OBLinkTrayButton *)self->_skipButton setTranslatesAutoresizingMaskIntoConstraints:0];
  v12 = self->_skipButton;
  uint64_t v13 = _HULocalizedStringWithDefaultValue(@"HUHomeTheaterSetup_NotNowButton", @"HUHomeTheaterSetup_NotNowButton", 1);
  [(OBLinkTrayButton *)v12 setTitle:v13 forState:0];

  [(OBLinkTrayButton *)self->_skipButton setAccessibilityIdentifier:@"Home.OnboardingView.HomeTheater.NotNowButton"];
  [(OBLinkTrayButton *)self->_skipButton addTarget:self action:sel__skip_ forControlEvents:64];
  uint64_t v14 = [(HUHomeTheaterSimpleSetupViewController *)self buttonTray];
  [v14 addButton:self->_skipButton];
}

- (void)_confirm:(id)a3
{
  id v5 = a3;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __51__HUHomeTheaterSimpleSetupViewController__confirm___block_invoke;
  v19[3] = &unk_1E6385090;
  v19[4] = self;
  v6 = [MEMORY[0x1E4F7A0D8] futureWithErrorOnlyHandlerAdapterBlock:v19];
  v7 = [(HUHomeTheaterSimpleSetupViewController *)self confirmButton];
  v8 = [v7 activityIndicator];
  [v8 startAnimating];

  id v9 = [(HUHomeTheaterSimpleSetupViewController *)self confirmButton];
  [v9 setEnabled:0];

  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __51__HUHomeTheaterSimpleSetupViewController__confirm___block_invoke_2;
  v16[3] = &unk_1E6390298;
  objc_copyWeak(v17, &location);
  v17[1] = (id)a2;
  id v10 = [v6 addSuccessBlock:v16];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51__HUHomeTheaterSimpleSetupViewController__confirm___block_invoke_61;
  v13[3] = &unk_1E6392818;
  objc_copyWeak(v15, &location);
  v15[1] = (id)a2;
  id v11 = v5;
  id v14 = v11;
  id v12 = (id)[v10 addFailureBlock:v13];

  objc_destroyWeak(v15);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
}

void __51__HUHomeTheaterSimpleSetupViewController__confirm___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v9 = [v3 accessory];
  id v5 = [v9 mediaProfile];
  v6 = objc_msgSend(v5, "hf_backingAccessory");
  v7 = [v6 audioDestinationController];
  v8 = [*(id *)(a1 + 32) destination];
  [v7 updateDestination:v8 completionHandler:v4];
}

void __51__HUHomeTheaterSimpleSetupViewController__confirm___block_invoke_2(uint64_t a1, void *a2)
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [WeakRetained accessory];

  if (!v5)
  {
    v6 = NSStringFromSelector(*(SEL *)(a1 + 40));
    NSLog(&cfstr_UnexpectedNilA.isa, WeakRetained, v6, v3);
  }
  v7 = [WeakRetained accessory];

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E4F1CA60];
    v16[0] = &unk_1F19B54F8;
    v15[0] = @"HUHomeTheaterOnboardingKey_UserInput";
    v15[1] = @"HUHomeTheaterOnboardingKey_Accessory";
    id v9 = [WeakRetained accessory];
    v16[1] = v9;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
    id v11 = [v8 dictionaryWithDictionary:v10];

    id v12 = [WeakRetained confirmButton];
    uint64_t v13 = [v12 activityIndicator];
    [v13 stopAnimating];

    id v14 = [WeakRetained delegate];
    [v14 viewController:WeakRetained didFinishWithConfigurationResults:v11];
  }
}

void __51__HUHomeTheaterSimpleSetupViewController__confirm___block_invoke_61(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v10 = 138412802;
    id v11 = WeakRetained;
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ completed with error: %@", (uint8_t *)&v10, 0x20u);
  }
  [*(id *)(a1 + 32) setEnabled:1];
  v7 = [WeakRetained confirmButton];
  v8 = [v7 activityIndicator];
  [v8 stopAnimating];

  id v9 = [MEMORY[0x1E4F69110] sharedHandler];
  [v9 handleError:v3];
}

- (void)_skip:(id)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F1CA60];
  v10[0] = &unk_1F19B5510;
  v9[0] = @"HUHomeTheaterOnboardingKey_UserInput";
  v9[1] = @"HUHomeTheaterOnboardingKey_Accessory";
  id v5 = [(HUHomeTheaterSimpleSetupViewController *)self accessory];
  v10[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  v7 = [v4 dictionaryWithDictionary:v6];

  v8 = [(HUHomeTheaterSimpleSetupViewController *)self delegate];
  [v8 viewController:self didFinishWithConfigurationResults:v7];
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

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (void)setAccessory:(id)a3
{
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (HMMediaDestination)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
}

- (OBTrayButton)confirmButton
{
  return self->_confirmButton;
}

- (void)setConfirmButton:(id)a3
{
}

- (OBLinkTrayButton)skipButton
{
  return self->_skipButton;
}

- (void)setSkipButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_skipButton, 0);
  objc_storeStrong((id *)&self->_confirmButton, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_accessory, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end