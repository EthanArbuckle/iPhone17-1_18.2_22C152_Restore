@interface TapbackPickerEmojiTailViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation TapbackPickerEmojiTailViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ChatKit.TapbackPickerEmojiTailView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  v2 = [(TapbackPickerEmojiTailViewAccessibility *)self accessibilityContainer];
  NSClassFromString(&cfstr_ChatkitTapback.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"add.custom.emoji.reaction");
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)TapbackPickerEmojiTailViewAccessibility;
  return *MEMORY[0x263F1CEE8] | [(TapbackPickerEmojiTailViewAccessibility *)&v3 accessibilityTraits];
}

@end