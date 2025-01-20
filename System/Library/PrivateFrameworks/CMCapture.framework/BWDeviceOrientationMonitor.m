@interface BWDeviceOrientationMonitor
+ (void)initialize;
- (BOOL)start;
- (BOOL)stop;
- (BWDeviceOrientationMonitor)init;
- (BWDeviceOrientationMonitorPortraitLandscapeUpdateDelegate)portraitLandscapeUpdateDelegate;
- (int)currentOrientation;
- (int)mostRecentPortraitLandscapeOrientation;
- (uint64_t)_doStart;
- (uint64_t)_doStop;
- (uint64_t)_orientationChanged;
- (void)dealloc;
- (void)setPortraitLandscapeUpdateDelegate:(id)a3;
@end

@implementation BWDeviceOrientationMonitor

- (BWDeviceOrientationMonitor)init
{
  v5.receiver = self;
  v5.super_class = (Class)BWDeviceOrientationMonitor;
  v2 = [(BWDeviceOrientationMonitor *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_orientationDispatchToken = 0;
    v2->_orientationNotificationDispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.bwgraph.device-orientation-monitor", 0);
    *(void *)&v3->_mostRecentPortraitLandscapeOrientation = 0;
    v3->_stateMutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
  }
  return v3;
}

- (int)currentOrientation
{
  return self->_currentOrientation;
}

- (int)mostRecentPortraitLandscapeOrientation
{
  return self->_mostRecentPortraitLandscapeOrientation;
}

- (BOOL)start
{
  return 1;
}

- (uint64_t)_doStart
{
  if (result)
  {
    uint64_t v1 = result;
    result = pthread_mutex_lock(*(pthread_mutex_t **)(result + 40));
    if (!result)
    {
      if (*(_DWORD *)(v1 + 8)) {
        return pthread_mutex_unlock(*(pthread_mutex_t **)(v1 + 40));
      }
      int out_token = 0;
      if (notify_register_check("com.apple.backboardd.rawOrientation", &out_token))
      {
LABEL_11:
        objc_initWeak(&state64, (id)v1);
        v4 = *(NSObject **)(v1 + 16);
        handler[0] = MEMORY[0x1E4F143A8];
        handler[1] = 3221225472;
        handler[2] = __38__BWDeviceOrientationMonitor__doStart__block_invoke;
        handler[3] = &unk_1E5C29988;
        objc_copyWeak(&v6, &state64);
        notify_register_dispatch("com.apple.backboardd.rawOrientation", (int *)(v1 + 8), v4, handler);
        objc_destroyWeak(&v6);
        objc_destroyWeak(&state64);
        return pthread_mutex_unlock(*(pthread_mutex_t **)(v1 + 40));
      }
      id state64 = 0;
      notify_get_state(out_token, (uint64_t *)&state64);
      int v2 = (int)state64;
      if ((state64 - 1) > 3)
      {
        if ((state64 - 1) > 5)
        {
          id v3 = objc_alloc_init(MEMORY[0x1E4F629F8]);
          *(_DWORD *)(v1 + 24) = [v3 activeInterfaceOrientation];

          goto LABEL_10;
        }
      }
      else
      {
        *(_DWORD *)(v1 + 24) = state64;
      }
      *(_DWORD *)(v1 + 28) = v2;
LABEL_10:
      notify_cancel(out_token);
      goto LABEL_11;
    }
  }
  return result;
}

+ (void)initialize
{
}

- (void)dealloc
{
  -[BWDeviceOrientationMonitor _doStop]((uint64_t)self);

  FigSimpleMutexDestroy();
  v3.receiver = self;
  v3.super_class = (Class)BWDeviceOrientationMonitor;
  [(BWDeviceOrientationMonitor *)&v3 dealloc];
}

- (uint64_t)_doStop
{
  if (result)
  {
    uint64_t v1 = result;
    result = pthread_mutex_lock(*(pthread_mutex_t **)(result + 40));
    if (!result)
    {
      int v2 = *(_DWORD *)(v1 + 8);
      if (v2)
      {
        notify_cancel(v2);
        *(_DWORD *)(v1 + 8) = 0;
      }
      *(void *)(v1 + 24) = 0;
      objc_super v3 = *(pthread_mutex_t **)(v1 + 40);
      return pthread_mutex_unlock(v3);
    }
  }
  return result;
}

- (BOOL)stop
{
  return 1;
}

void __38__BWDeviceOrientationMonitor__doStart__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[BWDeviceOrientationMonitor _orientationChanged]((uint64_t)WeakRetained);
}

- (uint64_t)_orientationChanged
{
  if (result)
  {
    uint64_t v1 = result;
    result = pthread_mutex_lock(*(pthread_mutex_t **)(result + 40));
    if (!result)
    {
      int v2 = *(_DWORD *)(v1 + 8);
      if (v2)
      {
        uint64_t state64 = 0;
        notify_get_state(v2, &state64);
        int v3 = state64;
        if (state64)
        {
          if (*(_DWORD *)(v1 + 28) != state64)
          {
            if ((int)state64 >= 7)
            {
              fig_log_get_emitter();
              FigDebugAssert3();
            }
            else
            {
              if (state64 <= 4 && *(_DWORD *)(v1 + 24) != state64)
              {
                *(_DWORD *)(v1 + 24) = state64;
                v4 = (void *)[(id)v1 portraitLandscapeUpdateDelegate];
                if (v4) {
                  [v4 didUpdatePortraitLandscapeOrientation:*(unsigned int *)(v1 + 24)];
                }
              }
              *(_DWORD *)(v1 + 28) = v3;
            }
          }
        }
      }
      return pthread_mutex_unlock(*(pthread_mutex_t **)(v1 + 40));
    }
  }
  return result;
}

- (BWDeviceOrientationMonitorPortraitLandscapeUpdateDelegate)portraitLandscapeUpdateDelegate
{
  return self->_portraitLandscapeUpdateDelegate;
}

- (void)setPortraitLandscapeUpdateDelegate:(id)a3
{
  self->_portraitLandscapeUpdateDelegate = (BWDeviceOrientationMonitorPortraitLandscapeUpdateDelegate *)a3;
}

@end