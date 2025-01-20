@interface AKLogSiwa
@end

@implementation AKLogSiwa

uint64_t ___AKLogSiwa_block_invoke()
{
  _AKLogSiwa_log = (uint64_t)os_log_create((const char *)AKLoggingSubsystem, "siwa");

  return MEMORY[0x1F41817F8]();
}

@end