@interface AVTPoseSelectionGridViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axGetCachedAvatarDescription;
- (id)_axGetCachedAvatarRecord;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axMarkupCell:(id)a3 atIndexPath:(id)a4;
- (void)_axSetCachedAvatarDescription:(id)a3;
- (void)_axSetCachedAvatarRecord:(id)a3;
@end

@implementation AVTPoseSelectionGridViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVTPoseSelectionGridViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTPoseSelectionGridViewController", @"collectionView:cellForItemAtIndexPath:", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTPoseSelectionGridViewController", @"configurationForIndex:", "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTPoseSelectionGridViewController", @"poseCollectionView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTPoseSelectionGridViewController", @"cameraCellView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTPoseSelectionGridViewController", @"avatarRecord", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)AVTPoseSelectionGridViewControllerAccessibility;
  [(AVTPoseSelectionGridViewControllerAccessibility *)&v17 _accessibilityLoadAccessibilityInformation];
  char v16 = 0;
  objc_opt_class();
  id v3 = [(AVTPoseSelectionGridViewControllerAccessibility *)self safeValueForKey:@"poseCollectionView"];
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
        [(AVTPoseSelectionGridViewControllerAccessibility *)self _axMarkupCell:v10 atIndexPath:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v7);
  }
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)AVTPoseSelectionGridViewControllerAccessibility;
  id v6 = a4;
  uint64_t v7 = [(AVTPoseSelectionGridViewControllerAccessibility *)&v9 collectionView:a3 cellForItemAtIndexPath:v6];
  -[AVTPoseSelectionGridViewControllerAccessibility _axMarkupCell:atIndexPath:](self, "_axMarkupCell:atIndexPath:", v7, v6, v9.receiver, v9.super_class);

  return v7;
}

- (id)_axGetCachedAvatarRecord
{
}

- (void)_axSetCachedAvatarRecord:(id)a3
{
}

- (id)_axGetCachedAvatarDescription
{
}

- (void)_axSetCachedAvatarDescription:(id)a3
{
}

- (void)_axMarkupCell:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 setIsAccessibilityElement:1];
  uint64_t v8 = [v6 accessibilityTraits];
  [v6 setAccessibilityTraits:*MEMORY[0x263F1CEE8] | v8];
  uint64_t v9 = [(AVTPoseSelectionGridViewControllerAccessibility *)self safeValueForKey:@"cameraCellView"];
  if (v9 && (uint64_t v10 = (void *)v9, v11 = [v7 item], v10, v11))
  {
    id location = 0;
    p_id location = &location;
    uint64_t v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__0;
    v31 = __Block_byref_object_dispose__0;
    id v32 = 0;
    v24[1] = (id)MEMORY[0x263EF8330];
    v24[2] = (id)3221225472;
    v24[3] = __77__AVTPoseSelectionGridViewControllerAccessibility__axMarkupCell_atIndexPath___block_invoke;
    v24[4] = &unk_26510A308;
    v26 = &location;
    v24[5] = self;
    id v25 = v7;
    AXPerformSafeBlock();
    id v12 = p_location[5];

    _Block_object_dispose(&location, 8);
    objc_initWeak(&location, self);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __77__AVTPoseSelectionGridViewControllerAccessibility__axMarkupCell_atIndexPath___block_invoke_2;
    v22[3] = &unk_26510A2B8;
    objc_copyWeak(v24, &location);
    id v13 = v12;
    id v23 = v13;
    [v6 _setAccessibilityLabelBlock:v22];
    long long v14 = (void *)MEMORY[0x263EFF8C0];
    long long v15 = [v13 localizedName];
    char v16 = objc_msgSend(v14, "axArrayByIgnoringNilElementsWithCount:", 1, v15);
    [v6 setAccessibilityUserInputLabels:v16];

    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __77__AVTPoseSelectionGridViewControllerAccessibility__axMarkupCell_atIndexPath___block_invoke_3;
    v20[3] = &unk_26510A3D0;
    objc_copyWeak(&v21, &location);
    [v6 _setAccessibilityCustomContentBlock:v20];
    objc_destroyWeak(&v21);

    objc_destroyWeak(v24);
    objc_destroyWeak(&location);
  }
  else
  {
    [v6 _setAccessibilityLabelBlock:&__block_literal_global_1];
    objc_super v17 = (void *)[v6 accessibilityTraits];
    objc_initWeak(&location, self);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __77__AVTPoseSelectionGridViewControllerAccessibility__axMarkupCell_atIndexPath___block_invoke_5;
    v18[3] = &unk_26510A480;
    objc_copyWeak(v19, &location);
    v19[1] = v17;
    [v6 _setAccessibilityTraitsBlock:v18];
    objc_destroyWeak(v19);
    objc_destroyWeak(&location);
  }
}

uint64_t __77__AVTPoseSelectionGridViewControllerAccessibility__axMarkupCell_atIndexPath___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "configurationForIndex:", objc_msgSend(*(id *)(a1 + 40), "item"));

  return MEMORY[0x270F9A758]();
}

id __77__AVTPoseSelectionGridViewControllerAccessibility__axMarkupCell_atIndexPath___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained safeValueForKey:@"avatarRecord"];
  v4 = [WeakRetained _axGetCachedAvatarDescription];
  v5 = [WeakRetained _axGetCachedAvatarRecord];
  char v6 = [v5 isEqual:v3];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = [MEMORY[0x263F22288] descriptionForAvatarWithRecord:v3 includeVideoPrefix:0];

    [WeakRetained _axSetCachedAvatarRecord:v3];
    [WeakRetained _axSetCachedAvatarDescription:v7];
    v4 = (void *)v7;
  }
  uint64_t v8 = [*(id *)(a1 + 32) localizedName];
  uint64_t v9 = __UIAXStringForVariables();

  return v9;
}

id __77__AVTPoseSelectionGridViewControllerAccessibility__axMarkupCell_atIndexPath___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained safeValueForKey:@"avatarRecord"];
  if (v2)
  {
    id v3 = [MEMORY[0x263F22288] customContentForAvatarWithRecord:v2];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

id __77__AVTPoseSelectionGridViewControllerAccessibility__axMarkupCell_atIndexPath___block_invoke_4()
{
  return accessibilityLocalizedString(@"custom.pose");
}

uint64_t __77__AVTPoseSelectionGridViewControllerAccessibility__axMarkupCell_atIndexPath___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained safeValueForKey:@"selectedStickerConfiguration"];

  uint64_t v4 = *(void *)(a1 + 40);
  if (v3) {
    uint64_t v5 = v4 & ~*MEMORY[0x263F1CF38];
  }
  else {
    uint64_t v5 = *MEMORY[0x263F1CF38] | v4;
  }

  return v5;
}

@end