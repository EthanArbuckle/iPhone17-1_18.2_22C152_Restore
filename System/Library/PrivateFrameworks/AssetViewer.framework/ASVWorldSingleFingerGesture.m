@interface ASVWorldSingleFingerGesture
- (ASVWorldGestureDragOffsetCorrector)dragOffsetCorrector;
- (ASVWorldSingleFingerGesture)initWithTouch:(id)a3 dataSource:(id)a4 worldDelegate:(id)a5 enabledGestureTypes:(unint64_t)a6;
- (ASVWorldSingleFingerGestureDelegate)worldDelegate;
- (float)potentialAssetDistanceFromInitialLocationOnScreen;
- (void)finishGesture;
- (void)setDragOffsetCorrector:(id)a3;
- (void)setWorldDelegate:(id)a3;
- (void)updateGesture;
- (void)updateTranslation;
@end

@implementation ASVWorldSingleFingerGesture

- (ASVWorldSingleFingerGesture)initWithTouch:(id)a3 dataSource:(id)a4 worldDelegate:(id)a5 enabledGestureTypes:(unint64_t)a6
{
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ASVWorldSingleFingerGesture;
  v11 = [(ASVSingleFingerGesture *)&v15 initWithTouch:a3 dataSource:a4 delegate:v10 enabledGestureTypes:a6];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_worldDelegate, v10);
    dragOffsetCorrector = v12->_dragOffsetCorrector;
    v12->_dragOffsetCorrector = 0;
  }
  return v12;
}

- (void)updateGesture
{
  v3.receiver = self;
  v3.super_class = (Class)ASVWorldSingleFingerGesture;
  [(ASVSingleFingerGesture *)&v3 updateGesture];
  if ([(ASVSingleFingerGesture *)self generatesTransforms]) {
    [(ASVWorldSingleFingerGesture *)self updateTranslation];
  }
}

- (float)potentialAssetDistanceFromInitialLocationOnScreen
{
  [(ASVSingleFingerGesture *)self latestTouchLocation];
  float32x2_t v4 = v3;
  [(ASVSingleFingerGesture *)self initialTouchLocation];
  float32x2_t v6 = vsub_f32(v4, v5);
  [(ASVGesture *)self latestAssetLocationOnScreen];
  float32x2_t v8 = v7;
  [(ASVGesture *)self initialAssetLocationOnScreen];
  float32x2_t v10 = vadd_f32(v6, vsub_f32(v8, v9));
  return sqrtf(vaddv_f32(vmul_f32(v10, v10)));
}

- (void)updateTranslation
{
  if ([(ASVGesture *)self firstTouchWasOnAsset])
  {
    float32x2_t v3 = [(ASVGesture *)self dataSource];
    [v3 assetScreenPosition];
    -[ASVGesture setLatestAssetLocationOnScreen:](self, "setLatestAssetLocationOnScreen:");

    if (![(ASVSingleFingerGesture *)self panThresholdPassed])
    {
      [(ASVWorldSingleFingerGesture *)self potentialAssetDistanceFromInitialLocationOnScreen];
      float v5 = v4;
      +[ASVSettings floatForKey:@"ASVSettingSingleFingerTranslationThreshold"];
      if (v5 >= v6)
      {
        [(ASVSingleFingerGesture *)self setPanThresholdPassed:1];
        [(ASVSingleFingerGesture *)self latestTouchLocation];
        float32x2_t v8 = v7;
        [(ASVGesture *)self initialAssetLocationOnScreen];
        double v10 = COERCE_DOUBLE(vsub_f32(v8, v9));
        [(ASVSingleFingerGesture *)self latestTouchLocation];
        float32x2_t v12 = v11;
        [(ASVGesture *)self latestAssetLocationOnScreen];
        v14 = [[ASVWorldGestureDragOffsetCorrector alloc] initWithInitialDragOffset:v10 thresholdDragOffset:COERCE_DOUBLE(vsub_f32(v12, v13))];
        [(ASVWorldSingleFingerGesture *)self setDragOffsetCorrector:v14];

        objc_super v15 = [(ASVWorldSingleFingerGesture *)self worldDelegate];
        [v15 gestureBeganTranslation:self];
      }
    }
    if ([(ASVSingleFingerGesture *)self panThresholdPassed])
    {
      v16 = [(ASVWorldSingleFingerGesture *)self dragOffsetCorrector];
      [v16 currentDragOffset];
      float32x2_t v18 = v17;

      [(ASVSingleFingerGesture *)self latestTouchLocation];
      double v20 = COERCE_DOUBLE(vsub_f32(v19, v18));
      id v21 = [(ASVWorldSingleFingerGesture *)self worldDelegate];
      [v21 gesture:self translatedAssetToScreenPoint:v20];
    }
  }
}

- (void)finishGesture
{
  if ([(ASVSingleFingerGesture *)self panThresholdPassed])
  {
    id v3 = [(ASVWorldSingleFingerGesture *)self worldDelegate];
    [v3 gestureEndedTranslation:self];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)ASVWorldSingleFingerGesture;
    [(ASVSingleFingerGesture *)&v4 finishGesture];
  }
}

- (ASVWorldSingleFingerGestureDelegate)worldDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_worldDelegate);
  return (ASVWorldSingleFingerGestureDelegate *)WeakRetained;
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