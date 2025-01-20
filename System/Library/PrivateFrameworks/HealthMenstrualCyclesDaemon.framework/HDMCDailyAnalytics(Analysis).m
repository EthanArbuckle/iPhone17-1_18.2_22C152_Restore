@interface HDMCDailyAnalytics(Analysis)
@end

@implementation HDMCDailyAnalytics(Analysis)

+ (void)_setFertileWindowFieldsInMetric:()Analysis analysis:profile:todayDayIndex:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_225722000, v5, v6, "[%{public}@] Error computing days with wrist temperature samples 6 days before calendar based fertile window end: %{public}@", v7, v8, v9, v10, v11);
}

+ (void)_setFertileWindowFieldsInMetric:()Analysis analysis:profile:todayDayIndex:error:.cold.2()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_225722000, v5, v6, "[%{public}@] Error computing days with wrist temperature samples 10 days before calendar based fertile window end: %{public}@", v7, v8, v9, v10, v11);
}

+ (void)_setFertileWindowFieldsInMetric:()Analysis analysis:profile:todayDayIndex:error:.cold.3()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_225722000, v5, v6, "[%{public}@] Error computing days with wrist temperature samples 3 days after calendar based fertile window end: %{public}@", v7, v8, v9, v10, v11);
}

+ (void)_setFertileWindowFieldsInMetric:()Analysis analysis:profile:todayDayIndex:error:.cold.4()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_225722000, v5, v6, "[%{public}@] Error computing days with wrist temperature samples 6 days after calendar based fertile window end: %{public}@", v7, v8, v9, v10, v11);
}

+ (void)_setFertileWindowFieldsInMetric:()Analysis analysis:profile:todayDayIndex:error:.cold.5()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_225722000, v5, v6, "[%{public}@] Error computing days with wrist temperature samples 10 days after calendar based fertile window end: %{public}@", v7, v8, v9, v10, v11);
}

+ (void)_setCycleStatisticsFieldsInMetric:()Analysis analysis:keyValueDomain:fertileWindowNotificationKeyValueDomain:todayDayIndex:todayAsDate:gregorianCalendar:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_225722000, v5, v6, "[%{public}@] Failed to read last fired date for update fertile window notification: %{public}@", v7, v8, v9, v10, v11);
}

+ (void)_setCycleStatisticsFieldsInMetric:()Analysis analysis:keyValueDomain:fertileWindowNotificationKeyValueDomain:todayDayIndex:todayAsDate:gregorianCalendar:error:.cold.2()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_225722000, v5, v6, "[%{public}@] Failed to read last logged in feature experience date with error: %{public}@", v7, v8, v9, v10, v11);
}

@end