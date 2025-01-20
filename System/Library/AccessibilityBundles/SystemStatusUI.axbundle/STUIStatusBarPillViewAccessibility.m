@interface STUIStatusBarPillViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityInTopLevelTabLoop;
- (BOOL)accessibilityRespondsToUserInteraction;
- (BOOL)canBecomeFocused;
- (BOOL)isAccessibilityElement;
- (id)accessibilityElements;
- (id)accessibilityHint;
- (unint64_t)accessibilityTraits;
@end

@implementation STUIStatusBarPillViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"STUIStatusBarPillView";
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
  v2 = [(STUIStatusBarPillViewAccessibility *)self accessibilityLabel];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  v2 = [(STUIStatusBarPillViewAccessibility *)self accessibilityLabel];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (BOOL)_accessibilityInTopLevelTabLoop
{
  return 1;
}

- (id)accessibilityElements
{
  if ([(STUIStatusBarPillViewAccessibility *)self isAccessibilityElement]) {
    v2 = 0;
  }
  else {
    v2 = (void *)MEMORY[0x263EFFA68];
  }

  return v2;
}

- (id)accessibilityHint
{
  BOOL v3 = accessibilityLocalizedString(@"status.backgroundactivity.hint");
  v6 = AXStatusBarItemHint(self);
  v4 = __UIAXStringForVariables();

  return v4;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)STUIStatusBarPillViewAccessibility;
  unint64_t v3 = *MEMORY[0x263F813F0] | [(STUIStatusBarPillViewAccessibility *)&v7 accessibilityTraits] | *MEMORY[0x263F1CEE8];
  v4 = AXStatusBarPillTimeView(self);

  uint64_t v5 = *MEMORY[0x263F1CF68];
  if (!v4) {
    uint64_t v5 = 0;
  }
  return v3 | v5;
}

- (BOOL)canBecomeFocused
{
  v6.receiver = self;
  v6.super_class = (Class)STUIStatusBarPillViewAccessibility;
  if ([(STUIStatusBarPillViewAccessibility *)&v6 canBecomeFocused]) {
    return 1;
  }
  v4 = [(STUIStatusBarPillViewAccessibility *)self accessibilityLabel];
  BOOL v3 = [v4 length] != 0;

  return v3;
}

@end