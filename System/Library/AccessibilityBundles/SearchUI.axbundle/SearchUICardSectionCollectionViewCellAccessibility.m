@interface SearchUICardSectionCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityHasAccessibleSubviews;
- (BOOL)isAccessibilityElement;
- (id)_axAccessibilityElements;
- (id)_axCircleButtonViews;
- (id)accessibilityCustomActions;
- (id)accessibilityElements;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)automationCustomProperties;
- (unint64_t)accessibilityTraits;
@end

@implementation SearchUICardSectionCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SearchUICardSectionCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"TLKLabel" isKindOfClass:@"UILabel"];
  [v3 validateClass:@"TLKTextView" isKindOfClass:@"UITextView"];
  [v3 validateClass:@"SearchUICardSectionCollectionViewCell" hasInstanceVariable:@"_cardSectionView" withType:"SearchUICardSectionView"];
  [v3 validateClass:@"SearchUIDetailedRowCardSectionView"];
  [v3 validateClass:@"SearchUICardSectionView"];
  [v3 validateClass:@"SearchUICombinedCardSectionsView"];
  [v3 validateClass:@"SearchUIMultiResultAppCollectionCell"];
  [v3 validateClass:@"SearchUICircleButtonItemView"];
  [v3 validateClass:@"SearchUICircleButtonItemView" isKindOfClass:@"SearchUIButtonItemView"];
  [v3 validateClass:@"SearchUIButtonItemView" hasInstanceVariable:@"_buttonTitle" withType:"NSString"];
}

- (id)accessibilityElements
{
  id v3 = objc_msgSend(NSString, "stringWithFormat:", @"%p-_accessibilityChildren", self);
  v4 = (id *)MEMORY[0x263F81160];
  v5 = [(id)*MEMORY[0x263F81160] objectForKeyedSubscript:v3];

  if (v5)
  {
    v6 = [*v4 objectForKeyedSubscript:v3];
  }
  else
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __75__SearchUICardSectionCollectionViewCellAccessibility_accessibilityElements__block_invoke;
    v9[3] = &unk_26514D7E8;
    v9[4] = self;
    v6 = [(SearchUICardSectionCollectionViewCellAccessibility *)self _accessibilityFindSubviewDescendantsPassingTest:v9];
    if (![v6 count])
    {
      uint64_t v7 = [(SearchUICardSectionCollectionViewCellAccessibility *)self _axAccessibilityElements];

      v6 = (void *)v7;
    }
    [*v4 setObject:v6 forKeyedSubscript:v3];
  }

  return v6;
}

uint64_t __75__SearchUICardSectionCollectionViewCellAccessibility_accessibilityElements__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
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
        NSClassFromString(&cfstr_Searchuimultir_0.isa);
        char isKindOfClass = objc_opt_isKindOfClass();
        goto LABEL_9;
      }
    }
    char isKindOfClass = v6 != 0;
  }
LABEL_9:

  return isKindOfClass & 1;
}

- (id)_axAccessibilityElements
{
  v2 = [MEMORY[0x263F811D8] _accessibilityGetAllSwiftUISubviews:self withFiltering:1];
  Class v3 = NSClassFromString(&cfstr_SwiftuiAccessi.isa);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __78__SearchUICardSectionCollectionViewCellAccessibility__axAccessibilityElements__block_invoke;
  v6[3] = &__block_descriptor_40_e15_B32__0_8Q16_B24lu32l8;
  v6[4] = v3;
  v4 = objc_msgSend(v2, "ax_filteredArrayUsingBlock:", v6);

  return v4;
}

BOOL __78__SearchUICardSectionCollectionViewCellAccessibility__axAccessibilityElements__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [v2 accessibilityTraits];
    BOOL v4 = v3 != *MEMORY[0x263F1CF00];
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)isAccessibilityElement
{
  uint64_t v3 = [(SearchUICardSectionCollectionViewCellAccessibility *)self accessibilityElements];
  if ([v3 count])
  {
    BOOL v4 = [v3 objectAtIndexedSubscript:0];
    NSClassFromString(&cfstr_SwiftuiAccessi.isa);
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      uint64_t v7 = [v3 objectAtIndexedSubscript:0];
      NSClassFromString(&cfstr_Searchuiwebcar.isa);
      if (objc_opt_isKindOfClass())
      {
        uint64_t v8 = [v3 count];

        if (v8 == 1)
        {
          LOBYTE(v6) = 0;
          goto LABEL_10;
        }
      }
      else
      {
      }
      v9 = [v3 objectAtIndexedSubscript:0];
      int v6 = [v9 isAccessibilityElement] ^ 1;

      goto LABEL_10;
    }
    LOBYTE(v6) = 1;
  }
  else
  {
    int v6 = ![(SearchUICardSectionCollectionViewCellAccessibility *)self _accessibilityHasAccessibleSubviews];
  }
LABEL_10:

  return v6;
}

- (unint64_t)accessibilityTraits
{
  v6.receiver = self;
  v6.super_class = (Class)SearchUICardSectionCollectionViewCellAccessibility;
  unint64_t v3 = [(SearchUICardSectionCollectionViewCellAccessibility *)&v6 accessibilityTraits];
  if ([(SearchUICardSectionCollectionViewCellAccessibility *)self safeBoolForKey:@"isSelected"])uint64_t v4 = ~*MEMORY[0x263F1CF38]; {
  else
  }
    uint64_t v4 = -1;
  return v4 & v3;
}

- (id)accessibilityLabel
{
  id v2 = [(SearchUICardSectionCollectionViewCellAccessibility *)self accessibilityElements];
  unint64_t v3 = MEMORY[0x24565F960]();

  return v3;
}

- (id)accessibilityValue
{
  id v2 = [(SearchUICardSectionCollectionViewCellAccessibility *)self _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_6];
  unint64_t v3 = objc_msgSend(v2, "ax_flatMappedArrayUsingBlock:", &__block_literal_global_329);
  uint64_t v4 = [v3 componentsJoinedByString:@", "];

  return v4;
}

uint64_t __72__SearchUICardSectionCollectionViewCellAccessibility_accessibilityValue__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Tlktextview.isa);
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = [v2 _accessibilityViewIsVisible];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t __72__SearchUICardSectionCollectionViewCellAccessibility_accessibilityValue__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 accessibilityValue];
}

- (id)automationCustomProperties
{
  uint64_t v3 = [(SearchUICardSectionCollectionViewCellAccessibility *)self accessibilityElements];
  uint64_t v4 = v3;
  if (v3 && [v3 count])
  {
    id v5 = [v4 objectAtIndexedSubscript:0];
    objc_super v6 = [v5 automationCustomProperties];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SearchUICardSectionCollectionViewCellAccessibility;
    objc_super v6 = [(SearchUICardSectionCollectionViewCellAccessibility *)&v8 automationCustomProperties];
  }

  return v6;
}

- (BOOL)_accessibilityHasAccessibleSubviews
{
  if (_accessibilityHasAccessibleSubviews_onceToken != -1) {
    dispatch_once(&_accessibilityHasAccessibleSubviews_onceToken, &__block_literal_global_337);
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __89__SearchUICardSectionCollectionViewCellAccessibility__accessibilityHasAccessibleSubviews__block_invoke_2;
  v6[3] = &unk_26514D850;
  v6[4] = self;
  uint64_t v3 = [(SearchUICardSectionCollectionViewCellAccessibility *)self _accessibilityFindSubviewDescendant:v6];
  BOOL v4 = v3 != 0;

  return v4;
}

Class __89__SearchUICardSectionCollectionViewCellAccessibility__accessibilityHasAccessibleSubviews__block_invoke()
{
  _accessibilityHasAccessibleSubviews_webCardClass = (uint64_t)NSClassFromString(&cfstr_Searchuiwebcar.isa);
  _accessibilityHasAccessibleSubviews_detailedRowClass = (uint64_t)NSClassFromString(&cfstr_Searchuidetail_0.isa);
  _accessibilityHasAccessibleSubviews_trailersSectionClass = (uint64_t)NSClassFromString(&cfstr_Searchuitraile_1.isa);
  Class result = NSClassFromString(&cfstr_Crkcontainerca.isa);
  _accessibilityHasAccessibleSubviews_cardKitSection = (uint64_t)result;
  return result;
}

uint64_t __89__SearchUICardSectionCollectionViewCellAccessibility__accessibilityHasAccessibleSubviews__block_invoke_2(uint64_t a1, void *a2)
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

- (id)accessibilityCustomActions
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF980] array];
  [(SearchUICardSectionCollectionViewCellAccessibility *)self _axCircleButtonViews];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v9 = objc_alloc(MEMORY[0x263F1C390]);
        v10 = [v8 safeValueForKey:@"buttonTitle"];
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __80__SearchUICardSectionCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke;
        v14[3] = &unk_26514D878;
        v14[4] = v8;
        v11 = (void *)[v9 initWithName:v10 actionHandler:v14];
        [v3 addObject:v11];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }

  return v3;
}

uint64_t __80__SearchUICardSectionCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  return 1;
}

- (id)_axCircleButtonViews
{
  return (id)[(SearchUICardSectionCollectionViewCellAccessibility *)self _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_352];
}

uint64_t __74__SearchUICardSectionCollectionViewCellAccessibility__axCircleButtonViews__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Searchuicircle.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end