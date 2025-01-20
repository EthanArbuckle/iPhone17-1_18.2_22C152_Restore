@interface NCNotificationShortLookViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityBannerIsSticky;
- (BOOL)_accessibilityIsBannerNotificationElement;
- (BOOL)_accessibilityResetBannerTimer;
- (BOOL)_axDismiss;
- (BOOL)_axIsGrouped;
- (BOOL)_axShowLongLook;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityListCellParent;
- (id)_accessibilityListViewParent;
- (id)_axNCNotificationViewController;
- (id)_axShortViewTitle;
- (id)accessibilityCustomActions;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (unint64_t)_accessibilityAutomationType;
- (unsigned)_accessibilityMediaAnalysisOptions;
- (void)_axPerformBlockOnNotificationController:(id)a3;
- (void)_axSetShortViewTitle:(id)a3;
- (void)accessibilityElementDidBecomeFocused;
- (void)accessibilityElementDidLoseFocus;
- (void)setTitle:(id)a3;
@end

@implementation NCNotificationShortLookViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NCNotificationShortLookView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axShortViewTitle
{
}

- (void)_axSetShortViewTitle:(id)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PLPlatterView"];
  [v3 validateClass:@"PLPlatterHeaderContentView"];
  [v3 validateClass:@"NCDimmableView"];
  [v3 validateClass:@"NCNotificationContentView"];
  [v3 validateClass:@"NCNotificationViewController"];
  [v3 validateClass:@"NCNotificationRequestContentProvider"];
  [v3 validateClass:@"NCNotificationStructuredListViewController"];
  [v3 validateClass:@"NCNotificationSeamlessContentView"];
  [v3 validateClass:@"NCNotificationListView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationShortLookView", @"setTitle:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UILabel", @"text", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationViewController", @"staticContentProvider", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationRequestContentProvider", @"notificationRequest", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationRequest", @"defaultEnvironmentActions", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationAction", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationViewController", @"_canPan", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationViewController", @"delegate", "@", 0);
  if (AXProcessIsSpringBoard()) {
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBNotificationBannerDestination", @"_dismissPresentedBannerAnimated:reason:forceIfSticky:", "v", "B", "@", "B", 0);
  }
  [v3 validateClass:@"NCNotificationViewController" hasInstanceVariable:@"_notificationRequest" withType:"NCNotificationRequest"];
  [v3 validateClass:@"NCNotificationShortLookView" hasInstanceVariable:@"_notificationContentView" withType:"UIView<NCNotificationContentDisplaying>"];
  [v3 validateClass:@"PLPlatterHeaderContentView" hasInstanceVariable:@"_dateLabel" withType:"UILabel<BSUIDateLabel>"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PLPlatterHeaderContentView", @"_titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PLPlatterHeaderContentView", @"_utilityButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationRequest", @"options", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationOptions", @"dismissAutomatically", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationShortLookViewController", @"presentLongLookAnimated:trigger:completion:", "v", "B", "q", "@?", 0);
  [v3 validateClass:@"NCNotificationShortLookView" hasInstanceVariable:@"_auxiliaryOptionsView" withType:"NCAuxiliaryOptionsView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCAuxiliaryOptionsView", @"auxiliaryOptionsVisible", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationListView", @"isGrouped", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationListView", @"count", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationRequest", @"sectionIdentifier", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationShortLookView", @"contentSummaryText", "@", 0);
  [v3 validateClass:@"NCNotificationListCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationListView", @"model", "@", 0);
}

- (unint64_t)_accessibilityAutomationType
{
  return 8;
}

- (BOOL)_accessibilityBannerIsSticky
{
  v2 = [(NCNotificationShortLookViewAccessibility *)self _accessibilityAncestorIsKindOf:MEMORY[0x2456680B0](@"NCDimmableView", a2)];
  id v3 = [MEMORY[0x263F1CB68] viewControllerForView:v2];
  v4 = [v3 safeValueForKey:@"_notificationRequest"];
  v5 = __UIAccessibilitySafeClass();

  v6 = [v5 safeValueForKey:@"options"];
  v7 = __UIAccessibilitySafeClass();

  if (v7) {
    int v8 = [v7 safeBoolForKey:@"dismissAutomatically"] ^ 1;
  }
  else {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (BOOL)isAccessibilityElement
{
  v2 = [(NCNotificationShortLookViewAccessibility *)self safeValueForKey:@"_auxiliaryOptionsView"];
  char v3 = [v2 safeBoolForKey:@"auxiliaryOptionsVisible"] ^ 1;

  return v3;
}

- (id)accessibilityLabel
{
  if ([(NCNotificationShortLookViewAccessibility *)self _axIsGrouped])
  {
    char v3 = accessibilityLocalizedString(@"notification.grouped");
  }
  else
  {
    char v3 = 0;
  }
  v4 = [(NCNotificationShortLookViewAccessibility *)self _accessibilityListCellParent];
  MEMORY[0x2456680B0](@"NCNotificationListCell");
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v6 = [(NCNotificationShortLookViewAccessibility *)self _accessibilityFindViewAncestor:&__block_literal_global_8 startWithSelf:1];
    if ([v6 count] < 2)
    {
      v9 = 0;
    }
    else
    {
      objc_opt_class();
      v7 = [(NCNotificationShortLookViewAccessibility *)self _accessibilityListCellParent];
      int v8 = __UIAccessibilityCastAsSafeCategory();

      if ([v8 _axIsInCollapsedStack])
      {
        v9 = accessibilityLocalizedString(@"notification.collapsed.stack");
      }
      else
      {
        v9 = 0;
      }
    }
  }
  else
  {
    v9 = 0;
  }
  v10 = [(NCNotificationShortLookViewAccessibility *)self _accessibilityDescendantOfType:MEMORY[0x2456680B0](@"PLPlatterHeaderContentView")];
  v11 = v10;
  if (v10)
  {
    v12 = [v10 safeValueForKey:@"_dateLabel"];
    v13 = [v12 accessibilityLabel];
  }
  else
  {
    v13 = 0;
  }
  v14 = [(NCNotificationShortLookViewAccessibility *)self safeValueForKey:@"_notificationContentView"];
  MEMORY[0x2456680B0](@"NCNotificationContentView");
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (MEMORY[0x2456680B0](@"NCNotificationSeamlessContentView"), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v15 = [v14 accessibilityLabel];
  }
  else
  {
    v15 = 0;
  }
  objc_opt_class();
  v16 = [(NCNotificationShortLookViewAccessibility *)self safeValueForKey:@"contentSummaryText"];
  v17 = __UIAccessibilityCastAsClass();

  v18 = [v17 string];

  if (v18)
  {
    v19 = accessibilityLocalizedString(@"notifications.text.summary");
    v24 = v18;
    v20 = AXCFormattedString();
  }
  else
  {
    v20 = 0;
  }
  v21 = [(NCNotificationShortLookViewAccessibility *)self _axShortViewTitle];
  v22 = __UIAXStringForVariables();

  return v22;
}

uint64_t __62__NCNotificationShortLookViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x2456680B0](@"NCNotificationListView");
  if (objc_opt_isKindOfClass())
  {
    char v3 = [v2 model];
    uint64_t v4 = [v3 isEqualToString:@"NCNotificationStructuredSectionList"];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)accessibilityIdentifier
{
  v6.receiver = self;
  v6.super_class = (Class)NCNotificationShortLookViewAccessibility;
  id v2 = [(NCNotificationShortLookViewAccessibility *)&v6 accessibilityIdentifier];
  char v3 = v2;
  if (!v2) {
    id v2 = @"NotificationShortLookView";
  }
  uint64_t v4 = v2;

  return v4;
}

- (BOOL)_axShowLongLook
{
  uint64_t v5 = 0;
  objc_super v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __59__NCNotificationShortLookViewAccessibility__axShowLongLook__block_invoke;
  v4[3] = &unk_265161910;
  v4[4] = &v5;
  [(NCNotificationShortLookViewAccessibility *)self _axPerformBlockOnNotificationController:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __59__NCNotificationShortLookViewAccessibility__axShowLongLook__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  uint64_t v4 = __UIAccessibilityCastAsClass();
  id v3 = v4;
  AXPerformSafeBlock();
}

uint64_t __59__NCNotificationShortLookViewAccessibility__axShowLongLook__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) presentLongLookAnimated:1 trigger:6 completion:0];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

- (BOOL)_axDismiss
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  AXPerformSafeBlock();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __54__NCNotificationShortLookViewAccessibility__axDismiss__block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) _axNCNotificationViewController];
  id v3 = [v2 safeValueForKey:@"delegate"];

  if (objc_opt_respondsToSelector())
  {
    [v3 _dismissPresentedBannerAnimated:1 reason:@"Accessibility" forceIfSticky:1];
    [*(id *)(a1 + 32) accessibilityElementDidLoseFocus];
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (id)accessibilityCustomActions
{
  id v3 = [(NCNotificationShortLookViewAccessibility *)self _axNCNotificationViewController];
  MEMORY[0x2456680B0](@"NCNotificationViewController");
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v3 safeValueForKey:@"_notificationRequest"];
    uint64_t v5 = [v4 safeStringForKey:@"sectionIdentifier"];
  }
  else
  {
    uint64_t v5 = 0;
  }
  if ([v5 isEqualToString:@"com.apple.MobileSMS"]) {
    uint64_t v6 = @"reply.action";
  }
  else {
    uint64_t v6 = @"more.action";
  }
  char v7 = accessibilityLocalizedString(v6);
  char v8 = (void *)[objc_alloc(MEMORY[0x263F1C390]) initWithName:v7 target:self selector:sel__axMore_];
  v9 = [(NCNotificationShortLookViewAccessibility *)self _accessibilityListViewParent];

  if (v9)
  {
    v10 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 1, v8);
  }
  else
  {
    objc_initWeak(&location, self);
    id v11 = objc_alloc(MEMORY[0x263F1C390]);
    v12 = accessibilityLocalizedString(@"dismiss");
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    v17 = __70__NCNotificationShortLookViewAccessibility_accessibilityCustomActions__block_invoke;
    v18 = &unk_2651616F8;
    objc_copyWeak(&v19, &location);
    v13 = (void *)[v11 initWithName:v12 actionHandler:&v15];

    [v13 setAccessibilityIdentifier:@"AXNotificationDismissAction"];
    v10 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 2, v8, v13, v15, v16, v17, v18);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v10;
}

uint64_t __70__NCNotificationShortLookViewAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _axDismiss];

  return 1;
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0;
}

- (void)accessibilityElementDidBecomeFocused
{
  id v2 = [(NCNotificationShortLookViewAccessibility *)self _axNCNotificationViewController];
  [v2 _axNotifyWillBeginUserInteraction:1];
}

- (void)accessibilityElementDidLoseFocus
{
  id v3 = [(NCNotificationShortLookViewAccessibility *)self _axNCNotificationViewController];
  [v3 _axNotifyWillBeginUserInteraction:1];

  id v4 = [(NCNotificationShortLookViewAccessibility *)self _axNCNotificationViewController];
  [v4 _axNotifyDidEndUserInteraction];
}

- (BOOL)_accessibilityResetBannerTimer
{
  id v3 = [(NCNotificationShortLookViewAccessibility *)self _axNCNotificationViewController];
  [v3 _axNotifyWillBeginUserInteraction:1];

  id v4 = [(NCNotificationShortLookViewAccessibility *)self _axNCNotificationViewController];
  [v4 _axNotifyDidEndUserInteraction];

  return 1;
}

- (id)_accessibilityListViewParent
{
  id v2 = [(NCNotificationShortLookViewAccessibility *)self _accessibilityListCellParent];
  id v3 = [v2 superview];

  return v3;
}

- (id)_accessibilityListCellParent
{
  objc_opt_class();
  id v3 = [(NCNotificationShortLookViewAccessibility *)self _accessibilityAncestorIsKindOf:MEMORY[0x2456680B0](@"NCNotificationListCell")];
  id v4 = __UIAccessibilityCastAsClass();

  return v4;
}

- (id)_axNCNotificationViewController
{
  id v2 = [(NCNotificationShortLookViewAccessibility *)self _accessibilityAncestorIsKindOf:MEMORY[0x2456680B0](@"NCDimmableView", a2)];
  id v3 = [MEMORY[0x263F1CB68] viewControllerForView:v2];
  MEMORY[0x2456680B0](@"NCNotificationViewController");
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  if (a3 != 4)
  {
    if (a3 == 3)
    {
      id v5 = [(NCNotificationShortLookViewAccessibility *)self _axNCNotificationViewController];
      int v6 = [v5 safeBoolForKey:@"_canPan"];

      if (v6)
      {
        return [(NCNotificationShortLookViewAccessibility *)self _axShowLongLook];
      }
    }
LABEL_11:
    v10.receiver = self;
    v10.super_class = (Class)NCNotificationShortLookViewAccessibility;
    return [(NCNotificationShortLookViewAccessibility *)&v10 accessibilityScroll:a3];
  }
  char v8 = [(NCNotificationShortLookViewAccessibility *)self _axNCNotificationViewController];
  int v9 = [v8 safeBoolForKey:@"_canPan"];

  if (!v9) {
    goto LABEL_11;
  }

  return [(NCNotificationShortLookViewAccessibility *)self _axDismiss];
}

- (BOOL)_axIsGrouped
{
  id v2 = [(NCNotificationShortLookViewAccessibility *)self _accessibilityListViewParent];
  if ([v2 safeBoolForKey:@"isGrouped"]) {
    BOOL v3 = (unint64_t)[v2 safeUnsignedIntegerForKey:@"count"] > 1;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (void)_axPerformBlockOnNotificationController:(id)a3
{
  id v5 = (void (**)(id, void *))a3;
  id v4 = [(NCNotificationShortLookViewAccessibility *)self _axNCNotificationViewController];
  MEMORY[0x2456680B0](@"NCNotificationViewController");
  if (objc_opt_isKindOfClass()) {
    v5[2](v5, v4);
  }
}

- (BOOL)_accessibilityIsBannerNotificationElement
{
  return 1;
}

- (void)setTitle:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NCNotificationShortLookViewAccessibility;
  id v4 = a3;
  [(NCNotificationShortLookViewAccessibility *)&v5 setTitle:v4];
  -[NCNotificationShortLookViewAccessibility _axSetShortViewTitle:](self, "_axSetShortViewTitle:", v4, v5.receiver, v5.super_class);
}

@end