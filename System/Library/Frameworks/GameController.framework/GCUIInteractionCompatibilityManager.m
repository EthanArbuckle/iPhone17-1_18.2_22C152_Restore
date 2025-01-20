@interface GCUIInteractionCompatibilityManager
@end

@implementation GCUIInteractionCompatibilityManager

void __54___GCUIInteractionCompatibilityManager_sharedInstance__block_invoke()
{
  v0 = [_GCUIInteractionCompatibilityManager alloc];
  if (v0)
  {
    v2.receiver = v0;
    v2.super_class = (Class)_GCUIInteractionCompatibilityManager;
    v0 = (_GCUIInteractionCompatibilityManager *)objc_msgSendSuper2(&v2, sel_init);
  }
  v1 = (void *)sharedInstance_SharedInstance;
  sharedInstance_SharedInstance = (uint64_t)v0;
}

@end