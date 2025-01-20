@interface CKConversationListCollectionViewConversationCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityRetainsCustomRotorActionSetting;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityCustomActionGroupIdentifier;
- (id)_axEmbeddedTableViewCell;
- (id)_privateAccessibilityCustomActions;
- (id)accessibilityLabel;
- (id)accessibilityUserInputLabels;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)setEditingMode:(unint64_t)a3 animated:(BOOL)a4;
@end

@implementation CKConversationListCollectionViewConversationCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKConversationListCollectionViewConversationCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CKConversationListEmbeddedCollectionViewCell" isKindOfClass:@"UICollectionViewListCell"];
  [v3 validateClass:@"CKConversationListCollectionViewConversationCell" isKindOfClass:@"CKConversationListEmbeddedCollectionViewCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKConversationListEmbeddedCollectionViewCell", @"embeddedTableViewCell", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKConversationListEmbeddedCollectionViewCell", @"setEditingMode:animated:", "v", "Q", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UICollectionViewListCell", @"trailingEditingAccessoryConfigurations", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKConversationListEmbeddedCollectionViewCell", @"editingMode", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_UICellAccessoryConfigurationCustomView", @"customView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKConversationListCollectionViewConversationCell", @"delegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKConversationListCollectionViewController", @"dataSource", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKConversationListCollectionViewController", @"_conversationActionMenusForItemIdentifier:inSection:withCell:forSearch:", "@", "@", "Q", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKConversationListCollectionViewController", @"togglePinStateForConversation:withReason:", "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKConversationListCollectionViewController", @"conversationForItemIdentifier:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKConversation", @"pinnedConversationDisplayNamePreferringShortName:", "@", "B", 0);
}

- (id)_privateAccessibilityCustomActions
{
  uint64_t v88 = *MEMORY[0x263EF8340];
  id v42 = [MEMORY[0x263EFF980] array];
  v85.receiver = self;
  v85.super_class = (Class)CKConversationListCollectionViewConversationCellAccessibility;
  id v3 = [(CKConversationListCollectionViewConversationCellAccessibility *)&v85 accessibilityCustomActions];
  [v42 axSafelyAddObjectsFromArray:v3];

  v41 = [(CKConversationListCollectionViewConversationCellAccessibility *)self _accessibilityIndexPath];
  if (v41)
  {
    v4 = [(CKConversationListCollectionViewConversationCellAccessibility *)self safeValueForKey:@"delegate"];
    objc_opt_class();
    v5 = [v4 safeValueForKey:@"dataSource"];
    v40 = __UIAccessibilityCastAsClass();

    v6 = [v40 itemIdentifierForIndexPath:v41];
    v44 = [MEMORY[0x263EFF980] array];
    uint64_t v79 = 0;
    v80 = &v79;
    uint64_t v81 = 0x3032000000;
    v82 = __Block_byref_object_copy__2;
    v83 = __Block_byref_object_dispose__2;
    id v84 = 0;
    uint64_t v70 = MEMORY[0x263EF8330];
    uint64_t v71 = 3221225472;
    v72 = __99__CKConversationListCollectionViewConversationCellAccessibility__privateAccessibilityCustomActions__block_invoke;
    v73 = &unk_265112ED0;
    v78 = &v79;
    id v7 = v4;
    id v74 = v7;
    id v8 = v6;
    id v75 = v8;
    id v76 = v41;
    v77 = self;
    AXPerformSafeBlock();
    id v9 = (id)v80[5];

    _Block_object_dispose(&v79, 8);
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    obuint64_t j = v9;
    uint64_t v10 = [obj countByEnumeratingWithState:&v66 objects:v87 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v67;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v67 != v11) {
            objc_enumerationMutation(obj);
          }
          v13 = [*(id *)(*((void *)&v66 + 1) + 8 * i) children];
          [v44 axSafelyAddObjectsFromArray:v13];
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v66 objects:v87 count:16];
      }
      while (v10);
    }

    uint64_t v79 = 0;
    v80 = &v79;
    uint64_t v81 = 0x3032000000;
    v82 = __Block_byref_object_copy__2;
    v83 = __Block_byref_object_dispose__2;
    id v84 = 0;
    uint64_t v59 = MEMORY[0x263EF8330];
    uint64_t v60 = 3221225472;
    v61 = __99__CKConversationListCollectionViewConversationCellAccessibility__privateAccessibilityCustomActions__block_invoke_2;
    v62 = &unk_265112F70;
    v65 = &v79;
    id v63 = v7;
    id v37 = v8;
    id v64 = v37;
    AXPerformSafeBlock();
    id v14 = (id)v80[5];

    _Block_object_dispose(&v79, 8);
    char v58 = 0;
    objc_opt_class();
    uint64_t v79 = 0;
    v80 = &v79;
    uint64_t v81 = 0x3032000000;
    v82 = __Block_byref_object_copy__2;
    v83 = __Block_byref_object_dispose__2;
    id v84 = 0;
    uint64_t v52 = MEMORY[0x263EF8330];
    uint64_t v53 = 3221225472;
    v54 = __99__CKConversationListCollectionViewConversationCellAccessibility__privateAccessibilityCustomActions__block_invoke_3;
    v55 = &unk_265112D10;
    v57 = &v79;
    id v56 = v14;
    AXPerformSafeBlock();
    id v15 = (id)v80[5];

    _Block_object_dispose(&v79, 8);
    v39 = __UIAccessibilityCastAsClass();

    id v16 = objc_alloc(MEMORY[0x263F1C390]);
    v17 = NSString;
    v18 = accessibilityLocalizedString(@"pin.action.title");
    v19 = objc_msgSend(v17, "stringWithFormat:", v18, v39);
    v49[0] = MEMORY[0x263EF8330];
    v49[1] = 3221225472;
    v49[2] = __99__CKConversationListCollectionViewConversationCellAccessibility__privateAccessibilityCustomActions__block_invoke_4;
    v49[3] = &unk_265112F98;
    id v35 = v63;
    id v50 = v35;
    id v36 = v56;
    id v51 = v36;
    v38 = (void *)[v16 initWithName:v19 actionHandler:v49];

    [v42 axSafelyAddObject:v38];
    v20 = _AXCustomActionsForActions(v44);
    [v42 axSafelyAddObjectsFromArray:v20];

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v21 = v42;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v45 objects:v86 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v46;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v46 != v23) {
            objc_enumerationMutation(v21);
          }
          v25 = *(void **)(*((void *)&v45 + 1) + 8 * j);
          v26 = [v25 name];
          v27 = accessibilityLocalizedString(@"mute.collection.view.cell");
          char v28 = [v26 isEqualToString:v27];

          v29 = @"hide.alerts.collection.view.cell";
          if (v28) {
            goto LABEL_16;
          }
          v30 = [v25 name];
          v31 = accessibilityLocalizedString(@"unmute.collection.view.cell");
          int v32 = [v30 isEqualToString:v31];

          v29 = @"show.alerts.collection.view.cell";
          if (v32)
          {
LABEL_16:
            v33 = accessibilityLocalizedString(v29);
            [v25 setName:v33];
          }
        }
        uint64_t v22 = [v21 countByEnumeratingWithState:&v45 objects:v86 count:16];
      }
      while (v22);
    }
  }

  return v42;
}

uint64_t __99__CKConversationListCollectionViewConversationCellAccessibility__privateAccessibilityCustomActions__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_conversationActionMenusForItemIdentifier:inSection:withCell:forSearch:", *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "section"), *(void *)(a1 + 56), 0);

  return MEMORY[0x270F9A758]();
}

uint64_t __99__CKConversationListCollectionViewConversationCellAccessibility__privateAccessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) conversationForItemIdentifier:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

uint64_t __99__CKConversationListCollectionViewConversationCellAccessibility__privateAccessibilityCustomActions__block_invoke_3(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) pinnedConversationDisplayNamePreferringShortName:1];

  return MEMORY[0x270F9A758]();
}

uint64_t __99__CKConversationListCollectionViewConversationCellAccessibility__privateAccessibilityCustomActions__block_invoke_4(uint64_t a1)
{
  id v3 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  AXPerformSafeBlock();

  return 1;
}

uint64_t __99__CKConversationListCollectionViewConversationCellAccessibility__privateAccessibilityCustomActions__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) togglePinStateForConversation:*(void *)(a1 + 40) withReason:*MEMORY[0x263F4A4D0]];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  uint64_t v3 = [(CKConversationListCollectionViewConversationCellAccessibility *)self safeIntegerForKey:@"editingMode"];
  id v4 = [(CKConversationListCollectionViewConversationCellAccessibility *)self _axEmbeddedTableViewCell];
  v5 = [v4 accessibilityLabel];

  if (v3 == 2)
  {
    id v8 = accessibilityLocalizedString(@"unpinned.label");
    uint64_t v6 = __UIAXStringForVariables();

    v5 = (void *)v6;
  }

  return v5;
}

- (BOOL)_accessibilityRetainsCustomRotorActionSetting
{
  v2 = [(CKConversationListCollectionViewConversationCellAccessibility *)self _axEmbeddedTableViewCell];
  char v3 = [v2 _accessibilityRetainsCustomRotorActionSetting];

  return v3;
}

- (id)_accessibilityCustomActionGroupIdentifier
{
  v2 = [(CKConversationListCollectionViewConversationCellAccessibility *)self _axEmbeddedTableViewCell];
  char v3 = [v2 _accessibilityCustomActionGroupIdentifier];

  return v3;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)CKConversationListCollectionViewConversationCellAccessibility;
  [(CKConversationListCollectionViewConversationCellAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  char v3 = [(CKConversationListCollectionViewConversationCellAccessibility *)self _axEmbeddedTableViewCell];
  [v3 _accessibilityLoadAccessibilityInformation];
}

- (id)accessibilityUserInputLabels
{
  v2 = [(CKConversationListCollectionViewConversationCellAccessibility *)self _axEmbeddedTableViewCell];
  char v3 = [v2 accessibilityUserInputLabels];

  return v3;
}

- (void)setEditingMode:(unint64_t)a3 animated:(BOOL)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CKConversationListCollectionViewConversationCellAccessibility;
  [(CKConversationListCollectionViewConversationCellAccessibility *)&v9 setEditingMode:a3 animated:a4];
  if (a3 == 2)
  {
    uint64_t v6 = [(CKConversationListCollectionViewConversationCellAccessibility *)self safeArrayForKey:@"trailingEditingAccessoryConfigurations"];
    if ([v6 count])
    {
      id v7 = [v6 firstObject];
      id v8 = [v7 safeValueForKey:@"customView"];
      [v8 setAccessibilityElementsHidden:1];
    }
  }
}

- (id)_axEmbeddedTableViewCell
{
  return (id)[(CKConversationListCollectionViewConversationCellAccessibility *)self safeValueForKey:@"embeddedTableViewCell"];
}

@end