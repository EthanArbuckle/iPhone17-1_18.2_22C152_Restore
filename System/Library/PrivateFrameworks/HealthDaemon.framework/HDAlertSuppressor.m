@interface HDAlertSuppressor
- (HDAlertSuppressor)initWithDaemon:(id)a3;
- (id)createAndTakeAssertionForOwnerIdentifier:(id)a3 processBundleIdentifier:(id)a4;
- (void)_invalidateSuppressActivityAlertsForSuspendedProcess:(uint64_t)a1;
- (void)_queue_clearSuppressionTimerForAssertion:(uint64_t)a1;
- (void)_queue_suppressActivityAlertsForProcessIdentifier:(uint64_t)a1;
- (void)assertionManager:(id)a3 assertionInvalidated:(id)a4;
- (void)assertionManager:(id)a3 assertionTaken:(id)a4;
- (void)dealloc;
- (void)processDidEnterBackground:(id)a3;
- (void)processDidEnterForeground:(id)a3;
- (void)processResumed:(id)a3;
- (void)processSuspended:(id)a3;
- (void)processTerminated:(id)a3;
@end

@implementation HDAlertSuppressor

- (HDAlertSuppressor)initWithDaemon:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HDAlertSuppressor;
  v5 = [(HDAlertSuppressor *)&v14 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_daemon, v4);
    uint64_t v7 = HKCreateSerialDispatchQueue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    v9 = (HDAssertionManager *)objc_alloc_init(MEMORY[0x1E4F65CD0]);
    assertionManager = v6->_assertionManager;
    v6->_assertionManager = v9;

    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    waitingForSuspension = v6->_waitingForSuspension;
    v6->_waitingForSuspension = v11;

    [(HDAssertionManager *)v6->_assertionManager addObserver:v6 forAssertionIdentifier:@"HDWorkoutSessionAssertionIdentifierAlertSuppression" queue:v6->_queue];
  }

  return v6;
}

- (void)dealloc
{
  [(HDAssertionManager *)self->_assertionManager removeObserver:self forAssertionIdentifier:@"HDWorkoutSessionAssertionIdentifierAlertSuppression"];
  v3.receiver = self;
  v3.super_class = (Class)HDAlertSuppressor;
  [(HDAlertSuppressor *)&v3 dealloc];
}

- (id)createAndTakeAssertionForOwnerIdentifier:(id)a3 processBundleIdentifier:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    id v7 = a3;
    v8 = [_HDAlertSuppressorAssertion alloc];
    id v9 = v6;
    if (v8)
    {
      v15.receiver = v8;
      v15.super_class = (Class)_HDAlertSuppressorAssertion;
      v8 = [(HDAlertSuppressor *)&v15 initWithAssertionIdentifier:@"HDWorkoutSessionAssertionIdentifierAlertSuppression" ownerIdentifier:v7];
      if (v8)
      {
        uint64_t v10 = [v9 copy];
        processBundleIdentifier = v8->_processBundleIdentifier;
        v8->_processBundleIdentifier = (NSString *)v10;
      }
    }

    if ([(HDAssertionManager *)self->_assertionManager takeAssertion:v8]) {
      v12 = v8;
    }
    else {
      v12 = 0;
    }
    v13 = v12;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)assertionManager:(id)a3 assertionTaken:(id)a4
{
  v25[2] = *(id *)MEMORY[0x1E4F143B8];
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"HDAlertSuppressor.m", 98, @"Invalid parameter not satisfying: %@", @"[assertion isKindOfClass:[_HDAlertSuppressorAssertion class]]" object file lineNumber description];
  }
  id v7 = v6;
  v8 = v7;
  if (v7) {
    id v9 = (void *)*((void *)v7 + 10);
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;
  _HKInitializeLogging();
  v11 = (os_log_t *)MEMORY[0x1E4F29FB8];
  v12 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEBUG))
  {
    LODWORD(handler) = 138412290;
    *(void *)((char *)&handler + 4) = v10;
    _os_log_debug_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_DEBUG, "Alert suppressor starting for workout client: %@", (uint8_t *)&handler, 0xCu);
  }
  -[HDAlertSuppressor _queue_clearSuppressionTimerForAssertion:]((uint64_t)self, v8);
  if ([(NSMutableSet *)self->_waitingForSuspension containsObject:v10])
  {
    _HKInitializeLogging();
    v13 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(handler) = 138412290;
      *(void *)((char *)&handler + 4) = v10;
      _os_log_debug_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_DEBUG, "Starting an alert suppression again for app for which we were waiting to go to background: %@", (uint8_t *)&handler, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
    objc_super v15 = [WeakRetained processStateManager];
    [v15 unregisterObserver:self forBundleIdentifier:v10];

    [(NSMutableSet *)self->_waitingForSuspension removeObject:v10];
  }
  -[HDAlertSuppressor _queue_suppressActivityAlertsForProcessIdentifier:]((uint64_t)self, v10);
  id v16 = v10;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_initWeak(&location, self);
  v17 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_queue);
  dispatch_source_set_timer(v17, 0, 0x8BB2C97000uLL, 0xDF8475800uLL);
  *(void *)&long long handler = MEMORY[0x1E4F143A8];
  *((void *)&handler + 1) = 3221225472;
  v22 = __75__HDAlertSuppressor__queue_startAlertSuppressionTimerForProcessIdentifier___block_invoke;
  v23 = &unk_1E62F74E0;
  id v18 = v16;
  id v24 = v18;
  objc_copyWeak(v25, &location);
  dispatch_source_set_event_handler(v17, &handler);
  dispatch_resume(v17);
  objc_destroyWeak(v25);

  objc_destroyWeak(&location);
  -[_HDAlertSuppressorAssertion setKeepaliveTimer:]((uint64_t)v8, v17);
}

- (void)_queue_clearSuppressionTimerForAssertion:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    if (v4)
    {
      objc_super v3 = v4[11];
      if (v3)
      {
        dispatch_source_cancel(v3);
        -[_HDAlertSuppressorAssertion setKeepaliveTimer:]((uint64_t)v4, 0);
      }
    }
  }
}

- (void)_queue_suppressActivityAlertsForProcessIdentifier:(uint64_t)a1
{
  if (a1)
  {
    objc_super v3 = *(NSObject **)(a1 + 16);
    id v4 = a2;
    dispatch_assert_queue_V2(v3);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    v5 = [WeakRetained alertSuppressionService];
    id v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:3600.0];
    [v5 suppressActivityAlertsForIdentifier:v4 suppressionReason:0 timeoutUntilDate:v6];
  }
}

- (void)assertionManager:(id)a3 assertionInvalidated:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"HDAlertSuppressor.m", 117, @"Invalid parameter not satisfying: %@", @"[assertion isKindOfClass:[_HDAlertSuppressorAssertion class]]" object file lineNumber description];
  }
  id v7 = v6;
  _HKInitializeLogging();
  v8 = (void *)*MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEBUG))
  {
    if (v7) {
      uint64_t v15 = v7[10];
    }
    else {
      uint64_t v15 = 0;
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v19 = v15;
    id v16 = v8;
    _os_log_debug_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_DEBUG, "Alert suppressor stopping for workout client: %@", buf, 0xCu);
  }
  -[HDAlertSuppressor _queue_clearSuppressionTimerForAssertion:]((uint64_t)self, v7);
  if (v7) {
    id v9 = (void *)v7[10];
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v10)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
    v12 = [WeakRetained processStateManager];

    if ([v12 isApplicationStateForegroundForBundleIdentifier:v10])
    {
      [v12 registerObserver:self forBundleIdentifier:v10];
      [(NSMutableSet *)self->_waitingForSuspension addObject:v10];
    }
    else
    {
      id v13 = objc_loadWeakRetained((id *)&self->_daemon);
      objc_super v14 = [v13 alertSuppressionService];
      [v14 invalidateActivityAlertSuppressionForIdentifier:v10];
    }
  }
}

void __75__HDAlertSuppressor__queue_startAlertSuppressionTimerForProcessIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v2 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1BCB7D000, v2, OS_LOG_TYPE_INFO, "Periodic alert suppression for workout client: %@", (uint8_t *)&v5, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  -[HDAlertSuppressor _queue_suppressActivityAlertsForProcessIdentifier:]((uint64_t)WeakRetained, *(void **)(a1 + 32));
}

- (void)processSuspended:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  int v5 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_debug_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEBUG, "Activity alert suppression. Suspended: %@", (uint8_t *)&v6, 0xCu);
  }
  -[HDAlertSuppressor _invalidateSuppressActivityAlertsForSuspendedProcess:]((uint64_t)self, v4);
}

- (void)_invalidateSuppressActivityAlertsForSuspendedProcess:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    int v5 = *(NSObject **)(a1 + 16);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __74__HDAlertSuppressor__invalidateSuppressActivityAlertsForSuspendedProcess___block_invoke;
    v6[3] = &unk_1E62F31C0;
    id v7 = v3;
    uint64_t v8 = a1;
    dispatch_async(v5, v6);
  }
}

- (void)processTerminated:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  int v5 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_debug_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEBUG, "Activity alert suppression. Terminated: %@", (uint8_t *)&v6, 0xCu);
  }
  -[HDAlertSuppressor _invalidateSuppressActivityAlertsForSuspendedProcess:]((uint64_t)self, v4);
}

- (void)processDidEnterBackground:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  int v5 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_debug_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEBUG, "Activity alert suppression. Background: %@", (uint8_t *)&v6, 0xCu);
  }
  -[HDAlertSuppressor _invalidateSuppressActivityAlertsForSuspendedProcess:]((uint64_t)self, v4);
}

- (void)processResumed:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  _HKInitializeLogging();
  id v4 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEBUG))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_debug_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEBUG, "Activity alert suppression. Resumed: %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)processDidEnterForeground:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  _HKInitializeLogging();
  id v4 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEBUG))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_debug_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEBUG, "Activity alert suppression. Foreground: %@", (uint8_t *)&v5, 0xCu);
  }
}

uint64_t __74__HDAlertSuppressor__invalidateSuppressActivityAlertsForSuspendedProcess___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v2 = (os_log_t *)MEMORY[0x1E4F29FB8];
  id v3 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v12 = 138412290;
    uint64_t v13 = v4;
    _os_log_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_INFO, "Invalidating activity alert suppression after process %@ was suspended", (uint8_t *)&v12, 0xCu);
  }
  if (([*(id *)(*(void *)(a1 + 40) + 32) containsObject:*(void *)(a1 + 32)] & 1) == 0)
  {
    _HKInitializeLogging();
    int v5 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v12 = 138543362;
      uint64_t v13 = v11;
      _os_log_error_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_ERROR, "Invalidating activity alert supression for wrong bundle identifier. received: %{public}@", (uint8_t *)&v12, 0xCu);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
  uint64_t v7 = [WeakRetained alertSuppressionService];
  [v7 invalidateActivityAlertSuppressionForIdentifier:*(void *)(a1 + 32)];

  id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
  id v9 = [v8 processStateManager];
  [v9 unregisterObserver:*(void *)(a1 + 40) forBundleIdentifier:*(void *)(a1 + 32)];

  return [*(id *)(*(void *)(a1 + 40) + 32) removeObject:*(void *)(a1 + 32)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitingForSuspension, 0);
  objc_storeStrong((id *)&self->_assertionManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_daemon);
}

@end