@interface CAMDrawerFlashButton
- (BOOL)isExpandable;
- (BOOL)isFlashUnavailable;
- (BOOL)isMenuItemSelected:(id)a3;
- (BOOL)shouldShowSlashForCurrentState;
- (BOOL)shouldUseActiveTintForCurrentState;
- (BOOL)shouldUseSlash;
- (id)imageNameForAXHUD;
- (id)imageNameForCurrentState;
- (id)imageSymbolColorConfiguration;
- (id)loadMenuItems;
- (int64_t)controlType;
- (int64_t)flashMode;
- (void)didSelectMenuItem:(id)a3;
- (void)setFlashMode:(int64_t)a3;
- (void)setFlashMode:(int64_t)a3 animated:(BOOL)a4;
- (void)setFlashUnavailable:(BOOL)a3;
@end

@implementation CAMDrawerFlashButton

- (int64_t)controlType
{
  return 0;
}

- (void)setFlashMode:(int64_t)a3
{
}

- (void)setFlashMode:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_flashMode != a3)
  {
    self->_flashMode = a3;
    [(CAMControlDrawerButton *)self updateImageAnimated:a4];
    [(CAMControlDrawerMenuButton *)self updateLabelsIfNeeded];
  }
}

- (BOOL)isMenuItemSelected:(id)a3
{
  v4 = [a3 value];
  uint64_t v5 = [v4 integerValue];
  LOBYTE(self) = v5 == [(CAMDrawerFlashButton *)self flashMode];

  return (char)self;
}

- (void)setFlashUnavailable:(BOOL)a3
{
  if (self->_flashUnavailable != a3)
  {
    self->_flashUnavailable = a3;
    [(CAMControlDrawerButton *)self updateImage];
  }
}

- (id)loadMenuItems
{
  v16[3] = *MEMORY[0x263EF8340];
  v2 = [CAMControlDrawerMenuItem alloc];
  v3 = CAMLocalizedFrameworkString(@"FLASH_AUTO", 0);
  v4 = CAMLocalizedFrameworkString(@"FLASH_FLASH_AUTO", 0);
  uint64_t v5 = [(CAMControlDrawerMenuItem *)v2 initWithTitle:v3 selectedTitle:v4 value:&unk_26BDDE880];

  v6 = [CAMControlDrawerMenuItem alloc];
  v7 = CAMLocalizedFrameworkString(@"FLASH_ON", 0);
  v8 = CAMLocalizedFrameworkString(@"FLASH_FLASH_ON", 0);
  v9 = [(CAMControlDrawerMenuItem *)v6 initWithTitle:v7 selectedTitle:v8 value:&unk_26BDDE898];

  v10 = [CAMControlDrawerMenuItem alloc];
  v11 = CAMLocalizedFrameworkString(@"FLASH_OFF", 0);
  v12 = CAMLocalizedFrameworkString(@"FLASH_FLASH_OFF", 0);
  v13 = [(CAMControlDrawerMenuItem *)v10 initWithTitle:v11 selectedTitle:v12 value:&unk_26BDDE8B0];

  v16[0] = v5;
  v16[1] = v9;
  v16[2] = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:3];

  return v14;
}

- (void)didSelectMenuItem:(id)a3
{
  id v7 = a3;
  if (![(CAMDrawerFlashButton *)self isFlashUnavailable])
  {
    int64_t v4 = [(CAMDrawerFlashButton *)self flashMode];
    uint64_t v5 = [v7 value];
    uint64_t v6 = [v5 integerValue];

    if (v6 != v4)
    {
      [(CAMDrawerFlashButton *)self setFlashMode:v6 animated:1];
      [(CAMDrawerFlashButton *)self sendActionsForControlEvents:4096];
    }
  }
}

- (id)imageNameForCurrentState
{
  if ([(CAMDrawerFlashButton *)self isFlashUnavailable]) {
    v2 = @"bolt.trianglebadge.exclamationmark.fill";
  }
  else {
    v2 = @"bolt.fill";
  }
  return v2;
}

- (id)imageNameForAXHUD
{
  if ([(CAMDrawerFlashButton *)self shouldShowSlashForCurrentState])
  {
    v3 = @"bolt.slash.fill";
  }
  else
  {
    v3 = [(CAMDrawerFlashButton *)self imageNameForCurrentState];
  }
  return v3;
}

- (BOOL)shouldUseActiveTintForCurrentState
{
  return [(CAMDrawerFlashButton *)self flashMode] == 1;
}

- (id)imageSymbolColorConfiguration
{
  v8[2] = *MEMORY[0x263EF8340];
  if ([(CAMDrawerFlashButton *)self isFlashUnavailable])
  {
    v2 = (void *)MEMORY[0x263F82818];
    v3 = [MEMORY[0x263F825C8] systemYellowColor];
    v8[0] = v3;
    int64_t v4 = [MEMORY[0x263F825C8] colorWithWhite:0.5 alpha:1.0];
    v8[1] = v4;
    uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];
    uint64_t v6 = [v2 configurationWithPaletteColors:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

- (BOOL)isExpandable
{
  return ![(CAMDrawerFlashButton *)self isFlashUnavailable];
}

- (BOOL)shouldUseSlash
{
  return 1;
}

- (BOOL)shouldShowSlashForCurrentState
{
  if ([(CAMDrawerFlashButton *)self flashMode]) {
    return 0;
  }
  else {
    return ![(CAMDrawerFlashButton *)self isFlashUnavailable];
  }
}

- (BOOL)isFlashUnavailable
{
  return self->_flashUnavailable;
}

- (int64_t)flashMode
{
  return self->_flashMode;
}

@end