@interface CSMagSafeAccessoryTrayView
- (BOOL)clearColorAnimationNeeded;
- (CABackdropLayer)averageColorBackdropLayer;
- (CABackdropLayer)backgroundBackdropLayer;
- (CABackdropLayer)backgroundRadiusBackdropLayer;
- (CABackdropLayer)trackRingBlurBackdropLayer;
- (CALayer)splashRing1;
- (CALayer)splashRing2;
- (CALayer)splashRing3;
- (CALayer)splashRing4;
- (CSMagSafeAccessoryTrayView)initWithFrame:(CGRect)a3;
- (CSMagSafeAccessoryTrayView)initWithTrayColor:(id)a3;
- (CSRingLayer)trackRing;
- (CSRingLayer)trackRingBlurLayer;
- (double)_trackRingLineWidthAnimationOffset;
- (double)animationDurationBeforeDismissal;
- (void)_dismissAnimation;
- (void)_presentAnimation;
- (void)_runAnimationWithType:(unint64_t)a3;
- (void)layoutSubviews;
- (void)performAnimation:(unint64_t)a3 completionHandler:(id)a4;
- (void)setAverageColorBackdropLayer:(id)a3;
- (void)setBackgroundBackdropLayer:(id)a3;
- (void)setBackgroundRadiusBackdropLayer:(id)a3;
- (void)setClearColorAnimationNeeded:(BOOL)a3;
- (void)setSplashRing1:(id)a3;
- (void)setSplashRing2:(id)a3;
- (void)setSplashRing3:(id)a3;
- (void)setSplashRing4:(id)a3;
- (void)setTrackRing:(id)a3;
- (void)setTrackRingBlurBackdropLayer:(id)a3;
- (void)setTrackRingBlurLayer:(id)a3;
@end

@implementation CSMagSafeAccessoryTrayView

- (CSMagSafeAccessoryTrayView)initWithTrayColor:(id)a3
{
  v81[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v80.receiver = self;
  v80.super_class = (Class)CSMagSafeAccessoryTrayView;
  v5 = -[CSMagSafeAccessoryView initWithFrame:](&v80, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v6 = v5;
  if (v5)
  {
    v7 = [(CSMagSafeAccessoryTrayView *)v5 layer];
    [v7 setAllowsGroupBlending:0];

    BOOL v8 = [(CSMagSafeAccessoryView *)v6 isReduceTransparencyEnabled];
    v9 = (uint64_t *)MEMORY[0x1E4F3A2B8];
    id v79 = v4;
    if (v8)
    {
      uint64_t v10 = [MEMORY[0x1E4F39B40] layer];
      averageColorBackdropLayer = v6->_averageColorBackdropLayer;
      v6->_averageColorBackdropLayer = (CABackdropLayer *)v10;

      [(CABackdropLayer *)v6->_averageColorBackdropLayer setOpacity:0.0];
      v12 = v6->_averageColorBackdropLayer;
      v13 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F39FD0]];
      v81[0] = v13;
      v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:1];
      [(CABackdropLayer *)v12 setFilters:v14];

      [(CABackdropLayer *)v6->_averageColorBackdropLayer setScale:100.0];
      [(CABackdropLayer *)v6->_averageColorBackdropLayer setAllowsGroupOpacity:1];
      [(CABackdropLayer *)v6->_averageColorBackdropLayer setAllowsGroupBlending:1];
      [(CABackdropLayer *)v6->_averageColorBackdropLayer setAllowsEdgeAntialiasing:1];
    }
    else
    {
      uint64_t v15 = [MEMORY[0x1E4F39B40] backdropLayerWithGaussianBlurRadius:0.0 brightnessAmount:0.0 saturationAmount:1.0];
      backgroundBackdropLayer = v6->_backgroundBackdropLayer;
      v6->_backgroundBackdropLayer = (CABackdropLayer *)v15;

      v17 = v6->_backgroundBackdropLayer;
      v18 = [MEMORY[0x1E4F39BC0] filterWithType:*v9];
      [(CABackdropLayer *)v17 setCompositingFilter:v18];

      LODWORD(v19) = 1.0;
      [(CABackdropLayer *)v6->_backgroundBackdropLayer setOpacity:v19];
    }
    if ([(CSMagSafeAccessoryView *)v6 isReduceMotionEnabled])
    {
      uint64_t v20 = [MEMORY[0x1E4F39B40] backdropLayerWithGaussianBlurRadius:60.0 brightnessAmount:0.0 saturationAmount:1.0];
      backgroundRadiusBackdropLayer = v6->_backgroundRadiusBackdropLayer;
      v6->_backgroundRadiusBackdropLayer = (CABackdropLayer *)v20;

      v22 = v6->_backgroundRadiusBackdropLayer;
      uint64_t v23 = *v9;
      v24 = [MEMORY[0x1E4F39BC0] filterWithType:v23];
      [(CABackdropLayer *)v22 setCompositingFilter:v24];

      uint64_t v25 = v23;
      [(CABackdropLayer *)v6->_backgroundRadiusBackdropLayer setOpacity:0.0];
    }
    else
    {
      uint64_t v25 = *v9;
    }
    v26 = [(CSMagSafeAccessoryView *)v6 configuration];
    v27 = [v26 ring];

    [v27 splashRingDiameter];
    double v29 = v28 * 1.2 * 0.5;
    double v30 = v28 * 2.1 * 0.5;
    uint64_t v31 = *MEMORY[0x1E4F3A2E8];
    uint64_t v32 = [MEMORY[0x1E4F39BE8] ringLayerWithBlendMode:*MEMORY[0x1E4F3A2E8] cornerRadius:v28 * 0.5 borderWidth:0.0];
    splashRing1 = v6->_splashRing1;
    v6->_splashRing1 = (CALayer *)v32;

    uint64_t v34 = [MEMORY[0x1E4F39BE8] ringLayerWithBlendMode:v31 cornerRadius:v29 borderWidth:0.0];
    splashRing2 = v6->_splashRing2;
    v6->_splashRing2 = (CALayer *)v34;

    uint64_t v36 = [MEMORY[0x1E4F39BE8] ringLayerWithBlendMode:v25 cornerRadius:v30 borderWidth:0.0];
    splashRing3 = v6->_splashRing3;
    v6->_splashRing3 = (CALayer *)v36;

    uint64_t v38 = [MEMORY[0x1E4F39BE8] ringLayerWithBlendMode:v25 cornerRadius:v30 borderWidth:0.0];
    splashRing4 = v6->_splashRing4;
    v6->_splashRing4 = (CALayer *)v38;

    [v27 ringDiameter];
    double v41 = v40;
    [(CSMagSafeAccessoryTrayView *)v6 _trackRingLineWidthAnimationOffset];
    double v43 = v41 + v42;
    [v27 lineWidth];
    double v45 = v44;
    [(CSMagSafeAccessoryTrayView *)v6 _trackRingLineWidthAnimationOffset];
    uint64_t v47 = +[CSRingLayer ringLayerWithBlendMode:v25 diameter:v43 lineWidth:v45 + v46 brightnessAmount:0.0 saturationAmount:1.25];
    trackRing = v6->_trackRing;
    v6->_trackRing = (CSRingLayer *)v47;

    [(CSRingLayer *)v6->_trackRing setAllowsGroupOpacity:0];
    [(CSRingLayer *)v6->_trackRing setAllowsGroupBlending:1];
    id v49 = [MEMORY[0x1E4F428B8] clearColor];

    if (!v4 || v49 == v4)
    {
      id v51 = [MEMORY[0x1E4F428B8] systemWhiteColor];
      uint64_t v50 = [v51 CGColor];

      v6->_clearColorAnimationNeeded = 1;
    }
    else
    {
      v6->_clearColorAnimationNeeded = 0;
      uint64_t v50 = [v4 CGColor];
    }
    [(CALayer *)v6->_splashRing1 setBackgroundColor:v50];
    [(CALayer *)v6->_splashRing2 setBackgroundColor:v50];
    [(CALayer *)v6->_splashRing3 setBackgroundColor:v50];
    [(CALayer *)v6->_splashRing4 setBackgroundColor:v50];
    [(CSRingLayer *)v6->_trackRing setStrokeColor:v50];
    if ([(CSMagSafeAccessoryView *)v6 isReduceTransparencyEnabled])
    {
      v52 = [(CSMagSafeAccessoryTrayView *)v6 layer];
      [v52 addSublayer:v6->_averageColorBackdropLayer];
    }
    v53 = [(CSMagSafeAccessoryTrayView *)v6 layer];
    [v53 addSublayer:v6->_backgroundBackdropLayer];

    BOOL v54 = [(CSMagSafeAccessoryView *)v6 isReduceMotionEnabled];
    v55 = [(CSMagSafeAccessoryTrayView *)v6 layer];
    v56 = v55;
    if (v54)
    {
      [v55 insertSublayer:v6->_backgroundRadiusBackdropLayer below:v6->_backgroundBackdropLayer];
    }
    else
    {
      [v55 addSublayer:v6->_splashRing1];

      v56 = [(CSMagSafeAccessoryTrayView *)v6 layer];
      [v56 addSublayer:v6->_splashRing2];
    }

    v57 = [(CSMagSafeAccessoryTrayView *)v6 layer];
    [v57 addSublayer:v6->_splashRing3];

    v58 = [(CSMagSafeAccessoryTrayView *)v6 layer];
    [v58 addSublayer:v6->_splashRing4];

    v59 = [(CSMagSafeAccessoryTrayView *)v6 layer];
    [v59 addSublayer:v6->_trackRing];

    if (v6->_clearColorAnimationNeeded)
    {
      uint64_t v60 = [MEMORY[0x1E4F39B40] backdropLayerWithGaussianBlurRadius:45.0 brightnessAmount:0.15 saturationAmount:1.3];
      trackRingBlurBackdropLayer = v6->_trackRingBlurBackdropLayer;
      v6->_trackRingBlurBackdropLayer = (CABackdropLayer *)v60;

      v62 = v6->_trackRingBlurBackdropLayer;
      v63 = [MEMORY[0x1E4F39BC0] filterWithType:v25];
      [(CABackdropLayer *)v62 setCompositingFilter:v63];

      v64 = [(CSMagSafeAccessoryView *)v6 configuration];
      v65 = [v64 ring];

      [v65 ringDiameter];
      double v67 = v66;
      [(CSMagSafeAccessoryTrayView *)v6 _trackRingLineWidthAnimationOffset];
      double v69 = v67 + v68;
      [v65 lineWidth];
      double v71 = v70;
      [(CSMagSafeAccessoryTrayView *)v6 _trackRingLineWidthAnimationOffset];
      uint64_t v73 = +[CSRingLayer ringLayerWithBlendMode:v25 diameter:v69 lineWidth:v71 + v72 brightnessAmount:0.1 saturationAmount:1.25];
      trackRingBlurLayer = v6->_trackRingBlurLayer;
      v6->_trackRingBlurLayer = (CSRingLayer *)v73;

      v75 = v6->_trackRingBlurLayer;
      id v76 = [MEMORY[0x1E4F428B8] whiteColor];
      -[CSRingLayer setStrokeColor:](v75, "setStrokeColor:", [v76 CGColor]);

      [(CABackdropLayer *)v6->_trackRingBlurBackdropLayer setMask:v6->_trackRingBlurLayer];
      v77 = [(CSMagSafeAccessoryTrayView *)v6 layer];
      [v77 insertSublayer:v6->_trackRingBlurBackdropLayer above:v6->_backgroundBackdropLayer];
    }
    id v4 = v79;
  }

  return v6;
}

- (CSMagSafeAccessoryTrayView)initWithFrame:(CGRect)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F428B8], "clearColor", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = [(CSMagSafeAccessoryTrayView *)self initWithTrayColor:v4];

  return v5;
}

- (void)layoutSubviews
{
  v42.receiver = self;
  v42.super_class = (Class)CSMagSafeAccessoryTrayView;
  [(CSMagSafeAccessoryView *)&v42 layoutSubviews];
  v3 = [(CSMagSafeAccessoryTrayView *)self superview];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[CSMagSafeAccessoryTrayView setFrame:](self, "setFrame:", v5, v7, v9, v11);
  v12 = [(CSMagSafeAccessoryView *)self configuration];
  v13 = [v12 ring];
  [v13 ringDiameter];
  double v41 = v14;
  [(CSMagSafeAccessoryTrayView *)self _trackRingLineWidthAnimationOffset];
  double v40 = v15;
  v16 = [(CSMagSafeAccessoryView *)self configuration];
  v17 = [v16 ring];
  [v17 ringDiameter];
  double v39 = v18;
  [(CSMagSafeAccessoryTrayView *)self _trackRingLineWidthAnimationOffset];
  uint64_t v37 = v19;

  if ([(CSMagSafeAccessoryView *)self isReduceTransparencyEnabled])
  {
    -[CABackdropLayer setBounds:](self->_averageColorBackdropLayer, "setBounds:", v5, v7, v9, v11);
    averageColorBackdropLayer = self->_averageColorBackdropLayer;
    [(CABackdropLayer *)averageColorBackdropLayer bounds];
    [(CSMagSafeAccessoryTrayView *)self bounds];
    UIRectCenteredIntegralRect();
    UIRectGetCenter();
    -[CABackdropLayer setPosition:](averageColorBackdropLayer, "setPosition:");
  }
  -[CABackdropLayer setBounds:](self->_backgroundBackdropLayer, "setBounds:", v5, v7, v9, v11, v37);
  backgroundBackdropLayer = self->_backgroundBackdropLayer;
  [(CABackdropLayer *)backgroundBackdropLayer bounds];
  [(CSMagSafeAccessoryTrayView *)self bounds];
  UIRectCenteredIntegralRect();
  UIRectGetCenter();
  -[CABackdropLayer setPosition:](backgroundBackdropLayer, "setPosition:");
  if ([(CSMagSafeAccessoryView *)self isReduceMotionEnabled])
  {
    -[CABackdropLayer setBounds:](self->_backgroundRadiusBackdropLayer, "setBounds:", v5, v7, v9, v11);
    backgroundRadiusBackdropLayer = self->_backgroundRadiusBackdropLayer;
    [(CABackdropLayer *)backgroundRadiusBackdropLayer bounds];
    [(CSMagSafeAccessoryTrayView *)self bounds];
    UIRectCenteredIntegralRect();
    UIRectGetCenter();
    -[CABackdropLayer setPosition:](backgroundRadiusBackdropLayer, "setPosition:");
  }
  double v23 = v41 + v40;
  double v24 = v39 + v38;
  if (self->_clearColorAnimationNeeded)
  {
    -[CABackdropLayer setBounds:](self->_trackRingBlurBackdropLayer, "setBounds:", 0.0, 0.0, v41 + v40, v39 + v38);
    trackRingBlurBackdropLayer = self->_trackRingBlurBackdropLayer;
    [(CABackdropLayer *)trackRingBlurBackdropLayer bounds];
    [(CSMagSafeAccessoryTrayView *)self bounds];
    UIRectCenteredIntegralRect();
    UIRectGetCenter();
    -[CABackdropLayer setPosition:](trackRingBlurBackdropLayer, "setPosition:");
    -[CSRingLayer setBounds:](self->_trackRingBlurLayer, "setBounds:", 0.0, 0.0, v23, v24);
    trackRingBlurLayer = self->_trackRingBlurLayer;
    [(CSRingLayer *)trackRingBlurLayer bounds];
    [(CABackdropLayer *)self->_trackRingBlurBackdropLayer bounds];
    UIRectCenteredIntegralRect();
    UIRectGetCenter();
    -[CSRingLayer setPosition:](trackRingBlurLayer, "setPosition:");
  }
  v27 = [(CSMagSafeAccessoryView *)self configuration];
  double v28 = [v27 ring];
  [v28 splashRingDiameter];
  double v30 = v29;

  -[CALayer setBounds:](self->_splashRing1, "setBounds:", 0.0, 0.0, v30, v30);
  splashRing1 = self->_splashRing1;
  [(CALayer *)splashRing1 bounds];
  [(CSMagSafeAccessoryTrayView *)self bounds];
  UIRectCenteredIntegralRect();
  UIRectGetCenter();
  -[CALayer setPosition:](splashRing1, "setPosition:");
  -[CALayer setBounds:](self->_splashRing2, "setBounds:", 0.0, 0.0, v30 * 1.2, v30 * 1.2);
  splashRing2 = self->_splashRing2;
  [(CALayer *)splashRing2 bounds];
  [(CSMagSafeAccessoryTrayView *)self bounds];
  UIRectCenteredIntegralRect();
  UIRectGetCenter();
  -[CALayer setPosition:](splashRing2, "setPosition:");
  double v33 = v30 * 2.1;
  -[CALayer setBounds:](self->_splashRing3, "setBounds:", 0.0, 0.0, v33, v33);
  splashRing3 = self->_splashRing3;
  [(CALayer *)splashRing3 bounds];
  [(CSMagSafeAccessoryTrayView *)self bounds];
  UIRectCenteredIntegralRect();
  UIRectGetCenter();
  -[CALayer setPosition:](splashRing3, "setPosition:");
  -[CALayer setBounds:](self->_splashRing4, "setBounds:", 0.0, 0.0, v33, v33);
  splashRing4 = self->_splashRing4;
  [(CALayer *)splashRing4 bounds];
  [(CSMagSafeAccessoryTrayView *)self bounds];
  UIRectCenteredIntegralRect();
  UIRectGetCenter();
  -[CALayer setPosition:](splashRing4, "setPosition:");
  -[CSRingLayer setBounds:](self->_trackRing, "setBounds:", 0.0, 0.0, v23, v24);
  trackRing = self->_trackRing;
  [(CSRingLayer *)trackRing bounds];
  [(CSMagSafeAccessoryTrayView *)self bounds];
  UIRectCenteredIntegralRect();
  UIRectGetCenter();
  -[CSRingLayer setPosition:](trackRing, "setPosition:");
}

- (double)_trackRingLineWidthAnimationOffset
{
  double v3 = 0.0;
  if (![(CSMagSafeAccessoryView *)self isReduceMotionEnabled])
  {
    double v4 = [(CSMagSafeAccessoryView *)self configuration];
    double v5 = [v4 ring];
    [v5 lineWidth];
    double v7 = v6;

    if (v7 < 30.0)
    {
      double v8 = [(CSMagSafeAccessoryView *)self configuration];
      double v9 = [v8 ring];
      [v9 lineWidth];
      double v3 = 30.0 - v10;
    }
  }
  return v3;
}

- (void)_presentAnimation
{
  v88[3] = *MEMORY[0x1E4F143B8];
  double v3 = CACurrentMediaTime();
  if ([(CSMagSafeAccessoryView *)self isReduceTransparencyEnabled])
  {
    double v4 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
    [v4 setKeyTimes:&unk_1F306AE40];
    [v4 setValues:&unk_1F306AE58];
    [v4 setDuration:0.42];
    [v4 setRemovedOnCompletion:0];
    uint64_t v5 = *MEMORY[0x1E4F39FA8];
    [v4 setFillMode:*MEMORY[0x1E4F39FA8]];
    uint64_t v6 = *MEMORY[0x1E4F3A4A0];
    double v7 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A4A0]];
    [v4 setTimingFunction:v7];

    [(CABackdropLayer *)self->_averageColorBackdropLayer addAnimation:v4 forKey:@"opacity"];
  }
  else
  {
    double v4 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"filters.colorBrightness.inputAmount"];
    [v4 setKeyTimes:&unk_1F306AE70];
    [v4 setValues:&unk_1F306AE88];
    [v4 setDuration:0.42];
    [v4 setRemovedOnCompletion:0];
    uint64_t v5 = *MEMORY[0x1E4F39FA8];
    [v4 setFillMode:*MEMORY[0x1E4F39FA8]];
    uint64_t v6 = *MEMORY[0x1E4F3A4A0];
    double v8 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A4A0]];
    [v4 setTimingFunction:v8];

    [(CABackdropLayer *)self->_backgroundBackdropLayer addAnimation:v4 forKey:@"filters.colorBrightness.inputAmount"];
    double v9 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"filters.colorSaturate.inputAmount"];
    [v9 setKeyTimes:&unk_1F306AEA0];
    [v9 setValues:&unk_1F306AEB8];
    [v9 setDuration:0.42];
    [v9 setRemovedOnCompletion:0];
    [v9 setFillMode:v5];
    double v10 = [MEMORY[0x1E4F39C10] functionWithName:v6];
    [v9 setTimingFunction:v10];

    [(CABackdropLayer *)self->_backgroundBackdropLayer addAnimation:v9 forKey:@"filters.colorSaturate.inputAmount"];
    if ([(CSMagSafeAccessoryView *)self isReduceMotionEnabled])
    {
      double v11 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
      [v11 setKeyTimes:&unk_1F306AF00];
      [v11 setValues:&unk_1F306AF18];
      [v11 setDuration:0.42];
      [v11 setRemovedOnCompletion:0];
      [v11 setFillMode:v5];
      v12 = [MEMORY[0x1E4F39C10] functionWithName:v6];
      [v11 setTimingFunction:v12];

      backgroundRadiusBackdropLayer = self->_backgroundRadiusBackdropLayer;
      double v14 = v11;
      double v15 = @"opacity";
    }
    else
    {
      double v11 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"filters.gaussianBlur.inputRadius"];
      [v11 setKeyTimes:&unk_1F306AED0];
      [v11 setValues:&unk_1F306AEE8];
      [v11 setDuration:0.42];
      [v11 setRemovedOnCompletion:0];
      [v11 setFillMode:v5];
      v16 = [MEMORY[0x1E4F39C10] functionWithName:v6];
      [v11 setTimingFunction:v16];

      backgroundRadiusBackdropLayer = self->_backgroundBackdropLayer;
      double v14 = v11;
      double v15 = @"filters.gaussianBlur.inputRadius";
    }
    [(CABackdropLayer *)backgroundRadiusBackdropLayer addAnimation:v14 forKey:v15];
  }
  if (self->_clearColorAnimationNeeded) {
    double v17 = 0.15;
  }
  else {
    double v17 = 0.25;
  }
  double v18 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
  [v18 setBeginTime:v3 + 0.5];
  [v18 setKeyTimes:&unk_1F306AF30];
  v88[0] = &unk_1F306A518;
  uint64_t v19 = [NSNumber numberWithDouble:v17];
  v88[1] = v19;
  v88[2] = &unk_1F306A518;
  uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v88 count:3];
  [v18 setValues:v20];

  [v18 setDuration:0.31];
  [v18 setRemovedOnCompletion:0];
  uint64_t v79 = v5;
  [v18 setFillMode:v5];
  v21 = [MEMORY[0x1E4F39C10] functionWithName:v6];
  v87[0] = v21;
  uint64_t v78 = v6;
  v22 = [MEMORY[0x1E4F39C10] functionWithName:v6];
  v87[1] = v22;
  double v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:2];
  [v18 setTimingFunctions:v23];

  if (![(CSMagSafeAccessoryView *)self isReduceMotionEnabled])
  {
    [(CALayer *)self->_splashRing1 addAnimation:v18 forKey:@"opacity"];
    if (self->_clearColorAnimationNeeded) {
      double v24 = 0.2;
    }
    else {
      double v24 = 0.25;
    }
    [v18 setBeginTime:v3 + 0.6];
    v86[0] = &unk_1F306A518;
    uint64_t v25 = [NSNumber numberWithDouble:v24];
    v86[1] = v25;
    v86[2] = &unk_1F306A518;
    v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v86 count:3];
    [v18 setValues:v26];

    [(CALayer *)self->_splashRing2 addAnimation:v18 forKey:@"opacity"];
  }
  if (self->_clearColorAnimationNeeded) {
    double v27 = 0.1;
  }
  else {
    double v27 = 1.0;
  }
  [v18 setBeginTime:v3 + 0.71];
  [v18 setKeyTimes:&unk_1F306AF48];
  v85[0] = &unk_1F306A518;
  double v28 = [NSNumber numberWithDouble:v27];
  v85[1] = v28;
  v85[2] = &unk_1F306A518;
  double v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v85 count:3];
  [v18 setValues:v29];

  [v18 setDuration:1.37];
  [(CALayer *)self->_splashRing3 addAnimation:v18 forKey:@"opacity"];
  if (self->_clearColorAnimationNeeded) {
    double v30 = 0.2;
  }
  else {
    double v30 = 1.0;
  }
  [v18 setBeginTime:v3 + 0.65];
  [v18 setKeyTimes:&unk_1F306AF60];
  v84[0] = &unk_1F306A518;
  uint64_t v31 = [NSNumber numberWithDouble:v30];
  v84[1] = v31;
  v84[2] = &unk_1F306A518;
  uint64_t v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:3];
  [v18 setValues:v32];

  [v18 setDuration:0.97];
  [(CALayer *)self->_splashRing4 addAnimation:v18 forKey:@"opacity"];
  double v33 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"transform.scale.xy"];
  [v33 setBeginTime:v3 + 0.5];
  [v33 setKeyTimes:&unk_1F306AF78];
  [v33 setValues:&unk_1F306AF90];
  [v33 setDuration:0.3];
  [v33 setRemovedOnCompletion:0];
  [v33 setFillMode:v5];
  LODWORD(v34) = 1059816735;
  LODWORD(v35) = 1.0;
  uint64_t v36 = [MEMORY[0x1E4F39C10] functionWithControlPoints:0.0 :0.0 :v34 :v35];
  [v33 setTimingFunction:v36];

  if (![(CSMagSafeAccessoryView *)self isReduceMotionEnabled])
  {
    [(CALayer *)self->_splashRing1 addAnimation:v33 forKey:@"transform.scale.xy"];
    uint64_t v37 = [MEMORY[0x1E4F39C10] functionWithName:v78];
    [v33 setTimingFunction:v37];

    [(CALayer *)self->_splashRing2 addAnimation:v33 forKey:@"transform.scale.xy"];
    [v33 setBeginTime:v3 + 0.7];
    [v33 setDuration:1.07];
    [v33 setValues:&unk_1F306AFA8];
    LODWORD(v38) = 1.0;
    LODWORD(v39) = 1042536202;
    double v40 = [MEMORY[0x1E4F39C10] functionWithControlPoints:0.0 :0.0 :v39 :v38];
    [v33 setTimingFunction:v40];

    [(CALayer *)self->_splashRing3 addAnimation:v33 forKey:@"transform.scale.xy"];
    [v33 setBeginTime:v3 + 0.64];
    [v33 setDuration:0.85];
    [v33 setValues:&unk_1F306AFC0];
    LODWORD(v41) = 1.0;
    LODWORD(v42) = 1042536202;
    double v43 = [MEMORY[0x1E4F39C10] functionWithControlPoints:0.0 :0.0 :v42 :v41];
    [v33 setTimingFunction:v43];

    [(CALayer *)self->_splashRing4 addAnimation:v33 forKey:@"transform.scale.xy"];
  }
  v77 = v33;
  double v44 = (void *)MEMORY[0x1E4F3A490];
  if (self->_clearColorAnimationNeeded)
  {
    double v45 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
    [v45 setBeginTime:v3 + 0.48];
    [v45 setKeyTimes:&unk_1F306AFD8];
    [v45 setValues:&unk_1F306AFF0];
    [v45 setDuration:0.1];
    [v45 setRemovedOnCompletion:0];
    [v45 setFillMode:v5];
    double v46 = [MEMORY[0x1E4F39C10] functionWithName:*v44];
    [v45 setTimingFunction:v46];

    [(CABackdropLayer *)self->_trackRingBlurBackdropLayer addAnimation:v45 forKey:@"opacity"];
  }
  unint64_t v47 = 0x1E4F1C000;
  if (![(CSMagSafeAccessoryView *)self isReduceMotionEnabled])
  {
    v48 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"transform.scale.xy"];
    [v48 setBeginTime:v3 + 0.6];
    [v48 setKeyTimes:&unk_1F306B008];
    [v48 setValues:&unk_1F306B020];
    [v48 setDuration:0.18];
    [v48 setRemovedOnCompletion:0];
    [v48 setFillMode:v79];
    LODWORD(v49) = 1053944709;
    LODWORD(v50) = 1053609165;
    LODWORD(v51) = 1.0;
    v52 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v49 :0.0 :v50 :v51];
    [v48 setTimingFunction:v52];

    [(CSRingLayer *)self->_trackRing addAnimation:v48 forKey:@"transform.scale.xy"];
    if (self->_clearColorAnimationNeeded) {
      [(CSRingLayer *)self->_trackRingBlurLayer addAnimation:v48 forKey:@"transform.scale.xy"];
    }
    v53 = [(CSMagSafeAccessoryView *)self configuration];
    BOOL v54 = [v53 ring];
    [v54 lineWidth];
    double v56 = v55;

    v57 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"lineWidth"];
    [v57 setBeginTime:v3 + 0.14];
    [v57 setKeyTimes:&unk_1F306B038];
    v58 = [NSNumber numberWithDouble:80.0];
    v83[0] = v58;
    v83[1] = &unk_1F306A5D8;
    v83[2] = &unk_1F306A5E8;
    v59 = [NSNumber numberWithDouble:v56];
    v83[3] = v59;
    uint64_t v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:v83 count:4];
    [v57 setValues:v60];

    [v57 setDuration:1.34];
    [v57 setRemovedOnCompletion:0];
    [v57 setFillMode:v79];
    LODWORD(v61) = 1036831949;
    LODWORD(v62) = 1.0;
    LODWORD(v63) = 1.0;
    v64 = [MEMORY[0x1E4F39C10] functionWithControlPoints:0.0 :v61 :v62 :v63];
    v82[0] = v64;
    v65 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
    v82[1] = v65;
    double v66 = [MEMORY[0x1E4F39C10] functionWithName:v78];
    v82[2] = v66;
    double v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:3];
    [v57 setTimingFunctions:v67];

    [(CSRingLayer *)self->_trackRing addAnimation:v57 forKey:@"lineWidth"];
    if (self->_clearColorAnimationNeeded) {
      [(CSRingLayer *)self->_trackRingBlurLayer addAnimation:v57 forKey:@"lineWidth"];
    }

    unint64_t v47 = 0x1E4F1C000uLL;
  }
  if (self->_clearColorAnimationNeeded) {
    double v68 = 0.2;
  }
  else {
    double v68 = 1.0;
  }
  double v69 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
  [v69 setBeginTime:v3 + 0.63];
  [v69 setKeyTimes:&unk_1F306B050];
  v81[0] = &unk_1F306A518;
  double v70 = [NSNumber numberWithDouble:v68];
  v81[1] = v70;
  double v71 = [*(id *)(v47 + 2424) arrayWithObjects:v81 count:2];
  [v69 setValues:v71];

  [v69 setDuration:0.06];
  [v69 setRemovedOnCompletion:0];
  [v69 setFillMode:v79];
  double v72 = [MEMORY[0x1E4F39C10] functionWithName:v78];
  [v69 setTimingFunction:v72];

  [(CSRingLayer *)self->_trackRing addAnimation:v69 forKey:@"opacity"];
  if (self->_clearColorAnimationNeeded)
  {
    v80[0] = &unk_1F306A518;
    uint64_t v73 = [NSNumber numberWithDouble:v68 * 3.0];
    v80[1] = v73;
    v74 = [*(id *)(v47 + 2424) arrayWithObjects:v80 count:2];
    [v69 setValues:v74];

    [(CSRingLayer *)self->_trackRingBlurLayer addAnimation:v69 forKey:@"opacity"];
  }
  else
  {
    v75 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"filters.colorBrightness.inputAmount"];
    [v75 setKeyTimes:&unk_1F306B068];
    [v75 setValues:&unk_1F306B080];
    [v75 setDuration:2.6];
    [v75 setRemovedOnCompletion:0];
    [v75 setFillMode:v79];
    id v76 = [MEMORY[0x1E4F39C10] functionWithName:v78];
    [v75 setTimingFunction:v76];

    [(CSRingLayer *)self->_trackRing addAnimation:v75 forKey:@"filters.colorBrightness.inputAmount"];
  }
}

- (void)_dismissAnimation
{
  v31[2] = *MEMORY[0x1E4F143B8];
  double v3 = CACurrentMediaTime();
  if (self->_clearColorAnimationNeeded) {
    double v4 = 0.2;
  }
  else {
    double v4 = 1.0;
  }
  uint64_t v5 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
  [v5 setKeyTimes:&unk_1F306B098];
  uint64_t v6 = [NSNumber numberWithDouble:v4];
  v31[0] = v6;
  v31[1] = &unk_1F306A518;
  double v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
  [v5 setValues:v7];

  [v5 setDuration:0.12];
  [v5 setRemovedOnCompletion:0];
  uint64_t v8 = *MEMORY[0x1E4F39FA8];
  [v5 setFillMode:*MEMORY[0x1E4F39FA8]];
  uint64_t v9 = *MEMORY[0x1E4F3A4A0];
  double v10 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A4A0]];
  [v5 setTimingFunction:v10];

  [(CSRingLayer *)self->_trackRing addAnimation:v5 forKey:@"fadeOut"];
  if (self->_clearColorAnimationNeeded)
  {
    [(CABackdropLayer *)self->_trackRingBlurBackdropLayer addAnimation:v5 forKey:@"fadeOut"];
    [(CSRingLayer *)self->_trackRingBlurLayer addAnimation:v5 forKey:@"fadeOut"];
  }
  if (![(CSMagSafeAccessoryView *)self isReduceMotionEnabled])
  {
    double v11 = [(CSMagSafeAccessoryView *)self configuration];
    v12 = [v11 ring];
    [v12 lineWidth];
    double v14 = v13;

    double v15 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"lineWidth"];
    [v15 setKeyTimes:&unk_1F306B0B0];
    v16 = [NSNumber numberWithDouble:v14];
    v30[0] = v16;
    v30[1] = &unk_1F306A518;
    double v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
    [v15 setValues:v17];

    [v15 setDuration:0.12];
    [v15 setRemovedOnCompletion:0];
    [v15 setFillMode:v8];
    double v18 = [MEMORY[0x1E4F39C10] functionWithName:v9];
    [v15 setTimingFunction:v18];

    [(CSRingLayer *)self->_trackRing addAnimation:v15 forKey:@"lineWidthDismiss"];
    if (self->_clearColorAnimationNeeded) {
      [(CSRingLayer *)self->_trackRingBlurLayer addAnimation:v15 forKey:@"lineWidthDismiss"];
    }
  }
  if ([(CSMagSafeAccessoryView *)self isReduceTransparencyEnabled])
  {
    uint64_t v19 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
    [v19 setKeyTimes:&unk_1F306B0C8];
    [v19 setValues:&unk_1F306B0E0];
    [v19 setDuration:0.26];
    [v19 setRemovedOnCompletion:0];
    [v19 setFillMode:v8];
    uint64_t v20 = [MEMORY[0x1E4F39C10] functionWithName:v9];
    [v19 setTimingFunction:v20];

    [(CABackdropLayer *)self->_averageColorBackdropLayer addAnimation:v19 forKey:@"opacity"];
    [(CABackdropLayer *)self->_backgroundBackdropLayer addAnimation:v19 forKey:@"opacity"];
  }
  else
  {
    uint64_t v19 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"filters.colorBrightness.inputAmount"];
    [v19 setBeginTime:v3 + 0.07];
    [v19 setKeyTimes:&unk_1F306B0F8];
    [v19 setValues:&unk_1F306B110];
    [v19 setDuration:0.26];
    [v19 setRemovedOnCompletion:0];
    [v19 setFillMode:v8];
    v21 = [MEMORY[0x1E4F39C10] functionWithName:v9];
    [v19 setTimingFunction:v21];

    [(CABackdropLayer *)self->_backgroundBackdropLayer addAnimation:v19 forKey:@"brightnessDismiss"];
    v22 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"filters.colorSaturate.inputAmount"];
    [v22 setBeginTime:v3 + 0.07];
    [v22 setKeyTimes:&unk_1F306B128];
    [v22 setValues:&unk_1F306B140];
    [v22 setDuration:0.26];
    [v22 setRemovedOnCompletion:0];
    [v22 setFillMode:v8];
    double v23 = [MEMORY[0x1E4F39C10] functionWithName:v9];
    [v22 setTimingFunction:v23];

    [(CABackdropLayer *)self->_backgroundBackdropLayer addAnimation:v22 forKey:@"dismissSaturation"];
    if ([(CSMagSafeAccessoryView *)self isReduceMotionEnabled])
    {
      double v24 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
      [v24 setKeyTimes:&unk_1F306B188];
      [v24 setValues:&unk_1F306B1A0];
      [v24 setDuration:0.26];
      [v24 setRemovedOnCompletion:0];
      [v24 setFillMode:v8];
      uint64_t v25 = [MEMORY[0x1E4F39C10] functionWithName:v9];
      [v24 setTimingFunction:v25];

      backgroundRadiusBackdropLayer = self->_backgroundRadiusBackdropLayer;
      double v27 = v24;
      double v28 = @"opacity";
    }
    else
    {
      double v24 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"filters.gaussianBlur.inputRadius"];
      [v24 setBeginTime:v3 + 0.07];
      [v24 setKeyTimes:&unk_1F306B158];
      [v24 setValues:&unk_1F306B170];
      [v24 setDuration:0.26];
      [v24 setRemovedOnCompletion:0];
      [v24 setFillMode:v8];
      double v29 = [MEMORY[0x1E4F39C10] functionWithName:v9];
      [v24 setTimingFunction:v29];

      backgroundRadiusBackdropLayer = self->_backgroundBackdropLayer;
      double v28 = @"dismissGaussianBlur";
      double v27 = v24;
    }
    [(CABackdropLayer *)backgroundRadiusBackdropLayer addAnimation:v27 forKey:v28];
  }
}

- (void)_runAnimationWithType:(unint64_t)a3
{
  if (a3 == 1)
  {
    [(CSMagSafeAccessoryTrayView *)self _dismissAnimation];
  }
  else if (!a3)
  {
    [(CSMagSafeAccessoryTrayView *)self _presentAnimation];
  }
}

- (void)performAnimation:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F39CF8];
  id v7 = a4;
  [v6 begin];
  [MEMORY[0x1E4F39CF8] setCompletionBlock:v7];

  [(CSMagSafeAccessoryTrayView *)self _runAnimationWithType:a3];
  uint64_t v8 = (void *)MEMORY[0x1E4F39CF8];

  [v8 commit];
}

- (double)animationDurationBeforeDismissal
{
  return 2.6;
}

- (CABackdropLayer)averageColorBackdropLayer
{
  return self->_averageColorBackdropLayer;
}

- (void)setAverageColorBackdropLayer:(id)a3
{
}

- (CABackdropLayer)backgroundRadiusBackdropLayer
{
  return self->_backgroundRadiusBackdropLayer;
}

- (void)setBackgroundRadiusBackdropLayer:(id)a3
{
}

- (CABackdropLayer)backgroundBackdropLayer
{
  return self->_backgroundBackdropLayer;
}

- (void)setBackgroundBackdropLayer:(id)a3
{
}

- (CALayer)splashRing1
{
  return self->_splashRing1;
}

- (void)setSplashRing1:(id)a3
{
}

- (CALayer)splashRing2
{
  return self->_splashRing2;
}

- (void)setSplashRing2:(id)a3
{
}

- (CALayer)splashRing3
{
  return self->_splashRing3;
}

- (void)setSplashRing3:(id)a3
{
}

- (CALayer)splashRing4
{
  return self->_splashRing4;
}

- (void)setSplashRing4:(id)a3
{
}

- (CABackdropLayer)trackRingBlurBackdropLayer
{
  return self->_trackRingBlurBackdropLayer;
}

- (void)setTrackRingBlurBackdropLayer:(id)a3
{
}

- (CSRingLayer)trackRingBlurLayer
{
  return self->_trackRingBlurLayer;
}

- (void)setTrackRingBlurLayer:(id)a3
{
}

- (CSRingLayer)trackRing
{
  return self->_trackRing;
}

- (void)setTrackRing:(id)a3
{
}

- (BOOL)clearColorAnimationNeeded
{
  return self->_clearColorAnimationNeeded;
}

- (void)setClearColorAnimationNeeded:(BOOL)a3
{
  self->_clearColorAnimationNeeded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackRing, 0);
  objc_storeStrong((id *)&self->_trackRingBlurLayer, 0);
  objc_storeStrong((id *)&self->_trackRingBlurBackdropLayer, 0);
  objc_storeStrong((id *)&self->_splashRing4, 0);
  objc_storeStrong((id *)&self->_splashRing3, 0);
  objc_storeStrong((id *)&self->_splashRing2, 0);
  objc_storeStrong((id *)&self->_splashRing1, 0);
  objc_storeStrong((id *)&self->_backgroundBackdropLayer, 0);
  objc_storeStrong((id *)&self->_backgroundRadiusBackdropLayer, 0);

  objc_storeStrong((id *)&self->_averageColorBackdropLayer, 0);
}

@end