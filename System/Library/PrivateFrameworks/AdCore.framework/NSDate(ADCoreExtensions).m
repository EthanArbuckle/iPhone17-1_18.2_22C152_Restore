@interface NSDate(ADCoreExtensions)
+ (id)AD_dateFromServerTime:()ADCoreExtensions;
+ (uint64_t)AD_maxServerTime;
+ (uint64_t)AD_minServerTime;
- (id)AD_doubleDateTimeAsString;
- (id)AD_localDateTimeAsString;
- (id)AD_universalDateTimeAsString;
- (uint64_t)AD_toServerTime;
- (uint64_t)AD_toSinceReferenceTime;
@end

@implementation NSDate(ADCoreExtensions)

- (uint64_t)AD_toServerTime
{
  [a1 timeIntervalSince1970];
  return (int)v1;
}

+ (uint64_t)AD_maxServerTime
{
  return 0x7FFFFFFFLL;
}

+ (id)AD_dateFromServerTime:()ADCoreExtensions
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSince1970:(double)a3];
  return v3;
}

+ (uint64_t)AD_minServerTime
{
  return 0x80000000;
}

- (uint64_t)AD_toSinceReferenceTime
{
  [a1 timeIntervalSinceReferenceDate];
  return (int)v1;
}

- (id)AD_localDateTimeAsString
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v3 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
  [v2 setTimeZone:v3];

  [v2 setDateFormat:@"YYYY-MM-dd HH:mm:ssZ"];
  v4 = [v2 stringFromDate:a1];

  return v4;
}

- (id)AD_universalDateTimeAsString
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v3 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
  [v2 setTimeZone:v3];

  [v2 setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
  v4 = [v2 stringFromDate:a1];

  return v4;
}

- (id)AD_doubleDateTimeAsString
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v3 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
  [v2 setTimeZone:v3];

  [v2 setDateFormat:@"YYYY-MM-dd HH:mm:ssZ"];
  v4 = [v2 stringFromDate:a1];
  v5 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
  [v2 setTimeZone:v5];

  [v2 setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
  v6 = [v2 stringFromDate:a1];
  v7 = (void *)[[NSString alloc] initWithFormat:@"%@ (%@ Z)", v4, v6];

  return v7;
}

@end