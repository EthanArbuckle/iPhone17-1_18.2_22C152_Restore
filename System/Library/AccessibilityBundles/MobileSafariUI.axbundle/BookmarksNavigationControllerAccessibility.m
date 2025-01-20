@interface BookmarksNavigationControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
- (id)_segmentedControlItemForCollection:(id)a3;
- (id)_setAccessibilityLabelForItem:(id)a3 fromCollection:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)transitionConductor:(id)a3 didEndTransitionFromView:(id)a4 toView:(id)a5;
@end

@implementation BookmarksNavigationControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BookmarksNavigationController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BookmarksNavigationController", @"_segmentedControlItemForCollection:", "@", "@", 0);
  [v3 validateProtocol:@"BookmarksNavigationControllerDelegate" hasOptionalInstanceMethod:@"bookmarksNavigationControllerDidPressDoneButton:"];
  [v3 validateClass:@"BookmarksNavigationController" hasInstanceVariable:@"_topLevelCollections" withType:"NSArray"];
  [v3 validateClass:@"BookmarksNavigationController" hasInstanceVariable:@"_collectionSegmentedControl" withType:"UISegmentedControl"];
  [v3 validateClass:@"BrowserRootViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"BookmarksNavigationController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"BookmarksNavigationController" isKindOfClass:@"UINavigationController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UINavigationController", @"transitionConductor:didEndTransitionFromView:toView:", "v", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BrowserController", @"rootViewController", "@", 0);
  [v3 validateClass:@"Application" hasInstanceVariable:@"_browserWindowController" withType:"BrowserWindowController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BrowserWindowController", @"browserControllers", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v12.receiver = self;
  v12.super_class = (Class)BookmarksNavigationControllerAccessibility;
  [(BookmarksNavigationControllerAccessibility *)&v12 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  id v3 = [(BookmarksNavigationControllerAccessibility *)self safeValueForKey:@"_collectionSegmentedControl"];
  v4 = __UIAccessibilityCastAsClass();

  if (v4)
  {
    objc_opt_class();
    v5 = [(BookmarksNavigationControllerAccessibility *)self safeValueForKey:@"_topLevelCollections"];
    v6 = __UIAccessibilityCastAsClass();

    if ([v4 numberOfSegments])
    {
      unint64_t v7 = 0;
      do
      {
        v8 = [v4 imageForSegmentAtIndex:v7];
        objc_opt_class();
        v9 = [v6 objectAtIndex:v7];
        v10 = __UIAccessibilityCastAsClass();

        id v11 = [(BookmarksNavigationControllerAccessibility *)self _setAccessibilityLabelForItem:v8 fromCollection:v10];
        ++v7;
      }
      while ([v4 numberOfSegments] > v7);
    }
  }
}

- (id)_segmentedControlItemForCollection:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BookmarksNavigationControllerAccessibility;
  id v4 = a3;
  v5 = [(BookmarksNavigationControllerAccessibility *)&v8 _segmentedControlItemForCollection:v4];
  v6 = -[BookmarksNavigationControllerAccessibility _setAccessibilityLabelForItem:fromCollection:](self, "_setAccessibilityLabelForItem:fromCollection:", v5, v4, v8.receiver, v8.super_class);

  return v6;
}

- (id)_setAccessibilityLabelForItem:(id)a3 fromCollection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 isEqualToString:@"BookmarksCollection"])
  {
    unint64_t v7 = @"buttonbar.bookmarks.text";
  }
  else if ([v6 isEqualToString:@"CloudTabsCollection"])
  {
    unint64_t v7 = @"bookmarks.nav.icloud";
  }
  else if ([v6 isEqualToString:@"HistoryCollection"])
  {
    unint64_t v7 = @"bookmarks.nav.history";
  }
  else if ([v6 isEqualToString:@"ReadingListCollection"])
  {
    unint64_t v7 = @"reading.list.button";
  }
  else
  {
    if (![v6 isEqualToString:@"SocialLinksCollection"]) {
      goto LABEL_12;
    }
    unint64_t v7 = @"bookmarks.nav.social";
  }
  objc_super v8 = accessibilityLocalizedString(v7);
  [v5 setAccessibilityLabel:v8];

LABEL_12:

  return v5;
}

- (void)transitionConductor:(id)a3 didEndTransitionFromView:(id)a4 toView:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  _UIAccessibilityBlockPostingOfNotification();
  v11.receiver = self;
  v11.super_class = (Class)BookmarksNavigationControllerAccessibility;
  [(BookmarksNavigationControllerAccessibility *)&v11 transitionConductor:v10 didEndTransitionFromView:v9 toView:v8];

  _UIAccessibilityUnblockPostingOfNotification();
}

- (BOOL)accessibilityPerformEscape
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = [(BookmarksNavigationControllerAccessibility *)self safeValueForKey:@"_bookmarksNavigationControllerDelegate"];
  if ((AXDeviceIsPad() & 1) != 0 || (objc_opt_respondsToSelector() & 1) == 0)
  {
    char v26 = 0;
    id v6 = [(id)*MEMORY[0x263F1D020] safeValueForKey:@"_browserWindowController"];
    id v5 = __UIAccessibilitySafeClass();

    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id obj = [v5 safeArrayForKey:@"browserControllers"];
    uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v33 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      v19 = v5;
      v20 = v3;
      uint64_t v9 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(obj);
          }
          objc_super v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          char v26 = 0;
          objc_opt_class();
          objc_super v12 = [v11 safeValueForKey:@"rootViewController"];
          v13 = __UIAccessibilityCastAsClass();

          if (v26) {
            abort();
          }
          v14 = [v13 view];
          v15 = [v14 window];
          v16 = [(BookmarksNavigationControllerAccessibility *)self view];
          v17 = [v16 window];

          if (v15 == v17)
          {
            char v4 = [v11 accessibilityPerformEscape];
            goto LABEL_16;
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v33 count:16];
        if (v8) {
          continue;
        }
        break;
      }
      char v4 = 0;
LABEL_16:
      id v5 = v19;
      id v3 = v20;
    }
    else
    {
      char v4 = 0;
    }
  }
  else
  {
    uint64_t v27 = MEMORY[0x263EF8330];
    uint64_t v28 = 3221225472;
    v29 = __72__BookmarksNavigationControllerAccessibility_accessibilityPerformEscape__block_invoke;
    v30 = &unk_265137070;
    id v31 = v3;
    v32 = self;
    AXPerformSafeBlock();
    char v4 = 1;
    id v5 = v31;
  }

  return v4;
}

uint64_t __72__BookmarksNavigationControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) bookmarksNavigationControllerDidPressDoneButton:*(void *)(a1 + 40)];
}

@end