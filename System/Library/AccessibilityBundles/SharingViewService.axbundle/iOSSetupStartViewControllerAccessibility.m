@interface iOSSetupStartViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation iOSSetupStartViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"iOSSetupStartViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"iOSSetupStartViewController" hasInstanceVariable:@"_dismissButton" withType:"UIButton"];
  [v3 validateClass:@"iOSSetupStartViewController" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"iOSSetupStartViewController", @"viewWillAppear:", "v", "B", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)iOSSetupStartViewControllerAccessibility;
  [(iOSSetupStartViewControllerAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  id v3 = [(iOSSetupStartViewControllerAccessibility *)self safeValueForKey:@"_dismissButton"];
  v4 = accessibilityLocalizedString(@"dismiss.button");
  [v3 setAccessibilityLabel:v4];

  v5 = [(iOSSetupStartViewControllerAccessibility *)self safeValueForKey:@"_dismissButton"];
  [v5 _accessibilitySetUserTestingIsCancelButton:1];

  v6 = [(iOSSetupStartViewControllerAccessibility *)self safeValueForKey:@"_titleLabel"];
  [v6 setAccessibilityTraits:*MEMORY[0x263F1CEF8]];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)iOSSetupStartViewControllerAccessibility;
  [(iOSSetupStartViewControllerAccessibility *)&v4 viewWillAppear:a3];
  [(iOSSetupStartViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end