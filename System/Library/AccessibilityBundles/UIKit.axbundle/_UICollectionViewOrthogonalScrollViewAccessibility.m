@interface _UICollectionViewOrthogonalScrollViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityOnlyComparesByXAxis;
- (BOOL)_accessibilityScrollAcrossPageBoundaries;
@end

@implementation _UICollectionViewOrthogonalScrollViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UICollectionViewOrthogonalScrollView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v5 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = @"_UICollectionViewOrthogonalScrollView";
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  [location[0] validateClass:@"_UICollectionViewOrthogonalScrollView" hasInstanceVariable:@"_collectionView" withType:"UICollectionView"];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UICollectionView", @"collectionViewLayout", "@", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UICollectionViewLayout", @"_orthogonalScrollingAxis", "Q", 0);
  objc_storeStrong(v5, obj);
}

- (BOOL)_accessibilityOnlyComparesByXAxis
{
  id v3 = (id)[(_UICollectionViewOrthogonalScrollViewAccessibility *)self safeValueForKeyPath:@"_collectionView.collectionViewLayout"];
  uint64_t v4 = [v3 safeUnsignedIntForKey:@"_orthogonalScrollingAxis"];

  return v4 == 1;
}

- (BOOL)_accessibilityScrollAcrossPageBoundaries
{
  v12[2] = self;
  v12[1] = (id)a2;
  v12[0] = (id)[(_UICollectionViewOrthogonalScrollViewAccessibility *)self _accessibilityUserDefinedScrollAcrossPageBoundaries];
  char v11 = 0;
  if (v12[0])
  {
    char v11 = [v12[0] BOOLValue] & 1;
  }
  else
  {
    double v9 = 0.0;
    double v10 = 0.0;
    char v8 = 0;
    objc_opt_class();
    id v7 = (id)__UIAccessibilityCastAsClass();
    id v6 = v7;
    objc_storeStrong(&v7, 0);
    [v6 _interpageSpacing];
    double v9 = v2;
    double v10 = v3;

    char v11 = !__CGSizeEqualToSize_4(v9, v10, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  }
  char v5 = v11;
  objc_storeStrong(v12, 0);
  return v5 & 1;
}

@end