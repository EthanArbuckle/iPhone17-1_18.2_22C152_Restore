@interface HKFeatureAvailabilityRequirementNoOngoingPregnancy
+ (id)requirementIdentifier;
- (id)requirementDescription;
@end

@implementation HKFeatureAvailabilityRequirementNoOngoingPregnancy

+ (id)requirementIdentifier
{
  return @"NoOngoingPregnancy";
}

- (id)requirementDescription
{
  return @"No ongoing pregnancy sample.";
}

@end