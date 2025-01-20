@interface _HKAllowedCountriesInLocalSet
- (BOOL)someRegionIsSupported;
- (_HKAllowedCountriesInLocalSet)initWithLocalCountrySet:(id)a3;
- (unint64_t)ineligibilityReasonsForOnboardingCountryCode:(id)a3;
@end

@implementation _HKAllowedCountriesInLocalSet

- (_HKAllowedCountriesInLocalSet)initWithLocalCountrySet:(id)a3
{
  v4 = NSString;
  v5 = NSNumber;
  id v6 = a3;
  v7 = objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v6, "contentVersion"));
  v8 = [v4 stringWithFormat:@"%@_%@", @"localSet", v7];
  v9 = (_HKAllowedCountriesInLocalSet *)-[HKAllowedCountries _initWithCategory:version:localCountrySet:remoteState:remoteCountrySet:](self, 1, v8, v6, 1, 0);

  return v9;
}

- (unint64_t)ineligibilityReasonsForOnboardingCountryCode:(id)a3
{
  id v4 = a3;
  if (v4
    && ([(HKAllowedCountries *)self localCountrySet],
        v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 containsCountryCode:v4],
        v5,
        (v6 & 1) != 0))
  {
    unint64_t v7 = 0;
  }
  else
  {
    unint64_t v7 = 8;
  }

  return v7;
}

- (BOOL)someRegionIsSupported
{
  v2 = [(HKAllowedCountries *)self localCountrySet];
  char v3 = [v2 isEmpty] ^ 1;

  return v3;
}

@end