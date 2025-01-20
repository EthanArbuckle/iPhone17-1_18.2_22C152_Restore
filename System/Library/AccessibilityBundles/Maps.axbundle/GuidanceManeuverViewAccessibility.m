@interface GuidanceManeuverViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unsigned)_accessibilityMediaAnalysisOptions;
@end

@implementation GuidanceManeuverViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"GuidanceManeuverView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GuidanceManeuverView", @"maneuverArtwork", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GuidanceManeuverArtwork", @"maneuver", "i", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(GuidanceManeuverViewAccessibility *)self safeValueForKey:@"maneuverArtwork"];
  int v3 = [v2 safeIntForKey:@"maneuver"];

  if (v3)
  {
    AXMapsStringForManeuverType(v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_26F6E7138;
  }

  return v4;
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0;
}

@end