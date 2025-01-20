@interface STUIStatusBarThermalItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)imageForUpdate:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation STUIStatusBarThermalItemAccessibility

- (void)_accessibilityLoadAccessibilityInformation
{
  v8.receiver = self;
  v8.super_class = (Class)STUIStatusBarThermalItemAccessibility;
  [(STUIStatusBarThermalItemAccessibility *)&v8 _accessibilityLoadAccessibilityInformation];
  v3 = [(STUIStatusBarThermalItemAccessibility *)self _accessibilityValueForKey:@"AccessibilityStatusBarUpdateData"];
  MEMORY[0x245665C20](@"STUIStatusBarItemUpdate");
  if (objc_opt_isKindOfClass())
  {
    v4 = [(STUIStatusBarThermalItemAccessibility *)self safeValueForKey:@"imageView"];
    v5 = [v3 safeValueForKeyPath:@"data.thermalEntry"];
    unint64_t v6 = [v5 safeIntegerForKey:@"color"];

    if (v6 > 5)
    {
      v7 = 0;
    }
    else
    {
      v7 = accessibilityLocalizedString(off_26515C990[v6]);
    }
    [v4 setIsAccessibilityElement:1];
    [v4 setAccessibilityLabel:v7];
  }
}

+ (id)safeCategoryTargetClassName
{
  return @"STUIStatusBarThermalItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"STUIStatusBarItemUpdate"];
  [v3 validateClass:@"STUIStatusBarThermalItem" isKindOfClass:@"STUIStatusBarIndicatorItem"];
  [v3 validateClass:@"STUIStatusBarIndicatorItem" hasProperty:@"imageView" withType:"@"];
  [v3 validateClass:@"STStatusBarData" hasProperty:@"thermalEntry" withType:"@"];
  [v3 validateClass:@"STUIStatusBarItemUpdate" hasProperty:@"data" withType:"@"];
  [v3 validateClass:@"STStatusBarDataThermalEntry" hasProperty:@"color" withType:"q"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBarThermalItem", @"imageForUpdate:", "@", "@", 0);
}

- (id)imageForUpdate:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)STUIStatusBarThermalItemAccessibility;
  id v4 = a3;
  v5 = [(STUIStatusBarThermalItemAccessibility *)&v7 imageForUpdate:v4];
  [(STUIStatusBarThermalItemAccessibility *)self _accessibilitySetRetainedValue:v4, @"AccessibilityStatusBarUpdateData", v7.receiver, v7.super_class forKey];

  [(STUIStatusBarThermalItemAccessibility *)self _accessibilityLoadAccessibilityInformation];

  return v5;
}

@end