@interface CAMSlashContainer
- (BOOL)isSlashed;
- (CAMSlashContainer)initWithFrame:(CGRect)a3;
- (CAMSlashMaskView)_slashMaskView;
- (CAMSlashView)_slashView;
- (CGSize)intrinsicContentSize;
- (CGSize)slashSize;
- (UIEdgeInsets)alignmentRectInsets;
- (UIView)contentView;
- (int64_t)orientation;
- (void)_setSlashMaskView:(id)a3;
- (void)_setSlashView:(id)a3;
- (void)_updateOrientationAnimated:(BOOL)a3;
- (void)_updateSlashAnimated:(BOOL)a3;
- (void)layoutSubviews;
- (void)setContentView:(id)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4;
- (void)setSlashSize:(CGSize)a3;
- (void)setSlashed:(BOOL)a3;
- (void)setSlashed:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation CAMSlashContainer

- (CAMSlashContainer)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMSlashContainer;
  v3 = -[CAMSlashContainer initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_orientation = 1;
    [(CAMSlashContainer *)v3 setUserInteractionEnabled:0];
  }
  return v4;
}

- (CGSize)intrinsicContentSize
{
  v2 = [(CAMSlashContainer *)self contentView];
  [v2 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (UIEdgeInsets)alignmentRectInsets
{
  v2 = [(CAMSlashContainer *)self contentView];
  [v2 alignmentRectInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (void)layoutSubviews
{
  [(CAMSlashContainer *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  UIRectGetCenter();
  double v11 = [(CAMSlashContainer *)self traitCollection];
  [v11 displayScale];

  double v12 = [(CAMSlashContainer *)self contentView];
  CAMViewSetBoundsAndCenterForFrame(v12, v4, v6, v8, v10);

  uint64_t v13 = [(CAMSlashContainer *)self _slashView];
  if (v13)
  {
    double v14 = (void *)v13;
    v15 = [(CAMSlashContainer *)self _slashMaskView];

    if (v15)
    {
      v16 = [(CAMSlashContainer *)self _slashMaskView];
      CAMViewSetBoundsAndCenterForFrame(v16, v4, v6, v8, v10);

      [(CAMSlashContainer *)self slashSize];
      CEKRectWithSize();
      double v18 = v17;
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;
      UIRectCenteredAboutPointScale();
      UIRectGetCenter();
      double v26 = v25;
      double v28 = v27;
      id v29 = [(CAMSlashContainer *)self _slashView];
      objc_msgSend(v29, "setCenter:", v26, v28);
      objc_msgSend(v29, "setBounds:", v18, v20, v22, v24);
      [(CAMSlashContainer *)self _updateSlashAnimated:0];
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
    self->_orientation = a3;
    [(CAMSlashContainer *)self _updateOrientationAnimated:a4];
  }
}

- (void)_updateOrientationAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v5 = [(CAMSlashContainer *)self orientation];
  double v6 = [(CAMSlashContainer *)self contentView];
  +[CAMView rotateView:v6 toInterfaceOrientation:v5 animated:v3];

  id v7 = [(CAMSlashContainer *)self _slashView];
  +[CAMView rotateView:v7 toInterfaceOrientation:v5 animated:v3];
}

- (void)setContentView:(id)a3
{
  int64_t v5 = (UIView *)a3;
  p_contentView = &self->_contentView;
  contentView = self->_contentView;
  if (contentView != v5)
  {
    double v11 = v5;
    double v8 = [(UIView *)contentView superview];

    if (v8 == self) {
      [(UIView *)*p_contentView removeFromSuperview];
    }
    double v9 = [(CAMSlashContainer *)self _slashMaskView];
    double v10 = [(UIView *)*p_contentView maskView];

    if (v10 == v9) {
      [(UIView *)*p_contentView setMaskView:0];
    }
    objc_storeStrong((id *)&self->_contentView, a3);
    [(CAMSlashContainer *)self addSubview:v11];
    [(UIView *)v11 setMaskView:v9];
    [(CAMSlashContainer *)self _updateOrientationAnimated:0];

    int64_t v5 = v11;
  }
  MEMORY[0x270F9A758](contentView, v5);
}

- (void)setSlashed:(BOOL)a3
{
}

- (void)setSlashed:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_slashed != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    double v9 = [(CAMSlashContainer *)self _slashView];
    id v7 = [(CAMSlashContainer *)self _slashMaskView];
    if (v5 && !v9 && !v7)
    {
      id v7 = objc_alloc_init(CAMSlashMaskView);
      double v9 = objc_alloc_init(CAMSlashView);
      [(CAMSlashContainer *)self _setSlashView:v9];
      [(CAMSlashContainer *)self _setSlashMaskView:v7];
      [(CAMSlashContainer *)self _updateOrientationAnimated:0];
      double v8 = [(CAMSlashContainer *)self contentView];
      [v8 setMaskView:v7];

      [(CAMSlashContainer *)self addSubview:v9];
      [(CAMSlashContainer *)self layoutIfNeeded];
    }
    self->_slashed = v5;
    [(CAMSlashContainer *)self _updateSlashAnimated:v4];
  }
}

- (void)_updateSlashAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v7 = [(CAMSlashContainer *)self _slashView];
  BOOL v5 = [(CAMSlashContainer *)self _slashMaskView];
  BOOL v6 = [(CAMSlashContainer *)self isSlashed];
  [v7 bounds];
  objc_msgSend(v5, "convertRect:fromView:", v7);
  objc_msgSend(v5, "setSlashBounds:animated:", v3);
  [v7 setVisible:v6 animated:v3];
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (BOOL)isSlashed
{
  return self->_slashed;
}

- (CGSize)slashSize
{
  double width = self->_slashSize.width;
  double height = self->_slashSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSlashSize:(CGSize)a3
{
  self->_slashSize = a3;
}

- (CAMSlashView)_slashView
{
  return self->__slashView;
}

- (void)_setSlashView:(id)a3
{
}

- (CAMSlashMaskView)_slashMaskView
{
  return self->__slashMaskView;
}

- (void)_setSlashMaskView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__slashMaskView, 0);
  objc_storeStrong((id *)&self->__slashView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end