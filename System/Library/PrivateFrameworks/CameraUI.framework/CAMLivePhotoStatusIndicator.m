@interface CAMLivePhotoStatusIndicator
- (BOOL)shouldShowSlashForCurrentState;
- (BOOL)shouldUseActiveTintForCurrentState;
- (BOOL)shouldUseOutline;
- (BOOL)shouldUseSlash;
- (CAMLivePhotoBloomView)_bloomView;
- (CAMLivePhotoStatusIndicator)initWithFrame:(CGRect)a3;
- (CGSize)intrinsicContentSize;
- (id)imageNameForAXHUD;
- (id)imageNameForCurrentState;
- (int64_t)livePhotoMode;
- (void)_updateTintColor;
- (void)layoutSubviews;
- (void)setLivePhotoMode:(int64_t)a3;
- (void)setLivePhotoMode:(int64_t)a3 animated:(BOOL)a4;
- (void)startAnimating;
- (void)stopAnimating;
@end

@implementation CAMLivePhotoStatusIndicator

- (CAMLivePhotoStatusIndicator)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMLivePhotoStatusIndicator;
  v3 = -[CAMControlStatusIndicator initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(CAMLivePhotoBloomView);
    bloomView = v3->__bloomView;
    v3->__bloomView = v4;

    v6 = [(CAMControlStatusIndicator *)v3 slashContainerView];
    [v6 addSubview:v3->__bloomView];

    [(CAMLivePhotoStatusIndicator *)v3 _updateTintColor];
    [(CAMLivePhotoStatusIndicator *)v3 setAccessibilityIdentifier:@"StatusBarLivePhotoButton"];
  }
  return v3;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)CAMLivePhotoStatusIndicator;
  [(CAMControlStatusIndicator *)&v4 layoutSubviews];
  v3 = [(CAMLivePhotoStatusIndicator *)self _bloomView];
  [v3 intrinsicContentSize];
  [(CAMLivePhotoStatusIndicator *)self bounds];
  UIRectGetCenter();
  UIRectCenteredAboutPointScale();
  objc_msgSend(v3, "setFrame:");
}

- (void)setLivePhotoMode:(int64_t)a3
{
}

- (void)setLivePhotoMode:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_livePhotoMode != a3)
  {
    BOOL v4 = a4;
    self->_livePhotoMode = a3;
    [(CAMLivePhotoStatusIndicator *)self _updateTintColor];
    [(CAMLivePhotoStatusIndicator *)self stopAnimating];
    [(CAMControlStatusIndicator *)self updateImageAnimated:v4];
  }
}

- (void)startAnimating
{
  id v2 = [(CAMLivePhotoStatusIndicator *)self _bloomView];
  [v2 animateBloom];
}

- (void)stopAnimating
{
  id v2 = [(CAMLivePhotoStatusIndicator *)self _bloomView];
  [v2 stopAnimating];
}

- (id)imageNameForCurrentState
{
  return 0;
}

- (CGSize)intrinsicContentSize
{
  double v2 = 25.0 - CAMPixelWidthForView(self);
  double v3 = v2;
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)shouldUseActiveTintForCurrentState
{
  return [(CAMLivePhotoStatusIndicator *)self livePhotoMode] == 1;
}

- (BOOL)shouldUseOutline
{
  return 0;
}

- (BOOL)shouldUseSlash
{
  return 1;
}

- (BOOL)shouldShowSlashForCurrentState
{
  return [(CAMLivePhotoStatusIndicator *)self livePhotoMode] == 0;
}

- (id)imageNameForAXHUD
{
  if ([(CAMLivePhotoStatusIndicator *)self shouldShowSlashForCurrentState]) {
    double v2 = @"livephoto.slash";
  }
  else {
    double v2 = @"livephoto";
  }
  return v2;
}

- (void)_updateTintColor
{
  if ([(CAMLivePhotoStatusIndicator *)self shouldUseActiveTintForCurrentState]) {
    [MEMORY[0x263F825C8] systemYellowColor];
  }
  else {
  id v3 = [MEMORY[0x263F825C8] whiteColor];
  }
  [(CAMLivePhotoBloomView *)self->__bloomView setTintColor:v3];
}

- (int64_t)livePhotoMode
{
  return self->_livePhotoMode;
}

- (CAMLivePhotoBloomView)_bloomView
{
  return self->__bloomView;
}

- (void).cxx_destruct
{
}

@end