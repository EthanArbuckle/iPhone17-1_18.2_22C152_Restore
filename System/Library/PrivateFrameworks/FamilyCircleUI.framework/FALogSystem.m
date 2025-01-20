@interface FALogSystem
@end

@implementation FALogSystem

void ___FALogSystem_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.family", "familycircle");
  v1 = (void *)_FALogSystem_log;
  _FALogSystem_log = (uint64_t)v0;
}

@end