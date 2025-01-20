@interface VUIFeaturedCellOverlayViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityLabel;
@end

@implementation VUIFeaturedCellOverlayViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VUIFeaturedCellOverlayView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"VUIFeaturedCellOverlayView" hasProperty:@"appleTVChannelLogoView" withType:"@"];
  [v3 validateClass:@"VUIFeaturedCellOverlayView" hasProperty:@"titleLabel" withType:"@"];
  [v3 validateClass:@"VUIFeaturedCellOverlayView" hasProperty:@"subtitleLabel" withType:"@"];
  [v3 validateClass:@"VUIFeaturedCellOverlayView" hasProperty:@"buttons" withType:"@"];
}

- (BOOL)isAccessibilityElement
{
  return [(VUIFeaturedCellOverlayViewAccessibility *)self _accessibilityIsFocusForFocusEverywhereRunningForFocusItem] ^ 1;
}

- (id)accessibilityLabel
{
  id v3 = (void *)MEMORY[0x263EFF8C0];
  v4 = [(VUIFeaturedCellOverlayViewAccessibility *)self safeValueForKey:@"appleTVChannelLogoView"];
  v5 = [(VUIFeaturedCellOverlayViewAccessibility *)self safeValueForKey:@"titleLabel"];
  v6 = [(VUIFeaturedCellOverlayViewAccessibility *)self safeValueForKey:@"subtitleLabel"];
  v7 = objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 3, v4, v5, v6);

  v8 = AXLabelForElements();

  return v8;
}

- (id)_accessibilitySupplementaryFooterViews
{
  return (id)[(VUIFeaturedCellOverlayViewAccessibility *)self safeArrayForKey:@"buttons"];
}

@end