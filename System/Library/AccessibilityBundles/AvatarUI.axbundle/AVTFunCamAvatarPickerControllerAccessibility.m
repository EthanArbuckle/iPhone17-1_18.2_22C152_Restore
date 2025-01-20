@interface AVTFunCamAvatarPickerControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axFunCamAvatarPickerDidSetupCells;
- (id)_axFunCamAvatarCarousel;
- (id)_axLabelForIndexPath:(id)a3;
- (id)_axRecordForIndexPath:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_setAXFunCamAvatarCarousel:(id)a3;
- (void)_setAXFunCamAvatarPickerDidSetupCells:(BOOL)a3;
- (void)_setupAccessibilityForCell:(id)a3 atIndexPath:(id)a4;
- (void)viewDidLayoutSubviews;
@end

@implementation AVTFunCamAvatarPickerControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVTFunCamAvatarPickerController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTFunCamAvatarPickerController", @"collectionView:cellForItemAtIndexPath:", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTFunCamAvatarPickerController", @"collectionView:didSelectItemAtIndexPath:", "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTFunCamAvatarPickerController", @"collectionView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTFunCamAvatarPickerController", @"isDisplayingGridLayout", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTFunCamAvatarPickerController", @"items", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTFunCamAvatarPickerController", @"selectedIndexPath", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTFunCamAvatarPickerController", @"indexPathForNoneItem", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTFunCamAvatarPickerController", @"collectionView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAvatarListRecordItem", @"avatar", "@", 0);
  [v3 validateClass:@"AVTFunCamAvatarPickerController" hasInstanceVariable:@"_allowsCreation" withType:"BOOL"];
  [v3 validateProtocol:@"AVTAvatarRecord" hasRequiredInstanceMethod:@"isEditable"];
}

- (id)_axFunCamAvatarCarousel
{
}

- (void)_setAXFunCamAvatarCarousel:(id)a3
{
}

- (BOOL)_axFunCamAvatarPickerDidSetupCells
{
  return MEMORY[0x270F0A438](self, &__AVTFunCamAvatarPickerControllerAccessibility___axFunCamAvatarPickerDidSetupCells);
}

- (void)_setAXFunCamAvatarPickerDidSetupCells:(BOOL)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v24.receiver = self;
  v24.super_class = (Class)AVTFunCamAvatarPickerControllerAccessibility;
  [(AVTFunCamAvatarPickerControllerAccessibility *)&v24 _accessibilityLoadAccessibilityInformation];
  if (([(AVTFunCamAvatarPickerControllerAccessibility *)self safeBoolForKey:@"isDisplayingGridLayout"] & 1) == 0)
  {
    id v3 = [(AVTFunCamAvatarPickerControllerAccessibility *)self _axFunCamAvatarCarousel];
    if (!v3)
    {
      v4 = [AX_FunCamAvatarCarousel alloc];
      v5 = [(AVTFunCamAvatarPickerControllerAccessibility *)self safeUIViewForKey:@"view"];
      id v3 = [(AX_FunCamAvatarCarousel *)v4 initWithFunCamAvatarPickerController:self accessibilityContainer:v5];

      [(AVTFunCamAvatarPickerControllerAccessibility *)self _setAXFunCamAvatarCarousel:v3];
    }
    v6 = [MEMORY[0x263EFF980] array];
    [v6 axSafelyAddObject:v3];
    v7 = [(AVTFunCamAvatarPickerControllerAccessibility *)self safeUIViewForKey:@"view"];
    v8 = [v7 subviews];
    [v6 axSafelyAddObjectsFromArray:v8];

    v9 = [(AVTFunCamAvatarPickerControllerAccessibility *)self safeValueForKey:@"view"];
    [v9 setAccessibilityElements:v6];
  }
  if (![(AVTFunCamAvatarPickerControllerAccessibility *)self _axFunCamAvatarPickerDidSetupCells])
  {
    char v23 = 0;
    objc_opt_class();
    v10 = [(AVTFunCamAvatarPickerControllerAccessibility *)self safeValueForKey:@"collectionView"];
    v11 = __UIAccessibilityCastAsClass();

    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v12 = objc_msgSend(v11, "visibleCells", 0);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          v18 = [v11 indexPathForCell:v17];
          [(AVTFunCamAvatarPickerControllerAccessibility *)self _setupAccessibilityForCell:v17 atIndexPath:v18];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v25 count:16];
      }
      while (v14);
    }

    [(AVTFunCamAvatarPickerControllerAccessibility *)self _setAXFunCamAvatarPickerDidSetupCells:1];
  }
}

- (id)_axLabelForIndexPath:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [(AVTFunCamAvatarPickerControllerAccessibility *)self safeValueForKey:@"items"];
  v6 = __UIAccessibilityCastAsClass();

  v7 = [(AVTFunCamAvatarPickerControllerAccessibility *)self safeValueForKey:@"indexPathForNoneItem"];
  int v8 = [v4 isEqual:v7];

  if (v8
    && ([(AVTFunCamAvatarPickerControllerAccessibility *)self safeBoolForKey:@"_allowsCreation"] & 1) == 0)
  {
    v12 = accessibilityLocalizedString(@"puppet.none");
  }
  else
  {
    v9 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v4, "item"));
    v10 = [v9 safeValueForKey:@"avatar"];

    if (v10 || [v4 item])
    {
      uint64_t v11 = [MEMORY[0x263F22288] descriptionForAvatarWithRecord:v10 includeVideoPrefix:0];
    }
    else
    {
      uint64_t v11 = accessibilityLocalizedString(@"starfish.add");
    }
    v12 = (void *)v11;
  }

  return v12;
}

- (id)_axRecordForIndexPath:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  uint64_t v5 = [(AVTFunCamAvatarPickerControllerAccessibility *)self safeValueForKey:@"items"];
  v6 = __UIAccessibilityCastAsClass();

  v7 = [(AVTFunCamAvatarPickerControllerAccessibility *)self safeValueForKey:@"indexPathForNoneItem"];
  LOBYTE(v5) = [v4 isEqual:v7];

  if (v5)
  {
    int v8 = 0;
  }
  else
  {
    v9 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v4, "item"));
    int v8 = [v9 safeValueForKey:@"avatar"];

    if (v8 || [v4 item]) {
      id v10 = v8;
    }
  }

  return v8;
}

- (void)_setupAccessibilityForCell:(id)a3 atIndexPath:(id)a4
{
  v25[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (-[AVTFunCamAvatarPickerControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", @"isDisplayingGridLayout") & 1) != 0|| [v7 item] == 0;
  [v6 setIsAccessibilityElement:v8];
  uint64_t v9 = [v6 accessibilityTraits];
  [v6 setAccessibilityTraits:*MEMORY[0x263F1CEE8] | v9];
  objc_initWeak(&location, self);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __87__AVTFunCamAvatarPickerControllerAccessibility__setupAccessibilityForCell_atIndexPath___block_invoke;
  v21[3] = &unk_26510A2B8;
  objc_copyWeak(&v23, &location);
  id v10 = v7;
  id v22 = v10;
  [v6 _setAccessibilityLabelBlock:v21];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __87__AVTFunCamAvatarPickerControllerAccessibility__setupAccessibilityForCell_atIndexPath___block_invoke_2;
  v18[3] = &unk_26510A2E0;
  objc_copyWeak(&v20, &location);
  id v11 = v10;
  id v19 = v11;
  [v6 _setAccessibilityCustomContentBlock:v18];
  objc_opt_class();
  v12 = [(AVTFunCamAvatarPickerControllerAccessibility *)self safeValueForKey:@"items"];
  uint64_t v13 = __UIAccessibilityCastAsClass();

  uint64_t v14 = objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v11, "item"));
  uint64_t v15 = [v14 safeValueForKey:@"avatar"];
  LODWORD(v12) = [v15 safeBoolForKey:@"isEditable"];

  if (v12)
  {
    v16 = accessibilityLocalizedString(@"starfish.avatar");
    v25[0] = v16;
    uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:1];
    [v6 setAccessibilityUserInputLabels:v17];
  }
  objc_destroyWeak(&v20);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

id __87__AVTFunCamAvatarPickerControllerAccessibility__setupAccessibilityForCell_atIndexPath___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained _axLabelForIndexPath:*(void *)(a1 + 32)];

  return v3;
}

id __87__AVTFunCamAvatarPickerControllerAccessibility__setupAccessibilityForCell_atIndexPath___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained _axRecordForIndexPath:*(void *)(a1 + 32)];

  if (v3)
  {
    id v4 = [MEMORY[0x263F22288] customContentForAvatarWithRecord:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)AVTFunCamAvatarPickerControllerAccessibility;
  [(AVTFunCamAvatarPickerControllerAccessibility *)&v3 viewDidLayoutSubviews];
  [(AVTFunCamAvatarPickerControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)AVTFunCamAvatarPickerControllerAccessibility;
  id v6 = a4;
  id v7 = [(AVTFunCamAvatarPickerControllerAccessibility *)&v9 collectionView:a3 cellForItemAtIndexPath:v6];
  -[AVTFunCamAvatarPickerControllerAccessibility _setupAccessibilityForCell:atIndexPath:](self, "_setupAccessibilityForCell:atIndexPath:", v7, v6, v9.receiver, v9.super_class);

  [(AVTFunCamAvatarPickerControllerAccessibility *)self _setAXFunCamAvatarPickerDidSetupCells:1];

  return v7;
}

@end