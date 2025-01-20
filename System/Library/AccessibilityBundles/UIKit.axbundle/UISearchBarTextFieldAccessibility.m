@interface UISearchBarTextFieldAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityRightButtons;
- (id)accessibilityLabel;
- (id)accessibilityLocalizationBundleID;
- (id)accessibilityLocalizationBundlePath;
- (id)accessibilityLocalizedStringKey;
- (id)accessibilityLocalizedStringTableName;
- (id)accessibilityValue;
- (unint64_t)_accessibilityAutomationType;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityEditingModeChanged;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation UISearchBarTextFieldAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UISearchBarTextField";
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
  v3 = @"UISearchBarTextField";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  v4 = @"UITextField";
  objc_msgSend(location[0], "validateClass:isKindOfClass:", @"UISearchBarTextField");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UITextField", @"isEditing", "B", 0);
  v6 = "@";
  [location[0] validateClass:v4 hasInstanceMethod:@"textStorage" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UITextFieldAccessibility", @"_accessibilityRightButtons", v6, 0);
  v5 = @"_UISearchTokenAttachment";
  objc_msgSend(location[0], "validateClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"_viewProvider", v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"NSTextAttachmentViewProvider", @"view", v6, 0);
  objc_storeStrong(v8, v7);
}

- (unint64_t)_accessibilityAutomationType
{
  return 45;
}

- (id)accessibilityLabel
{
  id v2 = (id)[(UISearchBarTextFieldAccessibility *)self accessibilityUserDefinedLabel];
  BOOL v7 = v2 == 0;

  if (v7)
  {
    LOBYTE(v6) = 0;
    if (_AXSAutomationEnabled()) {
      BOOL v6 = !UIAccessibilityIsVoiceOverRunning();
    }
    id v4 = [(UISearchBarTextFieldAccessibility *)self accessibilityValue];
    char v5 = 1;
    if ([v4 length]) {
      char v5 = v6;
    }

    if (v5) {
      id v9 = (id)[(UISearchBarTextFieldAccessibility *)self safeValueForKey:@"placeholder"];
    }
    else {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = (id)[(UISearchBarTextFieldAccessibility *)self accessibilityUserDefinedLabel];
  }

  return v9;
}

- (id)accessibilityValue
{
  v30 = self;
  v29[1] = (id)a2;
  uint64_t v23 = 0;
  v24 = &v23;
  int v25 = 838860800;
  int v26 = 48;
  v27 = __Block_byref_object_copy__18;
  v28 = __Block_byref_object_dispose__18;
  v29[0] = (id)[NSString string];
  char v21 = 0;
  objc_opt_class();
  id v9 = (id)[(UISearchBarTextFieldAccessibility *)v30 safeValueForKey:@"textStorage"];
  id v20 = (id)__UIAccessibilityCastAsClass();

  id v19 = v20;
  objc_storeStrong(&v20, 0);
  id v22 = v19;
  uint64_t v7 = *MEMORY[0x263F814A0];
  uint64_t v8 = [v19 length];
  uint64_t v32 = 0;
  uint64_t v31 = v8;
  uint64_t v33 = 0;
  uint64_t v34 = v8;
  uint64_t v17 = 0;
  uint64_t v18 = v8;
  v11[1] = (id)MEMORY[0x263EF8330];
  int v12 = -1073741824;
  int v13 = 0;
  v14 = __55__UISearchBarTextFieldAccessibility_accessibilityValue__block_invoke;
  v15 = &unk_2650AF190;
  v16 = &v23;
  [v19 enumerateAttribute:v7 inRange:0 options:v8 usingBlock:0];
  v11[0] = (id)[NSString string];
  v10.receiver = v30;
  v10.super_class = (Class)UISearchBarTextFieldAccessibility;
  id v5 = [(UISearchBarTextFieldAccessibility *)&v10 accessibilityValue];
  id v2 = (id)__UIAXStringForVariables();
  v3 = (void *)v24[5];
  v24[5] = (uint64_t)v2;

  id v6 = (id)v24[5];
  objc_storeStrong(v11, 0);
  objc_storeStrong(&v22, 0);
  _Block_object_dispose(&v23, 8);
  objc_storeStrong(v29, 0);

  return v6;
}

void __55__UISearchBarTextFieldAccessibility_accessibilityValue__block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  location[2] = a3;
  id location[3] = a4;
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  NSClassFromString(&cfstr_Uisearchtokena_0.isa);
  if (objc_opt_isKindOfClass())
  {
    id v7 = (id)[location[0] accessibilityLabel];
    id v4 = (id)__UIAXStringForVariables();
    uint64_t v5 = *(void *)(a1[4] + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  objc_storeStrong(location, 0);
}

- (id)accessibilityLocalizedStringKey
{
  v6[2] = self;
  v6[1] = (id)a2;
  v6[0] = (id)[(UISearchBarTextFieldAccessibility *)self safeValueForKey:@"placeholder"];
  id v5 = (id)[v6[0] _accessibilityAttributedLocalizedString];
  id v4 = (id)[v5 attributeValueForKey:@"UIAccessibilityTokenLocalizedStringKey"];
  id v3 = v4;
  objc_storeStrong(&v4, 0);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(v6, 0);

  return v3;
}

- (id)accessibilityLocalizationBundleID
{
  return (id)[(UISearchBarTextFieldAccessibility *)self _accessibilityRetrieveLocalizationBundleID];
}

- (id)accessibilityLocalizationBundlePath
{
  return (id)[(UISearchBarTextFieldAccessibility *)self _accessibilityRetrieveLocalizationBundlePath];
}

- (id)accessibilityLocalizedStringTableName
{
  return (id)[(UISearchBarTextFieldAccessibility *)self _accessibilityRetrieveLocalizedStringTableName];
}

- (unint64_t)accessibilityTraits
{
  id v6 = self;
  SEL v5 = a2;
  unint64_t v4 = 0;
  v3.receiver = self;
  v3.super_class = (Class)UISearchBarTextFieldAccessibility;
  unint64_t v4 = [(UISearchBarTextFieldAccessibility *)&v3 accessibilityTraits];
  return v4 | *MEMORY[0x263F1CF30];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  unint64_t v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UISearchBarTextFieldAccessibility;
  [(UISearchBarTextFieldAccessibility *)&v2 _accessibilityLoadAccessibilityInformation];
  [(UISearchBarTextFieldAccessibility *)v4 _accessibilityEditingModeChanged];
}

- (void)_accessibilityEditingModeChanged
{
  id v2 = (id)[(UISearchBarTextFieldAccessibility *)self safeValueForKey:@"_clearButton"];
  objc_msgSend(v2, "setIsAccessibilityElement:", -[UISearchBarTextFieldAccessibility safeBoolForKey:](self, "safeBoolForKey:", @"isEditing") & 1);
}

- (id)_accessibilityRightButtons
{
  v24 = self;
  v23[1] = (id)a2;
  v23[0] = objc_alloc_init(MEMORY[0x263EFF980]);
  char v21 = 0;
  objc_opt_class();
  id v9 = (id)[(UISearchBarTextFieldAccessibility *)v24 safeValueForKey:@"textStorage"];
  id v20 = (id)__UIAccessibilityCastAsClass();

  id v19 = v20;
  objc_storeStrong(&v20, 0);
  id v22 = v19;
  id v5 = v19;
  uint64_t v4 = *MEMORY[0x263F814A0];
  uint64_t v2 = [v19 length];
  uint64_t v26 = 0;
  uint64_t v25 = v2;
  uint64_t v27 = 0;
  uint64_t v28 = v2;
  uint64_t v17 = 0;
  uint64_t v18 = v2;
  uint64_t v11 = MEMORY[0x263EF8330];
  int v12 = -1073741824;
  int v13 = 0;
  v14 = __63__UISearchBarTextFieldAccessibility__accessibilityRightButtons__block_invoke;
  v15 = &unk_2650AF1B8;
  id v16 = v23[0];
  objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", v4, v17, v18, 0, &v11);
  id v6 = v23[0];
  v10.receiver = v24;
  v10.super_class = (Class)UISearchBarTextFieldAccessibility;
  id v7 = [(UISearchBarTextFieldAccessibility *)&v10 _accessibilityRightButtons];
  id v8 = (id)objc_msgSend(v6, "arrayByAddingObjectsFromArray:");

  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(v23, 0);

  return v8;
}

void __63__UISearchBarTextFieldAccessibility__accessibilityRightButtons__block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  location[2] = a3;
  id location[3] = a4;
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  NSClassFromString(&cfstr_Uisearchtokena_0.isa);
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = (void *)a1[4];
    id v6 = (id)[location[0] safeValueForKey:@"_viewProvider"];
    id v5 = (id)[v6 safeValueForKey:@"view"];
    objc_msgSend(v4, "axSafelyAddObject:");
  }
  objc_storeStrong(location, 0);
}

@end