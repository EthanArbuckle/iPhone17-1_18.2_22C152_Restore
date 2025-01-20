@interface NSCalendarDate
+ (BOOL)supportsSecureCoding;
+ (NSCalendarDate)dateWithNaturalLanguageString:(id)a3 date:(id)a4 locale:(id)a5;
+ (NSCalendarDate)distantFuture;
+ (NSCalendarDate)distantPast;
+ (id)calendarDate;
+ (id)dateWithString:(NSString *)description calendarFormat:(NSString *)format;
+ (id)dateWithString:(NSString *)description calendarFormat:(NSString *)format locale:(id)locale;
+ (id)dateWithYear:(NSInteger)year month:(NSUInteger)month day:(NSUInteger)day hour:(NSUInteger)hour minute:(NSUInteger)minute second:(NSUInteger)second timeZone:(NSTimeZone *)aTimeZone;
- (Class)classForCoder;
- (NSCalendarDate)dateByAddingYears:(NSInteger)year months:(NSInteger)month days:(NSInteger)day hours:(NSInteger)hour minutes:(NSInteger)minute seconds:(NSInteger)second;
- (NSCalendarDate)init;
- (NSCalendarDate)initWithCoder:(id)a3;
- (NSCalendarDate)initWithTimeIntervalSinceReferenceDate:(double)a3;
- (NSInteger)dayOfCommonEra;
- (NSInteger)dayOfMonth;
- (NSInteger)dayOfWeek;
- (NSInteger)dayOfYear;
- (NSInteger)hourOfDay;
- (NSInteger)minuteOfHour;
- (NSInteger)monthOfYear;
- (NSInteger)secondOfMinute;
- (NSInteger)yearOfCommonEra;
- (NSString)calendarFormat;
- (NSString)descriptionWithCalendarFormat:(NSString *)format;
- (NSString)descriptionWithCalendarFormat:(NSString *)format locale:(id)locale;
- (NSString)descriptionWithLocale:(id)locale;
- (NSTimeZone)timeZone;
- (double)timeIntervalSinceReferenceDate;
- (id)addTimeInterval:(double)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initWithString:(NSString *)description;
- (id)initWithString:(NSString *)description calendarFormat:(NSString *)format;
- (id)initWithString:(NSString *)description calendarFormat:(NSString *)format locale:(id)locale;
- (id)initWithYear:(NSInteger)year month:(NSUInteger)month day:(NSUInteger)day hour:(NSUInteger)hour minute:(NSUInteger)minute second:(NSUInteger)second timeZone:(NSTimeZone *)aTimeZone;
- (id)replacementObjectForPortCoder:(id)a3;
- (int64_t)microsecondOfSecond;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)release;
- (void)setCalendarFormat:(NSString *)format;
- (void)setTimeZone:(NSTimeZone *)aTimeZone;
- (void)years:(NSInteger *)yp months:(NSInteger *)mop days:(NSInteger *)dp hours:(NSInteger *)hp minutes:(NSInteger *)mip seconds:(NSInteger *)sp sinceDate:(NSCalendarDate *)date;
@end

@implementation NSCalendarDate

- (NSInteger)secondOfMinute
{
  double timeIntervalSinceReferenceDate = self->_timeIntervalSinceReferenceDate;
  uint64_t v3 = [(NSTimeZone *)self->_timeZone secondsFromGMTForDate:self];
  double v4 = timeIntervalSinceReferenceDate + (double)v3 - floor((timeIntervalSinceReferenceDate + (double)v3) / 60.0) * 60.0;
  if ((uint64_t)v4 >= 0) {
    return (uint64_t)v4;
  }
  else {
    return (uint64_t)v4 + 60;
  }
}

- (double)timeIntervalSinceReferenceDate
{
  return self->_timeIntervalSinceReferenceDate;
}

- (NSCalendarDate)initWithTimeIntervalSinceReferenceDate:(double)a3
{
  self->_double timeIntervalSinceReferenceDate = a3;
  if (!self->_timeZone) {
    self->_timeZone = (NSTimeZone *)(id)[MEMORY[0x1E4F1CAF0] defaultTimeZone];
  }
  if (!self->_formatString) {
    self->_formatString = (NSString *)@"%Y-%m-%d %H:%M:%S %z";
  }
  return self;
}

- (NSCalendarDate)init
{
  double Current = CFAbsoluteTimeGetCurrent();

  return [(NSCalendarDate *)self initWithTimeIntervalSinceReferenceDate:Current];
}

- (void)release
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if ((release_do_check & 1) == 0)
  {
    if (_CFAppVersionCheckLessThan()
      || _CFAppVersionCheckLessThan()
      || _CFAppVersionCheckLessThan())
    {
      uint64_t v3 = self;
    }
    else
    {
      release_do_check = 1;
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)NSCalendarDate;
  [(NSCalendarDate *)&v4 release];
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSCalendarDate;
  [(NSCalendarDate *)&v3 dealloc];
}

- (id)initWithString:(NSString *)description
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)NSCalendarDate;
  return [(NSCalendarDate *)&v4 initWithString:description];
}

+ (NSCalendarDate)distantFuture
{
  id v2 = objc_allocWithZone((Class)a1);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9C8], "distantFuture"), "timeIntervalSinceReferenceDate");
  objc_super v3 = objc_msgSend(v2, "initWithTimeIntervalSinceReferenceDate:");

  return (NSCalendarDate *)v3;
}

+ (NSCalendarDate)distantPast
{
  id v2 = objc_allocWithZone((Class)a1);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9C8], "distantPast"), "timeIntervalSinceReferenceDate");
  objc_super v3 = objc_msgSend(v2, "initWithTimeIntervalSinceReferenceDate:");

  return (NSCalendarDate *)v3;
}

- (id)initWithYear:(NSInteger)year month:(NSUInteger)month day:(NSUInteger)day hour:(NSUInteger)hour minute:(NSUInteger)minute second:(NSUInteger)second timeZone:(NSTimeZone *)aTimeZone
{
  SInt8 v9 = minute;
  SInt8 v10 = hour;
  SInt8 v11 = day;
  SInt8 v12 = month;
  SInt32 v13 = year;
  v15 = aTimeZone;
  double v16 = (double)second;
  if (!aTimeZone) {
    v15 = (NSTimeZone *)[MEMORY[0x1E4F1CAF0] defaultTimeZone];
  }
  v18.hour = v10;
  v18.minute = v9;
  v18.day = v11;
  v18.month = v12;
  v18.year = v13;
  v18.second = v16;
  self->_double timeIntervalSinceReferenceDate = CFGregorianDateGetAbsoluteTime(v18, (CFTimeZoneRef)v15);
  self->_timeZone = v15;
  if (!self->_formatString) {
    self->_formatString = (NSString *)@"%Y-%m-%d %H:%M:%S %z";
  }
  return self;
}

+ (id)calendarDate
{
  id v2 = (void *)[objc_allocWithZone((Class)a1) init];

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithTimeIntervalSinceReferenceDate:", self->_timeIntervalSinceReferenceDate);
  [v4 setTimeZone:self->_timeZone];
  [v4 setCalendarFormat:self->_formatString];
  return v4;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(NSTimeZone *)aTimeZone
{
  objc_super v3 = aTimeZone;
  if (!aTimeZone) {
    objc_super v3 = (NSTimeZone *)[MEMORY[0x1E4F1CAF0] defaultTimeZone];
  }
  uint64_t v5 = v3;

  self->_timeZone = v3;
}

- (NSString)calendarFormat
{
  return self->_formatString;
}

- (void)setCalendarFormat:(NSString *)format
{
  uint64_t v5 = self->_formatString;
  if (format) {
    v6 = [(NSString *)format copyWithZone:0];
  }
  else {
    v6 = (NSString *)@"%Y-%m-%d %H:%M:%S %z";
  }
  self->_formatString = v6;
}

- (NSInteger)dayOfCommonEra
{
  double timeIntervalSinceReferenceDate = self->_timeIntervalSinceReferenceDate;
  return (uint64_t)((timeIntervalSinceReferenceDate
                  + (double)[(NSTimeZone *)self->_timeZone secondsFromGMTForDate:self])
                 / 86400.0
                 + 730486.0);
}

- (NSInteger)yearOfCommonEra
{
  return CFAbsoluteTimeGetGregorianDate(self->_timeIntervalSinceReferenceDate, (CFTimeZoneRef)self->_timeZone).year;
}

- (NSInteger)monthOfYear
{
  return (uint64_t)((unint64_t)*(_OWORD *)&CFAbsoluteTimeGetGregorianDate(self->_timeIntervalSinceReferenceDate, (CFTimeZoneRef)self->_timeZone) << 24) >> 56;
}

- (NSInteger)dayOfMonth
{
  return (uint64_t)((unint64_t)*(_OWORD *)&CFAbsoluteTimeGetGregorianDate(self->_timeIntervalSinceReferenceDate, (CFTimeZoneRef)self->_timeZone) << 16) >> 56;
}

- (NSInteger)dayOfWeek
{
  return CFAbsoluteTimeGetDayOfWeek(self->_timeIntervalSinceReferenceDate, (CFTimeZoneRef)self->_timeZone) % 7;
}

- (NSInteger)dayOfYear
{
  return CFAbsoluteTimeGetDayOfYear(self->_timeIntervalSinceReferenceDate, (CFTimeZoneRef)self->_timeZone);
}

- (NSInteger)hourOfDay
{
  double timeIntervalSinceReferenceDate = self->_timeIntervalSinceReferenceDate;
  uint64_t v3 = [(NSTimeZone *)self->_timeZone secondsFromGMTForDate:self];
  double v4 = (timeIntervalSinceReferenceDate + (double)v3) / 3600.0
     - floor((timeIntervalSinceReferenceDate + (double)v3) / 3600.0 / 24.0) * 24.0;
  if ((uint64_t)v4 >= 0) {
    return (uint64_t)v4;
  }
  else {
    return (uint64_t)v4 + 24;
  }
}

- (NSInteger)minuteOfHour
{
  double timeIntervalSinceReferenceDate = self->_timeIntervalSinceReferenceDate;
  uint64_t v3 = [(NSTimeZone *)self->_timeZone secondsFromGMTForDate:self];
  double v4 = (timeIntervalSinceReferenceDate + (double)v3) / 60.0
     - floor((timeIntervalSinceReferenceDate + (double)v3) / 60.0 / 60.0) * 60.0;
  if ((uint64_t)v4 >= 0) {
    return (uint64_t)v4;
  }
  else {
    return (uint64_t)v4 + 60;
  }
}

- (int64_t)microsecondOfSecond
{
  return (uint64_t)((self->_timeIntervalSinceReferenceDate - floor(self->_timeIntervalSinceReferenceDate)) * 1000000.0
                 + 0.5);
}

+ (id)dateWithYear:(NSInteger)year month:(NSUInteger)month day:(NSUInteger)day hour:(NSUInteger)hour minute:(NSUInteger)minute second:(NSUInteger)second timeZone:(NSTimeZone *)aTimeZone
{
  SInt8 v9 = (void *)[objc_allocWithZone((Class)a1) initWithYear:year month:month day:day hour:hour minute:minute second:second timeZone:aTimeZone];

  return v9;
}

- (NSCalendarDate)dateByAddingYears:(NSInteger)year months:(NSInteger)month days:(NSInteger)day hours:(NSInteger)hour minutes:(NSInteger)minute seconds:(NSInteger)second
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  double timeIntervalSinceReferenceDate = self->_timeIntervalSinceReferenceDate;
  timeZone = self->_timeZone;
  units.years = year;
  units.months = month;
  units.days = day;
  units.hours = hour;
  units.minutes = minute;
  *(&units.minutes + 1) = 0;
  units.seconds = (double)second;
  double v11 = CFAbsoluteTimeAddGregorianUnits(timeIntervalSinceReferenceDate, (CFTimeZoneRef)timeZone, &units);
  SInt8 v12 = (void *)[objc_allocWithZone((Class)objc_opt_class()) initWithTimeIntervalSinceReferenceDate:v11];
  [v12 setTimeZone:self->_timeZone];
  [v12 setCalendarFormat:self->_formatString];
  return (NSCalendarDate *)v12;
}

- (void)years:(NSInteger *)yp months:(NSInteger *)mop days:(NSInteger *)dp hours:(NSInteger *)hp minutes:(NSInteger *)mip seconds:(NSInteger *)sp sinceDate:(NSCalendarDate *)date
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!date)
  {
    v19 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: sinceDate: argument cannot be nil", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v19);
  }
  CFOptionFlags v16 = (yp != 0) | (2 * (mop != 0)) | (4 * (dp != 0)) | (8 * (hp != 0)) | (16 * (mip != 0)) | (32 * (sp != 0));
  double timeIntervalSinceReferenceDate = self->_timeIntervalSinceReferenceDate;
  [(NSCalendarDate *)date timeIntervalSinceReferenceDate];
  CFAbsoluteTimeGetDifferenceAsGregorianUnits(&v20, timeIntervalSinceReferenceDate, v18, (CFTimeZoneRef)self->_timeZone, v16);
  if (yp) {
    *yp = v20.years;
  }
  if (mop) {
    *mop = v20.months;
  }
  if (dp) {
    *dp = v20.days;
  }
  if (hp) {
    *hp = v20.hours;
  }
  if (mip) {
    *mip = v20.minutes;
  }
  if (sp) {
    *sp = (uint64_t)v20.seconds;
  }
}

- (id)addTimeInterval:(double)a3
{
  [(NSCalendarDate *)self timeIntervalSinceReferenceDate];
  v6 = +[NSCalendarDate dateWithTimeIntervalSinceReferenceDate:v5 + a3];
  [(NSCalendarDate *)v6 setTimeZone:self->_timeZone];
  [(NSCalendarDate *)v6 setCalendarFormat:self->_formatString];
  return v6;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (void)encodeWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    [(NSCalendarDate *)self timeIntervalSinceReferenceDate];
    objc_msgSend(a3, "encodeDouble:forKey:", @"NS.time");
    objc_msgSend(a3, "encodeObject:forKey:", -[NSCalendarDate timeZone](self, "timeZone"), @"NS.timezone");
    double v5 = [(NSCalendarDate *)self calendarFormat];
    [a3 encodeObject:v5 forKey:@"NS.format"];
  }
  else
  {
    [a3 encodeValueOfObjCType:"d" at:&self->_timeIntervalSinceReferenceDate];
    [a3 encodeValueOfObjCType:"@" at:&self->_timeZone];
    [a3 encodeValueOfObjCType:"@" at:&self->_formatString];
  }
}

- (NSCalendarDate)initWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    double v5 = 0.0;
    if ([a3 containsValueForKey:@"NS.time"])
    {
      [a3 decodeDoubleForKey:@"NS.time"];
      double v5 = v6;
    }
    uint64_t v7 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NS.timezone"];
    uint64_t v8 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NS.format"];
    if ([a3 error])
    {
      return 0;
    }
    else
    {
      SInt8 v9 = [(NSCalendarDate *)self initWithTimeIntervalSinceReferenceDate:v5];
      self = v9;
      if (v9)
      {
        [(NSCalendarDate *)v9 setTimeZone:v7];
        [(NSCalendarDate *)self setCalendarFormat:v8];
      }
    }
  }
  else
  {
    [a3 decodeValueOfObjCType:"d" at:&self->_timeIntervalSinceReferenceDate size:8];
    [a3 decodeValueOfObjCType:"@" at:&self->_timeZone size:8];
    [a3 decodeValueOfObjCType:"@" at:&self->_formatString size:8];
  }
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return [(NSCalendarDate *)self descriptionWithCalendarFormat:self->_formatString locale:0];
}

- (NSString)descriptionWithLocale:(id)locale
{
  return [(NSCalendarDate *)self descriptionWithCalendarFormat:self->_formatString locale:locale];
}

- (NSString)descriptionWithCalendarFormat:(NSString *)format
{
  return [(NSCalendarDate *)self descriptionWithCalendarFormat:format locale:0];
}

- (id)initWithString:(NSString *)description calendarFormat:(NSString *)format
{
  return [(NSCalendarDate *)self initWithString:description calendarFormat:format locale:0];
}

+ (id)dateWithString:(NSString *)description calendarFormat:(NSString *)format
{
  double v4 = (void *)[objc_allocWithZone((Class)a1) initWithString:description calendarFormat:format locale:0];

  return v4;
}

+ (id)dateWithString:(NSString *)description calendarFormat:(NSString *)format locale:(id)locale
{
  double v5 = (void *)[objc_allocWithZone((Class)a1) initWithString:description calendarFormat:format locale:locale];

  return v5;
}

- (NSString)descriptionWithCalendarFormat:(NSString *)format locale:(id)locale
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  double v5 = (NSString *)(id)[objc_allocWithZone((Class)NSMutableString) init];
  NSUInteger v6 = [(NSString *)format length];
  uint64_t v7 = +[NSCharacterSet decimalDigitCharacterSet];
  if (v6)
  {
    uint64_t v8 = v7;
    NSUInteger v9 = 0;
    CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    do
    {
      uint64_t v10 = [(NSString *)format rangeOfString:@"%", 0, v9, v6 - v9 options range];
      uint64_t v12 = v11;
      if (v11) {
        NSUInteger v13 = v10;
      }
      else {
        NSUInteger v13 = v6;
      }
      if (v13 > v9) {
        -[NSString replaceCharactersInRange:withString:](v5, "replaceCharactersInRange:withString:", -[NSString length](v5, "length"), 0, -[NSString substringWithRange:](format, "substringWithRange:", v9, v13 - v9));
      }
      NSUInteger v9 = v13 + v12;
      if (v12)
      {
        NSUInteger v14 = v13 + v12;
        if (v9 >= v6)
        {
          __str[0] = 0;
        }
        else
        {
          while (1)
          {
            BOOL v15 = [(NSCharacterSet *)v8 characterIsMember:[(NSString *)format characterAtIndex:v14]];
            BOOL v16 = v15;
            if (!v15) {
              break;
            }
            if (++v14 >= v6)
            {
              NSUInteger v14 = v6;
              goto LABEL_15;
            }
          }
          if (v9 >= v14)
          {
            __str[0] = 0;
            goto LABEL_18;
          }
LABEL_15:
          snprintf(__str, 0x80uLL, "%%%sd", -[NSString UTF8String](-[NSString substringWithRange:](format, "substringWithRange:", v9, v14 - v9), "UTF8String"));
          NSUInteger v9 = v14;
          if (v16) {
            continue;
          }
LABEL_18:
          NSUInteger v9 = v14 + 1;
          int v17 = [(NSString *)format characterAtIndex:v14];
          switch(v17)
          {
            case 'A':
              NSInteger v18 = [(NSCalendarDate *)self dayOfWeek];
              v19 = (void *)[locale objectForKey:@"NSWeekDayNameArray"];
              uint64_t v20 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"Sunday", @"Monday", @"Tuesday", @"Wednesday", @"Thursday", @"Friday", @"Saturday", 0, v64, v65, v66, v67, v68);
              goto LABEL_45;
            case 'B':
              NSInteger v18 = [(NSCalendarDate *)self monthOfYear] - 1;
              v19 = (void *)[locale objectForKey:@"NSMonthNameArray"];
              uint64_t v20 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"January", @"February", @"March", @"April", @"May", @"June", @"July", @"August", @"September", @"October", @"November", @"December", 0);
              goto LABEL_45;
            case 'C':
            case 'D':
            case 'E':
            case 'G':
            case 'J':
            case 'K':
            case 'L':
            case 'N':
            case 'O':
            case 'P':
            case 'Q':
            case 'R':
            case 'T':
            case 'U':
            case 'V':
            case 'W':
            case '[':
            case '\\':
            case ']':
            case '^':
            case '_':
            case 'f':
            case 'g':
            case 'h':
            case 'k':
            case 'l':
LABEL_24:
              uint64_t v21 = [(NSString *)v5 length];
              v22 = v5;
              v23 = (NSString *)@"?";
              goto LABEL_65;
            case 'F':
              [(NSCalendarDate *)self timeIntervalSinceReferenceDate];
              double v25 = v24;
              [(NSCalendarDate *)self timeIntervalSinceReferenceDate];
              int64_t v27 = vcvtmd_s64_f64((v25 - floor(v26)) * 1000.0);
              int v28 = 5243
                  * (__int16)(v27
                            - 1000
                            * (((unint64_t)((unsigned __int128)(v27 * (__int128)0x20C49BA5E353F7CFLL) >> 64) >> 63)
                             + (((unsigned __int128)(v27 * (__int128)0x20C49BA5E353F7CFLL) >> 64) >> 7)));
              v72[0] = (v28 >> 19) + (v28 >> 31) + 48;
              uint64_t v29 = ((unsigned __int128)(v27 * (__int128)(uint64_t)0xA3D70A3D70A3D70BLL) >> 64) + v27;
              LODWORD(v29) = 103 * (char)(v27 - 100 * ((v29 < 0) + (v29 >> 6)));
              v72[1] = (((v29 & 0x8000) != 0) + (v29 >> 10) + 48);
              v72[2] = v27
                     - 10
                     * (((unint64_t)((unsigned __int128)(v27 * (__int128)0x6666666666666667) >> 64) >> 63)
                      + (((unsigned __int128)(v27 * (__int128)0x6666666666666667) >> 64) >> 2))
                     + 48;
              -[NSString replaceCharactersInRange:withCharacters:length:](v5, "replaceCharactersInRange:withCharacters:length:", [(NSString *)v5 length], 0, v72, 3);
              break;
            case 'H':
              NSInteger v30 = [(NSCalendarDate *)self hourOfDay];
              goto LABEL_54;
            case 'I':
              NSInteger v31 = [(NSCalendarDate *)self hourOfDay];
              if (v31 % 12) {
                NSInteger v32 = v31 % 12;
              }
              else {
                NSInteger v32 = 12;
              }
              goto LABEL_55;
            case 'M':
              NSInteger v30 = [(NSCalendarDate *)self minuteOfHour];
              goto LABEL_54;
            case 'S':
              NSInteger v30 = [(NSCalendarDate *)self secondOfMinute];
              goto LABEL_54;
            case 'X':
              id v33 = locale;
              uint64_t v34 = [locale objectForKey:@"NSTimeDateFormatString"];
              BOOL v35 = v34 == 0;
              v36 = @"%H:%M:%S %Z";
              goto LABEL_61;
            case 'Y':
              NSInteger v37 = [(NSCalendarDate *)self yearOfCommonEra];
              v38 = (void *)[locale objectForKey:@"AppleLocale"];
              if (!v38) {
                goto LABEL_38;
              }
              v39 = v38;
              if ([v38 isEqualToString:@"ja_JP_TRADITIONAL"])
              {
LABEL_70:
                CFLocaleRef v51 = CFLocaleCreate(0, @"ja_JP_TRADITIONAL");
                v52 = CFDateFormatterCreate(allocator, v51, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
                CFDateFormatterSetFormat(v52, @"Gy");
                [(NSCalendarDate *)self timeIntervalSinceReferenceDate];
                CFStringRef StringWithAbsoluteTime = CFDateFormatterCreateStringWithAbsoluteTime(allocator, v52, v53);
                -[NSString replaceCharactersInRange:withString:](v5, "replaceCharactersInRange:withString:", [(NSString *)v5 length], 0, StringWithAbsoluteTime);
                CFRelease(v51);
                CFRelease(v52);
                CFRelease(StringWithAbsoluteTime);
              }
              else
              {
                if ([v39 isEqualToString:@"th_TH_TRADITIONAL"]) {
                  v37 += 543;
                }
LABEL_38:
                v40 = v5;
                NSInteger v32 = v37;
LABEL_58:
                v45 = "%ld";
LABEL_59:
                appendNumber(v40, v32, __str, v45);
              }
              break;
            case 'Z':
              v41 = [(NSTimeZone *)[(NSCalendarDate *)self timeZone] name];
              if (v41) {
                v42 = (__CFString *)v41;
              }
              else {
                v42 = &stru_1ECA5C228;
              }
              [(NSString *)v5 appendString:v42];
              break;
            case 'a':
              NSInteger v18 = [(NSCalendarDate *)self dayOfWeek];
              v19 = (void *)[locale objectForKey:@"NSShortWeekDayNameArray"];
              uint64_t v20 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"Sun", @"Mon", @"Tue", @"Wed", @"Thu", @"Fri", @"Sat", 0, v64, v65, v66, v67, v68);
              goto LABEL_45;
            case 'b':
              NSInteger v18 = [(NSCalendarDate *)self monthOfYear] - 1;
              v19 = (void *)[locale objectForKey:@"NSShortMonthNameArray"];
              uint64_t v20 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"Jan", @"Feb", @"Mar", @"Apr", @"May", @"Jun", @"Jul", @"Aug", @"Sep", @"Oct", @"Nov", @"Dec", 0);
LABEL_45:
              if (!v19) {
                v19 = (void *)v20;
              }
              uint64_t v43 = [(NSString *)v5 length];
              v23 = (NSString *)[v19 objectAtIndex:v18];
              v22 = v5;
              uint64_t v21 = v43;
              goto LABEL_65;
            case 'c':
              id v33 = locale;
              uint64_t v34 = [locale objectForKey:@"NSTimeDateFormatString"];
              BOOL v35 = v34 == 0;
              v36 = @"%a %b %d %H:%M:%S %Z %Y";
LABEL_61:
              if (v35) {
                uint64_t v46 = (uint64_t)v36;
              }
              else {
                uint64_t v46 = v34;
              }
              uint64_t v47 = [(NSString *)v5 length];
              v23 = [(NSCalendarDate *)self descriptionWithCalendarFormat:v46 locale:v33];
              v22 = v5;
              uint64_t v21 = v47;
LABEL_65:
              -[NSString replaceCharactersInRange:withString:](v22, "replaceCharactersInRange:withString:", v21, 0, v23);
              break;
            case 'd':
              NSInteger v30 = [(NSCalendarDate *)self dayOfMonth];
              goto LABEL_54;
            case 'e':
              NSInteger v44 = [(NSCalendarDate *)self dayOfMonth];
LABEL_57:
              NSInteger v32 = v44;
              v40 = v5;
              goto LABEL_58;
            case 'i':
              NSInteger v32 = [(NSCalendarDate *)self hourOfDay] % 12;
              goto LABEL_55;
            case 'j':
              NSInteger v32 = [(NSCalendarDate *)self dayOfYear];
              v40 = v5;
              v45 = "%03ld";
              goto LABEL_59;
            case 'm':
              NSInteger v30 = [(NSCalendarDate *)self monthOfYear];
LABEL_54:
              NSInteger v32 = v30;
              goto LABEL_55;
            default:
              switch(v17)
              {
                case 'p':
                  NSInteger v18 = [(NSCalendarDate *)self hourOfDay] > 11;
                  v19 = (void *)[locale objectForKey:@"NSAMPMDesignation"];
                  uint64_t v20 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"AM", @"PM", 0, v59, v60, v61, v62, v63, v64, v65, v66, v67, v68);
                  goto LABEL_45;
                case 'q':
                case 'r':
                case 's':
                case 't':
                case 'u':
                case 'v':
                  goto LABEL_24;
                case 'w':
                  NSInteger v44 = [(NSCalendarDate *)self dayOfWeek];
                  goto LABEL_57;
                case 'x':
                  id v33 = locale;
                  uint64_t v34 = [locale objectForKey:@"NSTimeDateFormatString"];
                  BOOL v35 = v34 == 0;
                  v36 = @"%a %b %d %Y";
                  goto LABEL_61;
                case 'y':
                  NSInteger v48 = [(NSCalendarDate *)self yearOfCommonEra];
                  v49 = (void *)[locale objectForKey:@"AppleLocale"];
                  if (!v49) {
                    goto LABEL_82;
                  }
                  v50 = v49;
                  if ([v49 isEqualToString:@"ja_JP_TRADITIONAL"]) {
                    goto LABEL_70;
                  }
                  if ([v50 isEqualToString:@"th_TH_TRADITIONAL"]) {
                    v48 += 543;
                  }
LABEL_82:
                  NSInteger v32 = v48 % 100;
                  break;
                case 'z':
                  if ([(NSCalendarDate *)self timeZone])
                  {
                    uint64_t v55 = [(NSTimeZone *)[(NSCalendarDate *)self timeZone] secondsFromGMTForDate:self];
                    if (v55 >= 0) {
                      v56 = @"+";
                    }
                    else {
                      v56 = @"-";
                    }
                    if (v55 >= 0) {
                      unint64_t v57 = v55;
                    }
                    else {
                      unint64_t v57 = -v55;
                    }
                  }
                  else
                  {
                    unint64_t v57 = 0;
                    v56 = @"+";
                  }
                  -[NSString replaceCharactersInRange:withString:](v5, "replaceCharactersInRange:withString:", [(NSString *)v5 length], 0, v56);
                  appendNumber(v5, v57 / 0xE10, "%02ld", "%02ld");
                  appendNumber(v5, v57 / 0x3C- 60 * ((unint64_t)((v57 / 0x3C * (unsigned __int128)0x888888888888889uLL) >> 64) >> 1), "%02ld", "%02ld");
                  continue;
                default:
                  if (v17 != 37) {
                    goto LABEL_24;
                  }
                  uint64_t v21 = [(NSString *)v5 length];
                  v22 = v5;
                  v23 = (NSString *)@"%";
                  goto LABEL_65;
              }
LABEL_55:
              v40 = v5;
              v45 = "%02ld";
              goto LABEL_59;
          }
        }
      }
    }
    while (v9 < v6);
  }
  return v5;
}

- (id)initWithString:(NSString *)description calendarFormat:(NSString *)format locale:(id)locale
{
  v88[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = +[NSScanner scannerWithString:](NSScanner, "scannerWithString:");
  uint64_t v8 = +[NSScanner scannerWithString:format];
  uint64_t v81 = 0;
  v77 = +[NSCharacterSet decimalDigitCharacterSet];
  if (oldInitWithString_doExcelLittleY == -1)
  {
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "objectForKey:", @"NSUseExcelTwoDigitYearSemantics"))
    {
      uint64_t v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"NSUseExcelTwoDigitYearSemantics");
    }
    else
    {
      uint64_t v9 = 1;
    }
    oldInitWithString_doExcelLittleY = v9;
  }
  uint64_t v82 = 0;
  uint64_t v83 = 0;
  uint64_t v84 = 0;
  uint64_t v85 = 0;
  uint64_t v86 = 0;
  uint64_t v87 = 0;
  uint64_t v10 = -1;
  v88[0] = -1;
  v73 = format;
  if (![(NSScanner *)v8 isAtEnd])
  {
    uint64_t v74 = 0;
    NSUInteger v14 = @"%";
    CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    while (1)
    {
      if ([(NSScanner *)v7 isAtEnd]) {
        goto LABEL_136;
      }
      skipWhitespace(v7);
      if ([(NSScanner *)v7 isAtEnd]) {
        goto LABEL_136;
      }
      if (![(NSScanner *)v8 scanString:v14 intoString:0])
      {
        uint64_t v17 = [(NSScanner *)v8 scanLocation];
        uint64_t v18 = [(NSScanner *)v7 scanLocation];
        if ([(NSScanner *)v8 isAtEnd] && ![(NSScanner *)v7 isAtEnd]) {
          goto LABEL_136;
        }
        v19 = v14;
        int v20 = [(NSString *)format characterAtIndex:v17];
        if ([(NSString *)description characterAtIndex:v18] != v20) {
          goto LABEL_136;
        }
        NSUInteger v14 = v19;
        [(NSScanner *)v7 setScanLocation:v18 + 1];
        uint64_t v21 = v17 + 1;
        goto LABEL_109;
      }
      if ([(NSScanner *)v8 isAtEnd]) {
        goto LABEL_136;
      }
      [(NSScanner *)v8 scanCharactersFromSet:v77 intoString:0];
      int v15 = [(NSString *)format characterAtIndex:[(NSScanner *)v8 scanLocation]];
      switch(v15)
      {
        case 'A':
          v23 = (void *)[locale objectForKey:@"NSWeekDayNameArray"];
          if (v23) {
            goto LABEL_46;
          }
          uint64_t v24 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"Sunday", @"Monday", @"Tuesday", @"Wednesday", @"Thursday", @"Friday", @"Saturday", 0);
          goto LABEL_45;
        case 'B':
          double v25 = (void *)[locale objectForKey:@"NSMonthNameArray"];
          if (v25) {
            goto LABEL_53;
          }
          uint64_t v26 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"January", @"February", @"March", @"April", @"May", @"June", @"July", @"August", @"September", @"October", @"November", @"December", 0);
          goto LABEL_52;
        case 'C':
        case 'D':
        case 'E':
        case 'G':
        case 'J':
        case 'K':
        case 'L':
        case 'N':
        case 'O':
        case 'P':
        case 'Q':
        case 'R':
        case 'T':
        case 'U':
        case 'V':
        case 'W':
        case '[':
        case '\\':
        case ']':
        case '^':
        case '_':
          goto LABEL_136;
        case 'F':
          BOOL v16 = &v82;
          int64_t v27 = v7;
          uint64_t v28 = 3;
          goto LABEL_64;
        case 'H':
        case 'I':
          BOOL v16 = &v85;
          goto LABEL_63;
        case 'M':
          BOOL v16 = &v84;
          goto LABEL_63;
        case 'S':
          BOOL v16 = &v83;
          goto LABEL_63;
        case 'X':
          uint64_t v29 = [locale objectForKey:@"NSTimeDateFormatString"];
          BOOL v30 = v29 == 0;
          NSInteger v31 = @"%H:%M:%S %Z";
          goto LABEL_74;
        case 'Y':
          NSInteger v32 = (void *)[locale objectForKey:@"AppleLocale"];
          if (v32)
          {
            id v33 = v32;
            if ([v32 isEqualToString:@"ja_JP_TRADITIONAL"])
            {
              uint64_t v34 = [(NSString *)description substringFromIndex:[(NSScanner *)v7 scanLocation]];
              CFLocaleRef v35 = CFLocaleCreate(0, @"ja_JP_TRADITIONAL");
              v36 = CFDateFormatterCreate(allocator, v35, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
              CFDateFormatterSetFormat(v36, @"Gy");
              CFRelease(v35);
              CFAbsoluteTime atp = 0.0;
              rangep.location = 0;
              rangep.length = 0;
              rangep.length = [(NSString *)v34 length];
              if (!CFDateFormatterGetAbsoluteTimeFromString(v36, (CFStringRef)v34, &rangep, &atp)) {
                goto LABEL_148;
              }
              [(NSScanner *)v7 setScanLocation:[(NSScanner *)v7 scanLocation] + rangep.length];
              CFTimeZoneRef v37 = CFTimeZoneCopyDefault();
              SInt32 year = CFAbsoluteTimeGetGregorianDate(atp, v37).year;
              CFRelease(v37);
              v88[0] = year;
              CFRelease(v36);
              NSUInteger v14 = @"%";
            }
            else
            {
              if (![(NSScanner *)v7 _scanDecimal:4 into:v88]) {
                goto LABEL_136;
              }
              if ([v33 isEqualToString:@"th_TH_TRADITIONAL"])
              {
                uint64_t v49 = v88[0] - 543;
                v88[0] -= 543;
                goto LABEL_97;
              }
            }
          }
          else if (![(NSScanner *)v7 _scanDecimal:4 into:v88])
          {
            goto LABEL_136;
          }
          uint64_t v49 = v88[0];
LABEL_97:
          if (v49 < 1) {
            goto LABEL_136;
          }
          goto LABEL_108;
        case 'Z':
          skipWhitespace(v7);
          if (![(NSScanner *)v7 scanUpToCharactersFromSet:+[NSCharacterSet whitespaceAndNewlineCharacterSet] intoString:&v81])goto LABEL_136; {
          goto LABEL_108;
          }
        case 'a':
          v23 = (void *)[locale objectForKey:@"NSShortWeekDayNameArray"];
          if (v23) {
            goto LABEL_46;
          }
          uint64_t v24 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"Sun", @"Mon", @"Tue", @"Wed", @"Thu", @"Fri", @"Sat", 0);
LABEL_45:
          v23 = (void *)v24;
LABEL_46:
          uint64_t v39 = 0;
          while (!-[NSScanner scanString:intoString:](v7, "scanString:intoString:", [v23 objectAtIndex:v39], 0))
          {
            if (++v39 == 7) {
              goto LABEL_136;
            }
          }
          goto LABEL_108;
        case 'b':
          double v25 = (void *)[locale objectForKey:@"NSShortMonthNameArray"];
          if (v25) {
            goto LABEL_53;
          }
          uint64_t v26 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"Jan", @"Feb", @"Mar", @"Apr", @"May", @"Jun", @"Jul", @"Aug", @"Sep", @"Oct", @"Nov", @"Dec", 0);
LABEL_52:
          double v25 = (void *)v26;
LABEL_53:
          uint64_t v40 = 1;
          while (!-[NSScanner scanString:intoString:](v7, "scanString:intoString:", [v25 objectAtIndex:v40 - 1], 0))
          {
            if (++v40 == 13) {
              goto LABEL_136;
            }
          }
          uint64_t v87 = v40;
          goto LABEL_108;
        case 'c':
          uint64_t v29 = [locale objectForKey:@"NSTimeDateFormatString"];
          BOOL v30 = v29 == 0;
          NSInteger v31 = @"%a %b %d %H:%M:%S %Z %Y";
LABEL_74:
          if (v30) {
            v42 = v31;
          }
          else {
            v42 = (void *)v29;
          }
          [(NSScanner *)v8 setScanLocation:[(NSScanner *)v8 scanLocation] + 1];
          format = (NSString *)objc_msgSend(v42, "stringByAppendingString:", -[NSScanner _remainingString](v8, "_remainingString"));
          uint64_t v8 = +[NSScanner scannerWithString:format];
          goto LABEL_110;
        case 'd':
          BOOL v16 = &v86;
LABEL_63:
          int64_t v27 = v7;
          uint64_t v28 = 2;
LABEL_64:
          if (![(NSScanner *)v27 _scanDecimal:v28 into:v16]) {
            goto LABEL_136;
          }
          goto LABEL_108;
        case 'e':
          int v80 = 0;
          if (![(NSScanner *)v7 scanInt:&v80]) {
            goto LABEL_136;
          }
          uint64_t v86 = v80;
          goto LABEL_108;
        default:
          switch(v15)
          {
            case 'j':
              if (![(NSScanner *)v7 scanInt:&v80]) {
                goto LABEL_136;
              }
              uint64_t v74 = v80;
              goto LABEL_108;
            case 'k':
            case 'l':
            case 'n':
            case 'o':
            case 'q':
            case 'r':
            case 's':
            case 't':
            case 'u':
            case 'v':
              goto LABEL_136;
            case 'm':
              BOOL v16 = &v87;
              goto LABEL_63;
            case 'p':
              v41 = (void *)[locale objectForKey:@"NSAMPMDesignation"];
              if (!v41) {
                v41 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"AM", @"PM", 0);
              }
              if (-[NSScanner scanString:intoString:](v7, "scanString:intoString:", [v41 objectAtIndex:1], 0))
              {
                if (v85 <= 11) {
                  v85 += 12;
                }
              }
              else
              {
                if (!-[NSScanner scanString:intoString:](v7, "scanString:intoString:", [v41 objectAtIndex:0], 0))goto LABEL_136; {
                if (v85 == 12)
                }
                  uint64_t v85 = 0;
              }
              goto LABEL_108;
            case 'w':
              uint64_t v22 = [(NSScanner *)v7 scanLocation];
              if ([(NSString *)description characterAtIndex:v22] - 48 > 6) {
                goto LABEL_136;
              }
              goto LABEL_72;
            case 'x':
              uint64_t v29 = [locale objectForKey:@"NSTimeDateFormatString"];
              BOOL v30 = v29 == 0;
              NSInteger v31 = @"%a %b %d %Y";
              goto LABEL_74;
            case 'y':
              uint64_t v43 = (void *)[locale objectForKey:@"AppleLocale"];
              if (!v43)
              {
                if (![(NSScanner *)v7 _scanDecimal:2 into:v88]) {
                  goto LABEL_136;
                }
LABEL_102:
                if (oldInitWithString_doExcelLittleY)
                {
                  uint64_t v51 = 1900;
                  if (v88[0] < 30) {
                    uint64_t v51 = 2000;
                  }
                  uint64_t v50 = v51 + v88[0];
                }
                else
                {
                  uint64_t v50 = v88[0] + 1900;
                }
                goto LABEL_107;
              }
              NSInteger v44 = v43;
              if ([v43 isEqualToString:@"ja_JP_TRADITIONAL"])
              {
                v45 = [(NSString *)description substringFromIndex:[(NSScanner *)v7 scanLocation]];
                CFLocaleRef v46 = CFLocaleCreate(0, @"ja_JP_TRADITIONAL");
                v36 = CFDateFormatterCreate(allocator, v46, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
                CFDateFormatterSetFormat(v36, @"Gy");
                CFRelease(v46);
                CFAbsoluteTime atp = 0.0;
                rangep.location = 0;
                rangep.length = 0;
                rangep.length = [(NSString *)v45 length];
                if (!CFDateFormatterGetAbsoluteTimeFromString(v36, (CFStringRef)v45, &rangep, &atp))
                {
LABEL_148:
                  CFRelease(v36);
                  goto LABEL_136;
                }
                [(NSScanner *)v7 setScanLocation:[(NSScanner *)v7 scanLocation] + rangep.length];
                CFTimeZoneRef v47 = CFTimeZoneCopyDefault();
                SInt32 v48 = CFAbsoluteTimeGetGregorianDate(atp, v47).year;
                CFRelease(v47);
                v88[0] = v48;
                CFRelease(v36);
                NSUInteger v14 = @"%";
                goto LABEL_108;
              }
              if (![(NSScanner *)v7 _scanDecimal:2 into:v88]) {
                goto LABEL_136;
              }
              if (![v44 isEqualToString:@"th_TH_TRADITIONAL"]) {
                goto LABEL_102;
              }
              uint64_t v50 = v88[0] + 1957;
LABEL_107:
              v88[0] = v50;
LABEL_108:
              uint64_t v21 = [(NSScanner *)v8 scanLocation] + 1;
LABEL_109:
              [(NSScanner *)v8 setScanLocation:v21];
LABEL_110:
              if ([(NSScanner *)v8 isAtEnd]) {
                goto LABEL_8;
              }
              break;
            case 'z':
              LODWORD(rangep.location) = 0;
              if (![(NSScanner *)v7 scanInt:&rangep]) {
                goto LABEL_136;
              }
              if ((rangep.location & 0x80000000) != 0) {
                uint64_t v10 = (int)(-60 * (-LODWORD(rangep.location) % 0x64u) - 3600 * (-LODWORD(rangep.location) / 0x64u));
              }
              else {
                uint64_t v10 = 60 * (LODWORD(rangep.location) % 0x64) + 3600 * (LODWORD(rangep.location) / 0x64);
              }
              goto LABEL_108;
            default:
              if (v15 != 37) {
                goto LABEL_136;
              }
              uint64_t v22 = [(NSScanner *)v7 scanLocation];
              if ([(NSString *)[(NSScanner *)v7 string] characterAtIndex:v22] != 37) {
                goto LABEL_136;
              }
LABEL_72:
              [(NSScanner *)v7 setScanLocation:v22 + 1];
              goto LABEL_108;
          }
          break;
      }
    }
  }
  uint64_t v74 = 0;
LABEL_8:
  if (![(NSScanner *)v8 isAtEnd]) {
    goto LABEL_136;
  }
  if (v81)
  {
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CAF0], "timeZoneWithName:");
    uint64_t v12 = v74;
    if (v11) {
      goto LABEL_116;
    }
    uint64_t v13 = [MEMORY[0x1E4F1CAF0] timeZoneWithAbbreviation:v81];
  }
  else
  {
    uint64_t v12 = v74;
    if (v10 == -1) {
      uint64_t v13 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
    }
    else {
      uint64_t v13 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:v10];
    }
  }
  uint64_t v11 = v13;
LABEL_116:
  uint64_t v52 = v88[0];
  if (v88[0] == -1)
  {
    uint64_t v52 = objc_msgSend(+[NSCalendarDate calendarDate](NSCalendarDate, "calendarDate"), "yearOfCommonEra");
    v88[0] = v52;
    if (v12)
    {
LABEL_118:
      uint64_t v53 = v52 - 1;
      uint64_t v54 = v52 + 2;
      if (v52 >= 1) {
        uint64_t v54 = v52 - 1;
      }
      uint64_t v55 = v12 + 365 * (v52 - 1) + (v54 >> 2);
      uint64_t v56 = ((unsigned __int128)(v53 * (__int128)0x5C28F5C28F5C28F5) >> 64) - v52 + 1;
      uint64_t v57 = v55 + v53 / 400 + (v56 >> 6) + ((unint64_t)v56 >> 63);
      uint64_t v58 = ((v57 / 366) << 16) + 0x10000;
      int64_t v59 = v57 / 366 - 1;
      unsigned int v60 = ((v57 / 366) << 16) - 0x10000;
      do
      {
        uint64_t v61 = absolute_from_gregorian(v58 & 0xFFFF0000 | 0x101);
        LODWORD(v58) = v58 + 0x10000;
        ++v59;
        v60 += 0x10000;
      }
      while (v61 <= v57);
      uint64_t v62 = 0;
      int64_t v63 = v59 & 3;
      uint64_t v64 = v59 % 400;
      unsigned __int8 v65 = 1;
      if ((v59 & 3) == 0) {
        goto LABEL_125;
      }
LABEL_130:
      for (unsigned __int8 i = days_per_month[v62]; ; unsigned __int8 i = 29)
      {
        int v67 = v65;
        int64_t v59 = v59 & 0xFFFFFFFF00000000 | (v60 + v65 + (i << 8));
        if (absolute_from_gregorian(v59) >= v57) {
          break;
        }
        ++v62;
        unsigned __int8 v65 = v67 + 1;
        if (v63) {
          goto LABEL_130;
        }
LABEL_125:
        if (v62 != 1 || v64 == 100 || v64 == 300 || v64 == 200) {
          goto LABEL_130;
        }
      }
      uint64_t v68 = (v62 + 1);
      char v69 = absolute_from_gregorian(v67 + v60 + 256);
      if (v87 && v87 != v68 || (uint64_t v87 = (v62 + 1), v86) && v86 != (v57 - v69 + 1))
      {
LABEL_136:

        return 0;
      }
      uint64_t v86 = (v57 - v69 + 1);
      if ((_BYTE)v62 == 0xFF) {
        goto LABEL_140;
      }
      goto LABEL_141;
    }
  }
  else if (v12)
  {
    goto LABEL_118;
  }
  uint64_t v68 = v87;
  if (!v87)
  {
LABEL_140:
    uint64_t v68 = 1;
    uint64_t v87 = 1;
  }
LABEL_141:
  if (!v86) {
    uint64_t v86 = 1;
  }
  v70 = -[NSCalendarDate initWithYear:month:day:hour:minute:second:timeZone:](self, "initWithYear:month:day:hour:minute:second:timeZone:", v52, v68, v11);
  [(NSCalendarDate *)v70 setCalendarFormat:v73];
  if (v70 && v82) {
    v70->_double timeIntervalSinceReferenceDate = (double)v82 / 1000.0 + 0.0001 + v70->_timeIntervalSinceReferenceDate;
  }
  return v70;
}

+ (NSCalendarDate)dateWithNaturalLanguageString:(id)a3 date:(id)a4 locale:(id)a5
{
  id v121 = a5;
  v128[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = objc_msgSend(a3, "stringByTrimmingCharactersInSet:", +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
  if ([v8 isEqual:@"now"])
  {
    if (a4) {
      return (NSCalendarDate *)a4;
    }
    return (NSCalendarDate *)+[NSCalendarDate calendarDate];
  }
  if ([v8 isEqual:@"today"])
  {
    if (!a4) {
      a4 = +[NSCalendarDate calendarDate];
    }
    uint64_t v10 = [a4 yearOfCommonEra];
    uint64_t v11 = [a4 monthOfYear];
    uint64_t v12 = [a4 dayOfMonth];
    return (NSCalendarDate *)objc_msgSend(a1, "dateWithYear:month:day:hour:minute:second:timeZone:", v10, v11, v12, 0, 0, 0, objc_msgSend(MEMORY[0x1E4F1CAF0], "defaultTimeZone"));
  }
  v128[0] = 0;
  uint64_t v13 = (__CFString *)objc_msgSend((id)objc_msgSend(v121, "objectForKey:", @"NSDateTimeOrdering"), "uppercaseString");
  if (!v13) {
    uint64_t v13 = @"MDYH";
  }
  -[__CFString getCharacters:range:](v13, "getCharacters:range:", v128, 0, 4);
  NSUInteger v14 = +[NSCharacterSet letterCharacterSet];
  v122 = +[NSCharacterSet decimalDigitCharacterSet];
  v115 = +[NSCharacterSet alphanumericCharacterSet];
  id v15 = [+[NSMutableCharacterSet decimalDigitCharacterSet] mutableCopyWithZone:0];
  v124 = 0;
  BOOL v16 = +[NSScanner scannerWithString:a3];
  uint64_t v17 = (void *)[MEMORY[0x1E4F1CA48] array];
  *(void *)&long long v18 = -1;
  *((void *)&v18 + 1) = -1;
  long long v125 = v18;
  long long v126 = v18;
  v119 = v15;
  [v15 addCharactersInString:@"-+"];
  if (dateWithNaturalLanguageString_date_locale__doExcelLittleY == -1)
  {
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "objectForKey:", @"NSUseExcelTwoDigitYearSemantics"))
    {
      uint64_t v19 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"NSUseExcelTwoDigitYearSemantics");
    }
    else
    {
      uint64_t v19 = 1;
    }
    dateWithNaturalLanguageString_date_locale__doExcelLittleY = v19;
  }
  memset(v127, 0, sizeof(v127));
  [(NSScanner *)v16 setCharactersToBeSkipped:0];
  if (![(NSScanner *)v16 isAtEnd])
  {
    do
    {
      BOOL v20 = [(NSScanner *)v16 scanCharactersFromSet:+[NSCharacterSet whitespaceCharacterSet] intoString:0];
      if ([(NSScanner *)v16 isAtEnd]) {
        break;
      }
      if (![(NSScanner *)v16 scanCharactersFromSet:v122 intoString:&v124]
        && (!v20
         || ![(NSScanner *)v16 scanCharactersFromSet:v119 intoString:&v124])
        && ![(NSScanner *)v16 scanCharactersFromSet:v14 intoString:&v124]
        && ![(NSScanner *)v16 scanUpToCharactersFromSet:v115 intoString:&v124])
      {
        objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:@"format error" reason:@"internal error" userInfo:0]);
      }
      [v17 addObject:v124];
    }
    while (![(NSScanner *)v16 isAtEnd]);
  }
  id v108 = a1;
  uint64_t v123 = [v17 count];
  if (v123 <= 0)
  {
    uint64_t v24 = 0;
    uint64_t v23 = 0;
    uint64_t v22 = 0;
    uint64_t v64 = 0;
    uint64_t v65 = -1;
    *(void *)&long long v125 = -1;
    uint64_t v25 = -1;
    goto LABEL_122;
  }
  id v109 = a4;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  uint64_t v111 = -1;
  uint64_t v112 = -1;
  uint64_t v113 = -1;
  uint64_t v114 = -1;
  uint64_t v25 = -1;
  uint64_t v116 = -1;
  uint64_t v117 = 0;
  v120 = v14;
  do
  {
    v124 = (__CFString *)[v17 objectAtIndex:v21];
    uint64_t v26 = [(__CFString *)v124 characterAtIndex:0];
    if ([(NSCharacterSet *)v14 characterIsMember:v26])
    {
      int64_t v27 = v124;
      uint64_t v28 = buildTokenMapWithDictionary(v121);
      Value = CFDictionaryGetValue(v28, (const void *)[(__CFString *)v27 lowercaseString]);
      if (Value && (unsigned __int16)Value != 65)
      {
        v127[(unsigned __int16)Value - 65] = 1;
        goto LABEL_31;
      }
      if ([(__CFString *)v124 isEqual:@"GMT"])
      {
        uint64_t v33 = v21 + 1;
        uint64_t v34 = [v17 count];
        NSUInteger v14 = v120;
        if (v21 + 1 < v34
          && objc_msgSend(v119, "characterIsMember:", objc_msgSend((id)objc_msgSend(v17, "objectAtIndex:", v21 + 1), "characterAtIndex:", 0)))
        {
          uint64_t v110 = v24;
          v21 += 2;
          uint64_t v35 = [v17 count];
          v118 = (void *)MEMORY[0x1E4F1CAF0];
          v36 = objc_msgSend(@"GMT", "stringByAppendingString:", objc_msgSend(v17, "objectAtIndex:", v33));
          if (v21 >= v35)
          {
            uint64_t v117 = [v118 timeZoneWithAbbreviation:v36];
            uint64_t v21 = v33;
          }
          else
          {
            uint64_t v117 = objc_msgSend(v118, "timeZoneWithAbbreviation:", objc_msgSend(v36, "stringByAppendingString:", objc_msgSend(v17, "objectAtIndex:", v21)));
          }
          goto LABEL_86;
        }
        NSInteger v44 = (void *)MEMORY[0x1E4F1CAF0];
        v45 = @"GMT";
      }
      else
      {
        v42 = (void *)[MEMORY[0x1E4F1CAF0] abbreviationDictionary];
        uint64_t v43 = [v42 objectForKey:v124];
        NSUInteger v14 = v120;
        if (!v43) {
          goto LABEL_60;
        }
        NSInteger v44 = (void *)MEMORY[0x1E4F1CAF0];
        v45 = v124;
      }
      uint64_t v41 = [v44 timeZoneWithAbbreviation:v45];
LABEL_59:
      uint64_t v117 = v41;
      goto LABEL_60;
    }
    if (![(NSCharacterSet *)v122 characterIsMember:v26])
    {
      if (![v119 characterIsMember:v26])
      {
        [(NSScanner *)v16 scanUpToCharactersFromSet:v115 intoString:0];
        goto LABEL_60;
      }
      uint64_t v37 = [(__CFString *)v124 integerValue];
      if (v37 >= 0) {
        unint64_t v38 = v37;
      }
      else {
        unint64_t v38 = -v37;
      }
      uint64_t v39 = -3600;
      if (v37 >= 0) {
        uint64_t v39 = 3600;
      }
      uint64_t v40 = -60;
      if (v37 >= 0) {
        uint64_t v40 = 60;
      }
      uint64_t v41 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:v38 % 0x64 * v40 + v38 / 0x64 * v39];
      goto LABEL_59;
    }
    uint64_t v30 = [(__CFString *)v124 integerValue];
    uint64_t v31 = v30;
    if (v30 < 32)
    {
      if (v30 >= 24 && v116 != -1)
      {
        uint64_t v24 = v30;
        goto LABEL_60;
      }
      uint64_t v46 = v21 + 1;
      if (v21 + 1 >= v123 || v30 >= 24)
      {
        uint64_t v49 = v111;
        uint64_t v50 = v112;
        if (v111 == -1) {
          uint64_t v51 = v30;
        }
        else {
          uint64_t v51 = v111;
        }
        if (v112 == -1)
        {
          uint64_t v51 = v111;
          uint64_t v52 = v30;
        }
        else
        {
          uint64_t v52 = v112;
        }
        uint64_t v53 = v113;
        uint64_t v54 = v114;
        if (v113 == -1)
        {
          uint64_t v51 = v111;
          uint64_t v52 = v112;
          uint64_t v55 = v30;
        }
        else
        {
          uint64_t v55 = v113;
        }
        if (v114 != -1)
        {
          uint64_t v49 = v51;
          uint64_t v50 = v52;
        }
        uint64_t v111 = v49;
        uint64_t v112 = v50;
        if (v114 == -1) {
          uint64_t v54 = v30;
        }
        else {
          uint64_t v53 = v55;
        }
        uint64_t v113 = v53;
        uint64_t v114 = v54;
        goto LABEL_31;
      }
      uint64_t v110 = v24;
      v124 = (__CFString *)[v17 objectAtIndex:v21 + 1];
      uint64_t v47 = [(__CFString *)v124 characterAtIndex:0];
      if (v47 == 58)
      {
        if (v21 + 2 >= v123) {
          goto LABEL_69;
        }
        uint64_t v107 = v21 + 2;
        v124 = (__CFString *)objc_msgSend(v17, "objectAtIndex:");
        uint64_t v48 = [(__CFString *)v124 characterAtIndex:0];
        if ([(NSCharacterSet *)v122 characterIsMember:v48])
        {
          uint64_t v105 = [(__CFString *)v124 integerValue];
          if (v105 > 59) {
            goto LABEL_68;
          }
          uint64_t v46 = v21 + 3;
          if (v21 + 3 >= v123)
          {
            uint64_t v25 = v31;
            uint64_t v23 = v105;
LABEL_115:
            uint64_t v21 = v107;
LABEL_86:
            uint64_t v24 = v110;
LABEL_31:
            NSUInteger v14 = v120;
            goto LABEL_60;
          }
          v124 = (__CFString *)[v17 objectAtIndex:v21 + 3];
          uint64_t v61 = [(__CFString *)v124 characterAtIndex:0];
          uint64_t v23 = v105;
          if (v61 == 58)
          {
            if (v21 + 4 >= v123)
            {
LABEL_68:
              uint64_t v25 = v31;
LABEL_69:
              uint64_t v21 = v46;
              goto LABEL_86;
            }
            uint64_t v107 = v21 + 4;
            v124 = (__CFString *)objc_msgSend(v17, "objectAtIndex:");
            uint64_t v48 = [(__CFString *)v124 characterAtIndex:0];
            if ([(NSCharacterSet *)v122 characterIsMember:v48])
            {
              uint64_t v62 = [(__CFString *)v124 integerValue];
              uint64_t v25 = v31;
              if (v62 > 60) {
                goto LABEL_115;
              }
              uint64_t v22 = v62;
            }
            else
            {
              uint64_t v25 = v31;
              uint64_t v107 = v21 + 3;
            }
          }
          else
          {
            uint64_t v48 = v61;
            uint64_t v25 = v31;
          }
          uint64_t v31 = -1;
        }
        else
        {
          uint64_t v107 = v21 + 1;
        }
      }
      else
      {
        uint64_t v48 = v47;
        uint64_t v107 = v21;
      }
      NSUInteger v14 = v120;
      if ([(NSCharacterSet *)v120 characterIsMember:v48])
      {
        uint64_t v106 = v23;
        uint64_t v56 = v124;
        uint64_t v57 = buildTokenMapWithDictionary(v121);
        uint64_t v58 = CFDictionaryGetValue(v57, (const void *)[(__CFString *)v56 lowercaseString]);
        unsigned int v59 = (unsigned __int16)v58;
        if (!v58) {
          unsigned int v59 = 65;
        }
        uint64_t v24 = v110;
        if ((v59 & 0xFFFE) == 0x76)
        {
          *((unsigned char *)&v120 + v59 + 7) = 1;
          uint64_t v23 = v106;
          uint64_t v21 = v107 + 1;
          if (v25 == -1 && v31 != -1)
          {
            uint64_t v25 = v31;
            goto LABEL_60;
          }
        }
        else
        {
          uint64_t v23 = v106;
          uint64_t v21 = v107;
        }
      }
      else
      {
        uint64_t v21 = v107;
        uint64_t v24 = v110;
      }
      if (v31 != -1)
      {
        if (v114 == -1)
        {
          uint64_t v114 = v31;
        }
        else if (v113 == -1)
        {
          uint64_t v113 = v31;
        }
        else if (v112 == -1)
        {
          uint64_t v112 = v31;
        }
        else
        {
          uint64_t v60 = v111;
          if (v111 == -1) {
            uint64_t v60 = v31;
          }
          uint64_t v111 = v60;
        }
      }
    }
    else
    {
      uint64_t v32 = v30 + 1900;
      if ((unint64_t)v30 >= 0x64) {
        uint64_t v32 = v30;
      }
      uint64_t v116 = v32;
    }
LABEL_60:
    ++v21;
  }
  while (v21 < v123);
  *(void *)&long long v126 = v112;
  *((void *)&v126 + 1) = v111;
  *(void *)&long long v125 = v114;
  *((void *)&v125 + 1) = v113;
  if (v127[1])
  {
    uint64_t v63 = 1;
    a4 = v109;
    uint64_t v65 = v116;
    uint64_t v64 = v117;
    goto LABEL_145;
  }
  a4 = v109;
  uint64_t v65 = v116;
  uint64_t v64 = v117;
  if (v127[2])
  {
    uint64_t v63 = 2;
    goto LABEL_145;
  }
LABEL_122:
  if (v127[3])
  {
    uint64_t v63 = 3;
  }
  else if (v127[4])
  {
    uint64_t v63 = 4;
  }
  else if (v127[5])
  {
    uint64_t v63 = 5;
  }
  else if (v127[6])
  {
    uint64_t v63 = 6;
  }
  else if (v127[7])
  {
    uint64_t v63 = 7;
  }
  else if (v127[8])
  {
    uint64_t v63 = 8;
  }
  else if (v127[9])
  {
    uint64_t v63 = 9;
  }
  else if (v127[10])
  {
    uint64_t v63 = 10;
  }
  else if (v127[11])
  {
    uint64_t v63 = 11;
  }
  else if (v127[12])
  {
    uint64_t v63 = 12;
  }
  else
  {
    uint64_t v63 = 0;
  }
LABEL_145:
  if (v127[15])
  {
    uint64_t v66 = 1;
    goto LABEL_153;
  }
  if (v127[13])
  {
    uint64_t v66 = 0;
    goto LABEL_153;
  }
  if (v127[16])
  {
    uint64_t v66 = 2;
    goto LABEL_153;
  }
  if (v127[14])
  {
    uint64_t v66 = -1;
LABEL_153:
    if (!a4) {
      a4 = +[NSCalendarDate calendarDate];
    }
    int v67 = (void *)[a4 dateByAddingYears:0 months:0 days:v66 hours:0 minutes:0 seconds:0];
    uint64_t v63 = [v67 monthOfYear];
    uint64_t v24 = [v67 dayOfMonth];
    uint64_t v65 = [v67 yearOfCommonEra];
  }
  if (v127[26])
  {
    if (v127[24])
    {
      if (!a4) {
        a4 = +[NSCalendarDate calendarDate];
      }
      uint64_t v65 = [a4 yearOfCommonEra] + 1;
      v127[24] = 0;
    }
    else if (v127[25])
    {
      if (!a4) {
        a4 = +[NSCalendarDate calendarDate];
      }
      uint64_t v65 = [a4 yearOfCommonEra] - 1;
      v127[25] = 0;
    }
    goto LABEL_171;
  }
  if (!v127[27]) {
    goto LABEL_171;
  }
  if (v127[24])
  {
    v127[24] = 0;
    uint64_t v68 = 1;
    if (!a4) {
      goto LABEL_164;
    }
  }
  else
  {
    int v72 = v127[25];
    v127[25] = 0;
    if (!v72) {
      goto LABEL_171;
    }
    uint64_t v68 = -1;
    if (!a4) {
LABEL_164:
    }
      a4 = +[NSCalendarDate calendarDate];
  }
  char v69 = (void *)[a4 dateByAddingYears:0 months:v68 days:0 hours:0 minutes:0 seconds:0];
  uint64_t v63 = [v69 monthOfYear];
  if (v65 == -1) {
    uint64_t v65 = [v69 yearOfCommonEra];
  }
LABEL_171:
  if (!v24)
  {
    if (v127[17])
    {
      uint64_t v71 = 0;
    }
    else if (v127[18])
    {
      uint64_t v71 = 1;
    }
    else if (v127[19])
    {
      uint64_t v71 = 2;
    }
    else if (v127[20])
    {
      uint64_t v71 = 3;
    }
    else if (v127[21])
    {
      uint64_t v71 = 4;
    }
    else if (v127[22])
    {
      uint64_t v71 = 5;
    }
    else
    {
      if (!v127[23])
      {
        id v70 = 0;
        goto LABEL_205;
      }
      uint64_t v71 = 6;
    }
    if (v127[25])
    {
      v73 = &v127[25];
      if (!a4) {
        a4 = +[NSCalendarDate calendarDate];
      }
      uint64_t v74 = [a4 dayOfWeek];
      if (v71 >= v74) {
        uint64_t v75 = v71 - v74 - 7;
      }
      else {
        uint64_t v75 = v71 - v74;
      }
    }
    else
    {
      if (!a4) {
        a4 = +[NSCalendarDate calendarDate];
      }
      uint64_t v76 = [a4 dayOfWeek];
      if (v71 - v76 >= 1) {
        uint64_t v75 = v71 - v76;
      }
      else {
        uint64_t v75 = v71 - v76 + 7;
      }
      v73 = &v127[24];
    }
    unsigned char *v73 = 0;
    if (v75) {
      id v70 = (id)[a4 dateByAddingYears:0 months:0 days:v75 hours:0 minutes:0 seconds:0];
    }
    else {
      id v70 = a4;
    }
LABEL_205:
    if (!v127[28]) {
      goto LABEL_210;
    }
    if (v127[24])
    {
      v127[24] = 0;
      uint64_t v77 = 7;
      if (a4)
      {
LABEL_209:
        id v70 = (id)[a4 dateByAddingYears:0 months:0 days:v77 hours:0 minutes:0 seconds:0];
        goto LABEL_210;
      }
    }
    else
    {
      int v104 = v127[25];
      v127[25] = 0;
      if (!v104) {
        goto LABEL_210;
      }
      uint64_t v77 = -7;
      if (a4) {
        goto LABEL_209;
      }
    }
    a4 = +[NSCalendarDate calendarDate];
    goto LABEL_209;
  }
  id v70 = 0;
LABEL_210:
  for (uint64_t i = 0; i != 24; ++i)
  {
    if (v127[i + 29])
    {
      uint64_t v25 = i;
      uint64_t v23 = 0;
      uint64_t v22 = 0;
    }
  }
  BOOL v79 = v25 == -1;
  uint64_t v80 = 1;
  if (v25 == -1) {
    uint64_t v80 = 2;
  }
  if (v65 == -1) {
    BOOL v79 = v80;
  }
  uint64_t v81 = v63 == 0;
  if (!v24) {
    ++v81;
  }
  unint64_t v82 = v81 + v79;
  if (!(v81 + v79)) {
    goto LABEL_287;
  }
  unint64_t v83 = v125 != -1;
  uint64_t v84 = 1;
  if ((void)v125 != -1) {
    uint64_t v84 = 2;
  }
  if (*((void *)&v125 + 1) != -1) {
    unint64_t v83 = v84;
  }
  if ((void)v126 != -1) {
    ++v83;
  }
  if (*((void *)&v126 + 1) != -1) {
    ++v83;
  }
  BOOL v85 = v25 == -1 && v82 > v83;
  BOOL v86 = v85;
  unint64_t v87 = v82 - v86;
  BOOL v88 = v65 == -1 && v87 > v83;
  BOOL v89 = v88;
  unint64_t v90 = v87 - v89;
  BOOL v91 = !v63 && v90 > v83;
  char v92 = v91;
  if (!v83) {
    goto LABEL_287;
  }
  uint64_t v93 = 0;
  while (2)
  {
    uint64_t v94 = 0;
    uint64_t v95 = *((void *)&v125 + v93);
    char v96 = v25 != -1 || v86;
    if (v63) {
      char v97 = 1;
    }
    else {
      char v97 = v92;
    }
    char v98 = v65 != -1 || v89;
    while (2)
    {
      unsigned int v99 = *(unsigned __int16 *)((char *)v128 + v94);
      if (v99 <= 0x4C)
      {
        if (v99 == 68)
        {
          if (!v24)
          {
            uint64_t v24 = *((void *)&v125 + v93);
            if (v95 > 31) {
              return 0;
            }
            goto LABEL_271;
          }
        }
        else
        {
          if (v99 != 72) {
            return 0;
          }
          if ((v96 & 1) == 0)
          {
            uint64_t v25 = *((void *)&v125 + v93);
            if (v95 > 23) {
              return 0;
            }
            goto LABEL_271;
          }
        }
        goto LABEL_270;
      }
      if (v99 != 77)
      {
        if (v99 != 89) {
          return 0;
        }
        if ((v98 & 1) == 0)
        {
          if (v95 > 99)
          {
            uint64_t v65 = *((void *)&v125 + v93);
          }
          else if (dateWithNaturalLanguageString_date_locale__doExcelLittleY)
          {
            if (v95 >= 30) {
              uint64_t v100 = 1900;
            }
            else {
              uint64_t v100 = 2000;
            }
            uint64_t v65 = v100 + v95;
          }
          else
          {
            uint64_t v65 = v95 + 1900;
          }
          goto LABEL_271;
        }
        goto LABEL_270;
      }
      if (v97)
      {
LABEL_270:
        v94 += 2;
        if (v94 == 8) {
          goto LABEL_271;
        }
        continue;
      }
      break;
    }
    uint64_t v63 = *((void *)&v125 + v93);
    if (v95 > 12) {
      return 0;
    }
LABEL_271:
    if (++v93 != v83) {
      continue;
    }
    break;
  }
LABEL_287:
  if (v25 != -1)
  {
    if (v127[53])
    {
      if (v25 == 12) {
        uint64_t v101 = 0;
      }
      else {
        uint64_t v101 = v25;
      }
      if (!v70) {
        goto LABEL_307;
      }
    }
    else
    {
      if (v127[54]) {
        BOOL v102 = v25 < 12;
      }
      else {
        BOOL v102 = 0;
      }
      if (v102) {
        uint64_t v101 = v25 + 12;
      }
      else {
        uint64_t v101 = v25;
      }
      if (!v70) {
        goto LABEL_307;
      }
    }
LABEL_303:
    if (!v24 && !v63 && v65 == -1)
    {
      uint64_t v24 = [v70 dayOfMonth];
      uint64_t v63 = [v70 monthOfYear];
      uint64_t v65 = [v70 yearOfCommonEra];
    }
    goto LABEL_307;
  }
  uint64_t v101 = -1;
  if (v70) {
    goto LABEL_303;
  }
LABEL_307:
  if (!v24 && !v63 && v65 == -1 && v101 == -1) {
    return 0;
  }
  if (!v24)
  {
    if (!a4) {
      a4 = +[NSCalendarDate calendarDate];
    }
    uint64_t v24 = [a4 dayOfMonth];
  }
  if (!v63)
  {
    if (!a4) {
      a4 = +[NSCalendarDate calendarDate];
    }
    uint64_t v63 = [a4 monthOfYear];
  }
  if (v65 == -1)
  {
    if (!a4) {
      a4 = +[NSCalendarDate calendarDate];
    }
    uint64_t v65 = [a4 yearOfCommonEra];
  }
  if (v101 == -1) {
    uint64_t v103 = 12;
  }
  else {
    uint64_t v103 = v101;
  }
  if (!v64) {
    uint64_t v64 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
  }
  a4 = 0;
  if ((unint64_t)(v65 - 4001) >= 0xFFFFFFFFFFFFF060 && v63 >= 1 && v63 <= 12 && v24 >= 1 && v24 <= 31) {
    return (NSCalendarDate *)(id)[v108 dateWithYear:v65 month:v63 day:v24 hour:v103 minute:v23 second:v22 timeZone:v64];
  }
  return (NSCalendarDate *)a4;
}

- (id)replacementObjectForPortCoder:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([a3 isByref])
  {
    v6.receiver = self;
    v6.super_class = (Class)NSCalendarDate;
    return [(NSDate *)&v6 replacementObjectForPortCoder:a3];
  }
  return self;
}

@end