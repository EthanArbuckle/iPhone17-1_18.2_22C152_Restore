@interface DCLogSystem
@end

@implementation DCLogSystem

uint64_t ___DCLogSystem_block_invoke()
{
  _DCLogSystem_log = (uint64_t)os_log_create("com.apple.devicecheck", "core");

  return MEMORY[0x270F9A758]();
}

@end