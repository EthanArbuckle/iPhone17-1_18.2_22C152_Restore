@interface NTKMoonPhaseComplicationControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axUpdateDisplayAccessibilityLabel;
- (void)_updateDisplay;
- (void)setDisplayProperties:(id)a3 forDisplayWrapper:(id)a4;
@end

@implementation NTKMoonPhaseComplicationControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKMoonPhaseComplicationController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"NTKMoonPhaseComplicationController" isKindOfClass:@"NTKComplicationController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKComplicationController", @"legacyDisplay", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKComplicationController", @"setDisplayProperties:forDisplayWrapper:", "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKComplicationControllerDisplayProperties", @"faceDataMode", "q", 0);
  [v3 validateClass:@"NTKMoonPhaseComplicationController" hasInstanceVariable:@"_location" withType:"CLLocation"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)NTKMoonPhaseComplicationControllerAccessibility;
  [(NTKMoonPhaseComplicationControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(NTKMoonPhaseComplicationControllerAccessibility *)self _axUpdateDisplayAccessibilityLabel];
}

- (void)_axUpdateDisplayAccessibilityLabel
{
  id v30 = [(NTKMoonPhaseComplicationControllerAccessibility *)self safeValueForKey:@"_location"];
  [v30 coordinate];
  double v4 = v3;
  [v30 coordinate];
  double v6 = v5;
  v7 = +[NSDate date];
  id v8 = objc_msgSend(objc_alloc((Class)GEOCelestialEphemeris), "initWithLocation:date:body:", v7, 4, v4, v6);
  v9 = [(NTKMoonPhaseComplicationControllerAccessibility *)self safeValueForKey:@"legacyDisplay"];
  if (objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector())
  {
    [v8 phaseAngle];
    double v11 = v10;
    [v8 parallacticAngle];
    double v13 = NTKMoonPhaseFromPhaseAnglePositionAngle(v11, v12);
    v14 = NTKMoonPhaseDescriptionFromPhase(v13);
  }
  else
  {
    v14 = 0;
  }
  if (objc_opt_respondsToSelector())
  {
    [v8 illuminatedFraction];
    if (v15 >= 0.03)
    {
      [v8 illuminatedFraction];
      if (v16 <= 0.97)
      {
        [v8 parallacticAngle];
        double v18 = v17;
        v20 = accessibilityLocalizedString(@"moon.illumination.format", v19);
        v21 = angleDescriptionForPositionAngleInDegrees(v18);
        v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v20, v21);

        v28 = v22;
        CFStringRef v29 = @"__AXStringForVariablesSentinel";
        uint64_t v23 = __AXStringForVariables();

        v14 = (void *)v23;
      }
    }
  }
  if (!objc_msgSend(v14, "length", v28, v29))
  {
    uint64_t v25 = accessibilityLocalizedString(@"value.unknown", v24);

    v14 = (void *)v25;
  }
  v26 = accessibilityLocalizedString(@"moon.phase", v24);
  v27 = __AXStringForVariables();

  objc_msgSend(v9, "setAccessibilityLabel:", v27, v14, @"__AXStringForVariablesSentinel");
}

- (void)setDisplayProperties:(id)a3 forDisplayWrapper:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)NTKMoonPhaseComplicationControllerAccessibility;
  id v6 = a3;
  [(NTKMoonPhaseComplicationControllerAccessibility *)&v8 setDisplayProperties:v6 forDisplayWrapper:a4];
  v7 = (char *)objc_msgSend(v6, "safeIntegerForKey:", @"faceDataMode", v8.receiver, v8.super_class);

  if (v7 == (unsigned char *)&dword_0 + 1) {
    [(NTKMoonPhaseComplicationControllerAccessibility *)self _axUpdateDisplayAccessibilityLabel];
  }
}

- (void)_updateDisplay
{
  v3.receiver = self;
  v3.super_class = (Class)NTKMoonPhaseComplicationControllerAccessibility;
  [(NTKMoonPhaseComplicationControllerAccessibility *)&v3 _updateDisplay];
  [(NTKMoonPhaseComplicationControllerAccessibility *)self _axUpdateDisplayAccessibilityLabel];
}

@end