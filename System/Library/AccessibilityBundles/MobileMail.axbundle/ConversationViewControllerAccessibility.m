@interface ConversationViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axSkipNextFocusOnMessage;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (id)_accessibilityFirstElementForFocus;
- (id)_accessibilityScrollAncestor;
- (id)_accessibilityTitleForLeadingActionWithCell:(id)a3;
- (id)_axAutomaticallyMarkReadTimer;
- (id)_axElementForFocusInCell:(id)a3 shouldAllowCollapsedCell:(BOOL)a4;
- (id)_axFirstVisibleCell;
- (id)_axFirstVisibleExpandedCell;
- (id)_axMessageSubjectView;
- (id)accessibilityCustomRotors;
- (id)arrowControlsView;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilityPerformLeadingActionWithCell:(id)a3;
- (void)_accessibilitySetConversationViewInsets;
- (void)_axCancelMarkAsReadTimer;
- (void)_axSetAutomaticallyMarkReadTimer:(id)a3;
- (void)_axSetSkipNextFocusOnMessage:(BOOL)a3;
- (void)_axSimulateTapArrowButtonWithDirection:(int)a3;
- (void)_scrollToInitialPosition;
- (void)_selectNextMessageCommandInvoked:(id)a3;
- (void)_selectPreviousMessageCommandInvoked:(id)a3;
- (void)_shrinkMessagesToBarButton:(id)a3 withInteraction:(id)a4 completionHandler:(id)a5;
- (void)_updateFooterViewFrameForCell:(id)a3 atIndexPath:(id)a4;
- (void)arrowControlsView:(id)a3 didTapButtonWithDirection:(int)a4;
- (void)cancelAutomaticMarkAsReadForCellViewModel:(id)a3;
- (void)invalidateAutomaticMarkAsReadForAllMessages;
- (void)messageViewController:(id)a3 didTapRevealActionsButton:(id)a4;
- (void)scheduleAutomaticMarkAsReadForMessage:(id)a3;
@end

@implementation ConversationViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ConversationViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_axSkipNextFocusOnMessage
{
  return MEMORY[0x270F09620](self, &__ConversationViewControllerAccessibility___axSkipNextFocusOnMessage);
}

- (void)_axSetSkipNextFocusOnMessage:(BOOL)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"ConversationViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationViewController", @"_scrollToInitialPosition", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationViewController", @"messageViewController:didTapRevealActionsButton:", "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationViewController", @"_visibleIndexPathForMessageViewController:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationViewController", @"invalidateAutomaticMarkAsReadForAllMessages", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationViewController", @"cancelAutomaticMarkAsReadForCellViewModel:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationViewController", @"scheduleAutomaticMarkAsReadForMessage:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationViewController", @"_shouldAutomaticallyMarkAsReadMessage:", "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationViewController", @"swipableCollectionViewLayout:leadingSwipeActionsConfigurationForItemAtIndexPath:", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationViewController", @"_referenceDisplayMessage", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationViewController", @"collectionViewDataSource", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationViewController", @"_messageAtIndexPath:", "@", "@", 0);
  [v3 validateClass:@"ConversationViewController" isKindOfClass:@"ConversationViewControllerBase"];
  [v3 validateClass:@"ConversationViewControllerBase" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationViewControllerBase", @"arrowControlsView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationViewControllerBase", @"deleteButtonItem", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationViewControllerBase", @"archiveButtonItem", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationViewControllerBase", @"moveButtonItem", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationViewControllerBase", @"replyButtonItem", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationViewControllerBase", @"collectionView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationViewControllerBase", @"_shrinkMessagesToBarButton:withInteraction:completionHandler:", "v", "@", "@", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationViewControllerBase", @"conversationSubject", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationViewControllerBase", @"arrowControlsView:didTapButtonWithDirection:", "v", "@", "i", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationViewControllerBase", @"conversationLayout", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationViewControllerBase", @"conversationHeaderView", "@", 0);
  [v3 validateClass:@"ConversationViewControllerBase" hasInstanceVariable:@"_conversationView" withType:"_MFConversationViewCollectionView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationViewControllerBase", @"displayMetrics", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationViewControllerBase", @"_updateFooterViewFrameForCell:atIndexPath:", "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationViewControllerBase", @"delegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationViewControllerBase", @"_selectNextMessageCommandInvoked:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationViewControllerBase", @"_selectPreviousMessageCommandInvoked:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationViewControllerBase", @"referenceMessageListItem", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFConversationViewCell", @"viewModel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationCellViewModel", @"messageLoadingContext", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationCellViewModel", @"messageContentRequest", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFMessageLoadingContext", @"messageBody", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFMessageLoadingContext", @"hasLoadedSomeContent", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFMessageLoadingContext", @"hasLoadedCompleteMessage", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFMessageLoadingContext", @"message", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessageContentRepresentationRequest", @"hasStarted", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessageContentRepresentationRequest", @"isFinished", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFMimeBody", @"totalTextSize", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFExpandedMessageCell", @"messageViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFMessageViewController", @"messageContentView", "@", 0);
  [v3 validateClass:@"MFMessageContentView" hasInstanceVariable:@"_footerView" withType:"MFConversationItemFooterView"];
  [v3 validateProtocol:@"EMMessageListItem" hasRequiredInstanceMethod:@"flags"];
  [v3 validateProtocol:@"EMMessageListItem" hasRequiredInstanceMethod:@"displayMessageItemID"];
  [v3 validateProtocol:@"EMMessageListItem" conformsToProtocol:@"EMCollectionItem"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIContextualAction", @"executePreHandlerWithView:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIContextualAction", @"executeHandlerWithView:completionHandler:", "v", "@", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationHeaderView", @"contentView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationHeaderContentView", @"textLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessageHeaderSubjectBlock", @"subjectTextView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFMessageDisplayMetrics", @"estimatedFooterViewHeight", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessageListViewController", @"conversationViewController:advanceToNextConversationWithDirection:", "v", "@", "i", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MUIMessageListViewController", @"collectionView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ECSubject", @"subjectString", "@", 0);
  [v3 validateClass:@"WKContentView"];
  [v3 validateClass:@"MFModernAddressAtom"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationViewControllerBase", @"barItemsManager", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MobileMail.ConversationNavigationBarItemsManager", @"revealActionsButtonItem", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v14.receiver = self;
  v14.super_class = (Class)ConversationViewControllerAccessibility;
  [(ConversationViewControllerAccessibility *)&v14 _accessibilityLoadAccessibilityInformation];
  id v3 = [(ConversationViewControllerAccessibility *)self safeValueForKey:@"deleteButtonItem"];
  v4 = [(ConversationViewControllerAccessibility *)self safeValueForKey:@"archiveButtonItem"];
  v5 = accessibilityLocalizedString(@"message.action.delete");
  [v3 setAccessibilityLabel:v5];

  v6 = accessibilityLocalizedString(@"archive.button");
  [v4 setAccessibilityLabel:v6];

  v7 = [(ConversationViewControllerAccessibility *)self safeValueForKey:@"moveButtonItem"];
  v8 = accessibilityLocalizedString(@"transfer.mail.button");
  [v7 setAccessibilityLabel:v8];

  v9 = [(ConversationViewControllerAccessibility *)self safeValueForKey:@"replyButtonItem"];
  v10 = accessibilityLocalizedString(@"reply.button");
  [v9 setAccessibilityLabel:v10];

  v11 = [(ConversationViewControllerAccessibility *)self safeValueForKeyPath:@"barItemsManager.revealActionsButtonItem"];
  v12 = accessibilityLocalizedString(@"reveal.more.button");
  [v11 setAccessibilityLabel:v12];

  v13 = [(ConversationViewControllerAccessibility *)self safeValueForKey:@"view"];
  [v13 _setAccessibilityLinkedUIElementsBlock:&__block_literal_global_1];

  [(ConversationViewControllerAccessibility *)self _accessibilitySetConversationViewInsets];
}

id __85__ConversationViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  v0 = (void *)MEMORY[0x263EFF8C0];
  v1 = AXMobileMailGetSelectedMessageCellElement();
  v2 = objc_msgSend(v0, "axArrayByIgnoringNilElementsWithCount:", 1, v1);

  return v2;
}

- (id)accessibilityCustomRotors
{
  v14[1] = *MEMORY[0x263EF8340];
  char v13 = 0;
  objc_opt_class();
  id v3 = [(ConversationViewControllerAccessibility *)self safeValueForKey:@"collectionView"];
  v4 = __UIAccessibilityCastAsClass();

  if ([v4 numberOfSections] < 1)
  {
    v5 = 0;
  }
  else
  {
    v5 = 0;
    if ([v4 numberOfItemsInSection:0] >= 2)
    {
      v6 = [(ConversationViewControllerAccessibility *)self _accessibilityValueForKey:@"MailConversationRotor"];
      if (!v6)
      {
        id v7 = objc_alloc(MEMORY[0x263F1C398]);
        v8 = accessibilityLocalizedString(@"thread.message.rotor.title");
        v10[0] = MEMORY[0x263EF8330];
        v10[1] = 3221225472;
        v10[2] = __68__ConversationViewControllerAccessibility_accessibilityCustomRotors__block_invoke;
        v10[3] = &unk_265133220;
        id v11 = v4;
        v12 = self;
        v6 = (void *)[v7 initWithName:v8 itemSearchBlock:v10];

        [(ConversationViewControllerAccessibility *)self _accessibilitySetRetainedValue:v6 forKey:@"MailConversationRotor"];
      }
      v14[0] = v6;
      v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
    }
  }

  return v5;
}

id __68__ConversationViewControllerAccessibility_accessibilityCustomRotors__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) numberOfSections] < 1) {
    uint64_t v4 = -1;
  }
  else {
    uint64_t v4 = [*(id *)(a1 + 32) numberOfItemsInSection:0] - 1;
  }
  v5 = [v3 currentItem];
  v6 = [v5 targetElement];

  id v7 = [v6 _accessibilityFindAncestor:&__block_literal_global_545 startWithSelf:1];
  uint64_t v8 = [*(id *)(a1 + 32) indexPathForCell:v7];
  if (!v8)
  {
    v9 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:0];
    goto LABEL_12;
  }
  v9 = (void *)v8;
  uint64_t v10 = [v3 searchDirection];
  uint64_t v11 = [v9 row];
  if (v10)
  {
    if (v11 >= v4) {
      goto LABEL_12;
    }
    v12 = (void *)MEMORY[0x263F088C8];
    uint64_t v13 = [v9 row] + 1;
  }
  else
  {
    if (v11 < 1) {
      goto LABEL_12;
    }
    v12 = (void *)MEMORY[0x263F088C8];
    uint64_t v13 = [v9 row] - 1;
  }
  uint64_t v14 = [v12 indexPathForRow:v13 inSection:0];

  v9 = (void *)v14;
LABEL_12:
  [*(id *)(a1 + 40) _axSetSkipNextFocusOnMessage:1];
  [*(id *)(a1 + 32) scrollToItemAtIndexPath:v9 atScrollPosition:1 animated:0];
  [*(id *)(a1 + 32) layoutIfNeeded];
  v15 = [*(id *)(a1 + 32) cellForItemAtIndexPath:v9];
  v16 = [*(id *)(a1 + 40) _axElementForFocusInCell:v15 shouldAllowCollapsedCell:1];
  if (v16) {
    v17 = (void *)[objc_alloc(MEMORY[0x263F1C3A0]) initWithTargetElement:v16 targetRange:0];
  }
  else {
    v17 = 0;
  }

  return v17;
}

uint64_t __68__ConversationViewControllerAccessibility_accessibilityCustomRotors__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Mfconversation_4.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_axElementForFocusInCell:(id)a3 shouldAllowCollapsedCell:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = [v5 safeValueForKey:@"viewModel"];
  id v7 = [v6 safeValueForKey:@"messageLoadingContext"];
  uint64_t v8 = v7;
  if (v7)
  {
    v9 = [v7 safeValueForKey:@"messageBody"];
    unint64_t v10 = [v9 safeUnsignedIntegerForKey:@"totalTextSize"];
    int v11 = [v8 safeBoolForKey:@"hasLoadedSomeContent"];
    int v12 = [v8 safeBoolForKey:@"hasLoadedCompleteMessage"];

    if (v10 < 2 || ((v12 | v11) & 1) == 0) {
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v13 = [v6 safeValueForKey:@"messageContentRequest"];
    if ([v13 safeBoolForKey:@"hasStarted"])
    {
    }
    else
    {
      int v14 = [v13 safeBoolForKey:@"isFinished"];

      if (!v14) {
        goto LABEL_12;
      }
    }
  }
  v15 = [v5 _accessibilityFindSubviewDescendant:&__block_literal_global_550];
  if ([v15 accessibilityElementCount] <= 0)
  {
  }
  else
  {
    id v16 = [v15 accessibilityElementAtIndex:0];

    if (v16) {
      goto LABEL_15;
    }
  }
LABEL_12:
  id v16 = [v5 _accessibilityFindSubviewDescendant:&__block_literal_global_552];
  if (!v16 && v4) {
    id v16 = v5;
  }
LABEL_15:

  return v16;
}

uint64_t __93__ConversationViewControllerAccessibility__axElementForFocusInCell_shouldAllowCollapsedCell___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Wkcontentview.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __93__ConversationViewControllerAccessibility__axElementForFocusInCell_shouldAllowCollapsedCell___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Mfmodernaddres.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_accessibilityFirstElementForFocus
{
  objc_opt_class();
  id v3 = [(ConversationViewControllerAccessibility *)self safeValueForKey:@"collectionView"];
  BOOL v4 = __UIAccessibilityCastAsClass();

  id v5 = [(ConversationViewControllerAccessibility *)self safeValueForKey:@"collectionViewDataSource"];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (-[ConversationViewControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", @"referenceMessageListItem.displayMessageItemID"), v6 = objc_claimAutoreleasedReturnValue(), [v5 indexPathForItemIdentifier:v6], id v7 = objc_claimAutoreleasedReturnValue(), v6, v7))
  {
    uint64_t v8 = [v4 cellForItemAtIndexPath:v7];
  }
  else
  {
    uint64_t v8 = [(ConversationViewControllerAccessibility *)self _axFirstVisibleExpandedCell];
  }
  v9 = [(ConversationViewControllerAccessibility *)self _axElementForFocusInCell:v8 shouldAllowCollapsedCell:0];

  return v9;
}

- (id)_axFirstVisibleExpandedCell
{
  objc_opt_class();
  id v3 = [(ConversationViewControllerAccessibility *)self safeValueForKey:@"collectionView"];
  BOOL v4 = __UIAccessibilityCastAsClass();

  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  id v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  id v5 = [v4 visibleCells];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __70__ConversationViewControllerAccessibility__axFirstVisibleExpandedCell__block_invoke;
  v11[3] = &unk_265133248;
  v11[4] = &v12;
  [v5 enumerateObjectsUsingBlock:v11];

  v6 = (void *)v13[5];
  if (!v6)
  {
    uint64_t v7 = [(ConversationViewControllerAccessibility *)self _axFirstVisibleCell];
    uint64_t v8 = (void *)v13[5];
    v13[5] = v7;

    v6 = (void *)v13[5];
  }
  id v9 = v6;
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __70__ConversationViewControllerAccessibility__axFirstVisibleExpandedCell__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  NSClassFromString(&cfstr_Mfexpandedmess_0.isa);
  if (objc_opt_isKindOfClass())
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)_axFirstVisibleCell
{
  objc_opt_class();
  id v3 = [(ConversationViewControllerAccessibility *)self safeValueForKey:@"collectionView"];
  BOOL v4 = __UIAccessibilityCastAsClass();

  [v4 bounds];
  uint64_t v6 = v5;
  double v8 = v7;
  [v4 contentOffset];
  double v10 = v9;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  int v11 = [v4 visibleCells];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  void v14[2] = __62__ConversationViewControllerAccessibility__axFirstVisibleCell__block_invoke;
  v14[3] = &unk_265133270;
  v14[5] = v6;
  *(double *)&v14[6] = v10;
  *(double *)&v14[7] = v8;
  *(double *)&v14[8] = v10 + v8;
  v14[4] = &v15;
  [v11 enumerateObjectsUsingBlock:v14];

  id v12 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v12;
}

void __62__ConversationViewControllerAccessibility__axFirstVisibleCell__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  [v11 frame];
  v13.origin.x = v7;
  v13.origin.y = v8;
  v13.size.width = v9;
  v13.size.height = v10;
  if (CGRectIntersectsRect(*(CGRect *)(a1 + 40), v13))
  {
    *a4 = 1;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  uint64_t v5 = [(ConversationViewControllerAccessibility *)self safeValueForKey:@"_conversationView"];
  uint64_t v6 = v5;
  switch(a3)
  {
    case 1:
    case 6:
      BOOL v7 = 1;
      [(ConversationViewControllerAccessibility *)self _axSimulateTapArrowButtonWithDirection:1];
      break;
    case 2:
    case 5:
      [(ConversationViewControllerAccessibility *)self _axSimulateTapArrowButtonWithDirection:0xFFFFFFFFLL];
      BOOL v7 = 1;
      break;
    case 3:
      char v8 = [v5 accessibilityScrollUpPage];
      goto LABEL_7;
    case 4:
      char v8 = [v5 accessibilityScrollDownPage];
LABEL_7:
      BOOL v7 = v8;
      break;
    default:
      BOOL v7 = 0;
      break;
  }

  return v7;
}

- (id)_accessibilityScrollAncestor
{
  return (id)[(ConversationViewControllerAccessibility *)self safeValueForKey:@"_conversationView"];
}

- (void)_axSimulateTapArrowButtonWithDirection:(int)a3
{
}

void __82__ConversationViewControllerAccessibility__axSimulateTapArrowButtonWithDirection___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) safeValueForKey:@"delegate"];
  [v2 conversationViewController:*(void *)(a1 + 32) advanceToNextConversationWithDirection:*(unsigned int *)(a1 + 40)];
}

void __82__ConversationViewControllerAccessibility__axSimulateTapArrowButtonWithDirection___block_invoke_2(uint64_t a1)
{
  UIAccessibilityNotifications v1 = *MEMORY[0x263F1CE68];
  id v2 = [*(id *)(a1 + 32) _axMessageSubjectView];
  UIAccessibilityPostNotification(v1, v2);
}

- (id)_axMessageSubjectView
{
  id v3 = [(ConversationViewControllerAccessibility *)self safeValueForKey:@"_conversationView"];
  BOOL v4 = [v3 _accessibilityFindSubviewDescendant:&__block_literal_global_561];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 safeValueForKey:@"subjectTextView"];
  }
  else
  {
    BOOL v7 = [(ConversationViewControllerAccessibility *)self safeValueForKey:@"conversationHeaderView"];
    char v8 = [v7 safeValueForKey:@"contentView"];
    uint64_t v6 = [v8 safeValueForKey:@"textLabel"];
  }

  return v6;
}

uint64_t __64__ConversationViewControllerAccessibility__axMessageSubjectView__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Messageheaders.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_accessibilityPerformLeadingActionWithCell:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  uint64_t v5 = [(ConversationViewControllerAccessibility *)self safeValueForKey:@"collectionView"];
  uint64_t v6 = __UIAccessibilityCastAsClass();

  BOOL v7 = [v6 indexPathForCell:v4];
  char v8 = [(ConversationViewControllerAccessibility *)self safeValueForKey:@"conversationLayout"];
  char v24 = 0;
  objc_opt_class();
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  id v9 = v8;
  id v10 = v7;
  AXPerformSafeBlock();
  id v11 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  id v12 = __UIAccessibilityCastAsClass();

  if (v24) {
    abort();
  }
  CGRect v13 = [v12 actions];
  uint64_t v14 = [v13 firstObject];

  uint64_t v17 = v4;
  id v15 = v4;
  id v16 = v14;
  AXPerformSafeBlock();
}

uint64_t __86__ConversationViewControllerAccessibility__accessibilityPerformLeadingActionWithCell___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [*(id *)(a1 + 32) swipableCollectionViewLayout:*(void *)(a1 + 40) leadingSwipeActionsConfigurationForItemAtIndexPath:*(void *)(a1 + 48)];

  return MEMORY[0x270F9A758]();
}

uint64_t __86__ConversationViewControllerAccessibility__accessibilityPerformLeadingActionWithCell___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) executePreHandlerWithView:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 executeHandlerWithView:v3 completionHandler:&__block_literal_global_565];
}

void __86__ConversationViewControllerAccessibility__accessibilityPerformLeadingActionWithCell___block_invoke_3()
{
}

- (void)_scrollToInitialPosition
{
  v6.receiver = self;
  v6.super_class = (Class)ConversationViewControllerAccessibility;
  [(ConversationViewControllerAccessibility *)&v6 _scrollToInitialPosition];
  if ([(ConversationViewControllerAccessibility *)self _axSkipNextFocusOnMessage])
  {
    [(ConversationViewControllerAccessibility *)self _axSetSkipNextFocusOnMessage:0];
  }
  else
  {
    objc_opt_class();
    uint64_t v3 = __UIAccessibilityCastAsClass();
    id v4 = [v3 view];
    int v5 = [v4 _accessibilityViewIsVisible];

    if (v5) {
      AXPerformBlockOnMainThreadAfterDelay();
    }
  }
}

void __67__ConversationViewControllerAccessibility__scrollToInitialPosition__block_invoke(uint64_t a1)
{
  UIAccessibilityNotifications v1 = [*(id *)(a1 + 32) _accessibilityFirstElementForFocus];

  if (v1)
  {
    UIAccessibilityNotifications v2 = *MEMORY[0x263F1CE68];
    UIAccessibilityPostNotification(v2, 0);
  }
}

- (void)_shrinkMessagesToBarButton:(id)a3 withInteraction:(id)a4 completionHandler:(id)a5
{
  v5.receiver = self;
  v5.super_class = (Class)ConversationViewControllerAccessibility;
  [(ConversationViewControllerAccessibility *)&v5 _shrinkMessagesToBarButton:a3 withInteraction:a4 completionHandler:a5];
  AXPerformBlockOnMainThreadAfterDelay();
}

void __104__ConversationViewControllerAccessibility__shrinkMessagesToBarButton_withInteraction_completionHandler___block_invoke(uint64_t a1)
{
  UIAccessibilityNotifications v1 = [*(id *)(a1 + 32) safeValueForKey:@"conversationSubject"];
  id v5 = [v1 safeValueForKey:@"subjectString"];

  if (v5)
  {
    UIAccessibilityNotifications v2 = NSString;
    uint64_t v3 = accessibilityLocalizedString(@"now.showing.message");
    id v4 = objc_msgSend(v2, "stringWithFormat:", v3, v5);

    UIAccessibilitySpeakAndDoNotBeInterrupted();
  }
}

- (id)arrowControlsView
{
  v5.receiver = self;
  v5.super_class = (Class)ConversationViewControllerAccessibility;
  uint64_t v3 = [(ConversationViewControllerAccessibility *)&v5 arrowControlsView];
  [(ConversationViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];

  return v3;
}

- (void)arrowControlsView:(id)a3 didTapButtonWithDirection:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  [(ConversationViewControllerAccessibility *)self _axSetSkipNextFocusOnMessage:1];
  v7.receiver = self;
  v7.super_class = (Class)ConversationViewControllerAccessibility;
  [(ConversationViewControllerAccessibility *)&v7 arrowControlsView:v6 didTapButtonWithDirection:v4];

  AXPerformBlockOnMainThreadAfterDelay();
}

void __87__ConversationViewControllerAccessibility_arrowControlsView_didTapButtonWithDirection___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) _axMessageSubjectView];
  UIAccessibilityNotifications v1 = [v4 accessibilityLabel];
  uint64_t v3 = [v4 accessibilityValue];
  UIAccessibilityNotifications v2 = __AXStringForVariables();
  UIAccessibilitySpeak();
}

- (void)_selectNextMessageCommandInvoked:(id)a3
{
  id v4 = a3;
  [(ConversationViewControllerAccessibility *)self _axSetSkipNextFocusOnMessage:1];
  v12.receiver = self;
  v12.super_class = (Class)ConversationViewControllerAccessibility;
  [(ConversationViewControllerAccessibility *)&v12 _selectNextMessageCommandInvoked:v4];
  objc_opt_class();
  objc_super v5 = [(ConversationViewControllerAccessibility *)self safeValueForKey:@"delegate"];
  id v6 = [v5 safeValueForKey:@"collectionView"];
  objc_super v7 = __UIAccessibilityCastAsClass();

  UIAccessibilityNotifications v8 = *MEMORY[0x263F812F8];
  id v9 = [v7 indexPathsForSelectedItems];
  id v10 = [v9 firstObject];
  id v11 = [v7 cellForItemAtIndexPath:v10];
  UIAccessibilityPostNotification(v8, v11);
}

- (void)_selectPreviousMessageCommandInvoked:(id)a3
{
  id v4 = a3;
  [(ConversationViewControllerAccessibility *)self _axSetSkipNextFocusOnMessage:1];
  v12.receiver = self;
  v12.super_class = (Class)ConversationViewControllerAccessibility;
  [(ConversationViewControllerAccessibility *)&v12 _selectPreviousMessageCommandInvoked:v4];
  objc_opt_class();
  objc_super v5 = [(ConversationViewControllerAccessibility *)self safeValueForKey:@"delegate"];
  id v6 = [v5 safeValueForKey:@"collectionView"];
  objc_super v7 = __UIAccessibilityCastAsClass();

  UIAccessibilityNotifications v8 = *MEMORY[0x263F812F8];
  id v9 = [v7 indexPathsForSelectedItems];
  id v10 = [v9 lastObject];
  id v11 = [v7 cellForItemAtIndexPath:v10];
  UIAccessibilityPostNotification(v8, v11);
}

- (void)messageViewController:(id)a3 didTapRevealActionsButton:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)ConversationViewControllerAccessibility;
  [(ConversationViewControllerAccessibility *)&v23 messageViewController:v6 didTapRevealActionsButton:v7];
  char v22 = 0;
  objc_opt_class();
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  uint64_t v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  uint64_t v15 = MEMORY[0x263EF8330];
  id v8 = v6;
  AXPerformSafeBlock();
  id v9 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  id v10 = __UIAccessibilityCastAsClass();

  if (v22) {
    goto LABEL_6;
  }
  if (v10)
  {
    LOBYTE(v16) = 0;
    objc_opt_class();
    id v11 = [(ConversationViewControllerAccessibility *)self safeValueForKey:@"collectionView", v15, 3221225472, __91__ConversationViewControllerAccessibility_messageViewController_didTapRevealActionsButton___block_invoke, &unk_265133330, self];
    objc_super v12 = __UIAccessibilityCastAsClass();

    if (!(_BYTE)v16)
    {
      CGRect v13 = [v12 cellForItemAtIndexPath:v10];
      uint64_t v14 = [v13 _accessibilityFindSubviewDescendant:&__block_literal_global_589];
      UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], v14);

      goto LABEL_5;
    }
LABEL_6:
    abort();
  }
LABEL_5:
}

uint64_t __91__ConversationViewControllerAccessibility_messageViewController_didTapRevealActionsButton___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 4UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0) = [*(id *)(a1 + 32) _visibleIndexPathForMessageViewController:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

uint64_t __91__ConversationViewControllerAccessibility_messageViewController_didTapRevealActionsButton___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_axAutomaticallyMarkReadTimer
{
}

- (void)_axSetAutomaticallyMarkReadTimer:(id)a3
{
}

- (void)invalidateAutomaticMarkAsReadForAllMessages
{
  v3.receiver = self;
  v3.super_class = (Class)ConversationViewControllerAccessibility;
  [(ConversationViewControllerAccessibility *)&v3 invalidateAutomaticMarkAsReadForAllMessages];
  [(ConversationViewControllerAccessibility *)self _axCancelMarkAsReadTimer];
}

- (void)cancelAutomaticMarkAsReadForCellViewModel:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ConversationViewControllerAccessibility;
  [(ConversationViewControllerAccessibility *)&v4 cancelAutomaticMarkAsReadForCellViewModel:a3];
  [(ConversationViewControllerAccessibility *)self _axCancelMarkAsReadTimer];
}

- (void)_axCancelMarkAsReadTimer
{
  id v3 = [(ConversationViewControllerAccessibility *)self _axAutomaticallyMarkReadTimer];
  [v3 cancel];
  [(ConversationViewControllerAccessibility *)self _axSetAutomaticallyMarkReadTimer:0];
}

- (void)scheduleAutomaticMarkAsReadForMessage:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)ConversationViewControllerAccessibility;
  [(ConversationViewControllerAccessibility *)&v22 scheduleAutomaticMarkAsReadForMessage:v4];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  CGRect v13 = __81__ConversationViewControllerAccessibility_scheduleAutomaticMarkAsReadForMessage___block_invoke;
  uint64_t v14 = &unk_265133330;
  uint64_t v17 = &v18;
  uint64_t v15 = self;
  id v5 = v4;
  id v16 = v5;
  AXPerformSafeBlock();
  int v6 = *((unsigned __int8 *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  if (v6)
  {
    id v7 = [(ConversationViewControllerAccessibility *)self _axAutomaticallyMarkReadTimer];
    [v7 cancel];
    if (!v7)
    {
      id v8 = objc_alloc(MEMORY[0x263F21398]);
      id v7 = (void *)[v8 initWithTargetSerialQueue:MEMORY[0x263EF83A0]];
      [(ConversationViewControllerAccessibility *)self _axSetAutomaticallyMarkReadTimer:v7];
    }
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __81__ConversationViewControllerAccessibility_scheduleAutomaticMarkAsReadForMessage___block_invoke_2;
    v9[3] = &unk_265133308;
    v9[4] = self;
    id v10 = v5;
    [v7 afterDelay:v9 processBlock:0.7];
  }
}

uint64_t __81__ConversationViewControllerAccessibility_scheduleAutomaticMarkAsReadForMessage___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _shouldAutomaticallyMarkAsReadMessage:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void __81__ConversationViewControllerAccessibility_scheduleAutomaticMarkAsReadForMessage___block_invoke_2(uint64_t a1)
{
  char v10 = 0;
  objc_opt_class();
  id v2 = [*(id *)(a1 + 32) safeValueForKey:@"collectionView"];
  id v3 = __UIAccessibilityCastAsClass();

  id v4 = [v3 visibleCells];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __81__ConversationViewControllerAccessibility_scheduleAutomaticMarkAsReadForMessage___block_invoke_3;
  v7[3] = &unk_265133358;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v9 = v6;
  [v4 enumerateObjectsUsingBlock:v7];
  [*(id *)(a1 + 32) _axSetAutomaticallyMarkReadTimer:0];
}

void __81__ConversationViewControllerAccessibility_scheduleAutomaticMarkAsReadForMessage___block_invoke_3(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [v8 safeValueForKeyPath:@"viewModel.messageLoadingContext.message"];
  if (v3 == *(void **)(a1 + 32))
  {
    NSClassFromString(&cfstr_Mfexpandedmess_0.isa);
    if (objc_opt_isKindOfClass())
    {
      id v4 = [v8 safeValueForKey:@"messageViewController"];
      id v5 = [v4 safeValueForKey:@"messageContentView"];
      uint64_t v6 = [v5 safeValueForKey:@"_footerView"];

      if (objc_opt_respondsToSelector())
      {
        id v7 = [*(id *)(a1 + 40) _accessibilityTitleForLeadingActionWithCell:v8];
        [v6 _accessibilityUpdateLeadingActionTitle:v7];
      }
    }
  }
}

- (id)_accessibilityTitleForLeadingActionWithCell:(id)a3
{
  id v4 = a3;
  LOBYTE(v22) = 0;
  objc_opt_class();
  id v5 = [(ConversationViewControllerAccessibility *)self safeValueForKey:@"collectionView"];
  uint64_t v6 = __UIAccessibilityCastAsClass();

  id v7 = [v6 indexPathForCell:v4];
  if (v7)
  {
    char v28 = 0;
    objc_opt_class();
    uint64_t v22 = 0;
    objc_super v23 = &v22;
    uint64_t v24 = 0x3032000000;
    v25 = __Block_byref_object_copy_;
    v26 = __Block_byref_object_dispose_;
    id v27 = 0;
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    uint64_t v18 = __87__ConversationViewControllerAccessibility__accessibilityTitleForLeadingActionWithCell___block_invoke;
    v19 = &unk_265133330;
    uint64_t v20 = self;
    id v21 = v7;
    AXPerformSafeBlock();
    id v8 = (id)v23[5];

    _Block_object_dispose(&v22, 8);
    uint64_t v9 = __UIAccessibilityCastAsClass();

    if (v28) {
      abort();
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  char v10 = objc_msgSend(v9, "flags", v16, v17, v18, v19, v20);
  int v11 = [v10 read];
  if (v9) {
    int v12 = v11;
  }
  else {
    int v12 = 1;
  }
  if (v12) {
    CGRect v13 = @"message.action.mark.unread";
  }
  else {
    CGRect v13 = @"message.action.mark.read";
  }
  uint64_t v14 = accessibilityLocalizedString(v13);

  return v14;
}

uint64_t __87__ConversationViewControllerAccessibility__accessibilityTitleForLeadingActionWithCell___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 4UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0) = [*(id *)(a1 + 32) _messageAtIndexPath:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

- (void)_updateFooterViewFrameForCell:(id)a3 atIndexPath:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)ConversationViewControllerAccessibility;
  [(ConversationViewControllerAccessibility *)&v5 _updateFooterViewFrameForCell:a3 atIndexPath:a4];
  [(ConversationViewControllerAccessibility *)self _accessibilitySetConversationViewInsets];
}

- (void)_accessibilitySetConversationViewInsets
{
  id v10 = [(ConversationViewControllerAccessibility *)self safeValueForKey:@"_conversationView"];
  [v10 _accessibilityNavigationControllerInset];
  double v4 = v3;
  double v6 = v5;
  id v7 = [(ConversationViewControllerAccessibility *)self safeValueForKey:@"displayMetrics"];
  [v7 safeCGFloatForKey:@"estimatedFooterViewHeight"];
  double v9 = v8;

  objc_msgSend(v10, "_accessibilitySetNavigationControllerInset:", v9 + v9, v4, v9 * 3.0, v6);
}

@end