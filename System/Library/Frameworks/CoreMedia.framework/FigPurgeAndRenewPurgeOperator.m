@interface FigPurgeAndRenewPurgeOperator
+ (id)operatorForClientPID:(int)a3 notificationQueue:(id)a4 withPurgeBlock:(id)a5;
- (BOOL)isProcessStateSuspended;
- (BOOL)purgeSuspended;
- (BOOL)setPurgeSuspended:(BOOL)a3;
- (id)_initWithClientPID:(int)a3 withPurgeBlock:(id)a4 notificationQueue:(id)a5;
- (unsigned)getPurgeTimeoutSeconds;
- (void)_setTimeoutBeforePurge:(unsigned int)a3;
- (void)checkAppStateAndPurgeObjectsBasedOnSuspensionTime:(int64_t)a3;
- (void)dealloc;
- (void)handleProcessIsNoLongerSuspendedOnQueue;
- (void)handleprocessDidSuspendOnQueue;
- (void)hintProcessMayNeedPurgeTimerRestart;
- (void)processDidSuspend;
- (void)processDidTerminate;
- (void)processIsNoLongerSuspended;
- (void)restartPurgeTimerIfNecessary;
@end

@implementation FigPurgeAndRenewPurgeOperator

+ (id)operatorForClientPID:(int)a3 notificationQueue:(id)a4 withPurgeBlock:(id)a5
{
  v5 = (void *)[objc_alloc((Class)a1) _initWithClientPID:*(void *)&a3 withPurgeBlock:a5 notificationQueue:a4];

  return v5;
}

- (id)_initWithClientPID:(int)a3 withPurgeBlock:(id)a4 notificationQueue:(id)a5
{
  unsigned int v9 = FigNote_AllowInternalDefaultLogs() != 0;
  fig_note_initialize_category_with_default_work_cf((uint64_t)&gFigPurgeAndRenewProcessStateTracker[1], @"processtatetracker_trace", @"com.apple.coremedia", (uint64_t)", (uint64_t)"com.apple.coremedia"", v9, 0, gFigPurgeAndRenewProcessStateTracker);
  fig_note_initialize_category_with_default_work_cf((uint64_t)&dword_1E9272DB8, @"processtatetracker_trace", @"com.apple.coremedia", (uint64_t)", (uint64_t)"com.apple.coremedia"", 1u, 0, &qword_1E9272DB0);
  v13.receiver = self;
  v13.super_class = (Class)FigPurgeAndRenewPurgeOperator;
  v10 = [(FigPurgeAndRenewPurgeOperator *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_clientPID = a3;
    v10->_queue = (OS_dispatch_queue *)a5;
    dispatch_retain((dispatch_object_t)a5);
    v11->_purgeBlock = (id)[a4 copy];
    v11->_isSuspended = 0;
    v11->_lastSuspensionTimeNs = 0;
    v11->_purgeTimeoutSeconds = FigGetCFPreferenceNumberWithDefault(@"purge_timeout_seconds", @"com.apple.coremedia", 600);
    *(_WORD *)&v11->_purgeSuspended = 0;
  }
  return v11;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_queue);
  v3.receiver = self;
  v3.super_class = (Class)FigPurgeAndRenewPurgeOperator;
  [(FigPurgeAndRenewPurgeOperator *)&v3 dealloc];
}

- (void)checkAppStateAndPurgeObjectsBasedOnSuspensionTime:(int64_t)a3
{
  if (self->_isSuspended && !self->_purgeSuspended && self->_lastSuspensionTimeNs == a3)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    (*((void (**)(void))self->_purgeBlock + 2))();
    *(_WORD *)&self->_purgeSuspended = 256;
  }
}

- (void)_setTimeoutBeforePurge:(unsigned int)a3
{
  self->_purgeTimeoutSeconds = a3;
}

- (unsigned)getPurgeTimeoutSeconds
{
  return self->_purgeTimeoutSeconds;
}

- (void)restartPurgeTimerIfNecessary
{
  location[16] = *(id *)MEMORY[0x1E4F143B8];
  if (dword_1E9272DB8)
  {
    int v21 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type((uint64_t *)qword_1E9272DB0, 1, &v21, &type);
    int v4 = v21;
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type)) {
      unsigned int v6 = v4;
    }
    else {
      unsigned int v6 = v4 & 0xFFFFFFFE;
    }
    if (v6)
    {
      int clientPID = self->_clientPID;
      int v22 = 136315650;
      v23 = "-[FigPurgeAndRenewPurgeOperator restartPurgeTimerIfNecessary]";
      __int16 v24 = 1024;
      int v25 = clientPID;
      __int16 v26 = 2048;
      v27 = self;
      v8 = (id *)_os_log_send_and_compose_impl();
      LOBYTE(v4) = v21;
    }
    else
    {
      v8 = 0;
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose((uint64_t *)qword_1E9272DB0, 1u, 1, v8, v8 != location, v4, 0, v5);
  }
  if (self->_purgeSuspended)
  {
    if (dword_1E9272DB8)
    {
      int v21 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      unsigned int v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type((uint64_t *)qword_1E9272DB0, 1, &v21, &type);
      int v10 = v21;
      if (os_log_type_enabled(v9, type)) {
        unsigned int v12 = v10;
      }
      else {
        unsigned int v12 = v10 & 0xFFFFFFFE;
      }
      if (v12)
      {
        int v13 = self->_clientPID;
        int v22 = 136315650;
        v23 = "-[FigPurgeAndRenewPurgeOperator restartPurgeTimerIfNecessary]";
        __int16 v24 = 1024;
        int v25 = v13;
        __int16 v26 = 2048;
        v27 = self;
        v14 = (id *)_os_log_send_and_compose_impl();
        LOBYTE(v10) = v21;
      }
      else
      {
        v14 = 0;
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose((uint64_t *)qword_1E9272DB0, 1u, 1, v14, v14 != location, v10, 0, v11);
    }
  }
  else
  {
    objc_initWeak(location, self);
    lastSuspensionTimeNs = (void *)self->_lastSuspensionTimeNs;
    dispatch_time_t v16 = dispatch_time(0x8000000000000000, 1000000000 * self->_purgeTimeoutSeconds);
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__FigPurgeAndRenewPurgeOperator_restartPurgeTimerIfNecessary__block_invoke;
    block[3] = &unk_1E5676438;
    objc_copyWeak(v19, location);
    v19[1] = lastSuspensionTimeNs;
    dispatch_after(v16, queue, block);
    objc_destroyWeak(v19);
    objc_destroyWeak(location);
  }
}

id __61__FigPurgeAndRenewPurgeOperator_restartPurgeTimerIfNecessary__block_invoke(uint64_t a1)
{
  id result = objc_loadWeak((id *)(a1 + 32));
  if (result)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    return (id)[result checkAppStateAndPurgeObjectsBasedOnSuspensionTime:v3];
  }
  return result;
}

- (void)handleprocessDidSuspendOnQueue
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (dword_1E9272DB8)
  {
    v10[0] = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type((uint64_t *)qword_1E9272DB0, 1, v10, &type);
    int v4 = v10[0];
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type)) {
      unsigned int v6 = v4;
    }
    else {
      unsigned int v6 = v4 & 0xFFFFFFFE;
    }
    if (v6)
    {
      int clientPID = self->_clientPID;
      v10[1] = 136315394;
      uint64_t v11 = "-[FigPurgeAndRenewPurgeOperator handleprocessDidSuspendOnQueue]";
      __int16 v12 = 1024;
      int v13 = clientPID;
      v8 = (char *)_os_log_send_and_compose_impl();
      LOBYTE(v4) = v10[0];
    }
    else
    {
      v8 = 0;
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose((uint64_t *)qword_1E9272DB0, 1u, 1, v8, v8 != &v14, v4, 0, v5);
  }
  self->_isSuspended = 1;
  self->_lastSuspensionTimeNs = FigGetUpTimeNanoseconds();
  [(FigPurgeAndRenewPurgeOperator *)self restartPurgeTimerIfNecessary];
}

- (void)processDidSuspend
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__FigPurgeAndRenewPurgeOperator_processDidSuspend__block_invoke;
  block[3] = &unk_1E5676460;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __50__FigPurgeAndRenewPurgeOperator_processDidSuspend__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleprocessDidSuspendOnQueue];
}

- (void)handleProcessIsNoLongerSuspendedOnQueue
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (dword_1E9272DB8)
  {
    v10[0] = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type((uint64_t *)qword_1E9272DB0, 1, v10, &type);
    int v4 = v10[0];
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type)) {
      unsigned int v6 = v4;
    }
    else {
      unsigned int v6 = v4 & 0xFFFFFFFE;
    }
    if (v6)
    {
      int clientPID = self->_clientPID;
      v10[1] = 136315394;
      uint64_t v11 = "-[FigPurgeAndRenewPurgeOperator handleProcessIsNoLongerSuspendedOnQueue]";
      __int16 v12 = 1024;
      int v13 = clientPID;
      v8 = (char *)_os_log_send_and_compose_impl();
      LOBYTE(v4) = v10[0];
    }
    else
    {
      v8 = 0;
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose((uint64_t *)qword_1E9272DB0, 1u, 1, v8, v8 != &v14, v4, 0, v5);
  }
  self->_isSuspended = 0;
  self->_lastSuspensionTimeNs = 0;
}

- (void)processIsNoLongerSuspended
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__FigPurgeAndRenewPurgeOperator_processIsNoLongerSuspended__block_invoke;
  block[3] = &unk_1E5676460;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __59__FigPurgeAndRenewPurgeOperator_processIsNoLongerSuspended__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleProcessIsNoLongerSuspendedOnQueue];
}

- (void)processDidTerminate
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (dword_1E9272DB8)
  {
    int v13 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type((uint64_t *)qword_1E9272DB0, 1, &v13, &type);
    int v4 = v13;
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type)) {
      unsigned int v6 = v4;
    }
    else {
      unsigned int v6 = v4 & 0xFFFFFFFE;
    }
    if (v6)
    {
      int clientPID = self->_clientPID;
      int v14 = 136315394;
      uint64_t v15 = "-[FigPurgeAndRenewPurgeOperator processDidTerminate]";
      __int16 v16 = 1024;
      int v17 = clientPID;
      LODWORD(v11) = 18;
      int v10 = &v14;
      v8 = (char *)_os_log_send_and_compose_impl();
      LOBYTE(v4) = v13;
    }
    else
    {
      v8 = 0;
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose((uint64_t *)qword_1E9272DB0, 1u, 1, v8, v8 != &v18, v4, 0, v5);
  }
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28EA0], "notificationWithName:object:userInfo:", @"FigProcessStateTrackerClientProcessIsTerminated", self, 0, v10, v11);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotification:", v9);
}

- (BOOL)setPurgeSuspended:(BOOL)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v20 = 0;
  int v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  self->_purgeSuspended = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__FigPurgeAndRenewPurgeOperator_setPurgeSuspended___block_invoke;
  block[3] = &unk_1E5676488;
  void block[4] = self;
  void block[5] = &v20;
  BOOL v19 = a3;
  dispatch_sync(queue, block);
  int v6 = *((unsigned __int8 *)v21 + 24);
  if (*((unsigned char *)v21 + 24) && !a3)
  {
    if (dword_1E9272DB8)
    {
      int v17 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type((uint64_t *)qword_1E9272DB0, 1, &v17, &type);
      int v8 = v17;
      if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type)) {
        unsigned int v10 = v8;
      }
      else {
        unsigned int v10 = v8 & 0xFFFFFFFE;
      }
      if (v10)
      {
        int v24 = 136315138;
        int v25 = "-[FigPurgeAndRenewPurgeOperator setPurgeSuspended:]";
        LODWORD(v15) = 12;
        int v14 = &v24;
        uint64_t v11 = (char *)_os_log_send_and_compose_impl();
        LOBYTE(v8) = v17;
      }
      else
      {
        uint64_t v11 = 0;
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose((uint64_t *)qword_1E9272DB0, 1u, 1, v11, v11 != &v26, v8, 0, v9);
    }
    [(FigPurgeAndRenewPurgeOperator *)self hintProcessMayNeedPurgeTimerRestart];
    int v6 = *((unsigned __int8 *)v21 + 24);
  }
  BOOL v12 = v6 != 0;
  _Block_object_dispose(&v20, 8);
  return v12;
}

uint64_t __51__FigPurgeAndRenewPurgeOperator_setPurgeSuspended___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 10)) {
    BOOL v2 = 0;
  }
  else {
    BOOL v2 = *(unsigned __int8 *)(v1 + 9) == *(unsigned __int8 *)(result + 48);
  }
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = v2;
  return result;
}

- (BOOL)purgeSuspended
{
  return self->_purgeSuspended || !self->_isSuspended;
}

- (BOOL)isProcessStateSuspended
{
  return self->_isSuspended;
}

- (void)hintProcessMayNeedPurgeTimerRestart
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__FigPurgeAndRenewPurgeOperator_hintProcessMayNeedPurgeTimerRestart__block_invoke;
  block[3] = &unk_1E5676460;
  void block[4] = self;
  dispatch_async(queue, block);
}

unsigned char *__68__FigPurgeAndRenewPurgeOperator_hintProcessMayNeedPurgeTimerRestart__block_invoke(uint64_t a1)
{
  id result = *(unsigned char **)(a1 + 32);
  if (result[8]) {
    return (unsigned char *)[result restartPurgeTimerIfNecessary];
  }
  return result;
}

@end