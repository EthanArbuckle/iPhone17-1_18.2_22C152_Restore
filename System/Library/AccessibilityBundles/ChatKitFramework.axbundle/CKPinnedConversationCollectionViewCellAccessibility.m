@interface CKPinnedConversationCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityParentCollectionView;
- (id)_accessibilityPinnedView;
- (id)accessibilityCustomActions;
- (id)accessibilityDragSourceDescriptors;
- (id)accessibilityDropPointDescriptors;
- (id)accessibilityLabel;
@end

@implementation CKPinnedConversationCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKPinnedConversationCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"UICollectionView" hasProperty:@"delegate" withType:"@"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKConversationListCollectionViewController", @"dataSource", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKPinnedConversationCollectionViewCell", @"pinnedConversationView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKConversationListCollectionViewController", @"_conversationActionMenusForItemIdentifier:inSection:withCell:forSearch:", "@", "@", "Q", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKConversationListCollectionViewController", @"conversationForItemIdentifier:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKConversationListCollectionViewController", @"togglePinStateForConversation:withReason:", "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKConversation", @"pinnedConversationDisplayNamePreferringShortName:", "@", "B", 0);
  [v3 validateClass:@"CKPinnedConversationCollectionViewCell" isKindOfClass:@"UICollectionViewCell"];
  [v3 validateClass:@"UICollectionView" hasInstanceVariable:@"_dragAndDropController" withType:"_UICollectionViewDragAndDropController"];
  [v3 validateClass:@"_UICollectionViewDragSourceController"];
}

- (id)accessibilityCustomActions
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v32 = [MEMORY[0x263EFF980] array];
  v69.receiver = self;
  v69.super_class = (Class)CKPinnedConversationCollectionViewCellAccessibility;
  id v3 = [(CKPinnedConversationCollectionViewCellAccessibility *)&v69 accessibilityCustomActions];
  [v32 axSafelyAddObjectsFromArray:v3];

  v4 = [(CKPinnedConversationCollectionViewCellAccessibility *)self _accessibilityIndexPath];
  if (v4)
  {
    v31 = [(CKPinnedConversationCollectionViewCellAccessibility *)self _accessibilityViewAncestorIsKindOf:objc_opt_class()];
    v5 = [v31 safeValueForKey:@"delegate"];
    objc_opt_class();
    v6 = [v5 safeValueForKey:@"dataSource"];
    v30 = __UIAccessibilityCastAsClass();

    v7 = [v30 itemIdentifierForIndexPath:v4];
    v8 = [MEMORY[0x263EFF980] array];
    uint64_t v63 = 0;
    v64 = &v63;
    uint64_t v65 = 0x3032000000;
    v66 = __Block_byref_object_copy__11;
    v67 = __Block_byref_object_dispose__11;
    id v68 = 0;
    uint64_t v54 = MEMORY[0x263EF8330];
    uint64_t v55 = 3221225472;
    v56 = __81__CKPinnedConversationCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke;
    v57 = &unk_265112ED0;
    v62 = &v63;
    id v9 = v5;
    id v58 = v9;
    id v10 = v7;
    id v59 = v10;
    id v60 = v4;
    v61 = self;
    AXPerformSafeBlock();
    id v11 = (id)v64[5];

    _Block_object_dispose(&v63, 8);
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v50 objects:v70 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v51 != v14) {
            objc_enumerationMutation(v12);
          }
          v16 = [*(id *)(*((void *)&v50 + 1) + 8 * i) children];
          [v8 axSafelyAddObjectsFromArray:v16];
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v50 objects:v70 count:16];
      }
      while (v13);
    }

    uint64_t v63 = 0;
    v64 = &v63;
    uint64_t v65 = 0x3032000000;
    v66 = __Block_byref_object_copy__11;
    v67 = __Block_byref_object_dispose__11;
    id v68 = 0;
    uint64_t v43 = MEMORY[0x263EF8330];
    uint64_t v44 = 3221225472;
    v45 = __81__CKPinnedConversationCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke_2;
    v46 = &unk_265112F70;
    v49 = &v63;
    id v47 = v9;
    id v29 = v10;
    id v48 = v29;
    AXPerformSafeBlock();
    id v17 = (id)v64[5];

    _Block_object_dispose(&v63, 8);
    char v42 = 0;
    objc_opt_class();
    uint64_t v63 = 0;
    v64 = &v63;
    uint64_t v65 = 0x3032000000;
    v66 = __Block_byref_object_copy__11;
    v67 = __Block_byref_object_dispose__11;
    id v68 = 0;
    uint64_t v36 = MEMORY[0x263EF8330];
    uint64_t v37 = 3221225472;
    v38 = __81__CKPinnedConversationCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke_3;
    v39 = &unk_265112D10;
    v41 = &v63;
    id v40 = v17;
    AXPerformSafeBlock();
    id v18 = (id)v64[5];

    _Block_object_dispose(&v63, 8);
    v19 = __UIAccessibilityCastAsClass();

    id v20 = objc_alloc(MEMORY[0x263F1C390]);
    v21 = NSString;
    v22 = accessibilityLocalizedString(@"unpin.action.title");
    v23 = objc_msgSend(v21, "stringWithFormat:", v22, v19);
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __81__CKPinnedConversationCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke_4;
    v33[3] = &unk_265112F98;
    id v34 = v47;
    id v35 = v40;
    id v24 = v40;
    id v25 = v47;
    v26 = (void *)[v20 initWithName:v23 actionHandler:v33];

    [v32 axSafelyAddObject:v26];
    v27 = _AXCustomActionsForActions(v8);
    [v32 axSafelyAddObjectsFromArray:v27];
  }

  return v32;
}

uint64_t __81__CKPinnedConversationCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_conversationActionMenusForItemIdentifier:inSection:withCell:forSearch:", *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "section"), *(void *)(a1 + 56), 0);

  return MEMORY[0x270F9A758]();
}

uint64_t __81__CKPinnedConversationCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) conversationForItemIdentifier:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

uint64_t __81__CKPinnedConversationCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke_3(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) pinnedConversationDisplayNamePreferringShortName:1];

  return MEMORY[0x270F9A758]();
}

uint64_t __81__CKPinnedConversationCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke_4(uint64_t a1)
{
  id v3 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  AXPerformSafeBlock();

  return 1;
}

uint64_t __81__CKPinnedConversationCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) togglePinStateForConversation:*(void *)(a1 + 40) withReason:*MEMORY[0x263F4A4D0]];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(CKPinnedConversationCollectionViewCellAccessibility *)self safeValueForKey:@"pinnedConversationView"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityDragSourceDescriptors
{
  id v3 = [MEMORY[0x263EFF980] array];
  id v4 = [(CKPinnedConversationCollectionViewCellAccessibility *)self _accessibilityParentCollectionView];
  v5 = [v4 safeValueForKeyPath:@"_dragAndDropController.sourceController"];
  v6 = __UIAccessibilitySafeClass();

  if (v6)
  {
    v7 = [(CKPinnedConversationCollectionViewCellAccessibility *)self _accessibilityPinnedView];
    objc_opt_class();
    v8 = __UIAccessibilityCastAsClass();
    [v8 bounds];
    UIRectGetCenter();
    objc_msgSend(v8, "convertPoint:toView:", v4);
    double v10 = v9;
    double v12 = v11;
    id v13 = objc_alloc(MEMORY[0x263F1C3B8]);
    uint64_t v14 = NSString;
    v15 = accessibilityLocalizedString(@"drag.pinned.cell");
    v16 = [v7 _axFromString];
    id v17 = objc_msgSend(v14, "stringWithFormat:", v15, v16);
    id v18 = objc_msgSend(v13, "initWithName:point:inView:", v17, v4, v10, v12);
    [v3 axSafelyAddObject:v18];
  }

  return v3;
}

- (id)accessibilityDropPointDescriptors
{
  id v3 = [MEMORY[0x263EFF980] array];
  id v4 = [(CKPinnedConversationCollectionViewCellAccessibility *)self _accessibilityParentCollectionView];
  if ([v4 hasActiveDrop])
  {
    v5 = [(CKPinnedConversationCollectionViewCellAccessibility *)self _accessibilityPinnedView];
    objc_opt_class();
    v6 = __UIAccessibilityCastAsClass();
    [v6 bounds];
    UIRectGetCenter();
    objc_msgSend(v6, "convertPoint:toView:", v4);
    double v8 = v7;
    double v10 = v9 + -0.5;
    id v11 = objc_alloc(MEMORY[0x263F1C3B8]);
    double v12 = NSString;
    id v13 = accessibilityLocalizedString(@"drop.before.pinned.cell");
    uint64_t v14 = [v5 _axFromString];
    v15 = objc_msgSend(v12, "stringWithFormat:", v13, v14);
    v16 = objc_msgSend(v11, "initWithName:point:inView:", v15, v4, v10, v8);
    [v3 axSafelyAddObject:v16];

    [v6 bounds];
    UIRectGetCenter();
    objc_msgSend(v6, "convertPoint:toView:", v4);
    double v18 = v17;
    double v20 = v19 + 0.5;
    id v21 = objc_alloc(MEMORY[0x263F1C3B8]);
    v22 = NSString;
    v23 = accessibilityLocalizedString(@"drop.after.pinned.cell");
    id v24 = [v5 _axFromString];
    id v25 = objc_msgSend(v22, "stringWithFormat:", v23, v24);
    v26 = objc_msgSend(v21, "initWithName:point:inView:", v25, v4, v20, v18);
    [v3 axSafelyAddObject:v26];
  }

  return v3;
}

- (id)_accessibilityParentCollectionView
{
  uint64_t v3 = objc_opt_class();

  return (id)[(CKPinnedConversationCollectionViewCellAccessibility *)self _accessibilityViewAncestorIsKindOf:v3];
}

- (id)_accessibilityPinnedView
{
  objc_opt_class();
  uint64_t v3 = [(CKPinnedConversationCollectionViewCellAccessibility *)self safeValueForKey:@"pinnedConversationView"];
  id v4 = __UIAccessibilityCastAsSafeCategory();

  return v4;
}

@end