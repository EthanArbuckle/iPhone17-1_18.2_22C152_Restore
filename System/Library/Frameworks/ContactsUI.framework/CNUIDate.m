@interface CNUIDate
+ (BOOL)isYearlessComponents:(id)a3;
+ (id)GMTComponentsFromDate:(id)a3 sourceCalendar:(id)a4;
+ (id)componentsFromDate:(id)a3 sourceCalendar:(id)a4 destinationCalendar:(id)a5;
+ (id)currentCalendarGMT;
+ (id)dateByNormalizingToGMT:(id)a3;
+ (id)dateFromComponents:(id)a3 destinationCalendar:(id)a4;
+ (id)gregorianCalendarGMT;
+ (id)yearlessComponentsFromDate:(id)a3 calendar:(id)a4;
+ (id)yearlessGregorianComponentsFromGMTDate:(id)a3;
+ (void)initialize;
+ (void)localeDidChange:(id)a3;
@end

@implementation CNUIDate

+ (BOOL)isYearlessComponents:(id)a3
{
  id v3 = a3;
  if ([v3 year] == 0x7FFFFFFFFFFFFFFFLL)
  {
    char v4 = 1;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E4F70FE8];
    v6 = [v3 calendar];
    char v4 = [v5 isYearlessDate:v3 forCalendar:v6];
  }
  return v4;
}

+ (id)dateByNormalizingToGMT:(id)a3
{
  if (a3)
  {
    id v3 = (void *)MEMORY[0x1E4F1C9A8];
    id v4 = a3;
    v5 = [v3 currentCalendar];
    v6 = [v5 components:30 fromDate:v4];

    [v6 setHour:12];
    [v6 setMinute:0];
    [v6 setSecond:0];
    v7 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
    [v5 setTimeZone:v7];

    v8 = [v5 dateFromComponents:v6];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)dateFromComponents:(id)a3 destinationCalendar:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = v7;
    v9 = (void *)[v7 copy];

    v10 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
    [v9 setTimeZone:v10];
  }
  else
  {
    v9 = +[CNUIDate gregorianCalendarGMT];
  }
  v11 = (void *)[v6 copy];
  [v11 setHour:12];
  [v11 setMinute:0];
  [v11 setSecond:0];
  v12 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [v11 setTimeZone:v12];

  if (+[CNUIDate isYearlessComponents:v11])
  {
    v13 = [v11 calendar];

    if (!v13)
    {
      v14 = [a1 currentCalendarGMT];
      [v11 setCalendar:v14];
    }
    uint64_t v24 = 0;
    v15 = [MEMORY[0x1E4F1C9C8] distantFuture];
    [v9 getEra:&v24 year:0 month:0 day:0 fromDate:v15];

    [v11 setEra:v24];
    [MEMORY[0x1E4F70FE8] setYearlessYear:v11 forCalendar:v9];
    uint64_t v16 = [v9 dateFromComponents:v11];
    goto LABEL_8;
  }
  if (v9)
  {
    v18 = [v11 date];
    v19 = [v9 components:2097182 fromDate:v18];

    v20 = v9;
    v21 = v19;
  }
  else
  {
    v23 = [v11 calendar];

    if (v23)
    {
      uint64_t v16 = [v11 date];
LABEL_8:
      v17 = (void *)v16;
      goto LABEL_12;
    }
    v20 = [a1 currentCalendarGMT];
    v19 = v20;
    v21 = v11;
  }
  v17 = [v20 dateFromComponents:v21];

LABEL_12:

  return v17;
}

+ (id)yearlessComponentsFromDate:(id)a3 calendar:(id)a4
{
  id v5 = a4;
  id v6 = [v5 components:24 fromDate:a3];
  [v6 setCalendar:v5];

  return v6;
}

+ (id)yearlessGregorianComponentsFromGMTDate:(id)a3
{
  id v4 = a3;
  id v5 = [a1 gregorianCalendarGMT];
  id v6 = [a1 yearlessComponentsFromDate:v4 calendar:v5];

  return v6;
}

+ (id)componentsFromDate:(id)a3 sourceCalendar:(id)a4 destinationCalendar:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = (void *)[a5 copy];
  v11 = [v8 timeZone];
  [v10 setTimeZone:v11];

  v12 = [v8 components:1048606 fromDate:v9];

  if (+[CNUIDate isYearlessComponents:v12]) {
    [a1 yearlessComponentsFromDate:v9 calendar:v10];
  }
  else {
  v13 = [v10 components:1048606 fromDate:v9];
  }

  return v13;
}

+ (id)GMTComponentsFromDate:(id)a3 sourceCalendar:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 gregorianCalendarGMT];
  id v9 = [a1 componentsFromDate:v7 sourceCalendar:v6 destinationCalendar:v8];

  return v9;
}

+ (id)gregorianCalendarGMT
{
  if (gregorianCalendarGMT_onceToken != -1) {
    dispatch_once(&gregorianCalendarGMT_onceToken, &__block_literal_global_7_5103);
  }
  v2 = (void *)gregorianCalendarGMT_calendar;

  return v2;
}

void __32__CNUIDate_gregorianCalendarGMT__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  uint64_t v1 = [v0 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  v2 = (void *)gregorianCalendarGMT_calendar;
  gregorianCalendarGMT_calendar = v1;

  id v3 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [(id)gregorianCalendarGMT_calendar setTimeZone:v3];
}

+ (id)currentCalendarGMT
{
  dispatch_sync((dispatch_queue_t)calendarQueue, &__block_literal_global_3_5105);
  v2 = (void *)currentCalendar;

  return v2;
}

void __30__CNUIDate_currentCalendarGMT__block_invoke()
{
  if (!currentCalendar)
  {
    uint64_t v0 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    uint64_t v1 = (void *)currentCalendar;
    currentCalendar = v0;

    id v2 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
    [(id)currentCalendar setTimeZone:v2];
  }
}

+ (void)localeDidChange:(id)a3
{
}

void __28__CNUIDate_localeDidChange___block_invoke()
{
  uint64_t v0 = (void *)currentCalendar;
  currentCalendar = 0;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:a1 selector:sel_localeDidChange_ name:*MEMORY[0x1E4F1C370] object:0];

    dispatch_queue_t v4 = dispatch_queue_create(0, 0);
    id v5 = (void *)calendarQueue;
    calendarQueue = (uint64_t)v4;
  }
}

@end