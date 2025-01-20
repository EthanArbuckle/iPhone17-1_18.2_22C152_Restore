@interface AKAlertImageURLProvider
+ (id)url;
@end

@implementation AKAlertImageURLProvider

+ (id)url
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKitUI"];
  v3 = [v2 URLForResource:@"appleaccount_mono_icon-60-dark" withExtension:@"png"];

  return v3;
}

@end