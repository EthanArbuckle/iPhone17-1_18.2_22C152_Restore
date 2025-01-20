@interface UICollectionViewTableCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axPerformAction:(id)a3;
- (id)_accessibilitySupplementaryFooterViews;
- (id)_axCustomActionsForActions:(uint64_t)a1;
- (id)_privateAccessibilityCustomActions;
@end

@implementation UICollectionViewTableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UICollectionViewTableCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v8 = location;
  id v7 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [location[0] validateClass:@"UITableViewCellReorderControl"];
  v3 = @"UICollectionViewTableCell";
  v6 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"_tableLayout", v6, 0);
  v4 = @"UICollectionViewTableLayout";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"_delegateProxy", v6, 0);
  v5 = @"UICollectionViewCompositionalLayout";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"_trailingSwipeActionsConfigurationForIndexPath:", v6, 0);
  objc_storeStrong(v8, v7);
}

- (id)_accessibilitySupplementaryFooterViews
{
  v5 = self;
  v4[1] = (id)a2;
  v4[0] = (id)[(UICollectionViewTableCellAccessibility *)self _accessibilityFindDescendant:&__block_literal_global_16];
  [v4[0] setAccessibilityContainer:v5];
  id v3 = (id)objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 1, v4[0]);
  objc_storeStrong(v4, 0);

  return v3;
}

BOOL __80__UICollectionViewTableCellAccessibility__accessibilitySupplementaryFooterViews__block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  NSClassFromString(&cfstr_Uitableviewcel_8.isa);
  BOOL v4 = (objc_opt_isKindOfClass() & 1) != 0 && ([location[0] _accessibilityViewIsVisible] & 1) != 0;
  objc_storeStrong(location, 0);
  return v4;
}

- (BOOL)_axPerformAction:(id)a3
{
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v11 = 0;
  objc_opt_class();
  id v4 = (id)[location[0] _accessibilityValueForKey:@"AXCollectionViewTableCellActionKey"];
  id v10 = (id)__UIAccessibilityCastAsClass();

  id v9 = v10;
  objc_storeStrong(&v10, 0);
  id v12 = v9;
  id v8 = (id)[v9 handler];
  if (v8)
  {
    id v7 = v8;
    id v5 = v12;
    v6 = v14;
    AXPerformSafeBlock();
    objc_storeStrong((id *)&v6, 0);
    objc_storeStrong(&v5, 0);
    objc_storeStrong(&v7, 0);
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return 1;
}

uint64_t __59__UICollectionViewTableCellAccessibility__axPerformAction___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32));
}

- (id)_axCustomActionsForActions:(uint64_t)a1
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v20 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v20)
  {
    id v17 = (id)[MEMORY[0x263EFF980] array];
    memset(__b, 0, sizeof(__b));
    id obj = location;
    uint64_t v13 = [obj countByEnumeratingWithState:__b objects:v22 count:16];
    if (v13)
    {
      uint64_t v9 = *(void *)__b[2];
      uint64_t v10 = 0;
      unint64_t v11 = v13;
      while (1)
      {
        uint64_t v8 = v10;
        if (*(void *)__b[2] != v9) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(id *)(__b[1] + 8 * v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v2 = (id)[v16 title];
          BOOL v7 = v2 == 0;

          if (!v7)
          {
            id v5 = objc_alloc(MEMORY[0x263F1C390]);
            id v6 = (id)[v16 title];
            id v14 = (id)objc_msgSend(v5, "initWithName:target:selector:");

            [v14 _accessibilitySetRetainedValue:v16 forKey:@"AXCollectionViewTableCellActionKey"];
            [v17 addObject:v14];
            objc_storeStrong(&v14, 0);
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            _AXAssert();
          }
        }
        ++v10;
        if (v8 + 1 >= v11)
        {
          uint64_t v10 = 0;
          unint64_t v11 = [obj countByEnumeratingWithState:__b objects:v22 count:16];
          if (!v11) {
            break;
          }
        }
      }
    }

    id v21 = v17;
    int v18 = 1;
    objc_storeStrong(&v17, 0);
  }
  else
  {
    id v21 = 0;
    int v18 = 1;
  }
  objc_storeStrong(&location, 0);
  id v3 = v21;

  return v3;
}

- (id)_privateAccessibilityCustomActions
{
  v79 = self;
  v78[1] = (id)a2;
  v78[0] = (id)[MEMORY[0x263EFF980] array];
  char v76 = 0;
  id v28 = (id)[(UICollectionViewTableCellAccessibility *)v79 safeValueForKey:@"_tableLayout"];
  id v75 = (id)__UIAccessibilitySafeClass();

  id v74 = v75;
  objc_storeStrong(&v75, 0);
  id v77 = v74;
  id v73 = (id)[(UICollectionViewTableCellAccessibility *)v79 _accessibilityIndexPath];
  if (v73)
  {
    id v71 = (id)[(UICollectionViewTableCellAccessibility *)v79 _accessibilityViewAncestorIsKindOf:objc_opt_class()];
    id v70 = (id)[v77 safeValueForKey:@"_delegateActual"];
    id v69 = (id)[v77 safeValueForKey:@"_delegateProxy"];
    if (v70)
    {
      if (objc_opt_respondsToSelector())
      {
        id v68 = (id)[v69 collectionView:v71 tableLayout:v77 leadingSwipeActionsConfigurationForRowAtIndexPath:v73];
        id v25 = v78[0];
        v24 = v79;
        id v27 = (id)[v68 actions];
        id v26 = -[UICollectionViewTableCellAccessibility _axCustomActionsForActions:]((uint64_t)v24, v27);
        objc_msgSend(v25, "axSafelyAddObjectsFromArray:");

        objc_storeStrong(&v68, 0);
      }
      else if (objc_opt_respondsToSelector())
      {
        id v67 = (id)[v69 collectionView:v71 tableLayout:v77 leadingSwipeActionsForRowAtIndexPath:v73];
        id v22 = v78[0];
        id v23 = -[UICollectionViewTableCellAccessibility _axCustomActionsForActions:]((uint64_t)v79, v67);
        objc_msgSend(v22, "axSafelyAddObjectsFromArray:");

        objc_storeStrong(&v67, 0);
      }
      if (objc_opt_respondsToSelector())
      {
        id v66 = (id)[v69 collectionView:v71 tableLayout:v77 trailingSwipeActionsConfigurationForRowAtIndexPath:v73];
        id v19 = v78[0];
        int v18 = v79;
        id v21 = (id)[v66 actions];
        id v20 = -[UICollectionViewTableCellAccessibility _axCustomActionsForActions:]((uint64_t)v18, v21);
        objc_msgSend(v19, "axSafelyAddObjectsFromArray:");

        objc_storeStrong(&v66, 0);
      }
      else if (objc_opt_respondsToSelector())
      {
        id v65 = (id)[v69 collectionView:v71 tableLayout:v77 trailingSwipeActionsForRowAtIndexPath:v73];
        id v16 = v78[0];
        id v17 = -[UICollectionViewTableCellAccessibility _axCustomActionsForActions:]((uint64_t)v79, v65);
        objc_msgSend(v16, "axSafelyAddObjectsFromArray:");

        objc_storeStrong(&v65, 0);
      }
    }
    else
    {
      char v63 = 0;
      id v15 = (id)[(UICollectionViewTableCellAccessibility *)v79 safeValueForKey:@"currentLayout"];
      id v62 = (id)__UIAccessibilitySafeClass();

      id v61 = v62;
      objc_storeStrong(&v62, 0);
      id v64 = v61;
      uint64_t v53 = 0;
      v54 = &v53;
      int v55 = 838860800;
      int v56 = 48;
      v57 = __Block_byref_object_copy__7;
      v58 = __Block_byref_object_dispose__7;
      id v59 = 0;
      uint64_t v46 = MEMORY[0x263EF8330];
      int v47 = -1073741824;
      int v48 = 0;
      v49 = __76__UICollectionViewTableCellAccessibility__privateAccessibilityCustomActions__block_invoke;
      v50 = &unk_2650ADF88;
      v52[1] = &v53;
      id v51 = v61;
      v52[0] = v73;
      AXPerformSafeBlock();
      id v45 = (id)v54[5];
      objc_storeStrong(v52, 0);
      objc_storeStrong(&v51, 0);
      _Block_object_dispose(&v53, 8);
      objc_storeStrong(&v59, 0);
      id v60 = v45;
      id v12 = v78[0];
      unint64_t v11 = v79;
      id v14 = (id)[v45 actions];
      id v13 = -[UICollectionViewTableCellAccessibility _axCustomActionsForActions:]((uint64_t)v11, v14);
      objc_msgSend(v12, "axSafelyAddObjectsFromArray:");

      uint64_t v38 = 0;
      v39 = &v38;
      int v40 = 838860800;
      int v41 = 48;
      v42 = __Block_byref_object_copy__7;
      v43 = __Block_byref_object_dispose__7;
      id v44 = 0;
      uint64_t v31 = MEMORY[0x263EF8330];
      int v32 = -1073741824;
      int v33 = 0;
      v34 = __76__UICollectionViewTableCellAccessibility__privateAccessibilityCustomActions__block_invoke_2;
      v35 = &unk_2650ADF88;
      v37[1] = &v38;
      id v36 = v64;
      v37[0] = v73;
      AXPerformSafeBlock();
      id v30 = (id)v39[5];
      objc_storeStrong(v37, 0);
      objc_storeStrong(&v36, 0);
      _Block_object_dispose(&v38, 8);
      objc_storeStrong(&v44, 0);
      id v2 = v60;
      id v60 = v30;

      id v8 = v78[0];
      BOOL v7 = v79;
      id v10 = (id)[v60 actions];
      id v9 = -[UICollectionViewTableCellAccessibility _axCustomActionsForActions:]((uint64_t)v7, v10);
      objc_msgSend(v8, "axSafelyAddObjectsFromArray:");

      objc_storeStrong(&v60, 0);
      objc_storeStrong(&v64, 0);
    }
    if (![v78[0] count])
    {
      id v29 = (id)[(UICollectionViewTableCellAccessibility *)v79 safeValueForKey:@"tableViewCell"];
      if (v29)
      {
        id v5 = v78[0];
        id v6 = (id)[v29 _privateAccessibilityCustomActions];
        objc_msgSend(v5, "axSafelyAddObjectsFromArray:");
      }
      objc_storeStrong(&v29, 0);
    }
    id v80 = v78[0];
    int v72 = 1;
    objc_storeStrong(&v69, 0);
    objc_storeStrong(&v70, 0);
    objc_storeStrong(&v71, 0);
  }
  else
  {
    id v80 = v78[0];
    int v72 = 1;
  }
  objc_storeStrong(&v73, 0);
  objc_storeStrong(&v77, 0);
  objc_storeStrong(v78, 0);
  id v3 = v80;

  return v3;
}

void __76__UICollectionViewTableCellAccessibility__privateAccessibilityCustomActions__block_invoke(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) _leadingSwipeActionsConfigurationForIndexPath:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v1;
}

void __76__UICollectionViewTableCellAccessibility__privateAccessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) _trailingSwipeActionsConfigurationForIndexPath:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v1;
}

@end