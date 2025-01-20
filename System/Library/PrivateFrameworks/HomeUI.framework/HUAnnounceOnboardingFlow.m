@interface HUAnnounceOnboardingFlow
+ (id)allSteps;
+ (id)needsOnboardingForHome:(id)a3 options:(id)a4;
- (BOOL)shouldAbortAllOnboarding;
- (BOOL)shouldAbortThisOnboardingFlowGroup;
- (BOOL)shouldShowStep:(unint64_t)a3 withOptions:(id)a4;
- (HMHome)home;
- (HUAnnounceOnboardingFlow)initWithUsageOptions:(id)a3 home:(id)a4;
- (HUConfigurationViewController)initialViewController;
- (NAFuture)onboardingFuture;
- (NSArray)requiredSteps;
- (id)processUserInput:(id)a3;
- (id)viewControllerForStep:(unint64_t)a3;
- (void)setHome:(id)a3;
- (void)setInitialViewController:(id)a3;
- (void)setOnboardingFuture:(id)a3;
- (void)setRequiredSteps:(id)a3;
@end

@implementation HUAnnounceOnboardingFlow

- (HUAnnounceOnboardingFlow)initWithUsageOptions:(id)a3 home:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HUAnnounceOnboardingFlow;
  v8 = [(HUAnnounceOnboardingFlow *)&v18 init];
  v9 = v8;
  if (v8)
  {
    [(HUAnnounceOnboardingFlow *)v8 setHome:v7];
    v10 = [(id)objc_opt_class() needsOnboardingForHome:v7 options:v6];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __54__HUAnnounceOnboardingFlow_initWithUsageOptions_home___block_invoke;
    v15[3] = &unk_1E638AEC0;
    v11 = v9;
    v16 = v11;
    id v17 = v6;
    uint64_t v12 = [v10 flatMap:v15];
    onboardingFuture = v11->_onboardingFuture;
    v11->_onboardingFuture = (NAFuture *)v12;
  }
  return v9;
}

id __54__HUAnnounceOnboardingFlow_initWithUsageOptions_home___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  v4 = (void *)MEMORY[0x1E4F7A0D8];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__HUAnnounceOnboardingFlow_initWithUsageOptions_home___block_invoke_2;
  v8[3] = &unk_1E6386CC0;
  objc_copyWeak(&v11, &location);
  id v5 = v3;
  id v9 = v5;
  id v10 = *(id *)(a1 + 40);
  id v6 = [v4 futureWithBlock:v8];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v6;
}

void __54__HUAnnounceOnboardingFlow_initWithUsageOptions_home___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if ([a1[4] BOOLValue])
  {
    id v5 = [(id)objc_opt_class() allSteps];
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __54__HUAnnounceOnboardingFlow_initWithUsageOptions_home___block_invoke_3;
    id v17 = &unk_1E638AE98;
    id v6 = WeakRetained;
    id v18 = v6;
    id v19 = a1[5];
    id v7 = objc_msgSend(v5, "na_filter:", &v14);
    objc_msgSend(v6, "setRequiredSteps:", v7, v14, v15, v16, v17);

    v8 = [v6 requiredSteps];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      id v10 = [v6 requiredSteps];
      id v11 = [v10 firstObject];
      uint64_t v12 = [v11 unsignedIntegerValue];

      v13 = [v6 viewControllerForStep:v12];
      [v6 setInitialViewController:v13];
    }
    else
    {
      [v3 finishWithNoResult];
    }
  }
  else
  {
    [v3 finishWithNoResult];
  }
}

uint64_t __54__HUAnnounceOnboardingFlow_initWithUsageOptions_home___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = [a2 integerValue];
  uint64_t v5 = *(void *)(a1 + 40);

  return [v3 shouldShowStep:v4 withOptions:v5];
}

- (BOOL)shouldShowStep:(unint64_t)a3 withOptions:(id)a4
{
  id v6 = [(HUAnnounceOnboardingFlow *)self home];
  id v7 = objc_msgSend(v6, "hf_allUsersIncludingCurrentUser");
  unint64_t v8 = [v7 count];

  if (a3 == 2 && v8 < 2) {
    return 0;
  }
  id v10 = [(HUAnnounceOnboardingFlow *)self home];
  char v11 = objc_msgSend(v10, "hf_currentUserIsAdministrator");

  if (a3 == 2) {
    return v11;
  }
  else {
    return 1;
  }
}

- (id)viewControllerForStep:(unint64_t)a3
{
  if (a3)
  {
    uint64_t v5 = [HUAnnounceSetupViewController alloc];
    id v6 = [(HUAnnounceOnboardingFlow *)self home];
    uint64_t v7 = [(HUAnnounceSetupViewController *)v5 initWithHome:v6 step:a3];
  }
  else
  {
    unint64_t v8 = [HUAnnounceTitleViewController alloc];
    id v6 = [(HUAnnounceOnboardingFlow *)self home];
    uint64_t v7 = [(HUAnnounceTitleViewController *)v8 initWithHome:v6];
  }
  uint64_t v9 = (void *)v7;

  return v9;
}

- (id)processUserInput:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  uint64_t v5 = [v4 objectForKeyedSubscript:@"announceSetupStep"];
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    unint64_t v8 = [(HUAnnounceOnboardingFlow *)self requiredSteps];
    unint64_t v9 = [v8 indexOfObject:v7] + 1;
  }
  else
  {
    unint64_t v9 = 0;
  }
  id v10 = [(HUAnnounceOnboardingFlow *)self requiredSteps];
  unint64_t v11 = [v10 count];

  uint64_t v12 = [NSNumber numberWithBool:v9 >= v11];
  [v4 setObject:v12 forKeyedSubscript:@"HUHomeFeatureOnboardingKey_Announce_FinishedOnboarding"];

  if (v9 < v11)
  {
    uint64_t v15 = [(HUAnnounceOnboardingFlow *)self requiredSteps];
    v16 = [v15 objectAtIndexedSubscript:v9];
    uint64_t v17 = [v16 unsignedIntegerValue];

    uint64_t v14 = [(HUAnnounceOnboardingFlow *)self viewControllerForStep:v17];
  }
  else
  {
    v13 = [(HUAnnounceOnboardingFlow *)self onboardingFuture];
    [v13 finishWithNoResult];

    uint64_t v14 = 0;
  }

  return v14;
}

+ (id)allSteps
{
  if (_MergedGlobals_624 != -1) {
    dispatch_once(&_MergedGlobals_624, &__block_literal_global_13_1);
  }
  v2 = (void *)qword_1EBA47870;

  return v2;
}

void __36__HUAnnounceOnboardingFlow_allSteps__block_invoke_2()
{
  v0 = (void *)qword_1EBA47870;
  qword_1EBA47870 = (uint64_t)&unk_1F19B5960;
}

+ (id)needsOnboardingForHome:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_initWeak(&location, a1);
  unint64_t v9 = (void *)MEMORY[0x1E4F7A0D8];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __59__HUAnnounceOnboardingFlow_needsOnboardingForHome_options___block_invoke;
  v14[3] = &unk_1E638A3E0;
  objc_copyWeak(v17, &location);
  id v10 = v7;
  id v15 = v10;
  id v11 = v8;
  id v16 = v11;
  v17[1] = (id)a2;
  uint64_t v12 = [v9 futureWithBlock:v14];

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);

  return v12;
}

void __59__HUAnnounceOnboardingFlow_needsOnboardingForHome_options___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  unsigned int v6 = objc_msgSend(*(id *)(a1 + 32), "hf_shouldShowAnnounceFeatureForThisHome");
  id v7 = objc_alloc(MEMORY[0x1E4F69710]);
  id v8 = *(void **)(a1 + 32);
  unint64_t v9 = [v8 currentUser];
  id v10 = (void *)[v7 initWithHome:v8 user:v9 nameStyle:0];

  int v11 = [v10 hasDismissedAnnounceOnboarding];
  objc_opt_class();
  uint64_t v12 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"announceForceOnboarding"];
  if (objc_opt_isKindOfClass()) {
    v13 = v12;
  }
  else {
    v13 = 0;
  }
  id v14 = v13;

  if ([v14 BOOLValue]) {
    uint64_t v15 = v6;
  }
  else {
    uint64_t v15 = v6 & (v11 ^ 1);
  }
  id v16 = HFLogForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = NSStringFromSelector(*(SEL *)(a1 + 56));
    id v18 = (void *)v17;
    uint64_t v19 = *(void *)(a1 + 32);
    v20 = @"Cannot";
    int v22 = 138413826;
    id v23 = WeakRetained;
    if (v15) {
      v20 = @"Can";
    }
    __int16 v24 = 2112;
    uint64_t v25 = v17;
    __int16 v26 = 2112;
    v27 = v20;
    __int16 v28 = 2112;
    v29 = v10;
    __int16 v30 = 2112;
    uint64_t v31 = v19;
    __int16 v32 = 1024;
    unsigned int v33 = v6;
    __int16 v34 = 1024;
    int v35 = v11;
    _os_log_impl(&dword_1BE345000, v16, OS_LOG_TYPE_DEFAULT, "%@:%@: %@ show because: user(%@) in home(%@):\n\t\tshowsAnnounceButton = %{BOOL}d\n\t\thasPreviouslyDismissed = %{BOOL}d", (uint8_t *)&v22, 0x40u);
  }
  v21 = [NSNumber numberWithBool:v15];
  [v4 finishWithResult:v21];
}

- (HMHome)home
{
  return self->home;
}

- (void)setHome:(id)a3
{
}

- (HUConfigurationViewController)initialViewController
{
  return self->initialViewController;
}

- (void)setInitialViewController:(id)a3
{
}

- (NAFuture)onboardingFuture
{
  return self->_onboardingFuture;
}

- (void)setOnboardingFuture:(id)a3
{
}

- (BOOL)shouldAbortAllOnboarding
{
  return self->shouldAbortAllOnboarding;
}

- (BOOL)shouldAbortThisOnboardingFlowGroup
{
  return self->shouldAbortThisOnboardingFlowGroup;
}

- (NSArray)requiredSteps
{
  return self->_requiredSteps;
}

- (void)setRequiredSteps:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredSteps, 0);
  objc_storeStrong((id *)&self->_onboardingFuture, 0);
  objc_storeStrong((id *)&self->initialViewController, 0);

  objc_storeStrong((id *)&self->home, 0);
}

@end