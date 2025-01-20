@interface CNContactHeaderStaticDisplayViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)setUpPosterView;
@end

@implementation CNContactHeaderStaticDisplayViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNContactHeaderStaticDisplayView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)setUpPosterView
{
  v3.receiver = self;
  v3.super_class = (Class)CNContactHeaderStaticDisplayViewInvertColorsAccessibility;
  [(CNContactHeaderStaticDisplayViewInvertColorsAccessibility *)&v3 setUpPosterView];
  [(CNContactHeaderStaticDisplayViewInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)_accessibilityLoadInvertColors
{
  id v2 = [(CNContactHeaderStaticDisplayViewInvertColorsAccessibility *)self safeUIViewForKey:@"posterView"];
  [v2 setAccessibilityIgnoresInvertColors:1];
}

@end