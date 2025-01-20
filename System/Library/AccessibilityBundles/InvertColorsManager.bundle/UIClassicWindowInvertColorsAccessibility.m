@interface UIClassicWindowInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (UIClassicWindowInvertColorsAccessibility)initWithFrame:(CGRect)a3;
- (void)_accessibilityLoadInvertColors;
@end

@implementation UIClassicWindowInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIClassicWindow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  BOOL IsInvertColorsEnabled = UIAccessibilityIsInvertColorsEnabled();
  v4 = [(UIClassicWindowInvertColorsAccessibility *)self _accessibilityValueForKey:@"backgroundColor"];
  v5 = v4;
  if (IsInvertColorsEnabled)
  {

    if (!v5)
    {
      v6 = [(UIClassicWindowInvertColorsAccessibility *)self backgroundColor];
      [(UIClassicWindowInvertColorsAccessibility *)self _accessibilitySetRetainedValue:v6 forKey:@"backgroundColor"];
    }
    id v7 = +[UIColor whiteColor];
    [(UIClassicWindowInvertColorsAccessibility *)self setBackgroundColor:v7];
  }
  else
  {
    [(UIClassicWindowInvertColorsAccessibility *)self setBackgroundColor:v4];

    [(UIClassicWindowInvertColorsAccessibility *)self _accessibilityRemoveValueForKey:@"backgroundColor"];
  }
}

- (UIClassicWindowInvertColorsAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIClassicWindowInvertColorsAccessibility;
  v3 = -[UIClassicWindowInvertColorsAccessibility initWithFrame:](&v5, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(UIClassicWindowInvertColorsAccessibility *)v3 _accessibilityLoadInvertColors];

  return v3;
}

@end