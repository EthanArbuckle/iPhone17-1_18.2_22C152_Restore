@interface OBBulletedListItemInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)layoutSubviews;
@end

@implementation OBBulletedListItemInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"OBBulletedListItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  id v2 = [(OBBulletedListItemInvertColorsAccessibility *)self safeValueForKey:@"imageView"];
  [v2 setAccessibilityIgnoresInvertColors:1];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)OBBulletedListItemInvertColorsAccessibility;
  [(OBBulletedListItemInvertColorsAccessibility *)&v3 layoutSubviews];
  [(OBBulletedListItemInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end