@interface CFBundleResourceLogger
@end

@implementation CFBundleResourceLogger

os_log_t ___CFBundleResourceLogger_block_invoke()
{
  os_log_t result = os_log_create("com.apple.CFBundle", "resources");
  _CFBundleResourceLogger__log = (uint64_t)result;
  return result;
}

@end