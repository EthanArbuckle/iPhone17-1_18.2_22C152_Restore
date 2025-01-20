@interface BuddyLanguageControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_selectLanguage:(id)a3;
@end

@implementation BuddyLanguageControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BuddyLanguageController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"BuddyLanguageController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BuddyLanguageLocaleCell", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BuddyLanguageController", @"languageComposite", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BuddyLanguageComposite", @"languageCodes", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BuddyLanguageController", @"tableView: cellForRowAtIndexPath:", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BuddyLanguageController", @"_selectLanguage:", "v", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)BuddyLanguageControllerAccessibility;
  [(BuddyLanguageControllerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(BuddyLanguageControllerAccessibility *)self safeValueForKey:@"tableView"];
  [v3 reloadData];
}

- (void)_selectLanguage:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BuddyLanguageControllerAccessibility;
  [(BuddyLanguageControllerAccessibility *)&v10 _selectLanguage:v4];
  objc_opt_class();
  v5 = __UIAccessibilityCastAsClass();
  v6 = [v5 navigationItem];
  v7 = [v6 safeValueForKey:@"backButtonView"];
  if (v7)
  {
    v8 = [v6 backButtonTitle];
    v9 = AXAttributedStringForLanguage(v8, v4);

    if (v9) {
      [v7 setAccessibilityLabel:v9];
    }
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)BuddyLanguageControllerAccessibility;
  v8 = [(BuddyLanguageControllerAccessibility *)&v24 tableView:v6 cellForRowAtIndexPath:v7];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  id v9 = v7;
  AXPerformSafeBlock();
  id v10 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  LOBYTE(v18) = 0;
  objc_opt_class();
  v11 = __UIAccessibilitySafeClass();
  v12 = v11;
  v13 = [v11 safeValueForKey:@"titleLabel"];
  v14 = __UIAccessibilityCastAsClass();

  if ((_BYTE)v18) {
    abort();
  }
  v15 = [v14 text];

  v16 = AXAttributedStringForLanguage(v15, v10);
  if (v16) {
    [v8 setAccessibilityLabel:v16];
  }

  return v8;
}

void __72__BuddyLanguageControllerAccessibility_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  objc_opt_class();
  v2 = [*(id *)(a1 + 32) safeValueForKey:@"languageComposite"];
  id v3 = [v2 safeArrayForKey:@"languageCodes"];
  id v4 = objc_msgSend(v3, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 40), "row"));
  uint64_t v5 = __UIAccessibilityCastAsClass();

  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

@end