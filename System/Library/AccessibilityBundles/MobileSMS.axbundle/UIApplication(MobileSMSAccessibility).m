@interface UIApplication(MobileSMSAccessibility)
- (id)accessibilityLabel;
@end

@implementation UIApplication(MobileSMSAccessibility)

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"app.name");
}

@end