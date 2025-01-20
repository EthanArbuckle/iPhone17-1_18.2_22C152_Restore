@interface HKRemoteFeatureAvailabilityOnboardingCountryCodeRule
+ (id)ruleIdentifier;
- (BOOL)evaluate;
- (NSString)onboardingCountryCode;
- (void)processUserInfo:(id)a3;
- (void)setOnboardingCountryCode:(id)a3;
@end

@implementation HKRemoteFeatureAvailabilityOnboardingCountryCodeRule

+ (id)ruleIdentifier
{
  return @"OnboardingCountryCode";
}

- (void)processUserInfo:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"OnboardingCountryCode"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(HKRemoteFeatureAvailabilityOnboardingCountryCodeRule *)self setOnboardingCountryCode:v4];
  }
}

- (BOOL)evaluate
{
  v3 = [(HKRemoteFeatureAvailabilityOnboardingCountryCodeRule *)self onboardingCountryCode];

  if (!v3) {
    return 0;
  }
  id v4 = [(HKRemoteFeatureAvailabilityOnboardingCountryCodeRule *)self onboardingCountryCode];
  if ([v4 isEqualToString:@"NIL_COUNTRYCODE"])
  {
    v5 = [(HKRemoteFeatureAvailabilityBaseRule *)self dataSource];
    v6 = [v5 onboardingCountryCode];

    if (!v6) {
      return 1;
    }
  }
  else
  {
  }
  v8 = [(HKRemoteFeatureAvailabilityBaseRule *)self dataSource];
  v9 = [v8 onboardingCountryCode];
  v10 = [(HKRemoteFeatureAvailabilityOnboardingCountryCodeRule *)self onboardingCountryCode];
  char v11 = [v9 isEqualToString:v10];

  return v11;
}

- (NSString)onboardingCountryCode
{
  return self->_onboardingCountryCode;
}

- (void)setOnboardingCountryCode:(id)a3
{
}

- (void).cxx_destruct
{
}

@end