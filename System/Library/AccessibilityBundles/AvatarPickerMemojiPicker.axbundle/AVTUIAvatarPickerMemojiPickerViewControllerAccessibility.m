@interface AVTUIAvatarPickerMemojiPickerViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axLabelForIndexPath:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axMarkupCell:(id)a3 atIndexPath:(id)a4;
@end

@implementation AVTUIAvatarPickerMemojiPickerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVTUIAvatarPickerMemojiPickerViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTUIAvatarPickerMemojiPickerViewController", @"collectionView:didSelectItemAtIndexPath:", "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTUIAvatarPickerMemojiPickerViewController", @"collectionView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTUIAvatarPickerMemojiPickerViewController", @"dataSource", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAvatarRecordDataSource", @"recordAtIndex:", "@", "q", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)AVTUIAvatarPickerMemojiPickerViewControllerAccessibility;
  [(AVTUIAvatarPickerMemojiPickerViewControllerAccessibility *)&v17 _accessibilityLoadAccessibilityInformation];
  char v16 = 0;
  objc_opt_class();
  id v3 = [(AVTUIAvatarPickerMemojiPickerViewControllerAccessibility *)self safeValueForKey:@"collectionView"];
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
        [(AVTUIAvatarPickerMemojiPickerViewControllerAccessibility *)self _axMarkupCell:v10 atIndexPath:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v7);
  }
}

- (void)_axMarkupCell:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 setIsAccessibilityElement:1];
  uint64_t v8 = [v6 accessibilityTraits];
  [v6 setAccessibilityTraits:*MEMORY[0x263F1CEE8] | v8];
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __86__AVTUIAvatarPickerMemojiPickerViewControllerAccessibility__axMarkupCell_atIndexPath___block_invoke;
  v10[3] = &unk_265109FA8;
  objc_copyWeak(&v12, &location);
  id v9 = v7;
  id v11 = v9;
  [v6 _setAccessibilityLabelBlock:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

id __86__AVTUIAvatarPickerMemojiPickerViewControllerAccessibility__axMarkupCell_atIndexPath___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained _axLabelForIndexPath:*(void *)(a1 + 32)];

  return v3;
}

- (id)_axLabelForIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 row];
  if (v5)
  {
    if (v5 < 1)
    {
      uint64_t v8 = 0;
    }
    else
    {
      [(AVTUIAvatarPickerMemojiPickerViewControllerAccessibility *)self safeValueForKey:@"dataSource"];
      uint64_t v10 = 0;
      id v11 = &v10;
      uint64_t v12 = 0x3032000000;
      long long v13 = __Block_byref_object_copy_;
      long long v14 = __Block_byref_object_dispose_;
      id v15 = 0;
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      AXPerformSafeBlock();
      uint64_t v7 = v11[5];
      if (v7)
      {
        uint64_t v8 = [MEMORY[0x263F22288] descriptionForAvatarWithRecord:v7 includeVideoPrefix:0];
      }
      else
      {
        uint64_t v8 = 0;
      }

      _Block_object_dispose(&v10, 8);
    }
  }
  else
  {
    uint64_t v8 = accessibilityLocalizedString(@"newMemoji");
  }

  return v8;
}

uint64_t __81__AVTUIAvatarPickerMemojiPickerViewControllerAccessibility__axLabelForIndexPath___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) recordAtIndex:*(void *)(a1 + 48)];

  return MEMORY[0x270F9A758]();
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)AVTUIAvatarPickerMemojiPickerViewControllerAccessibility;
  id v6 = a4;
  uint64_t v7 = [(AVTUIAvatarPickerMemojiPickerViewControllerAccessibility *)&v9 collectionView:a3 cellForItemAtIndexPath:v6];
  -[AVTUIAvatarPickerMemojiPickerViewControllerAccessibility _axMarkupCell:atIndexPath:](self, "_axMarkupCell:atIndexPath:", v7, v6, v9.receiver, v9.super_class);

  return v7;
}

@end