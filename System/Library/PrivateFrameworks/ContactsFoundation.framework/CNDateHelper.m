@interface CNDateHelper
+ (BOOL)isComponentsEmpty:(id)a3;
+ (BOOL)isGregorianDerivedCalendar:(id)a3;
+ (BOOL)isGregorianDerivedCalendarIdentifier:(id)a3;
+ (id)componentsForJanuary1WithYear:(int64_t)a3;
+ (id)componentsFromDate:(id)a3;
+ (id)dateComponentsFromDateComponents:(id)a3 preservingUnits:(unint64_t)a4;
+ (id)dateComponentsInCalendar:(id)a3 fromGregorianDateComponents:(id)a4;
+ (id)dateComponentsInGregorianYearlessYearForYearlessDateComponents:(id)a3 timeZone:(id)a4;
+ (id)dateWithYear:(int64_t)a3 month:(int64_t)a4 day:(int64_t)a5;
+ (id)dateWithYear:(int64_t)a3 month:(int64_t)a4 day:(int64_t)a5 hour:(int64_t)a6 minute:(int64_t)a7 second:(int64_t)a8 timeZone:(id)a9;
+ (id)gregorianCalendar;
+ (id)gregorianCalendarInGMT;
+ (id)gregorianDateComponentsFromDateComponents:(id)a3;
+ (int64_t)currentGregorianYearInGMT;
+ (int64_t)gregorianYearFromDate:(id)a3;
+ (int64_t)gregorianYearInGMTFromDate:(id)a3;
@end

@implementation CNDateHelper

+ (BOOL)isComponentsEmpty:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3) {
    BOOL v5 = [v3 year] == 0x7FFFFFFFFFFFFFFFLL
  }
      && [v4 month] == 0x7FFFFFFFFFFFFFFFLL
      && [v4 day] == 0x7FFFFFFFFFFFFFFFLL;
  else {
    BOOL v5 = 1;
  }

  return v5;
}

+ (id)gregorianCalendar
{
  if (gregorianCalendar_cn_once_token_1 != -1) {
    dispatch_once(&gregorianCalendar_cn_once_token_1, &__block_literal_global_82);
  }
  v2 = (void *)gregorianCalendar_cn_once_object_1;

  return v2;
}

uint64_t __33__CNDateHelper_gregorianCalendar__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  uint64_t v1 = [v0 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  uint64_t v2 = gregorianCalendar_cn_once_object_1;
  gregorianCalendar_cn_once_object_1 = v1;

  return MEMORY[0x1F41817F8](v1, v2);
}

+ (id)gregorianCalendarInGMT
{
  if (gregorianCalendarInGMT_onceToken != -1) {
    dispatch_once(&gregorianCalendarInGMT_onceToken, &__block_literal_global_2_3);
  }
  uint64_t v2 = (void *)gregorianCalendarInGMT_sGregorianInGMT;

  return v2;
}

void __38__CNDateHelper_gregorianCalendarInGMT__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  id v4 = (id)[v0 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  uint64_t v1 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [v4 setTimeZone:v1];

  uint64_t v2 = [v4 copy];
  id v3 = (void *)gregorianCalendarInGMT_sGregorianInGMT;
  gregorianCalendarInGMT_sGregorianInGMT = v2;
}

+ (int64_t)currentGregorianYearInGMT
{
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  int64_t v4 = [a1 gregorianYearInGMTFromDate:v3];

  return v4;
}

+ (int64_t)gregorianYearInGMTFromDate:(id)a3
{
  id v4 = a3;
  BOOL v5 = [a1 gregorianCalendarInGMT];
  int64_t v6 = [v5 component:4 fromDate:v4];

  return v6;
}

+ (int64_t)gregorianYearFromDate:(id)a3
{
  id v4 = a3;
  BOOL v5 = [a1 gregorianCalendar];
  int64_t v6 = [v5 component:4 fromDate:v4];

  return v6;
}

+ (id)dateWithYear:(int64_t)a3 month:(int64_t)a4 day:(int64_t)a5
{
  v9 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  v10 = [a1 dateWithYear:a3 month:a4 day:a5 hour:12 minute:0 second:0 timeZone:v9];

  return v10;
}

+ (id)dateWithYear:(int64_t)a3 month:(int64_t)a4 day:(int64_t)a5 hour:(int64_t)a6 minute:(int64_t)a7 second:(int64_t)a8 timeZone:(id)a9
{
  v16 = (objc_class *)MEMORY[0x1E4F1C9D8];
  id v17 = a9;
  id v18 = objc_alloc_init(v16);
  [v18 setYear:a3];
  [v18 setMonth:a4];
  [v18 setDay:a5];
  [v18 setHour:a6];
  [v18 setMinute:a7];
  [v18 setSecond:a8];
  [v18 setTimeZone:v17];

  v19 = [a1 gregorianCalendar];
  v20 = [v19 dateFromComponents:v18];

  return v20;
}

+ (id)componentsFromDate:(id)a3
{
  id v4 = a3;
  BOOL v5 = [a1 gregorianCalendar];
  int64_t v6 = [v5 components:2130172 fromDate:v4];

  [v6 setCalendar:v5];

  return v6;
}

+ (id)componentsForJanuary1WithYear:(int64_t)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v4 setYear:a3];
  [v4 setMonth:1];
  [v4 setDay:1];
  [v4 setHour:0];
  [v4 setMinute:0];
  [v4 setSecond:0];
  BOOL v5 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  [v4 setCalendar:v5];

  int64_t v6 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [v4 setTimeZone:v6];

  return v4;
}

+ (id)dateComponentsInCalendar:(id)a3 fromGregorianDateComponents:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7
    || ([v6 calendarIdentifier],
        v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 isEqualToString:*MEMORY[0x1E4F1C318]],
        v8,
        v9)
    || [v7 day] == 0x7FFFFFFFFFFFFFFFLL
    || [v7 month] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v10 = v7;
  }
  else
  {
    v12 = (void *)[v7 copy];
    v13 = objc_opt_new();
    v14 = objc_opt_new();
    Class IntlUtilityClass = getIntlUtilityClass();
    v16 = [a1 gregorianCalendarInGMT];
    [(objc_class *)IntlUtilityClass setYearlessYear:v13 forCalendar:v16];

    [(objc_class *)getIntlUtilityClass() setYearlessYear:v14 forCalendar:v6];
    if ([v7 year] == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v12, "setYear:", objc_msgSend(v13, "year"));
      BOOL v17 = 1;
    }
    else
    {
      uint64_t v18 = [v7 year];
      BOOL v17 = v18 == [v13 year];
    }
    v19 = [a1 gregorianCalendar];
    v20 = [v19 dateFromComponents:v12];

    v21 = [v6 components:1048606 fromDate:v20];
    id v10 = v21;
    if (v17 || (uint64_t v22 = [v21 year], v22 == objc_msgSend(v14, "year"))) {
      [v10 setYear:0x7FFFFFFFFFFFFFFFLL];
    }
  }

  return v10;
}

+ (id)gregorianDateComponentsFromDateComponents:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 calendar];
  if (!v5) {
    goto LABEL_3;
  }
  id v6 = (void *)v5;
  id v7 = [v4 calendar];
  v8 = [v7 calendarIdentifier];
  int v9 = [v8 isEqualToString:*MEMORY[0x1E4F1C318]];

  if (v9)
  {
LABEL_3:
    id v10 = v4;
    goto LABEL_17;
  }
  v11 = (void *)[v4 copy];
  v12 = [v11 calendar];
  v13 = (void *)[v12 copy];
  [v11 setCalendar:v13];

  v14 = [v4 timeZone];
  if (v14)
  {
    v15 = [v4 timeZone];
  }
  else
  {
    v16 = [v4 calendar];
    v15 = [v16 timeZone];
  }
  if (!v15)
  {
    BOOL v17 = [a1 gregorianCalendarInGMT];
    v15 = [v17 timeZone];
  }
  if ([v4 year] != 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v4, "era") != 0x7FFFFFFFFFFFFFFFLL)
  {
    v27 = [a1 gregorianCalendarInGMT];
    v28 = [v11 calendar];
    v29 = [v28 dateFromComponents:v11];
    v19 = [v27 componentsInTimeZone:v15 fromDate:v29];

    id v20 = +[CNDateHelper dateComponentsFromDateComponents:v19 preservingUnits:1048606];
    goto LABEL_15;
  }
  uint64_t v18 = [a1 dateComponentsInGregorianYearlessYearForYearlessDateComponents:v4 timeZone:v15];
  v19 = v18;
  if (v18)
  {
    id v20 = v18;
    v19 = v20;
LABEL_15:
    id v10 = v20;
    goto LABEL_16;
  }
  Class IntlUtilityClass = getIntlUtilityClass();
  uint64_t v22 = [v11 calendar];
  [(objc_class *)IntlUtilityClass setYearlessYear:v11 forCalendar:v22];

  v23 = [a1 gregorianCalendarInGMT];
  v24 = [v11 calendar];
  v25 = [v24 dateFromComponents:v11];
  v26 = [v23 componentsInTimeZone:v15 fromDate:v25];

  id v10 = +[CNDateHelper dateComponentsFromDateComponents:v26 preservingUnits:1048606];

LABEL_16:
LABEL_17:

  return v10;
}

+ (id)dateComponentsInGregorianYearlessYearForYearlessDateComponents:(id)a3 timeZone:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [a1 gregorianCalendarInGMT];
  int v9 = objc_opt_new();
  [(objc_class *)getIntlUtilityClass() setYearlessYear:v9 forCalendar:v8];
  [v9 setMonth:1];
  [v9 setDay:1];
  [v9 setCalendar:v8];
  id v10 = [v9 date];
  v11 = (void *)[v7 copy];
  [v11 setSecond:1];
  v12 = [v7 calendar];

  v13 = [v12 nextDateAfterDate:v10 matchingComponents:v11 options:2];

  if (v13)
  {
    v14 = (void *)[v9 copy];
    objc_msgSend(v14, "setYear:", objc_msgSend(v14, "year") + 1);
    v15 = [v14 date];
    if ([v13 compare:v15] == -1)
    {
      BOOL v17 = [v8 componentsInTimeZone:v6 fromDate:v13];
      v16 = +[CNDateHelper dateComponentsFromDateComponents:v17 preservingUnits:1048606];
    }
    else
    {
      v16 = 0;
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)dateComponentsFromDateComponents:(id)a3 preservingUnits:(unint64_t)a4
{
  int v4 = a4;
  id v5 = a3;
  id v6 = objc_opt_new();
  if ((v4 & 2) != 0)
  {
    objc_msgSend(v6, "setEra:", objc_msgSend(v5, "era"));
    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else if ((v4 & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v6, "setYear:", objc_msgSend(v5, "year"));
  if ((v4 & 8) == 0)
  {
LABEL_4:
    if ((v4 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(v6, "setMonth:", objc_msgSend(v5, "month"));
  if ((v4 & 0x10) == 0)
  {
LABEL_5:
    if ((v4 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(v6, "setDay:", objc_msgSend(v5, "day"));
  if ((v4 & 0x20) == 0)
  {
LABEL_6:
    if ((v4 & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(v6, "setHour:", objc_msgSend(v5, "hour"));
  if ((v4 & 0x40) == 0)
  {
LABEL_7:
    if ((v4 & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(v6, "setMinute:", objc_msgSend(v5, "minute"));
  if ((v4 & 0x80) == 0)
  {
LABEL_8:
    if ((v4 & 0x8000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(v6, "setSecond:", objc_msgSend(v5, "second"));
  if ((v4 & 0x8000) == 0)
  {
LABEL_9:
    if ((v4 & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(v6, "setNanosecond:", objc_msgSend(v5, "nanosecond"));
  if ((v4 & 0x200) == 0)
  {
LABEL_10:
    if ((v4 & 0x400) == 0) {
      goto LABEL_11;
    }
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(v6, "setWeekday:", objc_msgSend(v5, "weekday"));
  if ((v4 & 0x400) == 0)
  {
LABEL_11:
    if ((v4 & 0x800) == 0) {
      goto LABEL_12;
    }
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(v6, "setWeekdayOrdinal:", objc_msgSend(v5, "weekdayOrdinal"));
  if ((v4 & 0x800) == 0)
  {
LABEL_12:
    if ((v4 & 0x1000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(v6, "setQuarter:", objc_msgSend(v5, "quarter"));
  if ((v4 & 0x1000) == 0)
  {
LABEL_13:
    if ((v4 & 0x2000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(v6, "setWeekOfMonth:", objc_msgSend(v5, "weekOfMonth"));
  if ((v4 & 0x2000) == 0)
  {
LABEL_14:
    if ((v4 & 0x4000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(v6, "setWeekOfYear:", objc_msgSend(v5, "weekOfYear"));
  if ((v4 & 0x4000) == 0)
  {
LABEL_15:
    if ((v4 & 0x100000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(v6, "setYearForWeekOfYear:", objc_msgSend(v5, "yearForWeekOfYear"));
  if ((v4 & 0x100000) == 0)
  {
LABEL_16:
    if ((v4 & 0x200000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_35:
  int v9 = [v5 calendar];
  [v6 setCalendar:v9];

  if ((v4 & 0x200000) != 0)
  {
LABEL_17:
    id v7 = [v5 timeZone];
    [v6 setTimeZone:v7];
  }
LABEL_18:

  return v6;
}

+ (BOOL)isGregorianDerivedCalendar:(id)a3
{
  int v4 = [a3 calendarIdentifier];
  LOBYTE(a1) = [a1 isGregorianDerivedCalendarIdentifier:v4];

  return (char)a1;
}

+ (BOOL)isGregorianDerivedCalendarIdentifier:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:*MEMORY[0x1E4F1C318]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F1C358]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F1C328]] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isEqualToString:*MEMORY[0x1E4F1C2E8]];
  }

  return v4;
}

@end