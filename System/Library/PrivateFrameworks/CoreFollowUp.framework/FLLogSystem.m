@interface FLLogSystem
@end

@implementation FLLogSystem

uint64_t ___FLLogSystem_block_invoke()
{
  _FLLogSystem_log = (uint64_t)os_log_create("com.apple.followup", "core");

  return MEMORY[0x1F41817F8]();
}

@end