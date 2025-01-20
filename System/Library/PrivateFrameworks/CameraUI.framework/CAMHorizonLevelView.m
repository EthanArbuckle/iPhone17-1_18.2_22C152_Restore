@interface CAMHorizonLevelView
- (CAMFeedbackController)_feedbackController;
- (CAMHorizonLevelView)initWithViewModel:(id)a3;
- (CAMHorizonLevelViewDelegate)delegate;
- (CAMLevelViewModel)viewModel;
- (UIImageView)_horizonLineView;
- (UIImageView)_referenceLineLeft;
- (UIImageView)_referenceLineRight;
- (id)_createStrechableLineImage:(id)a3 lineHeight:(double)a4 shadowWidth:(double)a5 shadowHorizontalEdges:(unint64_t)a6;
- (void)_drawHorizonLineInContext:(CGContext *)a3 withBounds:(CGRect)a4 color:(id)a5;
- (void)_layoutLineViewsWithMode:(int64_t)a3 rotationAngle:(double)a4;
- (void)_updateSubViewsAlphaWithAlpha:(double)a3 indicatorMode:(int64_t)a4 rotationAngle:(double)a5;
- (void)layoutSubviews;
- (void)observable:(id)a3 didPublishChange:(unint64_t)a4 withContext:(void *)a5;
- (void)setDelegate:(id)a3;
- (void)set_horizonLineView:(id)a3;
- (void)set_referenceLineLeft:(id)a3;
- (void)set_referenceLineRight:(id)a3;
@end

@implementation CAMHorizonLevelView

- (CAMHorizonLevelView)initWithViewModel:(id)a3
{
  id v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CAMHorizonLevelView;
  v6 = -[CAMHorizonLevelView initWithFrame:](&v29, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_viewModel, a3);
    [(CAMObservable *)v7->_viewModel registerChangeObserver:v7 context:0];
    v8 = +[CAMCaptureCapabilities capabilities];
    int v9 = [v8 allowHaptics];

    if (v9)
    {
      v10 = objc_alloc_init(CAMFeedbackController);
      feedbackController = v7->__feedbackController;
      v7->__feedbackController = v10;
    }
    [(CAMHorizonLevelView *)v7 _shadowWidth];
    double v13 = v12;
    v14 = [MEMORY[0x263F825C8] systemYellowColor];
    v15 = [(CAMHorizonLevelView *)v7 _createStrechableLineImage:v14 lineHeight:2 shadowWidth:1.0 shadowHorizontalEdges:v13];

    v16 = [MEMORY[0x263F825C8] systemYellowColor];
    v17 = [(CAMHorizonLevelView *)v7 _createStrechableLineImage:v16 lineHeight:8 shadowWidth:1.0 shadowHorizontalEdges:v13];

    v18 = [MEMORY[0x263F825C8] systemYellowColor];
    v19 = [(CAMHorizonLevelView *)v7 _createStrechableLineImage:v18 lineHeight:0 shadowWidth:1.0 shadowHorizontalEdges:v13];

    v20 = [MEMORY[0x263F825C8] whiteColor];
    v21 = [(CAMHorizonLevelView *)v7 _createStrechableLineImage:v20 lineHeight:10 shadowWidth:1.0 shadowHorizontalEdges:v13];

    uint64_t v22 = [objc_alloc(MEMORY[0x263F82828]) initWithImage:v21 highlightedImage:v19];
    horizonLineView = v7->__horizonLineView;
    v7->__horizonLineView = (UIImageView *)v22;

    uint64_t v24 = [objc_alloc(MEMORY[0x263F82828]) initWithImage:v21 highlightedImage:v15];
    referenceLineLeft = v7->__referenceLineLeft;
    v7->__referenceLineLeft = (UIImageView *)v24;

    uint64_t v26 = [objc_alloc(MEMORY[0x263F82828]) initWithImage:v21 highlightedImage:v17];
    referenceLineRight = v7->__referenceLineRight;
    v7->__referenceLineRight = (UIImageView *)v26;

    [(CAMHorizonLevelView *)v7 addSubview:v7->__horizonLineView];
    [(CAMHorizonLevelView *)v7 addSubview:v7->__referenceLineLeft];
    [(CAMHorizonLevelView *)v7 addSubview:v7->__referenceLineRight];
  }
  return v7;
}

- (void)_drawHorizonLineInContext:(CGContext *)a3 withBounds:(CGRect)a4 color:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGContextSetFillColorWithColor(a3, (CGColorRef)[a5 CGColor]);
  CGFloat v10 = x;
  CGFloat v11 = y;
  CGFloat v12 = width;
  CGFloat v13 = height;
  CGContextFillRect(a3, *(CGRect *)&v10);
}

- (id)_createStrechableLineImage:(id)a3 lineHeight:(double)a4 shadowWidth:(double)a5 shadowHorizontalEdges:(unint64_t)a6
{
  char v6 = a6;
  id v10 = a3;
  CGFloat v11 = [MEMORY[0x263F82B60] mainScreen];
  [v11 scale];
  CGFloat v13 = v12;

  double v14 = 3.0;
  double v15 = 0.0;
  if ((v6 & 8) != 0) {
    double v15 = a5;
  }
  if ((v6 & 2) != 0) {
    double v14 = a5 + 3.0;
  }
  CGFloat v16 = v14 + v15;
  CGFloat v17 = a4 + a5 + a5;
  UIRectInsetEdges();
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  v33.CGFloat width = v16;
  v33.CGFloat height = v17;
  UIGraphicsBeginImageContextWithOptions(v33, 0, v13);
  uint64_t v26 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.15];
  id v27 = v10;
  CGContextRef CurrentContext = UIGraphicsGetCurrentContext();
  -[CAMHorizonLevelView _drawHorizonLineInContext:withBounds:color:](self, "_drawHorizonLineInContext:withBounds:color:", CurrentContext, v26, 0.0, 0.0, v16, v17);
  -[CAMHorizonLevelView _drawHorizonLineInContext:withBounds:color:](self, "_drawHorizonLineInContext:withBounds:color:", CurrentContext, v27, v19, v21, v23, v25);

  objc_super v29 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  v30 = objc_msgSend(v29, "resizableImageWithCapInsets:", 0.0, a5 + 1.0, 0.0, a5 + 1.0);

  return v30;
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)CAMHorizonLevelView;
  [(CAMHorizonLevelView *)&v16 layoutSubviews];
  v3 = [(CAMHorizonLevelView *)self viewModel];
  unint64_t v4 = [v3 currentIndicatorMode];
  [v3 currentIndicatorRotationAngle];
  double v6 = v5;
  [(CAMHorizonLevelView *)self bounds];
  UIRectGetCenter();
  [(CAMHorizonLevelView *)self _shadowWidth];
  double v8 = v7;
  double v9 = v7 * 2.0 + 1.0;
  if (v4 >= 3)
  {
    if (v4 == 3)
    {
      [(CAMHorizonLevelView *)self bounds];
      CGRectGetHeight(v18);
    }
  }
  else
  {
    [(CAMHorizonLevelView *)self bounds];
    CGRectGetWidth(v17);
  }
  UIRoundToViewScale();
  double v11 = v10;
  UIRoundToViewScale();
  double v13 = v8 * 2.0 + 22.0;
  if (v6 == 0.0) {
    double v14 = v12 + v13 * -2.0;
  }
  else {
    double v14 = v11 + (2.0 - v8) * -2.0;
  }
  double v15 = [(CAMHorizonLevelView *)self traitCollection];
  [v15 displayScale];

  UIRectCenteredAboutPointScale();
  UIRectGetCenter();
  -[UIImageView setCenter:](self->__horizonLineView, "setCenter:");
  -[UIImageView setBounds:](self->__horizonLineView, "setBounds:", 0.0, 0.0, v14, v9);
  UIRectCenteredAboutPointScale();
  UIRectGetCenter();
  -[UIImageView setCenter:](self->__referenceLineLeft, "setCenter:");
  -[UIImageView setBounds:](self->__referenceLineLeft, "setBounds:", 0.0, 0.0, v13, v9);
  UIRectCenteredAboutPointScale();
  UIRectGetCenter();
  -[UIImageView setCenter:](self->__referenceLineRight, "setCenter:");
  -[UIImageView setBounds:](self->__referenceLineRight, "setBounds:", 0.0, 0.0, v13, v9);
  if ((v4 & 0xFFFFFFFFFFFFFFFELL) == 2) {
    [(CAMHorizonLevelView *)self _layoutLineViewsWithMode:v4 rotationAngle:v6];
  }
  [v3 currentIndicatorAlpha];
  -[CAMHorizonLevelView _updateSubViewsAlphaWithAlpha:indicatorMode:rotationAngle:](self, "_updateSubViewsAlphaWithAlpha:indicatorMode:rotationAngle:", v4);
}

- (void)_layoutLineViewsWithMode:(int64_t)a3 rotationAngle:(double)a4
{
  double v7 = [(CAMHorizonLevelView *)self _horizonLineView];
  if (a3 == 2)
  {
    CGAffineTransformMakeRotation(&v11, 0.0);
    CGAffineTransform v10 = v11;
    [(CAMHorizonLevelView *)self setTransform:&v10];
  }
  else if (a3 == 3)
  {
    CGAffineTransformMakeRotation(&v13, 1.57079633);
    CGAffineTransform v12 = v13;
    [(CAMHorizonLevelView *)self setTransform:&v12];
    a4 = -a4;
  }
  CGAffineTransformMakeRotation(&v9, a4);
  CGAffineTransform v8 = v9;
  [v7 setTransform:&v8];
}

- (void)_updateSubViewsAlphaWithAlpha:(double)a3 indicatorMode:(int64_t)a4 rotationAngle:(double)a5
{
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) != 2) {
    a3 = 0.0;
  }
  CGAffineTransform v8 = [(CAMHorizonLevelView *)self _horizonLineView];
  [v8 setAlpha:a3];

  CGAffineTransform v9 = [(CAMHorizonLevelView *)self _referenceLineLeft];
  [v9 setAlpha:a3];

  CGAffineTransform v10 = [(CAMHorizonLevelView *)self _referenceLineRight];
  [v10 setAlpha:a3];

  CGAffineTransform v11 = [(CAMHorizonLevelView *)self _horizonLineView];
  [v11 setHighlighted:a5 == 0.0];

  CGAffineTransform v12 = [(CAMHorizonLevelView *)self _referenceLineLeft];
  [v12 setHighlighted:a5 == 0.0];

  id v13 = [(CAMHorizonLevelView *)self _referenceLineRight];
  [v13 setHighlighted:a5 == 0.0];
}

- (void)observable:(id)a3 didPublishChange:(unint64_t)a4 withContext:(void *)a5
{
  if (a5) {
    return;
  }
  char v5 = a4;
  id v7 = a3;
  [v7 currentIndicatorAlpha];
  double v9 = v8;
  uint64_t v10 = [v7 currentIndicatorMode];
  [v7 currentIndicatorRotationAngle];
  double v12 = v11;

  if ((v5 & 0x10) != 0)
  {
    if (fabs(v12) <= 0.08)
    {
      id v13 = [(CAMHorizonLevelView *)self delegate];
      int v14 = [v13 horizonLevelViewCanPlayHaptics:self];

      if (v14)
      {
        double v15 = [(CAMHorizonLevelView *)self _feedbackController];
        [v15 prepareDiscreteFeedback:1];

        if (v12 == 0.0)
        {
          objc_super v16 = [(CAMHorizonLevelView *)self _feedbackController];
          [v16 performDiscreteFeedback:1];
        }
      }
    }
LABEL_10:
    [(CAMHorizonLevelView *)self setNeedsLayout];
    if ((v5 & 4) == 0) {
      return;
    }
    goto LABEL_11;
  }
  if (v5) {
    goto LABEL_10;
  }
  if ((v5 & 4) == 0) {
    return;
  }
LABEL_11:
  [(CAMHorizonLevelView *)self _updateSubViewsAlphaWithAlpha:v10 indicatorMode:v9 rotationAngle:v12];
}

- (CAMLevelViewModel)viewModel
{
  return self->_viewModel;
}

- (CAMHorizonLevelViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMHorizonLevelViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIImageView)_horizonLineView
{
  return self->__horizonLineView;
}

- (void)set_horizonLineView:(id)a3
{
}

- (UIImageView)_referenceLineLeft
{
  return self->__referenceLineLeft;
}

- (void)set_referenceLineLeft:(id)a3
{
}

- (UIImageView)_referenceLineRight
{
  return self->__referenceLineRight;
}

- (void)set_referenceLineRight:(id)a3
{
}

- (CAMFeedbackController)_feedbackController
{
  return self->__feedbackController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__feedbackController, 0);
  objc_storeStrong((id *)&self->__referenceLineRight, 0);
  objc_storeStrong((id *)&self->__referenceLineLeft, 0);
  objc_storeStrong((id *)&self->__horizonLineView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end