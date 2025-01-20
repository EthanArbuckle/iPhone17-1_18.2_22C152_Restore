@interface UICollectionViewListCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityExpandedStatusTogglesOnActivate;
- (BOOL)_accessibilityIsSpeakThisElement;
- (BOOL)_accessibilityRetainsFocusOnScreenChange;
- (BOOL)_axIsCustomAccessoryKindOfSwitch;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)_accessibilityBriefLabel;
- (id)_accessibilityRetrieveCollectionViewListCellTextExcludingDetailText:(BOOL)a3;
- (id)_accessibilitySupplementaryFooterViews;
- (id)_accessibilityTrailingViews;
- (id)_axIgnoredConfigurationIdentifiers;
- (id)_privateAccessibilityCustomActions;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)automationElements;
- (int64_t)_accessibilityExpandedStatus;
- (uint64_t)_axCellSelectionTogglesExpansionState;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityEnumerateCurrentConfigurationsWithBlock:(void *)a1;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_updateSystemTypeAccessoryView:(id)a3 withCellAccessory:(id)a4 orConfiguration:(id)a5 usingState:(id)a6;
- (void)accessibilityElementDidBecomeFocused;
@end

@implementation UICollectionViewListCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UICollectionViewListCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v18 = location;
  id v17 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = "@";
  v14 = @"UICollectionViewListCell";
  v3 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "@", "@", "@", "@", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v14, @"_setNeedsUpdateAccessories", v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v14, @"_updateCurrentSystemTypeAccessoryViewsUsingState:", v3, v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v14, @"_accessoryManager", v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v14, @"leadingAccessoryConfigurations", v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v14, @"trailingAccessoryConfigurations", v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v14, @"leadingEditingAccessoryConfigurations", v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v14, @"trailingEditingAccessoryConfigurations", v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v14, @"_toggleExpansionState", v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v14, @"_deleteAccessoryTriggered", v3, 0);
  v6 = @"UICollectionViewCell";
  v10 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v14, @"_expanded", v10, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v14, @"_setExpanded:", v3, v10, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"configurationState", v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v14, @"_cellSelectionTogglesExpansionState", v10, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UICellAccessoryManager", @"currentConfiguration", v16, 0);
  v4 = @"UICellAccessoryConfiguration";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"leadingAccessories", v16, 0);
  v5 = @"_UICellAccessoryConfiguration";
  v9 = @"_isSystemType";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  v12 = @"_systemType";
  v13 = "q";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"_identifier", v16, 0);
  [location[0] validateClass:v14 isKindOfClass:v6];
  v7 = @"_UICellViewAccessory";
  objc_msgSend(location[0], "validateClass:");
  v8 = @"_UICellAccessory";
  objc_msgSend(location[0], "validateClass:isKindOfClass:", v7);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"view", v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"identifier", v16, 0);
  v11 = @"UICellAccessory";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v11, v12, v13, 0);
  v15 = @"UIView";
  objc_msgSend(location[0], "validateClass:isKindOfClass:", v14);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v15, @"_gestureRecognizers", v16, 0);
  objc_storeStrong(v18, v17);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v10 = self;
  SEL v9 = a2;
  v8.receiver = self;
  v8.super_class = (Class)UICollectionViewListCellAccessibility;
  [(UICollectionViewListCellAccessibility *)&v8 _accessibilityLoadAccessibilityInformation];
  uint64_t v2 = MEMORY[0x263EF8330];
  int v3 = -1073741824;
  int v4 = 0;
  v5 = __83__UICollectionViewListCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v6 = &unk_2650ADF18;
  v7 = v10;
  AXPerformSafeBlock();
  objc_storeStrong((id *)&v7, 0);
}

void __83__UICollectionViewListCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setNeedsUpdateAccessories];
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = (id)[v2 safeValueForKey:@"configurationState"];
  objc_msgSend(v2, "_updateCurrentSystemTypeAccessoryViewsUsingState:");
}

- (id)accessibilityLabel
{
  return -[UICollectionViewListCellAccessibility _accessibilityRetrieveCollectionViewListCellTextExcludingDetailText:](self, "_accessibilityRetrieveCollectionViewListCellTextExcludingDetailText:", 0, a2, self);
}

- (id)_accessibilityBriefLabel
{
  return -[UICollectionViewListCellAccessibility _accessibilityRetrieveCollectionViewListCellTextExcludingDetailText:](self, "_accessibilityRetrieveCollectionViewListCellTextExcludingDetailText:", 1, a2, self);
}

- (id)_accessibilityRetrieveCollectionViewListCellTextExcludingDetailText:(BOOL)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  v34 = self;
  SEL v33 = a2;
  BOOL v32 = a3;
  char v30 = 0;
  objc_opt_class();
  id v29 = (id)__UIAccessibilityCastAsClass();
  id v28 = v29;
  objc_storeStrong(&v29, 0);
  id v31 = v28;
  if (v32)
  {
    id v27 = (id)[(UICollectionViewListCellAccessibility *)v34 accessibilityUserDefinedLabel];
    if (v27)
    {
      id v35 = v27;
      int v26 = 1;
    }
    else
    {
      id v25 = (id)[v31 contentConfiguration];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v35 = (id)[v25 text];
      }
      else {
        id v35 = (id)[v25 accessibilityLabel];
      }
      int v26 = 1;
      objc_storeStrong(&v25, 0);
    }
    objc_storeStrong(&v27, 0);
  }
  else
  {
    v23.receiver = v34;
    v23.super_class = (Class)UICollectionViewListCellAccessibility;
    id v24 = [(UICollectionViewListCellAccessibility *)&v23 accessibilityLabel];
    char v21 = 0;
    char v18 = 0;
    if (v24)
    {
      id v22 = (id)[v31 configurationState];
      char v21 = 1;
      char v18 = [v22 isEditing];
    }
    if (v21) {

    }
    if (v18)
    {
      memset(__b, 0, sizeof(__b));
      id obj = (id)[v31 accessories];
      uint64_t v17 = [obj countByEnumeratingWithState:__b objects:v36 count:16];
      if (v17)
      {
        uint64_t v13 = *(void *)__b[2];
        uint64_t v14 = 0;
        unint64_t v15 = v17;
        while (1)
        {
          uint64_t v12 = v14;
          if (*(void *)__b[2] != v13) {
            objc_enumerationMutation(obj);
          }
          id v20 = *(id *)(__b[1] + 8 * v14);
          if ((objc_msgSend(v20, "isHidden", v9) & 1) == 0)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v11 = (id)accessibilityUIKitLocalizedString();
              id v9 = v24;
              id v3 = (id)AXCFormattedString();
              id v4 = v24;
              id v24 = v3;
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v10 = (id)accessibilityUIKitLocalizedString();
                id v9 = v24;
                id v5 = (id)AXCFormattedString();
                id v6 = v24;
                id v24 = v5;
              }
            }
          }
          ++v14;
          if (v12 + 1 >= v15)
          {
            uint64_t v14 = 0;
            unint64_t v15 = [obj countByEnumeratingWithState:__b objects:v36 count:16];
            if (!v15) {
              break;
            }
          }
        }
      }
    }
    id v35 = v24;
    int v26 = 1;
    objc_storeStrong(&v24, 0);
  }
  objc_storeStrong(&v31, 0);
  v7 = v35;

  return v7;
}

- (id)accessibilityValue
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  v38 = self;
  v37[1] = (id)a2;
  v37[0] = (id)[(UICollectionViewListCellAccessibility *)self accessibilityUserDefinedValue];
  if (![v37[0] length])
  {
    v36.receiver = v38;
    v36.super_class = (Class)UICollectionViewListCellAccessibility;
    id v2 = [(UICollectionViewListCellAccessibility *)&v36 accessibilityValue];
    id v3 = v37[0];
    v37[0] = v2;

    id v17 = [(UICollectionViewListCellAccessibility *)v38 _accessibilityTrailingViews];
    id location = (id)[v17 axFilterObjectsUsingBlock:&__block_literal_global_15];

    memset(__b, 0, sizeof(__b));
    id obj = location;
    uint64_t v19 = [obj countByEnumeratingWithState:__b objects:v39 count:16];
    if (v19)
    {
      uint64_t v14 = *(void *)__b[2];
      uint64_t v15 = 0;
      unint64_t v16 = v19;
      while (1)
      {
        uint64_t v13 = v15;
        if (*(void *)__b[2] != v14) {
          objc_enumerationMutation(obj);
        }
        id v34 = *(id *)(__b[1] + 8 * v15);
        id v10 = (id)objc_msgSend(v34, "accessibilityLabel", v10, v11);
        id v11 = @"__AXStringForVariablesSentinel";
        id v4 = (id)__UIAXStringForVariables();
        id v5 = v37[0];
        v37[0] = v4;

        ++v15;
        if (v13 + 1 >= v16)
        {
          uint64_t v15 = 0;
          unint64_t v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v39, 16, v10, @"__AXStringForVariablesSentinel");
          if (!v16) {
            break;
          }
        }
      }
    }

    objc_storeStrong(&location, 0);
  }
  if ([(UICollectionViewListCellAccessibility *)v38 _axIsCustomAccessoryKindOfSwitch])
  {
    char v31 = 0;
    objc_opt_class();
    id v30 = (id)__UIAccessibilityCastAsClass();
    id v29 = v30;
    objc_storeStrong(&v30, 0);
    id v32 = (id)[v29 accessories];

    id v28 = 0;
    if ([v32 count] == 1)
    {
      id v27 = (id)[v32 firstObject];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char v25 = 0;
        objc_opt_class();
        id v24 = (id)__UIAccessibilityCastAsClass();
        id v23 = v24;
        objc_storeStrong(&v24, 0);
        id v26 = (id)[v23 customView];

        char v22 = 0;
        objc_opt_class();
        id v21 = (id)__UIAccessibilityCastAsClass();
        id v20 = v21;
        objc_storeStrong(&v21, 0);
        id v6 = v28;
        id v28 = v20;

        objc_storeStrong(&v26, 0);
      }
      objc_storeStrong(&v27, 0);
    }
    id v7 = (id)[v28 accessibilityValue];
    id v8 = v37[0];
    v37[0] = v7;

    objc_storeStrong(&v28, 0);
    objc_storeStrong(&v32, 0);
  }
  id v12 = v37[0];
  objc_storeStrong(v37, 0);

  return v12;
}

uint64_t __59__UICollectionViewListCellAccessibility_accessibilityValue__block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

- (id)_accessibilitySupplementaryFooterViews
{
  id v7 = self;
  location[1] = (id)a2;
  v5.receiver = self;
  v5.super_class = (Class)UICollectionViewListCellAccessibility;
  location[0] = [(UICollectionViewListCellAccessibility *)&v5 _accessibilitySupplementaryFooterViews];
  if (location[0]
    || [(UICollectionViewListCellAccessibility *)v7 _axIsCustomAccessoryKindOfSwitch])
  {
    id v8 = location[0];
  }
  else
  {
    id v4 = [(UICollectionViewListCellAccessibility *)v7 _accessibilityTrailingViews];
    id v8 = (id)[v4 axFilterObjectsUsingBlock:&__block_literal_global_400];
  }
  objc_storeStrong(location, 0);
  id v2 = v8;

  return v2;
}

uint64_t __79__UICollectionViewListCellAccessibility__accessibilitySupplementaryFooterViews__block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_opt_class();
  int v3 = objc_opt_isKindOfClass() ^ 1;
  objc_storeStrong(location, 0);
  return v3 & 1;
}

- (BOOL)_accessibilityRetainsFocusOnScreenChange
{
  return 1;
}

- (id)_axIgnoredConfigurationIdentifiers
{
  if (a1)
  {
    id v4 = (dispatch_once_t *)&_axIgnoredConfigurationIdentifiers_onceToken;
    id location = 0;
    objc_storeStrong(&location, &__block_literal_global_402);
    if (*v4 != -1) {
      dispatch_once(v4, location);
    }
    objc_storeStrong(&location, 0);
    id v2 = (id)_axIgnoredConfigurationIdentifiers_ignoredIdentifiers;
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

void __75__UICollectionViewListCellAccessibility__axIgnoredConfigurationIdentifiers__block_invoke(void *a1)
{
  v9[2] = a1;
  v9[1] = a1;
  v9[0] = (id)objc_opt_new();
  id v3 = objc_alloc_init(MEMORY[0x263F1CC28]);
  id v8 = (id)objc_msgSend(v3, "safeStringForKey:");

  [v9[0] axSafelyAddObject:v8];
  id v4 = objc_alloc_init(MEMORY[0x263F1CC30]);
  id v7 = (id)[v4 safeStringForKey:@"_identifier"];

  [v9[0] axSafelyAddObject:v7];
  id v5 = (id)[objc_alloc(MEMORY[0x263F1CC38]) initWithCellSelectionTogglesExpansionState:0];
  id v6 = (id)[v5 safeStringForKey:@"_identifier"];

  [v9[0] axSafelyAddObject:v6];
  uint64_t v1 = [v9[0] copy];
  id v2 = (void *)_axIgnoredConfigurationIdentifiers_ignoredIdentifiers;
  _axIgnoredConfigurationIdentifiers_ignoredIdentifiers = v1;

  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(v9, 0);
}

- (id)_accessibilityTrailingViews
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v27 = self;
  v26[1] = (id)a2;
  v26[0] = objc_alloc_init(MEMORY[0x263EFF980]);
  id v16 = (id)[(UICollectionViewListCellAccessibility *)v27 safeValueForKey:@"_accessoryManager"];
  id v25 = (id)[v16 safeValueForKey:@"currentConfiguration"];

  memset(__b, 0, sizeof(__b));
  id obj = (id)[v25 safeArrayForKey:@"trailingAccessories"];
  uint64_t v18 = [obj countByEnumeratingWithState:__b objects:v29 count:16];
  if (v18)
  {
    uint64_t v13 = *(void *)__b[2];
    uint64_t v14 = 0;
    unint64_t v15 = v18;
    while (1)
    {
      uint64_t v12 = v14;
      if (*(void *)__b[2] != v13) {
        objc_enumerationMutation(obj);
      }
      id v24 = *(id *)(__b[1] + 8 * v14);
      char v22 = 0;
      id location = (id)[v24 safeStringForKey:@"identifier"];
      memset(v19, 0, sizeof(v19));
      id v10 = -[UICollectionViewListCellAccessibility _axIgnoredConfigurationIdentifiers]((uint64_t)v27);
      uint64_t v11 = [v10 countByEnumeratingWithState:v19 objects:v28 count:16];
      if (v11)
      {
        uint64_t v7 = *(void *)v19[2];
        uint64_t v8 = 0;
        unint64_t v9 = v11;
        while (1)
        {
          uint64_t v6 = v8;
          if (*(void *)v19[2] != v7) {
            objc_enumerationMutation(v10);
          }
          uint64_t v20 = *(void *)(v19[1] + 8 * v8);
          char v22 = [location _containsSubstring:v20] & 1;
          if (v22) {
            break;
          }
          ++v8;
          if (v6 + 1 >= v9)
          {
            uint64_t v8 = 0;
            unint64_t v9 = [v10 countByEnumeratingWithState:v19 objects:v28 count:16];
            if (!v9) {
              break;
            }
          }
        }
      }

      if ((v22 & 1) == 0)
      {
        NSClassFromString(&cfstr_Uicellviewacce.isa);
        if (objc_opt_isKindOfClass())
        {
          id v4 = v26[0];
          id v5 = (id)[v24 safeValueForKey:@"view"];
          objc_msgSend(v4, "axSafelyAddObject:");
        }
      }
      objc_storeStrong(&location, 0);
      ++v14;
      if (v12 + 1 >= v15)
      {
        uint64_t v14 = 0;
        unint64_t v15 = [obj countByEnumeratingWithState:__b objects:v29 count:16];
        if (!v15) {
          break;
        }
      }
    }
  }

  id v3 = v26[0];
  objc_storeStrong(&v25, 0);
  objc_storeStrong(v26, 0);

  return v3;
}

- (BOOL)isAccessibilityElement
{
  id v2 = (id)[(UICollectionViewListCellAccessibility *)self isAccessibilityUserDefinedElement];
  BOOL v6 = v2 == 0;

  if (v6)
  {
    id v4 = [(UICollectionViewListCellAccessibility *)self accessibilityLabel];
    BOOL v8 = [v4 length] != 0;
  }
  else
  {
    id v5 = (id)[(UICollectionViewListCellAccessibility *)self isAccessibilityUserDefinedElement];
    BOOL v8 = [v5 BOOLValue] & 1;
  }
  return v8;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v26 = self;
  SEL v25 = a2;
  unint64_t v24 = 0;
  v23.receiver = self;
  v23.super_class = (Class)UICollectionViewListCellAccessibility;
  unint64_t v24 = [(UICollectionViewListCellAccessibility *)&v23 accessibilityTraits];
  if ([(UICollectionViewListCellAccessibility *)v26 _accessibilityExpandedStatus]
    && (-[UICollectionViewListCellAccessibility _axCellSelectionTogglesExpansionState](v26) & 1) != 0)
  {
    v24 |= *MEMORY[0x263F1CEE8];
  }
  id v22 = (id)[(UICollectionViewListCellAccessibility *)v26 contentView];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = (id)[v22 configuration];
    uint64_t v2 = [v12 accessibilityTraits];
    v24 |= v2;
  }
  memset(__b, 0, sizeof(__b));
  char v19 = 0;
  objc_opt_class();
  id v18 = (id)__UIAccessibilityCastAsClass();
  id v17 = v18;
  objc_storeStrong(&v18, 0);
  id obj = (id)[v17 accessories];

  uint64_t v11 = [obj countByEnumeratingWithState:__b objects:v27 count:16];
  if (v11)
  {
    uint64_t v7 = *(void *)__b[2];
    uint64_t v8 = 0;
    unint64_t v9 = v11;
    while (1)
    {
      uint64_t v6 = v8;
      if (*(void *)__b[2] != v7) {
        objc_enumerationMutation(obj);
      }
      id v21 = *(id *)(__b[1] + 8 * v8);
      if (([v21 isHidden] & 1) == 0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v24 |= *MEMORY[0x263F1CEE8];
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v24 |= *MEMORY[0x263F1CF38];
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v15 = 0;
          objc_opt_class();
          id v14 = (id)__UIAccessibilityCastAsClass();
          if (v15) {
            abort();
          }
          id v13 = v14;
          objc_storeStrong(&v14, 0);
          id v16 = (id)[v13 customView];

          if (v16)
          {
            uint64_t v3 = [v16 accessibilityTraits];
            v24 |= v3;
          }
          objc_storeStrong(&v16, 0);
        }
      }
      ++v8;
      if (v6 + 1 >= v9)
      {
        uint64_t v8 = 0;
        unint64_t v9 = [obj countByEnumeratingWithState:__b objects:v27 count:16];
        if (!v9) {
          break;
        }
      }
    }
  }

  unint64_t v5 = v24;
  objc_storeStrong(&v22, 0);
  return v5;
}

- (uint64_t)_axCellSelectionTogglesExpansionState
{
  if (a1) {
    char v2 = [a1 safeBoolForKey:@"_cellSelectionTogglesExpansionState"] & 1;
  }
  else {
    char v2 = 0;
  }
  return v2 & 1;
}

- (CGPoint)accessibilityActivationPoint
{
  id v18 = self;
  v17[1] = (id)a2;
  if ([(UICollectionViewListCellAccessibility *)self _axIsCustomAccessoryKindOfSwitch])
  {
    char v16 = 0;
    objc_opt_class();
    id v15 = (id)__UIAccessibilityCastAsClass();
    id v14 = v15;
    objc_storeStrong(&v15, 0);
    id v8 = (id)[v14 accessories];
    v17[0] = (id)[v8 firstObject];

    char v12 = 0;
    objc_opt_class();
    id v11 = (id)__UIAccessibilityCastAsClass();
    id v10 = v11;
    objc_storeStrong(&v11, 0);
    id v13 = (id)[v10 customView];

    [v13 accessibilityActivationPoint];
    double v19 = v2;
    double v20 = v3;
    objc_storeStrong(&v13, 0);
    objc_storeStrong(v17, 0);
  }
  else
  {
    v9.receiver = v18;
    v9.super_class = (Class)UICollectionViewListCellAccessibility;
    [(UICollectionViewListCellAccessibility *)&v9 accessibilityActivationPoint];
    double v19 = v4;
    double v20 = v5;
  }
  double v6 = v19;
  double v7 = v20;
  result.y = v7;
  result.x = v6;
  return result;
}

- (BOOL)_axIsCustomAccessoryKindOfSwitch
{
  v12[2] = self;
  v12[1] = (id)a2;
  char v11 = 0;
  objc_opt_class();
  id v10 = (id)__UIAccessibilityCastAsClass();
  id v9 = v10;
  objc_storeStrong(&v10, 0);
  v12[0] = (id)[v9 accessories];

  if ([v12[0] count] != 1) {
    goto LABEL_6;
  }
  id v8 = (id)[v12[0] firstObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v6 = 0;
    objc_opt_class();
    id v5 = (id)__UIAccessibilityCastAsClass();
    id v4 = v5;
    objc_storeStrong(&v5, 0);
    id v7 = (id)[v4 customView];

    objc_opt_class();
    char v13 = objc_opt_isKindOfClass() & 1;
    int v3 = 1;
    objc_storeStrong(&v7, 0);
  }
  else
  {
    int v3 = 0;
  }
  objc_storeStrong(&v8, 0);
  if (!v3) {
LABEL_6:
  }
    char v13 = 0;
  objc_storeStrong(v12, 0);
  return v13 & 1;
}

- (BOOL)_accessibilityIsSpeakThisElement
{
  return 1;
}

- (int64_t)_accessibilityExpandedStatus
{
  id v17 = self;
  SEL v16 = a2;
  uint64_t v11 = 0;
  char v12 = &v11;
  int v13 = 0x20000000;
  int v14 = 32;
  char v15 = 0;
  char v15 = -[UICollectionViewListCellAccessibility _axCellSelectionTogglesExpansionState](self) & 1;
  if ((v12[3] & 1) == 0)
  {
    uint64_t v5 = MEMORY[0x263EF8330];
    int v6 = -1073741824;
    int v7 = 0;
    id v8 = __69__UICollectionViewListCellAccessibility__accessibilityExpandedStatus__block_invoke;
    id v9 = &unk_2650AEC08;
    id v10 = &v11;
    -[UICollectionViewListCellAccessibility _accessibilityEnumerateCurrentConfigurationsWithBlock:](v17, &v5);
  }
  if (v12[3])
  {
    char v4 = [(UICollectionViewListCellAccessibility *)v17 safeBoolForKey:@"_expanded"];
    uint64_t v2 = 2;
    if (v4) {
      uint64_t v2 = 1;
    }
    int64_t v18 = v2;
  }
  else
  {
    int64_t v18 = 0;
  }
  _Block_object_dispose(&v11, 8);
  return v18;
}

void __69__UICollectionViewListCellAccessibility__accessibilityExpandedStatus__block_invoke(void *a1, void *a2, char a3, uint64_t a4, unsigned char *a5)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  char v9 = 0;
  if (a4 == 6) {
    char v9 = a3 & 1;
  }
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = v9 & 1;
  *a5 = *(unsigned char *)(*(void *)(a1[4] + 8) + 24) & 1;
  objc_storeStrong(location, 0);
}

- (void)_accessibilityEnumerateCurrentConfigurationsWithBlock:(void *)a1
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v36 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v36)
  {
    uint64_t v29 = 0;
    uint64_t v30 = &v29;
    int v31 = 0x20000000;
    int v32 = 32;
    char v33 = 0;
    uint64_t v22 = MEMORY[0x263EF8330];
    int v23 = -1073741824;
    int v24 = 0;
    SEL v25 = __95__UICollectionViewListCellAccessibility__accessibilityEnumerateCurrentConfigurationsWithBlock___block_invoke;
    id v26 = &unk_2650AED20;
    v27[1] = &v29;
    v27[0] = location;
    id v28 = (id)MEMORY[0x2455E7040](&v22);
    char v21 = [v36 safeBoolForKey:@"isEditing"] & 1;
    if (v21)
    {
      char v15 = (void (**)(void))v28;
      id v14 = (id)[v36 safeArrayForKey:@"leadingEditingAccessoryConfigurations"];
      v15[2]();

      int v13 = (void (**)(void))v28;
      id v12 = (id)[v36 safeArrayForKey:@"trailingEditingAccessoryConfigurations"];
      v13[2]();
    }
    else
    {
      uint64_t v11 = (void (**)(void))v28;
      id v10 = (id)[v36 safeArrayForKey:@"leadingAccessoryConfigurations"];
      v11[2]();

      char v9 = (void (**)(void))v28;
      id v8 = (id)[v36 safeArrayForKey:@"trailingAccessoryConfigurations"];
      v9[2]();
    }
    memset(__b, 0, sizeof(__b));
    id obj = (id)[v36 accessories];
    uint64_t v7 = [obj countByEnumeratingWithState:__b objects:v37 count:16];
    if (v7)
    {
      uint64_t v3 = *(void *)__b[2];
      uint64_t v4 = 0;
      unint64_t v5 = v7;
      while (1)
      {
        uint64_t v2 = v4;
        if (*(void *)__b[2] != v3) {
          objc_enumerationMutation(obj);
        }
        id v20 = *(id *)(__b[1] + 8 * v4);
        uint64_t v18 = [v20 displayedState];
        if (([v20 isHidden] & 1) == 0
          && (!v18 || (v21 & 1) != 0 && v18 == 1 || (v21 & 1) == 0 && v18 == 2))
        {
          char v17 = [v20 safeBoolForKey:@"_isSystemType"] & 1;
          uint64_t v16 = 0;
          if (v17) {
            uint64_t v16 = [v20 safeIntegerForKey:@"_systemType"];
          }
          (*((void (**)(id, void, void, uint64_t, uint64_t *))location + 2))(location, 0, v17 & 1, v16, v30 + 3);
          if (v30[3]) {
            break;
          }
        }
        ++v4;
        if (v2 + 1 >= v5)
        {
          uint64_t v4 = 0;
          unint64_t v5 = [obj countByEnumeratingWithState:__b objects:v37 count:16];
          if (!v5) {
            goto LABEL_22;
          }
        }
      }
      int v34 = 2;
    }
    else
    {
LABEL_22:
      int v34 = 0;
    }

    objc_storeStrong(&v28, 0);
    objc_storeStrong(v27, 0);
    _Block_object_dispose(&v29, 8);
    int v34 = 0;
  }
  else
  {
    int v34 = 1;
  }
  objc_storeStrong(&location, 0);
}

- (BOOL)_accessibilityExpandedStatusTogglesOnActivate
{
  return -[UICollectionViewListCellAccessibility _axCellSelectionTogglesExpansionState](self) & 1;
}

- (id)_privateAccessibilityCustomActions
{
  uint64_t v16 = self;
  v15[1] = (id)a2;
  v15[0] = (id)[MEMORY[0x263EFF980] array];
  id v3 = v15[0];
  v14.receiver = v16;
  v14.super_class = (Class)UICollectionViewListCellAccessibility;
  id v4 = [(UICollectionViewListCellAccessibility *)&v14 _privateAccessibilityCustomActions];
  objc_msgSend(v3, "axSafelyAddObjectsFromArray:");

  unint64_t v5 = v16;
  uint64_t v7 = MEMORY[0x263EF8330];
  int v8 = -1073741824;
  int v9 = 0;
  id v10 = __75__UICollectionViewListCellAccessibility__privateAccessibilityCustomActions__block_invoke;
  uint64_t v11 = &unk_2650AECD0;
  id v12 = v16;
  id v13 = v15[0];
  -[UICollectionViewListCellAccessibility _accessibilityEnumerateCurrentConfigurationsWithBlock:](v5, &v7);
  id v6 = v15[0];
  objc_storeStrong(&v13, 0);
  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(v15, 0);

  return v6;
}

void __75__UICollectionViewListCellAccessibility__privateAccessibilityCustomActions__block_invoke(id *a1, void *a2, char a3, uint64_t a4, void *a5)
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  char v79 = a3 & 1;
  uint64_t v78 = a4;
  v77[2] = a5;
  v77[1] = a1;
  v77[0] = 0;
  if (a3)
  {
    if (v78)
    {
      uint64_t v6 = v78;
      char v5 = 1;
    }
    else
    {
      uint64_t v6 = 0;
      char v5 = 0;
    }
    if ((v5 & 1) == 0)
    {
      switch(v6)
      {
        case 0:
        case 1:
        case 4:
        case 5:
        case 7:
        case 8:
        case 10:
          goto LABEL_29;
        case 2:
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v62 = location[0];
            objc_initWeak(&from, a1[4]);
            id v22 = objc_alloc(MEMORY[0x263F1C390]);
            id v21 = (id)UIKitAccessibilityLocalizedString();
            uint64_t v54 = MEMORY[0x263EF8330];
            int v55 = -1073741824;
            int v56 = 0;
            v57 = __75__UICollectionViewListCellAccessibility__privateAccessibilityCustomActions__block_invoke_4;
            v58 = &unk_2650AEB90;
            id v59 = v62;
            objc_copyWeak(&v60, &from);
            id v20 = (void *)[v22 initWithName:v21 actionHandler:&v54];
            id v8 = v77[0];
            v77[0] = v20;

            objc_destroyWeak(&v60);
            objc_storeStrong(&v59, 0);
            objc_destroyWeak(&from);
            objc_storeStrong(&v62, 0);
          }
          goto LABEL_29;
        case 3:
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v53 = location[0];
            id v9 = (id)[v53 actionHandler];
            BOOL v19 = v9 == 0;

            if (!v19)
            {
              id v18 = objc_alloc(MEMORY[0x263F1C390]);
              id v16 = (id)UIKitAccessibilityLocalizedString();
              uint64_t v47 = MEMORY[0x263EF8330];
              int v48 = -1073741824;
              int v49 = 0;
              v50 = __75__UICollectionViewListCellAccessibility__privateAccessibilityCustomActions__block_invoke_6;
              v51 = &unk_2650AEC30;
              id v52 = v53;
              char v17 = (void *)[v18 initWithName:v16 actionHandler:&v47];
              id v10 = v77[0];
              v77[0] = v17;

              objc_storeStrong(&v52, 0);
            }
            objc_storeStrong(&v53, 0);
          }
          goto LABEL_29;
        case 6:
          objc_initWeak(&v46, a1[4]);
          char v45 = 0;
          char v45 = [a1[4] safeBoolForKey:@"_expanded"] & 1;
          if (v45) {
            uint64_t v11 = @"list.cell.accessory.outlinedisclosure.collapse.action";
          }
          else {
            uint64_t v11 = @"list.cell.accessory.outlinedisclosure.expand.action";
          }
          id v44 = v11;
          id v15 = objc_alloc(MEMORY[0x263F1C390]);
          id v14 = (id)UIKitAccessibilityLocalizedString();
          uint64_t v37 = MEMORY[0x263EF8330];
          int v38 = -1073741824;
          int v39 = 0;
          uint64_t v40 = __75__UICollectionViewListCellAccessibility__privateAccessibilityCustomActions__block_invoke_7;
          v41 = &unk_2650AECA8;
          objc_copyWeak(&v42, &v46);
          char v43 = v45 & 1;
          id v13 = (void *)[v15 initWithName:v14 actionHandler:&v37];
          id v12 = v77[0];
          v77[0] = v13;

          int v63 = 2;
          objc_destroyWeak(&v42);
          objc_storeStrong(&v44, 0);
          objc_destroyWeak(&v46);
          goto LABEL_29;
        case 9:
          objc_initWeak(&v76, a1[4]);
          memset(__b, 0, sizeof(__b));
          char v73 = 0;
          objc_opt_class();
          id v32 = objc_loadWeakRetained(&v76);
          id v72 = (id)__UIAccessibilityCastAsClass();

          id v71 = v72;
          objc_storeStrong(&v72, 0);
          id obj = (id)[v71 accessories];

          uint64_t v30 = [obj countByEnumeratingWithState:__b objects:v81 count:16];
          if (!v30) {
            goto LABEL_15;
          }
          uint64_t v27 = *(void *)__b[2];
          uint64_t v28 = 0;
          unint64_t v29 = v30;
          break;
        default:
          JUMPOUT(0);
      }
      while (1)
      {
        uint64_t v26 = v28;
        if (*(void *)__b[2] != v27) {
          objc_enumerationMutation(obj);
        }
        id v75 = *(id *)(__b[1] + 8 * v28);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v70 = v75;
          id v25 = objc_alloc(MEMORY[0x263F1C390]);
          id v23 = (id)UIKitAccessibilityLocalizedString();
          uint64_t v64 = MEMORY[0x263EF8330];
          int v65 = -1073741824;
          int v66 = 0;
          v67 = __75__UICollectionViewListCellAccessibility__privateAccessibilityCustomActions__block_invoke_2;
          v68 = &unk_2650AEC30;
          id v69 = v70;
          int v24 = (void *)[v25 initWithName:v23 actionHandler:&v64];
          id v7 = v77[0];
          v77[0] = v24;

          int v63 = 3;
          objc_storeStrong(&v69, 0);
          objc_storeStrong(&v70, 0);
          goto LABEL_16;
        }
        ++v28;
        if (v26 + 1 >= v29)
        {
          uint64_t v28 = 0;
          unint64_t v29 = [obj countByEnumeratingWithState:__b objects:v81 count:16];
          if (!v29) {
            break;
          }
        }
      }
LABEL_15:
      int v63 = 0;
LABEL_16:

      int v63 = 2;
      objc_destroyWeak(&v76);
    }
  }
LABEL_29:
  [a1[5] axSafelyAddObject:v77[0]];
  objc_storeStrong(v77, 0);
  objc_storeStrong(location, 0);
}

uint64_t __75__UICollectionViewListCellAccessibility__privateAccessibilityCustomActions__block_invoke_2(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v9[1] = a1;
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = __75__UICollectionViewListCellAccessibility__privateAccessibilityCustomActions__block_invoke_3;
  id v8 = &unk_2650ADF18;
  v9[0] = a1[4];
  AXPerformSafeBlock();
  objc_storeStrong(v9, 0);
  objc_storeStrong(location, 0);
  return 1;
}

void __75__UICollectionViewListCellAccessibility__privateAccessibilityCustomActions__block_invoke_3(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) actionHandler];
  BOOL v4 = v1 == 0;

  if (!v4)
  {
    uint64_t v2 = (void (**)(void))(id)[*(id *)(a1 + 32) actionHandler];
    v2[2]();
  }
}

uint64_t __75__UICollectionViewListCellAccessibility__privateAccessibilityCustomActions__block_invoke_4(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v10[1] = a1;
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = __75__UICollectionViewListCellAccessibility__privateAccessibilityCustomActions__block_invoke_5;
  id v8 = &unk_2650AEC58;
  id v9 = a1[4];
  objc_copyWeak(v10, a1 + 5);
  AXPerformSafeBlock();
  objc_destroyWeak(v10);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return 1;
}

void __75__UICollectionViewListCellAccessibility__privateAccessibilityCustomActions__block_invoke_5(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) actionHandler];
  BOOL v5 = v1 == 0;

  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _deleteAccessoryTriggered];
  }
  else
  {
    id v3 = (void (**)(void))(id)[*(id *)(a1 + 32) actionHandler];
    v3[2]();
  }
}

uint64_t __75__UICollectionViewListCellAccessibility__privateAccessibilityCustomActions__block_invoke_6(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  uint64_t v4 = (void (**)(void))(id)[a1[4] actionHandler];
  v4[2]();

  objc_storeStrong(location, 0);
  return 1;
}

uint64_t __75__UICollectionViewListCellAccessibility__privateAccessibilityCustomActions__block_invoke_7(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  uint64_t v6 = a1;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  char v5 = *(unsigned char *)(a1 + 40) & 1;
  AXPerformSafeBlock();
  UIAccessibilityPostNotification(0x416u, 0);
  objc_destroyWeak(&v4);
  objc_storeStrong(location, 0);
  return 1;
}

void __75__UICollectionViewListCellAccessibility__privateAccessibilityCustomActions__block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setExpanded:(*(unsigned char *)(a1 + 40) ^ 1) & 1];

  id v3 = objc_loadWeakRetained((id *)(a1 + 32));
  [v3 _toggleExpansionState];
}

- (id)automationElements
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v34 = self;
  v33[1] = (id)a2;
  v33[0] = (id)objc_opt_new();
  id v14 = v33[0];
  v32.receiver = v34;
  v32.super_class = (Class)UICollectionViewListCellAccessibility;
  id v15 = [(UICollectionViewListCellAccessibility *)&v32 automationElements];
  objc_msgSend(v14, "axSafelyAddObjectsFromArray:");

  uint64_t v24 = MEMORY[0x263EF8330];
  int v25 = -1073741824;
  int v26 = 0;
  uint64_t v27 = __59__UICollectionViewListCellAccessibility_automationElements__block_invoke;
  uint64_t v28 = &unk_2650AECF8;
  id v29 = v34;
  id v30 = v33[0];
  id v31 = (id)MEMORY[0x2455E7040](&v24);
  id v16 = (id)[v34 safeValueForKey:@"_accessoryManager"];
  id location = (id)[v16 safeValueForKey:@"currentConfiguration"];

  memset(__b, 0, sizeof(__b));
  id obj = (id)[location safeArrayForKey:@"trailingAccessories"];
  uint64_t v18 = [obj countByEnumeratingWithState:__b objects:v36 count:16];
  if (v18)
  {
    uint64_t v11 = *(void *)__b[2];
    uint64_t v12 = 0;
    unint64_t v13 = v18;
    while (1)
    {
      uint64_t v10 = v12;
      if (*(void *)__b[2] != v11) {
        objc_enumerationMutation(obj);
      }
      uint64_t v22 = *(void *)(__b[1] + 8 * v12);
      (*((void (**)(id, uint64_t))v31 + 2))(v31, v22);
      ++v12;
      if (v10 + 1 >= v13)
      {
        uint64_t v12 = 0;
        unint64_t v13 = [obj countByEnumeratingWithState:__b objects:v36 count:16];
        if (!v13) {
          break;
        }
      }
    }
  }

  memset(v19, 0, sizeof(v19));
  id v8 = (id)[location safeArrayForKey:@"leadingAccessories"];
  uint64_t v9 = [v8 countByEnumeratingWithState:v19 objects:v35 count:16];
  if (v9)
  {
    uint64_t v5 = *(void *)v19[2];
    uint64_t v6 = 0;
    unint64_t v7 = v9;
    while (1)
    {
      uint64_t v4 = v6;
      if (*(void *)v19[2] != v5) {
        objc_enumerationMutation(v8);
      }
      uint64_t v20 = *(void *)(v19[1] + 8 * v6);
      (*((void (**)(id, uint64_t))v31 + 2))(v31, v20);
      ++v6;
      if (v4 + 1 >= v7)
      {
        uint64_t v6 = 0;
        unint64_t v7 = [v8 countByEnumeratingWithState:v19 objects:v35 count:16];
        if (!v7) {
          break;
        }
      }
    }
  }

  id v3 = v33[0];
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(v33, 0);

  return v3;
}

void __59__UICollectionViewListCellAccessibility_automationElements__block_invoke(uint64_t *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v13[1] = a1;
  v13[0] = (id)[location[0] safeStringForKey:@"identifier"];
  memset(__b, 0, sizeof(__b));
  id obj = -[UICollectionViewListCellAccessibility _axIgnoredConfigurationIdentifiers](a1[4]);
  uint64_t v10 = [obj countByEnumeratingWithState:__b objects:v15 count:16];
  if (v10)
  {
    uint64_t v5 = *(void *)__b[2];
    uint64_t v6 = 0;
    unint64_t v7 = v10;
    while (1)
    {
      uint64_t v4 = v6;
      if (*(void *)__b[2] != v5) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(void *)(__b[1] + 8 * v6);
      if ([v13[0] _containsSubstring:v12])
      {
        NSClassFromString(&cfstr_Uicellviewacce.isa);
        if (objc_opt_isKindOfClass())
        {
          uint64_t v2 = (void *)a1[5];
          id v3 = (id)[location[0] safeValueForKey:@"view"];
          objc_msgSend(v2, "axSafelyAddObject:");
        }
      }
      ++v6;
      if (v4 + 1 >= v7)
      {
        uint64_t v6 = 0;
        unint64_t v7 = [obj countByEnumeratingWithState:__b objects:v15 count:16];
        if (!v7) {
          break;
        }
      }
    }
  }

  objc_storeStrong(v13, 0);
  objc_storeStrong(location, 0);
}

- (void)accessibilityElementDidBecomeFocused
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v16 = self;
  SEL v15 = a2;
  v14.receiver = self;
  v14.super_class = (Class)UICollectionViewListCellAccessibility;
  [(UICollectionViewListCellAccessibility *)&v14 accessibilityElementDidBecomeFocused];
  id v13 = (id)[(UICollectionViewListCellAccessibility *)v16 safeArrayForKey:@"_gestureRecognizers"];
  memset(__b, 0, 0x40uLL);
  id obj = v13;
  uint64_t v7 = [obj countByEnumeratingWithState:__b objects:v17 count:16];
  if (v7)
  {
    uint64_t v3 = *(void *)__b[2];
    uint64_t v4 = 0;
    unint64_t v5 = v7;
    while (1)
    {
      uint64_t v2 = v4;
      if (*(void *)__b[2] != v3) {
        objc_enumerationMutation(obj);
      }
      void __b[8] = *(void *)(__b[1] + 8 * v4);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char v10 = 0;
        objc_opt_class();
        id v9 = (id)__UIAccessibilityCastAsSafeCategory();
        if (v10) {
          abort();
        }
        id v8 = v9;
        objc_storeStrong(&v9, 0);
        *(void *)uint64_t v11 = v8;
        -[UIHoverGestureRecognizerAccessibility _axSetOverrideStateEnabled:forFocusedElement:](v8, 1, v16);
        objc_storeStrong((id *)v11, 0);
      }
      ++v4;
      if (v2 + 1 >= v5)
      {
        uint64_t v4 = 0;
        unint64_t v5 = [obj countByEnumeratingWithState:__b objects:v17 count:16];
        if (!v5) {
          break;
        }
      }
    }
  }

  objc_storeStrong(&v13, 0);
}

- (void)_updateSystemTypeAccessoryView:(id)a3 withCellAccessory:(id)a4 orConfiguration:(id)a5 usingState:(id)a6
{
  uint64_t v54 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v52 = 0;
  objc_storeStrong(&v52, a4);
  id v51 = 0;
  objc_storeStrong(&v51, a5);
  id v50 = 0;
  objc_storeStrong(&v50, a6);
  v49.receiver = v54;
  v49.super_class = (Class)UICollectionViewListCellAccessibility;
  [(UICollectionViewListCellAccessibility *)&v49 _updateSystemTypeAccessoryView:location[0] withCellAccessory:v52 orConfiguration:v51 usingState:v50];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v28 = (id)[(UICollectionViewListCellAccessibility *)v54 accessibilityIdentifier];
        char v47 = 0;
        BOOL v29 = 0;
        if (v28)
        {
          id v48 = (id)[location[0] accessibilityIdentifier];
          char v47 = 1;
          BOOL v29 = v48 == 0;
        }
        if (v47) {

        }
        if (v29)
        {
          id v27 = (id)[(UICollectionViewListCellAccessibility *)v54 accessibilityIdentifier];
          objc_msgSend(location[0], "setAccessibilityIdentifier:");
        }
        id v25 = [(UICollectionViewListCellAccessibility *)v54 accessibilityLabel];
        char v45 = 0;
        BOOL v26 = 0;
        if (v25)
        {
          id v46 = (id)[location[0] accessibilityLabel];
          char v45 = 1;
          BOOL v26 = v46 == 0;
        }
        if (v45) {

        }
        if (v26)
        {
          id v24 = [(UICollectionViewListCellAccessibility *)v54 accessibilityLabel];
          objc_msgSend(location[0], "setAccessibilityLabel:");
        }
        id v22 = (id)[(UICollectionViewListCellAccessibility *)v54 accessibilityAttributedLabel];
        char v43 = 0;
        BOOL v23 = 0;
        if (v22)
        {
          id v44 = (id)[location[0] accessibilityAttributedLabel];
          char v43 = 1;
          BOOL v23 = v44 == 0;
        }
        if (v43) {

        }
        if (v23)
        {
          id v21 = (id)[(UICollectionViewListCellAccessibility *)v54 accessibilityAttributedLabel];
          objc_msgSend(location[0], "setAccessibilityAttributedLabel:");
        }
        id v19 = [(UICollectionViewListCellAccessibility *)v54 accessibilityValue];
        char v41 = 0;
        BOOL v20 = 0;
        if (v19)
        {
          id v42 = (id)[location[0] accessibilityValue];
          char v41 = 1;
          BOOL v20 = v42 == 0;
        }
        if (v41) {

        }
        if (v20)
        {
          id v18 = [(UICollectionViewListCellAccessibility *)v54 accessibilityValue];
          objc_msgSend(location[0], "setAccessibilityValue:");
        }
        id v16 = (id)[(UICollectionViewListCellAccessibility *)v54 accessibilityAttributedValue];
        char v39 = 0;
        BOOL v17 = 0;
        if (v16)
        {
          id v40 = (id)[location[0] accessibilityAttributedValue];
          char v39 = 1;
          BOOL v17 = v40 == 0;
        }
        if (v39) {

        }
        if (v17)
        {
          id v15 = (id)[(UICollectionViewListCellAccessibility *)v54 accessibilityAttributedValue];
          objc_msgSend(location[0], "setAccessibilityAttributedValue:");
        }
        id v13 = (id)[(UICollectionViewListCellAccessibility *)v54 accessibilityHint];
        char v37 = 0;
        BOOL v14 = 0;
        if (v13)
        {
          id v38 = (id)[location[0] accessibilityHint];
          char v37 = 1;
          BOOL v14 = v38 == 0;
        }
        if (v37) {

        }
        if (v14)
        {
          id v12 = (id)[(UICollectionViewListCellAccessibility *)v54 accessibilityHint];
          objc_msgSend(location[0], "setAccessibilityHint:");
        }
        id v10 = (id)[(UICollectionViewListCellAccessibility *)v54 accessibilityAttributedHint];
        char v35 = 0;
        BOOL v11 = 0;
        if (v10)
        {
          id v36 = (id)[location[0] accessibilityAttributedHint];
          char v35 = 1;
          BOOL v11 = v36 == 0;
        }
        if (v35) {

        }
        if (v11)
        {
          id v9 = (id)[(UICollectionViewListCellAccessibility *)v54 accessibilityAttributedHint];
          objc_msgSend(location[0], "setAccessibilityAttributedHint:");
        }
        id v7 = (id)[(UICollectionViewListCellAccessibility *)v54 accessibilityUserInputLabels];
        char v33 = 0;
        BOOL v8 = 0;
        if (v7)
        {
          id v34 = (id)[location[0] accessibilityUserInputLabels];
          char v33 = 1;
          BOOL v8 = v34 == 0;
        }
        if (v33) {

        }
        if (v8)
        {
          id v6 = (id)[(UICollectionViewListCellAccessibility *)v54 accessibilityUserInputLabels];
          objc_msgSend(location[0], "setAccessibilityUserInputLabels:");
        }
      }
    }
  }
  objc_storeStrong(&v50, 0);
  objc_storeStrong(&v51, 0);
  objc_storeStrong(&v52, 0);
  objc_storeStrong(location, 0);
}

void __95__UICollectionViewListCellAccessibility__accessibilityEnumerateCurrentConfigurationsWithBlock___block_invoke(void *a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  BOOL v11 = a1;
  memset(__b, 0, sizeof(__b));
  id obj = location[0];
  uint64_t v8 = [obj countByEnumeratingWithState:__b objects:v13 count:16];
  if (v8)
  {
    uint64_t v3 = *(void *)__b[2];
    uint64_t v4 = 0;
    unint64_t v5 = v8;
    while (1)
    {
      uint64_t v2 = v4;
      if (*(void *)__b[2] != v3) {
        objc_enumerationMutation(obj);
      }
      id v10 = *(id *)(__b[1] + 8 * v4);
      if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24)) {
        break;
      }
      if ([v10 safeBoolForKey:@"_isSystemType"]) {
        [v10 safeIntegerForKey:@"_systemType"];
      }
      (*(void (**)(void))(a1[4] + 16))();
      ++v4;
      if (v2 + 1 >= v5)
      {
        uint64_t v4 = 0;
        unint64_t v5 = [obj countByEnumeratingWithState:__b objects:v13 count:16];
        if (!v5) {
          break;
        }
      }
    }
  }

  objc_storeStrong(location, 0);
}

@end