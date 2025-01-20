@interface NTKCFaceDetailEditOptionCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axAnnotateCell:(id)a3 atIndexPath:(id)a4;
@end

@implementation NTKCFaceDetailEditOptionCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKCFaceDetailEditOptionCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKCFaceDetailEditOptionCell", @"collectionView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKCFaceDetailEditOptionCell", @"optionsDescription", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKCFaceDetailEditOptionCell", @"collectionView: cellForItemAtIndexPath:", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKCFaceDetailEditOptionCell", @"collection", "@", 0);
  [v3 validateClass:@"NTKEditOptionCollection"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKEditOptionCollection", @"options", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v17.receiver = self;
  v17.super_class = (Class)NTKCFaceDetailEditOptionCellAccessibility;
  [(NTKCFaceDetailEditOptionCellAccessibility *)&v17 _accessibilityLoadAccessibilityInformation];
  char v16 = 0;
  objc_opt_class();
  id v3 = [(NTKCFaceDetailEditOptionCellAccessibility *)self safeValueForKey:@"collectionView"];
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
        [(NTKCFaceDetailEditOptionCellAccessibility *)self _axAnnotateCell:v10 atIndexPath:v11];
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v7);
  }
}

- (id)accessibilityElements
{
  id v3 = +[NSMutableArray array];
  v4 = [(NTKCFaceDetailEditOptionCellAccessibility *)self safeValueForKey:@"collectionView"];
  [v3 axSafelyAddObject:v4];

  v5 = [(NTKCFaceDetailEditOptionCellAccessibility *)self safeValueForKey:@"optionsDescription"];
  [v3 axSafelyAddObject:v5];

  if ([v3 count])
  {
    id v6 = v3;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)NTKCFaceDetailEditOptionCellAccessibility;
    id v6 = [(NTKCFaceDetailEditOptionCellAccessibility *)&v9 accessibilityElements];
  }
  id v7 = v6;

  return v7;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)NTKCFaceDetailEditOptionCellAccessibility;
  id v6 = a4;
  id v7 = [(NTKCFaceDetailEditOptionCellAccessibility *)&v9 collectionView:a3 cellForItemAtIndexPath:v6];
  -[NTKCFaceDetailEditOptionCellAccessibility _axAnnotateCell:atIndexPath:](self, "_axAnnotateCell:atIndexPath:", v7, v6, v9.receiver, v9.super_class);

  return v7;
}

- (void)_axAnnotateCell:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NTKCFaceDetailEditOptionCellAccessibility *)self safeValueForKey:@"collection"];
  objc_opt_class();
  objc_super v9 = [v8 safeValueForKey:@"options"];
  uint64_t v10 = __UIAccessibilityCastAsClass();

  if (v10)
  {
    id v11 = [v7 item];
    if (v11 < [v10 count])
    {
      long long v12 = objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v7, "item"));
      [v6 _accessibilitySetRetainedValue:v12 forKey:@"AXNTKEditOption"];
    }
  }
}

@end