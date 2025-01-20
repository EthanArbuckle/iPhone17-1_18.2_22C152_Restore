@interface UIViewFreeformInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityAppliesInvertColorsInDarkUI;
@end

@implementation UIViewFreeformInvertColorsAccessibility

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
  v3 = [(UIViewFreeformInvertColorsAccessibility *)v2 subviews];
  v4 = [v3 firstObject];
  v5 = [v4 backgroundColor];
  AXColorGetLuma();
  double v7 = v6;

  if (v7 <= 0.8)
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    v8 = v2;
    if (v8)
    {
      while (1)
      {
        v9 = +[UIViewController viewControllerForView:v8];
        AXSafeClassFromString();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass) {
          break;
        }
        uint64_t v11 = [(UIViewFreeformInvertColorsAccessibility *)v8 superview];

        v8 = (UIViewFreeformInvertColorsAccessibility *)v11;
        if (!v11) {
          goto LABEL_8;
        }
      }

      LOBYTE(v8) = 1;
    }
  }
LABEL_8:

  return (char)v8;
}

@end