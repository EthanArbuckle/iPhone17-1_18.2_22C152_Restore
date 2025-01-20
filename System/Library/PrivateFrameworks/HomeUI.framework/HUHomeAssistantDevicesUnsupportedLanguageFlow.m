@interface HUHomeAssistantDevicesUnsupportedLanguageFlow
+ (id)needsOnboardingForHome:(id)a3 options:(id)a4;
- (BOOL)shouldAbortAllOnboarding;
- (BOOL)shouldAbortThisOnboardingFlowGroup;
- (HMHome)home;
- (HUConfigurationViewController)initialViewController;
- (HUHomeAssistantDevicesUnsupportedLanguageFlow)initWithHomeAssistantDevicesHavingLanguageMismatch:(id)a3 home:(id)a4;
- (NAFuture)onboardingFuture;
- (NSString)description;
- (id)processUserInput:(id)a3;
- (void)setHome:(id)a3;
- (void)setInitialViewController:(id)a3;
- (void)setOnboardingFuture:(id)a3;
- (void)setShouldAbortAllOnboarding:(BOOL)a3;
- (void)setShouldAbortThisOnboardingFlowGroup:(BOOL)a3;
@end

@implementation HUHomeAssistantDevicesUnsupportedLanguageFlow

- (HUHomeAssistantDevicesUnsupportedLanguageFlow)initWithHomeAssistantDevicesHavingLanguageMismatch:(id)a3 home:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HUHomeAssistantDevicesUnsupportedLanguageFlow;
  v8 = [(HUHomeAssistantDevicesUnsupportedLanguageFlow *)&v18 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_home, a4);
    objc_initWeak(&location, v9);
    v10 = [(id)objc_opt_class() needsOnboardingForHome:v7 options:MEMORY[0x1E4F1CC08]];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __105__HUHomeAssistantDevicesUnsupportedLanguageFlow_initWithHomeAssistantDevicesHavingLanguageMismatch_home___block_invoke;
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

id __105__HUHomeAssistantDevicesUnsupportedLanguageFlow_initWithHomeAssistantDevicesHavingLanguageMismatch_home___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)MEMORY[0x1E4F7A0D8];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __105__HUHomeAssistantDevicesUnsupportedLanguageFlow_initWithHomeAssistantDevicesHavingLanguageMismatch_home___block_invoke_2;
  v8[3] = &unk_1E6386CC0;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  id v5 = v3;
  id v9 = v5;
  id v10 = *(id *)(a1 + 32);
  id v6 = [v4 futureWithBlock:v8];

  objc_destroyWeak(&v11);

  return v6;
}

void __105__HUHomeAssistantDevicesUnsupportedLanguageFlow_initWithHomeAssistantDevicesHavingLanguageMismatch_home___block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([*(id *)(a1 + 32) BOOLValue])
  {
    v4 = [HUHomeAssistantDevicesUnsupportedLanguageViewController alloc];
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = [WeakRetained home];
    id v7 = [(HUHomeAssistantDevicesUnsupportedLanguageViewController *)v4 initWithHomeAssistantDevicesHavingLanguageMismatch:v5 home:v6];
    [WeakRetained setInitialViewController:v7];
  }
  else
  {
    [v8 finishWithNoResult];
  }
}

- (NSString)description
{
  return (NSString *)@"Unsupported HomePods";
}

- (id)processUserInput:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 objectForKeyedSubscript:@"HULanguageOnboardingKey_UnsupportedLanguage_UserInput"];
  id v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    v13 = self;
    __int16 v14 = 2112;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ with input results: %@", buf, 0x20u);
  }
  if ([v6 integerValue] != 6)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"HUHomeAssistantDevicesUnsupportedLanguageFlow.m", 59, @"Invalid parameter not satisfying: %@", @"(userInputValue.integerValue == HULanguageOnboardingValue_UnsupportedLanguage_Completed)" object file lineNumber description];
  }
  if ([v6 integerValue] == 6)
  {
    id v9 = [(HUHomeAssistantDevicesUnsupportedLanguageFlow *)self onboardingFuture];
    [v9 finishWithNoResult];
  }
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