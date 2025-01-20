@interface HKRPRespiratoryHealthBridgeSetupBaseController
- (id)_buildPrimaryViewControllerWithSettings:(id)a3 onboardingManager:(id)a4;
- (id)viewController;
- (void)miniFlowStepComplete:(id)a3;
- (void)miniFlowStepComplete:(id)a3 nextControllerClass:(Class)a4;
@end

@implementation HKRPRespiratoryHealthBridgeSetupBaseController

- (id)_buildPrimaryViewControllerWithSettings:(id)a3 onboardingManager:(id)a4
{
  v5 = +[HKRPOnboardingViewControllerFactory onboardingViewControllerWithStyle:0 settings:a3 onboardingManager:a4 onboardingDelegate:0];
  [v5 setMiniFlowDelegate:self];

  return v5;
}

- (id)viewController
{
  id v3 = objc_alloc_init((Class)HKRPOxygenSaturationOnboardingManager);
  if ([v3 onboardingDuringPairingShouldAppear])
  {
    v4 = +[HKRPOxygenSaturationSettings standardSettings];
    v5 = [(HKRPRespiratoryHealthBridgeSetupBaseController *)self _buildPrimaryViewControllerWithSettings:v4 onboardingManager:v3];
  }
  else
  {
    _HKInitializeLogging();
    v6 = (void *)HKLogRespiratory;
    if (os_log_type_enabled(HKLogRespiratory, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      *(_DWORD *)v11 = 138543362;
      *(void *)&v11[4] = objc_opt_class();
      id v8 = *(id *)&v11[4];
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipped onboarding during pairing", v11, 0xCu);
    }
    objc_msgSend(v3, "cacheCompletedOnboardingStateIfNeeded", *(_OWORD *)v11);
    v9 = [(HKRPRespiratoryHealthBridgeSetupBaseController *)self delegate];
    [v9 buddyControllerReleaseHoldAndSkip:self];

    v5 = 0;
  }

  return v5;
}

- (void)miniFlowStepComplete:(id)a3
{
  id v4 = [(HKRPRespiratoryHealthBridgeSetupBaseController *)self delegate];
  [v4 buddyControllerDone:self];
}

- (void)miniFlowStepComplete:(id)a3 nextControllerClass:(Class)a4
{
  id v5 = [(HKRPRespiratoryHealthBridgeSetupBaseController *)self delegate];
  [v5 buddyControllerDone:self];
}

@end