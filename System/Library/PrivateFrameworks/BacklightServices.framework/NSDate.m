@interface NSDate
@end

@implementation NSDate

uint64_t __46__NSDate_BacklightServices__bls_loggingString__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)bls_loggingString_dateFormatter;
  bls_loggingString_dateFormatter = (uint64_t)v0;

  v2 = (void *)bls_loggingString_dateFormatter;
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:@"en_US_POSIX"];
  [v2 setLocale:v3];

  [(id)bls_loggingString_dateFormatter setDateFormat:@"HH:mm:ss.SSS MM/dd"];
  id v4 = objc_alloc_init(MEMORY[0x1E4F28C00]);
  v5 = (void *)bls_loggingString_dateComponentsFormatter;
  bls_loggingString_dateComponentsFormatter = (uint64_t)v4;

  [(id)bls_loggingString_dateComponentsFormatter setUnitsStyle:2];
  v6 = (void *)bls_loggingString_dateComponentsFormatter;

  return [v6 setAllowedUnits:33008];
}

uint64_t __51__NSDate_BacklightServices__bls_shortLoggingString__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)bls_shortLoggingString_dateFormatter;
  bls_shortLoggingString_dateFormatter = (uint64_t)v0;

  v2 = (void *)bls_shortLoggingString_dateFormatter;
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:@"en_US_POSIX"];
  [v2 setLocale:v3];

  id v4 = (void *)bls_shortLoggingString_dateFormatter;

  return [v4 setDateFormat:@"HH:mm:ss.SSS"];
}

uint64_t __47__NSDate_BacklightServices__bls_fileNameString__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)bls_fileNameString_dateFormatter;
  bls_fileNameString_dateFormatter = (uint64_t)v0;

  v2 = (void *)bls_fileNameString_dateFormatter;
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:@"en_US_POSIX"];
  [v2 setLocale:v3];

  id v4 = (void *)bls_fileNameString_dateFormatter;

  return [v4 setDateFormat:@"yyyy-MM-dd-HHmmss"];
}

@end