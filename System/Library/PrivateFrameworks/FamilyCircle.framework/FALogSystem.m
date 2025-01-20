@interface FALogSystem
@end

@implementation FALogSystem

uint64_t ___FALogSystem_block_invoke()
{
  _FALogSystem_log = (uint64_t)os_log_create("com.apple.family", "familycircle");
  return MEMORY[0x1F41817F8]();
}

@end