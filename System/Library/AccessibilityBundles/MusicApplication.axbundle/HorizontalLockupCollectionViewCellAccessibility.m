@interface HorizontalLockupCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axPerformCustomAction:(id)a3;
- (id)_accessibilityIndexPathForCell;
- (id)_privateAccessibilityCustomActions;
- (id)accessibilityCustomActions;
- (id)automationElements;
- (id)axCustomActionForContextualAction:(id)a3;
- (id)lockupViewCustomActions;
- (unint64_t)accessibilityTraits;
- (void)setLockupViewCustomActions:(id)a3;
@end

@implementation HorizontalLockupCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.HorizontalLockupCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)lockupViewCustomActions
{
}

- (void)setLockupViewCustomActions:(id)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.HorizontalLockupCollectionViewCell", @"accessibilityLibraryStatusControl", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.HorizontalLockupCollectionViewCell", @"contextMenuButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.HorizontalLockupCollectionViewCell", @"showsContextMenu", "B", 0);
  [v3 validateClass:@"MusicApplication.HorizontalLockupCollectionViewCell" hasProperty:@"collectionView" customGetter:@"_collectionView" customSetter:@"_setCollectionView:" withType:"@"];
  [v3 validateClass:@"MusicApplication.HorizontalLockupCollectionViewCell" isKindOfClass:@"UICollectionViewTableCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UICollectionViewTableLayout", @"_delegateActual", "@", 0);
  [v3 validateClass:@"UICollectionViewTableCell" hasProperty:@"tableLayout" customGetter:@"_tableLayout" customSetter:0 withType:"@"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UICollectionViewTableLayout", @"contextualActionForDeletingRowAtIndexPath:", "@", "@", 0);
  [v3 validateProtocol:@"UICollectionViewDelegateTableLayout" hasOptionalInstanceMethod:@"collectionView:tableLayout:commitEditingStyle:forRowAtIndexPath:"];
  [v3 validateClass:@"MusicApplication.HorizontalLockupCollectionViewCell" hasSwiftField:@"reactionsButton" withSwiftType:"Optional<Button>"];
}

- (id)accessibilityCustomActions
{
  id v3 = [MEMORY[0x263EFF980] array];
  LOBYTE(location[0]) = 0;
  objc_opt_class();
  v4 = [(HorizontalLockupCollectionViewCellAccessibility *)self safeValueForKey:@"accessibilityLibraryStatusControl"];
  v5 = __UIAccessibilityCastAsSafeCategory();

  [v5 setAccessibilityIsInCell:1];
  v6 = [v5 accessibilityLabel];
  v7 = v6;
  if (v5 && [v6 length])
  {
    objc_initWeak(location, v5);
    id v8 = objc_alloc(MEMORY[0x263F1C390]);
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __77__HorizontalLockupCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke;
    v31[3] = &unk_26513CF38;
    objc_copyWeak(&v32, location);
    v9 = (void *)[v8 initWithName:v7 actionHandler:v31];
    [v3 addObject:v9];

    objc_destroyWeak(&v32);
    objc_destroyWeak(location);
  }
  LOBYTE(location[0]) = 0;
  objc_opt_class();
  v10 = [(HorizontalLockupCollectionViewCellAccessibility *)self safeSwiftValueForKey:@"reactionsButton"];
  v11 = __UIAccessibilityCastAsClass();

  if (LOBYTE(location[0])) {
    goto LABEL_17;
  }
  if (v11)
  {
    objc_initWeak(location, v11);
    id v12 = objc_alloc(MEMORY[0x263F1C390]);
    v13 = [v11 accessibilityLabel];
    v14 = [v11 accessibilityValue];
    v15 = __UIAXStringForVariables();
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __77__HorizontalLockupCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke_2;
    v29[3] = &unk_26513CF38;
    objc_copyWeak(&v30, location);
    v16 = objc_msgSend(v12, "initWithName:actionHandler:", v15, v29, v14, @"__AXStringForVariablesSentinel");

    [v3 addObject:v16];
    objc_destroyWeak(&v30);
    objc_destroyWeak(location);
  }
  if ([(HorizontalLockupCollectionViewCellAccessibility *)self safeBoolForKey:@"showsContextMenu"])
  {
    LOBYTE(location[0]) = 0;
    objc_opt_class();
    v17 = [(HorizontalLockupCollectionViewCellAccessibility *)self safeValueForKey:@"contextMenuButton"];
    v18 = __UIAccessibilityCastAsSafeCategory();

    if (!LOBYTE(location[0]))
    {
      v19 = [v18 accessibilityLabel];
      v20 = v19;
      if (v18 && [v19 length])
      {
        objc_initWeak(location, v18);
        id v21 = objc_alloc(MEMORY[0x263F1C390]);
        v27[0] = MEMORY[0x263EF8330];
        v27[1] = 3221225472;
        v27[2] = __77__HorizontalLockupCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke_3;
        v27[3] = &unk_26513CF38;
        objc_copyWeak(&v28, location);
        v22 = (void *)[v21 initWithName:v20 actionHandler:v27];
        [v3 addObject:v22];

        objc_destroyWeak(&v28);
        objc_destroyWeak(location);
      }

      goto LABEL_14;
    }
LABEL_17:
    abort();
  }
LABEL_14:
  [(HorizontalLockupCollectionViewCellAccessibility *)self setLockupViewCustomActions:v3];
  v26.receiver = self;
  v26.super_class = (Class)HorizontalLockupCollectionViewCellAccessibility;
  v23 = [(HorizontalLockupCollectionViewCellAccessibility *)&v26 accessibilityCustomActions];
  v24 = [v3 arrayByAddingObjectsFromArray:v23];

  return v24;
}

uint64_t __77__HorizontalLockupCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained sendActionsForControlEvents:64];

  return 1;
}

uint64_t __77__HorizontalLockupCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained sendActionsForControlEvents:64];

  return 1;
}

uint64_t __77__HorizontalLockupCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _accessibilityShowContextMenuForElement:WeakRetained targetPointValue:0];

  return 1;
}

- (id)automationElements
{
  v10.receiver = self;
  v10.super_class = (Class)HorizontalLockupCollectionViewCellAccessibility;
  id v3 = [(HorizontalLockupCollectionViewCellAccessibility *)&v10 automationElements];
  v4 = (void *)[v3 mutableCopy];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x263EFF980] array];
  }
  v7 = v6;

  id v8 = [(HorizontalLockupCollectionViewCellAccessibility *)self safeValueForKey:@"accessibilityLibraryStatusControl"];
  [v7 axSafelyAddObject:v8];

  return v7;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)HorizontalLockupCollectionViewCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(HorizontalLockupCollectionViewCellAccessibility *)&v3 accessibilityTraits];
}

- (id)_accessibilityIndexPathForCell
{
  objc_opt_class();
  objc_super v3 = [(HorizontalLockupCollectionViewCellAccessibility *)self safeValueForKey:@"collectionView"];
  v4 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  v5 = __UIAccessibilityCastAsClass();
  id v6 = [v4 indexPathForCell:v5];

  return v6;
}

- (id)_privateAccessibilityCustomActions
{
  objc_super v3 = [MEMORY[0x263EFF980] array];
  v13.receiver = self;
  v13.super_class = (Class)HorizontalLockupCollectionViewCellAccessibility;
  v4 = [(HorizontalLockupCollectionViewCellAccessibility *)&v13 _privateAccessibilityCustomActions];
  [v3 axSafelyAddObjectsFromArray:v4];

  v5 = [(HorizontalLockupCollectionViewCellAccessibility *)self _accessibilityIndexPathForCell];
  objc_opt_class();
  id v6 = [(HorizontalLockupCollectionViewCellAccessibility *)self safeValueForKey:@"_tableLayout"];
  v7 = __UIAccessibilityCastAsClass();

  if (v7)
  {
    if (v5)
    {
      if (objc_opt_respondsToSelector())
      {
        id v8 = [v7 safeValueForKey:@"_delegateActual"];
        char v9 = objc_opt_respondsToSelector();

        if (v9)
        {
          objc_super v10 = [v7 contextualActionForDeletingRowAtIndexPath:v5];
          v11 = [(HorizontalLockupCollectionViewCellAccessibility *)self axCustomActionForContextualAction:v10];
          [v3 axSafelyAddObject:v11];
        }
      }
    }
  }

  return v3;
}

- (BOOL)_axPerformCustomAction:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  v4 = [v3 _accessibilityValueForKey:@"AXHorizontalLockupCollectionViewCellActionKey"];
  v5 = __UIAccessibilityCastAsClass();

  if (v5)
  {
    id v7 = v5;
    AXPerformSafeBlock();
  }
  return 1;
}

void __74__HorizontalLockupCollectionViewCellAccessibility__axPerformCustomAction___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) handler];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) handler];
    (*((void (**)(id, void, void, void *))v3 + 2))(v3, *(void *)(a1 + 32), *(void *)(a1 + 40), &__block_literal_global_16);
  }
}

- (id)axCustomActionForContextualAction:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4
    && ([v4 title],
        id v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 length],
        v6,
        v7))
  {
    id v8 = objc_alloc(MEMORY[0x263F1C390]);
    char v9 = [v5 title];
    objc_super v10 = (void *)[v8 initWithName:v9 target:self selector:sel__axPerformCustomAction_];

    [v10 _accessibilitySetRetainedValue:v5 forKey:@"AXHorizontalLockupCollectionViewCellActionKey"];
  }
  else
  {
    objc_super v10 = 0;
  }

  return v10;
}

@end