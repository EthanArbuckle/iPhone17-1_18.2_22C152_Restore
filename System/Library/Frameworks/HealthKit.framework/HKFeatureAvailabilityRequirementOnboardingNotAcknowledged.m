@interface HKFeatureAvailabilityRequirementOnboardingNotAcknowledged
+ (NSString)requirementIdentifier;
- (HKFeatureAvailabilityRequirementOnboardingNotAcknowledged)initWithFeatureIdentifier:(id)a3;
- (HKFeatureAvailabilityRequirementOnboardingNotAcknowledged)initWithFeatureIdentifier:(id)a3 settingsKey:(id)a4;
- (NSString)requirementDescription;
@end

@implementation HKFeatureAvailabilityRequirementOnboardingNotAcknowledged

- (HKFeatureAvailabilityRequirementOnboardingNotAcknowledged)initWithFeatureIdentifier:(id)a3 settingsKey:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)HKFeatureAvailabilityRequirementOnboardingNotAcknowledged;
  return [(HKFeatureAvailabilityFeatureSettingBooleanRequirement *)&v5 initWithFeatureIdentifier:a3 settingsKey:a4 settingsValue:0 isSatisfiedWhenSettingIsAbsent:1];
}

- (HKFeatureAvailabilityRequirementOnboardingNotAcknowledged)initWithFeatureIdentifier:(id)a3
{
  return [(HKFeatureAvailabilityRequirementOnboardingNotAcknowledged *)self initWithFeatureIdentifier:a3 settingsKey:@"OnboardingAcknowledged"];
}

+ (NSString)requirementIdentifier
{
  return (NSString *)@"OnboardingNotAcknowledged";
}

- (NSString)requirementDescription
{
  v3 = NSString;
  v4 = [(HKFeatureAvailabilityOnboardingRecordRequirement *)self featureIdentifier];
  objc_super v5 = [(HKFeatureAvailabilityFeatureSettingBooleanRequirement *)self settingsKey];
  v6 = [v3 stringWithFormat:@"%@ must have the value NO for the %@ feature setting.", v4, v5];

  return (NSString *)v6;
}

@end