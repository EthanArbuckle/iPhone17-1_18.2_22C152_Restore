@interface CCUIMenuModuleItemViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)description;
- (unint64_t)accessibilityTraits;
@end

@implementation CCUIMenuModuleItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CCUIMenuModuleItemView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CCUIMenuModuleItemView" hasInstanceVariable:@"_titleLabel" withType:"BSUIEmojiLabelView"];
  [v3 validateClass:@"CCUIMenuModuleItemView" hasInstanceVariable:@"_subtitleLabel" withType:"BSUIEmojiLabelView"];
  [v3 validateClass:@"CCUIMenuModuleItemView" hasProperty:@"menuItem" withType:"@"];
  [v3 validateClass:@"CCUIMenuModuleItem" hasProperty:@"selected" customGetter:@"isSelected" customSetter:0 withType:"B"];
  [v3 validateClass:@"CCUIMenuModuleItem" hasProperty:@"placeholder" customGetter:@"isPlaceholder" customSetter:0 withType:"B"];
}

- (BOOL)isAccessibilityElement
{
  if ([(CCUIMenuModuleItemViewAccessibility *)self _accessibilityViewIsVisible])
  {
    id v3 = [(CCUIMenuModuleItemViewAccessibility *)self safeValueForKey:@"menuItem"];
    int v4 = [v3 safeBoolForKey:@"isPlaceholder"] ^ 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (id)accessibilityLabel
{
  v2 = [(CCUIMenuModuleItemViewAccessibility *)self safeValueForKey:@"_titleLabel"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityValue
{
  v2 = [(CCUIMenuModuleItemViewAccessibility *)self safeValueForKey:@"_subtitleLabel"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v2 = [(CCUIMenuModuleItemViewAccessibility *)self safeValueForKey:@"menuItem"];
  int v3 = [v2 safeBoolForKey:@"isSelected"];

  uint64_t v4 = *MEMORY[0x263F1CF38];
  if (!v3) {
    uint64_t v4 = 0;
  }
  return v4 | *MEMORY[0x263F1CEE8];
}

- (id)description
{
  int v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)CCUIMenuModuleItemViewAccessibility;
  uint64_t v4 = [(CCUIMenuModuleItemViewAccessibility *)&v9 description];
  v5 = [(CCUIMenuModuleItemViewAccessibility *)self accessibilityLabel];
  v6 = [(CCUIMenuModuleItemViewAccessibility *)self accessibilityValue];
  v7 = [v3 stringWithFormat:@"[%@ label:%@ value:%@]", v4, v5, v6];

  return v7;
}

@end