@interface CFBundleGetProductNameSuffix
@end

@implementation CFBundleGetProductNameSuffix

CFStringRef ___CFBundleGetProductNameSuffix_block_invoke()
{
  if (_CFGetProductName_onceToken != -1) {
    dispatch_once(&_CFGetProductName_onceToken, &__block_literal_global_46);
  }
  uint64_t v0 = _CFGetProductName__cfBundlePlatform;
  int v1 = CFEqual((CFTypeRef)_CFGetProductName__cfBundlePlatform, @"ipod");
  v2 = @"iphone";
  if (!v1) {
    v2 = (__CFString *)v0;
  }
  CFStringRef result = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"~%@", v2);
  _CFBundleGetProductNameSuffix__cfBundlePlatformSuffix = (uint64_t)result;
  return result;
}

@end