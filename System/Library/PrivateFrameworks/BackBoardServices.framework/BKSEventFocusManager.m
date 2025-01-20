@interface BKSEventFocusManager
+ (id)sharedInstance;
@end

@implementation BKSEventFocusManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_11119 != -1) {
    dispatch_once(&sharedInstance_onceToken_11119, &__block_literal_global_11120);
  }
  v2 = (void *)sharedInstance___shared_11121;
  return v2;
}

uint64_t __38__BKSEventFocusManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(BKSEventFocusManager);
  uint64_t v1 = sharedInstance___shared_11121;
  sharedInstance___shared_11121 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end