@interface CAMControlDrawerButton
+ (CGSize)buttonSize;
+ (id)_backgroundImage;
- (BOOL)isExpandable;
- (BOOL)shouldScaleImageWhileHighlighted;
- (BOOL)shouldShowSlashForCurrentState;
- (BOOL)shouldUseActiveTintForCurrentState;
- (BOOL)shouldUseSlash;
- (CAMControlDrawerButton)initWithLayoutStyle:(int64_t)a3;
- (CAMSlashMaskView)_slashMaskView;
- (CAMSlashView)_slashView;
- (CGSize)intrinsicContentSize;
- (UIImageView)_backgroundView;
- (UIImageView)_imageView;
- (id)_imageForImageName:(id)a3;
- (id)hudItemForAccessibilityHUDManager:(id)a3;
- (id)imageForAXHUD;
- (id)imageForCurrentState;
- (id)imageNameForCurrentState;
- (id)imageSymbolColorConfiguration;
- (int64_t)controlType;
- (int64_t)layoutStyle;
- (int64_t)orientation;
- (void)_updateSlashAnimated:(BOOL)a3;
- (void)layoutSubviews;
- (void)selectedByAccessibilityHUDManager:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setLayoutStyle:(int64_t)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateImage;
- (void)updateImageAnimated:(BOOL)a3;
@end

@implementation CAMControlDrawerButton

+ (id)_backgroundImage
{
  if (_backgroundImage_onceToken != -1) {
    dispatch_once(&_backgroundImage_onceToken, &__block_literal_global_38);
  }
  v2 = (void *)_backgroundImage_backgroundImage;
  return v2;
}

void __42__CAMControlDrawerButton__backgroundImage__block_invoke()
{
  v0 = (void *)MEMORY[0x263F827E8];
  CAMCameraUIFrameworkBundle();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v1 = [v0 imageNamed:@"CAMButtonBackground" inBundle:v4];
  uint64_t v2 = [v1 imageWithRenderingMode:2];
  v3 = (void *)_backgroundImage_backgroundImage;
  _backgroundImage_backgroundImage = v2;
}

+ (CGSize)buttonSize
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__CAMControlDrawerButton_buttonSize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (buttonSize_onceToken != -1) {
    dispatch_once(&buttonSize_onceToken, block);
  }
  double v2 = *(double *)&buttonSize_size_0;
  double v3 = *(double *)&buttonSize_size_1;
  result.height = v3;
  result.width = v2;
  return result;
}

void __36__CAMControlDrawerButton_buttonSize__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _backgroundImage];
  [v3 size];
  buttonSize_size_0 = v1;
  buttonSize_size_1 = v2;
}

- (CAMControlDrawerButton)initWithLayoutStyle:(int64_t)a3
{
  v17.receiver = self;
  v17.super_class = (Class)CAMControlDrawerButton;
  id v4 = -[CAMControlDrawerButton initWithFrame:](&v17, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_layoutStyle = a3;
    v6 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
    imageView = v5->__imageView;
    v5->__imageView = v6;

    v8 = [(id)objc_opt_class() _backgroundImage];
    uint64_t v9 = [objc_alloc(MEMORY[0x263F82828]) initWithImage:v8];
    backgroundView = v5->__backgroundView;
    v5->__backgroundView = (UIImageView *)v9;

    [(CAMControlDrawerButton *)v5 addSubview:v5->__backgroundView];
    [(CAMControlDrawerButton *)v5 addSubview:v5->__imageView];
    if ([(CAMControlDrawerButton *)v5 shouldUseSlash])
    {
      v11 = objc_alloc_init(CAMSlashView);
      slashView = v5->__slashView;
      v5->__slashView = v11;

      v13 = [MEMORY[0x263F825C8] whiteColor];
      [(CAMSlashView *)v5->__slashView setTintColor:v13];

      [(CAMControlDrawerButton *)v5 addSubview:v5->__slashView];
      v14 = objc_alloc_init(CAMSlashMaskView);
      slashMaskView = v5->__slashMaskView;
      v5->__slashMaskView = v14;

      [(UIImageView *)v5->__imageView setMaskView:v5->__slashMaskView];
    }
    [(CAMControlDrawerButton *)v5 addTarget:v5 action:sel_handleButtonReleased_ forControlEvents:64];
    [(CAMControlDrawerButton *)v5 updateImage];
    [(CAMControlDrawerButton *)v5 setExclusiveTouch:1];
  }
  return v5;
}

- (CGSize)intrinsicContentSize
{
  uint64_t v2 = objc_opt_class();
  [v2 buttonSize];
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  v24.receiver = self;
  v24.super_class = (Class)CAMControlDrawerButton;
  [(CAMControlDrawerButton *)&v24 layoutSubviews];
  [(CAMControlDrawerButton *)self bounds];
  -[CAMControlDrawerButton alignmentRectForFrame:](self, "alignmentRectForFrame:");
  UIRectGetCenter();
  double v3 = [(CAMControlDrawerButton *)self _imageView];
  [v3 intrinsicContentSize];
  UIRectCenteredAboutPointScale();
  objc_msgSend(v3, "frameForAlignmentRect:");
  CAMViewSetBoundsAndCenterForFrame(v3, v4, v5, v6, v7);
  v8 = [(CAMControlDrawerButton *)self _backgroundView];
  [v8 intrinsicContentSize];
  UIRectCenteredAboutPointScale();
  objc_msgSend(v8, "setFrame:");
  if ([(CAMControlDrawerButton *)self shouldUseSlash])
  {
    uint64_t v9 = [(CAMControlDrawerButton *)self _slashView];
    objc_msgSend(v9, "setBounds:", 0.0, 0.0, 20.0, 20.0);

    UIRectCenteredAboutPointScale();
    UIRectGetCenter();
    double v11 = v10;
    double v13 = v12;
    v14 = [(CAMControlDrawerButton *)self _slashView];
    objc_msgSend(v14, "setCenter:", v11, v13);

    [v3 bounds];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    v23 = [(CAMControlDrawerButton *)self _slashMaskView];
    objc_msgSend(v23, "setFrame:", v16, v18, v20, v22);

    [(CAMControlDrawerButton *)self _updateSlashAnimated:0];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v6 = [a3 preferredContentSizeCategory];
  double v4 = [(CAMControlDrawerButton *)self traitCollection];
  id v5 = [v4 preferredContentSizeCategory];

  if (v5 != v6 && ([v5 isEqualToString:v6] & 1) == 0) {
    [(CAMControlDrawerButton *)self didChangeContentSize];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(CAMControlDrawerButton *)self isHighlighted];
  v10.receiver = self;
  v10.super_class = (Class)CAMControlDrawerButton;
  [(CAMControlDrawerButton *)&v10 setHighlighted:v3];
  if (v5 != v3)
  {
    if ([(CAMControlDrawerButton *)self shouldScaleImageWhileHighlighted])
    {
      id v6 = [(CAMControlDrawerButton *)self _imageView];
      double v7 = [v6 layer];
      +[CAMAnimationHelper animateLayer:v7 forButtonHighlighted:v3 layoutStyle:[(CAMControlDrawerButton *)self layoutStyle]];

      v8 = [(CAMControlDrawerButton *)self _slashView];
      uint64_t v9 = [v8 layer];
      +[CAMAnimationHelper animateLayer:v9 forButtonHighlighted:v3 layoutStyle:[(CAMControlDrawerButton *)self layoutStyle]];
    }
  }
}

- (id)hudItemForAccessibilityHUDManager:(id)a3
{
  BOOL v3 = [(CAMControlDrawerButton *)self imageForAXHUD];
  id v4 = objc_alloc(MEMORY[0x263F823C0]);
  int v5 = objc_msgSend(v4, "initWithTitle:image:imageInsets:scaleImage:", 0, v3, 1, *MEMORY[0x263F834E8], *(double *)(MEMORY[0x263F834E8] + 8), *(double *)(MEMORY[0x263F834E8] + 16), *(double *)(MEMORY[0x263F834E8] + 24));

  return v5;
}

- (void)selectedByAccessibilityHUDManager:(id)a3
{
  [(CAMControlDrawerButton *)self cancelTouchTracking];
  [(CAMControlDrawerButton *)self sendActionsForControlEvents:64];
}

- (BOOL)isExpandable
{
  return 0;
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
    double v7 = [(CAMControlDrawerButton *)self _imageView];
    +[CAMView rotateView:v7 toInterfaceOrientation:a3 animated:v4];

    id v8 = [(CAMControlDrawerButton *)self _slashView];
    +[CAMView rotateView:v8 toInterfaceOrientation:a3 animated:v4];
  }
}

- (int64_t)controlType
{
  uint64_t v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF488];
  BOOL v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"%@ must be implemented by subclasses", v4 format];

  return 0;
}

- (BOOL)shouldScaleImageWhileHighlighted
{
  return 1;
}

- (void)updateImage
{
}

- (void)updateImageAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(CAMControlDrawerButton *)self imageForCurrentState];
  id v6 = [(CAMControlDrawerButton *)self _imageView];
  [v6 setImage:v5];

  if ([(CAMControlDrawerButton *)self shouldUseActiveTintForCurrentState]) {
    [MEMORY[0x263F825C8] systemYellowColor];
  }
  else {
  id v8 = [MEMORY[0x263F825C8] whiteColor];
  }
  double v7 = [(CAMControlDrawerButton *)self _imageView];
  [v7 setTintColor:v8];

  [(CAMControlDrawerButton *)self setNeedsLayout];
  if ([(CAMControlDrawerButton *)self shouldUseSlash]) {
    [(CAMControlDrawerButton *)self _updateSlashAnimated:v3];
  }
}

- (id)imageForCurrentState
{
  BOOL v3 = [(CAMControlDrawerButton *)self imageNameForCurrentState];
  if (v3)
  {
    BOOL v4 = [(CAMControlDrawerButton *)self _imageForImageName:v3];
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)imageForAXHUD
{
  BOOL v3 = [(CAMControlDrawerButton *)self imageNameForAXHUD];
  BOOL v4 = [(CAMControlDrawerButton *)self _imageForImageName:v3];

  return v4;
}

- (id)imageNameForCurrentState
{
  uint64_t v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF488];
  BOOL v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"%@ must be implemented by subclasses", v4 format];

  return 0;
}

- (BOOL)shouldUseActiveTintForCurrentState
{
  return 0;
}

- (id)imageSymbolColorConfiguration
{
  return 0;
}

- (BOOL)shouldUseSlash
{
  return 0;
}

- (BOOL)shouldShowSlashForCurrentState
{
  return 0;
}

- (void)_updateSlashAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v7 = [(CAMControlDrawerButton *)self _slashView];
  int v5 = [(CAMControlDrawerButton *)self _slashMaskView];
  BOOL v6 = [(CAMControlDrawerButton *)self shouldShowSlashForCurrentState];
  [v7 bounds];
  objc_msgSend(v5, "convertRect:fromView:", v7);
  objc_msgSend(v5, "setSlashBounds:animated:", v3);
  [v7 setVisible:v6 animated:v3];
}

- (id)_imageForImageName:(id)a3
{
  id v4 = a3;
  int v5 = [MEMORY[0x263F82818] configurationWithScale:3];
  BOOL v6 = [(CAMControlDrawerButton *)self traitCollection];
  id v7 = [v5 configurationWithTraitCollection:v6];

  id v8 = [(CAMControlDrawerButton *)self imageSymbolColorConfiguration];
  if (v8)
  {
    uint64_t v9 = [v7 configurationByApplyingConfiguration:v8];

    id v7 = (void *)v9;
  }
  objc_super v10 = [MEMORY[0x263F827E8] _systemImageNamed:v4 withConfiguration:v7];
  double v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    double v13 = (void *)MEMORY[0x263F827E8];
    v14 = CAMCameraUIFrameworkBundle();
    double v15 = [v13 imageNamed:v4 inBundle:v14];
    id v12 = [v15 imageWithRenderingMode:2];
  }
  return v12;
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (void)setLayoutStyle:(int64_t)a3
{
  self->_layoutStyle = a3;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (UIImageView)_imageView
{
  return self->__imageView;
}

- (UIImageView)_backgroundView
{
  return self->__backgroundView;
}

- (CAMSlashView)_slashView
{
  return self->__slashView;
}

- (CAMSlashMaskView)_slashMaskView
{
  return self->__slashMaskView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__slashMaskView, 0);
  objc_storeStrong((id *)&self->__slashView, 0);
  objc_storeStrong((id *)&self->__backgroundView, 0);
  objc_storeStrong((id *)&self->__imageView, 0);
}

@end