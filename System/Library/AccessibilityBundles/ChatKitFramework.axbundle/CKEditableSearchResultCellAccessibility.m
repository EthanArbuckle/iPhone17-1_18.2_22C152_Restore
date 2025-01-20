@interface CKEditableSearchResultCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityCustomActions;
@end

@implementation CKEditableSearchResultCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKEditableSearchResultCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKSearchViewController", @"searchControllers", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKSearchController", @"results", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKSearchController", @"menuElementsForResult:atIndexPath:sourceRect:", "@", "@", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
}

- (id)accessibilityCustomActions
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v29 = [MEMORY[0x263EFF980] array];
  v50.receiver = self;
  v50.super_class = (Class)CKEditableSearchResultCellAccessibility;
  id v3 = [(CKEditableSearchResultCellAccessibility *)&v50 accessibilityCustomActions];
  [v29 axSafelyAddObjectsFromArray:v3];

  objc_opt_class();
  v4 = [(CKEditableSearchResultCellAccessibility *)self _accessibilityViewAncestorIsKindOf:objc_opt_class()];
  v25 = __UIAccessibilityCastAsClass();

  v24 = [v25 delegate];
  v27 = [v24 safeArrayForKey:@"searchControllers"];
  v5 = [(CKEditableSearchResultCellAccessibility *)self _accessibilityIndexPath];
  unint64_t v6 = [v5 section];
  if (v6 >= [v27 count])
  {
    v7 = 0;
  }
  else
  {
    v7 = objc_msgSend(v27, "objectAtIndex:", objc_msgSend(v5, "section"));
  }
  v26 = [v7 safeArrayForKey:@"results"];
  unint64_t v8 = [v5 row];
  if (v8 >= [v26 count])
  {
    v9 = 0;
  }
  else
  {
    v9 = objc_msgSend(v26, "objectAtIndex:", objc_msgSend(v5, "row"));
  }
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__0;
  v48 = __Block_byref_object_dispose__0;
  id v49 = 0;
  uint64_t v35 = MEMORY[0x263EF8330];
  uint64_t v36 = 3221225472;
  v37 = __69__CKEditableSearchResultCellAccessibility_accessibilityCustomActions__block_invoke;
  v38 = &unk_265112ED0;
  v43 = &v44;
  id v21 = v7;
  id v39 = v21;
  id v23 = v9;
  id v40 = v23;
  id v22 = v5;
  id v41 = v22;
  v42 = self;
  AXPerformSafeBlock();
  id v10 = (id)v45[5];

  _Block_object_dispose(&v44, 8);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v10;
  uint64_t v11 = [obj countByEnumeratingWithState:&v31 objects:v51 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v32;
    uint64_t v13 = MEMORY[0x263EF8330];
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        v16 = objc_msgSend(v15, "title", v21, v22, v23);
        if (!v16)
        {
          v17 = [v15 image];
          v16 = [v17 accessibilityLabel];
        }
        id v18 = objc_alloc(MEMORY[0x263F1C390]);
        v30[0] = v13;
        v30[1] = 3221225472;
        v30[2] = __69__CKEditableSearchResultCellAccessibility_accessibilityCustomActions__block_invoke_2;
        v30[3] = &unk_265112D88;
        v30[4] = v15;
        v19 = (void *)[v18 initWithName:v16 actionHandler:v30];
        [v29 axSafelyAddObject:v19];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v31 objects:v51 count:16];
    }
    while (v11);
  }

  return v29;
}

uint64_t __69__CKEditableSearchResultCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  [*(id *)(a1 + 56) accessibilityFrame];
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = objc_msgSend(v2, "menuElementsForResult:atIndexPath:sourceRect:", v3, v4);

  return MEMORY[0x270F9A758]();
}

uint64_t __69__CKEditableSearchResultCellAccessibility_accessibilityCustomActions__block_invoke_2()
{
  return 1;
}

uint64_t __69__CKEditableSearchResultCellAccessibility_accessibilityCustomActions__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) performWithSender:0 target:0];
}

@end