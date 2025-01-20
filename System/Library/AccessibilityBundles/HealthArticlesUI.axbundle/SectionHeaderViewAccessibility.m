@interface SectionHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SectionHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HealthArticlesUI.SectionHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(SectionHeaderViewAccessibility *)self _accessibilityTextForSubhierarchyIncludingHeaders:0 focusableItems:0 exclusions:0];
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)SectionHeaderViewAccessibility;
  return *MEMORY[0x263F1CEF8] | [(SectionHeaderViewAccessibility *)&v3 accessibilityTraits];
}

@end