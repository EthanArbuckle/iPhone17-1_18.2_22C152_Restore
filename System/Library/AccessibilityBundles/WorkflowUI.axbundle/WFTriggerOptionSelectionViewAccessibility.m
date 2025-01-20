@interface WFTriggerOptionSelectionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation WFTriggerOptionSelectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WFTriggerOptionSelectionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)MEMORY[0x270F80938](self, a2);
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)WFTriggerOptionSelectionViewAccessibility;
  unint64_t v3 = *MEMORY[0x263F1CEE8] | [(WFTriggerOptionSelectionViewAccessibility *)&v7 accessibilityTraits];
  int v4 = [(WFTriggerOptionSelectionViewAccessibility *)self safeBoolForKey:@"selected"];
  uint64_t v5 = *MEMORY[0x263F1CF38];
  if (!v4) {
    uint64_t v5 = 0;
  }
  return v3 | v5;
}

@end