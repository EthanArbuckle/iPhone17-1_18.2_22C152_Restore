@interface SearchUIRichTitleCardSectionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityLabel;
@end

@implementation SearchUIRichTitleCardSectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SearchUIRichTitleCardSectionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"TLKHeaderView"];
  [v3 validateClass:@"SearchUIButtonItemView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SearchUIRichTitleCardSectionView", @"headerView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TLKHeaderView", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TLKHeaderView", @"subtitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TLKHeaderView", @"trailingText", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TLKHeaderView", @"footnote", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TLKHeaderView", @"roundedBorderText", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(SearchUIRichTitleCardSectionViewAccessibility *)self safeValueForKey:@"headerView"];
  id v3 = [v2 safeValueForKey:@"title"];
  v4 = [v3 safeStringForKey:@"text"];

  v5 = [v2 safeValueForKey:@"subtitle"];
  v6 = [v5 safeStringForKey:@"text"];

  v7 = [v2 safeValueForKey:@"trailingText"];
  v8 = [v7 safeStringForKey:@"text"];

  v9 = [v2 safeValueForKey:@"footnote"];
  v10 = [v9 safeStringForKey:@"footnote"];

  v13 = [v2 safeStringForKey:@"roundedBorderText"];
  v11 = __UIAXStringForVariables();

  return v11;
}

- (id)_accessibilitySupplementaryFooterViews
{
  return (id)[(SearchUIRichTitleCardSectionViewAccessibility *)self _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_9];
}

uint64_t __87__SearchUIRichTitleCardSectionViewAccessibility__accessibilitySupplementaryFooterViews__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Searchuibutton_1.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end