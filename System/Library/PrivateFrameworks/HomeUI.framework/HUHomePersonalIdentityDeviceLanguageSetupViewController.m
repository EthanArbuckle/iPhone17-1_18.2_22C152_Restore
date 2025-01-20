@interface HUHomePersonalIdentityDeviceLanguageSetupViewController
- (Class)onboardingFlowClass;
- (HMHome)home;
- (HUConfigurationViewControllerDelegate)delegate;
- (HUHomePersonalIdentityDeviceLanguageSetupViewController)initWithHome:(id)a3;
- (NSArray)supportedVoiceRecognitionLanguages;
- (NSDictionary)languageToHomePodsMapping;
- (NSString)overrideTargetLanguage;
- (NSString)targetLanguage;
- (OBLinkTrayButton)customizeButton;
- (OBTrayButton)continueButton;
- (id)hu_preloadContent;
- (void)_cancelLanguageSetup;
- (void)_changeSiriLanguage;
- (void)_completeLanguageSetup;
- (void)setContinueButton:(id)a3;
- (void)setCustomizeButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHome:(id)a3;
- (void)setLanguageToHomePodsMapping:(id)a3;
- (void)setOverrideTargetLanguage:(id)a3;
- (void)setSupportedVoiceRecognitionLanguages:(id)a3;
- (void)setTargetLanguage:(id)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HUHomePersonalIdentityDeviceLanguageSetupViewController

- (HUHomePersonalIdentityDeviceLanguageSetupViewController)initWithHome:(id)a3
{
  id v5 = a3;
  v6 = HULocalizedModelString(@"HULanguagePersonalIdentityDevice_LanguageMismatch_Title");
  v7 = HULocalizedModelString(@"HULanguagePersonalIdentityDevice_LanguageMultipleMismatch_Detail");
  v8 = _HULocalizedStringWithDefaultValue(@"HULanguagePersonalIdentityDevice_LanguageMismatch_Title", @"HULanguagePersonalIdentityDevice_LanguageMismatch_Title", 1);

  v9 = HUSensitiveLocalizedModelString(@"HULanguagePersonalIdentityDevice_LanguageMultipleMismatch_Detail");

  v17.receiver = self;
  v17.super_class = (Class)HUHomePersonalIdentityDeviceLanguageSetupViewController;
  v10 = [(HUHomePersonalIdentityDeviceLanguageSetupViewController *)&v17 initWithTitle:v8 detailText:v9 icon:0 contentLayout:2];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_home, a3);
    uint64_t v12 = [MEMORY[0x1E4F83A80] boldButton];
    continueButton = v11->_continueButton;
    v11->_continueButton = (OBTrayButton *)v12;

    [(OBTrayButton *)v11->_continueButton setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v14 = [MEMORY[0x1E4F83AB8] linkButton];
    customizeButton = v11->_customizeButton;
    v11->_customizeButton = (OBLinkTrayButton *)v14;

    [(OBLinkTrayButton *)v11->_customizeButton setTranslatesAutoresizingMaskIntoConstraints:0];
  }

  return v11;
}

- (void)_cancelLanguageSetup
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v13 = self;
    __int16 v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);
  }
  v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v13 = self;
    __int16 v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@: Cancelling Personal Identity Device Language Setup", buf, 0x16u);
  }
  v8 = [(HUHomePersonalIdentityDeviceLanguageSetupViewController *)self delegate];
  v10 = @"HULanguageOnboardingKey_SetupLanguage_PersonalDevice_UserInput";
  v11 = &unk_1F19B4F58;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  [v8 viewController:self didFinishWithConfigurationResults:v9];
}

- (void)_completeLanguageSetup
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v13 = self;
    __int16 v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);
  }
  v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v13 = self;
    __int16 v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@: Finishing Personal Identity Device Language Setup", buf, 0x16u);
  }
  v8 = [(HUHomePersonalIdentityDeviceLanguageSetupViewController *)self delegate];
  v10 = @"HULanguageOnboardingKey_SetupLanguage_PersonalDevice_UserInput";
  v11 = &unk_1F19B4F70;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  [v8 viewController:self didFinishWithConfigurationResults:v9];
}

- (void)_changeSiriLanguage
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v19 = self;
    __int16 v20 = 2112;
    v21 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);
  }
  v6 = [(HUHomePersonalIdentityDeviceLanguageSetupViewController *)self targetLanguage];

  if (v6)
  {
    v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = NSStringFromSelector(a2);
      v9 = [(HUHomePersonalIdentityDeviceLanguageSetupViewController *)self targetLanguage];
      *(_DWORD *)buf = 138412802;
      v19 = self;
      __int16 v20 = 2112;
      v21 = v8;
      __int16 v22 = 2112;
      v23 = v9;
      _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@: Setting Siri language of Personal Identity Device to %@", buf, 0x20u);
    }
    id v10 = objc_alloc_init(MEMORY[0x1E4F4E570]);
    v11 = [(HUHomePersonalIdentityDeviceLanguageSetupViewController *)self targetLanguage];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __78__HUHomePersonalIdentityDeviceLanguageSetupViewController__changeSiriLanguage__block_invoke;
    v15[3] = &unk_1E6385738;
    v15[4] = self;
    v15[5] = a2;
    [v10 setLanguage:v11 withCompletion:v15];
  }
  else
  {
    id v10 = [(HUHomePersonalIdentityDeviceLanguageSetupViewController *)self delegate];
    v17[0] = &unk_1F19B4F88;
    v16[0] = @"HULanguageOnboardingKey_SetupLanguage_PersonalDevice_UserInput";
    v16[1] = @"HULanguageOnboardingKey_MediaProfileAndLanguageInfo";
    uint64_t v12 = [(HUHomePersonalIdentityDeviceLanguageSetupViewController *)self languageToHomePodsMapping];
    v13 = (void *)[v12 copy];
    v17[1] = v13;
    __int16 v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
    [v10 viewController:self didFinishWithConfigurationResults:v14];
  }
}

void __78__HUHomePersonalIdentityDeviceLanguageSetupViewController__changeSiriLanguage__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = NSStringFromSelector(*(SEL *)(a1 + 40));
    id v5 = [*(id *)(a1 + 32) targetLanguage];
    *(_DWORD *)buf = 138412802;
    uint64_t v15 = v3;
    __int16 v16 = 2112;
    objc_super v17 = v4;
    __int16 v18 = 2112;
    v19 = v5;
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_DEFAULT, "%@:%@: Personal Identity Device Siri language set to %@. Starting to check for voice profile availability...", buf, 0x20u);
  }
  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  v6 = [*(id *)(a1 + 32) targetLanguage];
  v7 = +[HUHomeFeatureOnboardingUtilities checkVoiceProfileAvailabiltyForLanguage:v6];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __78__HUHomePersonalIdentityDeviceLanguageSetupViewController__changeSiriLanguage__block_invoke_11;
  v12[3] = &unk_1E6389FD0;
  objc_copyWeak(v13, (id *)buf);
  v13[1] = *(id *)(a1 + 40);
  id v8 = (id)[v7 addFailureBlock:v12];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __78__HUHomePersonalIdentityDeviceLanguageSetupViewController__changeSiriLanguage__block_invoke_14;
  v10[3] = &unk_1E6390298;
  objc_copyWeak(v11, (id *)buf);
  v11[1] = *(id *)(a1 + 40);
  id v9 = (id)[v7 addSuccessBlock:v10];
  objc_destroyWeak(v11);
  objc_destroyWeak(v13);

  objc_destroyWeak((id *)buf);
}

void __78__HUHomePersonalIdentityDeviceLanguageSetupViewController__changeSiriLanguage__block_invoke_11(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 40));
    v6 = [WeakRetained targetLanguage];
    int v9 = 138412802;
    id v10 = WeakRetained;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    __int16 v13 = 2112;
    __int16 v14 = v6;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@:\t...Personal Identity Device Siri language set to %@ (but failed to check for 'Hey Siri' Voice Profile)", (uint8_t *)&v9, 0x20u);
  }
  [v3 setObject:&unk_1F19B4F70 forKeyedSubscript:@"HULanguageOnboardingKey_SetupLanguage_PersonalDevice_UserInput"];
  v7 = [WeakRetained targetLanguage];
  [v3 setObject:v7 forKeyedSubscript:@"HULanguageOnboardingKey_PersonalDeviceSiriLanguageChanged_MissingVoiceProfile"];

  id v8 = [WeakRetained delegate];
  [v8 viewController:WeakRetained didFinishWithConfigurationResults:v3];
}

void __78__HUHomePersonalIdentityDeviceLanguageSetupViewController__changeSiriLanguage__block_invoke_14(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  objc_opt_class();
  id v6 = v3;
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  if (v8 && [v8 BOOLValue])
  {
    int v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 40));
      __int16 v11 = [WeakRetained targetLanguage];
      uint64_t v12 = [WeakRetained targetLanguage];
      int v19 = 138413058;
      id v20 = WeakRetained;
      __int16 v21 = 2112;
      __int16 v22 = v10;
      __int16 v23 = 2112;
      uint64_t v24 = v11;
      __int16 v25 = 2112;
      v26 = v12;
      _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "%@:%@:\t...Personal Identity Device Siri language set to %@ (& 'Hey Siri' Voice Profile for %@ WAS found in iCloud)", (uint8_t *)&v19, 0x2Au);
    }
    __int16 v13 = [WeakRetained targetLanguage];
    [v5 setObject:v13 forKeyedSubscript:@"HULanguageOnboardingKey_PersonalDeviceSiriLanguageChanged_HasVoiceProfile"];
  }
  else
  {
    __int16 v14 = [WeakRetained targetLanguage];
    [v5 setObject:v14 forKeyedSubscript:@"HULanguageOnboardingKey_PersonalDeviceSiriLanguageChanged_MissingVoiceProfile"];

    __int16 v13 = HFLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = NSStringFromSelector(*(SEL *)(a1 + 40));
      __int16 v16 = [WeakRetained targetLanguage];
      objc_super v17 = [WeakRetained targetLanguage];
      int v19 = 138413058;
      id v20 = WeakRetained;
      __int16 v21 = 2112;
      __int16 v22 = v15;
      __int16 v23 = 2112;
      uint64_t v24 = v16;
      __int16 v25 = 2112;
      v26 = v17;
      _os_log_impl(&dword_1BE345000, v13, OS_LOG_TYPE_DEFAULT, "%@:%@:\t...Personal Identity Device Siri language set to %@ (& 'Hey Siri' Voice Profile for %@ was NOT found in iCloud)", (uint8_t *)&v19, 0x2Au);
    }
  }

  [v5 setObject:&unk_1F19B4F70 forKeyedSubscript:@"HULanguageOnboardingKey_SetupLanguage_PersonalDevice_UserInput"];
  __int16 v18 = [WeakRetained delegate];
  [v18 viewController:WeakRetained didFinishWithConfigurationResults:v5];
}

- (id)hu_preloadContent
{
  objc_initWeak(&location, self);
  v4 = [(HUHomePersonalIdentityDeviceLanguageSetupViewController *)self home];
  int v5 = objc_msgSend(v4, "hf_hasHomePods");

  id v6 = (void *)MEMORY[0x1E4F7A0D8];
  if (v5)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __76__HUHomePersonalIdentityDeviceLanguageSetupViewController_hu_preloadContent__block_invoke;
    v10[3] = &unk_1E638CB90;
    objc_copyWeak(v11, &location);
    v11[1] = (id)a2;
    v7 = [v6 futureWithBlock:v10];
    objc_destroyWeak(v11);
  }
  else
  {
    id v8 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 48);
    v7 = [v6 futureWithError:v8];
  }
  objc_destroyWeak(&location);

  return v7;
}

void __76__HUHomePersonalIdentityDeviceLanguageSetupViewController_hu_preloadContent__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v3 = (id *)(a1 + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = [WeakRetained overrideTargetLanguage];

  if (v6)
  {
    v7 = [WeakRetained overrideTargetLanguage];
    [WeakRetained setTargetLanguage:v7];
  }
  else
  {
    id v8 = +[HUHomeFeatureOnboardingUtilities fetchSupportedVoiceRecognitionLanguages];
    [WeakRetained setSupportedVoiceRecognitionLanguages:v8];

    int v9 = [WeakRetained supportedVoiceRecognitionLanguages];

    if (!v9)
    {
      id v10 = HFLogForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v47 = NSStringFromSelector(*(SEL *)(a1 + 40));
        *(_DWORD *)buf = 138412290;
        id v50 = v47;
        _os_log_error_impl(&dword_1BE345000, v10, OS_LOG_TYPE_ERROR, "%@ Error fetching voice recognition languages", buf, 0xCu);
      }
    }
    __int16 v11 = [WeakRetained home];
    uint64_t v12 = [WeakRetained supportedVoiceRecognitionLanguages];
    __int16 v13 = +[HUHomeFeatureOnboardingUtilities home:v11 createMultiUserLanguageToHomePodsMapping:v12];
    [WeakRetained setLanguageToHomePodsMapping:v13];

    __int16 v14 = HFLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = NSStringFromSelector(*(SEL *)(a1 + 40));
      __int16 v16 = [WeakRetained languageToHomePodsMapping];
      objc_super v17 = [WeakRetained languageToHomePodsMapping];
      uint64_t v18 = [v17 count];
      *(_DWORD *)buf = 138413058;
      id v50 = WeakRetained;
      __int16 v51 = 2112;
      v52 = v15;
      __int16 v53 = 2112;
      v54 = v16;
      __int16 v55 = 2048;
      uint64_t v56 = v18;
      _os_log_impl(&dword_1BE345000, v14, OS_LOG_TYPE_DEFAULT, "%@:%@: VoiceRecognitionLanguageLanguageToHomePods mapping = %@ (%lu)", buf, 0x2Au);
    }
    int v19 = [WeakRetained languageToHomePodsMapping];
    v7 = +[HUHomeFeatureOnboardingUtilities createPersonalIdentityDeviceLanguageMismatchList:v19];

    id v20 = HFLogForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v21 = NSStringFromSelector(*(SEL *)(a1 + 40));
      uint64_t v22 = [v7 count];
      *(_DWORD *)buf = 138413058;
      id v50 = WeakRetained;
      __int16 v51 = 2112;
      v52 = v21;
      __int16 v53 = 2112;
      v54 = v7;
      __int16 v55 = 2048;
      uint64_t v56 = v22;
      _os_log_impl(&dword_1BE345000, v20, OS_LOG_TYPE_DEFAULT, "%@:%@: List of Language mismatches for Personal Identity Device = %@ (%lu)", buf, 0x2Au);
    }
    if ([v7 count] == 1)
    {
      __int16 v23 = [v7 lastObject];
      [WeakRetained setTargetLanguage:v23];
    }
  }

  uint64_t v24 = HFLogForCategory();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v25 = NSStringFromSelector(*(SEL *)(a1 + 40));
    v26 = [WeakRetained targetLanguage];
    uint64_t v27 = [WeakRetained targetLanguage];
    *(_DWORD *)buf = 138413058;
    id v50 = WeakRetained;
    __int16 v51 = 2112;
    v52 = v25;
    __int16 v53 = 2112;
    v54 = v26;
    __int16 v55 = 1024;
    LODWORD(v56) = v27 == 0;
    _os_log_impl(&dword_1BE345000, v24, OS_LOG_TYPE_DEFAULT, "%@:%@: Target Language %@, user needs to choose on next screen?: %{BOOL}d", buf, 0x26u);
  }
  v28 = [WeakRetained targetLanguage];

  if (v28)
  {
    v29 = [MEMORY[0x1E4F4E4C8] sharedInstance];
    v30 = [WeakRetained targetLanguage];
    v31 = [v29 localizedNameForSiriLanguage:v30 inDisplayLanguage:0];

    v32 = HULocalizedModelString(@"HULanguagePersonalIdentityDevice_LanguageSingleMismatch_Detail");
    v33 = HUSensitiveLocalizedModelString(@"HULanguagePersonalIdentityDevice_LanguageSingleMismatch_Detail");

    id v48 = 0;
    v34 = [NSString stringWithValidatedFormat:v33, @"%@", &v48, v31 validFormatSpecifiers error];
    id v35 = v48;
    v36 = v35;
    if (!v34) {
      NSLog(&cfstr_CouldnTLocaliz.isa, v33, v35);
    }
    v37 = [WeakRetained headerView];
    [v37 setDetailText:v34];
  }
  v38 = [WeakRetained continueButton];
  v39 = _HULocalizedStringWithDefaultValue(@"HULanguageDontRecognizeVoiceButton_Title", @"HULanguageDontRecognizeVoiceButton_Title", 1);
  [v38 setTitle:v39 forState:0];

  v40 = [WeakRetained continueButton];
  [v40 addTarget:WeakRetained action:sel__cancelLanguageSetup forControlEvents:64];

  v41 = [WeakRetained customizeButton];
  v42 = _HULocalizedStringWithDefaultValue(@"HULanguageChangeSiriLanguage_Button_Title", @"HULanguageChangeSiriLanguage_Button_Title", 1);
  [v41 setTitle:v42 forState:0];

  v43 = [WeakRetained customizeButton];
  [v43 addTarget:WeakRetained action:sel__changeSiriLanguage forControlEvents:64];

  v44 = _HULocalizedStringWithDefaultValue(@"HULanguagePersonalIdentityDevice_LanguageMismatch_FinePrint", @"HULanguagePersonalIdentityDevice_LanguageMismatch_FinePrint", 1);
  v45 = _HULocalizedStringWithDefaultValue(@"HULanguagePersonalIdentityDevice_SiriEnabledAccessories_LanguageMismatch_FinePrint", @"HULanguagePersonalIdentityDevice_SiriEnabledAccessories_LanguageMismatch_FinePrint", 1);

  v46 = [WeakRetained buttonTray];
  [v46 setCaptionText:v45];

  [v4 finishWithNoResult];
}

- (void)viewDidLoad
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)HUHomePersonalIdentityDeviceLanguageSetupViewController;
  [(OBBaseWelcomeController *)&v12 viewDidLoad];
  id v4 = [(HUHomePersonalIdentityDeviceLanguageSetupViewController *)self headerView];
  int v5 = [v4 subviews];
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:v5 withIDDictionary:&unk_1F19B5F48];

  [(HUHomePersonalIdentityDeviceLanguageSetupViewController *)self setModalInPresentation:1];
  id v6 = [(HUHomePersonalIdentityDeviceLanguageSetupViewController *)self buttonTray];
  v7 = [(HUHomePersonalIdentityDeviceLanguageSetupViewController *)self continueButton];
  [v6 addButton:v7];

  id v8 = [(HUHomePersonalIdentityDeviceLanguageSetupViewController *)self buttonTray];
  int v9 = [(HUHomePersonalIdentityDeviceLanguageSetupViewController *)self customizeButton];
  [v8 addButton:v9];

  id v10 = HFLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v11 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    __int16 v14 = self;
    __int16 v15 = 2112;
    __int16 v16 = v11;
    _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "%@:%@: presented: HPIDLSVC", buf, 0x16u);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)HUHomePersonalIdentityDeviceLanguageSetupViewController;
  [(HUHomePersonalIdentityDeviceLanguageSetupViewController *)&v8 viewWillDisappear:a3];
  if ([(HUHomePersonalIdentityDeviceLanguageSetupViewController *)self isMovingFromParentViewController])
  {
    int v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      id v10 = self;
      __int16 v11 = 2112;
      objc_super v12 = v6;
      _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped BACK button", buf, 0x16u);
    }
    v7 = [(HUHomePersonalIdentityDeviceLanguageSetupViewController *)self delegate];
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

- (NSString)overrideTargetLanguage
{
  return self->_overrideTargetLanguage;
}

- (void)setOverrideTargetLanguage:(id)a3
{
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (NSString)targetLanguage
{
  return self->_targetLanguage;
}

- (void)setTargetLanguage:(id)a3
{
}

- (OBTrayButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
}

- (OBLinkTrayButton)customizeButton
{
  return self->_customizeButton;
}

- (void)setCustomizeButton:(id)a3
{
}

- (NSArray)supportedVoiceRecognitionLanguages
{
  return self->_supportedVoiceRecognitionLanguages;
}

- (void)setSupportedVoiceRecognitionLanguages:(id)a3
{
}

- (NSDictionary)languageToHomePodsMapping
{
  return self->_languageToHomePodsMapping;
}

- (void)setLanguageToHomePodsMapping:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageToHomePodsMapping, 0);
  objc_storeStrong((id *)&self->_supportedVoiceRecognitionLanguages, 0);
  objc_storeStrong((id *)&self->_customizeButton, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_targetLanguage, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_overrideTargetLanguage, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end