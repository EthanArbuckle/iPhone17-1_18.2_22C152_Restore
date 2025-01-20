@interface NTKCGalleryCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_axLabelForFace:(id)a3;
- (id)accessibilityElements;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axLabelCollectionViewCell:(id)a3 atIndexPath:(id)a4;
- (void)_axMarkHeader;
@end

@implementation NTKCGalleryCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKCGalleryCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"_NTKCGalleryCollectionCell"];
  [v3 validateClass:@"_NTKCGalleryCollectionCell" hasInstanceVariable:@"_nameLabel" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKCGalleryCell", @"collection", "@", 0);
  [v3 validateClass:@"NTKGalleryCollection"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKGalleryCollection", @"numberOfFaces", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKGalleryCollection", @"faceAtIndex:", "@", "Q", 0);
  [v3 validateClass:@"NTKFace"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKFace", @"name", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKCGalleryCell", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKCGalleryCell", @"collectionView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKCGalleryCell", @"collectionView: cellForItemAtIndexPath:", "@", "@", "@", 0);
}

- (void)_axMarkHeader
{
  id v2 = [(NTKCGalleryCellAccessibility *)self safeValueForKey:@"title"];
  [v2 setAccessibilityTraits:UIAccessibilityTraitHeader];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v17.receiver = self;
  v17.super_class = (Class)NTKCGalleryCellAccessibility;
  [(NTKCGalleryCellAccessibility *)&v17 _accessibilityLoadAccessibilityInformation];
  [(NTKCGalleryCellAccessibility *)self _axMarkHeader];
  char v16 = 0;
  objc_opt_class();
  id v3 = [(NTKCGalleryCellAccessibility *)self safeValueForKey:@"collectionView"];
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
        [(NTKCGalleryCellAccessibility *)self _axLabelCollectionViewCell:v10 atIndexPath:v11];
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v7);
  }
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityElements
{
  [(NTKCGalleryCellAccessibility *)self _axMarkHeader];
  id v3 = [(NTKCGalleryCellAccessibility *)self safeValueForKey:@"title"];
  v4 = [(NTKCGalleryCellAccessibility *)self safeValueForKey:@"collectionView"];
  v5 = +[NSArray axArrayByIgnoringNilElementsWithCount:](NSArray, "axArrayByIgnoringNilElementsWithCount:", 2, v3, v4);

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)NTKCGalleryCellAccessibility;
  id v6 = a4;
  id v7 = [(NTKCGalleryCellAccessibility *)&v9 collectionView:a3 cellForItemAtIndexPath:v6];
  -[NTKCGalleryCellAccessibility _axLabelCollectionViewCell:atIndexPath:](self, "_axLabelCollectionViewCell:atIndexPath:", v7, v6, v9.receiver, v9.super_class);

  return v7;
}

- (id)_axLabelForFace:(id)a3
{
  id v3 = a3;
  v4 = [v3 safeStringForKey:@"name"];
  v5 = [v3 safeStringForKey:@"_accessibilityFaceEditOptionsDescription"];

  id v6 = __UIAXStringForVariables();

  return v6;
}

- (void)_axLabelCollectionViewCell:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  LOBYTE(v18) = 0;
  objc_opt_class();
  uint64_t v8 = [v6 safeValueForKey:@"_nameLabel"];
  objc_super v9 = __UIAccessibilityCastAsClass();

  uint64_t v10 = [v9 text];
  if ([v10 length])
  {
    unsigned __int8 v11 = [v9 isHidden];

    if ((v11 & 1) == 0)
    {
      id v12 = [v9 accessibilityLabel];
      long long v13 = v6;
      id v14 = v12;
LABEL_8:
      [v13 setAccessibilityLabel:v14];
      goto LABEL_9;
    }
  }
  else
  {
  }
  id v15 = [v7 item];
  id v12 = [(NTKCGalleryCellAccessibility *)self safeValueForKey:@"collection"];
  if (v15 >= [v12 safeUnsignedIntegerForKey:@"numberOfFaces"])
  {
    long long v13 = v6;
    id v14 = 0;
    goto LABEL_8;
  }
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__3;
  v22 = __Block_byref_object_dispose__3;
  id v23 = 0;
  id v12 = v12;
  AXPerformSafeBlock();
  id v16 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  objc_super v17 = [(NTKCGalleryCellAccessibility *)self _axLabelForFace:v16];

  [v6 setAccessibilityLabel:v17];
LABEL_9:
}

uint64_t __71__NTKCGalleryCellAccessibility__axLabelCollectionViewCell_atIndexPath___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) faceAtIndex:*(void *)(a1 + 48)];

  return _objc_release_x1();
}

@end