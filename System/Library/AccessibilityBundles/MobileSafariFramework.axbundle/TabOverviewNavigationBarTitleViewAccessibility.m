@interface TabOverviewNavigationBarTitleViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
@end

@implementation TabOverviewNavigationBarTitleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SFTabOverviewNavigationBarTitleView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SFTabOverviewNavigationBarTitleView" conformsToProtocol:@"UITextFieldDelegate"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFTabOverviewNavigationBarTitleView", @"textFieldDidEndEditing:", "v", "@", 0);
  [v3 validateClass:@"SFTabOverviewNavigationBarTitleView" hasSwiftField:@"titleButton" withSwiftType:"UIButton"];
}

- (void)textFieldDidEndEditing:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TabOverviewNavigationBarTitleViewAccessibility;
  [(TabOverviewNavigationBarTitleViewAccessibility *)&v6 textFieldDidEndEditing:a3];
  UIAccessibilityNotifications v4 = *MEMORY[0x263F1CE18];
  v5 = [(TabOverviewNavigationBarTitleViewAccessibility *)self safeSwiftValueForKey:@"titleButton"];
  UIAccessibilityPostNotification(v4, v5);
}

@end