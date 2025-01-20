@interface BrowserRootViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (id)_accessibilitySpeakThisViews;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_setUpFloatingSidebarButton;
- (void)setShowingSidebar:(BOOL)a3 completion:(id)a4;
- (void)sidebarDimmingViewDismiss:(id)a3;
@end

@implementation BrowserRootViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BrowserRootViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"BrowserRootViewController" hasInstanceVariable:@"_sidebarButtonEmbeddedInSidebar" withType:"UIButton"];
  [v3 validateClass:@"BrowserRootViewController" hasInstanceVariable:@"_sidebarTrailingButton" withType:"UIButton"];
  [v3 validateClass:@"BrowserRootViewController" hasInstanceVariable:@"_sidebarContentDimmingView" withType:"SidebarContentDimmingView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BrowserRootViewController", @"sidebarDimmingViewDismiss:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BrowserRootViewController", @"setShowingSidebar:completion:", "v", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BrowserRootViewController", @"bottomToolbar", "@", 0);
  [v3 validateClass:@"_SFToolbar" hasInstanceVariable:@"_barRegistration" withType:"<_SFBarRegistrationToken>"];
  [v3 validateClass:@"BrowserToolbar" isKindOfClass:@"_SFToolbar"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BrowserRootViewController", @"browserController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BrowserRootViewController", @"capsuleViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CapsuleNavigationBarViewController", @"capsuleCollectionView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFCapsuleCollectionView", @"setSelectedItemState:animated:", "v", "q", "B", 0);
}

- (void)setShowingSidebar:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BrowserRootViewControllerAccessibility;
  [(BrowserRootViewControllerAccessibility *)&v11 setShowingSidebar:a3 completion:a4];
  v6 = [(BrowserRootViewControllerAccessibility *)self safeValueForKey:@"bottomToolbar"];
  v7 = [v6 safeValueForKey:@"_barRegistration"];
  v8 = [v7 safeValueForKey:@"_bookmarksItem"];

  if (v4) {
    v9 = @"hide.bookmarks";
  }
  else {
    v9 = @"buttonbar.show.bookmarks.text";
  }
  v10 = accessibilityLocalizedString(v9);
  [v8 setAccessibilityLabel:v10];
}

- (void)_setUpFloatingSidebarButton
{
  v3.receiver = self;
  v3.super_class = (Class)BrowserRootViewControllerAccessibility;
  [(BrowserRootViewControllerAccessibility *)&v3 _setUpFloatingSidebarButton];
  [(BrowserRootViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)BrowserRootViewControllerAccessibility;
  [(BrowserRootViewControllerAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  objc_super v3 = [(BrowserRootViewControllerAccessibility *)self safeValueForKey:@"_sidebarButtonEmbeddedInSidebar"];
  BOOL v4 = accessibilityLocalizedString(@"hide.sidebar.button");
  [v3 setAccessibilityLabel:v4];

  v5 = [(BrowserRootViewControllerAccessibility *)self safeValueForKey:@"_sidebarTrailingButton"];
  v6 = accessibilityLocalizedString(@"tab.group.button");
  [v5 setAccessibilityLabel:v6];
}

- (BOOL)accessibilityPerformEscape
{
  v2 = [(BrowserRootViewControllerAccessibility *)self safeValueForKey:@"_sidebarContentDimmingView"];
  int v3 = [v2 _accessibilityViewIsVisible];

  if (v3) {
    AXPerformSafeBlock();
  }
  return v3;
}

uint64_t __68__BrowserRootViewControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) sidebarDimmingViewDismiss:0];
}

- (void)sidebarDimmingViewDismiss:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)BrowserRootViewControllerAccessibility;
  [(BrowserRootViewControllerAccessibility *)&v3 sidebarDimmingViewDismiss:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

- (id)_accessibilitySpeakThisViews
{
  objc_super v3 = [(BrowserRootViewControllerAccessibility *)self safeValueForKey:@"browserController"];
  BOOL v4 = [v3 _accessibilitySpeakThisViews];

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)BrowserRootViewControllerAccessibility;
    id v5 = [(BrowserRootViewControllerAccessibility *)&v8 _accessibilitySpeakThisViews];
  }
  v6 = v5;

  return v6;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  if (a3 == 3)
  {
    uint64_t v7 = MEMORY[0x263EF8330];
    uint64_t v8 = 3221225472;
    v9 = __62__BrowserRootViewControllerAccessibility_accessibilityScroll___block_invoke;
    v10 = &unk_265136F70;
    objc_super v11 = self;
    AXPerformSafeBlock();
  }
  v6.receiver = self;
  v6.super_class = (Class)BrowserRootViewControllerAccessibility;
  return [(BrowserRootViewControllerAccessibility *)&v6 accessibilityScroll:a3];
}

void __62__BrowserRootViewControllerAccessibility_accessibilityScroll___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) safeValueForKeyPath:@"capsuleViewController.capsuleCollectionView"];
  [v1 setSelectedItemState:0 animated:0];
}

@end