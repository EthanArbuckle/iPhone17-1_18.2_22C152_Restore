@interface UIApplication(PreferencesAccessibilityCategory)
- (id)accessibilityLabel;
@end

@implementation UIApplication(PreferencesAccessibilityCategory)

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"app.name");
}

@end