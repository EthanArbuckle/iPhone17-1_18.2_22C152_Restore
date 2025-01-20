@interface SBActivityAmbientViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation SBActivityAmbientViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBActivityAmbientViewController";
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
  v5.super_class = (Class)SBActivityAmbientViewControllerAccessibility;
  [(SBActivityAmbientViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  v3 = [(SBActivityAmbientViewControllerAccessibility *)self safeUIViewForKey:@"view"];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __90__SBActivityAmbientViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v4[3] = &unk_265154300;
  v4[4] = self;
  [v3 setAccessibilityViewIsModalBlock:v4];
}

BOOL __90__SBActivityAmbientViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) safeValueForKey:@"fullOverlayViewController"];
  BOOL v2 = v1 != 0;

  return v2;
}

@end