@interface PKPaletteColorSwatchAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation PKPaletteColorSwatchAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPaletteColorSwatch";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PKPaletteMulticolorSwatch"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPaletteColorSwatch", @"isSelected", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPaletteColorSwatch", @"swatchColor", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKSwatchColor", @"identifier", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKSwatchColor", @"color", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  int v3 = [(PKPaletteColorSwatchAccessibility *)self safeBoolForKey:@"isSelected"];
  v7.receiver = self;
  v7.super_class = (Class)PKPaletteColorSwatchAccessibility;
  unint64_t v4 = [(PKPaletteColorSwatchAccessibility *)&v7 accessibilityTraits];
  v5 = (void *)MEMORY[0x263F1CF38];
  if (!v3) {
    v5 = (void *)MEMORY[0x263F1CF18];
  }
  return *MEMORY[0x263F1CEE8] | v4 | *v5;
}

- (id)accessibilityLabel
{
  MEMORY[0x24565AD00](@"PKPaletteMulticolorSwatch", a2);
  if (objc_opt_isKindOfClass())
  {
    int v3 = accessibilityPencilKitLocalizedString(@"color.picker");
    goto LABEL_17;
  }
  unint64_t v4 = [(PKPaletteColorSwatchAccessibility *)self safeValueForKey:@"swatchColor"];
  v5 = [v4 safeStringForKey:@"identifier"];
  if ([v5 isEqualToString:@"blue"])
  {
    v6 = @"blue.color";
  }
  else if ([v5 isEqualToString:@"red"])
  {
    v6 = @"red.color";
  }
  else if ([v5 isEqualToString:@"yellow"])
  {
    v6 = @"yellow.color";
  }
  else if ([v5 isEqualToString:@"black"])
  {
    v6 = @"black.color";
  }
  else if ([v5 isEqualToString:@"white"])
  {
    v6 = @"white.color";
  }
  else
  {
    if (![v5 isEqualToString:@"green"])
    {
      int v3 = 0;
      goto LABEL_16;
    }
    v6 = @"green.color";
  }
  int v3 = accessibilityPencilKitLocalizedString(v6);
LABEL_16:

LABEL_17:

  return v3;
}

- (id)accessibilityValue
{
  MEMORY[0x24565AD00](@"PKPaletteMulticolorSwatch", a2);
  if (objc_opt_isKindOfClass())
  {
    int v3 = [(PKPaletteColorSwatchAccessibility *)self safeValueForKey:@"swatchColor"];
    unint64_t v4 = [v3 safeValueForKey:@"color"];

    if (v4)
    {
      char v12 = 0;
      objc_opt_class();
      v5 = __UIAccessibilityCastAsClass();
      v6 = AXColorStringForColor();
      if ([v6 length])
      {
        objc_super v7 = NSString;
        v8 = accessibilityPencilKitLocalizedString(@"color.picker.current");
        v9 = objc_msgSend(v7, "stringWithFormat:", v8, v6);

        goto LABEL_8;
      }
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)PKPaletteColorSwatchAccessibility;
  v9 = [(PKPaletteColorSwatchAccessibility *)&v11 accessibilityValue];
LABEL_8:

  return v9;
}

@end