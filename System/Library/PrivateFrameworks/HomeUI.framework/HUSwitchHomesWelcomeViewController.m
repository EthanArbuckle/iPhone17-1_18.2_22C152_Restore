@interface HUSwitchHomesWelcomeViewController
- (Class)onboardingFlowClass;
- (HMHome)home;
- (HUConfigurationViewControllerDelegate)delegate;
- (HUSwitchHomesWelcomeViewController)initWithHome:(id)a3;
- (OBLinkTrayButton)changeButton;
- (OBTrayButton)continueButton;
- (id)hu_preloadContent;
- (void)_changeButtonTapped:(id)a3;
- (void)_continueButtonTapped:(id)a3;
- (void)setChangeButton:(id)a3;
- (void)setContinueButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHome:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation HUSwitchHomesWelcomeViewController

- (HUSwitchHomesWelcomeViewController)initWithHome:(id)a3
{
  id v5 = a3;
  v6 = [v5 name];
  v13 = HULocalizedStringWithFormat(@"HUSwitchHomesWelcome_Title", @"%@", v7, v8, v9, v10, v11, v12, (uint64_t)v6);

  v14 = _HULocalizedStringWithDefaultValue(@"HUSwitchHomesWelcome_Detail", @"HUSwitchHomesWelcome_Detail", 1);
  v15 = HUImageNamed(@"Onboarding-Home-Invite");
  v18.receiver = self;
  v18.super_class = (Class)HUSwitchHomesWelcomeViewController;
  v16 = [(HUImageOBWelcomeController *)&v18 initWithTitle:v13 detailText:v14 icon:0 contentImage:v15];

  if (v16)
  {
    objc_storeStrong((id *)&v16->_home, a3);
    -[HUCenterFillOBWelcomeController setContentInsets:](v16, "setContentInsets:", 0.0, 41.0, 0.0, 41.0);
  }

  return v16;
}

- (void)_changeButtonTapped:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v38 = a3;
  v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v51 = self;
    __int16 v52 = 2080;
    v53 = "-[HUSwitchHomesWelcomeViewController _changeButtonTapped:]";
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "%@:%s User tapped change button", buf, 0x16u);
  }

  v4 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  id v5 = [v4 homeManager];
  v6 = objc_msgSend(v5, "hf_orderedHomes");

  if (![v6 count] && (objc_msgSend(MEMORY[0x1E4F69758], "isInternalTest") & 1) == 0) {
    NSLog(&cfstr_AttemptingToDi_2.isa);
  }
  v42 = objc_msgSend(MEMORY[0x1E4F42728], "hu_actionSheetWithTitle:message:anchorView:", 0, 0, v38);
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v7)
  {
    uint64_t v40 = *(void *)v46;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v46 != v40) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v45 + 1) + 8 * v8);
        uint64_t v10 = [MEMORY[0x1E4F691A0] sharedDispatcher];
        uint64_t v11 = [v10 homeManager];

        objc_initWeak((id *)buf, self);
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __58__HUSwitchHomesWelcomeViewController__changeButtonTapped___block_invoke;
        aBlock[3] = &unk_1E6387430;
        objc_copyWeak(&v44, (id *)buf);
        aBlock[4] = v9;
        uint64_t v12 = _Block_copy(aBlock);
        v13 = [v9 uniqueIdentifier];
        v14 = [v11 currentHome];
        v15 = [v14 uniqueIdentifier];
        int v16 = [v13 isEqual:v15];

        v17 = (void *)MEMORY[0x1E4F42720];
        objc_super v18 = [v9 name];
        if (v16)
        {
          v19 = objc_msgSend(MEMORY[0x1E4F42A80], "hu_locationArrowTemplate");
          v20 = [v17 _actionWithTitle:v18 image:v19 style:0 handler:v12 shouldDismissHandler:0];
        }
        else
        {
          v20 = [v17 actionWithTitle:v18 style:0 handler:v12];
        }

        v21 = [MEMORY[0x1E4F691A0] sharedDispatcher];
        v22 = [v21 home];
        v23 = [v22 uniqueIdentifier];
        v24 = [v9 uniqueIdentifier];
        objc_msgSend(v20, "_setChecked:", objc_msgSend(v23, "isEqual:", v24));

        [v42 addAction:v20];
        objc_destroyWeak(&v44);
        objc_destroyWeak((id *)buf);

        ++v8;
      }
      while (v7 != v8);
      uint64_t v7 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
    }
    while (v7);
  }

  v25 = (void *)MEMORY[0x1E4F42720];
  v26 = _HULocalizedStringWithDefaultValue(@"HUSwitchHomesWelcome_MenuCancelTitle", @"HUSwitchHomesWelcome_MenuCancelTitle", 1);
  v27 = [v25 actionWithTitle:v26 style:1 handler:&__block_literal_global_286];
  [v42 addAction:v27];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v28 = [v42 popoverPresentationController];
    [v28 setSourceView:v38];

    [v38 bounds];
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    v37 = [v42 popoverPresentationController];
    objc_msgSend(v37, "setSourceRect:", v30, v32, v34, v36);
  }
  else
  {
    NSLog(&cfstr_UnknownSenderF.isa, v38);
  }
  [(HUSwitchHomesWelcomeViewController *)self presentViewController:v42 animated:1 completion:0];
}

void __58__HUSwitchHomesWelcomeViewController__changeButtonTapped___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    int v16 = "-[HUSwitchHomesWelcomeViewController _changeButtonTapped:]_block_invoke";
    __int16 v17 = 2112;
    id v18 = v3;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "(%s) User tapped '%@' from the alert popup", buf, 0x16u);
  }

  v6 = [*(id *)(a1 + 32) uniqueIdentifier];
  uint64_t v7 = [WeakRetained home];
  uint64_t v8 = [v7 uniqueIdentifier];
  char v9 = [v6 isEqual:v8];

  if ((v9 & 1) == 0)
  {
    uint64_t v10 = [WeakRetained delegate];
    v13 = @"HUSwitchHomesWelcomeOnboardingKey_UserInput";
    v14 = &unk_1F19B52E8;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    [v10 viewController:WeakRetained didFinishWithConfigurationResults:v11];
  }
  uint64_t v12 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  [v12 setSelectedHome:*(void *)(a1 + 32) userInitiated:1];
}

void __58__HUSwitchHomesWelcomeViewController__changeButtonTapped___block_invoke_23(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [v2 title];
    int v5 = 136315394;
    v6 = "-[HUSwitchHomesWelcomeViewController _changeButtonTapped:]_block_invoke";
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "(%s) User tapped cancel button '%@' from the alert popup", (uint8_t *)&v5, 0x16u);
  }
}

- (void)_continueButtonTapped:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v12 = self;
    __int16 v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);
  }
  __int16 v7 = [(HUSwitchHomesWelcomeViewController *)self delegate];
  uint64_t v9 = @"HUSwitchHomesWelcomeOnboardingKey_UserInput";
  uint64_t v10 = &unk_1F19B5300;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  [v7 viewController:self didFinishWithConfigurationResults:v8];
}

- (id)hu_preloadContent
{
  return (id)[MEMORY[0x1E4F7A0D8] futureWithNoResult];
}

- (void)viewDidLoad
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v28.receiver = self;
  v28.super_class = (Class)HUSwitchHomesWelcomeViewController;
  [(HUImageOBWelcomeController *)&v28 viewDidLoad];
  v4 = [(HUSwitchHomesWelcomeViewController *)self headerView];
  int v5 = [v4 subviews];
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:v5 withIDDictionary:&unk_1F19B5F70];

  v6 = [MEMORY[0x1E4F83A80] boldButton];
  [(HUSwitchHomesWelcomeViewController *)self setContinueButton:v6];

  __int16 v7 = [(HUSwitchHomesWelcomeViewController *)self continueButton];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  uint64_t v8 = [(HUSwitchHomesWelcomeViewController *)self continueButton];
  uint64_t v9 = _HULocalizedStringWithDefaultValue(@"HUSwitchHomesWelcome_ContinueButton", @"HUSwitchHomesWelcome_ContinueButton", 1);
  [v8 setTitle:v9 forState:0];

  uint64_t v10 = [(HUSwitchHomesWelcomeViewController *)self continueButton];
  [v10 setAccessibilityIdentifier:@"Home.OnboardingView.SwitchHomesWelcome.ContinueButton"];

  uint64_t v11 = [(HUSwitchHomesWelcomeViewController *)self continueButton];
  [v11 addTarget:self action:sel__continueButtonTapped_ forControlEvents:64];

  uint64_t v12 = [(HUSwitchHomesWelcomeViewController *)self buttonTray];
  __int16 v13 = [(HUSwitchHomesWelcomeViewController *)self continueButton];
  [v12 addButton:v13];

  v14 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  uint64_t v15 = [v14 homeManager];
  int v16 = [v15 homes];
  unint64_t v17 = [v16 count];

  if (v17 >= 2)
  {
    id v18 = [MEMORY[0x1E4F83AB8] linkButton];
    [(HUSwitchHomesWelcomeViewController *)self setChangeButton:v18];

    uint64_t v19 = [(HUSwitchHomesWelcomeViewController *)self changeButton];
    [v19 setTranslatesAutoresizingMaskIntoConstraints:0];

    v20 = [(HUSwitchHomesWelcomeViewController *)self changeButton];
    v21 = _HULocalizedStringWithDefaultValue(@"HUSwitchHomesWelcome_ChangeButton", @"HUSwitchHomesWelcome_ChangeButton", 1);
    [v20 setTitle:v21 forState:0];

    v22 = [(HUSwitchHomesWelcomeViewController *)self changeButton];
    [v22 setAccessibilityIdentifier:@"Home.OnboardingView.SwitchHomesWelcome.ChangeButton"];

    v23 = [(HUSwitchHomesWelcomeViewController *)self changeButton];
    [v23 addTarget:self action:sel__changeButtonTapped_ forControlEvents:64];

    v24 = [(HUSwitchHomesWelcomeViewController *)self buttonTray];
    v25 = [(HUSwitchHomesWelcomeViewController *)self changeButton];
    [v24 addButton:v25];
  }
  [(HUSwitchHomesWelcomeViewController *)self setModalInPresentation:1];
  v26 = HFLogForCategory();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    double v30 = self;
    __int16 v31 = 2112;
    double v32 = v27;
    _os_log_impl(&dword_1BE345000, v26, OS_LOG_TYPE_DEFAULT, "%@:%@: presented: SHWVC", buf, 0x16u);
  }
}

- (void)viewDidLayoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)HUSwitchHomesWelcomeViewController;
  [(HUImageOBWelcomeController *)&v8 viewDidLayoutSubviews];
  if ([MEMORY[0x1E4F69758] isAMac])
  {
    id v3 = [(HUSwitchHomesWelcomeViewController *)self view];
    [v3 frame];
    double v5 = v4 * 0.65;
  }
  else
  {
    id v3 = [(HUSwitchHomesWelcomeViewController *)self continueButton];
    [v3 bounds];
    double v5 = v6;
  }

  [(HUCenterFillOBWelcomeController *)self maxSize];
  if (v7 != v5)
  {
    [(HUCenterFillOBWelcomeController *)self maxSize];
    [(HUCenterFillOBWelcomeController *)self setMaxSize:v5];
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

- (OBTrayButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
}

- (OBLinkTrayButton)changeButton
{
  return self->_changeButton;
}

- (void)setChangeButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeButton, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_home, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end