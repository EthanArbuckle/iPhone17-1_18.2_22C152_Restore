@interface ListCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityActivate;
- (id)_accessibilitySupplementaryFooterViews;
- (unint64_t)accessibilityTraits;
@end

@implementation ListCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_SFBrowsingAssistantListCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"_SFBrowsingAssistantListCell" isKindOfClass:@"UICollectionViewListCell"];
  [v3 validateClass:@"_SFBrowsingAssistantListCell" hasSwiftField:@"isDeletable" withSwiftType:"Bool"];
  [v3 validateClass:@"_SFBrowsingAssistantListCell" hasSwiftField:@"delegate" withSwiftType:"Optional<BrowsingAssistantListCellDelegate>"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFBrowsingAssistantCollection", @"listCellDidDeleteCell:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFBrowsingAssistantCollection", @"listCellDidInsertCell:", "v", "@", 0);
}

- (id)_accessibilitySupplementaryFooterViews
{
  return (id)MEMORY[0x263EFFA68];
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (BOOL)accessibilityActivate
{
  char v19 = 0;
  objc_opt_class();
  id v3 = __UIAccessibilityCastAsClass();
  v4 = [v3 configurationState];
  int v5 = [v4 isEditing];

  if (v5)
  {
    if ([(ListCellAccessibility *)self safeSwiftBoolForKey:@"isDeletable"])
    {
      uint64_t v14 = MEMORY[0x263EF8330];
      uint64_t v15 = 3221225472;
      v16 = __46__ListCellAccessibility_accessibilityActivate__block_invoke;
      v17 = &unk_265135E88;
      v18 = self;
    }
    else
    {
      uint64_t v9 = MEMORY[0x263EF8330];
      uint64_t v10 = 3221225472;
      v11 = __46__ListCellAccessibility_accessibilityActivate__block_invoke_2;
      v12 = &unk_265135E88;
      v13 = self;
    }
    AXPerformSafeBlock();
    BOOL v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)ListCellAccessibility;
    BOOL v6 = [(ListCellAccessibility *)&v8 accessibilityActivate];
  }

  return v6;
}

void __46__ListCellAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) safeSwiftValueForKey:@"delegate"];
  [v2 listCellDidDeleteCell:*(void *)(a1 + 32)];
}

void __46__ListCellAccessibility_accessibilityActivate__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) safeSwiftValueForKey:@"delegate"];
  [v2 listCellDidInsertCell:*(void *)(a1 + 32)];
}

@end