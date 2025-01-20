@interface HUColorSwatchViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)layoutSubviews;
@end

@implementation HUColorSwatchViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUColorSwatchView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)HUColorSwatchViewInvertColorsAccessibility;
  [(HUColorSwatchViewInvertColorsAccessibility *)&v3 layoutSubviews];
  [(HUColorSwatchViewInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)_accessibilityLoadInvertColors
{
  BOOL IsInvertColorsEnabled = UIAccessibilityIsInvertColorsEnabled();
  id v5 = [(HUColorSwatchViewInvertColorsAccessibility *)self safeValueForKey:@"circleLayer"];
  v4 = [(HUColorSwatchViewInvertColorsAccessibility *)self safeValueForKey:@"selectedCircleLayer"];
  if (IsInvertColorsEnabled)
  {
    +[AXInvertColorsAppHelper applyInvertFilterToLayer:v5];
    +[AXInvertColorsAppHelper applyInvertFilterToLayer:v4];
  }
  else
  {
    +[AXInvertColorsAppHelper unapplyInvertFilterToLayer:v5];
    +[AXInvertColorsAppHelper unapplyInvertFilterToLayer:v4];
  }
}

@end