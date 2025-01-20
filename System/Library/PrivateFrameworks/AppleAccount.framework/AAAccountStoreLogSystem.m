@interface AAAccountStoreLogSystem
@end

@implementation AAAccountStoreLogSystem

uint64_t ___AAAccountStoreLogSystem_block_invoke()
{
  _AAAccountStoreLogSystem_log = (uint64_t)os_log_create("com.apple.appleaccount", "accountstore");

  return MEMORY[0x1F41817F8]();
}

@end