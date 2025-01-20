@interface MediaControlsMaterialViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (MediaControlsMaterialViewInvertColorsAccessibility)initWithFrame:(CGRect)a3;
- (void)_accessibilityLoadInvertColors;
- (void)_setContinuousCornerRadius:(double)a3;
@end

@implementation MediaControlsMaterialViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MediaControlsMaterialView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (MediaControlsMaterialViewInvertColorsAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MediaControlsMaterialViewInvertColorsAccessibility;
  v3 = -[MediaControlsMaterialViewInvertColorsAccessibility initWithFrame:](&v5, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(MediaControlsMaterialViewInvertColorsAccessibility *)v3 _accessibilityLoadInvertColors];

  return v3;
}

- (void)_setContinuousCornerRadius:(double)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MediaControlsMaterialViewInvertColorsAccessibility;
  -[MediaControlsMaterialViewInvertColorsAccessibility _setContinuousCornerRadius:](&v6, "_setContinuousCornerRadius:");
  objc_super v5 = +[AXInvertColorsAppHelper backgroundView:self];
  [v5 _setContinuousCornerRadius:a3];
}

- (void)_accessibilityLoadInvertColors
{
  v3 = [(MediaControlsMaterialViewInvertColorsAccessibility *)self safeUIViewForKey:@"_backgroundView"];
  id v6 = [v3 layer];

  if (v6)
  {
    if (UIAccessibilityIsInvertColorsEnabled())
    {
      v4 = +[AXInvertColorsAppHelper insertBackgroundView:self alpha:0.75];
      objc_super v5 = [(MediaControlsMaterialViewInvertColorsAccessibility *)self safeUIViewForKey:@"_backgroundView"];
      [v5 _continuousCornerRadius];
      objc_msgSend(v4, "_setContinuousCornerRadius:");
    }
    else
    {
      +[AXInvertColorsAppHelper removeBackgroundView:self];
    }
  }
}

@end