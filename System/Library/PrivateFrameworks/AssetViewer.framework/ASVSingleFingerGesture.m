@interface ASVSingleFingerGesture
- (ASVSingleFingerGesture)initWithTouch:(id)a3 dataSource:(id)a4 delegate:(id)a5 enabledGestureTypes:(unint64_t)a6;
- (ASVSingleFingerGestureDelegate)delegate;
- (ASVTouch)touch;
- (BOOL)generatesTaps;
- (BOOL)generatesTransforms;
- (BOOL)gestureTypeIsEnabled:(unint64_t)a3;
- (BOOL)panThresholdPassed;
- (double)initialTouchLocation;
- (double)latestTouchLocation;
- (double)touchStartTime;
- (unint64_t)enabledGestureTypes;
- (void)finishGesture;
- (void)setDelegate:(id)a3;
- (void)setInitialTouchLocation:(ASVSingleFingerGesture *)self;
- (void)setLatestTouchLocation:(ASVSingleFingerGesture *)self;
- (void)setPanThresholdPassed:(BOOL)a3;
- (void)setTouch:(id)a3;
- (void)setTouchStartTime:(double)a3;
- (void)updateGesture;
@end

@implementation ASVSingleFingerGesture

- (ASVSingleFingerGesture)initWithTouch:(id)a3 dataSource:(id)a4 delegate:(id)a5 enabledGestureTypes:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a5;
  v18.receiver = self;
  v18.super_class = (Class)ASVSingleFingerGesture;
  v13 = [(ASVGesture *)&v18 initWithDataSource:a4];
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_delegate, v12);
    v14->_enabledGestureTypes = a6;
    v14->_panThresholdPassed = 0;
    v14->_touchStartTime = CACurrentMediaTime();
    objc_storeStrong((id *)&v14->_touch, a3);
    [(ASVTouch *)v14->_touch location];
    *(void *)&v14->_initialTouchLocation[7] = v15;
    *(void *)&v14->_latestTouchLocation[7] = v15;
    v16 = [(ASVGesture *)v14 dataSource];
    -[ASVGesture setFirstTouchWasOnAsset:](v14, "setFirstTouchWasOnAsset:", [v16 screenPointIsOnAsset:*(double *)&v14->_initialTouchLocation[7]]);
  }
  return v14;
}

- (void)updateGesture
{
  id v3 = [(ASVSingleFingerGesture *)self touch];
  [v3 location];
  -[ASVSingleFingerGesture setLatestTouchLocation:](self, "setLatestTouchLocation:");
}

- (BOOL)gestureTypeIsEnabled:(unint64_t)a3
{
  return (a3 & ~[(ASVSingleFingerGesture *)self enabledGestureTypes]) == 0;
}

- (BOOL)generatesTaps
{
  if ([(ASVSingleFingerGesture *)self gestureTypeIsEnabled:1]) {
    return 1;
  }
  return [(ASVSingleFingerGesture *)self gestureTypeIsEnabled:2];
}

- (BOOL)generatesTransforms
{
  return [(ASVSingleFingerGesture *)self gestureTypeIsEnabled:4];
}

- (void)finishGesture
{
  if ([(ASVSingleFingerGesture *)self generatesTaps])
  {
    +[ASVSettings floatForKey:@"ASVSettingTapTimeThreshold"];
    double v4 = v3;
    double v5 = CACurrentMediaTime();
    [(ASVSingleFingerGesture *)self touchStartTime];
    if (v5 - v6 < v4)
    {
      [(ASVSingleFingerGesture *)self latestTouchLocation];
      float32x2_t v8 = v7;
      [(ASVSingleFingerGesture *)self initialTouchLocation];
      float32x2_t v10 = vsub_f32(v8, v9);
      v8.f32[0] = sqrtf(vaddv_f32(vmul_f32(v10, v10)));
      +[ASVSettings floatForKey:@"ASVSettingTapMovementThreshold"];
      if (v8.f32[0] < v11)
      {
        id v12 = [(ASVGesture *)self dataSource];
        [(ASVSingleFingerGesture *)self latestTouchLocation];
        int v13 = objc_msgSend(v12, "screenPointIsOnAsset:");

        if ([(ASVGesture *)self firstTouchWasOnAsset] && v13)
        {
          id v17 = [(ASVSingleFingerGesture *)self delegate];
          [(ASVSingleFingerGesture *)self latestTouchLocation];
          v14 = v17;
          uint64_t v15 = self;
          uint64_t v16 = 1;
        }
        else
        {
          if (([(ASVGesture *)self firstTouchWasOnAsset] | v13)) {
            return;
          }
          id v17 = [(ASVSingleFingerGesture *)self delegate];
          [(ASVSingleFingerGesture *)self latestTouchLocation];
          v14 = v17;
          uint64_t v15 = self;
          uint64_t v16 = 0;
        }
        objc_msgSend(v14, "gesture:singleTappedAtScreenPoint:onAsset:", v15, v16);
      }
    }
  }
}

- (BOOL)panThresholdPassed
{
  return self->_panThresholdPassed;
}

- (void)setPanThresholdPassed:(BOOL)a3
{
  self->_panThresholdPassed = a3;
}

- (double)initialTouchLocation
{
  return *(double *)(a1 + 48);
}

- (void)setInitialTouchLocation:(ASVSingleFingerGesture *)self
{
  *(void *)&self->_initialTouchLocation[7] = v2;
}

- (double)latestTouchLocation
{
  return *(double *)(a1 + 56);
}

- (void)setLatestTouchLocation:(ASVSingleFingerGesture *)self
{
  *(void *)&self->_latestTouchLocation[7] = v2;
}

- (ASVSingleFingerGestureDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ASVSingleFingerGestureDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)enabledGestureTypes
{
  return self->_enabledGestureTypes;
}

- (ASVTouch)touch
{
  return self->_touch;
}

- (void)setTouch:(id)a3
{
}

- (double)touchStartTime
{
  return self->_touchStartTime;
}

- (void)setTouchStartTime:(double)a3
{
  self->_touchStartTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touch, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end