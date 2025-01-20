@interface SFWebAppMediaCaptureStatusBarManager
@end

@implementation SFWebAppMediaCaptureStatusBarManager

void __54___SFWebAppMediaCaptureStatusBarManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(_SFWebAppMediaCaptureStatusBarManager);
  v1 = (void *)sharedManager_sharedInstance;
  sharedManager_sharedInstance = (uint64_t)v0;
}

@end