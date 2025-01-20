@interface HKKeyValueDomain(HKHeartRhythmAdditions)
@end

@implementation HKKeyValueDomain(HKHeartRhythmAdditions)

- (void)hkhr_electrocardiogramRecordingFirstOnboardingCompletedDateWithError:()HKHeartRhythmAdditions .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v4 = a1;
  int v6 = 138543618;
  id v7 = (id)objc_opt_class();
  __int16 v8 = 2114;
  uint64_t v9 = a3;
  id v5 = v7;
  _os_log_error_impl(&dword_19C023000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Error reading first ECG onboarding completion date: %{public}@", (uint8_t *)&v6, 0x16u);
}

@end