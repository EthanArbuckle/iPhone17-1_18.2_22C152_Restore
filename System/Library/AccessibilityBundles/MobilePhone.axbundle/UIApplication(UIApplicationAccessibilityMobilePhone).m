@interface UIApplication(UIApplicationAccessibilityMobilePhone)
- (id)accessibilityLabel;
@end

@implementation UIApplication(UIApplicationAccessibilityMobilePhone)

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"application.name");
}

@end