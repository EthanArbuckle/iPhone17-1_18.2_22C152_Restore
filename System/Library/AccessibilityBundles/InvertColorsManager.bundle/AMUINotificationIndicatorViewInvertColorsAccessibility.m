@interface AMUINotificationIndicatorViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)layoutSubviews;
@end

@implementation AMUINotificationIndicatorViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AMUINotificationIndicatorView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  [v2 setAccessibilityIgnoresInvertColors:0];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)AMUINotificationIndicatorViewInvertColorsAccessibility;
  [(AMUINotificationIndicatorViewInvertColorsAccessibility *)&v3 layoutSubviews];
  [(AMUINotificationIndicatorViewInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end