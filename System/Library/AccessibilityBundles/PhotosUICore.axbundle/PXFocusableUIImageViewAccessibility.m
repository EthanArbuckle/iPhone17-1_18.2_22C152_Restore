@interface PXFocusableUIImageViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityIsPHAssetLocallyAvailable;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityPHAssetLocalIdentifier;
- (id)_accessibilityPhotoLibraryURL;
- (id)_axIndexPathHolder;
- (id)_axSelectionManager;
- (id)accessibilityCustomContent;
- (id)accessibilityHint;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)accessibilityURL;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)_axSetIndexPath:(PXSimpleIndexPath *)a3;
- (void)_setAXIndexPathHolder:(id)a3;
- (void)_setAXSelectionManager:(id)a3;
@end

@implementation PXFocusableUIImageViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXFocusableUIImageView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axIndexPathHolder
{
}

- (void)_setAXIndexPathHolder:(id)a3
{
}

- (void)_axSetIndexPath:(PXSimpleIndexPath *)a3
{
  v5 = [AXPXSimpleIndexPathHolder alloc];
  long long v6 = *(_OWORD *)&a3->item;
  v8[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v8[1] = v6;
  v7 = [(AXPXSimpleIndexPathHolder *)v5 initWithIndexPath:v8];
  [(PXFocusableUIImageViewAccessibility *)self _setAXIndexPathHolder:v7];
}

- (id)_axSelectionManager
{
  return (id)MEMORY[0x270F0A460](self, &__PXFocusableUIImageViewAccessibility___axSelectionManager);
}

- (void)_setAXSelectionManager:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityCustomContent
{
  v2 = [(PXFocusableUIImageViewAccessibility *)self _accessibilityValueForKey:@"AXPhotoAsset"];
  v3 = [v2 accessibilityCustomContent];

  return v3;
}

- (id)accessibilityURL
{
  v2 = [(PXFocusableUIImageViewAccessibility *)self _accessibilityValueForKey:@"AXPhotoAsset"];
  v3 = [v2 accessibilityURL];

  return v3;
}

- (id)_accessibilityPHAssetLocalIdentifier
{
  v2 = [(PXFocusableUIImageViewAccessibility *)self _accessibilityValueForKey:@"AXPhotoAsset"];
  v3 = [v2 _accessibilityPHAssetLocalIdentifier];

  return v3;
}

- (id)_accessibilityPhotoLibraryURL
{
  v2 = [(PXFocusableUIImageViewAccessibility *)self _accessibilityValueForKey:@"AXPhotoAsset"];
  v3 = [v2 _accessibilityPhotoLibraryURL];

  return v3;
}

- (BOOL)_accessibilityIsPHAssetLocallyAvailable
{
  v2 = [(PXFocusableUIImageViewAccessibility *)self _accessibilityValueForKey:@"AXPhotoAsset"];
  char v3 = [v2 _accessibilityIsPHAssetLocallyAvailable];

  return v3;
}

- (id)accessibilityLabel
{
  char v3 = [(PXFocusableUIImageViewAccessibility *)self accessibilityIdentification];
  if ([v3 isEqualToString:@"AXMemoryTileImageView"])
  {

LABEL_4:
    long long v6 = [(PXFocusableUIImageViewAccessibility *)self accessibilityUserDefinedLabel];
    goto LABEL_6;
  }
  v4 = [(PXFocusableUIImageViewAccessibility *)self accessibilityIdentification];
  int v5 = [v4 isEqualToString:@"AXMemoryTileSlideshowView"];

  if (v5) {
    goto LABEL_4;
  }
  v7 = [(PXFocusableUIImageViewAccessibility *)self _accessibilityValueForKey:@"AXPhotoAsset"];
  long long v6 = [v7 accessibilityLabel];

LABEL_6:

  return v6;
}

- (id)accessibilityIdentifier
{
  return 0;
}

- (id)accessibilityValue
{
  v2 = [(PXFocusableUIImageViewAccessibility *)self _accessibilityValueForKey:@"AXPhotoAsset"];
  char v3 = [v2 accessibilityValue];

  return v3;
}

- (id)accessibilityHint
{
  char v3 = [(PXFocusableUIImageViewAccessibility *)self accessibilityIdentification];
  int v4 = [v3 isEqualToString:@"AXMemoryTileSlideshowView"];

  if (v4)
  {
    int v5 = accessibilityPhotosUICoreLocalizedString(@"memory.slideshow.hint");
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PXFocusableUIImageViewAccessibility;
    int v5 = [(PXFocusableUIImageViewAccessibility *)&v7 accessibilityHint];
  }

  return v5;
}

- (unint64_t)accessibilityTraits
{
  v17.receiver = self;
  v17.super_class = (Class)PXFocusableUIImageViewAccessibility;
  unint64_t v3 = [(PXFocusableUIImageViewAccessibility *)&v17 accessibilityTraits];
  int v4 = [(PXFocusableUIImageViewAccessibility *)self accessibilityIdentification];
  if ([v4 isEqualToString:@"AXMemoryTileImageView"])
  {
  }
  else
  {
    int v5 = [(PXFocusableUIImageViewAccessibility *)self accessibilityIdentification];
    int v6 = [v5 isEqualToString:@"AXMemoryTileSlideshowView"];

    if (!v6) {
      goto LABEL_5;
    }
  }
  unint64_t v3 = *MEMORY[0x263F1CEE8];
LABEL_5:
  objc_super v7 = [(PXFocusableUIImageViewAccessibility *)self _axSelectionManager];
  if (v7)
  {
    v8 = [(PXFocusableUIImageViewAccessibility *)self _axIndexPathHolder];
    v9 = v8;
    long long v15 = 0u;
    long long v16 = 0u;
    if (v8) {
      [v8 indexPath];
    }
    v10 = [v7 selectionSnapshot];
    v14[0] = v15;
    v14[1] = v16;
    int v11 = [v10 isIndexPathSelected:v14];

    uint64_t v12 = *MEMORY[0x263F1CF38];
    if (!v11) {
      uint64_t v12 = 0;
    }
    v3 |= v12;
  }
  return v3;
}

@end