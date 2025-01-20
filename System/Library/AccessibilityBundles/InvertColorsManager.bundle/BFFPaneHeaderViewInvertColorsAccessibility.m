@interface BFFPaneHeaderViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)setIcon:(id)a3;
@end

@implementation BFFPaneHeaderViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BFFPaneHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  id v2 = [(BFFPaneHeaderViewInvertColorsAccessibility *)self safeUIViewForKey:@"_iconView"];
  [v2 setAccessibilityIgnoresInvertColors:1];
}

- (void)setIcon:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BFFPaneHeaderViewInvertColorsAccessibility;
  [(BFFPaneHeaderViewInvertColorsAccessibility *)&v4 setIcon:a3];
  [(BFFPaneHeaderViewInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end