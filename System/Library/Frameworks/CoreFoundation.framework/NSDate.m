@interface NSDate
+ (BOOL)supportsSecureCoding;
+ (NSDate)allocWithZone:(_NSZone *)a3;
+ (NSDate)date;
+ (NSDate)dateWithDate:(id)a3;
+ (NSDate)dateWithTimeInterval:(NSTimeInterval)secsToBeAdded sinceDate:(NSDate *)date;
+ (NSDate)dateWithTimeIntervalSince1970:(NSTimeInterval)secs;
+ (NSDate)dateWithTimeIntervalSinceNow:(NSTimeInterval)secs;
+ (NSDate)dateWithTimeIntervalSinceReferenceDate:(NSTimeInterval)ti;
+ (NSDate)distantFuture;
+ (NSDate)distantPast;
+ (NSDate)now;
+ (NSTimeInterval)timeIntervalSinceReferenceDate;
+ (id)dateWithString:(NSString *)aString;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqual:(id)a3 toUnitGranularity:(unint64_t)a4;
- (BOOL)isEqualToDate:(NSDate *)otherDate;
- (BOOL)isInSameDayAsDate:(id)a3;
- (BOOL)isInToday;
- (BOOL)isInTomorrow;
- (BOOL)isInYesterday;
- (BOOL)isNSDate__;
- (NSComparisonResult)compare:(NSDate *)other;
- (NSDate)dateByAddingTimeInterval:(NSTimeInterval)ti;
- (NSDate)earlierDate:(NSDate *)anotherDate;
- (NSDate)initWithCoder:(NSCoder *)coder;
- (NSDate)initWithDate:(id)a3;
- (NSDate)initWithTimeInterval:(NSTimeInterval)secsToBeAdded sinceDate:(NSDate *)date;
- (NSDate)initWithTimeIntervalSince1970:(NSTimeInterval)secs;
- (NSDate)initWithTimeIntervalSinceNow:(NSTimeInterval)secs;
- (NSDate)initWithTimeIntervalSinceReferenceDate:(NSTimeInterval)ti;
- (NSDate)laterDate:(NSDate *)anotherDate;
- (NSString)description;
- (NSString)descriptionWithLocale:(id)locale;
- (NSTimeInterval)timeIntervalSince1970;
- (NSTimeInterval)timeIntervalSinceDate:(NSDate *)anotherDate;
- (NSTimeInterval)timeIntervalSinceNow;
- (NSTimeInterval)timeIntervalSinceReferenceDate;
- (id)initWithString:(NSString *)description;
- (int64_t)compare:(id)a3 toUnitGranularity:(unint64_t)a4;
- (unint64_t)_cfTypeID;
- (unint64_t)hash;
@end

@implementation NSDate

+ (NSDate)distantFuture
{
  return (NSDate *)&_NSConstantDateDistantFuture;
}

- (unint64_t)hash
{
  [(NSDate *)self timeIntervalSinceReferenceDate];
  double v3 = -v2;
  if (v2 >= 0.0) {
    double v3 = v2;
  }
  long double v4 = floor(v3 + 0.5);
  double v5 = (v3 - v4) * 1.84467441e19;
  unint64_t result = 2654435761u * (unint64_t)fmod(v4, 1.84467441e19);
  if (v5 >= 0.0)
  {
    if (v5 > 0.0) {
      result += (unint64_t)v5;
    }
  }
  else
  {
    result -= (unint64_t)fabs(v5);
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v5) = 1;
  }
  else if (a3)
  {
    int v5 = _NSIsNSDate((uint64_t)a3);
    if (v5)
    {
      LOBYTE(v5) = [(NSDate *)self isEqualToDate:a3];
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

+ (NSDate)distantPast
{
  return (NSDate *)&_NSConstantDateDistantPast;
}

- (NSDate)initWithTimeInterval:(NSTimeInterval)secsToBeAdded sinceDate:(NSDate *)date
{
  if (date) {
    [(NSDate *)date timeIntervalSinceReferenceDate];
  }
  else {
    double v6 = NAN;
  }
  double v7 = v6 + secsToBeAdded;

  return [(NSDate *)self initWithTimeIntervalSinceReferenceDate:v7];
}

- (NSDate)initWithTimeIntervalSinceNow:(NSTimeInterval)secs
{
  uint64_t v7 = *(void *)off_1ECE0A5B0;
  __tp.tv_sec = 0;
  __tp.tv_nsec = 0;
  clock_gettime(_CLOCK_REALTIME, &__tp);
  return [(NSDate *)self initWithTimeIntervalSinceReferenceDate:(double)__tp.tv_sec + -978307200.0 + (double)__tp.tv_nsec * 0.000000001 + secs];
}

+ (NSDate)dateWithTimeInterval:(NSTimeInterval)secsToBeAdded sinceDate:(NSDate *)date
{
  if (date)
  {
    [(NSDate *)date timeIntervalSinceReferenceDate];
    double v7 = v6;
  }
  else
  {
    double v7 = NAN;
  }
  v8 = (void *)[objc_alloc((Class)a1) initWithTimeIntervalSinceReferenceDate:v7 + secsToBeAdded];

  return (NSDate *)v8;
}

- (NSDate)earlierDate:(NSDate *)anotherDate
{
  [(NSDate *)self timeIntervalSinceReferenceDate];
  double v6 = v5;
  if (anotherDate) {
    [(NSDate *)anotherDate timeIntervalSinceReferenceDate];
  }
  else {
    double v7 = NAN;
  }
  if (v6 <= v7) {
    return self;
  }
  else {
    return anotherDate;
  }
}

+ (NSDate)dateWithTimeIntervalSinceNow:(NSTimeInterval)secs
{
  uint64_t v7 = *(void *)off_1ECE0A5B0;
  id v4 = objc_alloc((Class)a1);
  __tp.tv_sec = 0;
  __tp.tv_nsec = 0;
  clock_gettime(_CLOCK_REALTIME, &__tp);
  return (NSDate *)(id)[v4 initWithTimeIntervalSinceReferenceDate:(double)__tp.tv_sec + -978307200.0 + (double)__tp.tv_nsec * 0.000000001 + secs];
}

- (NSTimeInterval)timeIntervalSinceNow
{
  uint64_t v6 = *(void *)off_1ECE0A5B0;
  [(NSDate *)self timeIntervalSinceReferenceDate];
  double v3 = v2;
  __tp.tv_sec = 0;
  __tp.tv_nsec = 0;
  clock_gettime(_CLOCK_REALTIME, &__tp);
  return v3 - ((double)__tp.tv_sec + -978307200.0 + (double)__tp.tv_nsec * 0.000000001);
}

+ (NSDate)now
{
  uint64_t v5 = *(void *)off_1ECE0A5B0;
  double v2 = [NSDate alloc];
  __tp.tv_sec = 0;
  __tp.tv_nsec = 0;
  clock_gettime(_CLOCK_REALTIME, &__tp);
  return [(NSDate *)v2 initWithTimeIntervalSinceReferenceDate:(double)__tp.tv_sec + -978307200.0 + (double)__tp.tv_nsec * 0.000000001];
}

- (NSTimeInterval)timeIntervalSince1970
{
  [(NSDate *)self timeIntervalSinceReferenceDate];
  return v2 + 978307200.0;
}

- (NSDate)dateByAddingTimeInterval:(NSTimeInterval)ti
{
  [(NSDate *)self timeIntervalSinceReferenceDate];
  double v5 = v4;
  uint64_t v6 = objc_opt_class();

  return (NSDate *)[v6 dateWithTimeIntervalSinceReferenceDate:v5 + ti];
}

- (NSDate)laterDate:(NSDate *)anotherDate
{
  [(NSDate *)self timeIntervalSinceReferenceDate];
  double v6 = v5;
  if (anotherDate) {
    [(NSDate *)anotherDate timeIntervalSinceReferenceDate];
  }
  else {
    double v7 = NAN;
  }
  if (v6 >= v7) {
    return self;
  }
  else {
    return anotherDate;
  }
}

+ (NSDate)dateWithTimeIntervalSince1970:(NSTimeInterval)secs
{
  double v3 = (void *)[objc_alloc((Class)a1) initWithTimeIntervalSinceReferenceDate:secs + -978307200.0];

  return (NSDate *)v3;
}

+ (NSDate)date
{
  uint64_t v5 = *(void *)off_1ECE0A5B0;
  id v2 = objc_alloc((Class)a1);
  __tp.tv_sec = 0;
  __tp.tv_nsec = 0;
  clock_gettime(_CLOCK_REALTIME, &__tp);
  return (NSDate *)(id)[v2 initWithTimeIntervalSinceReferenceDate:(double)__tp.tv_sec + -978307200.0 + (double)__tp.tv_nsec * 0.000000001];
}

+ (NSDate)allocWithZone:(_NSZone *)a3
{
  uint64_t v5 = *(void *)off_1ECE0A5B0;
  if (NSDate == a1) {
    return (NSDate *)&___immutablePlaceholderDate;
  }
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSDate;
  return (NSDate *)objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
}

+ (NSDate)dateWithTimeIntervalSinceReferenceDate:(NSTimeInterval)ti
{
  double v3 = (void *)[objc_alloc((Class)a1) initWithTimeIntervalSinceReferenceDate:ti];

  return (NSDate *)v3;
}

- (NSComparisonResult)compare:(NSDate *)other
{
  if (self == other) {
    return 0;
  }
  [(NSDate *)self timeIntervalSinceReferenceDate];
  double v5 = v4;
  if (other) {
    [(NSDate *)other timeIntervalSinceReferenceDate];
  }
  else {
    double v6 = NAN;
  }
  if (v5 < v6) {
    return -1;
  }
  else {
    return (unint64_t)(v5 > v6);
  }
}

- (NSTimeInterval)timeIntervalSinceDate:(NSDate *)anotherDate
{
  [(NSDate *)self timeIntervalSinceReferenceDate];
  double v5 = v4;
  if (anotherDate) {
    [(NSDate *)anotherDate timeIntervalSinceReferenceDate];
  }
  else {
    double v6 = NAN;
  }
  return v5 - v6;
}

- (BOOL)isEqualToDate:(NSDate *)otherDate
{
  if (!otherDate) {
    return 0;
  }
  [(NSDate *)self timeIntervalSinceReferenceDate];
  double v5 = v4;
  [(NSDate *)otherDate timeIntervalSinceReferenceDate];
  return v5 == v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isNSDate__
{
  return 1;
}

- (NSString)description
{
  return [(NSDate *)self descriptionWithLocale:0];
}

- (NSString)descriptionWithLocale:(id)locale
{
  if (!locale)
  {
    CFLocaleRef v6 = CFLocaleCopyCurrent();
    os_unfair_lock_lock_with_options();
    BOOL v9 = (const __CFLocale *)descriptionWithLocale__cached_loc != v6 || descriptionWithLocale__cached_df == 0;
    char v10 = !v9;
    if (!v9)
    {
      v11 = (__CFDateFormatter *)CFRetain((CFTypeRef)descriptionWithLocale__cached_df);
      os_unfair_lock_unlock((os_unfair_lock_t)&descriptionWithLocale__lock);
      if (!v11)
      {
        v8 = 0;
        goto LABEL_44;
      }
      int v12 = 0;
      goto LABEL_25;
    }
    int v12 = ++descriptionWithLocale__changeCounter;
    os_unfair_lock_unlock((os_unfair_lock_t)&descriptionWithLocale__lock);
    CFTimeZoneRef v14 = CFTimeZoneCreateWithTimeIntervalFromGMT((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0.0);
    CFTimeZoneRef v15 = v14;
    if (v14) {
      BOOL v16 = v6 == 0;
    }
    else {
      BOOL v16 = 1;
    }
    if (v16)
    {
      if (!v14) {
        goto LABEL_28;
      }
    }
    else
    {
      v17 = CFDateFormatterCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, v6, kCFDateFormatterFullStyle, kCFDateFormatterFullStyle);
      if (v17)
      {
        v11 = v17;
        CFDateFormatterSetProperty(v17, @"kCFDateFormatterTimeZoneKey", v15);
        CFDateFormatterSetFormat(v11, @"uuuu-MM-dd HH:mm:ss '+0000'");
        CFRelease(v15);
LABEL_25:
        CFStringRef StringWithDate = CFDateFormatterCreateStringWithDate((CFAllocatorRef)&__kCFAllocatorSystemDefault, v11, (CFDateRef)self);
        v8 = (NSString *)_CFAutoreleasePoolAddObject(0, (uint64_t)StringWithDate);
        if (v10) {
          goto LABEL_43;
        }
        char v19 = 0;
LABEL_29:
        os_unfair_lock_lock_with_options();
        if (descriptionWithLocale__changeCounter == v12)
        {
          if (descriptionWithLocale__cached_loc) {
            CFRelease((CFTypeRef)descriptionWithLocale__cached_loc);
          }
          if (v6) {
            CFTypeRef v20 = CFRetain(v6);
          }
          else {
            CFTypeRef v20 = 0;
          }
          descriptionWithLocale__cached_loc = (uint64_t)v20;
          if (descriptionWithLocale__cached_df) {
            CFRelease((CFTypeRef)descriptionWithLocale__cached_df);
          }
          if (v19) {
            CFTypeRef v21 = 0;
          }
          else {
            CFTypeRef v21 = CFRetain(v11);
          }
          descriptionWithLocale__cached_df = (uint64_t)v21;
        }
        os_unfair_lock_unlock((os_unfair_lock_t)&descriptionWithLocale__lock);
        if (v19)
        {
LABEL_44:
          if (!v6) {
            goto LABEL_46;
          }
          goto LABEL_45;
        }
LABEL_43:
        CFRelease(v11);
        goto LABEL_44;
      }
    }
    CFRelease(v15);
LABEL_28:
    v8 = 0;
    v11 = 0;
    char v19 = 1;
    goto LABEL_29;
  }
  CFTypeID v5 = CFGetTypeID(locale);
  if (v5 != CFLocaleGetTypeID())
  {
    CFLocaleRef v13 = CFLocaleCopyCurrent();
    CFLocaleRef v6 = CFDateFormatterCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, v13, kCFDateFormatterFullStyle, kCFDateFormatterFullStyle);
    CFRelease(v13);
    if (v6) {
      goto LABEL_4;
    }
LABEL_15:
    v8 = 0;
    goto LABEL_46;
  }
  CFLocaleRef v6 = CFDateFormatterCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, (CFLocaleRef)locale, kCFDateFormatterFullStyle, kCFDateFormatterFullStyle);
  if (!v6) {
    goto LABEL_15;
  }
LABEL_4:
  CFStringRef v7 = CFDateFormatterCreateStringWithDate((CFAllocatorRef)&__kCFAllocatorSystemDefault, v6, (CFDateRef)self);
  v8 = (NSString *)_CFAutoreleasePoolAddObject(0, (uint64_t)v7);
LABEL_45:
  CFRelease(v6);
LABEL_46:
  if (v8) {
    return v8;
  }
  else {
    return (NSString *)@"<description unavailable>";
  }
}

+ (NSTimeInterval)timeIntervalSinceReferenceDate
{
  uint64_t v4 = *(void *)off_1ECE0A5B0;
  __tp.tv_sec = 0;
  __tp.tv_nsec = 0;
  clock_gettime(_CLOCK_REALTIME, &__tp);
  return (double)__tp.tv_sec + -978307200.0 + (double)__tp.tv_nsec * 0.000000001;
}

- (unint64_t)_cfTypeID
{
  return 42;
}

- (NSDate)initWithTimeIntervalSince1970:(NSTimeInterval)secs
{
  return [(NSDate *)self initWithTimeIntervalSinceReferenceDate:secs + -978307200.0];
}

+ (NSDate)dateWithDate:(id)a3
{
  if (a3)
  {
    [a3 timeIntervalSinceReferenceDate];
    double v5 = v4;
  }
  else
  {
    double v5 = NAN;
  }
  CFLocaleRef v6 = (void *)[objc_alloc((Class)a1) initWithTimeIntervalSinceReferenceDate:v5];

  return (NSDate *)v6;
}

- (NSDate)initWithDate:(id)a3
{
  if (a3) {
    [a3 timeIntervalSinceReferenceDate];
  }
  else {
    double v4 = NAN;
  }

  return [(NSDate *)self initWithTimeIntervalSinceReferenceDate:v4];
}

+ (id)dateWithString:(NSString *)aString
{
  double v3 = (void *)[objc_alloc((Class)a1) initWithString:aString];

  return v3;
}

- (id)initWithString:(NSString *)description
{
  double v5 = (NSDate *)objc_opt_new();
  CFLocaleRef v6 = [(NSString *)description UTF8String];
  if (!v6) {
    goto LABEL_60;
  }
  CFStringRef v7 = v6;
  int v8 = *(unsigned __int8 *)v6;
  if ((v8 - 48) > 9)
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = 0;
    do
    {
      int v10 = *(unsigned __int8 *)++v7;
      uint64_t v9 = (v8 - 48) + 10 * v9;
      int v8 = v10;
    }
    while ((v10 - 48) < 0xA);
  }
  [(NSDate *)v5 setYear:v9];
  if (!*v7) {
    goto LABEL_60;
  }
  int v12 = v7 + 1;
  int v11 = *((unsigned __int8 *)v7 + 1);
  if ((v11 - 48) > 9)
  {
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v13 = 0;
    do
    {
      uint64_t v13 = (v11 - 48) + 10 * v13;
      int v14 = *++v12;
      int v11 = v14;
    }
    while ((v14 - 48) < 0xA);
    CFStringRef v7 = v12 - 1;
  }
  [(NSDate *)v5 setMonth:v13];
  if (!*v12) {
    goto LABEL_60;
  }
  int v17 = *((unsigned __int8 *)v7 + 2);
  BOOL v16 = v7 + 2;
  int v15 = v17;
  if ((v17 - 48) > 9)
  {
    uint64_t v18 = 0;
  }
  else
  {
    uint64_t v18 = 0;
    do
    {
      int v19 = *++v16;
      uint64_t v18 = (v15 - 48) + 10 * v18;
      int v15 = v19;
    }
    while ((v19 - 48) < 0xA);
  }
  [(NSDate *)v5 setDay:v18];
  if (!*v16) {
    goto LABEL_60;
  }
  CFTypeRef v21 = v16 + 1;
  int v20 = v16[1];
  if ((v20 - 48) > 9)
  {
    uint64_t v22 = 0;
  }
  else
  {
    uint64_t v22 = 0;
    do
    {
      uint64_t v22 = (v20 - 48) + 10 * v22;
      int v23 = *++v21;
      int v20 = v23;
    }
    while ((v23 - 48) < 0xA);
    BOOL v16 = v21 - 1;
  }
  [(NSDate *)v5 setHour:v22];
  if (!*v21) {
    goto LABEL_60;
  }
  int v26 = v16[2];
  v25 = v16 + 2;
  int v24 = v26;
  if ((v26 - 48) > 9)
  {
    uint64_t v27 = 0;
  }
  else
  {
    uint64_t v27 = 0;
    do
    {
      int v28 = *++v25;
      uint64_t v27 = (v24 - 48) + 10 * v27;
      int v24 = v28;
    }
    while ((v28 - 48) < 0xA);
  }
  [(NSDate *)v5 setMinute:v27];
  if (!*v25) {
    goto LABEL_60;
  }
  v30 = v25 + 1;
  int v29 = v25[1];
  if ((v29 - 48) > 9)
  {
    uint64_t v31 = 0;
  }
  else
  {
    uint64_t v31 = 0;
    do
    {
      uint64_t v31 = (v29 - 48) + 10 * v31;
      int v32 = *++v30;
      int v29 = v32;
    }
    while ((v32 - 48) < 0xA);
    v25 = v30 - 1;
  }
  [(NSDate *)v5 setSecond:v31];
  if (!*v30
    || _CFAppVersionCheck(@"com.apple.ist.Radar", 0)
    && [(NSString *)description hasSuffix:@"GMT"])
  {
    goto LABEL_60;
  }
  if (!strncmp("GMT", v25 + 2, 3uLL))
  {
    unsigned int v33 = v25[5];
    if (v33 <= 0x2A)
    {
      uint64_t v36 = 0;
      if (v25[5] && v33 != 32) {
        goto LABEL_60;
      }
      goto LABEL_57;
    }
    uint64_t v34 = 5;
    if (v33 != 45 && v33 != 43) {
      goto LABEL_60;
    }
  }
  else
  {
    unsigned int v33 = v25[2];
    uint64_t v34 = 2;
  }
  if (v33 == 45)
  {
    uint64_t v35 = -60;
  }
  else
  {
    if ((char)v33 != 43)
    {
LABEL_60:

      v42 = 0;
      goto LABEL_61;
    }
    uint64_t v35 = 60;
  }
  int v37 = v25[v34 + 1];
  if ((v37 - 48) > 9)
  {
    uint64_t v38 = 0;
  }
  else
  {
    uint64_t v38 = 0;
    v39 = &v25[v34 + 2];
    do
    {
      uint64_t v38 = (v37 - 48) + 10 * v38;
      int v40 = *v39++;
      int v37 = v40;
    }
    while ((v40 - 48) < 0xA);
    if (v38 > 1600) {
      goto LABEL_60;
    }
  }
  uint64_t v36 = v35 * (v38 % 100 + 60 * (v38 / 100));
LABEL_57:
  v41 = [[NSCalendar alloc] initWithCalendarIdentifier:@"gregorian"];
  [(NSCalendar *)v41 setTimeZone:+[NSTimeZone timeZoneForSecondsFromGMT:v36]];
  [(NSDate *)[(NSCalendar *)v41 dateFromComponents:v5] timeIntervalSinceReferenceDate];
  v42 = -[NSDate initWithTimeIntervalSinceReferenceDate:](self, "initWithTimeIntervalSinceReferenceDate:");
  self = v5;
LABEL_61:

  return v42;
}

- (NSDate)initWithCoder:(NSCoder *)coder
{
  return 0;
}

- (BOOL)isInToday
{
  double v3 = +[NSCalendar currentCalendar];

  return [(NSCalendar *)v3 isDateInToday:self];
}

- (BOOL)isInTomorrow
{
  double v3 = +[NSCalendar currentCalendar];

  return [(NSCalendar *)v3 isDateInTomorrow:self];
}

- (BOOL)isInYesterday
{
  double v3 = +[NSCalendar currentCalendar];

  return [(NSCalendar *)v3 isDateInYesterday:self];
}

- (BOOL)isInSameDayAsDate:(id)a3
{
  double v5 = +[NSCalendar currentCalendar];

  return [(NSCalendar *)v5 isDate:self inSameDayAsDate:a3];
}

- (BOOL)isEqual:(id)a3 toUnitGranularity:(unint64_t)a4
{
  return [+[NSCalendar currentCalendar] compareDate:self toDate:a3 toUnitGranularity:a4] == NSOrderedSame;
}

- (int64_t)compare:(id)a3 toUnitGranularity:(unint64_t)a4
{
  if (self == a3) {
    return 0;
  }
  int v8 = +[NSCalendar currentCalendar];
  return [(NSCalendar *)v8 compareDate:self toDate:a3 toUnitGranularity:a4];
}

- (NSTimeInterval)timeIntervalSinceReferenceDate
{
  uint64_t v4 = __CFLookUpClass("NSDate");
  __CFRequireConcreteImplementation(v4, (objc_class *)self, a2);
}

- (NSDate)initWithTimeIntervalSinceReferenceDate:(NSTimeInterval)ti
{
  double v5 = __CFLookUpClass("NSDate");
  __CFRequireConcreteImplementation(v5, (objc_class *)self, a2);
}

@end