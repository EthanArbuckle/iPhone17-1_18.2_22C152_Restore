@interface HKFeatureAvailabilityRequirementOnboardingAcknowledged
+ (NSString)requirementIdentifier;
- (HKFeatureAvailabilityRequirementOnboardingAcknowledged)initWithFeatureIdentifier:(id)a3;
- (HKFeatureAvailabilityRequirementOnboardingAcknowledged)initWithFeatureIdentifier:(id)a3 settingsKey:(id)a4;
- (NSString)requirementDescription;
@end

@implementation HKFeatureAvailabilityRequirementOnboardingAcknowledged

- (HKFeatureAvailabilityRequirementOnboardingAcknowledged)initWithFeatureIdentifier:(id)a3 settingsKey:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)HKFeatureAvailabilityRequirementOnboardingAcknowledged;
  return [(HKFeatureAvailabilityFeatureSettingBooleanRequirement *)&v5 initWithFeatureIdentifier:a3 settingsKey:a4 settingsValue:1 isSatisfiedWhenSettingIsAbsent:0];
}

- (HKFeatureAvailabilityRequirementOnboardingAcknowledged)initWithFeatureIdentifier:(id)a3
{
  return [(HKFeatureAvailabilityRequirementOnboardingAcknowledged *)self initWithFeatureIdentifier:a3 settingsKey:@"OnboardingAcknowledged"];
}

+ (NSString)requirementIdentifier
{
  return (NSString *)@"OnboardingAcknowledged";
}

- (NSString)requirementDescription
{
  v3 = NSString;
  v4 = [(HKFeatureAvailabilityOnboardingRecordRequirement *)self featureIdentifier];
  objc_super v5 = [(HKFeatureAvailabilityFeatureSettingBooleanRequirement *)self settingsKey];
  v6 = [v3 stringWithFormat:@"%@ must have the value YES for the %@ feature setting.", v4, v5];

  return (NSString *)v6;
}

@end