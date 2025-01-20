@interface PUPhotosGridCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsPHAssetLocallyAvailable;
- (BOOL)_accessibilitySavePhotoLabel:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityElementStoredUserLabel;
- (id)_accessibilityPHAssetLocalIdentifier;
- (id)_accessibilityPhotoDescription;
- (id)_accessibilityPhotoLibraryURL;
- (id)_axMainAssetURL;
- (id)_axPHAsset;
- (id)accessibilityCustomContent;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (int64_t)_accessibilityScannerActivateBehavior;
- (unint64_t)accessibilityTraits;
@end

@implementation PUPhotosGridCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUPhotosGridCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHAsset", @"isVideo", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHAsset", @"isPhoto", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUPhotosGridViewController", @"photoCollectionAtIndex:", "@", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUPhotosGridViewController", @"assetsInAssetCollection:", "@", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(PUPhotosGridCellAccessibility *)self accessibilityUserDefinedLabel];

  if (v3)
  {
    uint64_t v4 = [(PUPhotosGridCellAccessibility *)self accessibilityUserDefinedLabel];
LABEL_5:
    v7 = (void *)v4;
    goto LABEL_6;
  }
  v5 = [(PUPhotosGridCellAccessibility *)self accessibilityIdentifier];
  int v6 = [v5 isEqualToString:@"AddPhotoPlaceholder"];

  if (v6)
  {
    uint64_t v4 = accessibilityPULocalizedString(@"add.photo.placeholder");
    goto LABEL_5;
  }
  v9 = [(PUPhotosGridCellAccessibility *)self _axPHAsset];
  v7 = [v9 accessibilityLabel];

  v10 = [(PUPhotosGridCellAccessibility *)self _accessibilityDescendantOfType:NSClassFromString(&cfstr_Pxtextbannervi.isa)];
  v11 = v10;
  if (v10)
  {
    v12 = [v10 safeValueForKey:@"_textLabel"];
    v13 = [v12 accessibilityLabel];

    uint64_t v14 = __AXStringForVariables();

    v7 = (void *)v14;
  }

LABEL_6:

  return v7;
}

- (id)accessibilityValue
{
  v2 = [(PUPhotosGridCellAccessibility *)self _axPHAsset];
  id v3 = [v2 accessibilityValue];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v3 = *MEMORY[0x263F1CF18];
  int v4 = [(PUPhotosGridCellAccessibility *)self safeBoolForKey:@"isSelectionBadgeVisible"];
  uint64_t v5 = *MEMORY[0x263F1CF38];
  if (!v4) {
    uint64_t v5 = 0;
  }
  unint64_t v6 = v5 | v3;
  if (!_AXSAutomationEnabled())
  {
    uint64_t v7 = *MEMORY[0x263F1CF00];
    v8 = [(PUPhotosGridCellAccessibility *)self _axPHAsset];
    v6 |= v7 | [v8 accessibilityTraits];
  }
  return v6;
}

- (int64_t)_accessibilityScannerActivateBehavior
{
  return 1;
}

- (id)_axPHAsset
{
  uint64_t v3 = [(PUPhotosGridCellAccessibility *)self accessibilityIdentifier];
  char v4 = [v3 isEqualToString:@"AddPhotoPlaceholder"];

  if (v4)
  {
    uint64_t v5 = 0;
  }
  else
  {
    unint64_t v6 = [(PUPhotosGridCellAccessibility *)self _accessibilityAncestorIsKindOf:objc_opt_class()];
    uint64_t v7 = [v6 delegate];
    v8 = __UIAccessibilitySafeClass();

    v9 = [(PUPhotosGridCellAccessibility *)self safeValueForKey:@"_accessibilityIndexPath"];
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x3032000000;
    v25[3] = __Block_byref_object_copy__4;
    v25[4] = __Block_byref_object_dispose__4;
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__4;
    v23 = __Block_byref_object_dispose__4;
    id v24 = 0;
    id v17 = v8;
    id v18 = v9;
    AXPerformSafeBlock();
    id v10 = (id)v20[5];

    _Block_object_dispose(&v19, 8);
    id v26 = v10;
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__4;
    v23 = __Block_byref_object_dispose__4;
    id v24 = 0;
    id v11 = v17;
    AXPerformSafeBlock();
    id v12 = (id)v20[5];

    _Block_object_dispose(&v19, 8);
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__4;
    v23 = __Block_byref_object_dispose__4;
    id v24 = 0;
    id v13 = v12;
    id v14 = v18;
    AXPerformSafeBlock();
    id v15 = (id)v20[5];

    _Block_object_dispose(&v19, 8);
    uint64_t v5 = __UIAccessibilitySafeClass();

    _Block_object_dispose(v25, 8);
  }

  return v5;
}

uint64_t __43__PUPhotosGridCellAccessibility__axPHAsset__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "photoCollectionAtIndex:", objc_msgSend(*(id *)(a1 + 40), "section"));

  return MEMORY[0x270F9A758]();
}

void __43__PUPhotosGridCellAccessibility__axPHAsset__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) assetsInAssetCollection:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  uint64_t v3 = __UIAccessibilitySafeClass();

  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

uint64_t __43__PUPhotosGridCellAccessibility__axPHAsset__block_invoke_3(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", objc_msgSend(*(id *)(a1 + 40), "item"));

  return MEMORY[0x270F9A758]();
}

- (id)_axMainAssetURL
{
  v2 = [(PUPhotosGridCellAccessibility *)self _axPHAsset];
  uint64_t v3 = [v2 safeValueForKey:@"mainFileURL"];

  return v3;
}

- (id)_accessibilityPhotoDescription
{
  v2 = [(PUPhotosGridCellAccessibility *)self _axPHAsset];
  uint64_t v3 = [v2 _accessibilityPhotoDescription];

  return v3;
}

- (id)_accessibilityPHAssetLocalIdentifier
{
  v2 = [(PUPhotosGridCellAccessibility *)self _axPHAsset];
  uint64_t v3 = [v2 _accessibilityPHAssetLocalIdentifier];

  return v3;
}

- (id)_accessibilityPhotoLibraryURL
{
  v2 = [(PUPhotosGridCellAccessibility *)self _axPHAsset];
  uint64_t v3 = [v2 _accessibilityPhotoLibraryURL];

  return v3;
}

- (BOOL)_accessibilityIsPHAssetLocallyAvailable
{
  v2 = [(PUPhotosGridCellAccessibility *)self _axPHAsset];
  char v3 = [v2 _accessibilityIsPHAssetLocallyAvailable];

  return v3;
}

- (BOOL)_accessibilitySavePhotoLabel:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PUPhotosGridCellAccessibility *)self _axPHAsset];
  char v6 = [v5 _accessibilitySavePhotoLabel:v4];

  return v6;
}

- (id)_accessibilityElementStoredUserLabel
{
  char v3 = [(PUPhotosGridCellAccessibility *)self _axPHAsset];
  id v4 = [v3 safeValueForKey:@"_accessibilityiCloudPhotoLabel"];

  if ([v4 length])
  {
    uint64_t v5 = v4;
    goto LABEL_11;
  }
  char v6 = [(PUPhotosGridCellAccessibility *)self _axPHAsset];
  int v7 = [v6 safeBoolForKey:@"isPhoto"];

  if (v7)
  {
    v8 = [(PUPhotosGridCellAccessibility *)self _axMainAssetURL];
    uint64_t v9 = UIAccessibilityMetadataDescriptionForImage();
  }
  else
  {
    id v10 = [(PUPhotosGridCellAccessibility *)self _axPHAsset];
    int v11 = [v10 safeBoolForKey:@"isVideo"];

    if (!v11)
    {
      uint64_t v5 = &stru_26F42F3E0;
      goto LABEL_11;
    }
    v8 = [(PUPhotosGridCellAccessibility *)self _axMainAssetURL];
    uint64_t v9 = UIAccessibilityMetadataDescriptionForVideo();
  }
  id v12 = (__CFString *)v9;

  if (v12) {
    uint64_t v5 = v12;
  }
  else {
    uint64_t v5 = &stru_26F42F3E0;
  }
LABEL_11:

  return v5;
}

- (id)accessibilityCustomContent
{
  v2 = [(PUPhotosGridCellAccessibility *)self _axPHAsset];
  char v3 = [v2 accessibilityCustomContent];

  return v3;
}

@end