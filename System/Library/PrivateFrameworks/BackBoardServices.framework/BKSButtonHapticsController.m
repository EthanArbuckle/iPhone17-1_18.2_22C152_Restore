@interface BKSButtonHapticsController
+ (id)sharedInstance;
- (void)applyDefinitions:(id)a3;
@end

@implementation BKSButtonHapticsController

- (void)applyDefinitions:(id)a3
{
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_5114 != -1) {
    dispatch_once(&sharedInstance_onceToken_5114, &__block_literal_global_5115);
  }
  v2 = (void *)sharedInstance_controller_5116;
  return v2;
}

uint64_t __44__BKSButtonHapticsController_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(BKSButtonHapticsController);
  uint64_t v1 = sharedInstance_controller_5116;
  sharedInstance_controller_5116 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end