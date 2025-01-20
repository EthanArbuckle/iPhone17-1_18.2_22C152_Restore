@interface CAMSpatialCaptureButton
- (BOOL)active;
- (BOOL)shouldShowSlashForCurrentState;
- (CAMSpatialCaptureButton)initWithFrame:(CGRect)a3;
- (id)imageNameForCurrentState;
- (void)setActive:(BOOL)a3;
- (void)setActive:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation CAMSpatialCaptureButton

- (CAMSpatialCaptureButton)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMSpatialCaptureButton;
  v3 = -[CAMCircleButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_active = 0;
    [(CAMCircleButton *)v3 updateTintColors];
    [(CAMCircleButton *)v4 updateSlashAnimated:0];
    [(CAMSpatialCaptureButton *)v4 setAccessibilityIdentifier:@"SpatialCaptureButton"];
  }
  return v4;
}

- (id)imageNameForCurrentState
{
  return @"visionpro";
}

- (void)setActive:(BOOL)a3
{
}

- (void)setActive:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_active != a3)
  {
    BOOL v4 = a4;
    self->_active = a3;
    [(CAMCircleButton *)self updateTintColors];
    [(CAMCircleButton *)self updateSlashAnimated:v4];
  }
}

- (BOOL)shouldShowSlashForCurrentState
{
  return ![(CAMSpatialCaptureButton *)self active];
}

- (BOOL)active
{
  return self->_active;
}

@end