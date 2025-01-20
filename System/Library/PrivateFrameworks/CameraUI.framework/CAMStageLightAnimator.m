@interface CAMStageLightAnimator
- ($9C403407A5B624E1CD2E2AFE16A3B680)_gradientGeometryForState:(SEL)a3;
- ($C12B4627ED62839D2AEBF862580BED8F)_circleGeometryForState:(SEL)a3;
- ($C12B4627ED62839D2AEBF862580BED8F)_currentCircleGeometry;
- ($DD7213A072135978BB9F7CBA3523336B)_currentGradientProperties;
- ($DD7213A072135978BB9F7CBA3523336B)_gradientPropertiesForGeometry:(SEL)a3;
- (BOOL)_isAppearing;
- (CAGradientLayer)gradientLayer;
- (CAMStageLightAnimator)initWithGradientLayer:(id)a3 circleLayer:(id)a4;
- (CAShapeLayer)circleLayer;
- (CGRect)circleBaseFrame;
- (double)_circleLineWidth;
- (unint64_t)_appearingAnimationCount;
- (unint64_t)state;
- (void)_animateAppearing;
- (void)_animateBounceIfNeeded;
- (void)_animateCircleColorWithDuration:(double)a3 timing:(id)a4;
- (void)_animateCircleFromGeometry:(id *)a3 toGeometry:(id *)a4 duration:(double)a5 timing:(id)a6 repeats:(BOOL)a7 completion:(id)a8;
- (void)_animateCircleGeometry:(id *)a3 count:(unint64_t)a4 duration:(double)a5 timing:(id)a6 repeats:(BOOL)a7 completion:(id)a8;
- (void)_animateCircleToGeometry:(id *)a3 duration:(double)a4 timing:(id)a5 completion:(id)a6;
- (void)_animateGradientFromProperties:(id *)a3 toProperties:(id *)a4 duration:(double)a5 timing:(id)a6 repeats:(BOOL)a7;
- (void)_animateGradientProperties:(id *)a3 count:(unint64_t)a4 duration:(double)a5 timing:(id)a6 repeats:(BOOL)a7;
- (void)_animateGradientToProperties:(id *)a3 duration:(double)a4 timing:(id)a5;
- (void)_animateHidden;
- (void)_animateSearchingIfNeededFromState:(unint64_t)a3;
- (void)_didFinishAppearing;
- (void)_setAppearingAnimationCount:(unint64_t)a3;
- (void)setCircleBaseFrame:(CGRect)a3;
- (void)setCircleBaseFrame:(CGRect)a3 animated:(BOOL)a4;
- (void)setState:(unint64_t)a3;
@end

@implementation CAMStageLightAnimator

- (CAMStageLightAnimator)initWithGradientLayer:(id)a3 circleLayer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CAMStageLightAnimator;
  v9 = [(CAMStageLightAnimator *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_gradientLayer, a3);
    objc_storeStrong((id *)&v10->_circleLayer, a4);
  }

  return v10;
}

- (void)setCircleBaseFrame:(CGRect)a3
{
}

- (void)setCircleBaseFrame:(CGRect)a3 animated:(BOOL)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (!CGRectEqualToRect(a3, self->_circleBaseFrame))
  {
    self->_circleBaseFrame.origin.CGFloat x = x;
    self->_circleBaseFrame.origin.CGFloat y = y;
    self->_circleBaseFrame.size.CGFloat width = width;
    self->_circleBaseFrame.size.CGFloat height = height;
    unint64_t v10 = [(CAMStageLightAnimator *)self state];
    unint64_t v11 = v10;
    if (!v10 || v10 == 2)
    {
      [(CAMStageLightAnimator *)self _circleGeometryForState:v10];
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      [(CAMStageLightAnimator *)self _gradientGeometryForState:v11];
      uint64_t v24 = 0;
      long long v22 = 0u;
      long long v23 = 0u;
      -[CAMStageLightAnimator _gradientPropertiesForGeometry:](self, "_gradientPropertiesForGeometry:");
      if (v11 != 0 && a4) {
        double v18 = 0.5;
      }
      else {
        double v18 = 0.0;
      }
      v19 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EA0]];
      v20[0] = v22;
      v20[1] = v23;
      uint64_t v21 = v24;
      [(CAMStageLightAnimator *)self _animateGradientToProperties:v20 duration:v19 timing:v18];
      -[CAMStageLightAnimator _animateCircleToGeometry:duration:timing:completion:](self, "_animateCircleToGeometry:duration:timing:completion:", v19, 0, v13, v15, v17, v18);
      [(CAMStageLightAnimator *)self _animateCircleColorWithDuration:v19 timing:v18];
    }
    else if (v10 == 1)
    {
      [(CAMStageLightAnimator *)self _animateAppearing];
    }
  }
}

- (void)setState:(unint64_t)a3
{
  unint64_t state = self->_state;
  if (state == a3) {
    return;
  }
  self->_unint64_t state = a3;
  if (a3)
  {
    if (a3 != 2)
    {
      if (a3 != 1) {
        return;
      }
      if (state)
      {
        -[CAMStageLightAnimator _animateSearchingIfNeededFromState:](self, "_animateSearchingIfNeededFromState:");
        return;
      }
      goto LABEL_18;
    }
    if (!state)
    {
LABEL_18:
      [(CAMStageLightAnimator *)self _animateAppearing];
      return;
    }
    if (![(CAMStageLightAnimator *)self _isAppearing])
    {
      [(CAMStageLightAnimator *)self _animateBounceIfNeeded];
    }
  }
  else
  {
    [(CAMStageLightAnimator *)self _animateHidden];
  }
}

- (void)_animateAppearing
{
  [(CAMStageLightAnimator *)self _setAppearingAnimationCount:[(CAMStageLightAnimator *)self _appearingAnimationCount] + 1];
  [(CAMStageLightAnimator *)self _circleGeometryForState:1];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  [(CAMStageLightAnimator *)self _gradientGeometryForState:1];
  uint64_t v15 = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  -[CAMStageLightAnimator _gradientPropertiesForGeometry:](self, "_gradientPropertiesForGeometry:");
  v9 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EA0]];
  v11[0] = v13;
  v11[1] = v14;
  uint64_t v12 = v15;
  [(CAMStageLightAnimator *)self _animateGradientToProperties:v11 duration:v9 timing:0.5];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __42__CAMStageLightAnimator__animateAppearing__block_invoke;
  v10[3] = &unk_263FA0430;
  v10[4] = self;
  -[CAMStageLightAnimator _animateCircleToGeometry:duration:timing:completion:](self, "_animateCircleToGeometry:duration:timing:completion:", v9, v10, v4, v6, v8, 0.5);
}

uint64_t __42__CAMStageLightAnimator__animateAppearing__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didFinishAppearing];
}

- (void)_didFinishAppearing
{
  [(CAMStageLightAnimator *)self _setAppearingAnimationCount:[(CAMStageLightAnimator *)self _appearingAnimationCount] - 1];
  unint64_t v3 = [(CAMStageLightAnimator *)self state];
  if (v3 == 2)
  {
    [(CAMStageLightAnimator *)self _animateBounceIfNeeded];
  }
  else if (v3 == 1)
  {
    [(CAMStageLightAnimator *)self _animateSearchingIfNeededFromState:0];
  }
}

- (BOOL)_isAppearing
{
  return [(CAMStageLightAnimator *)self _appearingAnimationCount] != 0;
}

- (void)_animateSearchingIfNeededFromState:(unint64_t)a3
{
  if (![(CAMStageLightAnimator *)self _isAppearing])
  {
    BOOL v5 = a3 == 2;
    if (a3 == 2) {
      uint64_t v6 = 2;
    }
    else {
      uint64_t v6 = 1;
    }
    if (v5) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = 2;
    }
    [(CAMStageLightAnimator *)self _circleLineWidth];
    double v9 = v8;
    [(CAMStageLightAnimator *)self _circleGeometryForState:v6];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    [(CAMStageLightAnimator *)self _circleGeometryForState:v7];
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    uint64_t v35 = 0;
    long long v33 = 0u;
    long long v34 = 0u;
    -[CAMStageLightAnimator _gradientPropertiesForGeometry:](self, "_gradientPropertiesForGeometry:", v11 - v9, v11 - v9, v13, v15);
    uint64_t v32 = 0;
    long long v30 = 0u;
    long long v31 = 0u;
    -[CAMStageLightAnimator _gradientPropertiesForGeometry:](self, "_gradientPropertiesForGeometry:", v17 - v9, v17 - v9, v19, v21);
    LODWORD(v22) = 0.5;
    LODWORD(v23) = 0.5;
    LODWORD(v24) = 1.0;
    v25 = [MEMORY[0x263F15808] functionWithControlPoints:v22 :0.0 :v23 :v24];
    v28[0] = v33;
    v28[1] = v34;
    uint64_t v29 = v35;
    v26[0] = v30;
    v26[1] = v31;
    uint64_t v27 = v32;
    [(CAMStageLightAnimator *)self _animateGradientFromProperties:v28 toProperties:v26 duration:v25 timing:1 repeats:0.75];
    -[CAMStageLightAnimator _animateCircleFromGeometry:toGeometry:duration:timing:repeats:completion:](self, "_animateCircleFromGeometry:toGeometry:duration:timing:repeats:completion:", v25, 1, 0, v11, v13, v15, v17, v19, v21, 0.75);
    [(CAMStageLightAnimator *)self _animateCircleColorWithDuration:v25 timing:0.75];
  }
}

- (void)_animateBounceIfNeeded
{
  v28[9] = *MEMORY[0x263EF8340];
  if (![(CAMStageLightAnimator *)self _isAppearing])
  {
    uint64_t v27 = 0;
    long long v26 = 0u;
    long long v25 = 0u;
    memset(v24, 0, sizeof(v24));
    [(CAMStageLightAnimator *)self _currentCircleGeometry];
    v28[0] = v3;
    v28[1] = v4;
    _OWORD v28[2] = v5;
    [(CAMStageLightAnimator *)self _currentGradientProperties];
    [(CAMStageLightAnimator *)self _circleGeometryForState:2];
    double v7 = v6;
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    [(CAMStageLightAnimator *)self _gradientGeometryForState:2];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    -[CAMStageLightAnimator _gradientPropertiesForGeometry:](self, "_gradientPropertiesForGeometry:");
    long long v25 = v21;
    long long v26 = v22;
    uint64_t v27 = v23;
    *(double *)&v28[6] = v7;
    v28[7] = v9;
    v28[8] = v11;
    -[CAMStageLightAnimator _gradientPropertiesForGeometry:](self, "_gradientPropertiesForGeometry:", v13 + 8.0, v15 + 8.0, v17, v19);
    *(_OWORD *)((char *)&v24[2] + 8) = v21;
    *(_OWORD *)((char *)&v24[3] + 8) = v22;
    *((void *)&v24[4] + 1) = v23;
    *(double *)&v28[3] = v7 + 8.0;
    v28[4] = v9;
    v28[5] = v11;
    double v20 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EA0]];
    [(CAMStageLightAnimator *)self _animateGradientProperties:v24 count:3 duration:v20 timing:0 repeats:0.3];
    [(CAMStageLightAnimator *)self _animateCircleGeometry:v28 count:3 duration:v20 timing:0 repeats:0 completion:0.3];
    [(CAMStageLightAnimator *)self _animateCircleColorWithDuration:v20 timing:0.3];
  }
}

- (void)_animateHidden
{
  [(CAMStageLightAnimator *)self _circleGeometryForState:0];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  [(CAMStageLightAnimator *)self _gradientGeometryForState:0];
  uint64_t v17 = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  -[CAMStageLightAnimator _gradientPropertiesForGeometry:](self, "_gradientPropertiesForGeometry:");
  LODWORD(v9) = *(_DWORD *)"fff?";
  LODWORD(v10) = 0.75;
  LODWORD(v11) = 0.75;
  double v12 = [MEMORY[0x263F15808] functionWithControlPoints:v10 :0.0 :v11 :v9];
  v13[0] = v15;
  v13[1] = v16;
  uint64_t v14 = v17;
  [(CAMStageLightAnimator *)self _animateGradientToProperties:v13 duration:v12 timing:0.5];
  -[CAMStageLightAnimator _animateCircleToGeometry:duration:timing:completion:](self, "_animateCircleToGeometry:duration:timing:completion:", v12, 0, v4, v6, v8, 0.5);
  [(CAMStageLightAnimator *)self _animateCircleColorWithDuration:v12 timing:0.5];
}

- ($9C403407A5B624E1CD2E2AFE16A3B680)_gradientGeometryForState:(SEL)a3
{
  -[CAMStageLightAnimator _circleGeometryForState:](self, "_circleGeometryForState:");
  double v6 = [(CAMStageLightAnimator *)self gradientLayer];
  [v6 bounds];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  result = ($9C403407A5B624E1CD2E2AFE16A3B680 *)[(CAMStageLightAnimator *)self _circleLineWidth];
  if (a4 - 1 >= 2 && !a4)
  {
    v16.origin.CGFloat x = v8;
    v16.origin.CGFloat y = v10;
    v16.size.CGFloat width = v12;
    v16.size.CGFloat height = v14;
    CGRectGetMaxY(v16);
    return ($9C403407A5B624E1CD2E2AFE16A3B680 *)UIDistanceBetweenPoints();
  }
  return result;
}

- ($C12B4627ED62839D2AEBF862580BED8F)_circleGeometryForState:(SEL)a3
{
  return ($C12B4627ED62839D2AEBF862580BED8F *)UIRectGetCenter();
}

- (double)_circleLineWidth
{
  return 2.66666667;
}

- ($DD7213A072135978BB9F7CBA3523336B)_gradientPropertiesForGeometry:(SEL)a3
{
  double v8 = v7;
  double v9 = v6;
  double v10 = v5;
  double v11 = v4;
  double v13 = [(CAMStageLightAnimator *)self gradientLayer];
  [v13 bounds];
  double v15 = v14;
  double v17 = v16;

  retstr->var0.CGFloat x = v9 / v15;
  retstr->var0.CGFloat y = v8 / v17;
  retstr->var1.CGFloat x = v9 / v15 + v10 / v15;
  retstr->var1.CGFloat y = v8 / v17 + v10 / v17;
  retstr->var2 = fmin(v11 / v10, 0.99);
  return result;
}

- ($C12B4627ED62839D2AEBF862580BED8F)_currentCircleGeometry
{
  double v4 = [(CAMStageLightAnimator *)self circleLayer];
  double v5 = [v4 presentationLayer];
  double v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(CAMStageLightAnimator *)self circleLayer];
  }
  double v8 = v7;

  CGPathGetBoundingBox((CGPathRef)[v8 path]);
  UIRectGetCenter();

  return result;
}

- ($DD7213A072135978BB9F7CBA3523336B)_currentGradientProperties
{
  id v16 = [(CAMStageLightAnimator *)self gradientLayer];
  double v4 = [v16 presentationLayer];
  if (v4) {
    double v5 = v4;
  }
  else {
    double v5 = v16;
  }
  id v6 = v5;

  id v7 = [v6 locations];
  if ((unint64_t)[v7 count] < 2)
  {
    double v10 = 0.99;
  }
  else
  {
    double v8 = [v7 objectAtIndexedSubscript:1];
    [v8 floatValue];
    double v10 = v9;
  }
  retstr->var2 = 0.0;
  retstr->var0 = 0u;
  retstr->var1 = 0u;
  [v6 startPoint];
  retstr->var0.CGFloat x = v11;
  retstr->var0.CGFloat y = v12;
  [v6 endPoint];
  retstr->var1.CGFloat x = v13;
  retstr->var1.CGFloat y = v14;
  retstr->var2 = v10;

  return result;
}

- (void)_animateGradientToProperties:(id *)a3 duration:(double)a4 timing:(id)a5
{
  uint64_t v16 = 0;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = a5;
  [(CAMStageLightAnimator *)self _currentGradientProperties];
  v12[0] = v14;
  v12[1] = v15;
  uint64_t v13 = v16;
  CGPoint var1 = a3->var1;
  v10[0] = a3->var0;
  v10[1] = var1;
  double var2 = a3->var2;
  [(CAMStageLightAnimator *)self _animateGradientFromProperties:v12 toProperties:v10 duration:v8 timing:0 repeats:a4];
}

- (void)_animateGradientFromProperties:(id *)a3 toProperties:(id *)a4 duration:(double)a5 timing:(id)a6 repeats:(BOOL)a7
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  CGPoint var1 = a3->var1;
  v9[0] = a3->var0;
  v9[1] = var1;
  CGPoint v8 = a4->var1;
  CGPoint var0 = a4->var0;
  double var2 = a3->var2;
  CGPoint v12 = v8;
  double v13 = a4->var2;
  [(CAMStageLightAnimator *)self _animateGradientProperties:v9 count:2 duration:a6 timing:a7 repeats:a5];
}

- (void)_animateGradientProperties:(id *)a3 count:(unint64_t)a4 duration:(double)a5 timing:(id)a6 repeats:(BOOL)a7
{
  BOOL v36 = a7;
  v44[3] = *MEMORY[0x263EF8340];
  id v38 = a6;
  double v10 = [MEMORY[0x263EFF980] arrayWithCapacity:a4];
  CGFloat v11 = [MEMORY[0x263EFF980] arrayWithCapacity:a4];
  CGPoint v12 = [MEMORY[0x263EFF980] arrayWithCapacity:a4];
  if (a4)
  {
    p_CGPoint var1 = &a3->var1;
    do
    {
      double x = p_var1->x;
      double y = p_var1->y;
      double v16 = p_var1[1].x;
      double v17 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", p_var1[-1].x, p_var1[-1].y);
      [v10 addObject:v17];

      double v18 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", x, y);
      [v11 addObject:v18];

      v44[0] = &unk_26BDDE5B0;
      double v19 = [NSNumber numberWithDouble:v16];
      v44[1] = v19;
      v44[2] = &unk_26BDDE5C8;
      [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:3];
      long long v21 = v20 = v11;
      [v12 addObject:v21];

      CGFloat v11 = v20;
      p_CGPoint var1 = (CGPoint *)((char *)p_var1 + 40);
      --a4;
    }
    while (a4);
  }
  long long v22 = [(CAMStageLightAnimator *)self gradientLayer];
  if (a5 > 0.0)
  {
    if (v36) {
      float v23 = INFINITY;
    }
    else {
      float v23 = 0.0;
    }
    double v24 = [MEMORY[0x263F157D8] animationWithKeyPath:@"locations"];
    [v24 setTimingFunction:v38];
    [v24 setDuration:a5];
    [v24 setValues:v12];
    *(float *)&double v25 = v23;
    [v24 setRepeatCount:v25];
    [v24 setAutoreverses:v36];
    [v22 addAnimation:v24 forKey:@"visibleLocations"];
    long long v26 = [MEMORY[0x263F157D8] animationWithKeyPath:@"endPoint"];
    [v26 setTimingFunction:v38];
    [v26 setDuration:a5];
    [v26 setValues:v11];
    *(float *)&double v27 = v23;
    [v26 setRepeatCount:v27];
    [v26 setAutoreverses:v36];
    [v22 addAnimation:v26 forKey:@"visibleEndPoint"];
    [MEMORY[0x263F157D8] animationWithKeyPath:@"startPoint"];
    uint64_t v29 = v28 = v11;
    [v29 setTimingFunction:v38];
    [v29 setDuration:a5];
    [v29 setValues:v10];
    *(float *)&double v30 = v23;
    [v29 setRepeatCount:v30];
    [v29 setAutoreverses:v36];
    [v22 addAnimation:v29 forKey:@"visibleStartPoint"];

    CGFloat v11 = v28;
  }
  long long v31 = (void *)MEMORY[0x263F82E00];
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __82__CAMStageLightAnimator__animateGradientProperties_count_duration_timing_repeats___block_invoke;
  v39[3] = &unk_263FA0A60;
  id v40 = v22;
  id v41 = v10;
  id v42 = v11;
  id v43 = v12;
  id v32 = v12;
  id v33 = v11;
  id v34 = v10;
  id v35 = v22;
  [v31 performWithoutAnimation:v39];
}

void __82__CAMStageLightAnimator__animateGradientProperties_count_duration_timing_repeats___block_invoke(id *a1)
{
  v2 = [a1[5] lastObject];
  [v2 CGPointValue];
  objc_msgSend(a1[4], "setStartPoint:");

  double v3 = [a1[6] lastObject];
  [v3 CGPointValue];
  objc_msgSend(a1[4], "setEndPoint:");

  id v4 = [a1[7] lastObject];
  [a1[4] setLocations:v4];
}

- (void)_animateCircleToGeometry:(id *)a3 duration:(double)a4 timing:(id)a5 completion:(id)a6
{
  id v8 = a5;
  float v9 = a3;
  [(CAMStageLightAnimator *)self _currentCircleGeometry];
  -[CAMStageLightAnimator _animateCircleFromGeometry:toGeometry:duration:timing:repeats:completion:](self, "_animateCircleFromGeometry:toGeometry:duration:timing:repeats:completion:", v9, 0, v8);
}

- (void)_animateCircleFromGeometry:(id *)a3 toGeometry:(id *)a4 duration:(double)a5 timing:(id)a6 repeats:(BOOL)a7 completion:(id)a8
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  double v14 = a5;
  uint64_t v15 = v8;
  uint64_t v16 = v9;
  uint64_t v17 = v10;
  uint64_t v18 = v11;
  uint64_t v19 = v12;
  [(CAMStageLightAnimator *)self _animateCircleGeometry:&v14 count:2 duration:a3 timing:a4 repeats:a6 completion:v13];
}

- (void)_animateCircleGeometry:(id *)a3 count:(unint64_t)a4 duration:(double)a5 timing:(id)a6 repeats:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  id v14 = a6;
  id v15 = a8;
  uint64_t v16 = [MEMORY[0x263EFF980] arrayWithCapacity:a4];
  if (a4)
  {
    p_double y = &a3->var1.y;
    do
    {
      p_y += 3;
      UIRectCenteredAboutPointScale();
      uint64_t v18 = CGPathCreateWithEllipseInRect(v27, 0);
      [v16 addObject:v18];
      CGPathRelease(v18);
      --a4;
    }
    while (a4);
  }
  uint64_t v19 = [(CAMStageLightAnimator *)self circleLayer];
  if (a5 > 0.0)
  {
    if (v9) {
      float v20 = INFINITY;
    }
    else {
      float v20 = 0.0;
    }
    long long v21 = objc_alloc_init(CAMAnimationDelegate);
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __89__CAMStageLightAnimator__animateCircleGeometry_count_duration_timing_repeats_completion___block_invoke;
    v25[3] = &unk_263FA1EE0;
    id v26 = v15;
    [(CAMAnimationDelegate *)v21 setCompletion:v25];
    long long v22 = [MEMORY[0x263F157D8] animationWithKeyPath:@"path"];
    [v22 setTimingFunction:v14];
    [v22 setDuration:a5];
    [v22 setValues:v16];
    *(float *)&double v23 = v20;
    [v22 setRepeatCount:v23];
    [v22 setAutoreverses:v9];
    [v22 setDelegate:v21];
    [v19 addAnimation:v22 forKey:@"circlePaths"];
  }
  double v24 = [v16 lastObject];
  [v19 setPath:v24];
}

uint64_t __89__CAMStageLightAnimator__animateCircleGeometry_count_duration_timing_repeats_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_animateCircleColorWithDuration:(double)a3 timing:(id)a4
{
  id v16 = a4;
  id v6 = [(CAMStageLightAnimator *)self circleLayer];
  unint64_t v7 = [(CAMStageLightAnimator *)self state];
  if (v7 >= 2)
  {
    if (v7 != 2)
    {
      uint64_t v10 = 0;
      goto LABEL_7;
    }
    uint64_t v8 = CAMYellowColor();
  }
  else
  {
    uint64_t v8 = [MEMORY[0x263F825C8] whiteColor];
  }
  id v9 = v8;
  uint64_t v10 = [v9 CGColor];

LABEL_7:
  if (a3 > 0.0)
  {
    uint64_t v11 = [v6 presentationLayer];
    uint64_t v12 = (void *)v11;
    if (v11) {
      double v13 = (void *)v11;
    }
    else {
      double v13 = v6;
    }
    id v14 = v13;

    id v15 = [MEMORY[0x263F15760] animationWithKeyPath:@"fillColor"];
    objc_msgSend(v15, "setFromValue:", objc_msgSend(v14, "fillColor"));
    [v15 setToValue:v10];
    [v15 setDuration:a3];
    [v15 setTimingFunction:v16];
    [v6 addAnimation:v15 forKey:@"activeFillColor"];
  }
  [v6 setFillColor:v10];
}

- (CAGradientLayer)gradientLayer
{
  return self->_gradientLayer;
}

- (CAShapeLayer)circleLayer
{
  return self->_circleLayer;
}

- (unint64_t)state
{
  return self->_state;
}

- (CGRect)circleBaseFrame
{
  double x = self->_circleBaseFrame.origin.x;
  double y = self->_circleBaseFrame.origin.y;
  double width = self->_circleBaseFrame.size.width;
  double height = self->_circleBaseFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (unint64_t)_appearingAnimationCount
{
  return self->__appearingAnimationCount;
}

- (void)_setAppearingAnimationCount:(unint64_t)a3
{
  self->__appearingAnimationCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_circleLayer, 0);
  objc_storeStrong((id *)&self->_gradientLayer, 0);
}

@end