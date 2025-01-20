@interface NTKWorldClockComplicationControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axAnnotateDisplay;
- (void)_updateDisplay;
- (void)setDisplayProperties:(id)a3 forDisplayWrapper:(id)a4;
- (void)setPauseDate:(id)a3;
@end

@implementation NTKWorldClockComplicationControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKWorldClockComplicationController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"NTKWorldClockComplicationController" isKindOfClass:@"NTKComplicationController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKComplicationController", @"legacyDisplay", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKWorldClockComplicationController", @"_updateDisplay", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKWorldClockComplicationController", @"setPauseDate:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKWorldClockComplicationController", @"setDisplayProperties:forDisplayWrapper:", "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKComplicationControllerDisplayProperties", @"faceDataMode", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WorldClockCity", @"name", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKComplicationController", @"complication", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKWorldClockComplication", @"city", "@", 0);
}

- (void)_axAnnotateDisplay
{
  id v3 = [(NTKWorldClockComplicationControllerAccessibility *)self safeValueForKey:@"complication"];
  v4 = [v3 safeValueForKey:@"_city"];
  id v6 = [v4 safeValueForKey:@"name"];

  v5 = [(NTKWorldClockComplicationControllerAccessibility *)self safeValueForKey:@"legacyDisplay"];
  [v5 _accessibilitySetWorldClockCityName:v6];
}

- (void)_updateDisplay
{
  v3.receiver = self;
  v3.super_class = (Class)NTKWorldClockComplicationControllerAccessibility;
  [(NTKWorldClockComplicationControllerAccessibility *)&v3 _updateDisplay];
  [(NTKWorldClockComplicationControllerAccessibility *)self _axAnnotateDisplay];
}

- (void)setPauseDate:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKWorldClockComplicationControllerAccessibility;
  [(NTKWorldClockComplicationControllerAccessibility *)&v4 setPauseDate:a3];
  [(NTKWorldClockComplicationControllerAccessibility *)self _axAnnotateDisplay];
}

- (void)setDisplayProperties:(id)a3 forDisplayWrapper:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)NTKWorldClockComplicationControllerAccessibility;
  [(NTKWorldClockComplicationControllerAccessibility *)&v5 setDisplayProperties:a3 forDisplayWrapper:a4];
  [(NTKWorldClockComplicationControllerAccessibility *)self _axAnnotateDisplay];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)NTKWorldClockComplicationControllerAccessibility;
  [(NTKWorldClockComplicationControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(NTKWorldClockComplicationControllerAccessibility *)self _axAnnotateDisplay];
}

@end