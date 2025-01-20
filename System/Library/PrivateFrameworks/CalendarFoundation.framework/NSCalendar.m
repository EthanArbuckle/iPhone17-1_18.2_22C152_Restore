@interface NSCalendar
@end

@implementation NSCalendar

void __56__NSCalendar_CalClassAdditions__CalGregorianGMTCalendar__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  uint64_t v1 = [v0 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  v2 = (void *)CalGregorianGMTCalendar_gregorianGMTCalendar;
  CalGregorianGMTCalendar_gregorianGMTCalendar = v1;

  id v3 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"GMT"];
  [(id)CalGregorianGMTCalendar_gregorianGMTCalendar setTimeZone:v3];
}

uint64_t __71__NSCalendar_CalClassAdditions__CalOccurrencesForBirthday_inDateRange___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if (v6
    && (v10 = v6,
        [*(id *)(a1 + 32) endDate],
        v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v10 CalIsAfterOrSameAsDate:v7],
        v7,
        !v8))
  {
    if ([*(id *)(a1 + 32) containsDate:v10]) {
      [*(id *)(a1 + 40) addObject:v10];
    }
  }
  else
  {
    *a4 = 1;
  }

  return MEMORY[0x1F41817F8]();
}

void __66__NSCalendar_CalClassAdditions__sharedAutoupdatingCurrentCalendar__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) autoupdatingCurrentCalendar];
  uint64_t v1 = [v3 copy];
  v2 = (void *)sharedAutoupdatingCurrentCalendar_autoupdatingCalendar;
  sharedAutoupdatingCurrentCalendar_autoupdatingCalendar = v1;
}

void __57__NSCalendar_CalClassAdditions__CalYearlessDateThreshold__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  id v4 = (id)[v0 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  uint64_t v1 = (void *)[objc_alloc(MEMORY[0x1E4F1CAF0]) initWithName:@"UTC"];
  [v4 setTimeZone:v1];
  uint64_t v2 = [v4 dateWithEra:1 year:1605 month:1 day:1 hour:0 minute:0 second:0 nanosecond:0];
  id v3 = (void *)CalYearlessDateThreshold_s_threshold;
  CalYearlessDateThreshold_s_threshold = v2;
}

void __63__NSCalendar_CalClassAdditions__CalDateFromBirthdayComponents___block_invoke(uint64_t a1, void *a2, int a3, unsigned char *a4)
{
  id v8 = a2;
  if (a3)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    if (v8)
    {
LABEL_9:
      *a4 = 1;
      goto LABEL_10;
    }
    v9 = +[CalFoundationLogSubsystem defaultCategory];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __63__NSCalendar_CalClassAdditions__CalDateFromBirthdayComponents___block_invoke_cold_1(a1, v9);
    }
LABEL_8:

    goto LABEL_9;
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v11 = *(void *)(v10 + 24);
  *(void *)(v10 + 24) = v11 + 1;
  if (v11 >= 5)
  {
    v9 = +[CalFoundationLogSubsystem defaultCategory];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __63__NSCalendar_CalClassAdditions__CalDateFromBirthdayComponents___block_invoke_cold_2(a1, v9);
    }
    goto LABEL_8;
  }
LABEL_10:
}

void __63__NSCalendar_CalClassAdditions__CalDateFromBirthdayComponents___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_190D88000, a2, OS_LOG_TYPE_ERROR, "BirthdayCal: unexpected nil date for birthday components: %@", (uint8_t *)&v3, 0xCu);
}

void __63__NSCalendar_CalClassAdditions__CalDateFromBirthdayComponents___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_190D88000, a2, OS_LOG_TYPE_ERROR, "BirthdayCal: enumerateDatesStartingAfterDate seems to be looping forever for birthday components: %@", (uint8_t *)&v3, 0xCu);
}

@end