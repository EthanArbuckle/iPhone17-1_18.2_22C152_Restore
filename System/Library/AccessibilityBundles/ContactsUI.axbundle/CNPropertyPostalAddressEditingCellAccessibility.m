@interface CNPropertyPostalAddressEditingCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
@end

@implementation CNPropertyPostalAddressEditingCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNPropertyPostalAddressEditingCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CNPropertyEditingCell"];
  [v3 validateClass:@"CNAddressComponentTextFieldCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNAddressComponentTextFieldCell", @"textFields", "@", 0);
  [v3 validateClass:@"CNPropertyEditingCell" hasProperty:@"labelButton" withType:"@"];
}

- (id)accessibilityElements
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  char v17 = 0;
  objc_opt_class();
  id v3 = [(CNPropertyPostalAddressEditingCellAccessibility *)self safeUIViewForKey:@"labelButton"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = objc_opt_new();
  [v5 axSafelyAddObject:v4];
  v6 = [(CNPropertyPostalAddressEditingCellAccessibility *)self _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_3];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [*(id *)(*((void *)&v13 + 1) + 8 * i) safeArrayForKey:@"textFields"];
        [v5 axSafelyAddObjectsFromArray:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

uint64_t __72__CNPropertyPostalAddressEditingCellAccessibility_accessibilityElements__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x2456487F0](@"CNAddressComponentTextFieldCell");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end