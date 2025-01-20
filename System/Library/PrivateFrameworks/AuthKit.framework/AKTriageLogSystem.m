@interface AKTriageLogSystem
@end

@implementation AKTriageLogSystem

uint64_t ___AKTriageLogSystem_block_invoke()
{
  _AKTriageLogSystem_log = (uint64_t)os_log_create((const char *)AKLoggingSubsystem, "aaa-itriage");

  return MEMORY[0x1F41817F8]();
}

@end