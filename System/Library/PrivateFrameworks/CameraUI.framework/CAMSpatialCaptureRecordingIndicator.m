@interface CAMSpatialCaptureRecordingIndicator
- (CAMSpatialCaptureRecordingIndicator)initWithFrame:(CGRect)a3;
- (UIImageView)_imageView;
- (int64_t)orientation;
- (void)layoutSubviews;
- (void)setOrientation:(int64_t)a3;
- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4;
@end

@implementation CAMSpatialCaptureRecordingIndicator

- (CAMSpatialCaptureRecordingIndicator)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CAMSpatialCaptureRecordingIndicator;
  v3 = -[CAMSpatialCaptureRecordingIndicator initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
    imageView = v3->__imageView;
    v3->__imageView = v4;

    v6 = CAMRedColor();
    [(CAMSpatialCaptureRecordingIndicator *)v3 setBackgroundColor:v6];

    v7 = [MEMORY[0x263F82818] configurationWithScale:1];
    v8 = [MEMORY[0x263F827E8] _systemImageNamed:@"visionpro" withConfiguration:v7];
    [(UIImageView *)v3->__imageView setImage:v8];

    v9 = [MEMORY[0x263F825C8] whiteColor];
    [(UIImageView *)v3->__imageView setTintColor:v9];

    [(CAMSpatialCaptureRecordingIndicator *)v3 addSubview:v3->__imageView];
  }
  return v3;
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)CAMSpatialCaptureRecordingIndicator;
  [(CAMSpatialCaptureRecordingIndicator *)&v15 layoutSubviews];
  [(CAMSpatialCaptureRecordingIndicator *)self bounds];
  double v4 = v3 * 0.5;
  v5 = [(CAMSpatialCaptureRecordingIndicator *)self layer];
  [v5 setCornerRadius:v4];

  [(CAMSpatialCaptureRecordingIndicator *)self bounds];
  UIRectGetCenter();
  v6 = [(CAMSpatialCaptureRecordingIndicator *)self _imageView];
  CAMViewAlignmentSize(v6);
  CEKRectWithSize();
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  UIRectCenteredAboutPointScale();
  UIRectGetCenter();
  objc_msgSend(v6, "setCenter:");
  objc_msgSend(v6, "setBounds:", v8, v10, v12, v14);
}

- (void)setOrientation:(int64_t)a3
{
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_orientation != a3)
  {
    BOOL v4 = a4;
    self->_orientation = a3;
    id v6 = [(CAMSpatialCaptureRecordingIndicator *)self _imageView];
    +[CAMView rotateView:v6 toInterfaceOrientation:[(CAMSpatialCaptureRecordingIndicator *)self orientation] animated:v4];
  }
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (UIImageView)_imageView
{
  return self->__imageView;
}

- (void).cxx_destruct
{
}

@end