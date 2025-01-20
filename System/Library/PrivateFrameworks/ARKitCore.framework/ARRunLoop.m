@interface ARRunLoop
- (ARRunLoop)init;
- (ARRunLoop)initWithName:(id)a3;
- (BOOL)cancelled;
- (void)_runloop_handleActivity:(unint64_t)a3;
- (void)_runloop_popAutoreleasePool;
- (void)_runloop_pushAutoreleasePool;
- (void)_startThread;
- (void)cancel;
- (void)dealloc;
- (void)runOnRunLoop:(id)a3;
- (void)setCancelled:(BOOL)a3;
- (void)start;
@end

@implementation ARRunLoop

- (ARRunLoop)init
{
  v3 = objc_msgSend(NSString, "stringWithFormat:", @"ARRunLoop.%p", self);
  v4 = [(ARRunLoop *)self initWithName:v3];

  return v4;
}

- (ARRunLoop)initWithName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ARRunLoop;
  v5 = [(ARRunLoop *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v5->_lock._os_unfair_lock_opaque = 0;
    v5->_autoreleasePoolStack = CFArrayCreateMutable(0, 0, 0);
  }

  return v5;
}

- (void)dealloc
{
  runLoopEnterObserver = self->_runLoopEnterObserver;
  id v4 = (CFRunLoopMode *)MEMORY[0x1E4F1D410];
  if (runLoopEnterObserver)
  {
    CFRunLoopRemoveObserver(self->_runloop, runLoopEnterObserver, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
    CFRelease(self->_runLoopEnterObserver);
  }
  runLoopExitObserver = self->_runLoopExitObserver;
  if (runLoopExitObserver)
  {
    CFRunLoopRemoveObserver(self->_runloop, runLoopExitObserver, *v4);
    CFRelease(self->_runLoopExitObserver);
  }
  runloop = self->_runloop;
  if (runloop) {
    CFRelease(runloop);
  }
  CFRelease(self->_autoreleasePoolStack);
  v7.receiver = self;
  v7.super_class = (Class)ARRunLoop;
  [(ARRunLoop *)&v7 dealloc];
}

- (void)start
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL started = self->_started;
  self->_BOOL started = 1;
  os_unfair_lock_unlock(p_lock);
  if (!started)
  {
    id v5 = (id)[objc_alloc(MEMORY[0x1E4F29060]) initWithTarget:self selector:sel__startThread object:0];
    [v5 setName:self->_name];
    [v5 setQualityOfService:33];
    [v5 start];
  }
}

- (void)_startThread
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  Current = CFRunLoopGetCurrent();
  pthread_set_fixedpriority_self();
  if (!_CFRunLoopSetPerCalloutAutoreleasepoolEnabled())
  {
    objc_initWeak((id *)&v18, self);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __25__ARRunLoop__startThread__block_invoke;
    v23[3] = &unk_1E6186470;
    objc_copyWeak(&v24, (id *)&v18);
    id v4 = (void *)MEMORY[0x1BA9C63E0](v23);
    id v5 = CFRunLoopObserverCreateWithHandler(0, 1uLL, 1u, -2147483647, v4);
    self->_runLoopEnterObserver = v5;
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D410];
    CFRunLoopAddObserver(Current, v5, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
    objc_super v7 = CFRunLoopObserverCreateWithHandler(0, 0xA0uLL, 1u, 0x7FFFFFFFLL, v4);
    self->_runLoopExitObserver = v7;
    CFRunLoopAddObserver(Current, v7, v6);

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)&v18);
  }
  v8 = (void *)MEMORY[0x1BA9C6160]();
  os_unfair_lock_lock(&self->_lock);
  CFRetain(Current);
  self->_runloop = Current;
  objc_super v9 = self->_earlyRunloopBlocks;
  earlyRunloopBlocks = self->_earlyRunloopBlocks;
  self->_earlyRunloopBlocks = 0;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v11 = v9;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v20;
    v14 = (const void *)*MEMORY[0x1E4F1D410];
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v11);
        }
        CFRunLoopPerformBlock(Current, v14, *(void **)(*((void *)&v19 + 1) + 8 * v15++));
      }
      while (v12 != v15);
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v12);
  }

  os_unfair_lock_unlock(&self->_lock);
  memset(&v18, 0, sizeof(v18));
  v16 = CFRunLoopSourceCreate(0, 0, &v18);
  CFStringRef v17 = (const __CFString *)*MEMORY[0x1E4F1D418];
  CFRunLoopAddSource(Current, v16, (CFRunLoopMode)*MEMORY[0x1E4F1D418]);
  CFRelease(v16);
  CFRunLoopRun();
  CFRunLoopRemoveSource(Current, v16, v17);
  [(ARRunLoop *)self setCancelled:1];
}

void __25__ARRunLoop__startThread__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_runloop_handleActivity:", a3);
}

- (void)runOnRunLoop:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  runloop = self->_runloop;
  if (runloop)
  {
    os_unfair_lock_unlock(p_lock);
    CFRunLoopPerformBlock(runloop, (CFTypeRef)*MEMORY[0x1E4F1D410], v5);

    CFRunLoopWakeUp(runloop);
  }
  else
  {
    earlyRunloopBlocks = self->_earlyRunloopBlocks;
    if (earlyRunloopBlocks) {
      v8 = earlyRunloopBlocks;
    }
    else {
      v8 = (NSMutableArray *)objc_opt_new();
    }
    objc_super v9 = self->_earlyRunloopBlocks;
    self->_earlyRunloopBlocks = v8;

    v10 = self->_earlyRunloopBlocks;
    v11 = (void *)MEMORY[0x1BA9C63E0](v5);

    [(NSMutableArray *)v10 addObject:v11];
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)cancel
{
}

void __19__ARRunLoop_cancel__block_invoke()
{
  Current = CFRunLoopGetCurrent();
  CFRunLoopStop(Current);
}

- (void)_runloop_handleActivity:(unint64_t)a3
{
  if (a3 == 128)
  {
    [(ARRunLoop *)self _runloop_popAutoreleasePool];
  }
  else
  {
    if (a3 == 32)
    {
      [(ARRunLoop *)self _runloop_popAutoreleasePool];
    }
    else if (a3 != 1)
    {
      return;
    }
    [(ARRunLoop *)self _runloop_pushAutoreleasePool];
  }
}

- (void)_runloop_pushAutoreleasePool
{
  autoreleasePoolStack = self->_autoreleasePoolStack;
  v3 = (const void *)MEMORY[0x1BA9C5150](0, a2);
  CFArrayAppendValue(autoreleasePoolStack, v3);
}

- (void)_runloop_popAutoreleasePool
{
  CFIndex Count = CFArrayGetCount(self->_autoreleasePoolStack);
  CFIndex v4 = Count - 1;
  if (Count >= 1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(self->_autoreleasePoolStack, v4);
    MEMORY[0x1BA9C5140](ValueAtIndex);
    autoreleasePoolStack = self->_autoreleasePoolStack;
    CFArrayRemoveValueAtIndex(autoreleasePoolStack, v4);
  }
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_earlyRunloopBlocks, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end