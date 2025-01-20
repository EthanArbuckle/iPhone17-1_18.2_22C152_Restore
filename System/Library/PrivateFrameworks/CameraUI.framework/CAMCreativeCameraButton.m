@interface CAMCreativeCameraButton
- (BOOL)_isOverContent;
- (BOOL)useCompactLayout;
- (CAMCreativeCameraButton)initWithLayoutStyle:(int64_t)a3;
- (CGSize)intrinsicContentSize;
- (UIEdgeInsets)tappableEdgeInsets;
- (UIImageView)_circleBackgroundView;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)initForOverContent;
- (int64_t)layoutStyle;
- (int64_t)orientation;
- (void)_commonCAMCreativeCameraButtonInitializationWithStyle:(int64_t)a3 overContent:(BOOL)a4;
- (void)_updateImages;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
- (void)setLayoutStyle:(int64_t)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4;
- (void)setTappableEdgeInsets:(UIEdgeInsets)a3;
- (void)set_circleBackgroundView:(id)a3;
- (void)useCompactLayout:(BOOL)a3;
@end

@implementation CAMCreativeCameraButton

- (void)_commonCAMCreativeCameraButtonInitializationWithStyle:(int64_t)a3 overContent:(BOOL)a4
{
  self->_layoutStyle = a3;
  self->__overContent = a4;
  if (a4)
  {
    v5 = (void *)MEMORY[0x263F827E8];
    v6 = CAMCameraUIFrameworkBundle();
    v7 = [v5 imageNamed:@"CAMButtonBackground" inBundle:v6];
    v8 = [v7 imageWithRenderingMode:2];

    v9 = (UIImageView *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v8];
    circleBackgroundView = self->__circleBackgroundView;
    self->__circleBackgroundView = v9;

    v11 = [(CAMCreativeCameraButton *)self imageView];
    [(CAMCreativeCameraButton *)self insertSubview:self->__circleBackgroundView belowSubview:v11];
    v12 = +[CAMFullscreenViewfinder lightControlBackgroundColor];
    [(CAMCreativeCameraButton *)self setTintColor:v12];
  }
  id v14 = [MEMORY[0x263F825C8] whiteColor];
  v13 = [(CAMCreativeCameraButton *)self imageView];
  [v13 setTintColor:v14];
}

- (CAMCreativeCameraButton)initWithLayoutStyle:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMCreativeCameraButton;
  v4 = -[CAMCreativeCameraButton initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v5 = v4;
  if (v4)
  {
    [(CAMCreativeCameraButton *)v4 _commonCAMCreativeCameraButtonInitializationWithStyle:a3 overContent:0];
    [(CAMCreativeCameraButton *)v5 _updateImages];
    v6 = v5;
  }

  return v5;
}

- (id)initForOverContent
{
  v6.receiver = self;
  v6.super_class = (Class)CAMCreativeCameraButton;
  v2 = -[CAMCreativeCameraButton initWithFrame:](&v6, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v3 = v2;
  if (v2)
  {
    [(CAMCreativeCameraButton *)v2 _commonCAMCreativeCameraButtonInitializationWithStyle:4 overContent:1];
    [(CAMCreativeCameraButton *)v3 _updateImages];
    v4 = v3;
  }

  return v3;
}

- (void)_updateImages
{
  BOOL v3 = [(CAMCreativeCameraButton *)self _isOverContent];
  v4 = (void *)MEMORY[0x263F827E8];
  v5 = CAMCameraUIFrameworkBundle();
  if (v3)
  {
    objc_super v6 = [v4 imageNamed:@"CAMCreativeCameraButtonNoBorder" inBundle:v5];

    v7 = [MEMORY[0x263F825C8] whiteColor];
    id v12 = [v6 imageWithTintColor:v7];

    objc_super v8 = [MEMORY[0x263F825C8] systemYellowColor];
    [v6 imageWithTintColor:v8];
  }
  else
  {
    v9 = [v4 imageNamed:@"CAMCreativeCameraButtonInactive" inBundle:v5];
    id v12 = [v9 imageWithRenderingMode:2];

    v10 = (void *)MEMORY[0x263F827E8];
    objc_super v6 = CAMCameraUIFrameworkBundle();
    objc_super v8 = [v10 imageNamed:@"CAMCreativeCameraButton" inBundle:v6];
    [v8 imageWithRenderingMode:2];
  v11 = };

  [(CAMCreativeCameraButton *)self setImage:v12 forState:0];
  [(CAMCreativeCameraButton *)self setImage:v12 forState:2];
  if (![(CAMCreativeCameraButton *)self _isOverContent]) {
    [(CAMCreativeCameraButton *)self setImage:v11 forState:1];
  }
  [(CAMCreativeCameraButton *)self setImage:v11 forState:4];
  [(CAMCreativeCameraButton *)self setImage:v11 forState:5];
  [(CAMCreativeCameraButton *)self setImage:v11 forState:6];
  [(CAMCreativeCameraButton *)self setAdjustsImageWhenHighlighted:0];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if (([(CAMCreativeCameraButton *)self isEnabled] & 1) == 0
    && -[CAMCreativeCameraButton pointInside:withEvent:](self, "pointInside:withEvent:", v7, x, y))
  {
    [(CAMCreativeCameraButton *)self sendActionsForControlEvents:0x1000000];
  }
  v10.receiver = self;
  v10.super_class = (Class)CAMCreativeCameraButton;
  objc_super v8 = -[CAMCreativeCameraButton hitTest:withEvent:](&v10, sel_hitTest_withEvent_, v7, x, y);

  return v8;
}

- (void)layoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)CAMCreativeCameraButton;
  [(CAMCreativeCameraButton *)&v20 layoutSubviews];
  BOOL v3 = [(CAMCreativeCameraButton *)self imageView];
  [(CAMCreativeCameraButton *)self bounds];
  -[CAMCreativeCameraButton alignmentRectForFrame:](self, "alignmentRectForFrame:");
  UIRectGetCenter();
  double v5 = v4;
  double v7 = v6;
  double v8 = *MEMORY[0x263F001A8];
  double v9 = *(double *)(MEMORY[0x263F001A8] + 8);
  [(CAMCreativeCameraButton *)self intrinsicContentSize];
  double v11 = v10;
  double v13 = v12;
  objc_msgSend(v3, "setCenter:", v5, v7);
  objc_msgSend(v3, "setBounds:", v8, v9, v11, v13);
  id v14 = [(CAMCreativeCameraButton *)self _circleBackgroundView];
  v15 = v14;
  if (v14)
  {
    [v14 intrinsicContentSize];
    double v17 = v16;
    double v19 = v18;
    objc_msgSend(v15, "setCenter:", v5, v7);
    objc_msgSend(v15, "setBounds:", v8, v9, v17, v19);
  }
}

- (CGSize)intrinsicContentSize
{
  BOOL v3 = [(CAMCreativeCameraButton *)self _circleBackgroundView];
  double v4 = v3;
  if (v3)
  {
    double v5 = [v3 image];
    [v5 size];
    double v7 = v6;
    double v9 = v8;
  }
  else
  {
    if ([(CAMCreativeCameraButton *)self useCompactLayout]) {
      double v7 = 30.0;
    }
    else {
      double v7 = 42.0;
    }
    double v9 = v7;
  }

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)setTappableEdgeInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_tappableEdgeInsets.left
    || a3.top != self->_tappableEdgeInsets.top
    || a3.right != self->_tappableEdgeInsets.right
    || a3.bottom != self->_tappableEdgeInsets.bottom)
  {
    self->_tappableEdgeInsets = a3;
    [(CAMCreativeCameraButton *)self setNeedsLayout];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(CAMCreativeCameraButton *)self isHighlighted];
  v8.receiver = self;
  v8.super_class = (Class)CAMCreativeCameraButton;
  [(CAMCreativeCameraButton *)&v8 setHighlighted:v3];
  if (v5 != v3)
  {
    double v6 = [(CAMCreativeCameraButton *)self imageView];
    if ([(CAMCreativeCameraButton *)self _isOverContent])
    {
      double v7 = [v6 layer];
      +[CAMAnimationHelper animateLayer:v7 forButtonHighlighted:v3 layoutStyle:[(CAMCreativeCameraButton *)self layoutStyle]];
    }
  }
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
    id v6 = [(CAMCreativeCameraButton *)self imageView];
    +[CAMView rotateView:v6 toInterfaceOrientation:a3 animated:v4];
  }
}

- (void)setLayoutStyle:(int64_t)a3
{
  if (self->_layoutStyle != a3)
  {
    self->_layoutStyle = a3;
    [(CAMCreativeCameraButton *)self _updateImages];
  }
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
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

- (int64_t)orientation
{
  return self->_orientation;
}

- (BOOL)useCompactLayout
{
  return self->_useCompactLayout;
}

- (void)useCompactLayout:(BOOL)a3
{
  self->_useCompactLayout = a3;
}

- (BOOL)_isOverContent
{
  return self->__overContent;
}

- (UIImageView)_circleBackgroundView
{
  return self->__circleBackgroundView;
}

- (void)set_circleBackgroundView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end