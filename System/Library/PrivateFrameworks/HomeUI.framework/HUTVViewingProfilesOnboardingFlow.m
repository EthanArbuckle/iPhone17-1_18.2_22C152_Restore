@interface HUTVViewingProfilesOnboardingFlow
+ (id)needsOnboardingForHome:(id)a3 options:(id)a4;
- (BOOL)shouldAbortAllOnboarding;
- (BOOL)shouldAbortThisOnboardingFlowGroup;
- (HMHome)home;
- (HUConfigurationViewController)initialViewController;
- (HUTVViewingProfilesOnboardingFlow)initWithUsageOptions:(id)a3 home:(id)a4;
- (NAFuture)onboardingFuture;
- (NSString)description;
- (id)processUserInput:(id)a3;
- (void)setHome:(id)a3;
- (void)setInitialViewController:(id)a3;
- (void)setOnboardingFuture:(id)a3;
- (void)setShouldAbortAllOnboarding:(BOOL)a3;
- (void)setShouldAbortThisOnboardingFlowGroup:(BOOL)a3;
@end

@implementation HUTVViewingProfilesOnboardingFlow

- (HUTVViewingProfilesOnboardingFlow)initWithUsageOptions:(id)a3 home:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HUTVViewingProfilesOnboardingFlow;
  v8 = [(HUTVViewingProfilesOnboardingFlow *)&v17 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_home, a4);
    objc_initWeak(&location, v9);
    v10 = [(id)objc_opt_class() needsOnboardingForHome:v7 options:v6];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __63__HUTVViewingProfilesOnboardingFlow_initWithUsageOptions_home___block_invoke;
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

id __63__HUTVViewingProfilesOnboardingFlow_initWithUsageOptions_home___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)MEMORY[0x1E4F7A0D8];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__HUTVViewingProfilesOnboardingFlow_initWithUsageOptions_home___block_invoke_2;
  v8[3] = &unk_1E6386D18;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  id v5 = v3;
  id v9 = v5;
  id v6 = [v4 futureWithBlock:v8];

  objc_destroyWeak(&v10);

  return v6;
}

void __63__HUTVViewingProfilesOnboardingFlow_initWithUsageOptions_home___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ([*(id *)(a1 + 32) BOOLValue])
  {
    v4 = [HUTVViewingProfilesSetupViewController alloc];
    id v5 = [WeakRetained home];
    id v6 = [(HUTVViewingProfilesSetupViewController *)v4 initWithHome:v5];
    [WeakRetained setInitialViewController:v6];
  }
  else
  {
    [v7 finishWithNoResult];
  }
}

- (NSString)description
{
  return (NSString *)@"TV Viewing Profiles Setup";
}

- (id)processUserInput:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 objectForKeyedSubscript:@"HUTVViewingProfilesOnboardingKey_UserInput"];
  id v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    v24 = self;
    __int16 v25 = 2112;
    v26 = v8;
    __int16 v27 = 2112;
    id v28 = v5;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ with input results: %@", buf, 0x20u);
  }
  if ([v6 integerValue] != 1
    && [v6 integerValue] != 2
    && [v6 integerValue] != 3
    && [v6 integerValue])
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"HUTVViewingProfilesOnboardingFlow.m", 68, @"Invalid parameter not satisfying: %@", @"(userInputValue.integerValue == HUTVViewingProfilesOnboardingValue_Customize) || (userInputValue.integerValue == HUTVViewingProfilesOnboardingValue_Continue) || (userInputValue.integerValue == HUTVViewingProfilesOnboardingValue_DontSetup) || (userInputValue.integerValue == HUTVViewingProfilesOnboardingValue_SetupAll)" object file lineNumber description];
  }
  id v9 = [v5 objectForKeyedSubscript:@"HUMultiUserKey_SetIsEnabled"];
  if ([v9 BOOLValue])
  {
    id v10 = [(HUTVViewingProfilesOnboardingFlow *)self home];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __54__HUTVViewingProfilesOnboardingFlow_processUserInput___block_invoke;
    v22[3] = &unk_1E6386978;
    v22[4] = self;
    v22[5] = a2;
    [v10 enableMultiUserWithCompletionHandler:v22];
  }
  if ([v6 integerValue] == 1)
  {
    uint64_t v11 = [HUTVViewingProfilesCustomizeViewController alloc];
    v12 = [(HUTVViewingProfilesOnboardingFlow *)self home];
    v13 = [(HUTVViewingProfilesCustomizeViewController *)v11 initWithHome:v12];
  }
  else
  {
    if ([v6 integerValue] != 2
      && [v6 integerValue] != 3
      && [v6 integerValue])
    {
      v13 = 0;
      goto LABEL_21;
    }
    id v14 = objc_alloc(MEMORY[0x1E4F69710]);
    id v15 = [(HUTVViewingProfilesOnboardingFlow *)self home];
    v16 = [(HUTVViewingProfilesOnboardingFlow *)self home];
    objc_super v17 = [v16 currentUser];
    v12 = (void *)[v14 initWithHome:v15 user:v17 nameStyle:0];

    if ([v12 hasDismissedTVViewingProfilesOnboarding]) {
      [NSNumber numberWithBool:1];
    }
    else {
    v18 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "integerValue") != 3);
    }
    [v5 setObject:v18 forKeyedSubscript:@"HUHomeFeatureOnboardingKey_TVViewingProfiles_DismissReminderBanner"];

    [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"HUHomeFeatureOnboardingKey_TVViewingProfiles_FinishedOnboarding"];
    v19 = [(HUTVViewingProfilesOnboardingFlow *)self onboardingFuture];
    [v19 finishWithNoResult];

    v13 = 0;
  }

LABEL_21:

  return v13;
}

void __54__HUTVViewingProfilesOnboardingFlow_processUserInput___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = NSStringFromSelector(*(SEL *)(a1 + 40));
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
  __int16 v9 = objc_msgSend(v7, "hf_tvViewingProfilesAccessories");
  uint64_t v10 = [v9 count];

  if (v10)
  {
    objc_initWeak(&location, a1);
    __int16 v11 = (void *)MEMORY[0x1E4F7A0D8];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __68__HUTVViewingProfilesOnboardingFlow_needsOnboardingForHome_options___block_invoke;
    v14[3] = &unk_1E638A3E0;
    objc_copyWeak(v17, &location);
    id v15 = v7;
    id v16 = v8;
    v17[1] = (id)a2;
    id v12 = [v11 futureWithBlock:v14];

    objc_destroyWeak(v17);
    objc_destroyWeak(&location);
  }
  else
  {
    id v12 = [MEMORY[0x1E4F7A0D8] futureWithResult:MEMORY[0x1E4F1CC28]];
  }

  return v12;
}

void __68__HUTVViewingProfilesOnboardingFlow_needsOnboardingForHome_options___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = (id *)(a1 + 48);
  id v22 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  int v5 = objc_msgSend(*(id *)(a1 + 32), "hf_hasAppleTVs");
  objc_opt_class();
  id v6 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"OnboardingDisplayOption_OnboardingFromUserInput"];
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  int v9 = [v8 BOOLValue];
  id v10 = objc_alloc(MEMORY[0x1E4F69710]);
  __int16 v11 = *(void **)(a1 + 32);
  id v12 = [v11 currentUser];
  uint64_t v13 = (void *)[v10 initWithHome:v11 user:v12 nameStyle:0];

  int v14 = [v13 hasDismissedTVViewingProfilesOnboarding];
  uint64_t v15 = v5 & (v9 | v14 ^ 1u);
  id v16 = HFLogForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = v9 ^ 1;
    objc_super v17 = NSStringFromSelector(*(SEL *)(a1 + 56));
    v18 = [*(id *)(a1 + 32) currentUser];
    uint64_t v19 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138414082;
    id v24 = WeakRetained;
    __int16 v25 = 2112;
    v26 = v17;
    __int16 v27 = 1024;
    int v28 = v15;
    __int16 v29 = 2112;
    v30 = v18;
    __int16 v31 = 2112;
    uint64_t v32 = v19;
    __int16 v33 = 1024;
    int v34 = v5;
    __int16 v35 = 1024;
    int v36 = v14;
    __int16 v37 = 1024;
    int v38 = v21;
    _os_log_impl(&dword_1BE345000, v16, OS_LOG_TYPE_DEFAULT, "%@:%@: ---> %{BOOL}d <--- because: user(%@) in home(%@):\n\t\thasAppleTVs = %{BOOL}d\n\t\thasPreviouslyDismissed = %{BOOL}d\n\t\trespectPriorDismissal = %{BOOL}d", buf, 0x42u);
  }
  v20 = [NSNumber numberWithBool:v15];
  [v22 finishWithResult:v20];
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