@interface MTLoggingPlugin
@end

@implementation MTLoggingPlugin

void __MTLoggingPlugin_block_invoke(id a1)
{
  MTLoggingPlugin___logObj = (uint64_t)os_log_create("com.apple.Multitouch", "Plugin");
}

@end