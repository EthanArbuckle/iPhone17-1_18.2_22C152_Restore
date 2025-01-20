@interface DataTypeLoggingCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (unint64_t)accessibilityTraits;
@end

@implementation DataTypeLoggingCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MenstrualCyclesAppPlugin.DataTypeLoggingCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)DataTypeLoggingCellAccessibility;
  unint64_t v3 = *MEMORY[0x263F1CEE8] | [(DataTypeLoggingCellAccessibility *)&v7 accessibilityTraits];
  int v4 = [(DataTypeLoggingCellAccessibility *)self safeBoolForKey:@"axIsChecked"];
  uint64_t v5 = *MEMORY[0x263F1CF38];
  if (!v4) {
    uint64_t v5 = 0;
  }
  return v3 | v5;
}

@end