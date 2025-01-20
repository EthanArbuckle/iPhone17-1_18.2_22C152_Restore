@interface BRCStateUpdateCoalescer
- (BOOL)_cancelAndReleaseUpdateTimerIfExists;
- (BRCStateUpdateCoalescer)initWithCallbackQueue:(id)a3 timerMinDelay:(double)a4 timerMaxDelay:(double)a5 stableStateMinThreshold:(double)a6;
- (double)timerDelay;
- (void)_setupCoalesceUpdateTimerWithUtilityHandlerBlock:(id)a3;
- (void)reset;
- (void)updateStateWithCoalescing:(id)a3 oldState:(BOOL)a4 newState:(BOOL)a5;
@end

@implementation BRCStateUpdateCoalescer

- (BRCStateUpdateCoalescer)initWithCallbackQueue:(id)a3 timerMinDelay:(double)a4 timerMaxDelay:(double)a5 stableStateMinThreshold:(double)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BRCStateUpdateCoalescer;
  v12 = [(BRCStateUpdateCoalescer *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_callbackQueue, a3);
    v13->_timerDelay = a4;
    v13->_timerMinDelay = a4;
    v13->_timerMaxDelay = a5;
    v13->_stableStateMinThreshold = a6;
  }

  return v13;
}

- (void)reset
{
  [(BRCStateUpdateCoalescer *)self _cancelAndReleaseUpdateTimerIfExists];
  self->_timerDelay = self->_timerMinDelay;
  lastCompletedTimer = self->_lastCompletedTimer;
  self->_lastCompletedTimer = 0;
}

- (BOOL)_cancelAndReleaseUpdateTimerIfExists
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  coalesceUpdateTimer = self->_coalesceUpdateTimer;
  if (coalesceUpdateTimer)
  {
    dispatch_source_cancel((dispatch_source_t)self->_coalesceUpdateTimer);
    v4 = self->_coalesceUpdateTimer;
    self->_coalesceUpdateTimer = 0;
  }
  return coalesceUpdateTimer != 0;
}

- (void)_setupCoalesceUpdateTimerWithUtilityHandlerBlock:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  [(BRCStateUpdateCoalescer *)self _cancelAndReleaseUpdateTimerIfExists];
  if (self->_coalesceUpdateTimer)
  {
    v19 = brc_bread_crumbs();
    v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      -[BRCStateUpdateCoalescer _setupCoalesceUpdateTimerWithUtilityHandlerBlock:]((uint64_t)v19, v20, v21, v22, v23, v24, v25, v26);
    }
  }
  v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_callbackQueue);
  coalesceUpdateTimer = self->_coalesceUpdateTimer;
  self->_coalesceUpdateTimer = v5;

  int64_t v7 = (unint64_t)(self->_timerDelay * 1000000000.0);
  v8 = self->_coalesceUpdateTimer;
  dispatch_time_t v9 = dispatch_time(0, v7);
  dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, v7 / 10);
  v10 = self->_coalesceUpdateTimer;
  id v11 = self->_coalesceUpdateTimer;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __76__BRCStateUpdateCoalescer__setupCoalesceUpdateTimerWithUtilityHandlerBlock___block_invoke;
  v27[3] = &unk_1E69946C8;
  v27[4] = self;
  v12 = v10;
  v28 = v12;
  id v13 = v4;
  id v29 = v13;
  v14 = v11;
  objc_super v15 = v27;
  v16 = v15;
  v17 = v15;
  if (*MEMORY[0x1E4F59658])
  {
    v17 = ((void (*)(void *))*MEMORY[0x1E4F59658])(v15);
  }
  dispatch_block_t v18 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v17);
  dispatch_source_set_event_handler(v14, v18);

  dispatch_resume((dispatch_object_t)self->_coalesceUpdateTimer);
}

intptr_t __76__BRCStateUpdateCoalescer__setupCoalesceUpdateTimerWithUtilityHandlerBlock___block_invoke(void *a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1[4] + 8));
  v2 = a1[5];
  intptr_t result = dispatch_source_testcancel(v2);
  if (!result)
  {
    if (v2 != *(NSObject **)(a1[4] + 16))
    {
      dispatch_time_t v9 = brc_bread_crumbs();
      v10 = brc_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        __76__BRCStateUpdateCoalescer__setupCoalesceUpdateTimerWithUtilityHandlerBlock___block_invoke_cold_1((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] now];
    uint64_t v5 = a1[4];
    v6 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v4;

    dispatch_source_cancel(*(dispatch_source_t *)(a1[4] + 16));
    uint64_t v7 = a1[4];
    v8 = *(void **)(v7 + 16);
    *(void *)(v7 + 16) = 0;

    return (*(uint64_t (**)(void))(a1[6] + 16))();
  }
  return result;
}

- (void)updateStateWithCoalescing:(id)a3 oldState:(BOOL)a4 newState:(BOOL)a5
{
  BOOL v6 = a4;
  v8 = (void (**)(void))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  if (a5)
  {
    if (v6)
    {
      if (self->_coalesceUpdateTimer)
      {
        uint64_t v15 = brc_bread_crumbs();
        uint64_t v16 = brc_default_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
          -[BRCStateUpdateCoalescer updateStateWithCoalescing:oldState:newState:]((uint64_t)v15, v16, v17, v18, v19, v20, v21, v22);
        }
      }
      v8[2](v8);
    }
    else
    {
      [(BRCStateUpdateCoalescer *)self _setupCoalesceUpdateTimerWithUtilityHandlerBlock:v8];
    }
    goto LABEL_14;
  }
  BOOL v9 = [(BRCStateUpdateCoalescer *)self _cancelAndReleaseUpdateTimerIfExists];
  v8[2](v8);
  if (!v6) {
    goto LABEL_9;
  }
  if (!self->_lastCompletedTimer
    || ([MEMORY[0x1E4F1C9C8] now],
        v10 = objc_claimAutoreleasedReturnValue(),
        [v10 timeIntervalSinceDate:self->_lastCompletedTimer],
        double v12 = v11,
        double stableStateMinThreshold = self->_stableStateMinThreshold,
        v10,
        v12 >= stableStateMinThreshold))
  {
    self->_timerDelay = self->_timerMinDelay;
LABEL_9:
    if (!v9) {
      goto LABEL_14;
    }
  }
  double timerMaxDelay = self->_timerDelay + self->_timerDelay;
  if (timerMaxDelay >= self->_timerMaxDelay) {
    double timerMaxDelay = self->_timerMaxDelay;
  }
  self->_timerDelay = timerMaxDelay;
LABEL_14:
}

- (double)timerDelay
{
  return self->_timerDelay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastCompletedTimer, 0);
  objc_storeStrong((id *)&self->_coalesceUpdateTimer, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

- (void)_setupCoalesceUpdateTimerWithUtilityHandlerBlock:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __76__BRCStateUpdateCoalescer__setupCoalesceUpdateTimerWithUtilityHandlerBlock___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D353B000, a2, a3, "[CRIT] Assertion failed: coalesceUpdateTimer == self->_coalesceUpdateTimer Expecting same address%@", a5, a6, a7, a8, 2u);
}

- (void)updateStateWithCoalescing:(uint64_t)a3 oldState:(uint64_t)a4 newState:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end