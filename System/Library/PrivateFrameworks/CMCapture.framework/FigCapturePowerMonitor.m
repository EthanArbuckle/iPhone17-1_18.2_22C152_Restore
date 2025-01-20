@interface FigCapturePowerMonitor
+ (void)initialize;
- (FigCapturePowerMonitor)init;
- (float)maxTorchLevel;
- (uint64_t)_powerNotification:(uint64_t)result;
- (unsigned)powerPressureLevel;
- (void)dealloc;
- (void)setPowerHandler:(id)a3;
@end

@implementation FigCapturePowerMonitor

- (float)maxTorchLevel
{
  pthread_mutex_lock((pthread_mutex_t *)self->_lock);
  float maxTorchLevel = self->_maxTorchLevel;
  pthread_mutex_unlock((pthread_mutex_t *)self->_lock);
  return maxTorchLevel;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (FigCapturePowerMonitor)init
{
  v10.receiver = self;
  v10.super_class = (Class)FigCapturePowerMonitor;
  id v2 = [(FigCapturePowerMonitor *)&v10 init];
  if (v2)
  {
    uint64_t v3 = FigSimpleMutexCreate();
    *((void *)v2 + 4) = v3;
    if (!v3) {
      goto LABEL_7;
    }
    *((_DWORD *)v2 + 4) = -1;
    *((_DWORD *)v2 + 10) = 1065353216;
    uint64_t v4 = FigDispatchQueueCreateWithPriority();
    *((void *)v2 + 1) = v4;
    if (!v4) {
      goto LABEL_7;
    }
    id v5 = +[FigWeakReference weakReferenceToObject:v2];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __30__FigCapturePowerMonitor_init__block_invoke;
    handler[3] = &unk_1E5C25910;
    handler[4] = v5;
    if (!notify_register_dispatch("com.apple.system.peakpowerpressurelevel", (int *)v2 + 4, *((dispatch_queue_t *)v2 + 1), handler))
    {
      v6 = *((void *)v2 + 1);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __30__FigCapturePowerMonitor_init__block_invoke_2;
      block[3] = &unk_1E5C25238;
      block[4] = v2;
      block[5] = handler;
      dispatch_sync(v6, block);
    }
    else
    {
LABEL_7:
      FigDebugAssert3();

      return 0;
    }
  }
  return (FigCapturePowerMonitor *)v2;
}

void __30__FigCapturePowerMonitor_init__block_invoke(uint64_t a1, int a2)
{
  uint64_t v4 = (void *)MEMORY[0x1A6272C70]();
  uint64_t state64 = 0;
  if (!notify_get_state(a2, &state64))
  {
    uint64_t v5 = [*(id *)(a1 + 32) referencedObject];
    -[FigCapturePowerMonitor _powerNotification:](v5, state64);
  }
}

- (uint64_t)_powerNotification:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    if (dword_1EB4C50F0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    pthread_mutex_lock(*(pthread_mutex_t **)(v3 + 32));
    *(_DWORD *)(v3 + 44) = a2;
    if (a2 <= 0x1D) {
      float v5 = 1.0;
    }
    else {
      float v5 = 0.0;
    }
    float v6 = *(float *)(v3 + 40);
    *(float *)(v3 + 40) = v5;
    result = pthread_mutex_unlock(*(pthread_mutex_t **)(v3 + 32));
    if (v5 != v6)
    {
      if (dword_1EB4C50F0)
      {
        v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      result = *(void *)(v3 + 24);
      if (result) {
        return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v3);
      }
    }
  }
  return result;
}

uint64_t __30__FigCapturePowerMonitor_init__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned int *)(*(void *)(a1 + 32) + 16));
}

- (void)setPowerHandler:(id)a3
{
  self->_torchHandler = (id)[a3 copy];
}

- (void)dealloc
{
  int registrationToken = self->_registrationToken;
  if ((registrationToken & 0x80000000) == 0) {
    notify_cancel(registrationToken);
  }

  FigSimpleMutexDestroy();
  v4.receiver = self;
  v4.super_class = (Class)FigCapturePowerMonitor;
  [(FigCapturePowerMonitor *)&v4 dealloc];
}

- (unsigned)powerPressureLevel
{
  pthread_mutex_lock((pthread_mutex_t *)self->_lock);
  unsigned int powerPressureLevel = self->_powerPressureLevel;
  pthread_mutex_unlock((pthread_mutex_t *)self->_lock);
  return powerPressureLevel;
}

@end