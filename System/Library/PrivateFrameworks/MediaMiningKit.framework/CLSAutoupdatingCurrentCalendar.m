@interface CLSAutoupdatingCurrentCalendar
+ (BOOL)closestWeekendLocalStartDate:(id *)a3 interval:(double *)a4 afterDate:(id)a5;
+ (BOOL)dateIntervalIntersectsWeekend:(id)a3;
+ (BOOL)isWeekendDate:(id)a3;
+ (BOOL)nextWeekendLocalStartDate:(id *)a3 interval:(double *)a4 options:(unint64_t)a5 afterDate:(id)a6;
+ (BOOL)rangeOfWeekendLocalStartDate:(id *)a3 interval:(double *)a4 containingDate:(id)a5;
+ (id)calendar;
+ (id)timezone;
+ (void)initialize;
@end

@implementation CLSAutoupdatingCurrentCalendar

+ (BOOL)nextWeekendLocalStartDate:(id *)a3 interval:(double *)a4 options:(unint64_t)a5 afterDate:(id)a6
{
  id v10 = a6;
  v11 = [a1 calendar];
  char v12 = [v11 nextWeekendStartDate:a3 interval:a4 options:a5 afterDate:v10];

  if (a3)
  {
    *a3 = [*a3 dateByAddingTimeInterval:-21600.0];
  }
  if (a4) {
    *a4 = *a4 + 21600.0;
  }
  return v12;
}

+ (BOOL)rangeOfWeekendLocalStartDate:(id *)a3 interval:(double *)a4 containingDate:(id)a5
{
  id v8 = a5;
  v9 = [a1 calendar];
  char v10 = [v9 rangeOfWeekendStartDate:a3 interval:a4 containingDate:v8];

  *a3 = [*a3 dateByAddingTimeInterval:-21600.0];
  *a4 = *a4 + 21600.0;
  return v10;
}

+ (BOOL)closestWeekendLocalStartDate:(id *)a3 interval:(double *)a4 afterDate:(id)a5
{
  id v8 = a5;
  if ([a1 rangeOfWeekendLocalStartDate:a3 interval:a4 containingDate:v8])
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    id v24 = 0;
    double v25 = 0.0;
    int v10 = [a1 nextWeekendLocalStartDate:&v24 interval:&v25 options:4 afterDate:v8];
    id v11 = v24;
    char v12 = v11;
    if (v10)
    {
      v13 = [v11 dateByAddingTimeInterval:v25];
      [v8 timeIntervalSinceDate:v13];
      double v15 = v14;
      id v22 = 0;
      uint64_t v23 = 0;
      v16 = (double *)&v23;
      int v9 = [a1 nextWeekendLocalStartDate:&v22 interval:&v23 options:0 afterDate:v8];
      if (v9)
      {
        id v17 = v22;
        [v17 timeIntervalSinceDate:v8];
        if (v15 >= v18) {
          v19 = v17;
        }
        else {
          v19 = v12;
        }
        if (v15 < v18) {
          v16 = &v25;
        }
        *a3 = v19;
        uint64_t v20 = *(void *)v16;

        *(void *)a4 = v20;
      }
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }
  return v9;
}

+ (BOOL)dateIntervalIntersectsWeekend:(id)a3
{
  id v4 = a3;
  id v12 = 0;
  double v13 = 0.0;
  v5 = [v4 startDate];
  int v6 = [a1 nextWeekendLocalStartDate:&v12 interval:&v13 options:0 afterDate:v5];
  id v7 = v12;

  if (v6)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F28C18]);
    int v9 = (void *)[v8 initWithStartDate:v7 duration:v13];
    char v10 = [v4 intersectsDateInterval:v9];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

+ (BOOL)isWeekendDate:(id)a3
{
  id v4 = a3;
  v5 = [a1 calendar];
  char v6 = [v5 isDateInWeekend:v4];

  if (v6)
  {
    BOOL v7 = 1;
  }
  else
  {
    id v13 = 0;
    uint64_t v14 = 0;
    int v8 = [a1 nextWeekendLocalStartDate:&v13 interval:&v14 options:0 afterDate:v4];
    id v9 = v13;
    char v10 = v9;
    BOOL v7 = 0;
    if (v8)
    {
      [v9 timeIntervalSinceDate:v4];
      if (v11 <= 0.0) {
        BOOL v7 = 1;
      }
    }
  }
  return v7;
}

+ (id)timezone
{
  return (id)sCLSDateHelperGMTTimeZone;
}

+ (id)calendar
{
  return (id)sCLSDateHelperAutoupdatingCurrentCalendar;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = [MEMORY[0x1E4F1CAF0] timeZoneWithAbbreviation:@"GMT"];
    v3 = (void *)sCLSDateHelperGMTTimeZone;
    sCLSDateHelperGMTTimeZone = v2;

    uint64_t v4 = [MEMORY[0x1E4F1C9A8] autoupdatingCurrentCalendar];
    v5 = (void *)sCLSDateHelperAutoupdatingCurrentCalendar;
    sCLSDateHelperAutoupdatingCurrentCalendar = v4;

    uint64_t v6 = sCLSDateHelperGMTTimeZone;
    BOOL v7 = (void *)sCLSDateHelperAutoupdatingCurrentCalendar;
    [v7 setTimeZone:v6];
  }
}

@end