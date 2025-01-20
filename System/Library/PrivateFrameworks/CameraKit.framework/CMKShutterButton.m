@interface CMKShutterButton
+ (id)shutterButton;
+ (id)shutterButtonWithDesiredSpec:(CMKShutterButtonSpec)a3;
+ (id)smallShutterButton;
+ (id)tinyShutterButton;
- (BOOL)_isStopMode:(int64_t)a3;
- (BOOL)_shouldUseImageViewForMode:(int64_t)a3;
- (BOOL)_shouldUseTimelapseOuterViewForMode:(int64_t)a3;
- (BOOL)isPulsing;
- (BOOL)isSpinning;
- (BOOL)showDisabled;
- (CGSize)_sizeForMode:(int64_t)a3;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CMKShutterButton)initWithCoder:(id)a3;
- (CMKShutterButton)initWithFrame:(CGRect)a3;
- (CMKShutterButtonSpec)spec;
- (UIActivityIndicatorView)_progressActivityIndicatorView;
- (UIImageView)_outerImageView;
- (UIView)_innerView;
- (UIView)_outerView;
- (double)_borderWidthForMode:(int64_t)a3;
- (double)_cornerRadiusForMode:(int64_t)a3;
- (double)_innerCircleDiameter;
- (id)_colorForMode:(int64_t)a3;
- (id)_outerImageForMode:(int64_t)a3;
- (int64_t)buttonMode;
- (void)_commonCMKShutterButtonInitialization;
- (void)_performHighlightAnimation;
- (void)_performModeSwitchAnimationFromMode:(int64_t)a3 toMode:(int64_t)a4 animated:(BOOL)a5;
- (void)_setSpec:(CMKShutterButtonSpec)a3;
- (void)_updateOuterAndInnerLayers;
- (void)_updateSpinningAnimations;
- (void)layoutSubviews;
- (void)setButtonMode:(int64_t)a3;
- (void)setButtonMode:(int64_t)a3 animated:(BOOL)a4;
- (void)setHighlighted:(BOOL)a3;
- (void)setPulsing:(BOOL)a3;
- (void)setShowDisabled:(BOOL)a3;
- (void)setSpinning:(BOOL)a3;
@end

@implementation CMKShutterButton

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__progressActivityIndicatorView, 0);
  objc_storeStrong((id *)&self->__innerView, 0);
  objc_storeStrong((id *)&self->__outerImageView, 0);
  objc_storeStrong((id *)&self->__outerView, 0);
}

- (UIActivityIndicatorView)_progressActivityIndicatorView
{
  return self->__progressActivityIndicatorView;
}

- (UIView)_innerView
{
  return self->__innerView;
}

- (UIImageView)_outerImageView
{
  return self->__outerImageView;
}

- (UIView)_outerView
{
  return self->__outerView;
}

- (BOOL)showDisabled
{
  return self->_showDisabled;
}

- (BOOL)isSpinning
{
  return self->_spinning;
}

- (BOOL)isPulsing
{
  return self->_pulsing;
}

- (CMKShutterButtonSpec)spec
{
  double outerRingDiameter = self->_spec.outerRingDiameter;
  double outerRingStrokeWidth = self->_spec.outerRingStrokeWidth;
  double stopSquareSideLength = self->_spec.stopSquareSideLength;
  double stopSquareCornerRadius = self->_spec.stopSquareCornerRadius;
  result.double stopSquareCornerRadius = stopSquareCornerRadius;
  result.double stopSquareSideLength = stopSquareSideLength;
  result.double outerRingStrokeWidth = outerRingStrokeWidth;
  result.double outerRingDiameter = outerRingDiameter;
  return result;
}

- (int64_t)buttonMode
{
  return self->_buttonMode;
}

- (void)_updateSpinningAnimations
{
  progressActivityIndicatorView = self->__progressActivityIndicatorView;
  if (!progressActivityIndicatorView)
  {
    v4 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x263F1C3D8]) initWithActivityIndicatorStyle:101];
    v5 = self->__progressActivityIndicatorView;
    self->__progressActivityIndicatorView = v4;

    v6 = [MEMORY[0x263F1C550] whiteColor];
    [(UIActivityIndicatorView *)self->__progressActivityIndicatorView setColor:v6];

    [(UIActivityIndicatorView *)self->__progressActivityIndicatorView setAnimationDuration:1.0];
    -[UIActivityIndicatorView sizeThatFits:](self->__progressActivityIndicatorView, "sizeThatFits:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
    [(CMKShutterButton *)self bounds];
    UIRectCenteredIntegralRectScale();
    [(UIActivityIndicatorView *)self->__progressActivityIndicatorView setFrame:0];
    progressActivityIndicatorView = self->__progressActivityIndicatorView;
  }
  [(CMKShutterButton *)self insertSubview:progressActivityIndicatorView belowSubview:self->__innerView];
  if (self->_spinning)
  {
    [(UIView *)self->__innerView setAlpha:0.0];
    [(UIActivityIndicatorView *)self->__progressActivityIndicatorView setAlpha:1.0];
    v7 = self->__progressActivityIndicatorView;
    [(UIActivityIndicatorView *)v7 startAnimating];
  }
  else
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __45__CMKShutterButton__updateSpinningAnimations__block_invoke;
    v9[3] = &unk_264301C80;
    v9[4] = self;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __45__CMKShutterButton__updateSpinningAnimations__block_invoke_2;
    v8[3] = &unk_264301CA8;
    v8[4] = self;
    [MEMORY[0x263F1CB60] animateWithDuration:327680 delay:v9 options:v8 animations:0.3 completion:0.0];
  }
}

uint64_t __45__CMKShutterButton__updateSpinningAnimations__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 776) setAlpha:1.0];
}

uint64_t __45__CMKShutterButton__updateSpinningAnimations__block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 784) removeFromSuperview];
  v2 = *(void **)(*(void *)(a1 + 32) + 784);
  return [v2 stopAnimating];
}

- (void)_performModeSwitchAnimationFromMode:(int64_t)a3 toMode:(int64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  v9 = [(CMKShutterButton *)self _innerView];
  id v116 = [v9 layer];

  v10 = [(CMKShutterButton *)self _outerView];
  v115 = [v10 layer];

  v11 = [(CMKShutterButton *)self _outerImageView];
  v114 = [v11 layer];

  id v12 = [(CMKShutterButton *)self _colorForMode:a4];
  v13 = [v12 CGColor];

  BOOL v14 = [(CMKShutterButton *)self _shouldUseImageViewForMode:a4];
  BOOL v15 = [(CMKShutterButton *)self _shouldUseTimelapseOuterViewForMode:a4];
  if (v5)
  {
    v16 = [v116 presentationLayer];
    BOOL v109 = v15;
    BOOL v111 = v14;
    BOOL v104 = v5;
    int64_t v102 = a3;
    if (v16)
    {
      v17 = [v116 presentationLayer];
      v18 = [v17 valueForKeyPath:@"backgroundColor"];
    }
    else
    {
      v18 = [v116 valueForKeyPath:@"backgroundColor"];
    }
    v101 = v18;

    v19 = [MEMORY[0x263F15760] animationWithKeyPath:@"backgroundColor"];
    [v19 setFromValue:v18];
    [v19 setToValue:v13];
    UIAnimationDragCoefficient();
    [v19 setDuration:v20 * 0.25];
    v107 = v13;
    uint64_t v21 = *MEMORY[0x263F15EB8];
    v22 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
    [v19 setTimingFunction:v22];

    uint64_t v23 = *MEMORY[0x263F15AA8];
    [v19 setFillMode:*MEMORY[0x263F15AA8]];
    [v116 addAnimation:v19 forKey:@"backgroundColorAnimation"];
    v24 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
    v25 = NSNumber;
    [(UIView *)self->__outerView alpha];
    v26 = objc_msgSend(v25, "numberWithDouble:");
    [v24 setFromValue:v26];

    UIAnimationDragCoefficient();
    [v24 setDuration:v27 * 0.25];
    v28 = [MEMORY[0x263F15808] functionWithName:v21];
    [v24 setTimingFunction:v28];

    [v24 setFillMode:v23];
    [v115 addAnimation:v24 forKey:@"opacity"];
    v29 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
    v30 = NSNumber;
    [(UIImageView *)self->__outerImageView alpha];
    v31 = objc_msgSend(v30, "numberWithDouble:");
    [v29 setFromValue:v31];

    UIAnimationDragCoefficient();
    [v29 setDuration:v32 * 0.25];
    v33 = [MEMORY[0x263F15808] functionWithName:v21];
    [v29 setTimingFunction:v33];

    [v29 setFillMode:v23];
    [v114 addAnimation:v29 forKey:@"opacity"];
    v34 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
    UIAnimationDragCoefficient();
    [v34 setDuration:v35 * 0.25];
    v36 = [MEMORY[0x263F15808] functionWithName:v21];
    [v34 setTimingFunction:v36];

    v13 = v107;
    [v34 setFillMode:v23];
    [0 addAnimation:v34 forKey:@"opacity"];

    BOOL v15 = v109;
    BOOL v14 = v111;
    BOOL v5 = v104;
    a3 = v102;
  }
  if (-[CMKShutterButton _isStopMode:](self, "_isStopMode:", a4, v101))
  {
    [(CMKShutterButton *)self _sizeForMode:a4];
    v37 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:");
    if (v5)
    {
      LODWORD(v38) = 1041812769;
      LODWORD(v39) = 1043018044;
      LODWORD(v40) = 1044413908;
      LODWORD(v41) = 1.0;
      v42 = [MEMORY[0x263F15808] functionWithControlPoints:v38 :v39 :v40 :v41];
      v43 = [v116 presentationLayer];
      BOOL v110 = v15;
      BOOL v112 = v14;
      if (v43)
      {
        v44 = [v116 presentationLayer];
        v45 = [v44 valueForKeyPath:@"bounds.size"];
      }
      else
      {
        v45 = [v116 valueForKeyPath:@"bounds.size"];
      }

      v58 = [MEMORY[0x263F15760] animationWithKeyPath:@"bounds.size"];
      [v58 setFromValue:v45];
      [v58 setToValue:v37];
      UIAnimationDragCoefficient();
      [v58 setDuration:v59 * 0.265];
      [v58 setTimingFunction:v42];
      uint64_t v60 = *MEMORY[0x263F15AA8];
      [v58 setFillMode:*MEMORY[0x263F15AA8]];
      v61 = [v116 presentationLayer];
      if (v61)
      {
        v62 = [v116 presentationLayer];
        v63 = [v62 valueForKeyPath:@"cornerRadius"];
      }
      else
      {
        v63 = [v116 valueForKeyPath:@"cornerRadius"];
      }

      v64 = [MEMORY[0x263F15760] animationWithKeyPath:@"cornerRadius"];
      [v64 setFromValue:v63];
      [v64 setToValue:&unk_26C91C920];
      UIAnimationDragCoefficient();
      [v64 setDuration:v65 * 0.265];
      [v64 setTimingFunction:v42];
      [v64 setFillMode:v60];
      v66 = [v116 presentationLayer];
      if (v66)
      {
        [v116 presentationLayer];
        v105 = v58;
        uint64_t v67 = v60;
        v68 = v42;
        v69 = v37;
        v70 = v63;
        v71 = v45;
        v73 = v72 = v13;
        v74 = [v73 valueForKeyPath:@"transform.scale.xy"];

        v13 = v72;
        v45 = v71;
        v63 = v70;
        v37 = v69;
        v42 = v68;
        uint64_t v60 = v67;
        v58 = v105;
      }
      else
      {
        v74 = [v116 valueForKeyPath:@"transform.scale.xy"];
      }

      v75 = [MEMORY[0x263F15760] animationWithKeyPath:@"transform.scale.xy"];
      [v75 setFromValue:v74];
      [v75 setToValue:&unk_26C91C930];
      UIAnimationDragCoefficient();
      [v75 setDuration:v76 * 0.36];
      [v116 convertTime:0 fromLayer:CACurrentMediaTime()];
      double v78 = v77;
      UIAnimationDragCoefficient();
      [v75 setBeginTime:v78 + v79 * 0.085];
      [v75 setFillMode:v60];
      [v75 setTimingFunction:v42];
      [v116 addAnimation:v58 forKey:@"sizeAnimation"];
      [v116 addAnimation:v64 forKey:@"cornerRadiusAnimation"];
      [v116 addAnimation:v75 forKey:@"transformAnimation"];

      v57 = v116;
      BOOL v15 = v110;
      BOOL v14 = v112;
    }
    else
    {
      [v116 removeAllAnimations];
      v57 = v116;
    }
    [v57 setValue:v37 forKeyPath:@"bounds.size"];
    [v116 setValue:&unk_26C91C920 forKeyPath:@"cornerRadius"];
    [v116 setValue:&unk_26C91C930 forKeyPath:@"transform.scale.xy"];
  }
  else
  {
    if (![(CMKShutterButton *)self _isStopMode:a3]) {
      goto LABEL_35;
    }
    [(CMKShutterButton *)self _sizeForMode:a4];
    double v47 = v46;
    v37 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:");
    v48 = [NSNumber numberWithDouble:ceil(v47 * 0.5)];
    if (v5)
    {
      LODWORD(v49) = 1041812769;
      LODWORD(v50) = 1043018044;
      LODWORD(v51) = 1044413908;
      LODWORD(v52) = 1.0;
      v53 = [MEMORY[0x263F15808] functionWithControlPoints:v49 :v50 :v51 :v52];
      v54 = [v116 presentationLayer];
      BOOL v113 = v14;
      if (v54)
      {
        v55 = [v116 presentationLayer];
        uint64_t v56 = [v55 valueForKeyPath:@"bounds.size"];
      }
      else
      {
        uint64_t v56 = [v116 valueForKeyPath:@"bounds.size"];
      }

      unint64_t v80 = 0x263F15000uLL;
      v81 = [MEMORY[0x263F15760] animationWithKeyPath:@"bounds.size"];
      [v81 setFromValue:v56];
      [v81 setToValue:v37];
      UIAnimationDragCoefficient();
      [v81 setDuration:v82 * 0.49];
      [v81 setTimingFunction:v53];
      uint64_t v106 = *MEMORY[0x263F15AA8];
      objc_msgSend(v81, "setFillMode:");
      v83 = [v116 presentationLayer];
      v108 = v13;
      v103 = (void *)v56;
      if (v83)
      {
        v84 = [v116 presentationLayer];
        v85 = [v84 valueForKeyPath:@"cornerRadius"];
      }
      else
      {
        v85 = [v116 valueForKeyPath:@"cornerRadius"];
      }

      v86 = [MEMORY[0x263F15760] animationWithKeyPath:@"cornerRadius"];
      [v86 setFromValue:v85];
      [v86 setToValue:v48];
      UIAnimationDragCoefficient();
      [v86 setDuration:v87 * 0.395];
      [v86 setTimingFunction:v53];
      [v86 setFillMode:v106];
      v88 = [v116 presentationLayer];
      if (v88)
      {
        [v116 presentationLayer];
        v89 = v48;
        v90 = v53;
        v91 = v85;
        v93 = BOOL v92 = v15;
        v94 = [v93 valueForKeyPath:@"transform.scale.xy"];

        BOOL v15 = v92;
        v85 = v91;
        v53 = v90;
        v48 = v89;
        unint64_t v80 = 0x263F15000;
      }
      else
      {
        v94 = [v116 valueForKeyPath:@"transform.scale.xy"];
      }

      v95 = [*(id *)(v80 + 1888) animationWithKeyPath:@"transform.scale.xy"];
      [v95 setFromValue:v94];
      [v95 setToValue:&unk_26C91C930];
      UIAnimationDragCoefficient();
      [v95 setDuration:v96 * 0.49];
      [v95 setFillMode:v106];
      [v95 setTimingFunction:v53];
      [v116 addAnimation:v81 forKey:@"sizeAnimation"];
      [v116 addAnimation:v86 forKey:@"cornerRadiusAnimation"];
      [v116 addAnimation:v95 forKey:@"transformAnimation"];

      v13 = v108;
      BOOL v14 = v113;
    }
    else
    {
      [v116 removeAllAnimations];
    }
    [v116 setValue:v37 forKeyPath:@"bounds.size"];
    [v116 setValue:v48 forKeyPath:@"cornerRadius"];
    [v116 setValue:&unk_26C91C930 forKeyPath:@"transform.scale.xy"];
  }
LABEL_35:
  [v116 setValue:v13 forKeyPath:@"backgroundColor"];
  float v98 = 1.0;
  if (v14 || v15) {
    *(float *)&double v97 = 0.0;
  }
  else {
    *(float *)&double v97 = 1.0;
  }
  [v115 setOpacity:v97];
  if (v15) {
    *(float *)&double v99 = 0.0;
  }
  else {
    *(float *)&double v99 = 1.0;
  }
  if (!v15) {
    float v98 = 0.0;
  }
  [v114 setOpacity:v99];
  *(float *)&double v100 = v98;
  [0 setOpacity:v100];
}

- (void)_performHighlightAnimation
{
  int v3 = [(CMKShutterButton *)self isHighlighted];
  v4 = [(CMKShutterButton *)self _innerView];
  id v15 = [v4 layer];

  BOOL v5 = [v15 valueForKeyPath:@"opacity"];
  if (v3)
  {
    LODWORD(v6) = 1045220557;
    [v15 setOpacity:v6];
  }
  else
  {
    v7 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
    [v7 setFromValue:v5];
    UIAnimationDragCoefficient();
    [v7 setDuration:v8 * 0.49];
    LODWORD(v9) = 1041812769;
    LODWORD(v10) = 1043018044;
    LODWORD(v11) = 1044413908;
    LODWORD(v12) = 1.0;
    v13 = [MEMORY[0x263F15808] functionWithControlPoints:v9 :v10 :v11 :v12];
    [v7 setTimingFunction:v13];

    [v7 setFillMode:*MEMORY[0x263F15AA8]];
    [v15 addAnimation:v7 forKey:@"transformAnimation"];
    LODWORD(v14) = 1.0;
    [v15 setOpacity:v14];
  }
}

- (void)setShowDisabled:(BOOL)a3
{
  if (self->_showDisabled != a3)
  {
    BOOL v3 = a3;
    self->_showDisabled = a3;
    id v11 = [(CMKShutterButton *)self _innerView];
    BOOL v5 = [v11 layer];
    double v6 = [(CMKShutterButton *)self _outerView];
    v7 = [v6 layer];
    if (v3) {
      float v9 = 0.4;
    }
    else {
      float v9 = 1.0;
    }
    *(float *)&double v8 = v9;
    [v5 setOpacity:v8];
    *(float *)&double v10 = v9;
    [v7 setOpacity:v10];
  }
}

- (void)_updateOuterAndInnerLayers
{
  if ([(CMKShutterButton *)self _shouldUseImageViewForMode:self->_buttonMode])
  {
    outerImageView = self->__outerImageView;
    if (!outerImageView)
    {
      id v4 = objc_alloc(MEMORY[0x263F1C6D0]);
      [(UIView *)self->__outerView frame];
      BOOL v5 = (UIImageView *)objc_msgSend(v4, "initWithFrame:");
      double v6 = self->__outerImageView;
      self->__outerImageView = v5;

      [(CMKShutterButton *)self insertSubview:self->__outerImageView belowSubview:self->__outerView];
      outerImageView = self->__outerImageView;
    }
    v7 = [(CMKShutterButton *)self _outerImageForMode:self->_buttonMode];
    [(UIImageView *)outerImageView setImage:v7];
  }
  id v13 = [(CMKShutterButton *)self _outerView];
  double v8 = [v13 layer];
  [(CMKShutterButton *)self _borderWidthForMode:self->_buttonMode];
  objc_msgSend(v8, "setBorderWidth:");
  id v9 = [MEMORY[0x263F1C550] whiteColor];
  objc_msgSend(v8, "setBorderColor:", objc_msgSend(v9, "CGColor"));

  double v10 = [(CMKShutterButton *)self _innerView];
  id v11 = [v10 layer];
  id v12 = [(CMKShutterButton *)self _colorForMode:self->_buttonMode];
  objc_msgSend(v11, "setBackgroundColor:", objc_msgSend(v12, "CGColor"));
}

- (BOOL)_shouldUseTimelapseOuterViewForMode:(int64_t)a3
{
  return ((a3 - 3) & 0xFFFFFFFFFFFFFFFBLL) == 0;
}

- (BOOL)_shouldUseImageViewForMode:(int64_t)a3
{
  return ((a3 - 2) & 0xFFFFFFFFFFFFFFFBLL) == 0;
}

- (BOOL)_isStopMode:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFCLL) == 4;
}

- (id)_outerImageForMode:(int64_t)a3
{
  return 0;
}

- (double)_borderWidthForMode:(int64_t)a3
{
  double result = 0.0;
  if ((unint64_t)a3 <= 7) {
    return self->_spec.outerRingStrokeWidth;
  }
  return result;
}

- (double)_cornerRadiusForMode:(int64_t)a3
{
  if ((unint64_t)(a3 - 4) < 4) {
    return self->_spec.stopSquareCornerRadius;
  }
  if ((unint64_t)a3 > 3) {
    return 0.0;
  }
  [(CMKShutterButton *)self _innerCircleDiameter];
  return ceil(v3 * 0.5);
}

- (CGSize)_sizeForMode:(int64_t)a3
{
  if ((unint64_t)(a3 - 4) < 4)
  {
    double stopSquareSideLength = self->_spec.stopSquareSideLength;
    double v3 = stopSquareSideLength;
  }
  else if ((unint64_t)a3 > 3)
  {
    double v3 = *MEMORY[0x263F001B0];
    double stopSquareSideLength = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  else
  {
    [(CMKShutterButton *)self _innerCircleDiameter];
    double stopSquareSideLength = v3;
  }
  result.height = stopSquareSideLength;
  result.width = v3;
  return result;
}

- (id)_colorForMode:(int64_t)a3
{
  if ((unint64_t)a3 > 7)
  {
    BOOL v5 = 0;
  }
  else
  {
    if (((1 << a3) & 0xEE) != 0) {
      objc_msgSend(MEMORY[0x263F1C550], "colorWithRed:green:blue:alpha:", 0.961, 0.2, 0.2, 1.0, v3);
    }
    else {
    BOOL v5 = objc_msgSend(MEMORY[0x263F1C550], "whiteColor", v3);
    }
  }
  return v5;
}

- (double)_innerCircleDiameter
{
  [(CMKShutterButton *)self spec];
  return v2 + v3 * -2.0 + -4.0;
}

- (void)_setSpec:(CMKShutterButtonSpec)a3
{
  self->_spec = a3;
  [(CMKShutterButton *)self _updateOuterAndInnerLayers];
}

- (void)setSpinning:(BOOL)a3
{
  if (self->_spinning != a3)
  {
    self->_spinning = a3;
    [(CMKShutterButton *)self _updateSpinningAnimations];
  }
}

- (void)setPulsing:(BOOL)a3
{
  if (self->_pulsing != a3) {
    self->_pulsing = a3;
  }
}

- (void)setButtonMode:(int64_t)a3 animated:(BOOL)a4
{
  int64_t buttonMode = self->_buttonMode;
  if (buttonMode != a3)
  {
    BOOL v5 = a4;
    self->_int64_t buttonMode = a3;
    [(CMKShutterButton *)self _updateOuterAndInnerLayers];
    int64_t v7 = self->_buttonMode;
    [(CMKShutterButton *)self _performModeSwitchAnimationFromMode:buttonMode toMode:v7 animated:v5];
  }
}

- (void)setButtonMode:(int64_t)a3
{
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(CMKShutterButton *)self isHighlighted];
  v6.receiver = self;
  v6.super_class = (Class)CMKShutterButton;
  [(CMKShutterButton *)&v6 setHighlighted:v3];
  if (v5 != v3) {
    [(CMKShutterButton *)self _performHighlightAnimation];
  }
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)CMKShutterButton;
  [(CMKShutterButton *)&v13 layoutSubviews];
  [(CMKShutterButton *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIImageView setFrame:](self->__outerImageView, "setFrame:");
  -[UIView setFrame:](self->__outerView, "setFrame:", v4, v6, v8, v10);
  id v11 = [(UIView *)self->__outerView layer];
  v14.origin.x = v4;
  v14.origin.y = v6;
  v14.size.width = v8;
  v14.size.height = v10;
  [v11 setCornerRadius:ceil(CGRectGetWidth(v14) * 0.5)];

  [(CMKShutterButton *)self _sizeForMode:self->_buttonMode];
  UIRectCenteredIntegralRectScale();
  [(UIView *)self->__innerView setFrame:0];
  id v12 = [(UIView *)self->__innerView layer];
  [(CMKShutterButton *)self _cornerRadiusForMode:self->_buttonMode];
  objc_msgSend(v12, "setCornerRadius:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double outerRingDiameter = self->_spec.outerRingDiameter;
  double v4 = outerRingDiameter;
  result.height = v4;
  result.width = outerRingDiameter;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double outerRingDiameter = self->_spec.outerRingDiameter;
  double v3 = outerRingDiameter;
  result.height = v3;
  result.width = outerRingDiameter;
  return result;
}

- (CMKShutterButton)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CMKShutterButton;
  double v3 = [(CMKShutterButton *)&v7 initWithCoder:a3];
  double v4 = v3;
  if (v3)
  {
    [(CMKShutterButton *)v3 _commonCMKShutterButtonInitialization];
    double v5 = v4;
  }

  return v4;
}

- (CMKShutterButton)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CMKShutterButton;
  double v3 = -[CMKShutterButton initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    [(CMKShutterButton *)v3 _commonCMKShutterButtonInitialization];
    double v5 = v4;
  }

  return v4;
}

- (void)_commonCMKShutterButtonInitialization
{
  self->_int64_t buttonMode = 0;
  self->_spec = *(CMKShutterButtonSpec *)ymmword_218108B60;
  id v3 = objc_alloc(MEMORY[0x263F1CB60]);
  double v4 = *MEMORY[0x263F001A8];
  double v5 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 24);
  double v8 = (UIView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], v5, v6, v7);
  outerView = self->__outerView;
  self->__outerView = v8;

  double v10 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", v4, v5, v6, v7);
  innerView = self->__innerView;
  self->__innerView = v10;

  [(UIView *)self->__outerView setUserInteractionEnabled:0];
  [(UIView *)self->__innerView setUserInteractionEnabled:0];
  [(CMKShutterButton *)self addSubview:self->__outerView];
  [(CMKShutterButton *)self addSubview:self->__innerView];
  [(CMKShutterButton *)self setAdjustsImageWhenHighlighted:0];
  [(CMKShutterButton *)self setAdjustsImageWhenDisabled:0];
  [(CMKShutterButton *)self setShowsTouchWhenHighlighted:0];
  [(CMKShutterButton *)self _updateOuterAndInnerLayers];
}

+ (id)shutterButtonWithDesiredSpec:(CMKShutterButtonSpec)a3
{
  double stopSquareCornerRadius = a3.stopSquareCornerRadius;
  double stopSquareSideLength = a3.stopSquareSideLength;
  double outerRingStrokeWidth = a3.outerRingStrokeWidth;
  double outerRingDiameter = a3.outerRingDiameter;
  double v7 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  objc_msgSend(v7, "_setSpec:", outerRingDiameter, outerRingStrokeWidth, stopSquareSideLength, stopSquareCornerRadius);
  return v7;
}

+ (id)tinyShutterButton
{
  double v2 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  objc_msgSend(v2, "_setSpec:", 28.0, 5.0, 11.0, 2.0);
  return v2;
}

+ (id)smallShutterButton
{
  double v2 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  objc_msgSend(v2, "_setSpec:", 47.0, 5.0, 19.0, 4.0);
  return v2;
}

+ (id)shutterButton
{
  double v2 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  objc_msgSend(v2, "_setSpec:", 66.0, 6.0, 28.0, 4.0);
  return v2;
}

@end