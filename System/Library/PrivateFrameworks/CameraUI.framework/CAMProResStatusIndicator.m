@interface CAMProResStatusIndicator
- (BOOL)shouldShowSlashForCurrentState;
- (BOOL)shouldUseOutline;
- (BOOL)shouldUseSlash;
- (CGSize)intrinsicContentSize;
- (id)_imageNameForProResVideoModeOff;
- (id)_imageNameForProResVideoModeOn;
- (id)imageNameForAXHUD;
- (int64_t)colorSpace;
- (int64_t)proResVideoMode;
- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4;
- (void)setProResVideoMode:(int64_t)a3 colorSpace:(int64_t)a4 animated:(BOOL)a5;
@end

@implementation CAMProResStatusIndicator

- (void)setProResVideoMode:(int64_t)a3 colorSpace:(int64_t)a4 animated:(BOOL)a5
{
  if (self->_proResVideoMode != a3 || self->_colorSpace != a4)
  {
    self->_proResVideoMode = a3;
    self->_colorSpace = a4;
    [(CAMControlStatusIndicator *)self updateImageAnimated:a5];
  }
}

- (BOOL)shouldUseSlash
{
  return 1;
}

- (BOOL)shouldUseOutline
{
  return 0;
}

- (BOOL)shouldShowSlashForCurrentState
{
  return [(CAMProResStatusIndicator *)self proResVideoMode] == 0;
}

- (CGSize)intrinsicContentSize
{
  v13.receiver = self;
  v13.super_class = (Class)CAMProResStatusIndicator;
  [(CAMControlStatusIndicator *)&v13 intrinsicContentSize];
  double v4 = v3;
  v5 = (void *)MEMORY[0x263F827E8];
  v6 = [(CAMProResStatusIndicator *)self imageNameForCurrentState];
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
  v4.super_class = (Class)CAMProResStatusIndicator;
  [(CAMControlStatusIndicator *)&v4 setOrientation:1 animated:0];
}

- (id)imageNameForAXHUD
{
  double v3 = [(CAMProResStatusIndicator *)self proResVideoMode];
  if (v3 == (void *)1)
  {
    double v3 = [(CAMProResStatusIndicator *)self _imageNameForProResVideoModeOn];
  }
  else if (!v3)
  {
    double v3 = [(CAMProResStatusIndicator *)self _imageNameForProResVideoModeOff];
  }
  return v3;
}

- (id)_imageNameForProResVideoModeOn
{
  int64_t v2 = [(CAMProResStatusIndicator *)self colorSpace];
  double v3 = @"CAMProResSDRIndicator";
  if (v2 == 2) {
    double v3 = @"CAMProResHDRIndicator";
  }
  if (v2 == 3) {
    return @"CAMProResLOGIndicator";
  }
  else {
    return v3;
  }
}

- (id)_imageNameForProResVideoModeOff
{
  int64_t v2 = [(CAMProResStatusIndicator *)self colorSpace];
  double v3 = @"CAMProResSDROff-AXHUD";
  if (v2 == 2) {
    double v3 = @"CAMProResHDROff-AXHUD";
  }
  if (v2 == 3) {
    return @"CAMProResLOGOff-AXHUD";
  }
  else {
    return v3;
  }
}

- (int64_t)proResVideoMode
{
  return self->_proResVideoMode;
}

- (int64_t)colorSpace
{
  return self->_colorSpace;
}

@end