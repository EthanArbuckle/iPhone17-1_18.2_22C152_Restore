@interface CNPhotoPickerVariantListControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation CNPhotoPickerVariantListControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNPhotoPickerVariantListController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CNPhotoPickerVariantListController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNPhotoPickerVariantListController", @"providerItems", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNPhotoPickerVariantListController", @"collectionView:cellForItemAtIndexPath:", "@", "@", "@", 0);
  [v3 validateClass:@"CNPhotoPickerVariantListController" hasProperty:@"collectionView" withType:"@"];
  [v3 validateClass:@"CNPhotoPickerCollectionViewCell"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)CNPhotoPickerVariantListControllerAccessibility;
  [(CNPhotoPickerVariantListControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CNPhotoPickerVariantListControllerAccessibility *)self safeValueForKey:@"collectionView"];
  v4 = accessibilityLocalizedString(@"collection.photos.label");
  [v3 setAccessibilityLabel:v4];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CNPhotoPickerVariantListControllerAccessibility;
  [(CNPhotoPickerVariantListControllerAccessibility *)&v3 viewDidLoad];
  [(CNPhotoPickerVariantListControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CNPhotoPickerVariantListControllerAccessibility;
  v8 = [(CNPhotoPickerVariantListControllerAccessibility *)&v18 collectionView:v6 cellForItemAtIndexPath:v7];
  MEMORY[0x2456487F0](@"CNPhotoPickerCollectionViewCell");
  if (objc_opt_isKindOfClass())
  {
    objc_initWeak(&location, v6);
    v9 = [(CNPhotoPickerVariantListControllerAccessibility *)self safeArrayForKey:@"providerItems"];
    v10 = objc_msgSend(v9, "axSafeObjectAtIndex:", objc_msgSend(v7, "row"));

    char v16 = 0;
    objc_opt_class();
    v11 = __UIAccessibilityCastAsSafeCategory();
    [v11 _axSetIsVariant:1];
    [v11 _axSetProviderItem:v10];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __89__CNPhotoPickerVariantListControllerAccessibility_collectionView_cellForItemAtIndexPath___block_invoke;
    v13[3] = &unk_265117EC8;
    objc_copyWeak(&v15, &location);
    id v14 = v7;
    [v11 _setAccessibilityAdditionalTraitsBlock:v13];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v8;
}

uint64_t __89__CNPhotoPickerVariantListControllerAccessibility_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_super v3 = [WeakRetained indexPathsForSelectedItems];
  v4 = [v3 firstObject];

  int v5 = [*(id *)(a1 + 32) isEqual:v4];
  id v6 = (uint64_t *)MEMORY[0x263F1CF38];
  if (!v5) {
    id v6 = (uint64_t *)MEMORY[0x263F1CF18];
  }
  uint64_t v7 = *v6;

  return v7;
}

@end