@interface WeatherStackViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)loadView;
@end

@implementation WeatherStackViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WeatherStackViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"WeatherStackViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WeatherStackViewController", @"loadView", "v", 0);
  [v3 validateClass:@"WeatherStackViewController" hasInstanceVariable:@"_weatherConditionsViewController" withType:"WeatherConditionsViewController"];
  [v3 validateClass:@"WeatherStackViewController" hasInstanceVariable:@"_airQualityConditionsViewController" withType:"AirQualityConditionsViewController"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v10.receiver = self;
  v10.super_class = (Class)WeatherStackViewControllerAccessibility;
  [(WeatherStackViewControllerAccessibility *)&v10 _accessibilityLoadAccessibilityInformation];
  id v3 = [(WeatherStackViewControllerAccessibility *)self safeUIViewForKey:@"view"];
  [v3 setIsAccessibilityElement:1];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
  objc_initWeak(&location, v3);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __85__WeatherStackViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v7[3] = &unk_26512D978;
  objc_copyWeak(&v8, &location);
  [v3 _setAccessibilityActivateBlock:v7];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __85__WeatherStackViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v6[3] = &unk_26512D6B0;
  v6[4] = self;
  [v3 _setAccessibilityLabelBlock:v6];
  v4 = AXMapsLocString(@"WEATHER");
  v5 = MEMORY[0x245653030]();
  [v3 setAccessibilityUserInputLabels:v5];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

uint64_t __85__WeatherStackViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id v1 = objc_loadWeakRetained((id *)(a1 + 32));
  [v1 _accessibilityShowContextMenuForElement:v1 targetPointValue:0];

  return 1;
}

id __85__WeatherStackViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) safeValueForKey:@"_weatherConditionsViewController"];
  id v3 = [v2 accessibilityLabel];
  v4 = [*(id *)(a1 + 32) safeValueForKey:@"_airQualityConditionsViewController"];
  v7 = [v4 accessibilityLabel];
  v5 = __UIAXStringForVariables();

  return v5;
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)WeatherStackViewControllerAccessibility;
  [(WeatherStackViewControllerAccessibility *)&v3 loadView];
  [(WeatherStackViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end