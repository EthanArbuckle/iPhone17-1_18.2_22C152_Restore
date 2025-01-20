@interface ISPrepareISIconSignpostLog
@end

@implementation ISPrepareISIconSignpostLog

uint64_t ___ISPrepareISIconSignpostLog_block_invoke()
{
  _ISPrepareISIconSignpostLog_log = (uint64_t)os_log_create("com.apple.iconservices", "PrepareISIcon");
  return MEMORY[0x1F41817F8]();
}

@end