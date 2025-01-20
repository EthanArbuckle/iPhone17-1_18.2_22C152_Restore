@interface STStorageTipCellInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (STStorageTipCellInvertColorsAccessibility)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)_accessibilityLoadInvertColors;
@end

@implementation STStorageTipCellInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"STStorageTipCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  id v2 = [(STStorageTipCellInvertColorsAccessibility *)self safeValueForKey:@"_appIconView"];
  [v2 setAccessibilityIgnoresInvertColors:1];
}

- (STStorageTipCellInvertColorsAccessibility)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)STStorageTipCellInvertColorsAccessibility;
  v5 = [(STStorageTipCellInvertColorsAccessibility *)&v7 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  [(STStorageTipCellInvertColorsAccessibility *)v5 _accessibilityLoadInvertColors];

  return v5;
}

@end