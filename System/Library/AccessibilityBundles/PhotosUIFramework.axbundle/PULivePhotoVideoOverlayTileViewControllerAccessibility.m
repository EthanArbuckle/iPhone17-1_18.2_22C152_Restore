@interface PULivePhotoVideoOverlayTileViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axApplyAssetToView;
- (void)viewModel:(id)a3 didChange:(id)a4;
@end

@implementation PULivePhotoVideoOverlayTileViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PULivePhotoVideoOverlayTileViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PULivePhotoVideoOverlayTileViewController", @"mergedVideo", "@", 0);
  [v3 validateClass:@"PULivePhotoVideoOverlayTileViewController" isKindOfClass:@"PUTileViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUTileViewController", @"view", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUMergedLivePhotosVideo", @"assets", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PULivePhotoVideoOverlayTileViewController", @"viewModel:didChange:", "v", "@", "@", 0);
}

- (void)_axApplyAssetToView
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = [(PULivePhotoVideoOverlayTileViewControllerAccessibility *)self safeValueForKey:@"mergedVideo"];
  v4 = [v3 safeArrayForKey:@"assets"];

  v5 = [v4 firstObject];
  v6 = [(PULivePhotoVideoOverlayTileViewControllerAccessibility *)self safeValueForKey:@"view"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v7 = objc_msgSend(v6, "subviews", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            NSClassFromString(&cfstr_Phlivephotovie_0.isa);
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              continue;
            }
          }
          id v13 = v12;

          v6 = v13;
          goto LABEL_13;
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v6 _accessibilitySetRetainedValue:v5 forKey:@"AXPHImageAsset"];
  }
  [v6 setIsAccessibilityElement:v5 != 0];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)PULivePhotoVideoOverlayTileViewControllerAccessibility;
  [(PULivePhotoVideoOverlayTileViewControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(PULivePhotoVideoOverlayTileViewControllerAccessibility *)self _axApplyAssetToView];
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PULivePhotoVideoOverlayTileViewControllerAccessibility;
  id v6 = a4;
  [(PULivePhotoVideoOverlayTileViewControllerAccessibility *)&v7 viewModel:a3 didChange:v6];
  LODWORD(a3) = objc_msgSend(v6, "safeBoolForKey:", @"currentAssetDidChange", v7.receiver, v7.super_class);

  if (a3) {
    [(PULivePhotoVideoOverlayTileViewControllerAccessibility *)self _axApplyAssetToView];
  }
}

@end