@interface CAMIntensityStatusIndicator
- (BOOL)isOn;
- (BOOL)shouldUseOutline;
- (id)imageNameForCurrentState;
- (void)setOn:(BOOL)a3;
@end

@implementation CAMIntensityStatusIndicator

- (void)setOn:(BOOL)a3
{
  if (self->_on != a3)
  {
    self->_on = a3;
    [(CAMControlStatusIndicator *)self updateImage];
  }
}

- (BOOL)shouldUseOutline
{
  return 0;
}

- (id)imageNameForCurrentState
{
  return @"camera.lightcontrol";
}

- (BOOL)isOn
{
  return self->_on;
}

@end