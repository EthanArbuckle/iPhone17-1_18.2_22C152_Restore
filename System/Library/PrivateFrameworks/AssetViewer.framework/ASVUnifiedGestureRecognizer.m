@interface ASVUnifiedGestureRecognizer
- (ASVGesture)currentGesture;
- (ASVGestureDataSource)dataSource;
- (ASVGestureFeedbackGenerator)feedbackGenerator;
- (ASVUnifiedGestureRecognizer)initWithDelegate:(id)a3 feedbackGenerator:(id)a4;
- (ASVUnifiedGestureRecognizerDelegate)delegate;
- (BOOL)allowObjectScaling;
- (BOOL)generatesTaps;
- (BOOL)generatesTransforms;
- (BOOL)gestureTypeIsEnabled:(unint64_t)a3;
- (BOOL)isActive;
- (BOOL)isDecelerating;
- (BOOL)isEnabled;
- (BOOL)isScaleAnimating;
- (BOOL)lastTapWasOnAsset;
- (BOOL)singleFingerGesturesEnabled;
- (NSMutableSet)currentTouches;
- (NSTimer)singleTapTimer;
- (double)lastFireFeedbackTime;
- (double)lastTapLocation;
- (double)lastTapTime;
- (double)startScaleAnimationTime;
- (float)animateScaleEnd;
- (float)animateScaleStart;
- (float)animatedScaleValue;
- (float)currentObjectScale;
- (float)maximumObjectScale;
- (float)minimumObjectScale;
- (id)singleFingerGestureForTouch:(id)a3 dataSource:(id)a4 enabledGestureTypes:(unint64_t)a5;
- (id)twoFingerGestureForFirstTouch:(id)a3 secondTouch:(id)a4 dataSource:(id)a5;
- (unint64_t)enabledGestureTypes;
- (void)gesture:(id)a3 rotatedAssetByDeltaYaw:(float)a4;
- (void)gesture:(id)a3 scaledAssetToScale:(float)a4;
- (void)gesture:(id)a3 singleTappedAtScreenPoint:(BOOL)a4 onAsset:;
- (void)gestureBeganRotation:(id)a3;
- (void)gestureBeganScaling:(id)a3;
- (void)gestureDidSnapAwayFromScale:(id)a3;
- (void)gestureDidSnapToScale:(id)a3;
- (void)gestureEndedRotation:(id)a3;
- (void)gestureEndedScaling:(id)a3;
- (void)gestureStartScaleAnimationFrom:(float)a3 to:(float)a4;
- (void)gestureStopScaleAnimation;
- (void)processTouches:(id)a3 phase:(int64_t)a4;
- (void)setAllowObjectScaling:(BOOL)a3;
- (void)setAnimateScaleEnd:(float)a3;
- (void)setAnimateScaleStart:(float)a3;
- (void)setCurrentGesture:(id)a3;
- (void)setCurrentObjectScale:(float)a3;
- (void)setCurrentTouches:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabledGestureTypes:(unint64_t)a3;
- (void)setFeedbackGenerator:(id)a3;
- (void)setIsScaleAnimating:(BOOL)a3;
- (void)setLastFireFeedbackTime:(double)a3;
- (void)setLastTapLocation:(ASVUnifiedGestureRecognizer *)self;
- (void)setLastTapTime:(double)a3;
- (void)setLastTapWasOnAsset:(BOOL)a3;
- (void)setSingleTapTimer:(id)a3;
- (void)setStartScaleAnimationTime:(double)a3;
- (void)startGestureFromTouches:(id)a3;
- (void)update;
- (void)updateGestureFromTouches:(id)a3 phase:(int64_t)a4;
@end

@implementation ASVUnifiedGestureRecognizer

- (ASVUnifiedGestureRecognizer)initWithDelegate:(id)a3 feedbackGenerator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ASVUnifiedGestureRecognizer;
  v8 = [(ASVUnifiedGestureRecognizer *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_dataSource, 0);
    objc_storeWeak((id *)&v9->_delegate, v6);
    objc_storeStrong((id *)&v9->_feedbackGenerator, a4);
    currentGesture = v9->_currentGesture;
    v9->_currentGesture = 0;

    v9->_lastTapWasOnAsset = 0;
    v9->_lastTapTime = 0.0;
    *(void *)v9->_lastTapLocation = 0;
    singleTapTimer = v9->_singleTapTimer;
    v9->_lastFireFeedbackTime = 0.0;
    v9->_singleTapTimer = 0;

    v9->_enabledGestureTypes = 7;
  }

  return v9;
}

- (BOOL)isActive
{
  v2 = [(ASVUnifiedGestureRecognizer *)self currentGesture];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)update
{
  BOOL v3 = [(ASVUnifiedGestureRecognizer *)self currentGesture];

  if (v3)
  {
    id v4 = [(ASVUnifiedGestureRecognizer *)self currentGesture];
    [v4 updateGesture];
  }
}

- (BOOL)isEnabled
{
  return [(ASVUnifiedGestureRecognizer *)self enabledGestureTypes] != 0;
}

- (void)setEnabledGestureTypes:(unint64_t)a3
{
  v5 = [(ASVUnifiedGestureRecognizer *)self currentGesture];

  if (v5)
  {
    id v6 = [(ASVUnifiedGestureRecognizer *)self currentTouches];
    [(ASVUnifiedGestureRecognizer *)self processTouches:v6 phase:3];
  }
  self->_enabledGestureTypes = a3;
}

- (BOOL)gestureTypeIsEnabled:(unint64_t)a3
{
  return (a3 & ~[(ASVUnifiedGestureRecognizer *)self enabledGestureTypes]) == 0;
}

- (BOOL)generatesTaps
{
  if ([(ASVUnifiedGestureRecognizer *)self gestureTypeIsEnabled:1]) {
    return 1;
  }
  return [(ASVUnifiedGestureRecognizer *)self gestureTypeIsEnabled:2];
}

- (BOOL)generatesTransforms
{
  return [(ASVUnifiedGestureRecognizer *)self gestureTypeIsEnabled:4];
}

- (BOOL)singleFingerGesturesEnabled
{
  if ([(ASVUnifiedGestureRecognizer *)self generatesTaps]) {
    return 1;
  }
  return [(ASVUnifiedGestureRecognizer *)self generatesTransforms];
}

- (id)singleFingerGestureForTouch:(id)a3 dataSource:(id)a4 enabledGestureTypes:(unint64_t)a5
{
  return 0;
}

- (id)twoFingerGestureForFirstTouch:(id)a3 secondTouch:(id)a4 dataSource:(id)a5
{
  return 0;
}

- (void)startGestureFromTouches:(id)a3
{
  id v17 = a3;
  id v4 = (void *)[v17 mutableCopy];
  [(ASVUnifiedGestureRecognizer *)self setCurrentTouches:v4];

  if ([v17 count] == 1
    && [(ASVUnifiedGestureRecognizer *)self singleFingerGesturesEnabled])
  {
    v5 = [(ASVUnifiedGestureRecognizer *)self currentTouches];
    id v6 = [v5 anyObject];

    id v7 = [(ASVUnifiedGestureRecognizer *)self dataSource];
    v8 = [(ASVUnifiedGestureRecognizer *)self singleFingerGestureForTouch:v6 dataSource:v7 enabledGestureTypes:[(ASVUnifiedGestureRecognizer *)self enabledGestureTypes]];
    [(ASVUnifiedGestureRecognizer *)self setCurrentGesture:v8];
  }
  else if ([v17 count] == 2 {
         && [(ASVUnifiedGestureRecognizer *)self twoFingerGesturesEnabled])
  }
  {
    v9 = [(ASVUnifiedGestureRecognizer *)self currentTouches];
    v10 = [v9 allObjects];

    v11 = [v10 objectAtIndexedSubscript:0];
    v12 = [v10 objectAtIndexedSubscript:1];
    objc_super v13 = [(ASVUnifiedGestureRecognizer *)self dataSource];
    v14 = [(ASVUnifiedGestureRecognizer *)self twoFingerGestureForFirstTouch:v11 secondTouch:v12 dataSource:v13];
    [(ASVUnifiedGestureRecognizer *)self setCurrentGesture:v14];
  }
  else
  {
    [(ASVUnifiedGestureRecognizer *)self setCurrentGesture:0];
  }
  v15 = [(ASVUnifiedGestureRecognizer *)self currentGesture];

  if (v15)
  {
    v16 = [(ASVUnifiedGestureRecognizer *)self feedbackGenerator];
    [v16 prepare];
  }
}

- (void)updateGestureFromTouches:(id)a3 phase:(int64_t)a4
{
  id v26 = a3;
  if ([v26 count])
  {
    id v6 = [(ASVUnifiedGestureRecognizer *)self currentTouches];
    id v7 = (void *)[v6 copy];

    if ((unint64_t)a4 > 1)
    {
      if (a4 == 3)
      {
        [(ASVUnifiedGestureRecognizer *)self setCurrentGesture:0];
        [(ASVUnifiedGestureRecognizer *)self setCurrentTouches:0];
        goto LABEL_25;
      }
      if (a4 != 2)
      {
LABEL_8:
        v9 = [(ASVUnifiedGestureRecognizer *)self currentGesture];

        if (!v9)
        {
LABEL_25:

          goto LABEL_26;
        }
        v10 = [(ASVUnifiedGestureRecognizer *)self currentGesture];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          v12 = [(ASVUnifiedGestureRecognizer *)self currentTouches];
          if ([v12 count] != 1)
          {

LABEL_19:
            v21 = [(ASVUnifiedGestureRecognizer *)self currentTouches];
            unint64_t v22 = [v21 count];

            if (v22 < 2)
            {
              v23 = [(ASVUnifiedGestureRecognizer *)self currentGesture];
              [v23 finishGesture];
            }
            [(ASVUnifiedGestureRecognizer *)self setCurrentGesture:0];
            v24 = [(ASVUnifiedGestureRecognizer *)self currentTouches];
            [(ASVUnifiedGestureRecognizer *)self startGestureFromTouches:v24];

            goto LABEL_25;
          }
          objc_super v13 = [(ASVUnifiedGestureRecognizer *)self currentTouches];
          int v14 = [v13 isEqualToSet:v7];

          if (!v14) {
            goto LABEL_19;
          }
          goto LABEL_16;
        }
        v15 = [(ASVUnifiedGestureRecognizer *)self currentGesture];
        objc_opt_class();
        char v16 = objc_opt_isKindOfClass();

        if (v16)
        {
          id v17 = [(ASVUnifiedGestureRecognizer *)self currentTouches];
          if ([v17 count] == 2)
          {
            v18 = [(ASVUnifiedGestureRecognizer *)self currentTouches];
            int v19 = [v18 isEqualToSet:v7];

            if (v19)
            {
LABEL_16:
              v20 = [(ASVUnifiedGestureRecognizer *)self currentGesture];
              [v20 updateGesture];

              goto LABEL_25;
            }
          }
          else
          {
          }
          v25 = [(ASVUnifiedGestureRecognizer *)self currentGesture];
          [v25 finishGesture];
        }
        [(ASVUnifiedGestureRecognizer *)self setCurrentGesture:0];
        goto LABEL_25;
      }
      v8 = [(ASVUnifiedGestureRecognizer *)self currentTouches];
      [v8 minusSet:v26];
    }
    else
    {
      v8 = [(ASVUnifiedGestureRecognizer *)self currentTouches];
      [v8 unionSet:v26];
    }

    goto LABEL_8;
  }
LABEL_26:
}

- (BOOL)isDecelerating
{
  return 0;
}

- (void)processTouches:(id)a3 phase:(int64_t)a4
{
  id v13 = a3;
  uint64_t v6 = [(ASVUnifiedGestureRecognizer *)self dataSource];
  if (v6)
  {
    id v7 = (void *)v6;
    BOOL v8 = [(ASVUnifiedGestureRecognizer *)self isEnabled];

    if (v8)
    {
      if ((unint64_t)(a4 - 1) < 3)
      {
        v9 = self;
        id v10 = v13;
        int64_t v11 = a4;
LABEL_5:
        [(ASVUnifiedGestureRecognizer *)v9 updateGestureFromTouches:v10 phase:v11];
        goto LABEL_10;
      }
      if (!a4)
      {
        v12 = [(ASVUnifiedGestureRecognizer *)self currentGesture];

        v9 = self;
        if (v12)
        {
          id v10 = v13;
          int64_t v11 = 0;
          goto LABEL_5;
        }
        [(ASVUnifiedGestureRecognizer *)self startGestureFromTouches:v13];
      }
    }
  }
LABEL_10:
}

- (float)minimumObjectScale
{
  return 0.0;
}

- (float)maximumObjectScale
{
  return 10000.0;
}

- (void)gesture:(id)a3 singleTappedAtScreenPoint:(BOOL)a4 onAsset:
{
  BOOL v5 = a4;
  uint64_t v6 = v4;
  id v8 = a3;
  if ([(ASVUnifiedGestureRecognizer *)self gestureTypeIsEnabled:2])
  {
    double v9 = CACurrentMediaTime();
    [(ASVUnifiedGestureRecognizer *)self lastTapTime];
    double v11 = v9 - v10;
    +[ASVSettings floatForKey:@"ASVSettingTapDoubleTimeThreshold"];
    float v13 = v12;
    [(ASVUnifiedGestureRecognizer *)self lastTapLocation];
    float32x2_t v15 = v14;
    +[ASVSettings floatForKey:@"ASVSettingTapDoubleMovementThreshold"];
    double v17 = v13;
    if (v11 < v17
      && (float32x2_t v18 = vsub_f32((float32x2_t)v6, v15), sqrtf(vaddv_f32(vmul_f32(v18, v18))) < v16)
      && [(ASVUnifiedGestureRecognizer *)self lastTapWasOnAsset] == v5)
    {
      unint64_t v22 = [(ASVUnifiedGestureRecognizer *)self singleTapTimer];

      if (v22)
      {
        v23 = [(ASVUnifiedGestureRecognizer *)self singleTapTimer];
        [v23 invalidate];
      }
      v24 = [(ASVUnifiedGestureRecognizer *)self delegate];
      [v24 unifiedGestureRecognizer:self doubleTappedAtScreenPoint:v5 onAsset:*(double *)&v6];

      [(ASVUnifiedGestureRecognizer *)self setLastTapTime:0.0];
    }
    else
    {
      objc_initWeak(&location, self);
      int v19 = (void *)MEMORY[0x1E4F1CB00];
      uint64_t v25 = MEMORY[0x1E4F143A8];
      uint64_t v26 = 3221225472;
      v27 = __73__ASVUnifiedGestureRecognizer_gesture_singleTappedAtScreenPoint_onAsset___block_invoke;
      v28 = &unk_1E6DD74C0;
      objc_copyWeak(v29, &location);
      v29[1] = v6;
      BOOL v30 = v5;
      v20 = [v19 scheduledTimerWithTimeInterval:0 repeats:&v25 block:v17];
      -[ASVUnifiedGestureRecognizer setSingleTapTimer:](self, "setSingleTapTimer:", v20, v25, v26, v27, v28);

      [(ASVUnifiedGestureRecognizer *)self setLastTapTime:v9];
      objc_destroyWeak(v29);
      objc_destroyWeak(&location);
    }
    [(ASVUnifiedGestureRecognizer *)self setLastTapLocation:*(double *)&v6];
    [(ASVUnifiedGestureRecognizer *)self setLastTapWasOnAsset:v5];
  }
  else
  {
    v21 = [(ASVUnifiedGestureRecognizer *)self delegate];
    [v21 unifiedGestureRecognizer:self singleTappedAtScreenPoint:v5 onAsset:*(double *)&v6];
  }
}

void __73__ASVUnifiedGestureRecognizer_gesture_singleTappedAtScreenPoint_onAsset___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained(v2);
    id v4 = [v6 delegate];
    id v5 = objc_loadWeakRetained(v2);
    [v4 unifiedGestureRecognizer:v5 singleTappedAtScreenPoint:*(unsigned __int8 *)(a1 + 48) onAsset:*(double *)(a1 + 40)];
  }
}

- (void)gestureBeganRotation:(id)a3
{
  id v4 = [(ASVUnifiedGestureRecognizer *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(ASVUnifiedGestureRecognizer *)self delegate];
    [v6 unifiedGestureRecognizerBeganRotation:self];
  }
}

- (void)gesture:(id)a3 rotatedAssetByDeltaYaw:(float)a4
{
  id v7 = [(ASVUnifiedGestureRecognizer *)self delegate];
  *(float *)&double v6 = a4;
  [v7 unifiedGestureRecognizer:self rotatedAssetByDeltaYaw:v6];
}

- (void)gestureEndedRotation:(id)a3
{
  id v4 = [(ASVUnifiedGestureRecognizer *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(ASVUnifiedGestureRecognizer *)self delegate];
    [v6 unifiedGestureRecognizerEndedRotation:self];
  }
}

- (void)gestureBeganScaling:(id)a3
{
  id v4 = [(ASVUnifiedGestureRecognizer *)self delegate];
  [v4 unifiedGestureRecognizerBeganScaling:self];
}

- (void)gesture:(id)a3 scaledAssetToScale:(float)a4
{
  id v7 = [(ASVUnifiedGestureRecognizer *)self delegate];
  *(float *)&double v6 = a4;
  [(ASVUnifiedGestureRecognizer *)self clampedScaleForScale:v6];
  objc_msgSend(v7, "unifiedGestureRecognizer:scaledAssetToScale:", self);
}

- (void)gestureEndedScaling:(id)a3
{
  id v4 = [(ASVUnifiedGestureRecognizer *)self delegate];
  [v4 unifiedGestureRecognizerEndedScaling:self];
}

- (void)gestureDidSnapToScale:(id)a3
{
  double v4 = CACurrentMediaTime();
  [(ASVUnifiedGestureRecognizer *)self lastFireFeedbackTime];
  double v6 = v4 - v5;
  +[ASVSettings floatForKey:@"ASVSettingScaleSnapFeedbackTimeThreshold"];
  if (v6 >= v7)
  {
    id v8 = [(ASVUnifiedGestureRecognizer *)self feedbackGenerator];
    double v9 = [v8 snapToScaleFeedbackGenerator];
    [v9 fire];

    [(ASVUnifiedGestureRecognizer *)self setLastFireFeedbackTime:v4];
  }
}

- (void)gestureStartScaleAnimationFrom:(float)a3 to:(float)a4
{
  self->_isScaleAnimating = 1;
  self->_animateScaleStart = a3;
  self->_animateScaleEnd = a4;
  self->_startScaleAnimationTime = CACurrentMediaTime();
}

- (void)gestureStopScaleAnimation
{
  self->_isScaleAnimating = 0;
}

- (float)animatedScaleValue
{
  double v3 = CACurrentMediaTime() - self->_startScaleAnimationTime;
  if (v3 >= 0.1)
  {
    self->_isScaleAnimating = 0;
    return self->_animateScaleEnd;
  }
  else
  {
    double v4 = v3 / 0.1 * (v3 / 0.1) * (v3 / 0.1 * -2.0 + 3.0);
    return v4 * self->_animateScaleEnd + self->_animateScaleStart * (1.0 - v4);
  }
}

- (void)gestureDidSnapAwayFromScale:(id)a3
{
  double v4 = CACurrentMediaTime();
  [(ASVUnifiedGestureRecognizer *)self lastFireFeedbackTime];
  double v6 = v4 - v5;
  +[ASVSettings floatForKey:@"ASVSettingScaleSnapFeedbackTimeThreshold"];
  if (v6 >= v7)
  {
    id v8 = [(ASVUnifiedGestureRecognizer *)self feedbackGenerator];
    double v9 = [v8 snapAwayFromScaleFeedbackGenerator];
    [v9 fire];

    [(ASVUnifiedGestureRecognizer *)self setLastFireFeedbackTime:v4];
  }
}

- (ASVGestureDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (ASVGestureDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (ASVUnifiedGestureRecognizerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ASVUnifiedGestureRecognizerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ASVGestureFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void)setFeedbackGenerator:(id)a3
{
}

- (unint64_t)enabledGestureTypes
{
  return self->_enabledGestureTypes;
}

- (BOOL)allowObjectScaling
{
  return self->_allowObjectScaling;
}

- (void)setAllowObjectScaling:(BOOL)a3
{
  self->_allowObjectScaling = a3;
}

- (float)currentObjectScale
{
  return self->_currentObjectScale;
}

- (void)setCurrentObjectScale:(float)a3
{
  self->_currentObjectScale = a3;
}

- (BOOL)isScaleAnimating
{
  return self->_isScaleAnimating;
}

- (void)setIsScaleAnimating:(BOOL)a3
{
  self->_isScaleAnimating = a3;
}

- (double)lastTapTime
{
  return self->_lastTapTime;
}

- (void)setLastTapTime:(double)a3
{
  self->_lastTapTime = a3;
}

- (double)lastTapLocation
{
  return *(double *)(a1 + 64);
}

- (void)setLastTapLocation:(ASVUnifiedGestureRecognizer *)self
{
  *(void *)self->_lastTapLocation = v2;
}

- (BOOL)lastTapWasOnAsset
{
  return self->_lastTapWasOnAsset;
}

- (void)setLastTapWasOnAsset:(BOOL)a3
{
  self->_lastTapWasOnAsset = a3;
}

- (double)lastFireFeedbackTime
{
  return self->_lastFireFeedbackTime;
}

- (void)setLastFireFeedbackTime:(double)a3
{
  self->_lastFireFeedbackTime = a3;
}

- (NSTimer)singleTapTimer
{
  return self->_singleTapTimer;
}

- (void)setSingleTapTimer:(id)a3
{
}

- (double)startScaleAnimationTime
{
  return self->_startScaleAnimationTime;
}

- (void)setStartScaleAnimationTime:(double)a3
{
  self->_startScaleAnimationTime = a3;
}

- (float)animateScaleStart
{
  return self->_animateScaleStart;
}

- (void)setAnimateScaleStart:(float)a3
{
  self->_animateScaleStart = a3;
}

- (float)animateScaleEnd
{
  return self->_animateScaleEnd;
}

- (void)setAnimateScaleEnd:(float)a3
{
  self->_animateScaleEnd = a3;
}

- (ASVGesture)currentGesture
{
  return self->_currentGesture;
}

- (void)setCurrentGesture:(id)a3
{
}

- (NSMutableSet)currentTouches
{
  return self->_currentTouches;
}

- (void)setCurrentTouches:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTouches, 0);
  objc_storeStrong((id *)&self->_currentGesture, 0);
  objc_storeStrong((id *)&self->_singleTapTimer, 0);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end