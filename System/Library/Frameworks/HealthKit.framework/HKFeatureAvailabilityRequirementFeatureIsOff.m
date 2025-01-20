@interface HKFeatureAvailabilityRequirementFeatureIsOff
+ (NSString)requirementIdentifier;
- (HKFeatureAvailabilityRequirementFeatureIsOff)initWithFeatureIdentifier:(id)a3 isOffWhenSettingIsAbsent:(BOOL)a4;
- (HKFeatureAvailabilityRequirementFeatureIsOff)initWithFeatureIdentifier:(id)a3 settingsOffKey:(id)a4 isOffWhenSettingIsAbsent:(BOOL)a5;
- (NSString)requirementDescription;
@end

@implementation HKFeatureAvailabilityRequirementFeatureIsOff

- (HKFeatureAvailabilityRequirementFeatureIsOff)initWithFeatureIdentifier:(id)a3 isOffWhenSettingIsAbsent:(BOOL)a4
{
  return [(HKFeatureAvailabilityRequirementFeatureIsOff *)self initWithFeatureIdentifier:a3 settingsOffKey:@"Enabled" isOffWhenSettingIsAbsent:a4];
}

- (HKFeatureAvailabilityRequirementFeatureIsOff)initWithFeatureIdentifier:(id)a3 settingsOffKey:(id)a4 isOffWhenSettingIsAbsent:(BOOL)a5
{
  v6.receiver = self;
  v6.super_class = (Class)HKFeatureAvailabilityRequirementFeatureIsOff;
  return [(HKFeatureAvailabilityFeatureSettingBooleanRequirement *)&v6 initWithFeatureIdentifier:a3 settingsKey:a4 settingsValue:0 isSatisfiedWhenSettingIsAbsent:a5];
}

+ (NSString)requirementIdentifier
{
  return (NSString *)@"FeatureIsOff";
}

- (NSString)requirementDescription
{
  v2 = NSString;
  v3 = [(HKFeatureAvailabilityOnboardingRecordRequirement *)self featureIdentifier];
  v4 = [v2 stringWithFormat:@"%@ must be off", v3];

  return (NSString *)v4;
}

@end