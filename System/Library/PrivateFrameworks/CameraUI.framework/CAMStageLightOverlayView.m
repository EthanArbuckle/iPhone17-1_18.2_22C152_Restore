@interface CAMStageLightOverlayView
+ (BOOL)_useLargeLayoutForViewportSize:(CGSize)a3;
+ (CGRect)circleFrameForViewport:(CGRect)a3 orientation:(int64_t)a4 bottomContentInset:(double)a5 screenScale:(double)a6;
+ (double)_circleDiameterForViewportSize:(CGSize)a3 orientation:(int64_t)a4 screenScale:(double)a5;
- (BOOL)isActive;
- (BOOL)isVisible;
- (CAGradientLayer)_gradientLayer;
- (CAMStageLightAnimator)_animator;
- (CAMStageLightOverlayView)initWithFrame:(CGRect)a3;
- (CAShapeLayer)_circleLayer;
- (CGRect)_circleFrameForOrientation:(int64_t)a3;
- (CGRect)viewportFrame;
- (UIImageView)_vignetteView;
- (UIView)_tintView;
- (double)bottomContentInset;
- (int64_t)orientation;
- (unint64_t)_activeTimerID;
- (void)_setActiveTimerID:(unint64_t)a3;
- (void)_setAnimator:(id)a3;
- (void)_updateAnimatorState;
- (void)_updateShadowViewsAnimated:(BOOL)a3;
- (void)layoutSubviews;
- (void)setActive:(BOOL)a3;
- (void)setActive:(BOOL)a3 animated:(BOOL)a4;
- (void)setBottomContentInset:(double)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4;
- (void)setViewportFrame:(CGRect)a3;
- (void)setVisible:(BOOL)a3;
- (void)setVisible:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation CAMStageLightOverlayView

- (CAMStageLightOverlayView)initWithFrame:(CGRect)a3
{
  v35[3] = *MEMORY[0x263EF8340];
  v32.receiver = self;
  v32.super_class = (Class)CAMStageLightOverlayView;
  v3 = -[CAMStageLightOverlayView initWithFrame:](&v32, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_visible = 1;
    id v5 = objc_alloc(MEMORY[0x263F82E00]);
    uint64_t v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    tintView = v4->__tintView;
    v4->__tintView = (UIView *)v6;

    v8 = [MEMORY[0x263F825C8] blackColor];
    [(UIView *)v4->__tintView setBackgroundColor:v8];

    [(CAMStageLightOverlayView *)v4 addSubview:v4->__tintView];
    id v9 = objc_alloc(MEMORY[0x263F82828]);
    v10 = (void *)MEMORY[0x263F827E8];
    v11 = CAMCameraUIFrameworkBundle();
    v12 = [v10 imageNamed:@"CAMStageLightOverlayVignette" inBundle:v11];
    uint64_t v13 = [v9 initWithImage:v12];
    vignetteView = v4->__vignetteView;
    v4->__vignetteView = (UIImageView *)v13;

    [(CAMStageLightOverlayView *)v4 addSubview:v4->__vignetteView];
    v15 = (CAGradientLayer *)objc_alloc_init(MEMORY[0x263F157D0]);
    gradientLayer = v4->__gradientLayer;
    v4->__gradientLayer = v15;

    [(CAGradientLayer *)v4->__gradientLayer setType:*MEMORY[0x263F15DE0]];
    id v17 = [MEMORY[0x263F825C8] clearColor];
    v35[0] = [v17 CGColor];
    id v18 = [MEMORY[0x263F825C8] clearColor];
    v35[1] = [v18 CGColor];
    id v19 = [MEMORY[0x263F825C8] blackColor];
    v35[2] = [v19 CGColor];
    v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:3];
    [(CAGradientLayer *)v4->__gradientLayer setColors:v20];

    v33[0] = @"locations";
    v21 = [MEMORY[0x263EFF9D0] null];
    v34[0] = v21;
    v33[1] = @"startPoint";
    v22 = [MEMORY[0x263EFF9D0] null];
    v34[1] = v22;
    v33[2] = @"endPoint";
    v23 = [MEMORY[0x263EFF9D0] null];
    v34[2] = v23;
    v24 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:3];
    [(CAGradientLayer *)v4->__gradientLayer setActions:v24];

    v25 = v4->__gradientLayer;
    v26 = [(CAMStageLightOverlayView *)v4 layer];
    [v26 setMask:v25];

    uint64_t v27 = [MEMORY[0x263F15880] layer];
    circleLayer = v4->__circleLayer;
    v4->__circleLayer = (CAShapeLayer *)v27;

    v29 = [(CAMStageLightOverlayView *)v4 layer];
    [v29 addSublayer:v4->__circleLayer];

    [(CAMStageLightOverlayView *)v4 _updateShadowViewsAnimated:0];
    v30 = v4;
  }

  return v4;
}

- (void)setVisible:(BOOL)a3
{
}

- (void)setVisible:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_visible != a3)
  {
    self->_visible = a3;
    double v5 = 0.4;
    if (!a3) {
      double v5 = 0.25;
    }
    uint64_t v7 = 3221225472;
    uint64_t v6 = MEMORY[0x263EF8330];
    v8 = __48__CAMStageLightOverlayView_setVisible_animated___block_invoke;
    id v9 = &unk_263FA02A8;
    if (!a4) {
      double v5 = 0.0;
    }
    v10 = self;
    BOOL v11 = a3;
    +[CAMView animateIfNeededWithDuration:&v6 animations:v5];
    [(CAMStageLightOverlayView *)self _updateAnimatorState];
  }
}

uint64_t __48__CAMStageLightOverlayView_setVisible_animated___block_invoke(uint64_t a1)
{
  double v1 = 1.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v1 = 0.0;
  }
  return [*(id *)(a1 + 32) setAlpha:v1];
}

- (void)setActive:(BOOL)a3
{
}

- (void)setActive:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_active != a3)
  {
    self->_active = a3;
    [(CAMStageLightOverlayView *)self _updateShadowViewsAnimated:a4];
    [(CAMStageLightOverlayView *)self _updateAnimatorState];
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
    [(CAMStageLightOverlayView *)self _circleFrameForOrientation:[(CAMStageLightOverlayView *)self orientation]];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    id v14 = [(CAMStageLightOverlayView *)self _animator];
    objc_msgSend(v14, "setCircleBaseFrame:animated:", v4, v7, v9, v11, v13);
  }
}

- (void)setBottomContentInset:(double)a3
{
  if (self->_bottomContentInset != a3)
  {
    self->_bottomContentInset = a3;
    [(CAMStageLightOverlayView *)self _circleFrameForOrientation:[(CAMStageLightOverlayView *)self orientation]];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    id v12 = [(CAMStageLightOverlayView *)self _animator];
    objc_msgSend(v12, "setCircleBaseFrame:animated:", 1, v5, v7, v9, v11);
  }
}

- (void)setViewportFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_viewportFrame = &self->_viewportFrame;
  if (!CGRectEqualToRect(a3, self->_viewportFrame))
  {
    p_viewportFrame->origin.CGFloat x = x;
    p_viewportFrame->origin.CGFloat y = y;
    p_viewportFrame->size.CGFloat width = width;
    p_viewportFrame->size.CGFloat height = height;
    id v9 = [(CAMStageLightOverlayView *)self _animator];
    [(CAMStageLightOverlayView *)self _circleFrameForOrientation:[(CAMStageLightOverlayView *)self orientation]];
    objc_msgSend(v9, "setCircleBaseFrame:animated:", 1);
  }
}

- (void)_updateShadowViewsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(CAMStageLightOverlayView *)self isActive];
  double v6 = 0.3;
  if (!v3) {
    double v6 = 0.0;
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __55__CAMStageLightOverlayView__updateShadowViewsAnimated___block_invoke;
  v8[3] = &unk_263FA02A8;
  if (v5) {
    uint64_t v7 = 0x20000;
  }
  else {
    uint64_t v7 = 0x10000;
  }
  v8[4] = self;
  BOOL v9 = v5;
  +[CAMView animateIfNeededWithDuration:v7 options:v8 animations:0 completion:v6];
}

void __55__CAMStageLightOverlayView__updateShadowViewsAnimated___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v2 = 0.75;
  }
  else {
    double v2 = 0.6;
  }
  BOOL v3 = [*(id *)(a1 + 32) _tintView];
  [v3 setAlpha:v2];

  if (*(unsigned char *)(a1 + 40)) {
    double v4 = 1.0;
  }
  else {
    double v4 = 0.0;
  }
  id v5 = [*(id *)(a1 + 32) _vignetteView];
  [v5 setAlpha:v4];
}

- (void)_updateAnimatorState
{
  BOOL v3 = [(CAMStageLightOverlayView *)self isVisible];
  BOOL v4 = [(CAMStageLightOverlayView *)self isActive];
  uint64_t v5 = 1;
  if (v4) {
    uint64_t v5 = 2;
  }
  if (v3) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = [(CAMStageLightOverlayView *)self _animator];
  [v7 setState:v6];
}

+ (BOOL)_useLargeLayoutForViewportSize:(CGSize)a3
{
  return a3.height >= 834.0 && a3.width >= 834.0;
}

+ (double)_circleDiameterForViewportSize:(CGSize)a3 orientation:(int64_t)a4 screenScale:(double)a5
{
  objc_msgSend(a1, "_useLargeLayoutForViewportSize:");
  UIRoundToScale();
  return result;
}

+ (CGRect)circleFrameForViewport:(CGRect)a3 orientation:(int64_t)a4 bottomContentInset:(double)a5 screenScale:(double)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  objc_msgSend(a1, "_useLargeLayoutForViewportSize:", a3.size.width, a3.size.height);
  UIRectGetCenter();
  objc_msgSend((id)objc_opt_class(), "_circleDiameterForViewportSize:orientation:screenScale:", a4, width, height, a6);
  v18.origin.double x = x + 0.0;
  v18.origin.double y = y + 0.0;
  v18.size.double height = height - (a5 + 0.0);
  v18.size.double width = width;
  CGRectGetMaxY(v18);
  UIRectCenteredAboutPointScale();
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (CGRect)_circleFrameForOrientation:(int64_t)a3
{
  [(CAMStageLightOverlayView *)self viewportFrame];
  if (CGRectEqualToRect(v24, *MEMORY[0x263F001A8])) {
    [(CAMStageLightOverlayView *)self bounds];
  }
  else {
    [(CAMStageLightOverlayView *)self viewportFrame];
  }
  double v9 = v5;
  double v10 = v6;
  double v11 = v7;
  double v12 = v8;
  double v13 = [(CAMStageLightOverlayView *)self window];
  double v14 = [v13 screen];
  [v14 scale];
  double v16 = v15;

  id v17 = objc_opt_class();
  [(CAMStageLightOverlayView *)self bottomContentInset];
  objc_msgSend(v17, "circleFrameForViewport:orientation:bottomContentInset:screenScale:", a3, v9, v10, v11, v12, v18, v16);
  result.size.double height = v22;
  result.size.double width = v21;
  result.origin.double y = v20;
  result.origin.double x = v19;
  return result;
}

- (void)layoutSubviews
{
  v25.receiver = self;
  v25.super_class = (Class)CAMStageLightOverlayView;
  [(CAMStageLightOverlayView *)&v25 layoutSubviews];
  [(CAMStageLightOverlayView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(CAMStageLightOverlayView *)self _tintView];
  double v12 = [(CAMStageLightOverlayView *)self _vignetteView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);
  double v13 = [(CAMStageLightOverlayView *)self _gradientLayer];
  objc_msgSend(v13, "setBounds:", v4, v6, v8, v10);
  UIRectGetCenter();
  objc_msgSend(v13, "setPosition:");
  double v14 = [(CAMStageLightOverlayView *)self _animator];
  [(CAMStageLightOverlayView *)self _circleFrameForOrientation:[(CAMStageLightOverlayView *)self orientation]];
  double v19 = v15;
  double v20 = v16;
  double v21 = v17;
  double v22 = v18;
  if (v14)
  {
    -[CAMStageLightAnimator setCircleBaseFrame:](v14, "setCircleBaseFrame:", v15, v16, v17, v18);
  }
  else
  {
    v23 = [CAMStageLightAnimator alloc];
    CGRect v24 = [(CAMStageLightOverlayView *)self _circleLayer];
    double v14 = [(CAMStageLightAnimator *)v23 initWithGradientLayer:v13 circleLayer:v24];

    -[CAMStageLightAnimator setCircleBaseFrame:](v14, "setCircleBaseFrame:", v19, v20, v21, v22);
    [(CAMStageLightOverlayView *)self _setAnimator:v14];
    [(CAMStageLightOverlayView *)self _updateAnimatorState];
  }
}

- (BOOL)isActive
{
  return self->_active;
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (CGRect)viewportFrame
{
  double x = self->_viewportFrame.origin.x;
  double y = self->_viewportFrame.origin.y;
  double width = self->_viewportFrame.size.width;
  double height = self->_viewportFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)bottomContentInset
{
  return self->_bottomContentInset;
}

- (UIView)_tintView
{
  return self->__tintView;
}

- (UIImageView)_vignetteView
{
  return self->__vignetteView;
}

- (CAShapeLayer)_circleLayer
{
  return self->__circleLayer;
}

- (unint64_t)_activeTimerID
{
  return self->__activeTimerID;
}

- (void)_setActiveTimerID:(unint64_t)a3
{
  self->__activeTimerID = a3;
}

- (CAGradientLayer)_gradientLayer
{
  return self->__gradientLayer;
}

- (CAMStageLightAnimator)_animator
{
  return self->__animator;
}

- (void)_setAnimator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__animator, 0);
  objc_storeStrong((id *)&self->__gradientLayer, 0);
  objc_storeStrong((id *)&self->__circleLayer, 0);
  objc_storeStrong((id *)&self->__vignetteView, 0);
  objc_storeStrong((id *)&self->__tintView, 0);
}

@end