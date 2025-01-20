@interface NSDate(CalDateLocalization)
- (__CFString)localizedStringWithFormat:()CalDateLocalization timeZone:;
- (id)localizedStringWithFormat:()CalDateLocalization;
@end

@implementation NSDate(CalDateLocalization)

- (id)localizedStringWithFormat:()CalDateLocalization
{
  id v4 = a3;
  v5 = +[CalChronometry activeTimeZone];
  v6 = [a1 localizedStringWithFormat:v4 timeZone:v5];

  return v6;
}

- (__CFString)localizedStringWithFormat:()CalDateLocalization timeZone:
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_opt_class();
  objc_sync_enter(v8);
  +[CalDateLocalization initializeFormatters];
  v9 = +[CalDateLocalization _dateFormatterForKey:v6];
  v10 = v9;
  if (v9)
  {
    CFStringRef v11 = (const __CFString *)*MEMORY[0x1E4F1D0F8];
    CFTypeRef v12 = CFDateFormatterCopyProperty(v9, (CFDateFormatterKey)*MEMORY[0x1E4F1D0F8]);
    if (v7 && ([v7 isEqualToTimeZone:v12] & 1) == 0) {
      CFDateFormatterSetProperty(v10, v11, v7);
    }
    if (v12) {
      CFRelease(v12);
    }
    StringWithDate = (__CFString *)CFDateFormatterCreateStringWithDate(0, v10, a1);
  }
  else
  {
    v14 = +[CalFoundationLogSubsystem defaultCategory];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[NSDate(CalDateLocalization) localizedStringWithFormat:timeZone:]((uint64_t)v6, v14);
    }

    StringWithDate = &stru_1EE0C39E0;
  }
  objc_sync_exit(v8);

  return StringWithDate;
}

- (void)localizedStringWithFormat:()CalDateLocalization timeZone:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  v3 = "-[NSDate(CalDateLocalization) localizedStringWithFormat:timeZone:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_190D88000, a2, OS_LOG_TYPE_ERROR, "%s ERROR: unable to localize date because no formatter exists for \"%@\"", (uint8_t *)&v2, 0x16u);
}

@end