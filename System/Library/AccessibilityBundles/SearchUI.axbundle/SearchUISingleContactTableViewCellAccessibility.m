@interface SearchUISingleContactTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axActionButton;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
- (void)_axPerformCustomAction:(id)a3;
- (void)updateThumbnailViewForResult:(id)a3;
@end

@implementation SearchUISingleContactTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SearchUISingleContactTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SearchUISingleContactTableViewCell", @"textAreaView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SearchUISingleContactTableViewCell", @"accessoryViewControllerForResult", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SearchUIContactActionButton", @"actions", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SearchUIAccessoryViewController", @"view", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNQuickAction", @"perform", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNQuickAction", @"category", "@", 0);
}

- (id)accessibilityLabel
{
  v6.receiver = self;
  v6.super_class = (Class)SearchUISingleContactTableViewCellAccessibility;
  v2 = [(SearchUISingleContactTableViewCellAccessibility *)&v6 accessibilityLabel];
  v5 = accessibilityLocalizedString(@"suggestion.contact");
  id v3 = __UIAXStringForVariables();

  return v3;
}

- (id)accessibilityCustomActions
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v2 = [(SearchUISingleContactTableViewCellAccessibility *)self _axActionButton];
  char v26 = 0;
  objc_opt_class();
  id v3 = [v2 safeValueForKey:@"actions"];
  v4 = __UIAccessibilityCastAsClass();

  if (v4 && [v4 count])
  {
    v18 = v2;
    id v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id obj = v4;
    uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v23;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v23 != v7) {
            objc_enumerationMutation(obj);
          }
          v9 = *(void **)(*((void *)&v22 + 1) + 8 * v8);
          v10 = objc_msgSend(v9, "safeValueForKey:", @"category", v14, v15, v16, v17);
          if (AXLocalizedStringFromQuickActionCategory_onceToken != -1) {
            dispatch_once(&AXLocalizedStringFromQuickActionCategory_onceToken, &__block_literal_global_12);
          }
          v11 = [(id)AXLocalizedStringFromQuickActionCategory_AXQuickActionCategoryTable objectForKeyedSubscript:v10];
          if (v11)
          {
            v12 = (void *)[objc_alloc(MEMORY[0x263F1C390]) initWithName:v11 target:self selector:sel__axPerformCustomAction_];
            [v12 _accessibilitySetRetainedValue:v9 forKey:@"AXCNActionKey"];
            [v21 addObject:v12];
          }
          else
          {
            v16 = v9;
            v17 = v10;
            v15 = @"Could not create title for action %@ with category %@";
            LOBYTE(v14) = 1;
            _AXLogWithFacility();
          }

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v6);
    }

    v2 = v18;
  }
  else
  {
    _AXLogWithFacility();
    id v21 = 0;
  }

  return v21;
}

- (void)_axPerformCustomAction:(id)a3
{
  v4 = [a3 _accessibilityValueForKey:@"AXCNActionKey"];
  id v3 = v4;
  AXPerformSafeBlock();
}

uint64_t __74__SearchUISingleContactTableViewCellAccessibility__axPerformCustomAction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) perform];
}

- (void)updateThumbnailViewForResult:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SearchUISingleContactTableViewCellAccessibility;
  [(SearchUISingleContactTableViewCellAccessibility *)&v3 updateThumbnailViewForResult:a3];
}

- (id)_axActionButton
{
  v2 = [(SearchUISingleContactTableViewCellAccessibility *)self safeValueForKey:@"accessoryViewControllerForResult"];
  objc_super v3 = [v2 safeValueForKey:@"_view"];

  return v3;
}

@end