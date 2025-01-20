@interface AXUserEventTimer
+ (id)sharedInstance;
- (AXUserEventTimer)init;
- (BOOL)_canUseIdleTimerServices;
- (id)acquireAssertionToDisableIdleTimerWithReason:(id)a3;
- (void)_startTrackingPoorMansAssertion:(id)a3;
- (void)_stopTrackingPoorMansAssertion:(id)a3;
- (void)userEventOccurred;
@end

@implementation AXUserEventTimer

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_14);
  }
  v2 = (void *)sharedInstance_timer;

  return v2;
}

uint64_t __34__AXUserEventTimer_sharedInstance__block_invoke()
{
  sharedInstance_timer = objc_alloc_init(AXUserEventTimer);

  return MEMORY[0x1F41817F8]();
}

- (AXUserEventTimer)init
{
  v6.receiver = self;
  v6.super_class = (Class)AXUserEventTimer;
  v2 = [(AXUserEventTimer *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("AXUserEventTimer-AssertionQueue", 0);
    assertionQueue = v2->_assertionQueue;
    v2->_assertionQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (BOOL)_canUseIdleTimerServices
{
  if (AXInPreboardScenario()) {
    return 0;
  }
  dispatch_queue_t v3 = (void *)MEMORY[0x1E4F6F2E8];

  return [v3 isIdleTimerServiceAvailable];
}

- (void)userEventOccurred
{
  if ([(AXUserEventTimer *)self _canUseIdleTimerServices])
  {
    v2 = dispatch_get_global_queue(0, 0);
    dispatch_async(v2, &__block_literal_global_8_0);
  }
  else
  {
    v2 = +[AXBackBoardServer server];
    [v2 userEventOccurred];
  }
}

void __37__AXUserEventTimer_userEventOccurred__block_invoke()
{
  v0 = [MEMORY[0x1E4F6F2E8] sharedInstance];
  id v4 = 0;
  v1 = (void *)[v0 newAssertionToDisableIdleTimerForReason:@"AccessibilityUserEventOccurred" error:&v4];
  id v2 = v4;

  [v1 invalidate];
  if (v2)
  {
    dispatch_queue_t v3 = AXLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __37__AXUserEventTimer_userEventOccurred__block_invoke_cold_1((uint64_t)v2, v3);
    }
  }
}

- (void)_startTrackingPoorMansAssertion:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = AXLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v6 = [v4 reason];
    *(_DWORD *)buf = 138412290;
    v12 = v6;
    _os_log_impl(&dword_18D308000, v5, OS_LOG_TYPE_DEFAULT, "AXUserEventTimer: Now disabling idle timer for reason: %@", buf, 0xCu);
  }
  assertionQueue = self->_assertionQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__AXUserEventTimer__startTrackingPoorMansAssertion___block_invoke;
  v9[3] = &unk_1E5586470;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(assertionQueue, v9);
}

void __52__AXUserEventTimer__startTrackingPoorMansAssertion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) count];
  dispatch_queue_t v3 = *(void **)(*(void *)(a1 + 32) + 16);
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    uint64_t v5 = *(void *)(a1 + 32);
    objc_super v6 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v4;

    dispatch_queue_t v3 = *(void **)(*(void *)(a1 + 32) + 16);
  }
  [v3 addObject:*(void *)(a1 + 40)];
  if (!v2)
  {
    id v7 = +[AXBackBoardServer server];
    [v7 setLockScreenDimTimerEnabled:0];
  }
}

- (void)_stopTrackingPoorMansAssertion:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = AXLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v6 = [v4 reason];
    *(_DWORD *)buf = 138412290;
    v12 = v6;
    _os_log_impl(&dword_18D308000, v5, OS_LOG_TYPE_DEFAULT, "AXUserEventTimer: No longer disabling idle timer for reason: %@", buf, 0xCu);
  }
  assertionQueue = self->_assertionQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__AXUserEventTimer__stopTrackingPoorMansAssertion___block_invoke;
  v9[3] = &unk_1E5586470;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(assertionQueue, v9);
}

void __51__AXUserEventTimer__stopTrackingPoorMansAssertion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) count];
  [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
  if (v2 && ![*(id *)(*(void *)(a1 + 32) + 16) count])
  {
    id v3 = +[AXBackBoardServer server];
    [v3 setLockScreenDimTimerEnabled:1];
  }
}

- (id)acquireAssertionToDisableIdleTimerWithReason:(id)a3
{
  id v4 = a3;
  if (![(AXUserEventTimer *)self _canUseIdleTimerServices]) {
    goto LABEL_7;
  }
  uint64_t v5 = [MEMORY[0x1E4F6F2E8] sharedInstance];
  objc_super v6 = [NSString stringWithFormat:@"Accessibility-%@", v4];
  id v15 = 0;
  id v7 = (void *)[v5 newAssertionToDisableIdleTimerForReason:v6 error:&v15];
  id v8 = v15;

  if (v8)
  {
    v9 = AXLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      [(AXUserEventTimer *)(uint64_t)v8 acquireAssertionToDisableIdleTimerWithReason:v9];
    }
  }
  if (!v7)
  {
LABEL_7:
    objc_initWeak(&location, self);
    id v10 = objc_alloc(MEMORY[0x1E4F4F838]);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __65__AXUserEventTimer_acquireAssertionToDisableIdleTimerWithReason___block_invoke;
    v12[3] = &unk_1E55869E8;
    objc_copyWeak(&v13, &location);
    id v7 = (void *)[v10 initWithIdentifier:@"AccessibilityDisableIdleTimer" forReason:v4 invalidationBlock:v12];
    [(AXUserEventTimer *)self _startTrackingPoorMansAssertion:v7];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __65__AXUserEventTimer_acquireAssertionToDisableIdleTimerWithReason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _stopTrackingPoorMansAssertion:v3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertions, 0);

  objc_storeStrong((id *)&self->_assertionQueue, 0);
}

void __37__AXUserEventTimer_userEventOccurred__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 138412546;
  id v3 = @"AccessibilityUserEventOccurred";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_18D308000, a2, OS_LOG_TYPE_ERROR, "Error getting assertion %@ > %@", (uint8_t *)&v2, 0x16u);
}

- (void)acquireAssertionToDisableIdleTimerWithReason:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_18D308000, log, OS_LOG_TYPE_ERROR, "Error getting assertion %@ > %@", (uint8_t *)&v3, 0x16u);
}

@end