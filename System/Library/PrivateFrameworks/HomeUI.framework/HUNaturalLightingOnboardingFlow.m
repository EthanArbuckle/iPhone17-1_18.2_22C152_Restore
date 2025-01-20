@interface HUNaturalLightingOnboardingFlow
+ (BOOL)home:(id)a3 canShowNaturalLightingOnboardingWithUsageOptions:(id)a4;
+ (id)needsOnboardingForHome:(id)a3 options:(id)a4;
- (BOOL)shouldAbortAllOnboarding;
- (BOOL)shouldAbortThisOnboardingFlowGroup;
- (HMHome)home;
- (HUConfigurationViewController)initialViewController;
- (HUConfigurationViewController)setupViewController;
- (HUNaturalLightingOnboardingFlow)initWithUsageOptions:(id)a3 home:(id)a4;
- (NAFuture)onboardingFuture;
- (NSString)description;
- (id)processUserInput:(id)a3;
- (void)setHome:(id)a3;
- (void)setInitialViewController:(id)a3;
- (void)setOnboardingFuture:(id)a3;
- (void)setSetupViewController:(id)a3;
- (void)setShouldAbortAllOnboarding:(BOOL)a3;
- (void)setShouldAbortThisOnboardingFlowGroup:(BOOL)a3;
@end

@implementation HUNaturalLightingOnboardingFlow

+ (BOOL)home:(id)a3 canShowNaturalLightingOnboardingWithUsageOptions:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = objc_msgSend(v7, "hf_allLightProfilesSupportingNaturalLighting");
  uint64_t v10 = [v9 count];

  v11 = objc_msgSend(v7, "hf_accessoriesSupportingNaturalLighting");
  int v12 = objc_msgSend(v11, "na_any:", &__block_literal_global_24);

  int v13 = objc_msgSend(v7, "hf_enabledResidentsSupportsNaturalLight");
  id v14 = objc_alloc(MEMORY[0x1E4F69710]);
  v15 = [v7 currentUser];
  v16 = (void *)[v14 initWithHome:v7 user:v15 nameStyle:0];

  int v17 = objc_msgSend(v7, "hf_currentUserIsAdministrator");
  int v29 = [v16 hasDismissedNaturalLightingOnboarding];
  v18 = [v8 objectForKeyedSubscript:@"OnboardingDisplayOption_OnboardingFromUserInput"];

  int v19 = [v18 BOOLValue];
  int v28 = v13;
  if (v10 && v13 && v12 && v17 && ((v29 ^ 1 | v19) & 1) != 0) {
    int v20 = 1;
  }
  else {
    int v20 = HFForceNaturalLightingOnboarding();
  }
  v21 = HFLogForCategory();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v27 = v16;
    int v22 = v12;
    BOOL v23 = v10 != 0;
    v24 = NSStringFromSelector(a2);
    if (v20) {
      v25 = @"Can";
    }
    else {
      v25 = @"Cannot";
    }
    *(_DWORD *)buf = 138414850;
    id v31 = a1;
    __int16 v32 = 2112;
    v33 = v24;
    __int16 v34 = 2112;
    v35 = v25;
    __int16 v36 = 2112;
    id v37 = v7;
    __int16 v38 = 1024;
    BOOL v39 = v23;
    __int16 v40 = 1024;
    int v41 = v28;
    __int16 v42 = 1024;
    int v43 = v17;
    __int16 v44 = 1024;
    int v45 = v22;
    v16 = v27;
    __int16 v46 = 1024;
    int v47 = v19;
    __int16 v48 = 1024;
    int v49 = v29;
    __int16 v50 = 1024;
    int v51 = HFForceNaturalLightingOnboarding();
    _os_log_impl(&dword_1BE345000, v21, OS_LOG_TYPE_DEFAULT, "%@:%@: %@ show because: home(%@):\n\t\thasCompatibleLights = %{BOOL}d\n\t\thasCapableResident = %{BOOL}d\n\t\tuserAllowedToEdit = %{BOOL}d\n\t\tsomeAccessoriesNotOnboarded = %{BOOL}d\n\t\tonboardingFromUserInput = %{BOOL}d\n\t\thasPreviouslyDismissed = %{BOOL}d\n\t\tHFForceNaturalLighting = %{BOOL}d", buf, 0x54u);
  }
  return v20;
}

void __66__HUNaturalLightingOnboardingFlow_needsOnboardingForHome_options___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  BOOL v5 = +[HUNaturalLightingOnboardingFlow home:v2 canShowNaturalLightingOnboardingWithUsageOptions:v3];
  id v6 = [NSNumber numberWithBool:v5];
  [v4 finishWithResult:v6];
}

+ (id)needsOnboardingForHome:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F7A0D8];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__HUNaturalLightingOnboardingFlow_needsOnboardingForHome_options___block_invoke;
  v12[3] = &unk_1E6385D90;
  id v13 = v5;
  id v14 = v6;
  id v8 = v6;
  id v9 = v5;
  uint64_t v10 = [v7 futureWithBlock:v12];

  return v10;
}

- (HUNaturalLightingOnboardingFlow)initWithUsageOptions:(id)a3 home:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HUNaturalLightingOnboardingFlow;
  id v8 = [(HUNaturalLightingOnboardingFlow *)&v18 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_home, a4);
    objc_initWeak(&location, v9);
    uint64_t v10 = [(id)objc_opt_class() needsOnboardingForHome:v7 options:v6];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __61__HUNaturalLightingOnboardingFlow_initWithUsageOptions_home___block_invoke;
    v14[3] = &unk_1E6386CE8;
    objc_copyWeak(&v16, &location);
    id v15 = v6;
    uint64_t v11 = [v10 flatMap:v14];
    onboardingFuture = v9->_onboardingFuture;
    v9->_onboardingFuture = (NAFuture *)v11;

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v9;
}

id __61__HUNaturalLightingOnboardingFlow_initWithUsageOptions_home___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  char v6 = [v4 BOOLValue];

  id v7 = [WeakRetained home];
  id v8 = objc_msgSend(v7, "hf_homeKitObjectsSupportingNaturalLighting");
  id v9 = objc_msgSend(v8, "na_filter:", &__block_literal_global_194);

  if ([v9 count]) {
    char v10 = v6;
  }
  else {
    char v10 = 0;
  }
  uint64_t v11 = (void *)MEMORY[0x1E4F7A0D8];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __61__HUNaturalLightingOnboardingFlow_initWithUsageOptions_home___block_invoke_3;
  v15[3] = &unk_1E63864C8;
  char v18 = v10;
  id v16 = *(id *)(a1 + 32);
  id v17 = WeakRetained;
  id v12 = WeakRetained;
  id v13 = [v11 futureWithBlock:v15];

  return v13;
}

BOOL __61__HUNaturalLightingOnboardingFlow_initWithUsageOptions_home___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[HUNaturalLightingSetupModule showNaturalLightingContainingHomeKitObject:a2];
}

void __61__HUNaturalLightingOnboardingFlow_initWithUsageOptions_home___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v10 = v3;
  if (*(unsigned char *)(a1 + 48))
  {
    id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"OnboardingDisplayOption_OnboardingFromNaturalLightingReminder"];
    int v5 = [v4 BOOLValue];

    if (v5)
    {
      char v6 = [*(id *)(a1 + 40) setupViewController];
      [*(id *)(a1 + 40) setInitialViewController:v6];
    }
    else
    {
      id v7 = [HUNaturalLightingTitleViewController alloc];
      id v8 = [*(id *)(a1 + 40) home];
      id v9 = [(HUNaturalLightingTitleViewController *)v7 initWithHome:v8];
      [*(id *)(a1 + 40) setInitialViewController:v9];
    }
  }
  else
  {
    [v3 finishWithNoResult];
  }
}

- (NSString)description
{
  return (NSString *)@"Natural Lighting Setup";
}

- (HUConfigurationViewController)setupViewController
{
  setupViewController = self->_setupViewController;
  if (!setupViewController)
  {
    id v4 = [HUNaturalLightingSetupViewController alloc];
    int v5 = [(HUNaturalLightingOnboardingFlow *)self home];
    char v6 = [(HUNaturalLightingSetupViewController *)v4 initWithHome:v5];
    id v7 = self->_setupViewController;
    self->_setupViewController = v6;

    setupViewController = self->_setupViewController;
  }

  return setupViewController;
}

- (id)processUserInput:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  char v6 = [v5 objectForKeyedSubscript:@"HUNaturalLightingOnboardingKey_UserInput"];
  id v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    id v16 = self;
    __int16 v17 = 2112;
    char v18 = v8;
    __int16 v19 = 2112;
    id v20 = v5;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ with input results: %@", buf, 0x20u);
  }
  if ([v6 integerValue]
    && [v6 integerValue] != 1
    && [v6 integerValue] != 2)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"HUNaturalLightingOnboardingFlow.m", 87, @"Invalid parameter not satisfying: %@", @"(userInputValue.integerValue == HUNaturalLightingOnboardingValue_ShowSetupNext) || (userInputValue.integerValue == HUNaturalLightingOnboardingValue_SetupComplete) || (userInputValue.integerValue == HUNaturalLightingOnboardingValue_DontSetup)" object file lineNumber description];
  }
  if ([v6 integerValue]
    || ([(HUNaturalLightingOnboardingFlow *)self home],
        id v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = objc_msgSend(v9, "hf_currentUserIsAdministrator"),
        v9,
        !v10))
  {
    [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"HUHomeFeatureOnboardingKey_NaturalLighting_FinishedOnboarding"];
    id v12 = [(HUNaturalLightingOnboardingFlow *)self onboardingFuture];
    [v12 finishWithNoResult];

    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v11 = [(HUNaturalLightingOnboardingFlow *)self setupViewController];
  }

  return v11;
}

uint64_t __89__HUNaturalLightingOnboardingFlow_home_canShowNaturalLightingOnboardingWithUsageOptions___block_invoke(uint64_t a1, void *a2)
{
  return [a2 hasOnboardedForNaturalLighting] ^ 1;
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

- (void)setSetupViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupViewController, 0);
  objc_storeStrong((id *)&self->_initialViewController, 0);
  objc_storeStrong((id *)&self->_onboardingFuture, 0);

  objc_storeStrong((id *)&self->_home, 0);
}

@end