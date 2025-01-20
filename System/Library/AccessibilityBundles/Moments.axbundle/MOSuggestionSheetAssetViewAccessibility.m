@interface MOSuggestionSheetAssetViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation MOSuggestionSheetAssetViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MomentsUIService.MOSuggestionSheetAssetView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  objc_opt_class();
  v3 = [(MOSuggestionSheetAssetViewAccessibility *)self safeValueForKey:@"subviews"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = MEMORY[0x2456578C0](v4);

  return v5;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)MOSuggestionSheetAssetViewAccessibility;
  unint64_t v3 = [(MOSuggestionSheetAssetViewAccessibility *)&v17 accessibilityTraits];
  char v16 = 0;
  objc_opt_class();
  v4 = [(MOSuggestionSheetAssetViewAccessibility *)self safeValueForKey:@"subviews"];
  v5 = __UIAccessibilityCastAsClass();

  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        v3 |= objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "accessibilityTraits", (void)v12);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v8);
  }

  return v3;
}

- (id)accessibilityCustomActions
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  char v19 = 0;
  objc_opt_class();
  unint64_t v3 = [(MOSuggestionSheetAssetViewAccessibility *)self safeValueForKey:@"subviews"];
  v4 = __UIAccessibilityCastAsClass();

  v18.receiver = self;
  v18.super_class = (Class)MOSuggestionSheetAssetViewAccessibility;
  v5 = [(MOSuggestionSheetAssetViewAccessibility *)&v18 accessibilityCustomActions];
  id v6 = (void *)[v5 mutableCopy];

  if (!v6)
  {
    id v6 = [MEMORY[0x263EFF980] array];
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "accessibilityCustomActions", (void)v14);
        [v6 addObjectsFromArray:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v9);
  }

  return v6;
}

@end