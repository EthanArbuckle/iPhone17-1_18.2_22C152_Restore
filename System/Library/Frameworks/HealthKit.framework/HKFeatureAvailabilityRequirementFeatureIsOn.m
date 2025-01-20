@interface HKFeatureAvailabilityRequirementFeatureIsOn
+ (NSString)requirementIdentifier;
- (HKFeatureAvailabilityRequirementFeatureIsOn)initWithFeatureIdentifier:(id)a3 isOnWhenSettingIsAbsent:(BOOL)a4;
- (HKFeatureAvailabilityRequirementFeatureIsOn)initWithFeatureIdentifier:(id)a3 settingsOnKey:(id)a4 isOnWhenSettingIsAbsent:(BOOL)a5;
- (NSString)requirementDescription;
@end

@implementation HKFeatureAvailabilityRequirementFeatureIsOn

- (HKFeatureAvailabilityRequirementFeatureIsOn)initWithFeatureIdentifier:(id)a3 isOnWhenSettingIsAbsent:(BOOL)a4
{
  return [(HKFeatureAvailabilityRequirementFeatureIsOn *)self initWithFeatureIdentifier:a3 settingsOnKey:@"Enabled" isOnWhenSettingIsAbsent:a4];
}

- (HKFeatureAvailabilityRequirementFeatureIsOn)initWithFeatureIdentifier:(id)a3 settingsOnKey:(id)a4 isOnWhenSettingIsAbsent:(BOOL)a5
{
  v6.receiver = self;
  v6.super_class = (Class)HKFeatureAvailabilityRequirementFeatureIsOn;
  return [(HKFeatureAvailabilityFeatureSettingBooleanRequirement *)&v6 initWithFeatureIdentifier:a3 settingsKey:a4 settingsValue:1 isSatisfiedWhenSettingIsAbsent:a5];
}

+ (NSString)requirementIdentifier
{
  return (NSString *)@"FeatureIsOn";
}

- (NSString)requirementDescription
{
  v2 = NSString;
  v3 = [(HKFeatureAvailabilityOnboardingRecordRequirement *)self featureIdentifier];
  v4 = [v2 stringWithFormat:@"%@ must be on", v3];

  return (NSString *)v4;
}

@end