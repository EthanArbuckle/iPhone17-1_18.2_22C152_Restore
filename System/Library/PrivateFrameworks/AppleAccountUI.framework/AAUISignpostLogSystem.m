@interface AAUISignpostLogSystem
@end

@implementation AAUISignpostLogSystem

uint64_t ___AAUISignpostLogSystem_block_invoke()
{
  _AAUISignpostLogSystem_log = (uint64_t)os_log_create("com.apple.appleaccount", "ui.signpost");
  return MEMORY[0x270F9A758]();
}

@end