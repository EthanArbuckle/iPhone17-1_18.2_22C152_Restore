@interface PUFilterToolControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)centerToolbarView;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation PUFilterToolControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUFilterToolController";
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
  v4.super_class = (Class)PUFilterToolControllerAccessibility;
  [(PUFilterToolControllerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  v3 = [(PUFilterToolControllerAccessibility *)self safeUIViewForKey:@"centerToolbarView"];
  [v3 _setAccessibilityTraitsBlock:&__block_literal_global_7];
}

uint64_t __81__PUFilterToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return *MEMORY[0x263F1CEF8];
}

- (id)centerToolbarView
{
  v4.receiver = self;
  v4.super_class = (Class)PUFilterToolControllerAccessibility;
  v2 = [(PUFilterToolControllerAccessibility *)&v4 centerToolbarView];
  [v2 _setAccessibilityTraitsBlock:&__block_literal_global_310_1];

  return v2;
}

uint64_t __56__PUFilterToolControllerAccessibility_centerToolbarView__block_invoke()
{
  return *MEMORY[0x263F1CEF8];
}

@end