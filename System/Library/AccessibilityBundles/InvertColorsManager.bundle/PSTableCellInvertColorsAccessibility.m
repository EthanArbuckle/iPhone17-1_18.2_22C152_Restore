@interface PSTableCellInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)setIcon:(id)a3;
@end

@implementation PSTableCellInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PSTableCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  id v2 = [(PSTableCellInvertColorsAccessibility *)self safeValueForKey:@"imageView"];
  [v2 setAccessibilityIgnoresInvertColors:1];
}

- (void)setIcon:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PSTableCellInvertColorsAccessibility;
  [(PSTableCellInvertColorsAccessibility *)&v4 setIcon:a3];
  [(PSTableCellInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end