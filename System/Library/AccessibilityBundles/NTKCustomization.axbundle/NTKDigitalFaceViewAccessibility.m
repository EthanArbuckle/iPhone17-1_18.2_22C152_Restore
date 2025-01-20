@interface NTKDigitalFaceViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation NTKDigitalFaceViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKDigitalFaceView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"NTKDigitalFaceView" isKindOfClass:@"NTKFaceView"];
  [v3 validateClass:@"NTKFaceView" hasInstanceVariable:@"_timeView" withType:"UIView<NTKTimeView>"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)NTKDigitalFaceViewAccessibility;
  [(NTKDigitalFaceViewAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(NTKDigitalFaceViewAccessibility *)self safeValueForKey:@"_timeView"];
  [v3 _setAccessibilityServesAsFirstElement:1];
  [v3 _setAccessibilityLabelBlock:&__block_literal_global_3];
}

NSString *__cdecl __77__NTKDigitalFaceViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(id a1)
{
  return (NSString *)AXClockTimeVoiceOverSpokenStringForWatchFaces();
}

@end