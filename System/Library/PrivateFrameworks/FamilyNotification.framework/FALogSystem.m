@interface FALogSystem
@end

@implementation FALogSystem

uint64_t ___FALogSystem_block_invoke()
{
  _FALogSystem_log = (uint64_t)os_log_create("com.apple.family", "familyrequest");
  return MEMORY[0x270F9A758]();
}

@end