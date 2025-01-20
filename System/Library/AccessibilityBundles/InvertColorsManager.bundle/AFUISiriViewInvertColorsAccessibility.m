@interface AFUISiriViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)layoutSubviews;
@end

@implementation AFUISiriViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AFUISiriView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)AFUISiriViewInvertColorsAccessibility;
  [(AFUISiriViewInvertColorsAccessibility *)&v3 layoutSubviews];
  [(AFUISiriViewInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)_accessibilityLoadInvertColors
{
  if (!+[AXInvertColorsManager objectIsOnCarScreen:self])
  {
    BOOL IsInvertColorsEnabled = UIAccessibilityIsInvertColorsEnabled();
    id v4 = [(AFUISiriViewInvertColorsAccessibility *)self safeUIViewForKey:@"_backdropView"];
    [v4 setHidden:IsInvertColorsEnabled];
  }
}

@end