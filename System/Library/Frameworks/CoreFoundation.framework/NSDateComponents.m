@interface NSDateComponents
+ (BOOL)supportsSecureCoding;
+ (NSDateComponents)allocWithZone:(_NSZone *)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLeapMonth;
- (BOOL)isLeapMonthSet;
- (BOOL)isValidDate;
- (BOOL)isValidDateInCalendar:(NSCalendar *)calendar;
- (NSCalendar)calendar;
- (NSDate)date;
- (NSDateComponents)init;
- (NSDateComponents)initWithCoder:(id)a3;
- (NSInteger)day;
- (NSInteger)era;
- (NSInteger)hour;
- (NSInteger)minute;
- (NSInteger)month;
- (NSInteger)nanosecond;
- (NSInteger)quarter;
- (NSInteger)second;
- (NSInteger)valueForComponent:(NSCalendarUnit)unit;
- (NSInteger)week;
- (NSInteger)weekOfMonth;
- (NSInteger)weekOfYear;
- (NSInteger)weekday;
- (NSInteger)weekdayOrdinal;
- (NSInteger)year;
- (NSInteger)yearForWeekOfYear;
- (NSTimeZone)timeZone;
- (__CFDateComponents)_dateComponents;
- (id)_initWithCFDateComponents:(__CFDateComponents *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)dayOfYear;
- (unint64_t)hash;
- (void)dealloc;
- (void)setCalendar:(NSCalendar *)calendar;
- (void)setDay:(NSInteger)day;
- (void)setDayOfYear:(int64_t)a3;
- (void)setEra:(NSInteger)era;
- (void)setHour:(NSInteger)hour;
- (void)setLeapMonth:(BOOL)leapMonth;
- (void)setMinute:(NSInteger)minute;
- (void)setMonth:(NSInteger)month;
- (void)setNanosecond:(NSInteger)nanosecond;
- (void)setQuarter:(NSInteger)quarter;
- (void)setSecond:(NSInteger)second;
- (void)setTimeZone:(NSTimeZone *)timeZone;
- (void)setValue:(NSInteger)value forComponent:(NSCalendarUnit)unit;
- (void)setWeek:(NSInteger)v;
- (void)setWeekOfMonth:(NSInteger)weekOfMonth;
- (void)setWeekOfYear:(NSInteger)weekOfYear;
- (void)setWeekday:(NSInteger)weekday;
- (void)setWeekdayOrdinal:(NSInteger)weekdayOrdinal;
- (void)setYear:(NSInteger)year;
- (void)setYearForWeekOfYear:(NSInteger)yearForWeekOfYear;
@end

@implementation NSDateComponents

- (NSInteger)nanosecond
{
  uint64_t v2 = *(void *)object_getIndexedIvars(self);

  return CFDateComponentsGetValue(v2, 0x8000);
}

- (NSInteger)era
{
  uint64_t v2 = *(void *)object_getIndexedIvars(self);

  return CFDateComponentsGetValue(v2, 2);
}

- (NSInteger)yearForWeekOfYear
{
  uint64_t v2 = *(void *)object_getIndexedIvars(self);

  return CFDateComponentsGetValue(v2, 0x4000);
}

- (NSInteger)quarter
{
  uint64_t v2 = *(void *)object_getIndexedIvars(self);

  return CFDateComponentsGetValue(v2, 2048);
}

- (NSInteger)week
{
  uint64_t v2 = *(void *)object_getIndexedIvars(self);

  return CFDateComponentsGetValue(v2, 256);
}

- (int64_t)dayOfYear
{
  uint64_t v2 = *(void *)object_getIndexedIvars(self);

  return CFDateComponentsGetValue(v2, 0x10000);
}

- (unint64_t)hash
{
  uint64_t v2 = *(const void **)object_getIndexedIvars(self);

  return CFHash(v2);
}

- (NSDate)date
{
  v3 = [(NSDateComponents *)self timeZone];
  if (v3) {
    [(NSCalendar *)[(NSDateComponents *)self calendar] setTimeZone:v3];
  }
  v4 = [(NSDateComponents *)self calendar];

  return [(NSCalendar *)v4 dateFromComponents:self];
}

- (BOOL)isValidDateInCalendar:(NSCalendar *)calendar
{
  if (calendar || !_CFExecutableLinkedOnOrAfter(9uLL))
  {
    IndexedIvars = (void **)object_getIndexedIvars(self);
    return CFDateComponentsIsValidDateInCalendar(*IndexedIvars, calendar);
  }
  else
  {
    int v7 = isValidDateInCalendar____count__;
    if (isValidDateInCalendar____count__ <= 13)
    {
      objc_msgSend((id)-[objc_class callStackSymbols](__CFLookUpClass("NSThread"), "callStackSymbols"), "description");
      CFLog(3, @"*** %s: calendar cannot be nil\nFuture exception.\nA few of these errors are going to be reported with this complaint, then further violations will simply be ignored.\nHere is the backtrace where this occurred this time (some frames may be missing due to compiler optimizations):\n%@", v8, v9, v10, v11, v12, v13, (__int16)"-[NSDateComponents isValidDateInCalendar:]");
      int v7 = isValidDateInCalendar____count__;
    }
    BOOL result = 0;
    isValidDateInCalendar____count__ = v7 + 1;
  }
  return result;
}

- (NSInteger)day
{
  uint64_t v2 = *(void *)object_getIndexedIvars(self);

  return CFDateComponentsGetValue(v2, 16);
}

- (NSInteger)year
{
  uint64_t v2 = *(void *)object_getIndexedIvars(self);

  return CFDateComponentsGetValue(v2, 4);
}

- (NSInteger)month
{
  uint64_t v2 = *(void *)object_getIndexedIvars(self);

  return CFDateComponentsGetValue(v2, 8);
}

- (NSInteger)hour
{
  uint64_t v2 = *(void *)object_getIndexedIvars(self);

  return CFDateComponentsGetValue(v2, 32);
}

- (NSInteger)second
{
  uint64_t v2 = *(void *)object_getIndexedIvars(self);

  return CFDateComponentsGetValue(v2, 128);
}

- (NSInteger)minute
{
  uint64_t v2 = *(void *)object_getIndexedIvars(self);

  return CFDateComponentsGetValue(v2, 64);
}

- (NSInteger)weekOfMonth
{
  uint64_t v2 = *(void *)object_getIndexedIvars(self);

  return CFDateComponentsGetValue(v2, 4096);
}

- (NSInteger)weekOfYear
{
  uint64_t v2 = *(void *)object_getIndexedIvars(self);

  return CFDateComponentsGetValue(v2, 0x2000);
}

- (NSInteger)weekday
{
  uint64_t v2 = *(void *)object_getIndexedIvars(self);

  return CFDateComponentsGetValue(v2, 512);
}

- (NSInteger)weekdayOrdinal
{
  uint64_t v2 = *(void *)object_getIndexedIvars(self);

  return CFDateComponentsGetValue(v2, 1024);
}

- (BOOL)isLeapMonth
{
  IndexedIvars = (uint64_t *)object_getIndexedIvars(self);
  uint64_t Value = CFDateComponentsGetValue(*IndexedIvars, 0x40000000);
  return Value != 0x7FFFFFFFFFFFFFFFLL && Value != 0;
}

- (BOOL)isLeapMonthSet
{
  IndexedIvars = (uint64_t *)object_getIndexedIvars(self);
  return CFDateComponentsGetValue(*IndexedIvars, 0x40000000) != 0x7FFFFFFFFFFFFFFFLL;
}

- (__CFDateComponents)_dateComponents
{
  return *(__CFDateComponents **)object_getIndexedIvars(self);
}

- (void)dealloc
{
  uint64_t v5 = *(void *)off_1ECE0A5B0;
  v3 = *(const void **)object_getIndexedIvars(self);
  if (v3) {
    CFRelease(v3);
  }
  v4.receiver = self;
  v4.super_class = (Class)NSDateComponents;
  [(NSDateComponents *)&v4 dealloc];
}

- (void)setDay:(NSInteger)day
{
  objc_super v4 = *(void **)object_getIndexedIvars(self);

  CFDateComponentsSetValue(v4, 16, day);
}

- (void)setYear:(NSInteger)year
{
  objc_super v4 = *(void **)object_getIndexedIvars(self);

  CFDateComponentsSetValue(v4, 4, year);
}

- (void)setMonth:(NSInteger)month
{
  objc_super v4 = *(void **)object_getIndexedIvars(self);

  CFDateComponentsSetValue(v4, 8, month);
}

- (void)setSecond:(NSInteger)second
{
  objc_super v4 = *(void **)object_getIndexedIvars(self);

  CFDateComponentsSetValue(v4, 128, second);
}

- (void)setHour:(NSInteger)hour
{
  objc_super v4 = *(void **)object_getIndexedIvars(self);

  CFDateComponentsSetValue(v4, 32, hour);
}

- (void)setMinute:(NSInteger)minute
{
  objc_super v4 = *(void **)object_getIndexedIvars(self);

  CFDateComponentsSetValue(v4, 64, minute);
}

- (id)_initWithCFDateComponents:(__CFDateComponents *)a3
{
  IndexedIvars = object_getIndexedIvars(self);
  void *IndexedIvars = CFDateComponentsCreateCopy(&__kCFAllocatorSystemDefault, (uint64_t)a3);
  return self;
}

- (NSCalendar)calendar
{
  IndexedIvars = (uint64_t *)object_getIndexedIvars(self);
  v3 = (void *)CFDateComponentsCopyCalendar(*IndexedIvars);

  return (NSCalendar *)v3;
}

- (NSDateComponents)init
{
  IndexedIvars = object_getIndexedIvars(self);
  CFDateComponentsCreate(&__kCFAllocatorSystemDefault);
  void *IndexedIvars = v4;
  return self;
}

- (NSTimeZone)timeZone
{
  IndexedIvars = (uint64_t *)object_getIndexedIvars(self);
  v3 = (void *)CFDateComponentsCopyTimeZone(*IndexedIvars);

  return (NSTimeZone *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = (__objc2_class *)objc_opt_class();
  if (v5 == NSDateComponents)
  {
    IndexedIvars = (uint64_t *)object_getIndexedIvars(self);
    uint64_t v9 = +[NSDateComponents allocWithZone:a3];
    uint64_t v10 = *IndexedIvars;
    return [(NSDateComponents *)v9 _initWithCFDateComponents:v10];
  }
  else
  {
    v6 = [[(__objc2_class *)v5 allocWithZone:a3] init];
    [(__objc2_class *)v6 setCalendar:[(NSDateComponents *)self calendar]];
    [(__objc2_class *)v6 setTimeZone:[(NSDateComponents *)self timeZone]];
    [(__objc2_class *)v6 setEra:[(NSDateComponents *)self era]];
    [(__objc2_class *)v6 setYear:[(NSDateComponents *)self year]];
    [(__objc2_class *)v6 setQuarter:[(NSDateComponents *)self quarter]];
    [(__objc2_class *)v6 setMonth:[(NSDateComponents *)self month]];
    [(__objc2_class *)v6 setDay:[(NSDateComponents *)self day]];
    [(__objc2_class *)v6 setHour:[(NSDateComponents *)self hour]];
    [(__objc2_class *)v6 setMinute:[(NSDateComponents *)self minute]];
    [(__objc2_class *)v6 setSecond:[(NSDateComponents *)self second]];
    [(__objc2_class *)v6 setNanosecond:[(NSDateComponents *)self nanosecond]];
    [(__objc2_class *)v6 setWeek:[(NSDateComponents *)self week]];
    [(__objc2_class *)v6 setWeekOfYear:[(NSDateComponents *)self weekOfYear]];
    [(__objc2_class *)v6 setWeekOfMonth:[(NSDateComponents *)self weekOfMonth]];
    [(__objc2_class *)v6 setYearForWeekOfYear:[(NSDateComponents *)self yearForWeekOfYear]];
    [(__objc2_class *)v6 setWeekday:[(NSDateComponents *)self weekday]];
    [(__objc2_class *)v6 setWeekdayOrdinal:[(NSDateComponents *)self weekdayOrdinal]];
    [(__objc2_class *)v6 setDayOfYear:[(NSDateComponents *)self dayOfYear]];
    if ([(NSDateComponents *)self isLeapMonthSet]) {
      [(__objc2_class *)v6 setLeapMonth:[(NSDateComponents *)self isLeapMonth]];
    }
    return v6;
  }
}

+ (NSDateComponents)allocWithZone:(_NSZone *)a3
{
  return (NSDateComponents *)__CFAllocateObject((objc_class *)a1, 8uLL);
}

- (void)setLeapMonth:(BOOL)leapMonth
{
  BOOL v3 = leapMonth;
  uint64_t v4 = *(void **)object_getIndexedIvars(self);

  CFDateComponentsSetValue(v4, 0x40000000, v3);
}

- (void)setEra:(NSInteger)era
{
  uint64_t v4 = *(void **)object_getIndexedIvars(self);

  CFDateComponentsSetValue(v4, 2, era);
}

- (void)setCalendar:(NSCalendar *)calendar
{
  uint64_t v4 = *(void *)object_getIndexedIvars(self);

  CFDateComponentsSetCalendar(v4, calendar);
}

- (void)setNanosecond:(NSInteger)nanosecond
{
  uint64_t v4 = *(void **)object_getIndexedIvars(self);

  CFDateComponentsSetValue(v4, 0x8000, nanosecond);
}

- (void)setValue:(NSInteger)value forComponent:(NSCalendarUnit)unit
{
  v6 = *(void **)object_getIndexedIvars(self);

  CFDateComponentsSetValue(v6, unit, value);
}

- (NSInteger)valueForComponent:(NSCalendarUnit)unit
{
  uint64_t v4 = *(void *)object_getIndexedIvars(self);

  return CFDateComponentsGetValue(v4, unit);
}

- (void)setWeekOfMonth:(NSInteger)weekOfMonth
{
  uint64_t v4 = *(void **)object_getIndexedIvars(self);

  CFDateComponentsSetValue(v4, 4096, weekOfMonth);
}

- (void)setWeekday:(NSInteger)weekday
{
  uint64_t v4 = *(void **)object_getIndexedIvars(self);

  CFDateComponentsSetValue(v4, 512, weekday);
}

- (void)setWeekOfYear:(NSInteger)weekOfYear
{
  uint64_t v4 = *(void **)object_getIndexedIvars(self);

  CFDateComponentsSetValue(v4, 0x2000, weekOfYear);
}

- (void)setWeekdayOrdinal:(NSInteger)weekdayOrdinal
{
  uint64_t v4 = *(void **)object_getIndexedIvars(self);

  CFDateComponentsSetValue(v4, 1024, weekdayOrdinal);
}

- (void)setYearForWeekOfYear:(NSInteger)yearForWeekOfYear
{
  uint64_t v4 = *(void **)object_getIndexedIvars(self);

  CFDateComponentsSetValue(v4, 0x4000, yearForWeekOfYear);
}

- (void)setQuarter:(NSInteger)quarter
{
  uint64_t v4 = *(void **)object_getIndexedIvars(self);

  CFDateComponentsSetValue(v4, 2048, quarter);
}

- (void)setDayOfYear:(int64_t)a3
{
  uint64_t v4 = *(void **)object_getIndexedIvars(self);

  CFDateComponentsSetValue(v4, 0x10000, a3);
}

- (void)setTimeZone:(NSTimeZone *)timeZone
{
  uint64_t v4 = *(void *)object_getIndexedIvars(self);

  CFDateComponentsSetTimeZone(v4, timeZone);
}

- (void)setWeek:(NSInteger)v
{
  uint64_t v4 = *(void **)object_getIndexedIvars(self);

  CFDateComponentsSetValue(v4, 256, v);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if (!a3 || (objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v5 = *(const void **)object_getIndexedIvars(self);
  IndexedIvars = (CFTypeRef *)object_getIndexedIvars(a3);
  return CFEqual(v5, *IndexedIvars) != 0;
}

- (NSDateComponents)initWithCoder:(id)a3
{
  return 0;
}

- (BOOL)isValidDate
{
  IndexedIvars = (void **)object_getIndexedIvars(self);
  return CFDateComponentsIsValidDate(*IndexedIvars);
}

- (id)description
{
  uint64_t v9 = *(void *)off_1ECE0A5B0;
  IndexedIvars = (void **)object_getIndexedIvars(self);
  uint64_t v4 = _CFDateComponentsCopyDescriptionInner(*IndexedIvars);
  v8.receiver = self;
  v8.super_class = (Class)NSDateComponents;
  id v5 = [&v8 description];
  v6 = (__CFString *)CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%@ %@", v5, v4);
  CFRelease(v4);
  return v6;
}

@end