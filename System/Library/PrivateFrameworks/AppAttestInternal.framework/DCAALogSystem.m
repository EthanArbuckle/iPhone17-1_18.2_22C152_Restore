@interface DCAALogSystem
@end

@implementation DCAALogSystem

uint64_t ___DCAALogSystem_block_invoke()
{
  _DCAALogSystem_log = (uint64_t)os_log_create("com.apple.devicecheck", "attestation");
  return MEMORY[0x270F9A758]();
}

@end