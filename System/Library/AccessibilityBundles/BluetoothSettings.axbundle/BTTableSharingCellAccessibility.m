@interface BTTableSharingCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityHint;
- (unint64_t)accessibilityTraits;
@end

@implementation BTTableSharingCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BTTableSharingCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)BTTableSharingCellAccessibility;
  return (*MEMORY[0x263F1CEE8] | [(BTTableSharingCellAccessibility *)&v3 accessibilityTraits]) & ~*MEMORY[0x263F1CF20];
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"bluetooth.sharing.item.hint");
}

@end