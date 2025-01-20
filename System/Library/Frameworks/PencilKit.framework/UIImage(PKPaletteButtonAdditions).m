@interface UIImage(PKPaletteButtonAdditions)
+ (id)_pk_imageNamed:()PKPaletteButtonAdditions;
+ (id)pk_UCBButtonImage;
+ (id)pk_ellipsisButtonImage;
+ (id)pk_emojiButtonImage;
+ (id)pk_handwritingToolLabelImage;
+ (id)pk_keyboardButtonImage;
+ (id)pk_plusButtonImage;
+ (id)pk_redoButtonImage;
+ (id)pk_returnKeyButtonImage;
+ (id)pk_shapeButtonImage;
+ (id)pk_textButtonImage;
+ (id)pk_undoButtonImage;
@end

@implementation UIImage(PKPaletteButtonAdditions)

+ (id)_pk_imageNamed:()PKPaletteButtonAdditions
{
  v4 = (void *)MEMORY[0x1E4F28B50];
  id v5 = a3;
  v6 = [v4 bundleForClass:objc_opt_class()];
  v7 = [a1 imageNamed:v5 inBundle:v6 compatibleWithTraitCollection:0];

  return v7;
}

+ (id)pk_undoButtonImage
{
  v2 = objc_msgSend(MEMORY[0x1E4FB1830], "pk_defaultImageSymbolConfiguration");
  v3 = [a1 systemImageNamed:@"arrow.uturn.backward" withConfiguration:v2];

  return v3;
}

+ (id)pk_redoButtonImage
{
  v2 = objc_msgSend(MEMORY[0x1E4FB1830], "pk_defaultImageSymbolConfiguration");
  v3 = [a1 systemImageNamed:@"arrow.uturn.forward" withConfiguration:v2];

  return v3;
}

+ (id)pk_ellipsisButtonImage
{
  v2 = [MEMORY[0x1E4FB1830] configurationWithPointSize:6 weight:2 scale:17.0];
  v3 = [a1 systemImageNamed:@"ellipsis" withConfiguration:v2];

  return v3;
}

+ (id)pk_plusButtonImage
{
  v2 = objc_msgSend(MEMORY[0x1E4FB1830], "pk_defaultImageSymbolConfiguration");
  v3 = [a1 systemImageNamed:@"plus" withConfiguration:v2];

  return v3;
}

+ (id)pk_UCBButtonImage
{
  v2 = (void *)MEMORY[0x1E4FB1830];
  if (qword_1EA3C6C60 != -1) {
    dispatch_once(&qword_1EA3C6C60, &__block_literal_global_78);
  }
  v3 = [v2 configurationWithPointSize:6 weight:1 scale:*(double *)&_MergedGlobals_7];
  v4 = [a1 systemImageNamed:@"keyboard.badge.ellipsis" withConfiguration:v3];

  return v4;
}

+ (id)pk_keyboardButtonImage
{
  v2 = objc_msgSend(MEMORY[0x1E4FB1830], "pk_defaultImageSymbolConfiguration");
  v3 = [a1 systemImageNamed:@"keyboard" withConfiguration:v2];

  return v3;
}

+ (id)pk_emojiButtonImage
{
  v2 = objc_msgSend(MEMORY[0x1E4FB1830], "pk_defaultImageSymbolConfiguration");
  v3 = [a1 systemImageNamed:@"smiley" withConfiguration:v2];

  return v3;
}

+ (id)pk_returnKeyButtonImage
{
  v2 = objc_msgSend(MEMORY[0x1E4FB1830], "pk_defaultImageSymbolConfiguration");
  v3 = [a1 systemImageNamed:@"return" withConfiguration:v2];

  return v3;
}

+ (id)pk_textButtonImage
{
  v2 = objc_msgSend(MEMORY[0x1E4FB1830], "pk_defaultImageSymbolConfiguration");
  v3 = [a1 systemImageNamed:@"character.textbox" withConfiguration:v2];

  return v3;
}

+ (id)pk_shapeButtonImage
{
  v2 = objc_msgSend(MEMORY[0x1E4FB1830], "pk_defaultImageSymbolConfiguration");
  v3 = [a1 systemImageNamed:@"square.on.circle" withConfiguration:v2];

  return v3;
}

+ (id)pk_handwritingToolLabelImage
{
  v2 = (void *)MEMORY[0x1E4FB1830];
  v3 = [MEMORY[0x1E4FB08E0] systemFontOfSize:17.0 weight:*MEMORY[0x1E4FB09D8]];
  v4 = (void *)MEMORY[0x1E4FB08E0];
  id v5 = [v3 fontDescriptor];
  v6 = [v5 fontDescriptorWithSymbolicTraits:2];
  [v3 pointSize];
  v7 = objc_msgSend(v4, "fontWithDescriptor:size:", v6);

  v8 = [v2 configurationWithFont:v7 scale:2];
  v9 = [a1 systemImageNamed:@"a" withConfiguration:v8];

  return v9;
}

@end