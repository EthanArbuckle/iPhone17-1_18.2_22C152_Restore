@interface SGBannerUtility
+ (BOOL)supportsWalletPassFeature;
+ (id)dateForUTCDate:(id)a3;
@end

@implementation SGBannerUtility

+ (BOOL)supportsWalletPassFeature
{
  return 0;
}

+ (id)dateForUTCDate:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1C9A8];
  id v4 = a3;
  id v5 = [v3 alloc];
  v6 = (void *)[v5 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  v7 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [v6 setTimeZone:v7];

  v8 = [v6 components:1048828 fromDate:v4];

  v9 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v10 = [v9 timeZone];
  [v8 setTimeZone:v10];

  v11 = [v6 dateFromComponents:v8];

  return v11;
}

@end