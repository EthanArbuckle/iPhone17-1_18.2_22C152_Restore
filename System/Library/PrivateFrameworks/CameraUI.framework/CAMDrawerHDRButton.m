@interface CAMDrawerHDRButton
- (BOOL)allowAutoHDR;
- (BOOL)allowHDROn;
- (BOOL)isMenuItemSelected:(id)a3;
- (BOOL)shouldShowSlashForCurrentState;
- (BOOL)shouldUseActiveTintForCurrentState;
- (BOOL)shouldUseSlash;
- (id)imageNameForAXHUD;
- (id)imageNameForCurrentState;
- (id)loadMenuItems;
- (int64_t)controlType;
- (int64_t)hdrMode;
- (void)didSelectMenuItem:(id)a3;
- (void)setAllowAutoHDR:(BOOL)a3;
- (void)setAllowHDROn:(BOOL)a3;
- (void)setHDRMode:(int64_t)a3;
- (void)setHDRMode:(int64_t)a3 animated:(BOOL)a4;
@end

@implementation CAMDrawerHDRButton

- (int64_t)controlType
{
  return 5;
}

- (void)setAllowAutoHDR:(BOOL)a3
{
  if (self->_allowAutoHDR != a3)
  {
    self->_allowAutoHDR = a3;
    if (!a3 && [(CAMDrawerHDRButton *)self hdrMode] == 2) {
      [(CAMDrawerHDRButton *)self setHDRMode:[(CAMDrawerHDRButton *)self allowHDROn]];
    }
    [(CAMControlDrawerMenuButton *)self setNeedsLoadMenuItems];
  }
}

- (void)setAllowHDROn:(BOOL)a3
{
  if (self->_allowHDROn != a3)
  {
    self->_allowHDROn = a3;
    if (!a3 && [(CAMDrawerHDRButton *)self hdrMode] == 1)
    {
      if ([(CAMDrawerHDRButton *)self allowAutoHDR]) {
        uint64_t v4 = 2;
      }
      else {
        uint64_t v4 = 0;
      }
      [(CAMDrawerHDRButton *)self setHDRMode:v4];
    }
    [(CAMControlDrawerMenuButton *)self setNeedsLoadMenuItems];
  }
}

- (void)setHDRMode:(int64_t)a3
{
}

- (void)setHDRMode:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_hdrMode != a3)
  {
    self->_hdrMode = a3;
    [(CAMControlDrawerButton *)self updateImageAnimated:a4];
    [(CAMControlDrawerMenuButton *)self updateLabelsIfNeeded];
  }
}

- (BOOL)isMenuItemSelected:(id)a3
{
  uint64_t v4 = [a3 value];
  uint64_t v5 = [v4 integerValue];
  LOBYTE(self) = v5 == [(CAMDrawerHDRButton *)self hdrMode];

  return (char)self;
}

- (id)loadMenuItems
{
  v3 = [MEMORY[0x263EFF980] arrayWithCapacity:3];
  if ([(CAMDrawerHDRButton *)self allowAutoHDR])
  {
    uint64_t v4 = [CAMControlDrawerMenuItem alloc];
    uint64_t v5 = CAMLocalizedFrameworkString(@"HDR_AUTO", 0);
    v6 = CAMLocalizedFrameworkString(@"HDR_HDR_AUTO", 0);
    v7 = [(CAMControlDrawerMenuItem *)v4 initWithTitle:v5 selectedTitle:v6 value:&unk_26BDDE880];

    [v3 addObject:v7];
  }
  if ([(CAMDrawerHDRButton *)self allowHDROn])
  {
    v8 = [CAMControlDrawerMenuItem alloc];
    v9 = CAMLocalizedFrameworkString(@"HDR_ON", 0);
    v10 = CAMLocalizedFrameworkString(@"HDR_HDR_ON", 0);
    v11 = [(CAMControlDrawerMenuItem *)v8 initWithTitle:v9 selectedTitle:v10 value:&unk_26BDDE898];

    [v3 addObject:v11];
  }
  v12 = [CAMControlDrawerMenuItem alloc];
  v13 = CAMLocalizedFrameworkString(@"HDR_OFF", 0);
  v14 = CAMLocalizedFrameworkString(@"HDR_HDR_OFF", 0);
  v15 = [(CAMControlDrawerMenuItem *)v12 initWithTitle:v13 selectedTitle:v14 value:&unk_26BDDE8B0];

  [v3 addObject:v15];
  return v3;
}

- (void)didSelectMenuItem:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CAMDrawerHDRButton *)self hdrMode];
  v6 = [v4 value];

  uint64_t v7 = [v6 unsignedIntegerValue];
  if (v7 != v5)
  {
    [(CAMDrawerHDRButton *)self setHDRMode:v7 animated:1];
    [(CAMDrawerHDRButton *)self sendActionsForControlEvents:4096];
  }
}

- (id)imageNameForCurrentState
{
  return @"CAMHDRDrawerButtonOn";
}

- (BOOL)shouldUseSlash
{
  return 1;
}

- (BOOL)shouldShowSlashForCurrentState
{
  return [(CAMDrawerHDRButton *)self hdrMode] == 0;
}

- (BOOL)shouldUseActiveTintForCurrentState
{
  if ([(CAMDrawerHDRButton *)self hdrMode] != 1) {
    return 0;
  }
  return [(CAMDrawerHDRButton *)self allowAutoHDR];
}

- (id)imageNameForAXHUD
{
  if ((unint64_t)([(CAMDrawerHDRButton *)self hdrMode] - 1) >= 2) {
    return @"CAMHDRButtonOff-AXHUD";
  }
  else {
    return @"CAMHDRButton-AXHUD";
  }
}

- (BOOL)allowAutoHDR
{
  return self->_allowAutoHDR;
}

- (BOOL)allowHDROn
{
  return self->_allowHDROn;
}

- (int64_t)hdrMode
{
  return self->_hdrMode;
}

@end