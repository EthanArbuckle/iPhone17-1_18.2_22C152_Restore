@interface HKFeatureAvailabilityRequirementBloodOxygenRecordingsAreEnabled
+ (id)requirementIdentifier;
- (BOOL)defaultBoolValueWhenKeyIsMissing;
- (BOOL)isSatisfiedForBoolValue:(BOOL)a3;
- (HKFeatureAvailabilityRequirementBloodOxygenRecordingsAreEnabled)init;
- (id)requirementDescription;
- (id)whichUserDefaultsDataSourceInDataSource:(id)a3;
@end

@implementation HKFeatureAvailabilityRequirementBloodOxygenRecordingsAreEnabled

- (HKFeatureAvailabilityRequirementBloodOxygenRecordingsAreEnabled)init
{
  v3.receiver = self;
  v3.super_class = (Class)HKFeatureAvailabilityRequirementBloodOxygenRecordingsAreEnabled;
  return [(HKFeatureAvailabilityRequirementUserDefaultEvaluator *)&v3 initWithUserDefaultsKey:@"BackgroundMeasurementsEnabled"];
}

- (BOOL)defaultBoolValueWhenKeyIsMissing
{
  return 0;
}

- (BOOL)isSatisfiedForBoolValue:(BOOL)a3
{
  return a3;
}

- (id)whichUserDefaultsDataSourceInDataSource:(id)a3
{
  return (id)[a3 respiratoryPreferencesDataSource];
}

+ (id)requirementIdentifier
{
  return @"BloodOxygenRecordingsAreEnabled";
}

- (id)requirementDescription
{
  return @"Blood Oxygen Recordings must be enabled";
}

@end