@interface _HKAllowedCountriesInLocalAndRemoteIntersectionMissingRemoteRestriction
- (BOOL)someRegionIsSupported;
- (_HKAllowedCountriesInLocalAndRemoteIntersectionMissingRemoteRestriction)initWithLocalCountrySet:(id)a3 remoteState:(int64_t)a4;
- (unint64_t)ineligibilityReasonsForOnboardingCountryCode:(id)a3;
@end

@implementation _HKAllowedCountriesInLocalAndRemoteIntersectionMissingRemoteRestriction

- (_HKAllowedCountriesInLocalAndRemoteIntersectionMissingRemoteRestriction)initWithLocalCountrySet:(id)a3 remoteState:(int64_t)a4
{
  id v7 = a3;
  if (a4 == 5)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"HKAllowedCountries.m", 274, @"Invalid parameter not satisfying: %@", @"remoteState != HKRemoteAllowedCountriesStateReady" object file lineNumber description];
  }
  v8 = NSString;
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "contentVersion"));
  v10 = (void *)v9;
  if ((unint64_t)(a4 - 1) > 4) {
    v11 = @"unknown";
  }
  else {
    v11 = *(&off_1E58C27F0 + a4 - 1);
  }
  v12 = [v8 stringWithFormat:@"%@_%@_%@", @"intersectionOfLocalAndRemoteSet", v9, v11];
  v13 = (_HKAllowedCountriesInLocalAndRemoteIntersectionMissingRemoteRestriction *)-[HKAllowedCountries _initWithCategory:version:localCountrySet:remoteState:remoteCountrySet:](self, 2, v12, v7, a4, 0);

  return v13;
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
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = 8;
  }
  int64_t v8 = [(HKAllowedCountries *)self remoteState];
  uint64_t v9 = v7 | 4;
  uint64_t v10 = v7 | 2;
  if (v8 != 2) {
    uint64_t v10 = v7;
  }
  if (v8 != 3) {
    uint64_t v9 = v10;
  }
  if (v8 == 4) {
    unint64_t v11 = v7 | 0x10;
  }
  else {
    unint64_t v11 = v9;
  }

  return v11;
}

- (BOOL)someRegionIsSupported
{
  v2 = [(HKAllowedCountries *)self localCountrySet];
  char v3 = [v2 isEmpty] ^ 1;

  return v3;
}

@end