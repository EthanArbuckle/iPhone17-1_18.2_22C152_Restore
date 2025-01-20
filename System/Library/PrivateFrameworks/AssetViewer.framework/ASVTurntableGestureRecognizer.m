@interface ASVTurntableGestureRecognizer
- (ASVDeceleration)pitchDeceleration;
- (ASVDeceleration)yawDeceleration;
- (ASVRubberBand)rubberBand;
- (ASVTurntableGestureRecognizer)initWithTurntableDelegate:(id)a3 feedbackGenerator:(id)a4;
- (ASVTurntableGestureRecognizerDelegate)turntableDelegate;
- (ASVVelocitySample2D)previousVelocitySample;
- (ASVVelocitySample2D)velocitySample;
- (BOOL)isDecelerating;
- (BOOL)panThresholdPassed;
- (BOOL)pitchThresholdPassed;
- (BOOL)yawThresholdPassed;
- (double)initialPanLocation;
- (double)lastPanLocation;
- (double)lastPanTime;
- (double)pitchThresholdLocation;
- (double)yawThresholdLocation;
- (float)decelerationPitchDelta;
- (float)decelerationYawDelta;
- (float)initialAssetPitch;
- (float)lastOverallDeltaX;
- (float)lastRubberBandedPitch;
- (float)maximumObjectScale;
- (float)minimumObjectScale;
- (id)singleFingerGestureForTouch:(id)a3 dataSource:(id)a4 enabledGestureTypes:(unint64_t)a5;
- (id)twoFingerGestureForFirstTouch:(id)a3 secondTouch:(id)a4 dataSource:(id)a5;
- (void)cancelDeceleration;
- (void)gesture:(id)a3 beganPanningAtScreenPoint:;
- (void)gesture:(id)a3 pannedToScreenPoint:;
- (void)gestureEndedPanning:(id)a3;
- (void)pitchRangeWithMinPitch:(float *)a3 maxPitch:(float *)a4;
- (void)setEnabledGestureTypes:(unint64_t)a3;
- (void)setInitialAssetPitch:(float)a3;
- (void)setInitialPanLocation:(ASVTurntableGestureRecognizer *)self;
- (void)setLastOverallDeltaX:(float)a3;
- (void)setLastPanLocation:(ASVTurntableGestureRecognizer *)self;
- (void)setLastPanTime:(double)a3;
- (void)setLastRubberBandedPitch:(float)a3;
- (void)setPanThresholdPassed:(BOOL)a3;
- (void)setPitchDeceleration:(id)a3;
- (void)setPitchThresholdLocation:(ASVTurntableGestureRecognizer *)self;
- (void)setPitchThresholdPassed:(BOOL)a3;
- (void)setPreviousVelocitySample:(id)a3;
- (void)setRubberBand:(id)a3;
- (void)setTurntableDelegate:(id)a3;
- (void)setVelocitySample:(id)a3;
- (void)setYawDeceleration:(id)a3;
- (void)setYawThresholdLocation:(ASVTurntableGestureRecognizer *)self;
- (void)setYawThresholdPassed:(BOOL)a3;
- (void)startSnappingPitch;
- (void)startSpinningPitchWithInitialVelocity:(float)a3;
- (void)startSpinningYawWithInitialVelocity:(float)a3;
@end

@implementation ASVTurntableGestureRecognizer

- (ASVTurntableGestureRecognizer)initWithTurntableDelegate:(id)a3 feedbackGenerator:(id)a4
{
  id v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ASVTurntableGestureRecognizer;
  v7 = [(ASVUnifiedGestureRecognizer *)&v24 initWithDelegate:v6 feedbackGenerator:a4];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_turntableDelegate, v6);
    *(void *)v8->_initialPanLocation = 0;
    *(void *)v8->_lastPanLocation = 0;
    v8->_lastPanTime = 0.0;
    v8->_lastOverallDeltaX = 0.0;
    v8->_lastRubberBandedPitch = 0.0;
    uint64_t v23 = 0;
    [(ASVTurntableGestureRecognizer *)v8 pitchRangeWithMinPitch:(char *)&v23 + 4 maxPitch:&v23];
    v9 = [ASVRubberBand alloc];
    +[ASVSettings floatForKey:@"ASVSettingTurntablePitchRubberBandFactor"];
    int v11 = v10;
    uint64_t v12 = v23;
    +[ASVSettings floatForKey:@"ASVSettingTurntablePitchOvershoot"];
    LODWORD(v14) = v13;
    LODWORD(v15) = v11;
    LODWORD(v16) = HIDWORD(v12);
    LODWORD(v17) = v12;
    uint64_t v18 = [(ASVRubberBand *)v9 initWithRubberBandFactor:v15 minOffset:v16 maxOffset:v17 overshoot:v14];
    rubberBand = v8->_rubberBand;
    v8->_rubberBand = (ASVRubberBand *)v18;

    v8->_panThresholdPassed = 0;
    v8->_yawThresholdPassed = 0;
    v8->_pitchThresholdPassed = 0;
    velocitySample = v8->_velocitySample;
    v8->_velocitySample = 0;

    previousVelocitySample = v8->_previousVelocitySample;
    v8->_previousVelocitySample = 0;
  }
  return v8;
}

- (void)setEnabledGestureTypes:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ASVTurntableGestureRecognizer;
  [(ASVUnifiedGestureRecognizer *)&v4 setEnabledGestureTypes:a3];
  [(ASVTurntableGestureRecognizer *)self cancelDeceleration];
}

- (id)singleFingerGestureForTouch:(id)a3 dataSource:(id)a4 enabledGestureTypes:(unint64_t)a5
{
  id v7 = a3;
  v8 = [ASVTurntableSingleFingerGesture alloc];
  v9 = [(ASVUnifiedGestureRecognizer *)self dataSource];
  int v10 = [(ASVTurntableSingleFingerGesture *)v8 initWithTouch:v7 dataSource:v9 turntableDelegate:self enabledGestureTypes:a5];

  return v10;
}

- (id)twoFingerGestureForFirstTouch:(id)a3 secondTouch:(id)a4 dataSource:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = [ASVTurntableTwoFingerGesture alloc];
  int v10 = [(ASVUnifiedGestureRecognizer *)self dataSource];
  int v11 = [(ASVTurntableTwoFingerGesture *)v9 initWithFirstTouch:v8 secondTouch:v7 dataSource:v10 turntableDelegate:self];

  return v11;
}

- (float)minimumObjectScale
{
  if ([(ASVUnifiedGestureRecognizer *)self allowObjectScaling])
  {
    +[ASVSettings floatForKey:@"ASVSettingMinimumAssetTurntableScale"];
  }
  else
  {
    [(ASVUnifiedGestureRecognizer *)self currentObjectScale];
  }
  return result;
}

- (float)maximumObjectScale
{
  if ([(ASVUnifiedGestureRecognizer *)self allowObjectScaling])
  {
    +[ASVSettings floatForKey:@"ASVSettingMaximumAssetTurntableScale"];
  }
  else
  {
    [(ASVUnifiedGestureRecognizer *)self currentObjectScale];
  }
  return result;
}

- (void)startSpinningYawWithInitialVelocity:(float)a3
{
  float v5 = fabsf(a3);
  +[ASVSettings floatForKey:@"ASVSettingMinimumVelocityToBeginYawSpinDeceleration"];
  if (v5 > v6)
  {
    id v7 = [ASVDampingDeceleration alloc];
    +[ASVSettings floatForKey:@"ASVSettingMinimumDeltaToEndSpinDeceleration"];
    int v9 = v8;
    +[ASVSettings floatForKey:@"ASVSettingTurntableYawSpinDecelerationRate"];
    LODWORD(v11) = v10;
    *(float *)&double v12 = a3;
    LODWORD(v13) = v9;
    double v14 = [(ASVDampingDeceleration *)v7 initWithVelocity:v12 minEndDelta:v13 decelerationRate:v11];
    [(ASVTurntableGestureRecognizer *)self setYawDeceleration:v14];
  }
}

- (void)startSpinningPitchWithInitialVelocity:(float)a3
{
  float v5 = fabsf(a3);
  +[ASVSettings floatForKey:@"ASVSettingMinimumVelocityToBeginPitchSpinDeceleration"];
  if (v5 > v6)
  {
    +[ASVSettings floatForKey:@"ASVSettingTurntablePitchDecelerationRubberBandUndershoot"];
    float v8 = v7;
    int v9 = [ASVRubberBand alloc];
    int v10 = [(ASVTurntableGestureRecognizer *)self rubberBand];
    [v10 rubberBandFactor];
    int v12 = v11;
    double v13 = [(ASVTurntableGestureRecognizer *)self rubberBand];
    [v13 minOffset];
    float v15 = v8 + v14;
    double v16 = [(ASVTurntableGestureRecognizer *)self rubberBand];
    [v16 maxOffset];
    *(float *)&double v18 = v17 - v8;
    LODWORD(v19) = v12;
    *(float *)&double v20 = v15;
    *(float *)&double v21 = v8;
    v34 = [(ASVRubberBand *)v9 initWithRubberBandFactor:v19 minOffset:v20 maxOffset:v18 overshoot:v21];

    v22 = [ASVRubberBandedSpinDeceleration alloc];
    +[ASVSettings floatForKey:@"ASVSettingMinimumDeltaToEndSpinDeceleration"];
    int v24 = v23;
    v25 = [(ASVUnifiedGestureRecognizer *)self dataSource];
    [v25 assetPitch];
    int v27 = v26;
    +[ASVSettings floatForKey:@"ASVSettingTurntablePitchSpinDecelerationRate"];
    LODWORD(v29) = v28;
    *(float *)&double v30 = a3;
    LODWORD(v31) = v24;
    LODWORD(v32) = v27;
    v33 = [(ASVRubberBandedSpinDeceleration *)v22 initWithVelocity:v34 minEndDelta:v30 startingOffset:v31 decelerationRate:v32 rubberBand:v29];
    [(ASVTurntableGestureRecognizer *)self setPitchDeceleration:v33];
  }
}

- (void)startSnappingPitch
{
  v3 = [ASVSnapDeceleration alloc];
  +[ASVSettings floatForKey:@"ASVSettingMinimumDeltaToEndSnapDeceleration"];
  int v5 = v4;
  id v18 = [(ASVUnifiedGestureRecognizer *)self dataSource];
  [v18 assetPitch];
  int v7 = v6;
  float v8 = [(ASVTurntableGestureRecognizer *)self rubberBand];
  [v8 minOffset];
  int v10 = v9;
  int v11 = [(ASVTurntableGestureRecognizer *)self rubberBand];
  [v11 maxOffset];
  LODWORD(v13) = v12;
  LODWORD(v14) = v5;
  LODWORD(v15) = v7;
  LODWORD(v16) = v10;
  float v17 = [(ASVSnapDeceleration *)v3 initWithVelocity:0.0 minEndDelta:v14 startingOffset:v15 minOffset:v16 maxOffset:v13];
  [(ASVTurntableGestureRecognizer *)self setPitchDeceleration:v17];
}

- (BOOL)isDecelerating
{
  int v4 = [(ASVTurntableGestureRecognizer *)self yawDeceleration];
  if (v4)
  {
    v2 = [(ASVTurntableGestureRecognizer *)self yawDeceleration];
    if ([v2 isDecelerating])
    {
      char v5 = 1;
LABEL_8:

      goto LABEL_9;
    }
  }
  int v6 = [(ASVTurntableGestureRecognizer *)self pitchDeceleration];
  if (v6)
  {
    int v7 = [(ASVTurntableGestureRecognizer *)self pitchDeceleration];
    char v5 = [v7 isDecelerating];
  }
  else
  {
    char v5 = 0;
  }

  if (v4) {
    goto LABEL_8;
  }
LABEL_9:

  return v5;
}

- (float)decelerationYawDelta
{
  v3 = [(ASVTurntableGestureRecognizer *)self yawDeceleration];

  if (!v3) {
    return 0.0;
  }
  int v4 = [(ASVTurntableGestureRecognizer *)self yawDeceleration];
  [v4 decelerationDelta];
  float v6 = v5;

  return v6;
}

- (float)decelerationPitchDelta
{
  v3 = [(ASVTurntableGestureRecognizer *)self pitchDeceleration];

  if (!v3) {
    return 0.0;
  }
  int v4 = [(ASVTurntableGestureRecognizer *)self pitchDeceleration];
  [v4 decelerationDelta];
  float v6 = v5;

  return v6;
}

- (void)cancelDeceleration
{
  [(ASVTurntableGestureRecognizer *)self setYawDeceleration:0];
  [(ASVTurntableGestureRecognizer *)self setPitchDeceleration:0];
}

- (void)pitchRangeWithMinPitch:(float *)a3 maxPitch:(float *)a4
{
  +[ASVSettings floatForKey:@"ASVSettingTurntablePitchLimit"];
  *a3 = -v6;
  *a4 = v6;
}

- (void)gesture:(id)a3 beganPanningAtScreenPoint:
{
  double v4 = v3;
  [(ASVTurntableGestureRecognizer *)self setInitialPanLocation:a3];
  [(ASVTurntableGestureRecognizer *)self setPanThresholdPassed:0];
  [(ASVTurntableGestureRecognizer *)self setYawThresholdPassed:0];
  [(ASVTurntableGestureRecognizer *)self setPitchThresholdPassed:0];
  [(ASVTurntableGestureRecognizer *)self setLastPanTime:0.0];
  [(ASVTurntableGestureRecognizer *)self setLastOverallDeltaX:0.0];
  [(ASVTurntableGestureRecognizer *)self setVelocitySample:0];
  [(ASVTurntableGestureRecognizer *)self setPreviousVelocitySample:0];
  [(ASVTurntableGestureRecognizer *)self setLastPanLocation:v4];
  double v6 = CACurrentMediaTime();
  [(ASVTurntableGestureRecognizer *)self setLastPanTime:v6];
}

- (void)gesture:(id)a3 pannedToScreenPoint:
{
  double v4 = v3;
  if (![(ASVTurntableGestureRecognizer *)self panThresholdPassed])
  {
    [(ASVTurntableGestureRecognizer *)self initialPanLocation];
    float32x2_t v7 = vsub_f32(*(float32x2_t *)&v4, v6);
    float v8 = sqrtf(vaddv_f32(vmul_f32(v7, v7)));
    +[ASVSettings floatForKey:@"ASVSettingTurntableMinimumPanMoveDistance"];
    if (v8 < v9) {
      return;
    }
    [(ASVTurntableGestureRecognizer *)self setPanThresholdPassed:1];
  }
  double v10 = CACurrentMediaTime();
  int v11 = [(ASVTurntableGestureRecognizer *)self velocitySample];
  [(ASVTurntableGestureRecognizer *)self setPreviousVelocitySample:v11];

  int v12 = [ASVVelocitySample2D alloc];
  [(ASVTurntableGestureRecognizer *)self lastPanLocation];
  double v14 = v13;
  [(ASVTurntableGestureRecognizer *)self lastPanTime];
  double v16 = [(ASVVelocitySample2D *)v12 initWithStart:v14 end:v4 deltaTime:v10 - v15];
  [(ASVTurntableGestureRecognizer *)self setVelocitySample:v16];

  if (![(ASVTurntableGestureRecognizer *)self yawThresholdPassed]
    || ![(ASVTurntableGestureRecognizer *)self pitchThresholdPassed])
  {
    double v58 = v10;
    +[ASVSettings floatForKey:@"ASVSettingTurntableSafeZoneAngle"];
    float v18 = v17;
    float v19 = 0.7854 - v17;
    [(ASVTurntableGestureRecognizer *)self initialPanLocation];
    float v21 = fabsf(vsub_f32(*(float32x2_t *)&v4, v20).f32[0]);
    [(ASVTurntableGestureRecognizer *)self initialPanLocation];
    float v23 = fabsf(COERCE_FLOAT(vsub_f32(*(float32x2_t *)&v4, v22).i32[1]));
    float v24 = atanf(v23 / v21);
    if (![(ASVTurntableGestureRecognizer *)self yawThresholdPassed])
    {
      float v57 = v23;
      float v25 = 1.57079633 - v18;
      float v26 = 1.0;
      if (v24 < v25)
      {
        float v26 = 0.0;
        if (v24 >= 0.7854) {
          float v26 = 1.0 - (float)((float)(v25 - v24) / v19);
        }
      }
      float v27 = v19;
      +[ASVSettings floatForKey:@"ASVSettingTurntablePitchYawRotationThreshold"];
      float v29 = v28;
      if ([(ASVTurntableGestureRecognizer *)self pitchThresholdPassed])
      {
        +[ASVSettings floatForKey:@"ASVSettingTurntablePitchYawRotationThresholdHarder"];
        float v29 = v30;
      }
      BOOL v31 = v21 < (float)(v26 * v29);
      float v19 = v27;
      float v23 = v57;
      if (!v31)
      {
        [(ASVTurntableGestureRecognizer *)self setYawThresholdPassed:1];
        [(ASVTurntableGestureRecognizer *)self setYawThresholdLocation:v4];
      }
    }
    double v10 = v58;
    if (![(ASVTurntableGestureRecognizer *)self pitchThresholdPassed])
    {
      float v32 = 1.0;
      if (v24 > v18)
      {
        float v32 = 0.0;
        if (v24 <= 0.7854) {
          float v32 = 1.0 - (float)((float)(v24 - v18) / v19);
        }
      }
      +[ASVSettings floatForKey:@"ASVSettingTurntablePitchYawRotationThreshold"];
      float v34 = v33;
      if ([(ASVTurntableGestureRecognizer *)self yawThresholdPassed])
      {
        +[ASVSettings floatForKey:@"ASVSettingTurntablePitchYawRotationThresholdHarder"];
        float v34 = v35;
      }
      if (v23 >= (float)(v32 * v34))
      {
        [(ASVTurntableGestureRecognizer *)self setPitchThresholdPassed:1];
        [(ASVTurntableGestureRecognizer *)self setPitchThresholdLocation:v4];
        v36 = [(ASVUnifiedGestureRecognizer *)self dataSource];
        [v36 assetPitch];
        -[ASVTurntableGestureRecognizer setInitialAssetPitch:](self, "setInitialAssetPitch:");

        [(ASVTurntableGestureRecognizer *)self initialAssetPitch];
        -[ASVTurntableGestureRecognizer setLastRubberBandedPitch:](self, "setLastRubberBandedPitch:");
      }
    }
  }
  float v37 = 0.0;
  float v38 = 0.0;
  if ([(ASVTurntableGestureRecognizer *)self yawThresholdPassed])
  {
    [(ASVTurntableGestureRecognizer *)self yawThresholdLocation];
    double v59 = COERCE_DOUBLE(vsub_f32(*(float32x2_t *)&v4, v39));
    [(ASVTurntableGestureRecognizer *)self lastOverallDeltaX];
    float v41 = *(float *)&v59 - v40;
    +[ASVSettings floatForKey:@"ASVSettingTurntableYawRadiansPerPoint"];
    float v38 = v41 * v42;
    [(ASVTurntableGestureRecognizer *)self setLastOverallDeltaX:v59];
  }
  if ([(ASVTurntableGestureRecognizer *)self pitchThresholdPassed])
  {
    [(ASVTurntableGestureRecognizer *)self pitchThresholdLocation];
    float32x2_t v60 = vsub_f32(*(float32x2_t *)&v4, v43);
    +[ASVSettings floatForKey:@"ASVSettingTurntablePitchRadiansPerPoint"];
    float v45 = vmuls_lane_f32(v44, v60, 1);
    [(ASVTurntableGestureRecognizer *)self initialAssetPitch];
    float v47 = v46 + v45;
    v48 = [(ASVTurntableGestureRecognizer *)self rubberBand];
    *(float *)&double v49 = v47;
    [v48 rubberBandOffsetForOffset:v49];
    float v51 = v50;

    [(ASVTurntableGestureRecognizer *)self lastRubberBandedPitch];
    float v37 = v51 - v52;
    *(float *)&double v53 = v51;
    [(ASVTurntableGestureRecognizer *)self setLastRubberBandedPitch:v53];
  }
  if (v38 != 0.0 || v37 != 0.0)
  {
    v54 = [(ASVTurntableGestureRecognizer *)self turntableDelegate];
    *(float *)&double v55 = v38;
    *(float *)&double v56 = v37;
    [v54 turntableGestureRecognizer:self rotatedAssetByDeltaYaw:v55 deltaPitch:v56];
  }
  [(ASVTurntableGestureRecognizer *)self setLastPanLocation:v4];
  [(ASVTurntableGestureRecognizer *)self setLastPanTime:v10];
}

- (void)gestureEndedPanning:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  float32x2_t v6 = [(ASVTurntableGestureRecognizer *)self velocitySample];
  float32x2_t v7 = [(ASVTurntableGestureRecognizer *)self previousVelocitySample];
  [v6 calcFinalVelocityFromPreviousSample:v7];
  long long v21 = v8;

  +[ASVSettings floatForKey:@"ASVSettingTurntableYawRadiansPerPoint"];
  float v10 = v9;
  +[ASVSettings floatForKey:@"ASVSettingTurntablePitchRadiansPerPoint"];
  float v12 = v11;
  if (isKindOfClass)
  {
    HIDWORD(v13) = DWORD1(v21);
    *(float *)&double v13 = v10 * *(float *)&v21;
    [(ASVTurntableGestureRecognizer *)self startSpinningYawWithInitialVelocity:v13];
  }
  double v14 = [(ASVUnifiedGestureRecognizer *)self dataSource];
  [v14 assetPitch];
  int v16 = v15;

  float v17 = [(ASVTurntableGestureRecognizer *)self rubberBand];
  LODWORD(v18) = v16;
  int v19 = [v17 offsetIsWithinRubberBandedRange:v18];

  if (v19)
  {
    [(ASVTurntableGestureRecognizer *)self startSnappingPitch];
  }
  else if (isKindOfClass)
  {
    HIDWORD(v20) = v22.i32[1];
    *(float *)&double v20 = vmuls_lane_f32(v12, v22, 1);
    [(ASVTurntableGestureRecognizer *)self startSpinningPitchWithInitialVelocity:v20];
  }
}

- (ASVTurntableGestureRecognizerDelegate)turntableDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_turntableDelegate);
  return (ASVTurntableGestureRecognizerDelegate *)WeakRetained;
}

- (void)setTurntableDelegate:(id)a3
{
}

- (double)initialPanLocation
{
  return *(double *)(a1 + 136);
}

- (void)setInitialPanLocation:(ASVTurntableGestureRecognizer *)self
{
  *(void *)self->_initialPanLocation = v2;
}

- (double)lastPanLocation
{
  return *(double *)(a1 + 144);
}

- (void)setLastPanLocation:(ASVTurntableGestureRecognizer *)self
{
  *(void *)self->_lastPanLocation = v2;
}

- (double)lastPanTime
{
  return self->_lastPanTime;
}

- (void)setLastPanTime:(double)a3
{
  self->_lastPanTime = a3;
}

- (float)initialAssetPitch
{
  return self->_initialAssetPitch;
}

- (void)setInitialAssetPitch:(float)a3
{
  self->_initialAssetPitch = a3;
}

- (float)lastOverallDeltaX
{
  return self->_lastOverallDeltaX;
}

- (void)setLastOverallDeltaX:(float)a3
{
  self->_lastOverallDeltaX = a3;
}

- (float)lastRubberBandedPitch
{
  return self->_lastRubberBandedPitch;
}

- (void)setLastRubberBandedPitch:(float)a3
{
  self->_lastRubberBandedPitch = a3;
}

- (ASVRubberBand)rubberBand
{
  return self->_rubberBand;
}

- (void)setRubberBand:(id)a3
{
}

- (BOOL)panThresholdPassed
{
  return self->_panThresholdPassed;
}

- (void)setPanThresholdPassed:(BOOL)a3
{
  self->_panThresholdPassed = a3;
}

- (BOOL)yawThresholdPassed
{
  return self->_yawThresholdPassed;
}

- (void)setYawThresholdPassed:(BOOL)a3
{
  self->_yawThresholdPassed = a3;
}

- (double)yawThresholdLocation
{
  return *(double *)(a1 + 168);
}

- (void)setYawThresholdLocation:(ASVTurntableGestureRecognizer *)self
{
  *(void *)self->_yawThresholdLocation = v2;
}

- (BOOL)pitchThresholdPassed
{
  return self->_pitchThresholdPassed;
}

- (void)setPitchThresholdPassed:(BOOL)a3
{
  self->_pitchThresholdPassed = a3;
}

- (double)pitchThresholdLocation
{
  return *(double *)(a1 + 176);
}

- (void)setPitchThresholdLocation:(ASVTurntableGestureRecognizer *)self
{
  *(void *)self->_pitchThresholdLocation = v2;
}

- (ASVVelocitySample2D)velocitySample
{
  return self->_velocitySample;
}

- (void)setVelocitySample:(id)a3
{
}

- (ASVVelocitySample2D)previousVelocitySample
{
  return self->_previousVelocitySample;
}

- (void)setPreviousVelocitySample:(id)a3
{
}

- (ASVDeceleration)yawDeceleration
{
  return self->_yawDeceleration;
}

- (void)setYawDeceleration:(id)a3
{
}

- (ASVDeceleration)pitchDeceleration
{
  return self->_pitchDeceleration;
}

- (void)setPitchDeceleration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pitchDeceleration, 0);
  objc_storeStrong((id *)&self->_yawDeceleration, 0);
  objc_storeStrong((id *)&self->_previousVelocitySample, 0);
  objc_storeStrong((id *)&self->_velocitySample, 0);
  objc_storeStrong((id *)&self->_rubberBand, 0);
  objc_destroyWeak((id *)&self->_turntableDelegate);
}

@end