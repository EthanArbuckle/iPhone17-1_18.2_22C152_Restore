@interface PXTilingControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axUpdateImageViewTile:(id)a3 withIndexPath:(PXSimpleIndexPath *)a4;
- (void)_updateTilesIfNeeded;
@end

@implementation PXTilingControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXTilingController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PXTileStatePool"];
  [v3 validateClass:@"PXAssetUIImageViewTile"];
  [v3 validateClass:@"PXFocusableUIImageView"];
  objc_opt_class();
  [v3 validateClass:@"PXTilingController" hasInstanceVariable:@"_needsUpdateFlags" withType:__ax_verbose_encode_with_type_encoding_group_class()];
  [v3 validateClass:@"PXAssetUIImageViewTile" hasInstanceVariable:@"_imageView" withType:"PXFocusableUIImageView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXTilingController", @"_tileStates", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXTilingController", @"_updateTilesIfNeeded", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXTilingController", @"_invalidateTiles", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXTileStatePool", @"enumerateStatesUsingBlock:", "v", "@?", 0);
}

- (void)_axUpdateImageViewTile:(id)a3 withIndexPath:(PXSimpleIndexPath *)a4
{
  v5 = [a3 safeValueForKey:@"_imageView"];
  MEMORY[0x2455E3C60](@"PXFocusableUIImageView");
  if (objc_opt_isKindOfClass())
  {
    long long v6 = *(_OWORD *)&a4->item;
    v7[0] = *(_OWORD *)&a4->dataSourceIdentifier;
    v7[1] = v6;
    [v5 _axSetIndexPath:v7];
  }
}

- (void)_updateTilesIfNeeded
{
  objc_opt_class();
  id v3 = [(PXTilingControllerAccessibility *)self safeValueForKey:@"_needsUpdateFlags"];
  v4 = __UIAccessibilityCastAsClass();

  *(_DWORD *)((char *)v16 + 7) = 0;
  v16[0] = 0;
  id v5 = v4;
  if (!strcmp((const char *)[v5 objCType], "{?=BBBBBBBBBBB}"))
  {
    [v5 getValue:v16];
    int v6 = HIBYTE(v16[0]);
    v15.receiver = self;
    v15.super_class = (Class)PXTilingControllerAccessibility;
    [(PXTilingControllerAccessibility *)&v15 _updateTilesIfNeeded];
    if (v6)
    {
      v7 = [(PXTilingControllerAccessibility *)self safeValueForKey:@"_tileStates"];
      MEMORY[0x2455E3C60](@"PXTileStatePool");
      if (objc_opt_isKindOfClass())
      {
        uint64_t v9 = MEMORY[0x263EF8330];
        uint64_t v10 = 3221225472;
        v11 = __55__PXTilingControllerAccessibility__updateTilesIfNeeded__block_invoke;
        v12 = &unk_2650A6400;
        id v13 = v7;
        v14 = self;
        AXPerformSafeBlock();
      }
    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PXTilingControllerAccessibility;
    [(PXTilingControllerAccessibility *)&v8 _updateTilesIfNeeded];
  }
}

uint64_t __55__PXTilingControllerAccessibility__updateTilesIfNeeded__block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __55__PXTilingControllerAccessibility__updateTilesIfNeeded__block_invoke_2;
  v3[3] = &unk_2650A63D8;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 enumerateStatesUsingBlock:v3];
}

void __55__PXTilingControllerAccessibility__updateTilesIfNeeded__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = *(id *)(a3 + 696);
  MEMORY[0x2455E3C60](@"PXAssetUIImageViewTile");
  if (objc_opt_isKindOfClass())
  {
    int v6 = *(void **)(a1 + 32);
    long long v7 = *(_OWORD *)(a3 + 128);
    v8[0] = *(_OWORD *)(a3 + 112);
    v8[1] = v7;
    [v6 _axUpdateImageViewTile:v5 withIndexPath:v8];
  }
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)PXTilingControllerAccessibility;
  [(PXTilingControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  v4 = [(PXTilingControllerAccessibility *)self safeValueForKey:@"_tileStates"];
  id v3 = v4;
  AXPerformSafeBlock();
}

uint64_t __77__PXTilingControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) enumerateStatesUsingBlock:&__block_literal_global_4];
}

void __77__PXTilingControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = *(id *)(a3 + 696);
  MEMORY[0x2455E3C60](@"PXAssetUIImageViewTile");
  if (objc_opt_isKindOfClass()) {
    [v3 _accessibilityLoadAccessibilityInformation];
  }
}

@end