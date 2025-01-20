@interface PUAvalancheReviewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_updateCell:(id)a3 forItemAtIndexPath:(id)a4;
- (void)_updateMainViewAnimated:(BOOL)a3;
@end

@implementation PUAvalancheReviewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUAvalancheReviewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUAvalancheReviewController", @"_avalancheBeingReviewed", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUAvalancheReviewController", @"_updateCell: forItemAtIndexPath:", "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUAvalancheReviewController", @"_updateMainViewAnimated:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUAvalancheReviewController", @"_collectionView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PLAvalanche", @"assets", "@", 0);
}

- (void)_updateCell:(id)a3 forItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PUAvalancheReviewControllerAccessibility;
  [(PUAvalancheReviewControllerAccessibility *)&v18 _updateCell:v6 forItemAtIndexPath:v7];
  v8 = [(PUAvalancheReviewControllerAccessibility *)self safeValueForKey:@"_avalancheBeingReviewed"];
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  id v17 = 0;
  id v10 = v8;
  id v11 = v7;
  AXPerformSafeBlock();
  id v9 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  [v6 _accessibilitySetRetainedValue:v9 forKey:@"AXAsset"];
}

void __75__PUAvalancheReviewControllerAccessibility__updateCell_forItemAtIndexPath___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) safeValueForKey:@"assets"];
  uint64_t v2 = objc_msgSend(v5, "objectAtIndex:", objc_msgSend(*(id *)(a1 + 40), "item"));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_updateMainViewAnimated:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PUAvalancheReviewControllerAccessibility;
  [(PUAvalancheReviewControllerAccessibility *)&v6 _updateMainViewAnimated:a3];
  v4 = [(PUAvalancheReviewControllerAccessibility *)self safeValueForKey:@"_collectionView"];
  id v5 = accessibilityPULocalizedString(@"sharing.collection.list");
  [v4 setAccessibilityLabel:v5];
}

@end