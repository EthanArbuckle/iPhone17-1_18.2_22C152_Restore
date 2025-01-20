@interface NTKComplicationControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)addDisplayWrapper:(id)a3;
@end

@implementation NTKComplicationControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKComplicationController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKComplicationController", @"hasTapAction", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKComplicationController", @"complication", "@", 0);
  [v3 validateClass:@"NTKComplicationController" hasInstanceVariable:@"_displayWrappers" withType:"NSMutableArray"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v2.receiver = self;
  v2.super_class = (Class)NTKComplicationControllerAccessibility;
  [(NTKComplicationControllerAccessibility *)&v2 _accessibilityLoadAccessibilityInformation];
}

- (void)addDisplayWrapper:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKComplicationControllerAccessibility;
  [(NTKComplicationControllerAccessibility *)&v4 addDisplayWrapper:a3];
  [(NTKComplicationControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end