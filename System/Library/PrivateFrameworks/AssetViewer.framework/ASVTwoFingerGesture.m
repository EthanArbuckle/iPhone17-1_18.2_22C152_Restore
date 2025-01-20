@interface ASVTwoFingerGesture
- (ASVRubberBand)rubberBand;
- (ASVTouch)firstTouch;
- (ASVTouch)secondTouch;
- (ASVTwoFingerGesture)initWithFirstTouch:(id)a3 secondTouch:(id)a4 dataSource:(id)a5 delegate:(id)a6;
- (ASVTwoFingerGestureDelegate)delegate;
- (BOOL)levitationThresholdPassed;
- (BOOL)panThresholdPassed;
- (BOOL)rotationThresholdPassed;
- (BOOL)scaleIsWithinSnapRange:(float)a3 snapTarget:(float)a4;
- (BOOL)scaleThresholdPassed;
- (NSSet)snapScalesSet;
- (double)initialFirstTouchLocation;
- (double)initialMidPoint;
- (double)initialSecondTouchLocation;
- (float)assetBaseScale;
- (float)baseDistanceBetweenFingers;
- (float)initialDistanceBetweenFingers;
- (float)initialFingerAngle;
- (float)lastAssetScale;
- (float)lastFingerAngle;
- (float)maxScale;
- (float)minScale;
- (float)scaleFactor;
- (float)scaleOvershoot;
- (void)finishGesture;
- (void)setAssetBaseScale:(float)a3;
- (void)setBaseDistanceBetweenFingers:(float)a3;
- (void)setDelegate:(id)a3;
- (void)setFirstTouch:(id)a3;
- (void)setInitialDistanceBetweenFingers:(float)a3;
- (void)setInitialFingerAngle:(float)a3;
- (void)setInitialFirstTouchLocation:(ASVTwoFingerGesture *)self;
- (void)setInitialMidPoint:(ASVTwoFingerGesture *)self;
- (void)setInitialSecondTouchLocation:(ASVTwoFingerGesture *)self;
- (void)setLastAssetScale:(float)a3;
- (void)setLastFingerAngle:(float)a3;
- (void)setLevitationThresholdPassed:(BOOL)a3;
- (void)setMaxScale:(float)a3;
- (void)setMinScale:(float)a3;
- (void)setPanThresholdPassed:(BOOL)a3;
- (void)setRotationThresholdPassed:(BOOL)a3;
- (void)setRubberBand:(id)a3;
- (void)setScaleFactor:(float)a3;
- (void)setScaleOvershoot:(float)a3;
- (void)setScaleThresholdPassed:(BOOL)a3;
- (void)setSecondTouch:(id)a3;
- (void)setSnapScalesSet:(id)a3;
- (void)updateGesture;
- (void)updateRotationWithSpan:(ASVTwoFingerGesture *)self;
- (void)updateRubberBand;
- (void)updateScalingWithSpan:(ASVTwoFingerGesture *)self;
@end

@implementation ASVTwoFingerGesture

- (ASVTwoFingerGesture)initWithFirstTouch:(id)a3 secondTouch:(id)a4 dataSource:(id)a5 delegate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v30.receiver = self;
  v30.super_class = (Class)ASVTwoFingerGesture;
  v14 = [(ASVGesture *)&v30 initWithDataSource:a5];
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_delegate, v13);
    v15->_panThresholdPassed = 0;
    v15->_rotationThresholdPassed = 0;
    v15->_scaleThresholdPassed = 0;
    v15->_levitationThresholdPassed = 0;
    v15->_initialDistanceBetweenFingers = 0.0;
    v15->_baseDistanceBetweenFingers = 0.0;
    uint64_t v16 = [MEMORY[0x1E4F1CAD0] set];
    snapScalesSet = v15->_snapScalesSet;
    v15->_snapScalesSet = (NSSet *)v16;

    objc_storeStrong((id *)&v15->_firstTouch, a3);
    objc_storeStrong((id *)&v15->_secondTouch, a4);
    [(ASVTouch *)v15->_firstTouch location];
    *(void *)v15->_initialFirstTouchLocation = v18;
    [(ASVTouch *)v15->_secondTouch location];
    *(float32x2_t *)v15->_initialSecondTouchLocation = v19;
    *(float32x2_t *)v15->_initialMidPoint = vmul_f32(vadd_f32(v19, *(float32x2_t *)v15->_initialFirstTouchLocation), (float32x2_t)0x3F0000003F000000);
    v20 = [(ASVGesture *)v15 dataSource];
    -[ASVGesture setFirstTouchWasOnAsset:](v15, "setFirstTouchWasOnAsset:", [v20 screenPointIsOnAsset:*(double *)v15->_initialFirstTouchLocation] | objc_msgSend(v20, "screenPointIsOnAsset:", *(double *)v15->_initialMidPoint) | objc_msgSend(v20, "screenPointIsOnAsset:", *(double *)v15->_initialSecondTouchLocation));
    [v20 assetScale];
    v15->_assetBaseScale = v21;
    v15->_lastAssetScale = v21;
    float32x2_t v22 = vsub_f32(*(float32x2_t *)v15->_initialFirstTouchLocation, *(float32x2_t *)v15->_initialSecondTouchLocation);
    v15->_initialDistanceBetweenFingers = sqrtf(vaddv_f32(vmul_f32(v22, v22)));
    float32x2_t v23 = vmul_f32(v22, (float32x2_t)0x3F0000003F000000);
    float v24 = atan2f(v23.f32[0], v23.f32[1]);
    v15->_initialFingerAngle = v24;
    v15->_lastFingerAngle = v24;
    [v13 minimumObjectScale];
    v15->_minScale = v25;
    [v13 maximumObjectScale];
    v15->_maxScale = v26;
    +[ASVSettings floatForKey:@"ASVSettingScaleOvershoot"];
    v15->_scaleOvershoot = v27;
    +[ASVSettings floatForKey:@"ASVSettingScaleRubberBandFactor"];
    v15->_scaleFactor = v28;
    [(ASVTwoFingerGesture *)v15 updateRubberBand];
  }
  return v15;
}

- (void)updateRubberBand
{
  v3 = [ASVRubberBand alloc];
  [(ASVTwoFingerGesture *)self scaleFactor];
  int v5 = v4;
  [(ASVTwoFingerGesture *)self minScale];
  int v7 = v6;
  [(ASVTwoFingerGesture *)self maxScale];
  int v9 = v8;
  [(ASVTwoFingerGesture *)self scaleOvershoot];
  LODWORD(v11) = v10;
  LODWORD(v12) = v5;
  LODWORD(v13) = v7;
  LODWORD(v14) = v9;
  v15 = [(ASVRubberBand *)v3 initWithRubberBandFactor:v12 minOffset:v13 maxOffset:v14 overshoot:v11];
  rubberBand = self->_rubberBand;
  self->_rubberBand = v15;
  MEMORY[0x1F41817F8](v15, rubberBand);
}

- (void)updateGesture
{
  id v15 = [(ASVTwoFingerGesture *)self firstTouch];
  if ([v15 phase] == 3)
  {
LABEL_6:

    return;
  }
  v3 = [(ASVTwoFingerGesture *)self firstTouch];
  if ([v3 phase] == 4)
  {
LABEL_5:

    goto LABEL_6;
  }
  int v4 = [(ASVTwoFingerGesture *)self secondTouch];
  if ([v4 phase] == 3)
  {

    goto LABEL_5;
  }
  int v5 = [(ASVTwoFingerGesture *)self secondTouch];
  uint64_t v6 = [v5 phase];

  if (v6 != 4)
  {
    int v7 = [(ASVGesture *)self dataSource];
    [v7 assetScreenPosition];
    -[ASVGesture setLatestAssetLocationOnScreen:](self, "setLatestAssetLocationOnScreen:");

    int v8 = [(ASVTwoFingerGesture *)self firstTouch];
    [v8 location];
    double v10 = v9;

    double v11 = [(ASVTwoFingerGesture *)self secondTouch];
    [v11 location];
    double v13 = v12;

    [(ASVTwoFingerGesture *)self updatePanWithFirstTouchLocation:v10 secondTouchLocation:v13 midPoint:COERCE_DOUBLE(vmul_f32(vadd_f32(*(float32x2_t *)&v10, *(float32x2_t *)&v13), (float32x2_t)0x3F0000003F000000))];
    double v14 = COERCE_DOUBLE(vsub_f32(*(float32x2_t *)&v10, *(float32x2_t *)&v13));
    [(ASVTwoFingerGesture *)self updateRotationWithSpan:v14];
    [(ASVTwoFingerGesture *)self updateScalingWithSpan:v14];
  }
}

- (void)updateRotationWithSpan:(ASVTwoFingerGesture *)self
{
  float32x2_t v4 = vmul_f32(v2, (float32x2_t)0x3F0000003F000000);
  float v5 = atan2f(v4.f32[0], v4.f32[1]);
  if (![(ASVTwoFingerGesture *)self rotationThresholdPassed]
    && ![(ASVTwoFingerGesture *)self levitationThresholdPassed])
  {
    [(ASVTwoFingerGesture *)self initialFingerAngle];
    normalizeRotation(v6 - v5);
    float v8 = v7;
    +[ASVSettings floatForKey:@"ASVSettingRotationThreshold"];
    float v10 = v9;
    if ([(ASVTwoFingerGesture *)self panThresholdPassed]
      || [(ASVTwoFingerGesture *)self scaleThresholdPassed])
    {
      +[ASVSettings floatForKey:@"ASVSettingRotationThresholdHarder"];
      float v10 = v11;
    }
    float v12 = -v8;
    if (v8 >= 0.0) {
      float v12 = v8;
    }
    if (v12 >= v10)
    {
      [(ASVTwoFingerGesture *)self setRotationThresholdPassed:1];
      [(ASVTwoFingerGesture *)self initialFingerAngle];
      float v14 = -v10;
      if (v8 <= 0.0) {
        float v14 = v10;
      }
      normalizeRotation(v13 + v14);
      -[ASVTwoFingerGesture setLastFingerAngle:](self, "setLastFingerAngle:");
      id v15 = [(ASVTwoFingerGesture *)self delegate];
      [v15 gestureBeganRotation:self];
    }
  }
  if ([(ASVTwoFingerGesture *)self rotationThresholdPassed])
  {
    [(ASVTwoFingerGesture *)self lastFingerAngle];
    normalizeRotation(v5 - v16);
    int v18 = v17;
    float32x2_t v19 = [(ASVTwoFingerGesture *)self delegate];
    LODWORD(v20) = v18;
    [v19 gesture:self rotatedAssetByDeltaYaw:v20];

    *(float *)&double v21 = v5;
    [(ASVTwoFingerGesture *)self setLastFingerAngle:v21];
  }
}

- (BOOL)scaleIsWithinSnapRange:(float)a3 snapTarget:(float)a4
{
  +[ASVSettings floatForKey:@"ASVSettingScaleSnapThreshold"];
  return (float)(v6 + a4) >= a3 && (float)(a4 - v6) <= a3;
}

- (void)updateScalingWithSpan:(ASVTwoFingerGesture *)self
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  float v4 = sqrtf(vaddv_f32(vmul_f32(v2, v2)));
  if (![(ASVTwoFingerGesture *)self scaleThresholdPassed]
    && ![(ASVTwoFingerGesture *)self levitationThresholdPassed])
  {
    [(ASVTwoFingerGesture *)self initialDistanceBetweenFingers];
    float v6 = v4 - v5;
    if (v6 >= 0.0) {
      float v7 = v6;
    }
    else {
      float v7 = -v6;
    }
    +[ASVSettings floatForKey:@"ASVSettingScaleThreshold"];
    float v9 = v8;
    if ([(ASVTwoFingerGesture *)self panThresholdPassed]
      || [(ASVTwoFingerGesture *)self rotationThresholdPassed])
    {
      +[ASVSettings floatForKey:@"ASVSettingScaleThresholdHarder"];
      float v9 = v10;
    }
    if (v7 >= v9)
    {
      [(ASVTwoFingerGesture *)self setScaleThresholdPassed:1];
      *(float *)&double v11 = v4;
      [(ASVTwoFingerGesture *)self setBaseDistanceBetweenFingers:v11];
      float v12 = [(ASVTwoFingerGesture *)self delegate];
      [v12 gestureBeganScaling:self];
    }
  }
  if ([(ASVTwoFingerGesture *)self scaleThresholdPassed])
  {
    [(ASVTwoFingerGesture *)self baseDistanceBetweenFingers];
    if (v13 != 0.0)
    {
      [(ASVTwoFingerGesture *)self baseDistanceBetweenFingers];
      float v15 = v4 / v14;
      [(ASVTwoFingerGesture *)self assetBaseScale];
      float v17 = v16 * v15;
      int v18 = [(ASVTwoFingerGesture *)self snapScalesSet];
      float32x2_t v19 = [v18 allObjects];

      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v20 = v19;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v42 objects:v46 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        char v23 = 0;
        char v24 = 0;
        uint64_t v25 = *(void *)v43;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v43 != v25) {
              objc_enumerationMutation(v20);
            }
            objc_msgSend(*(id *)(*((void *)&v42 + 1) + 8 * i), "floatValue", (void)v42);
            float v28 = v27;
            *(float *)&double v29 = v17;
            *(float *)&double v30 = v28;
            BOOL v31 = [(ASVTwoFingerGesture *)self scaleIsWithinSnapRange:v29 snapTarget:v30];
            [(ASVTwoFingerGesture *)self lastAssetScale];
            BOOL v32 = -[ASVTwoFingerGesture scaleIsWithinSnapRange:snapTarget:](self, "scaleIsWithinSnapRange:snapTarget:");
            if (v31) {
              float v17 = v28;
            }
            v23 |= v31 && !v32;
            if (!v31) {
              v24 |= v32;
            }
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v42 objects:v46 count:16];
        }
        while (v22);
      }
      else
      {
        char v23 = 0;
        char v24 = 0;
      }

      v33 = [(ASVTwoFingerGesture *)self rubberBand];
      *(float *)&double v34 = v17;
      [v33 rubberBandOffsetForOffset:v34];
      int v36 = v35;

      v37 = [(ASVTwoFingerGesture *)self delegate];
      [v37 gestureStopScaleAnimation];

      v38 = [(ASVTwoFingerGesture *)self delegate];
      LODWORD(v39) = v36;
      [v38 gesture:self scaledAssetToScale:v39];

      LODWORD(v40) = v36;
      [(ASVTwoFingerGesture *)self setLastAssetScale:v40];
      if (v23)
      {
        v41 = [(ASVTwoFingerGesture *)self delegate];
        [v41 gestureDidSnapToScale:self];
      }
      else
      {
        if ((v24 & 1) == 0)
        {
LABEL_31:

          return;
        }
        v41 = [(ASVTwoFingerGesture *)self delegate];
        [v41 gestureDidSnapAwayFromScale:self];
      }

      goto LABEL_31;
    }
  }
}

- (void)finishGesture
{
  v3 = [(ASVTwoFingerGesture *)self delegate];
  [v3 gestureStopScaleAnimation];

  if ([(ASVTwoFingerGesture *)self scaleThresholdPassed])
  {
    float v4 = [(ASVTwoFingerGesture *)self delegate];
    [v4 gestureEndedScaling:self];

    float lastAssetScale = self->_lastAssetScale;
    p_maxScale = &self->_maxScale;
    if (lastAssetScale > self->_maxScale || (p_maxScale = &self->_minScale, lastAssetScale < self->_minScale))
    {
      float v7 = [(ASVTwoFingerGesture *)self delegate];
      *(float *)&double v8 = self->_lastAssetScale;
      *(float *)&double v9 = *p_maxScale;
      [v7 gestureStartScaleAnimationFrom:v8 to:v9];
    }
  }
  if ([(ASVTwoFingerGesture *)self rotationThresholdPassed])
  {
    id v10 = [(ASVTwoFingerGesture *)self delegate];
    [v10 gestureEndedRotation:self];
  }
}

- (ASVTouch)firstTouch
{
  return self->_firstTouch;
}

- (void)setFirstTouch:(id)a3
{
}

- (ASVTouch)secondTouch
{
  return self->_secondTouch;
}

- (void)setSecondTouch:(id)a3
{
}

- (double)initialFirstTouchLocation
{
  return *(double *)(a1 + 104);
}

- (void)setInitialFirstTouchLocation:(ASVTwoFingerGesture *)self
{
  *(void *)self->_initialFirstTouchLocation = v2;
}

- (double)initialSecondTouchLocation
{
  return *(double *)(a1 + 112);
}

- (void)setInitialSecondTouchLocation:(ASVTwoFingerGesture *)self
{
  *(void *)self->_initialSecondTouchLocation = v2;
}

- (double)initialMidPoint
{
  return *(double *)(a1 + 120);
}

- (void)setInitialMidPoint:(ASVTwoFingerGesture *)self
{
  *(void *)self->_initialMidPoint = v2;
}

- (BOOL)panThresholdPassed
{
  return self->_panThresholdPassed;
}

- (void)setPanThresholdPassed:(BOOL)a3
{
  self->_panThresholdPassed = a3;
}

- (BOOL)rotationThresholdPassed
{
  return self->_rotationThresholdPassed;
}

- (void)setRotationThresholdPassed:(BOOL)a3
{
  self->_rotationThresholdPassed = a3;
}

- (BOOL)levitationThresholdPassed
{
  return self->_levitationThresholdPassed;
}

- (void)setLevitationThresholdPassed:(BOOL)a3
{
  self->_levitationThresholdPassed = a3;
}

- (float)initialFingerAngle
{
  return self->_initialFingerAngle;
}

- (void)setInitialFingerAngle:(float)a3
{
  self->_initialFingerAngle = a3;
}

- (float)lastFingerAngle
{
  return self->_lastFingerAngle;
}

- (void)setLastFingerAngle:(float)a3
{
  self->_lastFingerAngle = a3;
}

- (BOOL)scaleThresholdPassed
{
  return self->_scaleThresholdPassed;
}

- (void)setScaleThresholdPassed:(BOOL)a3
{
  self->_scaleThresholdPassed = a3;
}

- (float)initialDistanceBetweenFingers
{
  return self->_initialDistanceBetweenFingers;
}

- (void)setInitialDistanceBetweenFingers:(float)a3
{
  self->_initialDistanceBetweenFingers = a3;
}

- (float)baseDistanceBetweenFingers
{
  return self->_baseDistanceBetweenFingers;
}

- (void)setBaseDistanceBetweenFingers:(float)a3
{
  self->_baseDistanceBetweenFingers = a3;
}

- (float)assetBaseScale
{
  return self->_assetBaseScale;
}

- (void)setAssetBaseScale:(float)a3
{
  self->_assetBaseScale = a3;
}

- (float)lastAssetScale
{
  return self->_lastAssetScale;
}

- (void)setLastAssetScale:(float)a3
{
  self->_float lastAssetScale = a3;
}

- (float)minScale
{
  return self->_minScale;
}

- (void)setMinScale:(float)a3
{
  self->_minScale = a3;
}

- (float)maxScale
{
  return self->_maxScale;
}

- (void)setMaxScale:(float)a3
{
  self->_maxScale = a3;
}

- (NSSet)snapScalesSet
{
  return self->_snapScalesSet;
}

- (void)setSnapScalesSet:(id)a3
{
}

- (ASVTwoFingerGestureDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ASVTwoFingerGestureDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ASVRubberBand)rubberBand
{
  return self->_rubberBand;
}

- (void)setRubberBand:(id)a3
{
}

- (float)scaleOvershoot
{
  return self->_scaleOvershoot;
}

- (void)setScaleOvershoot:(float)a3
{
  self->_scaleOvershoot = a3;
}

- (float)scaleFactor
{
  return self->_scaleFactor;
}

- (void)setScaleFactor:(float)a3
{
  self->_scaleFactor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rubberBand, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_snapScalesSet, 0);
  objc_storeStrong((id *)&self->_secondTouch, 0);
  objc_storeStrong((id *)&self->_firstTouch, 0);
}

@end