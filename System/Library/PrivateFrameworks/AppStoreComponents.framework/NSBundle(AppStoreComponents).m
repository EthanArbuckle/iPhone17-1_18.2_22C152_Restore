@interface NSBundle(AppStoreComponents)
+ (__CFString)asc_localizedStringKeyPlatformSuffix;
+ (id)asc_frameworkBundle;
+ (uint64_t)asc_realMainBundle;
@end

@implementation NSBundle(AppStoreComponents)

+ (uint64_t)asc_realMainBundle
{
  return [MEMORY[0x1E4F28B50] mainBundle];
}

+ (id)asc_frameworkBundle
{
  if (asc_frameworkBundle_onceToken[0] != -1) {
    dispatch_once(asc_frameworkBundle_onceToken, &__block_literal_global_33);
  }
  v0 = (void *)asc_frameworkBundle_appStoreComponents;

  return v0;
}

+ (__CFString)asc_localizedStringKeyPlatformSuffix
{
  return @"_IOS";
}

@end