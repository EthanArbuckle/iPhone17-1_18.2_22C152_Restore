@interface CAMSystemOverlayVisibility
- (BOOL)isVisible;
- (CAMSystemOverlayVisibility)init;
- (CAMSystemOverlayVisibilityDelegate)delegate;
- (NSMutableSet)_activeReasons;
- (NSString)name;
- (OS_dispatch_source)_delayedHidingTimer;
- (double)delayedHideDuration;
- (void)_cancelTimer;
- (void)_handleTimer:(id)a3 firedWithReason:(int64_t)a4;
- (void)_logReason:(int64_t)a3 visibilityChanged:(BOOL)a4;
- (void)_setDelayedHidingTimer:(id)a3;
- (void)_startTimerWithReason:(int64_t)a3;
- (void)addReason:(int64_t)a3;
- (void)hideImmediately;
- (void)removeReason:(int64_t)a3;
- (void)setDelayedHideDuration:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setName:(id)a3;
- (void)showTransiently;
@end

@implementation CAMSystemOverlayVisibility

- (CAMSystemOverlayVisibility)init
{
  v7.receiver = self;
  v7.super_class = (Class)CAMSystemOverlayVisibility;
  v2 = [(CAMSystemOverlayVisibility *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9C0] set];
    activeReasons = v2->__activeReasons;
    v2->__activeReasons = (NSMutableSet *)v3;

    name = v2->_name;
    v2->_name = (NSString *)@"OverlayVisibility";
  }
  return v2;
}

- (BOOL)isVisible
{
  uint64_t v3 = [(CAMSystemOverlayVisibility *)self _activeReasons];
  if ([v3 count])
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(CAMSystemOverlayVisibility *)self _delayedHidingTimer];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (void)addReason:(int64_t)a3
{
  BOOL v5 = [(CAMSystemOverlayVisibility *)self isVisible];
  [(CAMSystemOverlayVisibility *)self _cancelTimer];
  id v10 = [(CAMSystemOverlayVisibility *)self _activeReasons];
  v6 = [NSNumber numberWithInteger:a3];
  char v7 = [v10 containsObject:v6];

  v8 = [NSNumber numberWithInteger:a3];
  [v10 addObject:v8];

  if (v5)
  {
    if ((v7 & 1) == 0) {
      [(CAMSystemOverlayVisibility *)self _logReason:a3 visibilityChanged:0];
    }
  }
  else
  {
    [(CAMSystemOverlayVisibility *)self _logReason:a3 visibilityChanged:1];
    v9 = [(CAMSystemOverlayVisibility *)self delegate];
    [v9 systemOverlayVisibility:self changedForReason:a3];
  }
}

- (void)removeReason:(int64_t)a3
{
  id v10 = [(CAMSystemOverlayVisibility *)self _activeReasons];
  BOOL v5 = [NSNumber numberWithInteger:a3];
  int v6 = [v10 containsObject:v5];

  uint64_t v7 = [v10 count];
  v8 = [NSNumber numberWithInteger:a3];
  [v10 removeObject:v8];

  uint64_t v9 = [v10 count];
  if (v7 && !v9) {
    [(CAMSystemOverlayVisibility *)self _startTimerWithReason:a3];
  }
  if (v6) {
    [(CAMSystemOverlayVisibility *)self _logReason:a3 visibilityChanged:0];
  }
}

- (void)hideImmediately
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if ([(CAMSystemOverlayVisibility *)self isVisible])
  {
    [(CAMSystemOverlayVisibility *)self _cancelTimer];
    uint64_t v3 = [(CAMSystemOverlayVisibility *)self _activeReasons];
    [v3 removeAllObjects];

    BOOL v4 = os_log_create("com.apple.camera.overlay", "Angel");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v5 = [(CAMSystemOverlayVisibility *)self name];
      int v6 = 138543362;
      uint64_t v7 = v5;
      _os_log_impl(&dword_2099F8000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Changed to NO for hideImmediately", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)showTransiently
{
  if (![(CAMSystemOverlayVisibility *)self isVisible])
  {
    [(CAMSystemOverlayVisibility *)self _startTimerWithReason:-1];
    [(CAMSystemOverlayVisibility *)self _logReason:-1 visibilityChanged:1];
  }
}

- (void)_cancelTimer
{
  uint64_t v3 = [(CAMSystemOverlayVisibility *)self _delayedHidingTimer];
  if (v3)
  {
    BOOL v5 = v3;
    dispatch_source_cancel(v3);
    [(CAMSystemOverlayVisibility *)self _setDelayedHidingTimer:0];
    BOOL v4 = [(CAMSystemOverlayVisibility *)self delegate];
    [v4 systemOverlayVisibilityCancelledHidingTimer:self];

    uint64_t v3 = v5;
  }
}

- (void)_startTimerWithReason:(int64_t)a3
{
  [(CAMSystemOverlayVisibility *)self delayedHideDuration];
  if (v5 == 0.0)
  {
    id v11 = [(CAMSystemOverlayVisibility *)self delegate];
    [v11 systemOverlayVisibility:self changedForReason:a3];
  }
  else
  {
    double v6 = v5;
    [(CAMSystemOverlayVisibility *)self _cancelTimer];
    double v7 = v6 * 1000000000.0;
    uint64_t v8 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
    dispatch_time_t v9 = dispatch_time(0, (uint64_t)v7);
    dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)((double)(uint64_t)v7 * 0.1));
    [(CAMSystemOverlayVisibility *)self _setDelayedHidingTimer:v8];
    objc_initWeak(&location, self);
    objc_initWeak(&from, v8);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __52__CAMSystemOverlayVisibility__startTimerWithReason___block_invoke;
    handler[3] = &unk_263FA3040;
    objc_copyWeak(&v13, &location);
    objc_copyWeak(v14, &from);
    v14[1] = (id)a3;
    dispatch_source_set_event_handler(v8, handler);
    dispatch_resume(v8);
    id v10 = [(CAMSystemOverlayVisibility *)self delegate];
    [v10 systemOverlayVisibilityBeganHidingTimer:self];

    objc_destroyWeak(v14);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

void __52__CAMSystemOverlayVisibility__startTimerWithReason___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleTimer:v2 firedWithReason:*(void *)(a1 + 48)];
}

- (void)_handleTimer:(id)a3 firedWithReason:(int64_t)a4
{
  id v6 = a3;
  id v9 = [(CAMSystemOverlayVisibility *)self _delayedHidingTimer];

  double v7 = v9;
  if (v9 && v9 == v6)
  {
    [(CAMSystemOverlayVisibility *)self _cancelTimer];
    [(CAMSystemOverlayVisibility *)self _logReason:a4 visibilityChanged:1];
    uint64_t v8 = [(CAMSystemOverlayVisibility *)self delegate];
    [v8 systemOverlayVisibility:self changedForReason:a4];

    double v7 = v9;
  }
}

- (void)_logReason:(int64_t)a3 visibilityChanged:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v38 = *MEMORY[0x263EF8340];
  double v7 = [(CAMSystemOverlayVisibility *)self name];
  if ((unint64_t)(a3 + 1) > 4)
  {
    uint64_t v8 = 0;
    if (!v4) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v8 = off_263FA3060[a3 + 1];
    if (!v4)
    {
LABEL_3:
      id v9 = [(CAMSystemOverlayVisibility *)self _activeReasons];
      id v10 = [NSNumber numberWithInteger:a3];
      int v11 = [v9 containsObject:v10];

      v12 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v9, "count"));
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      os_log_t v13 = v9;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v37 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v26 != v16) {
              objc_enumerationMutation(v13);
            }
            unint64_t v18 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * i), "integerValue", (void)v25) + 1;
            if (v18 > 4) {
              v19 = 0;
            }
            else {
              v19 = off_263FA3060[v18];
            }
            [v12 addObject:v19];
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v37 count:16];
        }
        while (v15);
      }

      v20 = [v12 componentsJoinedByString:@", "];
      v21 = os_log_create("com.apple.camera.overlay", "Angel");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        v24 = @"removed";
        *(_DWORD *)buf = 138544130;
        v30 = v7;
        __int16 v31 = 2114;
        if (v11) {
          v24 = @"added";
        }
        v32 = v24;
        __int16 v33 = 2114;
        v34 = v8;
        __int16 v35 = 2114;
        v36 = v20;
        _os_log_debug_impl(&dword_2099F8000, v21, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ reason %{public}@: [%{public}@]", buf, 0x2Au);
      }

      goto LABEL_20;
    }
  }
  os_log_t v13 = os_log_create("com.apple.camera.overlay", "Angel");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v22 = [(CAMSystemOverlayVisibility *)self isVisible];
    v23 = @"NO";
    *(_DWORD *)buf = 138543874;
    v30 = v7;
    __int16 v31 = 2114;
    if (v22) {
      v23 = @"YES";
    }
    v32 = v23;
    __int16 v33 = 2114;
    v34 = v8;
    _os_log_impl(&dword_2099F8000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Changed to %{public}@ for reason %{public}@", buf, 0x20u);
  }
LABEL_20:
}

- (double)delayedHideDuration
{
  return self->_delayedHideDuration;
}

- (void)setDelayedHideDuration:(double)a3
{
  self->_delayedHideDuration = a3;
}

- (CAMSystemOverlayVisibilityDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMSystemOverlayVisibilityDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSMutableSet)_activeReasons
{
  return self->__activeReasons;
}

- (OS_dispatch_source)_delayedHidingTimer
{
  return self->__delayedHidingTimer;
}

- (void)_setDelayedHidingTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__delayedHidingTimer, 0);
  objc_storeStrong((id *)&self->__activeReasons, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end