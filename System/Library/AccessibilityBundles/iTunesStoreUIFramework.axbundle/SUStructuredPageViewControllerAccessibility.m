@interface SUStructuredPageViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityClearTable:(id)a3;
@end

@implementation SUStructuredPageViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUStructuredPageViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityClearTable:(id)a3
{
  [(SUStructuredPageViewControllerAccessibility *)self _accessibilityRemoveValueForKey:*MEMORY[0x263F81490]];
  UIAccessibilityNotifications v3 = *MEMORY[0x263F1CE18];

  UIAccessibilityPostNotification(v3, 0);
}

@end