@interface ASVWorldGestureRecognizer
- (ASVDeceleration)translationDeceleration;
- (ASVVelocitySample3D)translationLastVelocitySample;
- (ASVVelocitySample3D)translationVelocitySample;
- (ASVWorldGestureRecognizer)initWithWorldDelegate:(id)a3 feedbackGenerator:(id)a4;
- (ASVWorldGestureRecognizerDelegate)worldDelegate;
- (BOOL)isActive;
- (BOOL)isDecelerating;
- (NSSet)snapScalesSet;
- (__n128)lastTranslationLocation;
- (__n128)normalizedVelocity;
- (double)lastTranslationTime;
- (float)maximumObjectScale;
- (float)minimumObjectScale;
- (id)singleFingerGestureForTouch:(id)a3 dataSource:(id)a4 enabledGestureTypes:(unint64_t)a5;
- (id)twoFingerGestureForFirstTouch:(id)a3 secondTouch:(id)a4 dataSource:(id)a5;
- (void)cancelDeceleration;
- (void)gesture:(id)a3 levitatedAssetToScreenPoint:;
- (void)gesture:(id)a3 translatedAssetToScreenPoint:;
- (void)gestureBeganLevitation:(id)a3;
- (void)gestureBeganTranslation:(id)a3;
- (void)gestureEndedLevitation:(id)a3;
- (void)gestureEndedTranslation:(id)a3;
- (void)setEnabledGestureTypes:(unint64_t)a3;
- (void)setLastTranslationLocation:(ASVWorldGestureRecognizer *)self;
- (void)setLastTranslationTime:(double)a3;
- (void)setNormalizedVelocity:(ASVWorldGestureRecognizer *)self;
- (void)setSnapScalesSet:(id)a3;
- (void)setTranslationDeceleration:(id)a3;
- (void)setTranslationLastVelocitySample:(id)a3;
- (void)setTranslationVelocitySample:(id)a3;
- (void)setWorldDelegate:(id)a3;
- (void)startTranslationDecelerationWithInitialVelocity:(ASVWorldGestureRecognizer *)self;
- (void)update;
- (void)updateDecelerationTranslation;
@end

@implementation ASVWorldGestureRecognizer

- (ASVWorldGestureRecognizer)initWithWorldDelegate:(id)a3 feedbackGenerator:(id)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ASVWorldGestureRecognizer;
  v7 = [(ASVUnifiedGestureRecognizer *)&v15 initWithDelegate:v6 feedbackGenerator:a4];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_worldDelegate, v6);
    v9 = (void *)MEMORY[0x1E4F1CAD0];
    LODWORD(v10) = 1.0;
    v11 = [NSNumber numberWithFloat:v10];
    uint64_t v12 = objc_msgSend(v9, "setWithObjects:", v11, 0);
    snapScalesSet = v8->_snapScalesSet;
    v8->_snapScalesSet = (NSSet *)v12;
  }
  return v8;
}

- (void)setEnabledGestureTypes:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ASVWorldGestureRecognizer;
  [(ASVUnifiedGestureRecognizer *)&v4 setEnabledGestureTypes:a3];
  [(ASVWorldGestureRecognizer *)self cancelDeceleration];
}

- (id)singleFingerGestureForTouch:(id)a3 dataSource:(id)a4 enabledGestureTypes:(unint64_t)a5
{
  id v7 = a3;
  v8 = [ASVWorldSingleFingerGesture alloc];
  v9 = [(ASVUnifiedGestureRecognizer *)self dataSource];
  double v10 = [(ASVWorldSingleFingerGesture *)v8 initWithTouch:v7 dataSource:v9 worldDelegate:self enabledGestureTypes:a5];

  return v10;
}

- (id)twoFingerGestureForFirstTouch:(id)a3 secondTouch:(id)a4 dataSource:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = [ASVWorldTwoFingerGesture alloc];
  double v10 = [(ASVUnifiedGestureRecognizer *)self dataSource];
  v11 = [(ASVWorldTwoFingerGesture *)v9 initWithFirstTouch:v8 secondTouch:v7 dataSource:v10 worldDelegate:self];

  uint64_t v12 = [(ASVWorldGestureRecognizer *)self snapScalesSet];
  [(ASVTwoFingerGesture *)v11 setSnapScalesSet:v12];

  return v11;
}

- (BOOL)isActive
{
  v4.receiver = self;
  v4.super_class = (Class)ASVWorldGestureRecognizer;
  return [(ASVUnifiedGestureRecognizer *)&v4 isActive]
      || [(ASVWorldGestureRecognizer *)self isDecelerating];
}

- (void)update
{
  v3.receiver = self;
  v3.super_class = (Class)ASVWorldGestureRecognizer;
  [(ASVUnifiedGestureRecognizer *)&v3 update];
  if ([(ASVWorldGestureRecognizer *)self isDecelerating]) {
    [(ASVWorldGestureRecognizer *)self updateDecelerationTranslation];
  }
}

- (float)minimumObjectScale
{
  if ([(ASVUnifiedGestureRecognizer *)self allowObjectScaling])
  {
    +[ASVSettings floatForKey:@"ASVSettingMinimumAssetWorldScale"];
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
    +[ASVSettings floatForKey:@"ASVSettingMaximumAssetWorldScale"];
  }
  else
  {
    [(ASVUnifiedGestureRecognizer *)self currentObjectScale];
  }
  return result;
}

- (void)gestureBeganTranslation:(id)a3
{
  [(ASVWorldGestureRecognizer *)self cancelDeceleration];
  [(ASVWorldGestureRecognizer *)self setTranslationVelocitySample:0];
  [(ASVWorldGestureRecognizer *)self setTranslationLastVelocitySample:0];
  id v4 = [(ASVWorldGestureRecognizer *)self worldDelegate];
  [v4 worldGestureRecognizerBeganTranslation:self];
}

- (void)gesture:(id)a3 translatedAssetToScreenPoint:
{
  double v4 = v3;
  id v6 = [(ASVWorldGestureRecognizer *)self worldDelegate];
  [v6 worldGestureRecognizer:self translatedAssetToScreenPoint:v4];

  id v7 = [(ASVUnifiedGestureRecognizer *)self dataSource];
  if (v7)
  {
    id v17 = v7;
    [v7 assetWorldPosition];
    double v18 = v8;
    double v9 = CACurrentMediaTime();
    double v10 = [(ASVWorldGestureRecognizer *)self translationVelocitySample];

    if (!v10)
    {
      [(ASVWorldGestureRecognizer *)self setLastTranslationLocation:v18];
      [(ASVWorldGestureRecognizer *)self setLastTranslationTime:v9];
    }
    v11 = [(ASVWorldGestureRecognizer *)self translationVelocitySample];
    [(ASVWorldGestureRecognizer *)self setTranslationLastVelocitySample:v11];

    uint64_t v12 = [ASVVelocitySample3D alloc];
    [(ASVWorldGestureRecognizer *)self lastTranslationLocation];
    double v16 = v13;
    [(ASVWorldGestureRecognizer *)self lastTranslationTime];
    objc_super v15 = [(ASVVelocitySample3D *)v12 initWithStart:v16 end:v18 deltaTime:v9 - v14];
    [(ASVWorldGestureRecognizer *)self setTranslationVelocitySample:v15];

    [(ASVWorldGestureRecognizer *)self setLastTranslationLocation:v18];
    [(ASVWorldGestureRecognizer *)self setLastTranslationTime:v9];
    id v7 = v17;
  }
}

- (void)gestureEndedTranslation:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = [(ASVWorldGestureRecognizer *)self translationVelocitySample];
    id v7 = [(ASVWorldGestureRecognizer *)self translationLastVelocitySample];
    [v6 calcFinalVelocityFromPreviousSample:v7];
    double v9 = v8;

    [(ASVWorldGestureRecognizer *)self startTranslationDecelerationWithInitialVelocity:v9];
  }
  double v10 = [(ASVWorldGestureRecognizer *)self worldDelegate];
  [v10 worldGestureRecognizerEndedTranslation:self];
}

- (void)gestureBeganLevitation:(id)a3
{
  uint64_t v4 = [(ASVWorldGestureRecognizer *)self worldDelegate];
  if (v4)
  {
    v5 = (void *)v4;
    if (objc_opt_respondsToSelector()) {
      [v5 worldGestureRecognizerBeganLevitation:self];
    }
  }
  MEMORY[0x1F4181820]();
}

- (void)gesture:(id)a3 levitatedAssetToScreenPoint:
{
  double v4 = v3;
  uint64_t v6 = [(ASVWorldGestureRecognizer *)self worldDelegate];
  if (v6)
  {
    id v7 = (void *)v6;
    if (objc_opt_respondsToSelector()) {
      [v7 worldGestureRecognizer:self levitatedAssetToScreenPoint:v4];
    }
  }
  MEMORY[0x1F4181820]();
}

- (void)gestureEndedLevitation:(id)a3
{
  uint64_t v4 = [(ASVWorldGestureRecognizer *)self worldDelegate];
  if (v4)
  {
    v5 = (void *)v4;
    if (objc_opt_respondsToSelector()) {
      [v5 worldGestureRecognizerEndedLevitation:self];
    }
  }
  MEMORY[0x1F4181820]();
}

- (void)startTranslationDecelerationWithInitialVelocity:(ASVWorldGestureRecognizer *)self
{
  float32x4_t v14 = v2;
  float32x4_t v4 = vmulq_f32(v2, v2);
  v4.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v4, 2), vaddq_f32(v4, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v4.f32, 1))).u64[0];
  v4.f32[0] = sqrtf(v4.f32[0]);
  double v15 = *(double *)v4.i64;
  float v5 = fabsf(v4.f32[0]);
  +[ASVSettings floatForKey:@"ASVSettingMinimumVelocityToBeginTranslationDeceleration"];
  if (v5 > v6)
  {
    [(ASVWorldGestureRecognizer *)self setNormalizedVelocity:*(double *)vdivq_f32(v14, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v15, 0)).i64];
    id v7 = [ASVDampingDeceleration alloc];
    +[ASVSettings floatForKey:@"ASVSettingMinimumDeltaToEndTranslationDeceleration"];
    int v9 = v8;
    +[ASVSettings floatForKey:@"ASVSettingWorldTranslationDecelerationRate"];
    LODWORD(v11) = v10;
    LODWORD(v12) = v9;
    double v13 = [(ASVDampingDeceleration *)v7 initWithVelocity:v15 minEndDelta:v12 decelerationRate:v11];
    [(ASVWorldGestureRecognizer *)self setTranslationDeceleration:v13];

    double v16 = [(ASVWorldGestureRecognizer *)self worldDelegate];
    [v16 worldGestureRecognizerBeganTranslationDeceleration:self];
  }
}

- (BOOL)isDecelerating
{
  double v3 = [(ASVWorldGestureRecognizer *)self translationDeceleration];
  if (v3)
  {
    float32x4_t v4 = [(ASVWorldGestureRecognizer *)self translationDeceleration];
    char v5 = [v4 isDecelerating];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)updateDecelerationTranslation
{
  double v3 = [(ASVWorldGestureRecognizer *)self translationDeceleration];

  if (v3)
  {
    id v8 = [(ASVWorldGestureRecognizer *)self worldDelegate];
    float32x4_t v4 = [(ASVWorldGestureRecognizer *)self translationDeceleration];
    [v4 decelerationDelta];
    double v7 = v5;

    if (*(float *)&v7 <= 0.0)
    {
      -[ASVWorldGestureRecognizer setTranslationDeceleration:](self, "setTranslationDeceleration:", 0, v7);
      [v8 worldGestureRecognizerEndedTranslationDeceleration:self];
    }
    else
    {
      [(ASVWorldGestureRecognizer *)self normalizedVelocity];
      objc_msgSend(v8, "worldGestureRecognizer:decelerationTranslationDelta:", self, *(double *)vmulq_n_f32(v6, *(float *)&v7).i64);
    }
  }
}

- (void)cancelDeceleration
{
}

- (ASVWorldGestureRecognizerDelegate)worldDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_worldDelegate);
  return (ASVWorldGestureRecognizerDelegate *)WeakRetained;
}

- (void)setWorldDelegate:(id)a3
{
}

- (NSSet)snapScalesSet
{
  return self->_snapScalesSet;
}

- (void)setSnapScalesSet:(id)a3
{
}

- (ASVDeceleration)translationDeceleration
{
  return self->_translationDeceleration;
}

- (void)setTranslationDeceleration:(id)a3
{
}

- (ASVVelocitySample3D)translationVelocitySample
{
  return self->_translationVelocitySample;
}

- (void)setTranslationVelocitySample:(id)a3
{
}

- (ASVVelocitySample3D)translationLastVelocitySample
{
  return self->_translationLastVelocitySample;
}

- (void)setTranslationLastVelocitySample:(id)a3
{
}

- (__n128)normalizedVelocity
{
  return a1[11];
}

- (void)setNormalizedVelocity:(ASVWorldGestureRecognizer *)self
{
  *(_OWORD *)self->_normalizedVelocity = v2;
}

- (__n128)lastTranslationLocation
{
  return a1[12];
}

- (void)setLastTranslationLocation:(ASVWorldGestureRecognizer *)self
{
  *(_OWORD *)self->_lastTranslationLocation = v2;
}

- (double)lastTranslationTime
{
  return self->_lastTranslationTime;
}

- (void)setLastTranslationTime:(double)a3
{
  self->_lastTranslationTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_translationLastVelocitySample, 0);
  objc_storeStrong((id *)&self->_translationVelocitySample, 0);
  objc_storeStrong((id *)&self->_translationDeceleration, 0);
  objc_storeStrong((id *)&self->_snapScalesSet, 0);
  objc_destroyWeak((id *)&self->_worldDelegate);
}

@end