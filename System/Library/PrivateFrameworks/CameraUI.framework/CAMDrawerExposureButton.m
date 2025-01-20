@interface CAMDrawerExposureButton
- (BOOL)isOn;
- (id)imageNameForCurrentState;
- (int64_t)controlType;
- (void)setOn:(BOOL)a3;
@end

@implementation CAMDrawerExposureButton

- (int64_t)controlType
{
  return 8;
}

- (id)imageNameForCurrentState
{
  return @"plusminus.circle";
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