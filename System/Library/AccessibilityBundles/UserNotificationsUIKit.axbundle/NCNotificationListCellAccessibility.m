@interface NCNotificationListCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsAwayAlertElement;
- (BOOL)_accessibilityIsSpeakThisElement;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)_axIsCollapsedGroup;
- (BOOL)_axIsInCollapsedStack;
- (BOOL)_axIsLeadingView;
- (BOOL)accessibilityActivate;
- (BOOL)accessibilityElementsHidden;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityCellActions;
- (id)_accessibilityCellButtons;
- (id)_accessibilityListViewParent;
- (id)_accessibilityOpenAction;
- (id)_accessibilitySupplementaryFooterViews;
- (id)_axLookView;
- (id)_axNCNotificationViewController;
- (id)accessibilityCustomActions;
- (id)accessibilityDragSourceDescriptors;
- (id)accessibilityHint;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)automationElements;
- (id)axCustomActionsForActions:(id)a3;
- (unint64_t)accessibilityTraits;
- (void)_axLookView;
@end

@implementation NCNotificationListCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NCNotificationListCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"NCNotificationViewController"];
  [v3 validateClass:@"NCNotificationShortLookView"];
  [v3 validateClass:@"NCNotificationRichShortLookView"];
  [v3 validateClass:@"NCNotificationShortLookViewController"];
  [v3 validateClass:@"NCNotificationListView"];
  [v3 validateProtocol:@"NCAuxiliaryOptionsSupporting" hasRequiredInstanceMethod:@"auxiliaryOptionButtons"];
  [v3 validateClass:@"NCAuxiliaryOptionsView" conformsToProtocol:@"NCAuxiliaryOptionsSupporting"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UILabel", @"text", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationListCell", @"contentViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationListCell", @"actionProvider", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationShortLookViewController", @"clickPresentationInteractionManager", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationGroupList", @"sectionIdentifier", "@", 0);
  [v3 validateClass:@"PLPlatterHeaderContentView" hasInstanceVariable:@"_dateLabel" withType:"UILabel<BSUIDateLabel>"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationViewController", @"_lookView", "@", 0);
  [v3 validateClass:@"NCNotificationShortLookView" hasInstanceVariable:@"_auxiliaryOptionsView" withType:"NCAuxiliaryOptionsView"];
  [v3 validateClass:@"NCAuxiliaryOptionsView" hasInstanceVariable:@"_optionsSummaryLabel" withType:"UILabel"];
  [v3 validateClass:@"NCNotificationCombinedSectionList" isKindOfClass:@"NCNotificationStructuredSectionList"];
  [v3 validateProtocol:@"NCNotificationStaticContentAccepting" hasOptionalInstanceMethod:@"title"];
  [v3 validateProtocol:@"NCNotificationStaticContentAccepting" hasOptionalInstanceMethod:@"contentSummaryText"];
  [v3 validateProtocol:@"NCNotificationStaticContentAccepting" hasRequiredInstanceMethod:@"date"];
  [v3 validateProtocol:@"NCNotificationStaticContentAccepting" hasRequiredInstanceMethod:@"primaryText"];
  [v3 validateProtocol:@"NCNotificationStaticContentAccepting" hasRequiredInstanceMethod:@"primarySubtitleText"];
  [v3 validateProtocol:@"NCNotificationStaticContentAccepting" hasRequiredInstanceMethod:@"secondaryText"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PLClickPresentationInteractionManager", @"clickPresentationInteractionShouldBegin:", "B", "@", 0);
  [v3 validateClass:@"BSUIDefaultDateLabel"];
  [v3 validateClass:@"BSUIRelativeDateLabel"];
  [v3 validateProtocol:@"NCNotificationListCellActionProviding" hasRequiredInstanceMethod:@"supplementaryActionsForNotificationListCell:"];
  [v3 validateProtocol:@"NCNotificationListCellActionProviding" hasRequiredInstanceMethod:@"defaultActionForNotificationListCell:"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIAction", @"identifier", "@", 0);
  [v3 validateClass:@"NCNotificationListCell" hasInstanceVariable:@"_swipeInteraction" withType:"PLSwipeInteraction"];
  [v3 validateClass:@"PLSwipeInteraction" hasInstanceVariable:@"_actionButtonsPresentingView" withType:"PLActionButtonsPresentingView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PLActionButtonsPresentingView", @"actionButtonsView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PLPlatterActionButtonsView", @"buttonsStackView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationViewController", @"notificationRequest", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationListCell", @"contentView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationListView", @"isGrouped", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationListView", @"count", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationListView", @"dataSource", "@", 0);
  [v3 validateClass:@"NCNotificationGroupList"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationStructuredSectionList", @"isNotificationGroupListInCollapsedStack:", "B", "@", 0);
  [v3 validateClass:@"NCNotificationListView" conformsToProtocol:@"NCNotificationListViewProtocol"];
  [v3 validateProtocol:@"NCNotificationListViewProtocol" hasRequiredInstanceMethod:@"visibleViewAtIndex:"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationListView", @"model", "@", 0);
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  if ([(NCNotificationListCellAccessibility *)self _axIsCollapsedGroup]
    || [(NCNotificationListCellAccessibility *)self _axIsInCollapsedStack])
  {
    AXPerformBlockOnMainThreadAfterDelay();
    v7.receiver = self;
    v7.super_class = (Class)NCNotificationListCellAccessibility;
    return [(NCNotificationListCellAccessibility *)&v7 accessibilityActivate];
  }
  else
  {
    v4 = [(NCNotificationListCellAccessibility *)self _accessibilityOpenAction];
    v5 = v4;
    if (v4)
    {
      id v6 = v4;
      AXPerformSafeBlock();
    }
    return 1;
  }
}

void __60__NCNotificationListCellAccessibility_accessibilityActivate__block_invoke()
{
  UIAccessibilityNotifications v0 = *MEMORY[0x263F1CDC8];
  accessibilityLocalizedString(@"notification.expanded");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v0, v1);
}

uint64_t __60__NCNotificationListCellAccessibility_accessibilityActivate__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) performWithSender:0 target:0];
}

- (id)accessibilityCustomActions
{
  v19[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  v4 = [(NCNotificationListCellAccessibility *)self _accessibilityCellActions];
  v5 = v4;
  if (v4
    && (uint64_t v6 = [v4 indexOfObjectPassingTest:&__block_literal_global_466], v6 != 0x7FFFFFFFFFFFFFFFLL))
  {
    uint64_t v8 = v6;
    objc_super v7 = [v5 objectAtIndex:v6];

    if (v7)
    {
      v9 = [v5 objectAtIndex:v8];
      v19[0] = v9;
      v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
      v11 = [(NCNotificationListCellAccessibility *)self axCustomActionsForActions:v10];
      objc_super v7 = [v11 firstObject];
    }
  }
  else
  {
    objc_super v7 = 0;
    uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __65__NCNotificationListCellAccessibility_accessibilityCustomActions__block_invoke_2;
  v18[3] = &__block_descriptor_40_e25_B32__0__UIAction_8Q16_B24l;
  v18[4] = v8;
  v12 = objc_msgSend(v5, "ax_filteredArrayUsingBlock:", v18);
  v13 = [(NCNotificationListCellAccessibility *)self axCustomActionsForActions:v12];
  [v3 axSafelyAddObjectsFromArray:v13];

  v14 = [(NCNotificationListCellAccessibility *)self _axLookView];
  v15 = [v14 accessibilityCustomActions];

  v16 = objc_msgSend(v15, "ax_filteredArrayUsingBlock:", &__block_literal_global_471);

  [v3 axSafelyAddObjectsFromArray:v16];
  [v3 axSafelyAddObject:v7];

  return v3;
}

uint64_t __65__NCNotificationListCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 safeValueForKey:@"identifier"];
  if ([v3 isEqualToString:@"NotificationListCellActionIdentifierClear"])
  {
    uint64_t v4 = 1;
  }
  else
  {
    v5 = [v2 safeValueForKey:@"identifier"];
    uint64_t v4 = [v5 isEqualToString:@"NCNotificationGroupListActionIdentifierClear"];
  }
  return v4;
}

BOOL __65__NCNotificationListCellAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return *(void *)(a1 + 32) != a3;
}

uint64_t __65__NCNotificationListCellAccessibility_accessibilityCustomActions__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = [a2 accessibilityIdentifier];
  uint64_t v3 = [v2 isEqualToString:@"AXNotificationDismissAction"] ^ 1;

  return v3;
}

- (id)accessibilityDragSourceDescriptors
{
  return (id)MEMORY[0x263EFFA68];
}

- (BOOL)_accessibilityIsAwayAlertElement
{
  id v2 = [(NCNotificationListCellAccessibility *)self _axNCNotificationViewController];
  MEMORY[0x2456680B0](@"NCNotificationViewController");
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [v2 safeValueForKey:@"notificationRequest"];
    uint64_t v4 = [v3 sectionIdentifier];
  }
  else
  {
    uint64_t v4 = 0;
  }
  char v5 = [v4 isEqualToString:@"com.apple.donotdisturb"] ^ 1;

  return v5;
}

- (BOOL)isAccessibilityElement
{
  if ([(NCNotificationListCellAccessibility *)self _axIsInCollapsedStack])
  {
    return [(NCNotificationListCellAccessibility *)self _axIsLeadingView];
  }
  else
  {
    uint64_t v4 = [(NCNotificationListCellAccessibility *)self _axLookView];
    BOOL v5 = v4 != 0;

    return v5;
  }
}

- (BOOL)accessibilityElementsHidden
{
  BOOL v3 = [(NCNotificationListCellAccessibility *)self _axIsInCollapsedStack];
  if (v3)
  {
    if (AXDoesRequestingClientDeserveAutomation()) {
      LOBYTE(v3) = 0;
    }
    else {
      LOBYTE(v3) = ![(NCNotificationListCellAccessibility *)self _axIsLeadingView];
    }
  }
  return v3;
}

- (BOOL)_accessibilityIsSpeakThisElement
{
  return 1;
}

- (id)accessibilityHint
{
  if ([(NCNotificationListCellAccessibility *)self _axIsInCollapsedStack])
  {
    BOOL v3 = [(NCNotificationListCellAccessibility *)self _accessibilityFindViewAncestor:&__block_literal_global_480 startWithSelf:1];
    if ([v3 count] > 1)
    {
      uint64_t v4 = accessibilityLocalizedString(@"notification.cell.collapsed.hint");
      goto LABEL_6;
    }
  }
  BOOL v3 = [(NCNotificationListCellAccessibility *)self _axLookView];
  uint64_t v4 = [v3 accessibilityHint];
LABEL_6:
  BOOL v5 = (void *)v4;

  return v5;
}

uint64_t __56__NCNotificationListCellAccessibility_accessibilityHint__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x2456680B0](@"NCNotificationListView");
  if (objc_opt_isKindOfClass())
  {
    BOOL v3 = [v2 model];
    uint64_t v4 = [v3 isEqualToString:@"NCNotificationStructuredSectionList"];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)_axLookView
{
  id v2 = [(NCNotificationListCellAccessibility *)self _axNCNotificationViewController];
  MEMORY[0x2456680B0](@"NCNotificationViewController");
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = 0;
    uint64_t v8 = &v7;
    uint64_t v9 = 0x3032000000;
    v10 = __Block_byref_object_copy_;
    v11 = __Block_byref_object_dispose_;
    id v12 = 0;
    id v6 = v2;
    AXPerformSafeBlock();
    id v3 = (id)v8[5];

    _Block_object_dispose(&v7, 8);
  }
  else
  {
    uint64_t v4 = AXLogUI();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      [(NCNotificationListCellAccessibility *)(uint64_t)v2 _axLookView];
    }

    id v3 = 0;
  }

  return v3;
}

uint64_t __50__NCNotificationListCellAccessibility__axLookView__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _lookView];

  return MEMORY[0x270F9A758]();
}

- (id)_axNCNotificationViewController
{
  return (id)[(NCNotificationListCellAccessibility *)self safeValueForKey:@"contentViewController"];
}

- (BOOL)_axIsCollapsedGroup
{
  objc_opt_class();
  id v2 = __UIAccessibilityCastAsClass();
  id v3 = [v2 superview];

  if ([v3 safeBoolForKey:@"isGrouped"]) {
    BOOL v4 = (unint64_t)[v3 safeUnsignedIntegerForKey:@"count"] > 1;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)_accessibilityListViewParent
{
  objc_opt_class();
  id v2 = __UIAccessibilityCastAsClass();
  id v3 = [v2 superview];

  MEMORY[0x2456680B0](@"NCNotificationListView");
  if (objc_opt_isKindOfClass()) {
    BOOL v4 = v3;
  }
  else {
    BOOL v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)accessibilityLabel
{
  id v3 = [(NCNotificationListCellAccessibility *)self _axLookView];
  MEMORY[0x2456680B0](@"NCNotificationRichShortLookView");
  if (objc_opt_isKindOfClass())
  {
    BOOL v4 = [v3 accessibilityLabel];
    id v5 = [v3 safeStringForKey:@"primaryText"];
    id v6 = [v3 safeStringForKey:@"primarySubtitleText"];
    uint64_t v7 = [v3 safeStringForKey:@"secondaryText"];
    uint64_t v8 = [(NCNotificationListCellAccessibility *)self _accessibilityDescendantOfType:MEMORY[0x2456680B0](@"BSUIRelativeDateLabel")];
    uint64_t v9 = v8;
    if (!v8)
    {
      v21 = [(NCNotificationListCellAccessibility *)self _accessibilityDescendantOfType:MEMORY[0x2456680B0](@"BSUIDefaultDateLabel")];
      v10 = v21;
      if (v21)
      {
        v22 = [v21 accessibilityLabel];
        v11 = __UIAXStringForVariables();
      }
      else
      {
        v11 = 0;
      }
      goto LABEL_8;
    }
    v10 = [v8 accessibilityLabel];
  }
  else
  {
    MEMORY[0x2456680B0](@"NCNotificationShortLookView");
    if (objc_opt_isKindOfClass())
    {
      v11 = [v3 accessibilityLabel];
      goto LABEL_9;
    }
    objc_opt_class();
    id v12 = [v3 safeValueForKey:@"title"];
    BOOL v4 = __UIAccessibilityCastAsClass();

    objc_opt_class();
    v13 = [v3 safeValueForKey:@"date"];
    v14 = __UIAccessibilityCastAsClass();

    id v5 = AXDateStringForFormat();

    objc_opt_class();
    v15 = [v3 safeValueForKey:@"primaryText"];
    id v6 = __UIAccessibilityCastAsClass();

    objc_opt_class();
    v16 = [v3 safeValueForKeyPath:@"primarySubtitleText"];
    uint64_t v7 = __UIAccessibilityCastAsClass();

    objc_opt_class();
    v17 = [v3 safeValueForKey:@"secondaryText"];
    uint64_t v9 = __UIAccessibilityCastAsClass();

    objc_opt_class();
    v18 = [(NCNotificationListCellAccessibility *)self safeStringForKey:@"contentSummaryText"];
    v19 = __UIAccessibilityCastAsClass();

    v10 = [v19 string];
  }
  v11 = __UIAXStringForVariables();
LABEL_8:

LABEL_9:

  return v11;
}

- (id)accessibilityIdentifier
{
  v6.receiver = self;
  v6.super_class = (Class)NCNotificationListCellAccessibility;
  id v2 = [(NCNotificationListCellAccessibility *)&v6 accessibilityIdentifier];
  id v3 = v2;
  if (v2) {
    BOOL v4 = v2;
  }
  else {
    BOOL v4 = @"NotificationCell";
  }

  return v4;
}

- (id)_accessibilityOpenAction
{
  [(NCNotificationListCellAccessibility *)self safeValueForKey:@"actionProvider"];
  uint64_t v5 = 0;
  objc_super v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy_;
  uint64_t v9 = __Block_byref_object_dispose_;
  id v10 = 0;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  AXPerformSafeBlock();
  id v2 = (id)v6[5];

  _Block_object_dispose(&v5, 8);

  return v2;
}

uint64_t __63__NCNotificationListCellAccessibility__accessibilityOpenAction__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) defaultActionForNotificationListCell:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

- (id)_accessibilityCellActions
{
  id v2 = [(NCNotificationListCellAccessibility *)self safeValueForKey:@"actionProvider"];
  char v13 = 0;
  objc_opt_class();
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  id v3 = v2;
  AXPerformSafeBlock();
  id v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  uint64_t v5 = __UIAccessibilityCastAsClass();

  if (v13) {
    abort();
  }

  return v5;
}

uint64_t __64__NCNotificationListCellAccessibility__accessibilityCellActions__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) supplementaryActionsForNotificationListCell:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

- (id)_accessibilityCellButtons
{
  id v2 = [(NCNotificationListCellAccessibility *)self safeValueForKeyPath:@"_swipeInteraction._actionButtonsPresentingView.actionButtonsView.buttonsStackView"];
  id v3 = [v2 _accessibilitySubviews];

  return v3;
}

- (id)automationElements
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = [(NCNotificationListCellAccessibility *)self _accessibilityCellButtons];
  [v3 axSafelyAddObjectsFromArray:v4];

  uint64_t v5 = [(NCNotificationListCellAccessibility *)self _axLookView];
  objc_super v6 = [v5 safeValueForKey:@"_auxiliaryOptionsView"];
  [v3 axSafelyAddObject:v6];

  uint64_t v7 = [(NCNotificationListCellAccessibility *)self safeUIViewForKey:@"contentView"];
  [v3 axSafelyAddObject:v7];

  return v3;
}

- (id)axCustomActionsForActions:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF980] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v11 = [v10 title];
        if (!v11)
        {
          id v12 = [v10 image];
          v11 = [v12 accessibilityLabel];
        }
        if ([v11 length])
        {
          id v13 = objc_alloc(MEMORY[0x263F1C390]);
          v16[0] = MEMORY[0x263EF8330];
          v16[1] = 3221225472;
          v16[2] = __65__NCNotificationListCellAccessibility_axCustomActionsForActions___block_invoke;
          v16[3] = &unk_265161828;
          v16[4] = v10;
          v14 = (void *)[v13 initWithName:v11 actionHandler:v16];
          [v4 axSafelyAddObject:v14];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  return v4;
}

uint64_t __65__NCNotificationListCellAccessibility_axCustomActionsForActions___block_invoke()
{
  return 1;
}

void __65__NCNotificationListCellAccessibility_axCustomActionsForActions___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) performWithSender:0 target:0];
  UIAccessibilityNotifications v1 = *MEMORY[0x263F1CE18];

  UIAccessibilityPostNotification(v1, 0);
}

- (id)_accessibilitySupplementaryFooterViews
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = [(NCNotificationListCellAccessibility *)self _axLookView];
  id v5 = [v4 safeValueForKey:@"_auxiliaryOptionsView"];

  uint64_t v6 = [v5 safeValueForKey:@"_optionsSummaryLabel"];
  [v3 axSafelyAddObject:v6];
  uint64_t v7 = [v5 safeArrayForKey:@"auxiliaryOptionButtons"];
  [v3 axSafelyAddObjectsFromArray:v7];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = v3;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "setAccessibilityContainer:", self, (void)v14);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  return v8;
}

- (BOOL)_axIsInCollapsedStack
{
  id v2 = [(NCNotificationListCellAccessibility *)self accessibilityContainer];
  id v3 = [v2 safeValueForKey:@"dataSource"];
  id v4 = [v2 accessibilityContainer];
  id v5 = [v4 safeValueForKey:@"dataSource"];

  MEMORY[0x2456680B0](@"NCNotificationGroupList");
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2020000000;
    char v13 = 0;
    id v8 = v5;
    id v9 = v3;
    AXPerformSafeBlock();
    BOOL v6 = *((unsigned char *)v11 + 24) != 0;

    _Block_object_dispose(&v10, 8);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

uint64_t __60__NCNotificationListCellAccessibility__axIsInCollapsedStack__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isNotificationGroupListInCollapsedStack:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)_axIsLeadingView
{
  id v2 = [(NCNotificationListCellAccessibility *)self accessibilityContainer];
  id v3 = [v2 accessibilityContainer];
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy_;
  char v13 = __Block_byref_object_dispose_;
  id v14 = 0;
  uint64_t v7 = MEMORY[0x263EF8330];
  id v8 = v3;
  AXPerformSafeBlock();
  id v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  char v5 = objc_msgSend(v4, "isEqual:", v2, v7, 3221225472, __55__NCNotificationListCellAccessibility__axIsLeadingView__block_invoke, &unk_2651617D8);

  return v5;
}

uint64_t __55__NCNotificationListCellAccessibility__axIsLeadingView__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) visibleViewAtIndex:0];

  return MEMORY[0x270F9A758]();
}

- (void)_axLookView
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_24268C000, a2, OS_LOG_TYPE_DEBUG, "Found unrecognized selector for VC: %@", (uint8_t *)&v2, 0xCu);
}

@end