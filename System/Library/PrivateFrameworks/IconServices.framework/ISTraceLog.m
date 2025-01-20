@interface ISTraceLog
@end

@implementation ISTraceLog

uint64_t ___ISTraceLog_block_invoke()
{
  _ISTraceLog_log = (uint64_t)os_log_create("com.apple.iconservices", "trace");
  return MEMORY[0x1F41817F8]();
}

@end