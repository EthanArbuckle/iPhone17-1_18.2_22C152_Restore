@interface HULanguageSetupOnboardingFlow
+ (id)needsOnboardingForHome:(id)a3 options:(id)a4;
- (BOOL)forceOnboardingFinishedForErrorRecovery;
- (BOOL)shouldAbortAllOnboarding;
- (BOOL)shouldAbortThisOnboardingFlowGroup;
- (HMHome)home;
- (HUConfigurationViewController)initialViewController;
- (HULanguageSetupOnboardingFlow)initWithUsageOptions:(id)a3 home:(id)a4;
- (NAFuture)onboardingFuture;
- (NAFuture)readyFuture;
- (NSDictionary)usageOptions;
- (NSString)assistantDeviceIntendedRecognitionLanguage;
- (NSString)description;
- (id)_determineNextViewControllerWithPriorResults:(id)a3;
- (id)processUserInput:(id)a3;
- (unint64_t)languageOnboardingFlowType;
- (void)setAssistantDeviceIntendedRecognitionLanguage:(id)a3;
- (void)setForceOnboardingFinishedForErrorRecovery:(BOOL)a3;
- (void)setHome:(id)a3;
- (void)setInitialViewController:(id)a3;
- (void)setLanguageOnboardingFlowType:(unint64_t)a3;
- (void)setOnboardingFuture:(id)a3;
- (void)setReadyFuture:(id)a3;
- (void)setShouldAbortAllOnboarding:(BOOL)a3;
- (void)setShouldAbortThisOnboardingFlowGroup:(BOOL)a3;
- (void)setUsageOptions:(id)a3;
@end

@implementation HULanguageSetupOnboardingFlow

- (HULanguageSetupOnboardingFlow)initWithUsageOptions:(id)a3 home:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HULanguageSetupOnboardingFlow;
  v9 = [(HULanguageSetupOnboardingFlow *)&v20 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a4);
    v10->_languageOnboardingFlowType = 0;
    objc_storeStrong((id *)&v10->_usageOptions, a3);
    v11 = (NAFuture *)objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    readyFuture = v10->_readyFuture;
    v10->_readyFuture = v11;

    objc_initWeak(&location, v10);
    v13 = [(id)objc_opt_class() needsOnboardingForHome:v8 options:v7];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __59__HULanguageSetupOnboardingFlow_initWithUsageOptions_home___block_invoke;
    v17[3] = &unk_1E6386D40;
    objc_copyWeak(&v18, &location);
    uint64_t v14 = [v13 flatMap:v17];
    onboardingFuture = v10->_onboardingFuture;
    v10->_onboardingFuture = (NAFuture *)v14;

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v10;
}

id __59__HULanguageSetupOnboardingFlow_initWithUsageOptions_home___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)MEMORY[0x1E4F7A0D8];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__HULanguageSetupOnboardingFlow_initWithUsageOptions_home___block_invoke_2;
  v8[3] = &unk_1E6386D18;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  id v5 = v3;
  id v9 = v5;
  v6 = [v4 futureWithBlock:v8];

  objc_destroyWeak(&v10);

  return v6;
}

void __59__HULanguageSetupOnboardingFlow_initWithUsageOptions_home___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ([*(id *)(a1 + 32) BOOLValue])
  {
    v4 = [WeakRetained _determineNextViewControllerWithPriorResults:0];
    [WeakRetained setInitialViewController:v4];

    id v5 = [WeakRetained readyFuture];
    [v5 finishWithResult:MEMORY[0x1E4F1CC38]];
  }
  else
  {
    [v6 finishWithNoResult];
  }
}

- (id)_determineNextViewControllerWithPriorResults:(id)a3
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unint64_t v6 = [(HULanguageSetupOnboardingFlow *)self languageOnboardingFlowType];
  if (v6 != 1)
  {
    if (!v6)
    {
      id v7 = HFLogForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        v67 = self;
        __int16 v68 = 2112;
        v69 = v8;
        __int16 v70 = 2112;
        uint64_t v71 = (uint64_t)v5;
        _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ Determining next Assistant Device Language onboarding view controller with results %@ ", buf, 0x20u);
      }
      if (v5)
      {
        id v9 = [v5 objectForKeyedSubscript:@"HULanguageOnboardingKey_SupportedLanguageInfo"];
        id v10 = [v5 objectForKeyedSubscript:@"HULanguageOnboardingKey_LanguageMismatchedHomeAssistantDevices"];
        v11 = HFLogForCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v12 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          v67 = self;
          __int16 v68 = 2112;
          v69 = v12;
          _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, "%@:%@: Starting Home Assistant Device Language Configuration view", buf, 0x16u);
        }
        v13 = [[HUHomeAssistantDeviceLanguageConfigurationViewController alloc] initWithSupportedVoiceRecognitionLanguages:v9 languageMismatchedHomeAssistantDevices:v10];
        goto LABEL_63;
      }
      v21 = HFLogForCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BE345000, v21, OS_LOG_TYPE_DEFAULT, "Configuring Assistant Device Setup View", buf, 2u);
      }

      v22 = [HUHomeAssistantDeviceLanguageSetupViewController alloc];
      v19 = [(HULanguageSetupOnboardingFlow *)self home];
      objc_super v20 = [(HUHomeAssistantDeviceLanguageSetupViewController *)v22 initWithHome:v19];
LABEL_20:
      v13 = (HUHomeAssistantDeviceLanguageConfigurationViewController *)v20;

      goto LABEL_64;
    }
    NSLog(&cfstr_UnexpectedLang.isa, [(HULanguageSetupOnboardingFlow *)self languageOnboardingFlowType]);
LABEL_16:
    v13 = 0;
    goto LABEL_64;
  }
  uint64_t v14 = HFLogForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    v67 = self;
    __int16 v68 = 2112;
    v69 = v15;
    __int16 v70 = 2112;
    uint64_t v71 = (uint64_t)v5;
    _os_log_impl(&dword_1BE345000, v14, OS_LOG_TYPE_DEFAULT, "%@:%@ Determining next Personal Identity Device Language onboarding view controller with results %@ ", buf, 0x20u);
  }
  v16 = HFLogForCategory();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v17)
    {
      id v18 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v67 = self;
      __int16 v68 = 2112;
      v69 = v18;
      _os_log_impl(&dword_1BE345000, v16, OS_LOG_TYPE_DEFAULT, "%@:%@: Now starting Personal Identity Device Language Configuration screen", buf, 0x16u);
    }
    v19 = [v5 objectForKeyedSubscript:@"HULanguageOnboardingKey_MediaProfileAndLanguageInfo"];
    objc_super v20 = [[HUHomePersonalIdentityDeviceConfigurationViewController alloc] initWithMediaProfileAndLanguageInfo:v19];
    goto LABEL_20;
  }
  if (v17)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE345000, v16, OS_LOG_TYPE_DEFAULT, "Configuring Personal Identity Device Setup View", buf, 2u);
  }

  v23 = [MEMORY[0x1E4F4E538] sharedPreferences];
  v24 = [v23 languageCode];

  if (!v24)
  {
    v38 = HFLogForCategory();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v39 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v67 = self;
      __int16 v68 = 2112;
      v69 = v39;
      _os_log_impl(&dword_1BE345000, v38, OS_LOG_TYPE_DEFAULT, "%@:%@ There is NO Siri language on this device, skipping personal device onboarding, will train & set up Siri voice during voice profile onboarding instead...", buf, 0x16u);
    }
    goto LABEL_16;
  }
  id v9 = +[HUHomeFeatureOnboardingUtilities fetchSupportedVoiceRecognitionLanguages];
  if (v9)
  {
    v25 = [(HULanguageSetupOnboardingFlow *)self home];
    char v26 = objc_msgSend(v25, "hf_hasHomePods");

    if (v26)
    {
      v27 = [(HULanguageSetupOnboardingFlow *)self home];
      id v10 = +[HUHomeFeatureOnboardingUtilities home:v27 createMultiUserLanguageToHomePodsMapping:v9];

      v28 = HFLogForCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = NSStringFromSelector(a2);
        uint64_t v30 = [v10 count];
        *(_DWORD *)buf = 138413058;
        v67 = self;
        __int16 v68 = 2112;
        v69 = v29;
        __int16 v70 = 2112;
        uint64_t v71 = (uint64_t)v10;
        __int16 v72 = 2048;
        uint64_t v73 = v30;
        _os_log_impl(&dword_1BE345000, v28, OS_LOG_TYPE_DEFAULT, "%@:%@: HomePods on Supported Voice Recognition Languages %@ (%lu)", buf, 0x2Au);
      }
      if ([v10 count])
      {
        v31 = HFLogForCategory();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BE345000, v31, OS_LOG_TYPE_DEFAULT, "Starting Personal Identity Device Setup View", buf, 2u);
        }

        v32 = +[HUHomeFeatureOnboardingUtilities createPersonalIdentityDeviceLanguageMismatchList:v10];
        v33 = [MEMORY[0x1E4F4E538] sharedPreferences];
        uint64_t v34 = [v33 languageCode];

        v35 = [v10 allKeys];
        v65 = (void *)v34;
        v36 = v35;
        if ([v9 containsObject:v34]) {
          int v37 = [v35 containsObject:v34];
        }
        else {
          int v37 = 0;
        }
        v52 = HFLogForCategory();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          v53 = NSStringFromSelector(a2);
          uint64_t v54 = [v32 count];
          *(_DWORD *)buf = 138413314;
          v67 = self;
          __int16 v68 = 2112;
          v69 = v53;
          __int16 v70 = 2112;
          uint64_t v71 = (uint64_t)v32;
          __int16 v72 = 2048;
          uint64_t v73 = v54;
          __int16 v74 = 1024;
          int v75 = v37;
          _os_log_impl(&dword_1BE345000, v52, OS_LOG_TYPE_DEFAULT, "%@:%@: List of Personal Identity Device Mismatches %@ (%lu) - hasAtLeastOneHomePodSupportingPersonalIdentityDeviceLanguage %{BOOL}d", buf, 0x30u);
        }
        if ([v32 count]) {
          int v55 = v37;
        }
        else {
          int v55 = 1;
        }
        v56 = HFLogForCategory();
        BOOL v57 = os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT);
        if (v55 == 1)
        {
          if (v57)
          {
            v58 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138412546;
            v67 = self;
            __int16 v68 = 2112;
            v69 = v58;
            _os_log_impl(&dword_1BE345000, v56, OS_LOG_TYPE_DEFAULT, "%@:%@ all languages match - onboarding not required", buf, 0x16u);
          }
          v13 = 0;
        }
        else
        {
          if (v57)
          {
            v59 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138412546;
            v67 = self;
            __int16 v68 = 2112;
            v69 = v59;
            _os_log_impl(&dword_1BE345000, v56, OS_LOG_TYPE_DEFAULT, "%@:%@: Now starting Personal Identity Device Language Setup screen", buf, 0x16u);
          }
          v60 = [HUHomePersonalIdentityDeviceLanguageSetupViewController alloc];
          v56 = [(HULanguageSetupOnboardingFlow *)self home];
          v13 = [(HUHomePersonalIdentityDeviceLanguageSetupViewController *)v60 initWithHome:v56];
        }
      }
      else
      {
        v45 = [(HULanguageSetupOnboardingFlow *)self assistantDeviceIntendedRecognitionLanguage];

        if (!v45)
        {
          v64 = [MEMORY[0x1E4F28B00] currentHandler];
          [v64 handleFailureInMethod:a2 object:self file:@"HULanguageSetupOnboardingFlow.m" lineNumber:227 description:@"Attempting to run Personal Identity Device Language Setup with no HomePods in Supported Language & No Intended Language - this shouldn't happen."];
        }
        v46 = HFLogForCategory();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          v62 = NSStringFromSelector(a2);
          v63 = [(HULanguageSetupOnboardingFlow *)self assistantDeviceIntendedRecognitionLanguage];
          *(_DWORD *)buf = 138412802;
          v67 = self;
          __int16 v68 = 2112;
          v69 = v62;
          __int16 v70 = 2112;
          uint64_t v71 = (uint64_t)v63;
          _os_log_error_impl(&dword_1BE345000, v46, OS_LOG_TYPE_ERROR, "%@:%@: No HomePods in a supported language, even after Home Assistant Device Language Setup - user intended: %@", buf, 0x20u);
        }
        v47 = HFLogForCategory();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          v48 = NSStringFromSelector(a2);
          v49 = [(HULanguageSetupOnboardingFlow *)self assistantDeviceIntendedRecognitionLanguage];
          *(_DWORD *)buf = 138412802;
          v67 = self;
          __int16 v68 = 2112;
          v69 = v48;
          __int16 v70 = 2112;
          uint64_t v71 = (uint64_t)v49;
          _os_log_impl(&dword_1BE345000, v47, OS_LOG_TYPE_DEFAULT, "%@:%@: Now starting Personal Identity Device Language Setup screen with override language %@", buf, 0x20u);
        }
        [(HULanguageSetupOnboardingFlow *)self setForceOnboardingFinishedForErrorRecovery:1];
        v50 = [HUHomePersonalIdentityDeviceLanguageSetupViewController alloc];
        v51 = [(HULanguageSetupOnboardingFlow *)self home];
        v13 = [(HUHomePersonalIdentityDeviceLanguageSetupViewController *)v50 initWithHome:v51];

        v32 = [(HULanguageSetupOnboardingFlow *)self assistantDeviceIntendedRecognitionLanguage];
        [(HUHomeAssistantDeviceLanguageConfigurationViewController *)v13 setOverrideTargetLanguage:v32];
      }

      goto LABEL_63;
    }
    id v10 = HFLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v41 = NSStringFromSelector(a2);
      v42 = [(HULanguageSetupOnboardingFlow *)self home];
      v43 = objc_msgSend(v42, "hf_appleTVs");
      uint64_t v44 = [v43 count];
      *(_DWORD *)buf = 138412802;
      v67 = self;
      __int16 v68 = 2112;
      v69 = v41;
      __int16 v70 = 2048;
      uint64_t v71 = v44;
      _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "%@:%@ There are NO HomePods in this Home BUT we have (%lu) AppleTVs, skipping personal device language mismatch flows.", buf, 0x20u);
    }
  }
  else
  {
    id v10 = HFLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v40 = (HULanguageSetupOnboardingFlow *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v67 = v40;
      _os_log_error_impl(&dword_1BE345000, v10, OS_LOG_TYPE_ERROR, "%@ Error fetching voice recognition languages", buf, 0xCu);
    }
  }
  v13 = 0;
LABEL_63:

LABEL_64:

  return v13;
}

- (NSString)description
{
  unint64_t v2 = [(HULanguageSetupOnboardingFlow *)self languageOnboardingFlowType];
  id v3 = @"Personal Identity Device";
  if (v2 != 1) {
    id v3 = 0;
  }
  if (!v2) {
    id v3 = @"Home Assistant Device";
  }
  return (NSString *)[NSString stringWithFormat:@"Voice Recognition LANGUAGE Setup (%@)", v3];
}

- (id)processUserInput:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unint64_t v6 = [(HULanguageSetupOnboardingFlow *)self languageOnboardingFlowType];
  if (v6 == 1)
  {
    id v7 = [v5 objectForKeyedSubscript:@"HULanguageOnboardingKey_SetupLanguage_PersonalDevice_UserInput"];
    if ([v7 integerValue] == 3
      || [v7 integerValue] == 5
      || [v7 integerValue] == 4)
    {
      goto LABEL_10;
    }
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"HULanguageSetupOnboardingFlow.m", 312, @"Invalid parameter not satisfying: %@", @"(userInputValue.integerValue == HULanguageOnboardingValue_SetupLanguage_PersonalDevice_Completed) || (userInputValue.integerValue == HULanguageOnboardingValue_SetupLanguage_PersonalDevice_Cancelled) || (userInputValue.integerValue == HULanguageOnboardingValue_SetupLanguage_PersonalDevice_Customize)" object file lineNumber description];
    goto LABEL_38;
  }
  if (v6)
  {
    NSLog(&cfstr_UnexpectedLang.isa, [(HULanguageSetupOnboardingFlow *)self languageOnboardingFlowType]);
    id v19 = 0;
    goto LABEL_34;
  }
  id v7 = [v5 objectForKeyedSubscript:@"HULanguageOnboardingKey_SetupLanguage_AssistantDevice_UserInput"];
  if ([v7 integerValue]
    && [v7 integerValue] != 2
    && [v7 integerValue] != 1)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"HULanguageSetupOnboardingFlow.m", 302, @"Invalid parameter not satisfying: %@", @"(userInputValue.integerValue == HULanguageOnboardingValue_SetupLanguage_AssistantDevice_Completed) || (userInputValue.integerValue == HULanguageOnboardingValue_SetupLanguage_AssistantDevice_Cancelled) || (userInputValue.integerValue == HULanguageOnboardingValue_SetupLanguage_AssistantDevice_Customize)" object file lineNumber description];
LABEL_38:
  }
LABEL_10:
  id v9 = HFLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    v38 = self;
    __int16 v39 = 2112;
    v40 = v10;
    __int16 v41 = 2112;
    id v42 = v5;
    _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "%@:%@ with input results: %@", buf, 0x20u);
  }
  v11 = [v5 objectForKeyedSubscript:@"HUMultiUserKey_SetIsEnabled"];
  if ([v11 BOOLValue])
  {
    v12 = [(HULanguageSetupOnboardingFlow *)self home];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __50__HULanguageSetupOnboardingFlow_processUserInput___block_invoke;
    v36[3] = &unk_1E6386978;
    v36[4] = self;
    v36[5] = a2;
    [v12 enableMultiUserWithCompletionHandler:v36];
  }
  switch([v7 integerValue])
  {
    case 0:
      v22 = [v5 objectForKeyedSubscript:@"HULanguageOnboardingKey_SetupLanguage_AssistantDevice_IntendedLanguage"];
      [(HULanguageSetupOnboardingFlow *)self setAssistantDeviceIntendedRecognitionLanguage:v22];

      [(HULanguageSetupOnboardingFlow *)self setLanguageOnboardingFlowType:1];
      objc_super v20 = self;
      id v21 = 0;
      goto LABEL_20;
    case 1:
    case 4:
      objc_super v20 = self;
      id v21 = v5;
LABEL_20:
      v23 = [(HULanguageSetupOnboardingFlow *)v20 _determineNextViewControllerWithPriorResults:v21];
      goto LABEL_24;
    case 2:
    case 5:
      [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"HUHomeFeatureOnboardingKey_IdentifyVoice_FinishedOnboarding"];
      [(HULanguageSetupOnboardingFlow *)self setShouldAbortThisOnboardingFlowGroup:1];
      id v13 = objc_alloc(MEMORY[0x1E4F69710]);
      uint64_t v14 = [(HULanguageSetupOnboardingFlow *)self home];
      v15 = [(HULanguageSetupOnboardingFlow *)self home];
      v16 = [v15 currentUser];
      BOOL v17 = (void *)[v13 initWithHome:v14 user:v16 nameStyle:0];

      id v18 = (id)[v17 setEnableIdentifyVoice:0];
      goto LABEL_23;
    case 3:
      if ([(HULanguageSetupOnboardingFlow *)self forceOnboardingFinishedForErrorRecovery])
      {
        uint64_t v24 = MEMORY[0x1E4F1CC38];
        [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"HUHomeFeatureOnboardingKey_IdentifyVoice_FinishedOnboarding"];
        [v5 setObject:v24 forKeyedSubscript:@"HUHomeFeatureOnboardingKey_IdentifyVoice_DismissReminderBanner"];
      }
      goto LABEL_23;
    default:
      NSLog(&cfstr_UnexpectedUser.isa, [v7 integerValue]);
LABEL_23:
      v23 = 0;
LABEL_24:
      v25 = HFLogForCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        char v26 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        v38 = self;
        __int16 v39 = 2112;
        v40 = v26;
        __int16 v41 = 2112;
        id v42 = v23;
        _os_log_impl(&dword_1BE345000, v25, OS_LOG_TYPE_DEFAULT, "%@:%@: Next ViewController: %@", buf, 0x20u);
      }
      if (!v23)
      {
        v27 = [v5 objectForKeyedSubscript:@"HUHomeFeatureOnboardingKey_IdentifyVoice_DismissReminderBanner"];

        if (!v27)
        {
          id v28 = objc_alloc(MEMORY[0x1E4F69710]);
          v29 = [(HULanguageSetupOnboardingFlow *)self home];
          uint64_t v30 = [(HULanguageSetupOnboardingFlow *)self home];
          v31 = [v30 currentUser];
          v32 = (void *)[v28 initWithHome:v29 user:v31 nameStyle:0];

          if ([v32 hasDismissedVoiceProfileOnboarding])
          {
            v33 = [NSNumber numberWithBool:1];
            [v5 setObject:v33 forKeyedSubscript:@"HUHomeFeatureOnboardingKey_IdentifyVoice_DismissReminderBanner"];
          }
          else
          {
            [v5 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"HUHomeFeatureOnboardingKey_IdentifyVoice_DismissReminderBanner"];
          }
        }
        uint64_t v34 = [(HULanguageSetupOnboardingFlow *)self onboardingFuture];
        [v34 finishWithNoResult];
      }
      id v19 = v23;

      break;
  }
LABEL_34:

  return v19;
}

void __50__HULanguageSetupOnboardingFlow_processUserInput___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    unint64_t v6 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v7 = 138412802;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@: enabled Multi User in HomeKit (Error:%@)", (uint8_t *)&v7, 0x20u);
  }
}

+ (id)needsOnboardingForHome:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([MEMORY[0x1E4F69758] isAVisionPro])
  {
    __int16 v9 = [MEMORY[0x1E4F7A0D8] futureWithResult:MEMORY[0x1E4F1CC28]];
  }
  else
  {
    objc_initWeak(&location, a1);
    id v10 = (void *)MEMORY[0x1E4F7A0D8];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __64__HULanguageSetupOnboardingFlow_needsOnboardingForHome_options___block_invoke;
    v12[3] = &unk_1E638A3E0;
    objc_copyWeak(v15, &location);
    id v13 = v7;
    id v14 = v8;
    v15[1] = (id)a2;
    __int16 v9 = [v10 futureWithBlock:v12];

    objc_destroyWeak(v15);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __64__HULanguageSetupOnboardingFlow_needsOnboardingForHome_options___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  int v5 = objc_msgSend(*(id *)(a1 + 32), "hf_hasHomePods");
  int v6 = objc_msgSend(*(id *)(a1 + 32), "hf_hasRMVCapableAppleTV");
  objc_opt_class();
  id v7 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"OnboardingDisplayOption_OnboardingFromUserInput"];
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  int v41 = [v9 BOOLValue];
  if ([MEMORY[0x1E4F69758] isInternalInstall])
  {
    id v10 = [*(id *)(a1 + 32) accessories];
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __64__HULanguageSetupOnboardingFlow_needsOnboardingForHome_options___block_invoke_2;
    v51[3] = &__block_descriptor_40_e21_B16__0__HMAccessory_8l;
    v51[4] = *(void *)(a1 + 56);
    int v11 = objc_msgSend(v10, "na_any:", v51);

    if (v11)
    {
      id v12 = [MEMORY[0x1E4F69110] sharedHandler];
      id v13 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 50);
      [v12 handleError:v13 operationType:*MEMORY[0x1E4F687C0] options:0 retryBlock:0 cancelBlock:0];
    }
  }
  if ((v5 | v6) == 1)
  {
    id v14 = +[HUHomeFeatureOnboardingUtilities fetchSupportedVoiceRecognitionLanguages];
    v15 = HFLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = NSStringFromSelector(*(SEL *)(a1 + 56));
      uint64_t v17 = [v14 count];
      *(_DWORD *)buf = 138413058;
      id v53 = WeakRetained;
      __int16 v54 = 2112;
      int v55 = v16;
      __int16 v56 = 2048;
      *(void *)BOOL v57 = v17;
      *(_WORD *)&v57[8] = 2112;
      *(void *)&v57[10] = v14;
      _os_log_impl(&dword_1BE345000, v15, OS_LOG_TYPE_DEFAULT, "%@:%@ (%lu) supported voice recognition languages %@", buf, 0x2Au);
    }
    if (v14)
    {
      id v18 = objc_alloc(MEMORY[0x1E4F69710]);
      id v19 = *(void **)(a1 + 32);
      objc_super v20 = [v19 currentUser];
      id v21 = [v18 initWithHome:v19 user:v20 nameStyle:0];

      int v22 = [v21 hasDismissedVoiceProfileOnboarding];
      if (v22)
      {
        BOOL v23 = 0;
        BOOL v24 = 0;
      }
      else if ((v6 | v5 ^ 1))
      {
        BOOL v23 = 0;
        BOOL v24 = v6;
      }
      else
      {
        BOOL v23 = +[HUHomeFeatureOnboardingUtilities home:*(void *)(a1 + 32) hasSomeHomePodsOnSupportedVoiceRecognitionLanguages:v14];
        BOOL v24 = v23;
      }
      uint64_t v25 = v41 | v24;
    }
    else
    {
      id v21 = HFLogForCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v40 = NSStringFromSelector(*(SEL *)(a1 + 56));
        *(_DWORD *)buf = 138412290;
        id v53 = v40;
        _os_log_error_impl(&dword_1BE345000, v21, OS_LOG_TYPE_ERROR, "%@ Error fetching voice recognition languages", buf, 0xCu);
      }
      BOOL v23 = 0;
      int v22 = 0;
      uint64_t v25 = 0;
    }
  }
  else
  {
    BOOL v23 = 0;
    int v22 = 0;
    uint64_t v25 = 0;
  }
  char v26 = HFLogForCategory();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = NSStringFromSelector(*(SEL *)(a1 + 56));
    *(_DWORD *)buf = 138412802;
    id v53 = WeakRetained;
    __int16 v54 = 2112;
    int v55 = v27;
    __int16 v56 = 1024;
    *(_DWORD *)BOOL v57 = v6;
    _os_log_impl(&dword_1BE345000, v26, OS_LOG_TYPE_DEFAULT, "%@:%@: hasRMVCapableAppleTV = %{BOOL}d", buf, 0x1Cu);
  }
  id v28 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  v29 = [v28 homeManager];
  int v30 = [v29 hasOptedToHH2];

  v31 = HFLogForCategory();
  v32 = v31;
  if ((v25 & v30) == 1 && v5)
  {
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      __int16 v39 = NSStringFromSelector(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 138412546;
      id v53 = WeakRetained;
      __int16 v54 = 2112;
      int v55 = v39;
      _os_log_debug_impl(&dword_1BE345000, v32, OS_LOG_TYPE_DEBUG, "%@:%@: [HH2] Will check for atLeastOneHomePodHasLanguageSettingsForHomeFuture", buf, 0x16u);
    }
    v33 = +[HUHomeFeatureOnboardingUtilities atLeastOneHomePodHasLanguageSettingsForHomeFuture:*(void *)(a1 + 32)];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __64__HULanguageSetupOnboardingFlow_needsOnboardingForHome_options___block_invoke_73;
    v42[3] = &unk_1E638A3B8;
    uint64_t v34 = *(void *)(a1 + 56);
    v42[4] = WeakRetained;
    uint64_t v45 = v34;
    char v46 = 1;
    id v43 = *(id *)(a1 + 32);
    char v47 = v5;
    BOOL v48 = v23;
    char v49 = v22;
    char v50 = v41;
    id v44 = v3;
    id v35 = (id)[v33 addCompletionBlock:v42];
  }
  else
  {
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v36 = NSStringFromSelector(*(SEL *)(a1 + 56));
      int v37 = [*(id *)(a1 + 32) currentUser];
      uint64_t v38 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138414338;
      id v53 = WeakRetained;
      __int16 v54 = 2112;
      int v55 = v36;
      __int16 v56 = 1024;
      *(_DWORD *)BOOL v57 = v25;
      *(_WORD *)&v57[4] = 2112;
      *(void *)&v57[6] = v37;
      *(_WORD *)&v57[14] = 2112;
      *(void *)&v57[16] = v38;
      __int16 v58 = 1024;
      int v59 = v5;
      __int16 v60 = 1024;
      BOOL v61 = v23;
      __int16 v62 = 1024;
      int v63 = v22;
      __int16 v64 = 1024;
      int v65 = v41;
      _os_log_impl(&dword_1BE345000, v32, OS_LOG_TYPE_DEFAULT, "%@:%@: ---> Can show?: %{BOOL}d <--- because: user(%@) in home(%@):\n\t\thasHomePods = %{BOOL}d\n\t\thasHomePodOnSupportedLanguage = %{BOOL}d\n\t\thasPreviouslyDismissed = %{BOOL}d\n\t\tonboardingFromUserInput = %{BOOL}d", buf, 0x48u);
    }
    v33 = [NSNumber numberWithBool:v25];
    [v3 finishWithResult:v33];
  }
}

uint64_t __64__HULanguageSetupOnboardingFlow_needsOnboardingForHome_options___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 category];
  if (v4)
  {
    int v5 = (void *)v4;
    int v6 = [v3 category];
    uint64_t v7 = [v6 categoryType];
    if (v7)
    {
      id v8 = (void *)v7;
      id v9 = [v3 category];
      id v10 = [v9 categoryType];
      uint64_t v11 = [v10 length];

      if (v11)
      {
        uint64_t v12 = 0;
        goto LABEL_9;
      }
    }
    else
    {
    }
  }
  id v13 = HFLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v15 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v16 = 138412546;
    uint64_t v17 = v15;
    __int16 v18 = 2112;
    id v19 = v3;
    _os_log_error_impl(&dword_1BE345000, v13, OS_LOG_TYPE_ERROR, "%@ FOUND ACCESSORY WITH MISSING CATEGORY: %@ will fail hasHomePod checks if this is really a HomePod & it is the only one in the house.", (uint8_t *)&v16, 0x16u);
  }
  uint64_t v12 = 1;
LABEL_9:

  return v12;
}

void __64__HULanguageSetupOnboardingFlow_needsOnboardingForHome_options___block_invoke_73(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      uint64_t v17 = NSStringFromSelector(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 138412802;
      uint64_t v22 = v16;
      __int16 v23 = 2112;
      BOOL v24 = v17;
      __int16 v25 = 2112;
      *(void *)char v26 = v6;
      _os_log_error_impl(&dword_1BE345000, v7, OS_LOG_TYPE_ERROR, "%@:%@: atLeastOneHomePodHasLanguageSettingsForHomeFuture completed with error: %@", buf, 0x20u);
    }
  }
  id v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = *(void *)(a1 + 32);
    id v9 = NSStringFromSelector(*(SEL *)(a1 + 56));
    int v10 = *(unsigned __int8 *)(a1 + 64);
    uint64_t v11 = [*(id *)(a1 + 40) currentUser];
    uint64_t v12 = *(void *)(a1 + 40);
    int v13 = *(unsigned __int8 *)(a1 + 65);
    int v14 = *(unsigned __int8 *)(a1 + 66);
    int v18 = *(unsigned __int8 *)(a1 + 67);
    int v19 = *(unsigned __int8 *)(a1 + 68);
    int v15 = [v5 BOOLValue];
    *(_DWORD *)buf = 138414594;
    uint64_t v22 = v20;
    __int16 v23 = 2112;
    BOOL v24 = v9;
    __int16 v25 = 1024;
    *(_DWORD *)char v26 = v10;
    *(_WORD *)&v26[4] = 2112;
    *(void *)&v26[6] = v11;
    __int16 v27 = 2112;
    uint64_t v28 = v12;
    __int16 v29 = 1024;
    int v30 = v13;
    __int16 v31 = 1024;
    int v32 = v14;
    __int16 v33 = 1024;
    int v34 = v18;
    __int16 v35 = 1024;
    int v36 = v19;
    __int16 v37 = 1024;
    int v38 = v15;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%@:%@: ---> Can show?: %{BOOL}d <--- because: user(%@) in home(%@):\n\t\thasHomePods = %{BOOL}d\n\t\thasHomePodOnSupportedLanguage = %{BOOL}d\n\t\thasPreviouslyDismissed = %{BOOL}d\n\t\tonboardingFromUserInput = %{BOOL}d\n\t\tatLeastOneHomePodHasLanguageSettings = %{BOOL}d", buf, 0x4Eu);
  }
  [*(id *)(a1 + 48) finishWithResult:v5];
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (NAFuture)onboardingFuture
{
  return self->_onboardingFuture;
}

- (void)setOnboardingFuture:(id)a3
{
}

- (HUConfigurationViewController)initialViewController
{
  return self->_initialViewController;
}

- (void)setInitialViewController:(id)a3
{
}

- (NAFuture)readyFuture
{
  return self->_readyFuture;
}

- (void)setReadyFuture:(id)a3
{
}

- (BOOL)shouldAbortThisOnboardingFlowGroup
{
  return self->_shouldAbortThisOnboardingFlowGroup;
}

- (void)setShouldAbortThisOnboardingFlowGroup:(BOOL)a3
{
  self->_shouldAbortThisOnboardingFlowGroup = a3;
}

- (BOOL)shouldAbortAllOnboarding
{
  return self->_shouldAbortAllOnboarding;
}

- (void)setShouldAbortAllOnboarding:(BOOL)a3
{
  self->_shouldAbortAllOnboarding = a3;
}

- (BOOL)forceOnboardingFinishedForErrorRecovery
{
  return self->_forceOnboardingFinishedForErrorRecovery;
}

- (void)setForceOnboardingFinishedForErrorRecovery:(BOOL)a3
{
  self->_forceOnboardingFinishedForErrorRecovery = a3;
}

- (unint64_t)languageOnboardingFlowType
{
  return self->_languageOnboardingFlowType;
}

- (void)setLanguageOnboardingFlowType:(unint64_t)a3
{
  self->_languageOnboardingFlowType = a3;
}

- (NSDictionary)usageOptions
{
  return self->_usageOptions;
}

- (void)setUsageOptions:(id)a3
{
}

- (NSString)assistantDeviceIntendedRecognitionLanguage
{
  return self->_assistantDeviceIntendedRecognitionLanguage;
}

- (void)setAssistantDeviceIntendedRecognitionLanguage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assistantDeviceIntendedRecognitionLanguage, 0);
  objc_storeStrong((id *)&self->_usageOptions, 0);
  objc_storeStrong((id *)&self->_readyFuture, 0);
  objc_storeStrong((id *)&self->_initialViewController, 0);
  objc_storeStrong((id *)&self->_onboardingFuture, 0);

  objc_storeStrong((id *)&self->_home, 0);
}

@end