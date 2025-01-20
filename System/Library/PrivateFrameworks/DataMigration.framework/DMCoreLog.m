@interface DMCoreLog
@end

@implementation DMCoreLog

uint64_t ___DMCoreLog_block_invoke()
{
  _DMCoreLog_log = (uint64_t)os_log_create("com.apple.migration", "core");

  return MEMORY[0x1F41817F8]();
}

@end