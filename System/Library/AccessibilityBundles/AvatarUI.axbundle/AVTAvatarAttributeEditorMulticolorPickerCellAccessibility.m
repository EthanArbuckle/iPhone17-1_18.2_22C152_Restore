@interface AVTAvatarAttributeEditorMulticolorPickerCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation AVTAvatarAttributeEditorMulticolorPickerCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVTAvatarAttributeEditorMulticolorPickerCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAvatarAttributeEditorMulticolorPickerCell", @"item", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAvatarAttributeEditorMulticolorPickerSectionItem", @"colorItem", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAvatarAttributeEditorSectionColorItem", @"color", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTCoreModelColor", @"localizedName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAvatarAttributeEditorMulticolorPickerCell", @"clearButton", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(AVTAvatarAttributeEditorMulticolorPickerCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"label"];
}

- (id)accessibilityValue
{
  v2 = [(AVTAvatarAttributeEditorMulticolorPickerCellAccessibility *)self safeValueForKeyPath:@"item.colorItem.color"];
  id v3 = [v2 safeStringForKey:@"localizedName"];

  return v3;
}

- (id)accessibilityCustomActions
{
  v17.receiver = self;
  v17.super_class = (Class)AVTAvatarAttributeEditorMulticolorPickerCellAccessibility;
  id v3 = [(AVTAvatarAttributeEditorMulticolorPickerCellAccessibility *)&v17 accessibilityCustomActions];
  id v4 = (id)[v3 mutableCopy];

  if (!v4) {
    id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  }
  LOBYTE(location) = 0;
  objc_opt_class();
  v5 = [(AVTAvatarAttributeEditorMulticolorPickerCellAccessibility *)self safeValueForKey:@"clearButton"];
  v6 = __UIAccessibilityCastAsClass();

  if (([v6 isHidden] & 1) == 0)
  {
    objc_initWeak(&location, v6);
    id v7 = objc_alloc(MEMORY[0x263F1C390]);
    v8 = NSString;
    v9 = accessibilityLocalizedString(@"clear.memoji.trait");
    v10 = [(AVTAvatarAttributeEditorMulticolorPickerCellAccessibility *)self accessibilityLabel];
    v11 = objc_msgSend(v8, "localizedStringWithFormat:", v9, v10);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __87__AVTAvatarAttributeEditorMulticolorPickerCellAccessibility_accessibilityCustomActions__block_invoke;
    v14[3] = &unk_26510A438;
    objc_copyWeak(&v15, &location);
    v12 = (void *)[v7 initWithName:v11 actionHandler:v14];

    [v4 addObject:v12];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v4;
}

uint64_t __87__AVTAvatarAttributeEditorMulticolorPickerCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained sendActionsForControlEvents:64];

  return 1;
}

@end