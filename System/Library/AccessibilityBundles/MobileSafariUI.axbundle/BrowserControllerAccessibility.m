@interface BrowserControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)scrollViewShouldScrollToTop:(id)a3;
- (id)_accessibilitySpeakThisViews;
- (id)accessibilityActiveTabDocument;
- (id)accessibilityCurrentWebView;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axUpdateVisibleContentInset;
- (void)_axUpdateVisibleContentInsetForScrollView:(id)a3;
- (void)_initSubviews;
- (void)browserViewController:(id)a3 didCreateUnifiedBar:(id)a4;
- (void)dealloc;
- (void)scrollViewDidScrollToTop:(id)a3;
- (void)setShowingReader:(BOOL)a3 animated:(BOOL)a4;
- (void)tabDocumentDidCompleteCheckForAppBanner:(id)a3;
- (void)updateInsetsForBackgroundWebView:(id)a3;
@end

@implementation BrowserControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BrowserController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"BrowserController" hasInstanceVariable:@"_rootViewController" withType:"BrowserRootViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BrowserController", @"tabDocumentDidCompleteCheckForAppBanner:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TabDocument", @"appBanner", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BrowserController", @"browserViewController:didCreateUnifiedBar:", "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BrowserController", @"setShowingReader:animated:", "v", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BrowserController", @"isShowingReader", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BrowserController", @"tabController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BrowserController", @"_initSubviews", "v", 0);
  [v3 validateClass:@"BrowserController" hasInstanceVariable:@"_tabController" withType:"TabController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BrowserController", @"scrollViewDidScrollToTop:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BrowserController", @"scrollViewShouldScrollToTop:", "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TabController", @"activeTabDocument", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TabDocument", @"frontWebView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BrowserController", @"updateInsetsForBackgroundWebView:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BrowserController", @"isPrivateBrowsingEnabled", "B", 0);
  [v3 validateClass:@"BrowserController" hasInstanceVariable:@"_scrollView" withType:"UIScrollView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BrowserRootViewController", @"documentAndTopBarsContainerView", "@", 0);
  [v3 validateClass:@"TabController" hasInstanceVariable:@"_tabCollectionViewManager" withType:"TabCollectionViewManager"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BrowserController", @"webView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BrowserController", @"rootViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BrowserRootViewController", @"navigationBar", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BrowserRootViewController", @"unifiedBar", "@", 0);
  [v3 validateClass:@"SFBarRegistration" hasInstanceVariable:@"_bookmarksItem" withType:"UIBarButtonItem"];
  [v3 validateClass:@"BrowserController" hasInstanceVariable:@"_barManager" withType:"_SFBarManager"];
  [v3 validateClass:@"_SFBarManager" hasInstanceVariable:@"_barToRegistrationMap" withType:"NSMapTable"];
}

- (void)browserViewController:(id)a3 didCreateUnifiedBar:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)BrowserControllerAccessibility;
  [(BrowserControllerAccessibility *)&v5 browserViewController:a3 didCreateUnifiedBar:a4];
  [(BrowserControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (id)accessibilityActiveTabDocument
{
  v2 = [(BrowserControllerAccessibility *)self safeValueForKey:@"tabController"];
  id v3 = __UIAccessibilitySafeClass();

  v4 = [v3 safeValueForKey:@"activeTabDocument"];

  return v4;
}

- (id)_accessibilitySpeakThisViews
{
  id v3 = [MEMORY[0x263EFF980] array];
  v4 = [(BrowserControllerAccessibility *)self accessibilityCurrentWebView];
  if (v4) {
    [v3 addObject:v4];
  }

  return v3;
}

- (id)accessibilityCurrentWebView
{
  v2 = [(BrowserControllerAccessibility *)self accessibilityActiveTabDocument];
  id v3 = __UIAccessibilitySafeClass();

  v4 = [v3 safeValueForKey:@"frontWebView"];

  return v4;
}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BrowserControllerAccessibility;
  BOOL v5 = [(BrowserControllerAccessibility *)&v8 scrollViewShouldScrollToTop:v4];
  if (!UIAccessibilityIsVoiceOverRunning())
  {
    if (!UIAccessibilityIsSwitchControlRunning() || v5) {
      goto LABEL_6;
    }
LABEL_5:
    v7.receiver = self;
    v7.super_class = (Class)BrowserControllerAccessibility;
    LOBYTE(v5) = [(BrowserControllerAccessibility *)&v7 scrollViewShouldScrollToTop:v4];
    goto LABEL_6;
  }
  if (!v5) {
    goto LABEL_5;
  }
  LOBYTE(v5) = 1;
LABEL_6:

  return v5;
}

- (void)scrollViewDidScrollToTop:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)BrowserControllerAccessibility;
  [(BrowserControllerAccessibility *)&v6 scrollViewDidScrollToTop:v4];
  id v5 = v4;
  AXPerformBlockOnMainThreadAfterDelay();
}

void __59__BrowserControllerAccessibility_scrollViewDidScrollToTop___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _accessibilityScrollStatus];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v1);
}

- (void)setShowingReader:(BOOL)a3 animated:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)BrowserControllerAccessibility;
  [(BrowserControllerAccessibility *)&v4 setShowingReader:a3 animated:a4];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

- (void)_axUpdateVisibleContentInset
{
  objc_opt_class();
  id v3 = [(BrowserControllerAccessibility *)self safeValueForKey:@"_scrollView"];
  objc_super v4 = __UIAccessibilityCastAsClass();

  [(BrowserControllerAccessibility *)self _axUpdateVisibleContentInsetForScrollView:v4];
}

- (void)_axUpdateVisibleContentInsetForScrollView:(id)a3
{
  id v4 = a3;
  [v4 contentInset];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  objc_opt_class();
  v11 = [(BrowserControllerAccessibility *)self safeValueForKey:@"webView"];
  v12 = __UIAccessibilityCastAsClass();

  [v12 bounds];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  objc_opt_class();
  v21 = [(BrowserControllerAccessibility *)self safeValueForKey:@"rootViewController"];
  v22 = [v21 safeValueForKey:@"navigationBar"];
  v23 = __UIAccessibilityCastAsClass();

  [v23 bounds];
  objc_msgSend(v12, "convertRect:fromView:", v23);
  double MaxY = CGRectGetMaxY(v25);
  v26.origin.x = v14;
  v26.origin.y = v16;
  v26.size.width = v18;
  v26.size.height = v20;
  objc_msgSend(v4, "_accessibilitySetVisibleContentInset:", fmax(MaxY - CGRectGetMinY(v26), 0.0), v6, v8, v10);
}

- (void)updateInsetsForBackgroundWebView:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BrowserControllerAccessibility;
  id v4 = a3;
  [(BrowserControllerAccessibility *)&v6 updateInsetsForBackgroundWebView:v4];
  double v5 = objc_msgSend(v4, "scrollView", v6.receiver, v6.super_class);

  [(BrowserControllerAccessibility *)self _axUpdateVisibleContentInsetForScrollView:v5];
}

- (void)_initSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)BrowserControllerAccessibility;
  [(BrowserControllerAccessibility *)&v3 _initSubviews];
  [(BrowserControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)tabDocumentDidCompleteCheckForAppBanner:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BrowserControllerAccessibility;
  id v3 = a3;
  [(BrowserControllerAccessibility *)&v5 tabDocumentDidCompleteCheckForAppBanner:v3];
  id v4 = objc_msgSend(v3, "safeUIViewForKey:", @"appBanner", v5.receiver, v5.super_class);

  [v4 _accessibilitySetSortPriority:51];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v20.receiver = self;
  v20.super_class = (Class)BrowserControllerAccessibility;
  [(BrowserControllerAccessibility *)&v20 _accessibilityLoadAccessibilityInformation];
  [(BrowserControllerAccessibility *)self _axUpdateVisibleContentInset];
  id v3 = [(BrowserControllerAccessibility *)self safeValueForKey:@"_rootViewController"];
  [v3 _accessibilityLoadAccessibilityInformation];
  id v4 = [v3 safeValueForKey:@"documentAndTopBarsContainerView"];
  [v4 accessibilitySetIdentification:@"PageView"];

  char v19 = 0;
  objc_opt_class();
  objc_super v5 = [(BrowserControllerAccessibility *)self safeValueForKey:@"_barManager"];
  objc_super v6 = [v5 safeValueForKey:@"_barToRegistrationMap"];
  double v7 = __UIAccessibilityCastAsClass();

  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v8 = objc_msgSend(v7, "objectEnumerator", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * i) _accessibilityLoadAccessibilityInformation];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v10);
  }

  double v13 = [MEMORY[0x263F08A00] defaultCenter];
  [v13 addObserver:self selector:sel__accessibilityKeyboardDidHide_ name:*MEMORY[0x263F1D410] object:0];

  CGFloat v14 = [v3 safeValueForKey:@"unifiedBar"];
  [v14 _accessibilitySetSortPriority:50];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F1D410] object:0];

  v4.receiver = self;
  v4.super_class = (Class)BrowserControllerAccessibility;
  [(BrowserControllerAccessibility *)&v4 dealloc];
}

@end