@interface IPClientLog
@end

@implementation IPClientLog

uint64_t ___IPClientLog_block_invoke()
{
  _IPClientLog_log = (uint64_t)os_log_create("com.apple.installprogress", "client");

  return MEMORY[0x270F9A758]();
}

@end