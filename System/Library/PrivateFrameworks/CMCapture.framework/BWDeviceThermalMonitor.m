@interface BWDeviceThermalMonitor
+ (void)initialize;
- (BWDeviceThermalMonitor)init;
- (int)thermalLevel;
- (uint64_t)_thermalNotification:(uint64_t)result;
- (void)dealloc;
- (void)setThermalHandler:(id)a3;
@end

@implementation BWDeviceThermalMonitor

- (int)thermalLevel
{
  pthread_mutex_lock((pthread_mutex_t *)self->_thermalNotificationLock);
  int thermalLevel = self->_thermalLevel;
  pthread_mutex_unlock((pthread_mutex_t *)self->_thermalNotificationLock);
  return thermalLevel;
}

- (void)setThermalHandler:(id)a3
{
  self->_thermalHandler = (id)[a3 copy];
}

- (BWDeviceThermalMonitor)init
{
  v10.receiver = self;
  v10.super_class = (Class)BWDeviceThermalMonitor;
  id v2 = [(BWDeviceThermalMonitor *)&v10 init];
  if (v2)
  {
    uint64_t v3 = FigSimpleMutexCreate();
    *((void *)v2 + 4) = v3;
    if (!v3) {
      goto LABEL_7;
    }
    *((_DWORD *)v2 + 4) = -1;
    uint64_t v4 = FigDispatchQueueCreateWithPriority();
    *((void *)v2 + 1) = v4;
    if (!v4) {
      goto LABEL_7;
    }
    id v5 = +[FigWeakReference weakReferenceToObject:v2];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __30__BWDeviceThermalMonitor_init__block_invoke;
    handler[3] = &unk_1E5C25910;
    handler[4] = v5;
    if (!notify_register_dispatch((const char *)*MEMORY[0x1E4F14910], (int *)v2 + 4, *((dispatch_queue_t *)v2 + 1), handler))
    {
      v6 = *((void *)v2 + 1);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __30__BWDeviceThermalMonitor_init__block_invoke_2;
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
  return (BWDeviceThermalMonitor *)v2;
}

void __30__BWDeviceThermalMonitor_init__block_invoke(uint64_t a1, int a2)
{
  uint64_t v4 = (void *)MEMORY[0x1A6272C70]();
  uint64_t state64 = 0;
  if (!notify_get_state(a2, &state64))
  {
    uint64_t v5 = [*(id *)(a1 + 32) referencedObject];
    -[BWDeviceThermalMonitor _thermalNotification:](v5, state64);
  }
}

- (uint64_t)_thermalNotification:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    pthread_mutex_lock(*(pthread_mutex_t **)(result + 32));
    if (a2 <= 4) {
      int v4 = a2 > 1;
    }
    else {
      int v4 = 2;
    }
    if (a2 <= 9) {
      int v5 = v4;
    }
    else {
      int v5 = 3;
    }
    int v6 = *(_DWORD *)(v3 + 40);
    if (v5 > v6) {
      *(_DWORD *)(v3 + 40) = v5;
    }
    result = pthread_mutex_unlock(*(pthread_mutex_t **)(v3 + 32));
    if (v5 > v6)
    {
      result = *(void *)(v3 + 24);
      if (result)
      {
        if (dword_1E96B6A48)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          result = *(void *)(v3 + 24);
        }
        return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v3);
      }
    }
  }
  return result;
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

uint64_t __30__BWDeviceThermalMonitor_init__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned int *)(*(void *)(a1 + 32) + 16));
}

- (void)dealloc
{
  int registrationToken = self->_registrationToken;
  if ((registrationToken & 0x80000000) == 0) {
    notify_cancel(registrationToken);
  }

  FigSimpleMutexDestroy();
  v4.receiver = self;
  v4.super_class = (Class)BWDeviceThermalMonitor;
  [(BWDeviceThermalMonitor *)&v4 dealloc];
}

@end