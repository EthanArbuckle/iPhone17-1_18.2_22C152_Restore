@interface SearchUITableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityContainsCombinedView;
- (BOOL)_accessibilityContainsSportsGrid;
- (BOOL)_accessibilityHasAccessibleSubviews;
- (BOOL)_accessibilityHitTestReverseOrder;
- (BOOL)_accessibilityShouldSortTableViewCellChildren;
- (BOOL)_accessibilityUsesOverrideContainerProtocol;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityRetrieveTableViewCellText;
- (id)_accessibilitySearchCellElements;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityElements;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)automationCustomProperties;
- (unint64_t)accessibilityTraits;
@end

@implementation SearchUITableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SearchUITableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SearchUIMovieCardSectionView"];
  [v3 validateClass:@"SearchUIWebCardSectionView"];
  [v3 validateClass:@"SearchUIDetailedRowCardSectionView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SearchUITableViewCell", @"rowModel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SearchUIRowModel", @"cardSection", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SearchUIRowModel", @"isTappable", "B", 0);
  [v3 validateClass:@"SearchUIRowModel" hasProperty:@"identifyingResult" withType:"@"];
  [v3 validateClass:@"SFSearchResult" hasProperty:@"contentType" withType:"@"];
  [v3 validateProtocol:@"SFTableHeaderRowCardSection" hasRequiredInstanceMethod:@"tableIdentifier"];
  [v3 validateProtocol:@"SFTableHeaderRowCardSection" conformsToProtocol:@"SFCardSection"];
  [v3 validateClass:@"CNActionView"];
  [v3 validateClass:@"TLKStoreButton"];
  [v3 validateClass:@"SearchUIDetailedRowCardSectionView"];
  [v3 validateClass:@"SearchUICardSectionView"];
  [v3 validateClass:@"SearchUIHomeScreenAppIconView"];
  [v3 validateClass:@"SearchUICardSectionTableCell" isKindOfClass:@"SearchUITableViewCell"];
}

- (BOOL)_accessibilityUsesOverrideContainerProtocol
{
  v2 = [(SearchUITableViewCellAccessibility *)self _accessibilitySearchCellElements];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)accessibilityElements
{
  v7.receiver = self;
  v7.super_class = (Class)SearchUITableViewCellAccessibility;
  BOOL v3 = [(SearchUITableViewCellAccessibility *)&v7 accessibilityElements];
  if ([v3 count])
  {
    id v4 = v3;
  }
  else
  {
    id v4 = [(SearchUITableViewCellAccessibility *)self _accessibilitySearchCellElements];
  }
  v5 = v4;

  return v5;
}

- (id)_accessibilitySearchCellElements
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __70__SearchUITableViewCellAccessibility__accessibilitySearchCellElements__block_invoke;
  v5[3] = &unk_26514D7E8;
  v5[4] = self;
  v2 = [(SearchUITableViewCellAccessibility *)self _accessibilityFindSubviewDescendantsPassingTest:v5];
  if ([v2 count]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

uint64_t __70__SearchUITableViewCellAccessibility__accessibilitySearchCellElements__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  v6 = v5;
  if (*(id *)(a1 + 32) == v5 || ![v5 _accessibilityViewIsVisible])
  {
    char isKindOfClass = 0;
  }
  else
  {
    NSClassFromString(&cfstr_Searchuicombin_2.isa);
    if (objc_opt_isKindOfClass())
    {
      *a3 = 1;
    }
    else
    {
      NSClassFromString(&cfstr_Searchuicardse_0.isa);
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        NSClassFromString(&cfstr_Searchuihomesc_0.isa);
        char isKindOfClass = objc_opt_isKindOfClass();
        goto LABEL_9;
      }
    }
    char isKindOfClass = v6 != 0;
  }
LABEL_9:

  return isKindOfClass & 1;
}

- (BOOL)_accessibilityHitTestReverseOrder
{
  return 1;
}

- (id)_accessibilityRetrieveTableViewCellText
{
  id v3 = [(SearchUITableViewCellAccessibility *)self contentView];
  id v4 = [v3 _accessibilityFindDescendant:&__block_literal_global_13];

  if (v4)
  {
    id v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SearchUITableViewCellAccessibility;
    id v5 = [(SearchUITableViewCellAccessibility *)&v7 _accessibilityRetrieveTableViewCellText];
  }

  return v5;
}

uint64_t __77__SearchUITableViewCellAccessibility__accessibilityRetrieveTableViewCellText__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Sckpmediacontr.isa);
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    NSClassFromString(&cfstr_Searchuimoviec_1.isa);
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (id)accessibilityLabel
{
  id v3 = [(SearchUITableViewCellAccessibility *)self accessibilityElements];
  id v4 = MEMORY[0x24565F960]();

  id v5 = [(SearchUITableViewCellAccessibility *)self safeValueForKey:@"rowModel"];
  v6 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", *MEMORY[0x263F0F780], *MEMORY[0x263F0F798], *MEMORY[0x263F0F778], *MEMORY[0x263F0F790], *MEMORY[0x263F0F7A0], *MEMORY[0x263F0F788], 0);
  NSClassFromString(&cfstr_Searchuidetail_1.isa);
  if (objc_opt_isKindOfClass())
  {
    objc_super v7 = [v5 safeValueForKey:@"identifyingResult"];
    v8 = [v7 safeStringForKey:@"contentType"];

    if ([v6 containsObject:v8])
    {
      v11 = accessibilityLocalizedString(@"siri.shortcut");
      uint64_t v9 = __UIAXStringForVariables();

      id v4 = (void *)v9;
    }
  }

  return v4;
}

- (id)automationCustomProperties
{
  id v3 = [(SearchUITableViewCellAccessibility *)self accessibilityElements];
  id v4 = v3;
  if (v3 && [v3 count])
  {
    id v5 = [v4 objectAtIndexedSubscript:0];
    v6 = [v5 automationCustomProperties];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SearchUITableViewCellAccessibility;
    v6 = [(SearchUITableViewCellAccessibility *)&v8 automationCustomProperties];
  }

  return v6;
}

- (id)accessibilityValue
{
  id v3 = [(SearchUITableViewCellAccessibility *)self accessibilityElements];
  id v4 = v3;
  if (v3 && [v3 count])
  {
    id v5 = [v4 objectAtIndexedSubscript:0];
    v6 = [v5 accessibilityValue];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SearchUITableViewCellAccessibility;
    v6 = [(SearchUITableViewCellAccessibility *)&v8 accessibilityValue];
  }

  return v6;
}

- (BOOL)isAccessibilityElement
{
  id v3 = [(SearchUITableViewCellAccessibility *)self accessibilityElements];
  id v4 = v3;
  if (v3 && [v3 count])
  {
    NSClassFromString(&cfstr_Searchuicardse_3.isa);
    if (objc_opt_isKindOfClass())
    {
      LOBYTE(v5) = 0;
    }
    else
    {
      v6 = [v4 objectAtIndexedSubscript:0];
      int v5 = [v6 isAccessibilityElement] ^ 1;
    }
  }
  else
  {
    int v5 = ![(SearchUITableViewCellAccessibility *)self _accessibilityHasAccessibleSubviews];
  }

  return v5;
}

- (unint64_t)accessibilityTraits
{
  id v3 = [(SearchUITableViewCellAccessibility *)self safeValueForKey:@"rowModel"];
  int v4 = [v3 safeBoolForKey:@"isTappable"];

  if (v4) {
    return *MEMORY[0x263F1CEE8];
  }
  v6.receiver = self;
  v6.super_class = (Class)SearchUITableViewCellAccessibility;
  return [(SearchUITableViewCellAccessibility *)&v6 accessibilityTraits];
}

- (BOOL)_accessibilityHasAccessibleSubviews
{
  if (_accessibilityHasAccessibleSubviews_onceToken_1 != -1) {
    dispatch_once(&_accessibilityHasAccessibleSubviews_onceToken_1, &__block_literal_global_359);
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __73__SearchUITableViewCellAccessibility__accessibilityHasAccessibleSubviews__block_invoke_2;
  v6[3] = &unk_26514D850;
  v6[4] = self;
  id v3 = [(SearchUITableViewCellAccessibility *)self _accessibilityFindSubviewDescendant:v6];
  BOOL v4 = v3 != 0;

  return v4;
}

Class __73__SearchUITableViewCellAccessibility__accessibilityHasAccessibleSubviews__block_invoke()
{
  _accessibilityHasAccessibleSubviews_webCardClass_1 = (uint64_t)NSClassFromString(&cfstr_Searchuiwebcar.isa);
  _accessibilityHasAccessibleSubviews_detailedRowClass_1 = (uint64_t)NSClassFromString(&cfstr_Searchuidetail_0.isa);
  _accessibilityHasAccessibleSubviews_trailersSectionClass_1 = (uint64_t)NSClassFromString(&cfstr_Searchuitraile_1.isa);
  Class result = NSClassFromString(&cfstr_Crkcontainerca.isa);
  _accessibilityHasAccessibleSubviews_cardKitSection_1 = (uint64_t)result;
  return result;
}

uint64_t __73__SearchUITableViewCellAccessibility__accessibilityHasAccessibleSubviews__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int isKindOfClass = objc_opt_isKindOfClass();
  char v5 = objc_opt_isKindOfClass();
  int v6 = objc_opt_isKindOfClass();
  int v7 = objc_opt_isKindOfClass();
  uint64_t v8 = 0;
  if (*(id *)(a1 + 32) != v3 && ((v6 | isKindOfClass | v7) & 1) != 0 && (v5 & 1) == 0) {
    uint64_t v8 = [v3 _accessibilityViewIsVisible];
  }

  return v8;
}

- (BOOL)_accessibilityShouldSortTableViewCellChildren
{
  return 1;
}

- (id)_accessibilitySupplementaryFooterViews
{
  if ([(SearchUITableViewCellAccessibility *)self _accessibilityContainsCombinedView])
  {
    v6.receiver = self;
    v6.super_class = (Class)SearchUITableViewCellAccessibility;
    id v3 = [(SearchUITableViewCellAccessibility *)&v6 _accessibilitySupplementaryFooterViews];
  }
  else
  {
    if (_accessibilitySupplementaryFooterViews_onceToken_0 != -1) {
      dispatch_once(&_accessibilitySupplementaryFooterViews_onceToken_0, &__block_literal_global_369_0);
    }
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __76__SearchUITableViewCellAccessibility__accessibilitySupplementaryFooterViews__block_invoke_2;
    v5[3] = &unk_26514D8A0;
    v5[4] = self;
    id v3 = [(SearchUITableViewCellAccessibility *)self _accessibilityFindSubviewDescendantsPassingTest:v5];
  }

  return v3;
}

Class __76__SearchUITableViewCellAccessibility__accessibilitySupplementaryFooterViews__block_invoke()
{
  Class result = NSClassFromString(&cfstr_Tlktextbutton.isa);
  _accessibilitySupplementaryFooterViews_footnoteButtonClass_0 = (uint64_t)result;
  return result;
}

uint64_t __76__SearchUITableViewCellAccessibility__accessibilitySupplementaryFooterViews__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v5 = 0;
  if (*(id *)(a1 + 32) != v3 && (isKindOfClass & 1) != 0) {
    uint64_t v5 = [v3 _accessibilityViewIsVisible];
  }

  return v5;
}

- (BOOL)_accessibilityContainsSportsGrid
{
  id v2 = [(SearchUITableViewCellAccessibility *)self safeValueForKey:@"rowModel"];
  id v3 = [v2 safeValueForKey:@"cardSection"];

  BOOL v4 = NSProtocolFromString(&cfstr_Sftableheaderr.isa);
  int v5 = [v3 conformsToProtocol:v4];

  if (v5)
  {
    objc_super v6 = [v3 safeStringForKey:@"tableIdentifier"];
    char v7 = [v6 isEqualToString:@"Period Scores"];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)_accessibilityContainsCombinedView
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = [(SearchUITableViewCellAccessibility *)self accessibilityElements];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        NSClassFromString(&cfstr_Searchuicombin_2.isa);
        if (objc_opt_isKindOfClass())
        {
          BOOL v7 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 0;
LABEL_11:

  return v7;
}

@end