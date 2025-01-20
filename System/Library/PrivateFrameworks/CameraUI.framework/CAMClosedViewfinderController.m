@interface CAMClosedViewfinderController
- (BOOL)hasClosedViewfinderReason:(int64_t)a3;
- (BOOL)isViewfinderClosed;
- (CAMClosedViewfinderController)init;
- (CAMClosedViewfinderControllerDelegate)delegate;
- (NSMutableSet)_reasonsForClosingViewfinder;
- (double)_referenceTime;
- (id)_descriptionForReasons:(id)a3;
- (id)_descriptionStringForReason:(int64_t)a3;
- (id)_descriptionStringForReferenceTimeEvent:(int64_t)a3;
- (id)descriptionForTimeBetweenReferenceAndNow;
- (int64_t)_referenceTimeEvent;
- (void)_cancelDelayedLoggingForClosedViewfinder;
- (void)_handleApplicationDidBecomeActive:(id)a3;
- (void)_handleApplicationWillEnterForeground:(id)a3;
- (void)_logWarningIfViewfinderStillClosed;
- (void)_performDelayedRemovalOfReason:(id)a3;
- (void)_scheduleLogWarningIfViewfinderStillClosedAfterDelay:(double)a3;
- (void)_setReferenceTime:(double)a3;
- (void)_setReferenceTimeEvent:(int64_t)a3;
- (void)_updateReferenceTimeToNowForEvent:(int64_t)a3;
- (void)addClosedViewfinderReason:(int64_t)a3;
- (void)cancelDelayedRemovalOfReason:(int64_t)a3;
- (void)dealloc;
- (void)removeClosedViewfinderReason:(int64_t)a3;
- (void)removeClosedViewfinderReason:(int64_t)a3 afterDelay:(double)a4;
- (void)setDelegate:(id)a3;
@end

@implementation CAMClosedViewfinderController

- (CAMClosedViewfinderController)init
{
  v8.receiver = self;
  v8.super_class = (Class)CAMClosedViewfinderController;
  v2 = [(CAMClosedViewfinderController *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    reasonsForClosingViewfinder = v2->__reasonsForClosingViewfinder;
    v2->__reasonsForClosingViewfinder = v3;

    [(CAMClosedViewfinderController *)v2 _setReferenceTime:CFAbsoluteTimeGetCurrent()];
    [(CAMClosedViewfinderController *)v2 _setReferenceTimeEvent:0];
    v5 = +[CAMPriorityNotificationCenter defaultCenter];
    [v5 addObserver:v2 priority:0 selector:sel__handleApplicationDidBecomeActive_ name:*MEMORY[0x263F83318] object:0];
    [v5 addObserver:v2 priority:0 selector:sel__handleApplicationWillEnterForeground_ name:*MEMORY[0x263F833B8] object:0];
    [v5 addObserver:v2 priority:0 selector:sel__handleApplicationDidEnterBackground_ name:*MEMORY[0x263F83330] object:0];
    v6 = v2;
  }
  return v2;
}

- (void)_setReferenceTime:(double)a3
{
  self->__referenceTime = a3;
}

- (void)_setReferenceTimeEvent:(int64_t)a3
{
  self->__referenceTimeEvent = a3;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isViewfinderClosed
{
  v2 = [(CAMClosedViewfinderController *)self _reasonsForClosingViewfinder];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (NSMutableSet)_reasonsForClosingViewfinder
{
  return self->__reasonsForClosingViewfinder;
}

- (void)removeClosedViewfinderReason:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  -[CAMClosedViewfinderController cancelDelayedRemovalOfReason:](self, "cancelDelayedRemovalOfReason:");
  v5 = [(CAMClosedViewfinderController *)self _reasonsForClosingViewfinder];
  uint64_t v6 = [v5 count];
  v7 = [NSNumber numberWithInteger:a3];
  [v5 removeObject:v7];

  uint64_t v8 = [v5 count];
  uint64_t v9 = v8;
  if (v6 && !v8)
  {
    v10 = [(CAMClosedViewfinderController *)self descriptionForTimeBetweenReferenceAndNow];
    v11 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [(CAMClosedViewfinderController *)self _descriptionStringForReason:a3];
      int v15 = 138543618;
      v16 = v12;
      __int16 v17 = 2114;
      v18 = v10;
      _os_log_impl(&dword_2099F8000, v11, OS_LOG_TYPE_DEFAULT, "ClosedViewfinderController: Opening closed viewfinder for final reason %{public}@ %{public}@", (uint8_t *)&v15, 0x16u);
    }
    v13 = [(CAMClosedViewfinderController *)self delegate];
    [v13 closedViewfinderController:self wantsViewfinderOpenForReason:a3];
    [(CAMClosedViewfinderController *)self _cancelDelayedLoggingForClosedViewfinder];
    goto LABEL_9;
  }
  if (v6 != v8)
  {
    v10 = os_log_create("com.apple.camera", "Camera");
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
LABEL_10:

      goto LABEL_11;
    }
    v13 = [(CAMClosedViewfinderController *)self _descriptionStringForReason:a3];
    v14 = [(CAMClosedViewfinderController *)self _descriptionForReasons:v5];
    int v15 = 138543618;
    v16 = v13;
    __int16 v17 = 2114;
    v18 = v14;
    _os_log_impl(&dword_2099F8000, v10, OS_LOG_TYPE_DEFAULT, "ClosedViewfinderController: Removed closed viewfinder reason %{public}@: %{public}@", (uint8_t *)&v15, 0x16u);

LABEL_9:
    goto LABEL_10;
  }
LABEL_11:
  if ((a3 | 4) == 0xC && v9 && [(CAMClosedViewfinderController *)self _referenceTimeEvent] == 1) {
    [(CAMClosedViewfinderController *)self _updateReferenceTimeToNowForEvent:1];
  }
}

- (void)cancelDelayedRemovalOfReason:(int64_t)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v5 = [(CAMClosedViewfinderController *)self _reasonsForClosingViewfinder];
  uint64_t v6 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = [(CAMClosedViewfinderController *)self _descriptionStringForReason:a3];
    uint64_t v9 = [(CAMClosedViewfinderController *)self _descriptionForReasons:v5];
    int v10 = 138543618;
    v11 = v8;
    __int16 v12 = 2114;
    v13 = v9;
    _os_log_debug_impl(&dword_2099F8000, v6, OS_LOG_TYPE_DEBUG, "ClosedViewfinderController: Cancelling delayed removal of closed viewfinder reason %{public}@: %{public}@", (uint8_t *)&v10, 0x16u);
  }
  v7 = [NSNumber numberWithInteger:a3];
  +[CAMClosedViewfinderController cancelPreviousPerformRequestsWithTarget:self selector:sel__performDelayedRemovalOfReason_ object:v7];
}

- (void)_handleApplicationDidBecomeActive:(id)a3
{
  if ((unint64_t)([(CAMClosedViewfinderController *)self _referenceTimeEvent] - 1) <= 1)
  {
    [(CAMClosedViewfinderController *)self _updateReferenceTimeToNowForEvent:2];
  }
}

- (int64_t)_referenceTimeEvent
{
  return self->__referenceTimeEvent;
}

- (void)removeClosedViewfinderReason:(int64_t)a3 afterDelay:(double)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v7 = [(CAMClosedViewfinderController *)self _reasonsForClosingViewfinder];
  uint64_t v8 = [NSNumber numberWithInteger:a3];
  if ([v7 containsObject:v8])
  {
    uint64_t v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = [(CAMClosedViewfinderController *)self _descriptionStringForReason:a3];
      v11 = [(CAMClosedViewfinderController *)self _descriptionForReasons:v7];
      int v12 = 138543874;
      v13 = v10;
      __int16 v14 = 2048;
      double v15 = a4;
      __int16 v16 = 2114;
      __int16 v17 = v11;
      _os_log_impl(&dword_2099F8000, v9, OS_LOG_TYPE_DEFAULT, "ClosedViewfinderController: Will remove closed viewfinder reason %{public}@ after delay %f: %{public}@", (uint8_t *)&v12, 0x20u);
    }
    [(CAMClosedViewfinderController *)self performSelector:sel__performDelayedRemovalOfReason_ withObject:v8 afterDelay:a4];
  }
}

- (id)descriptionForTimeBetweenReferenceAndNow
{
  double Current = CFAbsoluteTimeGetCurrent();
  [(CAMClosedViewfinderController *)self _referenceTime];
  double v5 = Current - v4;
  uint64_t v6 = [(CAMClosedViewfinderController *)self _descriptionStringForReferenceTimeEvent:[(CAMClosedViewfinderController *)self _referenceTimeEvent]];
  v7 = [NSString stringWithFormat:@"%.3f seconds after %@", *(void *)&v5, v6];

  return v7;
}

- (double)_referenceTime
{
  return self->__referenceTime;
}

- (id)_descriptionStringForReferenceTimeEvent:(int64_t)a3
{
  unint64_t v3 = [(CAMClosedViewfinderController *)self _referenceTimeEvent];
  if (v3 > 3) {
    return &stru_26BD78BA0;
  }
  else {
    return off_263FA2F60[v3];
  }
}

- (void)addClosedViewfinderReason:(int64_t)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  -[CAMClosedViewfinderController cancelDelayedRemovalOfReason:](self, "cancelDelayedRemovalOfReason:");
  double v5 = [(CAMClosedViewfinderController *)self _reasonsForClosingViewfinder];
  uint64_t v6 = [v5 count];
  v7 = [NSNumber numberWithInteger:a3];
  [v5 addObject:v7];

  uint64_t v8 = [v5 count];
  if (!v6 && v8)
  {
    uint64_t v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = [(CAMClosedViewfinderController *)self _descriptionStringForReason:a3];
      int v16 = 138543362;
      __int16 v17 = v10;
      _os_log_impl(&dword_2099F8000, v9, OS_LOG_TYPE_DEFAULT, "ClosedViewfinderController: Closed viewfinder for reason %{public}@", (uint8_t *)&v16, 0xCu);
    }
    v11 = [(CAMClosedViewfinderController *)self delegate];
    [v11 closedViewfinderController:self wantsViewfinderClosedForReason:a3];
    [(CAMClosedViewfinderController *)self _updateReferenceTimeToNowForEvent:1];
    goto LABEL_16;
  }
  if (v6 != v8)
  {
    v11 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = [(CAMClosedViewfinderController *)self _descriptionStringForReason:a3];
      double v15 = [(CAMClosedViewfinderController *)self _descriptionForReasons:v5];
      int v16 = 138543618;
      __int16 v17 = v14;
      __int16 v18 = 2114;
      uint64_t v19 = v15;
      _os_log_impl(&dword_2099F8000, v11, OS_LOG_TYPE_DEFAULT, "ClosedViewfinderController: Added closed viewfinder reason %{public}@: %{public}@", (uint8_t *)&v16, 0x16u);
    }
LABEL_16:

    if ((unint64_t)a3 <= 0x16 && ((1 << a3) & 0x7FD980) != 0) {
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  if ((unint64_t)a3 <= 0x16)
  {
    if (((1 << a3) & 0x7FD980) != 0)
    {
LABEL_18:
      [(CAMClosedViewfinderController *)self _cancelDelayedLoggingForClosedViewfinder];
      goto LABEL_19;
    }
    if (!a3 && [v5 count] == 1)
    {
      int v12 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_2099F8000, v12, OS_LOG_TYPE_DEFAULT, "ClosedViewfinderController: Viewfinder closed for device position change reversal", (uint8_t *)&v16, 2u);
      }

      v13 = [(CAMClosedViewfinderController *)self delegate];
      [v13 closedViewfinderController:self wantsViewfinderClosedForReason:0];
    }
  }
LABEL_19:
}

- (id)_descriptionStringForReason:(int64_t)a3
{
  if ((unint64_t)a3 > 0x16) {
    return 0;
  }
  else {
    return off_263FA2F80[a3];
  }
}

- (CAMClosedViewfinderControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMClosedViewfinderControllerDelegate *)WeakRetained;
}

- (void)_updateReferenceTimeToNowForEvent:(int64_t)a3
{
  [(CAMClosedViewfinderController *)self _setReferenceTime:CFAbsoluteTimeGetCurrent()];
  [(CAMClosedViewfinderController *)self _setReferenceTimeEvent:a3];
  [(CAMClosedViewfinderController *)self _scheduleLogWarningIfViewfinderStillClosedAfterDelay:3.0];
}

- (void)_scheduleLogWarningIfViewfinderStillClosedAfterDelay:(double)a3
{
  [(CAMClosedViewfinderController *)self _cancelDelayedLoggingForClosedViewfinder];
  [(CAMClosedViewfinderController *)self performSelector:sel__logWarningIfViewfinderStillClosed withObject:0 afterDelay:a3];
}

- (void)_cancelDelayedLoggingForClosedViewfinder
{
}

- (id)_descriptionForReasons:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    double v5 = [MEMORY[0x263EFF9C0] set];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __56__CAMClosedViewfinderController__descriptionForReasons___block_invoke;
    v21[3] = &unk_263FA2E88;
    id v22 = v5;
    v23 = self;
    id v6 = v5;
    [v4 enumerateObjectsUsingBlock:v21];
    v7 = [v6 allObjects];
    uint64_t v8 = [v7 sortedArrayUsingComparator:&__block_literal_global_17];

    uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x263F089D8]), "initWithString:", @"(");
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    __int16 v17 = __56__CAMClosedViewfinderController__descriptionForReasons___block_invoke_3;
    __int16 v18 = &unk_263FA2ED0;
    id v10 = v9;
    id v19 = v10;
    uint64_t v20 = v8;
    id v11 = v8;
    [v11 enumerateObjectsUsingBlock:&v15];
    [v10 appendString:@""], v15, v16, v17, v18);
    int v12 = v20;
    v13 = (__CFString *)v10;
  }
  else
  {
    v13 = &stru_26BD78BA0;
  }

  return v13;
}

void __56__CAMClosedViewfinderController__descriptionForReasons___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 integerValue];
  id v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) _descriptionStringForReason:v3];
  [v4 addObject:v5];
}

uint64_t __56__CAMClosedViewfinderController__descriptionForReasons___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)dealloc
{
  uint64_t v3 = +[CAMPriorityNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CAMClosedViewfinderController;
  [(CAMClosedViewfinderController *)&v4 dealloc];
}

- (BOOL)hasClosedViewfinderReason:(int64_t)a3
{
  objc_super v4 = [(CAMClosedViewfinderController *)self _reasonsForClosingViewfinder];
  id v5 = [NSNumber numberWithInteger:a3];
  char v6 = [v4 containsObject:v5];

  return v6;
}

- (void)_performDelayedRemovalOfReason:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(CAMClosedViewfinderController *)self _reasonsForClosingViewfinder];
    if ([v5 containsObject:v4])
    {
      uint64_t v6 = [v4 integerValue];
      v7 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = [(CAMClosedViewfinderController *)self _descriptionStringForReason:v6];
        int v9 = 138543362;
        id v10 = v8;
        _os_log_impl(&dword_2099F8000, v7, OS_LOG_TYPE_DEFAULT, "ClosedViewfinderController: Removing closed viewfinder reason %{public}@ since delay has passed", (uint8_t *)&v9, 0xCu);
      }
      [(CAMClosedViewfinderController *)self removeClosedViewfinderReason:v6];
    }
  }
}

- (void)_handleApplicationWillEnterForeground:(id)a3
{
  if (([(CAMClosedViewfinderController *)self _referenceTimeEvent] | 2) == 3)
  {
    [(CAMClosedViewfinderController *)self _updateReferenceTimeToNowForEvent:3];
  }
}

- (void)_logWarningIfViewfinderStillClosed
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if ([(CAMClosedViewfinderController *)self isViewfinderClosed])
  {
    uint64_t v3 = [(CAMClosedViewfinderController *)self delegate];
    if (v3)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      [(CAMClosedViewfinderController *)self _referenceTime];
      double v6 = Current - v5;
      v7 = [(CAMClosedViewfinderController *)self _descriptionStringForReferenceTimeEvent:[(CAMClosedViewfinderController *)self _referenceTimeEvent]];
      uint64_t v8 = [(CAMClosedViewfinderController *)self _reasonsForClosingViewfinder];
      int v9 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = [(CAMClosedViewfinderController *)self _descriptionForReasons:v8];
        int v11 = 134218498;
        double v12 = v6;
        __int16 v13 = 2114;
        __int16 v14 = v7;
        __int16 v15 = 2114;
        uint64_t v16 = v10;
        _os_log_impl(&dword_2099F8000, v9, OS_LOG_TYPE_DEFAULT, "ClosedViewfinderController: Viewfinder still closed %.3f seconds after %{public}@: %{public}@", (uint8_t *)&v11, 0x20u);
      }
      [(CAMClosedViewfinderController *)self _scheduleLogWarningIfViewfinderStillClosedAfterDelay:v6 * 0.5];
    }
    else
    {
      v7 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_2099F8000, v7, OS_LOG_TYPE_DEFAULT, "ClosedViewfinderController: Stopping logging of closed viewfinder because delegate is gone", (uint8_t *)&v11, 2u);
      }
    }
  }
}

uint64_t __56__CAMClosedViewfinderController__descriptionForReasons___block_invoke_3(uint64_t a1, uint64_t a2, unint64_t a3)
{
  [*(id *)(a1 + 32) appendString:a2];
  uint64_t result = [*(id *)(a1 + 40) count];
  if (result - 1 > a3)
  {
    double v6 = *(void **)(a1 + 32);
    return [v6 appendString:@", "];
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__reasonsForClosingViewfinder, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end