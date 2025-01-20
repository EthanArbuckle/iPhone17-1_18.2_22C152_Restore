@interface WGWidgetAttributionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsStockWidget;
- (BOOL)_axIsWeatherWidget;
- (BOOL)isAccessibilityElement;
- (id)accessibilityAttributedValue;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axSetIsStockWidget:(BOOL)a3;
- (void)_axSetIsWeatherWidget:(BOOL)a3;
- (void)_configureAttributedString;
@end

@implementation WGWidgetAttributionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WGWidgetAttributionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"WGWidgetAttributionView" isKindOfClass:@"UITextView"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"WGWidgetAttributionView", @"requestAttributedStringForIdentifier:withHandler:", "v", "@", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WGWidgetAttributionView", @"_configureAttributedString", "v", 0);
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF10];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)_axIsStockWidget
{
  return MEMORY[0x270F0A438](self, &__WGWidgetAttributionViewAccessibility___axIsStockWidget);
}

- (void)_axSetIsStockWidget:(BOOL)a3
{
}

- (BOOL)_axIsWeatherWidget
{
  return MEMORY[0x270F0A438](self, &__WGWidgetAttributionViewAccessibility___axIsWeatherWidget);
}

- (void)_axSetIsWeatherWidget:(BOOL)a3
{
}

- (id)accessibilityLabel
{
  if ([(WGWidgetAttributionViewAccessibility *)self _axIsStockWidget])
  {
    id v3 = @"stocks.attribution";
LABEL_5:
    v4 = accessibilityLocalizedString(v3);
    goto LABEL_7;
  }
  if ([(WGWidgetAttributionViewAccessibility *)self _axIsWeatherWidget])
  {
    id v3 = @"weather.attribution";
    goto LABEL_5;
  }
  v6.receiver = self;
  v6.super_class = (Class)WGWidgetAttributionViewAccessibility;
  v4 = [(WGWidgetAttributionViewAccessibility *)&v6 accessibilityLabel];
LABEL_7:

  return v4;
}

- (id)accessibilityAttributedValue
{
  return 0;
}

- (id)accessibilityValue
{
  if ([(WGWidgetAttributionViewAccessibility *)self _axIsStockWidget]
    || [(WGWidgetAttributionViewAccessibility *)self _axIsWeatherWidget])
  {
    id v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)WGWidgetAttributionViewAccessibility;
    id v3 = [(WGWidgetAttributionViewAccessibility *)&v5 accessibilityValue];
  }

  return v3;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v2.receiver = self;
  v2.super_class = (Class)WGWidgetAttributionViewAccessibility;
  [(WGWidgetAttributionViewAccessibility *)&v2 _accessibilityLoadAccessibilityInformation];
  AXPerformSafeBlock();
}

uint64_t __82__WGWidgetAttributionViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  objc_super v2 = (void *)MEMORY[0x24566AD50](@"WGWidgetAttributionView");
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __82__WGWidgetAttributionViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v6[3] = &unk_2651691B8;
  v6[4] = *(void *)(a1 + 32);
  [v2 requestAttributedStringForIdentifier:@"com.apple.stocks.widget" withHandler:v6];
  id v3 = (void *)MEMORY[0x24566AD50](@"WGWidgetAttributionView");
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __82__WGWidgetAttributionViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v5[3] = &unk_2651691B8;
  v5[4] = *(void *)(a1 + 32);
  return [v3 requestAttributedStringForIdentifier:@"com.apple.weather.WeatherAppTodayWidget" withHandler:v5];
}

void __82__WGWidgetAttributionViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_opt_class();
  objc_super v5 = __UIAccessibilityCastAsClass();
  objc_super v6 = [v5 text];
  v7 = [v3 string];
  objc_msgSend(v4, "_axSetIsStockWidget:", objc_msgSend(v6, "isEqualToString:", v7));
}

void __82__WGWidgetAttributionViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_opt_class();
  objc_super v5 = __UIAccessibilityCastAsClass();
  objc_super v6 = [v5 text];
  v7 = [v3 string];
  objc_msgSend(v4, "_axSetIsWeatherWidget:", objc_msgSend(v6, "isEqualToString:", v7));
}

- (void)_configureAttributedString
{
  v3.receiver = self;
  v3.super_class = (Class)WGWidgetAttributionViewAccessibility;
  [(WGWidgetAttributionViewAccessibility *)&v3 _configureAttributedString];
  [(WGWidgetAttributionViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end