@interface MCCLogSystem
@end

@implementation MCCLogSystem

uint64_t ___MCCLogSystem_block_invoke()
{
  _MCCLogSystem_log = (uint64_t)os_log_create("com.apple.icloudMCCKit", "core");

  return MEMORY[0x270F9A758]();
}

@end