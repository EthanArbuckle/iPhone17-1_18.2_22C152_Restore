@interface SBUIApplicationAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityLeftOfHomeTodayViewIsVisible;
- (BOOL)_accessibilityLeftOfLockTodayViewIsVisible;
- (BOOL)_accessibilityOverlayTodayViewIsVisible;
- (BOOL)_accessibilitySpotlightIsVisible;
- (id)_accessibilityCoverSheetViewController;
- (id)_accessibilitySpeakThisViewController;
- (id)_accessibilitySpotlightMultiplexingViewController;
- (id)_accessibilityTitleBarElement;
- (id)_accessibilityTodayOverlayController;
- (id)accessibilityLabel;
- (unint64_t)_accessibilityAutomationType;
@end

@implementation SBUIApplicationAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIApplication";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIApplication", @"_accessibilitySpeakThisViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIApplication", @"_accessibilityTitleBarElement", "@", 0);
  [v3 validateClass:@"SBIconController"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"SBIconController", @"sharedInstance", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconController", @"_rootFolderController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconController", @"homeScreenOverlayController", "@", 0);
  [v3 validateClass:@"SBRootFolderController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBRootFolderController", @"isLeadingCustomViewVisible", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBRootFolderController", @"todayViewController", "@", 0);
  [v3 validateClass:@"SBLockScreenManager"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"SBLockScreenManager", @"sharedInstance", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBLockScreenManager", @"coverSheetViewController", "@", 0);
  [v3 validateClass:@"CSCoverSheetViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSCoverSheetViewController", @"isShowingTodayView", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSCoverSheetViewController", @"_indexOfTodayPage", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSCoverSheetViewController", @"pageViewControllerAtIndex:", "@", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSCoverSheetViewController", @"overlayController", "@", 0);
  [v3 validateClass:@"SBSpotlightMultiplexingViewController"];
  [v3 validateClass:@"SBSpotlightMultiplexingViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"SBSpotlightMultiplexingViewController", @"sharedRemoteSearchViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSCoverSheetViewController", @"mainPageContentViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSMainPageContentViewController", @"combinedListViewController", "@", 0);
  [v3 validateClass:@"CSCombinedListViewController" hasInstanceVariable:@"_structuredListViewController" withType:"NCNotificationStructuredListViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHomeScreenOverlayController", @"overlayViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHomeScreenOverlayController", @"isPresented", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHomeScreenOverlayViewController", @"leadingSidebarViewController", "@", 0);
}

- (unint64_t)_accessibilityAutomationType
{
  return 1;
}

- (id)_accessibilitySpeakThisViewController
{
  if ([(SBUIApplicationAccessibility *)self _accessibilityOverlayTodayViewIsVisible])
  {
    LOBYTE(v9) = 0;
    objc_opt_class();
    id v3 = [(SBUIApplicationAccessibility *)self _accessibilityTodayOverlayController];
    __UIAccessibilityCastAsClass();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_3:

    goto LABEL_12;
  }
  if ([(SBUIApplicationAccessibility *)self _accessibilityLeftOfHomeTodayViewIsVisible])
  {
    id v5 = [(SBUIApplicationAccessibility *)self _accessibilityRootFolderController];
    LOBYTE(v9) = 0;
    objc_opt_class();
    v6 = [v5 safeValueForKey:@"todayViewController"];
    __UIAccessibilityCastAsClass();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if ([(SBUIApplicationAccessibility *)self _accessibilityLeftOfLockTodayViewIsVisible])
  {
    [(SBUIApplicationAccessibility *)self _accessibilityCoverSheetViewController];
    uint64_t v9 = 0;
    v10 = &v9;
    uint64_t v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__9;
    v13 = __Block_byref_object_dispose__9;
    id v14 = 0;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    AXPerformSafeBlock();
    id v4 = (id)v10[5];

    _Block_object_dispose(&v9, 8);
  }
  else
  {
    if ([(SBUIApplicationAccessibility *)self _accessibilitySpotlightIsVisible])
    {
      LOBYTE(v9) = 0;
      objc_opt_class();
      id v3 = [(SBUIApplicationAccessibility *)self _accessibilitySpotlightMultiplexingViewController];
      v7 = [(id)objc_opt_class() safeValueForKey:@"sharedRemoteSearchViewController"];
      __UIAccessibilityCastAsClass();
      id v4 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_3;
    }
    id v5 = [(SBUIApplicationAccessibility *)self _accessibilityCoverSheetViewController];
    id v4 = [v5 safeValueForKeyPath:@"mainPageContentViewController.combinedListViewController._structuredListViewController"];
  }

LABEL_12:

  return v4;
}

void __69__SBUIApplicationAccessibility__accessibilitySpeakThisViewController__block_invoke(uint64_t a1)
{
  objc_opt_class();
  v2 = objc_msgSend(*(id *)(a1 + 32), "pageViewControllerAtIndex:", objc_msgSend(*(id *)(a1 + 32), "safeUnsignedIntegerForKey:", @"_indexOfTodayPage"));
  uint64_t v3 = __UIAccessibilityCastAsClass();

  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    objc_opt_class();
    v6 = [*(id *)(a1 + 32) safeValueForKey:@"overlayController"];
    v7 = [v6 safeValueForKey:@"overlayViewController"];
    v8 = [v7 safeValueForKey:@"leadingSidebarViewController"];
    uint64_t v9 = __UIAccessibilityCastAsClass();

    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"application.name");
}

- (id)_accessibilityTitleBarElement
{
  if ([(SBUIApplicationAccessibility *)self _accessibilityLeftOfHomeTodayViewIsVisible]|| [(SBUIApplicationAccessibility *)self _accessibilityLeftOfLockTodayViewIsVisible])
  {
    uint64_t v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SBUIApplicationAccessibility;
    uint64_t v3 = [(SBUIApplicationAccessibility *)&v5 _accessibilityTitleBarElement];
  }

  return v3;
}

- (BOOL)_accessibilitySpotlightIsVisible
{
  objc_opt_class();
  uint64_t v3 = [(SBUIApplicationAccessibility *)self _accessibilitySpotlightMultiplexingViewController];
  uint64_t v4 = __UIAccessibilityCastAsClass();

  BOOL v5 = [v4 _appearState] == 2;
  return v5;
}

- (BOOL)_accessibilityOverlayTodayViewIsVisible
{
  v2 = AXSBHomeScreenOverlayController();
  char v3 = [v2 safeBoolForKey:@"isPresented"];

  return v3;
}

- (id)_accessibilityTodayOverlayController
{
  v2 = AXSBHomeScreenOverlayController();
  char v3 = [v2 safeValueForKey:@"overlayViewController"];
  uint64_t v4 = [v3 safeValueForKey:@"leadingSidebarViewController"];

  return v4;
}

- (BOOL)_accessibilityLeftOfHomeTodayViewIsVisible
{
  v2 = [(SBUIApplicationAccessibility *)self _accessibilityRootFolderViewController];
  char v3 = [v2 safeBoolForKey:@"isLeadingCustomViewVisible"];

  return v3;
}

- (BOOL)_accessibilityLeftOfLockTodayViewIsVisible
{
  v2 = [(SBUIApplicationAccessibility *)self _accessibilityCoverSheetViewController];
  char v3 = [v2 safeBoolForKey:@"isShowingTodayView"];

  return v3;
}

- (id)_accessibilitySpotlightMultiplexingViewController
{
  Class v2 = NSClassFromString(&cfstr_Sbspotlightmul.isa);

  return (id)[(objc_class *)v2 safeValueForKey:@"sharedRemoteSearchViewController"];
}

- (id)_accessibilityCoverSheetViewController
{
  Class v2 = [NSClassFromString(&cfstr_Sblockscreenma.isa) safeValueForKey:@"sharedInstance"];
  char v3 = [v2 safeValueForKey:@"coverSheetViewController"];

  return v3;
}

@end