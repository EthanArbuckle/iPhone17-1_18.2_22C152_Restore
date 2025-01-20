@interface TPSetPINViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_updateNavBarButtons;
@end

@implementation TPSetPINViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TPSetPINViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_updateNavBarButtons
{
  v2.receiver = self;
  v2.super_class = (Class)TPSetPINViewControllerAccessibility;
  [(TPSetPINViewControllerAccessibility *)&v2 _updateNavBarButtons];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end