@interface _HKAllowedCountriesInIntersectionOfLocalAndRemoteSet
- (BOOL)someRegionIsSupported;
- (_HKAllowedCountriesInIntersectionOfLocalAndRemoteSet)initWithLocalCountrySet:(id)a3 remoteCountrySet:(id)a4;
- (unint64_t)ineligibilityReasonsForOnboardingCountryCode:(id)a3;
@end

@implementation _HKAllowedCountriesInIntersectionOfLocalAndRemoteSet

- (_HKAllowedCountriesInIntersectionOfLocalAndRemoteSet)initWithLocalCountrySet:(id)a3 remoteCountrySet:(id)a4
{
  v6 = NSString;
  v7 = NSNumber;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v9, "contentVersion"));
  v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "contentVersion"));
  v12 = [v6 stringWithFormat:@"%@_%@_%@", @"intersectionOfLocalAndRemoteSet", v10, v11];
  v13 = (_HKAllowedCountriesInIntersectionOfLocalAndRemoteSet *)-[HKAllowedCountries _initWithCategory:version:localCountrySet:remoteState:remoteCountrySet:](self, 2, v12, v9, 5, v8);

  return v13;
}

- (unint64_t)ineligibilityReasonsForOnboardingCountryCode:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(HKAllowedCountries *)self localCountrySet];
    int v6 = [v5 containsCountryCode:v4];

    if (v6) {
      unint64_t v7 = 0;
    }
    else {
      unint64_t v7 = 8;
    }
    id v8 = [(HKAllowedCountries *)self remoteCountrySet];
    char v9 = [v8 containsCountryCode:v4];

    if ((v9 & 1) == 0) {
      v7 |= 0x20uLL;
    }
  }
  else
  {
    unint64_t v7 = 40;
  }

  return v7;
}

- (BOOL)someRegionIsSupported
{
  v3 = [(HKAllowedCountries *)self localCountrySet];
  int v4 = [v3 isEmpty];

  if (v4)
  {
    v5 = [(HKAllowedCountries *)self remoteCountrySet];
    int v6 = [v5 isEmpty] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 1;
  }
  return v6;
}

@end