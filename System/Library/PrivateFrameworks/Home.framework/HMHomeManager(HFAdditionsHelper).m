@interface HMHomeManager(HFAdditionsHelper)
- (id)_cached_hasSeenOnboardingWelcomeViewNumber;
- (id)_cached_lastOnboardingNewFeaturesVersionSeenNumber;
- (void)set_cached_hasSeenOnboardingWelcomeViewNumber:()HFAdditionsHelper;
- (void)set_cached_lastOnboardingNewFeaturesVersionSeenNumber:()HFAdditionsHelper;
@end

@implementation HMHomeManager(HFAdditionsHelper)

- (id)_cached_lastOnboardingNewFeaturesVersionSeenNumber
{
  return objc_getAssociatedObject(a1, sel__cached_lastOnboardingNewFeaturesVersionSeenNumber);
}

- (id)_cached_hasSeenOnboardingWelcomeViewNumber
{
  return objc_getAssociatedObject(a1, sel__cached_hasSeenOnboardingWelcomeViewNumber);
}

- (void)set_cached_hasSeenOnboardingWelcomeViewNumber:()HFAdditionsHelper
{
}

- (void)set_cached_lastOnboardingNewFeaturesVersionSeenNumber:()HFAdditionsHelper
{
}

@end