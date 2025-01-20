@interface HUAccessoryFirmwareUpdateOnboardingFlow
+ (id)needsOnboardingForHome:(id)a3 options:(id)a4;
- (BOOL)shouldAbortAllOnboarding;
- (BOOL)shouldAbortThisOnboardingFlowGroup;
- (HMHome)home;
- (HUAccessoryFirmwareUpdateOnboardingFlow)initWithUsageOptions:(id)a3 home:(id)a4;
- (HUConfigurationViewController)initialViewController;
- (NAFuture)onboardingFuture;
- (id)processUserInput:(id)a3;
- (void)setHome:(id)a3;
- (void)setInitialViewController:(id)a3;
- (void)setOnboardingFuture:(id)a3;
@end

@implementation HUAccessoryFirmwareUpdateOnboardingFlow

- (HUAccessoryFirmwareUpdateOnboardingFlow)initWithUsageOptions:(id)a3 home:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HUAccessoryFirmwareUpdateOnboardingFlow;
  v8 = [(HUAccessoryFirmwareUpdateOnboardingFlow *)&v17 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_home, a4);
    objc_initWeak(&location, v9);
    v10 = [(id)objc_opt_class() needsOnboardingForHome:v7 options:v6];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __69__HUAccessoryFirmwareUpdateOnboardingFlow_initWithUsageOptions_home___block_invoke;
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

id __69__HUAccessoryFirmwareUpdateOnboardingFlow_initWithUsageOptions_home___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)MEMORY[0x1E4F7A0D8];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__HUAccessoryFirmwareUpdateOnboardingFlow_initWithUsageOptions_home___block_invoke_2;
  v8[3] = &unk_1E6386D18;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  id v5 = v3;
  id v9 = v5;
  id v6 = [v4 futureWithBlock:v8];

  objc_destroyWeak(&v10);

  return v6;
}

void __69__HUAccessoryFirmwareUpdateOnboardingFlow_initWithUsageOptions_home___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ([*(id *)(a1 + 32) BOOLValue])
  {
    v4 = [HUAccessoryFirmwareUpdateSetupViewController alloc];
    id v5 = [WeakRetained home];
    id v6 = [(HUAccessoryFirmwareUpdateSetupViewController *)v4 initWithHome:v5];
    [WeakRetained setInitialViewController:v6];
  }
  else
  {
    [v7 finishWithNoResult];
  }
}

- (id)processUserInput:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 objectForKeyedSubscript:@"HUAccessoryFirmwareUpdateOnboardingKey_UserInput"];
  id v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    v13 = self;
    __int16 v14 = 2112;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ with input results: %@", buf, 0x20u);
  }
  if ([v6 integerValue] && objc_msgSend(v6, "integerValue") != 1)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"HUAccessoryFirmwareUpdateOnboardingFlow.m", 59, @"Invalid parameter not satisfying: %@", @"(userInputValue.integerValue == HUAccessoryFirmwareUpdateOnboardingValue_Setup) || (userInputValue.integerValue == HUAccessoryFirmwareUpdateOnboardingValue_DontSetup)" object file lineNumber description];
  }
  [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"HUHomeFeatureOnboardingKey_AccessoryFirmwareUpdate_FinishedOnboarding"];
  id v9 = [(HUAccessoryFirmwareUpdateOnboardingFlow *)self onboardingFuture];
  [v9 finishWithNoResult];

  return 0;
}

+ (id)needsOnboardingForHome:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_initWeak(&location, a1);
  id v9 = (void *)MEMORY[0x1E4F7A0D8];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __74__HUAccessoryFirmwareUpdateOnboardingFlow_needsOnboardingForHome_options___block_invoke;
  v14[3] = &unk_1E638A3E0;
  objc_copyWeak(v17, &location);
  id v10 = v7;
  id v15 = v10;
  id v11 = v8;
  id v16 = v11;
  v17[1] = (id)a2;
  v12 = [v9 futureWithBlock:v14];

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);

  return v12;
}

void __74__HUAccessoryFirmwareUpdateOnboardingFlow_needsOnboardingForHome_options___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  int v6 = objc_msgSend(*(id *)(a1 + 32), "hf_hasThirdPartyAccessoriesSupportingSoftwareUpdate");
  int v7 = objc_msgSend(*(id *)(a1 + 32), "hf_hasEnabledResidentSupportingThirdPartySoftwareUpdate");
  int v8 = objc_msgSend(*(id *)(a1 + 32), "hf_currentUserIsOwner");
  id v9 = objc_alloc(MEMORY[0x1E4F69710]);
  id v10 = *(void **)(a1 + 32);
  id v11 = [v10 currentUser];
  v12 = (void *)[v9 initWithHome:v10 user:v11 nameStyle:0];

  int v13 = [v12 hasDismissedAccessoryFirmwareUpdateOnboarding];
  __int16 v14 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"OnboardingDisplayOption_OnboardingFromUserInput"];
  int v15 = [v14 BOOLValue];

  int v28 = v8;
  if (v6 && v7 && v8 && ((v13 ^ 1 | v15) & 1) != 0) {
    uint64_t updated = 1;
  }
  else {
    uint64_t updated = HFForceAccessoryFirmwareUpdateOnboarding();
  }
  id v17 = HFLogForCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    id v27 = v4;
    v19 = id v18 = WeakRetained;
    int v26 = v13;
    v20 = v12;
    int v21 = v7;
    int v22 = v6;
    if (updated) {
      v23 = @"Can";
    }
    else {
      v23 = @"Cannot";
    }
    uint64_t v24 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138414594;
    id v30 = v18;
    __int16 v31 = 2112;
    v32 = v19;
    __int16 v33 = 2112;
    v34 = v23;
    __int16 v35 = 2112;
    uint64_t v36 = v24;
    __int16 v37 = 1024;
    int v38 = v22;
    __int16 v39 = 1024;
    int v40 = v21;
    v12 = v20;
    __int16 v41 = 1024;
    int v42 = v28;
    __int16 v43 = 1024;
    int v44 = v15;
    __int16 v45 = 1024;
    int v46 = v26;
    __int16 v47 = 1024;
    int v48 = HFForceAccessoryFirmwareUpdateOnboarding();
    _os_log_impl(&dword_1BE345000, v17, OS_LOG_TYPE_DEFAULT, "%@:%@: %@ show because: home(%@):\n\t\thasCompatibleAccessories = %{BOOL}d\n\t\thasCapableResident = %{BOOL}d\n\t\tuserIsOwner = %{BOOL}d\n\t\tonboardingFromUserInput = %{BOOL}d\n\t\thasPreviouslyDismissed = %{BOOL}d\n\t\tHFForceAccessoryFirmwareUpdate = %{BOOL}d", buf, 0x4Eu);

    id WeakRetained = v18;
    id v4 = v27;
  }

  v25 = [NSNumber numberWithBool:updated];
  [v4 finishWithResult:v25];
}

- (NAFuture)onboardingFuture
{
  return self->_onboardingFuture;
}

- (void)setOnboardingFuture:(id)a3
{
}

- (BOOL)shouldAbortThisOnboardingFlowGroup
{
  return self->_shouldAbortThisOnboardingFlowGroup;
}

- (BOOL)shouldAbortAllOnboarding
{
  return self->_shouldAbortAllOnboarding;
}

- (HUConfigurationViewController)initialViewController
{
  return self->_initialViewController;
}

- (void)setInitialViewController:(id)a3
{
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_initialViewController, 0);

  objc_storeStrong((id *)&self->_onboardingFuture, 0);
}

@end