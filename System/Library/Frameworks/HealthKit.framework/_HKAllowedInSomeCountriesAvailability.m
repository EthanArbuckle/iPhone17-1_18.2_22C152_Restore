@interface _HKAllowedInSomeCountriesAvailability
- (_HKAllowedInSomeCountriesAvailability)initWithAllowedCountries:(id)a3;
- (unint64_t)ineligibilityReasonsForOnboardingCountryCode:(id)a3;
@end

@implementation _HKAllowedInSomeCountriesAvailability

- (_HKAllowedInSomeCountriesAvailability)initWithAllowedCountries:(id)a3
{
  v4 = NSString;
  id v5 = a3;
  v6 = [v5 version];
  v7 = [v4 stringWithFormat:@"allowedInSomeCountries_%@", v6];
  v8 = (_HKAllowedInSomeCountriesAvailability *)-[HKRegionAvailability _initWithCategory:version:allowedCountries:](self, 3, v7, v5);

  return v8;
}

- (unint64_t)ineligibilityReasonsForOnboardingCountryCode:(id)a3
{
  id v5 = a3;
  v6 = [(HKRegionAvailability *)self allowedCountries];

  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"HKRegionAvailability.m", 185, @"Invalid parameter not satisfying: %@", @"self.allowedCountries" object file lineNumber description];
  }
  v7 = [(HKRegionAvailability *)self allowedCountries];
  uint64_t v8 = [v7 ineligibilityReasonsForOnboardingCountryCode:v5];

  return v8 | (v5 == 0);
}

@end