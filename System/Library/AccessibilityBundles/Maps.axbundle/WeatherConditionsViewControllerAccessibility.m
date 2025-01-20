@interface WeatherConditionsViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation WeatherConditionsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WeatherConditionsViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WeatherConditionsViewController", @"isVisible", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WeatherConditionsViewController", @"weatherConditions", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  if ([(WeatherConditionsViewControllerAccessibility *)self safeBoolForKey:@"isVisible"])
  {
    id v3 = [(WeatherConditionsViewControllerAccessibility *)self safeValueForKey:@"weatherConditions"];
    v4 = __UIAccessibilitySafeClass();

    uint64_t v5 = [v4 safeStringForKey:@"conditionDescription"];
    v6 = [v4 safeValueForKey:@"temperatureDescription"];
    v7 = NSString;
    v8 = AXMapsLocString(@"TEMPERATURE_DEGREES_FORMAT");
    [v6 doubleValue];
    uint64_t v10 = objc_msgSend(v7, "localizedStringWithFormat:", v8, v9);

    if (v5 | v10)
    {
      if (!v5 && v10)
      {
        uint64_t v5 = AXMapsLocString(@"TEMPERATURE");
      }
      v11 = __AXStringForVariables();
    }
    else
    {
      v11 = AXMapKitLocString(@"WEATHER_UNAVAILABLE");
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end