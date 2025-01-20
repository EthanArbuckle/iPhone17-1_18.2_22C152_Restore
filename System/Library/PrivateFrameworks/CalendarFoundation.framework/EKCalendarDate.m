@interface EKCalendarDate
+ (id)calendarDateWithAbsoluteTime:(double)a3 timeZone:(id)a4;
+ (id)calendarDateWithDate:(id)a3 timeZone:(id)a4;
+ (id)calendarDateWithDateComponents:(id)a3 timeZone:(id)a4;
+ (id)calendarDateWithYear:(int64_t)a3 month:(int64_t)a4 day:(int64_t)a5 timeZone:(id)a6;
+ (void)initialize;
- ($0E169193D3AAAEB5DA6AAED42404BC6F)differenceAsGregorianUnits:(SEL)a3 flags:(id)a4;
- (BOOL)isEqual:(id)a3;
- (EKCalendarDate)calendarDateWithDate:(id)a3;
- (EKCalendarDate)initWithAbsoluteTime:(double)a3 timeZone:(id)a4;
- (EKCalendarDate)initWithDate:(id)a3 calendar:(id)a4;
- (EKCalendarDate)initWithDate:(id)a3 components:(id)a4 calendar:(id)a5;
- (EKCalendarDate)initWithDate:(id)a3 components:(id)a4 timeZone:(id)a5;
- (EKCalendarDate)initWithDate:(id)a3 timeZone:(id)a4;
- (EKCalendarDate)initWithDateComponents:(id)a3 calendar:(id)a4;
- (EKCalendarDate)initWithDateComponents:(id)a3 timeZone:(id)a4;
- (double)absoluteTime;
- (double)differenceInSeconds:(id)a3;
- (id)allComponents;
- (id)calendar;
- (id)calendarDateByAddingComponents:(id)a3;
- (id)calendarDateByAddingDays:(int64_t)a3;
- (id)calendarDateByAddingGregorianUnits:(id *)a3;
- (id)calendarDateByAddingHours:(int64_t)a3;
- (id)calendarDateByAddingMinutes:(int64_t)a3;
- (id)calendarDateByAddingMonths:(int64_t)a3;
- (id)calendarDateByAddingSeconds:(int64_t)a3;
- (id)calendarDateByAddingWeeks:(int64_t)a3;
- (id)calendarDateByAddingYears:(int64_t)a3;
- (id)calendarDateByComponentwiseAddingComponents:(id)a3;
- (id)calendarDateByComponentwiseAddingSeconds:(int64_t)a3;
- (id)calendarDateForDay;
- (id)calendarDateForEndOfDay;
- (id)calendarDateForEndOfMonth;
- (id)calendarDateForEndOfWeekWithWeekStart:(int64_t)a3;
- (id)calendarDateForEndOfYear;
- (id)calendarDateForMonth;
- (id)calendarDateForWeekWithWeekStart:(int64_t)a3;
- (id)calendarDateForWeekWithWeekStart:(int64_t)a3 daysSinceWeekStart:(int64_t *)a4;
- (id)calendarDateForYear;
- (id)calendarDateInTimeZone:(id)a3;
- (id)date;
- (id)dayComponents;
- (id)dayTimeComponents;
- (id)description;
- (id)differenceAsDateComponents:(id)a3 units:(unint64_t)a4;
- (id)earlierDate:(id)a3;
- (id)laterDate:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)timeComponents;
- (id)timeZone;
- (id)weekComponents;
- (int64_t)compare:(id)a3;
- (int64_t)day;
- (int64_t)dayOfWeek;
- (int64_t)differenceInDays:(id)a3;
- (int64_t)differenceInMonths:(id)a3;
- (int64_t)differenceInYears:(id)a3;
- (int64_t)era;
- (int64_t)hour;
- (int64_t)minute;
- (int64_t)month;
- (int64_t)second;
- (int64_t)secondsFromGMT;
- (int64_t)year;
- (unint64_t)dayOfYear;
- (unint64_t)daysInMonth;
- (unint64_t)daysInYear;
- (unint64_t)hash;
- (unint64_t)weekOfMonth;
- (unint64_t)weekOfYear;
- (unint64_t)weeksInMonth;
- (unint64_t)weeksInYear;
@end

@implementation EKCalendarDate

+ (void)initialize
{
  if (initialize_onceToken != -1) {
    dispatch_once(&initialize_onceToken, &__block_literal_global_22);
  }
}

uint64_t __28__EKCalendarDate_initialize__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  v1 = (void *)_dateComponentCache;
  _dateComponentCache = (uint64_t)v0;

  v2 = (void *)_dateComponentCache;

  return [v2 setCountLimit:1000];
}

+ (id)calendarDateWithDate:(id)a3 timeZone:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithDate:v7 components:0 timeZone:v6];

  return v8;
}

+ (id)calendarDateWithDateComponents:(id)a3 timeZone:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithDate:0 components:v7 timeZone:v6];

  return v8;
}

+ (id)calendarDateWithAbsoluteTime:(double)a3 timeZone:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc((Class)a1);
  v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:a3];
  v9 = (void *)[v7 initWithDate:v8 components:0 timeZone:v6];

  return v9;
}

+ (id)calendarDateWithYear:(int64_t)a3 month:(int64_t)a4 day:(int64_t)a5 timeZone:(id)a6
{
  id v10 = a6;
  v11 = objc_opt_new();
  [v11 setEra:1];
  [v11 setYear:a3];
  [v11 setMonth:a4];
  [v11 setDay:a5];
  v12 = (void *)[objc_alloc((Class)a1) initWithDate:0 components:v11 timeZone:v10];

  return v12;
}

- (EKCalendarDate)initWithDate:(id)a3 timeZone:(id)a4
{
  return [(EKCalendarDate *)self initWithDate:a3 components:0 timeZone:a4];
}

- (EKCalendarDate)initWithDate:(id)a3 calendar:(id)a4
{
  return [(EKCalendarDate *)self initWithDate:a3 components:0 calendar:a4];
}

- (EKCalendarDate)initWithAbsoluteTime:(double)a3 timeZone:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F1C9C8];
  id v7 = a4;
  v8 = (void *)[[v6 alloc] initWithTimeIntervalSinceReferenceDate:a3];
  v9 = [(EKCalendarDate *)self initWithDate:v8 components:0 timeZone:v7];

  return v9;
}

- (EKCalendarDate)initWithDateComponents:(id)a3 timeZone:(id)a4
{
  return [(EKCalendarDate *)self initWithDate:0 components:a3 timeZone:a4];
}

- (EKCalendarDate)initWithDateComponents:(id)a3 calendar:(id)a4
{
  return [(EKCalendarDate *)self initWithDate:0 components:a3 calendar:a4];
}

- (EKCalendarDate)initWithDate:(id)a3 components:(id)a4 timeZone:(id)a5
{
  v8 = (void *)MEMORY[0x1E4F1C9A8];
  id v9 = a4;
  id v10 = a3;
  v11 = [v8 CalGregorianCalendarForTimeZone:a5];
  v12 = [(EKCalendarDate *)self initWithDate:v10 components:v9 calendar:v11];

  return v12;
}

- (EKCalendarDate)initWithDate:(id)a3 components:(id)a4 calendar:(id)a5
{
  unint64_t v8 = (unint64_t)a3;
  unint64_t v9 = (unint64_t)a4;
  id v10 = a5;
  v11 = v10;
  v12 = 0;
  if (v8 | v9 && v10)
  {
    v22.receiver = self;
    v22.super_class = (Class)EKCalendarDate;
    v13 = [(EKCalendarDate *)&v22 init];
    if (!v13) {
      goto LABEL_22;
    }
    uint64_t v14 = [v11 copy];
    calendar = v13->_calendar;
    v13->_calendar = (NSCalendar *)v14;

    if (v8)
    {
      v16 = (NSDate *)(id)v8;
    }
    else
    {
      v16 = [(NSCalendar *)v13->_calendar dateFromComponents:v9];
    }
    date = v13->_date;
    v13->_date = v16;

    if (!v9
      || [(id)v9 era] == 0x7FFFFFFFFFFFFFFFLL
      || [(id)v9 year] == 0x7FFFFFFFFFFFFFFFLL
      || [(id)v9 month] == 0x7FFFFFFFFFFFFFFFLL
      || [(id)v9 day] == 0x7FFFFFFFFFFFFFFFLL
      || [(id)v9 hour] == 0x7FFFFFFFFFFFFFFFLL
      || [(id)v9 minute] == 0x7FFFFFFFFFFFFFFFLL
      || [(id)v9 second] == 0x7FFFFFFFFFFFFFFFLL
      || [(id)v9 nanosecond] == 0x7FFFFFFFFFFFFFFFLL)
    {
      goto LABEL_22;
    }
    components = [(id)v9 timeZone];
    if (components
      && [(id)v9 weekday] != 0x7FFFFFFFFFFFFFFFLL
      && [(id)v9 weekOfMonth] != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v19 = [(id)v9 weekOfYear];

      if (v19 == 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_22:
        self = v13;
        v12 = self;
        goto LABEL_23;
      }
      uint64_t v20 = [(id)v9 copy];
      components = v13->_components;
      v13->_components = (NSDateComponents *)v20;
    }

    goto LABEL_22;
  }
LABEL_23:

  return v12;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [EKMutableCalendarDate alloc];
  date = self->_date;
  components = self->_components;
  calendar = self->_calendar;

  return [(EKCalendarDate *)v4 initWithDate:date components:components calendar:calendar];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v4 absoluteTime];
    double v6 = v5;
    [(EKCalendarDate *)self absoluteTime];
    BOOL v8 = vabdd_f64(v6, v7) < 2.22044605e-16;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(EKCalendarDate *)self date];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  if (description_onceToken != -1) {
    dispatch_once(&description_onceToken, &__block_literal_global_7_1);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&description_lock);
  unint64_t v3 = [(id)description_formatter timeZone];
  id v4 = [(EKCalendarDate *)self timeZone];
  char v5 = [v3 isEqualToTimeZone:v4];

  if ((v5 & 1) == 0)
  {
    double v6 = (void *)description_formatter;
    double v7 = [(EKCalendarDate *)self timeZone];
    [v6 setTimeZone:v7];
  }
  BOOL v8 = (void *)description_formatter;
  unint64_t v9 = [(EKCalendarDate *)self date];
  id v10 = [v8 stringFromDate:v9];

  os_unfair_lock_unlock((os_unfair_lock_t)&description_lock);
  v11 = [NSString stringWithFormat:@"%@ <%p> { date = %@ }", objc_opt_class(), self, v10];

  return v11;
}

uint64_t __29__EKCalendarDate_description__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)description_formatter;
  description_formatter = (uint64_t)v0;

  [(id)description_formatter setDateStyle:4];
  v2 = (void *)description_formatter;

  return [v2 setTimeStyle:3];
}

- (id)date
{
  return self->_date;
}

- (double)absoluteTime
{
  v2 = [(EKCalendarDate *)self date];
  [v2 timeIntervalSinceReferenceDate];
  double v4 = v3;

  return v4;
}

- (id)allComponents
{
  if (!self->_components)
  {
    char v5 = [(EKCalendarDate *)self date];

    if (v5)
    {
      dateCacheKey = self->_dateCacheKey;
      if (!dateCacheKey)
      {
        double v7 = NSString;
        BOOL v8 = [(EKCalendarDate *)self date];
        [v8 timeIntervalSinceReferenceDate];
        uint64_t v10 = v9;
        v11 = [(EKCalendarDate *)self calendar];
        v12 = [v11 timeZone];
        v13 = [v7 stringWithFormat:@"%f-%@", v10, v12];
        uint64_t v14 = self->_dateCacheKey;
        self->_dateCacheKey = v13;

        dateCacheKey = self->_dateCacheKey;
      }
      v15 = [(id)_dateComponentCache objectForKey:dateCacheKey];
      components = self->_components;
      self->_components = v15;

      if (!self->_components)
      {
        calendar = self->_calendar;
        v18 = [(EKCalendarDate *)self date];
        uint64_t v19 = [(NSCalendar *)calendar components:2142974 fromDate:v18];
        uint64_t v20 = self->_components;
        self->_components = v19;

        [(id)_dateComponentCache setObject:self->_components forKey:self->_dateCacheKey];
      }
    }
  }
  double v3 = (void *)[(NSDateComponents *)self->_components copy];

  return v3;
}

- (id)dayTimeComponents
{
  v2 = [(EKCalendarDate *)self allComponents];
  double v3 = objc_opt_new();
  objc_msgSend(v3, "setEra:", objc_msgSend(v2, "era"));
  objc_msgSend(v3, "setYear:", objc_msgSend(v2, "year"));
  objc_msgSend(v3, "setMonth:", objc_msgSend(v2, "month"));
  objc_msgSend(v3, "setDay:", objc_msgSend(v2, "day"));
  objc_msgSend(v3, "setHour:", objc_msgSend(v2, "hour"));
  objc_msgSend(v3, "setMinute:", objc_msgSend(v2, "minute"));
  objc_msgSend(v3, "setSecond:", objc_msgSend(v2, "second"));
  objc_msgSend(v3, "setNanosecond:", objc_msgSend(v2, "nanosecond"));

  return v3;
}

- (id)dayComponents
{
  v2 = [(EKCalendarDate *)self allComponents];
  double v3 = objc_opt_new();
  objc_msgSend(v3, "setEra:", objc_msgSend(v2, "era"));
  objc_msgSend(v3, "setYear:", objc_msgSend(v2, "year"));
  objc_msgSend(v3, "setMonth:", objc_msgSend(v2, "month"));
  objc_msgSend(v3, "setDay:", objc_msgSend(v2, "day"));

  return v3;
}

- (id)timeComponents
{
  v2 = [(EKCalendarDate *)self allComponents];
  double v3 = objc_opt_new();
  objc_msgSend(v3, "setHour:", objc_msgSend(v2, "hour"));
  objc_msgSend(v3, "setMinute:", objc_msgSend(v2, "minute"));
  objc_msgSend(v3, "setSecond:", objc_msgSend(v2, "second"));
  objc_msgSend(v3, "setNanosecond:", objc_msgSend(v2, "nanosecond"));

  return v3;
}

- (id)weekComponents
{
  v2 = [(EKCalendarDate *)self allComponents];
  double v3 = objc_opt_new();
  objc_msgSend(v3, "setEra:", objc_msgSend(v2, "era"));
  objc_msgSend(v3, "setYear:", objc_msgSend(v2, "year"));
  objc_msgSend(v3, "setWeekOfYear:", objc_msgSend(v2, "weekOfYear"));

  return v3;
}

- (id)calendar
{
  v2 = (void *)[(NSCalendar *)self->_calendar copy];

  return v2;
}

- (id)timeZone
{
  v2 = [(NSCalendar *)self->_calendar timeZone];
  double v3 = (void *)[v2 copy];

  return v3;
}

- (int64_t)secondsFromGMT
{
  double v3 = [(EKCalendarDate *)self timeZone];
  double v4 = [(EKCalendarDate *)self date];
  int64_t v5 = [v3 secondsFromGMTForDate:v4];

  return v5;
}

- (id)calendarDateByAddingComponents:(id)a3
{
  calendar = self->_calendar;
  id v5 = a3;
  double v6 = [(EKCalendarDate *)self date];
  double v7 = [(NSCalendar *)calendar dateByAddingComponents:v5 toDate:v6 options:0];

  BOOL v8 = [[EKCalendarDate alloc] initWithDate:v7 calendar:self->_calendar];

  return v8;
}

- (id)calendarDateByAddingSeconds:(int64_t)a3
{
  id v5 = [EKCalendarDate alloc];
  double v6 = [(EKCalendarDate *)self date];
  double v7 = [v6 dateByAddingTimeInterval:(double)a3];
  BOOL v8 = [(EKCalendarDate *)v5 initWithDate:v7 calendar:self->_calendar];

  return v8;
}

- (id)calendarDateByAddingMinutes:(int64_t)a3
{
  id v5 = [EKCalendarDate alloc];
  double v6 = [(EKCalendarDate *)self date];
  double v7 = [v6 dateByAddingMinutes:a3 inCalendar:self->_calendar];
  BOOL v8 = [(EKCalendarDate *)v5 initWithDate:v7 calendar:self->_calendar];

  return v8;
}

- (id)calendarDateByAddingHours:(int64_t)a3
{
  id v5 = [EKCalendarDate alloc];
  double v6 = [(EKCalendarDate *)self date];
  double v7 = [v6 dateByAddingHours:a3 inCalendar:self->_calendar];
  BOOL v8 = [(EKCalendarDate *)v5 initWithDate:v7 calendar:self->_calendar];

  return v8;
}

- (id)calendarDateByAddingDays:(int64_t)a3
{
  id v5 = [EKCalendarDate alloc];
  double v6 = [(EKCalendarDate *)self date];
  double v7 = [v6 dateByAddingDays:a3 inCalendar:self->_calendar];
  BOOL v8 = [(EKCalendarDate *)v5 initWithDate:v7 calendar:self->_calendar];

  return v8;
}

- (id)calendarDateByAddingWeeks:(int64_t)a3
{
  id v5 = [EKCalendarDate alloc];
  double v6 = [(EKCalendarDate *)self date];
  double v7 = [v6 dateByAddingWeeks:a3 inCalendar:self->_calendar];
  BOOL v8 = [(EKCalendarDate *)v5 initWithDate:v7 calendar:self->_calendar];

  return v8;
}

- (id)calendarDateByAddingMonths:(int64_t)a3
{
  id v5 = [EKCalendarDate alloc];
  double v6 = [(EKCalendarDate *)self date];
  double v7 = [v6 dateByAddingMonths:a3 inCalendar:self->_calendar];
  BOOL v8 = [(EKCalendarDate *)v5 initWithDate:v7 calendar:self->_calendar];

  return v8;
}

- (id)calendarDateByAddingYears:(int64_t)a3
{
  id v5 = [EKCalendarDate alloc];
  double v6 = [(EKCalendarDate *)self date];
  double v7 = [v6 dateByAddingYears:a3 inCalendar:self->_calendar];
  BOOL v8 = [(EKCalendarDate *)v5 initWithDate:v7 calendar:self->_calendar];

  return v8;
}

- (id)calendarDateByComponentwiseAddingComponents:(id)a3
{
  id v4 = a3;
  id v5 = [EKCalendarDate alloc];
  double v6 = [(EKCalendarDate *)self date];
  double v7 = [v6 CalDateByComponentwiseAddingComponents:v4 inCalendar:self->_calendar];

  BOOL v8 = [(EKCalendarDate *)v5 initWithDate:v7 calendar:self->_calendar];

  return v8;
}

- (id)calendarDateByComponentwiseAddingSeconds:(int64_t)a3
{
  id v5 = [EKCalendarDate alloc];
  double v6 = [(EKCalendarDate *)self date];
  double v7 = [v6 CalDateByComponentwiseAddingSeconds:a3 inCalendar:self->_calendar];
  BOOL v8 = [(EKCalendarDate *)v5 initWithDate:v7 calendar:self->_calendar];

  return v8;
}

- (id)calendarDateInTimeZone:(id)a3
{
  id v4 = a3;
  id v5 = [EKCalendarDate alloc];
  double v6 = [(EKCalendarDate *)self dayTimeComponents];
  double v7 = [(EKCalendarDate *)v5 initWithDateComponents:v6 timeZone:v4];

  return v7;
}

- (EKCalendarDate)calendarDateWithDate:(id)a3
{
  id v4 = a3;
  id v5 = [[EKCalendarDate alloc] initWithDate:v4 calendar:self->_calendar];

  return v5;
}

- (id)differenceAsDateComponents:(id)a3 units:(unint64_t)a4
{
  calendar = self->_calendar;
  double v7 = [a3 date];
  BOOL v8 = [(EKCalendarDate *)self date];
  uint64_t v9 = [(NSCalendar *)calendar components:a4 fromDate:v7 toDate:v8 options:0];

  return v9;
}

- (int64_t)differenceInYears:(id)a3
{
  double v3 = [(EKCalendarDate *)self differenceAsDateComponents:a3 units:4];
  int64_t v4 = [v3 year];

  return v4;
}

- (int64_t)differenceInMonths:(id)a3
{
  double v3 = [(EKCalendarDate *)self differenceAsDateComponents:a3 units:8];
  int64_t v4 = [v3 month];

  return v4;
}

- (int64_t)differenceInDays:(id)a3
{
  double v3 = [(EKCalendarDate *)self differenceAsDateComponents:a3 units:16];
  int64_t v4 = [v3 day];

  return v4;
}

- (double)differenceInSeconds:(id)a3
{
  double v3 = [(EKCalendarDate *)self differenceAsDateComponents:a3 units:128];
  double v4 = (double)[v3 second];

  return v4;
}

- (int64_t)era
{
  v2 = [(EKCalendarDate *)self allComponents];
  int64_t v3 = [v2 era];

  return v3;
}

- (int64_t)year
{
  v2 = [(EKCalendarDate *)self allComponents];
  int64_t v3 = [v2 year];

  return v3;
}

- (int64_t)month
{
  v2 = [(EKCalendarDate *)self allComponents];
  int64_t v3 = [v2 month];

  return v3;
}

- (int64_t)day
{
  v2 = [(EKCalendarDate *)self allComponents];
  int64_t v3 = [v2 day];

  return v3;
}

- (int64_t)hour
{
  v2 = [(EKCalendarDate *)self allComponents];
  int64_t v3 = [v2 hour];

  return v3;
}

- (int64_t)minute
{
  v2 = [(EKCalendarDate *)self allComponents];
  int64_t v3 = [v2 minute];

  return v3;
}

- (int64_t)second
{
  v2 = [(EKCalendarDate *)self allComponents];
  int64_t v3 = [v2 second];

  return v3;
}

- (int64_t)dayOfWeek
{
  v2 = [(EKCalendarDate *)self allComponents];
  int64_t v3 = [v2 weekday];

  return v3;
}

- (unint64_t)dayOfYear
{
  calendar = self->_calendar;
  int64_t v3 = [(EKCalendarDate *)self date];
  unint64_t v4 = [(NSCalendar *)calendar ordinalityOfUnit:16 inUnit:4 forDate:v3];

  return v4;
}

- (unint64_t)weekOfMonth
{
  v2 = [(EKCalendarDate *)self allComponents];
  unint64_t v3 = [v2 weekOfMonth];

  return v3;
}

- (unint64_t)weekOfYear
{
  v2 = [(EKCalendarDate *)self allComponents];
  unint64_t v3 = [v2 weekOfYear];

  return v3;
}

- (unint64_t)daysInMonth
{
  calendar = self->_calendar;
  unint64_t v3 = [(EKCalendarDate *)self date];
  unint64_t v4 = [(NSCalendar *)calendar daysInMonthContainingDate:v3];

  return v4;
}

- (unint64_t)daysInYear
{
  calendar = self->_calendar;
  unint64_t v3 = [(EKCalendarDate *)self date];
  unint64_t v4 = [(NSCalendar *)calendar CalDaysInYearContainingDate:v3];

  return v4;
}

- (unint64_t)weeksInMonth
{
  calendar = self->_calendar;
  unint64_t v3 = [(EKCalendarDate *)self date];
  unint64_t v4 = [(NSCalendar *)calendar CalWeeksInMonthContainingDate:v3];

  return v4;
}

- (unint64_t)weeksInYear
{
  calendar = self->_calendar;
  unint64_t v3 = [(EKCalendarDate *)self date];
  unint64_t v4 = [(NSCalendar *)calendar CalWeeksInYearContainingDate:v3];

  return v4;
}

- (id)calendarDateForDay
{
  calendar = self->_calendar;
  unint64_t v4 = [(EKCalendarDate *)self date];
  id v5 = [(NSCalendar *)calendar startOfDayForDate:v4];
  double v6 = [(EKCalendarDate *)self calendarDateWithDate:v5];

  return v6;
}

- (id)calendarDateForEndOfDay
{
  unint64_t v3 = [(EKCalendarDate *)self dayTimeComponents];
  [v3 setHour:23];
  [v3 setMinute:59];
  [v3 setSecond:59];
  unint64_t v4 = [[EKCalendarDate alloc] initWithDateComponents:v3 calendar:self->_calendar];

  return v4;
}

- (id)calendarDateForWeekWithWeekStart:(int64_t)a3
{
  return [(EKCalendarDate *)self calendarDateForWeekWithWeekStart:a3 daysSinceWeekStart:0];
}

- (id)calendarDateForWeekWithWeekStart:(int64_t)a3 daysSinceWeekStart:(int64_t *)a4
{
  int64_t v7 = [(EKCalendarDate *)self dayOfWeek];
  uint64_t v8 = 7;
  if (v7 >= a3) {
    uint64_t v8 = 0;
  }
  int64_t v9 = v7 - a3 + v8;
  if (a4) {
    *a4 = v9;
  }
  uint64_t v10 = [(EKCalendarDate *)self calendarDateByAddingDays:-v9];
  v11 = [v10 calendarDateForDay];

  return v11;
}

- (id)calendarDateForEndOfWeekWithWeekStart:(int64_t)a3
{
  unint64_t v3 = [(EKCalendarDate *)self calendarDateForWeekWithWeekStart:a3 daysSinceWeekStart:0];
  unint64_t v4 = [v3 calendarDateByAddingWeeks:1];
  id v5 = [v4 calendarDateByAddingSeconds:-1];

  return v5;
}

- (id)calendarDateForMonth
{
  unint64_t v3 = [(EKCalendarDate *)self dayComponents];
  [v3 setDay:1];
  unint64_t v4 = [[EKCalendarDate alloc] initWithDateComponents:v3 calendar:self->_calendar];

  return v4;
}

- (id)calendarDateForEndOfMonth
{
  v2 = [(EKCalendarDate *)self calendarDateForMonth];
  unint64_t v3 = [v2 calendarDateByAddingMonths:1];
  unint64_t v4 = [v3 calendarDateByAddingSeconds:-1];

  return v4;
}

- (id)calendarDateForYear
{
  unint64_t v3 = [(EKCalendarDate *)self dayComponents];
  [v3 setMonth:1];
  [v3 setDay:1];
  unint64_t v4 = [[EKCalendarDate alloc] initWithDateComponents:v3 calendar:self->_calendar];

  return v4;
}

- (id)calendarDateForEndOfYear
{
  v2 = [(EKCalendarDate *)self calendarDateForYear];
  unint64_t v3 = [v2 calendarDateByAddingYears:1];
  unint64_t v4 = [v3 calendarDateByAddingSeconds:-1];

  return v4;
}

- (id)earlierDate:(id)a3
{
  unint64_t v4 = (EKCalendarDate *)a3;
  id v5 = [(EKCalendarDate *)self date];
  double v6 = [(EKCalendarDate *)v4 date];
  int v7 = [v5 CalIsBeforeOrSameAsDate:v6];

  if (v7) {
    uint64_t v8 = self;
  }
  else {
    uint64_t v8 = v4;
  }
  int64_t v9 = v8;

  return v9;
}

- (id)laterDate:(id)a3
{
  unint64_t v4 = (EKCalendarDate *)a3;
  id v5 = [(EKCalendarDate *)self date];
  double v6 = [(EKCalendarDate *)v4 date];
  int v7 = [v5 CalIsAfterOrSameAsDate:v6];

  if (v7) {
    uint64_t v8 = self;
  }
  else {
    uint64_t v8 = v4;
  }
  int64_t v9 = v8;

  return v9;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  if ([(EKCalendarDate *)self isEqual:v4])
  {
    int64_t v5 = 0;
  }
  else
  {
    double v6 = [(EKCalendarDate *)self date];
    int v7 = [v4 date];
    int64_t v5 = [v6 compare:v7];
  }
  return v5;
}

- (id)calendarDateByAddingGregorianUnits:(id *)a3
{
  int64_t v5 = objc_opt_new();
  [v5 setYear:a3->var0];
  [v5 setMonth:a3->var1];
  [v5 setDay:a3->var2];
  [v5 setHour:a3->var3];
  [v5 setMinute:a3->var4];
  [v5 setSecond:(uint64_t)a3->var5];
  double v6 = [(EKCalendarDate *)self calendarDateByComponentwiseAddingComponents:v5];

  return v6;
}

- ($0E169193D3AAAEB5DA6AAED42404BC6F)differenceAsGregorianUnits:(SEL)a3 flags:(id)a4
{
  char v5 = a5;
  id v8 = [(EKCalendarDate *)self differenceAsDateComponents:a4 units:4 * (a5 & 0x3F)];
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  if (v5)
  {
    retstr->var0 = [v8 year];
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_3;
  }
  retstr->var1 = [v8 month];
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  retstr->var2 = [v8 day];
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  retstr->var3 = [v8 hour];
  if ((v5 & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  retstr->var4 = [v8 minute];
  if ((v5 & 0x20) != 0) {
LABEL_7:
  }
    retstr->var5 = (double)(int)[v8 second];
LABEL_8:

  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateCacheKey, 0);
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_date, 0);

  objc_storeStrong((id *)&self->_calendar, 0);
}

@end