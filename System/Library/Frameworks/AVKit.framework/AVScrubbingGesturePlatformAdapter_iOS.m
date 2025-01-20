@interface AVScrubbingGesturePlatformAdapter_iOS
- (AVScrubbingGesturePlatformAdapter_iOS)initWithView:(id)a3;
- (BOOL)gestureActive;
- (BOOL)gestureEnabled;
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (CGPoint)translation;
- (double)scrubbingWidth;
- (float)timelineVelocity;
- (void)_panGestureAction:(id)a3;
- (void)_scrubGestureDidBegin;
- (void)_scrubGestureDidEnd;
- (void)_touchGestureAction:(id)a3;
- (void)_updateGestureState;
- (void)setGestureEnabled:(BOOL)a3;
- (void)setScrubbingWidth:(double)a3;
@end

@implementation AVScrubbingGesturePlatformAdapter_iOS

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureConfiguration, 0);
  objc_storeStrong((id *)&self->_touchGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);

  objc_destroyWeak((id *)&self->_view);
}

- (double)scrubbingWidth
{
  return self->_scrubbingWidth;
}

- (BOOL)gestureEnabled
{
  return self->_gestureEnabled;
}

- (float)timelineVelocity
{
  return self->_timelineVelocity;
}

- (CGPoint)translation
{
  double x = self->_translation.x;
  double y = self->_translation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)_touchGestureAction:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(AVTouchGestureRecognizer *)self->_touchGestureRecognizer state];
  switch(v4)
  {
    case 1:
      int64_t gestureActiveCount = self->_gestureActiveCount;
      self->_int64_t gestureActiveCount = gestureActiveCount + 1;
      if (!gestureActiveCount)
      {
        -[AVScrubbingGesturePlatformAdapter_iOS _scrubGestureDidBegin]((uint64_t)self);
      }
      break;
    case 2:
    case 5:
      return;
    case 3:
    case 4:
      int64_t v5 = self->_gestureActiveCount - 1;
      self->_int64_t gestureActiveCount = v5;
      if (!v5)
      {
        -[AVScrubbingGesturePlatformAdapter_iOS _scrubGestureDidEnd]((uint64_t)self);
      }
      break;
    default:
      uint64_t v6 = v4;
      v7 = _AVLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v9 = 134217984;
        uint64_t v10 = v6;
        _os_log_error_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_ERROR, "Error: Found invalid touch gesture state %ld", (uint8_t *)&v9, 0xCu);
      }

      break;
  }
}

- (void)_scrubGestureDidBegin
{
  if (a1)
  {
    v2 = *(void **)(a1 + 64);
    if (!v2)
    {
      v3 = [(id)a1 delegate];
      if (objc_opt_respondsToSelector())
      {
        uint64_t v4 = [(id)a1 delegate];
        uint64_t v5 = [v4 configurationForScrubbingGesturePlatformAdapter:a1];
        uint64_t v6 = *(void **)(a1 + 64);
        *(void *)(a1 + 64) = v5;
      }
      v2 = *(void **)(a1 + 64);
      if (!v2)
      {
        uint64_t v7 = +[AVScrubbingGesturePlatformConfiguration defaultConfiguration];
        v8 = *(void **)(a1 + 64);
        *(void *)(a1 + 64) = v7;

        v2 = *(void **)(a1 + 64);
      }
    }
    [v2 nonLinearity];
    long double v10 = v9;
    float v11 = __exp10(v9);
    float v12 = pow(20000.0, v10);
    float v13 = 19990.0 / (float)(v12 - v11);
    *(float *)(a1 + 72) = (float)(v13 * v11) + -10.0;
    *(float *)(a1 + 76) = v13;
    id v14 = [(id)a1 delegate];
    if (objc_opt_respondsToSelector()) {
      [v14 scrubbingGesturePlatformAdapterDidBeginScrubbing:a1];
    }
  }
}

- (void)_scrubGestureDidEnd
{
  if (a1)
  {
    *(_OWORD *)(a1 + 96) = *MEMORY[0x1E4F1DAD8];
    *(_DWORD *)(a1 + 48) = 0;
    v2 = *(void **)(a1 + 64);
    *(void *)(a1 + 64) = 0;

    *(_DWORD *)(a1 + 76) = 0;
    *(_DWORD *)(a1 + 72) = 0;
    id v3 = [(id)a1 delegate];
    if (objc_opt_respondsToSelector()) {
      [v3 scrubbingGesturePlatformAdapterDidEndScrubbing:a1];
    }
  }
}

- (void)_panGestureAction:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(AVScrubbingPanGestureRecognizer *)self->_panGestureRecognizer state];
  switch(v4)
  {
    case 1:
      int64_t gestureActiveCount = self->_gestureActiveCount;
      self->_int64_t gestureActiveCount = gestureActiveCount + 1;
      if (!gestureActiveCount) {
        -[AVScrubbingGesturePlatformAdapter_iOS _scrubGestureDidBegin]((uint64_t)self);
      }
      goto LABEL_12;
    case 2:
LABEL_12:
      -[AVScrubbingGesturePlatformAdapter_iOS _updateGestureState]((uint64_t)self);
      break;
    case 3:
    case 4:
      int64_t v5 = self->_gestureActiveCount - 1;
      self->_int64_t gestureActiveCount = v5;
      if (!v5)
      {
        -[AVScrubbingGesturePlatformAdapter_iOS _scrubGestureDidEnd]((uint64_t)self);
      }
      break;
    case 5:
      return;
    default:
      uint64_t v6 = v4;
      uint64_t v7 = _AVLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v9 = 134217984;
        uint64_t v10 = v6;
        _os_log_error_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_ERROR, "Error: Unrecognized pan gesture state %ld", (uint8_t *)&v9, 0xCu);
      }

      break;
  }
}

- (void)_updateGestureState
{
  if (a1)
  {
    [*(id *)(a1 + 32) velocity];
    double v3 = v2;
    [*(id *)(a1 + 64) nonLinearity];
    float v5 = *(float *)(a1 + 76);
    if (v3 < 0.0) {
      float v5 = -v5;
    }
    long double v6 = -(*(float *)(a1 + 72) - v5 * pow(fabs(v3), v4));
    float v7 = *(float *)(a1 + 80);
    [*(id *)(a1 + 64) magnitude];
    float v9 = v6 * (float)(v7 * v8);
    [*(id *)(a1 + 32) translation];
    double v12 = v11;
    double v13 = v10;
    if (v11 == 0.0 && v10 == 0.0 || (UIPointIsDiscrete() & 1) == 0)
    {
      id v14 = *(void **)(a1 + 40);
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
      [v14 locationInView:WeakRetained];
      double v12 = v16;
      double v13 = v17;
    }
    double v18 = *(double *)(a1 + 88);
    id v19 = objc_loadWeakRetained((id *)(a1 + 24));
    [v19 frame];
    double v21 = v20;

    *(double *)(a1 + 96) = v12 / v18;
    *(double *)(a1 + 104) = v13 / v21;
    *(float *)(a1 + 48) = v9;
    id v22 = [(id)a1 delegate];
    if (objc_opt_respondsToSelector()) {
      [v22 scrubbingGesturePlatformAdapterDidContinueScrubbing:a1];
    }
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  long double v6 = (AVScrubbingPanGestureRecognizer *)a4;
  float v7 = v6;
  touchGestureRecognizer = self->_touchGestureRecognizer;
  if (touchGestureRecognizer == a3)
  {
    double v11 = [(AVScrubbingGesturePlatformAdapter *)self delegate];
    int v12 = [v11 scrubbingGesturePlatformAdapterIsActivelyScrubbing:self];

    objc_opt_class();
    int v13 = objc_opt_isKindOfClass() & v12;
    if (self->_panGestureRecognizer == v7) {
      BOOL v10 = 1;
    }
    else {
      BOOL v10 = v13;
    }
  }
  else
  {
    BOOL v10 = touchGestureRecognizer == (AVTouchGestureRecognizer *)v6 && self->_panGestureRecognizer == a3;
  }

  return v10;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  if (self->_touchGestureRecognizer != a3) {
    return 0;
  }
  float v5 = self;
  id v6 = a4;
  uint64_t v7 = [(AVScrubbingGesturePlatformAdapter *)v5 delegate];
  LOBYTE(v5) = [(id)v7 scrubbingGesturePlatformAdapterIsActivelyScrubbing:v5];

  objc_opt_class();
  LOBYTE(v7) = objc_opt_isKindOfClass();

  return v7 & (v5 ^ 1);
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6 = (AVTouchGestureRecognizer *)a3;
  id v7 = a4;
  if (self->_touchGestureRecognizer != v6 && (AVTouchGestureRecognizer *)self->_panGestureRecognizer == v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      char isKindOfClass = 1;
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  if (self->_touchGestureRecognizer == a3)
  {
    float v5 = [a4 view];
    objc_opt_class();
    char v4 = objc_opt_isKindOfClass() ^ 1;
  }
  else
  {
    char v4 = 1;
  }
  return v4 & 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  if (self->_touchGestureRecognizer != a3) {
    return 1;
  }
  char v4 = self;
  float v5 = [(AVScrubbingGesturePlatformAdapter *)self delegate];
  LOBYTE(v4) = [v5 scrubbingGesturePlatformAdapterIsActivelyScrubbing:v4];

  return (char)v4;
}

- (void)setScrubbingWidth:(double)a3
{
  if (self->_scrubbingWidth != a3) {
    self->_scrubbingWidth = a3;
  }
}

- (void)setGestureEnabled:(BOOL)a3
{
  if (self->_gestureEnabled != a3)
  {
    self->_gestureEnabled = a3;
    BOOL v4 = [(AVScrubbingGesturePlatformAdapter_iOS *)self gestureEnabled];
    [(AVScrubbingPanGestureRecognizer *)self->_panGestureRecognizer setEnabled:v4];
    touchGestureRecognizer = self->_touchGestureRecognizer;
    [(AVTouchGestureRecognizer *)touchGestureRecognizer setEnabled:v4];
  }
}

- (BOOL)gestureActive
{
  return self->_gestureActiveCount > 0;
}

- (AVScrubbingGesturePlatformAdapter_iOS)initWithView:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AVScrubbingGesturePlatformAdapter_iOS;
  float v5 = [(AVScrubbingGesturePlatformAdapter *)&v16 _abstractInit];

  if (v5)
  {
    id v6 = [[AVScrubbingPanGestureRecognizer alloc] initWithTarget:v5 action:sel__panGestureAction_];
    [(AVScrubbingPanGestureRecognizer *)v6 setEnabled:0];
    [(AVScrubbingPanGestureRecognizer *)v6 setDelegate:v5];
    [(AVScrubbingPanGestureRecognizer *)v6 setAllowedTouchTypes:&unk_1F094A4A8];
    [(AVScrubbingPanGestureRecognizer *)v6 _setRequiresSystemGesturesToFail:1];
    [v4 addGestureRecognizer:v6];
    id v7 = [[AVTouchGestureRecognizer alloc] initWithTarget:v5 action:sel__touchGestureAction_];
    [(AVTouchGestureRecognizer *)v7 setEnabled:0];
    [(AVTouchGestureRecognizer *)v7 setDelegate:v5];
    [(AVTouchGestureRecognizer *)v7 setAllowedTouchTypes:&unk_1F094A4C0];
    [v4 addGestureRecognizer:v7];
    objc_storeWeak((id *)&v5->_view, v4);
    panGestureRecognizer = v5->_panGestureRecognizer;
    v5->_panGestureRecognizer = v6;
    float v9 = v6;

    touchGestureRecognizer = v5->_touchGestureRecognizer;
    v5->_touchGestureRecognizer = v7;
    double v11 = v7;

    int v12 = [MEMORY[0x1E4FB16C8] currentDevice];

    uint64_t v13 = [v12 userInterfaceIdiom];
    float v14 = 0.125;
    if (!v13) {
      float v14 = 0.25;
    }
    v5->_deviceCoordinateVelocityScaleFactor = v14;
  }

  return v5;
}

@end