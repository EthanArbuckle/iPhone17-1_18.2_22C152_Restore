@interface NTKAkitaContentView
- (BOOL)isAnimating;
- (BOOL)updateDate;
- (CGPath)_hairPathForIndex:(unint64_t)a3;
- (CGPath)_headPathForIndex:(unint64_t)a3;
- (CGPath)_lipsInnerPathForIndex:(unint64_t)a3;
- (CGPath)_lipsOuterPathForIndex:(unint64_t)a3 fullness:(unint64_t)a4;
- (CGPath)_neckPathForIndex:(unint64_t)a3;
- (CGPath)_nosePathForIndex:(unint64_t)a3;
- (CGPath)_shirtPathForIndex:(unint64_t)a3;
- (NTKAkitaContentView)initWithFrame:(CGRect)a3 role:(unint64_t)a4 morph:(id)a5 dateProvider:(id)a6 is24HourMode:(BOOL)a7 device:(id)a8;
- (id)_createFillShapeLayerOfSize:(CGSize)a3 parent:(id)a4;
- (id)_createLayerOfSize:(CGSize)a3 parent:(id)a4;
- (id)_createLeftEyeLayerOfSize:(CGSize)a3 parent:(id)a4;
- (id)_createRightEyeLayerOfSize:(CGSize)a3 parent:(id)a4;
- (id)_createStrokeShapeLayerOfSize:(CGSize)a3 parent:(id)a4;
- (id)_createTextLayerOfSize:(CGSize)a3 x:(double)a4 alignment:(id)a5 parent:(id)a6;
- (void)_animateFromMorph:(id)a3 toMorph:(id)a4;
- (void)_handleSignificantTimeChange:(id)a3;
- (void)_setMorph:(id)a3;
- (void)_setupSceneForLayer:(id)a3 size:(CGSize)a4;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)dealloc;
- (void)interpolateFromMorph:(id)a3 toMorph:(id)a4 fraction:(double)a5;
- (void)set24HourMode:(BOOL)a3;
- (void)setAdjustsForStatusBarIcon:(BOOL)a3 animated:(BOOL)a4;
- (void)setBackgroundColor:(id)a3;
- (void)setMorph:(id)a3 animate:(BOOL)a4;
- (void)setPaused:(BOOL)a3;
- (void)timerFired;
- (void)waitForAnimationsWithCompletion:(id)a3;
@end

@implementation NTKAkitaContentView

- (NTKAkitaContentView)initWithFrame:(CGRect)a3 role:(unint64_t)a4 morph:(id)a5 dateProvider:(id)a6 is24HourMode:(BOOL)a7 device:(id)a8
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  v28.receiver = self;
  v28.super_class = (Class)NTKAkitaContentView;
  v20 = -[NTKAkitaContentView initWithFrame:](&v28, "initWithFrame:", x, y, width, height);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_device, a8);
    v21->_role = a4;
    v21->_lineWidth = width * 0.0138888889;
    id v22 = objc_retainBlock(v18);
    id dateProvider = v21->_dateProvider;
    v21->_id dateProvider = v22;

    v21->_currentHour = -1;
    v21->_currentMinute = -1;
    v21->_is24HourMode = a7;
    v21->_isLuxo = [v19 deviceCategory] != (char *)&dword_0 + 1;
    v24 = [(NTKAkitaContentView *)v21 layer];
    [v24 setMasksToBounds:1];
    v25 = sub_6C30();
    [v24 setActions:v25];

    -[NTKAkitaContentView _setupSceneForLayer:size:](v21, "_setupSceneForLayer:size:", v24, width, height);
    [(NTKAkitaContentView *)v21 setMorph:v17 animate:0];
    v26 = +[NSNotificationCenter defaultCenter];
    [v26 addObserver:v21 selector:"_handleSignificantTimeChange:" name:UIApplicationSignificantTimeChangeNotification object:0];
  }
  return v21;
}

- (void)dealloc
{
  uint64_t v3 = 0;
  hairPaths = self->_hairPaths;
  do
    CGPathRelease(hairPaths[v3++]);
  while (v3 != 12);
  for (uint64_t i = 0; i != 10; ++i)
  {
    CGPathRelease(self->_neckPaths[i]);
    CGPathRelease(self->_headPaths[i]);
    CGPathRelease(self->_shirtPaths[i]);
  }
  for (uint64_t j = 0; j != 6; ++j)
    CGPathRelease(self->_nosePaths[j]);
  for (uint64_t k = 0; k != 9; ++k)
  {
    CGPathRelease(self->_lipsInnerPaths[k]);
    CGPathRelease(self->_lipsOuterPaths[k]);
  }
  v8 = +[NSNotificationCenter defaultCenter];
  [v8 removeObserver:self name:UIApplicationSignificantTimeChangeNotification object:0];

  v9.receiver = self;
  v9.super_class = (Class)NTKAkitaContentView;
  [(NTKAkitaContentView *)&v9 dealloc];
}

- (void)_handleSignificantTimeChange:(id)a3
{
  calendar = self->_calendar;
  v5 = +[NSTimeZone systemTimeZone];
  [(NSCalendar *)calendar setTimeZone:v5];

  [(NTKAkitaContentView *)self updateDate];
}

- (CGPath)_hairPathForIndex:(unint64_t)a3
{
  hairPaths = self->_hairPaths;
  v4 = self->_hairPaths[a3];
  if (!v4)
  {
    v6 = (char *)&NTKAkitaHairPathData + 16 * a3;
    [(NTKAkitaContentView *)self frame];
    v4 = sub_6EAC((uint64_t)v6, 1, v7, v8);
    hairPaths[a3] = v4;
  }
  return v4;
}

- (CGPath)_neckPathForIndex:(unint64_t)a3
{
  neckPaths = self->_neckPaths;
  v4 = self->_neckPaths[a3];
  if (!v4)
  {
    v6 = (char *)&NTKAkitaNeckPathData + 16 * a3;
    [(NTKAkitaContentView *)self frame];
    v4 = sub_6EAC((uint64_t)v6, 1, v7, v8);
    neckPaths[a3] = v4;
  }
  return v4;
}

- (CGPath)_headPathForIndex:(unint64_t)a3
{
  headPaths = self->_headPaths;
  v4 = self->_headPaths[a3];
  if (!v4)
  {
    v6 = (char *)&NTKAkitaHeadPathData + 16 * a3;
    [(NTKAkitaContentView *)self frame];
    v4 = sub_6EAC((uint64_t)v6, 1, v7, v8);
    headPaths[a3] = v4;
  }
  return v4;
}

- (CGPath)_shirtPathForIndex:(unint64_t)a3
{
  shirtPaths = self->_shirtPaths;
  v4 = self->_shirtPaths[a3];
  if (!v4)
  {
    v6 = (char *)&NTKAkitaShirtPathData + 16 * a3;
    [(NTKAkitaContentView *)self frame];
    v4 = sub_6EAC((uint64_t)v6, 1, v7, v8);
    shirtPaths[a3] = v4;
  }
  return v4;
}

- (CGPath)_nosePathForIndex:(unint64_t)a3
{
  nosePaths = self->_nosePaths;
  v4 = self->_nosePaths[a3];
  if (!v4)
  {
    v6 = (char *)&NTKAkitaNosePathData + 16 * a3;
    [(NTKAkitaContentView *)self frame];
    v4 = sub_6EAC((uint64_t)v6, 0, v7, v8);
    nosePaths[a3] = v4;
  }
  return v4;
}

- (CGPath)_lipsInnerPathForIndex:(unint64_t)a3
{
  lipsInnerPaths = self->_lipsInnerPaths;
  v4 = self->_lipsInnerPaths[a3];
  if (!v4)
  {
    v6 = (char *)&NTKAkitaLipsInnerPathData + 16 * a3;
    [(NTKAkitaContentView *)self frame];
    v4 = sub_6EAC((uint64_t)v6, 0, v7, v8);
    lipsInnerPaths[a3] = v4;
  }
  return v4;
}

- (CGPath)_lipsOuterPathForIndex:(unint64_t)a3 fullness:(unint64_t)a4
{
  unint64_t v4 = 9 * a4 + a3;
  lipsOuterPaths = self->_lipsOuterPaths;
  Mutable = self->_lipsOuterPaths[v4];
  if (!Mutable)
  {
    [(NTKAkitaContentView *)self frame];
    if (a4)
    {
      v11 = (char *)&NTKAkitaLipsOuterPathData + 16 * a3;
      uint64_t v12 = *((unsigned int *)v11 + 1);
      if ((int)v12 < 1)
      {
        Mutable = 0;
      }
      else
      {
        float64_t v39 = v10;
        float64_t v40 = v9;
        Mutable = CGPathCreateMutable();
        v13 = (float32x2_t *)*((void *)v11 + 1);
        v14 = v13 + 1;
        float32x2_t v15 = *v13;
        uint64_t v16 = v12;
        float32x2_t v17 = *v13;
        do
        {
          float32x2_t v18 = v14[-1];
          float32x2_t v19 = (float32x2_t)vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_f32(v17, v18), 0), (int8x8_t)v18, (int8x8_t)v17);
          float32x2_t v20 = (float32x2_t)vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_f32(v18, v15), 0), (int8x8_t)v18, (int8x8_t)v15);
          float32x2_t v17 = (float32x2_t)vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_f32(v19, *v14), 0), (int8x8_t)*v14, (int8x8_t)v19);
          float32x2_t v15 = (float32x2_t)vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_f32(*v14, v20), 0), (int8x8_t)*v14, (int8x8_t)v20);
          v14 += 4;
          --v16;
        }
        while (v16);
        uint64_t v21 = 0;
        v22.f64[0] = v40;
        v22.f64[1] = v39;
        float32x2_t v23 = vcvt_f32_f64(v22);
        float32x2_t v24 = vsub_f32(v15, v17);
        float32x2_t v25 = vmul_n_f32(v24, 1.0 / sqrtf(vaddv_f32(vmul_f32(v24, v24))));
        v26 = v13 + 2;
        do
        {
          float32x2_t v28 = v26[-1];
          float32x2_t v27 = *v26;
          float32x2_t v29 = v26[1];
          if (!v21)
          {
            float32x2_t v30 = vmul_f32(v25, vsub_f32(v26[-2], v17));
            float32x2_t v31 = vmul_f32(vmla_n_f32(v17, v25, vadd_f32(v30, (float32x2_t)vdup_lane_s32((int32x2_t)v30, 1)).f32[0]), v23);
            CGPathMoveToPoint(Mutable, 0, v31.f32[0], v31.f32[1]);
          }
          float32x2_t v32 = vmul_f32(v25, vsub_f32(v28, v17));
          float32x2_t v33 = vmul_f32(vmla_n_f32(v17, v25, vadd_f32(v32, (float32x2_t)vdup_lane_s32((int32x2_t)v32, 1)).f32[0]), v23);
          float32x2_t v34 = vmul_f32(v25, vsub_f32(v27, v17));
          float32x2_t v35 = vmul_f32(vmla_n_f32(v17, v25, vadd_f32(v34, (float32x2_t)vdup_lane_s32((int32x2_t)v34, 1)).f32[0]), v23);
          float32x2_t v36 = vmul_f32(v25, vsub_f32(v29, v17));
          float32x2_t v37 = vmul_f32(vmla_n_f32(v17, v25, vadd_f32(v36, (float32x2_t)vdup_lane_s32((int32x2_t)v36, 1)).f32[0]), v23);
          CGPathAddCurveToPoint(Mutable, 0, v35.f32[0], v35.f32[1], v37.f32[0], v37.f32[1], v33.f32[0], v33.f32[1]);
          ++v21;
          v26 += 4;
        }
        while ((int)v12 != v21);
        CGPathCloseSubpath(Mutable);
      }
    }
    else
    {
      Mutable = sub_6EAC((uint64_t)&NTKAkitaLipsOuterPathData + 16 * a3, 1, v9, v10);
    }
    lipsOuterPaths[v4] = Mutable;
  }
  return Mutable;
}

- (BOOL)isAnimating
{
  return self->_animatingMorph != 0;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  v6 = (void (**)(void))objc_retainBlock(self->_animationCompletion);
  if (v6)
  {
    id animationCompletion = self->_animationCompletion;
    self->_id animationCompletion = 0;

    v6[2]();
  }
}

- (void)_setMorph:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_currentMorph, a3);
  animatingMorph = self->_animatingMorph;
  self->_animatingMorph = 0;

  interpolateToMorph = self->_interpolateToMorph;
  self->_interpolateToMorph = 0;

  interpolateFromMorph = self->_interpolateFromMorph;
  self->_interpolateFromMorph = 0;

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  float64_t v9 = self->_morphLayers;
  id v10 = [(NSArray *)v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v25 + 1) + 8 * i) removeAllAnimations];
      }
      id v11 = [(NSArray *)v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v11);
  }

  if (v5) {
    [v5 config];
  }
  id CGColor = NTKAkitaColorGetCGColor(0, 0);
  id v14 = NTKAkitaColorGetCGColor(0, 1);
  id v15 = NTKAkitaColorGetCGColor(0, 0);
  id v16 = NTKAkitaColorGetCGColor(0, 0);
  id v24 = NTKAkitaColorGetCGColor(0, 0);
  if (self->_role) {
    unint64_t v17 = 0;
  }
  else {
    unint64_t v17 = 2;
  }
  id v18 = NTKAkitaColorGetCGColor(v17, 0);
  [(CAShapeLayer *)self->_hairLayer setPath:[(NTKAkitaContentView *)self _hairPathForIndex:0]];
  hairLayer = self->_hairLayer;
  if (self->_role) {
    [(CAShapeLayer *)hairLayer setStrokeColor:v15];
  }
  else {
    [(CAShapeLayer *)hairLayer setFillColor:v15];
  }
  [(CAShapeLayer *)self->_shirtLayer setPath:[(NTKAkitaContentView *)self _shirtPathForIndex:0]];
  shirtLayer = self->_shirtLayer;
  if (self->_role) {
    [(CAShapeLayer *)shirtLayer setStrokeColor:v16];
  }
  else {
    [(CAShapeLayer *)shirtLayer setFillColor:v16];
  }
  [(CAShapeLayer *)self->_neckLayer setPath:[(NTKAkitaContentView *)self _neckPathForIndex:0]];
  neckLayer = self->_neckLayer;
  if (self->_role) {
    [(CAShapeLayer *)neckLayer setStrokeColor:v14];
  }
  else {
    [(CAShapeLayer *)neckLayer setFillColor:v14];
  }
  [(CAShapeLayer *)self->_headLayer setPath:[(NTKAkitaContentView *)self _headPathForIndex:0]];
  headLayer = self->_headLayer;
  if (self->_role) {
    [(CAShapeLayer *)headLayer setStrokeColor:CGColor];
  }
  else {
    [(CAShapeLayer *)headLayer setFillColor:CGColor];
  }
  [(CAShapeLayer *)self->_noseLayer setPath:[(NTKAkitaContentView *)self _nosePathForIndex:0]];
  [(CAShapeLayer *)self->_lipsOuterLayer setPath:[(NTKAkitaContentView *)self _lipsOuterPathForIndex:0 fullness:0]];
  [(CAShapeLayer *)self->_lipsInnerLayer setPath:[(NTKAkitaContentView *)self _lipsInnerPathForIndex:0]];
  [(CAShapeLayer *)self->_noseLayer setStrokeColor:v18];
  [(CAShapeLayer *)self->_lipsOuterLayer setStrokeColor:v18];
  [(CAShapeLayer *)self->_lipsInnerLayer setStrokeColor:v18];
  [(CALayer *)self->_backgroundLayer setBackgroundColor:v24];
}

- (void)interpolateFromMorph:(id)a3 toMorph:(id)a4 fraction:(double)a5
{
  id v9 = a3;
  id v10 = a4;
  currentMorph = self->_currentMorph;
  self->_currentMorph = 0;

  animatingMorph = self->_animatingMorph;
  self->_animatingMorph = 0;

  if (![(NTKAkitaMorph *)self->_interpolateFromMorph isEqualToMorph:v9]
    || ![(NTKAkitaMorph *)self->_interpolateToMorph isEqualToMorph:v10])
  {
    id v23 = v10;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v13 = self->_morphLayers;
    id v14 = [(NSArray *)v13 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v29;
      do
      {
        unint64_t v17 = 0;
        do
        {
          if (*(void *)v29 != v16) {
            objc_enumerationMutation(v13);
          }
          [*(id *)(*((void *)&v28 + 1) + 8 * (void)v17) setSpeed:0.0];
          unint64_t v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        id v15 = [(NSArray *)v13 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v15);
    }

    [(NTKAkitaContentView *)self _setMorph:v9];
    objc_storeStrong((id *)&self->_interpolateFromMorph, a3);
    objc_storeStrong((id *)&self->_interpolateToMorph, a4);
    id v10 = v23;
    [(NTKAkitaContentView *)self _animateFromMorph:v9 toMorph:v23];
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v18 = self->_morphLayers;
  id v19 = [(NSArray *)v18 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v25;
    do
    {
      float64x2_t v22 = 0;
      do
      {
        if (*(void *)v25 != v21) {
          objc_enumerationMutation(v18);
        }
        [*(id *)(*((void *)&v24 + 1) + 8 * (void)v22) setTimeOffset:a5];
        float64x2_t v22 = (char *)v22 + 1;
      }
      while (v20 != v22);
      id v20 = [(NSArray *)v18 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v20);
  }
}

- (void)_animateFromMorph:(id)a3 toMorph:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  float64_t v8 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
  long long v9 = 0uLL;
  if (v6)
  {
    [v6 config];
    long long v9 = 0uLL;
  }
  long long v70 = v9;
  long long v71 = v9;
  long long v68 = v9;
  long long v69 = v9;
  v66 = v7;
  v67 = v6;
  if (v7)
  {
    [v7 config];
    uint64_t v62 = *((void *)&v71 + 1);
    uint64_t v10 = *((void *)&v70 + 1);
    unint64_t v11 = v69;
  }
  else
  {
    unint64_t v11 = 0;
    uint64_t v62 = 0;
    uint64_t v10 = 0;
  }
  if (self->_role) {
    unint64_t v12 = v11;
  }
  else {
    unint64_t v12 = 2;
  }
  id CGColor = (CGColor *)NTKAkitaColorGetCGColor(v12, 0);
  if (self->_role) {
    v13 = @"strokeColor";
  }
  else {
    v13 = @"fillColor";
  }
  id v14 = v13;
  hairLayer = self->_hairLayer;
  uint64_t v16 = [(NTKAkitaContentView *)self _hairPathForIndex:0];
  unint64_t v17 = [(NTKAkitaContentView *)self _hairPathForIndex:(void)v70];
  id v18 = NTKAkitaColorGetCGColor(0, 0);
  id v19 = NTKAkitaColorGetCGColor(*((unint64_t *)&v68 + 1), 0);
  id v20 = sub_80EC((uint64_t)v16, (uint64_t)v17, (uint64_t)v18, (uint64_t)v19, v14, v8);
  [(CAShapeLayer *)hairLayer addAnimation:v20 forKey:@"morph"];

  shirtLayer = self->_shirtLayer;
  float64x2_t v22 = [(NTKAkitaContentView *)self _shirtPathForIndex:0];
  id v23 = [(NTKAkitaContentView *)self _shirtPathForIndex:v10];
  uint64_t v24 = v10;
  uint64_t v63 = v10;
  id v25 = NTKAkitaColorGetCGColor(0, 0);
  id v26 = NTKAkitaColorGetCGColor(*((unint64_t *)&v69 + 1), 0);
  long long v27 = sub_80EC((uint64_t)v22, (uint64_t)v23, (uint64_t)v25, (uint64_t)v26, v14, v8);
  [(CAShapeLayer *)shirtLayer addAnimation:v27 forKey:@"morph"];

  neckLayer = self->_neckLayer;
  long long v29 = [(NTKAkitaContentView *)self _neckPathForIndex:0];
  long long v30 = [(NTKAkitaContentView *)self _neckPathForIndex:v24];
  id v31 = NTKAkitaColorGetCGColor(0, 1);
  id v32 = NTKAkitaColorGetCGColor(v11, 1);
  float32x2_t v33 = sub_80EC((uint64_t)v29, (uint64_t)v30, (uint64_t)v31, (uint64_t)v32, v14, v8);
  [(CAShapeLayer *)neckLayer addAnimation:v33 forKey:@"morph"];

  headLayer = self->_headLayer;
  float32x2_t v35 = [(NTKAkitaContentView *)self _headPathForIndex:0];
  float32x2_t v36 = [(NTKAkitaContentView *)self _headPathForIndex:v63];
  id v37 = NTKAkitaColorGetCGColor(0, 0);
  id v38 = NTKAkitaColorGetCGColor(v11, 0);
  v65 = v14;
  float64_t v39 = sub_80EC((uint64_t)v35, (uint64_t)v36, (uint64_t)v37, (uint64_t)v38, v14, v8);
  [(CAShapeLayer *)headLayer addAnimation:v39 forKey:@"morph"];

  noseLayer = self->_noseLayer;
  v41 = sub_8244((uint64_t)[(NTKAkitaContentView *)self _nosePathForIndex:0], (uint64_t)[(NTKAkitaContentView *)self _nosePathForIndex:(void)v71], v8);
  [(CAShapeLayer *)noseLayer addAnimation:v41 forKey:@"morph"];

  lipsOuterLayer = self->_lipsOuterLayer;
  v43 = [(NTKAkitaContentView *)self _lipsOuterPathForIndex:0 fullness:0];
  v44 = [(NTKAkitaContentView *)self _lipsOuterPathForIndex:0 fullness:1];
  v45 = [(NTKAkitaContentView *)self _lipsOuterPathForIndex:v62 fullness:0];
  v46 = [(NTKAkitaContentView *)self _lipsOuterPathForIndex:v62 fullness:1];
  v47 = lipsOuterLayer;
  id v48 = v8;
  if (v43 && v45)
  {
    uint64_t v49 = v62;
    v50 = sub_8244((uint64_t)v43, (uint64_t)v45, v48);
    v51 = CGColor;
  }
  else
  {
    uint64_t v49 = v62;
    if (v43)
    {
      uint64_t v52 = (uint64_t)v43;
      int v53 = 1;
      uint64_t v54 = (uint64_t)v44;
      int v55 = 0;
    }
    else
    {
      uint64_t v52 = (uint64_t)v46;
      int v53 = 0;
      uint64_t v54 = (uint64_t)v45;
      int v55 = 1;
    }
    v51 = CGColor;
    v50 = sub_8300(v47, v52, v53, v54, v55, CGColor, v48);
  }

  [(CAShapeLayer *)v47 addAnimation:v50 forKey:@"morph"];
  lipsInnerLayer = self->_lipsInnerLayer;
  v57 = sub_8300(lipsInnerLayer, (uint64_t)[(NTKAkitaContentView *)self _lipsInnerPathForIndex:0], NTKAkitaLipsInnerPathData, (uint64_t)[(NTKAkitaContentView *)self _lipsInnerPathForIndex:v49], *((unsigned __int8 *)&NTKAkitaLipsInnerPathData + 16 * v49), v51, v48);
  [(CAShapeLayer *)lipsInnerLayer addAnimation:v57 forKey:@"morph"];

  if (self->_isLuxo)
  {
    backgroundLayer = self->_backgroundLayer;
    id v59 = NTKAkitaColorGetCGColor(0, 0);
    id v60 = NTKAkitaColorGetCGColor(v68, 0);
    v61 = sub_84E4((uint64_t)v59, (uint64_t)v60, @"backgroundColor", v48);
    [(CALayer *)backgroundLayer addAnimation:v61 forKey:@"morph"];
  }
}

- (void)setMorph:(id)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (![(NTKAkitaMorph *)self->_currentMorph isEqualToMorph:v7])
  {
    if (v4)
    {
      if (self->_animatingMorph) {
        -[NTKAkitaContentView _setMorph:](self, "_setMorph:");
      }
      float64_t v8 = self->_currentMorph;
      objc_storeStrong((id *)&self->_animatingMorph, a3);
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v9 = self->_morphLayers;
      id v10 = [(NSArray *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v10)
      {
        id v12 = v10;
        uint64_t v13 = *(void *)v16;
        do
        {
          for (uint64_t i = 0; i != v12; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v16 != v13) {
              objc_enumerationMutation(v9);
            }
            LODWORD(v11) = 1.0;
            objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "setSpeed:", v11, (void)v15);
          }
          id v12 = [(NSArray *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v12);
      }

      [(NTKAkitaContentView *)self _animateFromMorph:v8 toMorph:self->_animatingMorph];
    }
    else
    {
      [(NTKAkitaContentView *)self _setMorph:v7];
    }
  }
}

- (void)setPaused:(BOOL)a3
{
  self->_isPaused = a3;
}

- (void)set24HourMode:(BOOL)a3
{
  if (self->_is24HourMode != a3)
  {
    self->_is24HourMode = a3;
    [(NTKAkitaContentView *)self updateDate];
  }
}

- (void)setAdjustsForStatusBarIcon:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_isStatusVisisble != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    self->_isStatusVisisble = a3;
    [(CALayer *)self->_foregroundLayer removeAllAnimations];
    [(NTKAkitaContentView *)self bounds];
    double v8 = v7;
    CATransform3DMakeTranslation(&v42, 0.0, v7 * 0.5, 0.0);
    CATransform3D v40 = v42;
    CATransform3DScale(&v41, &v40, 0.939999998, 0.939999998, 1.0);
    CATransform3D v42 = v41;
    CATransform3D v40 = v41;
    CATransform3DTranslate(&v41, &v40, 0.0, v8 * -0.5, 0.0);
    CATransform3D v42 = v41;
    if (v4)
    {
      if (v5)
      {
        long long v9 = *(_OWORD *)&CATransform3DIdentity.m33;
        *(_OWORD *)&v41.m31 = *(_OWORD *)&CATransform3DIdentity.m31;
        *(_OWORD *)&v41.m33 = v9;
        long long v10 = *(_OWORD *)&CATransform3DIdentity.m43;
        *(_OWORD *)&v41.m41 = *(_OWORD *)&CATransform3DIdentity.m41;
        *(_OWORD *)&v41.m43 = v10;
        long long v11 = *(_OWORD *)&CATransform3DIdentity.m13;
        *(_OWORD *)&v41.m11 = *(_OWORD *)&CATransform3DIdentity.m11;
        *(_OWORD *)&v41.m13 = v11;
        long long v12 = *(_OWORD *)&CATransform3DIdentity.m23;
        *(_OWORD *)&v41.m21 = *(_OWORD *)&CATransform3DIdentity.m21;
        *(_OWORD *)&v41.m23 = v12;
        *(_OWORD *)&v40.m21 = *(_OWORD *)&v42.m21;
        *(_OWORD *)&v40.m23 = *(_OWORD *)&v42.m23;
        *(_OWORD *)&v40.m11 = *(_OWORD *)&v42.m11;
        *(_OWORD *)&v40.m13 = *(_OWORD *)&v42.m13;
        long long v13 = *(_OWORD *)&v42.m31;
        long long v14 = *(_OWORD *)&v42.m33;
        long long v15 = *(_OWORD *)&v42.m41;
        long long v16 = *(_OWORD *)&v42.m43;
      }
      else
      {
        CATransform3D v41 = v42;
        long long v20 = *(_OWORD *)&CATransform3DIdentity.m11;
        long long v21 = *(_OWORD *)&CATransform3DIdentity.m13;
        long long v22 = *(_OWORD *)&CATransform3DIdentity.m23;
        *(_OWORD *)&v40.m21 = *(_OWORD *)&CATransform3DIdentity.m21;
        *(_OWORD *)&v40.m23 = v22;
        *(_OWORD *)&v40.m11 = v20;
        *(_OWORD *)&v40.m13 = v21;
        long long v13 = *(_OWORD *)&CATransform3DIdentity.m31;
        long long v14 = *(_OWORD *)&CATransform3DIdentity.m33;
        long long v15 = *(_OWORD *)&CATransform3DIdentity.m41;
        long long v16 = *(_OWORD *)&CATransform3DIdentity.m43;
      }
      *(_OWORD *)&v40.m41 = v15;
      *(_OWORD *)&v40.m43 = v16;
      *(_OWORD *)&v40.m31 = v13;
      *(_OWORD *)&v40.m33 = v14;
      id v23 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
      uint64_t v24 = objc_opt_new();
      [v24 setKeyPath:@"transform"];
      CATransform3D v39 = v41;
      id v25 = +[NSValue valueWithBytes:&v39 objCType:"{CATransform3D=dddddddddddddddd}"];
      [v24 setFromValue:v25];

      CATransform3D v38 = v40;
      id v26 = +[NSValue valueWithBytes:&v38 objCType:"{CATransform3D=dddddddddddddddd}"];
      [v24 setToValue:v26];

      [v24 setDuration:0.3];
      [v24 setTimingFunction:v23];
      [v24 setFillMode:kCAFillModeForwards];
      [v24 setRemovedOnCompletion:0];
      [(CALayer *)self->_foregroundLayer addAnimation:v24 forKey:@"shrink"];
    }
    else
    {
      foregroundLayer = self->_foregroundLayer;
      if (v5)
      {
        long long v34 = *(_OWORD *)&v42.m31;
        long long v35 = *(_OWORD *)&v42.m33;
        long long v36 = *(_OWORD *)&v42.m41;
        long long v37 = *(_OWORD *)&v42.m43;
        long long v30 = *(_OWORD *)&v42.m11;
        long long v31 = *(_OWORD *)&v42.m13;
        long long v18 = *(_OWORD *)&v42.m21;
        long long v19 = *(_OWORD *)&v42.m23;
      }
      else
      {
        long long v27 = *(_OWORD *)&CATransform3DIdentity.m33;
        long long v34 = *(_OWORD *)&CATransform3DIdentity.m31;
        long long v35 = v27;
        long long v28 = *(_OWORD *)&CATransform3DIdentity.m43;
        long long v36 = *(_OWORD *)&CATransform3DIdentity.m41;
        long long v37 = v28;
        long long v29 = *(_OWORD *)&CATransform3DIdentity.m13;
        long long v30 = *(_OWORD *)&CATransform3DIdentity.m11;
        long long v31 = v29;
        long long v18 = *(_OWORD *)&CATransform3DIdentity.m21;
        long long v19 = *(_OWORD *)&CATransform3DIdentity.m23;
      }
      long long v32 = v18;
      long long v33 = v19;
      [(CALayer *)foregroundLayer setTransform:&v30];
    }
  }
}

- (BOOL)updateDate
{
  uint64_t v3 = (*((void (**)(void))self->_dateProvider + 2))();
  BOOL v4 = [(NSCalendar *)self->_calendar components:224 fromDate:v3];
  id v5 = [v4 minute];
  id v6 = [v4 hour];
  uint64_t v7 = (uint64_t)v6;
  if (!self->_is24HourMode)
  {
    LODWORD(v7) = (int)v6 % 12;
    if ((int)v6 % 12) {
      uint64_t v7 = v7;
    }
    else {
      uint64_t v7 = 12;
    }
  }
  if (self->_currentHour == v7 && self->_currentMinute == v5)
  {
    BOOL v8 = 0;
  }
  else
  {
    self->_currentHour = v7;
    self->_currentMinute = (int)v5;
    long long v9 = +[NSString stringWithFormat:@"%d", v7];
    long long v10 = +[NSString stringWithFormat:@"%02d", v5];
    [(CATextLayer *)self->_leftTextLayer setString:v9];
    [(CATextLayer *)self->_rightTextLayer setString:v10];

    BOOL v8 = 1;
  }

  return v8;
}

- (void)timerFired
{
  if ([(NTKAkitaContentView *)self updateDate] && !self->_role && !self->_isPaused)
  {
    id v3 = (id)objc_opt_new();
    [v3 setKeyPath:@"transform.scale.y"];
    [v3 setFromValue:&off_10D48];
    [v3 setToValue:&off_10D58];
    [v3 setAutoreverses:1];
    [v3 setDuration:0.3];
    [v3 setDelegate:self];
    [(CATextLayer *)self->_leftTextLayer addAnimation:v3 forKey:@"blink"];
    [(CATextLayer *)self->_rightTextLayer addAnimation:v3 forKey:@"blink"];
  }
}

- (void)waitForAnimationsWithCompletion:(id)a3
{
  BOOL v4 = (void (**)(void))a3;
  if (v4)
  {
    BOOL v8 = v4;
    id v5 = [(CATextLayer *)self->_leftTextLayer animationForKey:@"blink"];

    if (v5)
    {
      id v6 = objc_retainBlock(v8);
      id animationCompletion = self->_animationCompletion;
      self->_id animationCompletion = v6;
    }
    else
    {
      v8[2]();
    }
    BOOL v4 = v8;
  }
}

- (void)setBackgroundColor:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    id v5 = +[UIColor blackColor];
  }
  id v6 = v5;
  uint64_t v7 = [(NTKAkitaContentView *)self layer];
  id v8 = v6;
  objc_msgSend(v7, "setBackgroundColor:", objc_msgSend(v8, "CGColor"));
}

- (void)_setupSceneForLayer:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  id v8 = +[NSCalendar autoupdatingCurrentCalendar];
  calendar = self->_calendar;
  self->_calendar = v8;

  long long v10 = self->_calendar;
  long long v11 = +[NSTimeZone systemTimeZone];
  [(NSCalendar *)v10 setTimeZone:v11];

  -[NTKAkitaContentView _createLayerOfSize:parent:](self, "_createLayerOfSize:parent:", v7, width, height);
  long long v12 = (CALayer *)objc_claimAutoreleasedReturnValue();
  backgroundLayer = self->_backgroundLayer;
  self->_backgroundLayer = v12;

  -[NTKAkitaContentView _createLayerOfSize:parent:](self, "_createLayerOfSize:parent:", v7, width, height);
  long long v14 = (CALayer *)objc_claimAutoreleasedReturnValue();

  foregroundLayer = self->_foregroundLayer;
  self->_foregroundLayer = v14;

  -[NTKAkitaContentView _createFillShapeLayerOfSize:parent:](self, "_createFillShapeLayerOfSize:parent:", self->_foregroundLayer, width, height);
  long long v16 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue();
  neckLayer = self->_neckLayer;
  self->_neckLayer = v16;

  -[NTKAkitaContentView _createFillShapeLayerOfSize:parent:](self, "_createFillShapeLayerOfSize:parent:", self->_foregroundLayer, width, height);
  long long v18 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue();
  shirtLayer = self->_shirtLayer;
  self->_shirtLayer = v18;

  -[NTKAkitaContentView _createFillShapeLayerOfSize:parent:](self, "_createFillShapeLayerOfSize:parent:", self->_foregroundLayer, width, height);
  long long v20 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue();
  headLayer = self->_headLayer;
  self->_headLayer = v20;

  -[NTKAkitaContentView _createFillShapeLayerOfSize:parent:](self, "_createFillShapeLayerOfSize:parent:", self->_foregroundLayer, width, height);
  long long v22 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue();
  hairLayer = self->_hairLayer;
  self->_hairLayer = v22;

  -[NTKAkitaContentView _createStrokeShapeLayerOfSize:parent:](self, "_createStrokeShapeLayerOfSize:parent:", self->_foregroundLayer, width, height);
  uint64_t v24 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue();
  noseLayer = self->_noseLayer;
  self->_noseLayer = v24;

  -[NTKAkitaContentView _createStrokeShapeLayerOfSize:parent:](self, "_createStrokeShapeLayerOfSize:parent:", self->_foregroundLayer, width, height);
  id v26 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue();
  lipsInnerLayer = self->_lipsInnerLayer;
  self->_lipsInnerLayer = v26;

  -[NTKAkitaContentView _createStrokeShapeLayerOfSize:parent:](self, "_createStrokeShapeLayerOfSize:parent:", self->_foregroundLayer, width, height);
  long long v28 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue();
  lipsOuterLayer = self->_lipsOuterLayer;
  self->_lipsOuterLayer = v28;

  long long v30 = self->_neckLayer;
  v42[0] = self->_backgroundLayer;
  v42[1] = v30;
  long long v31 = self->_headLayer;
  v42[2] = self->_shirtLayer;
  v42[3] = v31;
  long long v32 = self->_noseLayer;
  v42[4] = self->_hairLayer;
  v42[5] = v32;
  long long v33 = self->_lipsOuterLayer;
  v42[6] = self->_lipsInnerLayer;
  v42[7] = v33;
  long long v34 = +[NSArray arrayWithObjects:v42 count:8];
  morphLayers = self->_morphLayers;
  self->_morphLayers = v34;

  long long v36 = +[UIFont systemFontOfSize:@"NSCTFontUIFontDesignCompactRounded" weight:width * 0.185185185 design:UIFontWeightLight];
  font = self->_font;
  self->_font = v36;

  -[NTKAkitaContentView _createLeftEyeLayerOfSize:parent:](self, "_createLeftEyeLayerOfSize:parent:", self->_foregroundLayer, width, height);
  CATransform3D v38 = (CATextLayer *)objc_claimAutoreleasedReturnValue();
  leftTextLayer = self->_leftTextLayer;
  self->_leftTextLayer = v38;

  -[NTKAkitaContentView _createRightEyeLayerOfSize:parent:](self, "_createRightEyeLayerOfSize:parent:", self->_foregroundLayer, width, height);
  CATransform3D v40 = (CATextLayer *)objc_claimAutoreleasedReturnValue();
  rightTextLayer = self->_rightTextLayer;
  self->_rightTextLayer = v40;

  [(NTKAkitaContentView *)self updateDate];
}

- (id)_createLeftEyeLayerOfSize:(CGSize)a3 parent:(id)a4
{
  return -[NTKAkitaContentView _createTextLayerOfSize:x:alignment:parent:](self, "_createTextLayerOfSize:x:alignment:parent:", kCAAlignmentRight, a4, a3.width, a3.height, a3.width * 0.398148148);
}

- (id)_createRightEyeLayerOfSize:(CGSize)a3 parent:(id)a4
{
  return -[NTKAkitaContentView _createTextLayerOfSize:x:alignment:parent:](self, "_createTextLayerOfSize:x:alignment:parent:", kCAAlignmentLeft, a4, a3.width, a3.height, a3.width * 0.657407407);
}

- (id)_createTextLayerOfSize:(CGSize)a3 x:(double)a4 alignment:(id)a5 parent:(id)a6
{
  double height = a3.height;
  id v10 = a6;
  long long v11 = (NSString *)a5;
  long long v12 = objc_opt_new();
  [v12 setFont:self->_font];
  [(UIFont *)self->_font pointSize];
  objc_msgSend(v12, "setFontSize:");
  if (self->_role) {
    unint64_t v13 = 1;
  }
  else {
    unint64_t v13 = 2;
  }
  objc_msgSend(v12, "setForegroundColor:", NTKAkitaColorGetCGColor(v13, 0));
  long long v14 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", self->_font, NSFontAttributeName, 0);
  [@"88" sizeWithAttributes:v14];
  double v16 = v15;
  double v18 = v17;
  [(UIFont *)self->_font descender];
  double v20 = round(a4);
  double v21 = round(height * 0.510736041 - v18 - v19);
  double v22 = 0.0;
  if (kCAAlignmentRight == v11) {
    double v22 = v16;
  }
  objc_msgSend(v12, "setFrame:", v20 - v22, v21, v16 + v16, v18);
  [(CLKDevice *)self->_device screenScale];
  objc_msgSend(v12, "setContentsScale:");
  [v12 setAlignmentMode:v11];

  id v23 = sub_6C30();
  [v12 setActions:v23];

  [v10 addSublayer:v12];

  return v12;
}

- (id)_createFillShapeLayerOfSize:(CGSize)a3 parent:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  id v8 = objc_opt_new();
  objc_msgSend(v8, "setPosition:", width * 0.5, height * 0.5);
  objc_msgSend(v8, "setBounds:", 0.0, 0.0, width, height);
  if (self->_role == 1)
  {
    [v8 setLineWidth:self->_lineWidth];
    CAShapeLayerLineCap v9 = kCALineCapRound;
    [v8 setLineCap:kCALineCapRound];
  }
  else
  {
    CAShapeLayerLineCap v9 = kCALineCapRound;
  }
  [v8 setLineCap:v9];
  [v8 setMiterLimit:1.0];
  id v10 = sub_6C30();
  [v8 setActions:v10];

  [v7 addSublayer:v8];

  return v8;
}

- (id)_createStrokeShapeLayerOfSize:(CGSize)a3 parent:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  id v8 = objc_opt_new();
  objc_msgSend(v8, "setPosition:", width * 0.5, height * 0.5);
  objc_msgSend(v8, "setBounds:", 0.0, 0.0, width, height);
  objc_msgSend(v8, "setStrokeColor:", NTKAkitaColorGetCGColor(2uLL, 0));
  [v8 setFillColor:0];
  [v8 setLineWidth:self->_lineWidth];
  [v8 setLineCap:kCALineCapRound];
  [v8 setMiterLimit:1.0];
  CAShapeLayerLineCap v9 = sub_6C30();
  [v8 setActions:v9];

  [v7 addSublayer:v8];

  return v8;
}

- (id)_createLayerOfSize:(CGSize)a3 parent:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v6 = a4;
  id v7 = objc_opt_new();
  objc_msgSend(v7, "setPosition:", width * 0.5, height * 0.5);
  objc_msgSend(v7, "setBounds:", 0.0, 0.0, width, height);
  id v8 = sub_6C30();
  [v7 setActions:v8];

  [v6 addSublayer:v7];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_animationCompletion, 0);
  objc_storeStrong((id *)&self->_morphLayers, 0);
  objc_storeStrong((id *)&self->_lipsInnerLayer, 0);
  objc_storeStrong((id *)&self->_lipsOuterLayer, 0);
  objc_storeStrong((id *)&self->_noseLayer, 0);
  objc_storeStrong((id *)&self->_hairLayer, 0);
  objc_storeStrong((id *)&self->_headLayer, 0);
  objc_storeStrong((id *)&self->_shirtLayer, 0);
  objc_storeStrong((id *)&self->_neckLayer, 0);
  objc_storeStrong((id *)&self->_rightTextLayer, 0);
  objc_storeStrong((id *)&self->_leftTextLayer, 0);
  objc_storeStrong((id *)&self->_backgroundLayer, 0);
  objc_storeStrong((id *)&self->_foregroundLayer, 0);
  objc_storeStrong((id *)&self->_interpolateToMorph, 0);
  objc_storeStrong((id *)&self->_interpolateFromMorph, 0);
  objc_storeStrong((id *)&self->_animatingMorph, 0);
  objc_storeStrong((id *)&self->_currentMorph, 0);
  objc_storeStrong(&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_calendar, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end