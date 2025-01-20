@interface MOSuggestionCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityGridCollectionView;
- (id)accessibilityCustomActions;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation MOSuggestionCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MomentsUIService.MOSuggestionCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MomentsUIService.MOSuggestionCollectionViewCell" hasSwiftField:@"titleLabel" withSwiftType:"UILabel"];
  [v3 validateClass:@"MomentsUIService.MOSuggestionCollectionViewCell" hasSwiftField:@"subtitleLabel" withSwiftType:"UILabel"];
  [v3 validateClass:@"MomentsUIService.MOSuggestionCollectionViewCell" hasSwiftField:@"journalButton" withSwiftType:"MOSuggestionSheetJournalButton"];
  [v3 validateClass:@"MomentsUIService.MOSuggestionCollectionViewCell" hasSwiftField:@"assetGridView" withSwiftType:"MOSuggestionSheetAssetGridView"];
  [v3 validateClass:@"MomentsUIService.MOSuggestionSheetAssetGridView" hasSwiftField:@"gridCollectionView" withSwiftType:"Optional<MOSuggestionSheetGridCollectionView>"];
}

- (id)accessibilityValue
{
  v2 = [(MOSuggestionCollectionViewCellAccessibility *)self _accessibilityGridCollectionView];
  id v3 = [v2 visibleCells];
  v4 = MEMORY[0x2456578C0]();

  v5 = __UIAXStringForVariables();

  return v5;
}

- (id)accessibilityLabel
{
  id v3 = [(MOSuggestionCollectionViewCellAccessibility *)self safeSwiftValueForKey:@"titleLabel"];
  v4 = [(MOSuggestionCollectionViewCellAccessibility *)self safeSwiftValueForKey:@"subtitleLabel"];
  v5 = [(MOSuggestionCollectionViewCellAccessibility *)self _accessibilityGridCollectionView];
  v6 = [v5 visibleCells];
  uint64_t v7 = [v6 count];

  if (v7 < 2)
  {
    v8 = [v3 accessibilityLabel];
    v9 = [v4 accessibilityLabel];
    v11 = __UIAXStringForVariables();
  }
  else
  {
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", v7);
    v9 = [v3 accessibilityLabel];
    v10 = [v4 accessibilityLabel];
    v13 = accessibilityJurassicLocalizedString(@"suggestion.elements");
    v11 = __UIAXStringForVariables();
  }

  return v11;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityHint
{
  return accessibilityJurassicLocalizedString(@"suggestion.cell.collapsed.hint");
}

- (id)accessibilityCustomActions
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = [(MOSuggestionCollectionViewCellAccessibility *)self safeSwiftValueForKey:@"assetGridView"];
  v4 = [v3 safeSwiftValueForKey:@"gridCollectionView"];
  v29.receiver = self;
  v29.super_class = (Class)MOSuggestionCollectionViewCellAccessibility;
  v5 = [(MOSuggestionCollectionViewCellAccessibility *)&v29 accessibilityCustomActions];
  v6 = (void *)[v5 mutableCopy];

  if (!v6)
  {
    v6 = [MEMORY[0x263EFF980] array];
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v7 = [v4 visibleCells];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = [*(id *)(*((void *)&v25 + 1) + 8 * i) accessibilityCustomActions];
        [v6 addObjectsFromArray:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v9);
  }

  char v24 = 0;
  objc_opt_class();
  v13 = [(MOSuggestionCollectionViewCellAccessibility *)self safeSwiftValueForKey:@"journalButton"];
  v14 = __UIAccessibilityCastAsClass();

  if (v14)
  {
    id v15 = objc_alloc(MEMORY[0x263F1C390]);
    v16 = accessibilityJurassicLocalizedString(@"suggestion.write.about.this");
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    v21 = __73__MOSuggestionCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke;
    v22 = &unk_26513B0D8;
    id v23 = v14;
    v17 = (void *)[v15 initWithName:v16 actionHandler:&v19];

    objc_msgSend(v6, "addObject:", v17, v19, v20, v21, v22);
  }

  return v6;
}

uint64_t __73__MOSuggestionCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  return 1;
}

- (id)_accessibilityGridCollectionView
{
  v2 = [(MOSuggestionCollectionViewCellAccessibility *)self safeSwiftValueForKey:@"assetGridView"];
  id v3 = [v2 safeSwiftValueForKey:@"gridCollectionView"];

  return v3;
}

@end