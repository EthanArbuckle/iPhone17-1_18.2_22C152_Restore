@interface AVTViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
- (void)_accessibilityLoadInvertColors;
- (void)layoutSubviews;
@end

@implementation AVTViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVTView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

- (void)_accessibilityLoadInvertColors
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  if (UIAccessibilityIsInvertColorsEnabled()) {
    +[UIColor blackColor];
  }
  else {
  v3 = +[UIColor whiteColor];
  }
  [v2 setBackgroundColor:v3];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)AVTViewInvertColorsAccessibility;
  [(AVTViewInvertColorsAccessibility *)&v3 layoutSubviews];
  [(AVTViewInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end