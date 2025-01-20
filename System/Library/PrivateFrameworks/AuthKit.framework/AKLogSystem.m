@interface AKLogSystem
@end

@implementation AKLogSystem

uint64_t ___AKLogSystem_block_invoke()
{
  _AKLogSystem_log = (uint64_t)os_log_create((const char *)AKLoggingSubsystem, "core");

  return MEMORY[0x1F41817F8]();
}

@end