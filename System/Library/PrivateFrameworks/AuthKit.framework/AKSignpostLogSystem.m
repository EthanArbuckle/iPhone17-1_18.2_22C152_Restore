@interface AKSignpostLogSystem
@end

@implementation AKSignpostLogSystem

uint64_t ___AKSignpostLogSystem_block_invoke()
{
  _AKSignpostLogSystem_log = (uint64_t)os_log_create((const char *)AKLoggingSubsystem, "signpost");

  return MEMORY[0x1F41817F8]();
}

@end