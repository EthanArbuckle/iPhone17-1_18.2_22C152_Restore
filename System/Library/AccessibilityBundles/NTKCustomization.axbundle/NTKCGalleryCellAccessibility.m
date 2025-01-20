@interface NTKCGalleryCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
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
  [v3 validateClass:@"NTKCGalleryCell" hasInstanceVariable:@"_collectionView" withType:"UICollectionView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKCGalleryCell", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKCGalleryCell", @"collectionView:cellForItemAtIndexPath:", "@", "@", "@", 0);
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
  id v3 = [(NTKCGalleryCellAccessibility *)self safeValueForKey:@"_collectionView"];
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
  v4 = [(NTKCGalleryCellAccessibility *)self safeValueForKey:@"_collectionView"];
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

- (void)_axLabelCollectionViewCell:(id)a3 atIndexPath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  id v7 = [v5 safeValueForKey:@"_nameLabel"];
  uint64_t v8 = __UIAccessibilityCastAsClass();

  objc_super v9 = [v8 text];
  if (![v9 length])
  {

    goto LABEL_5;
  }
  unsigned __int8 v10 = [v8 isHidden];

  if (v10)
  {
LABEL_5:
    [v5 setAccessibilityLabel:0];
    goto LABEL_6;
  }
  v11 = [v8 accessibilityLabel];
  [v5 setAccessibilityLabel:v11];

LABEL_6:
}

@end