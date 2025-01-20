@interface VideosUI_UnifiedOverlayViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axScorecard;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation VideosUI_UnifiedOverlayViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VideosUI.UnifiedOverlayView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"VideosUI.UnifiedOverlayView" hasSwiftField:@"selectionView" withSwiftType:"Optional<VUIImageView>"];
  [v3 validateClass:@"VideosUI.UnifiedOverlayView" hasProperty:@"accessibilityTextLabel" withType:"@"];
  [v3 validateClass:@"VideosUI.UnifiedOverlayView" hasProperty:@"accessibilitySubtitleLabel" withType:"@"];
  [v3 validateClass:@"VideosUI.UnifiedOverlayView" hasProperty:@"accessibilityAppImageView" withType:"@"];
  [v3 validateClass:@"VideosUI.UnifiedOverlayView" hasProperty:@"accessibilityLogoImageView" withType:"@"];
  [v3 validateClass:@"VideosUI.UnifiedOverlayView" hasProperty:@"accessibilityProgressView" withType:"@"];
  [v3 validateClass:@"VideosUI.StyledProgressBarView" hasProperty:@"accessibilityProgress" withType:"d"];
  [v3 validateClass:@"VideosUI.UnifiedOverlayView" hasProperty:@"accessibilityBadgeView" withType:"@"];
  [v3 validateClass:@"VideosUI.UnifiedOverlayView" hasProperty:@"accessibilityTextBadge" withType:"@"];
  [v3 validateClass:@"VideosUI.UnifiedOverlayView" hasSwiftField:@"scorecardView" withSwiftType:"Optional<_UIHostingView<ScoreboardImageWrapper>>"];
  [v3 validateClass:@"VUIScorecardView"];
}

- (id)_axScorecard
{
  objc_opt_class();
  id v3 = [(VideosUI_UnifiedOverlayViewAccessibility *)self safeSwiftValueForKey:@"scorecardView"];
  v4 = __UIAccessibilityCastAsClass();

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [(VideosUI_UnifiedOverlayViewAccessibility *)self _accessibilityDescendantOfType:MEMORY[0x245669780](@"VUIScorecardView")];
  }
  v6 = v5;

  return v6;
}

- (id)accessibilityLabel
{
  v26 = [(VideosUI_UnifiedOverlayViewAccessibility *)self safeValueForKey:@"accessibilitySubtitleLabel"];
  id v3 = [(VideosUI_UnifiedOverlayViewAccessibility *)self safeUIViewForKey:@"accessibilityAppImageView"];
  v25 = [(VideosUI_UnifiedOverlayViewAccessibility *)self safeUIViewForKey:@"accessibilityLogoImageView"];
  v4 = [(VideosUI_UnifiedOverlayViewAccessibility *)self safeValueForKey:@"accessibilityProgressView"];
  [v4 safeCGFloatForKey:@"accessibilityProgress"];
  double v6 = v5;

  if (fabs(v6) < 0.000001)
  {
    v10 = 0;
  }
  else
  {
    v7 = NSString;
    v8 = accessibilityLocalizedString(@"content.percentage.complete");
    v9 = AXFormatFloatWithPercentage();
    v10 = objc_msgSend(v7, "stringWithFormat:", v8, v9);
  }
  v22 = [(VideosUI_UnifiedOverlayViewAccessibility *)self safeUIViewForKey:@"accessibilityBadgeView"];
  v21 = [(VideosUI_UnifiedOverlayViewAccessibility *)self safeUIViewForKey:@"accessibilityTextBadge"];
  v24 = [(VideosUI_UnifiedOverlayViewAccessibility *)self safeValueForKey:@"accessibilityTextLabel"];
  v11 = [v24 accessibilityLabel];
  v12 = accessibilityExpandTVEpisodeNumber(v11);
  v13 = [v3 accessibilityLabel];
  v14 = [v25 accessibilityLabel];
  [v22 accessibilityLabel];
  v15 = v23 = v3;
  v16 = [v21 accessibilityLabel];
  v17 = [(VideosUI_UnifiedOverlayViewAccessibility *)self _axScorecard];
  v19 = [v17 accessibilityLabel];
  __UIAXStringForVariables();
  id v20 = (id)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)accessibilityValue
{
  char v9 = 0;
  objc_opt_class();
  id v3 = [(VideosUI_UnifiedOverlayViewAccessibility *)self safeSwiftValueForKey:@"selectionView"];
  v4 = __UIAccessibilityCastAsClass();

  if (v4)
  {
    uint64_t v5 = accessibilityLocalizedString(@"content.selected");
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)VideosUI_UnifiedOverlayViewAccessibility;
    uint64_t v5 = [(VideosUI_UnifiedOverlayViewAccessibility *)&v8 accessibilityValue];
  }
  double v6 = (void *)v5;

  return v6;
}

@end