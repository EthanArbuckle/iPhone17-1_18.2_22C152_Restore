@interface CSFGetLogSystem
@end

@implementation CSFGetLogSystem

uint64_t ___CSFGetLogSystem_block_invoke()
{
  _CSFGetLogSystem_log = (uint64_t)os_log_create("com.apple.CloudSubscriptionFeatures", "objc");
  return MEMORY[0x1F41817F8]();
}

@end