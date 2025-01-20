@interface RAPCheckmarkTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (unint64_t)accessibilityTraits;
@end

@implementation RAPCheckmarkTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"RAPCheckmarkTableViewCell";
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
  int v3 = [(RAPCheckmarkTableViewCellAccessibility *)self safeBoolForKey:@"isChecked"];
  v7.receiver = self;
  v7.super_class = (Class)RAPCheckmarkTableViewCellAccessibility;
  unint64_t v4 = [(RAPCheckmarkTableViewCellAccessibility *)&v7 accessibilityTraits];
  uint64_t v5 = *MEMORY[0x263F1CF38];
  if (!v3) {
    uint64_t v5 = 0;
  }
  return *MEMORY[0x263F1CEE8] | v4 | v5;
}

@end