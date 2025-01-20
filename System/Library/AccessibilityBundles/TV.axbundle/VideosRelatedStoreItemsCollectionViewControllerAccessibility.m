@interface VideosRelatedStoreItemsCollectionViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityDescendantElementAtIndexPathIsValid:(id)a3;
- (id)_createCollectionView;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
@end

@implementation VideosRelatedStoreItemsCollectionViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VideosRelatedStoreItemsCollectionViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)VideosRelatedStoreItemsCollectionViewControllerAccessibility;
  id v6 = a4;
  v7 = [(VideosRelatedStoreItemsCollectionViewControllerAccessibility *)&v14 collectionView:a3 cellForItemAtIndexPath:v6];
  [v6 item];

  objc_opt_class();
  v8 = [(VideosRelatedStoreItemsCollectionViewControllerAccessibility *)self safeValueForKey:@"relatedItems"];
  v9 = __UIAccessibilityCastAsClass();

  id v13 = v7;
  id v10 = v9;
  AXPerformSafeBlock();
  id v11 = v13;

  return v11;
}

void __102__VideosRelatedStoreItemsCollectionViewControllerAccessibility_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) objectAtIndex:*(void *)(a1 + 48)];
  v3 = __UIAccessibilitySafeClass();

  v4 = *(void **)(a1 + 40);
  v5 = [v3 safeValueForKey:@"artistName"];
  [v4 _accessibilitySetRetainedValue:v5 forKey:@"AXArtistName"];
}

- (id)_createCollectionView
{
  v4.receiver = self;
  v4.super_class = (Class)VideosRelatedStoreItemsCollectionViewControllerAccessibility;
  v2 = [(VideosRelatedStoreItemsCollectionViewControllerAccessibility *)&v4 _createCollectionView];
  [v2 setAccessibilityIdentifier:@"AXRelatedStoreItems"];

  return v2;
}

- (BOOL)_accessibilityDescendantElementAtIndexPathIsValid:(id)a3
{
  return a3 != 0;
}

@end