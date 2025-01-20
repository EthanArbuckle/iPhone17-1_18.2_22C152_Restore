@interface NTKWorldClockComplicationAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityComplicationSubType;
@end

@implementation NTKWorldClockComplicationAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKWorldClockComplication";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"NTKWorldClockComplication" hasInstanceVariable:@"_city" withType:"WorldClockCity"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WorldClockCity", @"name", "@", 0);
}

- (id)_accessibilityComplicationSubType
{
  v2 = [(NTKWorldClockComplicationAccessibility *)self safeValueForKey:@"_city"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

@end