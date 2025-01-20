@interface TabCollectionViewManagerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)movePlaceholder:(id)a3 overTabItem:(id)a4;
- (void)tabCollectionView:(id)a3 closeItem:(id)a4;
- (void)tabCollectionView:(id)a3 didSelectItem:(id)a4;
@end

@implementation TabCollectionViewManagerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TabCollectionViewManager";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TabCollectionViewManager", @"tabCollectionView:didSelectItem:", "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TabCollectionViewManager", @"tabCollectionView:closeItem:", "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TabCollectionViewManager", @"_indexToInsertPlaceholderAtTabItem:", "Q", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TabCollectionViewManager", @"movePlaceholder:overTabItem:", "v", "@", "@", 0);
  [v3 validateClass:@"TabCollectionViewManager" hasInstanceVariable:@"_dataSource" withType:"<TabCollectionViewManagerDataSource>"];
  [v3 validateClass:@"TabCollectionViewManager" hasInstanceVariable:@"_placeholderItemIndex" withType:"Q"];
  [v3 validateClass:@"TabCollectionViewManager" hasInstanceVariable:@"_tabOverview" withType:"TabOverview"];
}

- (void)tabCollectionView:(id)a3 didSelectItem:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TabCollectionViewManagerAccessibility *)self safeValueForKeyPath:@"_dataSource.activeTabDocument"];
  v9.receiver = self;
  v9.super_class = (Class)TabCollectionViewManagerAccessibility;
  [(TabCollectionViewManagerAccessibility *)&v9 tabCollectionView:v7 didSelectItem:v6];

  if (v8 != v6) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], (id)*MEMORY[0x263F21A08]);
  }
}

- (void)tabCollectionView:(id)a3 closeItem:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)TabCollectionViewManagerAccessibility;
  [(TabCollectionViewManagerAccessibility *)&v4 tabCollectionView:a3 closeItem:a4];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], (id)*MEMORY[0x263F21A08]);
}

- (void)movePlaceholder:(id)a3 overTabItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(TabCollectionViewManagerAccessibility *)self safeUnsignedIntegerForKey:@"_placeholderItemIndex"];
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0;
  uint64_t v21 = MEMORY[0x263EF8330];
  uint64_t v22 = 3221225472;
  v23 = __69__TabCollectionViewManagerAccessibility_movePlaceholder_overTabItem___block_invoke;
  v24 = &unk_265137098;
  v27 = &v28;
  v25 = self;
  id v9 = v7;
  id v26 = v9;
  AXPerformSafeBlock();
  unint64_t v10 = v29[3];

  _Block_object_dispose(&v28, 8);
  v20.receiver = self;
  v20.super_class = (Class)TabCollectionViewManagerAccessibility;
  [(TabCollectionViewManagerAccessibility *)&v20 movePlaceholder:v6 overTabItem:v9];
  if (v8 != 0x7FFFFFFFFFFFFFFFLL && v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = [v9 safeStringForKey:@"title"];
    if (![v11 length])
    {
      v12 = (void *)MEMORY[0x263F08A30];
      v13 = [NSNumber numberWithUnsignedInteger:v10 + 1];
      v14 = [v12 localizedStringFromNumber:v13 numberStyle:6];

      v15 = accessibilityLocalizedString(@"tab.position");
      uint64_t v16 = AXCFormattedString();

      v11 = (void *)v16;
    }
    if (v8 <= v10) {
      v17 = @"moved.after.tab";
    }
    else {
      v17 = @"moved.before.tab";
    }
    v18 = accessibilityLocalizedString(v17);
    v19 = AXCFormattedString();

    LODWORD(v18) = *MEMORY[0x263F1CDC8];
    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v19);
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
    UIAccessibilityPostNotification((UIAccessibilityNotifications)v18, (id)*MEMORY[0x263F21980]);
  }
}

uint64_t __69__TabCollectionViewManagerAccessibility_movePlaceholder_overTabItem___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _indexToInsertPlaceholderAtTabItem:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

@end