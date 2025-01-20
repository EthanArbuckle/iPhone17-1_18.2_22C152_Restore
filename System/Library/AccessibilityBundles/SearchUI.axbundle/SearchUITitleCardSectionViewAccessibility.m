@interface SearchUITitleCardSectionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SearchUITitleCardSectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SearchUITitleCardSectionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SearchUICardSectionView", @"section", "@", 0);
  [v3 validateClass:@"SearchUITitleCardSectionView" isKindOfClass:@"SearchUICardSectionView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFTitleCardSection", @"title", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [(SearchUITitleCardSectionViewAccessibility *)self safeArrayForKey:@"subviews", 0, 0];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v12;
    uint64_t v7 = *MEMORY[0x263F1CEE8];
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v9 = v7;
        }
        else {
          uint64_t v9 = 0;
        }
        v5 |= v9;
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (id)accessibilityLabel
{
  v2 = [(SearchUITitleCardSectionViewAccessibility *)self safeValueForKey:@"section"];
  uint64_t v3 = [v2 safeStringForKey:@"title"];

  return v3;
}

@end