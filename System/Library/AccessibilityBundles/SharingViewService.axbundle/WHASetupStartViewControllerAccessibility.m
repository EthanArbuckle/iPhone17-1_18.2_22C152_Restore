@interface WHASetupStartViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axLabelDismissButton;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WHASetupStartViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WHASetupStartViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WHASetupStartViewController", @"viewWillAppear:", "v", "B", 0);
  [v3 validateClass:@"RepairStartViewController" hasInstanceVariable:@"_dismissButton" withType:"UIButton"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)WHASetupStartViewControllerAccessibility;
  [(WHASetupStartViewControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(WHASetupStartViewControllerAccessibility *)self _axLabelDismissButton];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WHASetupStartViewControllerAccessibility;
  [(WHASetupStartViewControllerAccessibility *)&v4 viewWillAppear:a3];
  [(WHASetupStartViewControllerAccessibility *)self _axLabelDismissButton];
}

- (void)_axLabelDismissButton
{
  objc_super v3 = [(WHASetupStartViewControllerAccessibility *)self safeValueForKey:@"_dismissButton"];
  objc_super v4 = accessibilityLocalizedString(@"dismiss.button");
  [v3 setAccessibilityLabel:v4];

  id v5 = [(WHASetupStartViewControllerAccessibility *)self safeValueForKey:@"_dismissButton"];
  [v5 _accessibilitySetUserTestingIsCancelButton:1];
}

@end