@interface LSApplicationExtensionRecord(IconServicesAdditions)
- (uint64_t)_IS_isMessagesExtension;
- (uint64_t)_is_canProvideIconResources;
@end

@implementation LSApplicationExtensionRecord(IconServicesAdditions)

- (uint64_t)_is_canProvideIconResources
{
  v2 = [a1 extensionPointRecord];
  int v3 = objc_msgSend(v2, "_IS_extensionsCanProvideIcon");

  if (v3)
  {
    v4 = [a1 iconDictionary];
    uint64_t v5 = [v4 count];

    if (v5) {
      return 1;
    }
  }
  v7 = [a1 containingBundleRecord];
  if (v7)
  {
    v8 = [a1 extensionPointRecord];
    uint64_t v6 = objc_msgSend(v8, "_IS_extensionsShouldFallbackToContainerIcon") ^ 1;
  }
  else
  {
    uint64_t v6 = 1;
  }

  return v6;
}

- (uint64_t)_IS_isMessagesExtension
{
  v1 = [a1 extensionPointRecord];
  v2 = [v1 identifier];
  uint64_t v3 = [v2 hasPrefix:@"com.apple.message-payload-provider"];

  return v3;
}

@end