@interface CNPhotoPickerCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsAddItem;
- (BOOL)_axIsVariant;
- (BOOL)isAccessibilityElement;
- (id)_axProviderGroup;
- (id)_axProviderItem;
- (id)accessibilityLabel;
- (id)accessibilityUserInputLabels;
- (unint64_t)accessibilityTraits;
- (void)_axSetIsAddItem:(BOOL)a3;
- (void)_axSetIsVariant:(BOOL)a3;
- (void)_axSetProviderGroup:(id)a3;
- (void)_axSetProviderItem:(id)a3;
@end

@implementation CNPhotoPickerCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNPhotoPickerCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_axIsAddItem
{
  return MEMORY[0x270F0A438](self, &__CNPhotoPickerCollectionViewCellAccessibility___axIsAddItem);
}

- (void)_axSetIsAddItem:(BOOL)a3
{
}

- (BOOL)_axIsVariant
{
  return MEMORY[0x270F0A438](self, &__CNPhotoPickerCollectionViewCellAccessibility___axIsVariant);
}

- (void)_axSetIsVariant:(BOOL)a3
{
}

- (id)_axProviderItem
{
}

- (void)_axSetProviderItem:(id)a3
{
}

- (id)_axProviderGroup
{
}

- (void)_axSetProviderGroup:(id)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CNPhotoPickerProviderItem" hasInstanceVariable:@"_localizedVariantDisplayName" withType:"NSString"];
  [v3 validateClass:@"CNPhotoPickerAnimojiProviderItem"];
  [v3 validateClass:@"CNPhotoPickerEmojiProviderItem"];
  [v3 validateClass:@"CNPhotoPickerMonogramProviderItem"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNPhotoPickerAnimojiProviderItem", @"avatarRecord", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNPhotoPickerAnimojiProviderItem", @"poseConfiguration", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNPhotoPickerCollectionViewCell", @"captionLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNPhotoPickerMonogramProviderItem", @"monogramText", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNPhotoPickerMonogramProviderItem", @"renderingScope", "@", 0);
  [v3 validateClass:@"PRMonogramColor"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PRMonogramColor", @"colorName", "@", 0);
  [v3 validateClass:@"CNPhotoPickerProviderGroup"];
  [v3 validateClass:@"CNPhotoPickerProviderGroup" hasProperty:@"groupType" withType:"q"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityUserInputLabels
{
  v10[1] = *MEMORY[0x263EF8340];
  id v3 = [(CNPhotoPickerCollectionViewCellAccessibility *)self _axProviderItem];
  MEMORY[0x2456487F0](@"CNPhotoPickerAnimojiProviderItem");
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v3 safeValueForKey:@"avatarRecord"],
        v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 safeBoolForKey:@"isEditable"],
        v4,
        v5))
  {
    v6 = accessibilityLocalizedString(@"contact.image.type.memoji");
    v10[0] = v6;
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CNPhotoPickerCollectionViewCellAccessibility;
    v7 = [(CNPhotoPickerCollectionViewCellAccessibility *)&v9 accessibilityUserInputLabels];
  }

  return v7;
}

- (id)accessibilityLabel
{
  if (![(CNPhotoPickerCollectionViewCellAccessibility *)self _axIsAddItem])
  {
    v4 = [(CNPhotoPickerCollectionViewCellAccessibility *)self _axProviderItem];
    v6 = [(CNPhotoPickerCollectionViewCellAccessibility *)self safeValueForKey:@"captionLabel"];
    v7 = [v6 accessibilityLabel];

    MEMORY[0x2456487F0](@"CNPhotoPickerMonogramProviderItem");
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      v8 = __UIAccessibilityCastAsSafeCategory();
      objc_super v9 = [v8 _axColorVariantName];
      v10 = [v4 safeStringForKey:@"monogramText"];
      v11 = NSString;
      v12 = accessibilityLocalizedString(@"monogram.description.button");
      objc_msgSend(v11, "stringWithFormat:", v12, v10, v9);
    }
    else
    {
      MEMORY[0x2456487F0](@"CNPhotoPickerGlyphProviderItem");
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        v8 = __UIAccessibilityCastAsSafeCategory();
        v13 = [v8 _axSymbolName];
        v14 = v13;
        if (v13) {
          id v15 = v13;
        }

        goto LABEL_19;
      }
      MEMORY[0x2456487F0](@"CNPhotoPickerEmojiProviderItem");
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        MEMORY[0x2456487F0](@"CNPhotoPickerAnimojiProviderItem");
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (v7)
          {
            v14 = 0;
          }
          else
          {
            v14 = accessibilityLocalizedString(@"contact.image.type.photo");
          }
          goto LABEL_20;
        }
        if ([(CNPhotoPickerCollectionViewCellAccessibility *)self _axIsVariant])
        {
          objc_opt_class();
          v24 = __UIAccessibilityCastAsSafeCategory();
          v25 = [v24 _axColorVariantName];
          v26 = v25;
          if (v25) {
            id v27 = v25;
          }
        }
        else
        {
          v26 = 0;
        }
        v8 = [v4 safeValueForKey:@"avatarRecord"];
        v28 = [v4 safeValueForKey:@"poseConfiguration"];
        v29 = [v28 safeStringForKey:@"localizedName"];

        v30 = __UIAXStringForVariables();

        v31 = objc_msgSend(MEMORY[0x263F22288], "descriptionForAvatarWithRecord:includeVideoPrefix:", v8, 0, v26, @"__AXStringForVariablesSentinel");
        v32 = @"__AXStringForVariablesSentinel";
        v14 = __UIAXStringForVariables();

LABEL_19:
LABEL_20:
        v21 = objc_msgSend(v4, "safeStringForKey:", @"_localizedVariantDisplayName", v31, v32);
        v22 = __UIAXStringForVariables();

        __UIAXStringForVariables();
        id v5 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_21;
      }
      objc_opt_class();
      v8 = __UIAccessibilityCastAsSafeCategory();
      objc_super v9 = [v8 _axStringRepresentation];
      v10 = [v8 _axColorVariantName];
      v20 = NSString;
      v12 = accessibilityLocalizedString(@"emoji.description.button");
      objc_msgSend(v20, "stringWithFormat:", v12, v9, v10);
    v14 = };

    goto LABEL_19;
  }
  id v3 = [(CNPhotoPickerCollectionViewCellAccessibility *)self accessibilityUserDefinedLabel];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v16 = [(CNPhotoPickerCollectionViewCellAccessibility *)self _axProviderGroup];
    uint64_t v17 = [v16 safeIntegerForKey:@"groupType"];
    v18 = @"contact.image.add.button.label";
    if (v17 == 3) {
      v18 = @"new.emoji.button";
    }
    if (v17 == 2) {
      v19 = @"new.memoji.button";
    }
    else {
      v19 = v18;
    }
    accessibilityLocalizedString(v19);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_21:

  return v5;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF00] | *MEMORY[0x263F1CEE8];
}

@end