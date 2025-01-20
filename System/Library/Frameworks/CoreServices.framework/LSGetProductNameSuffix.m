@interface LSGetProductNameSuffix
@end

@implementation LSGetProductNameSuffix

CFStringRef ___LSGetProductNameSuffix_block_invoke()
{
  if (_LSGetProductName(void)::onceToken != -1) {
    dispatch_once(&_LSGetProductName(void)::onceToken, &__block_literal_global_144_0);
  }
  uint64_t v0 = _LSGetProductName(void)::_cfBundlePlatform;
  int v1 = CFEqual((CFTypeRef)_LSGetProductName(void)::_cfBundlePlatform, @"ipod");
  v2 = @"iphone";
  if (!v1) {
    v2 = (__CFString *)v0;
  }
  CFStringRef result = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], 0, @"~%@", v2);
  _LSGetProductNameSuffix::suffix = (uint64_t)result;
  return result;
}

@end