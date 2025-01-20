@interface PUAdjustmentsToolControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)centerToolbarView;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation PUAdjustmentsToolControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUAdjustmentsToolController";
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
  v4.super_class = (Class)PUAdjustmentsToolControllerAccessibility;
  [(PUAdjustmentsToolControllerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  v3 = [(PUAdjustmentsToolControllerAccessibility *)self safeUIViewForKey:@"centerToolbarView"];
  [v3 _setAccessibilityTraitsBlock:&__block_literal_global_4];
}

uint64_t __86__PUAdjustmentsToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return *MEMORY[0x263F1CEF8];
}

- (id)centerToolbarView
{
  v4.receiver = self;
  v4.super_class = (Class)PUAdjustmentsToolControllerAccessibility;
  v2 = [(PUAdjustmentsToolControllerAccessibility *)&v4 centerToolbarView];
  [v2 _setAccessibilityTraitsBlock:&__block_literal_global_310_0];

  return v2;
}

uint64_t __61__PUAdjustmentsToolControllerAccessibility_centerToolbarView__block_invoke()
{
  return *MEMORY[0x263F1CEF8];
}

@end