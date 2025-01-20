@interface GKInGameColorPalette
- (id)floatingHeaderViewBackgroundColor;
- (id)monogramBackgroundColor;
- (id)textOnDarkBackgroundColor;
- (id)viewBackgroundColor;
- (id)windowBackgroundColor;
@end

@implementation GKInGameColorPalette

- (id)windowBackgroundColor
{
  return 0;
}

- (id)textOnDarkBackgroundColor
{
  return (id)[MEMORY[0x263F1C550] whiteColor];
}

- (id)viewBackgroundColor
{
  return (id)[MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.0];
}

- (id)floatingHeaderViewBackgroundColor
{
  return (id)[MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.0];
}

- (id)monogramBackgroundColor
{
  return (id)[MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.3];
}

@end