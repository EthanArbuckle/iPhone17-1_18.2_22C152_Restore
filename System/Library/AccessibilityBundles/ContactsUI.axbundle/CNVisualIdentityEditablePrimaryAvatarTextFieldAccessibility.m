@interface CNVisualIdentityEditablePrimaryAvatarTextFieldAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_axIsEmoji;
- (BOOL)_axIsTextEditable;
- (id)_axColorName;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)_axSetColorName:(id)a3;
- (void)_axSetIsEmoji:(BOOL)a3;
- (void)_axSetIsTextEditable:(BOOL)a3;
@end

@implementation CNVisualIdentityEditablePrimaryAvatarTextFieldAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNVisualIdentityEditablePrimaryAvatarTextField";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_axIsTextEditable
{
  return MEMORY[0x270F0A438](self, &__CNVisualIdentityEditablePrimaryAvatarTextFieldAccessibility___axIsTextEditable);
}

- (void)_axSetIsTextEditable:(BOOL)a3
{
}

- (BOOL)_axIsEmoji
{
  return MEMORY[0x270F0A438](self, &__CNVisualIdentityEditablePrimaryAvatarTextFieldAccessibility___axIsEmoji);
}

- (void)_axSetIsEmoji:(BOOL)a3
{
}

- (id)_axColorName
{
}

- (void)_axSetColorName:(id)a3
{
}

- (id)accessibilityLabel
{
  if ([(CNVisualIdentityEditablePrimaryAvatarTextFieldAccessibility *)self _axIsTextEditable])
  {
    BOOL v3 = [(CNVisualIdentityEditablePrimaryAvatarTextFieldAccessibility *)self _axIsEmoji];
    v4 = NSString;
    if (v3) {
      v5 = @"emoji.description.button";
    }
    else {
      v5 = @"monogram.description.button";
    }
    v7 = accessibilityLocalizedString(v5);
    v8 = [(CNVisualIdentityEditablePrimaryAvatarTextFieldAccessibility *)self safeStringForKey:@"text"];
    v9 = [(CNVisualIdentityEditablePrimaryAvatarTextFieldAccessibility *)self _axColorName];
    v6 = objc_msgSend(v4, "stringWithFormat:", v7, v8, v9);
  }
  else
  {
    v6 = accessibilityLocalizedString(@"contact.image.type.photo");
  }

  return v6;
}

- (unint64_t)accessibilityTraits
{
  if (![(CNVisualIdentityEditablePrimaryAvatarTextFieldAccessibility *)self _axIsTextEditable]) {
    return *MEMORY[0x263F1CF00];
  }
  v4.receiver = self;
  v4.super_class = (Class)CNVisualIdentityEditablePrimaryAvatarTextFieldAccessibility;
  return [(CNVisualIdentityEditablePrimaryAvatarTextFieldAccessibility *)&v4 accessibilityTraits];
}

@end