@interface SSSScreenshotsViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityHint;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SSSScreenshotsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SSSScreenshotsView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SSSScreenshotsView", @"state", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SSSScreenshotsView", @"numberOfScreenshotImages", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SSSScreenshotsView", @"currentScreenshotView", "@", 0);
  [v3 validateClass:@"SSSScreenshotView" hasInstanceVariable:@"_imageCropController" withType:"SSSCropController"];
  [v3 validateClass:@"SSSCropControllerRootView" hasInstanceVariable:@"_overlayView" withType:"SSSCropOverlayView"];
  [v3 validateClass:@"SSSCropController" hasInstanceVariable:@"_rootView" withType:"SSSCropControllerRootView"];
  [v3 validateClass:@"SSSCropOverlayView" hasInstanceVariable:@"_grabberViews" withType:"NSArray"];
  [v3 validateClass:@"SSSCropOverlayView" hasInstanceVariable:@"_cornerViews" withType:"NSArray"];
}

- (BOOL)isAccessibilityElement
{
  return [(SSSScreenshotsViewAccessibility *)self safeIntegerForKey:@"state"] == 0;
}

- (id)accessibilityIdentifier
{
  return @"SSSScreenshotsView";
}

- (id)accessibilityLabel
{
  if ([(SSSScreenshotsViewAccessibility *)self safeIntegerForKey:@"numberOfScreenshotImages"] == 1)v2 = @"screenshot.title"; {
  else
  }
    v2 = @"screenshots.title";

  return accessibilityLocalizedString(v2);
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"screenshot.hint");
}

- (unint64_t)accessibilityTraits
{
  BOOL v2 = [(SSSScreenshotsViewAccessibility *)self isAccessibilityElement];
  id v3 = (unint64_t *)MEMORY[0x263F1CEE8];
  if (!v2) {
    id v3 = (unint64_t *)MEMORY[0x263F1CF18];
  }
  return *v3;
}

- (id)_accessibilitySupplementaryFooterViews
{
  if ([(SSSScreenshotsViewAccessibility *)self isAccessibilityElement])
  {
    id v3 = [(SSSScreenshotsViewAccessibility *)self safeValueForKey:@"currentScreenshotView"];
    v4 = [v3 safeValueForKey:@"_imageCropController"];
    v5 = [v4 safeValueForKey:@"_rootView"];

    v6 = [v5 safeValueForKey:@"_overlayView"];
    v7 = [v6 safeArrayForKey:@"_grabberViews"];

    v8 = [v5 safeValueForKey:@"_overlayView"];
    v9 = [v8 safeArrayForKey:@"_cornerViews"];

    v10 = [MEMORY[0x263EFF980] array];
    [v10 axSafelyAddObjectsFromArray:v7];
    [v10 axSafelyAddObjectsFromArray:v9];
    v11 = [v10 sortedArrayUsingSelector:sel_accessibilityCompareGeometry_];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end