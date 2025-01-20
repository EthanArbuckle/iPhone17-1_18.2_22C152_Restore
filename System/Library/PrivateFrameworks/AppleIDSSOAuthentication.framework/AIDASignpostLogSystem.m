@interface AIDASignpostLogSystem
@end

@implementation AIDASignpostLogSystem

uint64_t ___AIDASignpostLogSystem_block_invoke()
{
  _AIDASignpostLogSystem_log = (uint64_t)os_log_create("com.apple.appleidauthentication", "signpost");
  return MEMORY[0x1F41817F8]();
}

@end