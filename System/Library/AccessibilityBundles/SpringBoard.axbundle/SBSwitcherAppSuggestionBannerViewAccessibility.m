@interface SBSwitcherAppSuggestionBannerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SBSwitcherAppSuggestionBannerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBSwitcherAppSuggestionBannerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBSwitcherAppSuggestionBannerView" hasInstanceVariable:@"_appLabel" withType:"UILabel"];
  [v3 validateClass:@"SBSwitcherAppSuggestionBannerView" hasInstanceVariable:@"_descriptionLabel" withType:"UILabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  objc_opt_class();
  id v3 = [(SBSwitcherAppSuggestionBannerViewAccessibility *)self safeValueForKey:@"_appLabel"];
  v4 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  v5 = [(SBSwitcherAppSuggestionBannerViewAccessibility *)self safeValueForKey:@"_descriptionLabel"];
  v6 = __UIAccessibilityCastAsClass();

  v7 = [v4 accessibilityLabel];
  v10 = [v6 accessibilityLabel];
  v8 = __UIAXStringForVariables();

  return v8;
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"use.continuity.app");
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

@end