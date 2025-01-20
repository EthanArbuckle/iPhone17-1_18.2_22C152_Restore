@interface HDKeyValueDomain(AFibBurdenNotificationManagerAdherence)
- (void)setNotificationSentDate:()AFibBurdenNotificationManagerAdherence;
@end

@implementation HDKeyValueDomain(AFibBurdenNotificationManagerAdherence)

- (void)setNotificationSentDate:()AFibBurdenNotificationManagerAdherence
{
  uint64_t v3 = *MEMORY[0x1E4F67D50];
  id v7 = 0;
  char v4 = [a1 setDate:a3 forKey:v3 error:&v7];
  id v5 = v7;
  if ((v4 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = HKHRAFibBurdenLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[HDKeyValueDomain(AFibBurdenNotificationManagerAdherence) setNotificationSentDate:]();
    }
  }
}

- (void)setNotificationSentDate:()AFibBurdenNotificationManagerAdherence .cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1(&dword_1D3AC6000, v0, v1, "[%{public}@] Failed to write notification last sent date due to error %{public}@");
}

@end