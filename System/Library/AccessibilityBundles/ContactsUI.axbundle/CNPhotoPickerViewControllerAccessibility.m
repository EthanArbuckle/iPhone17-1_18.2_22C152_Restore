@interface CNPhotoPickerViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
@end

@implementation CNPhotoPickerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNPhotoPickerViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CNVisualIdentityPickerViewController"];
  [v3 validateClass:@"CNPhotoPickerViewController" isKindOfClass:@"CNVisualIdentityPickerViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNVisualIdentityPickerViewController", @"dataSource", "@", 0);
  [v3 validateClass:@"CNPhotoPickerDataSource"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNPhotoPickerDataSource", @"isItemAtIndexPathAddItem:", "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNPhotoPickerDataSource", @"providerItemAtIndexPath:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNPhotoPickerDataSource", @"providerGroupAtIndexPath:", "@", "@", 0);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v35.receiver = self;
  v35.super_class = (Class)CNPhotoPickerViewControllerAccessibility;
  v8 = [(CNPhotoPickerViewControllerAccessibility *)&v35 collectionView:v6 cellForItemAtIndexPath:v7];
  LOBYTE(v22) = 0;
  objc_opt_class();
  v9 = __UIAccessibilityCastAsSafeCategory();
  if (v9)
  {
    v10 = [(CNPhotoPickerViewControllerAccessibility *)self safeValueForKey:@"dataSource"];
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2020000000;
    LOBYTE(v25) = 0;
    uint64_t v28 = MEMORY[0x263EF8330];
    uint64_t v29 = 3221225472;
    v30 = __82__CNPhotoPickerViewControllerAccessibility_collectionView_cellForItemAtIndexPath___block_invoke;
    v31 = &unk_265117EA0;
    v34 = &v22;
    id v11 = v10;
    id v32 = v11;
    id v12 = v7;
    id v33 = v12;
    AXPerformSafeBlock();
    int v13 = *((unsigned __int8 *)v23 + 24);

    _Block_object_dispose(&v22, 8);
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__2;
    v26 = __Block_byref_object_dispose__2;
    id v27 = 0;
    id v20 = v11;
    id v21 = v12;
    AXPerformSafeBlock();
    id v14 = (id)v23[5];

    _Block_object_dispose(&v22, 8);
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__2;
    v26 = __Block_byref_object_dispose__2;
    id v27 = 0;
    uint64_t v17 = MEMORY[0x263EF8330];
    id v18 = v20;
    id v19 = v21;
    AXPerformSafeBlock();
    id v15 = (id)v23[5];

    _Block_object_dispose(&v22, 8);
    objc_msgSend(v9, "_axSetIsAddItem:", v13 != 0, v17, 3221225472, __82__CNPhotoPickerViewControllerAccessibility_collectionView_cellForItemAtIndexPath___block_invoke_2, &unk_265117EA0);
    [v9 _axSetProviderItem:v14];
    [v9 _axSetProviderGroup:v15];
  }

  return v8;
}

uint64_t __82__CNPhotoPickerViewControllerAccessibility_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isItemAtIndexPathAddItem:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

uint64_t __82__CNPhotoPickerViewControllerAccessibility_collectionView_cellForItemAtIndexPath___block_invoke_297(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) providerItemAtIndexPath:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

uint64_t __82__CNPhotoPickerViewControllerAccessibility_collectionView_cellForItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) providerGroupAtIndexPath:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

@end