@interface CNVisualIdentityEditablePrimaryAvatarViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_axUpdateTextFieldWithProviderItem:(id)a3;
- (void)updateWithProviderItem:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation CNVisualIdentityEditablePrimaryAvatarViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNVisualIdentityEditablePrimaryAvatarViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CNPhotoPickerProviderItem"];
  [v3 validateClass:@"CNPhotoPickerEmojiProviderItem"];
  [v3 validateClass:@"CNPhotoPickerMonogramProviderItem"];
  [v3 validateClass:@"CNPhotoPickerEmojiProviderItem" isKindOfClass:@"CNPhotoPickerProviderItem"];
  [v3 validateClass:@"CNPhotoPickerMonogramProviderItem" isKindOfClass:@"CNPhotoPickerProviderItem"];
  [v3 validateClass:@"CNPhotoPickerEmojiProviderItem" conformsToProtocol:@"CNVisualIdentityPickerTextEditableProviderItem"];
  [v3 validateClass:@"CNPhotoPickerMonogramProviderItem" conformsToProtocol:@"CNVisualIdentityPickerTextEditableProviderItem"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNVisualIdentityEditablePrimaryAvatarViewController", @"providerItem", "@", 0);
  [v3 validateProtocol:@"CNVisualIdentityPickerTextEditableProviderItem" hasRequiredInstanceMethod:@"backgroundColor"];
  [v3 validateClass:@"CNVisualIdentityEditablePrimaryAvatarViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNVisualIdentityEditablePrimaryAvatarViewController", @"textField", "@", 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNVisualIdentityEditablePrimaryAvatarViewControllerAccessibility;
  [(CNVisualIdentityEditablePrimaryAvatarViewControllerAccessibility *)&v5 viewDidAppear:a3];
  v4 = [(CNVisualIdentityEditablePrimaryAvatarViewControllerAccessibility *)self safeValueForKey:@"providerItem"];
  [(CNVisualIdentityEditablePrimaryAvatarViewControllerAccessibility *)self _axUpdateTextFieldWithProviderItem:v4];
}

- (void)updateWithProviderItem:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNVisualIdentityEditablePrimaryAvatarViewControllerAccessibility;
  id v4 = a3;
  [(CNVisualIdentityEditablePrimaryAvatarViewControllerAccessibility *)&v5 updateWithProviderItem:v4];
  -[CNVisualIdentityEditablePrimaryAvatarViewControllerAccessibility _axUpdateTextFieldWithProviderItem:](self, "_axUpdateTextFieldWithProviderItem:", v4, v5.receiver, v5.super_class);
}

- (void)_axUpdateTextFieldWithProviderItem:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = MEMORY[0x245648800](@"CNVisualIdentityPickerTextEditableProviderItem");
  uint64_t v6 = [v4 conformsToProtocol:v5];

  v13[0] = 0;
  objc_opt_class();
  v7 = [(CNVisualIdentityEditablePrimaryAvatarViewControllerAccessibility *)self safeValueForKey:@"textField"];
  v8 = __UIAccessibilityCastAsSafeCategory();

  [v8 _axSetIsTextEditable:v6];
  if (v6)
  {
    v13[0] = 0;
    objc_opt_class();
    v9 = [v4 safeValueForKey:@"backgroundColor"];
    v10 = __UIAccessibilityCastAsClass();

    v11 = AXLogTemp();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v13 = 138412290;
      *(void *)&v13[4] = v10;
      _os_log_impl(&dword_242070000, v11, OS_LOG_TYPE_INFO, "Color: %@", v13, 0xCu);
    }

    if (v10) {
      AXColorStringForColor();
    }
    else {
    v12 = accessibilityLocalizedString(@"default.background.color");
    }
    objc_msgSend(v8, "_axSetColorName:", v12, *(void *)v13);
  }
  MEMORY[0x2456487F0](@"CNPhotoPickerEmojiProviderItem");
  [v8 _axSetIsEmoji:objc_opt_isKindOfClass() & 1];
}

@end