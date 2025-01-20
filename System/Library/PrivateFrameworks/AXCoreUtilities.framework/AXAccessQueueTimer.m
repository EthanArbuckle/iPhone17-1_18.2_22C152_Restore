@interface AXAccessQueueTimer
+ (id)timerTargettingMainAccessQueue;
- (AXAccessQueue)accessQueue;
- (AXAccessQueueTimer)init;
- (AXAccessQueueTimer)initWithTargetAccessQueue:(id)a3;
- (BOOL)accessQueueIsExternal;
- (BOOL)automaticallyCancelPendingBlockUponSchedulingNewBlock;
- (BOOL)isActive;
- (BOOL)isPending;
- (NSString)description;
- (NSString)label;
- (OS_dispatch_source)dispatchTimer;
- (int)state;
- (void)_afterDelay:(double)a3 processBlock:(id)a4 shouldTreatAsWritingBlock:(BOOL)a5;
- (void)_didFinishProcessingBlock;
- (void)_performEnqueuedWritingBlock:(id)a3 asynchronousExecutionWarningHandler:(SEL)a4;
- (void)_reallyCancel;
- (void)_warnAboutAsynchronousCancelling;
- (void)_warnAboutAsynchronousScheduling;
- (void)afterDelay:(double)a3 processReadingBlock:(id)a4;
- (void)afterDelay:(double)a3 processWritingBlock:(id)a4;
- (void)cancel;
- (void)dealloc;
- (void)setAccessQueue:(id)a3;
- (void)setAccessQueueIsExternal:(BOOL)a3;
- (void)setActive:(BOOL)a3;
- (void)setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:(BOOL)a3;
- (void)setDispatchTimer:(id)a3;
- (void)setLabel:(id)a3;
- (void)setState:(int)a3;
@end

@implementation AXAccessQueueTimer

+ (id)timerTargettingMainAccessQueue
{
  id v2 = objc_alloc((Class)a1);
  v3 = +[AXAccessQueue mainAccessQueue];
  v4 = (void *)[v2 initWithTargetAccessQueue:v3];

  return v4;
}

- (AXAccessQueueTimer)init
{
  return [(AXAccessQueueTimer *)self initWithTargetAccessQueue:0];
}

- (AXAccessQueueTimer)initWithTargetAccessQueue:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXAccessQueueTimer;
  v5 = [(AXAccessQueueTimer *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(AXAccessQueueTimer *)v5 setState:0];
    if (v4)
    {
      [(AXAccessQueueTimer *)v6 setAccessQueue:v4];
      [(AXAccessQueueTimer *)v6 setAccessQueueIsExternal:1];
    }
    else
    {
      v7 = [[AXAccessQueue alloc] initWithParentClass:objc_opt_class() description:@"TimerAccessQueue" appendUUIDToLabel:1];
      if (v7)
      {
        [(AXAccessQueueTimer *)v6 setAccessQueue:v7];
      }
      else
      {

        v6 = 0;
      }
    }
  }

  return v6;
}

- (void)dealloc
{
  v3 = [(AXAccessQueueTimer *)self accessQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__AXAccessQueueTimer_dealloc__block_invoke;
  v5[3] = &unk_1E5672590;
  v5[4] = self;
  [v3 performSynchronousWritingBlock:v5];

  v4.receiver = self;
  v4.super_class = (Class)AXAccessQueueTimer;
  [(AXAccessQueueTimer *)&v4 dealloc];
}

uint64_t __29__AXAccessQueueTimer_dealloc__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reallyCancel];
}

- (BOOL)isPending
{
  return [(AXAccessQueueTimer *)self state] == 1;
}

- (void)_performEnqueuedWritingBlock:(id)a3 asynchronousExecutionWarningHandler:(SEL)a4
{
  id v7 = a3;
  v6 = [(AXAccessQueueTimer *)self accessQueue];
  if ([v6 canOnlyReadInCurrentExecutionThread])
  {
    if (objc_opt_respondsToSelector()) {
      ((void (*)(AXAccessQueueTimer *, SEL))[(AXAccessQueueTimer *)self methodForSelector:a4])(self, a4);
    }
    [v6 performAsynchronousWritingBlock:v7];
  }
  else
  {
    [v6 performSynchronousWritingBlock:v7];
  }
}

- (void)afterDelay:(double)a3 processReadingBlock:(id)a4
{
}

- (void)afterDelay:(double)a3 processWritingBlock:(id)a4
{
}

- (void)_afterDelay:(double)a3 processBlock:(id)a4 shouldTreatAsWritingBlock:(BOOL)a5
{
  id v8 = a4;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy_;
  v13[4] = __Block_byref_object_dispose_;
  id v14 = (id)[v8 copy];
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__4;
  v11[4] = __Block_byref_object_dispose__5;
  v12 = self;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__AXAccessQueueTimer__afterDelay_processBlock_shouldTreatAsWritingBlock___block_invoke;
  v9[3] = &unk_1E5672728;
  *(double *)&v9[6] = a3;
  BOOL v10 = a5;
  v9[4] = v11;
  v9[5] = v13;
  [(AXAccessQueueTimer *)v12 _performEnqueuedWritingBlock:v9 asynchronousExecutionWarningHandler:sel__warnAboutAsynchronousScheduling];
  _Block_object_dispose(v11, 8);

  _Block_object_dispose(v13, 8);
}

void __73__AXAccessQueueTimer__afterDelay_processBlock_shouldTreatAsWritingBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  if ([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) automaticallyCancelPendingBlockUponSchedulingNewBlock]&& objc_msgSend(*(id *)(*(void *)(*(void *)v2 + 8) + 40), "state"))
  {
    [*(id *)(*(void *)(*(void *)v2 + 8) + 40) _reallyCancel];
  }
  if ([*(id *)(*(void *)(*(void *)v2 + 8) + 40) state])
  {
    v3 = AXLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      __73__AXAccessQueueTimer__afterDelay_processBlock_shouldTreatAsWritingBlock___block_invoke_cold_1(v2, a1, v3);
    }
  }
  else
  {
    [*(id *)(*(void *)(*(void *)v2 + 8) + 40) setState:1];
    v3 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, 0);
    if (v3)
    {
      dispatch_time_t v4 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 48) * 1000000000.0));
      dispatch_source_set_timer(v3, v4, 0xFFFFFFFFFFFFFFFFLL, 0);
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __73__AXAccessQueueTimer__afterDelay_processBlock_shouldTreatAsWritingBlock___block_invoke_2;
      handler[3] = &unk_1E5672700;
      char v12 = *(unsigned char *)(a1 + 56);
      long long v11 = *(_OWORD *)(a1 + 32);
      dispatch_source_set_event_handler(v3, handler);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __73__AXAccessQueueTimer__afterDelay_processBlock_shouldTreatAsWritingBlock___block_invoke_4;
      v9[3] = &unk_1E56725B8;
      v9[4] = *(void *)(a1 + 32);
      dispatch_source_set_cancel_handler(v3, v9);
      dispatch_resume(v3);
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setDispatchTimer:v3];
    }
    else
    {
      uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
      v6 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = 0;

      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
      id v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = 0;
    }
  }
}

void __73__AXAccessQueueTimer__afterDelay_processBlock_shouldTreatAsWritingBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) accessQueue];
  if (!v2)
  {
    v3 = AXLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      __73__AXAccessQueueTimer__afterDelay_processBlock_shouldTreatAsWritingBlock___block_invoke_2_cold_1(v3);
    }
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __73__AXAccessQueueTimer__afterDelay_processBlock_shouldTreatAsWritingBlock___block_invoke_6;
  v5[3] = &unk_1E56726D8;
  char v8 = *(unsigned char *)(a1 + 48);
  long long v7 = *(_OWORD *)(a1 + 32);
  id v6 = v2;
  id v4 = v2;
  [v4 performSynchronousWritingBlock:v5];
}

void __73__AXAccessQueueTimer__afterDelay_processBlock_shouldTreatAsWritingBlock___block_invoke_6(uint64_t a1)
{
  if ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) state] == 1)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) _reallyCancel];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setState:2];
    int v2 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v3 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) isActive];
    if (v2)
    {
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setActive:1];
      (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) + 16))();
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setActive:v3];
      id v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      [v4 _didFinishProcessingBlock];
    }
    else
    {
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setActive:1];
      uint64_t v5 = *(void **)(a1 + 32);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __73__AXAccessQueueTimer__afterDelay_processBlock_shouldTreatAsWritingBlock___block_invoke_2_7;
      v8[3] = &unk_1E56726B0;
      uint64_t v10 = *(void *)(a1 + 48);
      id v6 = v5;
      uint64_t v7 = *(void *)(a1 + 40);
      id v9 = v6;
      uint64_t v11 = v7;
      char v12 = v3;
      [v6 performAsynchronousReadingBlock:v8];
    }
  }
}

uint64_t __73__AXAccessQueueTimer__afterDelay_processBlock_shouldTreatAsWritingBlock___block_invoke_2_7(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 16))();
  int v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __73__AXAccessQueueTimer__afterDelay_processBlock_shouldTreatAsWritingBlock___block_invoke_3;
  v4[3] = &unk_1E5672688;
  v4[4] = *(void *)(a1 + 48);
  char v5 = *(unsigned char *)(a1 + 56);
  return [v2 performAsynchronousWritingBlock:v4];
}

uint64_t __73__AXAccessQueueTimer__afterDelay_processBlock_shouldTreatAsWritingBlock___block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setActive:*(unsigned __int8 *)(a1 + 40)];
  int v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  return [v2 _didFinishProcessingBlock];
}

void __73__AXAccessQueueTimer__afterDelay_processBlock_shouldTreatAsWritingBlock___block_invoke_4(uint64_t a1)
{
  v1 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) accessQueue];
  if (!v1)
  {
    int v2 = AXLogCommon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
      __73__AXAccessQueueTimer__afterDelay_processBlock_shouldTreatAsWritingBlock___block_invoke_2_cold_1(v2);
    }
  }
}

- (void)_didFinishProcessingBlock
{
  v1 = [a1 accessQueue];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_18FC6C000, v2, v3, "Can't wrap up processing of %@ unless running within a writing block of %@.", v4, v5, v6, v7, v8);
}

- (void)_warnAboutAsynchronousScheduling
{
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  sel_getName(a2);
  uint64_t v6 = [a1 accessQueue];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_18FC6C000, v7, v8, "Can't schedule timer %@ synchronously; scheduling it asynchronously instead. To avoid this, break on -[%@ %s], find "
    "the call site initiating a reading block onto %@, and change that to a writing block.",
    v9,
    v10,
    v11,
    v12,
    v13);
}

- (void)cancel
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __28__AXAccessQueueTimer_cancel__block_invoke;
  v2[3] = &unk_1E5672590;
  v2[4] = self;
  [(AXAccessQueueTimer *)self _performEnqueuedWritingBlock:v2 asynchronousExecutionWarningHandler:sel__warnAboutAsynchronousCancelling];
}

uint64_t __28__AXAccessQueueTimer_cancel__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reallyCancel];
}

- (void)_reallyCancel
{
  v1 = [a1 accessQueue];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_18FC6C000, v2, v3, "Can't actually cancel %@ unless running within a writing block of %@.", v4, v5, v6, v7, v8);
}

- (void)_warnAboutAsynchronousCancelling
{
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  sel_getName(a2);
  uint64_t v6 = [a1 accessQueue];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_18FC6C000, v7, v8, "Can't cancel timer %@ synchronously; cancelling it asynchronously instead. To avoid this, break on -[%@ %s], find th"
    "e call site initiating a reading block onto %@, and change that to a writing block.",
    v9,
    v10,
    v11,
    v12,
    v13);
}

- (NSString)description
{
  unsigned int v3 = [(AXAccessQueueTimer *)self state];
  if (v3 > 3) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = off_1E5672748[v3];
  }
  uint64_t v5 = [(AXAccessQueueTimer *)self label];
  uint64_t v6 = NSString;
  uint64_t v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v7);
  if (v5) {
    uint64_t v9 = @"; label = \"";
  }
  else {
    uint64_t v9 = &stru_1EDF601D0;
  }
  if (v5) {
    uint64_t v10 = v5;
  }
  else {
    uint64_t v10 = &stru_1EDF601D0;
  }
  if (v5) {
    uint64_t v11 = @"\"";
  }
  else {
    uint64_t v11 = &stru_1EDF601D0;
  }
  if ([(AXAccessQueueTimer *)self isActive]) {
    uint64_t v12 = @"YES";
  }
  else {
    uint64_t v12 = @"NO";
  }
  BOOL v13 = [(AXAccessQueueTimer *)self automaticallyCancelPendingBlockUponSchedulingNewBlock];
  id v14 = @"; automaticallyCancelPendingBlockUponSchedulingNewBlock = YES";
  if (!v13) {
    id v14 = &stru_1EDF601D0;
  }
  objc_msgSend(v6, "stringWithFormat:", @"<%@: %p%@%@%@; state = %@; active = %@%@>",
    v8,
    self,
    v9,
    v10,
    v11,
    v4,
    v12,
  v15 = v14);

  return (NSString *)v15;
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLabel:(id)a3
{
}

- (BOOL)automaticallyCancelPendingBlockUponSchedulingNewBlock
{
  return self->_automaticallyCancelPendingBlockUponSchedulingNewBlock;
}

- (void)setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:(BOOL)a3
{
  self->_automaticallyCancelPendingBlockUponSchedulingNewBlock = a3;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (AXAccessQueue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
}

- (BOOL)accessQueueIsExternal
{
  return self->_accessQueueIsExternal;
}

- (void)setAccessQueueIsExternal:(BOOL)a3
{
  self->_accessQueueIsExternal = a3;
}

- (OS_dispatch_source)dispatchTimer
{
  return self->_dispatchTimer;
}

- (void)setDispatchTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchTimer, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

void __73__AXAccessQueueTimer__afterDelay_processBlock_shouldTreatAsWritingBlock___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void **)(*(void *)(*(void *)a1 + 8) + 40);
  uint64_t v6 = *(void *)(a2 + 48);
  uint64_t v7 = &stru_1EDF601D0;
  if ([v5 accessQueueIsExternal]) {
    uint64_t v8 = @" on access queue: ";
  }
  else {
    uint64_t v8 = &stru_1EDF601D0;
  }
  int v9 = [*(id *)(*(void *)(*(void *)a1 + 8) + 40) accessQueueIsExternal];
  if (v9)
  {
    uint64_t v7 = [*(id *)(*(void *)(*(void *)a1 + 8) + 40) accessQueue];
  }
  int v10 = 138413058;
  uint64_t v11 = v5;
  __int16 v12 = 2048;
  uint64_t v13 = v6;
  __int16 v14 = 2112;
  v15 = v8;
  __int16 v16 = 2112;
  v17 = v7;
  _os_log_fault_impl(&dword_18FC6C000, a3, OS_LOG_TYPE_FAULT, "%@: Attempted to schedule new block for execution %.2f seconds from now%@%@ onto a timer that already has a pending block; ignoring new block. Please consider whether you should call -cancel before scheduling this block.",
    (uint8_t *)&v10,
    0x2Au);
  if (v9) {
}
  }

void __73__AXAccessQueueTimer__afterDelay_processBlock_shouldTreatAsWritingBlock___block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18FC6C000, log, OS_LOG_TYPE_FAULT, "Timer unexpectedly deallocated early or what??", v1, 2u);
}

@end