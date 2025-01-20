@interface MessageListCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityArchiveAction:(id)a3;
- (BOOL)_accessibilityDeleteAction:(id)a3;
- (BOOL)_accessibilityIsThreadedChildCell;
- (BOOL)_accessibilityLaterAction:(id)a3;
- (BOOL)_accessibilityMoreAction:(id)a3;
- (BOOL)_accessibilityRemoveHighImpactAction:(id)a3;
- (BOOL)_accessibilityRetainsCustomRotorActionSetting;
- (BOOL)_accessibilityScreenAction:(id)a3;
- (BOOL)_accessibilityToggleFlagAction:(id)a3;
- (BOOL)_accessibilityToggleReadAction:(id)a3;
- (BOOL)_accessibilityToggleThreadAction:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityCustomActionGroupIdentifier;
- (id)_accessibilityEquivalenceTag;
- (id)_accessibilityLabelWithoutAttributes;
- (id)_accessibilityLinkedUIElements;
- (id)_accessibilityMailboxController;
- (id)_accessibilityScrollStatus;
- (id)_accessibilityThreadedDisclosureButton;
- (id)_privateAccessibilityCustomActions;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityUserInputLabels;
- (id)automationElements;
- (int64_t)_accessibilityScannerActivateBehavior;
- (unint64_t)_accessibilityThreadCount;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilityPerformCellAction:(int64_t)a3;
- (void)_axPostAnnouncementForActionCompletionIfNecessary;
- (void)_axProcessMailLabel:(id)a3 children:(id)a4;
- (void)_axSetDisclosureButtonTraits;
- (void)accessibilityElementDidBecomeFocused;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation MessageListCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MessageListCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessageListCollectionViewCell", @"_didTapDisclosureButton:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessageListCollectionViewCell", @"cellHelper", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessageListCollectionViewCell", @"messageListItem", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessageListCellHelper", @"messageListItem", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessageListCellHelper", @"cellView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessageListCellHelper", @"disclosureEnabled", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessageListCellView", @"dateLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessageListCellView", @"secondaryLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessageListCellView", @"disclosureButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessageListCellView", @"primaryLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessageListCellView", @"tertiaryLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessageListCellView", @"viewModel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessageListCellView", @"disclosureButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessageListCellView", @"chevronType", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessageListCellView", @"isEditing", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessageListCellView", @"category", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessageItemViewModel", @"isRead", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessageItemViewModel", @"isFlagged", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessageItemViewModel", @"isReplied", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessageItemViewModel", @"isForwarded", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessageItemViewModel", @"isVIP", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessageItemViewModel", @"isNotify", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessageItemViewModel", @"isMute", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessageItemViewModel", @"isBlockedSender", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessageItemViewModel", @"flagColors", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessageListViewController", @"_isExpandedIndexPath:", "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessageListViewController", @"_swipeActionForTriageAction:indexPath:", "@", "q", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MUIMessageListViewController", @"messageListSelectionModel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MUIMessageListViewController", @"state", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MUIMessageListViewController", @"messageListPositionHelper", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MUIMessageListViewController", @"dataSource", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessageListViewController", @"undoManager", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessageListViewController", @"_shouldShowClearHighImpactForMessageListItem:", "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessageListSelectionModel", @"isSelectedItemID:", "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIContextualAction", @"executePreHandlerWithView:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIContextualAction", @"executeHandlerWithView:completionHandler:", "v", "@", "@?", 0);
  [v3 validateProtocol:@"EMMessageListItem" hasRequiredInstanceMethod:@"count"];
  [v3 validateProtocol:@"EMMessageListItem" hasRequiredInstanceMethod:@"shouldArchiveByDefault"];
  [v3 validateProtocol:@"EMMessageListItem" hasRequiredInstanceMethod:@"displayMessageObjectID"];
  [v3 validateProtocol:@"EMMessageListItem" hasRequiredInstanceMethod:@"hasAttachments"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EMObjectID", @"stringHash", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EFFuture", @"result", "@", 0);
  [v3 validateClass:@"MessageListCollectionViewCell" isKindOfClass:@"UICollectionViewCell"];
  [v3 validateClass:@"MessageListCellLabel" isKindOfClass:@"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessageListPositionHelper", @"recalculateFirstVisibleIndex", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessageListDataSource", @"messageListItemAtIndexPath:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessageListDataSource", @"collectionViewDataSource", "@", 0);
  [v3 validateClass:@"MFReadLaterTriageInteraction"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"MFReadLaterTriageInteraction", @"interactionWithMessageListItems:undoManager:origin:actor:", "@", "@", "@", "q", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFReadLaterTriageInteraction", @"_performInteractionAfterPreparation:completion:", "v", "@?", "@?", 0);
  [v3 validateClass:@"MFReadLaterTriageInteraction" isKindOfClass:@"MFTriageInteraction"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFTriageInteraction", @"setDelegate:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessageListViewControllerState", @"containsDraftsOrOutbox", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EMCategory", @"type", "Q", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)MessageListCollectionViewCellAccessibility;
  [(MessageListCollectionViewCellAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(MessageListCollectionViewCellAccessibility *)self _axSetDisclosureButtonTraits];
}

- (void)_axSetDisclosureButtonTraits
{
  id v2 = [(MessageListCollectionViewCellAccessibility *)self safeValueForKeyPath:@"cellHelper.cellView.disclosureButton"];
  [v2 setAccessibilityTraits:*MEMORY[0x263F1CEE8] | *MEMORY[0x263F813E8]];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)MessageListCollectionViewCellAccessibility;
  unint64_t v2 = [(MessageListCollectionViewCellAccessibility *)&v7 accessibilityTraits];
  objc_opt_class();
  objc_super v3 = __UIAccessibilityCastAsClass();
  int v4 = [v3 isSelected];

  uint64_t v5 = *MEMORY[0x263F1CF38];
  if (!v4) {
    uint64_t v5 = 0;
  }
  return v5 | v2;
}

- (id)accessibilityLabel
{
  v70.receiver = self;
  v70.super_class = (Class)MessageListCollectionViewCellAccessibility;
  objc_super v3 = [(MessageListCollectionViewCellAccessibility *)&v70 accessibilityLabel];
  int v4 = v3;
  if (v3)
  {
    id v5 = v3;
    goto LABEL_41;
  }
  v6 = [(MessageListCollectionViewCellAccessibility *)self safeValueForKeyPath:@"cellHelper.cellView"];
  objc_super v7 = [v6 safeValueForKey:@"primaryLabel"];
  v8 = [v7 accessibilityLabel];

  v9 = [v6 safeValueForKey:@"secondaryLabel"];
  v62 = [v9 accessibilityLabel];

  v10 = [v6 safeValueForKey:@"tertiaryLabel"];
  v61 = [v10 accessibilityLabel];

  v11 = [v8 componentsSeparatedByString:@", "];
  unint64_t v12 = [v11 count];
  if (v12 >= 3) {
    uint64_t v13 = 3;
  }
  else {
    uint64_t v13 = v12;
  }
  v14 = objc_msgSend(v11, "subarrayWithRange:", 0, v13);

  v44 = v14;
  v60 = [v14 componentsJoinedByString:@", "];

  v47 = v6;
  v15 = [v6 safeValueForKey:@"viewModel"];
  char v16 = [v15 safeBoolForKey:@"isRead"];
  int v17 = [v15 safeBoolForKey:@"isReplied"];
  int v53 = [v15 safeBoolForKey:@"isForwarded"];
  int v18 = [v15 safeBoolForKey:@"isFlagged"];
  objc_opt_class();
  v19 = [v15 safeValueForKey:@"flagColors"];
  v48 = __UIAccessibilityCastAsClass();

  int v20 = [v15 safeBoolForKey:@"isVIP"];
  int v21 = [v15 safeBoolForKey:@"isBlockedSender"];
  int v22 = [v15 safeBoolForKey:@"isNotify"];
  int v23 = [v15 safeBoolForKey:@"isMute"];
  v24 = [(MessageListCollectionViewCellAccessibility *)self safeValueForKeyPath:@"cellHelper.messageListItem"];
  int v46 = [v24 safeBoolForKey:@"hasAttachments"];

  BOOL v45 = [(MessageListCollectionViewCellAccessibility *)self _accessibilityIsThreadedChildCell];
  if (v16)
  {
    v59 = 0;
    if (!v17) {
      goto LABEL_8;
    }
  }
  else
  {
    v59 = accessibilityLocalizedString(@"unread");
    if (!v17)
    {
LABEL_8:
      v58 = 0;
      if (!v20) {
        goto LABEL_9;
      }
      goto LABEL_14;
    }
  }
  v58 = accessibilityLocalizedString(@"replied");
  if (!v20)
  {
LABEL_9:
    v57 = 0;
    if (!v21) {
      goto LABEL_10;
    }
LABEL_15:
    v56 = accessibilityLocalizedString(@"blockedsender.message");
    if (!v22) {
      goto LABEL_11;
    }
    goto LABEL_16;
  }
LABEL_14:
  v57 = accessibilityLocalizedString(@"vip.message");
  if (v21) {
    goto LABEL_15;
  }
LABEL_10:
  v56 = 0;
  if (!v22)
  {
LABEL_11:
    v55 = 0;
    goto LABEL_17;
  }
LABEL_16:
  v55 = accessibilityLocalizedString(@"notify.message");
LABEL_17:
  if (v53)
  {
    v54 = accessibilityLocalizedString(@"forwarded");
    if (!v23) {
      goto LABEL_19;
    }
LABEL_22:
    v52 = accessibilityLocalizedString(@"muted.message");
    if (!v18) {
      goto LABEL_20;
    }
LABEL_23:
    v51 = accessibilityLocalizedString(@"flagged");
    goto LABEL_24;
  }
  v54 = 0;
  if (v23) {
    goto LABEL_22;
  }
LABEL_19:
  v52 = 0;
  if (v18) {
    goto LABEL_23;
  }
LABEL_20:
  v51 = 0;
LABEL_24:
  uint64_t v64 = 0;
  v65 = &v64;
  uint64_t v66 = 0x3032000000;
  v67 = __Block_byref_object_copy__3;
  v68 = __Block_byref_object_dispose__3;
  id v69 = 0;
  if (v18)
  {
    uint64_t v25 = [MEMORY[0x263F089D8] string];
    v26 = (void *)v65[5];
    v65[5] = v25;

    v63[0] = MEMORY[0x263EF8330];
    v63[1] = 3221225472;
    v63[2] = __64__MessageListCollectionViewCellAccessibility_accessibilityLabel__block_invoke;
    v63[3] = &unk_265133580;
    v63[4] = &v64;
    [v48 enumerateIndexesUsingBlock:v63];
  }
  v27 = [v47 safeValueForKey:@"category"];
  unsigned int v28 = [v27 safeIntForKey:@"type"] - 1;
  if (v28 >= 3)
  {
    v50 = 0;
  }
  else
  {
    v50 = accessibilityLocalizedString(off_265133638[v28]);
  }
  if ((int64_t)[(MessageListCollectionViewCellAccessibility *)self _accessibilityThreadCount] < 2)
  {
    v49 = 0;
  }
  else
  {
    v29 = NSString;
    v30 = accessibilityLocalizedString(@"thread.count.many");
    v31 = AXFormatInteger();
    v49 = objc_msgSend(v29, "stringWithFormat:", v30, v31);
  }
  if (v46)
  {
    v32 = accessibilityLocalizedString(@"contains.attachments");
  }
  else
  {
    v32 = 0;
  }
  if ([v47 safeBoolForKey:@"hasGeneratedSummary"])
  {
    v33 = accessibilityLocalizedString(@"message.summary");
  }
  else
  {
    v33 = 0;
  }
  v34 = v62;
  if (v45) {
    v34 = v61;
  }
  id v35 = v34;
  objc_opt_class();
  v36 = [v47 safeValueForKey:@"tertiaryLabel"];
  v37 = __UIAccessibilityCastAsClass();

  v38 = accessibilityApproximateVisibleSummaryText(self, v37);

  uint64_t v39 = v65[5];
  v40 = [v47 safeValueForKey:@"dateLabel"];
  v43 = [v40 accessibilityLabel];
  uint64_t v42 = v39;
  __UIAXStringForVariables();
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  -[MessageListCollectionViewCellAccessibility setAccessibilityLabel:](self, "setAccessibilityLabel:", v5, v58, v54, v51, v42, v60, v35, v43, v50, v57, v56, v55, v52, v49, v32, v33, v38,
    @"__AXStringForVariablesSentinel");

  _Block_object_dispose(&v64, 8);
  int v4 = 0;
LABEL_41:

  return v5;
}

void __64__MessageListCollectionViewCellAccessibility_accessibilityLabel__block_invoke(uint64_t a1, uint64_t a2)
{
  switch(a2)
  {
    case 0:
      objc_super v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      int v4 = @"flag.color.red";
      goto LABEL_9;
    case 1:
      objc_super v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      int v4 = @"flag.color.orange";
      goto LABEL_9;
    case 2:
      objc_super v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      int v4 = @"flag.color.yellow";
      goto LABEL_9;
    case 3:
      objc_super v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      int v4 = @"flag.color.green";
      goto LABEL_9;
    case 4:
      objc_super v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      int v4 = @"flag.color.blue";
      goto LABEL_9;
    case 5:
      objc_super v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      int v4 = @"flag.color.purple";
      goto LABEL_9;
    case 6:
      objc_super v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      int v4 = @"flag.color.gray";
LABEL_9:
      accessibilityLocalizedString(v4);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      [v3 appendFormat:@"%@, ", v5];

      break;
    default:
      return;
  }
}

- (id)accessibilityHint
{
  objc_super v3 = [(MessageListCollectionViewCellAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_9 startWithSelf:0];
  LOBYTE(v24) = 0;
  objc_opt_class();
  int v4 = __UIAccessibilityCastAsClass();
  if ([v4 isEditing])
  {
    id v5 = [v4 delegate];
    v6 = [v5 safeValueForKey:@"messageListSelectionModel"];
    objc_super v7 = [v5 safeValueForKeyPath:@"dataSource.collectionViewDataSource"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = [v4 indexPathForCell:self];
      v9 = [v7 itemIdentifierForIndexPath:v8];
      uint64_t v24 = 0;
      uint64_t v25 = &v24;
      uint64_t v26 = 0x2020000000;
      char v27 = 0;
      uint64_t v17 = MEMORY[0x263EF8330];
      uint64_t v18 = 3221225472;
      v19 = __63__MessageListCollectionViewCellAccessibility_accessibilityHint__block_invoke_2;
      int v20 = &unk_265133330;
      int v23 = &v24;
      id v10 = v6;
      id v21 = v10;
      id v11 = v9;
      id v22 = v11;
      AXPerformSafeBlock();
      int v12 = *((unsigned __int8 *)v25 + 24);

      _Block_object_dispose(&v24, 8);
      if (v12) {
        uint64_t v13 = @"message.deselect.hint";
      }
      else {
        uint64_t v13 = @"message.select.hint";
      }
      v14 = accessibilityLocalizedString(v13);

      goto LABEL_9;
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)MessageListCollectionViewCellAccessibility;
  v14 = [(MessageListCollectionViewCellAccessibility *)&v16 accessibilityHint];
LABEL_9:

  return v14;
}

uint64_t __63__MessageListCollectionViewCellAccessibility_accessibilityHint__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 accessibilityIdentifier];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F536B0]];

  return v3;
}

uint64_t __63__MessageListCollectionViewCellAccessibility_accessibilityHint__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isSelectedItemID:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (id)accessibilityUserInputLabels
{
  uint64_t v2 = [(MessageListCollectionViewCellAccessibility *)self safeValueForKeyPath:@"cellHelper.cellView.secondaryLabel"];
  uint64_t v3 = [v2 accessibilityLabel];
  int v4 = MEMORY[0x245654F70]();

  return v4;
}

- (id)_accessibilityCustomActionGroupIdentifier
{
  uint64_t v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (BOOL)_accessibilityRetainsCustomRotorActionSetting
{
  return 0;
}

- (void)_accessibilityPerformCellAction:(int64_t)a3
{
  id v5 = [(MessageListCollectionViewCellAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_592 startWithSelf:0];
  objc_opt_class();
  v6 = __UIAccessibilityCastAsClass();
  objc_super v7 = [v6 indexPathForCell:self];
  v8 = [v6 delegate];
  v9 = v8;
  if (a3 == 3)
  {
    id v10 = [v8 safeValueForKey:@"dataSource"];
    id v11 = [v6 indexPathForCell:self];
    uint64_t v26 = 0;
    char v27 = &v26;
    uint64_t v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__3;
    v30 = __Block_byref_object_dispose__3;
    id v31 = 0;
    id v12 = v10;
    id v13 = v11;
    AXPerformSafeBlock();
    id v14 = (id)v27[5];

    _Block_object_dispose(&v26, 8);
    v15 = [v14 safeValueForKey:@"result"];

    if (v15)
    {
      uint64_t v26 = 0;
      char v27 = &v26;
      uint64_t v28 = 0x3032000000;
      v29 = __Block_byref_object_copy__3;
      v30 = __Block_byref_object_dispose__3;
      id v31 = 0;
      id v25 = v15;
      AXPerformSafeBlock();
      id v16 = (id)v27[5];

      _Block_object_dispose(&v26, 8);
      int v23 = v16;
      id v24 = v9;
      id v17 = v16;
      AXPerformSafeBlock();
    }
  }
  else
  {
    objc_opt_class();
    uint64_t v26 = 0;
    char v27 = &v26;
    uint64_t v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__3;
    v30 = __Block_byref_object_dispose__3;
    id v31 = 0;
    id v21 = v9;
    id v22 = v7;
    AXPerformSafeBlock();
    id v18 = (id)v27[5];

    _Block_object_dispose(&v26, 8);
    v19 = __UIAccessibilityCastAsClass();

    int v20 = v19;
    id v12 = v19;
    AXPerformSafeBlock();
    id v13 = v20;
  }
}

uint64_t __78__MessageListCollectionViewCellAccessibility__accessibilityPerformCellAction___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 accessibilityIdentifier];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F536B0]];

  return v3;
}

uint64_t __78__MessageListCollectionViewCellAccessibility__accessibilityPerformCellAction___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) messageListItemAtIndexPath:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

void __78__MessageListCollectionViewCellAccessibility__accessibilityPerformCellAction___block_invoke_3(uint64_t a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  Class v2 = NSClassFromString(&cfstr_Mfreadlatertri.isa);
  v8[0] = *(void *)(a1 + 32);
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  int v4 = [*(id *)(a1 + 40) safeValueForKey:@"undoManager"];
  uint64_t v5 = [(objc_class *)v2 interactionWithMessageListItems:v3 undoManager:v4 origin:2 actor:2];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  objc_super v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

uint64_t __78__MessageListCollectionViewCellAccessibility__accessibilityPerformCellAction___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
  Class v2 = *(void **)(a1 + 32);

  return [v2 _performInteractionAfterPreparation:0 completion:0];
}

uint64_t __78__MessageListCollectionViewCellAccessibility__accessibilityPerformCellAction___block_invoke_5(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _swipeActionForTriageAction:*(void *)(a1 + 56) indexPath:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

uint64_t __78__MessageListCollectionViewCellAccessibility__accessibilityPerformCellAction___block_invoke_6(uint64_t a1)
{
  [*(id *)(a1 + 32) executePreHandlerWithView:*(void *)(a1 + 40)];
  Class v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 executeHandlerWithView:v3 completionHandler:&__block_literal_global_597];
}

void __78__MessageListCollectionViewCellAccessibility__accessibilityPerformCellAction___block_invoke_7()
{
}

- (BOOL)_accessibilityToggleReadAction:(id)a3
{
  int v4 = [(MessageListCollectionViewCellAccessibility *)self _accessibilityMailboxController];
  [v4 _axSetTriageActionForAnnouncement:2];

  [(MessageListCollectionViewCellAccessibility *)self _accessibilityPerformCellAction:2];
  return 1;
}

- (BOOL)_accessibilityToggleFlagAction:(id)a3
{
  int v4 = [(MessageListCollectionViewCellAccessibility *)self _accessibilityMailboxController];
  [v4 _axSetTriageActionForAnnouncement:6];

  [(MessageListCollectionViewCellAccessibility *)self _accessibilityPerformCellAction:6];
  return 1;
}

- (BOOL)_accessibilityRemoveHighImpactAction:(id)a3
{
  int v4 = [(MessageListCollectionViewCellAccessibility *)self _accessibilityMailboxController];
  [v4 _axSetTriageActionForAnnouncement:21];

  [(MessageListCollectionViewCellAccessibility *)self _accessibilityPerformCellAction:21];
  return 1;
}

- (BOOL)_accessibilityDeleteAction:(id)a3
{
  int v4 = objc_msgSend(MEMORY[0x263F22938], "sharedInstance", a3);
  int v5 = [v4 voiceOverSpeakActionConfirmation];

  if (v5)
  {
    uint64_t v6 = [(MessageListCollectionViewCellAccessibility *)self _accessibilityThreadCount];
    UIAccessibilityNotifications v7 = *MEMORY[0x263F1CDC8];
    if (v6 < 2)
    {
      id v10 = accessibilityLocalizedString(@"message.deleted");
      UIAccessibilityPostNotification(v7, v10);
    }
    else
    {
      uint64_t v8 = v6;
      v9 = NSString;
      id v10 = accessibilityLocalizedString(@"thread.message.deleted");
      id v11 = objc_msgSend(v9, "localizedStringWithFormat:", v10, v8);
      UIAccessibilityPostNotification(v7, v11);
    }
  }
  [(MessageListCollectionViewCellAccessibility *)self _accessibilityPerformCellAction:8];
  return 1;
}

- (void)_axPostAnnouncementForActionCompletionIfNecessary
{
  uint64_t v3 = [MEMORY[0x263F22938] sharedInstance];
  int v4 = [v3 voiceOverSpeakActionConfirmation];

  if (!v4) {
    return;
  }
  int v5 = [(MessageListCollectionViewCellAccessibility *)self _accessibilityMailboxController];
  uint64_t v6 = [v5 _axGetTriageActionForAnnouncement];

  if (v6 != 2)
  {
    if (v6 != 6) {
      return;
    }
    UIAccessibilityNotifications v7 = [(MessageListCollectionViewCellAccessibility *)self safeValueForKeyPath:@"cellHelper.cellView.viewModel"];
    char v8 = [v7 safeBoolForKey:@"isFlagged"];

    UIAccessibilityNotifications v9 = *MEMORY[0x263F1CDC8];
    if (v8) {
      id v10 = @"flagged";
    }
    else {
      id v10 = @"unflagged";
    }
    goto LABEL_11;
  }
  id v11 = [(MessageListCollectionViewCellAccessibility *)self safeValueForKeyPath:@"cellHelper.cellView.viewModel"];
  char v12 = [v11 safeBoolForKey:@"isRead"];

  UIAccessibilityNotifications v9 = *MEMORY[0x263F1CDC8];
  if ((v12 & 1) == 0)
  {
    id v10 = @"unread";
LABEL_11:
    accessibilityLocalizedString(v10);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v9, v14);
    goto LABEL_12;
  }
  accessibilityLocalizedString(@"read");
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  id v13 = accessibilitySubstituteReadPhonemeInString((uint64_t)v14);
  UIAccessibilityPostNotification(v9, v13);

LABEL_12:
}

- (id)_accessibilityMailboxController
{
  Class v2 = [(MessageListCollectionViewCellAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_615 startWithSelf:1];
  uint64_t v3 = [v2 _accessibilityViewController];

  return v3;
}

uint64_t __77__MessageListCollectionViewCellAccessibility__accessibilityMailboxController__block_invoke(uint64_t a1, void *a2)
{
  Class v2 = [a2 _accessibilityViewController];
  NSClassFromString(&cfstr_Messagelistvie_0.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_accessibilityMoreAction:(id)a3
{
  return 1;
}

- (BOOL)_accessibilityArchiveAction:(id)a3
{
  return 1;
}

- (BOOL)_accessibilityToggleThreadAction:(id)a3
{
  uint64_t v13 = MEMORY[0x263EF8330];
  AXPerformSafeBlock();
  int v4 = [MEMORY[0x263F22938] sharedInstance];
  int v5 = [v4 voiceOverSpeakActionConfirmation];

  if (v5)
  {
    uint64_t v6 = [(MessageListCollectionViewCellAccessibility *)self safeValueForKey:@"cellHelper"];
    int v7 = [v6 safeBoolForKey:@"disclosureEnabled"];

    if (v7)
    {
      unint64_t v8 = [(MessageListCollectionViewCellAccessibility *)self _accessibilityThreadCount];
      UIAccessibilityNotifications v9 = NSString;
      id v10 = accessibilityLocalizedString(@"num.messages");
      id v11 = objc_msgSend(v9, "localizedStringWithFormat:", v10, v8, v13, 3221225472, __79__MessageListCollectionViewCellAccessibility__accessibilityToggleThreadAction___block_invoke, &unk_2651331B8, self);
      UIAccessibilitySpeak();
    }
  }
  return 1;
}

void __79__MessageListCollectionViewCellAccessibility__accessibilityToggleThreadAction___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 safeValueForKeyPath:@"cellHelper.cellView.disclosureButton"];
  [v1 _didTapDisclosureButton:v2];
}

- (BOOL)_accessibilityLaterAction:(id)a3
{
  return 1;
}

- (BOOL)_accessibilityScreenAction:(id)a3
{
  return 1;
}

- (void)accessibilityElementDidBecomeFocused
{
  v2.receiver = self;
  v2.super_class = (Class)MessageListCollectionViewCellAccessibility;
  [(MessageListCollectionViewCellAccessibility *)&v2 accessibilityElementDidBecomeFocused];
  AXPerformSafeBlock();
}

void __82__MessageListCollectionViewCellAccessibility_accessibilityElementDidBecomeFocused__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _accessibilityMailboxController];
  v1 = [v2 safeValueForKey:@"messageListPositionHelper"];
  [v1 recalculateFirstVisibleIndex];
}

- (id)_privateAccessibilityCustomActions
{
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  int v4 = [(MessageListCollectionViewCellAccessibility *)self safeValueForKeyPath:@"cellHelper.cellView.viewModel"];
  int v5 = [(MessageListCollectionViewCellAccessibility *)self safeValueForKeyPath:@"cellHelper.messageListItem"];
  int v6 = [v5 safeBoolForKey:@"shouldArchiveByDefault"];

  int v7 = (void *)MEMORY[0x263F81158];
  if (v6)
  {
    uint64_t v8 = [v3 indexOfObjectPassingTest:&__block_literal_global_624];
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v9 = objc_alloc(MEMORY[0x263F1C390]);
      id v10 = accessibilityLocalizedString(@"archive.button");
      id v11 = (void *)[v9 initWithName:v10 target:self selector:sel__accessibilityArchiveAction_];

      [v11 _accessibilitySetInternalCustomActionIdentifier:@"AX_ARCHIVE"];
      [v3 addObject:v11];
    }
    else
    {
      id v11 = [v3 objectAtIndex:v8];
      [v11 _accessibilitySetInternalCustomActionIdentifier:@"AX_ARCHIVE"];
      char v12 = accessibilityLocalizedString(@"archive.button");
      [v11 setName:v12];

      [v11 setTarget:self];
      [v11 setSelector:sel__accessibilityArchiveAction_];
      [v11 setSortPriority:*v7];
      [v11 setImage:0];
    }
  }
  if ([v4 safeBoolForKey:@"isRead"])
  {
    uint64_t v13 = accessibilityLocalizedString(@"message.action.mark.unread");
  }
  else
  {
    id v14 = accessibilityLocalizedString(@"message.action.mark.read");
    uint64_t v13 = accessibilitySubstituteReadPhonemeInString((uint64_t)v14);
  }
  v15 = (void *)[objc_alloc(MEMORY[0x263F1C390]) initWithName:v13 target:self selector:sel__accessibilityToggleReadAction_];
  [v15 _accessibilitySetInternalCustomActionIdentifier:@"AX_READ"];
  [v3 addObject:v15];
  if ([v4 safeBoolForKey:@"isFlagged"]) {
    id v16 = @"message.action.unflag";
  }
  else {
    id v16 = @"message.action.flag";
  }
  id v17 = accessibilityLocalizedString(v16);

  id v18 = (void *)[objc_alloc(MEMORY[0x263F1C390]) initWithName:v17 target:self selector:sel__accessibilityToggleFlagAction_];
  [v18 _accessibilitySetInternalCustomActionIdentifier:@"AX_FLAG"];
  [v3 addObject:v18];
  v19 = accessibilityLocalizedString(@"message.action.delete");
  uint64_t v20 = [(MessageListCollectionViewCellAccessibility *)self _accessibilityThreadCount];
  v51 = v4;
  if (v20 >= 2)
  {
    uint64_t v21 = v20;
    id v22 = NSString;
    int v23 = accessibilityLocalizedString(@"message.action.delete.thread");
    uint64_t v24 = objc_msgSend(v22, "localizedStringWithFormat:", v23, v21, v4);

    v19 = (void *)v24;
  }
  id v25 = [(MessageListCollectionViewCellAccessibility *)self safeValueForKeyPath:@"cellHelper.cellView"];
  uint64_t v26 = [v25 safeIntegerForKey:@"chevronType"];

  if (v26 == 2)
  {
    char v27 = [(MessageListCollectionViewCellAccessibility *)self safeValueForKey:@"cellHelper"];
    int v28 = [v27 safeBoolForKey:@"disclosureEnabled"];

    if (v28) {
      v29 = @"mailbox.cell.thread.collapse";
    }
    else {
      v29 = @"mailbox.cell.thread.expand";
    }
    v30 = accessibilityLocalizedString(v29);
    id v31 = (void *)[objc_alloc(MEMORY[0x263F1C390]) initWithName:v30 target:self selector:sel__accessibilityToggleThreadAction_];
    [v31 _accessibilitySetInternalCustomActionIdentifier:@"AX_TOGGLE_THREAD"];
    [v3 addObject:v31];
  }
  v32 = [(MessageListCollectionViewCellAccessibility *)self _accessibilityMailboxController];
  v33 = [v32 safeValueForKey:@"state"];
  char v34 = [v33 safeBoolForKey:@"containsDraftsOrOutbox"];

  if ((v34 & 1) == 0)
  {
    id v35 = objc_alloc(MEMORY[0x263F1C390]);
    v36 = accessibilityLocalizedString(@"message.action.more");
    v37 = (void *)[v35 initWithName:v36 target:self selector:sel__accessibilityMoreAction_];

    [v37 _accessibilitySetInternalCustomActionIdentifier:@"AX_MORE"];
    [v3 addObject:v37];
    id v18 = v37;
  }
  v38 = (void *)[objc_alloc(MEMORY[0x263F1C390]) initWithName:v19 target:self selector:sel__accessibilityDeleteAction_];

  uint64_t v39 = _UIAccessibilityCustomActionDeleteImage();
  [v38 setImage:v39];

  [v38 setSortPriority:*v7];
  [v38 _accessibilitySetInternalCustomActionIdentifier:@"AX_DELETE"];
  [v3 addObject:v38];
  id v40 = objc_alloc(MEMORY[0x263F1C390]);
  v41 = accessibilityLocalizedString(@"message.action.read.later");
  uint64_t v42 = (void *)[v40 initWithName:v41 target:self selector:sel__accessibilityLaterAction_];

  [v42 _accessibilitySetInternalCustomActionIdentifier:@"AX_READ_LATER"];
  [v3 addObject:v42];
  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x3032000000;
  id v69 = __Block_byref_object_copy__3;
  objc_super v70 = __Block_byref_object_dispose__3;
  id v71 = 0;
  uint64_t v60 = MEMORY[0x263EF8330];
  uint64_t v61 = 3221225472;
  v62 = __80__MessageListCollectionViewCellAccessibility__privateAccessibilityCustomActions__block_invoke_2;
  v63 = &unk_2651335F0;
  uint64_t v64 = self;
  v65 = &v66;
  AXPerformSafeBlock();
  id v43 = (id)v67[5];
  _Block_object_dispose(&v66, 8);

  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x2020000000;
  LOBYTE(v69) = 0;
  uint64_t v53 = MEMORY[0x263EF8330];
  uint64_t v54 = 3221225472;
  v55 = __80__MessageListCollectionViewCellAccessibility__privateAccessibilityCustomActions__block_invoke_3;
  v56 = &unk_265133330;
  v59 = &v66;
  id v44 = v32;
  id v57 = v44;
  id v45 = v43;
  id v58 = v45;
  AXPerformSafeBlock();
  LODWORD(v41) = *((unsigned __int8 *)v67 + 24);

  _Block_object_dispose(&v66, 8);
  if (v41)
  {
    id v46 = objc_alloc(MEMORY[0x263F1C390]);
    v47 = accessibilityLocalizedString(@"message.action.remove.high.impact");
    v48 = (void *)[v46 initWithName:v47 target:self selector:sel__accessibilityRemoveHighImpactAction_];

    [v48 _accessibilitySetInternalCustomActionIdentifier:@"AX_REMOVE_HIGH_IMPACT"];
    [v3 addObject:v48];
    uint64_t v42 = v48;
  }
  v52.receiver = self;
  v52.super_class = (Class)MessageListCollectionViewCellAccessibility;
  v49 = [(MessageListCollectionViewCellAccessibility *)&v52 accessibilityCustomActions];
  [v3 axSafelyAddObjectsFromArray:v49];

  return v3;
}

uint64_t __80__MessageListCollectionViewCellAccessibility__privateAccessibilityCustomActions__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 accessibilityIdentifier];
  uint64_t v3 = [v2 isEqualToString:@"AXDeleteAction"];

  return v3;
}

uint64_t __80__MessageListCollectionViewCellAccessibility__privateAccessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 4UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0) = [*(id *)(a1 + 32) messageListItem];

  return MEMORY[0x270F9A758]();
}

uint64_t __80__MessageListCollectionViewCellAccessibility__privateAccessibilityCustomActions__block_invoke_3(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _shouldShowClearHighImpactForMessageListItem:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (id)_accessibilityScrollStatus
{
  v9.receiver = self;
  v9.super_class = (Class)MessageListCollectionViewCellAccessibility;
  uint64_t v3 = [(MessageListCollectionViewCellAccessibility *)&v9 _accessibilityScrollStatus];
  objc_opt_class();
  int v4 = [(MessageListCollectionViewCellAccessibility *)self safeValueForKeyPath:@"cellHelper.cellView.tertiaryLabel"];
  int v5 = __UIAccessibilityCastAsClass();

  int v6 = accessibilityApproximateVisibleSummaryText(self, v5);

  int v7 = __UIAXStringForVariables();

  return v7;
}

- (id)_accessibilityLinkedUIElements
{
  unint64_t v3 = [(MessageListCollectionViewCellAccessibility *)self accessibilityTraits];
  if ((*MEMORY[0x263F1CF38] & v3) != 0)
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__3;
    id v16 = __Block_byref_object_dispose__3;
    id v17 = 0;
    uint64_t v7 = MEMORY[0x263EF8330];
    uint64_t v8 = 3221225472;
    objc_super v9 = __76__MessageListCollectionViewCellAccessibility__accessibilityLinkedUIElements__block_invoke;
    id v10 = &unk_265133618;
    id v11 = &v12;
    AXPerformSafeBlock();
    id v4 = (id)v13[5];
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)MessageListCollectionViewCellAccessibility;
    id v4 = [(MessageListCollectionViewCellAccessibility *)&v6 _accessibilityLinkedUIElements];
  }

  return v4;
}

void __76__MessageListCollectionViewCellAccessibility__accessibilityLinkedUIElements__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F1CBC8] _applicationKeyWindow];
  id v13 = [v2 rootViewController];

  unint64_t v3 = [v13 childViewControllers];
  id v4 = [v3 firstObject];

  int v5 = [v4 viewControllers];
  objc_super v6 = [v5 lastObject];

  uint64_t v7 = [v6 topViewController];
  if ([v7 isViewLoaded])
  {
    uint64_t v8 = [MEMORY[0x263F81198] defaultVoiceOverOptions];
    [v8 setLeafNodePredicate:&__block_literal_global_715];
    objc_super v9 = [v7 view];
    uint64_t v10 = [v9 _accessibilityLeafDescendantsWithCount:1 options:v8];
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 4UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0) = v10;
  }
}

uint64_t __76__MessageListCollectionViewCellAccessibility__accessibilityLinkedUIElements__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isAccessibilityElement];
}

- (int64_t)_accessibilityScannerActivateBehavior
{
  unint64_t v3 = [(MessageListCollectionViewCellAccessibility *)self safeValueForKeyPath:@"cellHelper.cellView"];
  char v4 = [v3 safeBoolForKey:@"isEditing"];

  if (v4) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)MessageListCollectionViewCellAccessibility;
  return [(MessageListCollectionViewCellAccessibility *)&v6 _accessibilityScannerActivateBehavior];
}

- (BOOL)_accessibilityIsThreadedChildCell
{
  unint64_t v3 = [(MessageListCollectionViewCellAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_721 startWithSelf:0];
  LOBYTE(v11) = 0;
  objc_opt_class();
  char v4 = __UIAccessibilityCastAsClass();
  int v5 = [v4 indexPathForCell:self];
  objc_super v6 = [v4 safeValueForKey:@"delegate"];
  NSClassFromString(&cfstr_Messagelistvie_0.isa);
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    id v9 = v6;
    id v10 = v5;
    AXPerformSafeBlock();
    BOOL v7 = *((unsigned char *)v12 + 24) != 0;

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

uint64_t __79__MessageListCollectionViewCellAccessibility__accessibilityIsThreadedChildCell__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 accessibilityIdentifier];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F536B0]];

  return v3;
}

uint64_t __79__MessageListCollectionViewCellAccessibility__accessibilityIsThreadedChildCell__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _isExpandedIndexPath:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (unint64_t)_accessibilityThreadCount
{
  id v2 = [(MessageListCollectionViewCellAccessibility *)self safeValueForKeyPath:@"cellHelper.messageListItem"];
  unint64_t v3 = [v2 safeUnsignedIntegerForKey:@"count"];
  if (v3 <= 1) {
    unint64_t v4 = 0;
  }
  else {
    unint64_t v4 = v3;
  }

  return v4;
}

- (void)_axProcessMailLabel:(id)a3 children:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [NSString stringWithFormat:@"cellHelper.cellView.%@", v6];
  id v9 = [(MessageListCollectionViewCellAccessibility *)self safeValueForKeyPath:v8];
  id v10 = __UIAccessibilitySafeClass();

  [v10 setAccessibilityExposeLabelAsValue:1];
  [v7 axSafelyAddObject:v10];
}

- (id)_accessibilityThreadedDisclosureButton
{
  id v2 = [(MessageListCollectionViewCellAccessibility *)self safeValueForKeyPath:@"cellHelper.cellView.disclosureButton"];
  unint64_t v3 = __UIAccessibilitySafeClass();

  if ([v3 _accessibilityViewIsVisible]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)automationElements
{
  v10.receiver = self;
  v10.super_class = (Class)MessageListCollectionViewCellAccessibility;
  unint64_t v3 = [(MessageListCollectionViewCellAccessibility *)&v10 automationElements];
  id v4 = (void *)[v3 mutableCopy];
  int v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x263EFF980] array];
  }
  id v7 = v6;

  [(MessageListCollectionViewCellAccessibility *)self _axProcessMailLabel:@"secondaryLabel" children:v7];
  [(MessageListCollectionViewCellAccessibility *)self _axProcessMailLabel:@"dateLabel" children:v7];
  [(MessageListCollectionViewCellAccessibility *)self _axProcessMailLabel:@"primaryLabel" children:v7];
  [(MessageListCollectionViewCellAccessibility *)self _axProcessMailLabel:@"tertiaryLabel" children:v7];
  uint64_t v8 = [(MessageListCollectionViewCellAccessibility *)self _accessibilityThreadedDisclosureButton];
  [v7 axSafelyAddObject:v8];

  return v7;
}

- (id)_accessibilityEquivalenceTag
{
  unint64_t v3 = [(MessageListCollectionViewCellAccessibility *)self safeValueForKeyPath:@"cellHelper.messageListItem.displayMessageObjectID.stringHash"];
  id v4 = [(MessageListCollectionViewCellAccessibility *)self _accessibilityLabelWithoutAttributes];
  int v5 = [v3 description];

  if (v5)
  {
    id v6 = [v3 description];
    uint64_t v7 = [v4 stringByAppendingString:v6];

    id v4 = (void *)v7;
  }

  return v4;
}

- (id)_accessibilityLabelWithoutAttributes
{
  unint64_t v3 = [(MessageListCollectionViewCellAccessibility *)self safeValueForKeyPath:@"cellHelper.cellView.secondaryLabel"];
  id v4 = [v3 accessibilityLabel];

  int v5 = [(MessageListCollectionViewCellAccessibility *)self safeValueForKeyPath:@"cellHelper.cellView.primaryLabel"];
  id v6 = [v5 accessibilityLabel];

  uint64_t v7 = [v6 componentsSeparatedByString:@", "];
  unint64_t v8 = [v7 count];
  if (v8 >= 3) {
    uint64_t v9 = 3;
  }
  else {
    uint64_t v9 = v8;
  }
  objc_super v10 = objc_msgSend(v7, "subarrayWithRange:", 0, v9);

  uint64_t v11 = [v10 componentsJoinedByString:@", "];

  uint64_t v12 = [(MessageListCollectionViewCellAccessibility *)self safeValueForKeyPath:@"cellHelper.cellView.dateLabel"];
  v15 = [v12 accessibilityLabel];
  uint64_t v13 = __UIAXStringForVariables();

  return v13;
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)MessageListCollectionViewCellAccessibility;
  [(MessageListCollectionViewCellAccessibility *)&v7 layoutSubviews];
  [(MessageListCollectionViewCellAccessibility *)self setAccessibilityLabel:0];
  [(MessageListCollectionViewCellAccessibility *)self _axSetDisclosureButtonTraits];
  unint64_t v3 = [(MessageListCollectionViewCellAccessibility *)self _accessibilityMailboxController];
  uint64_t v4 = [v3 _axGetTriageActionForAnnouncement];

  if (v4)
  {
    [(MessageListCollectionViewCellAccessibility *)self _axPostAnnouncementForActionCompletionIfNecessary];
    int v5 = [(MessageListCollectionViewCellAccessibility *)self _accessibilityMailboxController];
    [v5 _axSetTriageActionForAnnouncement:0];
  }
  id v6 = [(MessageListCollectionViewCellAccessibility *)self _accessibilityThreadedDisclosureButton];
  [v6 setAccessibilityIdentifier:@"DisclosureButton"];
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)MessageListCollectionViewCellAccessibility;
  [(MessageListCollectionViewCellAccessibility *)&v5 prepareForReuse];
  [(MessageListCollectionViewCellAccessibility *)self _accessibilitySetRetainedValue:0 forKey:@"ApproximateVisibleSummary"];
  [(MessageListCollectionViewCellAccessibility *)self setAccessibilityLabel:0];
  uint64_t v4 = [(MessageListCollectionViewCellAccessibility *)self _accessibilityFindSubviewDescendant:&__block_literal_global_750];
  id v3 = v4;
  AXPerformSafeBlock();
}

uint64_t __61__MessageListCollectionViewCellAccessibility_prepareForReuse__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __61__MessageListCollectionViewCellAccessibility_prepareForReuse__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) resetView];
}

@end