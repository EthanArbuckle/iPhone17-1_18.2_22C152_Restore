@interface CKStickerDetailCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (NSString)_axStickerDescription;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
- (void)_axSetStickerDescription:(id)a3;
@end

@implementation CKStickerDetailCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKStickerDetailCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (NSString)_axStickerDescription
{
}

- (void)_axSetStickerDescription:(id)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKStickerDetailCell", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKStickerDetailCell", @"subtitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKStickerDetailCell", @"timestampLabel", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(CKStickerDetailCellAccessibility *)self _axStickerDescription];
  objc_opt_class();
  v4 = [(CKStickerDetailCellAccessibility *)self safeValueForKey:@"titleLabel"];
  v5 = __UIAccessibilityCastAsClass();

  v6 = [v5 accessibilityLabel];

  v7 = NSString;
  v8 = accessibilityLocalizedString(@"message.from.format");
  v9 = objc_msgSend(v7, "localizedStringWithFormat:", v8, v6);

  objc_opt_class();
  v10 = [(CKStickerDetailCellAccessibility *)self safeValueForKey:@"subtitleLabel"];
  v11 = __UIAccessibilityCastAsClass();

  v12 = [v11 accessibilityLabel];

  objc_opt_class();
  v13 = [(CKStickerDetailCellAccessibility *)self safeValueForKey:@"timestampLabel"];
  v14 = __UIAccessibilityCastAsClass();

  v15 = [v14 accessibilityLabel];

  v16 = __UIAXStringForVariables();

  return v16;
}

- (id)accessibilityCustomActions
{
  v16[1] = *MEMORY[0x263EF8340];
  LOBYTE(location) = 0;
  objc_opt_class();
  id v3 = [(CKStickerDetailCellAccessibility *)self safeValueForKey:@"viewButton"];
  v4 = __UIAccessibilityCastAsClass();

  objc_initWeak(&location, v4);
  id v5 = objc_alloc(MEMORY[0x263F1C390]);
  v6 = [v4 accessibilityLabel];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  v12 = __62__CKStickerDetailCellAccessibility_accessibilityCustomActions__block_invoke;
  v13 = &unk_265112F48;
  objc_copyWeak(&v14, &location);
  v7 = (void *)[v5 initWithName:v6 actionHandler:&v10];

  v16[0] = v7;
  v8 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v16, 1, v10, v11, v12, v13);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v8;
}

uint64_t __62__CKStickerDetailCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained sendActionsForControlEvents:0x2000];

  return 1;
}

@end