@interface NSDateFormatter(AppleMediaServices)
+ (id)_ams_serverFriendlyFormatter;
+ (id)_ams_serverFriendlyLocalTimeZoneFormatter;
+ (id)ams_serverFriendlyFormatter;
+ (id)ams_serverFriendlyLocalTimeZoneFormatter;
@end

@implementation NSDateFormatter(AppleMediaServices)

+ (id)ams_serverFriendlyFormatter
{
  if (_MergedGlobals_160 != -1) {
    dispatch_once(&_MergedGlobals_160, &__block_literal_global_146);
  }
  v0 = (void *)qword_1EB38E148;
  return v0;
}

+ (id)ams_serverFriendlyLocalTimeZoneFormatter
{
  if (qword_1EB38E150 != -1) {
    dispatch_once(&qword_1EB38E150, &__block_literal_global_2);
  }
  v0 = (void *)qword_1EB38E158;
  return v0;
}

+ (id)_ams_serverFriendlyFormatter
{
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:@"en_US_POSIX"];
  id v1 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v1 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
  [v1 setLocale:v0];
  v2 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [v1 setTimeZone:v2];

  return v1;
}

+ (id)_ams_serverFriendlyLocalTimeZoneFormatter
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v0 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
  return v0;
}

@end