@interface IMReasonTrackingUpdater
- (BOOL)hasPendingDeferredUpdate;
- (BOOL)isHoldingUpdates;
- (BOOL)isHoldingUpdatesForReason:(id)a3;
- (BOOL)needsUpdate;
- (IMReasonTrackingUpdater)initWithLogHandle:(id)a3;
- (IMReasonTrackingUpdater)initWithLogHandle:(id)a3 delegate:(id)a4;
- (IMReasonTrackingUpdaterDelegate)delegate;
- (NSCountedSet)reasonsForHoldingUpdates;
- (NSCountedSet)reasonsForNeedsUpdates;
- (OS_os_log)logHandle;
- (id)description;
- (int64_t)activeUpdaterHoldsCount;
- (void)_handleReasonsForHoldingUpdatesChangeForReason:(id)a3 updateTriggeredIfNotHeldShouldBeDeferred:(BOOL)a4;
- (void)_scheduleDeferredUpdateFollowingHoldForReason:(id)a3;
- (void)_triggerNeedsUpdateFollowingHoldForReason:(id)a3;
- (void)beginHoldingUpdatesForReason:(id)a3;
- (void)cancelAllPendingDeferredUpdates;
- (void)endAllHoldsOnUpdatesForReason:(id)a3 updateTriggeredIfNotHeldShouldBeDeferred:(BOOL)a4;
- (void)endHoldingUpdatesForAllReasonsWithPotentialUpdateDeferred:(BOOL)a3;
- (void)endHoldingUpdatesForReason:(id)a3 updateTriggeredIfNotHeldShouldBeDeferred:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setHasPendingDeferredUpdate:(BOOL)a3;
- (void)setLogHandle:(id)a3;
- (void)setNeedsDeferredUpdateWithReason:(id)a3;
- (void)setReasonsForHoldingUpdates:(id)a3;
- (void)setReasonsForNeedsUpdates:(id)a3;
- (void)updateImmediatelyIfNeeded;
- (void)updateImmediatelyWithReason:(id)a3;
@end

@implementation IMReasonTrackingUpdater

- (IMReasonTrackingUpdater)initWithLogHandle:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)IMReasonTrackingUpdater;
  v9 = [(IMReasonTrackingUpdater *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_logHandle, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    v11 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    reasonsForNeedsUpdates = v10->_reasonsForNeedsUpdates;
    v10->_reasonsForNeedsUpdates = v11;

    v13 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    reasonsForHoldingUpdates = v10->_reasonsForHoldingUpdates;
    v10->_reasonsForHoldingUpdates = v13;
  }
  return v10;
}

- (void)setNeedsDeferredUpdateWithReason:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  logHandle = self->_logHandle;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1A0772000, logHandle, OS_LOG_TYPE_INFO, "Deffered update needed for reason: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  [(NSCountedSet *)self->_reasonsForNeedsUpdates addObject:v4];
  [(IMReasonTrackingUpdater *)self _scheduleDeferredUpdateFollowingHoldForReason:0];
}

- (void)_triggerNeedsUpdateFollowingHoldForReason:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self->_hasPendingDeferredUpdate = 0;
  if ([(IMReasonTrackingUpdater *)self isHoldingUpdates])
  {
    logHandle = self->_logHandle;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
    {
      reasonsForHoldingUpdates = self->_reasonsForHoldingUpdates;
      int v14 = 138543362;
      v15 = reasonsForHoldingUpdates;
      id v7 = "Did not trigger an update because we are holding updates for reasons: %{public}@";
      uint64_t v8 = logHandle;
      uint32_t v9 = 12;
LABEL_10:
      _os_log_impl(&dword_1A0772000, v8, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v14, v9);
    }
  }
  else if ([(IMReasonTrackingUpdater *)self needsUpdate])
  {
    v10 = (NSCountedSet *)[(NSCountedSet *)self->_reasonsForNeedsUpdates copy];
    [(NSCountedSet *)self->_reasonsForNeedsUpdates removeAllObjects];
    v11 = self->_logHandle;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v14 = 138543618;
      v15 = v10;
      __int16 v16 = 2114;
      id v17 = v4;
      _os_log_impl(&dword_1A0772000, v11, OS_LOG_TYPE_INFO, "Triggering an update for reasons: %{public}@ following hold for reason: %{public}@", (uint8_t *)&v14, 0x16u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained reasonTrackingUpdater:self needsUpdateForReasons:v10 followingHoldForReason:v4];
  }
  else
  {
    v13 = self->_logHandle;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LOWORD(v14) = 0;
      id v7 = "Did not trigger an update because there was no pending update reason";
      uint64_t v8 = v13;
      uint32_t v9 = 2;
      goto LABEL_10;
    }
  }
}

- (BOOL)needsUpdate
{
  return [(NSCountedSet *)self->_reasonsForNeedsUpdates count] != 0;
}

- (void)_scheduleDeferredUpdateFollowingHoldForReason:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(IMReasonTrackingUpdater *)self isHoldingUpdates])
  {
    logHandle = self->_logHandle;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
    {
      reasonsForHoldingUpdates = self->_reasonsForHoldingUpdates;
      int v14 = 138543362;
      v15 = reasonsForHoldingUpdates;
      id v7 = "Did not schedule a deferred update because we are stil holding updates for reasons: %{public}@";
      uint64_t v8 = logHandle;
      uint32_t v9 = 12;
LABEL_7:
      _os_log_impl(&dword_1A0772000, v8, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v14, v9);
    }
  }
  else
  {
    BOOL hasPendingDeferredUpdate = self->_hasPendingDeferredUpdate;
    v11 = self->_logHandle;
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
    if (hasPendingDeferredUpdate)
    {
      if (v12)
      {
        LOWORD(v14) = 0;
        id v7 = "Already have a pending deffered update, not necessary to schedule an additional deferred update";
        uint64_t v8 = v11;
        uint32_t v9 = 2;
        goto LABEL_7;
      }
    }
    else
    {
      if (v12)
      {
        reasonsForNeedsUpdates = self->_reasonsForNeedsUpdates;
        int v14 = 138543618;
        v15 = reasonsForNeedsUpdates;
        __int16 v16 = 2114;
        id v17 = v4;
        _os_log_impl(&dword_1A0772000, v11, OS_LOG_TYPE_INFO, "Scheduling a deffered update for reasons: %{public}@ following hold for reason: %{public}@", (uint8_t *)&v14, 0x16u);
      }
      self->_BOOL hasPendingDeferredUpdate = 1;
      [(IMReasonTrackingUpdater *)self performSelector:sel__triggerNeedsUpdateFollowingHoldForReason_ withObject:v4 afterDelay:0.0];
    }
  }
}

- (BOOL)isHoldingUpdates
{
  return [(NSCountedSet *)self->_reasonsForHoldingUpdates count] != 0;
}

- (void)endAllHoldsOnUpdatesForReason:(id)a3 updateTriggeredIfNotHeldShouldBeDeferred:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  NSUInteger v7 = [(NSCountedSet *)self->_reasonsForHoldingUpdates countForObject:v6];
  if (v7)
  {
    NSUInteger v8 = v7;
    do
    {
      [(NSCountedSet *)self->_reasonsForHoldingUpdates removeObject:v6];
      --v8;
    }
    while (v8);
  }
  logHandle = self->_logHandle;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    reasonsForHoldingUpdates = self->_reasonsForHoldingUpdates;
    int v11 = 138543618;
    id v12 = v6;
    __int16 v13 = 2114;
    int v14 = reasonsForHoldingUpdates;
    _os_log_impl(&dword_1A0772000, logHandle, OS_LOG_TYPE_INFO, "End all holds on updates for reason %{public}@ remaining hold reasons: %{public}@", (uint8_t *)&v11, 0x16u);
  }
  [(IMReasonTrackingUpdater *)self _handleReasonsForHoldingUpdatesChangeForReason:v6 updateTriggeredIfNotHeldShouldBeDeferred:v4];
}

- (IMReasonTrackingUpdaterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IMReasonTrackingUpdaterDelegate *)WeakRetained;
}

- (void)beginHoldingUpdatesForReason:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(IMReasonTrackingUpdater *)self isHoldingUpdates];
  [(NSCountedSet *)self->_reasonsForHoldingUpdates addObject:v4];
  logHandle = self->_logHandle;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    reasonsForHoldingUpdates = self->_reasonsForHoldingUpdates;
    int v9 = 138543618;
    id v10 = v4;
    __int16 v11 = 2114;
    id v12 = reasonsForHoldingUpdates;
    _os_log_impl(&dword_1A0772000, logHandle, OS_LOG_TYPE_INFO, "Begin holding updates for reason %{public}@ allHoldReasons: %{public}@", (uint8_t *)&v9, 0x16u);
  }
  if (!v5)
  {
    NSUInteger v8 = [(IMReasonTrackingUpdater *)self delegate];
    [v8 reasonTrackingUpdater:self didBeginHoldingUpdatesWithInitialReason:v4];
  }
}

- (void)_handleReasonsForHoldingUpdatesChangeForReason:(id)a3 updateTriggeredIfNotHeldShouldBeDeferred:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (![(IMReasonTrackingUpdater *)self isHoldingUpdates])
  {
    NSUInteger v7 = [(IMReasonTrackingUpdater *)self delegate];
    [v7 reasonTrackingUpdater:self didEndHoldingUpdatesWithFinalReason:v6];

    if ([(IMReasonTrackingUpdater *)self needsUpdate])
    {
      if (v4) {
        [(IMReasonTrackingUpdater *)self _scheduleDeferredUpdateFollowingHoldForReason:v6];
      }
      else {
        [(IMReasonTrackingUpdater *)self _triggerNeedsUpdateFollowingHoldForReason:v6];
      }
    }
    else
    {
      logHandle = self->_logHandle;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int v9 = 0;
        _os_log_impl(&dword_1A0772000, logHandle, OS_LOG_TYPE_INFO, "There are no remaining holds on updates, but an update is not currently needed.", v9, 2u);
      }
    }
  }
}

- (IMReasonTrackingUpdater)initWithLogHandle:(id)a3
{
  return (IMReasonTrackingUpdater *)MEMORY[0x1F4181798](self, sel_initWithLogHandle_delegate_);
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)IMReasonTrackingUpdater;
  BOOL v4 = [(IMReasonTrackingUpdater *)&v7 description];
  BOOL v5 = [v3 stringWithFormat:@"%@ reasonsForNeedsUpdates: %@ reasonsForHoldingUpdates: %@", v4, self->_reasonsForNeedsUpdates, self->_reasonsForHoldingUpdates];

  return v5;
}

- (int64_t)activeUpdaterHoldsCount
{
  return [(NSCountedSet *)self->_reasonsForHoldingUpdates count];
}

- (BOOL)isHoldingUpdatesForReason:(id)a3
{
  return [(NSCountedSet *)self->_reasonsForHoldingUpdates countForObject:a3] != 0;
}

- (void)updateImmediatelyWithReason:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  logHandle = self->_logHandle;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1A0772000, logHandle, OS_LOG_TYPE_INFO, "Immediate update needed for reason: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  [(NSCountedSet *)self->_reasonsForNeedsUpdates addObject:v4];
  [(IMReasonTrackingUpdater *)self _triggerNeedsUpdateFollowingHoldForReason:0];
}

- (void)updateImmediatelyIfNeeded
{
}

- (void)endHoldingUpdatesForReason:(id)a3 updateTriggeredIfNotHeldShouldBeDeferred:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(NSCountedSet *)self->_reasonsForHoldingUpdates removeObject:v6];
  logHandle = self->_logHandle;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    reasonsForHoldingUpdates = self->_reasonsForHoldingUpdates;
    int v9 = 138543618;
    id v10 = v6;
    __int16 v11 = 2114;
    id v12 = reasonsForHoldingUpdates;
    _os_log_impl(&dword_1A0772000, logHandle, OS_LOG_TYPE_INFO, "End holding updates for reason %{public}@ remaining hold reasons: %{public}@", (uint8_t *)&v9, 0x16u);
  }
  [(IMReasonTrackingUpdater *)self _handleReasonsForHoldingUpdatesChangeForReason:v6 updateTriggeredIfNotHeldShouldBeDeferred:v4];
}

- (void)endHoldingUpdatesForAllReasonsWithPotentialUpdateDeferred:(BOOL)a3
{
  BOOL v3 = a3;
  p_reasonsForHoldingUpdates = (uint64_t *)&self->_reasonsForHoldingUpdates;
  if ([(NSCountedSet *)self->_reasonsForHoldingUpdates count])
  {
    logHandle = self->_logHandle;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR)) {
      sub_1A09F0840(p_reasonsForHoldingUpdates, logHandle);
    }
    id v7 = [(NSCountedSet *)self->_reasonsForHoldingUpdates anyObject];
    [(NSCountedSet *)self->_reasonsForHoldingUpdates removeAllObjects];
    [(IMReasonTrackingUpdater *)self _handleReasonsForHoldingUpdatesChangeForReason:v7 updateTriggeredIfNotHeldShouldBeDeferred:v3];
  }
}

- (void)cancelAllPendingDeferredUpdates
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->_hasPendingDeferredUpdate)
  {
    self->_BOOL hasPendingDeferredUpdate = 0;
    BOOL v3 = (void *)[(NSCountedSet *)self->_reasonsForNeedsUpdates copy];
    [(NSCountedSet *)self->_reasonsForNeedsUpdates removeAllObjects];
    logHandle = self->_logHandle;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
    {
      int v5 = 138543362;
      id v6 = v3;
      _os_log_impl(&dword_1A0772000, logHandle, OS_LOG_TYPE_INFO, "Cancelling pending deferred update for reasons %{public}@. Update was already triggered externally.", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (OS_os_log)logHandle
{
  return self->_logHandle;
}

- (void)setLogHandle:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (NSCountedSet)reasonsForNeedsUpdates
{
  return self->_reasonsForNeedsUpdates;
}

- (void)setReasonsForNeedsUpdates:(id)a3
{
}

- (NSCountedSet)reasonsForHoldingUpdates
{
  return self->_reasonsForHoldingUpdates;
}

- (void)setReasonsForHoldingUpdates:(id)a3
{
}

- (BOOL)hasPendingDeferredUpdate
{
  return self->_hasPendingDeferredUpdate;
}

- (void)setHasPendingDeferredUpdate:(BOOL)a3
{
  self->_BOOL hasPendingDeferredUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reasonsForHoldingUpdates, 0);
  objc_storeStrong((id *)&self->_reasonsForNeedsUpdates, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_logHandle, 0);
}

@end