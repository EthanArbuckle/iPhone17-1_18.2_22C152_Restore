@interface ABActionSelectorDriver
- (BOOL)isInWelcomeMode;
- (_BYTE)didRevealScene;
- (double)overlayRenderInputs;
- (double)sceneRenderInputs;
- (id)_sceneParamsForState:(int64_t)a3;
- (id)initWithItems:(void *)a3 selectedIndex:(int)a4 isInWelcomeMode:(void *)a5 renderBlock:;
- (uint64_t)items;
- (uint64_t)pause;
- (uint64_t)resume;
- (uint64_t)selectedIndex;
- (void)_scheduleZoomOutIfNeeded;
- (void)_updateButtonAnimatorActiveState;
- (void)_updateForDisplayLink:(id)a3;
- (void)_updateRenderInputs;
- (void)_updateSceneInterpolatorsResettingToTarget:(BOOL)a3;
- (void)_updateTransitionSchedulerState;
- (void)_updateWithState:(int64_t)a3 dragProgress:(id)a4;
- (void)endDragging;
- (void)occlusionDidChange:(void *)a1;
- (void)startDragging;
- (void)updateDragProgress:(void *)a1;
- (void)updateItems:(int)a3 animateButtonColor:;
- (void)updateSelectedIndex:(int)a3 animateButtonColor:;
- (void)updateWithZoomedOutSceneParamsOverride:(void *)a3 zoomedInSceneParamsOverride:;
- (void)zoomIn;
- (void)zoomOut;
- (void)zoomOutAfterDelay:(uint64_t *)val;
@end

@implementation ABActionSelectorDriver

- (id)initWithItems:(void *)a3 selectedIndex:(int)a4 isInWelcomeMode:(void *)a5 renderBlock:
{
  v45[10] = *MEMORY[0x263EF8340];
  id v10 = a2;
  id v11 = a5;
  if (a1)
  {
    v43.receiver = a1;
    v43.super_class = (Class)ABActionSelectorDriver;
    v12 = (id *)objc_msgSendSuper2(&v43, sel_init);
    a1 = v12;
    if (v12)
    {
      v42 = v10;
      objc_storeStrong(v12 + 11, a2);
      v40 = a3;
      id v41 = v11;
      a1[12] = a3;
      *((unsigned char *)a1 + 82) = a4;
      uint64_t v13 = MEMORY[0x24C555A80](v11);
      id v14 = a1[1];
      a1[1] = (id)v13;

      uint64_t v15 = 2;
      if (a4) {
        uint64_t v15 = 0;
      }
      a1[7] = (id)v15;
      v44[0] = @"Rotation";
      v39 = objc_opt_new();
      v45[0] = v39;
      v44[1] = @"Scale";
      v16 = objc_opt_new();
      v45[1] = v16;
      v44[2] = @"xOffset";
      v17 = objc_opt_new();
      v45[2] = v17;
      v44[3] = @"yOffset";
      v18 = objc_opt_new();
      v45[3] = v18;
      v44[4] = @"zOffset";
      v19 = objc_opt_new();
      v45[4] = v19;
      v44[5] = @"FocusDistance";
      v20 = objc_opt_new();
      v45[5] = v20;
      v44[6] = @"FocalLength";
      v21 = objc_opt_new();
      v45[6] = v21;
      v44[7] = @"fStop";
      v22 = objc_opt_new();
      v45[7] = v22;
      v44[8] = @"LightingIntensity";
      v23 = objc_opt_new();
      v45[8] = v23;
      v44[9] = @"ZoomInProgress";
      v24 = objc_opt_new();
      v45[9] = v24;
      uint64_t v25 = [NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:10];
      id v26 = a1[2];
      a1[2] = (id)v25;

      if (*((unsigned char *)a1 + 82)) {
        ABWelcomeModeZoomedOutSceneParams();
      }
      else {
      uint64_t v27 = ABDefaultZoomedOutSceneParams();
      }
      id v28 = a1[5];
      a1[5] = (id)v27;

      id v10 = v42;
      if (*((unsigned char *)a1 + 82)) {
        ABWelcomeModeZoomedInSceneParams();
      }
      else {
      uint64_t v29 = ABDefaultZoomedInSceneParams();
      }
      id v30 = a1[6];
      a1[6] = (id)v29;

      v31 = [ABDeviceButtonAnimator alloc];
      v32 = [v42 objectAtIndexedSubscript:v40];
      v33 = [v32 color];
      v34 = -[ABDeviceButtonAnimator initWithBaseColor:]((id *)&v31->super.isa, v33);
      id v35 = a1[3];
      a1[3] = v34;

      uint64_t v36 = objc_opt_new();
      id v37 = a1[4];
      a1[4] = (id)v36;

      id v11 = v41;
    }
  }

  return a1;
}

- (uint64_t)resume
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (result)
  {
    v1 = (id *)result;
    if (!*(void *)(result + 64))
    {
      v2 = ABLogger();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 138543362;
        v9 = v1;
        _os_log_impl(&dword_24741F000, v2, OS_LOG_TYPE_DEFAULT, "(%{public}@) resume scene updates", (uint8_t *)&v8, 0xCu);
      }

      uint64_t v3 = [MEMORY[0x263F15780] displayLinkWithTarget:v1 selector:sel__updateForDisplayLink_];
      id v4 = v1[8];
      v1[8] = (id)v3;

      *(float *)&double v5 = ABFrameRateRange();
      [v1[8] setPreferredFrameRateRange:v5];
      [v1[8] setHighFrameRateReason:ABHighFrameRateUpdateReasonMake(101)];
      id v6 = v1[8];
      v7 = [MEMORY[0x263EFF9F0] mainRunLoop];
      [v6 addToRunLoop:v7 forMode:*MEMORY[0x263EFF588]];

      [v1 _updateSceneInterpolatorsResettingToTarget:1];
      [v1 _updateTransitionSchedulerState];
      return [v1 _updateButtonAnimatorActiveState];
    }
  }
  return result;
}

- (uint64_t)pause
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (result)
  {
    v1 = (void *)result;
    if (*(void *)(result + 64))
    {
      v2 = ABLogger();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 138543362;
        v7 = v1;
        _os_log_impl(&dword_24741F000, v2, OS_LOG_TYPE_DEFAULT, "(%{public}@) pause scene updates", (uint8_t *)&v6, 0xCu);
      }

      uint64_t v3 = (void *)v1[8];
      id v4 = [MEMORY[0x263EFF9F0] mainRunLoop];
      [v3 removeFromRunLoop:v4 forMode:*MEMORY[0x263EFF588]];

      double v5 = (void *)v1[8];
      v1[8] = 0;

      [v1 _updateTransitionSchedulerState];
      return [v1 _updateButtonAnimatorActiveState];
    }
  }
  return result;
}

- (void)updateSelectedIndex:(int)a3 animateButtonColor:
{
  if (a1)
  {
    uint64_t v6 = [*(id *)(a1 + 88) count];
    if (v6 - 1 < a2) {
      a2 = v6 - 1;
    }
    *(void *)(a1 + 96) = a2;
    if (*(void *)(a1 + 56))
    {
      [(id)a1 _scheduleZoomOutIfNeeded];
    }
    else if (!*(unsigned char *)(a1 + 82))
    {
      [(id)a1 _updateWithState:1 dragProgress:*(void *)(a1 + 72)];
    }
    uint64_t v7 = *(void *)(a1 + 24);
    id v9 = [*(id *)(a1 + 88) objectAtIndexedSubscript:a2];
    uint64_t v8 = [v9 color];
    -[ABDeviceButtonAnimator setBaseColor:animated:](v7, v8, a3);
  }
}

- (void)zoomIn
{
  if (a1)
  {
    if ((unint64_t)(*((void *)a1 + 7) - 1) >= 2) {
      return (void *)[a1 _updateWithState:1 dragProgress:*((void *)a1 + 9)];
    }
  }
  return a1;
}

- (void)updateItems:(int)a3 animateButtonColor:
{
  id v11 = a2;
  if (a1)
  {
    objc_storeStrong((id *)(a1 + 88), a2);
    unint64_t v6 = *(void *)(a1 + 96);
    unint64_t v7 = [*(id *)(a1 + 88) count] - 1;
    if (v6 < v7) {
      unint64_t v7 = v6;
    }
    *(void *)(a1 + 96) = v7;
    [(id)a1 _scheduleZoomOutIfNeeded];
    uint64_t v8 = *(void *)(a1 + 24);
    id v9 = [*(id *)(a1 + 88) objectAtIndexedSubscript:*(void *)(a1 + 96)];
    uint64_t v10 = [v9 color];
    -[ABDeviceButtonAnimator setBaseColor:animated:](v8, v10, a3);
  }
}

- (void)zoomOut
{
  if (a1)
  {
    uint64_t v2 = *((void *)a1 + 7);
    if (v2) {
      BOOL v3 = v2 == 3;
    }
    else {
      BOOL v3 = 1;
    }
    if (!v3) {
      return (void *)[a1 _updateWithState:3 dragProgress:*((void *)a1 + 9)];
    }
  }
  return a1;
}

- (void)zoomOutAfterDelay:(uint64_t *)val
{
  if (val)
  {
    objc_initWeak(&location, val);
    uint64_t v4 = val[4];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __44__ABActionSelectorDriver_zoomOutAfterDelay___block_invoke;
    v5[3] = &unk_265212F20;
    objc_copyWeak(&v6, &location);
    -[ABDelayedBlockExecutor scheduleBlock:delay:](v4, v5, a2);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __44__ABActionSelectorDriver_zoomOutAfterDelay___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = WeakRetained[7];
    if (v2 && v2 != 3)
    {
      uint64_t v4 = WeakRetained;
      [WeakRetained _updateWithState:3 dragProgress:WeakRetained[9]];
      WeakRetained = v4;
    }
  }
}

- (void)startDragging
{
  if (result)
  {
    v1 = result;
    if (result[7] == 3) {
      uint64_t v2 = 1;
    }
    else {
      uint64_t v2 = result[7];
    }
    [result _updateWithState:v2 dragProgress:&unk_26FB8E508];
    return (void *)[v1 _updateTransitionSchedulerState];
  }
  return result;
}

- (void)updateDragProgress:(void *)a1
{
  if (a1)
  {
    uint64_t v3 = a1[7];
    if (v3 == 3 || v3 == 0)
    {
      double v5 = -a2;
      if (a2 >= 0.0) {
        double v5 = a2;
      }
      if (v5 > 0.1) {
        uint64_t v3 = 1;
      }
    }
    objc_msgSend(NSNumber, "numberWithDouble:");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [a1 _updateWithState:v3 dragProgress:v6];
  }
}

- (void)endDragging
{
  if (result)
  {
    v1 = result;
    uint64_t v2 = result[7];
    if (v2) {
      BOOL v3 = v2 == 3;
    }
    else {
      BOOL v3 = 1;
    }
    if (v3) {
      uint64_t v4 = 1;
    }
    else {
      uint64_t v4 = result[7];
    }
    [result _updateWithState:v4 dragProgress:0];
    return (void *)[v1 _updateTransitionSchedulerState];
  }
  return result;
}

- (_BYTE)didRevealScene
{
  if (result)
  {
    v1 = result;
    result[81] = 1;
    [result _updateTransitionSchedulerState];
    [v1 _updateButtonAnimatorActiveState];
    return (unsigned char *)[v1 _scheduleZoomOutIfNeeded];
  }
  return result;
}

- (void)occlusionDidChange:(void *)a1
{
  if (a1)
  {
    if (*((unsigned __int8 *)a1 + 80) != a2)
    {
      *((unsigned char *)a1 + 80) = (_BYTE)a2;
      return (void *)[a1 _updateTransitionSchedulerState];
    }
  }
  return a1;
}

- (void)updateWithZoomedOutSceneParamsOverride:(void *)a3 zoomedInSceneParamsOverride:
{
  id v10 = a2;
  id v5 = a3;
  if (a1)
  {
    if (v10)
    {
      id v6 = v10;
    }
    else
    {
      ABDefaultZoomedOutSceneParams();
      id v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    unint64_t v7 = (void *)a1[5];
    a1[5] = v6;

    if (v5)
    {
      id v8 = v5;
    }
    else
    {
      ABDefaultZoomedInSceneParams();
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v9 = (void *)a1[6];
    a1[6] = v8;

    [a1 _updateSceneInterpolatorsResettingToTarget:1];
  }
}

- (id)_sceneParamsForState:(int64_t)a3
{
  uint64_t v18 = v4;
  uint64_t v19 = v3;
  uint64_t v20 = v5;
  uint64_t v21 = v6;
  id v8 = self;
  switch(a3)
  {
    case 0:
    case 2:
      dragProgress = self->_dragProgress;
      if (dragProgress)
      {
        [(NSNumber *)dragProgress doubleValue];
        if (v10 < 0.0) {
          double v10 = 0.0;
        }
        double v11 = modf(v10, &__y);
        if (v11 < 0.0) {
          double v11 = -v11;
        }
        uint64_t v12 = 48;
        if (a3) {
          uint64_t v13 = 48;
        }
        else {
          uint64_t v13 = 40;
        }
        if (a3) {
          uint64_t v12 = 40;
        }
        ABScrollDraggingStateParams(*(void **)((char *)&v8->super.isa + v13), *(void **)((char *)&v8->super.isa + v12), v11, 0.1);
        self = (ABActionSelectorDriver *)objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
      uint64_t v16 = 48;
      if (!a3) {
        uint64_t v16 = 40;
      }
      zoomedInParams = *(NSDictionary **)((char *)&v8->super.isa + v16);
      goto LABEL_21;
    case 1:
      zoomedInParams = self->_zoomedInParams;
      goto LABEL_21;
    case 3:
      zoomedInParams = self->_zoomedOutParams;
LABEL_21:
      self = zoomedInParams;
LABEL_22:
      break;
    default:
      break;
  }
  return self;
}

- (void)_updateSceneInterpolatorsResettingToTarget:(BOOL)a3
{
  uint64_t v5 = [(ABActionSelectorDriver *)self _sceneParamsForState:self->_state];
  sceneInterpolators = self->_sceneInterpolators;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __69__ABActionSelectorDriver__updateSceneInterpolatorsResettingToTarget___block_invoke;
  v8[3] = &unk_265212FB0;
  id v9 = v5;
  BOOL v10 = a3;
  id v7 = v5;
  [(NSDictionary *)sceneInterpolators enumerateKeysAndObjectsUsingBlock:v8];
}

void __69__ABActionSelectorDriver__updateSceneInterpolatorsResettingToTarget___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v22 = a3;
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 objectForKeyedSubscript:@"Damping"];
  [v7 doubleValue];
  double v9 = v8;

  BOOL v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"DampingSmooth"];
  [v10 doubleValue];
  double v12 = v11;

  uint64_t v13 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"ResponseSmooth"];
  [v13 doubleValue];
  double v15 = v14;

  objc_msgSend(v22, "setParameters:", v9, v12, 0.0, v15);
  uint64_t v16 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"TimeFactor"];
  [v16 doubleValue];
  double v18 = v17;

  [v22 setTimeFactor:v18];
  uint64_t v19 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];

  [v19 doubleValue];
  double v21 = v20;

  [v22 setTarget:v21];
  if (*(unsigned char *)(a1 + 40)) {
    [v22 resetToTarget];
  }
}

- (void)_updateTransitionSchedulerState
{
  if (self->_isOccluded || self->_dragProgress || !self->_displayLink || !self->_isSceneRevealed) {
    [(ABDelayedBlockExecutor *)self->_transitionScheduler pause];
  }
  else {
    -[ABDelayedBlockExecutor resume]((uint64_t)self->_transitionScheduler);
  }
}

- (void)_updateButtonAnimatorActiveState
{
  int v2 = self->_isSceneRevealed && !self->_state && self->_displayLink != 0;
  -[ABDeviceButtonAnimator setActive:]((uint64_t)self->_buttonAnimator, v2);
}

- (void)_updateWithState:(int64_t)a3 dragProgress:(id)a4
{
  id v13 = a4;
  int64_t state = self->_state;
  if (state == a3)
  {
    if (ABEqualObjects(self->_dragProgress, v13)) {
      goto LABEL_12;
    }
    int64_t state = self->_state;
  }
  self->_int64_t state = a3;
  objc_storeStrong((id *)&self->_dragProgress, a4);
  int64_t v8 = self->_state;
  if (v8 != state)
  {
    if (v8 == 2)
    {
      if (!self->_isInWelcomeMode)
      {
LABEL_10:
        [(ABActionSelectorDriver *)self _updateButtonAnimatorActiveState];
        [(ABActionSelectorDriver *)self _scheduleZoomOutIfNeeded];
        goto LABEL_11;
      }
      self->_isInWelcomeMode = 0;
      ABDefaultZoomedOutSceneParams();
      double v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      zoomedOutParams = self->_zoomedOutParams;
      self->_zoomedOutParams = v9;

      ABDefaultZoomedInSceneParams();
      double v11 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      zoomedInParams = self->_zoomedInParams;
      self->_zoomedInParams = v11;

      int64_t v8 = self->_state;
    }
    if ((v8 | 2) == 3) {
      -[ABDelayedBlockExecutor cancelPendingBlock](&self->_transitionScheduler->super.isa);
    }
    goto LABEL_10;
  }
LABEL_11:
  [(ABActionSelectorDriver *)self _updateSceneInterpolatorsResettingToTarget:0];
LABEL_12:
}

- (void)_updateRenderInputs
{
  uint64_t v3 = [(NSDictionary *)self->_sceneInterpolators objectForKeyedSubscript:@"Scale"];
  [v3 value];
  CGFloat v5 = v4;

  memset(&v61, 0, sizeof(v61));
  CATransform3DMakeScale(&v61, v5, v5, v5);
  memset(&v60, 0, sizeof(v60));
  id v6 = [(NSDictionary *)self->_sceneInterpolators objectForKeyedSubscript:@"Rotation"];
  [v6 value];
  double v8 = ABDegreesToRadians(v7);
  CATransform3DMakeRotation(&v60, v8, 0.0, 1.0, 0.0);

  memset(&v59, 0, sizeof(v59));
  double v9 = [(NSDictionary *)self->_sceneInterpolators objectForKeyedSubscript:@"xOffset"];
  [v9 value];
  CGFloat v11 = v10;
  double v12 = [(NSDictionary *)self->_sceneInterpolators objectForKeyedSubscript:@"yOffset"];
  [v12 value];
  CGFloat v14 = v13;
  double v15 = [(NSDictionary *)self->_sceneInterpolators objectForKeyedSubscript:@"zOffset"];
  [v15 value];
  CATransform3DMakeTranslation(&v59, v11, v14, v16);

  memset(&v58, 0, sizeof(v58));
  CATransform3D a = v61;
  CATransform3D b = v60;
  CATransform3DConcat(&v57, &a, &b);
  CATransform3D a = v59;
  CATransform3DConcat(&v58, &v57, &a);
  double v17 = [(ABActionSelectorDriver *)self _sceneParamsForState:self->_state];
  double v18 = -[ABDeviceButtonAnimator color]((id *)&self->_buttonAnimator->super.isa);
  CATransform3D v54 = v58;
  uint64_t v19 = [(NSDictionary *)self->_sceneInterpolators objectForKeyedSubscript:@"fStop"];
  [v19 value];
  double v21 = v20;
  id v22 = [(NSDictionary *)self->_sceneInterpolators objectForKeyedSubscript:@"FocusDistance"];
  [v22 value];
  double v24 = v23;
  uint64_t v25 = [(NSDictionary *)self->_sceneInterpolators objectForKeyedSubscript:@"FocalLength"];
  [v25 value];
  double v27 = v26;
  id v28 = [v17 objectForKeyedSubscript:@"ApertureBlades"];
  [v28 doubleValue];
  double v30 = v29;

  v31 = [(NSDictionary *)self->_sceneInterpolators objectForKeyedSubscript:@"LightingIntensity"];
  [v31 value];
  double v33 = v32;
  id v34 = v18;
  double v35 = -[ABDeviceButtonAnimator opacity]((uint64_t)self->_buttonAnimator);
  double v36 = -[ABDeviceButtonAnimator pressProgress]((uint64_t)self->_buttonAnimator);
  if (self->_isInWelcomeMode) {
    int64_t v37 = -[ABDeviceButtonAnimator islandMode]((uint64_t)self->_buttonAnimator);
  }
  else {
    int64_t v37 = 0;
  }
  self->_sceneRenderInputs.modelTransform = v54;
  self->_sceneRenderInputs.cameraAndLight.fStop = v21;
  self->_sceneRenderInputs.cameraAndLight.focusDistance = v24;
  self->_sceneRenderInputs.cameraAndLight.focalLength = v27;
  self->_sceneRenderInputs.cameraAndLight.apertureBladeCount = v30;
  self->_sceneRenderInputs.cameraAndLight.lightingIntensity = v33;
  objc_storeStrong((id *)&self->_sceneRenderInputs.buttonHighlight.color, v18);
  self->_sceneRenderInputs.buttonHighlight.opacity = v35;
  self->_sceneRenderInputs.buttonPressProgress = v36;
  self->_sceneRenderInputs.islandMode = v37;

  v38 = [(NSDictionary *)self->_sceneInterpolators objectForKeyedSubscript:@"ZoomInProgress"];
  [v38 value];
  double v40 = v39;

  if (self->_isInWelcomeMode) {
    double v41 = ABClamp((v40 + -0.25) / 0.65 + 0.0, 0.0, 1.0);
  }
  else {
    double v41 = 1.0;
  }
  double v42 = -[ABDeviceButtonAnimator pressProgress]((uint64_t)self->_buttonAnimator);
  BOOL isInWelcomeMode = self->_isInWelcomeMode;
  v44 = (UIColor *)v34;
  BOOL v45 = -[ABDeviceButtonAnimator isRingHighlightVisible]((BOOL)self->_buttonAnimator);
  if (self->_isInWelcomeMode)
  {
    double v46 = ABClamp(v40 / -0.15 + 1.0, 0.0, 1.0);
    if (self->_isInWelcomeMode)
    {
      BOOL v47 = 0;
      double v48 = v40 * 0.25 + 0.25;
      goto LABEL_18;
    }
  }
  else
  {
    double v46 = 0.0;
  }
  int64_t state = self->_state;
  if (state) {
    BOOL v50 = state == 3;
  }
  else {
    BOOL v50 = 1;
  }
  BOOL v47 = v50;
  double v48 = 0.5;
LABEL_18:
  BOOL v52 = v40 > 0.3 || !isInWelcomeMode;
  self->_overlayRenderInputs.carouselInputs.pressProgress = v42;
  self->_overlayRenderInputs.carouselInputs.itemOpacity = v41;
  self->_overlayRenderInputs.carouselInputs.selectedItemIgnoresOpacity = isInWelcomeMode;
  self->_overlayRenderInputs.carouselInputs.isScrollingEnabled = v52;
  color = self->_overlayRenderInputs.highlightRingInputs.color;
  self->_overlayRenderInputs.highlightRingInputs.color = v44;

  self->_overlayRenderInputs.highlightRingInputs.isVisible = v45;
  self->_overlayRenderInputs.detailsViewOpacity = v41;
  self->_overlayRenderInputs.welcomeViewOpacity = v46;
  self->_overlayRenderInputs.topShadowRatio = v48;
  self->_overlayRenderInputs.isZoomInByTapEnabled = v47;
}

- (void)_updateForDisplayLink:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a3;
  CGFloat v5 = -[NSDictionary objectForKeyedSubscript:](self->_sceneInterpolators, "objectForKeyedSubscript:");
  [v5 value];
  double v7 = v6;

  double v8 = [(ABActionSelectorDriver *)self _sceneParamsForState:self->_state];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  double v9 = [(NSDictionary *)self->_sceneInterpolators allValues];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v36;
    double v13 = (1.0 - v7 + -0.1) * -1.2 / 0.2 + 2.0;
    if (1.0 - v7 >= 0.3) {
      double v13 = 0.8;
    }
    if (1.0 - v7 >= 0.1) {
      double v14 = v13;
    }
    else {
      double v14 = (1.0 - v7) * -3.0 / 0.1 + 5.0;
    }
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v36 != v12) {
          objc_enumerationMutation(v9);
        }
        CGFloat v16 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        [v16 parameters];
        double v18 = v17;
        double v20 = v19;
        double v22 = v21;
        double v23 = v14;
        if (self->_state != 3)
        {
          double v24 = [v8 objectForKeyedSubscript:@"Response"];
          [v24 doubleValue];
          double v23 = v25;
        }
        objc_msgSend(v16, "setParameters:", v18, v20, v23, v22);
        [v4 duration];
        objc_msgSend(v16, "step:");
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v11);
  }

  double v26 = [(NSDictionary *)self->_sceneInterpolators objectForKeyedSubscript:@"ZoomInProgress"];
  [v26 value];
  double v28 = v27;

  int64_t state = self->_state;
  if (state == 1 && v28 > 0.99)
  {
    uint64_t v30 = 2;
LABEL_20:
    [(ABActionSelectorDriver *)self _updateWithState:v30 dragProgress:self->_dragProgress];
    goto LABEL_21;
  }
  if (state == 3 && v28 < 0.01)
  {
    uint64_t v30 = 0;
    goto LABEL_20;
  }
LABEL_21:
  -[ABDeviceButtonAnimator update]((uint64_t)self->_buttonAnimator);
  [(ABActionSelectorDriver *)self _updateRenderInputs];
  renderBlock = (void (**)(id, double, double))self->_renderBlock;
  [(CADisplayLink *)self->_displayLink targetTimestamp];
  double v33 = v32;
  [(CADisplayLink *)self->_displayLink duration];
  renderBlock[2](renderBlock, v33, v34);
}

- (void)_scheduleZoomOutIfNeeded
{
  if (self->_state == 2 && self->_isSceneRevealed)
  {
    uint64_t v3 = [(NSArray *)self->_items objectAtIndexedSubscript:self->_selectedIndex];
    int v4 = [v3 canBeHighlighted];

    if (v4)
    {
      -[ABActionSelectorDriver zoomOutAfterDelay:]((uint64_t *)self, 1.5);
    }
    else
    {
      transitionScheduler = self->_transitionScheduler;
      -[ABDelayedBlockExecutor cancelPendingBlock](transitionScheduler);
    }
  }
}

- (uint64_t)items
{
  if (result) {
    return *(void *)(result + 88);
  }
  return result;
}

- (uint64_t)selectedIndex
{
  if (result) {
    return *(void *)(result + 96);
  }
  return result;
}

- (BOOL)isInWelcomeMode
{
  if (result) {
    return *(unsigned char *)(result + 82) != 0;
  }
  return result;
}

- (double)sceneRenderInputs
{
  if (a1)
  {
    int v4 = *(void **)(a1 + 344);
    *(void *)(a2 + 160) = *(void *)(a1 + 336);
    long long v5 = *(_OWORD *)(a1 + 320);
    *(_OWORD *)(a2 + 128) = *(_OWORD *)(a1 + 304);
    *(_OWORD *)(a2 + 144) = v5;
    long long v6 = *(_OWORD *)(a1 + 256);
    *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 240);
    *(_OWORD *)(a2 + 80) = v6;
    long long v7 = *(_OWORD *)(a1 + 288);
    *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 272);
    *(_OWORD *)(a2 + 112) = v7;
    long long v8 = *(_OWORD *)(a1 + 192);
    *(_OWORD *)a2 = *(_OWORD *)(a1 + 176);
    *(_OWORD *)(a2 + 16) = v8;
    long long v9 = *(_OWORD *)(a1 + 224);
    *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 208);
    *(_OWORD *)(a2 + 48) = v9;
    id v10 = v4;
    uint64_t v11 = *(void *)(a1 + 352);
    *(void *)(a2 + 168) = v10;
    *(void *)(a2 + 176) = v11;
    long long v12 = *(_OWORD *)(a1 + 360);
    *(_OWORD *)(a2 + 184) = v12;
  }
  else
  {
    *(void *)(a2 + 192) = 0;
    *(void *)&long long v12 = 0;
    *(_OWORD *)(a2 + 160) = 0u;
    *(_OWORD *)(a2 + 176) = 0u;
    *(_OWORD *)(a2 + 128) = 0u;
    *(_OWORD *)(a2 + 144) = 0u;
    *(_OWORD *)(a2 + 96) = 0u;
    *(_OWORD *)(a2 + 112) = 0u;
    *(_OWORD *)(a2 + 64) = 0u;
    *(_OWORD *)(a2 + 80) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)(a2 + 48) = 0u;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  return *(double *)&v12;
}

- (double)overlayRenderInputs
{
  if (a1)
  {
    *(_OWORD *)a2 = *(_OWORD *)(a1 + 104);
    int v4 = *(void **)(a1 + 128);
    *(void *)(a2 + 16) = *(void *)(a1 + 120);
    *(void *)(a2 + 24) = v4;
    *(unsigned char *)(a2 + 32) = *(unsigned char *)(a1 + 136);
    *(_OWORD *)(a2 + 40) = *(_OWORD *)(a1 + 144);
    long long v5 = *(_OWORD *)(a1 + 153);
    *(_OWORD *)(a2 + 49) = v5;
  }
  else
  {
    *(void *)(a2 + 64) = 0;
    *(void *)&long long v5 = 0;
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)(a2 + 48) = 0u;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  return *(double *)&v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_dragProgress, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_zoomedInParams, 0);
  objc_storeStrong((id *)&self->_zoomedOutParams, 0);
  objc_storeStrong((id *)&self->_transitionScheduler, 0);
  objc_storeStrong((id *)&self->_buttonAnimator, 0);
  objc_storeStrong((id *)&self->_sceneInterpolators, 0);

  objc_storeStrong(&self->_renderBlock, 0);
}

@end