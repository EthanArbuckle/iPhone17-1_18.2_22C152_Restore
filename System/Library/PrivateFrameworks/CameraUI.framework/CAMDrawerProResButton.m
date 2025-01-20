@interface CAMDrawerProResButton
- (BOOL)isMenuItemSelected:(id)a3;
- (BOOL)shouldShowSlashForCurrentState;
- (BOOL)shouldUseSlash;
- (id)imageNameForAXHUD;
- (id)imageNameForCurrentState;
- (id)loadMenuItems;
- (int64_t)controlType;
- (int64_t)proResVideoMode;
- (void)didSelectMenuItem:(id)a3;
- (void)setProResVideoMode:(int64_t)a3;
- (void)setProResVideoMode:(int64_t)a3 animated:(BOOL)a4;
@end

@implementation CAMDrawerProResButton

- (int64_t)controlType
{
  return 13;
}

- (void)setProResVideoMode:(int64_t)a3
{
}

- (void)setProResVideoMode:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_proResVideoMode != a3)
  {
    self->_proResVideoMode = a3;
    [(CAMControlDrawerButton *)self updateImageAnimated:a4];
    [(CAMControlDrawerMenuButton *)self updateLabelsIfNeeded];
  }
}

- (BOOL)isMenuItemSelected:(id)a3
{
  v4 = [a3 value];
  uint64_t v5 = [v4 integerValue];
  LOBYTE(self) = v5 == [(CAMDrawerProResButton *)self proResVideoMode];

  return (char)self;
}

- (id)loadMenuItems
{
  v2 = [MEMORY[0x263EFF980] arrayWithCapacity:2];
  v3 = [CAMControlDrawerMenuItem alloc];
  v4 = CAMLocalizedFrameworkString(@"PRO_RES_ON", 0);
  uint64_t v5 = CAMLocalizedFrameworkString(@"PRO_RES_PRO_RES_ON", 0);
  v6 = [(CAMControlDrawerMenuItem *)v3 initWithTitle:v4 selectedTitle:v5 value:&unk_26BDDE898];

  [v2 addObject:v6];
  v7 = [CAMControlDrawerMenuItem alloc];
  v8 = CAMLocalizedFrameworkString(@"PRO_RES_OFF", 0);
  v9 = CAMLocalizedFrameworkString(@"PRO_RES_PRO_RES_OFF", 0);
  v10 = [(CAMControlDrawerMenuItem *)v7 initWithTitle:v8 selectedTitle:v9 value:&unk_26BDDE8B0];

  [v2 addObject:v10];
  return v2;
}

- (void)didSelectMenuItem:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CAMDrawerProResButton *)self proResVideoMode];
  v6 = [v4 value];

  uint64_t v7 = [v6 integerValue];
  if (v5 != v7)
  {
    [(CAMDrawerProResButton *)self setProResVideoMode:v7 animated:1];
    [(CAMDrawerProResButton *)self sendActionsForControlEvents:4096];
  }
}

- (id)imageNameForCurrentState
{
  return @"CAMProResDrawerButtonOn";
}

- (BOOL)shouldUseSlash
{
  return 1;
}

- (BOOL)shouldShowSlashForCurrentState
{
  return [(CAMDrawerProResButton *)self proResVideoMode] == 0;
}

- (id)imageNameForAXHUD
{
  if ([(CAMDrawerProResButton *)self shouldShowSlashForCurrentState])
  {
    v3 = @"CAMProResButtonOff-AXHUD";
  }
  else
  {
    v3 = [(CAMDrawerProResButton *)self imageNameForCurrentState];
  }
  return v3;
}

- (int64_t)proResVideoMode
{
  return self->_proResVideoMode;
}

@end