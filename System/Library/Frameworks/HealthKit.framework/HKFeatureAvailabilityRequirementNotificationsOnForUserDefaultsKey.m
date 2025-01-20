@interface HKFeatureAvailabilityRequirementNotificationsOnForUserDefaultsKey
+ (id)requirementIdentifier;
- (BOOL)defaultBoolValueWhenKeyIsMissing;
- (BOOL)isSatisfiedForBoolValue:(BOOL)a3;
- (id)requirementDescription;
- (id)whichUserDefaultsDataSourceInDataSource:(id)a3;
@end

@implementation HKFeatureAvailabilityRequirementNotificationsOnForUserDefaultsKey

+ (id)requirementIdentifier
{
  return @"NotificationsOnForUserDefaultsKey";
}

- (id)requirementDescription
{
  v2 = NSString;
  v3 = [(HKFeatureAvailabilityRequirementUserDefaultEvaluator *)self userDefaultsKey];
  v4 = [v2 stringWithFormat:@"The value of the notifications user defaults key %@ must be YES", v3];

  return v4;
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
  return (id)[a3 userNotificationSettingsDataSource];
}

@end