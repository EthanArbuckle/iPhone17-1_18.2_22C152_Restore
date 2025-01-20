@interface _UIFloatingTabBarItemViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (_NSRange)accessibilityRowRange;
- (id)accessibilityAttributedHint;
- (id)accessibilityAttributedLabel;
- (id)accessibilityAttributedValue;
- (id)accessibilityCustomActions;
- (id)accessibilityHint;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)accessibilityUserInputLabels;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation _UIFloatingTabBarItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIFloatingTabBarItemView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v8 = location;
  id v7 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = @"_UIFloatingTabBarItemView";
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  [location[0] validateClass:@"_UIFloatingTabBarItemView" hasInstanceVariable:@"_item" withType:"UITab"];
  v4 = "@";
  [location[0] validateClass:@"_UIFloatingTabBar" hasInstanceMethod:@"tabModel" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UITabModel", @"tabItems", v4, 0);
  v3 = @"_UITab";
  v6 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"_badgeValue", v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"titleLabel", v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"isCustomizableItem", v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"isEditing", v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"isHighlighted", v6, 0);
  objc_storeStrong(v8, v7);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (_NSRange)accessibilityRowRange
{
  v41 = self;
  v40[1] = (id)a2;
  char v39 = 0;
  objc_opt_class();
  id v12 = (id)[(_UIFloatingTabBarItemViewAccessibility *)v41 safeValueForKey:@"_item"];
  id v38 = (id)__UIAccessibilityCastAsClass();

  id v37 = v38;
  objc_storeStrong(&v38, 0);
  v40[0] = v37;
  if (v37)
  {
    id v34 = (id)[(_UIFloatingTabBarItemViewAccessibility *)v41 _accessibilityViewAncestorIsKindOf:NSClassFromString(&cfstr_Uifloatingtabb_5.isa)];
    char v32 = 0;
    objc_opt_class();
    uint64_t v24 = 0;
    v25 = &v24;
    int v26 = 838860800;
    int v27 = 48;
    v28 = __Block_byref_object_copy_;
    v29 = __Block_byref_object_dispose_;
    id v30 = 0;
    uint64_t v17 = MEMORY[0x263EF8330];
    int v18 = -1073741824;
    int v19 = 0;
    v20 = __63___UIFloatingTabBarItemViewAccessibility_accessibilityRowRange__block_invoke;
    v21 = &unk_2650ADF88;
    v23[1] = &v24;
    id v22 = v34;
    v23[0] = v40[0];
    AXPerformSafeBlock();
    id v16 = (id)v25[5];
    objc_storeStrong(v23, 0);
    objc_storeStrong(&v22, 0);
    _Block_object_dispose(&v24, 8);
    objc_storeStrong(&v30, 0);
    id v31 = (id)__UIAccessibilityCastAsClass();

    if (v32) {
      abort();
    }
    id v15 = v31;
    objc_storeStrong(&v31, 0);
    id v33 = v15;
    if (!v15 || [v33 row] == 0x7FFFFFFFFFFFFFFFLL || objc_msgSend(v33, "row") == 0x8000000000000000)
    {
      v14.receiver = v41;
      v14.super_class = (Class)_UIFloatingTabBarItemViewAccessibility;
      NSUInteger v42 = (NSUInteger)[(_UIFloatingTabBarItemViewAccessibility *)&v14 accessibilityRowRange];
      NSUInteger v43 = v3;
      int v35 = 1;
    }
    else
    {
      id v7 = (id)[v34 safeValueForKey:@"lastSnapshot"];
      id v6 = (id)[v7 safeArrayForKey:@"itemIdentifiers"];
      uint64_t v8 = [v6 count];

      id v10 = (id)[v34 safeValueForKey:@"pinnedItemsView"];
      id v9 = (id)[v10 safeDictionaryForKey:@"itemViews"];
      uint64_t v11 = [v9 count];

      uint64_t v13 = [v40[0] preferredPlacement];
      if (v13 == 4 || [v33 section] != (v13 != 5))
      {
        NSUInteger v45 = v8 + [v33 row];
        uint64_t v44 = v8 + v11;
        NSUInteger v46 = v45;
        uint64_t v47 = v8 + v11;
        NSUInteger v42 = v45;
        NSUInteger v43 = v8 + v11;
        int v35 = 1;
      }
      else
      {
        uint64_t v49 = [v33 row];
        uint64_t v48 = v8 + v11;
        uint64_t v50 = v49;
        uint64_t v51 = v8 + v11;
        NSUInteger v42 = v49;
        NSUInteger v43 = v8 + v11;
        int v35 = 1;
      }
    }
    objc_storeStrong(&v33, 0);
    objc_storeStrong(&v34, 0);
  }
  else
  {
    v36.receiver = v41;
    v36.super_class = (Class)_UIFloatingTabBarItemViewAccessibility;
    NSUInteger v42 = (NSUInteger)[(_UIFloatingTabBarItemViewAccessibility *)&v36 accessibilityRowRange];
    NSUInteger v43 = v2;
    int v35 = 1;
  }
  objc_storeStrong(v40, 0);
  NSUInteger v4 = v42;
  NSUInteger v5 = v43;
  result.length = v5;
  result.location = v4;
  return result;
}

- (id)accessibilityLabel
{
  uint64_t v13 = self;
  v12[1] = (id)a2;
  id v6 = (id)[(_UIFloatingTabBarItemViewAccessibility *)self safeValueForKey:@"_item"];
  v12[0] = (id)[v6 accessibilityLabel];

  if ([v12[0] length])
  {
    id v14 = v12[0];
    int v11 = 1;
  }
  else
  {
    id v5 = (id)[(_UIFloatingTabBarItemViewAccessibility *)v13 safeValueForKey:@"titleLabel"];
    id v10 = (id)[v5 accessibilityLabel];

    if ([v10 length])
    {
      id v14 = v10;
    }
    else
    {
      char v9 = 0;
      objc_opt_class();
      id v8 = (id)__UIAccessibilityCastAsClass();
      id v7 = v8;
      objc_storeStrong(&v8, 0);
      id v4 = (id)[v7 _accessibleSubviews];
      id v14 = (id)MEMORY[0x2455E6560]();
    }
    int v11 = 1;
    objc_storeStrong(&v10, 0);
  }
  objc_storeStrong(v12, 0);
  NSUInteger v2 = v14;

  return v2;
}

- (id)accessibilityAttributedLabel
{
  int v11 = self;
  v10[1] = (id)a2;
  id v5 = (id)[(_UIFloatingTabBarItemViewAccessibility *)self safeValueForKey:@"_item"];
  v10[0] = (id)[v5 accessibilityAttributedLabel];

  if ([v10[0] length])
  {
    id v12 = v10[0];
    int v9 = 1;
  }
  else
  {
    id v4 = (id)[(_UIFloatingTabBarItemViewAccessibility *)v11 safeValueForKey:@"titleLabel"];
    id v8 = (id)[v4 accessibilityAttributedLabel];

    if ([v8 length])
    {
      id v12 = v8;
      int v9 = 1;
    }
    else
    {
      id location = [(_UIFloatingTabBarItemViewAccessibility *)v11 accessibilityLabel];
      if ([location isAXAttributedString])
      {
        id v12 = (id)[location cfAttributedString];
        int v9 = 1;
      }
      else
      {
        if (location)
        {
          id v12 = (id)[objc_alloc(MEMORY[0x263F086A0]) initWithString:location];
        }
        else
        {
          v6.receiver = v11;
          v6.super_class = (Class)_UIFloatingTabBarItemViewAccessibility;
          id v12 = [(_UIFloatingTabBarItemViewAccessibility *)&v6 accessibilityAttributedLabel];
        }
        int v9 = 1;
      }
      objc_storeStrong(&location, 0);
    }
    objc_storeStrong(&v8, 0);
  }
  objc_storeStrong(v10, 0);
  NSUInteger v2 = v12;

  return v2;
}

- (unint64_t)accessibilityTraits
{
  id v4 = (id)[(_UIFloatingTabBarItemViewAccessibility *)self safeValueForKey:@"_item"];
  uint64_t v2 = [v4 accessibilityTraits];
  unint64_t v5 = v2 | *MEMORY[0x263F813F8];

  unint64_t v6 = v5;
  if (([(_UIFloatingTabBarItemViewAccessibility *)self safeBoolForKey:@"isEditing"] & 1) != 0
    && ([(_UIFloatingTabBarItemViewAccessibility *)self safeBoolForKey:@"isCustomizableItem"] & 1) == 0)
  {
    return v5 | *MEMORY[0x263F1CF20];
  }
  if ([(_UIFloatingTabBarItemViewAccessibility *)self safeBoolForKey:@"isHighlighted"]) {
    return v5 | *MEMORY[0x263F1CF38];
  }
  return v6;
}

- (id)accessibilityValue
{
  id v3 = (id)[(_UIFloatingTabBarItemViewAccessibility *)self safeValueForKey:@"_item"];
  id v4 = (id)[v3 accessibilityValue];

  return v4;
}

- (id)accessibilityAttributedValue
{
  id v3 = (id)[(_UIFloatingTabBarItemViewAccessibility *)self safeValueForKey:@"_item"];
  id v4 = (id)[v3 accessibilityAttributedValue];

  return v4;
}

- (id)accessibilityHint
{
  id v3 = (id)[(_UIFloatingTabBarItemViewAccessibility *)self safeValueForKey:@"_item"];
  id v4 = (id)[v3 accessibilityHint];

  return v4;
}

- (id)accessibilityAttributedHint
{
  id v3 = (id)[(_UIFloatingTabBarItemViewAccessibility *)self safeValueForKey:@"_item"];
  id v4 = (id)[v3 accessibilityAttributedHint];

  return v4;
}

- (id)accessibilityIdentifier
{
  id v3 = (id)[(_UIFloatingTabBarItemViewAccessibility *)self safeValueForKey:@"_item"];
  id v4 = (id)[v3 accessibilityIdentifier];

  return v4;
}

- (id)accessibilityUserInputLabels
{
  id v8 = self;
  location[1] = (id)a2;
  id v4 = (id)[(_UIFloatingTabBarItemViewAccessibility *)self safeValueForKey:@"_item"];
  location[0] = (id)[v4 accessibilityUserInputLabels];

  if ([location[0] count])
  {
    id v9 = location[0];
  }
  else
  {
    v5.receiver = v8;
    v5.super_class = (Class)_UIFloatingTabBarItemViewAccessibility;
    id v9 = [(_UIFloatingTabBarItemViewAccessibility *)&v5 accessibilityUserInputLabels];
  }
  int v6 = 1;
  objc_storeStrong(location, 0);
  uint64_t v2 = v9;

  return v2;
}

- (id)accessibilityCustomActions
{
  int v27 = self;
  v26[1] = (id)a2;
  char v25 = 0;
  objc_opt_class();
  id v10 = (id)[(_UIFloatingTabBarItemViewAccessibility *)v27 safeValueForKey:@"_item"];
  id v24 = (id)__UIAccessibilityCastAsClass();

  id v23 = v24;
  objc_storeStrong(&v24, 0);
  v26[0] = v23;
  id v8 = (id)[v23 tabBarController];
  id v22 = (id)[v8 safeValueForKey:@"_tabCustomizationProxy"];

  id v9 = (id)[v26[0] accessibilityCustomActions];
  id v21 = (id)[v9 mutableCopy];

  if (![v21 count])
  {
    id v2 = (id)[MEMORY[0x263EFF980] array];
    id v3 = v21;
    id v21 = v2;
  }
  if (([(_UIFloatingTabBarItemViewAccessibility *)v27 safeBoolForKey:@"isEditing"] & 1) != 0
    && ([(_UIFloatingTabBarItemViewAccessibility *)v27 safeBoolForKey:@"isCustomizableItem"] & 1) != 0)
  {
    id v6 = objc_alloc(MEMORY[0x263F1C390]);
    id v7 = (id)accessibilityUIKitLocalizedString();
    uint64_t v13 = MEMORY[0x263EF8330];
    int v14 = -1073741824;
    int v15 = 0;
    id v16 = __68___UIFloatingTabBarItemViewAccessibility_accessibilityCustomActions__block_invoke;
    uint64_t v17 = &unk_2650ADFD8;
    id v18 = v22;
    id v19 = v26[0];
    id v20 = (id)[v6 initWithName:v7 actionHandler:&v13];

    [v21 axSafelyAddObject:v20];
    objc_storeStrong(&v20, 0);
    objc_storeStrong(&v19, 0);
    objc_storeStrong(&v18, 0);
  }
  if ([v21 count])
  {
    id v28 = v21;
  }
  else
  {
    v11.receiver = v27;
    v11.super_class = (Class)_UIFloatingTabBarItemViewAccessibility;
    id v28 = [(_UIFloatingTabBarItemViewAccessibility *)&v11 accessibilityCustomActions];
  }
  int v12 = 1;
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(v26, 0);
  id v4 = v28;

  return v4;
}

@end