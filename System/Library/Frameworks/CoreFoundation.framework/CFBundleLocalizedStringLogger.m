@interface CFBundleLocalizedStringLogger
@end

@implementation CFBundleLocalizedStringLogger

os_log_t ___CFBundleLocalizedStringLogger_block_invoke()
{
  os_log_t result = os_log_create("com.apple.CFBundle", "strings");
  _CFBundleLocalizedStringLogger__log = (uint64_t)result;
  return result;
}

@end