@interface HUHomeAssistantDevicesUnsupportedLanguageViewController
- (Class)onboardingFlowClass;
- (HUConfigurationViewControllerDelegate)delegate;
- (HUHomeAssistantDevicesUnsupportedLanguageViewController)initWithHomeAssistantDevicesHavingLanguageMismatch:(id)a3 home:(id)a4;
- (NSArray)homeAssistantDevicesHavingLanguageMismatch;
- (NSLayoutConstraint)heightAnchor;
- (OBTrayButton)continueButton;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (id)hu_preloadContent;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_continue;
- (void)loadView;
- (void)setContinueButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHeightAnchor:(id)a3;
- (void)setHomeAssistantDevicesHavingLanguageMismatch:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HUHomeAssistantDevicesUnsupportedLanguageViewController

- (HUHomeAssistantDevicesUnsupportedLanguageViewController)initWithHomeAssistantDevicesHavingLanguageMismatch:(id)a3 home:(id)a4
{
  id v7 = a3;
  v8 = (void *)MEMORY[0x1E4F4E538];
  id v9 = a4;
  v10 = [v8 sharedPreferences];
  v11 = [v10 languageCode];

  v12 = [MEMORY[0x1E4F4E4C8] sharedInstance];
  v13 = [v12 localizedNameForSiriLanguage:v11 inDisplayLanguage:0];

  uint64_t v14 = objc_msgSend(v9, "hf_numberOfHomePods");
  if (v14 == [v7 count])
  {
    if (v14 == 1)
    {
      v21 = _HULocalizedStringWithDefaultValue(@"HUSingleDeviceLanguageNotChanged_Title", @"HUSingleDeviceLanguageNotChanged_Title", 1);
      HULocalizedStringWithFormat(@"HUSingleDeviceLanguageNotChanged_Detail", @"%@", v22, v23, v24, v25, v26, v27, (uint64_t)v13);
    }
    else
    {
      v21 = _HULocalizedStringWithDefaultValue(@"HUMultipleDevicesLanguageNotChanged_Title", @"HUMultipleDevicesLanguageNotChanged_Title", 1);
      HULocalizedStringWithFormat(@"HUMultipleDevicesLanguageNotChanged_Detail", @"%@", v29, v30, v31, v32, v33, v34, (uint64_t)v13);
    v28 = };
  }
  else
  {
    v28 = HULocalizedStringWithFormat(@"HULanguageUnsupported_Detail", @"%@", v15, v16, v17, v18, v19, v20, (uint64_t)v13);
    v21 = _HULocalizedStringWithDefaultValue(@"HULanguageUnsupported_Title", @"HULanguageUnsupported_Title", 1);
  }
  v38.receiver = self;
  v38.super_class = (Class)HUHomeAssistantDevicesUnsupportedLanguageViewController;
  v35 = [(OBTableWelcomeController *)&v38 initWithTitle:v21 detailText:v28 icon:0];
  v36 = v35;
  if (v35) {
    objc_storeStrong((id *)&v35->_homeAssistantDevicesHavingLanguageMismatch, a3);
  }

  return v36;
}

- (void)_continue
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v13 = self;
    __int16 v14 = 2112;
    uint64_t v15 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);
  }
  v6 = (void *)MEMORY[0x1E4F1CA60];
  v10 = @"HULanguageOnboardingKey_UnsupportedLanguage_UserInput";
  v11 = &unk_1F19B3D88;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v8 = [v6 dictionaryWithDictionary:v7];

  id v9 = [(HUHomeAssistantDevicesUnsupportedLanguageViewController *)self delegate];
  [v9 viewController:self didFinishWithConfigurationResults:v8];
}

- (id)hu_preloadContent
{
  return (id)[MEMORY[0x1E4F7A0D8] futureWithNoResult];
}

- (void)loadView
{
  v19.receiver = self;
  v19.super_class = (Class)HUHomeAssistantDevicesUnsupportedLanguageViewController;
  [(OBTableWelcomeController *)&v19 loadView];
  id v3 = objc_alloc(MEMORY[0x1E4F42E98]);
  v4 = objc_msgSend(v3, "initWithFrame:style:", 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(OBTableWelcomeController *)self setTableView:v4];

  v5 = [(OBTableWelcomeController *)self tableView];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  v6 = [(OBTableWelcomeController *)self tableView];
  [v6 setDelegate:self];

  id v7 = [(OBTableWelcomeController *)self tableView];
  [v7 setDataSource:self];

  v8 = [(OBTableWelcomeController *)self tableView];
  [v8 setAllowsSelectionDuringEditing:1];

  id v9 = [(OBTableWelcomeController *)self tableView];
  [v9 setAllowsMultipleSelection:0];

  double v10 = *MEMORY[0x1E4F43D18];
  v11 = [(OBTableWelcomeController *)self tableView];
  [v11 setRowHeight:v10];

  v12 = [(OBTableWelcomeController *)self tableView];
  [v12 setAlwaysBounceVertical:0];

  v13 = [(OBTableWelcomeController *)self tableView];
  __int16 v14 = [v13 heightAnchor];
  uint64_t v15 = [(OBTableWelcomeController *)self tableView];
  [v15 contentSize];
  uint64_t v17 = [v14 constraintEqualToConstant:v16];
  [(HUHomeAssistantDevicesUnsupportedLanguageViewController *)self setHeightAnchor:v17];

  uint64_t v18 = [(HUHomeAssistantDevicesUnsupportedLanguageViewController *)self heightAnchor];
  [v18 setActive:1];
}

- (void)viewDidLayoutSubviews
{
  id v3 = [(HUHomeAssistantDevicesUnsupportedLanguageViewController *)self view];
  [v3 layoutIfNeeded];

  v4 = [(OBTableWelcomeController *)self tableView];
  [v4 contentSize];
  double v6 = v5;
  id v7 = [(HUHomeAssistantDevicesUnsupportedLanguageViewController *)self heightAnchor];
  [v7 setConstant:v6];

  v8 = [MEMORY[0x1E4F428B8] clearColor];
  id v9 = [(OBTableWelcomeController *)self tableView];
  [v9 setBackgroundColor:v8];

  v10.receiver = self;
  v10.super_class = (Class)HUHomeAssistantDevicesUnsupportedLanguageViewController;
  [(OBTableWelcomeController *)&v10 viewDidLayoutSubviews];
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x1E4F43D18];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v4 = [(HUHomeAssistantDevicesUnsupportedLanguageViewController *)self homeAssistantDevicesHavingLanguageMismatch];
  int64_t v5 = [v4 count] + 1;

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"language_code_cell_identifier"];
  if (!v7) {
    id v7 = [[HUTitleDescriptionCell alloc] initWithStyle:0 reuseIdentifier:@"language_code_cell_identifier"];
  }
  if ([v6 row] >= 1)
  {
    v8 = [(HUHomeAssistantDevicesUnsupportedLanguageViewController *)self homeAssistantDevicesHavingLanguageMismatch];
    id v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "row") - 1);

    objc_super v10 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    v11 = [v10 homeManager];
    if ([v11 hasOptedToHH2])
    {
    }
    else
    {
      v12 = [v9 accessory];
      int v13 = objc_msgSend(v12, "hf_isSiriEndpoint");

      if (!v13)
      {
        __int16 v14 = objc_msgSend(v9, "hf_settingsAdapterManager");
        double v16 = [v14 adapterForIdentifier:*MEMORY[0x1E4F67FC0]];
        objc_opt_class();
        id v17 = v16;
        if (objc_opt_isKindOfClass()) {
          uint64_t v18 = v17;
        }
        else {
          uint64_t v18 = 0;
        }
        id v19 = v18;

        uint64_t v15 = [v19 selectedLanguageOption];

        goto LABEL_12;
      }
    }
    __int16 v14 = objc_msgSend(v9, "hf_siriLanguageOptionsManager");
    uint64_t v15 = [v14 selectedLanguageOption];
LABEL_12:

    uint64_t v20 = [v15 recognitionLanguage];
    v21 = objc_msgSend(v9, "hf_displayName");
    [(HUTitleDescriptionCell *)v7 setTitleText:v21];

    if (v20)
    {
      uint64_t v22 = [MEMORY[0x1E4F4E4C8] sharedInstance];
      uint64_t v23 = [v22 localizedNameForSiriLanguage:v20 inDisplayLanguage:0];

      [(HUTitleDescriptionCell *)v7 setDescriptionText:v23];
    }
  }
  [(HUTitleDescriptionCell *)v7 setSelectionStyle:0];
  [(HUIconCell *)v7 setHideIcon:1];

  return v7;
}

- (void)viewDidLoad
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)HUHomeAssistantDevicesUnsupportedLanguageViewController;
  [(OBTableWelcomeController *)&v16 viewDidLoad];
  v4 = [(HUHomeAssistantDevicesUnsupportedLanguageViewController *)self headerView];
  int64_t v5 = [v4 subviews];
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:v5 withIDDictionary:&unk_1F19B5B38];

  [(HUHomeAssistantDevicesUnsupportedLanguageViewController *)self setModalInPresentation:1];
  id v6 = [MEMORY[0x1E4F83A80] boldButton];
  [(HUHomeAssistantDevicesUnsupportedLanguageViewController *)self setContinueButton:v6];

  id v7 = [(HUHomeAssistantDevicesUnsupportedLanguageViewController *)self continueButton];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  v8 = [(HUHomeAssistantDevicesUnsupportedLanguageViewController *)self continueButton];
  id v9 = _HULocalizedStringWithDefaultValue(@"HUContinueTitle", @"HUContinueTitle", 1);
  [v8 setTitle:v9 forState:0];

  objc_super v10 = [(HUHomeAssistantDevicesUnsupportedLanguageViewController *)self continueButton];
  [v10 setAccessibilityIdentifier:@"Home.OnboardingView.LanguageSetup.Unsupported.ContinueButton"];

  v11 = [(HUHomeAssistantDevicesUnsupportedLanguageViewController *)self continueButton];
  [v11 addTarget:self action:sel__continue forControlEvents:64];

  v12 = [(HUHomeAssistantDevicesUnsupportedLanguageViewController *)self buttonTray];
  int v13 = [(HUHomeAssistantDevicesUnsupportedLanguageViewController *)self continueButton];
  [v12 addButton:v13];

  __int16 v14 = HFLogForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v18 = self;
    __int16 v19 = 2112;
    uint64_t v20 = v15;
    _os_log_impl(&dword_1BE345000, v14, OS_LOG_TYPE_DEFAULT, "%@:%@: presented: HADULVC", buf, 0x16u);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)HUHomeAssistantDevicesUnsupportedLanguageViewController;
  [(HUHomeAssistantDevicesUnsupportedLanguageViewController *)&v8 viewWillDisappear:a3];
  if ([(HUHomeAssistantDevicesUnsupportedLanguageViewController *)self isMovingFromParentViewController])
  {
    int64_t v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      objc_super v10 = self;
      __int16 v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped BACK button", buf, 0x16u);
    }
    id v7 = [(HUHomeAssistantDevicesUnsupportedLanguageViewController *)self delegate];
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

- (NSArray)homeAssistantDevicesHavingLanguageMismatch
{
  return self->_homeAssistantDevicesHavingLanguageMismatch;
}

- (void)setHomeAssistantDevicesHavingLanguageMismatch:(id)a3
{
}

- (NSLayoutConstraint)heightAnchor
{
  return self->_heightAnchor;
}

- (void)setHeightAnchor:(id)a3
{
}

- (OBTrayButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_heightAnchor, 0);
  objc_storeStrong((id *)&self->_homeAssistantDevicesHavingLanguageMismatch, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end