@interface NSDate(UserNotifications)
- (id)un_logString;
@end

@implementation NSDate(UserNotifications)

- (id)un_logString
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v2 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
  v3 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v2 setLocale:v3];

  v4 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  [v2 setTimeZone:v4];

  v5 = [v2 stringFromDate:a1];

  return v5;
}

@end