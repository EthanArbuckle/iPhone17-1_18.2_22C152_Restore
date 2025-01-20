@interface HDMCDailyAnalytics(Deviation)
@end

@implementation HDMCDailyAnalytics(Deviation)

+ (void)_setDeviationSampleFieldsInMetric:()Deviation profile:userCalendar:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_225722000, v5, v6, "[%{public}@] Error retrieving prolonged deviation samples count: %{public}@", v7, v8, v9, v10, v11);
}

+ (void)_setDeviationSampleFieldsInMetric:()Deviation profile:userCalendar:error:.cold.2()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_225722000, v5, v6, "[%{public}@] Error retrieving infrequent deviation samples count: %{public}@", v7, v8, v9, v10, v11);
}

+ (void)_setDeviationSampleFieldsInMetric:()Deviation profile:userCalendar:error:.cold.3()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_225722000, v5, v6, "[%{public}@] Error retrieving irregular deviation samples count: %{public}@", v7, v8, v9, v10, v11);
}

+ (void)_setDeviationSampleFieldsInMetric:()Deviation profile:userCalendar:error:.cold.4()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_225722000, v5, v6, "[%{public}@] Error retrieving spotting deviation samples count: %{public}@", v7, v8, v9, v10, v11);
}

+ (void)_setDetectedDeviationFieldsInMetric:()Deviation gregorianCalendar:deviationDetectionAnalyticsKeyValueDomain:todayDayIndex:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_225722000, v5, v6, "[%{public}@] Error getting spotting deviation detected count: %{public}@", v7, v8, v9, v10, v11);
}

+ (void)_setCycleFactorRelatedFieldsInMetric:()Deviation analysis:appProtectedKeyValueDomain:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_225722000, v5, v6, "[%{public}@] Failed to retrieve cycle factor reminder eligibility: %{public}@", v7, v8, v9, v10, v11);
}

@end