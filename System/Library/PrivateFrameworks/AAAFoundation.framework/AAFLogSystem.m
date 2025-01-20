@interface AAFLogSystem
@end

@implementation AAFLogSystem

uint64_t ___AAFLogSystem_block_invoke()
{
  _AAFLogSystem_log = (uint64_t)os_log_create("com.apple.aaafoundation", "log");
  return MEMORY[0x1F41817F8]();
}

@end