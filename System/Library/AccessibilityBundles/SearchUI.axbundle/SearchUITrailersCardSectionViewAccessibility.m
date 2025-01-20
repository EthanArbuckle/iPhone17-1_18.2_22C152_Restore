@interface SearchUITrailersCardSectionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityLabel;
@end

@implementation SearchUITrailersCardSectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SearchUITrailersCardSectionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"TLKLabel"];
  [v3 validateClass:@"TLKLabel" hasProperty:@"multilineText" withType:"@"];
  [v3 validateClass:@"TLKMultilineText"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TLKMultilineText", @"text", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)_accessibilitySupplementaryFooterViews
{
  return (id)[(SearchUITrailersCardSectionViewAccessibility *)self _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_14];
}

uint64_t __86__SearchUITrailersCardSectionViewAccessibility__accessibilitySupplementaryFooterViews__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Searchuitraile_2.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)accessibilityLabel
{
  id v2 = [(SearchUITrailersCardSectionViewAccessibility *)self _accessibilityFindSubviewDescendant:&__block_literal_global_290];
  id v3 = [v2 safeValueForKey:@"multilineText"];
  v4 = [v3 safeStringForKey:@"text"];

  return v4;
}

uint64_t __66__SearchUITrailersCardSectionViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Tlklabel.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end