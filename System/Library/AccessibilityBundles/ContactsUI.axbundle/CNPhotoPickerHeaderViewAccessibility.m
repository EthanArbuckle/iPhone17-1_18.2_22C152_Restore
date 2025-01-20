@interface CNPhotoPickerHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)didMoveToWindow;
- (void)didTapClearAvatarImageButton;
- (void)setClearAvatarImageButtonHidden:(BOOL)a3;
@end

@implementation CNPhotoPickerHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNPhotoPickerHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNPhotoPickerHeaderView", @"clearAvatarImageButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNPhotoPickerHeaderView", @"didMoveToWindow", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNPhotoPickerHeaderView", @"didTapClearAvatarImageButton", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNPhotoPickerHeaderView", @"identityNameTextField", "@", 0);
  [v3 validateClass:@"CNVisualIdentity"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNPhotoPickerHeaderView", @"visualIdentity", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNVisualIdentity", @"canUpdateGroupName", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNVisualIdentity", @"name", "@", 0);
  [v3 validateClass:@"CNVisualIdentityAvatarViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNPhotoPickerHeaderView", @"avatarViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNPhotoPickerHeaderView", @"setClearAvatarImageButtonHidden:", "v", "B", 0);
  [v3 validateClass:@"CNVisualIdentityAvatarViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNVisualIdentityAvatarViewController", @"badgeImageView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNVisualIdentityAvatarViewController", @"contentView", "@", 0);
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)CNPhotoPickerHeaderViewAccessibility;
  [(CNPhotoPickerHeaderViewAccessibility *)&v3 didMoveToWindow];
  [(CNPhotoPickerHeaderViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v29.receiver = self;
  v29.super_class = (Class)CNPhotoPickerHeaderViewAccessibility;
  [(CNPhotoPickerHeaderViewAccessibility *)&v29 _accessibilityLoadAccessibilityInformation];
  objc_super v3 = [(CNPhotoPickerHeaderViewAccessibility *)self safeValueForKey:@"clearAvatarImageButton"];
  v4 = accessibilityLocalizedString(@"clear.image.button");
  [v3 setAccessibilityLabel:v4];

  v5 = [(CNPhotoPickerHeaderViewAccessibility *)self safeValueForKey:@"visualIdentity"];
  if (([v5 safeBoolForKey:@"canUpdateGroupName"] & 1) == 0)
  {
    v6 = [(CNPhotoPickerHeaderViewAccessibility *)self safeUIViewForKey:@"identityNameTextField"];
    [v6 accessibilitySetIdentification:kAXPhotosTextFieldIdentifier];
  }
  char v28 = 0;
  objc_opt_class();
  v7 = [(CNPhotoPickerHeaderViewAccessibility *)self safeValueForKey:@"avatarViewController"];
  v8 = __UIAccessibilityCastAsClass();

  if (v8)
  {
    v9 = [v8 safeValueForKey:@"contentView"];
    [v9 setIsAccessibilityElement:1];
    [v9 setAccessibilityTraits:*MEMORY[0x263F1CF00]];
    v10 = [v5 safeStringForKey:@"name"];
    if (v10)
    {
      v11 = NSString;
      v12 = accessibilityLocalizedString(@"person.photo");
      v13 = objc_msgSend(v11, "localizedStringWithFormat:", v12, v10);
      [v9 setAccessibilityLabel:v13];
    }
    else
    {
      v12 = accessibilityLocalizedString(@"person.photo.unknown");
      [v9 setAccessibilityLabel:v12];
    }

    char v28 = 0;
    objc_opt_class();
    v14 = [v8 safeValueForKey:@"badgeImageView"];
    v15 = __UIAccessibilityCastAsClass();

    v16 = [v15 image];
    v17 = [v16 safeValueForKey:@"_imageAsset"];
    v18 = [v17 safeStringForKey:@"assetName"];

    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __82__CNPhotoPickerHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
    v26[3] = &unk_265118078;
    id v19 = v18;
    id v27 = v19;
    [v15 _setIsAccessibilityElementBlock:v26];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __82__CNPhotoPickerHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
    v24[3] = &unk_265118220;
    id v20 = v19;
    id v25 = v20;
    [v15 _setAccessibilityLabelBlock:v24];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __82__CNPhotoPickerHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
    v22[3] = &unk_265118248;
    id v23 = v20;
    id v21 = v20;
    [v15 _setAccessibilityTraitsBlock:v22];
  }
}

uint64_t __82__CNPhotoPickerHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) isEqualToString:@"xmark.circle.fill"];
}

id __82__CNPhotoPickerHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isEqualToString:@"xmark.circle.fill"])
  {
    v1 = accessibilityLocalizedString(@"clear.image.button");
  }
  else
  {
    v1 = 0;
  }

  return v1;
}

uint64_t __82__CNPhotoPickerHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  int v1 = [*(id *)(a1 + 32) isEqualToString:@"xmark.circle.fill"];
  uint64_t v2 = MEMORY[0x263F1CEE8];
  if (!v1) {
    uint64_t v2 = MEMORY[0x263F1CF18];
  }
  return *(void *)v2;
}

- (void)didTapClearAvatarImageButton
{
  v2.receiver = self;
  v2.super_class = (Class)CNPhotoPickerHeaderViewAccessibility;
  [(CNPhotoPickerHeaderViewAccessibility *)&v2 didTapClearAvatarImageButton];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (void)setClearAvatarImageButtonHidden:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNPhotoPickerHeaderViewAccessibility;
  [(CNPhotoPickerHeaderViewAccessibility *)&v4 setClearAvatarImageButtonHidden:a3];
  [(CNPhotoPickerHeaderViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end