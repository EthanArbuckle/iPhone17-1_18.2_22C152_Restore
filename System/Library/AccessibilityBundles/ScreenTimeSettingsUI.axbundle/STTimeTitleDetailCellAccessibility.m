@interface STTimeTitleDetailCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (unint64_t)accessibilityTraits;
@end

@implementation STTimeTitleDetailCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"STTimeTitleDetailCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)STTimeTitleDetailCellAccessibility;
  return [(STTimeTitleDetailCellAccessibility *)&v3 accessibilityTraits] & ~*MEMORY[0x263F1CF20];
}

@end