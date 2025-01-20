@interface HUNamedWallpaperCollectionViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
@end

@implementation HUNamedWallpaperCollectionViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUNamedWallpaperCollectionViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUNamedWallpaperCollectionViewController", @"collectionView: cellForItemAtIndexPath:", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HFWallpaper", @"assetIdentifier", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUNamedWallpaperCollectionViewController", @"wallpapers", "@", 0);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HUNamedWallpaperCollectionViewControllerAccessibility;
  v8 = [(HUNamedWallpaperCollectionViewControllerAccessibility *)&v17 collectionView:v6 cellForItemAtIndexPath:v7];
  [v8 setIsAccessibilityElement:1];
  objc_opt_class();
  v9 = [(HUNamedWallpaperCollectionViewControllerAccessibility *)self safeValueForKey:@"wallpapers"];
  v10 = __UIAccessibilityCastAsClass();

  unint64_t v11 = [v7 item];
  if (v11 < [v10 count])
  {
    v12 = objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v7, "item"));
    objc_opt_class();
    v13 = [v12 safeValueForKey:@"assetIdentifier"];
    v14 = __UIAccessibilityCastAsClass();

    v15 = accessibilityLabelForNamedWallpaper(v14);
    [v8 setAccessibilityLabel:v15];
  }

  return v8;
}

@end