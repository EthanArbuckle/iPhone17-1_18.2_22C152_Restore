@interface CalFloatingDateHelper
+ (id)dateInFloatingTimeZoneFromDate:(id)a3 inTimeZone:(id)a4;
+ (id)dateInTimeZone:(id)a3 fromFloatingDateInGMT:(id)a4;
+ (void)_initCustomCalendar;
@end

@implementation CalFloatingDateHelper

+ (void)_initCustomCalendar
{
  id v2 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  floatingDateCustomCalendar = [v2 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];

  MEMORY[0x1F41817F8]();
}

+ (id)dateInTimeZone:(id)a3 fromFloatingDateInGMT:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    if (floatingDatePredicate != -1) {
      dispatch_once(&floatingDatePredicate, &__block_literal_global_27);
    }
    id v7 = objc_alloc(MEMORY[0x1E4F1C9A8]);
    v8 = (void *)[v7 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
    v9 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"GMT"];
    [v8 setTimeZone:v9];
    v10 = [v8 components:252 fromDate:v6];
    id v11 = (id)floatingDateCustomCalendar;
    objc_sync_enter(v11);
    [(id)floatingDateCustomCalendar setTimeZone:v5];
    v12 = [(id)floatingDateCustomCalendar dateFromComponents:v10];
    objc_sync_exit(v11);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

uint64_t __62__CalFloatingDateHelper_dateInTimeZone_fromFloatingDateInGMT___block_invoke()
{
  return +[CalFloatingDateHelper _initCustomCalendar];
}

+ (id)dateInFloatingTimeZoneFromDate:(id)a3 inTimeZone:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    if (floatingDatePredicate != -1) {
      dispatch_once(&floatingDatePredicate, &__block_literal_global_5_0);
    }
    id v7 = (id)floatingDateCustomCalendar;
    objc_sync_enter(v7);
    [(id)floatingDateCustomCalendar setTimeZone:v6];
    v8 = [(id)floatingDateCustomCalendar components:252 fromDate:v5];
    objc_sync_exit(v7);

    id v9 = objc_alloc(MEMORY[0x1E4F1C9A8]);
    v10 = (void *)[v9 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
    id v11 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"GMT"];
    [v10 setTimeZone:v11];
    v12 = [v10 dateFromComponents:v8];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

uint64_t __67__CalFloatingDateHelper_dateInFloatingTimeZoneFromDate_inTimeZone___block_invoke()
{
  return +[CalFloatingDateHelper _initCustomCalendar];
}

@end