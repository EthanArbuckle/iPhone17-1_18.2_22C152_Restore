@interface ColorCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (unint64_t)accessibilityTraits;
@end

@implementation ColorCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HealthMedicationsUI.ColorCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)ColorCellAccessibility;
  unint64_t v3 = *MEMORY[0x263F1CEE8] | [(ColorCellAccessibility *)&v7 accessibilityTraits];
  int v4 = [(ColorCellAccessibility *)self safeBoolForKey:@"_accessibilityCellIsSelected"];
  uint64_t v5 = *MEMORY[0x263F1CF38];
  if (!v4) {
    uint64_t v5 = 0;
  }
  return v3 | v5;
}

@end