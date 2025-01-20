@interface HUVoiceProfileOnboardingFlow
+ (id)needsOnboardingForHome:(id)a3 options:(id)a4;
- (BOOL)initialCheckedResult;
- (BOOL)shouldAbortAllOnboarding;
- (BOOL)shouldAbortThisOnboardingFlowGroup;
- (HMHome)home;
- (HUConfigurationViewController)initialViewController;
- (HUVoiceProfileOnboardingFlow)initWithUsageOptions:(id)a3 home:(id)a4;
- (NAFuture)onboardingFuture;
- (NAFuture)readyFuture;
- (NSString)description;
- (NSString)initialCheckedLanguage;
- (id)processUserInput:(id)a3;
- (void)checkIfStillRequiredFromCurrentResults:(id)a3;
- (void)setHome:(id)a3;
- (void)setInitialCheckedLanguage:(id)a3;
- (void)setInitialCheckedResult:(BOOL)a3;
- (void)setInitialViewController:(id)a3;
- (void)setOnboardingFuture:(id)a3;
- (void)setReadyFuture:(id)a3;
- (void)setShouldAbortAllOnboarding:(BOOL)a3;
- (void)setShouldAbortThisOnboardingFlowGroup:(BOOL)a3;
@end

@implementation HUVoiceProfileOnboardingFlow

- (HUVoiceProfileOnboardingFlow)initWithUsageOptions:(id)a3 home:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HUVoiceProfileOnboardingFlow;
  v9 = [(HUVoiceProfileOnboardingFlow *)&v20 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a4);
    v11 = (NAFuture *)objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    readyFuture = v10->_readyFuture;
    v10->_readyFuture = v11;

    objc_initWeak(&location, v10);
    v13 = [(id)objc_opt_class() needsOnboardingForHome:v8 options:v7];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __58__HUVoiceProfileOnboardingFlow_initWithUsageOptions_home___block_invoke;
    v16[3] = &unk_1E638A370;
    v17 = v10;
    v18[1] = (id)a2;
    objc_copyWeak(v18, &location);
    id v14 = (id)[v13 addSuccessBlock:v16];

    objc_destroyWeak(v18);
    objc_destroyWeak(&location);
  }

  return v10;
}

void __58__HUVoiceProfileOnboardingFlow_initWithUsageOptions_home___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [v3 BOOLValue];
  v5 = (void *)MEMORY[0x1E4F7A0D8];
  if (v4)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __58__HUVoiceProfileOnboardingFlow_initWithUsageOptions_home___block_invoke_2;
    v11[3] = &unk_1E638A2F8;
    uint64_t v13 = *(void *)(a1 + 48);
    id v12 = *(id *)(a1 + 32);
    v6 = [v5 futureWithBlock:v11];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __58__HUVoiceProfileOnboardingFlow_initWithUsageOptions_home___block_invoke_6;
    v9[3] = &unk_1E638A348;
    objc_copyWeak(v10, (id *)(a1 + 40));
    v10[1] = *(id *)(a1 + 48);
    id v7 = (id)[v6 addCompletionBlock:v9];
    objc_destroyWeak(v10);
  }
  else
  {
    id v8 = [MEMORY[0x1E4F7A0D8] futureWithResult:MEMORY[0x1E4F1CC08]];
    [*(id *)(a1 + 32) setOnboardingFuture:v8];
  }
}

void __58__HUVoiceProfileOnboardingFlow_initWithUsageOptions_home___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = +[HUHomeFeatureOnboardingUtilities fetchSupportedVoiceRecognitionLanguages];
  if (!v4)
  {
    v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v15 = NSStringFromSelector(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 138412290;
      v19 = v15;
      _os_log_error_impl(&dword_1BE345000, v5, OS_LOG_TYPE_ERROR, "%@ Error fetching voice recognition languages", buf, 0xCu);
    }
  }
  BOOL v6 = +[HUHomeFeatureOnboardingUtilities isDeviceUsingASupportedVoiceRecognitionSiriLanguage:v4 shouldFallbackToBestSupportedLanguage:0];
  id v7 = [MEMORY[0x1E4F4E538] sharedPreferences];
  int v8 = [v7 assistantIsEnabled];

  if (!v6 || v8 == 0)
  {
    v10 = HFLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(void **)(a1 + 32);
      id v12 = NSStringFromSelector(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 138413058;
      v19 = v11;
      __int16 v20 = 2112;
      v21 = v12;
      __int16 v22 = 1024;
      BOOL v23 = v6;
      __int16 v24 = 1024;
      int v25 = v8;
      _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "%@:%@: This iOS device is on a supported voice recognition language?: %{BOOL}d, & Siri is enabled?: %{BOOL}d", buf, 0x22u);
    }
    [v3 finishWithResult:MEMORY[0x1E4F1CC28]];
  }
  else
  {
    uint64_t v13 = +[HUHomeFeatureOnboardingUtilities checkVoiceProfileAvailabiltyForLanguage:0];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __58__HUVoiceProfileOnboardingFlow_initWithUsageOptions_home___block_invoke_3;
    v16[3] = &unk_1E6386950;
    id v17 = v3;
    id v14 = (id)[v13 addSuccessBlock:v16];
  }
}

uint64_t __58__HUVoiceProfileOnboardingFlow_initWithUsageOptions_home___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithResult:a2];
}

void __58__HUVoiceProfileOnboardingFlow_initWithUsageOptions_home___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v6)
  {
    v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = NSStringFromSelector(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 138412802;
      id v31 = WeakRetained;
      __int16 v32 = 2112;
      v33 = v10;
      __int16 v34 = 2112;
      id v35 = v6;
      _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "%@:%@ Hey Siri Voice Profile Check FAILED with %@, will attempt to get Voice Profile from user", buf, 0x20u);
    }
    v11 = (void *)MEMORY[0x1E4F7A0D8];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __58__HUVoiceProfileOnboardingFlow_initWithUsageOptions_home___block_invoke_7;
    v28[3] = &unk_1E638A320;
    objc_copyWeak(&v29, v7);
    id v12 = [v11 futureWithBlock:v28];
    [WeakRetained setOnboardingFuture:v12];

    objc_destroyWeak(&v29);
  }
  else
  {
    uint64_t v13 = [MEMORY[0x1E4F4E538] sharedPreferences];
    id v14 = [v13 languageCode];
    [WeakRetained setInitialCheckedLanguage:v14];

    objc_opt_class();
    id v15 = v5;
    if (objc_opt_isKindOfClass()) {
      v16 = v15;
    }
    else {
      v16 = 0;
    }
    id v17 = v16;

    objc_msgSend(WeakRetained, "setInitialCheckedResult:", objc_msgSend(v17, "BOOLValue"));
    v18 = HFLogForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = NSStringFromSelector(*(SEL *)(a1 + 40));
      __int16 v20 = [WeakRetained initialCheckedLanguage];
      *(_DWORD *)buf = 138413058;
      id v31 = WeakRetained;
      __int16 v32 = 2112;
      v33 = v19;
      __int16 v34 = 2112;
      id v35 = v20;
      __int16 v36 = 1024;
      int v37 = [WeakRetained initialCheckedResult];
      _os_log_impl(&dword_1BE345000, v18, OS_LOG_TYPE_DEFAULT, "%@:%@ At init time, 'Hey Siri' Voice Profile was found for current language (%@)?: %{BOOL}d", buf, 0x26u);
    }
    v21 = (void *)MEMORY[0x1E4F7A0D8];
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    int v25 = __58__HUVoiceProfileOnboardingFlow_initWithUsageOptions_home___block_invoke_10;
    uint64_t v26 = &unk_1E638A320;
    objc_copyWeak(&v27, v7);
    __int16 v22 = [v21 futureWithBlock:&v23];
    objc_msgSend(WeakRetained, "setOnboardingFuture:", v22, v23, v24, v25, v26);

    objc_destroyWeak(&v27);
  }
}

void __58__HUVoiceProfileOnboardingFlow_initWithUsageOptions_home___block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [HUVoiceProfileSetupViewController alloc];
  v2 = [WeakRetained home];
  id v3 = [(HUVoiceProfileSetupViewController *)v1 initWithHome:v2];
  [WeakRetained setInitialViewController:v3];

  char v4 = [WeakRetained readyFuture];
  [v4 finishWithResult:MEMORY[0x1E4F1CC38]];
}

void __58__HUVoiceProfileOnboardingFlow_initWithUsageOptions_home___block_invoke_10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [HUVoiceProfileSetupViewController alloc];
  v2 = [WeakRetained home];
  id v3 = [(HUVoiceProfileSetupViewController *)v1 initWithHome:v2];
  [WeakRetained setInitialViewController:v3];

  char v4 = [WeakRetained readyFuture];
  [v4 finishWithResult:MEMORY[0x1E4F1CC38]];
}

- (void)checkIfStillRequiredFromCurrentResults:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 objectForKeyedSubscript:@"HULanguageOnboardingKey_PersonalDeviceSiriLanguageChanged_HasVoiceProfile"];
  if (!v6)
  {
    v9 = [v5 objectForKeyedSubscript:@"HULanguageOnboardingKey_PersonalDeviceSiriLanguageChanged_MissingVoiceProfile"];
    if (v9)
    {
      v10 = HFLogForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = NSStringFromSelector(a2);
        int v17 = 138413058;
        v18 = self;
        __int16 v19 = 2112;
        __int16 v20 = v11;
        __int16 v21 = 2112;
        __int16 v22 = v9;
        __int16 v23 = 2112;
        uint64_t v24 = self;
        _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "%@:%@ 'Hey Siri' Voice Profile for %@ needed, will run %@", (uint8_t *)&v17, 0x2Au);
LABEL_14:
      }
    }
    else
    {
      BOOL v12 = [(HUVoiceProfileOnboardingFlow *)self initialCheckedResult];
      v10 = HFLogForCategory();
      BOOL v13 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      if (v12)
      {
        if (v13)
        {
          id v14 = NSStringFromSelector(a2);
          id v15 = [(HUVoiceProfileOnboardingFlow *)self initialCheckedLanguage];
          int v17 = 138413058;
          v18 = self;
          __int16 v19 = 2112;
          __int16 v20 = v14;
          __int16 v21 = 2112;
          __int16 v22 = v15;
          __int16 v23 = 2112;
          uint64_t v24 = self;
          _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "%@:%@ As calculated at init time, the 'Hey Siri' Voice Profile for %@ already exists, will skip %@", (uint8_t *)&v17, 0x2Au);
        }
        v10 = [(HUVoiceProfileOnboardingFlow *)self onboardingFuture];
        [v10 finishWithNoResult];
        goto LABEL_15;
      }
      if (v13)
      {
        v11 = NSStringFromSelector(a2);
        v16 = [(HUVoiceProfileOnboardingFlow *)self initialCheckedLanguage];
        int v17 = 138413058;
        v18 = self;
        __int16 v19 = 2112;
        __int16 v20 = v11;
        __int16 v21 = 2112;
        __int16 v22 = v16;
        __int16 v23 = 2112;
        uint64_t v24 = self;
        _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "%@:%@ As calculated at init time, the 'Hey Siri' Voice Profile for %@ does not exist, will run %@", (uint8_t *)&v17, 0x2Au);

        goto LABEL_14;
      }
    }
LABEL_15:

    goto LABEL_16;
  }
  id v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = NSStringFromSelector(a2);
    int v17 = 138413058;
    v18 = self;
    __int16 v19 = 2112;
    __int16 v20 = v8;
    __int16 v21 = 2112;
    __int16 v22 = v6;
    __int16 v23 = 2112;
    uint64_t v24 = self;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ 'Hey Siri' Voice Profile for %@ already exists, will skip %@", (uint8_t *)&v17, 0x2Au);
  }
  v9 = [(HUVoiceProfileOnboardingFlow *)self onboardingFuture];
  [v9 finishWithNoResult];
LABEL_16:
}

- (NSString)description
{
  return (NSString *)@"Voice Recognition VOICE PROFILE Setup";
}

- (id)processUserInput:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 objectForKeyedSubscript:@"HUVoiceProfileOnboardingKey_UserInput"];
  id v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    __int16 v19 = self;
    __int16 v20 = 2112;
    __int16 v21 = v8;
    __int16 v22 = 2112;
    id v23 = v5;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ with input results: %@", buf, 0x20u);
  }
  if ([v6 integerValue] && objc_msgSend(v6, "integerValue") != 1)
  {
    int v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"HUVoiceProfileOnboardingFlow.m", 198, @"Invalid parameter not satisfying: %@", @"(userInputValue.integerValue == HUVoiceProfileOnboardingValue_SetupHeySiri_Completed) || (userInputValue.integerValue == HUVoiceProfileOnboardingValue_SetupHeySiri_Cancelled)" object file lineNumber description];
  }
  id v9 = objc_alloc(MEMORY[0x1E4F69710]);
  v10 = [(HUVoiceProfileOnboardingFlow *)self home];
  v11 = [(HUVoiceProfileOnboardingFlow *)self home];
  BOOL v12 = [v11 currentUser];
  BOOL v13 = (void *)[v9 initWithHome:v10 user:v12 nameStyle:0];

  if ([v13 hasDismissedVoiceProfileOnboarding]) {
    [NSNumber numberWithBool:1];
  }
  else {
  id v14 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "integerValue") == 0);
  }
  [v5 setObject:v14 forKeyedSubscript:@"HUHomeFeatureOnboardingKey_IdentifyVoice_DismissReminderBanner"];

  [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"HUHomeFeatureOnboardingKey_IdentifyVoice_FinishedOnboarding"];
  -[HUVoiceProfileOnboardingFlow setShouldAbortThisOnboardingFlowGroup:](self, "setShouldAbortThisOnboardingFlowGroup:", [v6 integerValue] == 1);
  id v15 = [(HUVoiceProfileOnboardingFlow *)self onboardingFuture];
  [v15 finishWithNoResult];

  return 0;
}

+ (id)needsOnboardingForHome:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (([MEMORY[0x1E4F69758] isAMac] & 1) != 0
    || [MEMORY[0x1E4F69758] isAVisionPro])
  {
    id v9 = [MEMORY[0x1E4F7A0D8] futureWithResult:MEMORY[0x1E4F1CC28]];
  }
  else
  {
    objc_initWeak(&location, a1);
    v10 = (void *)MEMORY[0x1E4F7A0D8];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __63__HUVoiceProfileOnboardingFlow_needsOnboardingForHome_options___block_invoke;
    v12[3] = &unk_1E638A3E0;
    objc_copyWeak(v15, &location);
    id v13 = v7;
    id v14 = v8;
    v15[1] = (id)a2;
    id v9 = [v10 futureWithBlock:v12];

    objc_destroyWeak(v15);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __63__HUVoiceProfileOnboardingFlow_needsOnboardingForHome_options___block_invoke(uint64_t a1, void *a2)
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
    v10 = [*(id *)(a1 + 32) accessories];
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __63__HUVoiceProfileOnboardingFlow_needsOnboardingForHome_options___block_invoke_2;
    v51[3] = &__block_descriptor_40_e21_B16__0__HMAccessory_8l;
    v51[4] = *(void *)(a1 + 56);
    int v11 = objc_msgSend(v10, "na_any:", v51);

    if (v11)
    {
      BOOL v12 = [MEMORY[0x1E4F69110] sharedHandler];
      id v13 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 50);
      [v12 handleError:v13 operationType:*MEMORY[0x1E4F687C0] options:0 retryBlock:0 cancelBlock:0];
    }
  }
  if ((v5 | v6) == 1)
  {
    id v14 = +[HUHomeFeatureOnboardingUtilities fetchSupportedVoiceRecognitionLanguages];
    id v15 = HFLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = NSStringFromSelector(*(SEL *)(a1 + 56));
      uint64_t v17 = [v14 count];
      *(_DWORD *)buf = 138413058;
      id v53 = WeakRetained;
      __int16 v54 = 2112;
      v55 = v16;
      __int16 v56 = 2048;
      *(void *)v57 = v17;
      *(_WORD *)&v57[8] = 2112;
      *(void *)&v57[10] = v14;
      _os_log_impl(&dword_1BE345000, v15, OS_LOG_TYPE_DEFAULT, "%@:%@ (%lu) supported voice recognition languages %@", buf, 0x2Au);
    }
    if (v14)
    {
      id v18 = objc_alloc(MEMORY[0x1E4F69710]);
      __int16 v19 = *(void **)(a1 + 32);
      __int16 v20 = [v19 currentUser];
      __int16 v21 = [v18 initWithHome:v19 user:v20 nameStyle:0];

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
      __int16 v21 = HFLogForCategory();
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
  uint64_t v26 = HFLogForCategory();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    id v27 = NSStringFromSelector(*(SEL *)(a1 + 56));
    *(_DWORD *)buf = 138412802;
    id v53 = WeakRetained;
    __int16 v54 = 2112;
    v55 = v27;
    __int16 v56 = 1024;
    *(_DWORD *)v57 = v6;
    _os_log_impl(&dword_1BE345000, v26, OS_LOG_TYPE_DEFAULT, "%@:%@: hasRMVCapableAppleTV = %{BOOL}d", buf, 0x1Cu);
  }
  v28 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  id v29 = [v28 homeManager];
  int v30 = [v29 hasOptedToHH2];

  id v31 = HFLogForCategory();
  __int16 v32 = v31;
  if ((v25 & v30) == 1 && v5)
  {
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      v39 = NSStringFromSelector(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 138412546;
      id v53 = WeakRetained;
      __int16 v54 = 2112;
      v55 = v39;
      _os_log_debug_impl(&dword_1BE345000, v32, OS_LOG_TYPE_DEBUG, "%@:%@: [HH2] Will check for atLeastOneHomePodHasLanguageSettingsForHomeFuture", buf, 0x16u);
    }
    v33 = +[HUHomeFeatureOnboardingUtilities atLeastOneHomePodHasLanguageSettingsForHomeFuture:*(void *)(a1 + 32)];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __63__HUVoiceProfileOnboardingFlow_needsOnboardingForHome_options___block_invoke_31;
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
      __int16 v36 = NSStringFromSelector(*(SEL *)(a1 + 56));
      int v37 = [*(id *)(a1 + 32) currentUser];
      uint64_t v38 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138414338;
      id v53 = WeakRetained;
      __int16 v54 = 2112;
      v55 = v36;
      __int16 v56 = 1024;
      *(_DWORD *)v57 = v25;
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

uint64_t __63__HUVoiceProfileOnboardingFlow_needsOnboardingForHome_options___block_invoke_2(uint64_t a1, void *a2)
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
      v10 = [v9 categoryType];
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
    id v15 = NSStringFromSelector(*(SEL *)(a1 + 32));
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

void __63__HUVoiceProfileOnboardingFlow_needsOnboardingForHome_options___block_invoke_31(uint64_t a1, void *a2, void *a3)
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
      *(void *)uint64_t v26 = v6;
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
    *(_DWORD *)uint64_t v26 = v10;
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

- (NSString)initialCheckedLanguage
{
  return self->_initialCheckedLanguage;
}

- (void)setInitialCheckedLanguage:(id)a3
{
}

- (BOOL)initialCheckedResult
{
  return self->_initialCheckedResult;
}

- (void)setInitialCheckedResult:(BOOL)a3
{
  self->_initialCheckedResult = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialCheckedLanguage, 0);
  objc_storeStrong((id *)&self->_readyFuture, 0);
  objc_storeStrong((id *)&self->_initialViewController, 0);
  objc_storeStrong((id *)&self->_onboardingFuture, 0);

  objc_storeStrong((id *)&self->_home, 0);
}

@end