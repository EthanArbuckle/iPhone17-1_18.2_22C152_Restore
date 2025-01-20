@interface CFBundleLoadingLogger
@end

@implementation CFBundleLoadingLogger

os_log_t ___CFBundleLoadingLogger_block_invoke()
{
  os_log_t result = os_log_create("com.apple.CFBundle", "loading");
  _CFBundleLoadingLogger__log = (uint64_t)result;
  return result;
}

@end