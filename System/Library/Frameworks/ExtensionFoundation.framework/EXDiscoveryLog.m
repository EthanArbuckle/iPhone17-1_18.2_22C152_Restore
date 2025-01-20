@interface EXDiscoveryLog
@end

@implementation EXDiscoveryLog

uint64_t ___EXDiscoveryLog_block_invoke()
{
  _EXDiscoveryLog_log = (uint64_t)os_log_create("com.apple.extensionkit", "discovery");

  return MEMORY[0x1F41817F8]();
}

@end