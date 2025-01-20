@interface DKLogSystem
@end

@implementation DKLogSystem

uint64_t ___DKLogSystem_block_invoke()
{
  _DKLogSystem_log = (uint64_t)os_log_create("com.apple.disembarkui", "general");
  return MEMORY[0x270F9A758]();
}

@end