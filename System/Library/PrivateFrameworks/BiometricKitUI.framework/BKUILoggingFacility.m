@interface BKUILoggingFacility
@end

@implementation BKUILoggingFacility

uint64_t ___BKUILoggingFacility_block_invoke()
{
  _BKUILoggingFacility_oslog = (uint64_t)os_log_create("com.apple.biometrickitui", "log");

  return MEMORY[0x1F41817F8]();
}

@end