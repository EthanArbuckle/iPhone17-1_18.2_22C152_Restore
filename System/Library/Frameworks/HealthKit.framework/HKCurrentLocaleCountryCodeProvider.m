@interface HKCurrentLocaleCountryCodeProvider
- (id)currentCountryCode;
@end

@implementation HKCurrentLocaleCountryCodeProvider

- (id)currentCountryCode
{
  v2 = objc_msgSend(MEMORY[0x1E4F1CA20], "hk_testableCurrentLocale");
  v3 = [v2 countryCode];

  return v3;
}

@end