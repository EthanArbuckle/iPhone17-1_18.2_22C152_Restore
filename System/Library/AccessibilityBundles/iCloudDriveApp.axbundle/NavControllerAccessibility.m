@interface NavControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)configureToolbar:(id)a3;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarTextDidBeginEditing:(id)a3;
- (void)searchBarTextDidEndEditing:(id)a3;
- (void)togglePickerMode:(BOOL)a3;
@end

@implementation NavControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NavController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"_UIDocumentListController"];
  [v3 validateClass:@"_UIDocumentListController" hasInstanceVariable:@"_containerViewController" withType:"_UIDocumentPickerContainerViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_UIDocumentPickerContainerViewController", @"sortView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_UIDocumentPickerSortOrderView", @"listModeToggle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NavController", @"getTopDocumentListController", "@", 0);
}

- (void)configureToolbar:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NavControllerAccessibility;
  id v3 = a3;
  [(NavControllerAccessibility *)&v8 configureToolbar:v3];
  v4 = objc_msgSend(v3, "safeValueForKey:", @"_containerViewController", v8.receiver, v8.super_class);

  v5 = [v4 safeValueForKey:@"sortView"];
  v6 = [v5 safeValueForKey:@"listModeToggle"];

  v7 = accessibilityLocalizedString(@"listmode.label");
  [v6 setAccessibilityLabel:v7];
}

- (void)togglePickerMode:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)NavControllerAccessibility;
  [(NavControllerAccessibility *)&v3 togglePickerMode:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  id v4 = a3;
  uint64_t v7 = MEMORY[0x263EF8330];
  id v8 = v4;
  id v5 = v4;
  AXPerformSafeBlock();
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  v6 = _AXTableOrCollectionView(self);
  objc_msgSend(v6, "_accessibilitySetRetainedValue:forKey:", MEMORY[0x263EFFA88], _AXTableOrCollectionViewHideElementsKey, v7, 3221225472, __59__NavControllerAccessibility_searchBarTextDidBeginEditing___block_invoke, &unk_26516AD10);
}

id __59__NavControllerAccessibility_searchBarTextDidBeginEditing___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)NavControllerAccessibility;
  return objc_msgSendSuper2(&v3, sel_searchBarTextDidBeginEditing_, v1);
}

- (void)searchBarTextDidEndEditing:(id)a3
{
  id v4 = a3;
  uint64_t v7 = MEMORY[0x263EF8330];
  id v8 = v4;
  id v5 = v4;
  AXPerformSafeBlock();
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  v6 = _AXTableOrCollectionView(self);
  objc_msgSend(v6, "_accessibilitySetRetainedValue:forKey:", 0, _AXTableOrCollectionViewHideElementsKey, v7, 3221225472, __57__NavControllerAccessibility_searchBarTextDidEndEditing___block_invoke, &unk_26516AD10);
}

id __57__NavControllerAccessibility_searchBarTextDidEndEditing___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)NavControllerAccessibility;
  return objc_msgSendSuper2(&v3, sel_searchBarTextDidEndEditing_, v1);
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v5 = a3;
  id v8 = a4;
  id v6 = v8;
  id v7 = v5;
  AXPerformSafeBlock();
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

id __54__NavControllerAccessibility_searchBar_textDidChange___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  v4.receiver = *(id *)(a1 + 48);
  v4.super_class = (Class)NavControllerAccessibility;
  return objc_msgSendSuper2(&v4, sel_searchBar_textDidChange_, v2, v1);
}

@end