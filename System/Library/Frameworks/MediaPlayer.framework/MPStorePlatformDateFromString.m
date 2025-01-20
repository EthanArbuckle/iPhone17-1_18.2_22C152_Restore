@interface MPStorePlatformDateFromString
@end

@implementation MPStorePlatformDateFromString

void ___MPStorePlatformDateFromString_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)_MPStorePlatformDateFromString_storePlatformReleaseDateFormatter;
  _MPStorePlatformDateFromString_storePlatformReleaseDateFormatter = (uint64_t)v0;

  id v2 = (id)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:@"en_US_POSIX"];
  [(id)_MPStorePlatformDateFromString_storePlatformReleaseDateFormatter setLocale:v2];
  [(id)_MPStorePlatformDateFromString_storePlatformReleaseDateFormatter setDateFormat:@"YYYY-MM-dd"];
}

@end