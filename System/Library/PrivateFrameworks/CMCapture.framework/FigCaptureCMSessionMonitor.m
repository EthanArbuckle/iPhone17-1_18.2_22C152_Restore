@interface FigCaptureCMSessionMonitor
+ (void)initialize;
- (FigCaptureCMSessionMonitor)initWithCMSession:(opaqueCMSession *)a3 clientPID:(int)a4 observer:(id)a5;
- (id)_initWithFigCaptureCMSession:(id)a3 clientPID:(int)a4 observer:(id)a5;
- (id)debugDescription;
- (id)description;
- (uint64_t)_beginMonitoring;
- (uint64_t)_endMonitoring;
- (void)_handleBKSApplicationStateChange:(uint64_t)a1;
- (void)_handleCMSessionNotification:(uint64_t)a1;
- (void)_updateApplicationState;
- (void)dealloc;
- (void)invalidate;
@end

@implementation FigCaptureCMSessionMonitor

+ (void)initialize
{
}

- (id)_initWithFigCaptureCMSession:(id)a3 clientPID:(int)a4 observer:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  v11.receiver = self;
  v11.super_class = (Class)FigCaptureCMSessionMonitor;
  v8 = [(FigCaptureCMSessionMonitor *)&v11 init];
  if (v8)
  {
    v8->_lock = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
    v9 = (FigCaptureCMSession *)a3;
    v8->_session = v9;
    v8->_clientPID = v6;
    if (-[FigCaptureCMSession setProperty:value:](v9, "setProperty:value:", *MEMORY[0x1E4F75FA8], objc_msgSend(NSString, "stringWithFormat:", @"FigCaptureClient-%d", v6))|| -[FigCaptureCMSession setProperty:value:](v8->_session, "setProperty:value:", *MEMORY[0x1E4F75FB0], objc_msgSend(NSNumber, "numberWithInt:", v8->_clientPID)))
    {
      FigDebugAssert3();

      return 0;
    }
    else
    {
      v8->_observer = (FigCaptureCMSessionObserver *)a5;
      -[FigCaptureCMSessionMonitor _beginMonitoring]((uint64_t)v8);
    }
  }
  return v8;
}

- (uint64_t)_beginMonitoring
{
  if (result)
  {
    uint64_t v1 = result;
    id v2 = +[FigWeakReference weakReferenceToObject:result];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __46__FigCaptureCMSessionMonitor__beginMonitoring__block_invoke;
    v5[3] = &unk_1E5C247D8;
    v5[4] = v2;
    v3 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    *(void *)(v1 + 40) = objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", *MEMORY[0x1E4F75D38], objc_msgSend(*(id *)(v1 + 16), "cmsession"), 0, v5);
    -[FigCaptureCMSessionMonitor _updateApplicationState](v1);
    v4 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    result = objc_msgSend(v4, "addObserverForName:object:queue:usingBlock:", *MEMORY[0x1E4F75DB0], objc_msgSend(*(id *)(v1 + 16), "cmsession"), 0, v5);
    *(void *)(v1 + 48) = result;
  }
  return result;
}

- (FigCaptureCMSessionMonitor)initWithCMSession:(opaqueCMSession *)a3 clientPID:(int)a4 observer:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  if (!a3 && CMSessionCreate())
  {
    FigDebugAssert3();
    char v10 = 0;
  }
  else
  {
    v9 = [[FigCaptureCMSession alloc] initWithCMSession:a3];
    self = [(FigCaptureCMSessionMonitor *)self _initWithFigCaptureCMSession:v9 clientPID:v6 observer:a5];

    if (a3) {
      return self;
    }
    char v10 = 1;
  }
  if (a3) {
    CFRelease(a3);
  }
  if ((v10 & 1) == 0)
  {

    return 0;
  }
  return self;
}

- (void)invalidate
{
  pthread_mutex_lock((pthread_mutex_t *)self->_lock);
  if (!self->_invalidated)
  {
    -[FigCaptureCMSessionMonitor _endMonitoring]((uint64_t)self);
    self->_invalidated = 1;
  }
  lock = self->_lock;
  pthread_mutex_unlock((pthread_mutex_t *)lock);
}

- (uint64_t)_endMonitoring
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(void *)(result + 40))
    {
      result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", *(void *)(result + 40));
      *(void *)(v1 + 40) = 0;
    }
    if (*(void *)(v1 + 48))
    {
      result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", *(void *)(v1 + 48));
      *(void *)(v1 + 48) = 0;
    }
  }
  return result;
}

- (void)dealloc
{
  [(FigCaptureCMSessionMonitor *)self invalidate];

  FigSimpleMutexDestroy();
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureCMSessionMonitor;
  [(FigCaptureCMSessionMonitor *)&v3 dealloc];
}

- (id)debugDescription
{
  return (id)[NSString stringWithFormat:@"session: %@, observer: %@", self->_session, self->_observer];
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p %@>", NSStringFromClass(v4), self, -[FigCaptureCMSessionMonitor debugDescription](self, "debugDescription")];
}

void __46__FigCaptureCMSessionMonitor__beginMonitoring__block_invoke(uint64_t a1, void *a2)
{
  v4 = (void *)MEMORY[0x1A6272C70]();
  id v5 = (id)[*(id *)(a1 + 32) referencedObject];
  -[FigCaptureCMSessionMonitor _handleCMSessionNotification:]((uint64_t)v5, a2);
}

- (void)_handleCMSessionNotification:(uint64_t)a1
{
  if (!a1) {
    return;
  }
  pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 8));
  int v4 = *(unsigned __int8 *)(a1 + 56);
  pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 8));
  if (v4) {
    goto LABEL_18;
  }
  id v5 = (void *)[a2 name];
  if ([v5 isEqualToString:*MEMORY[0x1E4F75DB0]])
  {
    uint64_t v6 = (void *)[a2 userInfo];
    v7 = (void *)[v6 objectForKeyedSubscript:*MEMORY[0x1E4F75C30]];
    if (v7)
    {
      int v8 = [v7 intValue];
      if (v8 == 1)
      {
        v14 = *(void **)(a1 + 32);
        [v14 cmsessionMonitorDidEndAudioInterruption:a1];
      }
      else if (!v8)
      {
        v9 = *(void **)(a1 + 32);
        [v9 cmsessionMonitorDidBeginAudioInterruption:a1];
      }
      return;
    }
LABEL_18:
    FigDebugAssert3();
    return;
  }
  char v10 = (void *)[a2 name];
  if (![v10 isEqualToString:*MEMORY[0x1E4F75D38]]) {
    return;
  }
  objc_super v11 = (void *)[a2 userInfo];
  v12 = (void *)[v11 objectForKeyedSubscript:*MEMORY[0x1E4F75C90]];
  if (!v12) {
    goto LABEL_18;
  }
  uint64_t v13 = [v12 unsignedIntValue];
  -[FigCaptureCMSessionMonitor _handleBKSApplicationStateChange:](a1, v13);
}

- (void)_updateApplicationState
{
  if (a1)
  {
    int v4 = 0;
    id v2 = (void *)[*(id *)(a1 + 16) copyProperty:*MEMORY[0x1E4F75EB0] error:&v4];
    objc_super v3 = v2;
    if (v4) {
      FigDebugAssert3();
    }
    else {
      -[FigCaptureCMSessionMonitor _handleBKSApplicationStateChange:](a1, [v2 unsignedIntValue]);
    }
  }
}

- (void)_handleBKSApplicationStateChange:(uint64_t)a1
{
  if (a1)
  {
    int v6 = 0;
    int v4 = (void *)[*(id *)(a1 + 16) copyProperty:*MEMORY[0x1E4F763C0] error:&v6];
    id v5 = v4;
    if (v6) {
      FigDebugAssert3();
    }
    else {
      objc_msgSend(*(id *)(a1 + 32), "cmsessionMonitor:didUpdateApplicationState:pidToInheritApplicationStateFrom:", a1, a2, objc_msgSend(v4, "intValue"));
    }
  }
}

@end