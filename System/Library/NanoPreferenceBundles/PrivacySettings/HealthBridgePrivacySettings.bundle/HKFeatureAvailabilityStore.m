@interface HKFeatureAvailabilityStore
- (BOOL)hk_isRescindedDisabled;
@end

@implementation HKFeatureAvailabilityStore

- (BOOL)hk_isRescindedDisabled
{
  id v8 = 0;
  v3 = [(HKFeatureAvailabilityStore *)self onboardedCountryCodeSupportedStateWithError:&v8];
  id v4 = v8;
  if (v3)
  {
    BOOL v5 = [v3 intValue] == 4;
  }
  else
  {
    _HKInitializeLogging();
    v6 = (void *)HKLogDefault;
    if (os_log_type_enabled(HKLogDefault, OS_LOG_TYPE_ERROR)) {
      sub_87D0(v6, self, (uint64_t)v4);
    }
    BOOL v5 = 0;
  }

  return v5;
}

@end