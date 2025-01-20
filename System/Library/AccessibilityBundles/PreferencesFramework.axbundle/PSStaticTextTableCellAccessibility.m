@interface PSStaticTextTableCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (unint64_t)accessibilityTraits;
@end

@implementation PSStaticTextTableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PSStaticTextTableCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  v5.receiver = self;
  v5.super_class = (Class)PSStaticTextTableCellAccessibility;
  unint64_t v2 = [(PSStaticTextTableCellAccessibility *)&v5 accessibilityTraits];
  uint64_t v3 = *MEMORY[0x263F1CEE8];
  if ((*MEMORY[0x263F1CEE8] & v2) == 0) {
    uint64_t v3 = 0;
  }
  return v3 ^ v2;
}

@end