@interface HUHomeTheaterOnboardingFlow
+ (id)needsOnboardingForHome:(id)a3 options:(id)a4;
- (BOOL)shouldAbortAllOnboarding;
- (BOOL)shouldAbortThisOnboardingFlowGroup;
- (HMHome)home;
- (HUConfigurationViewController)initialViewController;
- (HUHomeTheaterOnboardingFlow)initWithUsageOptions:(id)a3 home:(id)a4;
- (NAFuture)onboardingFuture;
- (NSArray)appleTVs;
- (NSString)description;
- (id)processUserInput:(id)a3;
- (id)viewControllerForAccessory:(id)a3;
- (void)setAppleTVs:(id)a3;
- (void)setHome:(id)a3;
- (void)setInitialViewController:(id)a3;
- (void)setOnboardingFuture:(id)a3;
- (void)setShouldAbortAllOnboarding:(BOOL)a3;
- (void)setShouldAbortThisOnboardingFlowGroup:(BOOL)a3;
@end

@implementation HUHomeTheaterOnboardingFlow

- (HUHomeTheaterOnboardingFlow)initWithUsageOptions:(id)a3 home:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)HUHomeTheaterOnboardingFlow;
  v8 = [(HUHomeTheaterOnboardingFlow *)&v19 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_home, a4);
    uint64_t v10 = objc_msgSend(v7, "hf_appleTVsSupportingHomeTheater");
    appleTVs = v9->_appleTVs;
    v9->_appleTVs = (NSArray *)v10;

    v12 = [(id)objc_opt_class() needsOnboardingForHome:v7 options:v6];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __57__HUHomeTheaterOnboardingFlow_initWithUsageOptions_home___block_invoke;
    v17[3] = &unk_1E6385648;
    v13 = v9;
    v18 = v13;
    uint64_t v14 = [v12 flatMap:v17];
    onboardingFuture = v13->_onboardingFuture;
    v13->_onboardingFuture = (NAFuture *)v14;
  }
  return v9;
}

id __57__HUHomeTheaterOnboardingFlow_initWithUsageOptions_home___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)MEMORY[0x1E4F7A0D8];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__HUHomeTheaterOnboardingFlow_initWithUsageOptions_home___block_invoke_2;
  v8[3] = &unk_1E6385D90;
  id v9 = v3;
  id v10 = *(id *)(a1 + 32);
  id v5 = v3;
  id v6 = [v4 futureWithBlock:v8];

  return v6;
}

void __57__HUHomeTheaterOnboardingFlow_initWithUsageOptions_home___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([*(id *)(a1 + 32) BOOLValue])
  {
    id v3 = [*(id *)(a1 + 40) appleTVs];
    v4 = [v3 firstObject];

    id v5 = [*(id *)(a1 + 40) viewControllerForAccessory:v4];
    [*(id *)(a1 + 40) setInitialViewController:v5];
  }
  else
  {
    [v6 finishWithNoResult];
  }
}

- (NSString)description
{
  return (NSString *)@"Home Theater Setup";
}

- (id)viewControllerForAccessory:(id)a3
{
  id v4 = a3;
  id v5 = [v4 audioDestinationController];
  id v6 = [v5 availableDestinations];
  uint64_t v7 = [v6 count];

  if (v7 == 1)
  {
    v8 = [v4 audioDestinationController];
    id v9 = [v8 availableDestinations];
    id v10 = [v9 firstObject];

    v11 = [HUHomeTheaterSimpleSetupViewController alloc];
    uint64_t v12 = [(HUHomeTheaterOnboardingFlow *)self home];
    v13 = [(HUHomeTheaterSimpleSetupViewController *)v11 initWithAppleTVAccessory:v4 destination:v10 inHome:v12];

    id v4 = (id)v12;
  }
  else
  {
    uint64_t v14 = [HUHomeTheaterSetupViewController alloc];
    id v10 = [(HUHomeTheaterOnboardingFlow *)self home];
    v13 = [(HUHomeTheaterSetupViewController *)v14 initWithAppleTVAccessory:v4 inHome:v10];
  }

  return v13;
}

- (id)processUserInput:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 objectForKeyedSubscript:@"HUHomeTheaterOnboardingKey_UserInput"];
  uint64_t v7 = [v5 objectForKeyedSubscript:@"HUHomeTheaterOnboardingKey_Accessory"];
  v8 = [(HUHomeTheaterOnboardingFlow *)self appleTVs];
  uint64_t v9 = [v8 indexOfObject:v7];

  id v10 = HFLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    v21 = self;
    __int16 v22 = 2112;
    v23 = v11;
    __int16 v24 = 2112;
    id v25 = v5;
    _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "%@:%@ with input results: %@", buf, 0x20u);
  }
  if ([v6 integerValue] && objc_msgSend(v6, "integerValue") != 1)
  {
    objc_super v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"HUHomeTheaterOnboardingFlow.m", 84, @"Invalid parameter not satisfying: %@", @"(userInputValue.integerValue == HUHomeTheaterOnboardingValue_Setup) || (userInputValue.integerValue == HUHomeTheaterOnboardingValue_DontSetup)" object file lineNumber description];
  }
  [v6 integerValue];
  [v6 integerValue];
  unint64_t v12 = v9 + 1;
  v13 = [(HUHomeTheaterOnboardingFlow *)self appleTVs];
  unint64_t v14 = [v13 count];

  if (v12 >= v14)
  {
    [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"HUHomeFeatureOnboardingKey_HomeTheater_FinishedOnboarding"];
    v16 = [(HUHomeTheaterOnboardingFlow *)self onboardingFuture];
    [v16 finishWithNoResult];
    v17 = 0;
  }
  else
  {
    v15 = [(HUHomeTheaterOnboardingFlow *)self appleTVs];
    v16 = [v15 objectAtIndexedSubscript:v12];

    v17 = [(HUHomeTheaterOnboardingFlow *)self viewControllerForAccessory:v16];
  }

  return v17;
}

+ (id)needsOnboardingForHome:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_initWeak(&location, a1);
  uint64_t v9 = (void *)MEMORY[0x1E4F7A0D8];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__HUHomeTheaterOnboardingFlow_needsOnboardingForHome_options___block_invoke;
  v13[3] = &unk_1E6385138;
  objc_copyWeak(v15, &location);
  id v10 = v7;
  id v14 = v10;
  v15[1] = (id)a2;
  v11 = [v9 futureWithBlock:v13];

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

  return v11;
}

void __62__HUHomeTheaterOnboardingFlow_needsOnboardingForHome_options___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = objc_msgSend(*(id *)(a1 + 32), "hf_appleTVsSupportingHomeTheater");
  uint64_t v6 = [v5 count];

  if (v6)
  {
    id v24 = WeakRetained;
    id v7 = objc_msgSend(*(id *)(a1 + 32), "hf_appleTVsSupportingHomeTheater");
    uint64_t v8 = [v7 count];
    int v9 = objc_msgSend(v7, "na_any:", &__block_literal_global_20);
    int v10 = objc_msgSend(*(id *)(a1 + 32), "hf_currentUserIsAdministrator");
    id v11 = objc_alloc(MEMORY[0x1E4F69710]);
    unint64_t v12 = *(void **)(a1 + 32);
    v13 = [v12 currentUser];
    id v14 = (void *)[v11 initWithHome:v12 user:v13 nameStyle:0];

    int v15 = [v14 hasDismissedHomeTheaterOnboarding];
    uint64_t v16 = ((v8 != 0) & ~(_BYTE)v15 & ~(_BYTE)v9) & v10;
    v17 = HFLogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v23 = v8 != 0;
      uint64_t v18 = NSStringFromSelector(*(SEL *)(a1 + 48));
      objc_super v19 = (void *)v18;
      uint64_t v20 = *(void *)(a1 + 32);
      v21 = @"Cannot";
      *(_DWORD *)buf = 138414338;
      id v26 = v24;
      if (v16) {
        v21 = @"Can";
      }
      __int16 v27 = 2112;
      uint64_t v28 = v18;
      __int16 v29 = 2112;
      v30 = v21;
      __int16 v31 = 2112;
      v32 = v14;
      __int16 v33 = 2112;
      uint64_t v34 = v20;
      __int16 v35 = 1024;
      BOOL v36 = v23;
      __int16 v37 = 1024;
      int v38 = v9;
      __int16 v39 = 1024;
      int v40 = v10;
      __int16 v41 = 1024;
      int v42 = v15;
      _os_log_impl(&dword_1BE345000, v17, OS_LOG_TYPE_DEFAULT, "%@:%@: %@ show because: user(%@) in home(%@):\n\t\thasCompatibleAppleTVs = %{BOOL}d\n\t\talreadyOneSetup = %{BOOL}d\n\t\tuserAllowedToEdit = %{BOOL}d\n\t\thasPreviouslyDismissed = %{BOOL}d", buf, 0x4Cu);
    }
    __int16 v22 = [NSNumber numberWithBool:v16];
    [v3 finishWithResult:v22];

    id WeakRetained = v24;
  }
  else
  {
    [v3 finishWithResult:MEMORY[0x1E4F1CC28]];
  }
}

BOOL __62__HUHomeTheaterOnboardingFlow_needsOnboardingForHome_options___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 audioDestinationController];
  id v3 = [v2 destination];
  BOOL v4 = v3 != 0;

  return v4;
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

- (NSArray)appleTVs
{
  return self->_appleTVs;
}

- (void)setAppleTVs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleTVs, 0);
  objc_storeStrong((id *)&self->_initialViewController, 0);
  objc_storeStrong((id *)&self->_onboardingFuture, 0);

  objc_storeStrong((id *)&self->_home, 0);
}

@end