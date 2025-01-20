@interface CFBundlePluginLogger
@end

@implementation CFBundlePluginLogger

os_log_t ___CFBundlePluginLogger_block_invoke()
{
  os_log_t result = os_log_create("com.apple.CFBundle", "plugin");
  _CFBundlePluginLogger__log = (uint64_t)result;
  return result;
}

@end