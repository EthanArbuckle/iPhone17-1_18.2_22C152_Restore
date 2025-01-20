@interface STMostUsedCellInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (STMostUsedCellInvertColorsAccessibility)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)_accessibilityLoadInvertColorsMostUsed;
@end

@implementation STMostUsedCellInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"STMostUsedCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (STMostUsedCellInvertColorsAccessibility)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)STMostUsedCellInvertColorsAccessibility;
  v5 = [(STMostUsedCellInvertColorsAccessibility *)&v7 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  [(STMostUsedCellInvertColorsAccessibility *)v5 _accessibilityLoadInvertColorsMostUsed];

  return v5;
}

- (void)_accessibilityLoadInvertColorsMostUsed
{
  id v2 = [(STMostUsedCellInvertColorsAccessibility *)self safeUIViewForKey:@"_allowanceIconView"];
  [v2 setAccessibilityIgnoresInvertColors:1];
}

@end