@interface CAMFlipButton
+ (CAMFlipButton)flipButtonWithLayoutStyle:(int64_t)a3;
+ (id)flipButtonOverContent;
- (BOOL)_useCTMAppearance;
- (CGSize)intrinsicContentSize;
- (UIEdgeInsets)tappableEdgeInsets;
- (UIImageView)_circleBackgroundView;
- (UIImageView)_imageView;
- (id)imageForAccessibilityHUD;
- (id)mainImageNameForAccessibilityHUD:(BOOL)a3;
- (int64_t)layoutStyle;
- (int64_t)orientation;
- (void)_commonCAMFlipButtonInitializationWithStyle:(int64_t)a3 overContent:(BOOL)a4;
- (void)_updateImages;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
- (void)setLayoutStyle:(int64_t)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4;
- (void)setTappableEdgeInsets:(UIEdgeInsets)a3;
- (void)set_circleBackgroundView:(id)a3;
@end

@implementation CAMFlipButton

+ (CAMFlipButton)flipButtonWithLayoutStyle:(int64_t)a3
{
  v4 = +[CAMFlipButton buttonWithType:0];
  [v4 _commonCAMFlipButtonInitializationWithStyle:a3 overContent:0];
  return (CAMFlipButton *)v4;
}

- (void)_updateImages
{
  id v11 = [(CAMFlipButton *)self _imageView];
  unint64_t v3 = [(CAMFlipButton *)self layoutStyle];
  v4 = [(CAMFlipButton *)self mainImageNameForAccessibilityHUD:0];
  BOOL v5 = [(CAMFlipButton *)self _useCTMAppearance];
  v6 = (void *)MEMORY[0x263F827E8];
  if (v5)
  {
    v7 = [MEMORY[0x263F82818] configurationWithScale:3];
    uint64_t v8 = [v6 systemImageNamed:v4 withConfiguration:v7];
LABEL_6:
    v10 = (void *)v8;

    v7 = v10;
    goto LABEL_7;
  }
  v9 = CAMCameraUIFrameworkBundle();
  v7 = [v6 imageNamed:v4 inBundle:v9];

  if (v3 <= 4 && v3 != 1)
  {
    uint64_t v8 = [v7 imageWithRenderingMode:2];
    goto LABEL_6;
  }
LABEL_7:
  [v11 setImage:v7];
}

- (UIImageView)_imageView
{
  return self->__imageView;
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (id)mainImageNameForAccessibilityHUD:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(CAMFlipButton *)self _useCTMAppearance];
  switch([(CAMFlipButton *)self layoutStyle])
  {
    case 0:
      v6 = @"CAMFlipButton";
      if (v3) {
        goto LABEL_11;
      }
      int v7 = dyld_program_sdk_at_least();
      uint64_t v8 = @"CAMLegacyFlipButton";
      if (v7) {
        uint64_t v8 = @"CAMFlipButton";
      }
      v6 = v8;
      if (v5) {
        goto LABEL_12;
      }
      goto LABEL_16;
    case 1:
    case 3:
      goto LABEL_10;
    case 2:
      goto LABEL_8;
    case 4:
      if (!v3)
      {
LABEL_10:
        v6 = @"CAMFlipButtonPad";
LABEL_11:
        if (!v5) {
          goto LABEL_14;
        }
LABEL_12:

        v6 = @"arrow.triangle.2.circlepath";
        goto LABEL_16;
      }
LABEL_8:
      v6 = @"CAMFlipButton";
      if (v5) {
        goto LABEL_12;
      }
LABEL_14:
      if (v3)
      {
        v6 = [NSString stringWithFormat:@"%@-AXHUD", v6];
      }
LABEL_16:
      return v6;
    default:
      v6 = 0;
      if (!v5) {
        goto LABEL_14;
      }
      goto LABEL_12;
  }
}

- (void)setTappableEdgeInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_tappableEdgeInsets.left
    || a3.top != self->_tappableEdgeInsets.top
    || a3.right != self->_tappableEdgeInsets.right
    || a3.bottom != self->_tappableEdgeInsets.bottom)
  {
    self->_tappableEdgeInsets = a3;
    -[CAMFlipButton setImageEdgeInsets:](self, "setImageEdgeInsets:");
    [(CAMFlipButton *)self setNeedsLayout];
  }
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_orientation != a3)
  {
    BOOL v4 = a4;
    self->_orientation = a3;
    id v6 = [(CAMFlipButton *)self _imageView];
    +[CAMView rotateView:v6 toInterfaceOrientation:a3 animated:v4];
  }
}

- (CGSize)intrinsicContentSize
{
  BOOL v3 = [(CAMFlipButton *)self _circleBackgroundView];
  BOOL v4 = v3;
  if (v3)
  {
    BOOL v5 = [v3 image];
    [v5 size];
    double v7 = v6;
    double v9 = v8;
  }
  else
  {
    BOOL v5 = [(CAMFlipButton *)self _imageView];
    v10 = [v5 image];
    [v10 size];
    double v7 = v11;
    double v9 = v12;
  }
  double v13 = v7;
  double v14 = v9;
  result.height = v14;
  result.width = v13;
  return result;
}

- (UIEdgeInsets)tappableEdgeInsets
{
  double top = self->_tappableEdgeInsets.top;
  double left = self->_tappableEdgeInsets.left;
  double bottom = self->_tappableEdgeInsets.bottom;
  double right = self->_tappableEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)layoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)CAMFlipButton;
  [(CAMFlipButton *)&v19 layoutSubviews];
  BOOL v3 = [(CAMFlipButton *)self _imageView];
  BOOL v4 = [(CAMFlipButton *)self _circleBackgroundView];
  [(CAMFlipButton *)self bounds];
  -[CAMFlipButton alignmentRectForFrame:](self, "alignmentRectForFrame:");
  UIRectGetCenter();
  double v5 = *MEMORY[0x263F001A8];
  double v6 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v7 = *MEMORY[0x263F00148];
  double v8 = *(double *)(MEMORY[0x263F00148] + 8);
  [v3 intrinsicContentSize];
  objc_msgSend(v3, "frameForAlignmentRect:", v7, v8, v9, v10);
  double v12 = v11;
  double v14 = v13;
  UIRectCenteredAboutPointScale();
  UIRectGetCenter();
  objc_msgSend(v3, "setCenter:");
  objc_msgSend(v3, "setBounds:", v5, v6, v12, v14);
  if (v4)
  {
    [v4 intrinsicContentSize];
    double v16 = v15;
    double v18 = v17;
    UIRectCenteredAboutPointScale();
    UIRectGetCenter();
    objc_msgSend(v4, "setCenter:");
    objc_msgSend(v4, "setBounds:", v5, v6, v16, v18);
  }
}

- (void)_commonCAMFlipButtonInitializationWithStyle:(int64_t)a3 overContent:(BOOL)a4
{
  BOOL v4 = a4;
  self->_layoutStyle = a3;
  self->_orientation = 1;
  id obj = objc_alloc_init(MEMORY[0x263F82828]);
  [obj setContentMode:4];
  [obj setClipsToBounds:0];
  double v7 = [MEMORY[0x263F825C8] whiteColor];
  [obj setTintColor:v7];

  objc_storeStrong((id *)&self->__imageView, obj);
  [(CAMFlipButton *)self addSubview:obj];
  self->__useCTMAppearance = v4;
  if (v4)
  {
    if (a3 != 4)
    {
      if (a3 == 1)
      {
        double v8 = [MEMORY[0x263F825C8] blackColor];
        double v9 = @"CAMButtonBackgroundPad";
        goto LABEL_7;
      }
      if (a3)
      {
        double v9 = 0;
        goto LABEL_9;
      }
    }
    double v8 = +[CAMFullscreenViewfinder lightControlBackgroundColor];
    double v9 = @"CAMButtonBackground";
LABEL_7:
    [(CAMFlipButton *)self setTintColor:v8];

LABEL_9:
    double v10 = (void *)MEMORY[0x263F827E8];
    double v11 = CAMCameraUIFrameworkBundle();
    double v12 = [v10 imageNamed:v9 inBundle:v11];
    double v13 = [v12 imageWithRenderingMode:2];

    double v14 = (UIImageView *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v13];
    circleBackgroundView = self->__circleBackgroundView;
    self->__circleBackgroundView = v14;

    [(CAMFlipButton *)self insertSubview:self->__circleBackgroundView atIndex:0];
  }
  [(CAMFlipButton *)self _updateImages];
}

+ (id)flipButtonOverContent
{
  v2 = +[CAMFlipButton buttonWithType:0];
  BOOL v3 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v4 = objc_msgSend(v3, "cam_initialLayoutStyle");

  [v2 _commonCAMFlipButtonInitializationWithStyle:v4 overContent:1];
  return v2;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(CAMFlipButton *)self isHighlighted];
  v13.receiver = self;
  v13.super_class = (Class)CAMFlipButton;
  [(CAMFlipButton *)&v13 setHighlighted:v3];
  if (v5 != v3)
  {
    double v6 = [(CAMFlipButton *)self _imageView];
    if ([(CAMFlipButton *)self _useCTMAppearance])
    {
      double v7 = [v6 layer];
      +[CAMAnimationHelper animateLayer:v7 forButtonHighlighted:v3 layoutStyle:[(CAMFlipButton *)self layoutStyle]];
    }
    else
    {
      if (v3) {
        double v8 = 0.1;
      }
      else {
        double v8 = 0.2;
      }
      double v9 = (void *)MEMORY[0x263F82E00];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __32__CAMFlipButton_setHighlighted___block_invoke;
      v10[3] = &unk_263FA02A8;
      id v11 = v6;
      BOOL v12 = v3;
      [v9 animateWithDuration:v10 animations:v8];
      double v7 = v11;
    }
  }
}

uint64_t __32__CAMFlipButton_setHighlighted___block_invoke(uint64_t a1)
{
  double v1 = 0.5;
  if (!*(unsigned char *)(a1 + 40)) {
    double v1 = 1.0;
  }
  return [*(id *)(a1 + 32) setAlpha:v1];
}

- (void)setOrientation:(int64_t)a3
{
}

- (void)setLayoutStyle:(int64_t)a3
{
  if (self->_layoutStyle != a3)
  {
    self->_layoutStyle = a3;
    [(CAMFlipButton *)self _updateImages];
  }
}

- (id)imageForAccessibilityHUD
{
  BOOL v3 = [(CAMFlipButton *)self mainImageNameForAccessibilityHUD:1];
  uint64_t v4 = [MEMORY[0x263F82818] configurationWithPointSize:72.0];
  int v5 = [(CAMFlipButton *)self traitCollection];
  double v6 = [v4 configurationWithTraitCollection:v5];

  double v7 = (void *)MEMORY[0x263F827E8];
  double v8 = CAMCameraUIFrameworkBundle();
  double v9 = [v7 imageNamed:v3 inBundle:v8];
  double v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [MEMORY[0x263F827E8] systemImageNamed:v3 withConfiguration:v6];
  }
  BOOL v12 = v11;

  objc_super v13 = [v12 imageWithRenderingMode:2];

  return v13;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (UIImageView)_circleBackgroundView
{
  return self->__circleBackgroundView;
}

- (void)set_circleBackgroundView:(id)a3
{
}

- (BOOL)_useCTMAppearance
{
  return self->__useCTMAppearance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__circleBackgroundView, 0);
  objc_storeStrong((id *)&self->__imageView, 0);
}

@end