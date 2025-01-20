@interface NSDate(SGDateUtils)
- (id)sg_descriptionForMimeHeaders;
@end

@implementation NSDate(SGDateUtils)

- (id)sg_descriptionForMimeHeaders
{
  v2 = objc_opt_new();
  [v2 setDateFormat:@"EEE, d MMM yyyy HH:mm:ss ZZ"];
  v3 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v2 setLocale:v3];

  v4 = [v2 stringFromDate:a1];

  return v4;
}

@end