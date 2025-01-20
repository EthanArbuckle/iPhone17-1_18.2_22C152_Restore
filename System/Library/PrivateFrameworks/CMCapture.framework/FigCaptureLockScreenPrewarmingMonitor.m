@interface FigCaptureLockScreenPrewarmingMonitor
+ (void)initialize;
+ (void)start;
+ (void)stop;
- (BOOL)_shouldPrewarmForHostTime:(BOOL)result;
- (uint64_t)_startMonitoring;
- (void)_cancelDelayedPrewarmTimer;
- (void)_evaluatePrewarmingConditions;
- (void)_init;
- (void)_invalidate;
- (void)_prewarmAfterDelay:(uint64_t)a1;
- (void)_setIsPrewarming:(uint64_t)a1;
- (void)_stopMonitoring;
- (void)_updateActiveBiometricOperation:(uint64_t)a1;
- (void)_updateDeviceLockState;
- (void)dealloc;
- (void)layoutMonitor:(id)a3 didUpdateLayout:(id)a4;
@end

@implementation FigCaptureLockScreenPrewarmingMonitor

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

+ (void)start
{
  if (!sPrewarmingMonitor)
  {
    if (MGGetBoolAnswer()) {
      sPrewarmingMonitor = (uint64_t)-[FigCaptureLockScreenPrewarmingMonitor _init]([FigCaptureLockScreenPrewarmingMonitor alloc]);
    }
  }
}

- (void)_init
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v4.receiver = a1;
  v4.super_class = (Class)FigCaptureLockScreenPrewarmingMonitor;
  v1 = objc_msgSendSuper2(&v4, sel_init);
  if (v1)
  {
    v2 = FigDispatchQueueCreateWithPriority();
    v1[1] = v2;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __97__FigCaptureLockScreenPrewarmingMonitor__registerForBiometricEnrollmentChangesAndStartMonitoring__block_invoke;
    v5[3] = &unk_1E5C292D0;
    v5[4] = v1;
    *((_DWORD *)v1 + 4) = clspm_registerForNotifyName("com.apple.BiometricKit.enrollmentChanged", v2, (uint64_t)v5);
    v6 = @"ExtendedDeviceLockState";
    v7[0] = MEMORY[0x1E4F1CC38];
    v1[5] = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  }
  return v1;
}

+ (void)stop
{
  sPrewarmingMonitor = 0;
}

- (void)_invalidate
{
  if (a1)
  {
    int v2 = *(_DWORD *)(a1 + 16);
    if (v2)
    {
      notify_cancel(v2);
      *(_DWORD *)(a1 + 16) = 0;
      v3 = *(NSObject **)(a1 + 8);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __52__FigCaptureLockScreenPrewarmingMonitor__invalidate__block_invoke;
      block[3] = &unk_1E5C24430;
      block[4] = a1;
      dispatch_async(v3, block);
    }
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureLockScreenPrewarmingMonitor;
  [(FigCaptureLockScreenPrewarmingMonitor *)&v3 dealloc];
}

void __52__FigCaptureLockScreenPrewarmingMonitor__invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 20)) {
    -[FigCaptureLockScreenPrewarmingMonitor _stopMonitoring](v1);
  }
}

- (void)_stopMonitoring
{
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue()) {
      FigDebugAssert3();
    }
    int v2 = *(_DWORD *)(a1 + 48);
    if (v2)
    {
      notify_cancel(v2);
      *(void *)(a1 + 48) = 0;
      *(void *)(a1 + 56) = 0;
    }
    int v3 = *(_DWORD *)(a1 + 24);
    if (v3)
    {
      notify_cancel(v3);
      *(void *)(a1 + 24) = 0;
      *(void *)(a1 + 32) = 0;
    }
    if (*(unsigned char *)(a1 + 66))
    {
      objc_msgSend(+[FigCaptureDisplayLayoutMonitor sharedDisplayLayoutMonitor](FigCaptureDisplayLayoutMonitor, "sharedDisplayLayoutMonitor"), "removeLayoutObserver:", a1);
      *(unsigned char *)(a1 + 64) = 0;
      *(unsigned char *)(a1 + 66) = 0;
    }
    -[FigCaptureLockScreenPrewarmingMonitor _evaluatePrewarmingConditions](a1);
  }
}

- (uint64_t)_startMonitoring
{
  if (result)
  {
    uint64_t v1 = result;
    result = _FigIsCurrentDispatchQueue();
    if (!result) {
      result = FigDebugAssert3();
    }
    if (*(unsigned char *)(v1 + 20) && !*(_DWORD *)(v1 + 24) && !*(_DWORD *)(v1 + 48) && !*(unsigned char *)(v1 + 66))
    {
      int v2 = *(NSObject **)(v1 + 8);
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __57__FigCaptureLockScreenPrewarmingMonitor__startMonitoring__block_invoke;
      v5[3] = &unk_1E5C292D0;
      v5[4] = v1;
      *(_DWORD *)(v1 + 24) = clspm_registerForNotifyName("com.apple.BiometricKit.activeOperation", v2, (uint64_t)v5);
      int v3 = *(NSObject **)(v1 + 8);
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __57__FigCaptureLockScreenPrewarmingMonitor__startMonitoring__block_invoke_2;
      v4[3] = &unk_1E5C292D0;
      v4[4] = v1;
      *(_DWORD *)(v1 + 48) = clspm_registerForNotifyName("com.apple.mobile.keybagd.lock_status", v3, (uint64_t)v4);
      *(unsigned char *)(v1 + 65) = 1;
      result = objc_msgSend(+[FigCaptureDisplayLayoutMonitor sharedDisplayLayoutMonitor](FigCaptureDisplayLayoutMonitor, "sharedDisplayLayoutMonitor"), "addLayoutObserver:", v1);
      *(_WORD *)(v1 + 65) = 256;
    }
  }
  return result;
}

void __57__FigCaptureLockScreenPrewarmingMonitor__startMonitoring__block_invoke(uint64_t a1, int a2)
{
}

- (void)_updateActiveBiometricOperation:(uint64_t)a1
{
  if (a1)
  {
    int v3 = *(_DWORD *)(a1 + 28);
    if (v3 != a2)
    {
      *(_DWORD *)(a1 + 28) = a2;
      if (v3 == 2) {
        *(void *)(a1 + 32) = mach_absolute_time();
      }
      -[FigCaptureLockScreenPrewarmingMonitor _evaluatePrewarmingConditions](a1);
    }
  }
}

void __57__FigCaptureLockScreenPrewarmingMonitor__startMonitoring__block_invoke_2(uint64_t a1)
{
}

- (void)_updateDeviceLockState
{
  if (a1)
  {
    unsigned int v2 = MKBGetDeviceLockState();
    unsigned int v3 = *(_DWORD *)(a1 + 52);
    if (v2 != v3)
    {
      unsigned int v4 = v2;
      if (((v2 < 7) & (0x46u >> v2)) == 0 && v3 <= 6 && ((0x39u >> v3) & 1) == 0) {
        *(void *)(a1 + 56) = mach_absolute_time();
      }
      *(_DWORD *)(a1 + 52) = v4;
      -[FigCaptureLockScreenPrewarmingMonitor _evaluatePrewarmingConditions](a1);
    }
  }
}

- (void)_evaluatePrewarmingConditions
{
  if (a1)
  {
    mach_absolute_time();
    BOOL v2 = -[FigCaptureLockScreenPrewarmingMonitor _shouldPrewarmForHostTime:](a1);
    -[FigCaptureLockScreenPrewarmingMonitor _setIsPrewarming:](a1, v2);
  }
}

- (BOOL)_shouldPrewarmForHostTime:(BOOL)result
{
  if (result)
  {
    uint64_t v1 = result;
    if (!_FigIsCurrentDispatchQueue()) {
      FigDebugAssert3();
    }
    int v2 = *(unsigned __int8 *)(v1 + 67);
    int v3 = *(unsigned __int8 *)(v1 + 64);
    unsigned int v4 = *(_DWORD *)(v1 + 52);
    float v5 = (float)(FigHostTimeToNanoseconds() / 1000) / 1000000.0;
    int v6 = *(_DWORD *)(v1 + 28);
    uint64_t v7 = FigHostTimeToNanoseconds();
    result = 0;
    BOOL v9 = v5 < 0.5 || v2 != 0;
    if (v3 && ((v4 < 7) & (0x46u >> v4)) == 0 && v9) {
      return ((float)((float)(v7 / 1000) / 1000000.0) < 0.5 || v2 != 0) && v6 != 2;
    }
  }
  return result;
}

- (void)_setIsPrewarming:(uint64_t)a1
{
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue()) {
      FigDebugAssert3();
    }
    if (*(unsigned __int8 *)(a1 + 67) != a2)
    {
      *(unsigned char *)(a1 + 67) = a2;
      if (a2)
      {
        if (dword_1EB4C4FB0)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        -[FigCaptureLockScreenPrewarmingMonitor _prewarmAfterDelay:](a1, 0.25);
      }
      else
      {
        if (*(void *)(a1 + 72))
        {
          if (dword_1EB4C4FB0)
          {
            float v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          -[FigCaptureLockScreenPrewarmingMonitor _cancelDelayedPrewarmTimer](a1);
        }
        *(void *)(a1 + 56) = 0;
        *(void *)(a1 + 32) = 0;
      }
    }
  }
}

- (void)_prewarmAfterDelay:(uint64_t)a1
{
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue()) {
      FigDebugAssert3();
    }
    -[FigCaptureLockScreenPrewarmingMonitor _cancelDelayedPrewarmTimer](a1);
    unsigned int v4 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *(dispatch_queue_t *)(a1 + 8));
    dispatch_time_t v5 = dispatch_time(0, (uint64_t)(float)(a2 * 1000000000.0));
    dispatch_source_set_timer(v4, v5, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(a2 * 0.1 * 1000000000.0));
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __60__FigCaptureLockScreenPrewarmingMonitor__prewarmAfterDelay___block_invoke;
    handler[3] = &unk_1E5C24430;
    handler[4] = a1;
    dispatch_source_set_event_handler(v4, handler);
    *(void *)(a1 + 72) = v4;
    dispatch_activate(v4);
  }
}

- (void)_cancelDelayedPrewarmTimer
{
  if (a1)
  {
    int v2 = *(NSObject **)(a1 + 72);
    if (v2)
    {
      dispatch_source_cancel(v2);

      *(void *)(a1 + 72) = 0;
    }
  }
}

uint64_t __60__FigCaptureLockScreenPrewarmingMonitor__prewarmAfterDelay___block_invoke(uint64_t a1)
{
  if (dword_1EB4C4FB0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[FigCaptureLockScreenPrewarmingMonitor _cancelDelayedPrewarmTimer](*(void *)(a1 + 32));
  objc_msgSend(+[BWFigCaptureDeviceVendor sharedCaptureDeviceVendor](BWFigCaptureDeviceVendor, "sharedCaptureDeviceVendor"), "prewarmDefaultVideoDeviceForPID:completionHandler:", 0, &__block_literal_global_74);
  return -[FigCaptureLockScreenPrewarmingMonitor _setIsPrewarming:](*(void *)(a1 + 32), 0);
}

void __60__FigCaptureLockScreenPrewarmingMonitor__prewarmAfterDelay___block_invoke_29()
{
  if (dword_1EB4C4FB0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

void __97__FigCaptureLockScreenPrewarmingMonitor__registerForBiometricEnrollmentChangesAndStartMonitoring__block_invoke(uint64_t a1, uint64_t a2)
{
  int v2 = a2 != 0;
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned __int8 *)(v3 + 20) != v2)
  {
    *(unsigned char *)(v3 + 20) = v2;
    uint64_t v4 = *(void *)(a1 + 32);
    if (a2) {
      -[FigCaptureLockScreenPrewarmingMonitor _startMonitoring](v4);
    }
    else {
      -[FigCaptureLockScreenPrewarmingMonitor _stopMonitoring](v4);
    }
  }
}

- (void)layoutMonitor:(id)a3 didUpdateLayout:(id)a4
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v8 = __71__FigCaptureLockScreenPrewarmingMonitor_layoutMonitor_didUpdateLayout___block_invoke;
  BOOL v9 = &unk_1E5C24458;
  id v10 = a3;
  v11 = self;
  if (self->_addingLayoutObserver)
  {
    if (!_FigIsCurrentDispatchQueue()) {
      FigDebugAssert3();
    }
    v8((uint64_t)v7);
  }
  else
  {
    if (!_FigIsNotCurrentDispatchQueue()) {
      FigDebugAssert3();
    }
    notifyQueue = self->_notifyQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__FigCaptureLockScreenPrewarmingMonitor_layoutMonitor_didUpdateLayout___block_invoke_2;
    block[3] = &unk_1E5C24E50;
    block[4] = self;
    void block[5] = v7;
    dispatch_sync(notifyQueue, block);
  }
}

void __71__FigCaptureLockScreenPrewarmingMonitor_layoutMonitor_didUpdateLayout___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) isOnLockScreen];
  uint64_t v3 = *(void *)(a1 + 40);
  if (*(unsigned __int8 *)(v3 + 64) != v2)
  {
    *(unsigned char *)(v3 + 64) = v2;
    uint64_t v4 = *(void *)(a1 + 40);
    -[FigCaptureLockScreenPrewarmingMonitor _evaluatePrewarmingConditions](v4);
  }
}

uint64_t __71__FigCaptureLockScreenPrewarmingMonitor_layoutMonitor_didUpdateLayout___block_invoke_2(uint64_t result)
{
  if (*(unsigned char *)(*(void *)(result + 32) + 66)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 40) + 16))();
  }
  return result;
}

@end