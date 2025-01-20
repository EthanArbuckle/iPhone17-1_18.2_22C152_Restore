@interface AKLogUserInteraction
@end

@implementation AKLogUserInteraction

uint64_t ___AKLogUserInteraction_block_invoke()
{
  _AKLogUserInteraction_log = (uint64_t)os_log_create((const char *)AKLoggingSubsystem, "userInteraction");

  return MEMORY[0x1F41817F8]();
}

@end