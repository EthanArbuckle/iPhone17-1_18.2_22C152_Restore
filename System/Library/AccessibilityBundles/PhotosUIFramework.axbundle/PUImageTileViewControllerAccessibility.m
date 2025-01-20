@interface PUImageTileViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axConformsToFullScreenTileControllerDelegate;
- (id)_axGetFaces;
- (id)_axImageView;
- (id)_axMainImageView;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axApplyAssetToView;
- (void)_axApplyCustomAction:(id)a3;
- (void)_setAXFaces:(id)a3;
- (void)assetDidChange;
- (void)dealloc;
@end

@implementation PUImageTileViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUImageTileViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PHLivePhotoView"];
  [v3 validateClass:@"PUIrisImageTileViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUImageTileViewController", @"assetDidChange", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUImageTileViewController", @"asset", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUImageTileViewController", @"_imageView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUIrisImageTileViewController", @"_livePhotoView", "@", 0);
}

- (void)dealloc
{
  id v3 = [(PUImageTileViewControllerAccessibility *)self safeValueForKey:@"asset"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = MEMORY[0x263EF8330];
    uint64_t v6 = 3221225472;
    v7 = __49__PUImageTileViewControllerAccessibility_dealloc__block_invoke;
    v8 = &unk_2650A7E60;
    id v9 = v3;
    AXPerformSafeBlock();
  }
  v4.receiver = self;
  v4.super_class = (Class)PUImageTileViewControllerAccessibility;
  [(PUImageTileViewControllerAccessibility *)&v4 dealloc];
}

uint64_t __49__PUImageTileViewControllerAccessibility_dealloc__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessibilityApplyValueBlock:0];
}

- (BOOL)_axConformsToFullScreenTileControllerDelegate
{
  return 1;
}

- (void)_axApplyAssetToView
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = [(PUImageTileViewControllerAccessibility *)self safeValueForKey:@"asset"];
  objc_super v4 = [(PUImageTileViewControllerAccessibility *)self safeValueForKey:@"view"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v5 = objc_msgSend(v4, "subviews", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            NSClassFromString(&cfstr_Phlivephotovie_0.isa);
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              continue;
            }
          }
          id v11 = v10;

          objc_super v4 = v11;
          goto LABEL_13;
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v4 _accessibilitySetRetainedValue:v3 forKey:@"AXPHImageAsset"];
    }
  }
  [v4 setIsAccessibilityElement:v3 != 0];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)PUImageTileViewControllerAccessibility;
  [(PUImageTileViewControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(PUImageTileViewControllerAccessibility *)self _axApplyAssetToView];
}

- (void)assetDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PUImageTileViewControllerAccessibility;
  [(PUImageTileViewControllerAccessibility *)&v3 assetDidChange];
  [(PUImageTileViewControllerAccessibility *)self _axApplyAssetToView];
}

- (id)_axMainImageView
{
  NSClassFromString(&cfstr_Puirisimagetil.isa);
  if (objc_opt_isKindOfClass()) {
    [(PUImageTileViewControllerAccessibility *)self safeValueForKey:@"_livePhotoView"];
  }
  else {
  objc_super v3 = [(PUImageTileViewControllerAccessibility *)self _axImageView];
  }

  return v3;
}

- (void)_axApplyCustomAction:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(PUImageTileViewControllerAccessibility *)self _axMainImageView];
  uint64_t v6 = [v5 accessibilityCustomActions];
  id v7 = (id)[v6 mutableCopy];

  if (!v7) {
    id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v12), "name", (void)v16);
        long long v14 = [v4 name];
        char v15 = [v13 isEqualToString:v14];

        if (v15)
        {

          goto LABEL_13;
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  [v8 addObject:v4];
  [v5 setAccessibilityCustomActions:v8];
LABEL_13:
}

- (id)_axGetFaces
{
}

- (void)_setAXFaces:(id)a3
{
}

- (id)_axImageView
{
  NSClassFromString(&cfstr_Puirisimagetil.isa);
  if (objc_opt_isKindOfClass())
  {
    objc_super v3 = [(PUImageTileViewControllerAccessibility *)self safeValueForKeyPath:@"_livePhotoView"];
    id v4 = [v3 _accessibilityFindSubviewDescendant:&__block_literal_global_8];
    objc_opt_class();
    uint64_t v5 = __UIAccessibilityCastAsClass();
  }
  else
  {
    uint64_t v5 = [(PUImageTileViewControllerAccessibility *)self safeValueForKey:@"_imageView"];
  }

  return v5;
}

uint64_t __54__PUImageTileViewControllerAccessibility__axImageView__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Uiimageview.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end