@interface CAMTimelapseShutterRingView
- ($EA90F2AF3C0DC35AB2D8304CE3BCA89E)spec;
- (BOOL)_shouldUseAnimations;
- (BOOL)isAnimating;
- (CALayer)_largeTickLayer;
- (CALayer)_smallTickLayer;
- (CALayer)_timerHandLayer;
- (CALayer)_timerHandParentLayer;
- (CAMTimelapseShutterRingView)initWithFrame:(CGRect)a3 spec:(id *)a4;
- (CAMTimelapseShutterRingView)initWithSpec:(id *)a3;
- (CAReplicatorLayer)_largeTickReplicatorLayer;
- (CAReplicatorLayer)_smallTickReplicatorLayer;
- (double)_largeTickRotationRadians;
- (double)_rotationRadiansFromTickCount:(int64_t)a3;
- (double)_rotationZFromTransform:(CATransform3D *)a3;
- (double)_smallTickRotationRadians;
- (double)_tickRadiusForTickSize:(CGSize)a3 ringSize:(CGSize)a4;
- (void)_addStartAnimations;
- (void)_addStopAnimations;
- (void)_commonCAMTimelapseShutterRingViewInitializationWithSpec:(id *)a3;
- (void)_removeStartAnimations;
- (void)_removeStopAnimations;
- (void)_startAnimating;
- (void)_stopAnimating;
- (void)layoutSublayersOfLayer:(id)a3;
- (void)setAnimating:(BOOL)a3;
- (void)setSpec:(id *)a3;
@end

@implementation CAMTimelapseShutterRingView

- (CAMTimelapseShutterRingView)initWithSpec:(id *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CAMTimelapseShutterRingView;
  v4 = -[CAMTimelapseShutterRingView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v5 = v4;
  if (v4)
  {
    long long v6 = *(_OWORD *)&a3->var2;
    v8[0] = *(_OWORD *)&a3->var0;
    v8[1] = v6;
    [(CAMTimelapseShutterRingView *)v4 _commonCAMTimelapseShutterRingViewInitializationWithSpec:v8];
  }
  return v5;
}

- (CAMTimelapseShutterRingView)initWithFrame:(CGRect)a3 spec:(id *)a4
{
  v10.receiver = self;
  v10.super_class = (Class)CAMTimelapseShutterRingView;
  v5 = -[CAMTimelapseShutterRingView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  long long v6 = v5;
  if (v5)
  {
    long long v7 = *(_OWORD *)&a4->var2;
    v9[0] = *(_OWORD *)&a4->var0;
    v9[1] = v7;
    [(CAMTimelapseShutterRingView *)v5 _commonCAMTimelapseShutterRingViewInitializationWithSpec:v9];
  }
  return v6;
}

- (void)_commonCAMTimelapseShutterRingViewInitializationWithSpec:(id *)a3
{
  [(CAMTimelapseShutterRingView *)self setUserInteractionEnabled:0];
  long long v5 = *(_OWORD *)&a3->var2;
  *(_OWORD *)&self->_spec.smallTickCount = *(_OWORD *)&a3->var0;
  *(_OWORD *)&self->_spec.smallTickLength = v5;
  [(CAMTimelapseShutterRingView *)self _rotationRadiansFromTickCount:self->_spec.smallTickCount];
  self->__smallTickRotationRadians = v6;
  [(CAMTimelapseShutterRingView *)self _rotationRadiansFromTickCount:self->_spec.largeTickCount];
  self->__largeTickRotationRadians = v7;
  v8 = [(CAMTimelapseShutterRingView *)self traitCollection];
  [v8 displayScale];
  double v10 = v9;

  v11 = [(CAMTimelapseShutterRingView *)self layer];
  memset(&v34, 0, sizeof(v34));
  CATransform3DMakeRotation(&v34, self->__smallTickRotationRadians, 0.0, 0.0, 1.0);
  memset(&v33, 0, sizeof(v33));
  CATransform3DMakeRotation(&v33, self->__largeTickRotationRadians, 0.0, 0.0, 1.0);
  v12 = (CAReplicatorLayer *)objc_alloc_init(MEMORY[0x263F15868]);
  smallTickReplicatorLayer = self->__smallTickReplicatorLayer;
  self->__smallTickReplicatorLayer = v12;

  [v11 addSublayer:self->__smallTickReplicatorLayer];
  [(CAReplicatorLayer *)self->__smallTickReplicatorLayer setInstanceCount:self->_spec.smallTickCount + 1];
  v14 = self->__smallTickReplicatorLayer;
  CATransform3D v32 = v34;
  [(CAReplicatorLayer *)v14 setInstanceTransform:&v32];
  v15 = (CAReplicatorLayer *)objc_alloc_init(MEMORY[0x263F15868]);
  largeTickReplicatorLayer = self->__largeTickReplicatorLayer;
  self->__largeTickReplicatorLayer = v15;

  [v11 addSublayer:self->__largeTickReplicatorLayer];
  [(CAReplicatorLayer *)self->__largeTickReplicatorLayer setInstanceCount:self->_spec.largeTickCount + 1];
  v17 = self->__largeTickReplicatorLayer;
  CATransform3D v32 = v33;
  [(CAReplicatorLayer *)v17 setInstanceTransform:&v32];
  v18 = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
  smallTickLayer = self->__smallTickLayer;
  self->__smallTickLayer = v18;

  [(CAReplicatorLayer *)self->__smallTickReplicatorLayer addSublayer:self->__smallTickLayer];
  v20 = self->__smallTickLayer;
  id v21 = [MEMORY[0x263F825C8] whiteColor];
  -[CALayer setBackgroundColor:](v20, "setBackgroundColor:", [v21 CGColor]);

  [(CALayer *)self->__smallTickLayer setRasterizationScale:v10];
  [(CALayer *)self->__smallTickLayer setAllowsEdgeAntialiasing:1];
  v22 = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
  largeTickLayer = self->__largeTickLayer;
  self->__largeTickLayer = v22;

  [(CAReplicatorLayer *)self->__largeTickReplicatorLayer addSublayer:self->__largeTickLayer];
  v24 = self->__largeTickLayer;
  id v25 = [MEMORY[0x263F825C8] whiteColor];
  -[CALayer setBackgroundColor:](v24, "setBackgroundColor:", [v25 CGColor]);

  [(CALayer *)self->__largeTickLayer setRasterizationScale:v10];
  [(CALayer *)self->__largeTickLayer setAllowsEdgeAntialiasing:1];
  v26 = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
  timerHandParentLayer = self->__timerHandParentLayer;
  self->__timerHandParentLayer = v26;

  [v11 addSublayer:self->__timerHandParentLayer];
  v28 = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
  timerHandLayer = self->__timerHandLayer;
  self->__timerHandLayer = v28;

  [(CALayer *)self->__timerHandParentLayer addSublayer:self->__timerHandLayer];
  v30 = self->__timerHandLayer;
  id v31 = [MEMORY[0x263F825C8] whiteColor];
  -[CALayer setBackgroundColor:](v30, "setBackgroundColor:", [v31 CGColor]);

  [(CALayer *)self->__timerHandLayer setRasterizationScale:v10];
  [(CALayer *)self->__timerHandLayer setAllowsEdgeAntialiasing:1];
}

- (void)setAnimating:(BOOL)a3
{
  if (self->_animating != a3)
  {
    self->_animating = a3;
    if (a3) {
      [(CAMTimelapseShutterRingView *)self _startAnimating];
    }
    else {
      [(CAMTimelapseShutterRingView *)self _stopAnimating];
    }
  }
}

- (void)setSpec:(id *)a3
{
  p_spec = &self->_spec;
  if (self->_spec.smallTickCount != a3->var0
    || self->_spec.largeTickCount != a3->var1
    || self->_spec.smallTickLength != a3->var2
    || self->_spec.largeTickLength != a3->var3)
  {
    long long v5 = *(_OWORD *)&a3->var2;
    *(_OWORD *)&p_spec->smallTickCount = *(_OWORD *)&a3->var0;
    *(_OWORD *)&self->_spec.smallTickLength = v5;
    [(CAMTimelapseShutterRingView *)self _rotationRadiansFromTickCount:p_spec->smallTickCount];
    self->__smallTickRotationRadians = v6;
    [(CAMTimelapseShutterRingView *)self _rotationRadiansFromTickCount:p_spec->largeTickCount];
    self->__largeTickRotationRadians = v7;
  }
}

- (double)_rotationRadiansFromTickCount:(int64_t)a3
{
  return 360.0 / (double)a3 * 3.14159265 / 180.0;
}

- (void)layoutSublayersOfLayer:(id)a3
{
  [(CAMTimelapseShutterRingView *)self bounds];
  double x = v20.origin.x;
  double y = v20.origin.y;
  double width = v20.size.width;
  double height = v20.size.height;
  double MidX = CGRectGetMidX(v20);
  v21.origin.double x = x;
  v21.origin.double y = y;
  v21.size.double width = width;
  v21.size.double height = height;
  double MidY = CGRectGetMidY(v21);
  -[CAReplicatorLayer setBounds:](self->__smallTickReplicatorLayer, "setBounds:", x, y, width, height);
  -[CAReplicatorLayer setPosition:](self->__smallTickReplicatorLayer, "setPosition:", MidX, MidY);
  -[CAReplicatorLayer setBounds:](self->__largeTickReplicatorLayer, "setBounds:", x, y, width, height);
  -[CAReplicatorLayer setPosition:](self->__largeTickReplicatorLayer, "setPosition:", MidX, MidY);
  -[CALayer setBounds:](self->__timerHandParentLayer, "setBounds:", x, y, width, height);
  -[CALayer setPosition:](self->__timerHandParentLayer, "setPosition:", MidX, MidY);
  double smallTickLength = self->_spec.smallTickLength;
  double v11 = *MEMORY[0x263F00148];
  double v12 = *(double *)(MEMORY[0x263F00148] + 8);
  -[CAMTimelapseShutterRingView _tickRadiusForTickSize:ringSize:](self, "_tickRadiusForTickSize:ringSize:", 1.0, smallTickLength, width, height);
  double v14 = MidY - v13;
  -[CALayer setBounds:](self->__smallTickLayer, "setBounds:", v11, v12, 1.0, smallTickLength);
  -[CALayer setPosition:](self->__smallTickLayer, "setPosition:", MidX, v14);
  double largeTickLength = self->_spec.largeTickLength;
  -[CAMTimelapseShutterRingView _tickRadiusForTickSize:ringSize:](self, "_tickRadiusForTickSize:ringSize:", 1.0, largeTickLength, width, height);
  double v17 = MidY - v16;
  -[CALayer setBounds:](self->__largeTickLayer, "setBounds:", v11, v12, 1.0, largeTickLength);
  -[CALayer setPosition:](self->__largeTickLayer, "setPosition:", MidX, v17);
  -[CALayer setBounds:](self->__timerHandLayer, "setBounds:", v11, v12, 1.0, largeTickLength);
  timerHandLayer = self->__timerHandLayer;
  -[CALayer setPosition:](timerHandLayer, "setPosition:", MidX, v17);
}

- (double)_tickRadiusForTickSize:(CGSize)a3 ringSize:(CGSize)a4
{
  if (a4.width >= a4.height) {
    double height = a4.height;
  }
  else {
    double height = a4.width;
  }
  return height * 0.5 - a3.height * 0.5;
}

- (void)_startAnimating
{
  [MEMORY[0x263F158F8] begin];
  [(CAMTimelapseShutterRingView *)self _removeStartAnimations];
  [(CAMTimelapseShutterRingView *)self _removeStopAnimations];
  [(CAMTimelapseShutterRingView *)self _addStartAnimations];
  v3 = (void *)MEMORY[0x263F158F8];
  [v3 commit];
}

- (void)_stopAnimating
{
  [MEMORY[0x263F158F8] begin];
  [(CAMTimelapseShutterRingView *)self _addStopAnimations];
  [(CAMTimelapseShutterRingView *)self _removeStartAnimations];
  v3 = (void *)MEMORY[0x263F158F8];
  [v3 commit];
}

- (void)_removeStartAnimations
{
  [(CAReplicatorLayer *)self->__smallTickReplicatorLayer removeAnimationForKey:@"kStartAnimationsKey"];
  timerHandParentLayer = self->__timerHandParentLayer;
  [(CALayer *)timerHandParentLayer removeAnimationForKey:@"kStartAnimationsKey"];
}

- (void)_removeStopAnimations
{
  [(CAReplicatorLayer *)self->__smallTickReplicatorLayer removeAnimationForKey:@"kStopAnimationsKey"];
  timerHandParentLayer = self->__timerHandParentLayer;
  [(CALayer *)timerHandParentLayer removeAnimationForKey:@"kStopAnimationsKey"];
}

- (BOOL)_shouldUseAnimations
{
  return CFPreferencesGetAppBooleanValue(@"CAMDisableTimelapseShutterAnimation", @"com.apple.mobileslideshow", 0) == 0;
}

- (void)_addStartAnimations
{
  v53[3] = *MEMORY[0x263EF8340];
  if ([(CAMTimelapseShutterRingView *)self _shouldUseAnimations])
  {
    UIAnimationDragCoefficient();
    double v4 = v3 * 0.7;
    UIAnimationDragCoefficient();
    double v6 = v5 * 12.0;
    double v7 = [MEMORY[0x263F15760] animationWithKeyPath:@"instanceCount"];
    v8 = [NSNumber numberWithInteger:self->_spec.smallTickCount + 1];
    [v7 setFromValue:v8];

    [v7 setToValue:&unk_26BDDEA78];
    v48 = v7;
    [v7 setDuration:v4];
    uint64_t v46 = *MEMORY[0x263F15EB8];
    double v9 = objc_msgSend(MEMORY[0x263F15808], "functionWithName:");
    [v7 setTimingFunction:v9];

    v47 = [MEMORY[0x263F157D8] animationWithKeyPath:@"instanceCount"];
    v53[0] = &unk_26BDDEA78;
    double v10 = [NSNumber numberWithInteger:self->_spec.smallTickCount + 1];
    v53[1] = v10;
    v53[2] = &unk_26BDDEA78;
    double v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v53 count:3];
    [v47 setValues:v11];

    [v47 setKeyTimes:&unk_26BDE03E8];
    [v47 setBeginTime:v4];
    [v47 setDuration:v6];
    uint64_t v12 = *MEMORY[0x263F15EC8];
    double v13 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EC8]];
    [v47 setTimingFunction:v13];

    LODWORD(v14) = 2139095040;
    [v47 setRepeatCount:v14];
    v15 = [MEMORY[0x263F157D8] animationWithKeyPath:@"instanceTransform.rotation.z"];
    double v16 = NSNumber;
    [(CAMTimelapseShutterRingView *)self _smallTickRotationRadians];
    v18 = [v16 numberWithDouble:-v17];
    v52[0] = v18;
    v19 = NSNumber;
    [(CAMTimelapseShutterRingView *)self _smallTickRotationRadians];
    CGRect v20 = objc_msgSend(v19, "numberWithDouble:");
    v52[1] = v20;
    CGRect v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v52 count:2];
    [v15 setValues:v21];

    v22 = v15;
    [v15 setKeyTimes:&unk_26BDE0400];
    uint64_t v23 = *MEMORY[0x263F15968];
    [v15 setCalculationMode:*MEMORY[0x263F15968]];
    [v15 setDuration:v4];
    v24 = [MEMORY[0x263F15808] functionWithName:v12];
    v45 = v15;
    [v15 setTimingFunction:v24];

    id v25 = [MEMORY[0x263F157D8] animationWithKeyPath:@"instanceTransform.rotation.z"];
    v26 = NSNumber;
    [(CAMTimelapseShutterRingView *)self _smallTickRotationRadians];
    v27 = objc_msgSend(v26, "numberWithDouble:");
    v51[0] = v27;
    v28 = NSNumber;
    [(CAMTimelapseShutterRingView *)self _smallTickRotationRadians];
    v30 = [v28 numberWithDouble:-v29];
    v51[1] = v30;
    id v31 = NSNumber;
    [(CAMTimelapseShutterRingView *)self _smallTickRotationRadians];
    CATransform3D v32 = objc_msgSend(v31, "numberWithDouble:");
    v51[2] = v32;
    CATransform3D v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v51 count:3];
    [v25 setValues:v33];

    [v25 setKeyTimes:&unk_26BDE0418];
    [v25 setCalculationMode:v23];
    [v25 setBeginTime:v4];
    [v25 setDuration:v6];
    CATransform3D v34 = [MEMORY[0x263F15808] functionWithName:v12];
    [v25 setTimingFunction:v34];

    LODWORD(v35) = 2139095040;
    [v25 setRepeatCount:v35];
    v36 = [MEMORY[0x263F157D8] animationWithKeyPath:@"transform.rotation.z"];
    [v36 setValues:&unk_26BDE0430];
    [v36 setKeyTimes:&unk_26BDE0448];
    [v36 setCalculationMode:*MEMORY[0x263F15970]];
    [v36 setDuration:v4];
    v37 = [MEMORY[0x263F15808] functionWithName:v46];
    [v36 setTimingFunction:v37];

    v38 = [MEMORY[0x263F157D8] animationWithKeyPath:@"transform.rotation.z"];
    [v38 setValues:&unk_26BDE0460];
    [v38 setKeyTimes:&unk_26BDE0478];
    [v38 setBeginTime:v4];
    [v38 setDuration:v6 * 0.5];
    v39 = [MEMORY[0x263F15808] functionWithName:v12];
    [v38 setTimingFunction:v39];

    LODWORD(v40) = 2139095040;
    [v38 setRepeatCount:v40];
    v50[0] = v22;
    v50[1] = v48;
    v50[2] = v25;
    v50[3] = v47;
    v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:v50 count:4];
    v42 = [MEMORY[0x263F15750] animation];
    [v42 setAnimations:v41];
    [v42 setDuration:6048000.0];
    v49[0] = v36;
    v49[1] = v38;
    v43 = [MEMORY[0x263EFF8C0] arrayWithObjects:v49 count:2];
    v44 = [MEMORY[0x263F15750] animation];
    [v44 setAnimations:v43];
    [v44 setDuration:6048000.0];
    [MEMORY[0x263F158F8] begin];
    [(CAReplicatorLayer *)self->__smallTickReplicatorLayer addAnimation:v42 forKey:@"kStartAnimationsKey"];
    [(CALayer *)self->__timerHandParentLayer addAnimation:v44 forKey:@"kStartAnimationsKey"];
    [MEMORY[0x263F158F8] commit];
  }
}

- (void)_addStopAnimations
{
  v82[2] = *MEMORY[0x263EF8340];
  if ([(CAMTimelapseShutterRingView *)self _shouldUseAnimations])
  {
    float v3 = [(CAReplicatorLayer *)self->__smallTickReplicatorLayer presentationLayer];
    smallTickReplicatorLayer = v3;
    if (!v3) {
      smallTickReplicatorLayer = self->__smallTickReplicatorLayer;
    }
    float v5 = smallTickReplicatorLayer;

    double v6 = [(CALayer *)self->__timerHandParentLayer presentationLayer];
    timerHandParentLayer = v6;
    if (!v6) {
      timerHandParentLayer = self->__timerHandParentLayer;
    }
    v8 = timerHandParentLayer;

    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    if (v5) {
      [(CAReplicatorLayer *)v5 instanceTransform];
    }
    long long v61 = v69;
    long long v62 = v70;
    long long v63 = v71;
    long long v64 = v72;
    long long v57 = v65;
    long long v58 = v66;
    long long v59 = v67;
    long long v60 = v68;
    [(CAMTimelapseShutterRingView *)self _rotationZFromTransform:&v57];
    double v10 = v9;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    if (v8) {
      [(CALayer *)v8 transform];
    }
    v54 = v8;
    v56[4] = v61;
    v56[5] = v62;
    v56[6] = v63;
    v56[7] = v64;
    v56[0] = v57;
    v56[1] = v58;
    v56[2] = v59;
    v56[3] = v60;
    [(CAMTimelapseShutterRingView *)self _rotationZFromTransform:v56];
    if (v11 >= 0.0) {
      double v12 = v11;
    }
    else {
      double v12 = v11 + 6.28318531;
    }
    UIAnimationDragCoefficient();
    double v14 = v13 * 0.4;
    double v15 = 1.0 - v12 / 6.28318531;
    v55 = v5;
    if (v10 <= 0.0)
    {
      double v16 = v14 * (v15 + 1.0);
      v79[0] = &unk_26BDDEA90;
      v26 = [NSNumber numberWithDouble:v15 / (v15 + 1.0)];
      v79[1] = v26;
      v79[2] = &unk_26BDDEA78;
      id v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v79 count:3];

      v27 = objc_msgSend(NSNumber, "numberWithInteger:", -[CAReplicatorLayer instanceCount](v5, "instanceCount"));
      v78[0] = v27;
      v78[1] = &unk_26BDDEA78;
      v28 = [NSNumber numberWithInteger:self->_spec.smallTickCount + 1];
      v78[2] = v28;
      uint64_t v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v78 count:3];

      uint64_t v19 = v29;
      v30 = [NSNumber numberWithDouble:v12];
      v77[0] = v30;
      v77[1] = &unk_26BDDF558;
      v77[2] = &unk_26BDDF568;
      uint64_t v52 = [MEMORY[0x263EFF8C0] arrayWithObjects:v77 count:3];

      id v31 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB0]];
      v76[0] = v31;
      CATransform3D v32 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EC0]];
      v76[1] = v32;
      uint64_t v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v76 count:2];

      v24 = [MEMORY[0x263F157D8] animationWithKeyPath:@"instanceTransform.rotation.z"];
      CATransform3D v33 = NSNumber;
      [(CAMTimelapseShutterRingView *)self _smallTickRotationRadians];
      double v35 = [v33 numberWithDouble:-v34];
      v75[0] = v35;
      v36 = NSNumber;
      [(CAMTimelapseShutterRingView *)self _smallTickRotationRadians];
      v37 = objc_msgSend(v36, "numberWithDouble:");
      v75[1] = v37;
      v38 = NSNumber;
      [(CAMTimelapseShutterRingView *)self _smallTickRotationRadians];
      double v40 = [v38 numberWithDouble:-v39];
      v75[2] = v40;
      v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:v75 count:3];
      [v24 setValues:v41];

      uint64_t v21 = v52;
      [v24 setKeyTimes:v25];
      [v24 setCalculationMode:*MEMORY[0x263F15968]];
      [v24 setDuration:v16];
      [v24 setTimingFunctions:v23];
    }
    else
    {
      double v16 = v14 * v15;
      double v17 = objc_msgSend(NSNumber, "numberWithInteger:", -[CAReplicatorLayer instanceCount](v5, "instanceCount"));
      v82[0] = v17;
      v18 = [NSNumber numberWithInteger:self->_spec.smallTickCount + 1];
      v82[1] = v18;
      uint64_t v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v82 count:2];

      CGRect v20 = [NSNumber numberWithDouble:v12];
      v81[0] = v20;
      v81[1] = &unk_26BDDF558;
      uint64_t v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v81 count:2];

      v22 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EC0]];
      v80 = v22;
      uint64_t v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v80 count:1];

      v24 = 0;
      id v25 = &unk_26BDE0490;
    }
    v42 = [MEMORY[0x263F157D8] animationWithKeyPath:@"instanceCount"];
    [v42 setValues:v19];
    [v42 setKeyTimes:v25];
    [v42 setDuration:v16];
    [v42 setTimingFunctions:v23];
    v43 = [MEMORY[0x263F157D8] animationWithKeyPath:@"transform.rotation.z"];
    [v43 setValues:v21];
    v53 = v25;
    [v43 setKeyTimes:v25];
    [v43 setDuration:v16];
    v44 = (void *)v23;
    [v43 setTimingFunctions:v23];
    v45 = (void *)v21;
    if (v24)
    {
      v74[0] = v24;
      v74[1] = v42;
      uint64_t v46 = (void *)MEMORY[0x263EFF8C0];
      v47 = (void **)v74;
      uint64_t v48 = 2;
    }
    else
    {
      v73 = v42;
      uint64_t v46 = (void *)MEMORY[0x263EFF8C0];
      v47 = &v73;
      uint64_t v48 = 1;
    }
    v49 = objc_msgSend(v46, "arrayWithObjects:count:", v47, v48, v19);
    v50 = [MEMORY[0x263F15750] animation];
    [v50 setAnimations:v49];
    [v50 setDuration:v16];
    [MEMORY[0x263F158F8] begin];
    [(CAReplicatorLayer *)self->__smallTickReplicatorLayer addAnimation:v50 forKey:@"kStopAnimationsKey"];
    [(CALayer *)self->__timerHandParentLayer addAnimation:v43 forKey:@"kStopAnimationsKey"];
    [MEMORY[0x263F158F8] commit];
  }
}

- (double)_rotationZFromTransform:(CATransform3D *)a3
{
  return atan2(a3->m12, a3->m11);
}

- ($EA90F2AF3C0DC35AB2D8304CE3BCA89E)spec
{
  long long v3 = *(_OWORD *)&self[15].var2;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[15].var0;
  *(_OWORD *)&retstr->var2 = v3;
  return self;
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (double)_smallTickRotationRadians
{
  return self->__smallTickRotationRadians;
}

- (double)_largeTickRotationRadians
{
  return self->__largeTickRotationRadians;
}

- (CALayer)_smallTickLayer
{
  return self->__smallTickLayer;
}

- (CALayer)_largeTickLayer
{
  return self->__largeTickLayer;
}

- (CAReplicatorLayer)_smallTickReplicatorLayer
{
  return self->__smallTickReplicatorLayer;
}

- (CAReplicatorLayer)_largeTickReplicatorLayer
{
  return self->__largeTickReplicatorLayer;
}

- (CALayer)_timerHandLayer
{
  return self->__timerHandLayer;
}

- (CALayer)_timerHandParentLayer
{
  return self->__timerHandParentLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__timerHandParentLayer, 0);
  objc_storeStrong((id *)&self->__timerHandLayer, 0);
  objc_storeStrong((id *)&self->__largeTickReplicatorLayer, 0);
  objc_storeStrong((id *)&self->__smallTickReplicatorLayer, 0);
  objc_storeStrong((id *)&self->__largeTickLayer, 0);
  objc_storeStrong((id *)&self->__smallTickLayer, 0);
}

@end