@interface AXWebThreadPreparer
+ (id)sharedPreparer;
- (AXWebThreadPreparer)init;
- (BOOL)preparedAnswer;
- (BOOL)preparedThisRunLoop;
- (void)setPreparedAnswer:(BOOL)a3;
- (void)setPreparedThisRunLoop:(BOOL)a3;
@end

@implementation AXWebThreadPreparer

+ (id)sharedPreparer
{
  if (sharedPreparer_onceToken != -1) {
    dispatch_once(&sharedPreparer_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)WebThreadPreparer;

  return v2;
}

uint64_t __37__AXWebThreadPreparer_sharedPreparer__block_invoke()
{
  WebThreadPreparer = objc_alloc_init(AXWebThreadPreparer);

  return MEMORY[0x270F9A758]();
}

- (AXWebThreadPreparer)init
{
  v7.receiver = self;
  v7.super_class = (Class)AXWebThreadPreparer;
  v2 = [(AXWebThreadPreparer *)&v7 init];
  if (v2)
  {
    v3 = CFRunLoopObserverCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0xA0uLL, 1u, 2500001, (CFRunLoopObserverCallBack)_runLoopExitObserver, 0);
    Current = CFRunLoopGetCurrent();
    CFRunLoopAddObserver(Current, v3, (CFRunLoopMode)*MEMORY[0x263EFFE78]);
    CFRelease(v3);
    v5 = v2;
  }

  return v2;
}

- (BOOL)preparedThisRunLoop
{
  return self->_preparedThisRunLoop;
}

- (void)setPreparedThisRunLoop:(BOOL)a3
{
  self->_preparedThisRunLoop = a3;
}

- (BOOL)preparedAnswer
{
  return self->_preparedAnswer;
}

- (void)setPreparedAnswer:(BOOL)a3
{
  self->_preparedAnswer = a3;
}

@end