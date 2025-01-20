@interface HUOwnerMustUpgradeOnboardingFlow
+ (id)needsOnboardingForHome:(id)a3 options:(id)a4;
- (BOOL)shouldAbortAllOnboarding;
- (BOOL)shouldAbortThisOnboardingFlowGroup;
- (HMHome)home;
- (HUConfigurationViewController)initialViewController;
- (HUOwnerMustUpgradeOnboardingFlow)initWithUpgradeRequirements:(unint64_t)a3 home:(id)a4;
- (NAFuture)onboardingFuture;
- (NSString)description;
- (id)processUserInput:(id)a3;
- (void)setHome:(id)a3;
- (void)setInitialViewController:(id)a3;
- (void)setOnboardingFuture:(id)a3;
- (void)setShouldAbortAllOnboarding:(BOOL)a3;
- (void)setShouldAbortThisOnboardingFlowGroup:(BOOL)a3;
@end

@implementation HUOwnerMustUpgradeOnboardingFlow

- (HUOwnerMustUpgradeOnboardingFlow)initWithUpgradeRequirements:(unint64_t)a3 home:(id)a4
{
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HUOwnerMustUpgradeOnboardingFlow;
  v8 = [(HUOwnerMustUpgradeOnboardingFlow *)&v17 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_home, a4);
    objc_initWeak(&location, v9);
    v10 = [(id)objc_opt_class() needsOnboardingForHome:v7 options:MEMORY[0x1E4F1CC08]];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __69__HUOwnerMustUpgradeOnboardingFlow_initWithUpgradeRequirements_home___block_invoke;
    v14[3] = &unk_1E6385160;
    objc_copyWeak(v15, &location);
    v15[1] = (id)a3;
    uint64_t v11 = [v10 flatMap:v14];
    onboardingFuture = v9->_onboardingFuture;
    v9->_onboardingFuture = (NAFuture *)v11;

    objc_destroyWeak(v15);
    objc_destroyWeak(&location);
  }

  return v9;
}

id __69__HUOwnerMustUpgradeOnboardingFlow_initWithUpgradeRequirements_home___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)MEMORY[0x1E4F7A0D8];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__HUOwnerMustUpgradeOnboardingFlow_initWithUpgradeRequirements_home___block_invoke_2;
  v9[3] = &unk_1E6385138;
  objc_copyWeak(v11, (id *)(a1 + 32));
  id v5 = v3;
  v6 = *(void **)(a1 + 40);
  id v10 = v5;
  v11[1] = v6;
  id v7 = [v4 futureWithBlock:v9];

  objc_destroyWeak(v11);

  return v7;
}

void __69__HUOwnerMustUpgradeOnboardingFlow_initWithUpgradeRequirements_home___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ([*(id *)(a1 + 32) BOOLValue])
  {
    v4 = [[HUOwnerMustUpgradeViewController alloc] initWithUpgradeRequirements:*(void *)(a1 + 48)];
    [WeakRetained setInitialViewController:v4];
  }
  else
  {
    [v5 finishWithNoResult];
  }
}

- (NSString)description
{
  return (NSString *)@"Owner Must Upgrade";
}

- (id)processUserInput:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromSelector(a2);
    int v10 = 138412802;
    uint64_t v11 = self;
    __int16 v12 = 2112;
    v13 = v7;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ with input results: %@", (uint8_t *)&v10, 0x20u);
  }
  v8 = [(HUOwnerMustUpgradeOnboardingFlow *)self onboardingFuture];
  [v8 finishWithNoResult];

  return 0;
}

+ (id)needsOnboardingForHome:(id)a3 options:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E4F7A0D8], "futureWithResult:", MEMORY[0x1E4F1CC38], a4);
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