@interface LUIClassTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityHint;
- (unint64_t)accessibilityTraits;
@end

@implementation LUIClassTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"LUIClassTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)LUIClassTableViewCellAccessibility;
  return (*MEMORY[0x263F1CEE8] | [(LUIClassTableViewCellAccessibility *)&v3 accessibilityTraits]) & ~*MEMORY[0x263F1CF38];
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"class.select.cell.hint");
}

@end