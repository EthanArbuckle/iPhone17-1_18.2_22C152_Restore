@interface HKHeartRhythmAvailability
- (BOOL)hprf_isElectrocardiogramSupportedOnWatch:(id)a3;
@end

@implementation HKHeartRhythmAvailability

- (BOOL)hprf_isElectrocardiogramSupportedOnWatch:(id)a3
{
  id v4 = a3;
  v5 = [(HKHeartRhythmAvailability *)self electrocardiogramOnboardingCountryCode];
  if (![(id)objc_opt_class() isElectrocardiogramSupportedOnWatch:v4]
    || [(id)objc_opt_class() isCompanionRegionCheckEnabledForActiveWatch]
    && v5
    && ![(HKHeartRhythmAvailability *)self isElectrocardiogramAvailableOnWatch:v4 countryCode:v5])
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    v6 = +[_HKBehavior sharedBehavior];
    if ([v6 healthAppHidden])
    {
      LOBYTE(v7) = 0;
    }
    else
    {
      v8 = +[_HKBehavior sharedBehavior];
      unsigned int v7 = [v8 tinkerModeEnabled] ^ 1;
    }
  }

  return v7;
}

@end