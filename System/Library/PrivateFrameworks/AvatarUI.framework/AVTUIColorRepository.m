@interface AVTUIColorRepository
+ (id)actionButtonBackgroundColor;
+ (id)actionButtonDestructiveTextColor;
+ (id)actionButtonTextColor;
+ (id)appBackgroundColor;
+ (id)attributeTitleTextColor;
+ (id)attributeValueCellSelectedStrokeColor;
+ (id)dynamicColorWithLightColor:(id)a3 darkColor:(id)a4;
+ (id)editorBackgroundColor;
+ (id)groupDialCellSelectedTextColor;
+ (id)groupDialCellShimmeringTextColor;
+ (id)groupDialCellTextColor;
+ (id)groupListBackgroundColor;
+ (id)groupSidePickerCellSelectedBackgroundColor;
+ (id)modalBackgroundColor;
+ (id)paddleViewBackgroundColor;
+ (id)placeholderBackgroundColor;
+ (id)separatorColor;
+ (id)simplePickerSelectedBackground;
+ (id)splashScreenButtonBackgroundColor;
+ (id)splashScreenButtonHighlightedTextColor;
+ (id)splashScreenButtonNormalTextColor;
+ (id)stickerPlaceholderBackgroundColor;
+ (id)trapOverlayBackgroundColor;
+ (id)userInfoLabelColor;
@end

@implementation AVTUIColorRepository

+ (id)appBackgroundColor
{
  v3 = [MEMORY[0x263F1C550] systemBackgroundColor];
  v4 = [MEMORY[0x263F1C550] secondarySystemBackgroundColor];
  v5 = [a1 dynamicColorWithLightColor:v3 darkColor:v4];

  return v5;
}

+ (id)modalBackgroundColor
{
  return (id)[MEMORY[0x263F1C550] systemBackgroundColor];
}

+ (id)trapOverlayBackgroundColor
{
  v3 = [MEMORY[0x263F1C550] systemBackgroundColor];
  v4 = [MEMORY[0x263F1C550] tertiarySystemBackgroundColor];
  v5 = [a1 dynamicColorWithLightColor:v3 darkColor:v4];

  return v5;
}

+ (id)dynamicColorWithLightColor:(id)a3 darkColor:(id)a4
{
  v15[3] = *MEMORY[0x263EF8340];
  v5 = (void *)MEMORY[0x263F1CB00];
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 traitCollectionWithUserInterfaceStyle:1];
  v14[0] = v8;
  v15[0] = v7;
  v9 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:2];
  v14[1] = v9;
  v15[1] = v6;
  v10 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:0];
  v14[2] = v10;
  v15[2] = v7;
  v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];

  v12 = [MEMORY[0x263F1C550] _dynamicColorWithColorsByTraitCollection:v11];

  return v12;
}

+ (id)editorBackgroundColor
{
  return (id)[MEMORY[0x263F1C550] systemBackgroundColor];
}

+ (id)groupListBackgroundColor
{
  return (id)[MEMORY[0x263F1C550] systemBackgroundColor];
}

+ (id)groupDialCellTextColor
{
  return (id)[MEMORY[0x263F1C550] colorWithWhite:0.635 alpha:1.0];
}

+ (id)groupDialCellSelectedTextColor
{
  return (id)[MEMORY[0x263F1C550] systemBlueColor];
}

+ (id)groupDialCellShimmeringTextColor
{
  return (id)[MEMORY[0x263F1C550] systemBlueColor];
}

+ (id)groupSidePickerCellSelectedBackgroundColor
{
  v3 = [MEMORY[0x263F1C550] blackColor];
  v4 = [MEMORY[0x263F1C550] whiteColor];
  v5 = [a1 dynamicColorWithLightColor:v3 darkColor:v4];
  id v6 = [v5 colorWithAlphaComponent:0.1];

  return v6;
}

+ (id)userInfoLabelColor
{
  return (id)[MEMORY[0x263F1C550] secondaryLabelColor];
}

+ (id)attributeValueCellSelectedStrokeColor
{
  return (id)[MEMORY[0x263F1C550] tertiaryLabelColor];
}

+ (id)attributeTitleTextColor
{
  return (id)[MEMORY[0x263F1C550] colorWithDisplayP3Red:0.22 green:0.22 blue:0.22 alpha:1.0];
}

+ (id)actionButtonBackgroundColor
{
  return (id)[MEMORY[0x263F1C550] secondarySystemBackgroundColor];
}

+ (id)actionButtonTextColor
{
  return (id)[MEMORY[0x263F1C550] tableCellBlueTextColor];
}

+ (id)actionButtonDestructiveTextColor
{
  return (id)[MEMORY[0x263F1C550] systemRedColor];
}

+ (id)separatorColor
{
  return (id)[MEMORY[0x263F1C550] opaqueSeparatorColor];
}

+ (id)splashScreenButtonBackgroundColor
{
  return (id)[MEMORY[0x263F1C550] systemBlueColor];
}

+ (id)splashScreenButtonNormalTextColor
{
  return (id)[MEMORY[0x263F1C550] whiteColor];
}

+ (id)splashScreenButtonHighlightedTextColor
{
  return (id)[MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.25];
}

+ (id)simplePickerSelectedBackground
{
  return (id)[MEMORY[0x263F1C550] tertiarySystemFillColor];
}

+ (id)stickerPlaceholderBackgroundColor
{
  return (id)[MEMORY[0x263F1C550] quaternarySystemFillColor];
}

+ (id)placeholderBackgroundColor
{
  return (id)[MEMORY[0x263F1C550] quaternarySystemFillColor];
}

+ (id)paddleViewBackgroundColor
{
  v3 = [MEMORY[0x263F1C550] systemBackgroundColor];
  v4 = [MEMORY[0x263F1C550] tertiarySystemBackgroundColor];
  v5 = [a1 dynamicColorWithLightColor:v3 darkColor:v4];

  return v5;
}

@end