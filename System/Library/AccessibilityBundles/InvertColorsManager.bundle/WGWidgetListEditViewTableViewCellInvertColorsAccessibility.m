@interface WGWidgetListEditViewTableViewCellInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)layoutSubviews;
@end

@implementation WGWidgetListEditViewTableViewCellInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WGWidgetListEditViewTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  id v2 = [(WGWidgetListEditViewTableViewCellInvertColorsAccessibility *)self safeValueForKey:@"imageView"];
  [v2 setAccessibilityIgnoresInvertColors:1];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)WGWidgetListEditViewTableViewCellInvertColorsAccessibility;
  [(WGWidgetListEditViewTableViewCellInvertColorsAccessibility *)&v3 layoutSubviews];
  [(WGWidgetListEditViewTableViewCellInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end