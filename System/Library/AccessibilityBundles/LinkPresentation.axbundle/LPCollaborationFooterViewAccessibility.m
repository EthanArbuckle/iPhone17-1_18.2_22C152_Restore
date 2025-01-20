@interface LPCollaborationFooterViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation LPCollaborationFooterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"LPCollaborationFooterView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"LPCollaborationFooterView" hasInstanceVariable:@"_optionsView" withType:"LPTextView"];
  [v3 validateClass:@"LPCollaborationFooterView" hasInstanceVariable:@"_subtitleView" withType:"LPTextView"];
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)LPCollaborationFooterViewAccessibility;
  unint64_t v3 = [(LPCollaborationFooterViewAccessibility *)&v7 accessibilityTraits];
  v4 = [(LPCollaborationFooterViewAccessibility *)self safeValueForKey:@"_optionsView"];

  uint64_t v5 = *MEMORY[0x263F1CEE8];
  if (!v4) {
    uint64_t v5 = 0;
  }
  return v5 | v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  unint64_t v3 = [(LPCollaborationFooterViewAccessibility *)self safeValueForKey:@"_optionsView"];
  v4 = [v3 accessibilityLabel];

  uint64_t v5 = [(LPCollaborationFooterViewAccessibility *)self safeValueForKey:@"_subtitleView"];
  v6 = [v5 accessibilityLabel];

  objc_super v7 = __UIAXStringForVariables();

  return v7;
}

@end