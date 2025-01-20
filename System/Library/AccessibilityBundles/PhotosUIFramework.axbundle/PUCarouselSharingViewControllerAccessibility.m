@interface PUCarouselSharingViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_updateCell:(id)a3 forItemAtIndexPath:(id)a4;
- (void)_updateMainViewAnimated:(BOOL)a3;
@end

@implementation PUCarouselSharingViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUCarouselSharingViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUCarouselSharingViewController", @"mainCollectionView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUCarouselSharingViewController", @"_photoCollectionAtIndex:", "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUCarouselSharingViewController", @"_updateCell:forItemAtIndexPath:", "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUCarouselSharingViewController", @"_updateMainViewAnimated:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUCarouselSharingViewController", @"assetsInAssetCollection:", "@", "@", 0);
}

- (void)_updateCell:(id)a3 forItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PUCarouselSharingViewControllerAccessibility;
  [(PUCarouselSharingViewControllerAccessibility *)&v21 _updateCell:v6 forItemAtIndexPath:v7];
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__2;
  v19 = __Block_byref_object_dispose__2;
  id v20 = 0;
  id v14 = v7;
  AXPerformSafeBlock();
  id v8 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__2;
  v19 = __Block_byref_object_dispose__2;
  id v20 = 0;
  id v13 = v8;
  AXPerformSafeBlock();
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__2;
  v19 = __Block_byref_object_dispose__2;
  id v20 = 0;
  id v11 = v9;
  id v12 = v14;
  AXPerformSafeBlock();
  id v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  [v6 _accessibilitySetRetainedValue:v10 forKey:@"AXAsset"];
}

uint64_t __79__PUCarouselSharingViewControllerAccessibility__updateCell_forItemAtIndexPath___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_photoCollectionAtIndex:", objc_msgSend(*(id *)(a1 + 40), "section"));

  return MEMORY[0x270F9A758]();
}

uint64_t __79__PUCarouselSharingViewControllerAccessibility__updateCell_forItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) assetsInAssetCollection:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

uint64_t __79__PUCarouselSharingViewControllerAccessibility__updateCell_forItemAtIndexPath___block_invoke_3(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", objc_msgSend(*(id *)(a1 + 40), "item"));

  return MEMORY[0x270F9A758]();
}

- (void)_updateMainViewAnimated:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PUCarouselSharingViewControllerAccessibility;
  [(PUCarouselSharingViewControllerAccessibility *)&v7 _updateMainViewAnimated:a3];
  objc_opt_class();
  v4 = [(PUCarouselSharingViewControllerAccessibility *)self safeValueForKey:@"mainCollectionView"];
  v5 = __UIAccessibilityCastAsClass();

  id v6 = accessibilityPULocalizedString(@"sharing.collection.list");
  [v5 setAccessibilityLabel:v6];

  [v5 setAccessibilityIdentifier:@"photoSharingCollectionView"];
}

@end