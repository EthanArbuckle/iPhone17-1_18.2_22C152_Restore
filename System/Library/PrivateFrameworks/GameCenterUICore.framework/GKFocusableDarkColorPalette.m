@interface GKFocusableDarkColorPalette
- (id)emphasizedTextColor;
- (id)standardTextColor;
- (int64_t)windowBackgroundBlurStyle;
@end

@implementation GKFocusableDarkColorPalette

- (int64_t)windowBackgroundBlurStyle
{
  return 2;
}

- (id)standardTextColor
{
  return (id)[MEMORY[0x263F1C550] colorWithRed:0.57254902 green:0.57254902 blue:0.57254902 alpha:1.0];
}

- (id)emphasizedTextColor
{
  return (id)[MEMORY[0x263F1C550] whiteColor];
}

@end