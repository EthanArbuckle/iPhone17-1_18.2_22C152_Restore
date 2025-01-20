@interface SearchUIPersonHeaderCardSectionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SearchUIPersonHeaderCardSectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SearchUIPersonHeaderCardSectionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SearchUIPersonHeaderCardSectionView" hasProperty:@"section" withType:"@"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFPersonHeaderCardSection", @"person", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFPerson", @"displayName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SearchUIPersonHeaderCardSectionView", @"viewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SearchUIPersonHeaderViewController", @"userIsUnavailable", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)SearchUIPersonHeaderCardSectionViewAccessibility;
  return *MEMORY[0x263F1CEF8] | [(SearchUIPersonHeaderCardSectionViewAccessibility *)&v3 accessibilityTraits] | *MEMORY[0x263F1CEE8];
}

- (id)accessibilityLabel
{
  objc_super v3 = [(SearchUIPersonHeaderCardSectionViewAccessibility *)self safeValueForKey:@"section"];
  v4 = [v3 safeValueForKey:@"person"];
  v5 = [v4 safeStringForKey:@"displayName"];

  [(SearchUIPersonHeaderCardSectionViewAccessibility *)self safeValueForKey:@"viewController"];
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  AXPerformSafeBlock();
  LODWORD(v3) = *((unsigned __int8 *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  if (v3)
  {
    v9 = accessibilityLocalizedString(@"user.unavailable");
    uint64_t v7 = __UIAXStringForVariables();

    v5 = (void *)v7;
  }

  return v5;
}

uint64_t __70__SearchUIPersonHeaderCardSectionViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) userIsUnavailable];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"suggestion.contacts.header.hint");
}

- (id)_accessibilitySupplementaryFooterViews
{
  return (id)[(SearchUIPersonHeaderCardSectionViewAccessibility *)self _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_5];
}

uint64_t __90__SearchUIPersonHeaderCardSectionViewAccessibility__accessibilitySupplementaryFooterViews__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Cnactionview.isa);
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = [v2 _accessibilityViewIsVisible];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

@end