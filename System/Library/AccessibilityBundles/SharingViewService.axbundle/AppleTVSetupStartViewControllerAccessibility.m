@interface AppleTVSetupStartViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AppleTVSetupStartViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AppleTVSetupStartViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AppleTVSetupStartViewController", @"viewWillAppear:", "v", "B", 0);
  [v3 validateClass:@"AppleTVSetupStartViewController" hasInstanceVariable:@"_dismissButton" withType:"UIButton"];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AppleTVSetupStartViewControllerAccessibility;
  [(AppleTVSetupStartViewControllerAccessibility *)&v7 viewWillAppear:a3];
  v4 = [(AppleTVSetupStartViewControllerAccessibility *)self safeValueForKey:@"_dismissButton"];
  v5 = accessibilityLocalizedString(@"dismiss.button");
  [v4 setAccessibilityLabel:v5];

  v6 = [(AppleTVSetupStartViewControllerAccessibility *)self safeValueForKey:@"_dismissButton"];
  [v6 _accessibilitySetUserTestingIsCancelButton:1];
}

@end