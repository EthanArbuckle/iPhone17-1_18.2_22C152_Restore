@interface AKLogHme
@end

@implementation AKLogHme

uint64_t ___AKLogHme_block_invoke()
{
  _AKLogHme_log = (uint64_t)os_log_create((const char *)AKLoggingSubsystem, "hme");

  return MEMORY[0x1F41817F8]();
}

@end