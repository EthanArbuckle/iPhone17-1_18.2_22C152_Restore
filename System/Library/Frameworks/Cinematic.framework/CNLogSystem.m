@interface CNLogSystem
@end

@implementation CNLogSystem

uint64_t ___CNLogSystem_block_invoke()
{
  _CNLogSystem_log = (uint64_t)os_log_create("com.apple.portrait", "cinematic");

  return MEMORY[0x270F9A758]();
}

@end