@interface EKRecurrenceGenerator(Deprecated)
@end

@implementation EKRecurrenceGenerator(Deprecated)

+ (void)_isLunarBirthdayRecurrenceRule:()Deprecated lunarCalendarString:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1A4E47000, log, OS_LOG_TYPE_ERROR, "Lunar birthday without yearly frequency detected. recurrenceRule = %{public}@, lunarCalendar = %{public}@", (uint8_t *)&v3, 0x16u);
}

@end