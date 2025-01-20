@interface RemoteUITableViewCellInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)layoutSubviews;
@end

@implementation RemoteUITableViewCellInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"RemoteUITableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  id v2 = [(RemoteUITableViewCellInvertColorsAccessibility *)self safeValueForKey:@"imageView"];
  [v2 setAccessibilityIgnoresInvertColors:1];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)RemoteUITableViewCellInvertColorsAccessibility;
  [(RemoteUITableViewCellInvertColorsAccessibility *)&v3 layoutSubviews];
  [(RemoteUITableViewCellInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end