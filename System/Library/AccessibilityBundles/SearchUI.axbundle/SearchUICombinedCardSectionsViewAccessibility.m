@interface SearchUICombinedCardSectionsViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)_axGetFooterSectionView;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (void)_axSetInfoOnButton:(id)a3;
@end

@implementation SearchUICombinedCardSectionsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SearchUICombinedCardSectionsView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)_accessibilitySupplementaryFooterViews
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = [(SearchUICombinedCardSectionsViewAccessibility *)self _axGetFooterSectionView];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_8];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          [(SearchUICombinedCardSectionsViewAccessibility *)self _axSetInfoOnButton:*(void *)(*((void *)&v11 + 1) + 8 * i)];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
      }
      while (v7);
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)SearchUICombinedCardSectionsViewAccessibility;
    v5 = [(SearchUICombinedCardSectionsViewAccessibility *)&v15 _accessibilitySupplementaryFooterViews];
  }

  return v5;
}

uint64_t __87__SearchUICombinedCardSectionsViewAccessibility__accessibilitySupplementaryFooterViews__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Tlktextbutton.isa);
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v2 isAccessibilityElement]) {
    uint64_t v3 = [v2 _accessibilityViewIsVisible];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)accessibilityLabel
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = [(SearchUICombinedCardSectionsViewAccessibility *)self safeArrayForKey:@"visibleArrangedSubviews"];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    uint64_t v6 = &stru_26F7AC440;
    do
    {
      uint64_t v7 = 0;
      uint64_t v8 = v6;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v7), "accessibilityLabel", v10, v11);
        long long v11 = @"__AXStringForVariablesSentinel";
        __AXStringForVariables();
        uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

        ++v7;
        uint64_t v8 = v6;
      }
      while (v4 != v7);
      uint64_t v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16, v10, @"__AXStringForVariablesSentinel");
    }
    while (v4);
  }
  else
  {
    uint64_t v6 = &stru_26F7AC440;
  }

  return v6;
}

- (id)accessibilityValue
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = [(SearchUICombinedCardSectionsViewAccessibility *)self safeArrayForKey:@"visibleArrangedSubviews"];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    uint64_t v6 = &stru_26F7AC440;
    do
    {
      uint64_t v7 = 0;
      uint64_t v8 = v6;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v7), "accessibilityValue", v10, v11);
        long long v11 = @"__AXStringForVariablesSentinel";
        __AXStringForVariables();
        uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

        ++v7;
        uint64_t v8 = v6;
      }
      while (v4 != v7);
      uint64_t v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16, v10, @"__AXStringForVariablesSentinel");
    }
    while (v4);
  }
  else
  {
    uint64_t v6 = &stru_26F7AC440;
  }

  return v6;
}

- (id)_axGetFooterSectionView
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  [(SearchUICombinedCardSectionsViewAccessibility *)self safeArrayForKey:@"visibleArrangedSubviews"];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        NSClassFromString(&cfstr_Searchuiattrib.isa);
        if (objc_opt_isKindOfClass())
        {
          id v8 = v7;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  id v8 = 0;
LABEL_11:

  return v8;
}

- (void)_axSetInfoOnButton:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v8 = v3;
    [v3 setIsAccessibilityElement:1];
    uint64_t v4 = [v8 accessibilityLabel];
    if (![v4 length])
    {
      uint64_t v5 = [v8 safeValueForKey:@"_richTitle"];
      uint64_t v6 = [v5 safeStringForKey:@"text"];

      if ([v6 length])
      {
        uint64_t v4 = v6;
      }
      else
      {
        uint64_t v4 = [v8 safeStringForKey:@"_title"];

        if (![v4 length])
        {
          uint64_t v7 = accessibilityLocalizedString(@"search.go.safari");
          [v8 setAccessibilityLabel:v7];

          goto LABEL_8;
        }
        uint64_t v6 = v4;
      }
      [v8 setAccessibilityLabel:v6];
    }
LABEL_8:

    id v3 = v8;
  }
}

@end