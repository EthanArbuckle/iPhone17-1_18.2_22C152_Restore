@interface LANotificationUIBannerAppearance
- (id)darwinNotificationForBoolValue:(BOOL)a3;
@end

@implementation LANotificationUIBannerAppearance

- (id)darwinNotificationForBoolValue:(BOOL)a3
{
  if (a3) {
    return @"com.apple.LocalAuthentication.ui.BannerWillAppear";
  }
  else {
    return @"com.apple.LocalAuthentication.ui.BannerDidDisappear";
  }
}

@end