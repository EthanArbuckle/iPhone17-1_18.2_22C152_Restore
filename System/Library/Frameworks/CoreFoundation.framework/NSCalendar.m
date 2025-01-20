@interface NSCalendar
+ (BOOL)supportsSecureCoding;
+ (NSCalendar)allocWithZone:(_NSZone *)a3;
+ (NSCalendar)autoupdatingCurrentCalendar;
+ (NSCalendar)calendarWithIdentifier:(NSCalendarIdentifier)calendarIdentifierConstant;
+ (NSCalendar)currentCalendar;
- (BOOL)date:(NSDate *)date matchesComponents:(NSDateComponents *)components;
- (BOOL)isDate:(NSDate *)date1 equalToDate:(NSDate *)date2 toUnitGranularity:(NSCalendarUnit)unit;
- (BOOL)isDate:(NSDate *)date1 inSameDayAsDate:(NSDate *)date2;
- (BOOL)isDateInToday:(NSDate *)date;
- (BOOL)isDateInTomorrow:(NSDate *)date;
- (BOOL)isDateInWeekend:(NSDate *)date;
- (BOOL)isDateInYesterday:(NSDate *)date;
- (BOOL)isEqual:(id)a3;
- (BOOL)nextWeekendStartDate:(NSDate *)datep interval:(NSTimeInterval *)tip options:(NSCalendarOptions)options afterDate:(NSDate *)date;
- (BOOL)rangeOfUnit:(NSCalendarUnit)unit startDate:(NSDate *)datep interval:(NSTimeInterval *)tip forDate:(NSDate *)date;
- (BOOL)rangeOfWeekendStartDate:(NSDate *)datep interval:(NSTimeInterval *)tip containingDate:(NSDate *)date;
- (NSArray)eraSymbols;
- (NSArray)longEraSymbols;
- (NSArray)monthSymbols;
- (NSArray)quarterSymbols;
- (NSArray)shortMonthSymbols;
- (NSArray)shortQuarterSymbols;
- (NSArray)shortStandaloneMonthSymbols;
- (NSArray)shortStandaloneQuarterSymbols;
- (NSArray)shortStandaloneWeekdaySymbols;
- (NSArray)shortWeekdaySymbols;
- (NSArray)standaloneMonthSymbols;
- (NSArray)standaloneQuarterSymbols;
- (NSArray)standaloneWeekdaySymbols;
- (NSArray)veryShortMonthSymbols;
- (NSArray)veryShortStandaloneMonthSymbols;
- (NSArray)veryShortStandaloneWeekdaySymbols;
- (NSArray)veryShortWeekdaySymbols;
- (NSArray)weekdaySymbols;
- (NSCalendar)init;
- (NSCalendar)initWithCoder:(id)a3;
- (NSCalendarIdentifier)calendarIdentifier;
- (NSComparisonResult)compareDate:(NSDate *)date1 toDate:(NSDate *)date2 toUnitGranularity:(NSCalendarUnit)unit;
- (NSDate)dateByAddingComponents:(NSDateComponents *)comps toDate:(NSDate *)date options:(NSCalendarOptions)opts;
- (NSDate)dateByAddingUnit:(NSCalendarUnit)unit value:(NSInteger)value toDate:(NSDate *)date options:(NSCalendarOptions)options;
- (NSDate)dateBySettingHour:(NSInteger)h minute:(NSInteger)m second:(NSInteger)s ofDate:(NSDate *)date options:(NSCalendarOptions)opts;
- (NSDate)dateBySettingUnit:(NSCalendarUnit)unit value:(NSInteger)v ofDate:(NSDate *)date options:(NSCalendarOptions)opts;
- (NSDate)dateFromComponents:(NSDateComponents *)comps;
- (NSDate)dateWithEra:(NSInteger)eraValue year:(NSInteger)yearValue month:(NSInteger)monthValue day:(NSInteger)dayValue hour:(NSInteger)hourValue minute:(NSInteger)minuteValue second:(NSInteger)secondValue nanosecond:(NSInteger)nanosecondValue;
- (NSDate)dateWithEra:(NSInteger)eraValue yearForWeekOfYear:(NSInteger)yearValue weekOfYear:(NSInteger)weekValue weekday:(NSInteger)weekdayValue hour:(NSInteger)hourValue minute:(NSInteger)minuteValue second:(NSInteger)secondValue nanosecond:(NSInteger)nanosecondValue;
- (NSDate)nextDateAfterDate:(NSDate *)date matchingComponents:(NSDateComponents *)comps options:(NSCalendarOptions)options;
- (NSDate)nextDateAfterDate:(NSDate *)date matchingHour:(NSInteger)hourValue minute:(NSInteger)minuteValue second:(NSInteger)secondValue options:(NSCalendarOptions)options;
- (NSDate)nextDateAfterDate:(NSDate *)date matchingUnit:(NSCalendarUnit)unit value:(NSInteger)value options:(NSCalendarOptions)options;
- (NSDate)startOfDayForDate:(NSDate *)date;
- (NSDateComponents)components:(NSCalendarUnit)unitFlags fromDate:(NSDate *)date;
- (NSDateComponents)components:(NSCalendarUnit)unitFlags fromDate:(NSDate *)startingDate toDate:(NSDate *)resultDate options:(NSCalendarOptions)opts;
- (NSDateComponents)components:(NSCalendarUnit)unitFlags fromDateComponents:(NSDateComponents *)startingDateComp toDateComponents:(NSDateComponents *)resultDateComp options:(NSCalendarOptions)options;
- (NSDateComponents)componentsInTimeZone:(NSTimeZone *)timezone fromDate:(NSDate *)date;
- (NSInteger)component:(NSCalendarUnit)unit fromDate:(NSDate *)date;
- (NSLocale)locale;
- (NSRange)maximumRangeOfUnit:(NSCalendarUnit)unit;
- (NSRange)minimumRangeOfUnit:(NSCalendarUnit)unit;
- (NSRange)rangeOfUnit:(NSCalendarUnit)smaller inUnit:(NSCalendarUnit)larger forDate:(NSDate *)date;
- (NSString)AMSymbol;
- (NSString)PMSymbol;
- (NSTimeZone)timeZone;
- (NSUInteger)firstWeekday;
- (NSUInteger)minimumDaysInFirstWeek;
- (NSUInteger)ordinalityOfUnit:(NSCalendarUnit)smaller inUnit:(NSCalendarUnit)larger forDate:(NSDate *)date;
- (id)copyWithZone:(_NSZone *)a3;
- (id)gregorianStartDate;
- (unint64_t)hash;
- (void)enumerateDatesStartingAfterDate:(NSDate *)start matchingComponents:(NSDateComponents *)comps options:(NSCalendarOptions)opts usingBlock:(void *)block;
- (void)getEra:(NSInteger *)eraValuePointer year:(NSInteger *)yearValuePointer month:(NSInteger *)monthValuePointer day:(NSInteger *)dayValuePointer fromDate:(NSDate *)date;
- (void)getEra:(NSInteger *)eraValuePointer yearForWeekOfYear:(NSInteger *)yearValuePointer weekOfYear:(NSInteger *)weekValuePointer weekday:(NSInteger *)weekdayValuePointer fromDate:(NSDate *)date;
- (void)getHour:(NSInteger *)hourValuePointer minute:(NSInteger *)minuteValuePointer second:(NSInteger *)secondValuePointer nanosecond:(NSInteger *)nanosecondValuePointer fromDate:(NSDate *)date;
- (void)setFirstWeekday:(NSUInteger)firstWeekday;
- (void)setLocale:(NSLocale *)locale;
- (void)setMinimumDaysInFirstWeek:(NSUInteger)minimumDaysInFirstWeek;
- (void)setTimeZone:(NSTimeZone *)timeZone;
@end

@implementation NSCalendar

+ (NSCalendar)currentCalendar
{
  return (NSCalendar *)+[NSCalendar _current];
}

+ (NSCalendar)calendarWithIdentifier:(NSCalendarIdentifier)calendarIdentifierConstant
{
  v3 = (void *)[objc_alloc((Class)a1) initWithCalendarIdentifier:calendarIdentifierConstant];

  return (NSCalendar *)v3;
}

+ (NSCalendar)allocWithZone:(_NSZone *)a3
{
  uint64_t v7 = *(void *)off_1ECE0A5B0;
  if (NSCalendar == a1)
  {
    Class v5 = objc_lookUpClass("_NSSwiftCalendar");
    return (NSCalendar *)[(objc_class *)v5 allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___NSCalendar;
    return (NSCalendar *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

- (unint64_t)hash
{
  v2 = [(NSCalendar *)self calendarIdentifier];

  return [(NSString *)v2 hash];
}

- (id)gregorianStartDate
{
  return 0;
}

+ (NSCalendar)autoupdatingCurrentCalendar
{
  return (NSCalendar *)+[NSCalendar _autoupdatingCurrent];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSCalendar)init
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    uint64_t v15 = v5;
    uint64_t v16 = v4;
    uint64_t v17 = v3;
    if (!a3 || (objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_18;
    }
    LODWORD(v11) = -[NSString isEqual:](-[NSCalendar calendarIdentifier](self, "calendarIdentifier"), "isEqual:", [a3 calendarIdentifier]);
    if (v11)
    {
      LODWORD(v11) = -[NSTimeZone isEqual:](-[NSCalendar timeZone](self, "timeZone"), "isEqual:", [a3 timeZone]);
      if (v11)
      {
        LODWORD(v11) = -[NSLocale isEqual:](-[NSCalendar locale](self, "locale"), "isEqual:", [a3 locale]);
        if (v11)
        {
          NSUInteger v12 = [(NSCalendar *)self firstWeekday];
          if (v12 != [a3 firstWeekday]) {
            goto LABEL_18;
          }
          NSUInteger v13 = [(NSCalendar *)self minimumDaysInFirstWeek];
          if (v13 != [a3 minimumDaysInFirstWeek]) {
            goto LABEL_18;
          }
          if (-[NSCalendar gregorianStartDate](self, "gregorianStartDate") && [a3 gregorianStartDate])
          {
            if (objc_msgSend(-[NSCalendar gregorianStartDate](self, "gregorianStartDate"), "isEqual:", objc_msgSend(a3, "gregorianStartDate")))
            {
LABEL_20:
              LOBYTE(v11) = 1;
              return v11;
            }
LABEL_18:
            LOBYTE(v11) = 0;
            return v11;
          }
          if (![(NSCalendar *)self gregorianStartDate]
            || (uint64_t v11 = [a3 gregorianStartDate]) != 0)
          {
            if (-[NSCalendar gregorianStartDate](self, "gregorianStartDate") || ![a3 gregorianStartDate]) {
              goto LABEL_20;
            }
            goto LABEL_18;
          }
        }
      }
    }
  }
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithCalendarIdentifier:", -[NSCalendar calendarIdentifier](self, "calendarIdentifier"));
  objc_msgSend(v4, "setLocale:", -[NSCalendar locale](self, "locale"));
  objc_msgSend(v4, "setTimeZone:", -[NSCalendar timeZone](self, "timeZone"));
  objc_msgSend(v4, "setFirstWeekday:", -[NSCalendar firstWeekday](self, "firstWeekday"));
  objc_msgSend(v4, "setMinimumDaysInFirstWeek:", -[NSCalendar minimumDaysInFirstWeek](self, "minimumDaysInFirstWeek"));
  objc_msgSend(v4, "setGregorianStartDate:", -[NSCalendar gregorianStartDate](self, "gregorianStartDate"));
  return v4;
}

- (NSCalendar)initWithCoder:(id)a3
{
  return 0;
}

- (void)getEra:(NSInteger *)eraValuePointer year:(NSInteger *)yearValuePointer month:(NSInteger *)monthValuePointer day:(NSInteger *)dayValuePointer fromDate:(NSDate *)date
{
  if (date || !_CFExecutableLinkedOnOrAfter(9uLL))
  {
    NSUInteger v13 = [(NSCalendar *)self components:30 fromDate:date];
    v14 = v13;
    if (eraValuePointer) {
      *eraValuePointer = [(NSDateComponents *)v13 era];
    }
    if (yearValuePointer) {
      *yearValuePointer = [(NSDateComponents *)v14 year];
    }
    if (monthValuePointer) {
      *monthValuePointer = [(NSDateComponents *)v14 month];
    }
    if (dayValuePointer) {
      *dayValuePointer = [(NSDateComponents *)v14 day];
    }
  }
  else
  {
    int v15 = getEra_year_month_day_fromDate____count__;
    if (getEra_year_month_day_fromDate____count__ <= 13)
    {
      objc_msgSend((id)-[objc_class callStackSymbols](__CFLookUpClass("NSThread"), "callStackSymbols"), "description");
      CFLog(3, @"*** %s: date cannot be nil\nFuture exception.\nA few of these errors are going to be reported with this complaint, then further violations will simply be ignored.\nHere is the backtrace where this occurred this time (some frames may be missing due to compiler optimizations):\n%@", v16, v17, v18, v19, v20, v21, (__int16)"-[NSCalendar getEra:year:month:day:fromDate:]");
      int v15 = getEra_year_month_day_fromDate____count__;
    }
    getEra_year_month_day_fromDate____count__ = v15 + 1;
  }
}

- (void)getEra:(NSInteger *)eraValuePointer yearForWeekOfYear:(NSInteger *)yearValuePointer weekOfYear:(NSInteger *)weekValuePointer weekday:(NSInteger *)weekdayValuePointer fromDate:(NSDate *)date
{
  if (date || !_CFExecutableLinkedOnOrAfter(9uLL))
  {
    NSUInteger v13 = [(NSCalendar *)self components:25090 fromDate:date];
    v14 = v13;
    if (eraValuePointer) {
      *eraValuePointer = [(NSDateComponents *)v13 era];
    }
    if (yearValuePointer) {
      *yearValuePointer = [(NSDateComponents *)v14 yearForWeekOfYear];
    }
    if (weekValuePointer) {
      *weekValuePointer = [(NSDateComponents *)v14 weekOfYear];
    }
    if (weekdayValuePointer) {
      *weekdayValuePointer = [(NSDateComponents *)v14 weekday];
    }
  }
  else
  {
    int v15 = getEra_yearForWeekOfYear_weekOfYear_weekday_fromDate____count__;
    if (getEra_yearForWeekOfYear_weekOfYear_weekday_fromDate____count__ <= 13)
    {
      objc_msgSend((id)-[objc_class callStackSymbols](__CFLookUpClass("NSThread"), "callStackSymbols"), "description");
      CFLog(3, @"*** %s: date cannot be nil\nFuture exception.\nA few of these errors are going to be reported with this complaint, then further violations will simply be ignored.\nHere is the backtrace where this occurred this time (some frames may be missing due to compiler optimizations):\n%@", v16, v17, v18, v19, v20, v21, (__int16)"-[NSCalendar getEra:yearForWeekOfYear:weekOfYear:weekday:fromDate:]");
      int v15 = getEra_yearForWeekOfYear_weekOfYear_weekday_fromDate____count__;
    }
    getEra_yearForWeekOfYear_weekOfYear_weekday_fromDate____count__ = v15 + 1;
  }
}

- (void)getHour:(NSInteger *)hourValuePointer minute:(NSInteger *)minuteValuePointer second:(NSInteger *)secondValuePointer nanosecond:(NSInteger *)nanosecondValuePointer fromDate:(NSDate *)date
{
  if (date || !_CFExecutableLinkedOnOrAfter(9uLL))
  {
    NSUInteger v13 = [(NSCalendar *)self components:32992 fromDate:date];
    v14 = v13;
    if (hourValuePointer) {
      *hourValuePointer = [(NSDateComponents *)v13 hour];
    }
    if (minuteValuePointer) {
      *minuteValuePointer = [(NSDateComponents *)v14 minute];
    }
    if (secondValuePointer) {
      *secondValuePointer = [(NSDateComponents *)v14 second];
    }
    if (nanosecondValuePointer) {
      *nanosecondValuePointer = [(NSDateComponents *)v14 nanosecond];
    }
  }
  else
  {
    int v15 = getHour_minute_second_nanosecond_fromDate____count__;
    if (getHour_minute_second_nanosecond_fromDate____count__ <= 13)
    {
      objc_msgSend((id)-[objc_class callStackSymbols](__CFLookUpClass("NSThread"), "callStackSymbols"), "description");
      CFLog(3, @"*** %s: date cannot be nil\nFuture exception.\nA few of these errors are going to be reported with this complaint, then further violations will simply be ignored.\nHere is the backtrace where this occurred this time (some frames may be missing due to compiler optimizations):\n%@", v16, v17, v18, v19, v20, v21, (__int16)"-[NSCalendar getHour:minute:second:nanosecond:fromDate:]");
      int v15 = getHour_minute_second_nanosecond_fromDate____count__;
    }
    getHour_minute_second_nanosecond_fromDate____count__ = v15 + 1;
  }
}

- (NSInteger)component:(NSCalendarUnit)unit fromDate:(NSDate *)date
{
  if (date || !_CFExecutableLinkedOnOrAfter(9uLL))
  {
    uint64_t v7 = [(NSCalendar *)self components:unit fromDate:date];
    return [(NSDateComponents *)v7 valueForComponent:unit];
  }
  else
  {
    int v9 = component_fromDate____count__;
    if (component_fromDate____count__ <= 13)
    {
      objc_msgSend((id)-[objc_class callStackSymbols](__CFLookUpClass("NSThread"), "callStackSymbols"), "description");
      CFLog(3, @"*** %s: date cannot be nil\nFuture exception.\nA few of these errors are going to be reported with this complaint, then further violations will simply be ignored.\nHere is the backtrace where this occurred this time (some frames may be missing due to compiler optimizations):\n%@", v10, v11, v12, v13, v14, v15, (__int16)"-[NSCalendar component:fromDate:]");
      int v9 = component_fromDate____count__;
    }
    component_fromDate____count__ = v9 + 1;
    return 0;
  }
}

- (NSDate)dateWithEra:(NSInteger)eraValue year:(NSInteger)yearValue month:(NSInteger)monthValue day:(NSInteger)dayValue hour:(NSInteger)hourValue minute:(NSInteger)minuteValue second:(NSInteger)secondValue nanosecond:(NSInteger)nanosecondValue
{
  id v17 = (id)objc_opt_new();
  [v17 setEra:eraValue];
  [v17 setYear:yearValue];
  [v17 setMonth:monthValue];
  [v17 setDay:dayValue];
  [v17 setHour:hourValue];
  [v17 setMinute:minuteValue];
  [v17 setSecond:secondValue];
  [v17 setNanosecond:nanosecondValue];

  return [(NSCalendar *)self dateFromComponents:v17];
}

- (NSDate)dateWithEra:(NSInteger)eraValue yearForWeekOfYear:(NSInteger)yearValue weekOfYear:(NSInteger)weekValue weekday:(NSInteger)weekdayValue hour:(NSInteger)hourValue minute:(NSInteger)minuteValue second:(NSInteger)secondValue nanosecond:(NSInteger)nanosecondValue
{
  id v17 = (id)objc_opt_new();
  [v17 setEra:eraValue];
  [v17 setYearForWeekOfYear:yearValue];
  [v17 setWeekOfYear:weekValue];
  [v17 setWeekday:weekdayValue];
  [v17 setHour:hourValue];
  [v17 setMinute:minuteValue];
  [v17 setSecond:secondValue];
  [v17 setNanosecond:nanosecondValue];

  return [(NSCalendar *)self dateFromComponents:v17];
}

- (NSDate)startOfDayForDate:(NSDate *)date
{
  v5[1] = *(void *)off_1ECE0A5B0;
  uint64_t v4 = 0;
  v5[0] = 0;
  [(NSCalendar *)self rangeOfUnit:16 startDate:v5 interval:&v4 forDate:date];
  return (NSDate *)v5[0];
}

- (NSDateComponents)componentsInTimeZone:(NSTimeZone *)timezone fromDate:(NSDate *)date
{
  uint64_t v7 = [(NSCalendar *)self timeZone];
  [(NSCalendar *)self setTimeZone:timezone];
  uint64_t v8 = [(NSCalendar *)self components:3276542 fromDate:date];
  [(NSCalendar *)self setTimeZone:v7];
  return v8;
}

- (NSComparisonResult)compareDate:(NSDate *)date1 toDate:(NSDate *)date2 toUnitGranularity:(NSCalendarUnit)unit
{
  uint64_t v48 = *(void *)off_1ECE0A5B0;
  [(NSDate *)date1 timeIntervalSinceReferenceDate];
  double v11 = v10;
  [(NSDate *)date2 timeIntervalSinceReferenceDate];
  if (v11 <= -2.11845067e11 || v11 >= 1.59271755e13 || v12 >= 1.59271755e13 || v12 <= -2.11845067e11)
  {
    BOOL v17 = v11 == v12;
    NSComparisonResult v18 = NSOrderedAscending;
    if (v11 > v12) {
      NSComparisonResult v18 = NSOrderedDescending;
    }
    goto LABEL_20;
  }
  if ((uint64_t)unit <= 127)
  {
    if (unit == 16 || unit == 32)
    {
      *(void *)&__y[0] = 0;
      *(void *)&long long v43 = 0;
      [(NSCalendar *)self rangeOfUnit:unit startDate:__y interval:&v43 forDate:date1];
      [*(id *)&__y[0] timeIntervalSinceReferenceDate];
      double v25 = v24;
      [(NSDate *)date2 timeIntervalSinceReferenceDate];
      if (v25 <= v26 && v26 < v25 + *(double *)&v43) {
        return 0;
      }
      if (v26 < v25) {
        return 1;
      }
      return -1;
    }
    if (unit == 64)
    {
      *(void *)&__y[0] = 0;
      *(void *)&long long v43 = 0;
      [(NSDate *)date1 timeIntervalSinceReferenceDate];
      [(NSDate *)date2 timeIntervalSinceReferenceDate];
      modf(v20, (long double *)&v43);
      double v15 = floor(*(double *)__y / 60.0);
      double v16 = floor(*(double *)&v43 / 60.0);
      goto LABEL_17;
    }
  }
  else if ((uint64_t)unit >= 0x100000)
  {
    NSComparisonResult result = NSOrderedSame;
    if (unit == 0x100000 || unit == 0x200000) {
      return result;
    }
  }
  else if (unit == 128 || unit == 0x8000)
  {
    *(void *)&__y[0] = 0;
    [(NSDate *)date1 timeIntervalSinceReferenceDate];
    [(NSDate *)date2 timeIntervalSinceReferenceDate];
    modf(v14, (long double *)&v43);
    double v15 = *(double *)__y;
    double v16 = *(double *)&v43;
LABEL_17:
    NSComparisonResult v18 = NSOrderedAscending;
    if (v16 < v15) {
      NSComparisonResult v18 = NSOrderedDescending;
    }
    BOOL v17 = v15 == v16;
LABEL_20:
    if (v17) {
      return 0;
    }
    else {
      return v18;
    }
  }
  __y[0] = xmmword_182EDD730;
  __y[1] = xmmword_182EDD740;
  uint64_t v47 = 16;
  long long v43 = xmmword_182EDD730;
  long long v44 = xmmword_182EDD750;
  uint64_t v45 = 512;
  if ((uint64_t)unit <= 4095)
  {
    if (unit != 512)
    {
      if (unit != 1024)
      {
LABEL_42:
        v22 = &qword_182EDD760;
        uint64_t v23 = 4;
        goto LABEL_43;
      }
      v22 = (uint64_t *)__y;
      goto LABEL_41;
    }
LABEL_40:
    v22 = (uint64_t *)&v43;
LABEL_41:
    uint64_t v23 = 5;
    goto LABEL_43;
  }
  if (unit == 4096) {
    goto LABEL_40;
  }
  v22 = &qword_182EDD780;
  uint64_t v23 = 4;
  if (unit != 0x2000 && unit != 0x4000) {
    goto LABEL_42;
  }
LABEL_43:
  uint64_t v27 = 0;
  v28 = v22;
  uint64_t v29 = v23;
  do
  {
    uint64_t v30 = *v28++;
    v27 |= v30;
    --v29;
  }
  while (v29);
  v31 = -[NSCalendar components:fromDate:](self, "components:fromDate:", v27, date1, v43, v44, v45);
  v32 = [(NSCalendar *)self components:v27 fromDate:date2];
  uint64_t v33 = v23 - 1;
  while (1)
  {
    uint64_t v34 = v33;
    uint64_t v35 = [(NSDateComponents *)v31 valueForComponent:*v22];
    uint64_t v36 = [(NSDateComponents *)v32 valueForComponent:*v22];
    if (v35 > v36) {
      return 1;
    }
    if (v35 < v36) {
      break;
    }
    if (*v22 == 8
      && [(NSString *)[(NSCalendar *)self calendarIdentifier] isEqualToString:@"chinese"])
    {
      BOOL v37 = [(NSDateComponents *)v31 isLeapMonth];
      BOOL v38 = [(NSDateComponents *)v32 isLeapMonth];
      int v39 = v37 || !v38;
      int v40 = !v37 || v38;
      if (v40) {
        NSComparisonResult v41 = v5;
      }
      else {
        NSComparisonResult v41 = NSOrderedDescending;
      }
      if (v39) {
        NSComparisonResult result = v41;
      }
      else {
        NSComparisonResult result = NSOrderedAscending;
      }
      if (v39 != 1 || !v40) {
        return result;
      }
    }
    else
    {
      NSComparisonResult result = v5;
    }
    uint64_t v42 = *v22++;
    if (v42 == unit) {
      return 0;
    }
    uint64_t v33 = v34 - 1;
    NSComparisonResult v5 = result;
    NSComparisonResult result = NSOrderedSame;
    if (!v34) {
      return result;
    }
  }
  return -1;
}

- (BOOL)isDate:(NSDate *)date1 equalToDate:(NSDate *)date2 toUnitGranularity:(NSCalendarUnit)unit
{
  if (date1 || !_CFExecutableLinkedOnOrAfter(9uLL))
  {
    if (date2 || !_CFExecutableLinkedOnOrAfter(9uLL))
    {
      return [(NSCalendar *)self compareDate:date1 toDate:date2 toUnitGranularity:unit] == NSOrderedSame;
    }
    else
    {
      int v17 = isDate_equalToDate_toUnitGranularity____count___23;
      if (isDate_equalToDate_toUnitGranularity____count___23 <= 13)
      {
        objc_msgSend((id)-[objc_class callStackSymbols](__CFLookUpClass("NSThread"), "callStackSymbols"), "description");
        CFLog(3, @"*** %s: date2 cannot be nil\nFuture exception.\nA few of these errors are going to be reported with this complaint, then further violations will simply be ignored.\nHere is the backtrace where this occurred this time (some frames may be missing due to compiler optimizations):\n%@", v18, v19, v20, v21, v22, v23, (__int16)"-[NSCalendar isDate:equalToDate:toUnitGranularity:]");
        int v17 = isDate_equalToDate_toUnitGranularity____count___23;
      }
      BOOL result = 0;
      isDate_equalToDate_toUnitGranularity____count___23 = v17 + 1;
    }
  }
  else
  {
    int v10 = isDate_equalToDate_toUnitGranularity____count__;
    if (isDate_equalToDate_toUnitGranularity____count__ <= 13)
    {
      objc_msgSend((id)-[objc_class callStackSymbols](__CFLookUpClass("NSThread"), "callStackSymbols"), "description");
      CFLog(3, @"*** %s: date1 cannot be nil\nFuture exception.\nA few of these errors are going to be reported with this complaint, then further violations will simply be ignored.\nHere is the backtrace where this occurred this time (some frames may be missing due to compiler optimizations):\n%@", v11, v12, v13, v14, v15, v16, (__int16)"-[NSCalendar isDate:equalToDate:toUnitGranularity:]");
      int v10 = isDate_equalToDate_toUnitGranularity____count__;
    }
    BOOL result = 0;
    isDate_equalToDate_toUnitGranularity____count__ = v10 + 1;
  }
  return result;
}

- (BOOL)isDate:(NSDate *)date1 inSameDayAsDate:(NSDate *)date2
{
  if (date1 || !_CFExecutableLinkedOnOrAfter(9uLL))
  {
    if (date2 || !_CFExecutableLinkedOnOrAfter(9uLL))
    {
      return [(NSCalendar *)self compareDate:date1 toDate:date2 toUnitGranularity:16] == NSOrderedSame;
    }
    else
    {
      int v15 = isDate_inSameDayAsDate____count___27;
      if (isDate_inSameDayAsDate____count___27 <= 13)
      {
        objc_msgSend((id)-[objc_class callStackSymbols](__CFLookUpClass("NSThread"), "callStackSymbols"), "description");
        CFLog(3, @"*** %s: date2 cannot be nil\nFuture exception.\nA few of these errors are going to be reported with this complaint, then further violations will simply be ignored.\nHere is the backtrace where this occurred this time (some frames may be missing due to compiler optimizations):\n%@", v16, v17, v18, v19, v20, v21, (__int16)"-[NSCalendar isDate:inSameDayAsDate:]");
        int v15 = isDate_inSameDayAsDate____count___27;
      }
      BOOL result = 0;
      isDate_inSameDayAsDate____count___27 = v15 + 1;
    }
  }
  else
  {
    int v8 = isDate_inSameDayAsDate____count__;
    if (isDate_inSameDayAsDate____count__ <= 13)
    {
      objc_msgSend((id)-[objc_class callStackSymbols](__CFLookUpClass("NSThread"), "callStackSymbols"), "description");
      CFLog(3, @"*** %s: date1 cannot be nil\nFuture exception.\nA few of these errors are going to be reported with this complaint, then further violations will simply be ignored.\nHere is the backtrace where this occurred this time (some frames may be missing due to compiler optimizations):\n%@", v9, v10, v11, v12, v13, v14, (__int16)"-[NSCalendar isDate:inSameDayAsDate:]");
      int v8 = isDate_inSameDayAsDate____count__;
    }
    BOOL result = 0;
    isDate_inSameDayAsDate____count__ = v8 + 1;
  }
  return result;
}

- (BOOL)isDateInToday:(NSDate *)date
{
  if (date || !_CFExecutableLinkedOnOrAfter(9uLL)) {
    return [(NSCalendar *)self compareDate:date toDate:+[NSDate date] toUnitGranularity:16] == NSOrderedSame;
  }
  int v6 = isDateInToday____count__;
  if (isDateInToday____count__ <= 13)
  {
    objc_msgSend((id)-[objc_class callStackSymbols](__CFLookUpClass("NSThread"), "callStackSymbols"), "description");
    CFLog(3, @"*** %s: date cannot be nil\nFuture exception.\nA few of these errors are going to be reported with this complaint, then further violations will simply be ignored.\nHere is the backtrace where this occurred this time (some frames may be missing due to compiler optimizations):\n%@", v7, v8, v9, v10, v11, v12, (__int16)"-[NSCalendar isDateInToday:]");
    int v6 = isDateInToday____count__;
  }
  BOOL result = 0;
  isDateInToday____count__ = v6 + 1;
  return result;
}

- (BOOL)isDateInYesterday:(NSDate *)date
{
  v15[1] = *(id *)off_1ECE0A5B0;
  if (date || !_CFExecutableLinkedOnOrAfter(9uLL))
  {
    uint64_t v14 = 0;
    v15[0] = 0;
    BOOL v5 = [(NSCalendar *)self rangeOfUnit:16 startDate:v15 interval:&v14 forDate:+[NSDate date]];
    if (v5) {
      LOBYTE(v5) = -[NSCalendar compareDate:toDate:toUnitGranularity:](self, "compareDate:toDate:toUnitGranularity:", date, [v15[0] dateByAddingTimeInterval:-60.0], 16) == NSOrderedSame;
    }
  }
  else
  {
    int v6 = isDateInYesterday____count__;
    if (isDateInYesterday____count__ <= 13)
    {
      objc_msgSend((id)-[objc_class callStackSymbols](__CFLookUpClass("NSThread"), "callStackSymbols"), "description");
      CFLog(3, @"*** %s: date cannot be nil\nFuture exception.\nA few of these errors are going to be reported with this complaint, then further violations will simply be ignored.\nHere is the backtrace where this occurred this time (some frames may be missing due to compiler optimizations):\n%@", v7, v8, v9, v10, v11, v12, (__int16)"-[NSCalendar isDateInYesterday:]");
      int v6 = isDateInYesterday____count__;
    }
    LOBYTE(v5) = 0;
    isDateInYesterday____count__ = v6 + 1;
  }
  return v5;
}

- (BOOL)isDateInTomorrow:(NSDate *)date
{
  v15[1] = *(id *)off_1ECE0A5B0;
  if (date || !_CFExecutableLinkedOnOrAfter(9uLL))
  {
    double v14 = 0.0;
    v15[0] = 0;
    BOOL v5 = [(NSCalendar *)self rangeOfUnit:16 startDate:v15 interval:&v14 forDate:+[NSDate date]];
    if (v5) {
      LOBYTE(v5) = -[NSCalendar compareDate:toDate:toUnitGranularity:](self, "compareDate:toDate:toUnitGranularity:", date, [v15[0] dateByAddingTimeInterval:v14 + 60.0], 16) == NSOrderedSame;
    }
  }
  else
  {
    int v6 = isDateInTomorrow____count__;
    if (isDateInTomorrow____count__ <= 13)
    {
      objc_msgSend((id)-[objc_class callStackSymbols](__CFLookUpClass("NSThread"), "callStackSymbols"), "description");
      CFLog(3, @"*** %s: date cannot be nil\nFuture exception.\nA few of these errors are going to be reported with this complaint, then further violations will simply be ignored.\nHere is the backtrace where this occurred this time (some frames may be missing due to compiler optimizations):\n%@", v7, v8, v9, v10, v11, v12, (__int16)"-[NSCalendar isDateInTomorrow:]");
      int v6 = isDateInTomorrow____count__;
    }
    LOBYTE(v5) = 0;
    isDateInTomorrow____count__ = v6 + 1;
  }
  return v5;
}

- (BOOL)rangeOfWeekendStartDate:(NSDate *)datep interval:(NSTimeInterval *)tip containingDate:(NSDate *)date
{
  v19[1] = *(void *)off_1ECE0A5B0;
  uint64_t v18 = 0;
  v19[0] = 0;
  double v16 = 0.0;
  uint64_t v17 = 0;
  if ([(NSCalendar *)self nextWeekendStartDate:v19 interval:&v17 options:0 afterDate:date])
  {
    char v9 = ![(NSCalendar *)self nextWeekendStartDate:&v18 interval:&v16 options:4 afterDate:v19[0]];
  }
  else
  {
    char v9 = 1;
  }
  [(NSDate *)date timeIntervalSinceReferenceDate];
  double v11 = v10;
  [(NSDate *)v18 timeIntervalSinceReferenceDate];
  if (v9) {
    return 0;
  }
  double v13 = v16;
  if (v12 > v11 || v11 >= v12 + v16) {
    return 0;
  }
  if (datep) {
    *datep = v18;
  }
  if (tip) {
    *tip = v13;
  }
  return 1;
}

- (NSDateComponents)components:(NSCalendarUnit)unitFlags fromDateComponents:(NSDateComponents *)startingDateComp toDateComponents:(NSDateComponents *)resultDateComp options:(NSCalendarOptions)options
{
  double v11 = [(NSDateComponents *)startingDateComp calendar];
  if (!v11) {
    double v11 = self;
  }
  uint64_t v12 = [(NSCalendar *)v11 dateFromComponents:startingDateComp];
  double v13 = [(NSDateComponents *)resultDateComp calendar];
  if (!v13) {
    double v13 = self;
  }
  uint64_t v14 = [(NSCalendar *)v13 dateFromComponents:resultDateComp];

  return [(NSCalendar *)self components:unitFlags fromDate:v12 toDate:v14 options:options];
}

- (NSDate)dateByAddingUnit:(NSCalendarUnit)unit value:(NSInteger)value toDate:(NSDate *)date options:(NSCalendarOptions)options
{
  id v11 = (id)objc_opt_new();
  [v11 setValue:value forComponent:unit];

  return [(NSCalendar *)self dateByAddingComponents:v11 toDate:date options:options];
}

- (NSDate)nextDateAfterDate:(NSDate *)date matchingComponents:(NSDateComponents *)comps options:(NSCalendarOptions)options
{
  uint64_t v14 = *(void *)off_1ECE0A5B0;
  uint64_t v8 = 0;
  char v9 = &v8;
  uint64_t v10 = 0x3052000000;
  id v11 = __Block_byref_object_copy__1;
  uint64_t v12 = __Block_byref_object_dispose__1;
  uint64_t v13 = 0;
  v7[0] = off_1ECE0A5A0;
  v7[1] = 3221225472;
  v7[2] = __59__NSCalendar_nextDateAfterDate_matchingComponents_options___block_invoke;
  v7[3] = &unk_1ECDFE730;
  v7[4] = &v8;
  [(NSCalendar *)self enumerateDatesStartingAfterDate:date matchingComponents:comps options:options usingBlock:v7];
  BOOL v5 = (NSDate *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __59__NSCalendar_nextDateAfterDate_matchingComponents_options___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 40) = a2;
  *a4 = 1;
  return result;
}

- (NSDate)nextDateAfterDate:(NSDate *)date matchingUnit:(NSCalendarUnit)unit value:(NSInteger)value options:(NSCalendarOptions)options
{
  if (date || !_CFExecutableLinkedOnOrAfter(9uLL))
  {
    id v11 = (id)objc_opt_new();
    [v11 setValue:value forComponent:unit];
    return [(NSCalendar *)self nextDateAfterDate:date matchingComponents:v11 options:options];
  }
  else
  {
    int v13 = nextDateAfterDate_matchingUnit_value_options____count__;
    if (nextDateAfterDate_matchingUnit_value_options____count__ <= 13)
    {
      objc_msgSend((id)-[objc_class callStackSymbols](__CFLookUpClass("NSThread"), "callStackSymbols"), "description");
      CFLog(3, @"*** %s: date cannot be nil\nFuture exception.\nA few of these errors are going to be reported with this complaint, then further violations will simply be ignored.\nHere is the backtrace where this occurred this time (some frames may be missing due to compiler optimizations):\n%@", v14, v15, v16, v17, v18, v19, (__int16)"-[NSCalendar nextDateAfterDate:matchingUnit:value:options:]");
      int v13 = nextDateAfterDate_matchingUnit_value_options____count__;
    }
    nextDateAfterDate_matchingUnit_value_options____count__ = v13 + 1;
    return 0;
  }
}

- (NSDate)nextDateAfterDate:(NSDate *)date matchingHour:(NSInteger)hourValue minute:(NSInteger)minuteValue second:(NSInteger)secondValue options:(NSCalendarOptions)options
{
  if (date || !_CFExecutableLinkedOnOrAfter(9uLL))
  {
    id v13 = (id)objc_opt_new();
    [v13 setHour:hourValue];
    [v13 setMinute:minuteValue];
    [v13 setSecond:secondValue];
    return [(NSCalendar *)self nextDateAfterDate:date matchingComponents:v13 options:options];
  }
  else
  {
    int v15 = nextDateAfterDate_matchingHour_minute_second_options____count__;
    if (nextDateAfterDate_matchingHour_minute_second_options____count__ <= 13)
    {
      objc_msgSend((id)-[objc_class callStackSymbols](__CFLookUpClass("NSThread"), "callStackSymbols"), "description");
      CFLog(3, @"*** %s: date cannot be nil\nFuture exception.\nA few of these errors are going to be reported with this complaint, then further violations will simply be ignored.\nHere is the backtrace where this occurred this time (some frames may be missing due to compiler optimizations):\n%@", v16, v17, v18, v19, v20, v21, (__int16)"-[NSCalendar nextDateAfterDate:matchingHour:minute:second:options:]");
      int v15 = nextDateAfterDate_matchingHour_minute_second_options____count__;
    }
    nextDateAfterDate_matchingHour_minute_second_options____count__ = v15 + 1;
    return 0;
  }
}

- (NSDate)dateBySettingUnit:(NSCalendarUnit)unit value:(NSInteger)v ofDate:(NSDate *)date options:(NSCalendarOptions)opts
{
  uint64_t v7 = date;
  uint64_t v21 = *(void *)off_1ECE0A5B0;
  if ([(NSCalendar *)self component:unit fromDate:date] != v)
  {
    if (opts) {
      NSCalendarOptions v11 = opts;
    }
    else {
      NSCalendarOptions v11 = 1024;
    }
    uint64_t v12 = objc_alloc_init(NSDateComponents);
    [(NSDateComponents *)v12 setValue:v forComponent:unit];
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x3052000000;
    uint64_t v18 = __Block_byref_object_copy__1;
    uint64_t v19 = __Block_byref_object_dispose__1;
    uint64_t v20 = 0;
    v14[0] = off_1ECE0A5A0;
    v14[1] = 3221225472;
    v14[2] = __53__NSCalendar_dateBySettingUnit_value_ofDate_options___block_invoke;
    v14[3] = &unk_1ECDFE730;
    v14[4] = &v15;
    [(NSCalendar *)self enumerateDatesStartingAfterDate:v7 matchingComponents:v12 options:v11 usingBlock:v14];

    uint64_t v7 = (NSDate *)v16[5];
    _Block_object_dispose(&v15, 8);
  }
  return v7;
}

uint64_t __53__NSCalendar_dateBySettingUnit_value_ofDate_options___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 40) = a2;
  *a4 = 1;
  return result;
}

- (NSDate)dateBySettingHour:(NSInteger)h minute:(NSInteger)m second:(NSInteger)s ofDate:(NSDate *)date options:(NSCalendarOptions)opts
{
  __int16 v7 = opts;
  v27[1] = *(id *)off_1ECE0A5B0;
  if (date || !_CFExecutableLinkedOnOrAfter(9uLL))
  {
    uint64_t v26 = 0;
    v27[0] = 0;
    [(NSCalendar *)self rangeOfUnit:16 startDate:v27 interval:&v26 forDate:date];
    if (v27[0])
    {
      id v13 = objc_alloc_init(NSDateComponents);
      [(NSDateComponents *)v13 setHour:h];
      [(NSDateComponents *)v13 setMinute:m];
      [(NSDateComponents *)v13 setSecond:s];
      uint64_t v14 = 2;
      if ((v7 & 2) == 0) {
        uint64_t v14 = 1024;
      }
      uint64_t v15 = 0x2000;
      if ((v7 & 0x2000) == 0) {
        uint64_t v15 = 4096;
      }
      uint64_t v16 = v14 | v15;
      uint64_t v17 = -[NSCalendar nextDateAfterDate:matchingComponents:options:](self, "nextDateAfterDate:matchingComponents:options:", [v27[0] dateByAddingTimeInterval:-0.5], v13, v14 | v15);
      if ([(NSDate *)v17 compare:v27[0]] == NSOrderedAscending) {
        uint64_t v17 = [(NSCalendar *)self nextDateAfterDate:v27[0] matchingComponents:v13 options:v16];
      }
    }
    else
    {
      return 0;
    }
  }
  else
  {
    int v18 = dateBySettingHour_minute_second_ofDate_options____count__;
    if (dateBySettingHour_minute_second_ofDate_options____count__ <= 13)
    {
      objc_msgSend((id)-[objc_class callStackSymbols](__CFLookUpClass("NSThread"), "callStackSymbols"), "description");
      CFLog(3, @"*** %s: date cannot be nil\nFuture exception.\nA few of these errors are going to be reported with this complaint, then further violations will simply be ignored.\nHere is the backtrace where this occurred this time (some frames may be missing due to compiler optimizations):\n%@", v19, v20, v21, v22, v23, v24, (__int16)"-[NSCalendar dateBySettingHour:minute:second:ofDate:options:]");
      int v18 = dateBySettingHour_minute_second_ofDate_options____count__;
    }
    uint64_t v17 = 0;
    dateBySettingHour_minute_second_ofDate_options____count__ = v18 + 1;
  }
  return v17;
}

- (BOOL)date:(NSDate *)date matchesComponents:(NSDateComponents *)components
{
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  do
  {
    uint64_t v9 = qword_182EDD7A0[v7];
    if ([(NSDateComponents *)components valueForComponent:v9] == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = v9;
    }
    v8 |= v10;
    ++v7;
  }
  while (v7 != 14);
  if (v8 || ![(NSDateComponents *)components isLeapMonthSet])
  {
    id v13 = [(NSCalendar *)self components:v8 fromDate:date];
    id v14 = (id)[(NSDateComponents *)components copy];
    if ([(NSDateComponents *)v13 isLeapMonthSet]
      && ![(NSDateComponents *)components isLeapMonthSet])
    {
      objc_msgSend(v14, "setLeapMonth:", -[NSDateComponents isLeapMonth](v13, "isLeapMonth"));
    }
    uint64_t v15 = [(NSDateComponents *)v13 valueForComponent:0x8000];
    if (v15 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v16 = v15;
      uint64_t v17 = [v14 valueForComponent:0x8000];
      unint64_t v18 = v16 - v17;
      if (v16 - v17 < 0) {
        unint64_t v18 = v17 - v16;
      }
      if (v18 > 0x1F4) {
        return 0;
      }
      [(NSDateComponents *)v13 setNanosecond:0];
      [v14 setNanosecond:0];
    }
    return [v14 isEqual:v13];
  }
  else
  {
    NSCalendarOptions v11 = [(NSCalendar *)self components:8 fromDate:date];
    return [(NSDateComponents *)v11 isLeapMonthSet];
  }
}

- (BOOL)rangeOfUnit:(NSCalendarUnit)unit startDate:(NSDate *)datep interval:(NSTimeInterval *)tip forDate:(NSDate *)date
{
  return 0;
}

- (NSArray)eraSymbols
{
  uint64_t v3 = CFDateFormatterCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, (CFLocaleRef)[(NSCalendar *)self locale], kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, @"kCFDateFormatterCalendarKey", self);
  uint64_t v4 = (id)CFDateFormatterCopyProperty(v3, @"kCFDateFormatterEraSymbolsKey");
  CFRelease(v3);
  return v4;
}

- (NSArray)monthSymbols
{
  uint64_t v3 = CFDateFormatterCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, (CFLocaleRef)[(NSCalendar *)self locale], kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, @"kCFDateFormatterCalendarKey", self);
  uint64_t v4 = (id)CFDateFormatterCopyProperty(v3, @"kCFDateFormatterMonthSymbolsKey");
  CFRelease(v3);
  return v4;
}

- (NSArray)shortMonthSymbols
{
  uint64_t v3 = CFDateFormatterCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, (CFLocaleRef)[(NSCalendar *)self locale], kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, @"kCFDateFormatterCalendarKey", self);
  uint64_t v4 = (id)CFDateFormatterCopyProperty(v3, @"kCFDateFormatterShortMonthSymbolsKey");
  CFRelease(v3);
  return v4;
}

- (NSArray)weekdaySymbols
{
  uint64_t v3 = CFDateFormatterCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, (CFLocaleRef)[(NSCalendar *)self locale], kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, @"kCFDateFormatterCalendarKey", self);
  uint64_t v4 = (id)CFDateFormatterCopyProperty(v3, @"kCFDateFormatterWeekdaySymbolsKey");
  CFRelease(v3);
  return v4;
}

- (NSArray)shortWeekdaySymbols
{
  uint64_t v3 = CFDateFormatterCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, (CFLocaleRef)[(NSCalendar *)self locale], kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, @"kCFDateFormatterCalendarKey", self);
  uint64_t v4 = (id)CFDateFormatterCopyProperty(v3, @"kCFDateFormatterShortWeekdaySymbolsKey");
  CFRelease(v3);
  return v4;
}

- (NSString)AMSymbol
{
  uint64_t v3 = CFDateFormatterCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, (CFLocaleRef)[(NSCalendar *)self locale], kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, @"kCFDateFormatterCalendarKey", self);
  uint64_t v4 = (id)CFDateFormatterCopyProperty(v3, @"kCFDateFormatterAMSymbolKey");
  CFRelease(v3);
  return v4;
}

- (NSString)PMSymbol
{
  uint64_t v3 = CFDateFormatterCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, (CFLocaleRef)[(NSCalendar *)self locale], kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, @"kCFDateFormatterCalendarKey", self);
  uint64_t v4 = (id)CFDateFormatterCopyProperty(v3, @"kCFDateFormatterPMSymbolKey");
  CFRelease(v3);
  return v4;
}

- (NSArray)longEraSymbols
{
  uint64_t v3 = CFDateFormatterCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, (CFLocaleRef)[(NSCalendar *)self locale], kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, @"kCFDateFormatterCalendarKey", self);
  uint64_t v4 = (id)CFDateFormatterCopyProperty(v3, @"kCFDateFormatterLongEraSymbolsKey");
  CFRelease(v3);
  return v4;
}

- (NSArray)veryShortMonthSymbols
{
  uint64_t v3 = CFDateFormatterCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, (CFLocaleRef)[(NSCalendar *)self locale], kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, @"kCFDateFormatterCalendarKey", self);
  uint64_t v4 = (id)CFDateFormatterCopyProperty(v3, @"kCFDateFormatterVeryShortMonthSymbolsKey");
  CFRelease(v3);
  return v4;
}

- (NSArray)standaloneMonthSymbols
{
  uint64_t v3 = CFDateFormatterCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, (CFLocaleRef)[(NSCalendar *)self locale], kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, @"kCFDateFormatterCalendarKey", self);
  uint64_t v4 = (id)CFDateFormatterCopyProperty(v3, @"kCFDateFormatterStandaloneMonthSymbolsKey");
  CFRelease(v3);
  return v4;
}

- (NSArray)shortStandaloneMonthSymbols
{
  uint64_t v3 = CFDateFormatterCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, (CFLocaleRef)[(NSCalendar *)self locale], kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, @"kCFDateFormatterCalendarKey", self);
  uint64_t v4 = (id)CFDateFormatterCopyProperty(v3, @"kCFDateFormatterShortStandaloneMonthSymbolsKey");
  CFRelease(v3);
  return v4;
}

- (NSArray)veryShortStandaloneMonthSymbols
{
  uint64_t v3 = CFDateFormatterCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, (CFLocaleRef)[(NSCalendar *)self locale], kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, @"kCFDateFormatterCalendarKey", self);
  uint64_t v4 = (id)CFDateFormatterCopyProperty(v3, @"kCFDateFormatterVeryShortStandaloneMonthSymbolsKey");
  CFRelease(v3);
  return v4;
}

- (NSArray)veryShortWeekdaySymbols
{
  uint64_t v3 = CFDateFormatterCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, (CFLocaleRef)[(NSCalendar *)self locale], kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, @"kCFDateFormatterCalendarKey", self);
  uint64_t v4 = (id)CFDateFormatterCopyProperty(v3, @"kCFDateFormatterVeryShortWeekdaySymbolsKey");
  CFRelease(v3);
  return v4;
}

- (NSArray)standaloneWeekdaySymbols
{
  uint64_t v3 = CFDateFormatterCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, (CFLocaleRef)[(NSCalendar *)self locale], kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, @"kCFDateFormatterCalendarKey", self);
  uint64_t v4 = (id)CFDateFormatterCopyProperty(v3, @"kCFDateFormatterStandaloneWeekdaySymbolsKey");
  CFRelease(v3);
  return v4;
}

- (NSArray)shortStandaloneWeekdaySymbols
{
  uint64_t v3 = CFDateFormatterCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, (CFLocaleRef)[(NSCalendar *)self locale], kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, @"kCFDateFormatterCalendarKey", self);
  uint64_t v4 = (id)CFDateFormatterCopyProperty(v3, @"kCFDateFormatterShortStandaloneWeekdaySymbolsKey");
  CFRelease(v3);
  return v4;
}

- (NSArray)veryShortStandaloneWeekdaySymbols
{
  uint64_t v3 = CFDateFormatterCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, (CFLocaleRef)[(NSCalendar *)self locale], kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, @"kCFDateFormatterCalendarKey", self);
  uint64_t v4 = (id)CFDateFormatterCopyProperty(v3, @"kCFDateFormatterVeryShortStandaloneWeekdaySymbolsKey");
  CFRelease(v3);
  return v4;
}

- (NSArray)quarterSymbols
{
  uint64_t v3 = CFDateFormatterCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, (CFLocaleRef)[(NSCalendar *)self locale], kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, @"kCFDateFormatterCalendarKey", self);
  uint64_t v4 = (id)CFDateFormatterCopyProperty(v3, @"kCFDateFormatterQuarterSymbolsKey");
  CFRelease(v3);
  return v4;
}

- (NSArray)shortQuarterSymbols
{
  uint64_t v3 = CFDateFormatterCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, (CFLocaleRef)[(NSCalendar *)self locale], kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, @"kCFDateFormatterCalendarKey", self);
  uint64_t v4 = (id)CFDateFormatterCopyProperty(v3, @"kCFDateFormatterShortQuarterSymbolsKey");
  CFRelease(v3);
  return v4;
}

- (NSArray)standaloneQuarterSymbols
{
  uint64_t v3 = CFDateFormatterCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, (CFLocaleRef)[(NSCalendar *)self locale], kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, @"kCFDateFormatterCalendarKey", self);
  uint64_t v4 = (id)CFDateFormatterCopyProperty(v3, @"kCFDateFormatterStandaloneQuarterSymbolsKey");
  CFRelease(v3);
  return v4;
}

- (NSArray)shortStandaloneQuarterSymbols
{
  uint64_t v3 = CFDateFormatterCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, (CFLocaleRef)[(NSCalendar *)self locale], kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, @"kCFDateFormatterCalendarKey", self);
  uint64_t v4 = (id)CFDateFormatterCopyProperty(v3, @"kCFDateFormatterShortStandaloneQuarterSymbolsKey");
  CFRelease(v3);
  return v4;
}

- (BOOL)isDateInWeekend:(NSDate *)date
{
  OUTLINED_FUNCTION_0_15();
  uint64_t v3 = __CFLookUpClass("NSCalendar");
  OUTLINED_FUNCTION_1_9(v3);
}

- (BOOL)nextWeekendStartDate:(NSDate *)datep interval:(NSTimeInterval *)tip options:(NSCalendarOptions)options afterDate:(NSDate *)date
{
  OUTLINED_FUNCTION_0_15();
  int v6 = __CFLookUpClass("NSCalendar");
  OUTLINED_FUNCTION_1_9(v6);
}

- (void)enumerateDatesStartingAfterDate:(NSDate *)start matchingComponents:(NSDateComponents *)comps options:(NSCalendarOptions)opts usingBlock:(void *)block
{
  OUTLINED_FUNCTION_0_15();
  __CFLookUpClass("NSCalendar");
  OUTLINED_FUNCTION_2_3();

  __CFRequireConcreteImplementation(v6, v7, v8);
}

- (NSCalendarIdentifier)calendarIdentifier
{
  OUTLINED_FUNCTION_0_15();
  v2 = __CFLookUpClass("NSCalendar");
  OUTLINED_FUNCTION_1_9(v2);
}

- (void)setLocale:(NSLocale *)locale
{
  OUTLINED_FUNCTION_0_15();
  __CFLookUpClass("NSCalendar");
  OUTLINED_FUNCTION_2_3();

  __CFRequireConcreteImplementation(v3, v4, v5);
}

- (NSLocale)locale
{
  OUTLINED_FUNCTION_0_15();
  v2 = __CFLookUpClass("NSCalendar");
  OUTLINED_FUNCTION_1_9(v2);
}

- (void)setTimeZone:(NSTimeZone *)timeZone
{
  OUTLINED_FUNCTION_0_15();
  __CFLookUpClass("NSCalendar");
  OUTLINED_FUNCTION_2_3();

  __CFRequireConcreteImplementation(v3, v4, v5);
}

- (NSTimeZone)timeZone
{
  OUTLINED_FUNCTION_0_15();
  v2 = __CFLookUpClass("NSCalendar");
  OUTLINED_FUNCTION_1_9(v2);
}

- (void)setFirstWeekday:(NSUInteger)firstWeekday
{
  OUTLINED_FUNCTION_0_15();
  __CFLookUpClass("NSCalendar");
  OUTLINED_FUNCTION_2_3();

  __CFRequireConcreteImplementation(v3, v4, v5);
}

- (NSUInteger)firstWeekday
{
  OUTLINED_FUNCTION_0_15();
  v2 = __CFLookUpClass("NSCalendar");
  OUTLINED_FUNCTION_1_9(v2);
}

- (void)setMinimumDaysInFirstWeek:(NSUInteger)minimumDaysInFirstWeek
{
  OUTLINED_FUNCTION_0_15();
  __CFLookUpClass("NSCalendar");
  OUTLINED_FUNCTION_2_3();

  __CFRequireConcreteImplementation(v3, v4, v5);
}

- (NSUInteger)minimumDaysInFirstWeek
{
  OUTLINED_FUNCTION_0_15();
  v2 = __CFLookUpClass("NSCalendar");
  OUTLINED_FUNCTION_1_9(v2);
}

- (NSRange)minimumRangeOfUnit:(NSCalendarUnit)unit
{
  OUTLINED_FUNCTION_0_15();
  uint64_t v3 = __CFLookUpClass("NSCalendar");
  OUTLINED_FUNCTION_1_9(v3);
}

- (NSRange)maximumRangeOfUnit:(NSCalendarUnit)unit
{
  OUTLINED_FUNCTION_0_15();
  uint64_t v3 = __CFLookUpClass("NSCalendar");
  OUTLINED_FUNCTION_1_9(v3);
}

- (NSRange)rangeOfUnit:(NSCalendarUnit)smaller inUnit:(NSCalendarUnit)larger forDate:(NSDate *)date
{
  OUTLINED_FUNCTION_0_15();
  BOOL v5 = __CFLookUpClass("NSCalendar");
  OUTLINED_FUNCTION_1_9(v5);
}

- (NSUInteger)ordinalityOfUnit:(NSCalendarUnit)smaller inUnit:(NSCalendarUnit)larger forDate:(NSDate *)date
{
  OUTLINED_FUNCTION_0_15();
  BOOL v5 = __CFLookUpClass("NSCalendar");
  OUTLINED_FUNCTION_1_9(v5);
}

- (NSDate)dateFromComponents:(NSDateComponents *)comps
{
  OUTLINED_FUNCTION_0_15();
  uint64_t v3 = __CFLookUpClass("NSCalendar");
  OUTLINED_FUNCTION_1_9(v3);
}

- (NSDateComponents)components:(NSCalendarUnit)unitFlags fromDate:(NSDate *)date
{
  OUTLINED_FUNCTION_0_15();
  uint64_t v4 = __CFLookUpClass("NSCalendar");
  OUTLINED_FUNCTION_1_9(v4);
}

- (NSDate)dateByAddingComponents:(NSDateComponents *)comps toDate:(NSDate *)date options:(NSCalendarOptions)opts
{
  OUTLINED_FUNCTION_0_15();
  BOOL v5 = __CFLookUpClass("NSCalendar");
  OUTLINED_FUNCTION_1_9(v5);
}

- (NSDateComponents)components:(NSCalendarUnit)unitFlags fromDate:(NSDate *)startingDate toDate:(NSDate *)resultDate options:(NSCalendarOptions)opts
{
  OUTLINED_FUNCTION_0_15();
  int v6 = __CFLookUpClass("NSCalendar");
  OUTLINED_FUNCTION_1_9(v6);
}

@end