@interface CAMDrawerIntensityButton
- (BOOL)isOn;
- (id)imageNameForCurrentState;
- (int64_t)controlType;
- (void)setOn:(BOOL)a3;
@end

@implementation CAMDrawerIntensityButton

- (int64_t)controlType
{
  return 7;
}

- (id)imageNameForCurrentState
{
  return @"camera.lightcontrol";
}

- (void)setOn:(BOOL)a3
{
  if (self->_on != a3)
  {
    self->_on = a3;
    [(CAMControlDrawerButton *)self updateImage];
  }
}

- (BOOL)isOn
{
  return self->_on;
}

@end