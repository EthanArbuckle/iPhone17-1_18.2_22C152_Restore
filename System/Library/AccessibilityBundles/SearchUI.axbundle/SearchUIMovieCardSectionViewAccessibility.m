@interface SearchUIMovieCardSectionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (SearchUIMovieCardSectionViewAccessibility)initWithRowModel:(id)a3 feedbackDelegate:(id)a4;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityLabel;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation SearchUIMovieCardSectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SearchUIMovieCardSectionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"TLKMediaInfoView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TLKMediaInfoView", @"contents", "@", 0);
  [v3 validateClass:@"TLKDetailsSection"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TLKDetailsSection", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TLKDetailsSection", @"details", "@", 0);
  [v3 validateClass:@"TLKMultilineText"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TLKMultilineText", @"text", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SearchUIMovieCardSectionView", @"initWithRowModel:feedbackDelegate:", "@", "@", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v27.receiver = self;
  v27.super_class = (Class)SearchUIMovieCardSectionViewAccessibility;
  [(SearchUIMovieCardSectionViewAccessibility *)&v27 _accessibilityLoadAccessibilityInformation];
  id v21 = objc_alloc_init(MEMORY[0x263F08A30]);
  [v21 setNumberStyle:3];
  char v26 = 0;
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  v20 = v2;
  id v3 = [v2 subviews];
  v4 = [v3 firstObject];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v19 = v4;
  v5 = [v4 subviews];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        char v26 = 0;
        objc_opt_class();
        v10 = __UIAccessibilityCastAsClass();
        if (v26) {
          abort();
        }
        v11 = v10;
        if (v10)
        {
          v12 = [v10 text];
          v13 = [v21 numberFromString:v12];
          v14 = v13;
          if (v13)
          {
            [v13 floatValue];
            if (v15 >= 0.6) {
              v16 = @"movie.rotten.tomatoes.fresh";
            }
            else {
              v16 = @"movie.rotten.tomatoes.rotten";
            }
            v17 = accessibilityLocalizedString(v16);
            v18 = [NSString stringWithFormat:@"%@, %@", v12, v17];
            [v11 setAccessibilityLabel:v18];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v7);
  }
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v3 = [(SearchUIMovieCardSectionViewAccessibility *)self _accessibilityFindSubviewDescendant:&__block_literal_global_11];
  v36.receiver = self;
  v36.super_class = (Class)SearchUIMovieCardSectionViewAccessibility;
  v4 = [(SearchUIMovieCardSectionViewAccessibility *)&v36 accessibilityLabel];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v22 = v3;
  id obj = [v3 safeValueForKey:@"contents"];
  uint64_t v25 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v25)
  {
    uint64_t v24 = *(void *)v33;
    do
    {
      uint64_t v5 = 0;
      uint64_t v6 = v4;
      do
      {
        objc_super v27 = v6;
        if (*(void *)v33 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v32 + 1) + 8 * v5);
        uint64_t v8 = objc_msgSend(v7, "safeValueForKey:", @"title", v17, v19, v21);
        char v26 = [v8 safeStringForKey:@"text"];

        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        v9 = [v7 safeValueForKey:@"details"];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v37 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v29;
          v13 = &stru_26F7AC440;
          do
          {
            uint64_t v14 = 0;
            float v15 = v13;
            do
            {
              if (*(void *)v29 != v12) {
                objc_enumerationMutation(v9);
              }
              v18 = objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * v14), "safeStringForKey:", @"text", v18, v20);
              v20 = @"__AXStringForVariablesSentinel";
              __UIAXStringForVariables();
              v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

              ++v14;
              float v15 = v13;
            }
            while (v11 != v14);
            uint64_t v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v37, 16, v18, @"__AXStringForVariablesSentinel");
          }
          while (v11);
        }
        else
        {
          v13 = &stru_26F7AC440;
        }

        v19 = v13;
        id v21 = @"__AXStringForVariablesSentinel";
        v17 = v26;
        v4 = __UIAXStringForVariables();

        ++v5;
        uint64_t v6 = v4;
      }
      while (v5 != v25);
      uint64_t v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16, v26, v13, @"__AXStringForVariablesSentinel");
    }
    while (v25);
  }

  return v4;
}

uint64_t __63__SearchUIMovieCardSectionViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Tlkmediainfovi.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_accessibilitySupplementaryFooterViews
{
  return (id)[(SearchUIMovieCardSectionViewAccessibility *)self _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_324];
}

uint64_t __83__SearchUIMovieCardSectionViewAccessibility__accessibilitySupplementaryFooterViews__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Searchuimoviec_2.isa);
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = [v2 _accessibilityViewIsVisible];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (SearchUIMovieCardSectionViewAccessibility)initWithRowModel:(id)a3 feedbackDelegate:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)SearchUIMovieCardSectionViewAccessibility;
  v4 = [(SearchUIMovieCardSectionViewAccessibility *)&v6 initWithRowModel:a3 feedbackDelegate:a4];
  [(SearchUIMovieCardSectionViewAccessibility *)v4 _accessibilityLoadAccessibilityInformation];
  return v4;
}

@end