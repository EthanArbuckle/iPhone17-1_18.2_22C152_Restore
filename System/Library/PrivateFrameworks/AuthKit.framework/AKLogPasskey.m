@interface AKLogPasskey
@end

@implementation AKLogPasskey

uint64_t ___AKLogPasskey_block_invoke()
{
  _AKLogPasskey_log = (uint64_t)os_log_create((const char *)AKLoggingSubsystem, "passkey");

  return MEMORY[0x1F41817F8]();
}

@end