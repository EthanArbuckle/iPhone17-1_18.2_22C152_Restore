@interface HKECGOnboardingVersion
+ (unint64_t)newestAvailableVersion;
@end

@implementation HKECGOnboardingVersion

+ (unint64_t)newestAvailableVersion
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (+[_HKBehavior isAppleInternalInstall])
  {
    v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "hk_heartRhythmDefaults");
    v3 = [v2 objectForKey:@"ECGOnboardingVersionOverrideKey"];

    if ([v3 unsignedIntegerValue])
    {
      _HKInitializeLogging();
      v4 = (void *)HKLogHeartRhythm;
      if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
      {
        v5 = v4;
        int v9 = 136446466;
        v10 = "+[HKECGOnboardingVersion newestAvailableVersion]";
        __int16 v11 = 1024;
        int v12 = [v3 unsignedIntegerValue];
        _os_log_impl(&dword_19C023000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}s] Apply override onboarding version: %i", (uint8_t *)&v9, 0x12u);
      }
      unint64_t v6 = [v3 unsignedIntegerValue];

      return v6;
    }
  }
  _HKInitializeLogging();
  v7 = HKLogHeartRhythm;
  unint64_t v6 = 4;
  if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136446466;
    v10 = "+[HKECGOnboardingVersion newestAvailableVersion]";
    __int16 v11 = 1024;
    int v12 = 4;
    _os_log_impl(&dword_19C023000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}s] Newest available version: %i", (uint8_t *)&v9, 0x12u);
  }
  return v6;
}

@end