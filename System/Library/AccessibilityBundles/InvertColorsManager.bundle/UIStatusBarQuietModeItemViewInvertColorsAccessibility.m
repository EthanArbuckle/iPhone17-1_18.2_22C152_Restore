@interface UIStatusBarQuietModeItemViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (UIStatusBarQuietModeItemViewInvertColorsAccessibility)initWithFrame:(CGRect)a3;
- (void)_accessibilityLoadInvertColors;
- (void)setAlpha:(double)a3;
@end

@implementation UIStatusBarQuietModeItemViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIStatusBarQuietModeItemView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (UIStatusBarQuietModeItemViewInvertColorsAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIStatusBarQuietModeItemViewInvertColorsAccessibility;
  v3 = -[UIStatusBarQuietModeItemViewInvertColorsAccessibility initWithFrame:](&v5, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(UIStatusBarQuietModeItemViewInvertColorsAccessibility *)v3 _accessibilityLoadInvertColors];

  return v3;
}

- (void)setAlpha:(double)a3
{
  if (UIAccessibilityIsInvertColorsEnabled())
  {
    if (byte_83659)
    {
      v7.receiver = self;
      v7.super_class = (Class)UIStatusBarQuietModeItemViewInvertColorsAccessibility;
      [(UIStatusBarQuietModeItemViewInvertColorsAccessibility *)&v7 setAlpha:a3];
    }
    else
    {
      [(UIStatusBarQuietModeItemViewInvertColorsAccessibility *)self alpha];
      +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      [(UIStatusBarQuietModeItemViewInvertColorsAccessibility *)self _accessibilitySetRetainedValue:v5 forKey:@"InvertColorAlpha"];
    }
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UIStatusBarQuietModeItemViewInvertColorsAccessibility;
    [(UIStatusBarQuietModeItemViewInvertColorsAccessibility *)&v6 setAlpha:a3];
  }
}

- (void)_accessibilityLoadInvertColors
{
  BOOL IsInvertColorsEnabled = UIAccessibilityIsInvertColorsEnabled();
  v4 = [(UIStatusBarQuietModeItemViewInvertColorsAccessibility *)self _accessibilityValueForKey:@"InvertColorAlpha"];
  if (IsInvertColorsEnabled)
  {
    id v6 = v4;

    if (!v6)
    {
      [(UIStatusBarQuietModeItemViewInvertColorsAccessibility *)self alpha];
      id v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [(UIStatusBarQuietModeItemViewInvertColorsAccessibility *)self _accessibilitySetRetainedValue:v5 forKey:@"InvertColorAlpha"];
    }
    byte_83659 = 1;
    [(UIStatusBarQuietModeItemViewInvertColorsAccessibility *)self setAlpha:1.0];
    byte_83659 = 0;
  }
  else
  {
    if (v4)
    {
      id v7 = v4;
      [v4 doubleValue];
      byte_83659 = 1;
      -[UIStatusBarQuietModeItemViewInvertColorsAccessibility setAlpha:](self, "setAlpha:");
      byte_83659 = 0;
      [(UIStatusBarQuietModeItemViewInvertColorsAccessibility *)self _accessibilityRemoveValueForKey:@"InvertColorAlpha"];
      v4 = v7;
    }
  }
}

@end