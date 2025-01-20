@interface PUPhotosSharingGridCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_axCollectionView;
- (id)_axSharingSelectionView;
- (id)accessibilityCustomContent;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation PUPhotosSharingGridCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUPhotosSharingGridCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PUPhotosSharingSelectionView"];
  [v3 validateClass:@"PUPhotosSharingSelectionView" hasInstanceVariable:@"_selectedCheckmarkView" withType:"UIImageView"];
  [v3 validateClass:@"PUPhotosSharingSelectionView" hasInstanceVariable:@"_unselectedCheckmarkView" withType:"UIImageView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UICollectionView", @"_visibleSupplementaryViewOfKind:atIndexPath:", "@", "@", "@", 0);
  [v3 validateClass:@"PUCarouselSharingViewController"];
  [v3 validateClass:@"PUAvalancheReviewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUCarouselSharingViewController", @"mainCollectionView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUAvalancheReviewController", @"_collectionView", "@", 0);
  [v3 validateClass:@"PUPhotosSharingGridCell" isKindOfClass:@"UICollectionViewCell"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityCustomContent
{
  v2 = [(PUPhotosSharingGridCellAccessibility *)self _accessibilityValueForKey:@"AXAsset"];
  id v3 = [v2 accessibilityCustomContent];

  return v3;
}

- (id)accessibilityLabel
{
  v2 = [(PUPhotosSharingGridCellAccessibility *)self _accessibilityValueForKey:@"AXAsset"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityValue
{
  v2 = [(PUPhotosSharingGridCellAccessibility *)self _accessibilityValueForKey:@"AXAsset"];
  id v3 = [v2 accessibilityValue];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v11.receiver = self;
  v11.super_class = (Class)PUPhotosSharingGridCellAccessibility;
  unint64_t v3 = [(PUPhotosSharingGridCellAccessibility *)&v11 accessibilityTraits];
  v4 = [(PUPhotosSharingGridCellAccessibility *)self _accessibilityValueForKey:@"AXAsset"];
  unint64_t v5 = [v4 accessibilityTraits] | v3;

  v6 = [(PUPhotosSharingGridCellAccessibility *)self _axSharingSelectionView];
  v7 = v6;
  if (v6)
  {
    v8 = [v6 safeUIViewForKey:@"_selectedCheckmarkView"];
    v9 = [v7 safeUIViewForKey:@"_unselectedCheckmarkView"];
    if ([v8 _accessibilityViewIsVisible]
      && ([v9 _accessibilityViewIsVisible] & 1) == 0)
    {
      v5 |= *MEMORY[0x263F1CF38];
    }
    else if ([v8 _accessibilityViewIsVisible] {
           && ([v9 _accessibilityViewIsVisible] & 1) == 0)
    }
    {
      v5 &= ~*MEMORY[0x263F1CF38];
    }
  }
  return v5;
}

- (id)_axSharingSelectionView
{
  v2 = [(PUPhotosSharingGridCellAccessibility *)self _axCollectionView];
  if (v2
    && (NSClassFromString(&cfstr_Uicollectionvi_0.isa), (objc_opt_isKindOfClass() & 1) != 0)
    && (NSClassFromString(&cfstr_Uicollectionvi_1.isa), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_opt_class();
    unint64_t v3 = __UIAccessibilityCastAsClass();
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__5;
    v15 = __Block_byref_object_dispose__5;
    id v16 = 0;
    id v10 = v2;
    id v4 = v3;
    AXPerformSafeBlock();
    id v5 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__5;
    v15 = __Block_byref_object_dispose__5;
    id v16 = 0;
    id v9 = v10;
    id v6 = v5;
    AXPerformSafeBlock();
    id v7 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
    NSClassFromString(&cfstr_Puphotossharin_1.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

uint64_t __63__PUPhotosSharingGridCellAccessibility__axSharingSelectionView__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) indexPathForCell:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

uint64_t __63__PUPhotosSharingGridCellAccessibility__axSharingSelectionView__block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _visibleSupplementaryViewOfKind:@"PUPhotosSharingSelectionBadgeKind" atIndexPath:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

- (id)_axCollectionView
{
  unint64_t v3 = [(PUPhotosSharingGridCellAccessibility *)self _accessibilityFindViewAncestor:&__block_literal_global_11 startWithSelf:1];
  id v4 = [v3 _accessibilityViewController];

  if (v4)
  {
    id v5 = [v4 safeValueForKey:@"mainCollectionView"];
  }
  else
  {
    id v6 = [(PUPhotosSharingGridCellAccessibility *)self _accessibilityFindViewAncestor:&__block_literal_global_344 startWithSelf:1];
    id v7 = [v6 _accessibilityViewController];

    if (v7)
    {
      id v5 = [v7 safeValueForKey:@"_collectionView"];
    }
    else
    {
      id v5 = 0;
    }
  }

  return v5;
}

uint64_t __57__PUPhotosSharingGridCellAccessibility__axCollectionView__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 _accessibilityViewController];
  NSClassFromString(&cfstr_Pucarouselshar_0.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __57__PUPhotosSharingGridCellAccessibility__axCollectionView__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 _accessibilityViewController];
  NSClassFromString(&cfstr_Puavalancherev_0.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end