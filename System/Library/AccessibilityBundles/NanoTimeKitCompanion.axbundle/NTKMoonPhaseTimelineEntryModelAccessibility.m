@interface NTKMoonPhaseTimelineEntryModelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)templateForComplicationFamily:(int64_t)a3;
@end

@implementation NTKMoonPhaseTimelineEntryModelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKMoonPhaseTimelineEntryModel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKMoonPhaseTimelineEntryModel", @"phaseName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKMoonPhaseTimelineEntryModel", @"templateForComplicationFamily:", "@", "q", 0);
}

- (id)templateForComplicationFamily:(int64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)NTKMoonPhaseTimelineEntryModelAccessibility;
  v4 = [(NTKMoonPhaseTimelineEntryModelAccessibility *)&v11 templateForComplicationFamily:a3];
  if (_accessibilityComplicationTemplateContainsSimpleImage())
  {
    v5 = [v4 safeValueForKey:@"imageProvider"];
    v7 = accessibilityLocalizedString(@"moon.phase", v6);
    v8 = [(NTKMoonPhaseTimelineEntryModelAccessibility *)self safeValueForKey:@"phaseName"];
    v9 = __UIAXStringForVariables();
    objc_msgSend(v5, "setAccessibilityLabel:", v9, v8, @"__AXStringForVariablesSentinel");
  }

  return v4;
}

@end