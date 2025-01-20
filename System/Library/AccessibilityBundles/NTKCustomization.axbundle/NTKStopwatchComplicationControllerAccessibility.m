@interface NTKStopwatchComplicationControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation NTKStopwatchComplicationControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKStopwatchComplicationController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"NTKDateComplicationController" isKindOfClass:@"NTKComplicationController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKComplicationController", @"legacyDisplay", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v2.receiver = self;
  v2.super_class = (Class)NTKStopwatchComplicationControllerAccessibility;
  [(NTKStopwatchComplicationControllerAccessibility *)&v2 _accessibilityLoadAccessibilityInformation];
}

@end