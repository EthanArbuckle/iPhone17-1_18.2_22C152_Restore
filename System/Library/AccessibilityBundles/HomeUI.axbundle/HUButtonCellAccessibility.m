@interface HUButtonCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (unint64_t)accessibilityTraits;
@end

@implementation HUButtonCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUButtonCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)HUButtonCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(HUButtonCellAccessibility *)&v3 accessibilityTraits];
}

@end