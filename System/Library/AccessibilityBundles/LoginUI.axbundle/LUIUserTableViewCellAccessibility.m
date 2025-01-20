@interface LUIUserTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityHint;
- (unint64_t)accessibilityTraits;
@end

@implementation LUIUserTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"LUIUserTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)LUIUserTableViewCellAccessibility;
  return (*MEMORY[0x263F1CEE8] | [(LUIUserTableViewCellAccessibility *)&v3 accessibilityTraits]) & ~*MEMORY[0x263F1CF38];
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"login.cell.hint");
}

@end