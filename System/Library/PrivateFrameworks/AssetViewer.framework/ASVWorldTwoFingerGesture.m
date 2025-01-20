@interface ASVWorldTwoFingerGesture
- (ASVWorldGestureDragOffsetCorrector)dragOffsetCorrector;
- (ASVWorldTwoFingerGesture)initWithFirstTouch:(id)a3 secondTouch:(id)a4 dataSource:(id)a5 worldDelegate:(id)a6;
- (ASVWorldTwoFingerGestureDelegate)worldDelegate;
- (void)finishGesture;
- (void)setDragOffsetCorrector:(id)a3;
- (void)setWorldDelegate:(id)a3;
- (void)updatePanWithFirstTouchLocation:(ASVWorldTwoFingerGesture *)self secondTouchLocation:(SEL)a2 midPoint:;
@end

@implementation ASVWorldTwoFingerGesture

- (ASVWorldTwoFingerGesture)initWithFirstTouch:(id)a3 secondTouch:(id)a4 dataSource:(id)a5 worldDelegate:(id)a6
{
  id v10 = a6;
  v16.receiver = self;
  v16.super_class = (Class)ASVWorldTwoFingerGesture;
  v11 = [(ASVTwoFingerGesture *)&v16 initWithFirstTouch:a3 secondTouch:a4 dataSource:a5 delegate:v10];
  v12 = v11;
  if (v11)
  {
    if (![(ASVGesture *)v11 firstTouchWasOnAsset])
    {
      v14 = 0;
      goto LABEL_6;
    }
    objc_storeWeak((id *)&v12->_worldDelegate, v10);
    dragOffsetCorrector = v12->_dragOffsetCorrector;
    v12->_dragOffsetCorrector = 0;
  }
  v14 = v12;
LABEL_6:

  return v14;
}

- (void)updatePanWithFirstTouchLocation:(ASVWorldTwoFingerGesture *)self secondTouchLocation:(SEL)a2 midPoint:
{
  float32x2_t v5 = v4;
  float32x2_t v6 = v3;
  float32x2_t v7 = v2;
  id v45 = [(ASVWorldTwoFingerGesture *)self worldDelegate];
  if (![(ASVTwoFingerGesture *)self panThresholdPassed])
  {
    +[ASVSettings floatForKey:@"ASVSettingTwoFingerTranslationThreshold"];
    uint64_t v43 = v9;
    if ([(ASVTwoFingerGesture *)self rotationThresholdPassed]
      || [(ASVTwoFingerGesture *)self scaleThresholdPassed])
    {
      +[ASVSettings floatForKey:@"ASVSettingTwoFingerTranslationThresholdHarder"];
      int v10 = 0;
      [(ASVGesture *)self latestAssetLocationOnScreen];
    }
    else
    {
      int v10 = 1;
      [(ASVGesture *)self latestAssetLocationOnScreen];
    }
    float32x2_t v13 = v12;
    [(ASVGesture *)self initialAssetLocationOnScreen];
    float32x2_t v15 = vsub_f32(v13, v14);
    if (sqrtf(vaddv_f32(vmul_f32(v15, v15))) >= *(float *)v44.i32) {
      [(ASVTwoFingerGesture *)self setPanThresholdPassed:1];
    }
    if (![(ASVTwoFingerGesture *)self panThresholdPassed])
    {
      [(ASVTwoFingerGesture *)self initialFirstTouchLocation];
      float32x2_t v17 = vsub_f32(v7, v16);
      float v18 = sqrtf(vaddv_f32(vmul_f32(v17, v17)));
      [(ASVTwoFingerGesture *)self initialSecondTouchLocation];
      float32x2_t v20 = v19;
      [(ASVTwoFingerGesture *)self initialMidPoint];
      if (v18 >= *(float *)v44.i32)
      {
        float32x2_t v22 = vsub_f32(v5, v21);
        int32x2_t v23 = (int32x2_t)vmul_f32(v22, v22);
        float32x2_t v24 = vsub_f32(v6, v20);
        int32x2_t v25 = (int32x2_t)vmul_f32(v24, v24);
        int8x8_t v26 = vmvn_s8((int8x8_t)vcge_f32(vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v23, v25), (float32x2_t)vzip2_s32(v23, v25))), (float32x2_t)vdup_lane_s32(v44, 0)));
        if (((v26.i32[1] | v26.i32[0]) & 1) == 0) {
          [(ASVTwoFingerGesture *)self setPanThresholdPassed:1];
        }
      }
    }
    if ([(ASVTwoFingerGesture *)self panThresholdPassed])
    {
      if (v10)
      {
        [(ASVTwoFingerGesture *)self initialMidPoint];
        float32x2_t v28 = vsub_f32(v5, v27);
        float v29 = fabsf(atan2f(v28.f32[0], v28.f32[1]) * 57.296);
        [(ASVGesture *)self initialAssetLocationOnScreen];
        double v31 = COERCE_DOUBLE(vsub_f32(v5, v30));
        [(ASVGesture *)self latestAssetLocationOnScreen];
        v33 = [[ASVWorldGestureDragOffsetCorrector alloc] initWithInitialDragOffset:v31 thresholdDragOffset:COERCE_DOUBLE(vsub_f32(v5, v32))];
        [(ASVWorldTwoFingerGesture *)self setDragOffsetCorrector:v33];

        if (v29 < 30.0 || v29 > 150.0)
        {
          [(ASVTwoFingerGesture *)self setLevitationThresholdPassed:1];
          [v45 gestureBeganLevitation:self];
          goto LABEL_21;
        }
      }
      else
      {
        [(ASVGesture *)self initialAssetLocationOnScreen];
        double v36 = COERCE_DOUBLE(vsub_f32(v5, v35));
        [(ASVGesture *)self latestAssetLocationOnScreen];
        v38 = [[ASVWorldGestureDragOffsetCorrector alloc] initWithInitialDragOffset:v36 thresholdDragOffset:COERCE_DOUBLE(vsub_f32(v5, v37))];
        [(ASVWorldTwoFingerGesture *)self setDragOffsetCorrector:v38];
      }
      [v45 gestureBeganTranslation:self];
    }
  }
LABEL_21:
  if ([(ASVTwoFingerGesture *)self panThresholdPassed]
    || [(ASVTwoFingerGesture *)self levitationThresholdPassed])
  {
    v39 = [(ASVWorldTwoFingerGesture *)self dragOffsetCorrector];
    [v39 currentDragOffset];
    float32x2_t v41 = v40;

    double v42 = COERCE_DOUBLE(vsub_f32(v5, v41));
    if ([(ASVTwoFingerGesture *)self levitationThresholdPassed]) {
      [v45 gesture:self levitatedAssetToScreenPoint:v42];
    }
    else {
      [v45 gesture:self translatedAssetToScreenPoint:v42];
    }
  }
}

- (void)finishGesture
{
  if ([(ASVTwoFingerGesture *)self panThresholdPassed])
  {
    float32x2_t v3 = [(ASVWorldTwoFingerGesture *)self worldDelegate];
    if ([(ASVTwoFingerGesture *)self levitationThresholdPassed]) {
      [v3 gestureEndedLevitation:self];
    }
    else {
      [v3 gestureEndedTranslation:self];
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)ASVWorldTwoFingerGesture;
  [(ASVTwoFingerGesture *)&v4 finishGesture];
}

- (ASVWorldTwoFingerGestureDelegate)worldDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_worldDelegate);
  return (ASVWorldTwoFingerGestureDelegate *)WeakRetained;
}

- (void)setWorldDelegate:(id)a3
{
}

- (ASVWorldGestureDragOffsetCorrector)dragOffsetCorrector
{
  return self->_dragOffsetCorrector;
}

- (void)setDragOffsetCorrector:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragOffsetCorrector, 0);
  objc_destroyWeak((id *)&self->_worldDelegate);
}

@end