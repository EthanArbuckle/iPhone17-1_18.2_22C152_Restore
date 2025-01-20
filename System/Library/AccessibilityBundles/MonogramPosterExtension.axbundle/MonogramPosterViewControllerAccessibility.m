@interface MonogramPosterViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation MonogramPosterViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MonogramPosterExtension.MonogramPosterViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MonogramPosterExtension.MonogramPosterViewController" hasSwiftField:@"simulationView" withSwiftType:"Optional<MonogramSimulationView>"];
  [v3 validateClass:@"MonogramPosterExtension.MonogramPosterViewController" hasSwiftField:@"monogramString" withSwiftType:"String"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v10.receiver = self;
  v10.super_class = (Class)MonogramPosterViewControllerAccessibility;
  [(MonogramPosterViewControllerAccessibility *)&v10 _accessibilityLoadAccessibilityInformation];
  LOBYTE(location) = 0;
  objc_opt_class();
  id v3 = [(MonogramPosterViewControllerAccessibility *)self safeSwiftValueForKey:@"simulationView"];
  v4 = __UIAccessibilityCastAsClass();

  if (v4)
  {
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __87__MonogramPosterViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
    v7[3] = &unk_26513B3C8;
    objc_copyWeak(&v8, &location);
    [v4 setIsAccessibilityElementBlock:v7];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __87__MonogramPosterViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
    v5[3] = &unk_26513B3F0;
    objc_copyWeak(&v6, &location);
    [v4 setAccessibilityLabelBlock:v5];
    objc_destroyWeak(&v6);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

BOOL __87__MonogramPosterViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained safeSwiftStringForKey:@"monogramString"];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

id __87__MonogramPosterViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained safeSwiftStringForKey:@"monogramString"];

  return v2;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)MonogramPosterViewControllerAccessibility;
  [(MonogramPosterViewControllerAccessibility *)&v3 viewDidLoad];
  [(MonogramPosterViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end