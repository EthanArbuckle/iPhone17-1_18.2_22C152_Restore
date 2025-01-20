@interface PKBarcodeStickerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation PKBarcodeStickerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKBarcodeStickerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return [(PKBarcodeStickerViewAccessibility *)self safeBoolForKey:@"_drawBarcode"];
}

- (id)accessibilityLabel
{
  v2 = [(PKBarcodeStickerViewAccessibility *)self safeValueForKey:@"_altTextLabel"];
  v3 = [v2 accessibilityLabel];
  v6 = accessibilityLocalizedString(@"barcode.image");
  v4 = __UIAXStringForVariables();

  return v4;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF00];
}

@end