@interface PKPaletteToolViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_axToolPicker;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation PKPaletteToolViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPaletteToolView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPaletteView", @"delegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKToolPicker", @"isRulerActive", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPaletteToolView", @"toolIdentifier", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIControl", @"isSelected", "B", 0);
  [v3 validateClass:@"PKPaletteToolView" isKindOfClass:@"UIControl"];
}

- (id)_axToolPicker
{
  v2 = [(PKPaletteToolViewAccessibility *)self _accessibilityAncestorIsKindOf:MEMORY[0x24565AD00](@"PKPaletteView", a2)];
  id v3 = [v2 safeValueForKey:@"delegate"];

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v9.receiver = self;
  v9.super_class = (Class)PKPaletteToolViewAccessibility;
  id v3 = [(PKPaletteToolViewAccessibility *)&v9 accessibilityLabel];
  v4 = [(PKPaletteToolViewAccessibility *)self safeStringForKey:@"toolIdentifier"];
  v5 = accessibilityNameForInkIdentifier(v4);
  v6 = v5;
  if (!v5) {
    v5 = v3;
  }
  id v7 = v5;

  return v7;
}

- (unint64_t)accessibilityTraits
{
  id v3 = [(PKPaletteToolViewAccessibility *)self safeStringForKey:@"toolIdentifier"];
  v8.receiver = self;
  v8.super_class = (Class)PKPaletteToolViewAccessibility;
  unint64_t v4 = [(PKPaletteToolViewAccessibility *)&v8 accessibilityTraits];
  if ([v3 isEqualToString:*MEMORY[0x263F14CE8]]) {
    uint64_t v5 = ~*MEMORY[0x263F1CF38];
  }
  else {
    uint64_t v5 = -1;
  }
  unint64_t v6 = v5 & v4 | *MEMORY[0x263F1CEE8];

  return v6;
}

- (id)accessibilityValue
{
  id v3 = [(PKPaletteToolViewAccessibility *)self safeStringForKey:@"toolIdentifier"];
  if ([v3 isEqualToString:*MEMORY[0x263F14C90]])
  {
    unint64_t v4 = 0;
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F14CE8]])
  {
    uint64_t v5 = [(PKPaletteToolViewAccessibility *)self _axToolPicker];
    unint64_t v6 = v5;
    if (v5)
    {
      if ([v5 safeBoolForKey:@"isRulerActive"]) {
        id v7 = @"ruler.active";
      }
      else {
        id v7 = @"ruler.inactive";
      }
      unint64_t v4 = accessibilityPencilKitLocalizedString(v7);
    }
    else
    {
      unint64_t v4 = 0;
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)PKPaletteToolViewAccessibility;
    unint64_t v4 = [(PKPaletteToolViewAccessibility *)&v9 accessibilityValue];
  }

  return v4;
}

- (id)accessibilityHint
{
  id v3 = [(PKPaletteToolViewAccessibility *)self safeStringForKey:@"toolIdentifier"];
  if ((([v3 isEqualToString:*MEMORY[0x263F14C88]] & 1) != 0
     || [v3 isEqualToString:*MEMORY[0x263F14CA0]])
    && [(PKPaletteToolViewAccessibility *)self safeBoolForKey:@"isSelected"])
  {
    unint64_t v4 = accessibilityPencilKitLocalizedString(@"object.eraser.tool.hint");
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

@end