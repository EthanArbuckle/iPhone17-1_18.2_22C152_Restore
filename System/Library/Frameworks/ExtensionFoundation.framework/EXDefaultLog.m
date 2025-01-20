@interface EXDefaultLog
@end

@implementation EXDefaultLog

uint64_t ___EXDefaultLog_block_invoke()
{
  _EXDefaultLog_log = (uint64_t)os_log_create("com.apple.extensionkit", "default");

  return MEMORY[0x1F41817F8]();
}

@end