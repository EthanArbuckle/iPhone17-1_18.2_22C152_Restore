@interface CKDetailsSearchViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axSectionMap;
- (id)cellForItemInCollectionView:(id)a3 atIndexPath:(id)a4 withIdentifier:(id)a5;
- (id)dequeueReusableCellWithReuseIdentifier:(id)a3 forIndexPath:(id)a4;
- (id)dequeueReusableSupplementaryViewOfKind:(id)a3 withReuseIdentifier:(id)a4 forIndexPath:(id)a5;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axAddCellToMapWithSection:(id)a3 cell:(id)a4;
- (void)_setAXSectionMap:(id)a3;
- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6;
@end

@implementation CKDetailsSearchViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKDetailsSearchViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CKDetailsSearchViewController" isKindOfClass:@"CKSearchViewController"];
  [v3 validateClass:@"CKSearchViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"CKSearchViewController" conformsToProtocol:@"UICollectionViewDelegate"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKSearchViewController", @"searchControllers", "@", 0);
  [v3 validateClass:@"CKDetailsSearchResultsTitleHeaderCell"];
  [v3 validateProtocol:@"UICollectionViewDelegate" hasMethod:@"collectionView:willDisplaySupplementaryView:forElementKind:atIndexPath:" isInstanceMethod:1 isRequired:0];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKSearchController", @"cellForItemInCollectionView:atIndexPath:withIdentifier:", "@", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UICollectionView", @"dequeueReusableCellWithReuseIdentifier:forIndexPath:", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UICollectionView", @"dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", "@", "@", "@", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)CKDetailsSearchViewControllerAccessibility;
  [(CKDetailsSearchViewControllerAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CKDetailsSearchViewControllerAccessibility *)self safeValueForKey:@"view"];
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __88__CKDetailsSearchViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v4[3] = &unk_265112F20;
  objc_copyWeak(&v5, &location);
  [v3 _setAccessibilityElementsBlock:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

id __88__CKDetailsSearchViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [MEMORY[0x263EFF980] array];
  id v3 = [WeakRetained safeArrayForKey:@"searchControllers"];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      v6 = [WeakRetained _axSectionMap];
      objc_super v7 = [NSNumber numberWithUnsignedInteger:i];
      v8 = [v6 objectForKey:v7];
      [v2 axSafelyAddObjectsFromArray:v8];
    }
  }

  return v2;
}

- (id)_axSectionMap
{
}

- (void)_setAXSectionMap:(id)a3
{
}

- (id)cellForItemInCollectionView:(id)a3 atIndexPath:(id)a4 withIdentifier:(id)a5
{
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CKDetailsSearchViewControllerAccessibility;
  v9 = [(CKDetailsSearchViewControllerAccessibility *)&v12 cellForItemInCollectionView:a3 atIndexPath:v8 withIdentifier:a5];
  if (v9)
  {
    v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "section"));
    [(CKDetailsSearchViewControllerAccessibility *)self _axAddCellToMapWithSection:v10 cell:v9];
  }

  return v9;
}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  v13.receiver = self;
  v13.super_class = (Class)CKDetailsSearchViewControllerAccessibility;
  [(CKDetailsSearchViewControllerAccessibility *)&v13 collectionView:a3 willDisplaySupplementaryView:v10 forElementKind:a5 atIndexPath:v11];
  if (v10)
  {
    objc_super v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v11, "section"));
    [(CKDetailsSearchViewControllerAccessibility *)self _axAddCellToMapWithSection:v12 cell:v10];
  }
}

- (id)dequeueReusableCellWithReuseIdentifier:(id)a3 forIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(CKDetailsSearchViewControllerAccessibility *)self _setAXSectionMap:0];
  v10.receiver = self;
  v10.super_class = (Class)CKDetailsSearchViewControllerAccessibility;
  id v8 = [(CKDetailsSearchViewControllerAccessibility *)&v10 dequeueReusableCellWithReuseIdentifier:v7 forIndexPath:v6];

  return v8;
}

- (id)dequeueReusableSupplementaryViewOfKind:(id)a3 withReuseIdentifier:(id)a4 forIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(CKDetailsSearchViewControllerAccessibility *)self _setAXSectionMap:0];
  v13.receiver = self;
  v13.super_class = (Class)CKDetailsSearchViewControllerAccessibility;
  id v11 = [(CKDetailsSearchViewControllerAccessibility *)&v13 dequeueReusableSupplementaryViewOfKind:v10 withReuseIdentifier:v9 forIndexPath:v8];

  return v11;
}

- (void)_axAddCellToMapWithSection:(id)a3 cell:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = [(CKDetailsSearchViewControllerAccessibility *)self _axSectionMap];

  if (!v7)
  {
    id v8 = [MEMORY[0x263EFF9A0] dictionary];
    [(CKDetailsSearchViewControllerAccessibility *)self _setAXSectionMap:v8];
  }
  id v9 = [(CKDetailsSearchViewControllerAccessibility *)self _axSectionMap];
  id v10 = [v9 objectForKey:v13];

  if (v10)
  {
    id v11 = [MEMORY[0x263EFF980] array];
    NSClassFromString(&cfstr_Ckdetailssearc_2.isa);
    if (objc_opt_isKindOfClass())
    {
      [v11 axSafelyAddObject:v6];
      [v11 axSafelyAddObjectsFromArray:v10];
    }
    else
    {
      [v11 axSafelyAddObjectsFromArray:v10];
      [v11 axSafelyAddObject:v6];
    }
  }
  else
  {
    id v11 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 1, v6);
  }
  objc_super v12 = [(CKDetailsSearchViewControllerAccessibility *)self _axSectionMap];
  [v12 setObject:v11 forKey:v13];
}

@end