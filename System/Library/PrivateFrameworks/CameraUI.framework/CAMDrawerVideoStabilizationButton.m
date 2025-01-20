@interface CAMDrawerVideoStabilizationButton
- (BOOL)isMenuItemSelected:(id)a3;
- (BOOL)shouldShowSlashForCurrentState;
- (BOOL)shouldUseActiveTintForCurrentState;
- (BOOL)shouldUseSlash;
- (id)imageNameForCurrentState;
- (id)loadMenuItems;
- (int64_t)controlType;
- (int64_t)videoStabilizationMode;
- (void)didSelectMenuItem:(id)a3;
- (void)setVideoStabilizationMode:(int64_t)a3;
- (void)setVideoStabilizationMode:(int64_t)a3 animated:(BOOL)a4;
@end

@implementation CAMDrawerVideoStabilizationButton

- (int64_t)controlType
{
  return 15;
}

- (void)setVideoStabilizationMode:(int64_t)a3
{
}

- (void)setVideoStabilizationMode:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_videoStabilizationMode != a3)
  {
    self->_videoStabilizationMode = a3;
    [(CAMControlDrawerButton *)self updateImageAnimated:a4];
    [(CAMControlDrawerMenuButton *)self updateLabelsIfNeeded];
  }
}

- (BOOL)isMenuItemSelected:(id)a3
{
  v4 = [a3 value];
  uint64_t v5 = [v4 integerValue];
  LOBYTE(self) = v5 == [(CAMDrawerVideoStabilizationButton *)self videoStabilizationMode];

  return (char)self;
}

- (id)loadMenuItems
{
  v12[2] = *MEMORY[0x263EF8340];
  v2 = [CAMControlDrawerMenuItem alloc];
  v3 = CAMLocalizedFrameworkString(@"ACTION_ON", 0);
  v4 = CAMLocalizedFrameworkString(@"ACTION_ACTION_ON", 0);
  uint64_t v5 = [(CAMControlDrawerMenuItem *)v2 initWithTitle:v3 selectedTitle:v4 value:&unk_26BDDE898];

  v6 = [CAMControlDrawerMenuItem alloc];
  v7 = CAMLocalizedFrameworkString(@"ACTION_OFF", 0);
  v8 = CAMLocalizedFrameworkString(@"ACTION_ACTION_OFF", 0);
  v9 = [(CAMControlDrawerMenuItem *)v6 initWithTitle:v7 selectedTitle:v8 value:&unk_26BDDE8B0];

  v12[0] = v5;
  v12[1] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];

  return v10;
}

- (void)didSelectMenuItem:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CAMDrawerVideoStabilizationButton *)self videoStabilizationMode];
  v6 = [v4 value];

  uint64_t v7 = [v6 integerValue];
  if (v5 != v7)
  {
    [(CAMDrawerVideoStabilizationButton *)self setVideoStabilizationMode:v7 animated:1];
    [(CAMDrawerVideoStabilizationButton *)self sendActionsForControlEvents:4096];
  }
}

- (BOOL)shouldUseSlash
{
  return 1;
}

- (BOOL)shouldShowSlashForCurrentState
{
  return [(CAMDrawerVideoStabilizationButton *)self videoStabilizationMode] == 0;
}

- (BOOL)shouldUseActiveTintForCurrentState
{
  return [(CAMDrawerVideoStabilizationButton *)self videoStabilizationMode] != 0;
}

- (id)imageNameForCurrentState
{
  return @"figure.run.motion";
}

- (int64_t)videoStabilizationMode
{
  return self->_videoStabilizationMode;
}

@end