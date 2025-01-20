@interface SVSCardContainerViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)layoutSubviews;
@end

@implementation SVSCardContainerViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SVSCardContainerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  v16 = self;
  [(SVSCardContainerViewInvertColorsAccessibility *)v16 setAccessibilityIgnoresInvertColors:1];
  BOOL IsInvertColorsEnabled = UIAccessibilityIsInvertColorsEnabled();
  v3 = [(SVSCardContainerViewInvertColorsAccessibility *)v16 viewWithTag:5728595];
  id v4 = v3;
  if (IsInvertColorsEnabled)
  {

    if (v4) {
      goto LABEL_6;
    }
    id v5 = objc_alloc((Class)UIView);
    [(SVSCardContainerViewInvertColorsAccessibility *)v16 bounds];
    id v4 = objc_msgSend(v5, "initWithFrame:");
    [v4 setTag:5728595];
    v6 = +[UIColor colorWithWhite:0.25 alpha:0.75];
    [v4 setBackgroundColor:v6];

    [(SVSCardContainerViewInvertColorsAccessibility *)v16 _continuousCornerRadius];
    objc_msgSend(v4, "_setContinuousCornerRadius:");
    [v4 setUserInteractionEnabled:0];
    [(SVSCardContainerViewInvertColorsAccessibility *)v16 insertSubview:v4 atIndex:0];
  }
  else
  {
    [v3 removeFromSuperview];
  }

LABEL_6:
  uint64_t v7 = [(SVSCardContainerViewInvertColorsAccessibility *)v16 superview];
  if (v7)
  {
    v8 = (void *)v7;
    do
    {
      AXSafeClassFromString();
      if (objc_opt_isKindOfClass())
      {
        BOOL v9 = UIAccessibilityIsInvertColorsEnabled();
        v10 = [v8 viewWithTag:12739502];
        id v11 = v10;
        if (!v9)
        {
          [v10 removeFromSuperview];
          goto LABEL_13;
        }

        if (!v11)
        {
          id v12 = objc_alloc((Class)UIView);
          [v8 bounds];
          id v11 = objc_msgSend(v12, "initWithFrame:");
          [v11 setTag:12739502];
          v13 = +[UIColor whiteColor];
          v14 = [v13 colorWithAlphaComponent:0.9];
          [v11 setBackgroundColor:v14];

          [v8 insertSubview:v11 atIndex:0];
LABEL_13:
        }
      }
      uint64_t v15 = [v8 superview];

      v8 = (void *)v15;
    }
    while (v15);
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SVSCardContainerViewInvertColorsAccessibility;
  [(SVSCardContainerViewInvertColorsAccessibility *)&v3 layoutSubviews];
  [(SVSCardContainerViewInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end