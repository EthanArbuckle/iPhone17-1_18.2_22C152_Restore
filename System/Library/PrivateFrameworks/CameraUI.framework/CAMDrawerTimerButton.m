@interface CAMDrawerTimerButton
- (BOOL)isMenuItemSelected:(id)a3;
- (BOOL)shouldUseActiveTintForCurrentState;
- (id)imageNameForCurrentState;
- (id)loadMenuItems;
- (int64_t)controlType;
- (int64_t)timerDuration;
- (void)didSelectMenuItem:(id)a3;
- (void)setTimerDuration:(int64_t)a3;
@end

@implementation CAMDrawerTimerButton

- (int64_t)controlType
{
  return 3;
}

- (void)setTimerDuration:(int64_t)a3
{
  if (self->_timerDuration != a3)
  {
    self->_timerDuration = a3;
    [(CAMControlDrawerButton *)self updateImage];
    [(CAMControlDrawerMenuButton *)self updateLabelsIfNeeded];
  }
}

- (BOOL)isMenuItemSelected:(id)a3
{
  v4 = [a3 value];
  uint64_t v5 = [v4 integerValue];
  LOBYTE(self) = v5 == [(CAMDrawerTimerButton *)self timerDuration];

  return (char)self;
}

- (id)loadMenuItems
{
  v24[4] = *MEMORY[0x263EF8340];
  v2 = CAMTimerDurationFormatter();
  v23 = CAMLocalizedFrameworkString(@"TIMER_OFF_TEXT", 0);
  v22 = CAMLocalizedFrameworkString(@"TIMER_TIMER_OFF_TEXT", 0);
  v3 = CAMLocalizedFrameworkString(@"TIMER_DURATION_TEXT", 0);
  v4 = NSString;
  uint64_t v5 = [NSNumber numberWithDouble:3.0];
  v6 = [v2 stringFromNumber:v5];
  v21 = [v4 stringWithValidatedFormat:v3, @"%@", 0, v6 validFormatSpecifiers error];

  v7 = NSString;
  v8 = [NSNumber numberWithDouble:5.0];
  v9 = [v2 stringFromNumber:v8];
  v20 = [v7 stringWithValidatedFormat:v3, @"%@", 0, v9 validFormatSpecifiers error];

  v10 = NSString;
  v11 = [NSNumber numberWithDouble:10.0];
  v12 = [v2 stringFromNumber:v11];
  v13 = [v10 stringWithValidatedFormat:v3, @"%@", 0, v12 validFormatSpecifiers error];

  v14 = [[CAMControlDrawerMenuItem alloc] initWithTitle:v23 selectedTitle:v22 value:&unk_26BDDE8B0];
  v15 = [[CAMControlDrawerMenuItem alloc] initWithTitle:v21 value:&unk_26BDDE898];
  v16 = [[CAMControlDrawerMenuItem alloc] initWithTitle:v20 value:&unk_26BDDE880];
  v17 = [[CAMControlDrawerMenuItem alloc] initWithTitle:v13 value:&unk_26BDDE8C8];
  v24[0] = v14;
  v24[1] = v15;
  v24[2] = v16;
  v24[3] = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:4];

  return v18;
}

- (void)didSelectMenuItem:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CAMDrawerTimerButton *)self timerDuration];
  v6 = [v4 value];

  uint64_t v7 = [v6 integerValue];
  if (v7 != v5)
  {
    [(CAMDrawerTimerButton *)self setTimerDuration:v7];
    [(CAMDrawerTimerButton *)self sendActionsForControlEvents:4096];
  }
}

- (id)imageNameForCurrentState
{
  return @"timer";
}

- (BOOL)shouldUseActiveTintForCurrentState
{
  return (unint64_t)([(CAMDrawerTimerButton *)self timerDuration] - 1) < 3;
}

- (int64_t)timerDuration
{
  return self->_timerDuration;
}

@end