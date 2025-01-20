@interface UIApplication(CompassAccessibility)
- (id)accessibilityLabel;
@end

@implementation UIApplication(CompassAccessibility)

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"app.name");
}

@end