@interface PKPaletteContentViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
@end

@implementation PKPaletteContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPaletteContentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPaletteContentView", @"undoRedoView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPaletteContentView", @"toolPickerView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPaletteContentView", @"colorPickerView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPaletteContentView", @"additionalOptionsView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPaletteContentView", @"contextualEditingView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPaletteContentView", @"toolAndColorPickerContainerView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPaletteToolPickerAndColorPickerView", @"lassoToolEditingContainerView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPaletteContentView", @"paletteInputAssistantView", "@", 0);
}

- (id)accessibilityElements
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (AXDoesRequestingClientDeserveAutomation())
  {
    v23.receiver = self;
    v23.super_class = (Class)PKPaletteContentViewAccessibility;
    id v3 = [(PKPaletteContentViewAccessibility *)&v23 accessibilityElements];
  }
  else
  {
    uint64_t v4 = [(PKPaletteContentViewAccessibility *)self safeValueForKey:@"undoRedoView"];
    uint64_t v5 = [(PKPaletteContentViewAccessibility *)self safeValueForKey:@"toolPickerView"];
    v6 = [(PKPaletteContentViewAccessibility *)self safeValueForKey:@"paletteInputAssistantView"];
    v7 = [(PKPaletteContentViewAccessibility *)self safeValueForKey:@"colorPickerView"];
    v8 = [(PKPaletteContentViewAccessibility *)self safeValueForKey:@"additionalOptionsView"];
    v9 = [(PKPaletteContentViewAccessibility *)self safeValueForKey:@"contextualEditingView"];
    v10 = [(PKPaletteContentViewAccessibility *)self safeValueForKey:@"toolAndColorPickerContainerView"];
    v11 = [v10 safeValueForKey:@"lassoToolEditingContainerView"];
    v17 = (void *)v5;
    v18 = (void *)v4;
    id v3 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 7, v4, v5, v9, v6, v7, v11, v8);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v12 = [v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v19 + 1) + 8 * i) setShouldGroupAccessibilityChildren:1];
        }
        uint64_t v13 = [v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v13);
    }
  }

  return v3;
}

@end