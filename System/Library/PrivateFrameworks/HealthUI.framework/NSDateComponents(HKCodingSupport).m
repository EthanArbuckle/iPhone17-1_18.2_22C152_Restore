@interface NSDateComponents(HKCodingSupport)
+ (id)_hkui_dateComponentsWithCodableDateComponents:()HKCodingSupport calendarUnits:;
+ (uint64_t)hkui_dateComponentsWithCodableDateComponents:()HKCodingSupport;
- (HKCodableDateComponents)_hkui_codableDateComponentsForCalendarUnits:()HKCodingSupport;
- (uint64_t)hkui_codableDateComponents;
@end

@implementation NSDateComponents(HKCodingSupport)

+ (id)_hkui_dateComponentsWithCodableDateComponents:()HKCodingSupport calendarUnits:
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    if ((a4 & 2) != 0 && [v5 hasEra]) {
      objc_msgSend(v6, "setEra:", objc_msgSend(v5, "era"));
    }
    if ((a4 & 4) != 0 && [v5 hasYear]) {
      objc_msgSend(v6, "setYear:", objc_msgSend(v5, "year"));
    }
    if ((a4 & 8) != 0 && [v5 hasMonth]) {
      objc_msgSend(v6, "setMonth:", objc_msgSend(v5, "month"));
    }
    if ((a4 & 0x10) != 0 && [v5 hasDay]) {
      objc_msgSend(v6, "setDay:", objc_msgSend(v5, "day"));
    }
    if ((a4 & 0x20) != 0 && [v5 hasHour]) {
      objc_msgSend(v6, "setHour:", objc_msgSend(v5, "hour"));
    }
    if ((a4 & 0x40) != 0 && [v5 hasMinute]) {
      objc_msgSend(v6, "setMinute:", objc_msgSend(v5, "minute"));
    }
    if ((a4 & 0x80) != 0 && [v5 hasSecond]) {
      objc_msgSend(v6, "setSecond:", objc_msgSend(v5, "second"));
    }
    if ((a4 & 0x200) != 0 && [v5 hasWeekday]) {
      objc_msgSend(v6, "setWeekday:", objc_msgSend(v5, "weekday"));
    }
    if ((a4 & 0x400) != 0 && [v5 hasWeekdayOrdinal]) {
      objc_msgSend(v6, "setWeekdayOrdinal:", objc_msgSend(v5, "weekdayOrdinal"));
    }
    if ((a4 & 0x800) != 0 && [v5 hasQuarter]) {
      objc_msgSend(v6, "setQuarter:", objc_msgSend(v5, "quarter"));
    }
    if ((a4 & 0x1000) != 0 && [v5 hasWeekOfMonth]) {
      objc_msgSend(v6, "setWeekOfMonth:", objc_msgSend(v5, "weekOfMonth"));
    }
    if ((a4 & 0x2000) != 0 && [v5 hasWeekOfYear]) {
      objc_msgSend(v6, "setWeekOfYear:", objc_msgSend(v5, "weekOfYear"));
    }
    if ((a4 & 0x4000) != 0 && [v5 hasYearForWeekOfYear]) {
      objc_msgSend(v6, "setYearForWeekOfYear:", objc_msgSend(v5, "yearForWeekOfYear"));
    }
    if (a4 < 0 && [v5 hasNanosecond]) {
      objc_msgSend(v6, "setNanosecond:", objc_msgSend(v5, "nanosecond"));
    }
    if ([v5 hasCalendar])
    {
      v7 = (void *)MEMORY[0x1E4F1C9A8];
      v8 = [v5 calendar];
      id v9 = [v7 calendarWithIdentifier:v8];

      if (!v9) {
        goto LABEL_51;
      }
      [v6 setCalendar:v9];
    }
    if (![v5 hasTimeZone])
    {
LABEL_50:
      id v9 = v6;
      goto LABEL_51;
    }
    v10 = (void *)MEMORY[0x1E4F1CAF0];
    v11 = [v5 timeZone];
    id v9 = [v10 timeZoneWithName:v11];

    if (v9)
    {
      [v6 setTimeZone:v9];

      goto LABEL_50;
    }
LABEL_51:

    goto LABEL_53;
  }
  id v9 = 0;
LABEL_53:

  return v9;
}

- (HKCodableDateComponents)_hkui_codableDateComponentsForCalendarUnits:()HKCodingSupport
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = objc_alloc_init(HKCodableDateComponents);
    if ((a3 & 2) != 0 && [a1 era] != 0x7FFFFFFFFFFFFFFFLL) {
      -[HKCodableDateComponents setEra:](v5, "setEra:", [a1 era]);
    }
    if ((a3 & 4) != 0 && [a1 year] != 0x7FFFFFFFFFFFFFFFLL) {
      -[HKCodableDateComponents setYear:](v5, "setYear:", [a1 year]);
    }
    if ((a3 & 8) != 0 && [a1 month] != 0x7FFFFFFFFFFFFFFFLL) {
      -[HKCodableDateComponents setMonth:](v5, "setMonth:", [a1 month]);
    }
    if ((a3 & 0x10) != 0 && [a1 day] != 0x7FFFFFFFFFFFFFFFLL) {
      -[HKCodableDateComponents setDay:](v5, "setDay:", [a1 day]);
    }
    if ((a3 & 0x20) != 0 && [a1 hour] != 0x7FFFFFFFFFFFFFFFLL) {
      -[HKCodableDateComponents setHour:](v5, "setHour:", [a1 hour]);
    }
    if ((a3 & 0x40) != 0 && [a1 minute] != 0x7FFFFFFFFFFFFFFFLL) {
      -[HKCodableDateComponents setMinute:](v5, "setMinute:", [a1 minute]);
    }
    if ((a3 & 0x80) != 0 && [a1 second] != 0x7FFFFFFFFFFFFFFFLL) {
      -[HKCodableDateComponents setSecond:](v5, "setSecond:", [a1 second]);
    }
    if ((a3 & 0x200) != 0 && [a1 weekday] != 0x7FFFFFFFFFFFFFFFLL) {
      -[HKCodableDateComponents setWeekday:](v5, "setWeekday:", [a1 weekday]);
    }
    if ((a3 & 0x400) != 0 && [a1 weekdayOrdinal] != 0x7FFFFFFFFFFFFFFFLL) {
      -[HKCodableDateComponents setWeekdayOrdinal:](v5, "setWeekdayOrdinal:", [a1 weekdayOrdinal]);
    }
    if ((a3 & 0x800) != 0 && [a1 quarter] != 0x7FFFFFFFFFFFFFFFLL) {
      -[HKCodableDateComponents setQuarter:](v5, "setQuarter:", [a1 quarter]);
    }
    if ((a3 & 0x1000) != 0 && [a1 weekOfMonth] != 0x7FFFFFFFFFFFFFFFLL) {
      -[HKCodableDateComponents setWeekOfMonth:](v5, "setWeekOfMonth:", [a1 weekOfMonth]);
    }
    if ((a3 & 0x2000) != 0 && [a1 weekOfYear] != 0x7FFFFFFFFFFFFFFFLL) {
      -[HKCodableDateComponents setWeekOfYear:](v5, "setWeekOfYear:", [a1 weekOfYear]);
    }
    if ((a3 & 0x4000) != 0 && [a1 yearForWeekOfYear] != 0x7FFFFFFFFFFFFFFFLL) {
      -[HKCodableDateComponents setYearForWeekOfYear:](v5, "setYearForWeekOfYear:", [a1 yearForWeekOfYear]);
    }
    if (a3 < 0 && [a1 nanosecond] != 0x7FFFFFFFFFFFFFFFLL) {
      -[HKCodableDateComponents setNanosecond:](v5, "setNanosecond:", [a1 nanosecond]);
    }
    id v6 = [a1 calendar];
    v7 = [v6 calendarIdentifier];
    [(HKCodableDateComponents *)v5 setCalendar:v7];

    v8 = [a1 timeZone];
    id v9 = [v8 name];
    [(HKCodableDateComponents *)v5 setTimeZone:v9];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

+ (uint64_t)hkui_dateComponentsWithCodableDateComponents:()HKCodingSupport
{
  return objc_msgSend(MEMORY[0x1E4F1C9D8], "_hkui_dateComponentsWithCodableDateComponents:calendarUnits:", a3, 65278);
}

- (uint64_t)hkui_codableDateComponents
{
  return objc_msgSend(a1, "_hkui_codableDateComponentsForCalendarUnits:", 65278);
}

@end