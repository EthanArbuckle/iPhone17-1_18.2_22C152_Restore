@interface NTKCFaceDetailPigmentEditOptionCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axAnnotateCell:(id)a3 atIndexPath:(id)a4;
@end

@implementation NTKCFaceDetailPigmentEditOptionCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKCFaceDetailPigmentEditOptionCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"NTKCFaceDetailPigmentEditOptionCell" isKindOfClass:@"NTKCFaceDetailEditOptionCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKCFaceDetailEditOptionCell", @"collectionView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKCFaceDetailPigmentEditOptionCell", @"collectionView:cellForItemAtIndexPath:", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKCFaceDetailPigmentEditOptionCell", @"_editOptionIndexForIndexPath:", "q", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKCFaceDetailPigmentEditOptionCell", @"optionAtIndex:", "@", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKCFaceDetailPigmentEditOptionCell", @"_imageForIndexPath:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKCFaceDetailPigmentEditOptionCell", @"_dividerImage", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKCFaceDetailPigmentEditOptionCell", @"_plusImage", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v17.receiver = self;
  v17.super_class = (Class)NTKCFaceDetailPigmentEditOptionCellAccessibility;
  [(NTKCFaceDetailPigmentEditOptionCellAccessibility *)&v17 _accessibilityLoadAccessibilityInformation];
  char v16 = 0;
  objc_opt_class();
  id v3 = [(NTKCFaceDetailPigmentEditOptionCellAccessibility *)self safeValueForKey:@"collectionView"];
  v4 = __UIAccessibilityCastAsClass();

  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = objc_msgSend(v4, "visibleCells", 0);
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        v11 = [v4 indexPathForCell:v10];
        [(NTKCFaceDetailPigmentEditOptionCellAccessibility *)self _axAnnotateCell:v10 atIndexPath:v11];
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v7);
  }
}

- (id)accessibilityElements
{
  uint64_t v3 = [(NTKCFaceDetailPigmentEditOptionCellAccessibility *)self safeValueForKey:@"collectionView"];
  v4 = (void *)v3;
  if (v3)
  {
    uint64_t v9 = v3;
    uint64_t v5 = +[NSArray arrayWithObjects:&v9 count:1];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NTKCFaceDetailPigmentEditOptionCellAccessibility;
    uint64_t v5 = [(NTKCFaceDetailPigmentEditOptionCellAccessibility *)&v8 accessibilityElements];
  }
  id v6 = (void *)v5;

  return v6;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)NTKCFaceDetailPigmentEditOptionCellAccessibility;
  id v6 = a4;
  id v7 = [(NTKCFaceDetailPigmentEditOptionCellAccessibility *)&v9 collectionView:a3 cellForItemAtIndexPath:v6];
  -[NTKCFaceDetailPigmentEditOptionCellAccessibility _axAnnotateCell:atIndexPath:](self, "_axAnnotateCell:atIndexPath:", v7, v6, v9.receiver, v9.super_class);

  return v7;
}

- (void)_axAnnotateCell:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 _accessibilityRemoveValueForKey:@"AXNTKEditOption"];
  [v6 setAccessibilityLabel:0];
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x3032000000;
  objc_super v17 = __Block_byref_object_copy__4;
  v18 = __Block_byref_object_dispose__4;
  id v19 = 0;
  id v8 = v7;
  AXPerformSafeBlock();
  id v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  id v10 = [(NTKCFaceDetailPigmentEditOptionCellAccessibility *)self safeValueForKey:@"_dividerImage"];

  if (v9 != v10)
  {
    id v11 = [(NTKCFaceDetailPigmentEditOptionCellAccessibility *)self safeValueForKey:@"_plusImage"];

    if (v9 == v11)
    {
      accessibilityCompanionLocalizedString(@"color.add.button");
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      [v6 setAccessibilityLabel:v12];
    }
    else
    {
      uint64_t v14 = 0;
      long long v15 = &v14;
      uint64_t v16 = 0x2020000000;
      objc_super v17 = 0;
      id v13 = v8;
      AXPerformSafeBlock();

      _Block_object_dispose(&v14, 8);
      uint64_t v14 = 0;
      long long v15 = &v14;
      uint64_t v16 = 0x3032000000;
      objc_super v17 = __Block_byref_object_copy__4;
      v18 = __Block_byref_object_dispose__4;
      id v19 = 0;
      AXPerformSafeBlock();
      id v12 = (id)v15[5];
      _Block_object_dispose(&v14, 8);

      [v6 _accessibilitySetRetainedValue:v12 forKey:@"AXNTKEditOption"];
    }
  }
  [v6 setIsAccessibilityElement:v9 != v10];
}

uint64_t __80__NTKCFaceDetailPigmentEditOptionCellAccessibility__axAnnotateCell_atIndexPath___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _imageForIndexPath:*(void *)(a1 + 40)];

  return _objc_release_x1();
}

id __80__NTKCFaceDetailPigmentEditOptionCellAccessibility__axAnnotateCell_atIndexPath___block_invoke_2(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) _editOptionIndexForIndexPath:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

uint64_t __80__NTKCFaceDetailPigmentEditOptionCellAccessibility__axAnnotateCell_atIndexPath___block_invoke_3(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) optionAtIndex:*(void *)(a1 + 48)];

  return _objc_release_x1();
}

@end