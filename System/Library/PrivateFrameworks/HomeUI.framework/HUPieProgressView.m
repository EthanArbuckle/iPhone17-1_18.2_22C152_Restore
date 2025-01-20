@interface HUPieProgressView
- (BOOL)hidesWhenStopped;
- (BOOL)isAnimating;
- (CAShapeLayer)outlineLayer;
- (CAShapeLayer)progressLayer;
- (HUPieProgressView)init;
- (HUPieProgressView)initWithFrame:(CGRect)a3;
- (HUPieProgressView)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (HUPieProgressView)initWithStyle:(int64_t)a3;
- (HUPieProgressViewDelegate)delegate;
- (double)indeterminateExpectedDuration;
- (double)indeterminateMaxProgress;
- (double)outlineLineWidth;
- (double)progress;
- (double)progressLineWidth;
- (id)_setupOutlineLayer;
- (id)_setupProgressLayer;
- (int64_t)style;
- (void)_fadeIn;
- (void)_fadeOut;
- (void)_setDefaults;
- (void)_updateLayerPaths;
- (void)_updateProgressLayerLineWidth;
- (void)layoutSubviews;
- (void)resetProgress;
- (void)setDelegate:(id)a3;
- (void)setHidesWhenStopped:(BOOL)a3;
- (void)setIndeterminateExpectedDuration:(double)a3;
- (void)setIndeterminateMaxProgress:(double)a3;
- (void)setIsAnimating:(BOOL)a3;
- (void)setOutlineLayer:(id)a3;
- (void)setOutlineLineWidth:(double)a3;
- (void)setProgress:(double)a3;
- (void)setProgressLayer:(id)a3;
- (void)setProgressLineWidth:(double)a3;
- (void)setStyle:(int64_t)a3;
- (void)startWithFuture:(id)a3;
- (void)tintColorDidChange;
@end

@implementation HUPieProgressView

- (void)startWithFuture:(id)a3
{
  id v4 = a3;
  v5 = [(HUPieProgressView *)self progressLayer];
  [v5 removeAllAnimations];

  if ([(HUPieProgressView *)self hidesWhenStopped]) {
    [(HUPieProgressView *)self _fadeIn];
  }
  [(HUPieProgressView *)self setIsAnimating:1];
  [(HUPieProgressView *)self indeterminateMaxProgress];
  -[HUPieProgressView setProgress:](self, "setProgress:");
  v6 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"strokeEnd"];
  [(HUPieProgressView *)self indeterminateExpectedDuration];
  objc_msgSend(v6, "setDuration:");
  [v6 setFromValue:&unk_1F19B6110];
  v7 = NSNumber;
  [(HUPieProgressView *)self progress];
  v8 = objc_msgSend(v7, "numberWithDouble:");
  [v6 setToValue:v8];

  LODWORD(v9) = 1036831949;
  LODWORD(v10) = 0.5;
  LODWORD(v11) = 0.25;
  LODWORD(v12) = 1.0;
  v13 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v9 :v10 :v11 :v12];
  [v6 setTimingFunction:v13];

  v14 = [(HUPieProgressView *)self progressLayer];
  [v14 addAnimation:v6 forKey:@"HUPieProgressViewStartingAnimation"];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __37__HUPieProgressView_startWithFuture___block_invoke;
  v18[3] = &unk_1E63866E0;
  v18[4] = self;
  id v15 = (id)[v4 addSuccessBlock:v18];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __37__HUPieProgressView_startWithFuture___block_invoke_3;
  v17[3] = &unk_1E6386708;
  v17[4] = self;
  id v16 = (id)[v4 addFailureBlock:v17];
}

void __37__HUPieProgressView_startWithFuture___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) progressLayer];
  v3 = [v2 presentationLayer];
  [v3 strokeEnd];
  double v5 = v4;

  v6 = [*(id *)(a1 + 32) progressLayer];
  [v6 removeAnimationForKey:@"HUPieProgressViewStartingAnimation"];

  [*(id *)(a1 + 32) setProgress:1.0];
  [MEMORY[0x1E4F39CF8] begin];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __37__HUPieProgressView_startWithFuture___block_invoke_2;
  v14[3] = &unk_1E6386018;
  v14[4] = *(void *)(a1 + 32);
  [MEMORY[0x1E4F39CF8] setCompletionBlock:v14];
  v7 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"strokeEnd"];
  [*(id *)(a1 + 32) progress];
  double v9 = (v8 - v5) * 0.5;
  if (v9 < 0.2) {
    double v9 = 0.2;
  }
  [v7 setDuration:v9];
  double v10 = [NSNumber numberWithDouble:v5];
  [v7 setFromValue:v10];

  double v11 = NSNumber;
  [*(id *)(a1 + 32) progress];
  double v12 = objc_msgSend(v11, "numberWithDouble:");
  [v7 setToValue:v12];

  v13 = [*(id *)(a1 + 32) progressLayer];
  [v13 addAnimation:v7 forKey:@"HUPieProgressViewFinishingAnimation"];

  [MEMORY[0x1E4F39CF8] commit];
}

uint64_t __37__HUPieProgressView_startWithFuture___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsAnimating:0];
  uint64_t result = [*(id *)(a1 + 32) hidesWhenStopped];
  if (result)
  {
    v3 = *(void **)(a1 + 32);
    return [v3 _fadeOut];
  }
  return result;
}

uint64_t __37__HUPieProgressView_startWithFuture___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) progressLayer];
  v3 = [v2 presentationLayer];
  [v3 strokeEnd];
  double v5 = v4;
  v6 = [*(id *)(a1 + 32) progressLayer];
  [v6 setStrokeEnd:v5];

  v7 = [*(id *)(a1 + 32) progressLayer];
  [v7 removeAllAnimations];

  [*(id *)(a1 + 32) setIsAnimating:0];
  uint64_t result = [*(id *)(a1 + 32) hidesWhenStopped];
  if (result)
  {
    double v9 = *(void **)(a1 + 32);
    return [v9 _fadeOut];
  }
  return result;
}

- (void)resetProgress
{
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
  [(HUPieProgressView *)self _updateLayerPaths];
}

- (void)setIndeterminateMaxProgress:(double)a3
{
  if (a3 < 0.0 || a3 > 1.0) {
    NSLog(&cfstr_Hupieprogressv_1.isa, a2);
  }
  double v6 = 0.0;
  if (a3 >= 0.0) {
    double v6 = a3;
  }
  self->_indeterminateMaxProgress = fmin(v6, 1.0);
}

- (double)outlineLineWidth
{
  v2 = [(HUPieProgressView *)self outlineLayer];
  [v2 lineWidth];
  double v4 = v3;

  return v4;
}

- (void)setOutlineLineWidth:(double)a3
{
  id v4 = [(HUPieProgressView *)self outlineLayer];
  [v4 setLineWidth:a3];
}

- (void)setProgressLineWidth:(double)a3
{
  self->_progressLineWidth = a3;
  [(HUPieProgressView *)self _updateLayerPaths];
}

- (void)setHidesWhenStopped:(BOOL)a3
{
  BOOL v3 = a3;
  self->_hidesWhenStopped = a3;
  if (![(HUPieProgressView *)self isAnimating])
  {
    if (v3) {
      double v5 = 0.0;
    }
    else {
      double v5 = 1.0;
    }
    [(HUPieProgressView *)self setHidden:v3];
    [(HUPieProgressView *)self setAlpha:v5];
  }
}

- (void)setIsAnimating:(BOOL)a3
{
  BOOL v3 = a3;
  self->_isAnimating = a3;
  double v5 = [(HUPieProgressView *)self delegate];
  if (v3)
  {
    char v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) == 0) {
      return;
    }
    id v8 = [(HUPieProgressView *)self delegate];
    [v8 pieProgressViewDidStartAnimating:self];
  }
  else
  {
    int v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) == 0) {
      return;
    }
    id v8 = [(HUPieProgressView *)self delegate];
    [v8 pieProgressViewDidFinishAnimating:self];
  }
}

- (double)progress
{
  v2 = [(HUPieProgressView *)self progressLayer];
  [v2 strokeEnd];
  double v4 = v3;

  return v4;
}

- (void)setProgress:(double)a3
{
  id v4 = [(HUPieProgressView *)self progressLayer];
  [v4 setStrokeEnd:a3];
}

- (HUPieProgressView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)HUPieProgressView;
  double v3 = -[HUPieProgressView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3)
  {
    double v5 = [(HUPieProgressView *)v3 _setupOutlineLayer];
    [(HUPieProgressView *)v4 setOutlineLayer:v5];

    char v6 = [(HUPieProgressView *)v4 layer];
    int v7 = [(HUPieProgressView *)v4 outlineLayer];
    [v6 addSublayer:v7];

    id v8 = [(HUPieProgressView *)v4 _setupProgressLayer];
    [(HUPieProgressView *)v4 setProgressLayer:v8];

    double v9 = [(HUPieProgressView *)v4 layer];
    double v10 = [(HUPieProgressView *)v4 progressLayer];
    [v9 addSublayer:v10];

    [(HUPieProgressView *)v4 _setDefaults];
    [(HUPieProgressView *)v4 _updateLayerPaths];
  }
  return v4;
}

- (HUPieProgressView)init
{
  return -[HUPieProgressView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (HUPieProgressView)initWithStyle:(int64_t)a3
{
  id v4 = [(HUPieProgressView *)self init];
  double v5 = v4;
  if (v4) {
    [(HUPieProgressView *)v4 setStyle:a3];
  }
  return v5;
}

- (HUPieProgressView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  double v5 = -[HUPieProgressView initWithFrame:](self, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  char v6 = v5;
  if (v5) {
    [(HUPieProgressView *)v5 setStyle:a4];
  }
  return v6;
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)HUPieProgressView;
  [(HUPieProgressView *)&v14 layoutSubviews];
  double v3 = [(HUPieProgressView *)self layer];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  objc_super v12 = [(HUPieProgressView *)self outlineLayer];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  v13 = [(HUPieProgressView *)self progressLayer];
  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);

  [(HUPieProgressView *)self _updateLayerPaths];
}

- (void)tintColorDidChange
{
  v6.receiver = self;
  v6.super_class = (Class)HUPieProgressView;
  [(HUPieProgressView *)&v6 tintColorDidChange];
  id v3 = [(HUPieProgressView *)self tintColor];
  uint64_t v4 = [v3 CGColor];
  double v5 = [(HUPieProgressView *)self progressLayer];
  [v5 setStrokeColor:v4];
}

- (id)_setupOutlineLayer
{
  v2 = [MEMORY[0x1E4F39C88] layer];
  id v3 = [MEMORY[0x1E4F428B8] clearColor];
  objc_msgSend(v2, "setFillColor:", objc_msgSend(v3, "CGColor"));

  id v4 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
  objc_msgSend(v2, "setStrokeColor:", objc_msgSend(v4, "CGColor"));

  return v2;
}

- (id)_setupProgressLayer
{
  id v3 = [MEMORY[0x1E4F39C88] layer];
  id v4 = [MEMORY[0x1E4F428B8] clearColor];
  objc_msgSend(v3, "setFillColor:", objc_msgSend(v4, "CGColor"));

  id v5 = [(HUPieProgressView *)self tintColor];
  objc_msgSend(v3, "setStrokeColor:", objc_msgSend(v5, "CGColor"));

  return v3;
}

- (void)_setDefaults
{
  id v3 = [MEMORY[0x1E4F428B8] clearColor];
  [(HUPieProgressView *)self setBackgroundColor:v3];

  [(HUPieProgressView *)self setStyle:0];
  [(HUPieProgressView *)self setIndeterminateMaxProgress:0.8];
  [(HUPieProgressView *)self setIndeterminateExpectedDuration:2.0];
  [(HUPieProgressView *)self setOutlineLineWidth:2.0];
  [(HUPieProgressView *)self setProgressLineWidth:2.0];
  [(HUPieProgressView *)self setHidesWhenStopped:0];
  [(HUPieProgressView *)self setIsAnimating:0];

  [(HUPieProgressView *)self resetProgress];
}

- (void)_updateProgressLayerLineWidth
{
  int64_t v3 = [(HUPieProgressView *)self style];
  if (v3 != 1)
  {
    if (!v3)
    {
      id v4 = [(HUPieProgressView *)self progressLayer];
      [v4 frame];
      double Width = CGRectGetWidth(v15);
      objc_super v6 = [(HUPieProgressView *)self outlineLayer];
      [v6 lineWidth];
      double v8 = (Width - v7) * 0.5;
      double v9 = [(HUPieProgressView *)self progressLayer];
      [v9 setLineWidth:v8];

      goto LABEL_6;
    }
    NSLog(&cfstr_Hupieprogressv_2.isa);
  }
  [(HUPieProgressView *)self progressLineWidth];
  double v11 = v10;
  id v4 = [(HUPieProgressView *)self progressLayer];
  [v4 setLineWidth:v11];
LABEL_6:

  id v13 = [(HUPieProgressView *)self progressLayer];
  [v13 lineWidth];
  [v13 setLineWidth:v12 + 0.1];
}

- (void)_updateLayerPaths
{
  int64_t v3 = [(HUPieProgressView *)self layer];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v28.origin.x = v5;
  v28.origin.y = v7;
  v28.size.width = v9;
  v28.size.height = v11;
  double MidX = CGRectGetMidX(v28);
  v29.origin.x = v5;
  v29.origin.y = v7;
  v29.size.width = v9;
  v29.size.height = v11;
  double MidY = CGRectGetMidY(v29);
  v30.origin.x = v5;
  v30.origin.y = v7;
  v30.size.width = v9;
  v30.size.height = v11;
  double Width = CGRectGetWidth(v30);
  v31.origin.x = v5;
  v31.origin.y = v7;
  v31.size.width = v9;
  v31.size.height = v11;
  double Height = CGRectGetHeight(v31);
  if (Width < Height) {
    double Height = Width;
  }
  double v16 = Height * 0.5;
  objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithOvalInRect:", v5, v7, v9, v11);
  id v17 = objc_claimAutoreleasedReturnValue();
  uint64_t v18 = [v17 CGPath];
  v19 = [(HUPieProgressView *)self outlineLayer];
  [v19 setPath:v18];

  [(HUPieProgressView *)self _updateProgressLayerLineWidth];
  objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, MidX, MidY, v16, -1.57079633, 4.71238898);
  id v26 = objc_claimAutoreleasedReturnValue();
  uint64_t v20 = [v26 CGPath];
  v21 = [(HUPieProgressView *)self progressLayer];
  [v21 setPath:v20];

  uint64_t v22 = *MEMORY[0x1E4F3A458];
  v23 = [(HUPieProgressView *)self progressLayer];
  [v23 setLineCap:v22];

  uint64_t v24 = *MEMORY[0x1E4F3A478];
  v25 = [(HUPieProgressView *)self progressLayer];
  [v25 setLineJoin:v24];
}

- (void)_fadeIn
{
  [(HUPieProgressView *)self setHidden:0];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __28__HUPieProgressView__fadeIn__block_invoke;
  v3[3] = &unk_1E6386018;
  v3[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v3 animations:0.3];
}

uint64_t __28__HUPieProgressView__fadeIn__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (void)_fadeOut
{
  v2[4] = self;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __29__HUPieProgressView__fadeOut__block_invoke;
  v3[3] = &unk_1E6386018;
  v3[4] = self;
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __29__HUPieProgressView__fadeOut__block_invoke_2;
  v2[3] = &unk_1E6386730;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v3 animations:v2 completion:0.3];
}

uint64_t __29__HUPieProgressView__fadeOut__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __29__HUPieProgressView__fadeOut__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setHidden:1];
  v2 = *(void **)(a1 + 32);

  return [v2 resetProgress];
}

- (HUPieProgressViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUPieProgressViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)style
{
  return self->_style;
}

- (double)indeterminateMaxProgress
{
  return self->_indeterminateMaxProgress;
}

- (double)indeterminateExpectedDuration
{
  return self->_indeterminateExpectedDuration;
}

- (void)setIndeterminateExpectedDuration:(double)a3
{
  self->_indeterminateExpectedDuration = a3;
}

- (double)progressLineWidth
{
  return self->_progressLineWidth;
}

- (BOOL)hidesWhenStopped
{
  return self->_hidesWhenStopped;
}

- (BOOL)isAnimating
{
  return self->_isAnimating;
}

- (CAShapeLayer)outlineLayer
{
  return self->_outlineLayer;
}

- (void)setOutlineLayer:(id)a3
{
}

- (CAShapeLayer)progressLayer
{
  return self->_progressLayer;
}

- (void)setProgressLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressLayer, 0);
  objc_storeStrong((id *)&self->_outlineLayer, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end