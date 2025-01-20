@interface TitleViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation TitleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HealthArticlesUI.TitleView";
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
  return (id)[(TitleViewAccessibility *)self _accessibilityTextForSubhierarchyIncludingHeaders:0 focusableItems:0 exclusions:0];
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)TitleViewAccessibility;
  return *MEMORY[0x263F1CEF8] | [(TitleViewAccessibility *)&v3 accessibilityTraits];
}

@end