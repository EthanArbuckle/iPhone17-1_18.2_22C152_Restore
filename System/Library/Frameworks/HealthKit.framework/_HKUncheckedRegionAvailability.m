@interface _HKUncheckedRegionAvailability
- (_HKUncheckedRegionAvailability)init;
- (unint64_t)ineligibilityReasonsForOnboardingCountryCode:(id)a3;
@end

@implementation _HKUncheckedRegionAvailability

- (_HKUncheckedRegionAvailability)init
{
  return (_HKUncheckedRegionAvailability *)-[HKRegionAvailability _initWithCategory:version:allowedCountries:](self, 1, @"unchecked", 0);
}

- (unint64_t)ineligibilityReasonsForOnboardingCountryCode:(id)a3
{
  return 0;
}

@end