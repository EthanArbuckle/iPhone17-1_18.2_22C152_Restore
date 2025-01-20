@interface WallpaperPhotoCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_axWallpaperBundle;
- (id)accessibilityLabel;
- (unint64_t)_axWallpaperType;
- (unint64_t)accessibilityTraits;
@end

@implementation WallpaperPhotoCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WallpaperPhotoCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"WallpaperGridViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WallpaperGridViewController", @"_bundleCollection", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WKWallpaperBundleCollection", @"wallpaperType", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WKWallpaperBundleCollection", @"wallpaperBundleAtIndex:", "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WKWallpaperBundleCollection", @"numberOfItems", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WKWallpaperBundle", @"name", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WKWallpaperBundle", @"_wallpaperAssetLookup", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WKDynamicWallpaper", @"_dynamicDictionary", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (id)accessibilityLabel
{
  if (!accessibilityLabel_Labels)
  {
    accessibilityLabel_Labels = (uint64_t)&unk_26F83A250;
  }
  id v3 = [(WallpaperPhotoCellAccessibility *)self _axWallpaperBundle];
  if ([(WallpaperPhotoCellAccessibility *)self _axWallpaperType] != 2) {
    goto LABEL_10;
  }
  v4 = [v3 safeDictionaryForKey:@"_wallpaperAssetLookup"];
  char v16 = 0;
  objc_opt_class();
  v5 = [v4 objectForKey:@"WKWallpaperLocationHomeScreen"];
  v6 = __UIAccessibilityCastAsClass();

  v7 = [v6 objectForKey:@"default"];
  v8 = [v7 safeDictionaryForKey:@"_dynamicDictionary"];

  v9 = [v8 objectForKey:@"kSBUIMagicWallpaperThumbnailNameKey"];
  if (v9)
  {
    v10 = [(id)accessibilityLabel_Labels objectForKeyedSubscript:v9];
    v11 = v10;
    if (!v10) {
      v10 = v9;
    }
    v12 = accessibilityLocalizedString(v10);
  }
  else
  {
    v12 = 0;
  }

  if (!v12)
  {
LABEL_10:
    v13 = [v3 safeStringForKey:@"name"];
    v12 = AXWallpaperLabel(v13);

    if (!v12)
    {
      v15.receiver = self;
      v15.super_class = (Class)WallpaperPhotoCellAccessibility;
      v12 = [(WallpaperPhotoCellAccessibility *)&v15 accessibilityLabel];
    }
  }

  return v12;
}

- (id)_axWallpaperBundle
{
  v2 = self;
  id v3 = [(WallpaperPhotoCellAccessibility *)v2 _accessibilityIndexPath];
  v4 = [(WallpaperPhotoCellAccessibility *)v2 _accessibilityAncestorIsKindOf:objc_opt_class()];
  v5 = [v4 safeValueForKey:@"delegate"];
  v6 = [v5 safeValueForKey:@"_bundleCollection"];
  if ([v3 item] < 0
    || (uint64_t v7 = [v3 item], v7 >= objc_msgSend(v6, "safeIntegerForKey:", @"numberOfItems")))
  {
    id v8 = 0;
  }
  else
  {
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x3032000000;
    char v16 = __Block_byref_object_copy_;
    v17 = __Block_byref_object_dispose_;
    id v18 = 0;
    id v11 = v6;
    id v12 = v3;
    AXPerformSafeBlock();
    id v8 = (id)v14[5];

    _Block_object_dispose(&v13, 8);
  }
  id v9 = v8;

  return v9;
}

uint64_t __53__WallpaperPhotoCellAccessibility__axWallpaperBundle__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "wallpaperBundleAtIndex:", objc_msgSend(*(id *)(a1 + 40), "item"));

  return MEMORY[0x270F9A758]();
}

- (unint64_t)_axWallpaperType
{
  v2 = self;
  id v3 = [(WallpaperPhotoCellAccessibility *)v2 _accessibilityAncestorIsKindOf:objc_opt_class()];

  v4 = [v3 safeValueForKey:@"delegate"];
  v5 = [v4 safeValueForKey:@"_bundleCollection"];
  unint64_t v6 = [v5 safeUnsignedIntegerForKey:@"wallpaperType"];

  return v6;
}

@end