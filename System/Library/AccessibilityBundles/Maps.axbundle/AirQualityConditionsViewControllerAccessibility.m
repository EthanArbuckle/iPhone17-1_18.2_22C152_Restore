@interface AirQualityConditionsViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation AirQualityConditionsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AirQualityConditionsViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AirQualityConditions", @"airQualityIndex", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AirQualityConditions", @"hasNumericalAirQualityIndex", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AirQualityConditionsViewController", @"isVisible", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AirQualityConditionsViewController", @"airQualityConditions", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AirQualityConditions", @"airQualityDescription", "@", 0);
}

- (id)accessibilityLabel
{
  if ([(AirQualityConditionsViewControllerAccessibility *)self safeBoolForKey:@"isVisible"])
  {
    id v3 = [(AirQualityConditionsViewControllerAccessibility *)self safeValueForKey:@"airQualityConditions"];
    v4 = [v3 safeValueForKey:@"airQualityDescription"];
    if (v4)
    {
      v5 = NSString;
      v6 = AXMapsLocString(@"AQI_STRING");
      v7 = objc_msgSend(v5, "localizedStringWithFormat:", v6, v4);
    }
    else if ([v3 safeBoolForKey:@"hasNumericalAirQualityIndex"])
    {
      uint64_t v8 = [v3 safeUnsignedIntegerForKey:@"airQualityIndex"];
      v9 = NSString;
      v10 = AXMapsLocString(@"AQI_STRING");
      v11 = [NSNumber numberWithUnsignedInteger:v8];
      v12 = [v11 stringValue];
      v7 = objc_msgSend(v9, "localizedStringWithFormat:", v10, v12);
    }
    else
    {
      v7 = AXMapsLocString(@"AQI_STRING_NO_INDEX");
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end