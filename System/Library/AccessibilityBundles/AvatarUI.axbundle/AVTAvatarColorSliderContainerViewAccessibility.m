@interface AVTAvatarColorSliderContainerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)setSectionItem:(id)a3 animated:(BOOL)a4;
@end

@implementation AVTAvatarColorSliderContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVTAvatarColorSliderContainerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"AVTColorPreset"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAvatarColorSliderContainerView", @"slider", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAvatarColorSliderContainerView", @"sectionItem", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAvatarAttributeEditorSectionColorItem", @"color", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTCoreModelColor", @"baseColorPreset", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAvatarColorSliderContainerView", @"setSectionItem:animated:", "v", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTColorPreset", @"colorPresetWithVariation:", "@", "f", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTColorPreset", @"previewColor", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)AVTAvatarColorSliderContainerViewAccessibility;
  [(AVTAvatarColorSliderContainerViewAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  v3[0] = 0;
  v3[1] = v3;
  v3[2] = 0x3032000000;
  v3[3] = __Block_byref_object_copy_;
  v3[4] = __Block_byref_object_dispose_;
  id v4 = [(AVTAvatarColorSliderContainerViewAccessibility *)self safeValueForKeyPath:@"sectionItem.color.baseColorPreset"];
  MEMORY[0x245642ED0](@"AVTColorPreset");
  if (objc_opt_isKindOfClass()) {
    AXPerformSafeBlock();
  }
  _Block_object_dispose(v3, 8);
}

void __92__AVTAvatarColorSliderContainerViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = -1.0;
  id v3 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) colorPresetWithVariation:a2];
  LODWORD(v4) = 1.0;
  objc_super v5 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) colorPresetWithVariation:v4];
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_isKindOfClass())
  {
    id v6 = v3;
    id v7 = v5;
    AXPerformSafeBlock();
  }
}

void __92__AVTAvatarColorSliderContainerViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(id *a1)
{
  id v6 = [a1[4] previewColor];
  v2 = AXColorStringForColor();
  id v3 = [a1[5] previewColor];
  double v4 = AXColorStringForColor();
  objc_super v5 = [a1[6] safeValueForKey:@"slider"];
  [v5 _accessibilitySetRetainedValue:v2 forKey:@"AccessibilityMinColorNameKey"];
  [v5 _accessibilitySetRetainedValue:v4 forKey:@"AccessibilityMaxColorNameKey"];
}

- (void)setSectionItem:(id)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)AVTAvatarColorSliderContainerViewAccessibility;
  [(AVTAvatarColorSliderContainerViewAccessibility *)&v5 setSectionItem:a3 animated:a4];
  [(AVTAvatarColorSliderContainerViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end