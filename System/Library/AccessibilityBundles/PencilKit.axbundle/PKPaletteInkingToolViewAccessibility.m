@interface PKPaletteInkingToolViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityValue;
@end

@implementation PKPaletteInkingToolViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPaletteInkingToolView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPaletteInkingToolView", @"ink", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKInk", @"color", "@", 0);
}

- (id)accessibilityValue
{
  v14.receiver = self;
  v14.super_class = (Class)PKPaletteInkingToolViewAccessibility;
  id v3 = [(PKPaletteInkingToolViewAccessibility *)&v14 accessibilityValue];
  v4 = [(PKPaletteInkingToolViewAccessibility *)self safeStringForKey:@"toolIdentifier"];
  if ([v4 isEqualToString:*MEMORY[0x263F14C80]])
  {
    id v5 = v3;
  }
  else
  {
    v6 = [(PKPaletteInkingToolViewAccessibility *)self safeValueForKeyPath:@"ink.color"];
    v7 = v6;
    if (v6)
    {
      [v6 alphaComponent];
      v8 = accessibilityPencilKitLocalizedString(@"tool.color");
      v9 = AXColorStringForColor();
      v10 = accessibilityPencilKitLocalizedString(@"tool.opacity");
      v13 = AXFormatFloatWithPercentage();
      uint64_t v11 = __UIAXStringForVariables();

      id v3 = (void *)v11;
    }
    id v5 = v3;
  }

  return v5;
}

@end