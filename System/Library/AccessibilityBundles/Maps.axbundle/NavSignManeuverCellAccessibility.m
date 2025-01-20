@interface NavSignManeuverCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unsigned)_accessibilityMediaAnalysisOptions;
@end

@implementation NavSignManeuverCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NavSignManeuverCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NavSignManeuverCell", @"primaryTextLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NavSignManeuverCell", @"secondaryTextLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NavSignManeuverCell", @"guidanceManeuverView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GuidanceManeuverView", @"maneuverArtwork", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GuidanceManeuverArtwork", @"maneuver", "i", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(NavSignManeuverCellAccessibility *)self safeUIViewForKey:@"primaryTextLabel"];
  if ([v3 _accessibilityViewIsVisible])
  {
    v4 = [v3 accessibilityLabel];
  }
  else
  {
    v4 = &stru_26F6E7138;
  }
  v5 = [(NavSignManeuverCellAccessibility *)self safeUIViewForKey:@"secondaryTextLabel"];
  if ([v5 _accessibilityViewIsVisible])
  {
    v12 = [v5 accessibilityLabel];
    v13 = @"__AXStringForVariablesSentinel";
    uint64_t v6 = __UIAXStringForVariables();

    v4 = (__CFString *)v6;
  }
  v7 = [(NavSignManeuverCellAccessibility *)self safeValueForKeyPath:@"guidanceManeuverView.maneuverArtwork", v12, v13];
  int v8 = [v7 safeIntForKey:@"maneuver"];

  if (v8)
  {
    AXMapsStringForManeuverType(v8);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = &stru_26F6E7138;
  }
  v10 = __UIAXStringForVariables();

  return v10;
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0;
}

@end