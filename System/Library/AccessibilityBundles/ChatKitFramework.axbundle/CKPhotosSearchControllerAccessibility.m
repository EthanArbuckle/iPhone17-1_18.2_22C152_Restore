@interface CKPhotosSearchControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)cellForItemInCollectionView:(id)a3 atIndexPath:(id)a4 withIdentifier:(id)a5;
@end

@implementation CKPhotosSearchControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKPhotosSearchController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CKPhotosSearchController" isKindOfClass:@"CKSearchController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKSearchController", @"cellForItemInCollectionView:atIndexPath:withIdentifier:", "@", "@", "@", "@", 0);
  [v3 validateClass:@"CKSearchController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKSearchController", @"results", "@", 0);
  [v3 validateClass:@"CKSpotlightQueryResultUtilities"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"CKSpotlightQueryResultUtilities", @"contactForResult:", "@", "@", 0);
}

- (id)cellForItemInCollectionView:(id)a3 atIndexPath:(id)a4 withIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v26.receiver = self;
  v26.super_class = (Class)CKPhotosSearchControllerAccessibility;
  v11 = [(CKPhotosSearchControllerAccessibility *)&v26 cellForItemInCollectionView:v8 atIndexPath:v9 withIdentifier:v10];
  LOBYTE(v20) = 0;
  objc_opt_class();
  v12 = __UIAccessibilityCastAsSafeCategory();
  if (v12)
  {
    v13 = [(CKPhotosSearchControllerAccessibility *)self safeArrayForKey:@"results"];
    unint64_t v14 = [v9 row];
    if (v14 < [v13 count])
    {
      v15 = objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v9, "row"));
      uint64_t v20 = 0;
      v21 = &v20;
      uint64_t v22 = 0x3032000000;
      v23 = __Block_byref_object_copy__10;
      v24 = __Block_byref_object_dispose__10;
      id v25 = 0;
      uint64_t v18 = MEMORY[0x263EF8330];
      id v19 = v15;
      AXPerformSafeBlock();
      id v16 = (id)v21[5];

      _Block_object_dispose(&v20, 8);
      objc_msgSend(v12, "_axSetContact:", v16, v18, 3221225472, __96__CKPhotosSearchControllerAccessibility_cellForItemInCollectionView_atIndexPath_withIdentifier___block_invoke, &unk_265112D10);
    }
  }

  return v11;
}

uint64_t __96__CKPhotosSearchControllerAccessibility_cellForItemInCollectionView_atIndexPath_withIdentifier___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [NSClassFromString(&cfstr_Ckspotlightque.isa) contactForResult:*(void *)(a1 + 32)];

  return MEMORY[0x270F9A758]();
}

@end