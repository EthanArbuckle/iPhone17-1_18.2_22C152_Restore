@interface PKPaletteReturnKeyButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation PKPaletteReturnKeyButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPaletteReturnKeyButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PKPaletteReturnKeyButton" isKindOfClass:@"UIControl"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPaletteReturnKeyButton", @"contentView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPaletteReturnKeyButtonContentView", @"text", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(PKPaletteReturnKeyButtonAccessibility *)self safeUIViewForKey:@"contentView"];
  v4 = [v3 safeStringForKey:@"text"];

  if (![v4 length])
  {
    v7.receiver = self;
    v7.super_class = (Class)PKPaletteReturnKeyButtonAccessibility;
    uint64_t v5 = [(PKPaletteReturnKeyButtonAccessibility *)&v7 accessibilityLabel];

    v4 = (void *)v5;
  }

  return v4;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)PKPaletteReturnKeyButtonAccessibility;
  return *MEMORY[0x263F1CEE8] | [(PKPaletteReturnKeyButtonAccessibility *)&v3 accessibilityTraits];
}

@end