@interface GKColorPalette
+ (id)paletteFromImage:(id)a3;
+ (id)sharedPalette;
- (UIColor)activityIndicatorColor;
- (UIColor)cellActionColor;
- (UIColor)cellActionDestructiveColor;
- (UIColor)challengesTintColor;
- (UIColor)disabledTextColor;
- (UIColor)emphasizedTextColor;
- (UIColor)emphasizedTextOnDarkBackgroundColor;
- (UIColor)floatingHeaderViewBackgroundColor;
- (UIColor)friendRequestTintColor;
- (UIColor)friendTintColor;
- (UIColor)localPlayerTintColor;
- (UIColor)opaqueViewBackgroundColor;
- (UIColor)pinnedHeaderViewBackgroundColor;
- (UIColor)primaryTextColor;
- (UIColor)removeItemTextColor;
- (UIColor)selectedCellBackgroundColor;
- (UIColor)selectedTextColor;
- (UIColor)separatorLineColor;
- (UIColor)standardTextColor;
- (UIColor)systemInteractionColor;
- (UIColor)viewBackgroundColor;
- (UIColor)windowBackgroundColor;
- (int64_t)windowBackgroundBlurStyle;
@end

@implementation GKColorPalette

+ (id)sharedPalette
{
  if (sharedPalette_onceToken != -1) {
    dispatch_once(&sharedPalette_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)sharedPalette_standardColors;
  return v2;
}

uint64_t __31__GKColorPalette_sharedPalette__block_invoke()
{
  if (*MEMORY[0x263F402F8]) {
    v0 = off_264789950;
  }
  else {
    v0 = &off_2647898E8;
  }
  sharedPalette_standardColors = (uint64_t)objc_alloc_init(*v0);
  return MEMORY[0x270F9A758]();
}

+ (id)paletteFromImage:(id)a3
{
  id v3 = a3;
  v4 = [[GKImageColorPalette alloc] initWithImage:v3];

  return v4;
}

- (int64_t)windowBackgroundBlurStyle
{
  return 0;
}

- (UIColor)primaryTextColor
{
  return (UIColor *)[MEMORY[0x263F1C550] labelColor];
}

- (UIColor)standardTextColor
{
  return (UIColor *)[MEMORY[0x263F1C550] secondaryLabelColor];
}

- (UIColor)disabledTextColor
{
  return (UIColor *)[MEMORY[0x263F1C550] tertiaryLabelColor];
}

- (UIColor)selectedTextColor
{
  return (UIColor *)[MEMORY[0x263F1C550] labelColor];
}

- (UIColor)emphasizedTextOnDarkBackgroundColor
{
  return (UIColor *)[MEMORY[0x263F1C550] whiteColor];
}

- (UIColor)emphasizedTextColor
{
  return (UIColor *)[MEMORY[0x263F1C550] labelColor];
}

- (UIColor)systemInteractionColor
{
  return (UIColor *)[MEMORY[0x263F1C550] systemBlueColor];
}

- (UIColor)windowBackgroundColor
{
  return (UIColor *)[MEMORY[0x263F1C550] systemBackgroundColor];
}

- (UIColor)viewBackgroundColor
{
  return 0;
}

- (UIColor)opaqueViewBackgroundColor
{
  return (UIColor *)[MEMORY[0x263F1C550] secondarySystemGroupedBackgroundColor];
}

- (UIColor)floatingHeaderViewBackgroundColor
{
  return 0;
}

- (UIColor)pinnedHeaderViewBackgroundColor
{
  return 0;
}

- (UIColor)activityIndicatorColor
{
  return (UIColor *)[MEMORY[0x263F1C550] secondaryLabelColor];
}

- (UIColor)removeItemTextColor
{
  return (UIColor *)[MEMORY[0x263F1C550] systemRedColor];
}

- (UIColor)selectedCellBackgroundColor
{
  v2 = [MEMORY[0x263F1C550] labelColor];
  id v3 = [v2 colorWithAlphaComponent:0.1];

  return (UIColor *)v3;
}

- (UIColor)separatorLineColor
{
  return (UIColor *)[MEMORY[0x263F1C550] separatorColor];
}

- (UIColor)friendTintColor
{
  return (UIColor *)[MEMORY[0x263F1C550] colorWithHue:0.55 saturation:0.8 brightness:1.0 alpha:0.85];
}

- (UIColor)localPlayerTintColor
{
  return (UIColor *)[MEMORY[0x263F1C550] colorWithHue:0.68 saturation:0.75 brightness:0.78 alpha:1.0];
}

- (UIColor)friendRequestTintColor
{
  return (UIColor *)[MEMORY[0x263F1C550] colorWithHue:0.14 saturation:1.0 brightness:1.0 alpha:0.95];
}

- (UIColor)challengesTintColor
{
  return (UIColor *)[MEMORY[0x263F1C550] colorWithRed:0.5 green:0.0 blue:0.8 alpha:1.0];
}

- (UIColor)cellActionDestructiveColor
{
  return (UIColor *)[MEMORY[0x263F1C550] systemRedColor];
}

- (UIColor)cellActionColor
{
  return (UIColor *)[MEMORY[0x263F1C550] secondaryLabelColor];
}

@end