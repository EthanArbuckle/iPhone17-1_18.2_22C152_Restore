@interface CAMLowLightStatusIndicator
- (BOOL)canShowValue;
- (BOOL)isLowLightDisabled;
- (BOOL)shouldShowOutlineForCurrentState;
- (BOOL)shouldUseActiveTintForCurrentState;
- (BOOL)shouldUseSlash;
- (double)duration;
- (id)accessibilityIdentifier;
- (id)imageNameForAXHUD;
- (id)imageNameForCurrentState;
- (id)valueText;
- (int64_t)lowLightMode;
- (void)setDuration:(double)a3;
- (void)setLowLightDisabled:(BOOL)a3;
- (void)setLowLightDisabled:(BOOL)a3 animated:(BOOL)a4;
- (void)setLowLightMode:(int64_t)a3;
@end

@implementation CAMLowLightStatusIndicator

- (void)setDuration:(double)a3
{
  if (self->_duration != a3)
  {
    self->_duration = a3;
    [(CAMControlStatusIndicator *)self setNeedsUpdateValueText];
  }
}

- (void)setLowLightMode:(int64_t)a3
{
  if (self->_lowLightMode != a3)
  {
    self->_lowLightMode = a3;
    [(CAMControlStatusIndicator *)self updateImage];
  }
}

- (void)setLowLightDisabled:(BOOL)a3
{
}

- (void)setLowLightDisabled:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_lowLightDisabled != a3)
  {
    self->_lowLightDisabled = a3;
    [(CAMControlStatusIndicator *)self updateImageAnimated:a4];
  }
}

- (BOOL)shouldUseActiveTintForCurrentState
{
  return (unint64_t)([(CAMLowLightStatusIndicator *)self lowLightMode] - 1) < 2;
}

- (BOOL)shouldShowOutlineForCurrentState
{
  return 1;
}

- (id)imageNameForCurrentState
{
  return @"camera.nightmode";
}

- (BOOL)canShowValue
{
  return 1;
}

- (BOOL)shouldUseSlash
{
  return 1;
}

- (id)valueText
{
  v3 = [(id)objc_opt_class() integerFormatter];
  [(CAMLowLightStatusIndicator *)self duration];
  v5 = objc_msgSend(NSNumber, "numberWithDouble:", fmax(round(v4), 1.0));
  v6 = [v3 stringFromNumber:v5];

  v7 = CAMLocalizedFrameworkString(@"LOW_LIGHT_DURATION_TEXT", 0);
  v8 = [NSString stringWithValidatedFormat:v7, @"%@", 0, v6 validFormatSpecifiers error];

  return v8;
}

- (id)accessibilityIdentifier
{
  return @"StatusBarLowLightButton";
}

- (id)imageNameForAXHUD
{
  if ([(CAMLowLightStatusIndicator *)self shouldShowSlashForCurrentState])
  {
    v3 = @"camera.nightmode.slash";
  }
  else
  {
    v3 = [(CAMLowLightStatusIndicator *)self imageNameForCurrentState];
  }
  return v3;
}

- (double)duration
{
  return self->_duration;
}

- (int64_t)lowLightMode
{
  return self->_lowLightMode;
}

- (BOOL)isLowLightDisabled
{
  return self->_lowLightDisabled;
}

@end