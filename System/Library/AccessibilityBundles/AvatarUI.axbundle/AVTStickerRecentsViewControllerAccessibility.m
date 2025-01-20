@interface AVTStickerRecentsViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axMarkupCell:(id)a3 indexPath:(id)a4;
@end

@implementation AVTStickerRecentsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVTStickerRecentsViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTStickerRecentsViewController", @"collectionView:cellForItemAtIndexPath:", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTStickerRecentsViewController", @"displayItems", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTStickerRecentsViewController", @"buttonItem", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTStickerRecentsViewController", @"collectionView", "@", 0);
  [v3 validateProtocol:@"AVTStickerRecentsItem" hasRequiredInstanceMethod:@"localizedDescription"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)AVTStickerRecentsViewControllerAccessibility;
  [(AVTStickerRecentsViewControllerAccessibility *)&v17 _accessibilityLoadAccessibilityInformation];
  char v16 = 0;
  objc_opt_class();
  id v3 = [(AVTStickerRecentsViewControllerAccessibility *)self safeValueForKey:@"collectionView"];
  v4 = __UIAccessibilityCastAsClass();

  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = objc_msgSend(v4, "visibleCells", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        v11 = [v4 indexPathForCell:v10];
        [(AVTStickerRecentsViewControllerAccessibility *)self _axMarkupCell:v10 indexPath:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v7);
  }
}

- (void)_axMarkupCell:(id)a3 indexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 setIsAccessibilityElement:1];
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __72__AVTStickerRecentsViewControllerAccessibility__axMarkupCell_indexPath___block_invoke;
  v13[3] = &unk_26510A2B8;
  objc_copyWeak(&v15, &location);
  id v8 = v7;
  id v14 = v8;
  [v6 _setAccessibilityLabelBlock:v13];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __72__AVTStickerRecentsViewControllerAccessibility__axMarkupCell_indexPath___block_invoke_2;
  v10[3] = &unk_26510A3A8;
  objc_copyWeak(&v12, &location);
  id v9 = v8;
  id v11 = v9;
  [v6 _setAccessibilityTraitsBlock:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

id __72__AVTStickerRecentsViewControllerAccessibility__axMarkupCell_indexPath___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained safeArrayForKey:@"displayItems"];
  v4 = objc_msgSend(v3, "objectAtIndex:", objc_msgSend(*(id *)(a1 + 32), "row"));

  v5 = [WeakRetained safeValueForKey:@"buttonItem"];
  if (v4 == v5) {
    accessibilityLocalizedString(@"more.stickers");
  }
  else {
  id v6 = [v4 safeValueForKey:@"localizedDescription"];
  }

  return v6;
}

uint64_t __72__AVTStickerRecentsViewControllerAccessibility__axMarkupCell_indexPath___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained safeArrayForKey:@"displayItems"];
  v4 = objc_msgSend(v3, "objectAtIndex:", objc_msgSend(*(id *)(a1 + 32), "row"));

  v5 = [WeakRetained safeValueForKey:@"buttonItem"];
  id v6 = (uint64_t *)MEMORY[0x263F1CEE8];
  if (v4 != v5) {
    id v6 = (uint64_t *)MEMORY[0x263F1CF08];
  }
  uint64_t v7 = *v6;

  return v7;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)AVTStickerRecentsViewControllerAccessibility;
  id v6 = a4;
  uint64_t v7 = [(AVTStickerRecentsViewControllerAccessibility *)&v9 collectionView:a3 cellForItemAtIndexPath:v6];
  -[AVTStickerRecentsViewControllerAccessibility _axMarkupCell:indexPath:](self, "_axMarkupCell:indexPath:", v7, v6, v9.receiver, v9.super_class);

  return v7;
}

@end