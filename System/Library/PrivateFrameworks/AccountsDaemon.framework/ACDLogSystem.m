@interface ACDLogSystem
@end

@implementation ACDLogSystem

uint64_t ___ACDLogSystem_block_invoke()
{
  _ACDLogSystem_log = (uint64_t)os_log_create("com.apple.accounts", "daemon");

  return MEMORY[0x270F9A758]();
}

@end