@interface SBUIActionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SBUIActionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBUIActionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBUIActionView" hasInstanceVariable:@"_titleLabel" withType:"SBUIActionViewLabel"];
  [v3 validateClass:@"SBUIActionView" hasInstanceVariable:@"_subtitleLabel" withType:"SBUIActionViewLabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBUIActionViewLabel", @"text", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (id)accessibilityLabel
{
  id v3 = [(SBUIActionViewAccessibility *)self safeValueForKey:@"_titleLabel"];
  v4 = [v3 safeValueForKey:@"text"];

  v5 = [(SBUIActionViewAccessibility *)self safeValueForKey:@"_subtitleLabel"];
  v6 = [v5 safeValueForKey:@"text"];

  v7 = __UIAXStringForVariables();

  return v7;
}

- (BOOL)accessibilityPerformEscape
{
  v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"AXDismissShortcutMenu" object:0];

  return 1;
}

@end