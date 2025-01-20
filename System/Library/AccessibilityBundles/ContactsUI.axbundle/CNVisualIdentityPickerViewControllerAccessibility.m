@interface CNVisualIdentityPickerViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation CNVisualIdentityPickerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNVisualIdentityPickerViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CNVisualIdentityPickerViewController"];
  [v3 validateClass:@"CNVisualIdentityPickerViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNVisualIdentityPickerViewController", @"dataSource", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNVisualIdentityPickerViewController", @"collectionView:cellForItemAtIndexPath:", "@", "@", "@", 0);
  [v3 validateClass:@"CNVisualIdentityPickerViewController" hasProperty:@"collectionView" withType:"@"];
  [v3 validateClass:@"CNPhotoPickerDataSource"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNPhotoPickerDataSource", @"isItemAtIndexPathAddItem:", "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNPhotoPickerDataSource", @"providerItemAtIndexPath:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNPhotoPickerDataSource", @"providerGroupAtIndexPath:", "@", "@", 0);
  [v3 validateClass:@"CNPhotoPickerProviderGroup"];
  [v3 validateClass:@"CNPhotoPickerProviderGroup" hasProperty:@"groupType" withType:"q"];
  [v3 validateClass:@"CNPhotoPickerCollectionViewCell"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)CNVisualIdentityPickerViewControllerAccessibility;
  [(CNVisualIdentityPickerViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CNVisualIdentityPickerViewControllerAccessibility *)self safeValueForKey:@"collectionView"];
  v4 = accessibilityLocalizedString(@"collection.photos.label");
  [v3 setAccessibilityLabel:v4];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CNVisualIdentityPickerViewControllerAccessibility;
  [(CNVisualIdentityPickerViewControllerAccessibility *)&v3 viewDidLoad];
  [(CNVisualIdentityPickerViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v39.receiver = self;
  v39.super_class = (Class)CNVisualIdentityPickerViewControllerAccessibility;
  v8 = [(CNVisualIdentityPickerViewControllerAccessibility *)&v39 collectionView:v6 cellForItemAtIndexPath:v7];
  MEMORY[0x2456487F0](@"CNPhotoPickerCollectionViewCell");
  if (objc_opt_isKindOfClass())
  {
    objc_initWeak(&location, v6);
    v9 = [(CNVisualIdentityPickerViewControllerAccessibility *)self safeValueForKey:@"dataSource"];
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x3032000000;
    v35 = __Block_byref_object_copy_;
    v36 = __Block_byref_object_dispose_;
    id v37 = 0;
    uint64_t v25 = MEMORY[0x263EF8330];
    uint64_t v26 = 3221225472;
    v27 = __91__CNVisualIdentityPickerViewControllerAccessibility_collectionView_cellForItemAtIndexPath___block_invoke;
    v28 = &unk_265117EA0;
    v31 = &v32;
    id v29 = v9;
    id v30 = v7;
    AXPerformSafeBlock();
    id v10 = (id)v33[5];

    _Block_object_dispose(&v32, 8);
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x2020000000;
    LOBYTE(v35) = 0;
    v21[8] = (id)MEMORY[0x263EF8330];
    v21[9] = (id)3221225472;
    v21[10] = __91__CNVisualIdentityPickerViewControllerAccessibility_collectionView_cellForItemAtIndexPath___block_invoke_2;
    v21[11] = &unk_265117EA0;
    v24 = &v32;
    id v22 = v29;
    id v23 = v30;
    AXPerformSafeBlock();
    int v11 = *((unsigned __int8 *)v33 + 24);

    _Block_object_dispose(&v32, 8);
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x2020000000;
    v35 = 0;
    v21[1] = (id)MEMORY[0x263EF8330];
    v21[2] = (id)3221225472;
    v21[3] = __91__CNVisualIdentityPickerViewControllerAccessibility_collectionView_cellForItemAtIndexPath___block_invoke_3;
    v21[4] = &unk_265117EA0;
    v21[7] = &v32;
    id v12 = v22;
    v21[5] = v12;
    id v13 = v23;
    v21[6] = v13;
    AXPerformSafeBlock();
    uint64_t v14 = v33[3];

    _Block_object_dispose(&v32, 8);
    LOBYTE(v32) = 0;
    objc_opt_class();
    v15 = __UIAccessibilityCastAsSafeCategory();
    if ((_BYTE)v32) {
      abort();
    }
    v16 = v15;
    if (v11 && v14 == 2)
    {
      v17 = accessibilityLocalizedString(@"new.memoji.button");
      [v16 setAccessibilityLabel:v17];
    }
    else
    {
      if (!v11 || v14 != 3)
      {
        [v15 setAccessibilityLabel:0];
        goto LABEL_11;
      }
      v17 = accessibilityLocalizedString(@"new.emoji.button");
      [v16 setAccessibilityLabel:v17];
    }

LABEL_11:
    [v16 _axSetIsAddItem:v11 != 0];
    [v16 _axSetIsVariant:1];
    [v16 _axSetProviderItem:v10];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __91__CNVisualIdentityPickerViewControllerAccessibility_collectionView_cellForItemAtIndexPath___block_invoke_4;
    v19[3] = &unk_265117EC8;
    objc_copyWeak(v21, &location);
    id v20 = v13;
    [v16 _setAccessibilityAdditionalTraitsBlock:v19];

    objc_destroyWeak(v21);
    objc_destroyWeak(&location);
  }

  return v8;
}

uint64_t __91__CNVisualIdentityPickerViewControllerAccessibility_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) providerItemAtIndexPath:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

uint64_t __91__CNVisualIdentityPickerViewControllerAccessibility_collectionView_cellForItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isItemAtIndexPathAddItem:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void __91__CNVisualIdentityPickerViewControllerAccessibility_collectionView_cellForItemAtIndexPath___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) providerGroupAtIndexPath:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 safeIntegerForKey:@"groupType"];
}

uint64_t __91__CNVisualIdentityPickerViewControllerAccessibility_collectionView_cellForItemAtIndexPath___block_invoke_4(uint64_t a1)
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