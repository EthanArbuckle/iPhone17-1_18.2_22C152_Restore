@interface LAUIRenderLoop
- (BOOL)_isForcingPause;
- (BOOL)attachToScreen:(id)a3;
- (BOOL)effectiveIsPaused;
- (BOOL)isDrawing;
- (BOOL)isInApplicationContext;
- (BOOL)isInvalidated;
- (BOOL)isPaused;
- (BOOL)isRunnable;
- (CAFrameRateRange)preferredFrameRateRange;
- (LAUIRenderLoop)init;
- (LAUIRenderLoopDelegate)delegate;
- (UIScreen)screen;
- (unsigned)highFrameRateReason;
- (void)_applicationDidBecomeActive:(id)a3;
- (void)_applicationDidEnterBackground:(id)a3;
- (void)_applicationWillEnterForeground:(id)a3;
- (void)_drawAtTime:(uint64_t)a1;
- (void)_drawWithDisplayLink:(uint64_t)a1;
- (void)_setNeedsForcingPauseUpdate;
- (void)_updateApplicationState;
- (void)_updateEffectivePausedState;
- (void)dealloc;
- (void)invalidate;
- (void)setDelegate:(id)a3;
- (void)setHighFrameRateReason:(unsigned int)a3;
- (void)setInApplicationContext:(BOOL)a3;
- (void)setPaused:(BOOL)a3;
- (void)setPreferredFrameRateRange:(CAFrameRateRange)a3;
@end

@implementation LAUIRenderLoop

- (void)_drawWithDisplayLink:(uint64_t)a1
{
  id v4 = a2;
  if (a1 && v4 && *(id *)(a1 + 24) == v4)
  {
    [v4 targetTimestamp];
    -[LAUIRenderLoop _drawAtTime:](a1, v3);
  }
}

- (LAUIRenderLoop)init
{
  v6.receiver = self;
  v6.super_class = (Class)LAUIRenderLoop;
  v2 = [(LAUIRenderLoop *)&v6 init];
  double v3 = v2;
  if (v2)
  {
    v2->_paused = 1;
    *(_WORD *)&v2->_in_application_context = 256;
    uint64_t v4 = MEMORY[0x263F15738];
    *(void *)&v2->_preferred_fps_range.minimum = *MEMORY[0x263F15738];
    v2->_preferred_fps_range.preferred = *(float *)(v4 + 8);
    -[LAUIRenderLoop _updateApplicationState]((uint64_t)v2);
  }
  return v3;
}

- (void)_updateApplicationState
{
  if (a1)
  {
    v2 = [MEMORY[0x263F08A00] defaultCenter];
    id v4 = v2;
    if (*(unsigned char *)(a1 + 36))
    {
      double v3 = [MEMORY[0x263F1C408] sharedApplication];
      *(unsigned char *)(a1 + 33) = [v3 applicationState] == 2;

      [v4 addObserver:a1 selector:sel__applicationDidEnterBackground_ name:*MEMORY[0x263F1D050] object:0];
      [v4 addObserver:a1 selector:sel__applicationWillEnterForeground_ name:*MEMORY[0x263F1D0D0] object:0];
      [v4 addObserver:a1 selector:sel__applicationDidBecomeActive_ name:*MEMORY[0x263F1D038] object:0];
    }
    else
    {
      [v2 removeObserver:a1 name:*MEMORY[0x263F1D050] object:0];
      [v4 removeObserver:a1 name:*MEMORY[0x263F1D0D0] object:0];
      [v4 removeObserver:a1 name:*MEMORY[0x263F1D038] object:0];
    }
    -[LAUIRenderLoop _updateEffectivePausedState](a1);
  }
}

- (void)dealloc
{
  double v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  [(LAUIRenderLoop *)self invalidate];
  v4.receiver = self;
  v4.super_class = (Class)LAUIRenderLoop;
  [(LAUIRenderLoop *)&v4 dealloc];
}

- (BOOL)attachToScreen:(id)a3
{
  id v4 = a3;
  if (self->_invalidated)
  {
    BOOL v5 = 0;
    goto LABEL_19;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_screen);
  if (WeakRetained != v4)
  {
    p_display_link = &self->_display_link;
    display_link = self->_display_link;
    if (!display_link) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  p_display_link = &self->_display_link;
  display_link = self->_display_link;
  if (v4)
  {
    if (!display_link)
    {
      objc_storeWeak((id *)&self->_screen, v4);
      goto LABEL_7;
    }
LABEL_21:
    BOOL v18 = display_link == 0;
    goto LABEL_15;
  }
  if (!display_link) {
    goto LABEL_21;
  }
LABEL_5:
  [(CADisplayLink *)display_link invalidate];
  v9 = *p_display_link;
  *p_display_link = 0;

LABEL_6:
  objc_storeWeak((id *)&self->_screen, v4);
  if (v4)
  {
LABEL_7:
    v10 = -[LAUIDisplayLinkTargetProxy initWithTarget:]((id *)[LAUIDisplayLinkTargetProxy alloc], self);
    v11 = [v4 displayLinkWithTarget:v10 selector:sel_drawWithDisplayLink_];
    v12 = self->_display_link;
    self->_display_link = v11;

    [(CADisplayLink *)self->_display_link setPaused:self->_effective_paused];
    *(float *)&double v13 = self->_preferred_fps_range.minimum;
    *(float *)&double v14 = self->_preferred_fps_range.maximum;
    *(float *)&double v15 = self->_preferred_fps_range.preferred;
    -[CADisplayLink setPreferredFrameRateRange:](self->_display_link, "setPreferredFrameRateRange:", v13, v14, v15);
    if (self->_has_high_fps_reason) {
      [(CADisplayLink *)self->_display_link setHighFrameRateReason:self->_high_fps_reason];
    }
    v16 = *p_display_link;
    v17 = [MEMORY[0x263EFF9F0] currentRunLoop];
    [(CADisplayLink *)v16 addToRunLoop:v17 forMode:*MEMORY[0x263EFF588]];

    -[LAUIRenderLoop _updateEffectivePausedState]((uint64_t)self);
    goto LABEL_14;
  }
  -[LAUIRenderLoop _updateEffectivePausedState]((uint64_t)self);
LABEL_14:
  BOOL v18 = !self->_runnable;
LABEL_15:
  BOOL v5 = !v18;

LABEL_19:
  return v5;
}

- (void)_updateEffectivePausedState
{
  if (a1)
  {
    if (*(unsigned char *)(a1 + 17)
      || !*(void *)(a1 + 24)
      || !CAFrameRateRangeIsEqualToRange(*(CAFrameRateRange *)(a1 + 56), *MEMORY[0x263F15738])
      && *(float *)(a1 + 60) <= 0.0
      || *(unsigned char *)(a1 + 36) && *(unsigned char *)(a1 + 33))
    {
      int v2 = 1;
    }
    else
    {
      int v2 = [(id)a1 _isForcingPause];
    }
    int v3 = v2 ^ 1;
    int v4 = *(unsigned __int8 *)(a1 + 39);
    if (v4 != (v2 ^ 1)) {
      *(unsigned char *)(a1 + 39) = v3;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    int v5 = (v2 & 1) != 0 || *(unsigned char *)(a1 + 38) != 0;
    if (*(unsigned __int8 *)(a1 + 37) == v5)
    {
      if (v4 != v3 && *(unsigned char *)(a1 + 35)) {
        [WeakRetained renderLoop:a1 didChangeRunnable:*(unsigned __int8 *)(a1 + 39)];
      }
    }
    else
    {
      *(unsigned char *)(a1 + 37) = v5;
      objc_msgSend(*(id *)(a1 + 24), "setPaused:");
      if (v4 != v3 && *(unsigned char *)(a1 + 35)) {
        [WeakRetained renderLoop:a1 didChangeRunnable:*(unsigned __int8 *)(a1 + 39)];
      }
      if (*(unsigned char *)(a1 + 34)) {
        [WeakRetained renderLoop:a1 didChangeEffectivePaused:*(unsigned __int8 *)(a1 + 37)];
      }
    }
  }
}

- (void)invalidate
{
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    [(LAUIRenderLoop *)self _didInvalidate];
    objc_storeWeak((id *)&self->_screen, 0);
    display_link = self->_display_link;
    if (display_link)
    {
      [(CADisplayLink *)display_link invalidate];
      int v4 = self->_display_link;
      self->_display_link = 0;
    }
    -[LAUIRenderLoop _updateEffectivePausedState]((uint64_t)self);
  }
}

- (void)_setNeedsForcingPauseUpdate
{
  if (a1) {
    -[LAUIRenderLoop _updateEffectivePausedState](a1);
  }
}

- (BOOL)_isForcingPause
{
  return 0;
}

- (void)_drawAtTime:(uint64_t)a1
{
  if (a1 && !*(unsigned char *)(a1 + 37))
  {
    int v4 = (void *)MEMORY[0x2166A1B20]();
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    if (WeakRetained)
    {
      *(unsigned char *)(a1 + 16) = 1;
      [(id)a1 _willDraw];
      [WeakRetained renderLoop:a1 drawAtTime:a2];
      *(unsigned char *)(a1 + 16) = 0;
      [(id)a1 _didDraw];
    }
  }
}

- (void)setInApplicationContext:(BOOL)a3
{
  if (self->_in_application_context != a3)
  {
    self->_in_application_context = a3;
    -[LAUIRenderLoop _updateApplicationState]((uint64_t)self);
  }
}

- (void)setPreferredFrameRateRange:(CAFrameRateRange)a3
{
  float preferred = a3.preferred;
  float maximum = a3.maximum;
  float minimum = a3.minimum;
  if (!CAFrameRateRangeIsEqualToRange(self->_preferred_fps_range, a3))
  {
    self->_preferred_fps_range.float minimum = minimum;
    self->_preferred_fps_range.float maximum = maximum;
    self->_preferred_fps_range.float preferred = preferred;
    *(float *)&double v7 = minimum;
    *(float *)&double v8 = maximum;
    *(float *)&double v9 = preferred;
    -[CADisplayLink setPreferredFrameRateRange:](self->_display_link, "setPreferredFrameRateRange:", v7, v8, v9);
    -[LAUIRenderLoop _updateEffectivePausedState]((uint64_t)self);
  }
}

- (void)setHighFrameRateReason:(unsigned int)a3
{
  self->_has_high_fps_reason = 1;
  self->_high_fps_reason = a3;
  -[CADisplayLink setHighFrameRateReason:](self->_display_link, "setHighFrameRateReason:");
}

- (void)setPaused:(BOOL)a3
{
  if (self->_paused != a3)
  {
    self->_paused = a3;
    -[LAUIRenderLoop _updateEffectivePausedState]((uint64_t)self);
  }
}

- (void)setDelegate:(id)a3
{
  id v5 = a3;
  objc_storeWeak((id *)&self->_delegate, v5);
  if (v5)
  {
    self->_delegate_observes_effective_paused = objc_opt_respondsToSelector() & 1;
    char v4 = objc_opt_respondsToSelector();
  }
  else
  {
    char v4 = 0;
    self->_delegate_observes_effective_paused = 0;
  }
  self->_delegate_observes_runnable = v4 & 1;
  MEMORY[0x270F9A790]();
}

- (void)_applicationDidEnterBackground:(id)a3
{
  id v5 = a3;
  char v4 = [MEMORY[0x263F1C408] sharedApplication];
  if ([v4 applicationState] != 2) {
    __assert_rtn("-[LAUIRenderLoop _applicationDidEnterBackground:]", "LAUIRenderLoop.mm", 447, "[[UIApplication sharedApplication] applicationState] == UIApplicationStateBackground");
  }

  if (!self->_background)
  {
    self->_background = 1;
    -[LAUIRenderLoop _updateEffectivePausedState]((uint64_t)self);
  }
}

- (void)_applicationWillEnterForeground:(id)a3
{
  if (self->_background)
  {
    self->_background = 0;
    -[LAUIRenderLoop _updateEffectivePausedState]((uint64_t)self);
  }
}

- (void)_applicationDidBecomeActive:(id)a3
{
  id v5 = a3;
  char v4 = [MEMORY[0x263F1C408] sharedApplication];
  if ([v4 applicationState] == 2) {
    __assert_rtn("-[LAUIRenderLoop _applicationDidBecomeActive:]", "LAUIRenderLoop.mm", 466, "[[UIApplication sharedApplication] applicationState] != UIApplicationStateBackground");
  }

  if (self->_background)
  {
    self->_background = 0;
    -[LAUIRenderLoop _updateEffectivePausedState]((uint64_t)self);
  }
}

- (BOOL)isInApplicationContext
{
  return self->_in_application_context;
}

- (CAFrameRateRange)preferredFrameRateRange
{
  float minimum = self->_preferred_fps_range.minimum;
  float maximum = self->_preferred_fps_range.maximum;
  float preferred = self->_preferred_fps_range.preferred;
  result.float preferred = preferred;
  result.float maximum = maximum;
  result.float minimum = minimum;
  return result;
}

- (unsigned)highFrameRateReason
{
  return self->_high_fps_reason;
}

- (BOOL)effectiveIsPaused
{
  return self->_effective_paused;
}

- (UIScreen)screen
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_screen);
  return (UIScreen *)WeakRetained;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (BOOL)isDrawing
{
  return self->_drawing;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (BOOL)isRunnable
{
  return self->_runnable;
}

- (LAUIRenderLoopDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (LAUIRenderLoopDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_screen);
  objc_storeStrong((id *)&self->_display_link, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end