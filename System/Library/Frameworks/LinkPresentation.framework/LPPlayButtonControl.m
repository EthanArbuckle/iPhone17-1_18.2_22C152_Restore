@interface LPPlayButtonControl
- (BOOL)gestureRecognizer:(id)a3 canPreventGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)isFlipped;
- (BOOL)isIndeterminate;
- (CGSize)buttonSize;
- (LPPlayButtonControl)initWithStyle:(id)a3 theme:(id)a4;
- (UIImageView)imageView;
- (float)buttonCornerRadius;
- (float)progress;
- (id)_createProgressIndicatorLayerWithBounds:(CGRect)a3 lineWidth:(double)a4;
- (id)defaultBackgroundColor;
- (id)outerBorderColor;
- (id)pauseImage;
- (id)playImage;
- (id)playable;
- (void)_createBackgroundView;
- (void)_createBorderView;
- (void)_createHighlightLayer;
- (void)_createImageView;
- (void)_createInnerProgressView;
- (void)_createOuterProgressView;
- (void)_didScroll;
- (void)_hideTapHighlight;
- (void)_highlightLongPressRecognized:(id)a3;
- (void)_showPlayIndicator:(BOOL)a3;
- (void)_toggleToPlayState;
- (void)_updateEnabledState;
- (void)_updateInnerProgressLayerStroke;
- (void)_updateOuterProgressLayerStroke;
- (void)beginIndeterminateAnimation;
- (void)endIndeterminateAnimation;
- (void)hideProgressAnimated:(BOOL)a3;
- (void)installRecognizersOnView:(id)a3;
- (void)layoutPlayButton;
- (void)layoutSubviews;
- (void)setEnabled:(BOOL)a3;
- (void)setImageView:(id)a3;
- (void)setPlayButtonState:(unint64_t)a3;
- (void)setProgress:(float)a3;
- (void)setProgress:(float)a3 animated:(BOOL)a4;
- (void)setShowBorder:(BOOL)a3;
- (void)setShowOuterBorder:(BOOL)a3;
@end

@implementation LPPlayButtonControl

- (LPPlayButtonControl)initWithStyle:(id)a3 theme:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)LPPlayButtonControl;
  v9 = [(LPPlayButtonControl *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_style, a3);
    objc_storeStrong((id *)&v10->_theme, a4);
    [(UIView *)v10 _lp_setBackgroundColor:0];
    v11 = [(LPPlayButtonControl *)v10 layer];
    [v11 setAllowsGroupBlending:0];

    v12 = [(LPPlayButtonControl *)v10 layer];
    [v12 setAllowsGroupOpacity:0];

    v13 = [(LPPlayButtonControl *)v10 layer];
    [v13 setMasksToBounds:0];

    [(LPPlayButtonControl *)v10 _createBackgroundView];
    [(LPPlayButtonControl *)v10 _createImageView];
    [(LPPlayButtonControl *)v10 _createBorderView];
    [(LPPlayButtonControl *)v10 _createOuterProgressView];
    [(LPPlayButtonControl *)v10 _createInnerProgressView];
    [(LPPlayButtonControl *)v10 _createHighlightLayer];
    [(LPPlayButtonControl *)v10 setShowOuterBorder:0];
    [(LPPlayButtonControl *)v10 setShowBorder:0];
    [(LPPlayButtonControl *)v10 setPlayButtonState:0];
    [(LPPlayButtonControl *)v10 hideProgressAnimated:0];
    [(LPPlayButtonControl *)v10 showPlayIndicator:1];
    v14 = [MEMORY[0x1E4FB1E20] systemTraitsAffectingColorAppearance];
    id v15 = (id)[(LPPlayButtonControl *)v10 registerForTraitChanges:v14 withAction:sel__traitAffectingColorAppearanceDidChange_];

    v16 = v10;
  }

  return v10;
}

- (BOOL)isFlipped
{
  return 1;
}

- (void)setPlayButtonState:(unint64_t)a3
{
  if (a3 == 1)
  {
    v6 = [(LPAudioPlayButtonTheme *)self->_theme keyColor];
    id v12 = v6;
    if (!v6)
    {
      v6 = [(UIView *)self _lp_tintColor];
    }
    [(UIImageView *)self->_imageView setTintColor:v6];
    id v7 = v12;
    if (!v12)
    {

      id v7 = 0;
    }

    backgroundView = self->_backgroundView;
    id v13 = [MEMORY[0x1E4FB1618] clearColor];
    -[UIView _lp_setBackgroundColor:](backgroundView, "_lp_setBackgroundColor:");

    [(LPPlayButtonControl *)self setShowOuterBorder:1];
  }
  else if (!a3)
  {
    BOOL v4 = [(LPAudioPlayButtonTheme *)self->_theme useInvertedInactiveState];
    theme = self->_theme;
    if (v4) {
      [(LPAudioPlayButtonTheme *)theme keyColor];
    }
    else {
    id v14 = [(LPAudioPlayButtonTheme *)theme secondaryColor];
    }
    BOOL v9 = [(LPAudioPlayButtonTheme *)self->_theme useInvertedInactiveState];
    v10 = self->_theme;
    if (v9) {
      [(LPAudioPlayButtonTheme *)v10 secondaryColor];
    }
    else {
    v11 = [(LPAudioPlayButtonTheme *)v10 keyColor];
    }
    [(UIImageView *)self->_imageView setTintColor:v14];
    [(UIView *)self->_backgroundView _lp_setBackgroundColor:v11];
    [(LPPlayButtonControl *)self setShowOuterBorder:0];
  }
}

- (id)playImage
{
  v2 = +[LPResources playButton];
  v3 = [v2 platformImage];

  return v3;
}

- (id)pauseImage
{
  v2 = +[LPResources pauseButton];
  v3 = [v2 platformImage];

  return v3;
}

- (id)outerBorderColor
{
  return [(LPAudioPlayButtonTheme *)self->_theme outerBorderColor];
}

- (id)defaultBackgroundColor
{
  return (id)[MEMORY[0x1E4FB1618] colorWithRed:0.933333333 green:0.933333333 blue:0.909803922 alpha:1.0];
}

- (CGSize)buttonSize
{
  v2 = [(LPAudioPlayButtonStyle *)self->_style size];
  [v2 asSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (float)buttonCornerRadius
{
  double v3 = [(LPAudioPlayButtonStyle *)self->_style size];
  double v4 = [v3 width];
  [v4 value];
  double v6 = v5;
  double v7 = [(LPAudioPlayButtonStyle *)self->_style size];
  double v8 = [v7 height];
  [v8 value];
  *(float *)&double v6 = fmin(v6, v9) * 0.5;

  return *(float *)&v6;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)LPPlayButtonControl;
  [(LPPlayButtonControl *)&v3 layoutSubviews];
  [(LPPlayButtonControl *)self layoutPlayButton];
}

- (void)layoutPlayButton
{
  [(LPPlayButtonControl *)self buttonSize];
  double v4 = v3;
  double v6 = v5;
  -[UIImageView setFrame:](self->_imageView, "setFrame:", 0.0, 0.0, v3, v5);
  backgroundView = self->_backgroundView;

  -[UIView setFrame:](backgroundView, "setFrame:", 0.0, 0.0, v4, v6);
}

- (void)installRecognizersOnView:(id)a3
{
  id v7 = a3;
  double v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_buttonPressed_];
  [v7 addGestureRecognizer:v4];
  double v5 = (UILongPressGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:self action:sel__highlightLongPressRecognized_];
  highlightRecognizer = self->_highlightRecognizer;
  self->_highlightRecognizer = v5;

  [(UILongPressGestureRecognizer *)self->_highlightRecognizer setMinimumPressDuration:0.001];
  [(UILongPressGestureRecognizer *)self->_highlightRecognizer setDelegate:self];
  [v7 addGestureRecognizer:self->_highlightRecognizer];
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v4 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    NSClassFromString(&cfstr_Uipreviewgestu.isa);
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (BOOL)gestureRecognizer:(id)a3 canPreventGestureRecognizer:(id)a4
{
  return 0;
}

- (void)_didScroll
{
  [(UILongPressGestureRecognizer *)self->_highlightRecognizer setEnabled:0];
  highlightRecognizer = self->_highlightRecognizer;

  [(UILongPressGestureRecognizer *)highlightRecognizer setEnabled:1];
}

- (void)_highlightLongPressRecognized:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [v6 state];
  if ((unint64_t)(v4 - 3) >= 2)
  {
    if (v4 == 1)
    {
      LODWORD(v5) = 1.0;
      [(CAShapeLayer *)self->_highlightLayer setOpacity:v5];
    }
  }
  else
  {
    [(LPPlayButtonControl *)self _hideTapHighlight];
  }
}

- (void)_hideTapHighlight
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __40__LPPlayButtonControl__hideTapHighlight__block_invoke;
  v2[3] = &unk_1E5B04DF0;
  v2[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:0 delay:v2 options:0 animations:0.47 completion:0.0];
}

uint64_t __40__LPPlayButtonControl__hideTapHighlight__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 496) setOpacity:0.0];
}

- (void)setEnabled:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)LPPlayButtonControl;
  [(LPPlayButtonControl *)&v4 setEnabled:a3];
  [(LPPlayButtonControl *)self _updateEnabledState];
}

- (void)beginIndeterminateAnimation
{
  [(LPPlayButtonControl *)self setProgress:0 animated:0.0];
  outerProgressLayer = self->_outerProgressLayer;
  if (self->_indeterminate)
  {
    objc_super v4 = [(CAShapeLayer *)outerProgressLayer animationForKey:@"spin"];

    if (v4) {
      return;
    }
  }
  else
  {
    [(CAShapeLayer *)outerProgressLayer setStrokeStart:0.12];
    self->_indeterminate = 1;
  }
  [(LPPlayButtonControl *)self _updateOuterProgressLayerStroke];
  [(CAShapeLayer *)self->_outerProgressLayer removeAnimationForKey:@"spin"];
  id v6 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform.rotation.z"];
  [v6 setFromValue:&unk_1EF7127B0];
  [v6 setToValue:&unk_1EF712DF8];
  [v6 setDuration:1.0];
  [v6 setCumulative:1];
  LODWORD(v5) = 2139095040;
  [v6 setRepeatCount:v5];
  [(CAShapeLayer *)self->_outerProgressLayer addAnimation:v6 forKey:@"spin"];
}

- (void)endIndeterminateAnimation
{
  if (self->_indeterminate)
  {
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    [(CAShapeLayer *)self->_outerProgressLayer setStrokeStart:0.0];
    [MEMORY[0x1E4F39CF8] commit];
    [(CAShapeLayer *)self->_outerProgressLayer removeAnimationForKey:@"spin"];
    CGAffineTransformMakeRotation(&v5, -1.57079633);
    outerProgressLayer = self->_outerProgressLayer;
    CGAffineTransform v4 = v5;
    [(CAShapeLayer *)outerProgressLayer setAffineTransform:&v4];
    self->_indeterminate = 0;
    [(LPPlayButtonControl *)self _updateOuterProgressLayerStroke];
  }
}

- (void)hideProgressAnimated:(BOOL)a3
{
  if (self->_showingProgress || self->_indeterminate)
  {
    [(LPPlayButtonControl *)self endIndeterminateAnimation];
    [(CAShapeLayer *)self->_innerProgressLayer setHidden:1];
    [(UIView *)self->_backgroundView setHidden:0];
    [(UIView *)self->_backgroundView _lp_setOpacity:1.0];
    [(UIImageView *)self->_imageView _lp_setOpacity:1.0];
    self->_showingProgress = 0;
    [(LPPlayButtonControl *)self _showPlayIndicator:1];
  }
}

- (void)setProgress:(float)a3 animated:(BOOL)a4
{
  double v7 = a3;
  [(CAShapeLayer *)self->_innerProgressLayer setHidden:fabs(a3) < 0.00000011920929];
  if (!self->_showingProgress) {
    [(LPPlayButtonControl *)self _toggleToPlayState];
  }
  if (self->_progress != a3)
  {
    if (a3 > 0.00000011921 && self->_indeterminate) {
      [(LPPlayButtonControl *)self endIndeterminateAnimation];
    }
    float v8 = fmax(fmin(v7, 1.0), 0.0);
    self->_double progress = v8;
    if (a4)
    {
      id v13 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"strokeEnd"];
      [v13 setDuration:0.2];
      [v13 setFillMode:*MEMORY[0x1E4F39FA8]];
      [v13 setRemovedOnCompletion:0];
      *(float *)&double v9 = self->_progress;
      v10 = [NSNumber numberWithFloat:v9];
      [v13 setToValue:v10];

      [(CAShapeLayer *)self->_innerProgressLayer addAnimation:v13 forKey:0];
    }
    else
    {
      [(CAShapeLayer *)self->_innerProgressLayer removeAllAnimations];
      double progress = self->_progress;
      innerProgressLayer = self->_innerProgressLayer;
      [(CAShapeLayer *)innerProgressLayer setStrokeEnd:progress];
    }
  }
}

- (void)setShowBorder:(BOOL)a3
{
}

- (void)setShowOuterBorder:(BOOL)a3
{
  [(CAShapeLayer *)self->_outerProgressLayer setHidden:!a3];

  [(LPPlayButtonControl *)self _updateOuterProgressLayerStroke];
}

- (void)_updateOuterProgressLayerStroke
{
  id v3 = [(LPPlayButtonControl *)self outerBorderColor];
  -[CAShapeLayer setStrokeColor:](self->_outerProgressLayer, "setStrokeColor:", [v3 CGColor]);
}

- (id)_createProgressIndicatorLayerWithBounds:(CGRect)a3 lineWidth:(double)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v9 = objc_alloc_init(MEMORY[0x1E4F39C88]);
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  CGRect v16 = CGRectInset(v15, a4 * 0.5, a4 * 0.5);
  objc_msgSend(v9, "setFrame:", v16.origin.x, v16.origin.y, v16.size.width, v16.size.height);
  CGAffineTransformMakeRotation(&v13, -1.57079633);
  CGAffineTransform v12 = v13;
  [v9 setAffineTransform:&v12];
  [v9 setLineWidth:a4];
  [v9 bounds];
  v10 = CGPathCreateWithEllipseInRect(v17, 0);
  [v9 setPath:v10];
  [v9 setLineCap:*MEMORY[0x1E4F3A458]];
  CGPathRelease(v10);

  return v9;
}

- (void)_createBorderView
{
  [(UIView *)self _lp_backingScaleFactor];
  double v4 = 1.0 / v3;
  [(LPPlayButtonControl *)self buttonSize];
  -[LPPlayButtonControl _createProgressIndicatorLayerWithBounds:lineWidth:](self, "_createProgressIndicatorLayerWithBounds:lineWidth:", -v4, -v4, v5 + v4 * 2.0, v6 + v4 * 2.0, v4);
  double v7 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue();
  borderLayer = self->_borderLayer;
  self->_borderLayer = v7;

  id v9 = [MEMORY[0x1E4FB1618] clearColor];
  -[CAShapeLayer setBackgroundColor:](self->_borderLayer, "setBackgroundColor:", [v9 CGColor]);

  id v10 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.1];
  -[CAShapeLayer setStrokeColor:](self->_borderLayer, "setStrokeColor:", [v10 CGColor]);

  id v11 = [MEMORY[0x1E4FB1618] clearColor];
  -[CAShapeLayer setFillColor:](self->_borderLayer, "setFillColor:", [v11 CGColor]);

  id v12 = [(LPPlayButtonControl *)self layer];
  [v12 addSublayer:self->_borderLayer];
}

- (void)_createBackgroundView
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  double v4 = (UIView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  backgroundView = self->_backgroundView;
  self->_backgroundView = v4;

  [(UIView *)self->_backgroundView setUserInteractionEnabled:0];
  double v6 = self->_backgroundView;
  [(LPPlayButtonControl *)self buttonCornerRadius];
  [(UIView *)v6 _lp_setCornerRadius:0 continuous:v7];
  float v8 = self->_backgroundView;
  id v9 = [(LPPlayButtonControl *)self defaultBackgroundColor];
  [(UIView *)v8 _lp_setBackgroundColor:v9];

  [(UIView *)self->_backgroundView _lp_setHoverEffectEnabled:1];
  id v10 = self->_backgroundView;

  [(LPPlayButtonControl *)self addSubview:v10];
}

- (void)_createImageView
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1838]);
  double v4 = (UIImageView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  imageView = self->_imageView;
  self->_imageView = v4;

  [(UIImageView *)self->_imageView setContentMode:4];
  [(UIImageView *)self->_imageView setUserInteractionEnabled:0];
  [(UIImageView *)self->_imageView setOpaque:0];
  double v6 = (void *)MEMORY[0x1E4FB1830];
  float v7 = [(LPAudioPlayButtonStyle *)self->_style glyphSize];
  [v7 value];
  float v8 = objc_msgSend(v6, "configurationWithPointSize:");
  [(UIImageView *)self->_imageView setPreferredSymbolConfiguration:v8];

  [(UIImageView *)self->_imageView _lp_setBackgroundColor:0];
  id v9 = self->_imageView;

  [(LPPlayButtonControl *)self addSubview:v9];
}

- (void)_createInnerProgressView
{
  [(LPPlayButtonControl *)self buttonSize];
  -[LPPlayButtonControl _createProgressIndicatorLayerWithBounds:lineWidth:](self, "_createProgressIndicatorLayerWithBounds:lineWidth:", 0.0, 0.0, v3, v4, 2.0);
  double v5 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue();
  innerProgressLayer = self->_innerProgressLayer;
  self->_innerProgressLayer = v5;

  id v7 = [MEMORY[0x1E4FB1618] clearColor];
  -[CAShapeLayer setBackgroundColor:](self->_innerProgressLayer, "setBackgroundColor:", [v7 CGColor]);

  id v8 = [MEMORY[0x1E4FB1618] clearColor];
  -[CAShapeLayer setFillColor:](self->_innerProgressLayer, "setFillColor:", [v8 CGColor]);

  [(CAShapeLayer *)self->_innerProgressLayer setStrokeEnd:0.0];
  id v9 = [(LPPlayButtonControl *)self layer];
  [v9 addSublayer:self->_innerProgressLayer];

  [(LPPlayButtonControl *)self _updateInnerProgressLayerStroke];
}

- (void)_createOuterProgressView
{
  [(LPPlayButtonControl *)self buttonSize];
  -[LPPlayButtonControl _createProgressIndicatorLayerWithBounds:lineWidth:](self, "_createProgressIndicatorLayerWithBounds:lineWidth:", 0.0, 0.0, v3, v4, 2.0);
  double v5 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue();
  outerProgressLayer = self->_outerProgressLayer;
  self->_outerProgressLayer = v5;

  id v7 = [MEMORY[0x1E4FB1618] clearColor];
  -[CAShapeLayer setBackgroundColor:](self->_outerProgressLayer, "setBackgroundColor:", [v7 CGColor]);

  id v8 = [MEMORY[0x1E4FB1618] clearColor];
  -[CAShapeLayer setFillColor:](self->_outerProgressLayer, "setFillColor:", [v8 CGColor]);

  id v9 = [(LPPlayButtonControl *)self layer];
  [v9 addSublayer:self->_outerProgressLayer];

  [(LPPlayButtonControl *)self _updateOuterProgressLayerStroke];
}

- (void)_createHighlightLayer
{
  [(LPPlayButtonControl *)self buttonSize];
  double v4 = v3;
  double v6 = v5;
  id v7 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
  highlightLayer = self->_highlightLayer;
  self->_highlightLayer = v7;

  -[CAShapeLayer setFrame:](self->_highlightLayer, "setFrame:", 0.0, 0.0, v4, v6);
  id v10 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.16];
  -[CAShapeLayer setFillColor:](self->_highlightLayer, "setFillColor:", [v10 CGColor]);

  [(CAShapeLayer *)self->_highlightLayer setOpacity:0.0];
  [(CAShapeLayer *)self->_highlightLayer bounds];
  id v9 = CGPathCreateWithEllipseInRect(v13, 0);
  [(CAShapeLayer *)self->_highlightLayer setPath:v9];
  CGPathRelease(v9);
  id v11 = [(LPPlayButtonControl *)self layer];
  [v11 addSublayer:self->_highlightLayer];
}

- (void)_showPlayIndicator:(BOOL)a3
{
  self->_isPlaying = !a3;
  if (!a3) {
    [(LPPlayButtonControl *)self pauseImage];
  }
  else {
  double v4 = [(LPPlayButtonControl *)self playImage];
  }
  [(UIImageView *)self->_imageView setImage:v4];

  [(UIView *)self _lp_setNeedsLayout];
}

- (void)_toggleToPlayState
{
  self->_showingProgress = 1;
  [(LPPlayButtonControl *)self _showPlayIndicator:0];
  [(CAShapeLayer *)self->_outerProgressLayer setHidden:0];
  innerProgressLayer = self->_innerProgressLayer;

  [(CAShapeLayer *)innerProgressLayer setHidden:0];
}

- (void)_updateInnerProgressLayerStroke
{
  id v3 = [(LPAudioPlayButtonTheme *)self->_theme keyColor];
  -[CAShapeLayer setStrokeColor:](self->_innerProgressLayer, "setStrokeColor:", [v3 CGColor]);
}

- (void)_updateEnabledState
{
  imageView = self->_imageView;
  char v4 = [(LPPlayButtonControl *)self isEnabled];
  double v5 = 1.0;
  if ((v4 & 1) == 0) {
    +[LPTheme disabledButtonOpacity];
  }
  [(UIImageView *)imageView _lp_setOpacity:v5];

  [(UIView *)self _lp_setNeedsLayout];
}

- (id)playable
{
  return 0;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (BOOL)isIndeterminate
{
  return self->_indeterminate;
}

- (float)progress
{
  return self->_progress;
}

- (void)setProgress:(float)a3
{
  self->_double progress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_highlightRecognizer, 0);
  objc_storeStrong((id *)&self->_highlightLayer, 0);
  objc_storeStrong((id *)&self->_outerProgressLayer, 0);
  objc_storeStrong((id *)&self->_innerProgressLayer, 0);
  objc_storeStrong((id *)&self->_borderLayer, 0);
  objc_storeStrong((id *)&self->_theme, 0);

  objc_storeStrong((id *)&self->_style, 0);
}

@end