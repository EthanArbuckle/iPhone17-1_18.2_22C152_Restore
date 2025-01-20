@interface SiriUISiriStatusViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)layoutSubviews;
@end

@implementation SiriUISiriStatusViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SiriUISiriStatusView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SiriUISiriStatusViewInvertColorsAccessibility;
  [(SiriUISiriStatusViewInvertColorsAccessibility *)&v3 layoutSubviews];
  [(SiriUISiriStatusViewInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)_accessibilityLoadInvertColors
{
  if (+[AXInvertColorsManager objectIsOnCarScreen:self]) {
    return;
  }
  objc_super v3 = [(SiriUISiriStatusViewInvertColorsAccessibility *)self superview];
  id v29 = [v3 superview];

  if (UIAccessibilityIsInvertColorsEnabled()
    && (+[AXSpringBoardServer server],
        v4 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v5 = [v4 isDarkModeActive],
        v4,
        (v5 & 1) == 0))
  {
    v9 = [v29 viewWithTag:429375493];

    if (v9) {
      goto LABEL_6;
    }
    v10 = [(SiriUISiriStatusViewInvertColorsAccessibility *)self safeUIViewForKey:@"_touchInputView"];
    [v10 bounds];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;

    v19 = [(SiriUISiriStatusViewInvertColorsAccessibility *)self safeUIViewForKey:@"_touchInputView"];
    objc_msgSend(v29, "convertRect:fromView:", v19, v12, v14, v16, v18);
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;

    id v6 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v21, v23, v25, v27);
    [v6 setTag:429375493];
    v28 = +[UIColor whiteColor];
    [v6 setBackgroundColor:v28];

    [v6 setAutoresizingMask:18];
    [v29 insertSubview:v6 atIndex:0];
  }
  else
  {
    id v6 = [v29 viewWithTag:429375493];
    [v6 removeFromSuperview];
  }

LABEL_6:
  v7 = [(SiriUISiriStatusViewInvertColorsAccessibility *)self safeUIViewForKey:@"_flamesView"];
  [v7 setAccessibilityIgnoresInvertColors:1];

  v8 = [(SiriUISiriStatusViewInvertColorsAccessibility *)self safeUIViewForKey:@"_glyphView"];
  [v8 setAccessibilityIgnoresInvertColors:1];
}

@end