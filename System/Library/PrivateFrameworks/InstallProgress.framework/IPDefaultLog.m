@interface IPDefaultLog
@end

@implementation IPDefaultLog

uint64_t ___IPDefaultLog_block_invoke()
{
  _IPDefaultLog_log = (uint64_t)os_log_create("com.apple.installprogress", "default");

  return MEMORY[0x270F9A758]();
}

@end