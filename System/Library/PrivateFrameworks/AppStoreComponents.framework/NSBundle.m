@interface NSBundle
@end

@implementation NSBundle

void __51__NSBundle_AppStoreComponents__asc_frameworkBundle__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppStoreComponents"];
  v1 = (void *)asc_frameworkBundle_appStoreComponents;
  asc_frameworkBundle_appStoreComponents = v0;

  if (!asc_frameworkBundle_appStoreComponents)
  {
    id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Could not find AppStoreComponents framework bundle" userInfo:0];
    objc_exception_throw(v2);
  }
}

@end