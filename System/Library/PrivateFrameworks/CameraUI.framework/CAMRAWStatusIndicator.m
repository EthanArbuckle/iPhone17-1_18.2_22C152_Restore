@interface CAMRAWStatusIndicator
- (BOOL)shouldShowSlashForCurrentState;
- (BOOL)shouldUseSlash;
- (CGSize)intrinsicContentSize;
- (id)imageNameForAXHUD;
- (id)imageNameForCurrentState;
- (int64_t)rawMode;
- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4;
- (void)setRAWMode:(int64_t)a3;
- (void)setRAWMode:(int64_t)a3 animated:(BOOL)a4;
@end

@implementation CAMRAWStatusIndicator

- (void)setRAWMode:(int64_t)a3
{
}

- (void)setRAWMode:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_rawMode != a3)
  {
    self->_rawMode = a3;
    [(CAMControlStatusIndicator *)self updateImageAnimated:a4];
  }
}

- (BOOL)shouldUseSlash
{
  return 1;
}

- (BOOL)shouldShowSlashForCurrentState
{
  return [(CAMRAWStatusIndicator *)self rawMode] == 0;
}

- (id)imageNameForCurrentState
{
  return @"CAMRAWIndicatorOn";
}

- (CGSize)intrinsicContentSize
{
  v13.receiver = self;
  v13.super_class = (Class)CAMRAWStatusIndicator;
  [(CAMControlStatusIndicator *)&v13 intrinsicContentSize];
  double v4 = v3;
  v5 = (void *)MEMORY[0x263F827E8];
  v6 = [(CAMRAWStatusIndicator *)self imageNameForCurrentState];
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

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)CAMRAWStatusIndicator;
  [(CAMControlStatusIndicator *)&v4 setOrientation:1 animated:0];
}

- (id)imageNameForAXHUD
{
  if ([(CAMRAWStatusIndicator *)self rawMode] == 1) {
    return @"CAMRAWIndicatorOn";
  }
  else {
    return @"CAMRAWButtonOff-AXHUD";
  }
}

- (int64_t)rawMode
{
  return self->_rawMode;
}

@end