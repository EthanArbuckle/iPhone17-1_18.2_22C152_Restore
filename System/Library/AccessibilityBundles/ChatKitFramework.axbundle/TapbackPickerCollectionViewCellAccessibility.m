@interface TapbackPickerCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsEmojiKeyboardButton;
- (id)accessibilityHint;
- (id)accessibilityLabel;
@end

@implementation TapbackPickerCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ChatKit.TapbackPickerCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"ChatKit.TapbackPickerCollectionViewCell" hasSwiftField:@"tapbackView" withSwiftType:"Optional<UIView & CKTapbackViewProtocol>"];
  [v3 validateClass:@"ChatKit.TapbackEmojiKeyboardGlyphView"];
}

- (id)accessibilityLabel
{
  if ([(TapbackPickerCollectionViewCellAccessibility *)self _axIsEmojiKeyboardButton])
  {
    id v3 = accessibilityLocalizedString(@"add.custom.emoji.reaction");
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)TapbackPickerCollectionViewCellAccessibility;
    id v3 = [(TapbackPickerCollectionViewCellAccessibility *)&v5 accessibilityLabel];
  }

  return v3;
}

- (id)accessibilityHint
{
  if ([(TapbackPickerCollectionViewCellAccessibility *)self _axIsEmojiKeyboardButton])
  {
    v2 = 0;
  }
  else
  {
    v2 = accessibilityLocalizedString(@"acknowledgment.hint");
  }

  return v2;
}

- (BOOL)_axIsEmojiKeyboardButton
{
  v2 = [(TapbackPickerCollectionViewCellAccessibility *)self safeSwiftValueForKey:@"tapbackView"];
  NSClassFromString(&cfstr_ChatkitTapback_3.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end