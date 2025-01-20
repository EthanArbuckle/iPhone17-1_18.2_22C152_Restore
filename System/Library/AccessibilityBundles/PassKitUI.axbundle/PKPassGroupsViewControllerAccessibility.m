@interface PKPassGroupsViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)groupStackViewDidBeginReordering:(id)a3;
@end

@implementation PKPassGroupsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPassGroupsViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)groupStackViewDidBeginReordering:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPassGroupsViewControllerAccessibility;
  [(PKPassGroupsViewControllerAccessibility *)&v5 groupStackViewDidBeginReordering:a3];
  UIAccessibilityNotifications v3 = *MEMORY[0x263F1CDC8];
  v4 = accessibilityLocalizedString(@"started.reordering.passes");
  UIAccessibilityPostNotification(v3, v4);
}

@end