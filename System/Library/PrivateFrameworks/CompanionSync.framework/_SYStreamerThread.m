@interface _SYStreamerThread
+ (id)streamerThread;
- (NSRunLoop)runLoop;
- (_SYStreamerThread)init;
- (void)_waitForStartup;
- (void)main;
@end

@implementation _SYStreamerThread

+ (id)streamerThread
{
  os_unfair_lock_lock((os_unfair_lock_t)&streamerThread_threadLock);
  if (!streamerThread_thread)
  {
    uint64_t v2 = objc_opt_new();
    v3 = (void *)streamerThread_thread;
    streamerThread_thread = v2;

    [(id)streamerThread_thread start];
    [(id)streamerThread_thread _waitForStartup];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&streamerThread_threadLock);
  v4 = (void *)streamerThread_thread;
  return v4;
}

- (_SYStreamerThread)init
{
  v7.receiver = self;
  v7.super_class = (Class)_SYStreamerThread;
  uint64_t v2 = [(_SYStreamerThread *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F08748]) initWithCondition:0];
    startupLock = v2->_startupLock;
    v2->_startupLock = (NSConditionLock *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)_waitForStartup
{
  if ([(NSConditionLock *)self->_startupLock condition] != 1)
  {
    [(NSConditionLock *)self->_startupLock lockWhenCondition:1];
    startupLock = self->_startupLock;
    [(NSConditionLock *)startupLock unlock];
  }
}

- (NSRunLoop)runLoop
{
  if ([(NSConditionLock *)self->_startupLock condition] != 1)
  {
    [(NSConditionLock *)self->_startupLock lockWhenCondition:1];
    [(NSConditionLock *)self->_startupLock unlock];
  }
  threadRunLoop = self->_threadRunLoop;
  return threadRunLoop;
}

- (void)main
{
  [(NSConditionLock *)self->_startupLock lock];
  uint64_t v3 = [MEMORY[0x263EFF9F0] currentRunLoop];
  threadRunLoop = self->_threadRunLoop;
  self->_threadRunLoop = v3;

  char v8 = 0;
  v7.version = 0;
  memset(&v7.retain, 0, 56);
  v7.info = &v8;
  v7.perform = (void (__cdecl *)(void *))_StopPerform;
  self->_stopRLS = CFRunLoopSourceCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, &v7);
  CFRunLoopAddSource([(NSRunLoop *)self->_threadRunLoop getCFRunLoop], self->_stopRLS, @"_SYWaitingForStream");
  [(NSConditionLock *)self->_startupLock unlockWithCondition:1];
  while (!v8)
  {
    v5 = self->_threadRunLoop;
    v6 = [MEMORY[0x263EFF910] distantFuture];
    [(NSRunLoop *)v5 runMode:@"_SYWaitingForStream" beforeDate:v6];
  }
  [(NSConditionLock *)self->_startupLock lock];
  [(NSConditionLock *)self->_startupLock unlockWithCondition:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startupLock, 0);
  objc_storeStrong((id *)&self->_threadRunLoop, 0);
}

@end