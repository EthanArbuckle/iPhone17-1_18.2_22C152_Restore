@interface NSDate(AuthKit)
+ (id)_dateFormatter;
+ (id)ak_dateFromString:()AuthKit;
- (id)ak_serverFriendlyString;
@end

@implementation NSDate(AuthKit)

- (id)ak_serverFriendlyString
{
  v2 = [(id)objc_opt_class() _dateFormatter];
  v3 = [v2 stringFromDate:a1];

  return v3;
}

+ (id)_dateFormatter
{
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:@"en_US_POSIX"];
  id v1 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v1 setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"];
  [v1 setLocale:v0];
  v2 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [v1 setTimeZone:v2];

  return v1;
}

+ (id)ak_dateFromString:()AuthKit
{
  id v4 = a3;
  v5 = [a1 _dateFormatter];
  v6 = [v5 dateFromString:v4];

  return v6;
}

@end