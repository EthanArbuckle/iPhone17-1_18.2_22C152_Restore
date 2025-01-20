@interface DMPluginSignpostLog
@end

@implementation DMPluginSignpostLog

uint64_t ___DMPluginSignpostLog_block_invoke()
{
  _DMPluginSignpostLog_log = (uint64_t)os_log_create("com.apple.migration", "pluginSignpost");

  return MEMORY[0x1F41817F8]();
}

@end