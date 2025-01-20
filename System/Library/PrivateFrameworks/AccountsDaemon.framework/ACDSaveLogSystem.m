@interface ACDSaveLogSystem
@end

@implementation ACDSaveLogSystem

uint64_t ___ACDSaveLogSystem_block_invoke()
{
  _ACDSaveLogSystem_log = (uint64_t)os_log_create("com.apple.accounts", "save");

  return MEMORY[0x270F9A758]();
}

@end