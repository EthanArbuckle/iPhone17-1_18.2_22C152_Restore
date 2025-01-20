@interface DOCItemCollectionCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityScrollToVisible;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityItemCollectionViewController;
- (id)_axAttrTitle;
- (id)_axCustomActionsFromUIMenu:(id)a3;
- (id)accessibilityCustomActions;
- (id)accessibilityIdentifier;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation DOCItemCollectionCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"com_apple_DocumentManager_Service.DOCItemCollectionCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"UICollectionViewCell" isKindOfClass:@"UICollectionReusableView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UICollectionReusableView", @"_collectionView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"com_apple_DocumentManager_Service.DOCItemCollectionCell", @"accessibilityCellManager", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"com_apple_DocumentManager_Service.DOCItemCollectionCellContent", @"accessibilityItem", "@", 0);
  [v3 validateClass:@"com_apple_DocumentManager_Service.DOCItemCollectionCell" isKindOfClass:@"UICollectionViewCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"com_apple_DocumentManager_Service.DOCItemCollectionCell", @"accessibilityCellManager", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"com_apple_DocumentManager_Service.DOCItemCollectionCell", @"accessibilityTitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"com_apple_DocumentManager_Service.DOCItemCollectionCell", @"accessibilityIsRenaming", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"com_apple_DocumentManager_Service.DOCItemCollectionCellContent", @"accessibilityItem", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"com_apple_DocumentManager_Service.DOCItemCollectionCellContent", @"accessibilityShouldDim", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"com_apple_DocumentManager_Service.DOCItemCollectionViewController", @"accessibilityIsRenamingInline", "B", 0);
  [v3 validateClass:@"com_apple_DocumentManager_Service.DOCItemCollectionViewController" conformsToProtocol:@"UIContextMenuInteractionDelegate"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"com_apple_DocumentManager_Service.DOCItemCollectionViewController", @"contextMenuForItemsAt:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"com_apple_DocumentManager_Service.DOCItemCollectionViewController", @"contextMenuForFolder", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return [(DOCItemCollectionCellAccessibility *)self safeBoolForKey:@"accessibilityIsRenaming"] ^ 1;
}

- (id)accessibilityValue
{
  return &stru_26F840BE8;
}

- (id)accessibilityIdentifier
{
  id v3 = [(DOCItemCollectionCellAccessibility *)self safeValueForKey:@"accessibilityCellManager"];
  v4 = [v3 safeValueForKey:@"accessibilityItem"];
  v5 = __UIAccessibilitySafeClass();

  v6 = [(DOCItemCollectionCellAccessibility *)self _axAttrTitle];
  v7 = [v6 string];

  v8 = [v5 filename];
  v9 = [v8 pathExtension];
  if ([v5 folderType] == 1)
  {
    v10 = objc_msgSend(v5, "fp_appContainerBundleIdentifier");
    v11 = __UIAXStringForVariables();
  }
  else
  {
    v11 = __UIAXStringForVariables();
  }

  return v11;
}

- (id)_axAttrTitle
{
  objc_opt_class();
  id v3 = [(DOCItemCollectionCellAccessibility *)self safeValueForKey:@"accessibilityTitleLabel"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 attributedText];

  return v5;
}

- (id)_axCustomActionsFromUIMenu:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v29 = [MEMORY[0x263EFF980] array];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v21 = v3;
  id obj = [v3 safeArrayForKey:@"children"];
  uint64_t v24 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v24)
  {
    uint64_t v23 = *(void *)v38;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v38 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v28 = v4;
        v5 = [*(id *)(*((void *)&v37 + 1) + 8 * v4) safeArrayForKey:@"children"];
        v26 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"title" ascending:1];
        objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObject:");
        v25 = v27 = v5;
        v6 = objc_msgSend(v5, "sortedArrayUsingDescriptors:");
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v7 = v6;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v41 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v34;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v34 != v10) {
                objc_enumerationMutation(v7);
              }
              char v32 = 0;
              objc_opt_class();
              v12 = __UIAccessibilityCastAsClass();
              if (v32) {
                abort();
              }
              v13 = v12;
              if (v12)
              {
                v14 = [v12 title];
                uint64_t v15 = [v14 length];

                if (v15)
                {
                  v16 = [AXDocumentCustomAction alloc];
                  v17 = [v13 title];
                  v30[0] = MEMORY[0x263EF8330];
                  v30[1] = 3221225472;
                  v30[2] = __65__DOCItemCollectionCellAccessibility__axCustomActionsFromUIMenu___block_invoke;
                  v30[3] = &unk_26516A4C8;
                  id v18 = v13;
                  id v31 = v18;
                  v19 = [(AXDocumentCustomAction *)v16 initWithName:v17 actionHandler:v30];

                  [(AXDocumentCustomAction *)v19 setAction:v18];
                  [v29 addObject:v19];
                }
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v33 objects:v41 count:16];
          }
          while (v9);
        }

        uint64_t v4 = v28 + 1;
      }
      while (v28 + 1 != v24);
      uint64_t v24 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v24);
  }

  return v29;
}

uint64_t __65__DOCItemCollectionCellAccessibility__axCustomActionsFromUIMenu___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  AXPerformSafeBlock();

  return 1;
}

uint64_t __65__DOCItemCollectionCellAccessibility__axCustomActionsFromUIMenu___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) performWithSender:0 target:0];
}

- (unint64_t)accessibilityTraits
{
  id v3 = [(DOCItemCollectionCellAccessibility *)self safeValueForKey:@"accessibilityCellManager"];
  int v4 = [v3 safeBoolForKey:@"accessibilityShouldDim"];

  if (v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)DOCItemCollectionCellAccessibility;
    return *MEMORY[0x263F1CF20] | [(DOCItemCollectionCellAccessibility *)&v7 accessibilityTraits];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)DOCItemCollectionCellAccessibility;
    return [(DOCItemCollectionCellAccessibility *)&v6 accessibilityTraits];
  }
}

- (id)accessibilityCustomActions
{
  id v3 = objc_msgSend(NSString, "stringWithFormat:", @"%p-_accessibilityCustomActions", self);
  int v4 = (id *)MEMORY[0x263F81160];
  v5 = [(id)*MEMORY[0x263F81160] objectForKeyedSubscript:v3];

  if (v5)
  {
    objc_super v6 = [*v4 objectForKeyedSubscript:v3];
  }
  else if (-[DOCItemCollectionCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", @"accessibilityIsRenaming") & 1) != 0|| (-[DOCItemCollectionCellAccessibility safeValueForKey:](self, "safeValueForKey:", @"_collectionView"), objc_super v7 = objc_claimAutoreleasedReturnValue(), [v7 _accessibilityViewController], v8 = objc_claimAutoreleasedReturnValue(), v9 = objc_msgSend(v8, "safeBoolForKey:", @"accessibilityIsRenamingInline"), v8, v7, (v9))
  {
    objc_super v6 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x3032000000;
    uint64_t v15 = __Block_byref_object_copy_;
    v16 = __Block_byref_object_dispose_;
    id v17 = 0;
    AXPerformSafeBlock();
    if (v13[5])
    {
      objc_super v6 = [MEMORY[0x263EFF980] array];
      uint64_t v10 = [(DOCItemCollectionCellAccessibility *)self _axCustomActionsFromUIMenu:v13[5]];
      [v6 addObjectsFromArray:v10];

      [*v4 setObject:v6 forKeyedSubscript:v3];
    }
    else
    {
      objc_super v6 = (void *)MEMORY[0x263EFFA68];
    }
    _Block_object_dispose(&v12, 8);
  }

  return v6;
}

void __64__DOCItemCollectionCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  v18[1] = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) _accessibilityAncestorIsKindOf:objc_opt_class()];
  if (v2)
  {
    LOBYTE(v12) = 0;
    objc_opt_class();
    id v3 = __UIAccessibilityCastAsClass();
    int v4 = [*(id *)(a1 + 32) _accessibilityItemCollectionViewController];
    if (objc_opt_respondsToSelector())
    {
      v5 = [v3 _accessibilityIndexPath];
      v18[0] = v5;
      objc_super v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];

      uint64_t v12 = 0;
      v13 = &v12;
      uint64_t v14 = 0x3032000000;
      uint64_t v15 = __Block_byref_object_copy_;
      v16 = __Block_byref_object_dispose_;
      id v17 = 0;
      id v10 = v4;
      id v11 = v6;
      AXPerformSafeBlock();
      id v7 = (id)v13[5];

      _Block_object_dispose(&v12, 8);
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
      char v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;
    }
  }
}

uint64_t __64__DOCItemCollectionCellAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) contextMenuForItemsAt:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

- (id)_accessibilityItemCollectionViewController
{
  objc_opt_class();
  id v2 = __UIAccessibilityCastAsClass();
  id v3 = [v2 _accessibilityFindViewAncestor:&__block_literal_global_2 startWithSelf:1];
  int v4 = [v3 _accessibilityViewController];

  return v4;
}

uint64_t __80__DOCItemCollectionCellAccessibility__accessibilityItemCollectionViewController__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 _accessibilityViewController];
  NSClassFromString(&cfstr_ComAppleDocume.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)accessibilityScrollToVisible
{
  char v9 = 0;
  objc_opt_class();
  id v3 = [(DOCItemCollectionCellAccessibility *)self safeValueForKey:@"_collectionView"];
  int v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 scrollViewWillBeginDragging:v4];
  }
  v8.receiver = self;
  v8.super_class = (Class)DOCItemCollectionCellAccessibility;
  BOOL v6 = [(DOCItemCollectionCellAccessibility *)&v8 accessibilityScrollToVisible];

  return v6;
}

@end