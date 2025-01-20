@interface SBHVisualStylingViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)_updateVisualStyling;
@end

@implementation SBHVisualStylingViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBHVisualStylingView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_updateVisualStyling
{
  if (UIAccessibilityIsInvertColorsEnabled())
  {
    v4 = _NSConcreteStackBlock;
    uint64_t v5 = 3221225472;
    v6 = sub_18A54;
    v7 = &unk_44528;
    v8 = self;
    AXPerformSafeBlock();
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)SBHVisualStylingViewInvertColorsAccessibility;
    [(SBHVisualStylingViewInvertColorsAccessibility *)&v3 _updateVisualStyling];
  }
}

- (void)_accessibilityLoadInvertColors
{
  if (UIAccessibilityIsInvertColorsEnabled())
  {
    objc_super v3 = v6;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v4 = sub_18B14;
  }
  else
  {
    objc_super v3 = v5;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v4 = sub_18B1C;
  }
  v3[2] = v4;
  v3[3] = &unk_44528;
  v3[4] = self;
  AXPerformSafeBlock();
}

@end