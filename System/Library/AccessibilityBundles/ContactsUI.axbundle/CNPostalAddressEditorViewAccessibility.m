@interface CNPostalAddressEditorViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
@end

@implementation CNPostalAddressEditorViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNPostalAddressEditorView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)CNPostalAddressEditorViewAccessibility;
  v8 = [(CNPostalAddressEditorViewAccessibility *)&v25 tableView:v6 cellForRowAtIndexPath:v7];
  char v24 = 0;
  objc_opt_class();
  v9 = [v8 safeValueForKey:@"textFields"];
  v10 = __UIAccessibilityCastAsClass();

  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        char v24 = 0;
        objc_opt_class();
        v16 = __UIAccessibilityCastAsClass();
        if (v24) {
          abort();
        }
        v17 = v16;
        v18 = objc_msgSend(v16, "placeholder", v20);
        if (v18) {
          [v17 setAccessibilityLabel:v18];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v13);
  }

  return v8;
}

@end