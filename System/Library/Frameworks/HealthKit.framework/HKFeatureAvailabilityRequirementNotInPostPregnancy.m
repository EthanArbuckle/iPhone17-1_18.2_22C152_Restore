@interface HKFeatureAvailabilityRequirementNotInPostPregnancy
+ (id)requirementIdentifier;
- (id)requirementDescription;
@end

@implementation HKFeatureAvailabilityRequirementNotInPostPregnancy

+ (id)requirementIdentifier
{
  return @"NotInPostPregnancy";
}

- (id)requirementDescription
{
  return @"No pregnancy cycle factor sample that has ended within the last 12 weeks";
}

@end