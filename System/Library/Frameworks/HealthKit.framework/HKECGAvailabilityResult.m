@interface HKECGAvailabilityResult
+ (id)resultWithAdvertiseDirectOnboarding:(BOOL)a3 advertiseDirectOnboardingSecondary:(BOOL)a4 advertiseUpgrade:(BOOL)a5 advertiseUpgradeSecondary:(BOOL)a6 advertiseUpgradeBackgroundDelivered:(BOOL)a7;
+ (id)resultWithNoAdvertisements;
- (BOOL)advertiseDirectOnboarding;
- (BOOL)advertiseDirectOnboardingEscapeHatch;
- (BOOL)advertiseUpgrade;
- (BOOL)advertiseUpgradeBackgroundDelivered;
- (BOOL)advertiseUpgradeEscapeHatch;
- (HKECGAvailabilityResult)initWithAdvertiseDirectOnboarding:(BOOL)a3 advertiseDirectOnboardingSecondary:(BOOL)a4 advertiseUpgrade:(BOOL)a5 advertiseUpgradeSecondary:(BOOL)a6 advertiseUpgradeBackgroundDelivered:(BOOL)a7;
@end

@implementation HKECGAvailabilityResult

+ (id)resultWithAdvertiseDirectOnboarding:(BOOL)a3 advertiseDirectOnboardingSecondary:(BOOL)a4 advertiseUpgrade:(BOOL)a5 advertiseUpgradeSecondary:(BOOL)a6 advertiseUpgradeBackgroundDelivered:(BOOL)a7
{
  v7 = (void *)[objc_alloc((Class)a1) initWithAdvertiseDirectOnboarding:a3 advertiseDirectOnboardingSecondary:a4 advertiseUpgrade:a5 advertiseUpgradeSecondary:a6 advertiseUpgradeBackgroundDelivered:a7];

  return v7;
}

+ (id)resultWithNoAdvertisements
{
  v2 = (void *)[objc_alloc((Class)a1) initWithAdvertiseDirectOnboarding:0 advertiseDirectOnboardingSecondary:0 advertiseUpgrade:0 advertiseUpgradeSecondary:0 advertiseUpgradeBackgroundDelivered:0];

  return v2;
}

- (HKECGAvailabilityResult)initWithAdvertiseDirectOnboarding:(BOOL)a3 advertiseDirectOnboardingSecondary:(BOOL)a4 advertiseUpgrade:(BOOL)a5 advertiseUpgradeSecondary:(BOOL)a6 advertiseUpgradeBackgroundDelivered:(BOOL)a7
{
  v13.receiver = self;
  v13.super_class = (Class)HKECGAvailabilityResult;
  result = [(HKECGAvailabilityResult *)&v13 init];
  if (result)
  {
    result->_advertiseDirectOnboarding = a3;
    result->_advertiseDirectOnboardingEscapeHatch = a4;
    result->_advertiseUpgrade = a5;
    result->_advertiseUpgradeEscapeHatch = a6;
    result->_advertiseUpgradeBackgroundDelivered = a7;
  }
  return result;
}

- (BOOL)advertiseDirectOnboarding
{
  return self->_advertiseDirectOnboarding;
}

- (BOOL)advertiseDirectOnboardingEscapeHatch
{
  return self->_advertiseDirectOnboardingEscapeHatch;
}

- (BOOL)advertiseUpgrade
{
  return self->_advertiseUpgrade;
}

- (BOOL)advertiseUpgradeEscapeHatch
{
  return self->_advertiseUpgradeEscapeHatch;
}

- (BOOL)advertiseUpgradeBackgroundDelivered
{
  return self->_advertiseUpgradeBackgroundDelivered;
}

@end