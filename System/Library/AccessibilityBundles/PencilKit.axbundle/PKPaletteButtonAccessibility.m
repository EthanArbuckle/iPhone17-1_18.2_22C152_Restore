@interface PKPaletteButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation PKPaletteButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPaletteButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v3 = [(PKPaletteButtonAccessibility *)self accessibilityIdentifier];
  if ([v3 isEqualToString:@"Scribble-UCB-Undo-Button"])
  {
    v4 = @"pkpalettebutton.undo";
LABEL_15:
    v5 = accessibilityPencilKitLocalizedString(v4);
    goto LABEL_16;
  }
  if ([v3 isEqualToString:@"Scribble-UCB-Redo-Button"])
  {
    v4 = @"pkpalettebutton.redo";
    goto LABEL_15;
  }
  if ([v3 isEqualToString:@"Scribble-UCB-More-Button"])
  {
    v4 = @"pkpalettebutton.more";
    goto LABEL_15;
  }
  if ([v3 isEqualToString:@"Scribble-UCB-Plus-Button"])
  {
    v4 = @"pkpalettebutton.plus";
    goto LABEL_15;
  }
  if ([v3 isEqualToString:@"Scribble-UCB-Keyboard-Button"])
  {
    v4 = @"pkpalettebutton.keyboard";
    goto LABEL_15;
  }
  if ([v3 isEqualToString:@"Scribble-UCB-Emoji-Button"])
  {
    v4 = @"pkpalettebutton.emoji";
    goto LABEL_15;
  }
  if ([v3 isEqualToString:@"Scribble-UCB-Small-Return-Button"])
  {
    v4 = @"pkpalettebutton.return";
    goto LABEL_15;
  }
  v7 = [(PKPaletteButtonAccessibility *)self safeValueForKey:@"button"];
  v5 = [v7 accessibilityLabel];

LABEL_16:

  return v5;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)PKPaletteButtonAccessibility;
  return *MEMORY[0x263F1CEE8] | [(PKPaletteButtonAccessibility *)&v3 accessibilityTraits];
}

@end