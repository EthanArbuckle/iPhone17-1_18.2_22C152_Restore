@interface CAMCircleButton
- (BOOL)shouldShowSlashForCurrentState;
- (BOOL)shouldUseActiveTintForCurrentState;
- (CAMCircleButton)initWithFrame:(CGRect)a3;
- (CAMSlashContainer)_slashView;
- (UIImageView)_backgroundView;
- (UIImageView)_imageView;
- (double)activeTintAlphaForCurrentState;
- (id)_createCircleImageForContentSize:(id)a3;
- (id)imageNameForCurrentState;
- (int64_t)orientation;
- (void)_setSlashView:(id)a3;
- (void)_updateBackgroundImage;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateImage;
- (void)updateSlashAnimated:(BOOL)a3;
- (void)updateTintColors;
@end

@implementation CAMCircleButton

- (CAMCircleButton)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CAMCircleButton;
  v3 = -[CAMCircleButton initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
    backgroundView = v3->__backgroundView;
    v3->__backgroundView = v4;

    v6 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
    imageView = v3->__imageView;
    v3->__imageView = v6;

    v8 = objc_alloc_init(CAMSlashContainer);
    slashView = v3->__slashView;
    v3->__slashView = v8;

    [(CAMSlashContainer *)v3->__slashView setContentView:v3->__imageView];
    [(CAMCircleButton *)v3 addSubview:v3->__backgroundView];
    [(CAMCircleButton *)v3 addSubview:v3->__slashView];
    [(CAMCircleButton *)v3 updateImage];
    [(CAMCircleButton *)v3 _updateBackgroundImage];
    [(CAMCircleButton *)v3 updateTintColors];
  }
  return v3;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)CAMCircleButton;
  [(CAMCircleButton *)&v13 layoutSubviews];
  [(CAMCircleButton *)self bounds];
  UIRectGetCenter();
  v3 = [(CAMCircleButton *)self _backgroundView];
  [v3 intrinsicContentSize];
  CEKRectWithSize();
  UIRectCenteredAboutPointScale();
  objc_msgSend(v3, "setFrame:");
  v4 = [(CAMCircleButton *)self _slashView];
  CAMViewAlignmentSize(v4);
  CEKRectWithSize();
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  UIRectCenteredAboutPointScale();
  UIRectGetCenter();
  objc_msgSend(v4, "setCenter:");
  objc_msgSend(v4, "setBounds:", v6, v8, v10, v12);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v6 = [a3 preferredContentSizeCategory];
  v4 = [(CAMCircleButton *)self traitCollection];
  id v5 = [v4 preferredContentSizeCategory];

  if (v5 != v6 && ([v5 isEqualToString:v6] & 1) == 0)
  {
    [(CAMCircleButton *)self updateImage];
    [(CAMCircleButton *)self _updateBackgroundImage];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(CAMCircleButton *)self isHighlighted];
  v8.receiver = self;
  v8.super_class = (Class)CAMCircleButton;
  [(CAMCircleButton *)&v8 setHighlighted:v3];
  if (v5 != v3)
  {
    id v6 = [(CAMCircleButton *)self _slashView];
    double v7 = [v6 layer];
    +[CAMAnimationHelper animateLayer:v7 forButtonHighlighted:v3 layoutStyle:4];
  }
}

- (void)_updateBackgroundImage
{
  BOOL v3 = [(CAMCircleButton *)self traitCollection];
  v4 = [v3 preferredContentSizeCategory];
  id v7 = [(CAMCircleButton *)self _createCircleImageForContentSize:v4];

  int v5 = [v7 imageWithRenderingMode:2];
  id v6 = [(CAMCircleButton *)self _backgroundView];
  [v6 setImage:v5];

  [(CAMCircleButton *)self setNeedsLayout];
}

- (void)setOrientation:(int64_t)a3
{
  id v4 = [(CAMCircleButton *)self _slashView];
  [v4 setOrientation:a3];
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(CAMCircleButton *)self _slashView];
  [v6 setOrientation:a3 animated:v4];
}

- (int64_t)orientation
{
  v2 = [(CAMCircleButton *)self _slashView];
  int64_t v3 = [v2 orientation];

  return v3;
}

- (void)updateImage
{
  int64_t v3 = [(CAMCircleButton *)self traitCollection];
  BOOL v4 = [v3 preferredContentSizeCategory];
  BOOL v5 = +[CAMZoomButton shouldUseLargeButtonSizeForContentSize:v4];

  if (v5) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = 2;
  }
  id v10 = [MEMORY[0x263F82818] configurationWithScale:v6];
  id v7 = [(CAMCircleButton *)self imageNameForCurrentState];
  objc_super v8 = [MEMORY[0x263F827E8] _systemImageNamed:v7 withConfiguration:v10];
  double v9 = [(CAMCircleButton *)self _imageView];
  [v9 setImage:v8];

  [(CAMCircleButton *)self setNeedsLayout];
}

- (void)updateTintColors
{
  if ([(CAMCircleButton *)self shouldUseActiveTintForCurrentState])
  {
    int64_t v3 = [MEMORY[0x263F825C8] systemYellowColor];
    [(CAMCircleButton *)self activeTintAlphaForCurrentState];
    objc_msgSend(v3, "colorWithAlphaComponent:");
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x263F825C8] blackColor];
  }
  else
  {
    id v7 = (id)[MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.5];
    [MEMORY[0x263F825C8] whiteColor];
  BOOL v4 = };
  BOOL v5 = [(CAMCircleButton *)self _backgroundView];
  [v5 setTintColor:v7];

  uint64_t v6 = [(CAMCircleButton *)self _slashView];
  [v6 setTintColor:v4];
}

- (void)updateSlashAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CAMCircleButton *)self _slashView];
  objc_msgSend(v5, "setSlashed:animated:", -[CAMCircleButton shouldShowSlashForCurrentState](self, "shouldShowSlashForCurrentState"), v3);
}

- (id)imageNameForCurrentState
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF488];
  BOOL v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"%@ must be implemented by subclasses", v4 format];

  return 0;
}

- (BOOL)shouldShowSlashForCurrentState
{
  return 0;
}

- (BOOL)shouldUseActiveTintForCurrentState
{
  return 0;
}

- (double)activeTintAlphaForCurrentState
{
  return 1.0;
}

- (id)_createCircleImageForContentSize:(id)a3
{
  +[CAMZoomButton circleDiameterForContentSize:a3];
  CGFloat width = v11.width;
  v11.height = v11.width;
  UIGraphicsBeginImageContextWithOptions(v11, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGFloat v5 = *MEMORY[0x263F00148];
  CGFloat v6 = *(double *)(MEMORY[0x263F00148] + 8);
  id v7 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:1.0];
  [v7 setFill];

  v12.origin.x = v5;
  v12.origin.y = v6;
  v12.size.CGFloat width = width;
  v12.size.height = width;
  CGContextFillEllipseInRect(CurrentContext, v12);
  objc_super v8 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v8;
}

- (CAMSlashContainer)_slashView
{
  return self->__slashView;
}

- (void)_setSlashView:(id)a3
{
}

- (UIImageView)_imageView
{
  return self->__imageView;
}

- (UIImageView)_backgroundView
{
  return self->__backgroundView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__backgroundView, 0);
  objc_storeStrong((id *)&self->__imageView, 0);
  objc_storeStrong((id *)&self->__slashView, 0);
}

@end