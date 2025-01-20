@interface PXUIAssetsSceneAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_axApplyAssetsToImageViewTile:(id)a3 withIdentifier:(PXTileIdentifier *)a4;
- (void)checkOutTileForIdentifier:(PXTileIdentifier *)a3 layout:(id)a4;
@end

@implementation PXUIAssetsSceneAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXUIAssetsScene";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PXAssetUIImageViewTile"];
  [v3 validateClass:@"PXFocusableUIImageView"];
  [v3 validateClass:@"PXUIAssetsScene" isKindOfClass:@"PXAssetsScene"];
  [v3 validateClass:@"PXAssetUIImageViewTile" hasInstanceVariable:@"_imageView" withType:"PXFocusableUIImageView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXAssetsScene", @"selectionManager", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXUIAssetsScene", @"checkOutTileForIdentifier:layout:", "^v", "{PXTileIdentifier=Q[10Q]}", "@", 0);
}

- (void)_axApplyAssetsToImageViewTile:(id)a3 withIdentifier:(PXTileIdentifier *)a4
{
  id v6 = a3;
  v7 = [v6 safeValueForKey:@"_imageView"];
  MEMORY[0x2455E3C60](@"PXFocusableUIImageView");
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    unint64_t v9 = a4->var1[1];
    unint64_t v10 = a4->var1[2];
    unint64_t v11 = a4->var1[3];
    unint64_t v12 = a4->var1[4];
    objc_opt_class();
    v13 = [(PXUIAssetsSceneAccessibility *)self safeValueForKey:@"selectionManager"];
    v14 = __UIAccessibilityCastAsClass();

    v15[0] = v9;
    v15[1] = v10;
    v15[2] = v11;
    v15[3] = v12;
    [v8 _axSetIndexPath:v15];
    [v8 _axSetSelectionManager:v14];
  }
}

- (void)checkOutTileForIdentifier:(PXTileIdentifier *)a3 layout:(id)a4
{
  v18.receiver = self;
  v18.super_class = (Class)PXUIAssetsSceneAccessibility;
  long long v6 = *(_OWORD *)&a3->var1[5];
  long long v14 = *(_OWORD *)&a3->var1[3];
  long long v15 = v6;
  long long v16 = *(_OWORD *)&a3->var1[7];
  unint64_t v17 = a3->var1[9];
  long long v7 = *(_OWORD *)&a3->var1[1];
  long long v12 = *(_OWORD *)&a3->var0;
  long long v13 = v7;
  id v8 = [(PXUIAssetsSceneAccessibility *)&v18 checkOutTileForIdentifier:&v12 layout:a4];
  MEMORY[0x2455E3C60](@"PXAssetUIImageViewTile");
  if (objc_opt_isKindOfClass())
  {
    long long v9 = *(_OWORD *)&a3->var1[5];
    long long v14 = *(_OWORD *)&a3->var1[3];
    long long v15 = v9;
    long long v16 = *(_OWORD *)&a3->var1[7];
    unint64_t v17 = a3->var1[9];
    long long v10 = *(_OWORD *)&a3->var1[1];
    long long v12 = *(_OWORD *)&a3->var0;
    long long v13 = v10;
    [(PXUIAssetsSceneAccessibility *)self _axApplyAssetsToImageViewTile:v8 withIdentifier:&v12];
  }

  return v8;
}

@end