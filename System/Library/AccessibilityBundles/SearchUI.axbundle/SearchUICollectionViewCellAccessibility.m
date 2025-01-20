@interface SearchUICollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityContainsCombinedView;
- (BOOL)_accessibilityContainsNestedAccessibilityView;
- (BOOL)_accessibilityHasAccessibleSubviews;
- (BOOL)_accessibilityHitTestReverseOrder;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityLabelFallback;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityElements;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation SearchUICollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SearchUICollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v4 = a3;
  [v4 validateClass:@"SearchUICardSectionView"];
  [v4 validateClass:@"SearchUIDetailedRowCardSectionView"];
  [v4 validateClass:@"SearchUIHomeScreenAppIconView"];
  [v4 validateClass:@"SearchUIWebCardSectionView"];
  [v4 validateClass:@"SearchUICombinedCardSectionsView"];
  [v4 validateClass:@"SearchUIHeroCardSectionView"];
  [v4 validateClass:@"SearchUILabel"];
  [v4 validateClass:@"SearchUIMapPlaceCardSectionView"];
  [v4 validateClass:@"SearchUIFlightCardSectionView"];
  v3 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.SiriUICardKitProviderSupport.framework"];

  if (v3) {
    [v4 validateClass:@"SCKPMediaControlCardSectionView"];
  }
  objc_msgSend(v4, "validateClass:hasInstanceMethod:withFullSignature:", @"SearchUITableViewCell", @"rowModel", "@", 0);
  objc_msgSend(v4, "validateClass:hasInstanceMethod:withFullSignature:", @"SearchUIRowModel", @"isTappable", "B", 0);
  [v4 validateClass:@"SearchUIRowModel" hasProperty:@"identifyingResult" withType:"@"];
  [v4 validateClass:@"SFSearchResult" hasProperty:@"contentType" withType:"@"];
}

- (id)accessibilityElements
{
  v3 = objc_msgSend(NSString, "stringWithFormat:", @"%p-_accessibilityChildren", self);
  id v4 = (id *)MEMORY[0x263F81160];
  v5 = [(id)*MEMORY[0x263F81160] objectForKeyedSubscript:v3];

  if (v5)
  {
    v6 = [*v4 objectForKeyedSubscript:v3];
  }
  else
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __64__SearchUICollectionViewCellAccessibility_accessibilityElements__block_invoke;
    v8[3] = &unk_26514D7E8;
    v8[4] = self;
    v6 = [(SearchUICollectionViewCellAccessibility *)self _accessibilityFindSubviewDescendantsPassingTest:v8];
    [*v4 setObject:v6 forKeyedSubscript:v3];
  }

  return v6;
}

uint64_t __64__SearchUICollectionViewCellAccessibility_accessibilityElements__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
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
LABEL_7:
      char isKindOfClass = v6 != 0;
      goto LABEL_8;
    }
    NSClassFromString(&cfstr_Searchuicardse_0.isa);
    if (objc_opt_isKindOfClass()) {
      goto LABEL_7;
    }
    NSClassFromString(&cfstr_Sckpmediacontr.isa);
    if (objc_opt_isKindOfClass())
    {
      char isKindOfClass = 1;
    }
    else
    {
      NSClassFromString(&cfstr_Searchuimultir_0.isa);
      char isKindOfClass = objc_opt_isKindOfClass();
    }
  }
LABEL_8:

  return isKindOfClass & 1;
}

- (BOOL)_accessibilityHitTestReverseOrder
{
  return 1;
}

- (id)accessibilityLabel
{
  v3 = [(SearchUICollectionViewCellAccessibility *)self accessibilityElements];
  MEMORY[0x24565F960]();
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  if ([(SearchUICollectionViewCellAccessibility *)self isAccessibilityElement]
    || AXDoesRequestingClientDeserveAutomation())
  {
    if (!v4)
    {
      id v4 = [(SearchUICollectionViewCellAccessibility *)self _accessibilityLabelFallback];
    }
    id v5 = [(SearchUICollectionViewCellAccessibility *)self safeValueForKey:@"rowModel"];
    v6 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", *MEMORY[0x263F0F780], *MEMORY[0x263F0F798], *MEMORY[0x263F0F778], *MEMORY[0x263F0F790], *MEMORY[0x263F0F7A0], *MEMORY[0x263F0F788], 0);
    NSClassFromString(&cfstr_Searchuidetail_1.isa);
    if (objc_opt_isKindOfClass())
    {
      v7 = [v5 safeValueForKey:@"identifyingResult"];
      v8 = [v7 safeStringForKey:@"contentType"];

      if ([v6 containsObject:v8])
      {
        v12 = accessibilityLocalizedString(@"siri.shortcut");
        uint64_t v9 = __UIAXStringForVariables();

        id v4 = (id)v9;
      }
    }
    id v4 = v4;

    v10 = v4;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)accessibilityValue
{
  v3 = [(SearchUICollectionViewCellAccessibility *)self accessibilityElements];
  if ([v3 count])
  {
    id v4 = [v3 objectAtIndexedSubscript:0];
    id v5 = [v4 accessibilityValue];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SearchUICollectionViewCellAccessibility;
    id v5 = [(SearchUICollectionViewCellAccessibility *)&v7 accessibilityValue];
  }

  return v5;
}

- (BOOL)isAccessibilityElement
{
  v3 = [(SearchUICollectionViewCellAccessibility *)self accessibilityElements];
  if ([v3 count])
  {
    if ([(SearchUICollectionViewCellAccessibility *)self _accessibilityContainsNestedAccessibilityView])
    {
      LOBYTE(v4) = 0;
    }
    else
    {
      id v5 = [v3 objectAtIndexedSubscript:0];
      int v4 = [v5 isAccessibilityElement] ^ 1;
    }
  }
  else
  {
    int v4 = ![(SearchUICollectionViewCellAccessibility *)self _accessibilityHasAccessibleSubviews];
  }

  return v4;
}

- (unint64_t)accessibilityTraits
{
  v9.receiver = self;
  v9.super_class = (Class)SearchUICollectionViewCellAccessibility;
  unint64_t v3 = [(SearchUICollectionViewCellAccessibility *)&v9 accessibilityTraits];
  int v4 = [(SearchUICollectionViewCellAccessibility *)self safeValueForKey:@"rowModel"];
  int v5 = [v4 safeBoolForKey:@"isTappable"];
  uint64_t v6 = *MEMORY[0x263F1CEE8];
  if (!v5) {
    uint64_t v6 = 0;
  }
  unint64_t v7 = v6 | v3;

  return v7;
}

- (BOOL)_accessibilityHasAccessibleSubviews
{
  if (_accessibilityHasAccessibleSubviews_onceToken_0 != -1) {
    dispatch_once(&_accessibilityHasAccessibleSubviews_onceToken_0, &__block_literal_global_7);
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __78__SearchUICollectionViewCellAccessibility__accessibilityHasAccessibleSubviews__block_invoke_2;
  v6[3] = &unk_26514D850;
  v6[4] = self;
  unint64_t v3 = [(SearchUICollectionViewCellAccessibility *)self _accessibilityFindSubviewDescendant:v6];
  BOOL v4 = v3 != 0;

  return v4;
}

Class __78__SearchUICollectionViewCellAccessibility__accessibilityHasAccessibleSubviews__block_invoke()
{
  _accessibilityHasAccessibleSubviews_webCardClass_0 = (uint64_t)NSClassFromString(&cfstr_Searchuiwebcar.isa);
  _accessibilityHasAccessibleSubviews_detailedRowClass_0 = (uint64_t)NSClassFromString(&cfstr_Searchuidetail_0.isa);
  _accessibilityHasAccessibleSubviews_trailersSectionClass_0 = (uint64_t)NSClassFromString(&cfstr_Searchuitraile_1.isa);
  Class result = NSClassFromString(&cfstr_Crkcontainerca.isa);
  _accessibilityHasAccessibleSubviews_cardKitSection_0 = (uint64_t)result;
  return result;
}

uint64_t __78__SearchUICollectionViewCellAccessibility__accessibilityHasAccessibleSubviews__block_invoke_2(uint64_t a1, void *a2)
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

- (id)_accessibilitySupplementaryFooterViews
{
  if ([(SearchUICollectionViewCellAccessibility *)self _accessibilityContainsCombinedView])
  {
    v6.receiver = self;
    v6.super_class = (Class)SearchUICollectionViewCellAccessibility;
    id v3 = [(SearchUICollectionViewCellAccessibility *)&v6 _accessibilitySupplementaryFooterViews];
  }
  else
  {
    if (_accessibilitySupplementaryFooterViews_onceToken != -1) {
      dispatch_once(&_accessibilitySupplementaryFooterViews_onceToken, &__block_literal_global_360);
    }
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __81__SearchUICollectionViewCellAccessibility__accessibilitySupplementaryFooterViews__block_invoke_2;
    v5[3] = &unk_26514D8A0;
    v5[4] = self;
    id v3 = [(SearchUICollectionViewCellAccessibility *)self _accessibilityFindSubviewDescendantsPassingTest:v5];
  }

  return v3;
}

Class __81__SearchUICollectionViewCellAccessibility__accessibilitySupplementaryFooterViews__block_invoke()
{
  Class result = NSClassFromString(&cfstr_Tlktextbutton.isa);
  _accessibilitySupplementaryFooterViews_footnoteButtonClass = (uint64_t)result;
  return result;
}

uint64_t __81__SearchUICollectionViewCellAccessibility__accessibilitySupplementaryFooterViews__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v5 = 0;
  if (*(id *)(a1 + 32) != v3 && (isKindOfClass & 1) != 0) {
    uint64_t v5 = [v3 _accessibilityViewIsVisible];
  }

  return v5;
}

- (BOOL)_accessibilityContainsCombinedView
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = objc_msgSend(NSString, "stringWithFormat:", @"%p-_accessibilityContainsCombinedView", self);
  BOOL v4 = (id *)MEMORY[0x263F81160];
  uint64_t v5 = [(id)*MEMORY[0x263F81160] objectForKeyedSubscript:v3];

  if (v5)
  {
    objc_super v6 = [*v4 objectForKeyedSubscript:v3];
    LOBYTE(v7) = [v6 BOOLValue];
  }
  else
  {
    if (_accessibilityContainsCombinedView_onceToken != -1) {
      dispatch_once(&_accessibilityContainsCombinedView_onceToken, &__block_literal_global_369);
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v8 = [(SearchUICollectionViewCellAccessibility *)self accessibilityElements];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_isKindOfClass())
          {
            uint64_t v7 = 1;
            goto LABEL_17;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
        uint64_t v7 = 0;
        if (v10) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
LABEL_17:

    objc_super v6 = [NSNumber numberWithBool:v7];
    [*v4 setObject:v6 forKeyedSubscript:v3];
  }

  return v7;
}

Class __77__SearchUICollectionViewCellAccessibility__accessibilityContainsCombinedView__block_invoke()
{
  _accessibilityContainsCombinedView_combinedSectionView = (uint64_t)NSClassFromString(&cfstr_Searchuicombin_2.isa);
  Class result = NSClassFromString(&cfstr_Searchuiheroca_0.isa);
  _accessibilityContainsCombinedView_heroSectionView = (uint64_t)result;
  return result;
}

- (BOOL)_accessibilityContainsNestedAccessibilityView
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(SearchUICollectionViewCellAccessibility *)self accessibilityElements];
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
        NSClassFromString(&cfstr_Searchuiinfoca_0.isa);
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          NSClassFromString(&cfstr_Searchuimappla.isa);
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            NSClassFromString(&cfstr_Searchuiflight.isa);
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              NSClassFromString(&cfstr_Sckpmediacontr.isa);
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                continue;
              }
            }
          }
        }
        BOOL v7 = 1;
        goto LABEL_15;
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      BOOL v7 = 0;
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v7 = 0;
  }
LABEL_15:

  return v7;
}

- (id)_accessibilityLabelFallback
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"%p-_accessibilityLabel", self);
  uint64_t v4 = (id *)MEMORY[0x263F81160];
  uint64_t v5 = [(id)*MEMORY[0x263F81160] objectForKeyedSubscript:v3];

  if (v5)
  {
    objc_super v6 = [*v4 objectForKeyedSubscript:v3];
  }
  else
  {
    if (_accessibilityLabelFallback_onceToken != -1) {
      dispatch_once(&_accessibilityLabelFallback_onceToken, &__block_literal_global_378);
    }
    BOOL v7 = [(SearchUICollectionViewCellAccessibility *)self _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_380];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      objc_super v6 = &stru_26F7AC440;
      do
      {
        uint64_t v11 = 0;
        long long v12 = v6;
        do
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v11), "accessibilityLabel", v14, v15);
          long long v15 = @"__AXStringForVariablesSentinel";
          __AXStringForVariables();
          objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

          ++v11;
          long long v12 = v6;
        }
        while (v9 != v11);
        uint64_t v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16, v14, @"__AXStringForVariablesSentinel");
      }
      while (v9);
    }
    else
    {
      objc_super v6 = &stru_26F7AC440;
    }
    [*v4 setObject:v6 forKeyedSubscript:v3];
  }

  return v6;
}

Class __70__SearchUICollectionViewCellAccessibility__accessibilityLabelFallback__block_invoke()
{
  Class result = NSClassFromString(&cfstr_Searchuilabel.isa);
  _accessibilityLabelFallback_searchUILabel = (uint64_t)result;
  return result;
}

uint64_t __70__SearchUICollectionViewCellAccessibility__accessibilityLabelFallback__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = [v2 _accessibilityViewIsVisible];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

@end