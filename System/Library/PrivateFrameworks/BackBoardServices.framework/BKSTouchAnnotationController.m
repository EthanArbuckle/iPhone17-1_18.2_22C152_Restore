@interface BKSTouchAnnotationController
+ (id)sharedInstance;
- (void)postTouchAnnotations:(id)a3;
@end

@implementation BKSTouchAnnotationController

- (void)postTouchAnnotations:(id)a3
{
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_5100 != -1) {
    dispatch_once(&sharedInstance_onceToken_5100, &__block_literal_global_5101);
  }
  v2 = (void *)sharedInstance_controller;
  return v2;
}

uint64_t __46__BKSTouchAnnotationController_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(BKSTouchAnnotationController);
  uint64_t v1 = sharedInstance_controller;
  sharedInstance_controller = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end