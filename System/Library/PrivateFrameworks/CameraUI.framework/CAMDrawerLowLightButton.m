@interface CAMDrawerLowLightButton
- (BOOL)adjustsImageWhenDisabled;
- (BOOL)isDisabled;
- (BOOL)isOn;
- (BOOL)shouldUseSlash;
- (id)imageNameForAXHUD;
- (id)imageNameForCurrentState;
- (int64_t)controlType;
- (void)setDisabled:(BOOL)a3;
- (void)setDisabled:(BOOL)a3 animated:(BOOL)a4;
- (void)setOn:(BOOL)a3;
@end

@implementation CAMDrawerLowLightButton

- (int64_t)controlType
{
  return 9;
}

- (id)imageNameForCurrentState
{
  return @"camera.nightmode";
}

- (void)setDisabled:(BOOL)a3
{
}

- (void)setDisabled:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_disabled != a3)
  {
    self->_disabled = a3;
    [(CAMControlDrawerButton *)self updateImageAnimated:a4];
  }
}

- (BOOL)shouldUseSlash
{
  return 1;
}

- (void)setOn:(BOOL)a3
{
  if (self->_on != a3)
  {
    self->_on = a3;
    [(CAMControlDrawerButton *)self updateImage];
  }
}

- (BOOL)adjustsImageWhenDisabled
{
  return 0;
}

- (id)imageNameForAXHUD
{
  if ([(CAMDrawerLowLightButton *)self shouldShowSlashForCurrentState])
  {
    v3 = @"camera.nightmode.slash";
  }
  else
  {
    v3 = [(CAMDrawerLowLightButton *)self imageNameForCurrentState];
  }
  return v3;
}

- (BOOL)isOn
{
  return self->_on;
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

@end