@interface SFCapsuleNavigationBarAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild;
- (BOOL)_accessibilityOnlyComparesByXAxis;
- (BOOL)_axIsOverlayShowing;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (BOOL)shouldGroupAccessibilityChildren;
- (id)_accessibilityBrowserController;
- (id)accessibilityCustomActions;
- (id)accessibilityElements;
- (int64_t)_accessibilitySortPriority;
- (void)setTrailingButtons:(id)a3;
@end

@implementation SFCapsuleNavigationBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SFCapsuleNavigationBar";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SFCapsuleCollectionView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFCapsuleCollectionView", @"delegate", "@", 0);
  if (AXProcessIsSafari())
  {
    [v3 validateClass:@"CapsuleNavigationBarViewController"];
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CapsuleNavigationBarViewController", @"delegate", "@", 0);
    [v3 validateClass:@"BrowserRootViewController"];
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BrowserRootViewController", @"browserController", "@", 0);
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BrowserController", @"showTabView", "v", 0);
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BrowserController", @"nextTabKeyPressed:", "v", "@", 0);
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BrowserController", @"previousTabKeyPressed:", "v", "@", 0);
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BrowserController", @"navigationBarReaderButtonWasTapped:", "v", "@", 0);
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFCapsuleNavigationBar", @"setTrailingButtons:", "v", "@", 0);
    [v3 validateClass:@"BrowserController" hasInstanceVariable:@"_tabController" withType:"TabController"];
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BrowserController", @"canReadThis", "B", 0);
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BrowserController", @"isReaderAvailable", "B", 0);
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TabController", @"currentTabs", "@", 0);
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TabController", @"indexOfSelectedTab", "Q", 0);
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TabController", @"tabDocumentBeingActivated", "@", 0);
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TabDocument", @"suggestedTitleForCurrentURL", "@", 0);
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BrowserController", @"isShowingReader", "B", 0);
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_SFReaderController", @"isReaderAvailable", "B", 0);
    [v3 validateClass:@"SFCapsuleNavigationBar" hasInstanceVariable:@"_overlayView" withType:"SFURLFieldOverlayView"];
    [v3 validateClass:@"SFURLFieldOverlayView" hasInstanceVariable:@"_isShowing" withType:"B"];
    [v3 validateProtocol:@"CollectionViewTab" hasMethod:@"titleForNewBookmark" isInstanceMethod:1 isRequired:1];
  }
}

- (id)_accessibilityBrowserController
{
  v2 = [(SFCapsuleNavigationBarAccessibility *)self _accessibilityAncestorIsKindOf:MEMORY[0x245655C80](@"SFCapsuleCollectionView", a2)];
  id v3 = [v2 safeValueForKey:@"delegate"];
  MEMORY[0x245655C80](@"CapsuleNavigationBarViewController");
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 safeValueForKey:@"delegate"];
    MEMORY[0x245655C80](@"BrowserRootViewController");
    if (objc_opt_isKindOfClass())
    {
      v5 = [v4 safeValueForKey:@"browserController"];
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)accessibilityCustomActions
{
  if ([(SFCapsuleNavigationBarAccessibility *)self _axIsOverlayShowing])
  {
    id v3 = 0;
  }
  else
  {
    v4 = [(SFCapsuleNavigationBarAccessibility *)self _accessibilityBrowserController];
    v5 = v4;
    if (v4)
    {
      v6 = [v4 safeValueForKey:@"_tabController"];
      v7 = [v6 safeArrayForKey:@"currentTabs"];
      v36 = v6;
      uint64_t v8 = (int)[v6 safeIntForKey:@"indexOfSelectedTab"];
      v44[0] = MEMORY[0x263EF8330];
      v44[1] = 3221225472;
      v44[2] = __65__SFCapsuleNavigationBarAccessibility_accessibilityCustomActions__block_invoke;
      v44[3] = &unk_265135ED0;
      id v9 = v7;
      id v45 = v9;
      v10 = (uint64_t (**)(void, void))MEMORY[0x245655F70](v44);
      uint64_t v11 = v10[2](v10, v8 + 1);
      uint64_t v12 = v10[2](v10, v8 - 1);
      uint64_t v13 = v12;
      if (v11 == v8 && v12 == v8)
      {
        id v3 = 0;
      }
      else
      {
        id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
        objc_initWeak(&location, v5);
        if ([v5 safeBoolForKey:@"canReadThis"])
        {
          int v14 = [v5 safeBoolForKey:@"isShowingReader"];
          if ((v14 | [v5 safeBoolForKey:@"isReaderAvailable"]) == 1)
          {
            if (v14) {
              v15 = @"hide.reader.action";
            }
            else {
              v15 = @"show.reader.action";
            }
            v16 = accessibilitySafariServicesLocalizedString(v15);
            id v17 = objc_alloc(MEMORY[0x263F1C390]);
            v41[0] = MEMORY[0x263EF8330];
            v41[1] = 3221225472;
            v41[2] = __65__SFCapsuleNavigationBarAccessibility_accessibilityCustomActions__block_invoke_2;
            v41[3] = &unk_265135E18;
            objc_copyWeak(&v42, &location);
            v18 = (void *)[v17 initWithName:v16 actionHandler:v41];
            [v3 addObject:v18];

            objc_destroyWeak(&v42);
          }
        }
        if (v11 != v13)
        {
          v35 = [v9 objectAtIndex:v13];
          id v19 = objc_alloc(MEMORY[0x263F1C390]);
          v20 = NSString;
          v21 = accessibilityMobileSafariLocalizedString(@"previous.tab");
          v22 = [v35 safeStringForKey:@"titleForNewBookmark"];
          v23 = objc_msgSend(v20, "stringWithFormat:", v21, v22);
          v39[0] = MEMORY[0x263EF8330];
          v39[1] = 3221225472;
          v39[2] = __65__SFCapsuleNavigationBarAccessibility_accessibilityCustomActions__block_invoke_4;
          v39[3] = &unk_265135E18;
          objc_copyWeak(&v40, &location);
          v24 = (void *)[v19 initWithName:v23 actionHandler:v39];

          v25 = accessibilityMobileSafariLocalizedString(@"previous.tab.short");
          [v24 _setShortName:v25];

          [v3 addObject:v24];
          objc_destroyWeak(&v40);
        }
        v26 = [v9 objectAtIndex:v11];
        id v27 = objc_alloc(MEMORY[0x263F1C390]);
        v28 = NSString;
        v29 = accessibilityMobileSafariLocalizedString(@"next.tab");
        v30 = [v26 safeStringForKey:@"titleForNewBookmark"];
        v31 = objc_msgSend(v28, "stringWithFormat:", v29, v30);
        v37[0] = MEMORY[0x263EF8330];
        v37[1] = 3221225472;
        v37[2] = __65__SFCapsuleNavigationBarAccessibility_accessibilityCustomActions__block_invoke_6;
        v37[3] = &unk_265135E18;
        objc_copyWeak(&v38, &location);
        v32 = (void *)[v27 initWithName:v31 actionHandler:v37];

        v33 = accessibilityMobileSafariLocalizedString(@"next.tab.short");
        [v32 _setShortName:v33];

        [v3 addObject:v32];
        objc_destroyWeak(&v38);

        objc_destroyWeak(&location);
      }
    }
    else
    {
      id v3 = 0;
    }
  }

  return v3;
}

uint64_t __65__SFCapsuleNavigationBarAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) count];
  if (v3 <= a2) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = a2;
  }
  if (a2 >= 0) {
    return v4;
  }
  else {
    return v3 - 1;
  }
}

uint64_t __65__SFCapsuleNavigationBarAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  AXPerformSafeBlock();
  objc_destroyWeak(&v5);

  return 1;
}

void __65__SFCapsuleNavigationBarAccessibility_accessibilityCustomActions__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained navigationBarReaderButtonWasTapped:0];
}

uint64_t __65__SFCapsuleNavigationBarAccessibility_accessibilityCustomActions__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  AXPerformSafeBlock();
  objc_destroyWeak(&v5);

  return 1;
}

void __65__SFCapsuleNavigationBarAccessibility_accessibilityCustomActions__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained previousTabKeyPressed:0];
}

uint64_t __65__SFCapsuleNavigationBarAccessibility_accessibilityCustomActions__block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  AXPerformSafeBlock();
  objc_destroyWeak(&v5);

  return 1;
}

void __65__SFCapsuleNavigationBarAccessibility_accessibilityCustomActions__block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained nextTabKeyPressed:0];
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (id)accessibilityElements
{
  if ([(SFCapsuleNavigationBarAccessibility *)self _axIsOverlayShowing])
  {
    id v3 = [(SFCapsuleNavigationBarAccessibility *)self safeUIViewForKey:@"_overlayView"];
    uint64_t v4 = [v3 _accessibilitySortedElementsWithin];
  }
  else
  {
    uint64_t v4 = [(SFCapsuleNavigationBarAccessibility *)self _accessibilitySortedElementsWithin];
  }

  return v4;
}

- (BOOL)_accessibilityOnlyComparesByXAxis
{
  return 1;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (int64_t)_accessibilitySortPriority
{
  if (AXRequestingClient() == 4) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)SFCapsuleNavigationBarAccessibility;
  return [(SFCapsuleNavigationBarAccessibility *)&v4 _accessibilitySortPriority];
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  objc_super v4 = [(SFCapsuleNavigationBarAccessibility *)self _accessibilityBrowserController];
  id v5 = v4;
  if (v4)
  {
    if (a3 == 4)
    {
      v15[5] = MEMORY[0x263EF8330];
      v15[6] = 3221225472;
      v15[7] = __59__SFCapsuleNavigationBarAccessibility_accessibilityScroll___block_invoke;
      v15[8] = &unk_265135E88;
      id v16 = v4;
      AXPerformSafeBlock();
      BOOL v6 = 1;
      v7 = v16;
LABEL_15:

      goto LABEL_16;
    }
    v7 = [v4 safeValueForKey:@"_tabController"];
    uint64_t v8 = [v7 safeArrayForKey:@"currentTabDocuments"];
    id v9 = [v7 safeValueForKey:@"tabDocumentBeingActivated"];
    uint64_t v10 = [v8 indexOfObject:v9];

    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (a3 == 1)
      {
        if (v10 >= 1)
        {
          uint64_t v11 = v14;
          v14[0] = MEMORY[0x263EF8330];
          v14[1] = 3221225472;
          uint64_t v12 = __59__SFCapsuleNavigationBarAccessibility_accessibilityScroll___block_invoke_3;
          goto LABEL_12;
        }
      }
      else if (a3 == 2 && v10 + 1 < [v8 count])
      {
        uint64_t v11 = v15;
        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        uint64_t v12 = __59__SFCapsuleNavigationBarAccessibility_accessibilityScroll___block_invoke_2;
LABEL_12:
        v11[2] = v12;
        v11[3] = &unk_265135E88;
        v11[4] = v5;
        AXPerformSafeBlock();

        BOOL v6 = 1;
LABEL_14:

        goto LABEL_15;
      }
    }
    BOOL v6 = 0;
    goto LABEL_14;
  }
  BOOL v6 = 0;
LABEL_16:

  return v6;
}

uint64_t __59__SFCapsuleNavigationBarAccessibility_accessibilityScroll___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) showTabView];
}

uint64_t __59__SFCapsuleNavigationBarAccessibility_accessibilityScroll___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) nextTabKeyPressed:0];
}

uint64_t __59__SFCapsuleNavigationBarAccessibility_accessibilityScroll___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) previousTabKeyPressed:0];
}

- (void)setTrailingButtons:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFCapsuleNavigationBarAccessibility;
  [(SFCapsuleNavigationBarAccessibility *)&v3 setTrailingButtons:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (BOOL)_axIsOverlayShowing
{
  v2 = [(SFCapsuleNavigationBarAccessibility *)self safeValueForKeyPath:@"_overlayView._isShowing"];
  BOOL v3 = v2 != 0;

  return v3;
}

@end