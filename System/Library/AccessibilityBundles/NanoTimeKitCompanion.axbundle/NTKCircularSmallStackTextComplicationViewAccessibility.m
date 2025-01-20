@interface NTKCircularSmallStackTextComplicationViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation NTKCircularSmallStackTextComplicationViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKCircularSmallStackTextComplicationView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"NTKCircularSmallStackTextComplicationView" hasInstanceVariable:@"_firstLineLabel" withType:"CLKUIColoringLabel"];
  [v3 validateClass:@"NTKCircularSmallStackTextComplicationView" hasInstanceVariable:@"_secondLineLabel" withType:"CLKUIColoringLabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CLKUIColoringLabel", @"textProvider", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(NTKCircularSmallStackTextComplicationViewAccessibility *)self safeValueForKey:@"_firstLineLabel"];
  v4 = [v3 safeValueForKey:@"textProvider"];
  v5 = [v4 accessibilityLabel];

  v6 = [(NTKCircularSmallStackTextComplicationViewAccessibility *)self safeValueForKey:@"_secondLineLabel"];
  v7 = [v6 safeValueForKey:@"textProvider"];
  v8 = [v7 accessibilityLabel];

  v9 = __UIAXStringForVariables();

  return v9;
}

@end