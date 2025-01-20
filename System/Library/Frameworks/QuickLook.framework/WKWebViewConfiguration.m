@interface WKWebViewConfiguration
@end

@implementation WKWebViewConfiguration

uint64_t __75__WKWebViewConfiguration_QLUtilities___sharedDataStoreForBundleIdentifier___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v1 = _sharedDataStoreForBundleIdentifier__sharedWebKitDataStoreByBundleIdentifier;
  _sharedDataStoreForBundleIdentifier__sharedWebKitDataStoreByBundleIdentifier = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

@end