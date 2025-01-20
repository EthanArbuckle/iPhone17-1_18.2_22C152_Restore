@interface WDDisplayTypeAddDataViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)valueFieldManualEntryItem;
@end

@implementation WDDisplayTypeAddDataViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WDDisplayTypeAddDataViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"WDDisplayTypeAddDataViewController" hasInstanceVariable:@"_unitController" withType:"HKUnitPreferenceController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WDDisplayTypeAddDataViewController", @"valueFieldManualEntryItem", "@", 0);
  [v3 validateClass:@"WDUnitPreferenceViewController" hasInstanceVariable:@"_unitController" withType:"HKUnitPreferenceController"];
  [v3 validateClass:@"WDDisplayTypeAddDataViewController" hasInstanceVariable:@"_displayType" withType:"HKDisplayType"];
}

- (id)valueFieldManualEntryItem
{
  v21.receiver = self;
  v21.super_class = (Class)WDDisplayTypeAddDataViewControllerAccessibility;
  id v3 = [(WDDisplayTypeAddDataViewControllerAccessibility *)&v21 valueFieldManualEntryItem];
  v4 = [(WDDisplayTypeAddDataViewControllerAccessibility *)self safeValueForKey:@"_displayType"];
  v5 = __UIAccessibilitySafeClass();

  LOBYTE(v14) = 0;
  v6 = [(WDDisplayTypeAddDataViewControllerAccessibility *)self safeValueForKey:@"_unitController"];
  v7 = __UIAccessibilitySafeClass();

  char v20 = 0;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  uint64_t v13 = MEMORY[0x263EF8330];
  id v8 = v7;
  id v9 = v5;
  AXPerformSafeBlock();
  id v10 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  v11 = __UIAccessibilitySafeClass();

  if (v20) {
    abort();
  }
  objc_msgSend(v3, "setAccessibilityLabel:", v11, v13, 3221225472, __76__WDDisplayTypeAddDataViewControllerAccessibility_valueFieldManualEntryItem__block_invoke, &unk_265124970);

  return v3;
}

uint64_t __76__WDDisplayTypeAddDataViewControllerAccessibility_valueFieldManualEntryItem__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) accessibilityNameForDisplayType:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

@end