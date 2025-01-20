@interface UIViewMobileMailInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityAppliesInvertColorsInDarkUI;
@end

@implementation UIViewMobileMailInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityAppliesInvertColorsInDarkUI
{
  v2 = self;
  v3 = [(UIViewMobileMailInvertColorsAccessibility *)v2 backgroundColor];
  AXColorGetLuma();
  double v5 = v4;

  if (v5 <= 0.8)
  {
    char isKindOfClass = 0;
  }
  else
  {
    v6 = [(UIViewMobileMailInvertColorsAccessibility *)v2 subviews];
    v7 = [v6 firstObject];
    AXSafeClassFromString();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

@end