@interface ANLogSystem
@end

@implementation ANLogSystem

uint64_t ___ANLogSystem_block_invoke()
{
  _ANLogSystem_log = (uint64_t)os_log_create("com.apple.and", "core");
  return MEMORY[0x270F9A758]();
}

@end