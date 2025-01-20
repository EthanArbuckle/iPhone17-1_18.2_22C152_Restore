@interface _NTKCUltraCubePhotoListViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation _NTKCUltraCubePhotoListViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_NTKCUltraCubePhotoListViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"_NTKCFaceDetailCustomPhotosViewController" isKindOfClass:@"UICollectionViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_NTKCUltraCubePhotoListViewController", @"editor", "@", 0);
  [v3 validateClass:@"NTKCompanionUltraCubePhotosEditor" hasInstanceVariable:@"_orderList" withType:"NSMutableArray"];
  [v3 validateClass:@"NTKCompanionUltraCubePhotosEditor" hasInstanceVariable:@"_photos" withType:"NSMutableDictionary"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_NTKEditedUltraCubePhoto", @"asset", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)_NTKCUltraCubePhotoListViewControllerAccessibility;
  [(_NTKCUltraCubePhotoListViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(_NTKCUltraCubePhotoListViewControllerAccessibility *)self safeValueForKey:@"view"];
  v4 = v3;
  if (v3) {
    [v3 setAccessibilityViewIsModal:1];
  }
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)_NTKCUltraCubePhotoListViewControllerAccessibility;
  v8 = [(_NTKCUltraCubePhotoListViewControllerAccessibility *)&v22 collectionView:v6 cellForItemAtIndexPath:v7];
  v9 = [(_NTKCUltraCubePhotoListViewControllerAccessibility *)self safeValueForKey:@"editor"];
  v10 = [v9 safeArrayForKey:@"_orderList"];
  id v11 = [v7 item];
  if (v11 >= [v10 count])
  {
    v12 = 0;
  }
  else
  {
    v12 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));
  }
  v13 = [v9 safeDictionaryForKey:@"_photos"];
  v14 = v13;
  if (v12)
  {
    v15 = [v13 objectForKeyedSubscript:v12];
    objc_opt_class();
    v16 = [v15 safeValueForKey:@"asset"];
    v17 = __UIAccessibilityCastAsClass();

    if (v17 && v8)
    {
      [v8 setIsAccessibilityElement:1];
      v18 = [v17 accessibilityLabel];
      [v8 setAccessibilityLabel:v18];

      v19 = [v17 accessibilityValue];
      [v8 setAccessibilityValue:v19];

      v20 = [v17 accessibilityCustomContent];
      [v8 setAccessibilityCustomContent:v20];

      [v8 setAccessibilityTraits:UIAccessibilityTraitButton];
    }
  }

  return v8;
}

@end