@interface PKPaletteAdditionalOptionsViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation PKPaletteAdditionalOptionsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPaletteAdditionalOptionsView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPaletteAdditionalOptionsView", @"plusButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPaletteAdditionalOptionsView", @"ellipsisButton", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v8.receiver = self;
  v8.super_class = (Class)PKPaletteAdditionalOptionsViewAccessibility;
  [(PKPaletteAdditionalOptionsViewAccessibility *)&v8 _accessibilityLoadAccessibilityInformation];
  id v3 = [(PKPaletteAdditionalOptionsViewAccessibility *)self safeValueForKey:@"plusButton"];
  v4 = [(PKPaletteAdditionalOptionsViewAccessibility *)self safeValueForKey:@"ellipsisButton"];
  [v3 setIsAccessibilityElement:1];
  v5 = accessibilityPencilKitLocalizedString(@"add.annotations.button");
  [v3 setAccessibilityLabel:v5];

  uint64_t v6 = *MEMORY[0x263F1CEE8];
  objc_msgSend(v3, "setAccessibilityTraits:", objc_msgSend(v3, "accessibilityTraits") | *MEMORY[0x263F1CEE8]);
  [v4 setIsAccessibilityElement:1];
  v7 = accessibilityPencilKitLocalizedString(@"more.options.button");
  [v4 setAccessibilityLabel:v7];

  objc_msgSend(v4, "setAccessibilityTraits:", objc_msgSend(v4, "accessibilityTraits") | v6);
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKPaletteAdditionalOptionsViewAccessibility;
  [(PKPaletteAdditionalOptionsViewAccessibility *)&v3 layoutSubviews];
  [(PKPaletteAdditionalOptionsViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

@end