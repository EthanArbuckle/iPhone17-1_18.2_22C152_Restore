@interface BKUIPearlEnrollViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)setBackgroundColor:(id)a3;
@end

@implementation BKUIPearlEnrollViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BKUIPearlEnrollView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  id v5 = [(BKUIPearlEnrollViewInvertColorsAccessibility *)self backgroundColor];
  if (v5)
  {
    AXColorGetLuma();
    BOOL v4 = v3 < 0.5;
  }
  else
  {
    BOOL v4 = 0;
  }
  [(BKUIPearlEnrollViewInvertColorsAccessibility *)self setAccessibilityIgnoresInvertColors:v4];
}

- (void)setBackgroundColor:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BKUIPearlEnrollViewInvertColorsAccessibility;
  [(BKUIPearlEnrollViewInvertColorsAccessibility *)&v4 setBackgroundColor:a3];
  [(BKUIPearlEnrollViewInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end