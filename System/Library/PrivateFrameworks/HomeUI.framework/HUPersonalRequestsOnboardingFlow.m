@interface HUPersonalRequestsOnboardingFlow
+ (id)needsOnboardingForHome:(id)a3 options:(id)a4;
- (BOOL)shouldAbortAllOnboarding;
- (BOOL)shouldAbortThisOnboardingFlowGroup;
- (HMHome)home;
- (HUConfigurationViewController)initialViewController;
- (HUPersonalRequestsOnboardingFlow)initWithUsageOptions:(id)a3 home:(id)a4;
- (NAFuture)onboardingFuture;
- (NSString)description;
- (id)processUserInput:(id)a3;
- (void)setHome:(id)a3;
- (void)setInitialViewController:(id)a3;
- (void)setOnboardingFuture:(id)a3;
- (void)setShouldAbortAllOnboarding:(BOOL)a3;
- (void)setShouldAbortThisOnboardingFlowGroup:(BOOL)a3;
@end

@implementation HUPersonalRequestsOnboardingFlow

- (HUPersonalRequestsOnboardingFlow)initWithUsageOptions:(id)a3 home:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HUPersonalRequestsOnboardingFlow;
  v8 = [(HUPersonalRequestsOnboardingFlow *)&v17 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_home, a4);
    objc_initWeak(&location, v9);
    v10 = [(id)objc_opt_class() needsOnboardingForHome:v7 options:v6];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __62__HUPersonalRequestsOnboardingFlow_initWithUsageOptions_home___block_invoke;
    v14[3] = &unk_1E6386D40;
    objc_copyWeak(&v15, &location);
    uint64_t v11 = [v10 flatMap:v14];
    onboardingFuture = v9->_onboardingFuture;
    v9->_onboardingFuture = (NAFuture *)v11;

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v9;
}

id __62__HUPersonalRequestsOnboardingFlow_initWithUsageOptions_home___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)MEMORY[0x1E4F7A0D8];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__HUPersonalRequestsOnboardingFlow_initWithUsageOptions_home___block_invoke_2;
  v8[3] = &unk_1E6386D18;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  id v5 = v3;
  id v9 = v5;
  id v6 = [v4 futureWithBlock:v8];

  objc_destroyWeak(&v10);

  return v6;
}

void __62__HUPersonalRequestsOnboardingFlow_initWithUsageOptions_home___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ([*(id *)(a1 + 32) BOOLValue])
  {
    v4 = [HUPersonalRequestsSetupViewController alloc];
    id v5 = [WeakRetained home];
    id v6 = [(HUPersonalRequestsSetupViewController *)v4 initWithHome:v5];
    [WeakRetained setInitialViewController:v6];
  }
  else
  {
    [v7 finishWithNoResult];
  }
}

- (NSString)description
{
  return (NSString *)@"Personal Requests Setup";
}

- (id)processUserInput:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 objectForKeyedSubscript:@"HUPersonalRequestsOnboardingKey_UserInput"];
  id v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    int v14 = 138412802;
    id v15 = self;
    __int16 v16 = 2112;
    objc_super v17 = v8;
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ with input results: %@", (uint8_t *)&v14, 0x20u);
  }
  if ([v6 integerValue] == 1)
  {
    id v9 = [HUPersonalRequestsCustomizeViewController alloc];
    id v10 = [v5 objectForKeyedSubscript:@"HUPersonalRequestsOnboardingKey_FMFDevice"];
    uint64_t v11 = [(HUPersonalRequestsOnboardingFlow *)self home];
    v12 = [(HUPersonalRequestsCustomizeViewController *)v9 initWithLocationDevice:v10 home:v11];
  }
  else
  {
    if ([v6 integerValue] != 2
      && [v6 integerValue] != 3
      && [v6 integerValue])
    {
      v12 = 0;
      goto LABEL_11;
    }
    id v10 = [(HUPersonalRequestsOnboardingFlow *)self onboardingFuture];
    [v10 finishWithNoResult];
    v12 = 0;
  }

LABEL_11:

  return v12;
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
    id v10 = (void *)MEMORY[0x1E4F7A0D8];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __67__HUPersonalRequestsOnboardingFlow_needsOnboardingForHome_options___block_invoke;
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

void __67__HUPersonalRequestsOnboardingFlow_needsOnboardingForHome_options___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  int v5 = objc_msgSend(*(id *)(a1 + 32), "hf_hasHomePods");
  unint64_t v6 = 0x1E4F28000uLL;
  objc_opt_class();
  id v7 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"OnboardingDisplayOption_OnboardingFromUserInput"];
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  int v34 = [v9 BOOLValue];
  if ([MEMORY[0x1E4F69758] isInternalInstall])
  {
    id v10 = [*(id *)(a1 + 32) accessories];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __67__HUPersonalRequestsOnboardingFlow_needsOnboardingForHome_options___block_invoke_2;
    v36[3] = &__block_descriptor_40_e21_B16__0__HMAccessory_8l;
    v36[4] = *(void *)(a1 + 56);
    int v11 = objc_msgSend(v10, "na_any:", v36);

    if (v11)
    {
      v12 = [MEMORY[0x1E4F69110] sharedHandler];
      id v13 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 50);
      [v12 handleError:v13 operationType:*MEMORY[0x1E4F687C0] options:0 retryBlock:0 cancelBlock:0];
    }
  }
  if (v5)
  {
    id v14 = +[HUHomeFeatureOnboardingUtilities fetchSupportedVoiceRecognitionLanguages];
    id v15 = HFLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v16 = NSStringFromSelector(*(SEL *)(a1 + 56));
      uint64_t v17 = [v14 count];
      *(_DWORD *)buf = 138413058;
      id v38 = WeakRetained;
      __int16 v39 = 2112;
      v40 = v16;
      __int16 v41 = 2048;
      *(void *)v42 = v17;
      *(_WORD *)&v42[8] = 2112;
      *(void *)&v42[10] = v14;
      _os_log_impl(&dword_1BE345000, v15, OS_LOG_TYPE_DEFAULT, "%@:%@ (%lu) supported voice recognition languages %@", buf, 0x2Au);
    }
    if (v14)
    {
      id v18 = objc_alloc(MEMORY[0x1E4F69710]);
      id v19 = *(void **)(a1 + 32);
      uint64_t v20 = [v19 currentUser];
      v21 = [v18 initWithHome:v19 user:v20 nameStyle:0];

      int v22 = [v21 hasDismissedVoiceProfileOnboarding];
      BOOL v23 = (v22 & 1) == 0
         && +[HUHomeFeatureOnboardingUtilities home:*(void *)(a1 + 32) hasSomeHomePodsOnSupportedVoiceRecognitionLanguages:v14];
      unint64_t v6 = 0x1E4F28000uLL;
      uint64_t v24 = v34 | v23;
    }
    else
    {
      v21 = HFLogForCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v33 = NSStringFromSelector(*(SEL *)(a1 + 56));
        *(_DWORD *)buf = 138412290;
        id v38 = v33;
        _os_log_error_impl(&dword_1BE345000, v21, OS_LOG_TYPE_ERROR, "%@ Error fetching voice recognition languages", buf, 0xCu);
      }
      BOOL v23 = 0;
      int v22 = 0;
      uint64_t v24 = 0;
      unint64_t v6 = 0x1E4F28000;
    }
  }
  else
  {
    BOOL v23 = 0;
    int v22 = 0;
    uint64_t v24 = 0;
  }
  v25 = HFLogForCategory();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v27 = [*(id *)(a1 + 32) currentUser];
    int v28 = v5;
    unint64_t v29 = v6;
    v30 = (void *)v27;
    uint64_t v31 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138414338;
    id v38 = WeakRetained;
    __int16 v39 = 2112;
    v40 = v26;
    __int16 v41 = 1024;
    *(_DWORD *)v42 = v24;
    *(_WORD *)&v42[4] = 2112;
    *(void *)&v42[6] = v27;
    *(_WORD *)&v42[14] = 2112;
    *(void *)&v42[16] = v31;
    __int16 v43 = 1024;
    int v44 = v28;
    __int16 v45 = 1024;
    BOOL v46 = v23;
    __int16 v47 = 1024;
    int v48 = v22;
    __int16 v49 = 1024;
    int v50 = v34;
    _os_log_impl(&dword_1BE345000, v25, OS_LOG_TYPE_DEFAULT, "%@:%@: ---> Can show?: %{BOOL}d <--- because: user(%@) in home(%@):\n\t\thasHomePods = %{BOOL}d\n\t\thasHomePodOnSupportedLanguage = %{BOOL}d\n\t\thasPreviouslyDismissed = %{BOOL}d\n\t\tonboardingFromUserInput = %{BOOL}d", buf, 0x48u);

    unint64_t v6 = v29;
  }

  v32 = [*(id *)(v6 + 3792) numberWithBool:v24];
  [v4 finishWithResult:v32];
}

uint64_t __67__HUPersonalRequestsOnboardingFlow_needsOnboardingForHome_options___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 category];
  if (v4)
  {
    int v5 = (void *)v4;
    unint64_t v6 = [v3 category];
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialViewController, 0);
  objc_storeStrong((id *)&self->_onboardingFuture, 0);

  objc_storeStrong((id *)&self->_home, 0);
}

@end