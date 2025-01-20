@interface _TVStackingPosterViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityShouldReverseComponents:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityFrameDelegate;
- (id)_accessibilityLabelIncludingFallbackPlaceholder:(BOOL)a3 usesSubviewsForComponents:(BOOL)a4;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityLabel;
- (unint64_t)_accessibilityScanningBehaviorTraits;
- (unint64_t)accessibilityTraits;
@end

@implementation _TVStackingPosterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_TVStackingPosterView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)_accessibilitySupplementaryFooterViews
{
  v2 = [(_TVStackingPosterViewAccessibility *)self _accessibleSubviews];
  v3 = [v2 axFilterObjectsUsingBlock:&__block_literal_global_8];

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)_accessibilityShouldReverseComponents:(id)a3
{
  id v3 = a3;
  if (_accessibilityShouldReverseComponents__onceToken != -1) {
    dispatch_once(&_accessibilityShouldReverseComponents__onceToken, &__block_literal_global_281);
  }
  if ((unint64_t)[v3 count] >= 2
    && objc_msgSend(v3, "ax_containsObjectUsingBlock:", &__block_literal_global_287))
  {
    v4 = [v3 lastObject];
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (id)_accessibilityLabelIncludingFallbackPlaceholder:(BOOL)a3 usesSubviewsForComponents:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v38 = *MEMORY[0x263EF8340];
  v36.receiver = self;
  v36.super_class = (Class)_TVStackingPosterViewAccessibility;
  v7 = [(_TVStackingPosterViewAccessibility *)&v36 accessibilityLabel];
  if (![v7 length])
  {
    BOOL v31 = v5;
    v8 = [MEMORY[0x263EFF9B0] orderedSet];
    if (v4) {
      v9 = @"subviews";
    }
    else {
      v9 = @"components";
    }
    v10 = [(_TVStackingPosterViewAccessibility *)self safeArrayForKey:v9];
    v29 = self;
    v30 = v7;
    if ([(_TVStackingPosterViewAccessibility *)self _accessibilityShouldReverseComponents:v10])
    {
      v11 = [v10 reverseObjectEnumerator];
      uint64_t v12 = [v11 allObjects];

      v10 = (void *)v12;
    }
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v13 = v10;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v33 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          v19 = [v18 accessibilityLabel];
          if (v19)
          {
            v20 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
            v21 = [v19 stringByTrimmingCharactersInSet:v20];
            [v8 addObject:v21];
          }
          else
          {
            v22 = [v18 _accessibilityTextForSubhierarchyIncludingHeaders:0 focusableItems:1 exclusions:0];
            v20 = [v22 componentsSeparatedByString:@", "];

            if (v20) {
              [v8 addObjectsFromArray:v20];
            }
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v15);
    }

    v23 = [v8 array];
    v7 = MEMORY[0x245666360]();

    if (![v7 length])
    {
      v24 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 1, NSClassFromString(&cfstr_Tvprogressview_0.isa));
      v25 = [(_TVStackingPosterViewAccessibility *)v29 safeValueForKey:@"overlayView"];
      uint64_t v26 = [v25 _accessibilityTextForSubhierarchyIncludingHeaders:1 focusableItems:0 exclusions:0 classExclusions:v24];

      v7 = (void *)v26;
    }
    if (v31 && ![v7 length])
    {
      uint64_t v27 = accessibilityLocalizedString(@"tvml.generic.poster");

      v7 = (void *)v27;
    }
  }

  return v7;
}

- (id)accessibilityLabel
{
  return [(_TVStackingPosterViewAccessibility *)self _accessibilityLabelIncludingFallbackPlaceholder:1 usesSubviewsForComponents:0];
}

- (id)_accessibilityFrameDelegate
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (_accessibilityFrameDelegate_onceToken != -1) {
    dispatch_once(&_accessibilityFrameDelegate_onceToken, &__block_literal_global_308_0);
  }
  char v26 = 0;
  objc_opt_class();
  id v3 = [(_TVStackingPosterViewAccessibility *)self safeValueForKey:@"subviews"];
  BOOL v4 = __UIAccessibilityCastAsClass();

  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = v4;
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
        v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v11 = (id)_accessibilityFrameDelegate_FrameDelegateClasses;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v27 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v19;
LABEL_10:
          uint64_t v15 = 0;
          while (1)
          {
            if (*(void *)v19 != v14) {
              objc_enumerationMutation(v11);
            }
            if (objc_opt_isKindOfClass()) {
              break;
            }
            if (v13 == ++v15)
            {
              uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v27 count:16];
              if (v13) {
                goto LABEL_10;
              }
              goto LABEL_16;
            }
          }
          id v16 = v10;

          if (v16) {
            goto LABEL_21;
          }
        }
        else
        {
LABEL_16:
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v7);
  }
  id v16 = 0;
LABEL_21:

  return v16;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (unint64_t)_accessibilityScanningBehaviorTraits
{
  id v3 = [(_TVStackingPosterViewAccessibility *)self _accessibilityAncestorIsKindOf:objc_opt_class()];
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = (id)[v3 _accessibilityScanningBehaviorTraits];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)_TVStackingPosterViewAccessibility;
    id v5 = [(_TVStackingPosterViewAccessibility *)&v8 _accessibilityScanningBehaviorTraits];
  }
  unint64_t v6 = (unint64_t)v5;

  return v6;
}

@end