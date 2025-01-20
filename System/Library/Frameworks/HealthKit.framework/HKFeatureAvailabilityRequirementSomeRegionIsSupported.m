@interface HKFeatureAvailabilityRequirementSomeRegionIsSupported
+ (id)requirementIdentifier;
- (id)isSatisfiedWithRegionAvailability:(id)a3 dataSource:(id)a4 error:(id *)a5;
- (id)requirementDescription;
@end

@implementation HKFeatureAvailabilityRequirementSomeRegionIsSupported

+ (id)requirementIdentifier
{
  return @"SomeRegionIsSupported";
}

- (id)isSatisfiedWithRegionAvailability:(id)a3 dataSource:(id)a4 error:(id *)a5
{
  id v5 = a3;
  v6 = [v5 allowedCountries];

  if (v6)
  {
    v7 = NSNumber;
    v8 = [v5 allowedCountries];
    v9 = objc_msgSend(v7, "numberWithBool:", objc_msgSend(v8, "someRegionIsSupported"));
  }
  else
  {
    v9 = (void *)MEMORY[0x1E4F1CC38];
  }

  return v9;
}

- (id)requirementDescription
{
  v2 = NSString;
  v3 = [(HKFeatureAvailabilityRegionAvailabilityRequirement *)self featureIdentifier];
  v4 = [v2 stringWithFormat:@"At least one country must be supported for %@", v3];

  return v4;
}

@end