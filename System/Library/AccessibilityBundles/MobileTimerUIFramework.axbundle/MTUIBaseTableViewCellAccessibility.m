@interface MTUIBaseTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (unint64_t)accessibilityTraits;
@end

@implementation MTUIBaseTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MTUIBaseTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)MTUIBaseTableViewCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(MTUIBaseTableViewCellAccessibility *)&v3 accessibilityTraits];
}

@end