@interface ASVTurntableSingleFingerGesture
- (ASVTurntableSingleFingerGesture)initWithTouch:(id)a3 dataSource:(id)a4 turntableDelegate:(id)a5 enabledGestureTypes:(unint64_t)a6;
- (ASVTurntableSingleFingerGestureDelegate)turntableDelegate;
- (void)finishGesture;
- (void)setTurntableDelegate:(id)a3;
- (void)updateGesture;
- (void)updatePan;
@end

@implementation ASVTurntableSingleFingerGesture

- (ASVTurntableSingleFingerGesture)initWithTouch:(id)a3 dataSource:(id)a4 turntableDelegate:(id)a5 enabledGestureTypes:(unint64_t)a6
{
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ASVTurntableSingleFingerGesture;
  v11 = [(ASVSingleFingerGesture *)&v14 initWithTouch:a3 dataSource:a4 delegate:v10 enabledGestureTypes:a6];
  v12 = v11;
  if (v11) {
    objc_storeWeak((id *)&v11->_turntableDelegate, v10);
  }

  return v12;
}

- (void)updateGesture
{
  v3.receiver = self;
  v3.super_class = (Class)ASVTurntableSingleFingerGesture;
  [(ASVSingleFingerGesture *)&v3 updateGesture];
  if ([(ASVSingleFingerGesture *)self generatesTransforms]) {
    [(ASVTurntableSingleFingerGesture *)self updatePan];
  }
}

- (void)updatePan
{
  if (![(ASVSingleFingerGesture *)self panThresholdPassed])
  {
    [(ASVSingleFingerGesture *)self latestTouchLocation];
    float32x2_t v4 = v3;
    [(ASVSingleFingerGesture *)self initialTouchLocation];
    float32x2_t v6 = vsub_f32(v4, v5);
    v4.f32[0] = sqrtf(vaddv_f32(vmul_f32(v6, v6)));
    +[ASVSettings floatForKey:@"ASVSettingTurntableSingleFingerPanThreshold"];
    if (v4.f32[0] >= v7)
    {
      [(ASVSingleFingerGesture *)self setPanThresholdPassed:1];
      v8 = [(ASVTurntableSingleFingerGesture *)self turntableDelegate];
      [(ASVSingleFingerGesture *)self latestTouchLocation];
      objc_msgSend(v8, "gesture:beganPanningAtScreenPoint:", self);
    }
  }
  if ([(ASVSingleFingerGesture *)self panThresholdPassed])
  {
    id v9 = [(ASVTurntableSingleFingerGesture *)self turntableDelegate];
    [(ASVSingleFingerGesture *)self latestTouchLocation];
    objc_msgSend(v9, "gesture:pannedToScreenPoint:", self);
  }
}

- (void)finishGesture
{
  if ([(ASVSingleFingerGesture *)self panThresholdPassed])
  {
    id v3 = [(ASVTurntableSingleFingerGesture *)self turntableDelegate];
    [v3 gestureEndedPanning:self];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)ASVTurntableSingleFingerGesture;
    [(ASVSingleFingerGesture *)&v4 finishGesture];
  }
}

- (ASVTurntableSingleFingerGestureDelegate)turntableDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_turntableDelegate);
  return (ASVTurntableSingleFingerGestureDelegate *)WeakRetained;
}

- (void)setTurntableDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end