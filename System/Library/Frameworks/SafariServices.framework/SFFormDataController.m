@interface SFFormDataController
@end

@implementation SFFormDataController

void __41___SFFormDataController_sharedController__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 32)) initWithAggressiveKeychainCaching:0];
  v2 = (void *)sharedController_sharedInstance;
  sharedController_sharedInstance = v1;
}

@end