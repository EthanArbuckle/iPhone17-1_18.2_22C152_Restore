@interface CSCoverSheetViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axAllowNotificationsRevealPolicy;
- (BOOL)_axHandleShowNotificationsAction;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (BOOL)accessibilityScrollUpPage;
- (BOOL)resetScrollViewToMainPageAnimated:(BOOL)a3 withCompletion:(id)a4;
- (id)__axShowNotificationsElement;
- (id)_accessibilityAdditionalElements;
- (id)_axNotificationsMasterList;
- (id)_axNotificationsStructuredListViewController;
- (id)_axShowNotificationsElement;
- (id)_childFocusViews;
- (void)__axSetShowNotificationsElement:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axAdjustObscuredContent;
- (void)layoutSubviews;
- (void)scrollViewDidEndScrolling:(id)a3;
- (void)setModalPresentationView:(id)a3;
@end

@implementation CSCoverSheetViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CSCoverSheetView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CSCoverSheetView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"_childFocusViews", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSCoverSheetView", @"modalPresentationView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSCoverSheetView", @"slideableContentView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSCoverSheetView", @"initWithFrame:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSCoverSheetView", @"setModalPresentationView:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSCoverSheetView", @"layoutSubviews", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSCoverSheetView", @"resetScrollViewToMainPageAnimated: withCompletion:", "B", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSCoverSheetView", @"scrollViewDidEndScrolling:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSCoverSheetView", @"scrollView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSCoverSheetViewController", @"scrollPanGestureDidUpdate:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFPagedScrollView", @"scrollToPageAtIndex:animated:", "B", "Q", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFPagedScrollView", @"pageViews", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFPagedScrollView", @"currentPageIndex", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSCoverSheetViewController", @"mainPageContentViewController", "@", 0);
  [v3 validateClass:@"CSMainPageContentViewController" hasInstanceVariable:@"_combinedListViewController" withType:"CSCombinedListViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSCombinedListViewController", @"notificationListScrollView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSCoverSheetView", @"delegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSCoverSheetViewController", @"mainPageContentViewController", "@", 0);
  [v3 validateClass:@"CSMainPageContentViewController" hasInstanceVariable:@"_combinedListViewController" withType:"CSCombinedListViewController"];
  [v3 validateClass:@"CSCombinedListViewController" hasInstanceVariable:@"_structuredListViewController" withType:"NCNotificationStructuredListViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationStructuredListViewController", @"listModel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationRootList", @"totalNotificationCount", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationRootList", @"isNotificationHistoryRevealed", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationRootList", @"rootListView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationRootList", @"historySectionList", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationCombinedSectionList", @"notificationCount", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSCoverSheetViewController", @"isPasscodeLockVisible", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSCoverSheetView", @"dateView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationStructuredListViewController", @"revealNotificationHistory:animated:", "v", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSCombinedListViewController", @"_allowNotificationsRevealPolicy", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSCombinedListViewController", @"_shouldPreventNotificationHistoryRevealForActiveDNDState", "B", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)CSCoverSheetViewAccessibility;
  [(CSCoverSheetViewAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(CSCoverSheetViewAccessibility *)self _axAdjustObscuredContent];
}

- (void)_axAdjustObscuredContent
{
  id v4 = [(CSCoverSheetViewAccessibility *)self safeValueForKey:@"modalPresentationView"];
  objc_super v3 = [(CSCoverSheetViewAccessibility *)self safeValueForKey:@"slideableContentView"];
  [v3 _accessibilitySetViewIsVisible:v4 == 0];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CSCoverSheetViewAccessibility;
  [(CSCoverSheetViewAccessibility *)&v3 layoutSubviews];
  [(CSCoverSheetViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)scrollViewDidEndScrolling:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CSCoverSheetViewAccessibility;
  [(CSCoverSheetViewAccessibility *)&v4 scrollViewDidEndScrolling:a3];
  [(CSCoverSheetViewAccessibility *)self _axAdjustObscuredContent];
}

- (void)setModalPresentationView:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CSCoverSheetViewAccessibility;
  -[CSCoverSheetViewAccessibility setModalPresentationView:](&v5, sel_setModalPresentationView_);
  [(CSCoverSheetViewAccessibility *)self _axAdjustObscuredContent];
  if (!a3) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
  }
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  char v32 = 0;
  objc_super v5 = [(CSCoverSheetViewAccessibility *)self safeValueForKey:@"scrollView"];
  v6 = __UIAccessibilitySafeClass();

  v7 = [MEMORY[0x263F22968] server];
  if (![v7 isScreenLockedWithPasscode:0])
  {

    goto LABEL_5;
  }
  char v8 = [v6 _accessibilityViewIsVisible];

  if (v8)
  {
LABEL_5:
    char v32 = 0;
    v10 = [(CSCoverSheetViewAccessibility *)self _accessibilityViewController];
    v11 = [v10 safeValueForKeyPath:@"mainPageContentViewController._combinedListViewController.notificationListScrollView"];
    v12 = __UIAccessibilitySafeClass();

    [v12 contentOffset];
    if (a3 == 3 && v13 <= 0.0)
    {
      char v9 = [(CSCoverSheetViewAccessibility *)self accessibilityScrollUpPage];
LABEL_47:

      goto LABEL_48;
    }
    unsigned __int8 v14 = [(CSCoverSheetViewAccessibility *)self _accessibilityIsRTL];
    unint64_t v15 = [v6 safeUnsignedIntegerForKey:@"currentPageIndex"];
    char v32 = 0;
    objc_opt_class();
    v16 = [(CSCoverSheetViewAccessibility *)self _accessibilityViewController];
    v17 = __UIAccessibilityCastAsSafeCategory();

    char v18 = v14 ^ 1;
    if (a3 == 2) {
      char v19 = v14 ^ 1;
    }
    else {
      char v19 = 0;
    }
    if ((v19 & 1) != 0 || a3 == 1 && ((v14 ^ 1) & 1) == 0)
    {
      if ([v17 _axIsTodayViewShowing])
      {
        [v17 _axDismissTodayView];
LABEL_20:
        char v9 = 0;
LABEL_46:

        goto LABEL_47;
      }
      char v32 = 0;
      objc_opt_class();
      v20 = [v6 safeValueForKey:@"pageViews"];
      v21 = __UIAccessibilityCastAsClass();

      unint64_t v22 = [v21 count] - 1;
      if (v15 >= v22) {
        unint64_t v23 = v15;
      }
      else {
        unint64_t v23 = v15 + 1;
      }
      goto LABEL_19;
    }
    if (a3 != 2) {
      char v18 = 1;
    }
    char v24 = v14 ^ 1;
    if (a3 != 1) {
      char v24 = 0;
    }
    if ((v24 & 1) != 0 || (v18 & 1) == 0)
    {
      if (v15)
      {
        unint64_t v23 = v15 - 1;
        goto LABEL_32;
      }
      if ([v17 _axIsCapabilityRestricted:64])
      {
        unint64_t v23 = 0;
LABEL_19:
        if (v23 == v15) {
          goto LABEL_20;
        }
LABEL_32:
        char IsPad = AXDeviceIsPad();
        if (v23 != 1 || (IsPad & 1) == 0)
        {
          if (!v23)
          {
            v26 = @"today.visible.key";
            goto LABEL_41;
          }
          if (v23 != 2)
          {
            v28 = &stru_26F688DC8;
            goto LABEL_42;
          }
        }
        v26 = @"camera.visible";
LABEL_41:
        accessibilitySBLocalizedString(v26);
        v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_42:
        UIAccessibilityPostNotification(*MEMORY[0x263F1CE30], v28);
        char v9 = [v6 scrollToPageAtIndex:v23 animated:1];

        goto LABEL_46;
      }
      unsigned __int8 v27 = [v17 _axShowTodayView];
    }
    else if ([(CSCoverSheetViewAccessibility *)self _axAllowNotificationsRevealPolicy])
    {
      if ([(CSCoverSheetViewAccessibility *)self _axHandleShowNotificationsAction])
      {
        char v9 = 1;
        goto LABEL_46;
      }
      v30.receiver = self;
      v30.super_class = (Class)CSCoverSheetViewAccessibility;
      unsigned __int8 v27 = [(CSCoverSheetViewAccessibility *)&v30 accessibilityScroll:a3];
    }
    else
    {
      v31.receiver = self;
      v31.super_class = (Class)CSCoverSheetViewAccessibility;
      unsigned __int8 v27 = [(CSCoverSheetViewAccessibility *)&v31 accessibilityScroll:a3];
    }
    char v9 = v27;
    goto LABEL_46;
  }
  char v9 = 0;
LABEL_48:

  return v9;
}

- (BOOL)accessibilityScrollUpPage
{
  v2 = [MEMORY[0x263F22968] server];
  [v2 toggleSpotlight];

  objc_super v3 = [MEMORY[0x263F22968] server];
  int v4 = [v3 isSpotlightVisible];

  if (v4)
  {
    objc_super v5 = accessibilityLocalizedString(@"spotlight.visible");
    UIAccessibilitySpeakAndDoNotBeInterrupted();
  }
  return v4;
}

- (BOOL)resetScrollViewToMainPageAnimated:(BOOL)a3 withCompletion:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CSCoverSheetViewAccessibility;
  BOOL v4 = [(CSCoverSheetViewAccessibility *)&v6 resetScrollViewToMainPageAnimated:a3 withCompletion:a4];
  if (v4) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
  }
  return v4;
}

- (id)_childFocusViews
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)CSCoverSheetViewAccessibility;
  objc_super v3 = [(CSCoverSheetViewAccessibility *)&v17 _childFocusViews];
  if ([(CSCoverSheetViewAccessibility *)self _accessibilityIsFKARunningForFocusItem])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    BOOL v4 = objc_msgSend(v3, "reverseObjectEnumerator", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v19 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          char v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          v10 = [(CSCoverSheetViewAccessibility *)self safeValueForKey:@"modalPresentationView"];

          if (v9 == v10)
          {
            char v18 = v9;
            id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];

            goto LABEL_13;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v19 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
  }
  id v11 = v3;
LABEL_13:

  return v11;
}

- (id)__axShowNotificationsElement
{
}

- (void)__axSetShowNotificationsElement:(id)a3
{
}

- (id)_axShowNotificationsElement
{
  objc_super v3 = [(CSCoverSheetViewAccessibility *)self __axShowNotificationsElement];

  if (!v3)
  {
    BOOL v4 = (void *)[objc_alloc(MEMORY[0x263F1C3A8]) initWithAccessibilityContainer:self];
    uint64_t v5 = accessibilitySBLocalizedString(@"show.notifications");
    [v4 setAccessibilityLabel:v5];

    [v4 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __60__CSCoverSheetViewAccessibility__axShowNotificationsElement__block_invoke;
    v10[3] = &unk_26511B6D0;
    objc_copyWeak(&v11, &location);
    [v4 _setAccessibilityFrameBlock:v10];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __60__CSCoverSheetViewAccessibility__axShowNotificationsElement__block_invoke_2;
    v8[3] = &unk_26511B6F8;
    objc_copyWeak(&v9, &location);
    [v4 _setAccessibilityActivateBlock:v8];
    [(CSCoverSheetViewAccessibility *)self __axSetShowNotificationsElement:v4];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  uint64_t v6 = [(CSCoverSheetViewAccessibility *)self __axShowNotificationsElement];

  return v6;
}

double __60__CSCoverSheetViewAccessibility__axShowNotificationsElement__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained accessibilityFrame];
  double v3 = v2;
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;

  v11.origin.x = v3;
  v11.origin.y = v5;
  v11.size.width = v7;
  v11.size.height = v9;
  CGRectGetMidY(v11);
  return v3;
}

uint64_t __60__CSCoverSheetViewAccessibility__axShowNotificationsElement__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained _axHandleShowNotificationsAction];

  return v2;
}

- (BOOL)_axHandleShowNotificationsAction
{
  double v3 = [(CSCoverSheetViewAccessibility *)self _axNotificationsMasterList];
  if (([v3 safeBoolForKey:@"isNotificationHistoryRevealed"] & 1) != 0
    || ([v3 safeValueForKey:@"historySectionList"],
        double v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 safeUnsignedIntegerForKey:@"notificationCount"],
        v4,
        !v5))
  {
    CGFloat v7 = AXLogAppAccessibility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CGFloat v9 = 0;
      _os_log_impl(&dword_2420BD000, v7, OS_LOG_TYPE_DEFAULT, "Cannot show notifications. revealNotificationHistory: failed", v9, 2u);
    }

    BOOL v6 = 0;
  }
  else
  {
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    objc_super v17 = __65__CSCoverSheetViewAccessibility__axHandleShowNotificationsAction__block_invoke;
    char v18 = &unk_26511B5A0;
    char v19 = self;
    AXPerformSafeBlock();
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    v12 = __65__CSCoverSheetViewAccessibility__axHandleShowNotificationsAction__block_invoke_2;
    long long v13 = &unk_26511B5A0;
    id v14 = v3;
    AXPerformBlockOnMainThreadAfterDelay();

    BOOL v6 = 1;
  }

  return v6;
}

void __65__CSCoverSheetViewAccessibility__axHandleShowNotificationsAction__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _axNotificationsStructuredListViewController];
  [v1 revealNotificationHistory:1 animated:0];
}

void __65__CSCoverSheetViewAccessibility__axHandleShowNotificationsAction__block_invoke_2(uint64_t a1)
{
  UIAccessibilityNotifications v1 = *MEMORY[0x263F1CE18];
  id v2 = [*(id *)(a1 + 32) safeValueForKey:@"rootListView"];
  UIAccessibilityPostNotification(v1, v2);
}

- (id)_accessibilityAdditionalElements
{
  v13[1] = *MEMORY[0x263EF8340];
  double v3 = [(CSCoverSheetViewAccessibility *)self _axNotificationsMasterList];
  double v4 = [v3 safeValueForKey:@"historySectionList"];
  if ([v4 safeUnsignedIntegerForKey:@"notificationCount"]) {
    int v5 = ![(CSCoverSheetViewAccessibility *)self _axAllowNotificationsRevealPolicy];
  }
  else {
    int v5 = 1;
  }

  if (![v3 safeUnsignedIntegerForKey:@"totalNotificationCount"]
    || ([v3 safeBoolForKey:@"isNotificationHistoryRevealed"] & 1) != 0)
  {
    goto LABEL_10;
  }
  BOOL v6 = [(CSCoverSheetViewAccessibility *)self _accessibilityViewController];
  if ([v6 safeBoolForKey:@"isPasscodeLockVisible"]) {
    goto LABEL_9;
  }
  CGFloat v7 = [(CSCoverSheetViewAccessibility *)self safeUIViewForKey:@"dateView"];
  if (([v7 _accessibilityViewIsVisible] ^ 1 | v5) == 1)
  {

LABEL_9:
LABEL_10:
    v12.receiver = self;
    v12.super_class = (Class)CSCoverSheetViewAccessibility;
    double v8 = [(CSCoverSheetViewAccessibility *)&v12 _accessibilityAdditionalElements];
    goto LABEL_11;
  }
  BOOL IsSwitchControlRunning = UIAccessibilityIsSwitchControlRunning();

  if (IsSwitchControlRunning) {
    goto LABEL_10;
  }
  uint64_t v11 = [(CSCoverSheetViewAccessibility *)self _axShowNotificationsElement];
  v13[0] = v11;
  double v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];

LABEL_11:

  return v8;
}

- (id)_axNotificationsStructuredListViewController
{
  return (id)[(CSCoverSheetViewAccessibility *)self safeValueForKeyPath:@"delegate.mainPageContentViewController._combinedListViewController._structuredListViewController"];
}

- (id)_axNotificationsMasterList
{
  id v2 = [(CSCoverSheetViewAccessibility *)self _axNotificationsStructuredListViewController];
  double v3 = [v2 safeValueForKey:@"listModel"];

  return v3;
}

- (BOOL)_axAllowNotificationsRevealPolicy
{
  id v2 = [(CSCoverSheetViewAccessibility *)self safeValueForKeyPath:@"delegate.mainPageContentViewController._combinedListViewController"];
  if ([v2 safeBoolForKey:@"_allowNotificationsRevealPolicy"]) {
    int v3 = [v2 safeBoolForKey:@"_shouldPreventNotificationHistoryRevealForActiveDNDState"] ^ 1;
  }
  else {
    LOBYTE(v3) = 0;
  }

  return v3;
}

@end