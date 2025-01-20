@interface ISDefaultLog
@end

@implementation ISDefaultLog

uint64_t ___ISDefaultLog_block_invoke()
{
  _ISDefaultLog_log = (uint64_t)os_log_create("com.apple.iconservices", "default");
  return MEMORY[0x1F41817F8]();
}

@end