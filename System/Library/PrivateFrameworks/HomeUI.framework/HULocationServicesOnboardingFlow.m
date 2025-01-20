@interface HULocationServicesOnboardingFlow
+ (id)needsOnboardingForHome:(id)a3 options:(id)a4;
- (BOOL)shouldAbortAllOnboarding;
- (BOOL)shouldAbortThisOnboardingFlowGroup;
- (HMHome)home;
- (HUConfigurationViewController)initialViewController;
- (HULocationServicesOnboardingFlow)initWithUsageOptions:(id)a3 home:(id)a4;
- (NAFuture)onboardingFuture;
- (NAFuture)readyFuture;
- (NSString)description;
- (id)processUserInput:(id)a3;
- (void)setHome:(id)a3;
- (void)setInitialViewController:(id)a3;
- (void)setOnboardingFuture:(id)a3;
- (void)setReadyFuture:(id)a3;
- (void)setShouldAbortAllOnboarding:(BOOL)a3;
- (void)setShouldAbortThisOnboardingFlowGroup:(BOOL)a3;
@end

@implementation HULocationServicesOnboardingFlow

- (HULocationServicesOnboardingFlow)initWithUsageOptions:(id)a3 home:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)HULocationServicesOnboardingFlow;
  v8 = [(HULocationServicesOnboardingFlow *)&v19 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_home, a4);
    objc_initWeak(&location, v9);
    v10 = (NAFuture *)objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    readyFuture = v9->_readyFuture;
    v9->_readyFuture = v10;

    v12 = [(id)objc_opt_class() needsOnboardingForHome:v7 options:v6];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __62__HULocationServicesOnboardingFlow_initWithUsageOptions_home___block_invoke;
    v16[3] = &unk_1E6386D40;
    objc_copyWeak(&v17, &location);
    uint64_t v13 = [v12 flatMap:v16];
    onboardingFuture = v9->_onboardingFuture;
    v9->_onboardingFuture = (NAFuture *)v13;

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v9;
}

id __62__HULocationServicesOnboardingFlow_initWithUsageOptions_home___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)MEMORY[0x1E4F7A0D8];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__HULocationServicesOnboardingFlow_initWithUsageOptions_home___block_invoke_2;
  v8[3] = &unk_1E6386D18;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  id v5 = v3;
  id v9 = v5;
  id v6 = [v4 futureWithBlock:v8];

  objc_destroyWeak(&v10);

  return v6;
}

void __62__HULocationServicesOnboardingFlow_initWithUsageOptions_home___block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ([*(id *)(a1 + 32) BOOLValue])
  {
    v4 = [HULocationServicesSetupViewController alloc];
    id v5 = [WeakRetained home];
    id v6 = [(HULocationServicesSetupViewController *)v4 initWithHome:v5];
    [WeakRetained setInitialViewController:v6];

    id v7 = [WeakRetained readyFuture];
    [v7 finishWithResult:MEMORY[0x1E4F1CC38]];
  }
  else
  {
    [v8 finishWithNoResult];
  }
}

- (NSString)description
{
  return (NSString *)@"Location Services Setup";
}

- (id)processUserInput:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 objectForKeyedSubscript:@"HULocationServicesOnboardingKey_UserInput"];
  id v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    v16 = self;
    __int16 v17 = 2112;
    v18 = v8;
    __int16 v19 = 2112;
    id v20 = v5;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ with input results: %@", buf, 0x20u);
  }
  if ([v6 integerValue] && objc_msgSend(v6, "integerValue") != 1)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HULocationServicesOnboardingFlow.m", 75, @"Invalid parameter not satisfying: %@", @"(userInputValue.integerValue == HULocationServicesOnboardingValue_Enable) || (userInputValue.integerValue == HULocationServicesOnboardingValue_Disable)" object file lineNumber description];
  }
  if (![v6 integerValue] || objc_msgSend(v6, "integerValue") == 1)
  {
    BOOL v9 = [v6 integerValue] == 0;
    id v10 = [(HULocationServicesOnboardingFlow *)self home];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __53__HULocationServicesOnboardingFlow_processUserInput___block_invoke;
    v14[3] = &unk_1E6386978;
    v14[4] = self;
    v14[5] = a2;
    [v10 updateLocationServicesEnabled:v9 completion:v14];

    [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"HUHomeFeatureOnboardingKey_LocationServices_FinishedOnboarding"];
    v11 = [(HULocationServicesOnboardingFlow *)self onboardingFuture];
    [v11 finishWithNoResult];
  }
  return 0;
}

void __53__HULocationServicesOnboardingFlow_processUserInput___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = NSStringFromSelector(*(SEL *)(a1 + 40));
    id v7 = (void *)v6;
    id v8 = @"Failed";
    int v9 = 138413058;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    if (!v3) {
      id v8 = @"Succeeded";
    }
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    v14 = v8;
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@: Location Services Onboarding %@. Error (%@)", (uint8_t *)&v9, 0x2Au);
  }
}

+ (id)needsOnboardingForHome:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_initWeak(&location, a1);
  int v9 = (void *)MEMORY[0x1E4F7A0D8];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__HULocationServicesOnboardingFlow_needsOnboardingForHome_options___block_invoke;
  v13[3] = &unk_1E6385138;
  objc_copyWeak(v15, &location);
  id v10 = v7;
  id v14 = v10;
  v15[1] = (id)a2;
  __int16 v11 = [v9 futureWithBlock:v13];

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

  return v11;
}

void __67__HULocationServicesOnboardingFlow_needsOnboardingForHome_options___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  int v6 = [*(id *)(a1 + 32) didOnboardLocationServices];
  id v7 = objc_msgSend(*(id *)(a1 + 32), "hf_allHomePodProfileContainers");
  int v8 = objc_msgSend(v7, "na_any:", &__block_literal_global_30);
  int v9 = [*(id *)(a1 + 32) accessories];
  int v10 = objc_msgSend(v9, "na_any:", &__block_literal_global_28);

  uint64_t v11 = 0;
  if (objc_msgSend(*(id *)(a1 + 32), "hf_currentUserIsAdministrator")
    && (v6 & 1) == 0
    && (v8 & 1) == 0
    && v10)
  {
    uint64_t v11 = [*(id *)(a1 + 32) isLocationServicesEnabled] ^ 1;
  }
  uint64_t v12 = HFLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    id v18 = v4;
    v14 = id v13 = WeakRetained;
    __int16 v15 = [*(id *)(a1 + 32) currentUser];
    id v16 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138414338;
    id v20 = v13;
    __int16 v21 = 2112;
    v22 = v14;
    __int16 v23 = 1024;
    int v24 = v11;
    __int16 v25 = 2112;
    v26 = v15;
    __int16 v27 = 2112;
    v28 = v16;
    __int16 v29 = 1024;
    int v30 = v6;
    __int16 v31 = 1024;
    int v32 = v8;
    __int16 v33 = 1024;
    int v34 = v10;
    __int16 v35 = 1024;
    int v36 = [v16 isLocationServicesEnabled];
    _os_log_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEFAULT, "%@:%@: ---> %{BOOL}d <--- because: user(%@) in home(%@):\n\t\thasPreviouslyDismissed = %{BOOL}d, hasAtleastOneHomePodWithLocationServicesEnabled = %{BOOL}d , atLeastOneDeviceSupportsHomeLevelLocationServicesSetting = %{BOOL}d, home.locationServicesEnabled = %{BOOL}d", buf, 0x48u);

    id WeakRetained = v13;
    id v4 = v18;
  }

  uint64_t v17 = [NSNumber numberWithBool:v11];
  [v4 finishWithResult:v17];
}

uint64_t __67__HULocationServicesOnboardingFlow_needsOnboardingForHome_options___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_msgSend(v2, "hf_settingsValueManager");
  id v4 = [v2 settings];

  uint64_t v5 = objc_msgSend(v4, "hf_accessorySettingAtKeyPath:", *MEMORY[0x1E4F68578]);

  objc_opt_class();
  int v6 = [v3 valueForSetting:v5];
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  if (v8) {
    uint64_t v9 = [v8 BOOLValue];
  }
  else {
    uint64_t v9 = 0;
  }

  return v9;
}

uint64_t __67__HULocationServicesOnboardingFlow_needsOnboardingForHome_options___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 supportsHomeLevelLocationServiceSetting];
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readyFuture, 0);
  objc_storeStrong((id *)&self->_initialViewController, 0);
  objc_storeStrong((id *)&self->_onboardingFuture, 0);

  objc_storeStrong((id *)&self->_home, 0);
}

@end