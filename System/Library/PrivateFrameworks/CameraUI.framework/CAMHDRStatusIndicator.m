@interface CAMHDRStatusIndicator
- (BOOL)isAutoHDRAllowed;
- (BOOL)shouldShowSlashForCurrentState;
- (BOOL)shouldUseActiveTintForCurrentState;
- (BOOL)shouldUseSlash;
- (CGSize)intrinsicContentSize;
- (id)imageNameForAXHUD;
- (id)imageNameForCurrentState;
- (int64_t)hdrMode;
- (void)setAllowAutoHDR:(BOOL)a3;
- (void)setAutoHDRAllowed:(BOOL)a3;
- (void)setHDRMode:(int64_t)a3;
- (void)setHDRMode:(int64_t)a3 animated:(BOOL)a4;
- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4;
@end

@implementation CAMHDRStatusIndicator

- (void)setHDRMode:(int64_t)a3
{
}

- (void)setHDRMode:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_hdrMode != a3)
  {
    self->_hdrMode = a3;
    [(CAMControlStatusIndicator *)self updateImageAnimated:a4];
  }
}

- (void)setAllowAutoHDR:(BOOL)a3
{
  if (self->_autoHDRAllowed != a3)
  {
    self->_autoHDRAllowed = a3;
    [(CAMControlStatusIndicator *)self updateImage];
  }
}

- (id)imageNameForCurrentState
{
  return @"CAMHDRIndicatorOn";
}

- (CGSize)intrinsicContentSize
{
  v13.receiver = self;
  v13.super_class = (Class)CAMHDRStatusIndicator;
  [(CAMControlStatusIndicator *)&v13 intrinsicContentSize];
  double v4 = v3;
  v5 = (void *)MEMORY[0x263F827E8];
  v6 = [(CAMHDRStatusIndicator *)self imageNameForCurrentState];
  v7 = CAMCameraUIFrameworkBundle();
  v8 = [v5 imageNamed:v6 inBundle:v7];

  [v8 size];
  double v10 = v9 + 20.0;

  double v11 = v10;
  double v12 = v4;
  result.height = v12;
  result.width = v11;
  return result;
}

- (BOOL)shouldUseActiveTintForCurrentState
{
  if ([(CAMHDRStatusIndicator *)self hdrMode] != 1) {
    return 0;
  }
  return [(CAMHDRStatusIndicator *)self isAutoHDRAllowed];
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)CAMHDRStatusIndicator;
  [(CAMControlStatusIndicator *)&v4 setOrientation:1 animated:0];
}

- (BOOL)shouldUseSlash
{
  return 1;
}

- (BOOL)shouldShowSlashForCurrentState
{
  return [(CAMHDRStatusIndicator *)self hdrMode] == 0;
}

- (id)imageNameForAXHUD
{
  if ((unint64_t)([(CAMHDRStatusIndicator *)self hdrMode] - 1) >= 2) {
    return @"CAMHDRButtonOff-AXHUD";
  }
  else {
    return @"CAMHDRButton-AXHUD";
  }
}

- (int64_t)hdrMode
{
  return self->_hdrMode;
}

- (BOOL)isAutoHDRAllowed
{
  return self->_autoHDRAllowed;
}

- (void)setAutoHDRAllowed:(BOOL)a3
{
  self->_autoHDRAllowed = a3;
}

@end