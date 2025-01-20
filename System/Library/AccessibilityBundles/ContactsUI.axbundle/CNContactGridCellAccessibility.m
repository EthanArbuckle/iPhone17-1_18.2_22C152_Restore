@interface CNContactGridCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
- (id)automationElements;
- (void)_axPerformCustomAction:(id)a3;
- (void)_createViewsIfNeeded;
@end

@implementation CNContactGridCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNContactGridCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNContactGridCell", @"_createViewsIfNeeded", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNContactGridCell", @"animationBlockForPreparingToShowActions", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNContactGridCell", @"avatarView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNContactGridCell", @"actionsView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNAvatarView", @"contact", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNQuickAction", @"perform", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNQuickAction", @"category", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  id v3 = [(CNContactGridCellAccessibility *)self _accessibilityAncestorIsKindOf:MEMORY[0x2456487F0](@"SearchUIContactsTableViewCell", a2)];
  if (v3)
  {
    [(CNContactGridCellAccessibility *)self _accessibilityViewAncestorIsKindOf:MEMORY[0x2456487F0](@"UICollectionView")];
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__1;
    v17 = __Block_byref_object_dispose__1;
    id v18 = 0;
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    AXPerformSafeBlock();
    id v5 = (id)v14[5];

    _Block_object_dispose(&v13, 8);
    char v6 = [v3 safeBoolForKey:@"isExpanded"];
    v7 = [MEMORY[0x263F1C920] mainScreen];
    [v7 bounds];
    double v9 = v8;

    BOOL v11 = 1;
    if ((v6 & 1) == 0)
    {
      uint64_t v10 = v9 >= 500.0 ? 6 : 4;
      if ([v5 item] >= v10) {
        BOOL v11 = 0;
      }
    }
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)CNContactGridCellAccessibility;
    BOOL v11 = [(CNContactGridCellAccessibility *)&v19 isAccessibilityElement];
  }

  return v11;
}

uint64_t __56__CNContactGridCellAccessibility_isAccessibilityElement__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) indexPathForCell:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

- (id)accessibilityLabel
{
  v15[1] = *MEMORY[0x263EF8340];
  v2 = [(CNContactGridCellAccessibility *)self safeValueForKey:@"avatarView"];
  objc_opt_class();
  id v3 = [v2 safeValueForKey:@"contact"];
  id v4 = __UIAccessibilityCastAsClass();

  id v5 = [MEMORY[0x263EFEA20] descriptorForRequiredKeysForStyle:0];
  v15[0] = v5;
  char v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];

  if (!v4) {
    goto LABEL_6;
  }
  if ([v4 areKeysAvailable:v6]) {
    goto LABEL_5;
  }
  v7 = [v4 identifier];

  if (!v7) {
    goto LABEL_5;
  }
  double v8 = accessibilityContactStore();
  double v9 = [v4 identifier];
  uint64_t v10 = [v8 unifiedContactWithIdentifier:v9 keysToFetch:v6 error:0];

  id v4 = (void *)v10;
  if (v10)
  {
LABEL_5:
    BOOL v11 = [MEMORY[0x263EFEA20] stringFromContact:v4 style:0];
  }
  else
  {
LABEL_6:
    BOOL v11 = 0;
  }
  v14 = accessibilityLocalizedString(@"contact");
  v12 = __AXStringForVariables();

  return v12;
}

- (BOOL)accessibilityActivate
{
  return 1;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (id)accessibilityCustomActions
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v20 = objc_alloc_init(MEMORY[0x263EFF980]);
  v2 = [(CNContactGridCellAccessibility *)self safeValueForKey:@"actionsView"];
  if (!v2)
  {
    uint64_t v31 = MEMORY[0x263EF8330];
    uint64_t v32 = 3221225472;
    v33 = __60__CNContactGridCellAccessibility_accessibilityCustomActions__block_invoke;
    v34 = &unk_265117F90;
    v35 = self;
    AXPerformSafeBlock();
    v2 = [(CNContactGridCellAccessibility *)self safeValueForKey:@"actionsView"];
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v17 = v2;
  id obj = [v2 actions];
  uint64_t v3 = [obj countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v28;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v28 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v27 + 1) + 8 * v5);
        uint64_t v21 = 0;
        v22 = &v21;
        uint64_t v23 = 0x3032000000;
        v24 = __Block_byref_object_copy__1;
        v25 = __Block_byref_object_dispose__1;
        id v26 = 0;
        AXPerformSafeBlock();
        id v7 = (id)v22[5];
        _Block_object_dispose(&v21, 8);

        uint64_t v8 = AXLocalizedStringFromQuickActionCategory_onceToken;
        id v9 = v7;
        if (v8 != -1) {
          dispatch_once(&AXLocalizedStringFromQuickActionCategory_onceToken, &__block_literal_global_2);
        }
        uint64_t v10 = objc_msgSend((id)AXQuickActionCategoryTable, "objectForKeyedSubscript:", v9, v13, v14, v15, v16);

        if (v10)
        {
          BOOL v11 = (void *)[objc_alloc(MEMORY[0x263F1C390]) initWithName:v10 target:self selector:sel__axPerformCustomAction_];
          [v11 _accessibilitySetRetainedValue:v6 forKey:@"AXCNActionKey"];
          [v20 addObject:v11];
        }
        else
        {
          uint64_t v15 = v6;
          id v16 = v9;
          v14 = @"Could not create title for action %@ with category %@";
          LOBYTE(v13) = 1;
          _AXLogWithFacility();
        }

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [obj countByEnumeratingWithState:&v27 objects:v36 count:16];
    }
    while (v3);
  }

  return v20;
}

id __60__CNContactGridCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) animationBlockForPreparingToShowActions];
}

uint64_t __60__CNContactGridCellAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) category];

  return MEMORY[0x270F9A758]();
}

- (void)_createViewsIfNeeded
{
  v4.receiver = self;
  v4.super_class = (Class)CNContactGridCellAccessibility;
  [(CNContactGridCellAccessibility *)&v4 _createViewsIfNeeded];
  uint64_t v3 = [(CNContactGridCellAccessibility *)self safeValueForKey:@"avatarView"];
  [v3 setIsAccessibilityElement:0];
}

- (void)_axPerformCustomAction:(id)a3
{
  objc_super v4 = [a3 _accessibilityValueForKey:@"AXCNActionKey"];
  id v3 = v4;
  AXPerformSafeBlock();
}

uint64_t __57__CNContactGridCellAccessibility__axPerformCustomAction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) perform];
}

- (id)automationElements
{
  v2 = [(CNContactGridCellAccessibility *)self _accessibilityDescendantOfType:objc_opt_class()];
  id v3 = [v2 safeValueForKey:@"_accessibilityUserTestingVisibleCells"];

  return v3;
}

@end