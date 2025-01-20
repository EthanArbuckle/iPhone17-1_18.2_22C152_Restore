@interface MiroAssetSuggestionsCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityPhotoDescription;
- (id)_axPHAsset;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)configureWithAsset:(id)a3 selected:(BOOL)a4;
@end

@implementation MiroAssetSuggestionsCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MiroAssetSuggestionsCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MiroAssetSuggestionsCollectionViewCell" isKindOfClass:@"UICollectionViewCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UICollectionViewCell", @"isSelected", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MiroAssetSuggestionsCollectionViewCell", @"configureWithAsset: selected:", "v", "@", "B", 0);
}

- (void)configureWithAsset:(id)a3 selected:(BOOL)a4
{
  BOOL v4 = a4;
  v7.receiver = self;
  v7.super_class = (Class)MiroAssetSuggestionsCollectionViewCellAccessibility;
  id v6 = a3;
  [(MiroAssetSuggestionsCollectionViewCellAccessibility *)&v7 configureWithAsset:v6 selected:v4];
  [(MiroAssetSuggestionsCollectionViewCellAccessibility *)self _accessibilitySetRetainedValue:v6, @"AXAsset", v7.receiver, v7.super_class forKey];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2 = *MEMORY[0x263F1CF00];
  int v3 = [(MiroAssetSuggestionsCollectionViewCellAccessibility *)self safeBoolForKey:@"isSelected"];
  uint64_t v4 = *MEMORY[0x263F1CF38];
  if (!v3) {
    uint64_t v4 = 0;
  }
  return v4 | v2;
}

- (id)_axPHAsset
{
  return (id)[(MiroAssetSuggestionsCollectionViewCellAccessibility *)self _accessibilityValueForKey:@"AXAsset"];
}

- (id)accessibilityLabel
{
  uint64_t v2 = [(MiroAssetSuggestionsCollectionViewCellAccessibility *)self _axPHAsset];
  int v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)_accessibilityPhotoDescription
{
  uint64_t v2 = [(MiroAssetSuggestionsCollectionViewCellAccessibility *)self _axPHAsset];
  int v3 = [v2 _accessibilityPhotoDescription];

  return v3;
}

@end