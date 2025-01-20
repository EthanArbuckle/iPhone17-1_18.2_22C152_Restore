@interface NTKDateComplicationControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axAnnotateDisplay;
- (void)_updateDisplay;
@end

@implementation NTKDateComplicationControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKDateComplicationController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"NTKDateComplicationController" isKindOfClass:@"NTKComplicationController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKDateComplicationController", @"_updateDisplay", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKComplicationController", @"legacyDisplay", "@", 0);
  [v3 validateClass:@"NTKDateComplicationController" hasInstanceVariable:@"_displayDateStyle" withType:"Q"];
}

- (void)_axAnnotateDisplay
{
  if (((unint64_t)[(NTKDateComplicationControllerAccessibility *)self safeUnsignedIntegerForKey:@"_displayDateStyle"] & 0x3F) != 0)
  {
    id v3 = +[NSDate date];
    AXDateStringForFormat();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = 0;
  }
  v4 = [(NTKDateComplicationControllerAccessibility *)self safeValueForKey:@"legacyDisplay"];
  [v4 setAccessibilityLabel:v7];
  v6 = accessibilityLocalizedString(@"complication.hint.calendar", v5);
  [v4 setAccessibilityHint:v6];
}

- (void)_updateDisplay
{
  v3.receiver = self;
  v3.super_class = (Class)NTKDateComplicationControllerAccessibility;
  [(NTKDateComplicationControllerAccessibility *)&v3 _updateDisplay];
  [(NTKDateComplicationControllerAccessibility *)self _axAnnotateDisplay];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)NTKDateComplicationControllerAccessibility;
  [(NTKDateComplicationControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(NTKDateComplicationControllerAccessibility *)self _axAnnotateDisplay];
}

@end