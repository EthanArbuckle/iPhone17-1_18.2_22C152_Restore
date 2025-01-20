@interface UICollectionViewDiffableDataSourceAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
@end

@implementation UICollectionViewDiffableDataSourceAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UICollectionViewDiffableDataSource";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [location[0] validateClass:@"UICollectionViewDiffableDataSource" hasInstanceVariable:@"_impl" withType:"__UIDiffableDataSource"];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"__UIDiffableDataSource", @"itemIdentifierForIndexPath:", "@", 0);
  objc_storeStrong(v4, obj);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v21 = 0;
  objc_storeStrong(&v21, a4);
  v19.receiver = v23;
  v19.super_class = (Class)UICollectionViewDiffableDataSourceAccessibility;
  id v20 = [(UICollectionViewDiffableDataSourceAccessibility *)&v19 collectionView:location[0] cellForItemAtIndexPath:v21];
  id v18 = (id)[(UICollectionViewDiffableDataSourceAccessibility *)v23 _accessibilityDiffableDataSourceAnnotator];
  if (v18)
  {
    uint64_t v10 = 0;
    v11 = &v10;
    int v12 = 838860800;
    int v13 = 48;
    v14 = __Block_byref_object_copy__1;
    v15 = __Block_byref_object_dispose__1;
    id v16 = 0;
    v9[1] = &v10;
    v8 = v23;
    v9[0] = v21;
    AXPerformSafeBlock();
    id v7 = (id)v11[5];
    objc_storeStrong(v9, 0);
    objc_storeStrong((id *)&v8, 0);
    _Block_object_dispose(&v10, 8);
    objc_storeStrong(&v16, 0);
    id v17 = v7;
    (*((void (**)(id, id, id))v18 + 2))(v18, v20, v7);
    objc_storeStrong(&v17, 0);
  }
  id v5 = v20;
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);

  return v5;
}

void __89__UICollectionViewDiffableDataSourceAccessibility_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1)
{
  id v5 = (id)[*(id *)(a1 + 32) safeValueForKey:@"_impl"];
  id v1 = (id)[v5 itemIdentifierForIndexPath:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v1;
}

@end