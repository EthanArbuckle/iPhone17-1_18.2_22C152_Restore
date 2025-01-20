@interface HUFeatureOnboardingConfigurator
- (id)_nextViewControllerForResults:(id)a3;
- (void)viewControllerDidGoBack:(id)a3;
@end

@implementation HUFeatureOnboardingConfigurator

- (id)_nextViewControllerForResults:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = NSStringFromSelector(a2);
    v8 = [(HUConfigurator *)self currentViewController];
    v9 = [(HUConfigurator *)self configuratorDelegate];
    int v22 = 138413314;
    v23 = self;
    __int16 v24 = 2112;
    v25 = v7;
    __int16 v26 = 2112;
    v27 = v8;
    __int16 v28 = 2112;
    id v29 = v5;
    __int16 v30 = 2112;
    v31 = v9;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ Advancing configurator view controller from %@ & results %@ (note that configuratorDelegate = %@)", (uint8_t *)&v22, 0x34u);
  }
  v10 = [(HUConfigurator *)self configuratorDelegate];

  if (!v10)
  {
    v11 = HFLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v22 = 136315138;
      v23 = (HUFeatureOnboardingConfigurator *)"-[HUFeatureOnboardingConfigurator _nextViewControllerForResults:]";
      _os_log_error_impl(&dword_1BE345000, v11, OS_LOG_TYPE_ERROR, "%s The configuration flow is already finished! We should not present any more view controllers.", (uint8_t *)&v22, 0xCu);
    }
  }
  v12 = [(HUConfigurator *)self currentViewController];
  if ([v12 conformsToProtocol:&unk_1F19D4E70]) {
    v13 = v12;
  }
  else {
    v13 = 0;
  }
  id v14 = v13;

  if (!v14)
  {
    v15 = HFLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v22 = 136315138;
      v23 = (HUFeatureOnboardingConfigurator *)"-[HUFeatureOnboardingConfigurator _nextViewControllerForResults:]";
      _os_log_error_impl(&dword_1BE345000, v15, OS_LOG_TYPE_ERROR, "%s The current view controller must support the HUConfigurationViewControllerFlow protocol!", (uint8_t *)&v22, 0xCu);
    }
  }
  v16 = [(HUConfigurator *)self configuratorDelegate];
  if ([v16 conformsToProtocol:&unk_1F1A21598]) {
    v17 = v16;
  }
  else {
    v17 = 0;
  }
  id v18 = v17;

  if ([MEMORY[0x1E4F69758] isInternalInstall] && !v18)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"HUFeatureOnboardingConfigurator.m" lineNumber:31 description:@"The configuratorDelegate must support the HUFeatureOnboardingConfiguratorDelegate protocol!"];
  }
  v19 = objc_msgSend(v18, "getNextViewControllerForOnboardingInput:currentOnboardingFlowClass:", v5, objc_msgSend(v14, "onboardingFlowClass"));

  return v19;
}

- (void)viewControllerDidGoBack:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HUFeatureOnboardingConfigurator;
  [(HUConfigurator *)&v9 viewControllerDidGoBack:a3];
  id v5 = [(HUConfigurator *)self configuratorDelegate];
  if ([v5 conformsToProtocol:&unk_1F1A21598]) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (!v7)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"HUFeatureOnboardingConfigurator.m", 48, @"Invalid parameter not satisfying: %@", @"featureOnboardingDelegate != nil" object file lineNumber description];
  }
  [v7 restartCurrentOnboarding];
}

@end