@interface EKEventDetailCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (unint64_t)accessibilityTraits;
@end

@implementation EKEventDetailCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"EKEventDetailCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  if ([(EKEventDetailCellAccessibility *)self accessoryType] == 1) {
    return *MEMORY[0x263F1CEE8];
  }
  v4.receiver = self;
  v4.super_class = (Class)EKEventDetailCellAccessibility;
  return [(EKEventDetailCellAccessibility *)&v4 accessibilityTraits];
}

@end