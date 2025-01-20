@interface SBUIPasscodeBiometricAuthenticationViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_updateSubviews;
@end

@implementation SBUIPasscodeBiometricAuthenticationViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBUIPasscodeBiometricAuthenticationView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBUIPasscodeBiometricAuthenticationView" hasInstanceVariable:@"_invisibleUsePasscodeButton" withType:"UIButton"];
  [v3 validateClass:@"SBUIPasscodeBiometricAuthenticationView" hasInstanceVariable:@"_backgroundCancelButton" withType:"UIButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBUIPasscodeBiometricAuthenticationView", @"_updateSubviews", "v", 0);
}

- (void)_updateSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SBUIPasscodeBiometricAuthenticationViewAccessibility;
  [(SBUIPasscodeBiometricAuthenticationViewAccessibility *)&v3 _updateSubviews];
  [(SBUIPasscodeBiometricAuthenticationViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)SBUIPasscodeBiometricAuthenticationViewAccessibility;
  [(SBUIPasscodeBiometricAuthenticationViewAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  objc_super v3 = [(SBUIPasscodeBiometricAuthenticationViewAccessibility *)self safeUIViewForKey:@"_invisibleUsePasscodeButton"];
  [v3 setAccessibilityElementsHidden:1];

  v4 = [(SBUIPasscodeBiometricAuthenticationViewAccessibility *)self safeUIViewForKey:@"_backgroundCancelButton"];
  [v4 setAccessibilityElementsHidden:1];
}

@end