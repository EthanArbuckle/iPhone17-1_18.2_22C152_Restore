@interface AKTrafficLogSubsystem
@end

@implementation AKTrafficLogSubsystem

uint64_t ___AKTrafficLogSubsystem_block_invoke()
{
  _AKTrafficLogSubsystem_log = (uint64_t)os_log_create((const char *)AKLoggingSubsystem, "traffic");

  return MEMORY[0x1F41817F8]();
}

@end