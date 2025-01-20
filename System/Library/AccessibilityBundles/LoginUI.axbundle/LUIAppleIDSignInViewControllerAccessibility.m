@interface LUIAppleIDSignInViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation LUIAppleIDSignInViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"LUIAppleIDSignInViewController";
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
  v5.receiver = self;
  v5.super_class = (Class)LUIAppleIDSignInViewControllerAccessibility;
  [(LUIAppleIDSignInViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  v3 = [(LUIAppleIDSignInViewControllerAccessibility *)self safeValueForKey:@"usernameCell"];
  v4 = __UIAccessibilityCastAsClass();

  [v4 accessibilitySetIdentification:@"AXLUITableViewCellTextFieldOnlyTag"];
}

@end