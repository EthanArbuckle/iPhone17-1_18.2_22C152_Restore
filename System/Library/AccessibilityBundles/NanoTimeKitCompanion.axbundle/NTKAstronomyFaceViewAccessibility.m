@interface NTKAstronomyFaceViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
@end

@implementation NTKAstronomyFaceViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKAstronomyFaceView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"NTKAstronomyFaceView" hasInstanceVariable:@"_scrubLabel" withType:"CLKUIColoringLabel"];
  [v3 validateClass:@"NTKAstronomyFaceView" hasInstanceVariable:@"_phaseLabel" withType:"CLKUIColoringLabel"];
  [v3 validateClass:@"NTKAstronomyFaceView" hasInstanceVariable:@"_overrideDateLabel" withType:"CLKUIColoringLabel"];
}

@end