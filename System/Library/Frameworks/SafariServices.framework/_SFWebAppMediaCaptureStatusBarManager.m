@interface _SFWebAppMediaCaptureStatusBarManager
+ (_SFWebAppMediaCaptureStatusBarManager)sharedManager;
- (id)statusString;
- (unint64_t)overrideStyleForAudioOnly:(BOOL)a3;
@end

@implementation _SFWebAppMediaCaptureStatusBarManager

+ (_SFWebAppMediaCaptureStatusBarManager)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_12);
  }
  v2 = (void *)sharedManager_sharedInstance;

  return (_SFWebAppMediaCaptureStatusBarManager *)v2;
}

- (id)statusString
{
  v3 = NSString;
  v4 = _WBSLocalizedString();
  v5 = [(SFMediaCaptureStatusBarManager *)self simplifiedURLString];
  v6 = objc_msgSend(v3, "stringWithFormat:", v4, v5);

  return v6;
}

- (unint64_t)overrideStyleForAudioOnly:(BOOL)a3
{
  if (a3) {
    return 0x4000000;
  }
  else {
    return 0x2000000;
  }
}

@end