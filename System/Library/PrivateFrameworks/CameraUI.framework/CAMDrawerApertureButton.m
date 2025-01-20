@interface CAMDrawerApertureButton
- (BOOL)isOn;
- (id)imageNameForCurrentState;
- (int64_t)controlType;
- (void)setOn:(BOOL)a3;
@end

@implementation CAMDrawerApertureButton

- (int64_t)controlType
{
  return 6;
}

- (id)imageNameForCurrentState
{
  return @"f.cursive";
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