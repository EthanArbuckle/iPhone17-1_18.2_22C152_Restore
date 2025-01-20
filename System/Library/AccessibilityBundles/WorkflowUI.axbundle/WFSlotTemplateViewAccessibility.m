@interface WFSlotTemplateViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityLocalizedPlaceholderNameForSlot:(id)a3;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
- (void)_accessibilityEnumerateContentsWithBlock:(id)a3;
@end

@implementation WFSlotTemplateViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WFSlotTemplateView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFSlotTemplateView", @"textStorage", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFSlotTemplateTextStorage", @"contents", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFSlotTemplateView", @"delegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFSlotTemplateView", @"_selectSlot:notifyDelegate:", "v", "@", "B", 0);
  [v3 validateProtocol:@"WFSlotTemplateViewDelegate" hasMethod:@"slotTemplateView:didTapTextAttachment:inSlotWithIdentifier:" isInstanceMethod:1 isRequired:0];
  [v3 validateClass:@"WFSlotTemplateSlot"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFSlotTemplateSlot", @"isPopulated", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFSlotTemplateSlot", @"contentAttributedString", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFSlotTemplateSlot", @"localizedName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFSlotTemplateSlot", @"localizedPlaceholder", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFSlotTemplateSlot", @"identifier", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFSlotTemplateView", @"showsDisclosureArrow", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFSlotTemplateView", @"disclosureArrowIsOpen", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFSlotTemplateView", @"didTapDisclosureArrow", "v", 0);
  [v3 validateClass:@"WFVariableAttachment"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFVariableAttachment", @"variable", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFVariable", @"nameIncludingPropertyName", "@", 0);
}

- (void)_accessibilityEnumerateContentsWithBlock:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void))a3;
  char v16 = 0;
  objc_opt_class();
  v5 = [(WFSlotTemplateViewAccessibility *)self safeValueForKeyPath:@"textStorage.contents"];
  v6 = __UIAccessibilityCastAsClass();

  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        v4[2](v4, *(void *)(*((void *)&v12 + 1) + 8 * i));
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v9);
  }
}

- (id)_accessibilityLocalizedPlaceholderNameForSlot:(id)a3
{
  id v3 = a3;
  v4 = [v3 safeStringForKey:@"localizedName"];
  if (![v4 length])
  {
    uint64_t v5 = [v3 safeStringForKey:@"localizedPlaceholder"];

    v4 = (void *)v5;
  }

  return v4;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3032000000;
  v5[3] = __Block_byref_object_copy__0;
  v5[4] = __Block_byref_object_dispose__0;
  id v6 = 0;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  AXPerformSafeBlock();
  v2 = MEMORY[0x24566B170](v4);

  _Block_object_dispose(v5, 8);

  return v2;
}

void __53__WFSlotTemplateViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __53__WFSlotTemplateViewAccessibility_accessibilityLabel__block_invoke_2;
  v4[3] = &unk_265169998;
  v4[4] = v1;
  long long v3 = *(_OWORD *)(a1 + 40);
  id v2 = (id)v3;
  long long v5 = v3;
  [v1 _accessibilityEnumerateContentsWithBlock:v4];
}

void __53__WFSlotTemplateViewAccessibility_accessibilityLabel__block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  NSClassFromString(&cfstr_Wfslottemplate_3.isa);
  if (objc_opt_isKindOfClass())
  {
    if ([v4 safeBoolForKey:@"isPopulated"])
    {
      char v23 = 0;
      objc_opt_class();
      long long v5 = [v4 safeValueForKey:@"contentAttributedString"];
      id v6 = __UIAccessibilityCastAsClass();

      id v7 = [v6 attributesAtIndex:0 effectiveRange:0];
      uint64_t v8 = [v7 count];

      if (v8)
      {
        uint64_t v9 = *MEMORY[0x263F1C208];
        uint64_t v10 = [v6 length];
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __53__WFSlotTemplateViewAccessibility_accessibilityLabel__block_invoke_3;
        v22[3] = &unk_265169970;
        v22[4] = *(void *)(a1 + 48);
        objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v9, 0, v10, 0, v22);
      }
      else
      {
        uint64_t v11 = [v6 string];
        uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
        long long v13 = *(void **)(v12 + 40);
        *(void *)(v12 + 40) = v11;
      }
    }
    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      uint64_t v14 = [*(id *)(a1 + 32) _accessibilityLocalizedPlaceholderNameForSlot:v4];
      uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
      char v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;
    }
  }
  uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v19 = *(void *)(v17 + 40);
  uint64_t v18 = (id *)(v17 + 40);
  if (!v19) {
    objc_storeStrong(v18, a2);
  }
  objc_msgSend(*(id *)(a1 + 40), "axSafelyAddObject:");
  uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8);
  v21 = *(void **)(v20 + 40);
  *(void *)(v20 + 40) = 0;
}

void __53__WFSlotTemplateViewAccessibility_accessibilityLabel__block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = a2;
  NSClassFromString(&cfstr_Wfvariableatta.isa);
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [v6 safeValueForKeyPath:@"variable.nameIncludingPropertyName"];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    long long v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
}

- (id)accessibilityCustomActions
{
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__0;
  v15[4] = __Block_byref_object_dispose__0;
  id v16 = 0;
  v12[5] = MEMORY[0x263EF8330];
  v12[6] = 3221225472;
  v12[7] = __61__WFSlotTemplateViewAccessibility_accessibilityCustomActions__block_invoke;
  v12[8] = &unk_2651699C0;
  v12[9] = self;
  uint64_t v14 = v15;
  id v4 = v3;
  id v13 = v4;
  AXPerformSafeBlock();
  if ([(WFSlotTemplateViewAccessibility *)self safeBoolForKey:@"showsDisclosureArrow"])
  {
    if ([(WFSlotTemplateViewAccessibility *)self safeBoolForKey:@"disclosureArrowIsOpen"])long long v5 = @"shortcut.show.less"; {
    else
    }
      long long v5 = @"shortcut.show.more";
    id v6 = accessibilityLocalizedString(v5);
    id v7 = objc_alloc(MEMORY[0x263F1C390]);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __61__WFSlotTemplateViewAccessibility_accessibilityCustomActions__block_invoke_10;
    v12[3] = &unk_265169AD8;
    v12[4] = self;
    uint64_t v8 = (void *)[v7 initWithName:v6 actionHandler:v12];
    [v4 axSafelyAddObject:v8];
  }
  uint64_t v9 = v13;
  id v10 = v4;

  _Block_object_dispose(v15, 8);

  return v10;
}

void __61__WFSlotTemplateViewAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __61__WFSlotTemplateViewAccessibility_accessibilityCustomActions__block_invoke_2;
  v4[3] = &unk_265169AB0;
  v4[4] = v1;
  long long v3 = *(_OWORD *)(a1 + 40);
  id v2 = (id)v3;
  long long v5 = v3;
  [v1 _accessibilityEnumerateContentsWithBlock:v4];
}

void __61__WFSlotTemplateViewAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  NSClassFromString(&cfstr_Wfslottemplate_3.isa);
  if (objc_opt_isKindOfClass())
  {
    id v4 = [*(id *)(a1 + 32) _accessibilityLocalizedPlaceholderNameForSlot:v3];
    long long v5 = accessibilityLocalizedString(@"edit.shortcut.action");
    id v6 = __AXStringForVariables();

    if (objc_msgSend(v3, "safeBoolForKey:", @"isPopulated", v4, @"__AXStringForVariablesSentinel"))
    {
      char v37 = 0;
      objc_opt_class();
      id v7 = [v3 safeValueForKey:@"contentAttributedString"];
      uint64_t v8 = __UIAccessibilityCastAsClass();

      uint64_t v9 = [v8 attributesAtIndex:0 effectiveRange:0];
      uint64_t v10 = [v9 count];

      if (v10)
      {
        uint64_t v11 = *MEMORY[0x263F1C208];
        uint64_t v12 = [v8 length];
        v31[0] = MEMORY[0x263EF8330];
        v31[1] = 3221225472;
        v31[2] = __61__WFSlotTemplateViewAccessibility_accessibilityCustomActions__block_invoke_3;
        v31[3] = &unk_265169A38;
        id v13 = v6;
        uint64_t v36 = *(void *)(a1 + 48);
        uint64_t v14 = *(void *)(a1 + 32);
        id v32 = v13;
        uint64_t v33 = v14;
        id v34 = v3;
        id v35 = *(id *)(a1 + 40);
        objc_msgSend(v8, "enumerateAttribute:inRange:options:usingBlock:", v11, 0, v12, 0, v31);
      }
      if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
      {
        v26 = [v8 string];
        uint64_t v15 = __AXStringForVariables();

        id v16 = objc_alloc(MEMORY[0x263F1C390]);
        v29[0] = MEMORY[0x263EF8330];
        v29[1] = 3221225472;
        v29[2] = __61__WFSlotTemplateViewAccessibility_accessibilityCustomActions__block_invoke_6;
        v29[3] = &unk_265169A88;
        v29[4] = *(void *)(a1 + 32);
        id v30 = v3;
        uint64_t v17 = objc_msgSend(v16, "initWithName:actionHandler:", v15, v29, v26, @"__AXStringForVariablesSentinel");
        uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
        uint64_t v19 = *(void **)(v18 + 40);
        *(void *)(v18 + 40) = v17;

        [*(id *)(a1 + 40) axSafelyAddObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
      }
    }
    else
    {
      id v20 = objc_alloc(MEMORY[0x263F1C390]);
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __61__WFSlotTemplateViewAccessibility_accessibilityCustomActions__block_invoke_8;
      v27[3] = &unk_265169A88;
      v27[4] = *(void *)(a1 + 32);
      id v28 = v3;
      uint64_t v21 = [v20 initWithName:v6 actionHandler:v27];
      uint64_t v22 = *(void *)(*(void *)(a1 + 48) + 8);
      char v23 = *(void **)(v22 + 40);
      *(void *)(v22 + 40) = v21;

      [*(id *)(a1 + 40) axSafelyAddObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    }
  }
  uint64_t v24 = *(void *)(*(void *)(a1 + 48) + 8);
  v25 = *(void **)(v24 + 40);
  *(void *)(v24 + 40) = 0;
}

void __61__WFSlotTemplateViewAccessibility_accessibilityCustomActions__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  NSClassFromString(&cfstr_Wfvariableatta.isa);
  if (objc_opt_isKindOfClass())
  {
    char v14 = 0;
    objc_opt_class();
    id v4 = [v3 safeValueForKeyPath:@"variable.nameIncludingPropertyName"];
    long long v5 = __UIAccessibilityCastAsClass();

    id v6 = __AXStringForVariables();
    id v7 = objc_alloc(MEMORY[0x263F1C390]);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __61__WFSlotTemplateViewAccessibility_accessibilityCustomActions__block_invoke_4;
    v11[3] = &unk_265169A10;
    v11[4] = *(void *)(a1 + 40);
    id v12 = v3;
    id v13 = *(id *)(a1 + 48);
    uint64_t v8 = objc_msgSend(v7, "initWithName:actionHandler:", v6, v11, v5, @"__AXStringForVariablesSentinel");
    uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    [*(id *)(a1 + 56) axSafelyAddObject:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  }
}

uint64_t __61__WFSlotTemplateViewAccessibility_accessibilityCustomActions__block_invoke_4(uint64_t a1)
{
  id v3 = *(id *)(a1 + 40);
  id v4 = *(id *)(a1 + 48);
  AXPerformSafeBlock();

  return 1;
}

void __61__WFSlotTemplateViewAccessibility_accessibilityCustomActions__block_invoke_5(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) safeValueForKey:@"delegate"];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 48) safeValueForKey:@"identifier"];
  [v5 slotTemplateView:v2 didTapTextAttachment:v3 inSlotWithIdentifier:v4];
}

uint64_t __61__WFSlotTemplateViewAccessibility_accessibilityCustomActions__block_invoke_6(uint64_t a1)
{
  id v2 = *(id *)(a1 + 40);
  AXPerformSafeBlock();

  return 1;
}

uint64_t __61__WFSlotTemplateViewAccessibility_accessibilityCustomActions__block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) _selectSlot:*(void *)(a1 + 40) notifyDelegate:1];
}

uint64_t __61__WFSlotTemplateViewAccessibility_accessibilityCustomActions__block_invoke_8(uint64_t a1)
{
  id v2 = *(id *)(a1 + 40);
  AXPerformSafeBlock();

  return 1;
}

uint64_t __61__WFSlotTemplateViewAccessibility_accessibilityCustomActions__block_invoke_9(uint64_t a1)
{
  return [*(id *)(a1 + 32) _selectSlot:*(void *)(a1 + 40) notifyDelegate:1];
}

uint64_t __61__WFSlotTemplateViewAccessibility_accessibilityCustomActions__block_invoke_10()
{
  return 1;
}

uint64_t __61__WFSlotTemplateViewAccessibility_accessibilityCustomActions__block_invoke_11(uint64_t a1)
{
  return [*(id *)(a1 + 32) didTapDisclosureArrow];
}

@end