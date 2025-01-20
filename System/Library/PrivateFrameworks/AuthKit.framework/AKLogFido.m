@interface AKLogFido
@end

@implementation AKLogFido

uint64_t ___AKLogFido_block_invoke()
{
  _AKLogFido_log = (uint64_t)os_log_create((const char *)AKLoggingSubsystem, "fido");

  return MEMORY[0x1F41817F8]();
}

@end