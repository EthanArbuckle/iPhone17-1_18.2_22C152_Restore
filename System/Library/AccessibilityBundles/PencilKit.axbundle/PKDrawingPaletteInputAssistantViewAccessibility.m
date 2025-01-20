@interface PKDrawingPaletteInputAssistantViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
@end

@implementation PKDrawingPaletteInputAssistantViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKDrawingPaletteInputAssistantView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKDrawingPaletteInputAssistantView", @"keyboardButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKDrawingPaletteInputAssistantView", @"returnKeyButton", "@", 0);
}

- (id)accessibilityElements
{
  id v3 = [(PKDrawingPaletteInputAssistantViewAccessibility *)self safeValueForKey:@"keyboardButton"];
  v4 = [(PKDrawingPaletteInputAssistantViewAccessibility *)self safeValueForKey:@"returnKeyButton"];
  v5 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 2, v3, v4);

  return v5;
}

@end