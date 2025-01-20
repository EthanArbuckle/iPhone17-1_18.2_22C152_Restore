@interface CKNanoSendMenuButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)_accessibilityFocusRingTintColor;
- (id)accessibilityLabel;
@end

@implementation CKNanoSendMenuButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKNanoSendMenuButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"messaging.apps.button.text");
}

- (id)_accessibilityFocusRingTintColor
{
  return (id)[MEMORY[0x263F1C550] systemWhiteColor];
}

@end