@interface MOSuggestionCollectionViewSingleAssetCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityGridCollectionView;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation MOSuggestionCollectionViewSingleAssetCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MomentsUIService.MOSuggestionCollectionViewSingleAssetCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MomentsUIService.MOSuggestionCollectionViewSingleAssetCell" hasSwiftField:@"titleLabel" withSwiftType:"UILabel"];
  [v3 validateClass:@"MomentsUIService.MOSuggestionCollectionViewSingleAssetCell" hasSwiftField:@"subtitleLabel" withSwiftType:"UILabel"];
  [v3 validateClass:@"MomentsUIService.MOSuggestionCollectionViewSingleAssetCell" hasSwiftField:@"assetGridView" withSwiftType:"MOSuggestionSheetAssetGridView"];
  [v3 validateClass:@"MomentsUIService.MOSuggestionSheetAssetGridView" hasSwiftField:@"gridCollectionView" withSwiftType:"Optional<MOSuggestionSheetGridCollectionView>"];
}

- (id)accessibilityValue
{
  v2 = [(MOSuggestionCollectionViewSingleAssetCellAccessibility *)self _accessibilityGridCollectionView];
  id v3 = [v2 visibleCells];
  v4 = MEMORY[0x2456578C0]();

  v5 = __UIAXStringForVariables();

  return v5;
}

- (id)accessibilityLabel
{
  id v3 = [(MOSuggestionCollectionViewSingleAssetCellAccessibility *)self safeSwiftValueForKey:@"titleLabel"];
  v4 = [(MOSuggestionCollectionViewSingleAssetCellAccessibility *)self safeSwiftValueForKey:@"subtitleLabel"];
  v5 = [(MOSuggestionCollectionViewSingleAssetCellAccessibility *)self _accessibilityGridCollectionView];
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

- (id)_accessibilityGridCollectionView
{
  v2 = [(MOSuggestionCollectionViewSingleAssetCellAccessibility *)self safeSwiftValueForKey:@"assetGridView"];
  id v3 = [v2 safeSwiftValueForKey:@"gridCollectionView"];

  return v3;
}

@end