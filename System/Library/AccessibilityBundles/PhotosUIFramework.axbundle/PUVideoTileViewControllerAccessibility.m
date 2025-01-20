@interface PUVideoTileViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axConformsToFullScreenTileControllerDelegate;
- (id)_axMainImageView;
- (void)_axApplyCustomAction:(id)a3;
- (void)_updateImage;
- (void)setAssetViewModel:(id)a3;
@end

@implementation PUVideoTileViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUVideoTileViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUVideoTileViewController", @"videoView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUVideoTileViewController", @"setAssetViewModel:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUVideoTileViewController", @"_updateImage", "v", 0);
}

- (BOOL)_axConformsToFullScreenTileControllerDelegate
{
  return 1;
}

- (void)_updateImage
{
  v2.receiver = self;
  v2.super_class = (Class)PUVideoTileViewControllerAccessibility;
  [(PUVideoTileViewControllerAccessibility *)&v2 _updateImage];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (void)setAssetViewModel:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PUVideoTileViewControllerAccessibility;
  id v4 = a3;
  [(PUVideoTileViewControllerAccessibility *)&v7 setAssetViewModel:v4];
  v5 = [(PUVideoTileViewControllerAccessibility *)self safeValueForKey:@"videoView", v7.receiver, v7.super_class];
  v6 = [v4 asset];

  [v5 _accessibilitySetRetainedValue:v6 forKey:@"AXAsset"];
}

- (id)_axMainImageView
{
  return (id)[(PUVideoTileViewControllerAccessibility *)self safeValueForKey:@"videoView"];
}

- (void)_axApplyCustomAction:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(PUVideoTileViewControllerAccessibility *)self _axMainImageView];
  v6 = [v5 accessibilityCustomActions];
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
        v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v12), "name", (void)v16);
        v14 = [v4 name];
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

@end