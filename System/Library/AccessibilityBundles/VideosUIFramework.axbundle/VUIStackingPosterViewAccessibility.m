@interface VUIStackingPosterViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation VUIStackingPosterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VUIStackingPosterView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"VideosUI.EditorialCollectionViewCell"];
  [v3 validateClass:@"VUILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VUIStackingPosterView", @"animatedLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VUIStackingPosterView", @"mainImageComponent", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VUIStackingPosterView", @"filteredComponents", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v33.receiver = self;
  v33.super_class = (Class)VUIStackingPosterViewAccessibility;
  [(VUIStackingPosterViewAccessibility *)&v33 _accessibilityLoadAccessibilityInformation];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  char v28 = 0;
  objc_opt_class();
  v23 = self;
  id v3 = __UIAccessibilityCastAsClass();
  v4 = [v3 subviews];

  id obj = v4;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v30;
    v21 = v26;
    v8 = @"VUIStackedImageView";
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        MEMORY[0x245669780](v8);
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          MEMORY[0x245669780](@"VUILayeredImageContainerView");
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
        }
        v11 = [(VUIStackingPosterViewAccessibility *)v23 _accessibilityAncestorIsKindOf:MEMORY[0x245669780](@"VideosUI.EditorialCollectionViewCell")];
        if (v11)
        {
          v12 = [v10 accessibilityLabel];
          v25[0] = MEMORY[0x263EF8330];
          v25[1] = 3221225472;
          v26[0] = __80__VUIStackingPosterViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
          v26[1] = &unk_265166478;
          id v27 = v12;
          id v24 = v12;
          v13 = [v11 _accessibilityFindSubviewDescendantsPassingTest:v25];
          v14 = (void *)MEMORY[0x263EFF8C0];
          v15 = AXLabelForElements();
          v16 = objc_msgSend(v14, "axArrayByIgnoringNilElementsWithCount:", 2, v24, v15, v21);
          AXLabelForElements();
          uint64_t v17 = v6;
          uint64_t v18 = v7;
          v20 = v19 = v8;
          [v10 setAccessibilityLabel:v20];

          v8 = v19;
          uint64_t v7 = v18;
          uint64_t v6 = v17;
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v6);
  }
}

uint64_t __80__VUIStackingPosterViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  MEMORY[0x245669780](@"VUILabel");
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 accessibilityLabel];
    if ([v4 length])
    {
      uint64_t v5 = *(void **)(a1 + 32);
      uint64_t v6 = [v3 accessibilityLabel];
      uint64_t v7 = [v5 axContainsString:v6] ^ 1;
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)accessibilityLabel
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = [(VUIStackingPosterViewAccessibility *)self safeArrayForKey:@"filteredComponents"];
  v4 = [(VUIStackingPosterViewAccessibility *)self safeValueForKey:@"animatedLabel"];
  uint64_t v5 = [(VUIStackingPosterViewAccessibility *)self safeValueForKey:@"mainImageComponent"];
  uint64_t v6 = [v4 accessibilityLabel];
  uint64_t v7 = [v5 accessibilityLabel];
  uint64_t v18 = accessibilityExpandTVEpisodeNumber(v7);
  v8 = __UIAXStringForVariables();

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v3;
  uint64_t v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16, v18, @"__AXStringForVariablesSentinel");
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (v14 != v4 && v14 != v5)
        {
          v19 = [v14 accessibilityLabel];
          uint64_t v16 = __UIAXStringForVariables();

          v8 = (void *)v16;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }

  return v8;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)VUIStackingPosterViewAccessibility;
  [(VUIStackingPosterViewAccessibility *)&v3 layoutSubviews];
  [(VUIStackingPosterViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end