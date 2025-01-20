@interface HUSwitchHomesWelcomeOnboardingFlow
+ (id)needsOnboardingForHome:(id)a3 options:(id)a4;
- (BOOL)shouldAbortAllOnboarding;
- (BOOL)shouldAbortThisOnboardingFlowGroup;
- (HMHome)home;
- (HUConfigurationViewController)initialViewController;
- (HUSwitchHomesWelcomeOnboardingFlow)initWithHome:(id)a3;
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

@implementation HUSwitchHomesWelcomeOnboardingFlow

- (HUSwitchHomesWelcomeOnboardingFlow)initWithHome:(id)a3
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HUSwitchHomesWelcomeOnboardingFlow;
  v7 = [(HUSwitchHomesWelcomeOnboardingFlow *)&v18 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_home, a3);
    v9 = (NAFuture *)objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    readyFuture = v8->_readyFuture;
    v8->_readyFuture = v9;

    objc_initWeak(&location, v8);
    v11 = +[HUSwitchHomesWelcomeOnboardingFlowUtilities currentUserHasUnfinishedFeatureOnboardingForHome:v8->_home];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __51__HUSwitchHomesWelcomeOnboardingFlow_initWithHome___block_invoke;
    v15[3] = &unk_1E6385160;
    objc_copyWeak(v16, &location);
    v16[1] = (id)a2;
    uint64_t v12 = [v11 flatMap:v15];
    onboardingFuture = v8->_onboardingFuture;
    v8->_onboardingFuture = (NAFuture *)v12;

    objc_destroyWeak(v16);
    objc_destroyWeak(&location);
  }

  return v8;
}

id __51__HUSwitchHomesWelcomeOnboardingFlow_initWithHome___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((HFForceSwitchHomeWelcomeOnboarding() & 1) != 0 || [v3 BOOLValue])
  {
    v5 = [HUSwitchHomesWelcomeViewController alloc];
    id v6 = [WeakRetained home];
    v7 = [(HUSwitchHomesWelcomeViewController *)v5 initWithHome:v6];
    [WeakRetained setInitialViewController:v7];

    v8 = [WeakRetained readyFuture];
    [v8 finishWithResult:MEMORY[0x1E4F1CC38]];

    id v9 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
  }
  else
  {
    v10 = HFLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = NSStringFromSelector(*(SEL *)(a1 + 40));
      int v14 = 138412546;
      id v15 = WeakRetained;
      __int16 v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "%@:%@ Onboarding not required", (uint8_t *)&v14, 0x16u);
    }
    id v9 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }
  uint64_t v12 = v9;

  return v12;
}

- (NSString)description
{
  return (NSString *)@"Switch Homes Welcome";
}

- (id)processUserInput:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = NSStringFromSelector(a2);
    int v18 = 138412802;
    v19 = self;
    __int16 v20 = 2112;
    v21 = v7;
    __int16 v22 = 2112;
    id v23 = v5;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ with input results: %@", (uint8_t *)&v18, 0x20u);
  }
  v8 = [v5 objectForKeyedSubscript:@"HUSwitchHomesWelcomeOnboardingKey_UserInput"];
  if ([v8 integerValue])
  {
    if ([v8 integerValue] == 1)
    {
      id v9 = HFLogForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = NSStringFromSelector(a2);
        int v18 = 138412546;
        v19 = self;
        __int16 v20 = 2112;
        v21 = v10;
        _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "%@:%@ User Switched Homes - Aborting Current Onboarding", (uint8_t *)&v18, 0x16u);
      }
      [(HUSwitchHomesWelcomeOnboardingFlow *)self setShouldAbortAllOnboarding:1];
    }
  }
  else
  {
    id v11 = objc_alloc(MEMORY[0x1E4F69710]);
    home = self->_home;
    v13 = [(HMHome *)home currentUser];
    int v14 = (void *)[v11 initWithHome:home user:v13 nameStyle:0];

    id v15 = (id)[v14 setCompletedNonOwnerUserHomeSwitchingUI:1];
  }
  __int16 v16 = [(HUSwitchHomesWelcomeOnboardingFlow *)self onboardingFuture];
  [v16 finishWithNoResult];

  return 0;
}

+ (id)needsOnboardingForHome:(id)a3 options:(id)a4
{
  return +[HUSwitchHomesWelcomeOnboardingFlowUtilities currentUserHasUnfinishedFeatureOnboardingForHome:](HUSwitchHomesWelcomeOnboardingFlowUtilities, "currentUserHasUnfinishedFeatureOnboardingForHome:", a3, a4);
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