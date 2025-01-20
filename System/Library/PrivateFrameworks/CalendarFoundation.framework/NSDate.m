@interface NSDate
@end

@implementation NSDate

void __65__NSDate_CalendarAdditions__dateAtHour_minute_second_inTimeZone___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    _EKSharedGregorianCalendarForTimeZone(*(void **)(a1 + 40));
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    v2 = [v6 components:30 fromDate:*(void *)(a1 + 32)];
    [v2 setHour:*(void *)(a1 + 56)];
    [v2 setMinute:*(void *)(a1 + 64)];
    [v2 setSecond:*(void *)(a1 + 72)];
    [v2 setTimeZone:*(void *)(a1 + 40)];
    uint64_t v3 = [v6 dateFromComponents:v2];
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
}

void __55__NSDate_CalendarAdditions__dateForEndOfDayInTimeZone___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    _EKSharedGregorianCalendarForTimeZone(*(void **)(a1 + 40));
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v2 = [v5 dateByAddingComponents:*(void *)(a1 + 48) toDate:*(void *)(a1 + 56) options:0];
    uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
}

uint64_t __65__NSDate_CalendarAdditions__dateWithoutTimeComponentsInTimeZone___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) dateRemovingTimeComponentsInCalendar:a2];

  return MEMORY[0x1F41817F8]();
}

void __72__NSDate_CalendarAdditions___performBlockBehindDispatchSync_inTimeZone___block_invoke(uint64_t a1)
{
  _EKSharedGregorianCalendarForTimeZone(*(void **)(a1 + 32));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __35__NSDate_CalClassAdditions__calGMT__block_invoke()
{
  calGMT_gmt = [MEMORY[0x1E4F1CAF0] timeZoneWithAbbreviation:@"GMT"];

  return MEMORY[0x1F41817F8]();
}

uint64_t __72__NSDate_CalClassAdditions___stringWithUseAbbreviatedFormats_lowerCase___block_invoke()
{
  _stringWithUseAbbreviatedFormats_lowerCase__calendar = [MEMORY[0x1E4F1C9A8] currentCalendar];

  return MEMORY[0x1F41817F8]();
}

@end