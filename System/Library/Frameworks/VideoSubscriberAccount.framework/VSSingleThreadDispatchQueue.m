@interface VSSingleThreadDispatchQueue
+ (id)currentQueue;
- (NSMutableArray)blocks;
- (NSString)name;
- (NSThread)underlyingThread;
- (VSSingleThreadDispatchQueue)initWithName:(id)a3;
- (__CFRunLoop)underlyingRunLoop;
- (__CFRunLoopSource)runLoopSource;
- (id)startCompletionBlock;
- (int64_t)state;
- (void)_threadMain;
- (void)dispatchBlock:(id)a3;
- (void)dispatchBlockSync:(id)a3;
- (void)setBlocks:(id)a3;
- (void)setName:(id)a3;
- (void)setRunLoopSource:(__CFRunLoopSource *)a3;
- (void)setStartCompletionBlock:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setUnderlyingRunLoop:(__CFRunLoop *)a3;
- (void)setUnderlyingThread:(id)a3;
- (void)startWithCompletionHandler:(id)a3;
- (void)stop;
@end

@implementation VSSingleThreadDispatchQueue

- (VSSingleThreadDispatchQueue)initWithName:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VSSingleThreadDispatchQueue;
  v5 = [(VSSingleThreadDispatchQueue *)&v11 init];
  if (v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    blocks = v5->_blocks;
    v5->_blocks = v6;

    uint64_t v8 = [v4 copy];
    name = v5->_name;
    v5->_name = (NSString *)v8;
  }
  return v5;
}

+ (id)currentQueue
{
  v2 = [MEMORY[0x1E4F29060] currentThread];
  v3 = [v2 threadDictionary];
  id v4 = [v3 objectForKey:@"VSSingleThreadDispatchQueueThreadKey"];

  return v4;
}

- (void)startWithCompletionHandler:(id)a3
{
  [(VSSingleThreadDispatchQueue *)self setStartCompletionBlock:a3];
  id v9 = (id)[objc_alloc(MEMORY[0x1E4F29060]) initWithTarget:self selector:sel__threadMain object:0];
  -[VSSingleThreadDispatchQueue setUnderlyingThread:](self, "setUnderlyingThread:");
  id v4 = [(VSSingleThreadDispatchQueue *)self name];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v8 = v6;

  [v9 setName:v8];
  [v9 start];
}

- (void)dispatchBlock:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  v5 = [(VSSingleThreadDispatchQueue *)v4 blocks];
  id v6 = (void *)[v7 copy];
  [v5 addObject:v6];

  CFRunLoopSourceSignal([(VSSingleThreadDispatchQueue *)v4 runLoopSource]);
  CFRunLoopWakeUp([(VSSingleThreadDispatchQueue *)v4 underlyingRunLoop]);
  objc_sync_exit(v4);
}

- (void)dispatchBlockSync:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(VSSemaphore);
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __49__VSSingleThreadDispatchQueue_dispatchBlockSync___block_invoke;
  objc_super v11 = &unk_1E6BD2C88;
  v12 = v5;
  id v13 = v4;
  id v6 = v5;
  id v7 = v4;
  [(VSSingleThreadDispatchQueue *)self dispatchBlock:&v8];
  [(VSSemaphore *)v6 wait];
}

uint64_t __49__VSSingleThreadDispatchQueue_dispatchBlockSync___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);

  return [v2 signal];
}

- (void)stop
{
  obj = self;
  objc_sync_enter(obj);
  if (!obj->_state) {
    CFRunLoopStop([(VSSingleThreadDispatchQueue *)obj underlyingRunLoop]);
  }
  objc_sync_exit(obj);
}

- (int64_t)state
{
  v2 = self;
  objc_sync_enter(v2);
  int64_t state = v2->_state;
  objc_sync_exit(v2);

  return state;
}

- (void)_threadMain
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = VSDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf.version) = 136315138;
    *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)"-[VSSingleThreadDispatchQueue _threadMain]";
    _os_log_impl(&dword_1DA674000, v3, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&buf, 0xCu);
  }

  id v4 = (void *)MEMORY[0x1E0173AA0]();
  buf.version = 0;
  buf.info = self;
  memset(&buf.retain, 0, 40);
  buf.schedule = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))runLoopSourceScheduleCallback;
  buf.cancel = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))runLoopSourceCancellCallback;
  buf.perform = (void (__cdecl *)(void *))runLoopSourcePerformCallback;
  CFRunLoopRef Current = CFRunLoopGetCurrent();
  [(VSSingleThreadDispatchQueue *)self setUnderlyingRunLoop:Current];
  CFRetain(Current);
  id v6 = CFRunLoopSourceCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, &buf);
  [(VSSingleThreadDispatchQueue *)self setRunLoopSource:v6];
  CFStringRef v7 = (const __CFString *)*MEMORY[0x1E4F1D418];
  CFRunLoopAddSource(Current, v6, (CFRunLoopMode)*MEMORY[0x1E4F1D418]);
  uint64_t v8 = [MEMORY[0x1E4F29060] currentThread];
  uint64_t v9 = [v8 threadDictionary];
  [v9 setObject:self forKey:@"VSSingleThreadDispatchQueueThreadKey"];

  v10 = [(VSSingleThreadDispatchQueue *)self startCompletionBlock];

  if (v10)
  {
    objc_initWeak(&location, self);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __42__VSSingleThreadDispatchQueue__threadMain__block_invoke;
    v18[3] = &unk_1E6BD35C8;
    objc_copyWeak(&v19, &location);
    dispatch_async(MEMORY[0x1E4F14428], v18);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  do
  {
    v15 = (void *)MEMORY[0x1E0173AA0](v11, v12, v13, v14);
    CFRunLoopRunResult v16 = CFRunLoopRunInMode(v7, 1.0e10, 1u);
  }
  while ((v16 - 3) < 0xFFFFFFFE);
  CFRelease(Current);
  CFRunLoopSourceInvalidate(v6);
  [(VSSingleThreadDispatchQueue *)self setRunLoopSource:0];
  [(VSSingleThreadDispatchQueue *)self setUnderlyingRunLoop:0];
  v17 = self;
  objc_sync_enter(v17);
  [(VSSingleThreadDispatchQueue *)v17 setState:1];
  objc_sync_exit(v17);
}

void __42__VSSingleThreadDispatchQueue__threadMain__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained startCompletionBlock];
    ((void (**)(void, id))v2)[2](v2, v3);

    [v3 setStartCompletionBlock:0];
    id WeakRetained = v3;
  }
}

- (void)setState:(int64_t)a3
{
  self->_int64_t state = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSThread)underlyingThread
{
  return self->_underlyingThread;
}

- (void)setUnderlyingThread:(id)a3
{
}

- (__CFRunLoop)underlyingRunLoop
{
  return self->_underlyingRunLoop;
}

- (void)setUnderlyingRunLoop:(__CFRunLoop *)a3
{
  self->_underlyingRunLoop = a3;
}

- (__CFRunLoopSource)runLoopSource
{
  return self->_runLoopSource;
}

- (void)setRunLoopSource:(__CFRunLoopSource *)a3
{
  self->_runLoopSource = a3;
}

- (NSMutableArray)blocks
{
  return self->_blocks;
}

- (void)setBlocks:(id)a3
{
}

- (id)startCompletionBlock
{
  return self->_startCompletionBlock;
}

- (void)setStartCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_startCompletionBlock, 0);
  objc_storeStrong((id *)&self->_blocks, 0);
  objc_storeStrong((id *)&self->_underlyingThread, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end