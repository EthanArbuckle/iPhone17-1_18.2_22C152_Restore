@interface VideosUICollectionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityOpaqueElementScrollsContentIntoView;
- (UIEdgeInsets)_accessibilityContentInset;
- (id)_accessibilityOtherCollectionViewItems;
@end

@implementation VideosUICollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UICollectionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (UIEdgeInsets)_accessibilityContentInset
{
  v25.receiver = self;
  v25.super_class = (Class)VideosUICollectionViewAccessibility;
  [(VideosUICollectionViewAccessibility *)&v25 _accessibilityContentInset];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(VideosUICollectionViewAccessibility *)self accessibilityIdentifier];
  int v12 = [v11 isEqualToString:@"AXRelatedStoreItems"];

  if (v12)
  {
    uint64_t v21 = 0;
    v22 = (double *)&v21;
    uint64_t v23 = 0x2020000000;
    double v24 = v4;
    char v20 = 0;
    objc_opt_class();
    v13 = [(VideosUICollectionViewAccessibility *)self safeValueForKey:@"subviews"];
    v14 = __UIAccessibilityCastAsClass();

    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __65__VideosUICollectionViewAccessibility__accessibilityContentInset__block_invoke;
    v19[3] = &unk_26515D400;
    v19[4] = &v21;
    [v14 enumerateObjectsUsingBlock:v19];
    double v4 = v22[3];

    _Block_object_dispose(&v21, 8);
  }
  double v15 = v4;
  double v16 = v6;
  double v17 = v8;
  double v18 = v10;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

void __65__VideosUICollectionViewAccessibility__accessibilityContentInset__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v3 = [v5 safeValueForKey:@"frame"];
    [v3 CGRectValue];
    *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                            + 24)
                                                                - v4;
  }
}

- (id)_accessibilityOtherCollectionViewItems
{
  v16.receiver = self;
  v16.super_class = (Class)VideosUICollectionViewAccessibility;
  double v3 = [(VideosUICollectionViewAccessibility *)&v16 _accessibilityOtherCollectionViewItems];
  double v4 = [(VideosUICollectionViewAccessibility *)self accessibilityIdentifier];
  int v5 = [v4 isEqualToString:@"AXRelatedStoreItems"];

  if (v5)
  {
    double v6 = [MEMORY[0x263EFF980] array];
    char v15 = 0;
    objc_opt_class();
    double v7 = [(VideosUICollectionViewAccessibility *)self safeValueForKey:@"subviews"];
    double v8 = __UIAccessibilityCastAsClass();

    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __77__VideosUICollectionViewAccessibility__accessibilityOtherCollectionViewItems__block_invoke;
    v12[3] = &unk_26515D428;
    id v13 = v3;
    id v14 = v6;
    id v9 = v6;
    id v10 = v3;
    [v8 enumerateObjectsUsingBlock:v12];
    double v3 = [v9 arrayByAddingObjectsFromArray:v10];
  }

  return v3;
}

void __77__VideosUICollectionViewAccessibility__accessibilityOtherCollectionViewItems__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && ([*(id *)(a1 + 32) containsObject:v3] & 1) == 0) {
    objc_msgSend(*(id *)(a1 + 40), "ax_enqueueObject:", v3);
  }
}

- (BOOL)_accessibilityOpaqueElementScrollsContentIntoView
{
  return 1;
}

@end