@interface IPServerLog
@end

@implementation IPServerLog

uint64_t ___IPServerLog_block_invoke()
{
  _IPServerLog_log = (uint64_t)os_log_create("com.apple.installprogress", "server");

  return MEMORY[0x270F9A758]();
}

@end