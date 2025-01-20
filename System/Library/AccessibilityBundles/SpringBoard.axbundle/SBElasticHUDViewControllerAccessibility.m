@interface SBElasticHUDViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation SBElasticHUDViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBElasticHUDViewController";
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
  v4.super_class = (Class)SBElasticHUDViewControllerAccessibility;
  [(SBElasticHUDViewControllerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  v3 = [(SBElasticHUDViewControllerAccessibility *)self safeUIViewForKey:@"view"];
  [v3 _setAccessibilityElementsHiddenBlock:&__block_literal_global_17];
}

BOOL __85__SBElasticHUDViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return AXDoesRequestingClientDeserveAutomation() == 0;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)SBElasticHUDViewControllerAccessibility;
  [(SBElasticHUDViewControllerAccessibility *)&v3 viewDidLoad];
  [(SBElasticHUDViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end