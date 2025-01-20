@interface AVTimebaseObserver
- (AVTimebaseObserver)initWithTimebase:(OpaqueCMTimebase *)a3 queue:(id)a4;
- (AVWeakReference)_weakReference;
- (BOOL)invalidated;
- (OpaqueCMTimebase)timebase;
- (void)_attachTimerSourceToTimebase;
- (void)_finishInitializationWithTimerEventHandler:(id)a3;
- (void)_reallyInvalidate;
- (void)_removeTimebaseFromTimerSource;
- (void)_startObservingTimebaseNotifications;
- (void)_stopObservingTimebaseNotifications;
- (void)dealloc;
- (void)invalidate;
@end

@implementation AVTimebaseObserver

- (AVTimebaseObserver)initWithTimebase:(OpaqueCMTimebase *)a3 queue:(id)a4
{
  v21.receiver = self;
  v21.super_class = (Class)AVTimebaseObserver;
  v7 = [(AVTimebaseObserver *)&v21 init];
  v8 = v7;
  if (v7)
  {
    if (!a3)
    {
      timerQueue = v7->_timerQueue;
      if (timerQueue)
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __45__AVTimebaseObserver_initWithTimebase_queue___block_invoke;
        block[3] = &unk_1E57B1E80;
        block[4] = v8;
        dispatch_async(timerQueue, block);
      }
      else
      {
        [(AVTimebaseObserver *)v8 invalidate];
      }
      v13 = v8;
      v19 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v8, a2, @"invalid parameter not satisfying: %s", v14, v15, v16, v17, v18, (uint64_t)"timebase"), 0 reason userInfo];
      objc_exception_throw(v19);
    }
    v9 = [[AVWeakReference alloc] initWithReferencedObject:v7];
    v10 = MEMORY[0x1E4F14428];
    if (a4) {
      v10 = a4;
    }
    v8->_timerQueue = (OS_dispatch_queue *)v10;
    v8->_weakReference = v9;
    dispatch_retain(v10);
    CFRetain(a3);
    v8->_timebase = a3;
  }
  return v8;
}

- (void)_finishInitializationWithTimerEventHandler:(id)a3
{
  v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 1uLL, (dispatch_queue_t)self->_timerQueue);
  self->_timerSource = v5;
  dispatch_source_set_event_handler((dispatch_source_t)v5, a3);
  dispatch_resume((dispatch_object_t)self->_timerSource);
  [(AVTimebaseObserver *)self _attachTimerSourceToTimebase];
  [(AVTimebaseObserver *)self _startObservingTimebaseNotifications];
  double currentRate = self->_currentRate;
  if (currentRate != CMTimebaseGetRate(self->_timebase))
  {
    timerQueue = self->_timerQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__AVTimebaseObserver__finishInitializationWithTimerEventHandler___block_invoke;
    block[3] = &unk_1E57B1E80;
    block[4] = self;
    dispatch_async(timerQueue, block);
  }
}

- (void)_startObservingTimebaseNotifications
{
  if (self->_timebase)
  {
    id v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
    v4 = [(AVTimebaseObserver *)self _weakReference];
    [v3 addListenerWithWeakReference:v4 callback:AVTimebaseObserver_timebaseNotificationCallback name:*MEMORY[0x1E4F1FA68] object:self->_timebase flags:0];
    [v3 addListenerWithWeakReference:v4 callback:AVTimebaseObserver_timebaseNotificationCallback name:*MEMORY[0x1E4F1FA58] object:self->_timebase flags:0];
    self->_isObservingTimebase = 1;
  }
}

- (AVWeakReference)_weakReference
{
  return self->_weakReference;
}

- (void)_attachTimerSourceToTimebase
{
}

uint64_t __45__AVTimebaseObserver_initWithTimebase_queue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (void)dealloc
{
  if (![(AVTimebaseObserver *)self invalidated]) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"A time observer token object was released without first being removed from the object it was created from using -removeTimeObserver:" userInfo:0]);
  }
  timerQueue = self->_timerQueue;
  if (timerQueue)
  {
    dispatch_release(timerQueue);
    self->_timerQueue = 0;
  }
  timebase = self->_timebase;
  if (timebase)
  {
    CFRelease(timebase);
    self->_timebase = 0;
  }

  v5.receiver = self;
  v5.super_class = (Class)AVTimebaseObserver;
  [(AVTimebaseObserver *)&v5 dealloc];
}

- (OpaqueCMTimebase)timebase
{
  timebase = self->_timebase;
  if (timebase) {
    timebase = (void *)CFRetain(timebase);
  }
  return (OpaqueCMTimebase *)timebase;
}

- (void)invalidate
{
  timerQueue = self->_timerQueue;
  if (timerQueue)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __32__AVTimebaseObserver_invalidate__block_invoke;
    v4[3] = &unk_1E57B1E80;
    v4[4] = self;
    AVSerializeOnQueueAsyncIfNecessary(timerQueue, v4);
  }
  else
  {
    [(AVTimebaseObserver *)self _reallyInvalidate];
  }
}

uint64_t __32__AVTimebaseObserver_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reallyInvalidate];
}

- (void)_reallyInvalidate
{
  if (!self->_invalid)
  {
    self->_invalid = 1;
    [(AVTimebaseObserver *)self _removeTimebaseFromTimerSource];
    [(AVTimebaseObserver *)self _stopObservingTimebaseNotifications];
    timebase = self->_timebase;
    if (timebase)
    {
      CFRelease(timebase);
      self->_timebase = 0;
    }
    timerSource = self->_timerSource;
    if (timerSource)
    {
      dispatch_release(timerSource);
      self->_timerSource = 0;
    }
  }
}

- (BOOL)invalidated
{
  return self->_invalid;
}

uint64_t __65__AVTimebaseObserver__finishInitializationWithTimerEventHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _effectiveRateChanged];
}

- (void)_removeTimebaseFromTimerSource
{
  timebase = self->_timebase;
  if (timebase)
  {
    timerSource = self->_timerSource;
    if (timerSource)
    {
      CMTime v5 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
      CMTimebaseSetTimerDispatchSourceNextFireTime(timebase, timerSource, &v5, 0);
      CMTimebaseRemoveTimerDispatchSource(self->_timebase, (dispatch_source_t)self->_timerSource);
    }
  }
}

- (void)_stopObservingTimebaseNotifications
{
  if (self->_timebase)
  {
    if (self->_isObservingTimebase)
    {
      id v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
      v4 = [(AVTimebaseObserver *)self _weakReference];
      [v3 removeListenerWithWeakReference:v4 callback:AVTimebaseObserver_timebaseNotificationCallback name:*MEMORY[0x1E4F1FA68] object:self->_timebase];
      [v3 removeListenerWithWeakReference:v4 callback:AVTimebaseObserver_timebaseNotificationCallback name:*MEMORY[0x1E4F1FA58] object:self->_timebase];
      self->_isObservingTimebase = 0;
    }
  }
}

void __AVTimebaseObserver_timebaseNotificationCallback_block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x199715AE0]();
  if (([*(id *)(a1 + 32) invalidated] & 1) == 0)
  {
    if (CFEqual(*(CFTypeRef *)(a1 + 40), (CFTypeRef)*MEMORY[0x1E4F1FA68]))
    {
      [*(id *)(a1 + 32) _handleTimeDiscontinuity];
    }
    else if (CFEqual(*(CFTypeRef *)(a1 + 40), (CFTypeRef)*MEMORY[0x1E4F1FA58]))
    {
      [*(id *)(a1 + 32) _effectiveRateChanged];
    }
  }
}

@end