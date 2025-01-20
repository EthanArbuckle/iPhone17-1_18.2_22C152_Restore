@interface PHMobilePhoneRemoteViewController
+ (BOOL)isSupported;
+ (id)serviceBundleIdentifier;
+ (id)viewControllerClassName;
- (int64_t)backgroundStyle;
@end

@implementation PHMobilePhoneRemoteViewController

+ (BOOL)isSupported
{
  return +[TUCallCapabilities supportsPrimaryCalling];
}

+ (id)viewControllerClassName
{
  return @"PhoneTabBarController";
}

+ (id)serviceBundleIdentifier
{
  return TUBundleIdentifierMobilePhoneApplication;
}

- (int64_t)backgroundStyle
{
  return 3;
}

@end