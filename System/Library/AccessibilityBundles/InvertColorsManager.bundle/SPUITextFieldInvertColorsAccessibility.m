@interface SPUITextFieldInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)layoutSubviews;
@end

@implementation SPUITextFieldInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SPUITextField";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SPUITextFieldInvertColorsAccessibility;
  [(SPUITextFieldInvertColorsAccessibility *)&v3 layoutSubviews];
  [(SPUITextFieldInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)_accessibilityLoadInvertColors
{
  if (UIAccessibilityIsInvertColorsEnabled()
    && ([(SPUITextFieldInvertColorsAccessibility *)self window],
        objc_super v3 = objc_claimAutoreleasedReturnValue(),
        [v3 traitCollection],
        v4 = objc_claimAutoreleasedReturnValue(),
        v5 = (char *)[v4 userInterfaceStyle],
        v4,
        v3,
        v5 != (unsigned char *)&dword_0 + 2))
  {
    id v9 = [(SPUITextFieldInvertColorsAccessibility *)self safeUIViewForKey:@"blurView"];
    [v9 removeFromSuperview];
  }
  else
  {
    v6 = [(SPUITextFieldInvertColorsAccessibility *)self subviews];
    v7 = [(SPUITextFieldInvertColorsAccessibility *)self safeUIViewForKey:@"blurView"];
    unsigned __int8 v8 = [v6 containsObject:v7];

    if (v8) {
      return;
    }
    id v9 = [(SPUITextFieldInvertColorsAccessibility *)self safeUIViewForKey:@"blurView"];
    -[SPUITextFieldInvertColorsAccessibility addSubview:](self, "addSubview:");
  }
}

@end