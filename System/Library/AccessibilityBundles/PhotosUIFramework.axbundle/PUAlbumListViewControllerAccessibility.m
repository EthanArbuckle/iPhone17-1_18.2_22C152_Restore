@interface PUAlbumListViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axAddCustomContentTypeToCell:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
@end

@implementation PUAlbumListViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUAlbumListViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PUAlbumListCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUAlbumListViewController", @"_mainCollectionView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUAlbumListCell", @"albumListCellContentView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUAlbumListViewController", @"collectionView: cellForItemAtIndexPath:", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUAlbumListViewController", @"indexPathForPlacesAlbum", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUAlbumListViewController", @"indexPathForPeopleAlbum", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUAlbumListViewController", @"isPlaceholderAtIndexPath:", "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUAlbumListViewController", @"collectionAtIndexPath:", "@", "@", 0);
}

- (void)_axAddCustomContentTypeToCell:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  NSClassFromString(&cfstr_Pualbumlistcel_2.isa);
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    v11 = [v8 safeValueForKey:@"albumListCellContentView"];
    v12 = __UIAccessibilityCastAsSafeCategory();

    v13 = [(PUAlbumListViewControllerAccessibility *)self indexPathForPeopleAlbum];
    char v14 = [v10 isEqual:v13];

    if (v14)
    {
      v15 = @"AXAlbumContentTypePeople";
LABEL_17:
      [v12 _axSetCellCustomContentType:v15];

      goto LABEL_18;
    }
    v16 = [(PUAlbumListViewControllerAccessibility *)self indexPathForPlacesAlbum];
    char v17 = [v10 isEqual:v16];

    if (v17)
    {
      v15 = @"AXAlbumContentTypePlaces";
      goto LABEL_17;
    }
    if ([(PUAlbumListViewControllerAccessibility *)self isPlaceholderAtIndexPath:v10])
    {
      v15 = 0;
      goto LABEL_17;
    }
    v18 = [(PUAlbumListViewControllerAccessibility *)self collectionAtIndexPath:v10];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v19 = [v18 assetCollectionSubtype];
      if ((unint64_t)(v19 - 202) < 0xA)
      {
        v15 = off_2650A7EA8[v19 - 202];
LABEL_16:

        goto LABEL_17;
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([v18 collectionListType] == 2) {
          v15 = @"AXAlbumContentTypeFolder";
        }
        else {
          v15 = 0;
        }
        goto LABEL_16;
      }
    }
    v15 = 0;
    goto LABEL_16;
  }
LABEL_18:
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)PUAlbumListViewControllerAccessibility;
  [(PUAlbumListViewControllerAccessibility *)&v17 _accessibilityLoadAccessibilityInformation];
  char v16 = 0;
  objc_opt_class();
  id v3 = [(PUAlbumListViewControllerAccessibility *)self safeValueForKey:@"_mainCollectionView"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 indexPathsForVisibleItems];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        v11 = [v4 cellForItemAtIndexPath:v10];
        [(PUAlbumListViewControllerAccessibility *)self _axAddCustomContentTypeToCell:v11 inCollectionView:v4 atIndexPath:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v7);
  }
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)PUAlbumListViewControllerAccessibility;
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(PUAlbumListViewControllerAccessibility *)&v10 collectionView:v7 cellForItemAtIndexPath:v6];
  -[PUAlbumListViewControllerAccessibility _axAddCustomContentTypeToCell:inCollectionView:atIndexPath:](self, "_axAddCustomContentTypeToCell:inCollectionView:atIndexPath:", v8, v7, v6, v10.receiver, v10.super_class);

  return v8;
}

@end