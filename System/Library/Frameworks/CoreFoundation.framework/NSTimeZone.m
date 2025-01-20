@interface NSTimeZone
+ (BOOL)supportsSecureCoding;
+ (NSArray)knownTimeZoneNames;
+ (NSDictionary)abbreviationDictionary;
+ (NSString)timeZoneDataVersion;
+ (NSTimeZone)allocWithZone:(_NSZone *)a3;
+ (NSTimeZone)defaultTimeZone;
+ (NSTimeZone)localTimeZone;
+ (NSTimeZone)systemTimeZone;
+ (NSTimeZone)timeZoneForSecondsFromGMT:(NSInteger)seconds;
+ (NSTimeZone)timeZoneWithAbbreviation:(NSString *)abbreviation;
+ (NSTimeZone)timeZoneWithName:(NSString *)tzName;
+ (NSTimeZone)timeZoneWithName:(NSString *)tzName data:(NSData *)aData;
+ (void)resetSystemTimeZone;
+ (void)setAbbreviationDictionary:(NSDictionary *)abbreviationDictionary;
+ (void)setDefaultTimeZone:(NSTimeZone *)defaultTimeZone;
- (BOOL)isDaylightSavingTime;
- (BOOL)isDaylightSavingTimeForDate:(NSDate *)aDate;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTimeZone:(NSTimeZone *)aTimeZone;
- (BOOL)isNSTimeZone__;
- (NSData)data;
- (NSDate)nextDaylightSavingTimeTransition;
- (NSDate)nextDaylightSavingTimeTransitionAfterDate:(NSDate *)aDate;
- (NSInteger)secondsFromGMT;
- (NSInteger)secondsFromGMTForDate:(NSDate *)aDate;
- (NSString)abbreviation;
- (NSString)abbreviationForDate:(NSDate *)aDate;
- (NSString)description;
- (NSString)localizedName:(NSTimeZoneNameStyle)style locale:(NSLocale *)locale;
- (NSString)name;
- (NSTimeInterval)daylightSavingTimeOffset;
- (NSTimeInterval)daylightSavingTimeOffsetForDate:(NSDate *)aDate;
- (NSTimeZone)initWithCoder:(id)a3;
- (NSTimeZone)initWithName:(NSString *)tzName;
- (NSTimeZone)initWithName:(NSString *)tzName data:(NSData *)aData;
- (unint64_t)hash;
@end

@implementation NSTimeZone

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v5) = 1;
  }
  else if (a3)
  {
    int v5 = _NSIsNSTimeZone((uint64_t)a3);
    if (v5)
    {
      LOBYTE(v5) = [(NSTimeZone *)self isEqualToTimeZone:a3];
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)isNSTimeZone__
{
  return 1;
}

- (unint64_t)hash
{
  v2 = [(NSTimeZone *)self name];

  return CFHash(v2);
}

- (BOOL)isEqualToTimeZone:(NSTimeZone *)aTimeZone
{
  if (!aTimeZone) {
    return 0;
  }
  if (aTimeZone == self) {
    return 1;
  }
  v4 = [(NSTimeZone *)self name];
  int v5 = [(NSTimeZone *)aTimeZone name];
  BOOL result = 0;
  if (v4)
  {
    if (v5) {
      return CFEqual(v4, v5) != 0;
    }
  }
  return result;
}

- (NSString)description
{
  v3 = [(NSTimeZone *)self name];
  v4 = [(NSTimeZone *)self abbreviation];
  NSInteger v5 = [(NSTimeZone *)self secondsFromGMT];
  BOOL v6 = [(NSTimeZone *)self isDaylightSavingTime];
  v7 = "";
  if (v6) {
    v7 = " (Daylight)";
  }
  CFStringRef v8 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%@ (%@) offset %ld%s", v3, v4, v5, v7);

  return (NSString *)_CFAutoreleasePoolAddObject(0, (uint64_t)v8);
}

+ (NSTimeZone)timeZoneWithName:(NSString *)tzName
{
  v3 = (void *)[objc_alloc((Class)a1) initWithName:tzName];

  return (NSTimeZone *)v3;
}

+ (NSTimeZone)allocWithZone:(_NSZone *)a3
{
  uint64_t v5 = *(void *)off_1ECE0A5B0;
  if (NSTimeZone == a1) {
    return (NSTimeZone *)&___immutablePlaceholderTimeZone;
  }
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSTimeZone;
  return (NSTimeZone *)objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
}

+ (NSTimeZone)defaultTimeZone
{
  return (NSTimeZone *)+[NSTimeZone _default];
}

+ (NSTimeZone)timeZoneForSecondsFromGMT:(NSInteger)seconds
{
  return (NSTimeZone *)+[NSTimeZone _timeZoneWithSecondsFromGMT:seconds];
}

+ (NSTimeZone)localTimeZone
{
  v2 = (NSTimeZone *)+[NSTimeZone _autoupdating];
  if (_CFAppVersionCheckLessThan(@"com.ea.simpsonssocial.inc2", -1, 4.7)) {
    v3 = v2;
  }
  return v2;
}

+ (NSTimeZone)systemTimeZone
{
  return (NSTimeZone *)+[NSTimeZone _current];
}

+ (void)setDefaultTimeZone:(NSTimeZone *)defaultTimeZone
{
}

+ (void)resetSystemTimeZone
{
}

+ (NSTimeZone)timeZoneWithAbbreviation:(NSString *)abbreviation
{
  if (abbreviation) {
    return (NSTimeZone *)+[NSTimeZone _timeZoneWithAbbreviation:](NSTimeZone, "_timeZoneWithAbbreviation:");
  }
  else {
    return 0;
  }
}

- (NSTimeInterval)daylightSavingTimeOffsetForDate:(NSDate *)aDate
{
  return 0.0;
}

- (NSDate)nextDaylightSavingTimeTransitionAfterDate:(NSDate *)aDate
{
  return 0;
}

+ (NSArray)knownTimeZoneNames
{
  return (NSArray *)+[NSTimeZone _knownTimeZoneIdentifiers];
}

+ (NSDictionary)abbreviationDictionary
{
  return (NSDictionary *)+[NSTimeZone _abbreviationDictionary];
}

+ (void)setAbbreviationDictionary:(NSDictionary *)abbreviationDictionary
{
}

+ (NSString)timeZoneDataVersion
{
  return (NSString *)+[NSTimeZone _timeZoneDataVersion];
}

- (NSInteger)secondsFromGMT
{
  v3 = +[NSDate date];

  return [(NSTimeZone *)self secondsFromGMTForDate:v3];
}

- (NSString)abbreviation
{
  v3 = +[NSDate date];

  return [(NSTimeZone *)self abbreviationForDate:v3];
}

- (BOOL)isDaylightSavingTime
{
  v3 = +[NSDate date];

  return [(NSTimeZone *)self isDaylightSavingTimeForDate:v3];
}

- (NSTimeInterval)daylightSavingTimeOffset
{
  v3 = +[NSDate date];

  [(NSTimeZone *)self daylightSavingTimeOffsetForDate:v3];
  return result;
}

- (NSDate)nextDaylightSavingTimeTransition
{
  v3 = +[NSDate date];

  return [(NSTimeZone *)self nextDaylightSavingTimeTransitionAfterDate:v3];
}

- (NSString)localizedName:(NSTimeZoneNameStyle)style locale:(NSLocale *)locale
{
  return 0;
}

+ (NSTimeZone)timeZoneWithName:(NSString *)tzName data:(NSData *)aData
{
  objc_super v4 = (void *)[objc_alloc((Class)a1) initWithName:tzName data:aData];

  return (NSTimeZone *)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSTimeZone)initWithCoder:(id)a3
{
  return 0;
}

- (NSString)name
{
  OUTLINED_FUNCTION_1_10();
  v2 = __CFLookUpClass("NSTimeZone");
  OUTLINED_FUNCTION_0_16(v2);
}

- (NSData)data
{
  OUTLINED_FUNCTION_1_10();
  v2 = __CFLookUpClass("NSTimeZone");
  OUTLINED_FUNCTION_0_16(v2);
}

- (NSInteger)secondsFromGMTForDate:(NSDate *)aDate
{
  OUTLINED_FUNCTION_1_10();
  v3 = __CFLookUpClass("NSTimeZone");
  OUTLINED_FUNCTION_0_16(v3);
}

- (NSString)abbreviationForDate:(NSDate *)aDate
{
  OUTLINED_FUNCTION_1_10();
  v3 = __CFLookUpClass("NSTimeZone");
  OUTLINED_FUNCTION_0_16(v3);
}

- (BOOL)isDaylightSavingTimeForDate:(NSDate *)aDate
{
  OUTLINED_FUNCTION_1_10();
  v3 = __CFLookUpClass("NSTimeZone");
  OUTLINED_FUNCTION_0_16(v3);
}

- (NSTimeZone)initWithName:(NSString *)tzName data:(NSData *)aData
{
  OUTLINED_FUNCTION_1_10();
  objc_super v4 = __CFLookUpClass("NSTimeZone");
  OUTLINED_FUNCTION_0_16(v4);
}

- (NSTimeZone)initWithName:(NSString *)tzName
{
  OUTLINED_FUNCTION_1_10();
  v3 = __CFLookUpClass("NSTimeZone");
  OUTLINED_FUNCTION_0_16(v3);
}

@end