@interface CCUIDisplayModuleViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)loadView;
@end

@implementation CCUIDisplayModuleViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CCUIDisplayModuleViewController";
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
  v6.receiver = self;
  v6.super_class = (Class)CCUIDisplayModuleViewControllerAccessibility;
  [(CCUIDisplayModuleViewControllerAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  v3 = [(CCUIDisplayModuleViewControllerAccessibility *)self safeUIViewForKey:@"sliderView"];
  v4 = accessibilityLocalizedString(@"brightness.button.label");
  [v3 setAccessibilityLabel:v4];

  uint64_t v5 = [v3 accessibilityTraits];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CF68] | v5];
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)CCUIDisplayModuleViewControllerAccessibility;
  [(CCUIDisplayModuleViewControllerAccessibility *)&v3 loadView];
  [(CCUIDisplayModuleViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end