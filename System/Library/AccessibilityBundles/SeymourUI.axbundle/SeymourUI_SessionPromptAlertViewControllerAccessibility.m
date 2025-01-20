@interface SeymourUI_SessionPromptAlertViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLayoutSubviews;
@end

@implementation SeymourUI_SessionPromptAlertViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SeymourUI.SessionPromptAlertViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)SeymourUI_SessionPromptAlertViewControllerAccessibility;
  [(SeymourUI_SessionPromptAlertViewControllerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  v3 = [(SeymourUI_SessionPromptAlertViewControllerAccessibility *)self safeValueForKey:@"view"];
  [v3 setAccessibilityViewIsModal:1];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SeymourUI_SessionPromptAlertViewControllerAccessibility;
  [(SeymourUI_SessionPromptAlertViewControllerAccessibility *)&v3 viewDidLayoutSubviews];
  [(SeymourUI_SessionPromptAlertViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end