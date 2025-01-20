@interface HUQuickControlRingSliderViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)layoutSubviews;
@end

@implementation HUQuickControlRingSliderViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUQuickControlRingSliderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  v3 = [(HUQuickControlRingSliderViewInvertColorsAccessibility *)self safeUIViewForKey:@"_selectedRangeImageView"];
  [v3 setAccessibilityIgnoresInvertColors:1];

  id v4 = [(HUQuickControlRingSliderViewInvertColorsAccessibility *)self safeUIViewForKey:@"selectedRangeImageViewForEdges"];
  [v4 setAccessibilityIgnoresInvertColors:1];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)HUQuickControlRingSliderViewInvertColorsAccessibility;
  [(HUQuickControlRingSliderViewInvertColorsAccessibility *)&v3 layoutSubviews];
  [(HUQuickControlRingSliderViewInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end