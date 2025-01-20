@interface NSUserDefaults(SafariServiceExtras)
+ (uint64_t)_sf_safariDefaults;
+ (uint64_t)_sf_safariSharedDefaults;
@end

@implementation NSUserDefaults(SafariServiceExtras)

+ (uint64_t)_sf_safariDefaults
{
  return objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
}

+ (uint64_t)_sf_safariSharedDefaults
{
  return objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserSharedDefaults");
}

@end