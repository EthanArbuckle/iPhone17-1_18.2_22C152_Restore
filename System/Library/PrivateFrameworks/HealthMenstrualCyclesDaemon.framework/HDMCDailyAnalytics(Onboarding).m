@interface HDMCDailyAnalytics(Onboarding)
@end

@implementation HDMCDailyAnalytics(Onboarding)

+ (void)_setDiagnosticOnboardingFieldsInMetric:()Onboarding keyValueDomain:heartRateInputFeatureStatus:deviationDetectionFeatureStatus:wristTemperatureInputFeatureStatus:gregorianCalendar:error:.cold.1(void *a1)
{
  id v1 = a1;
  v2 = objc_opt_class();
  id v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_225722000, v4, v5, "[%{public}@] Failed to read onboarding completed with error: %{public}@", v6, v7, v8, v9, v10);
}

+ (void)_setDiagnosticOnboardingFieldsInMetric:()Onboarding keyValueDomain:heartRateInputFeatureStatus:deviationDetectionFeatureStatus:wristTemperatureInputFeatureStatus:gregorianCalendar:error:.cold.2(void *a1)
{
  id v1 = a1;
  v2 = objc_opt_class();
  id v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_225722000, v4, v5, "[%{public}@] Failed to read first onboarding completed date with error: %{public}@", v6, v7, v8, v9, v10);
}

@end