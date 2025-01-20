@interface IMEventListener
+ (id)_mutableListenerDictionary;
+ (id)allListeners;
+ (id)eventListener;
+ (id)eventListenerWithNotificationName:(id)a3 object:(id)a4;
- (BOOL)isListening;
- (BOOL)willRepeat;
- (OS_dispatch_semaphore)semaphore;
- (double)elapsedWaitingTime;
- (double)timeLastEventReceived;
- (double)timeListeningStarted;
- (double)timeListeningStopped;
- (double)timeout;
- (double)timerStart;
- (id)completionBlock;
- (id)createResult:(BOOL)a3 userInfo:(id)a4 error:(id)a5;
- (id)didInvokeCompletion;
- (id)target;
- (id)willInvokeCompletion;
- (unint64_t)eventCount;
- (void)_addToListeners;
- (void)_cancelTimeoutTimer;
- (void)_didReceiveEvent:(BOOL)a3 userInfo:(id)a4 error:(id)a5;
- (void)_dispatchStartEventBlock:(id)a3;
- (void)_handleTimeout:(id)a3;
- (void)_invokeCompletion:(BOOL)a3 userInfo:(id)a4 error:(id)a5;
- (void)_removeFromListeners;
- (void)_reset;
- (void)_startListening;
- (void)_startTimeoutTimerIfNeeded;
- (void)_stopListening;
- (void)reset;
- (void)setCompletionBlock:(id)a3;
- (void)setDidInvokeCompletion:(id)a3;
- (void)setTarget:(id)a3;
- (void)setTimeout:(double)a3;
- (void)setTimerStart:(double)a3;
- (void)setWillInvokeCompletion:(id)a3;
- (void)setWillRepeat:(BOOL)a3;
- (void)startListening;
- (void)startListeningForEventTarget:(id)a3 completion:(id)a4;
- (void)startListeningForEventTarget:(id)a3 sendStartingEvent:(id)a4 completion:(id)a5;
- (void)stopListening;
- (void)waitForCompletion;
@end

@implementation IMEventListener

+ (id)_mutableListenerDictionary
{
  if (qword_1E94FE7B0 != -1) {
    dispatch_once(&qword_1E94FE7B0, &unk_1EF2BF060);
  }
  v2 = (void *)qword_1E94FE7B8;

  return v2;
}

+ (id)allListeners
{
  v2 = +[IMEventListener _mutableListenerDictionary];
  v3 = [v2 allValues];

  return v3;
}

+ (id)eventListener
{
  id v2 = objc_alloc_init((Class)objc_opt_class());

  return v2;
}

- (void)_removeFromListeners
{
  if (self->_timeListeningStarted != 0.0)
  {
    id v4 = +[IMEventListener _mutableListenerDictionary];
    v3 = [NSNumber numberWithDouble:self->_timeListeningStarted];
    [v4 removeObjectForKey:v3];
  }
}

- (void)_addToListeners
{
  if (self->_timeListeningStarted != 0.0)
  {
    id v4 = +[IMEventListener _mutableListenerDictionary];
    v3 = [NSNumber numberWithDouble:self->_timeListeningStarted];
    [v4 setObject:self forKey:v3];
  }
}

- (id)createResult:(BOOL)a3 userInfo:(id)a4 error:(id)a5
{
  BOOL v6 = a3;
  id v7 = a5;
  id v8 = a4;
  v9 = [[IMEventListenerResponse alloc] initWithSuccess:v6 userInfo:v8 error:v7];

  return v9;
}

- (void)_invokeCompletion:(BOOL)a3 userInfo:(id)a4 error:(id)a5
{
  BOOL v6 = a3;
  id v16 = a4;
  id v8 = a5;
  [(IMEventListener *)self _cancelTimeoutTimer];
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  if (WeakRetained)
  {
    uint64_t v10 = [(IMEventListener *)self willInvokeCompletion];
    v11 = (void *)v10;
    if (v10) {
      (*(void (**)(uint64_t, id, IMEventListener *))(v10 + 16))(v10, WeakRetained, self);
    }
    v12 = [(IMEventListener *)self completionBlock];
    [(IMEventListener *)self _stopListening];
    if (v12)
    {
      v13 = [(IMEventListener *)self createResult:v6 userInfo:v16 error:v8];
      ((void (**)(void, id, IMEventListener *, void *))v12)[2](v12, WeakRetained, self, v13);
    }
    uint64_t v14 = [(IMEventListener *)self didInvokeCompletion];
    v15 = (void *)v14;
    if (v14) {
      (*(void (**)(uint64_t, id, IMEventListener *))(v14 + 16))(v14, WeakRetained, self);
    }
  }
}

- (void)_handleTimeout:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  BOOL v6 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = *MEMORY[0x1E4F28568];
  v10[0] = @"Event timed out";
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v8 = [v6 errorWithDomain:@"IMEventListenerErrorDomain" code:1 userInfo:v7];
  [(IMEventListener *)v5 _invokeCompletion:0 userInfo:0 error:v8];

  objc_sync_exit(v5);
}

- (void)_startListening
{
  [(IMEventListener *)self _stopListening];
  self->_eventCount = 0;
  v3 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  semaphore = self->_semaphore;
  self->_semaphore = v3;

  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  self->_timeListeningStarted = v5;
  self->_timeListeningStopped = 0.0;
  self->_timeLastEventReceived = 0.0;
  [(IMEventListener *)self willStartListening];
  [(IMEventListener *)self _addToListeners];

  [(IMEventListener *)self _startTimeoutTimerIfNeeded];
}

- (void)_stopListening
{
  if (self->_timeListeningStarted != 0.0)
  {
    [(IMEventListener *)self _removeFromListeners];
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    self->_timeListeningStopped = v3;
  }
  [(IMEventListener *)self willStopListening];
  semaphore = self->_semaphore;
  if (semaphore)
  {
    dispatch_semaphore_signal(semaphore);
    double v5 = self->_semaphore;
    self->_semaphore = 0;
  }

  [(IMEventListener *)self _cancelTimeoutTimer];
}

- (void)_cancelTimeoutTimer
{
  self->_timerStart = 0.0;
}

- (void)_reset
{
  [(IMEventListener *)self _stopListening];
  self->_timeout = 0.0;
  id completionBlock = self->_completionBlock;
  self->_id completionBlock = 0;

  id didInvokeCompletion = self->_didInvokeCompletion;
  self->_id didInvokeCompletion = 0;

  id willInvokeCompletion = self->_willInvokeCompletion;
  self->_id willInvokeCompletion = 0;

  self->_timeListeningStarted = 0.0;
  self->_timeListeningStopped = 0.0;
  self->_timeLastEventReceived = 0.0;
  objc_storeWeak(&self->_target, 0);
  self->_eventCount = 0;

  MEMORY[0x1F4181798](self, sel_willReset);
}

- (void)_startTimeoutTimerIfNeeded
{
  if (self->_timeout > 0.0)
  {
    id location = 0;
    objc_initWeak(&location, self);
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v4 = v3;
    self->_timerStart = v3;
    dispatch_time_t v5 = dispatch_time(0, (uint64_t)(self->_timeout * 1000000000.0));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1A079D764;
    block[3] = &unk_1E5A10038;
    objc_copyWeak(v7, &location);
    v7[1] = *(id *)&v4;
    dispatch_after(v5, MEMORY[0x1E4F14428], block);
    objc_destroyWeak(v7);
    objc_destroyWeak(&location);
  }
}

- (void)_dispatchStartEventBlock:(id)a3
{
  if (a3) {
    dispatch_async(MEMORY[0x1E4F14428], a3);
  }
}

- (void)waitForCompletion
{
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    if ([(IMEventListener *)self isListening])
    {
      do
      {
        double v3 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
        double v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.1];
        [v3 runUntilDate:v4];
      }
      while ([(IMEventListener *)self isListening]);
    }
  }
  else
  {
    semaphore = self->_semaphore;
    dispatch_semaphore_wait(semaphore, 0xFFFFFFFFFFFFFFFFLL);
  }
}

- (void)startListeningForEventTarget:(id)a3 sendStartingEvent:(id)a4 completion:(id)a5
{
  id obj = a3;
  id v8 = (void (**)(id, id, IMEventListener *))a4;
  id v9 = a5;
  uint64_t v10 = self;
  objc_sync_enter(v10);
  [(IMEventListener *)v10 _stopListening];
  objc_storeWeak(&v10->_target, obj);
  uint64_t v11 = [v9 copy];
  id completionBlock = v10->_completionBlock;
  v10->_id completionBlock = (id)v11;

  [(IMEventListener *)v10 _startListening];
  if (v8) {
    v8[2](v8, obj, v10);
  }
  objc_sync_exit(v10);
}

- (void)startListeningForEventTarget:(id)a3 completion:(id)a4
{
}

- (BOOL)isListening
{
  return 0;
}

- (void)stopListening
{
  id obj = self;
  objc_sync_enter(obj);
  [(IMEventListener *)obj _stopListening];
  objc_sync_exit(obj);
}

- (void)startListening
{
  id obj = self;
  objc_sync_enter(obj);
  [(IMEventListener *)obj _startListening];
  objc_sync_exit(obj);
}

- (double)timeListeningStarted
{
  id v2 = self;
  objc_sync_enter(v2);
  double timeListeningStarted = v2->_timeListeningStarted;
  objc_sync_exit(v2);

  return timeListeningStarted;
}

- (double)timeListeningStopped
{
  id v2 = self;
  objc_sync_enter(v2);
  double timeListeningStopped = v2->_timeListeningStopped;
  objc_sync_exit(v2);

  return timeListeningStopped;
}

- (double)timeLastEventReceived
{
  id v2 = self;
  objc_sync_enter(v2);
  double timeLastEventReceived = v2->_timeLastEventReceived;
  objc_sync_exit(v2);

  return timeLastEventReceived;
}

- (double)elapsedWaitingTime
{
  id v2 = self;
  objc_sync_enter(v2);
  double timeListeningStarted = v2->_timeListeningStarted;
  double v4 = 0.0;
  if (timeListeningStarted != 0.0)
  {
    double timeListeningStopped = v2->_timeListeningStopped;
    if (timeListeningStopped == 0.0)
    {
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      double timeListeningStarted = v2->_timeListeningStarted;
    }
    double v4 = timeListeningStopped - timeListeningStarted;
  }
  objc_sync_exit(v2);

  return v4;
}

- (void)setCompletionBlock:(id)a3
{
  id v7 = a3;
  double v4 = self;
  objc_sync_enter(v4);
  [(IMEventListener *)v4 _stopListening];
  uint64_t v5 = [v7 copy];
  id completionBlock = v4->_completionBlock;
  v4->_id completionBlock = (id)v5;

  objc_sync_exit(v4);
}

- (id)completionBlock
{
  id v2 = self;
  objc_sync_enter(v2);
  double v3 = _Block_copy(v2->_completionBlock);
  objc_sync_exit(v2);

  return v3;
}

- (void)reset
{
  id obj = self;
  objc_sync_enter(obj);
  [(IMEventListener *)obj _reset];
  objc_sync_exit(obj);
}

- (void)setTimeout:(double)a3
{
  id obj = self;
  objc_sync_enter(obj);
  [(IMEventListener *)obj _cancelTimeoutTimer];
  obj->_timeout = a3;
  [(IMEventListener *)obj _startTimeoutTimerIfNeeded];
  objc_sync_exit(obj);
}

- (double)timeout
{
  id v2 = self;
  objc_sync_enter(v2);
  double timeout = v2->_timeout;
  objc_sync_exit(v2);

  return timeout;
}

- (void)_didReceiveEvent:(BOOL)a3 userInfo:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = self;
  objc_sync_enter(v9);
  ++v9->_eventCount;
  if (v9->_timeLastEventReceived == 0.0)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    v9->_double timeLastEventReceived = v10;
    [(IMEventListener *)v9 _cancelTimeoutTimer];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1A079DEFC;
    v11[3] = &unk_1E5A10080;
    v11[4] = v9;
    id v12 = v7;
    dispatch_async(MEMORY[0x1E4F14428], v11);
  }
  objc_sync_exit(v9);
}

+ (id)eventListenerWithNotificationName:(id)a3 object:(id)a4
{
  return +[IMNotificationCenterEventListener eventListenerForNotificationName:a3 object:a4];
}

- (double)timerStart
{
  return self->_timerStart;
}

- (void)setTimerStart:(double)a3
{
  self->_timerStart = a3;
}

- (OS_dispatch_semaphore)semaphore
{
  return self->_semaphore;
}

- (unint64_t)eventCount
{
  return self->_eventCount;
}

- (id)target
{
  id WeakRetained = objc_loadWeakRetained(&self->_target);

  return WeakRetained;
}

- (void)setTarget:(id)a3
{
}

- (id)willInvokeCompletion
{
  return objc_getProperty(self, a2, 88, 1);
}

- (void)setWillInvokeCompletion:(id)a3
{
}

- (id)didInvokeCompletion
{
  return objc_getProperty(self, a2, 96, 1);
}

- (void)setDidInvokeCompletion:(id)a3
{
}

- (BOOL)willRepeat
{
  return self->_willRepeat;
}

- (void)setWillRepeat:(BOOL)a3
{
  self->_willRepeat = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didInvokeCompletion, 0);
  objc_storeStrong(&self->_willInvokeCompletion, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_destroyWeak(&self->_target);

  objc_storeStrong((id *)&self->_semaphore, 0);
}

@end