@interface PKSqueezePaletteButtonFactoryAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)makeBackButton;
- (id)makeGearButton;
- (id)makeShapesButton;
- (id)makeSignatureButton;
- (id)makeStickersButton;
- (id)makeTextBoxButton;
@end

@implementation PKSqueezePaletteButtonFactoryAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKSqueezePaletteButtonFactory";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKSqueezePaletteButtonFactory", @"makeBackButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKSqueezePaletteButtonFactory", @"makeTextBoxButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKSqueezePaletteButtonFactory", @"makeSignatureButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKSqueezePaletteButtonFactory", @"makeShapesButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKSqueezePaletteButtonFactory", @"makeStickersButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKSqueezePaletteButtonFactory", @"makeGearButton", "@", 0);
}

- (id)makeBackButton
{
  v5.receiver = self;
  v5.super_class = (Class)PKSqueezePaletteButtonFactoryAccessibility;
  v2 = [(PKSqueezePaletteButtonFactoryAccessibility *)&v5 makeBackButton];
  id v3 = accessibilityPencilKitLocalizedString(@"back");
  [v2 setAccessibilityLabel:v3];

  return v2;
}

- (id)makeTextBoxButton
{
  v5.receiver = self;
  v5.super_class = (Class)PKSqueezePaletteButtonFactoryAccessibility;
  v2 = [(PKSqueezePaletteButtonFactoryAccessibility *)&v5 makeTextBoxButton];
  id v3 = accessibilityPencilKitLocalizedString(@"squeeze.add.textbox");
  [v2 setAccessibilityLabel:v3];

  return v2;
}

- (id)makeSignatureButton
{
  v5.receiver = self;
  v5.super_class = (Class)PKSqueezePaletteButtonFactoryAccessibility;
  v2 = [(PKSqueezePaletteButtonFactoryAccessibility *)&v5 makeSignatureButton];
  id v3 = accessibilityPencilKitLocalizedString(@"squeeze.add.signature");
  [v2 setAccessibilityLabel:v3];

  return v2;
}

- (id)makeShapesButton
{
  v5.receiver = self;
  v5.super_class = (Class)PKSqueezePaletteButtonFactoryAccessibility;
  v2 = [(PKSqueezePaletteButtonFactoryAccessibility *)&v5 makeShapesButton];
  id v3 = accessibilityPencilKitLocalizedString(@"squeeze.add.shape");
  [v2 setAccessibilityLabel:v3];

  return v2;
}

- (id)makeStickersButton
{
  v5.receiver = self;
  v5.super_class = (Class)PKSqueezePaletteButtonFactoryAccessibility;
  v2 = [(PKSqueezePaletteButtonFactoryAccessibility *)&v5 makeStickersButton];
  id v3 = accessibilityPencilKitLocalizedString(@"squeeze.add.sticker");
  [v2 setAccessibilityLabel:v3];

  return v2;
}

- (id)makeGearButton
{
  v5.receiver = self;
  v5.super_class = (Class)PKSqueezePaletteButtonFactoryAccessibility;
  v2 = [(PKSqueezePaletteButtonFactoryAccessibility *)&v5 makeGearButton];
  id v3 = accessibilityPencilKitLocalizedString(@"settings");
  [v2 setAccessibilityLabel:v3];

  return v2;
}

@end