@interface PuppetCollectionViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
@end

@implementation PuppetCollectionViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PuppetCollectionViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PuppetCollectionViewController" hasInstanceVariable:@"_puppetCollectionView" withType:"UICollectionView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PuppetCollectionViewController", @"numberOfPrecedingCells", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PuppetCollectionViewController", @"collectionView:cellForItemAtIndexPath:", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PuppetCollectionViewController", @"avatarDataSource", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PuppetCollectionViewController", @"recordIndexForIndexPath:", "q", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAvatarRecordDataSource", @"recordAtIndex:", "@", "Q", 0);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)PuppetCollectionViewControllerAccessibility;
  v8 = [(PuppetCollectionViewControllerAccessibility *)&v29 collectionView:v6 cellForItemAtIndexPath:v7];
  [v8 setIsAccessibilityElement:1];
  [v8 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
  uint64_t v9 = [v7 row];
  if (v9 >= [(PuppetCollectionViewControllerAccessibility *)self safeIntegerForKey:@"numberOfPrecedingCells"])
  {
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2020000000;
    v19 = 0;
    uint64_t v22 = MEMORY[0x263EF8330];
    uint64_t v23 = 3221225472;
    v24 = __85__PuppetCollectionViewControllerAccessibility_collectionView_cellForItemAtIndexPath___block_invoke;
    v25 = &unk_2651039D0;
    v28 = &v16;
    v26 = self;
    id v27 = v7;
    AXPerformSafeBlock();
    uint64_t v11 = v17[3];

    _Block_object_dispose(&v16, 8);
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x3032000000;
    v19 = __Block_byref_object_copy_;
    v20 = __Block_byref_object_dispose_;
    id v21 = 0;
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = v11;
    AXPerformSafeBlock();
    id v12 = (id)v17[5];
    _Block_object_dispose(&v16, 8);

    v10 = objc_msgSend(MEMORY[0x263F22288], "descriptionForAvatarWithRecord:includeVideoPrefix:", v12, 0, v14, 3221225472, __85__PuppetCollectionViewControllerAccessibility_collectionView_cellForItemAtIndexPath___block_invoke_301, &unk_2651039F8, self, &v16, v15);
  }
  else
  {
    v10 = accessibilityJellyfishLocalizedString(@"starfish.add");
  }
  [v8 setAccessibilityLabel:v10];

  return v8;
}

uint64_t __85__PuppetCollectionViewControllerAccessibility_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) recordIndexForIndexPath:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void __85__PuppetCollectionViewControllerAccessibility_collectionView_cellForItemAtIndexPath___block_invoke_301(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) safeValueForKey:@"avatarDataSource"];
  uint64_t v2 = [v5 recordAtIndex:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

@end