@interface LSPlugInKitProxy(IconServicesAdditions)
- (id)__IS_iconDataForVariant:()IconServicesAdditions withOptions:;
- (uint64_t)__IS_canProvideIcon;
- (uint64_t)__IS_isMessagesApp;
- (uint64_t)__IS_isWatchApp;
@end

@implementation LSPlugInKitProxy(IconServicesAdditions)

- (uint64_t)__IS_canProvideIcon
{
  if (__IS_canProvideIcon_onceToken != -1) {
    dispatch_once(&__IS_canProvideIcon_onceToken, &__block_literal_global_28);
  }
  uint64_t v2 = __IS_canProvideIcon_extensionPointsWithIcons;
  v3 = [a1 protocol];
  LOBYTE(v2) = [(id)v2 containsObject:v3];

  if (v2) {
    return 1;
  }
  v4 = [a1 containingBundle];
  v5 = [v4 bundleIdentifier];
  char v6 = [v5 isEqualToString:@"com.apple.share"];

  if (v6) {
    return 1;
  }
  v8 = [a1 containingBundle];
  BOOL v7 = v8 == 0;

  return v7;
}

- (uint64_t)__IS_isWatchApp
{
  if (__IS_isWatchApp_onceToken != -1) {
    dispatch_once(&__IS_isWatchApp_onceToken, &__block_literal_global_16);
  }
  uint64_t v2 = (void *)__IS_isWatchApp_extensionPointsWithIcons;
  v3 = [a1 protocol];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (uint64_t)__IS_isMessagesApp
{
  if (__IS_isMessagesApp_onceToken != -1) {
    dispatch_once(&__IS_isMessagesApp_onceToken, &__block_literal_global_18);
  }
  uint64_t v2 = (void *)__IS_isMessagesApp_extensionPointsWithIcons;
  v3 = [a1 protocol];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (id)__IS_iconDataForVariant:()IconServicesAdditions withOptions:
{
  if ((objc_msgSend(a1, "__IS_canProvideIcon") & 1) != 0
    || ([a1 containingBundle],
        BOOL v7 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "__IS_iconDataForVariant:withOptions:", a3, a4),
        v8 = objc_claimAutoreleasedReturnValue(),
        v7,
        !v8))
  {
    v10.receiver = a1;
    v10.super_class = (Class)&off_1F065B838;
    v8 = objc_msgSendSuper2(&v10, sel___IS_iconDataForVariant_withOptions_, a3, a4);
  }
  return v8;
}

@end