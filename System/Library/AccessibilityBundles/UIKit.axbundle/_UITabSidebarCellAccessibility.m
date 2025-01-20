@interface _UITabSidebarCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySidebarItem;
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

@implementation _UITabSidebarCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UITabSidebarCell";
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
  v5 = @"_UITabBarItemBridgedElement";
  v4 = @"_UITab";
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  [location[0] validateClass:@"_UITabSidebarCell" hasInstanceVariable:@"_sidebarItem" withType:"UITabSidebarItem"];
  v3 = @"UITabSidebarItem";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  [location[0] validateClass:@"UITabSidebarItem" hasInstanceVariable:@"_contentConfiguration" withType:"<UIContentConfiguration>"];
  v6 = "@";
  [location[0] validateClass:@"UITabSidebarItem" hasInstanceMethod:@"_tab" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UITab", @"_isGroup", "B", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"_badgeValue", v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"tabBarItem", v6, 0);
  objc_storeStrong(v8, v7);
}

- (id)_accessibilitySidebarItem
{
  if (a1) {
    id v2 = (id)[a1 safeValueForKeyPath:@"_sidebarItem._tab"];
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v25 = self;
  v24[1] = (id)a2;
  v24[0] = -[_UITabSidebarCellAccessibility _accessibilitySidebarItem](self);
  id location = 0;
  NSClassFromString(&cfstr_Uitabbaritembr_0.isa);
  if (objc_opt_isKindOfClass())
  {
    id v14 = (id)[v24[0] safeValueForKey:@"tabBarItem"];
    id v22 = (id)[v14 accessibilityUserDefinedLabel];

    if ([v22 length]
      || (id v2 = (id)[v24[0] accessibilityUserDefinedLabel],
          id v3 = v22,
          id v22 = v2,
          v3,
          [v22 length]))
    {
      objc_storeStrong(&location, v22);
    }
    else
    {
      id v21 = (id)[(_UITabSidebarCellAccessibility *)v25 safeValueForKey:@"_sidebarItem"];
      id v20 = (id)[v21 safeValueForKey:@"_contentConfiguration"];
      char v18 = 0;
      LOBYTE(v13) = 0;
      if (v20)
      {
        id v19 = (id)[v21 safeValueForKey:@"_defaultContentConfiguration"];
        char v18 = 1;
        int v13 = [v19 isEqual:v20] ^ 1;
      }
      if (v18) {

      }
      if (v13)
      {
        id v4 = (id)[v20 accessibilityLabel];
        id v5 = location;
        id location = v4;
      }
      objc_storeStrong(&v20, 0);
      objc_storeStrong(&v21, 0);
    }
    objc_storeStrong(&v22, 0);
  }
  if (![location length])
  {
    id v6 = (id)[v24[0] accessibilityLabel];
    id v7 = location;
    id location = v6;
  }
  if (![location length])
  {
    id v12 = (id)[(_UITabSidebarCellAccessibility *)v25 safeValueForKeyPath:@"_sidebarItem._contentConfiguration"];
    id v8 = (id)[v12 accessibilityLabel];
    id v9 = location;
    id location = v8;
  }
  if ([location length])
  {
    id v17 = (id)[v24[0] safeStringForKey:@"_badgeValue"];
    id v26 = (id)__UIAXStringForVariables();
    int v16 = 1;
    objc_storeStrong(&v17, 0);
  }
  else
  {
    v15.receiver = v25;
    v15.super_class = (Class)_UITabSidebarCellAccessibility;
    id v26 = [(_UITabSidebarCellAccessibility *)&v15 accessibilityLabel];
    int v16 = 1;
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(v24, 0);
  v10 = v26;

  return v10;
}

- (id)accessibilityAttributedLabel
{
  id v20 = self;
  v19[1] = (id)a2;
  v19[0] = -[_UITabSidebarCellAccessibility _accessibilitySidebarItem](self);
  id v18 = (id)[v19[0] accessibilityAttributedLabel];
  if ([v18 length]
    || ((id location = [(_UITabSidebarCellAccessibility *)v20 accessibilityLabel],
         ([location isAXAttributedString] & 1) == 0)
      ? (!location
       ? (int v16 = 0)
       : (v21 = (id)[objc_alloc(MEMORY[0x263F086A0]) initWithString:location], int v16 = 1))
      : (v21 = (id)[location cfAttributedString], int v16 = 1),
        objc_storeStrong(&location, 0),
        !v16))
  {
    id v15 = (id)[v19[0] safeStringForKey:@"_badgeValue"];
    if ([v18 length] && objc_msgSend(v15, "length"))
    {
      id obj = (id)[v18 mutableCopy];
      id v2 = (id)[NSString stringWithFormat:@", %@", v15];
      id v3 = v15;
      id v15 = v2;

      id v11 = obj;
      id v4 = objc_alloc(MEMORY[0x263F086A0]);
      id v12 = (id)[v4 initWithString:v15];
      objc_msgSend(v11, "appendAttributedString:");

      objc_storeStrong(&v18, obj);
      objc_storeStrong(&obj, 0);
    }
    else if ([v15 length])
    {
      id v5 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v15];
      id v6 = v18;
      id v18 = v5;
    }
    else
    {
      v13.receiver = v20;
      v13.super_class = (Class)_UITabSidebarCellAccessibility;
      id v7 = [(_UITabSidebarCellAccessibility *)&v13 accessibilityAttributedLabel];
      id v8 = v18;
      id v18 = v7;
    }
    id v21 = v18;
    int v16 = 1;
    objc_storeStrong(&v15, 0);
  }
  objc_storeStrong(&v18, 0);
  objc_storeStrong(v19, 0);
  id v9 = v21;

  return v9;
}

- (unint64_t)accessibilityTraits
{
  id v15 = self;
  SEL v14 = a2;
  unint64_t v13 = 0;
  v12.receiver = self;
  v12.super_class = (Class)_UITabSidebarCellAccessibility;
  unint64_t v6 = [(_UITabSidebarCellAccessibility *)&v12 accessibilityTraits];
  id v7 = -[_UITabSidebarCellAccessibility _accessibilitySidebarItem](v15);
  uint64_t v8 = v6 | [v7 accessibilityTraits];

  unint64_t v13 = v8;
  char v11 = 0;
  objc_opt_class();
  id v10 = (id)__UIAccessibilityCastAsClass();
  id v9 = v10;
  objc_storeStrong(&v10, 0);
  char v5 = [v9 isSelected];

  if (v5) {
    v13 |= *MEMORY[0x263F1CF38];
  }
  id v3 = -[_UITabSidebarCellAccessibility _accessibilitySidebarItem](v15);
  char v4 = [v3 safeBoolForKey:@"_isGroup"];

  if (v4) {
    v13 |= *MEMORY[0x263F1CEF8];
  }
  return v13;
}

- (id)accessibilityValue
{
  uint64_t v8 = self;
  location[1] = (id)a2;
  id v4 = -[_UITabSidebarCellAccessibility _accessibilitySidebarItem](self);
  location[0] = (id)[v4 accessibilityValue];

  if ([location[0] length])
  {
    id v9 = location[0];
  }
  else
  {
    v5.receiver = v8;
    v5.super_class = (Class)_UITabSidebarCellAccessibility;
    id v9 = [(_UITabSidebarCellAccessibility *)&v5 accessibilityValue];
  }
  int v6 = 1;
  objc_storeStrong(location, 0);
  id v2 = v9;

  return v2;
}

- (id)accessibilityAttributedValue
{
  uint64_t v8 = self;
  location[1] = (id)a2;
  id v4 = -[_UITabSidebarCellAccessibility _accessibilitySidebarItem](self);
  location[0] = (id)[v4 accessibilityAttributedValue];

  if ([location[0] length])
  {
    id v9 = location[0];
  }
  else
  {
    v5.receiver = v8;
    v5.super_class = (Class)_UITabSidebarCellAccessibility;
    id v9 = [(_UITabSidebarCellAccessibility *)&v5 accessibilityAttributedValue];
  }
  int v6 = 1;
  objc_storeStrong(location, 0);
  id v2 = v9;

  return v2;
}

- (id)accessibilityHint
{
  uint64_t v8 = self;
  location[1] = (id)a2;
  id v4 = -[_UITabSidebarCellAccessibility _accessibilitySidebarItem](self);
  location[0] = (id)[v4 accessibilityHint];

  if ([location[0] length])
  {
    id v9 = location[0];
  }
  else
  {
    v5.receiver = v8;
    v5.super_class = (Class)_UITabSidebarCellAccessibility;
    id v9 = [(_UITabSidebarCellAccessibility *)&v5 accessibilityHint];
  }
  int v6 = 1;
  objc_storeStrong(location, 0);
  id v2 = v9;

  return v2;
}

- (id)accessibilityAttributedHint
{
  uint64_t v8 = self;
  location[1] = (id)a2;
  id v4 = -[_UITabSidebarCellAccessibility _accessibilitySidebarItem](self);
  location[0] = (id)[v4 accessibilityAttributedHint];

  if ([location[0] length])
  {
    id v9 = location[0];
  }
  else
  {
    v5.receiver = v8;
    v5.super_class = (Class)_UITabSidebarCellAccessibility;
    id v9 = [(_UITabSidebarCellAccessibility *)&v5 accessibilityAttributedHint];
  }
  int v6 = 1;
  objc_storeStrong(location, 0);
  id v2 = v9;

  return v2;
}

- (id)accessibilityIdentifier
{
  uint64_t v8 = self;
  location[1] = (id)a2;
  id v4 = -[_UITabSidebarCellAccessibility _accessibilitySidebarItem](self);
  location[0] = (id)[v4 accessibilityIdentifier];

  if ([location[0] length])
  {
    id v9 = location[0];
  }
  else
  {
    v5.receiver = v8;
    v5.super_class = (Class)_UITabSidebarCellAccessibility;
    id v9 = [(_UITabSidebarCellAccessibility *)&v5 accessibilityIdentifier];
  }
  int v6 = 1;
  objc_storeStrong(location, 0);
  id v2 = v9;

  return v2;
}

- (id)accessibilityUserInputLabels
{
  uint64_t v8 = self;
  location[1] = (id)a2;
  id v4 = -[_UITabSidebarCellAccessibility _accessibilitySidebarItem](self);
  location[0] = (id)[v4 accessibilityUserInputLabels];

  if ([location[0] count])
  {
    id v9 = location[0];
  }
  else
  {
    v5.receiver = v8;
    v5.super_class = (Class)_UITabSidebarCellAccessibility;
    id v9 = [(_UITabSidebarCellAccessibility *)&v5 accessibilityUserInputLabels];
  }
  int v6 = 1;
  objc_storeStrong(location, 0);
  id v2 = v9;

  return v2;
}

- (id)accessibilityCustomActions
{
  v40 = self;
  v39[1] = (id)a2;
  char v38 = 0;
  objc_opt_class();
  id v10 = -[_UITabSidebarCellAccessibility _accessibilitySidebarItem](v40);
  id v37 = (id)__UIAccessibilityCastAsClass();

  id v36 = v37;
  objc_storeStrong(&v37, 0);
  v39[0] = v36;
  id v8 = (id)[v36 tabBarController];
  id v35 = (id)[v8 safeValueForKey:@"_tabCustomizationProxy"];

  id v9 = (id)[v39[0] accessibilityCustomActions];
  id v34 = (id)[v9 mutableCopy];

  if (![v34 count])
  {
    id v2 = (id)[MEMORY[0x263EFF980] array];
    id v3 = v34;
    id v34 = v2;
  }
  uint64_t v29 = 0;
  v30 = &v29;
  int v31 = 0x20000000;
  int v32 = 32;
  char v33 = 0;
  uint64_t v22 = MEMORY[0x263EF8330];
  int v23 = -1073741824;
  int v24 = 0;
  v25 = __60___UITabSidebarCellAccessibility_accessibilityCustomActions__block_invoke;
  id v26 = &unk_2650ADF88;
  v28[1] = &v29;
  id v27 = v35;
  v28[0] = v39[0];
  AXPerformSafeBlock();
  char v21 = v30[3] & 1;
  objc_storeStrong(v28, 0);
  objc_storeStrong(&v27, 0);
  _Block_object_dispose(&v29, 8);
  if (v21)
  {
    id v6 = objc_alloc(MEMORY[0x263F1C390]);
    id v7 = (id)accessibilityUIKitLocalizedString();
    uint64_t v13 = MEMORY[0x263EF8330];
    int v14 = -1073741824;
    int v15 = 0;
    int v16 = __60___UITabSidebarCellAccessibility_accessibilityCustomActions__block_invoke_2;
    id v17 = &unk_2650ADFD8;
    id v18 = v35;
    id v19 = v39[0];
    id v20 = (id)[v6 initWithName:v7 actionHandler:&v13];

    [v34 axSafelyAddObject:v20];
    objc_storeStrong(&v20, 0);
    objc_storeStrong(&v19, 0);
    objc_storeStrong(&v18, 0);
  }
  if ([v34 count])
  {
    id v41 = v34;
  }
  else
  {
    v11.receiver = v40;
    v11.super_class = (Class)_UITabSidebarCellAccessibility;
    id v41 = [(_UITabSidebarCellAccessibility *)&v11 accessibilityCustomActions];
  }
  int v12 = 1;
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(v39, 0);
  id v4 = v41;

  return v4;
}

@end