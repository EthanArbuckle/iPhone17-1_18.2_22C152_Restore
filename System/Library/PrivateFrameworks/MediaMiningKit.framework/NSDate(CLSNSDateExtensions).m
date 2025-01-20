@interface NSDate(CLSNSDateExtensions)
+ (id)dateComponentsFromString:()CLSNSDateExtensions;
+ (id)dateFromString:()CLSNSDateExtensions;
- (id)dateByAddingDays:()CLSNSDateExtensions;
- (id)nextWeekend;
- (id)previousWeekend;
@end

@implementation NSDate(CLSNSDateExtensions)

- (id)previousWeekend
{
  int64_t v2 = -+[CLSCalendar dayOfWeekFromDate:a1];
  return +[CLSCalendar dateByAddingDays:v2 toDate:a1];
}

- (id)nextWeekend
{
  int64_t v2 = (7 - +[CLSCalendar dayFromDate:a1]) % 7;
  return +[CLSCalendar dateByAddingDays:v2 toDate:a1];
}

- (id)dateByAddingDays:()CLSNSDateExtensions
{
  return +[CLSCalendar dateByAddingDays:a3 toDate:a1];
}

+ (id)dateComponentsFromString:()CLSNSDateExtensions
{
  id v3 = a3;
  if (!v3)
  {
    v8 = 0;
    goto LABEL_17;
  }
  if (dateComponentsFromString__onceToken != -1) {
    dispatch_once(&dateComponentsFromString__onceToken, &__block_literal_global_19);
  }
  uint64_t v4 = [(id)dateComponentsFromString__formatter1 dateFromString:v3];
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (void *)dateComponentsFromString__calendar;
    v7 = (void *)dateComponentsFromString__formatter1;
  }
  else
  {
    uint64_t v9 = [(id)dateComponentsFromString__formatter2 dateFromString:v3];
    if (v9)
    {
      v5 = (void *)v9;
      v6 = (void *)dateComponentsFromString__calendar;
      v7 = (void *)dateComponentsFromString__formatter2;
    }
    else
    {
      uint64_t v10 = [(id)dateComponentsFromString__formatter3 dateFromString:v3];
      if (v10)
      {
        v5 = (void *)v10;
        v6 = (void *)dateComponentsFromString__calendar;
        v7 = (void *)dateComponentsFromString__formatter3;
      }
      else
      {
        uint64_t v11 = [(id)dateComponentsFromString__formatter4 dateFromString:v3];
        if (v11)
        {
          v5 = (void *)v11;
          v6 = (void *)dateComponentsFromString__calendar;
          v7 = (void *)dateComponentsFromString__formatter4;
        }
        else
        {
          v5 = [(id)dateComponentsFromString__formatter5 dateFromString:v3];
          if (!v5)
          {
            v8 = 0;
            goto LABEL_16;
          }
          v6 = (void *)dateComponentsFromString__calendar;
          v7 = (void *)dateComponentsFromString__formatter5;
        }
      }
    }
  }
  v12 = [v7 timeZone];
  v8 = [v6 componentsInTimeZone:v12 fromDate:v5];

LABEL_16:
LABEL_17:

  return v8;
}

+ (id)dateFromString:()CLSNSDateExtensions
{
  id v3 = a3;
  if (!v3)
  {
LABEL_13:
    uint64_t v4 = 0;
    goto LABEL_14;
  }
  if (dateFromString__onceToken != -1) {
    dispatch_once(&dateFromString__onceToken, &__block_literal_global_1956);
  }
  uint64_t v4 = [(id)dateFromString__formatter1 dateFromString:v3];
  if (!v4)
  {
    uint64_t v5 = [(id)dateFromString__formatter2 dateFromString:v3];
    if (!v5
      || (v6 = (void *)v5,
          [(id)dateFromString__calendar components:252 fromDate:v5],
          v7 = objc_claimAutoreleasedReturnValue(),
          +[CLSCalendar dateFromComponents:v7 inTimeZone:0], uint64_t v4 = objc_claimAutoreleasedReturnValue(), v6, v7, !v4))
    {
      uint64_t v8 = [(id)dateFromString__formatter3 dateFromString:v3];
      if (!v8
        || (uint64_t v9 = (void *)v8,
            [(id)dateFromString__calendar components:28 fromDate:v8],
            uint64_t v10 = objc_claimAutoreleasedReturnValue(),
            +[CLSCalendar dateFromComponents:v10 inTimeZone:0], uint64_t v4 = objc_claimAutoreleasedReturnValue(), v9, v10, !v4))
      {
        uint64_t v11 = [(id)dateFromString__formatter4 dateFromString:v3];
        if (!v11) {
          goto LABEL_11;
        }
        v12 = (void *)v11;
        v13 = (void *)dateFromString__calendar;
        v14 = [MEMORY[0x1E4F1C9C8] date];
        v15 = [v13 components:28 fromDate:v14];

        v16 = [(id)dateFromString__calendar components:224 fromDate:v12];
        objc_msgSend(v15, "setHour:", objc_msgSend(v16, "hour"));
        objc_msgSend(v15, "setMinute:", objc_msgSend(v16, "minute"));
        objc_msgSend(v15, "setSecond:", objc_msgSend(v16, "second"));
        uint64_t v4 = +[CLSCalendar dateFromComponents:v15 inTimeZone:0];

        if (!v4)
        {
LABEL_11:
          uint64_t v17 = [(id)dateFromString__formatter5 dateFromString:v3];
          if (v17)
          {
            v18 = (void *)v17;
            v19 = (void *)dateFromString__calendar;
            v20 = [MEMORY[0x1E4F1C9C8] date];
            v21 = [v19 components:28 fromDate:v20];

            v22 = [(id)dateFromString__calendar components:96 fromDate:v18];
            objc_msgSend(v21, "setHour:", objc_msgSend(v22, "hour"));
            objc_msgSend(v21, "setMinute:", objc_msgSend(v22, "minute"));
            uint64_t v4 = +[CLSCalendar dateFromComponents:v21 inTimeZone:0];

            goto LABEL_14;
          }
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:

  return v4;
}

@end