@interface PDFPageViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)didMoveToWindow;
@end

@implementation PDFPageViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PDFPageView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  v6 = self;
  v2 = [(PDFPageViewInvertColorsAccessibility *)v6 window];
  if (+[AXInvertColorsAppHelper hasInvertFilter:v2])
  {
    int v3 = _AXSInvertColorsEnabled();

    v4 = v6;
    if (v3)
    {
      [(PDFPageViewInvertColorsAccessibility *)v6 setAccessibilityInvertColorsIsolatedTree:1];
      v5 = [(PDFPageViewInvertColorsAccessibility *)v6 layer];
      +[AXInvertColorsAppHelper applyInvertFilterToLayer:v5];
      goto LABEL_6;
    }
  }
  else
  {

    v4 = v6;
  }
  [(PDFPageViewInvertColorsAccessibility *)v4 setAccessibilityInvertColorsIsolatedTree:0];
  v5 = [(PDFPageViewInvertColorsAccessibility *)v6 layer];
  +[AXInvertColorsAppHelper unapplyInvertFilterToLayer:v5];
LABEL_6:
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)PDFPageViewInvertColorsAccessibility;
  [(PDFPageViewInvertColorsAccessibility *)&v3 didMoveToWindow];
  [(PDFPageViewInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end