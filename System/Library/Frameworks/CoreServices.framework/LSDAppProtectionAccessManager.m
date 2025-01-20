@interface LSDAppProtectionAccessManager
@end

@implementation LSDAppProtectionAccessManager

void __48___LSDAppProtectionAccessManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(_LSDAppProtectionAccessManager);
  v1 = (void *)+[_LSDAppProtectionAccessManager sharedInstance]::sharedInstance;
  +[_LSDAppProtectionAccessManager sharedInstance]::sharedInstance = (uint64_t)v0;
}

@end