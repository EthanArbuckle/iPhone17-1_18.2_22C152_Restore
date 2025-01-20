@interface HUIconCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (unint64_t)accessibilityTraits;
@end

@implementation HUIconCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUIconCell";
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
  v7.receiver = self;
  v7.super_class = (Class)HUIconCellAccessibility;
  unint64_t v3 = [(HUIconCellAccessibility *)&v7 accessibilityTraits];
  int v4 = [(HUIconCellAccessibility *)self safeBoolForKey:@"isDisabled"];
  uint64_t v5 = *MEMORY[0x263F1CF20];
  if (!v4) {
    uint64_t v5 = 0;
  }
  return v5 | v3;
}

@end